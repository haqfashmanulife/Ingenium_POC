      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBMWFHI.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSBMWFHI                                          **
      **  REMARKS: WORK FLOW-HITACHI EXTRACT PROCESSING              **
      **                                                             **
      **                                                             **
      **  DOMAIN :  AC                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  12OCT07  CTS    WORK FLOW HITACHI EXTRACT                  **
MP171F**  10JAN12  CTS    CONCURRENCY AND LOGICAL LOCKING            **
M171C5**  03MAY12  CTS    FIX FOR REC INFO LENGTH CHANGE             **
R12024**  25MAY16  CTS    CHANGES FOR TCLIU RECORD LAYOUT INCREASE   **
Q91525**  12JUL17  CTS    CHANGES FOR TCLIU RECORD LENGTH            **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       CONFIGURATION SECTION.
      /
       INPUT-OUTPUT SECTION.

      ***************
       DATA DIVISION.
      ***************

      *------------------------
       WORKING-STORAGE SECTION.
      *------------------------

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMWFHI'.

       COPY SQLCA.

       01  WS-PGM-WORK-AREA.

           05  WS-MISC-WORK-AREAS.
               10  WS-STCKR-ID              PIC X(11).
               10  WS-STCKR-ID2             PIC X(22).
               10  K                        PIC 9(02).
               10  WS-ERROR-DUP-STCKR-IND        PIC X(01).
                   88 WS-ERROR-DUP-STCKR-YES     VALUE 'Y'.
                   88 WS-ERROR-DUP-STCKR-NO      VALUE 'N'.
               10  WS-POL-CSTAT-CD          PIC X(04).

           05  WS-COUNTERS.
               10  WS-REC-CTR               PIC 9(10).
               10  WS-PEND-REC              PIC 9(10).
               10  WS-OUTPUT-REC            PIC 9(10).
               10  WS-ERR-REC               PIC 9(10).

MP171F*           05  WS-HOLD-CLIU-REC-INFO             PIC X(110).
M171C5*MP171F     05  WS-HOLD-CLIU-REC-INFO             PIC X(136).
R12024*M171C5     05  WS-HOLD-CLIU-REC-INFO        PIC X(191).
Q91525*R12024     05  WS-HOLD-CLIU-REC-INFO        PIC X(309).
Q91525     05  WS-HOLD-CLIU-REC-INFO        PIC X(310).

       01  WS-ERROR-CTR-LINE.
           05  WS-ERROR-CTR-LABEL           PIC X(40).
           05  FILLER                       PIC X(01).
           05  WS-ERROR-CTR-NUM             PIC 9(10).
           05  FILLER                       PIC X(82).
      /
      *****************************************************************
      *     COMMON COPYBOOKS                                          *
      *****************************************************************
      /
       COPY XCWL0035.
      /
       COPY CCWWCCC.
      /
       COPY CCWWINDX.
      /
       COPY XCWTFCMD.
      /
       COPY XCWWWKDT.
      /
      *****************************************************************
      *     I/O COPYBOOKS                                             *
      *****************************************************************
      /
      * SEQUENTIAL IO
       COPY XCSWPRT  REPLACING ==:ID:==  BY OCF
                               ==':ID:'==  BY =='OCF'==.
       COPY XCSROCF.

       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.

       COPY XCSWSEQ  REPLACING ==:ID:==  BY WFHI
                               ==':ID:'==  BY =='WFHI'==.
       COPY XCSWSEQ  REPLACING ==:ID:==  BY WFHE
                               ==':ID:'==  BY =='WFHE'==.
       COPY ZCSRWFHI.
       COPY ZCSRWFHE.
      /
      * POLICY TABLES
      *
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFWAG.
       COPY CCFRAG.
      /
       COPY NCFWCLUS.

       COPY NCFWCLIU.
       COPY NCFRCLIU.
      /
      *****************************************************************
      *     CALLED MODULES                                            *
      *****************************************************************
       COPY CCWL0010.
      /
       COPY CCWL0950.
      /
       COPY XCWL0040.
      /
       COPY XCWL0290.
      /
       COPY XCWL1640.
       COPY XCWLDTLK.
      /
       COPY XCWL1660.
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
      ********************
       PROCEDURE DIVISION.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  1000-INITIALIZE
               THRU 1000-INITIALIZE-X.

      ***
      ***  READ FIRST RECORD FROM CLIU
      ***
           PERFORM  1500-GET-FIRST-CLIU-RECORD
               THRU 1500-GET-FIRST-CLIU-RECORD-X.

           PERFORM  9000-FINALIZE
               THRU 9000-FINALIZE-X.

           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAINLINE-X.
           EXIT.
      /
      *----------------
       1000-INITIALIZE.
      *----------------

           PERFORM  1100-OPEN-FILES
               THRU 1100-OPEN-FILES-X.

      *GET PROGRAM ID AND COMPANY CODE FROM BCF
           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

      *GET COMPANY NAME FROM PCOM
           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

      * GET THE SYSTEM ID ***
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.
           MOVE ZERO                        TO L0040-ERROR-CNT.

      *GET THE PROGRAM DESCRIPTION - CLAIM FSA UL EXTRACT
           MOVE 'WORK FLOW HITACHI EXTRACT'      TO L0040-PROGRAM-DESC.

      *GET THE TEXT "RUN MESSAGES"
           MOVE 'XS00000153'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-HDG-LINE-3.

      *WRITE THE DETAILS TO OCF FILE
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           MOVE ZEROES                      TO WS-REC-CTR.
           MOVE ZEROES                      TO WS-PEND-REC.
           MOVE ZEROES                      TO WS-OUTPUT-REC.
           MOVE ZEROES                      TO WS-ERR-REC.


       1000-INITIALIZE-X.
           EXIT.
      /
      *----------------
       1100-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.

           PERFORM  WFHI-3000-OPEN-OUTPUT
               THRU WFHI-3000-OPEN-OUTPUT-X.

           PERFORM  WFHE-3000-OPEN-OUTPUT
               THRU WFHE-3000-OPEN-OUTPUT-X.

       1100-OPEN-FILES-X.
           EXIT.
      /
      *----------------------------
       1500-GET-FIRST-CLIU-RECORD.
      *----------------------------

      * GET THE CLIU RECORDS.

           MOVE LOW-VALUES                  TO WCLIU-KEY.
           MOVE HIGH-VALUES                 TO WCLIU-ENDBR-KEY.

           PERFORM  CLIU-1000-BROWSE
               THRU CLIU-1000-BROWSE-X.

           IF  WCLIU-IO-OK
               PERFORM  CLIU-2000-READ-NEXT
                   THRU CLIU-2000-READ-NEXT-X
               IF  WCLIU-IO-OK
                   PERFORM  1600-CREATE-OUTPUT-REC
                       THRU 1600-CREATE-OUTPUT-REC
                               UNTIL WCLIU-IO-EOF
               END-IF
           END-IF.

       1500-GET-FIRST-CLIU-RECORD-X.
           EXIT.
      /
      *----------------------------
       1600-CREATE-OUTPUT-REC.
      *----------------------------

      *    COMPUTE WS-REC-CTR = WS-REC-CTR + 1.
      * SKIP ALL PENDING POLICIES

           INITIALIZE WPOL-KEY.

           MOVE RCLIU-POL-ID            TO WPOL-POL-ID.
           MOVE HIGH-VALUES             TO WPOL-ENDBR-KEY.

           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.

           IF WPOL-IO-OK
              MOVE RPOL-POL-CSTAT-CD    TO WS-POL-CSTAT-CD

              IF WS-POL-CSTAT-CD (1:1) = 'P'
                 ADD +1                     TO WS-PEND-REC
                 CONTINUE
              ELSE
                 MOVE RCLIU-REC-INFO        TO  WS-HOLD-CLIU-REC-INFO

      * CHECK FOR DUPLICATE STICKER IDS ON TCLIU

                 MOVE LOW-VALUES            TO WCLUS-KEY
                 MOVE RCLIU-STCKR-ID        TO WCLUS-STCKR-ID

                 MOVE HIGH-VALUES           TO WCLUS-ENDBR-KEY
                 MOVE RCLIU-STCKR-ID        TO WCLUS-ENDBR-STCKR-ID

                 PERFORM  CLUS-1000-BROWSE
                     THRU CLUS-1000-BROWSE-X

                 PERFORM  CLUS-2000-READ-NEXT
                     THRU CLUS-2000-READ-NEXT-X

                 PERFORM  1650-CHECK-DUPLICATE
                     THRU 1650-CHECK-DUPLICATE-X

                 MOVE WS-HOLD-CLIU-REC-INFO TO RCLIU-REC-INFO

                 IF WS-ERROR-DUP-STCKR-YES
                    PERFORM  1655-WRITE-ERROR
                        THRU 1655-WRITE-ERROR-X
                    ADD +1                     TO WS-ERR-REC
                 ELSE
                    PERFORM  1660-WRITE-OUTPUT
                        THRU 1660-WRITE-OUTPUT-X
                    ADD +1                     TO WS-OUTPUT-REC

                 END-IF
              END-IF
           END-IF.


           PERFORM  CLIU-2000-READ-NEXT
               THRU CLIU-2000-READ-NEXT-X.

       1600-CREATE-OUTPUT-REC-X.
           EXIT.
      /
      *--------------------
       1650-CHECK-DUPLICATE.
      *--------------------

           SET   WS-ERROR-DUP-STCKR-NO TO TRUE.

           PERFORM  CLUS-2000-READ-NEXT
               THRU CLUS-2000-READ-NEXT-X.

           IF WCLUS-IO-OK
               SET WS-ERROR-DUP-STCKR-YES TO TRUE
           END-IF.

           PERFORM  CLUS-3000-END-BROWSE
              THRU  CLUS-3000-END-BROWSE-X.

       1650-CHECK-DUPLICATE-X.
           EXIT.
      /
      *--------------------
       1655-WRITE-ERROR.
      *--------------------


           INITIALIZE RWFHE-SEQ-REC-INFO.

           MOVE RCLIU-STCKR-ID         TO RWFHE-STCKR-ID.
           MOVE RCLIU-POL-ID           TO RWFHE-POL-ID.

           MOVE RPOL-SERV-AGT-ID       TO RWFHE-AGT-ID.

           MOVE RPOL-SERV-AGT-ID       TO WAG-AGT-ID.
           MOVE HIGH-VALUES            TO WAG-ENDBR-KEY.

           PERFORM  AG-1000-READ
               THRU AG-1000-READ-X.

           IF WAG-IO-OK
              MOVE RAG-BR-ID        TO RWFHE-BR-ID
              MOVE RAG-SO-ID        TO RWFHE-SO-ID
           END-IF.

           PERFORM  WFHE-1000-WRITE
               THRU WFHE-1000-WRITE-X.

       1655-WRITE-ERROR-X.
           EXIT.
      /
      *--------------------
       1660-WRITE-OUTPUT.
      *--------------------


           INITIALIZE RWFHI-SEQ-REC-INFO.

           PERFORM
               VARYING I FROM 1 BY 1
               UNTIL I = 11
                  OR RCLIU-STCKR-ID(I:1) = SPACES
                 CONTINUE
           END-PERFORM.


           COMPUTE I = I + 11
           MOVE 00000000000            TO WS-STCKR-ID2(1:11).
           MOVE RCLIU-STCKR-ID(1:11)   TO WS-STCKR-ID2(12:I).

           PERFORM
               VARYING J FROM 22 BY -1
               UNTIL J = ZERO
                  OR WS-STCKR-ID2(J:1) NOT = SPACES
                 CONTINUE
           END-PERFORM.

           COMPUTE  K = J - 10.

           MOVE WS-STCKR-ID2(K:J)      TO WS-STCKR-ID.
           MOVE WS-STCKR-ID            TO RWFHI-STCKR-ID.
           MOVE RCLIU-POL-ID           TO RWFHI-POL-ID.

           MOVE RPOL-SERV-AGT-ID       TO RWFHI-AGT-ID.

           MOVE RPOL-SERV-AGT-ID       TO WAG-AGT-ID.
           MOVE HIGH-VALUES            TO WAG-ENDBR-KEY.

           PERFORM  AG-1000-READ
               THRU AG-1000-READ-X.

           IF WAG-IO-OK
              MOVE RAG-BR-ID          TO RWFHI-BR-ID
              MOVE RAG-SO-ID          TO RWFHI-SO-ID
           END-IF.

           PERFORM  WFHI-1000-WRITE
               THRU WFHI-1000-WRITE-X.

       1660-WRITE-OUTPUT-X.
           EXIT.
      /
      *--------------
       9000-FINALIZE.
      *--------------

           PERFORM  9100-PRINT-TOTALS
               THRU 9100-PRINT-TOTALS-X.

           PERFORM  CLIU-3000-END-BROWSE
               THRU CLIU-3000-END-BROWSE-X.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.


       9000-FINALIZE-X.
           EXIT.
      /
      *------------------
       9100-PRINT-TOTALS.
      *------------------

      *MSG : TOTAL PENDING RECORDS ---->
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.

           MOVE 'TOTAL PENDING RECORDS---->'
                                            TO WS-ERROR-CTR-LABEL.
           MOVE WS-PEND-REC                 TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

      *MSG : TOTAL RECORDS WRITTEN TO OUTPUT---->
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.

           MOVE 'TOTAL RECORDS WRITTEN TO OUTPUT'
                                            TO WS-ERROR-CTR-LABEL.
           MOVE WS-OUTPUT-REC               TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

      *MSG : TOTAL RECORDS WRITTEN TO ERROR FILE---->
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.

           MOVE 'TOTAL RECORDS WRITTEN TO ERROR FILE---->'
                                            TO WS-ERROR-CTR-LABEL.
           MOVE WS-ERR-REC                  TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       9100-PRINT-TOTALS-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  WFHI-4000-CLOSE
               THRU WFHI-4000-CLOSE-X.

           PERFORM  WFHE-4000-CLOSE
               THRU WFHE-4000-CLOSE-X.

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.


       9999-CLOSE-FILES-X.
           EXIT.
      /
      ****************************************************************
      * PROCESSING COPYBOOKS                                         *
      ****************************************************************

       COPY XCPL0035.

       COPY CCPL0010.
       COPY CCPS0010.
      /
       COPY CCPL0950.
       COPY CCPS0950.
      /
      /
       COPY CCPPCCC.
      /
       COPY XCPL0040.
      /
       COPY XCPL0260.
      /
       COPY XCPL0290.
       COPY XCPS0290.
      /
       COPY XCPL1640.
      /
       COPY XCPL1660.
      /
      *****************************************************************
      * FILE HANDLING ROUTINES
      *****************************************************************

       COPY XCSLFILE REPLACING ==:ID:==  BY WFHI
                               ==':PGM:'== BY =='ZSRQWFHI'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY WFHI.
       COPY XCSASEQ  REPLACING ==:ID:==  BY WFHI.

       COPY XCSLFILE REPLACING ==:ID:==  BY WFHE
                               ==':PGM:'== BY =='ZSRQWFHE'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY WFHE.
       COPY XCSASEQ  REPLACING ==:ID:==  BY WFHE.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
       COPY CCPNPOL.
       COPY CCPNAG.
      /
       COPY NCPBCLIU.
      /
       COPY NCPBCLUS.
      /
      *****************************************************************
      * ERROR HANDLING ROUTINES
      *****************************************************************

       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSBMWFHI                     **
      *****************************************************************
