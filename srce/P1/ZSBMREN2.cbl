      *****************************************************************
      **  MEMBER :  ZSBMREN2                                         **
      **  REMARKS:  THIS PROGRAM WILL UPDATE THE PLAN ID AND SUBTABLE**
      **            CODES OF THE PENDING CVGS CREATED DUE TO RON     **
      **            ACTIVITY AND WILL BLANK OUT THE RENEWAL FIELDS   **
      **                                                             **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
RP2009** 25JUN07   CTS    INITIAL VERSION                            **
AIF059** 04JUL07   CTS    CHANGED THE PLAN ID FOR UL-HOSP-DIS        **
AIF059**                  (03) TO (07)UL-HOSP-DIS (70300)            **
      *****************************************************************

       IDENTIFICATION DIVISION.

       PROGRAM-ID.    ZSBMREN2.

       COPY XCWWCRHT.
      /
       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
      /
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMREN2'.

       COPY SQLCA.

       01  WS-MISC-AREAS.
           05  WS-POLICIES-RECS-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'TOTAL POLICIES PROCESSED                '.
               10  WS-POLICIES-PRCES-CTR    PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
           05 WS-43200-CNT                  PIC 9(7)  VALUE ZERO.
           05 WS-43400-CNT                  PIC 9(7)  VALUE ZERO.
           05 WS-43800-CNT                  PIC 9(7)  VALUE ZERO.
           05 WS-44000-CNT                  PIC 9(7)  VALUE ZERO.
           05 WS-44200-CNT                  PIC 9(7)  VALUE ZERO.
           05 WS-45000-CNT                  PIC 9(7)  VALUE ZERO.

       01  WS-CONTROL-CARD.
           05  WS-CTL-EDIT-ONLY             PIC X(10).
               88  WS-CTL-EDIT-TEXT         VALUE 'EDIT ONLY='.
           05  WS-CTL-EDIT-SW               PIC X(01).
               88 EDIT-ONLY                 VALUE 'Y'.
               88 EDIT-ONLY-NO              VALUE 'N'.

       01  WS-TYPE-OF-RUN-LINE.
           05  FILLER                       PIC X(10)
                                            VALUE 'RUN TYPE: '.
           05  WS-TYPE-OF-RUN-TXT           PIC X(11).

       01  WS-STAT-LINE.
           05  FILLER                       PIC X(10)
                                            VALUE 'PLAN ID: '.
           05  WS-STAT-PLAN-ID              PIC X(6).
           05  FILLER                       PIC X(1).
           05  WS-STAT-LINE-CNT             PIC ZZZZZZ9.

       01  WS-CVG-PRINT-LINE.
           05  FILLER                       PIC X(08)
                                            VALUE 'POLICY: '.
           05  WS-CVGP-POL-ID               PIC X(10).
           05  FILLER                       PIC X(10)
                                            VALUE ' CVG NUM: '.
           05  WS-CVGP-CVG-NUM              PIC X(02).
           05  FILLER                       PIC X(10)
                                            VALUE ' PLAN ID: '.
           05  WS-CVGP-PLAN-ID              PIC X(06).
           05  FILLER                       PIC X(11)
                                            VALUE ' NEW PLAN: '.
           05  WS-CVGP-NEW-PLAN-ID           PIC X(06).
           05  FILLER                       PIC X(12)
                                            VALUE ' NEW STBL1: '.
           05  WS-CVGP-NEW-STBL-1-CD         PIC X(2).
           05  FILLER                       PIC X(12)
                                            VALUE ' NEW STBL2: '.
           05  WS-CVGP-NEW-STBL-2-CD         PIC X(3).
           05  FILLER                       PIC X(12)
                                            VALUE ' NEW STBL4: '.
           05  WS-CVGP-NEW-STBL-4-CD         PIC X(2).

       01  WS-MISC-WORK-AREA.
           05  WS-CVG                       PIC 9(03) VALUE ZERO.
           05  WS-RPRCD-DT                  PIC X(10)
                                            VALUE '2007-10-01'.
           05  WS-HOLD-PLAN                 PIC X(06).

      /
       COPY CCWL0010.
       COPY CCWL0950.
       COPY XCWL0035.

      /
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFRCVG.
       COPY CCFWCVG.
       COPY CCWWCVGS.
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWBCF.
       COPY XCSRBCF.
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY XCWTFCMD.
      /
       COPY XCWL0040.
      /
       COPY XCWL1670.
       COPY XCWL1660.
       COPY XCWL1680.
      /
       COPY XCWLDTLK.
      /
       COPY XCWWWKDT.
      /
       COPY CCWWCCC.
      /
       COPY CCWLPGA.
      /
       COPY CCWWINDX.
      /
       PROCEDURE DIVISION.

      *---------------------
       0000-MAIN-LINE-START.
      *---------------------

           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.
           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE 'ZSBMREN2'         TO WGLOB-USER-ID.
           MOVE 'INGENIUM'         TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME TO L0040-COMPANY-NAME.
           MOVE ZERO               TO L0040-ERROR-CNT.
           MOVE SPACES             TO L0040-PROGRAM-DESC.
           MOVE SPACES             TO L0040-HDG-LINE-3.

           PERFORM  BCF-1000-READ
               THRU BCF-1000-READ-X.

           IF  WBCF-SEQ-IO-OK
               MOVE RBCF-SEQ-REC-INFO    TO WS-CONTROL-CARD
           END-IF.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           MOVE WS-CONTROL-CARD     TO WS-TYPE-OF-RUN-TXT.
           MOVE WS-TYPE-OF-RUN-LINE TO L0040-INPUT-LINE.

           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           PERFORM  1000-PROCESS-POLS
               THRU 1000-PROCESS-POLS-X.

           PERFORM  8000-PRINT-STATS
               THRU 8000-PRINT-STATS-X.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAIN-LINE-START-X.
           EXIT.
      /
      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *------------------
       1000-PROCESS-POLS.
      *------------------

           MOVE LOW-VALUES        TO WPOL-KEY.
           MOVE HIGH-VALUES       TO WPOL-ENDBR-KEY.
           PERFORM  POL-1000-TBL-BROWSE
               THRU POL-1000-TBL-BROWSE-X.

           PERFORM  2000-READ-REWRITE-LOOP
               THRU 2000-READ-REWRITE-LOOP-X
              UNTIL WPOL-IO-EOF
                 OR NOT WPOL-IO-OK.

           PERFORM  POL-3000-TBL-END-BROWSE
               THRU POL-3000-TBL-END-BROWSE-X.

           DISPLAY '*** END OF POLICIES - JOB COMPLETED NORMALLY***'.

       1000-PROCESS-POLS-X.
           EXIT.
      /
      *-----------------------
       2000-READ-REWRITE-LOOP.
      *-----------------------

           PERFORM  POL-2000-TBL-READ-NEXT
               THRU POL-2000-TBL-READ-NEXT-X.

           IF  NOT WPOL-IO-OK
               GO TO 2000-READ-REWRITE-LOOP-X
           END-IF.

           ADD 1                        TO WS-POLICIES-PRCES-CTR.

           PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
               THRU CVGS-1000-LOAD-CVGS-ARRAY-X.

           PERFORM  3000-REWRITE-COVERAGE
               THRU 3000-REWRITE-COVERAGE-X
               VARYING WS-CVG FROM 1 BY 1
               UNTIL WS-CVG > RPOL-POL-CVG-REC-CTR-N.


       2000-READ-REWRITE-LOOP-X.
           EXIT.
      /
      *----------------------
       3000-REWRITE-COVERAGE.
      *----------------------

      *
      * OVERRIDE SHOULD BE DONE ONLY FOR PENDING COVERAGES
      *
           IF WCVGS-CVG-STAT-PENDING (WS-CVG)
              CONTINUE
           ELSE
              GO TO 3000-REWRITE-COVERAGE-X
           END-IF.

      * OVERRIDE SHOULD BE DONE ONLY FOR COVERAGES HAVING AN ISSUE DATE
      * EQUAL TO OR GREATER THAN OCT 1,2007
      *
           IF WCVGS-CVG-ISS-EFF-DT (WS-CVG) < WS-RPRCD-DT
              GO TO 3000-REWRITE-COVERAGE-X
           END-IF.

      * CHECK IF THE CVG_CONN_REASN_CD IS N(RENEWAL)

           IF WCVGS-CVG-CONN-REASN-RENW (WS-CVG)
              CONTINUE
           ELSE
              GO TO 3000-REWRITE-COVERAGE-X
           END-IF.
      *
      * OVERRIDE PLAN ID AND THE SUBTABLE CODES.BLANK OUT THE RENEWAL FIELDS
      * INDICATING THAT THE 07 PLAN WILL RENEW TO ITSELF ON THE NEXT RENEWAL
      * DATE
      *
           MOVE WCVGS-PLAN-ID (WS-CVG) TO WS-HOLD-PLAN.

           EVALUATE TRUE


           WHEN WCVGS-PLAN-ID (WS-CVG) = '43200'
            AND WCVGS-CVG-STBL-2-CD (WS-CVG) = '1'
                MOVE '70100' TO WCVGS-PLAN-ID   (WS-CVG)
                MOVE '1'     TO WCVGS-CVG-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-STBL-4-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-4-CD (WS-CVG)
                ADD 1 TO WS-43200-CNT

           WHEN WCVGS-PLAN-ID (WS-CVG) = '43200'
            AND WCVGS-CVG-STBL-2-CD (WS-CVG) = '2'
                MOVE '70100' TO WCVGS-PLAN-ID   (WS-CVG)
                MOVE '2'     TO WCVGS-CVG-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-STBL-4-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-4-CD (WS-CVG)

                ADD 1 TO WS-43200-CNT

           WHEN WCVGS-PLAN-ID (WS-CVG) = '43200'
            AND WCVGS-CVG-STBL-2-CD (WS-CVG) = '3'
                MOVE '70100' TO WCVGS-PLAN-ID   (WS-CVG)
                MOVE '2'     TO WCVGS-CVG-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-STBL-4-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-4-CD (WS-CVG)
                ADD 1 TO WS-43200-CNT

           WHEN WCVGS-PLAN-ID (WS-CVG) = '43200'
            AND WCVGS-CVG-STBL-2-CD (WS-CVG) = '4'
                MOVE '70100' TO WCVGS-PLAN-ID   (WS-CVG)
                MOVE '2'     TO WCVGS-CVG-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-STBL-4-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-4-CD (WS-CVG)
                ADD 1 TO WS-43200-CNT

           WHEN WCVGS-PLAN-ID (WS-CVG) = '43400'
            AND WCVGS-CVG-STBL-2-CD (WS-CVG) = '1'
AIF059*         MOVE '70100' TO WCVGS-PLAN-ID   (WS-CVG)
AIF059          MOVE '70300' TO WCVGS-PLAN-ID   (WS-CVG)
                MOVE '1'     TO WCVGS-CVG-STBL-2-CD (WS-CVG)
                MOVE '2'     TO WCVGS-CVG-STBL-4-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-4-CD (WS-CVG)
                ADD 1 TO WS-43400-CNT

           WHEN WCVGS-PLAN-ID (WS-CVG) = '43400'
            AND WCVGS-CVG-STBL-2-CD (WS-CVG) = '2'
                MOVE '70300' TO WCVGS-PLAN-ID   (WS-CVG)
                MOVE '2'     TO WCVGS-CVG-STBL-2-CD (WS-CVG)
                MOVE '2'     TO WCVGS-CVG-STBL-4-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-4-CD (WS-CVG)
                ADD 1 TO WS-43400-CNT

           WHEN WCVGS-PLAN-ID (WS-CVG) = '43400'
            AND WCVGS-CVG-STBL-2-CD (WS-CVG) = '3'
                MOVE '70300' TO WCVGS-PLAN-ID   (WS-CVG)
                MOVE '2'     TO WCVGS-CVG-STBL-2-CD (WS-CVG)
                MOVE '2'     TO WCVGS-CVG-STBL-4-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-4-CD (WS-CVG)
                ADD 1 TO WS-43400-CNT

           WHEN WCVGS-PLAN-ID (WS-CVG) = '43400'
            AND WCVGS-CVG-STBL-2-CD (WS-CVG) = '4'
                MOVE '70300' TO WCVGS-PLAN-ID   (WS-CVG)
                MOVE '2'     TO WCVGS-CVG-STBL-2-CD (WS-CVG)
                MOVE '2'     TO WCVGS-CVG-STBL-4-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-4-CD (WS-CVG)
                ADD 1 TO WS-43400-CNT


           WHEN WCVGS-PLAN-ID (WS-CVG) = '43800'
                MOVE '70700' TO WCVGS-PLAN-ID   (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-STBL-4-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-4-CD (WS-CVG)
                ADD 1 TO WS-43800-CNT

           WHEN WCVGS-PLAN-ID (WS-CVG) = '44000'
                MOVE '70900' TO WCVGS-PLAN-ID   (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-STBL-4-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-4-CD (WS-CVG)
                ADD 1 TO WS-44000-CNT

           WHEN WCVGS-PLAN-ID (WS-CVG) = '44200'
            AND WCVGS-CVG-STBL-2-CD (WS-CVG) = '1'
                MOVE '71100' TO WCVGS-PLAN-ID   (WS-CVG)
                MOVE '1'     TO WCVGS-CVG-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-STBL-4-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-4-CD (WS-CVG)
                ADD 1 TO WS-44200-CNT

           WHEN WCVGS-PLAN-ID (WS-CVG) = '44200'
            AND WCVGS-CVG-STBL-2-CD (WS-CVG) = '2'
                MOVE '71100' TO WCVGS-PLAN-ID   (WS-CVG)
                MOVE '2'     TO WCVGS-CVG-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-STBL-4-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-4-CD (WS-CVG)
                ADD 1 TO WS-44200-CNT

           WHEN WCVGS-PLAN-ID (WS-CVG) = '44200'
            AND WCVGS-CVG-STBL-2-CD (WS-CVG) = '3'
                MOVE '71100' TO WCVGS-PLAN-ID   (WS-CVG)
                MOVE '2'     TO WCVGS-CVG-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-STBL-4-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-4-CD (WS-CVG)
                ADD 1 TO WS-44200-CNT

           WHEN WCVGS-PLAN-ID (WS-CVG) = '44200'
            AND WCVGS-CVG-STBL-2-CD (WS-CVG) = '4'
                MOVE '71100' TO WCVGS-PLAN-ID   (WS-CVG)
                MOVE '2'     TO WCVGS-CVG-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-STBL-4-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-4-CD (WS-CVG)
                ADD 1 TO WS-44200-CNT


           WHEN WCVGS-PLAN-ID (WS-CVG) = '45000'
                MOVE '71900' TO WCVGS-PLAN-ID   (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-STBL-4-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG)
                MOVE SPACES  TO WCVGS-CVG-RENW-STBL-4-CD (WS-CVG)
                ADD 1 TO WS-45000-CNT

           WHEN OTHER
                GO TO 3000-REWRITE-COVERAGE-X

           END-EVALUATE.



      *
      * BUILD PRINT LINE
      *
           MOVE SPACES                       TO L0040-INPUT-LINE.

           MOVE RPOL-POL-ID                  TO WS-CVGP-POL-ID.
           MOVE WCVGS-CVG-SEQ-NUM (WS-CVG)   TO WS-CVGP-CVG-NUM.
           MOVE WS-HOLD-PLAN                 TO WS-CVGP-PLAN-ID.
           MOVE WCVGS-PLAN-ID (WS-CVG)       TO WS-CVGP-NEW-PLAN-ID.
           MOVE WCVGS-CVG-STBL-1-CD (WS-CVG) TO WS-CVGP-NEW-STBL-1-CD.

           MOVE WCVGS-CVG-STBL-2-CD (WS-CVG) TO WS-CVGP-NEW-STBL-2-CD.

           MOVE WCVGS-CVG-STBL-4-CD (WS-CVG) TO WS-CVGP-NEW-STBL-4-CD.


           MOVE WS-CVG-PRINT-LINE            TO L0040-INPUT-LINE.

           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE WPOL-POL-ID TO WCVG-POL-ID.
           MOVE WS-CVG      TO WCVG-CVG-NUM-N.

           PERFORM  CVG-1000-READ-FOR-UPDATE
               THRU CVG-1000-READ-FOR-UPDATE-X.

           MOVE WCVGS-CVG-INFO (WS-CVG)      TO RCVG-CVG-INFO.

           IF EDIT-ONLY-NO
              PERFORM  CVG-2000-REWRITE
                  THRU CVG-2000-REWRITE-X
           ELSE
              PERFORM  CVG-3000-UNLOCK
                  THRU CVG-3000-UNLOCK-X
           END-IF.

       3000-REWRITE-COVERAGE-X.
           EXIT.
      /
      *----------------------
       8000-PRINT-STATS.
      *----------------------

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.


           MOVE SPACES         TO L0040-INPUT-LINE.
           MOVE '43200'        TO WS-STAT-PLAN-ID
           MOVE WS-43200-CNT   TO WS-STAT-LINE-CNT.
           MOVE WS-STAT-LINE   TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES         TO L0040-INPUT-LINE.
           MOVE '43400'        TO WS-STAT-PLAN-ID
           MOVE WS-43400-CNT   TO WS-STAT-LINE-CNT.
           MOVE WS-STAT-LINE   TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES         TO L0040-INPUT-LINE.
           MOVE '43800'        TO WS-STAT-PLAN-ID
           MOVE WS-43800-CNT   TO WS-STAT-LINE-CNT.
           MOVE WS-STAT-LINE   TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES         TO L0040-INPUT-LINE.
           MOVE '44000'        TO WS-STAT-PLAN-ID
           MOVE WS-44000-CNT   TO WS-STAT-LINE-CNT.
           MOVE WS-STAT-LINE   TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES         TO L0040-INPUT-LINE.
           MOVE '44200'        TO WS-STAT-PLAN-ID
           MOVE WS-44200-CNT   TO WS-STAT-LINE-CNT.
           MOVE WS-STAT-LINE   TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES         TO L0040-INPUT-LINE.
           MOVE '45000'        TO WS-STAT-PLAN-ID
           MOVE WS-45000-CNT   TO WS-STAT-LINE-CNT.
           MOVE WS-STAT-LINE   TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.


           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-POLICIES-RECS-LINE   TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE '*** END OF REPORT ***' TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.


       8000-PRINT-STATS-X.
           EXIT.
      /
      *----------------------
       9999-CLOSE-FILES.
      *----------------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
       COPY CCPL0010.
       COPY CCPS0010.
       COPY CCPL0950.
       COPY CCPS0950.
       COPY CCPPCCC.
      /
       COPY CCPTPOL.
       COPY CCPUCVG.
       COPY CCPNCVG.
       COPY NCPPCVGS.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
       COPY XCPL0035.
       COPY XCPL0040.
      /
       COPY XCPL0260.
      /
       COPY XCPL1660.
       COPY XCPL1680.
      /
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM ZSBMREN2                     **
      *****************************************************************
