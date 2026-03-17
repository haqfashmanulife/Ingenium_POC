      *****************************************************************
      **  MEMBER :  ZSBMCVGS                                         **
      **  REMARKS:  THIS PROGRAM WILL UPDATE THE CVG-PREM-CHNG-DT    **
      **            BY ADDING CVG-STBL-1-CD OF THE RIDER TO THE      **
      **            CVG-ISS-EFF-DT                                   **
      **                                                             **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  16MAY02  DPK    RIDER RENEWALS                             **
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
      *****************************************************************

       IDENTIFICATION DIVISION.

       PROGRAM-ID.    ZSBMCVGS.

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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCVGS'.

       COPY SQLCA.

       01  WS-MISC-AREAS.
           05  WS-POL-ERROR-IND             PIC X(01).
               88  WS-POL-ERROR-NO              VALUE 'N'.
               88  WS-POL-ERROR                 VALUE 'Y'.
           05  WS-POLICIES-RECS-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'TOTAL POLICIES PROCESSED                '.
               10  WS-POLICIES-PRCES-CTR    PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
      
       01  WS-CONTROL-CARD.
           05  WS-CTL-EDIT-ONLY             PIC X(10).
               88  WS-CTL-EDIT-TEXT         VALUE 'EDIT ONLY='.
           05  WS-CTL-EDIT-SW               PIC X(01).
               88 EDIT-ONLY                 VALUE 'Y'. 
               88 EDIT-ONLY-NO              VALUE 'N'.
                
       01  WS-CVG-PRINT-LINE.
           05  FILLER                       PIC X(08) 
                                            VALUE 'POLICY: '.
           05  WS-POL-ID                    PIC X(10).
           05  FILLER                       PIC X(10)
                                            VALUE ' CVG NUM: '.
           05  WS-CVG-NUM                   PIC X(02).
           05  FILLER                       PIC X(10)
                                            VALUE ' PLAN ID: '.
           05  WS-PLAN-ID                   PIC X(06).
           05  FILLER                       PIC X(09) 
                                            VALUE ' STATUS: '.
           05  WS-CVG-CSTAT-CD              PIC X(03).
           05  FILLER                       PIC X(13)
                                            VALUE ' ISSUE DATE: '.
           05  WS-CVG-ISS-EFF-DT            PIC X(10).
           05  FILLER                       PIC X(11)
                                            VALUE ' DURATION: '.
           05  WS-DURATION-CD               PIC X(02).
           05  FILLER                       PIC X(17)
                                            VALUE ' PREM CHNG DATE: '.
           05  WS-CVG-PREM-CHNG-DT          PIC X(10).
      
       01  WS-MISC-WORK-AREA.
           05  WS-CVG                       PIC 9(02) VALUE ZERO.
           05  WS-CVG-STBL-1-CD             PIC X(02).
           05  WS-CVG-STBL-1-CD-N           REDEFINES 
               WS-CVG-STBL-1-CD             PIC 9(02).
            
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

           MOVE 'ZSBMCVGS'         TO WGLOB-USER-ID.
           MOVE 'INGENIUM'         TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME TO L0040-COMPANY-NAME.
           MOVE ZERO               TO L0040-ERROR-CNT.
           MOVE SPACES             TO L0040-PROGRAM-DESC.
           MOVE SPACES             TO L0040-HDG-LINE-3.
            
           PERFORM BCF-1000-READ
              THRU BCF-1000-READ-X.
           IF  WBCF-SEQ-IO-OK
               MOVE RBCF-SEQ-REC-INFO    TO WS-CONTROL-CARD
           END-IF.
            
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           PERFORM  1000-PROCESS-POLS
               THRU 1000-PROCESS-POLS-X.

           PERFORM  8000-PRINT-STATS
               THRU 8000-PRINT-STATS-X.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

P02229     PERFORM  0035-1000-COMMIT
P02229         THRU 0035-1000-COMMIT-X.

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

       1000-PROCESS-POLS-X.
           EXIT.
      /
      *---------------------
       2000-READ-REWRITE-LOOP.
      *---------------------

           PERFORM  POL-2000-TBL-READ-NEXT
               THRU POL-2000-TBL-READ-NEXT-X.
           
           IF  NOT WPOL-IO-OK
               DISPLAY '*** END OF POLICIES - JOB COMPLETED NORMALLY***'
               GO TO 2000-READ-REWRITE-LOOP-X
           END-IF.
           
           IF  WPOL-IO-EOF           
               GO TO 2000-READ-REWRITE-LOOP-X
           END-IF.

           ADD 1                        TO WS-POLICIES-PRCES-CTR.
           SET WS-POL-ERROR-NO          TO TRUE.
            
           PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
               THRU CVGS-1000-LOAD-CVGS-ARRAY-X.
 
           PERFORM  3000-REWRITE-COVERAGE
               THRU 3000-REWRITE-COVERAGE-X
               VARYING WS-CVG FROM 1 BY 1
               UNTIL WS-CVG > RPOL-POL-CVG-REC-CTR-N.
 
           PERFORM 0035-1000-COMMIT 
              THRU 0035-1000-COMMIT-X.  
               
       
       2000-READ-REWRITE-LOOP-X.
           EXIT.
      /
      *----------------------
       3000-REWRITE-COVERAGE.
      *----------------------

           IF  WCVGS-CVG-PREM-CHNG-DT (WS-CVG) = WWKDT-ZERO-DT
           AND WCVGS-CVG-STBL-1-CD (WS-CVG) NOT = SPACES
           AND WCVGS-CVG-ISS-EFF-DT (WS-CVG) NOT = WWKDT-ZERO-DT
               MOVE ZERO                          TO WS-CVG-STBL-1-CD-N
               MOVE WCVGS-CVG-STBL-1-CD (WS-CVG)  TO WS-CVG-STBL-1-CD
               MOVE WS-CVG-STBL-1-CD-N        TO L1680-NUMBER-OF-YEARS
               MOVE ZERO                      TO L1680-NUMBER-OF-MONTHS
               MOVE ZERO                      TO L1680-NUMBER-OF-DAYS
               MOVE WCVGS-CVG-ISS-EFF-DT (WS-CVG) TO L1680-INTERNAL-1
               PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
                   THRU 1680-3000-ADD-Y-M-D-TO-DATE-X
               MOVE L1680-INTERNAL-2 TO WCVGS-CVG-PREM-CHNG-DT (WS-CVG)
               MOVE RPOL-POL-ID              TO WS-POL-ID
               MOVE WS-CVG                   TO WS-CVG-NUM
               MOVE WCVGS-PLAN-ID (WS-CVG)   TO WS-PLAN-ID
               MOVE WCVGS-CVG-CSTAT-CD (WS-CVG) TO WS-CVG-CSTAT-CD
               MOVE WCVGS-CVG-ISS-EFF-DT (WS-CVG) TO WS-CVG-ISS-EFF-DT
               MOVE WCVGS-CVG-STBL-1-CD (WS-CVG) TO WS-DURATION-CD
               MOVE WCVGS-CVG-PREM-CHNG-DT (WS-CVG)
                                        TO WS-CVG-PREM-CHNG-DT
               MOVE SPACES                   TO L0040-INPUT-LINE
               MOVE WS-CVG-PRINT-LINE        TO L0040-INPUT-LINE
               PERFORM 0040-3000-WRITE-OTHER
                  THRU 0040-3000-WRITE-OTHER-X
           END-IF.
            
           MOVE WPOL-POL-ID              TO WCVG-POL-ID.
           MOVE WS-CVG                   TO WCVG-CVG-NUM-N.

           PERFORM  CVG-1000-READ-FOR-UPDATE
               THRU CVG-1000-READ-FOR-UPDATE-X.

           MOVE WCVGS-CVG-INFO (WS-CVG)  TO RCVG-CVG-INFO.

           PERFORM CVG-2000-REWRITE
              THRU CVG-2000-REWRITE-X.

       3000-REWRITE-COVERAGE-X.
           EXIT.
      /
       8000-PRINT-STATS.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
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
       9999-CLOSE-FILES.

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
      **                 END OF PROGRAM ZSBMCVGS                     **
      *****************************************************************
