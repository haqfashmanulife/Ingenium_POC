      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.    XSBM3630.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSBM3630                                         **
      **  REMARKS:  PRINT PROGRAM FOR THE MSAU FILE.                 **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
011526**  30OCT98  56     REPLACED PROGRAM XSBPMSAU IN 552 RELEASE   **
012624**  15DEC99  60     SECURITY                                   **
014660**  15DEC99  60     GLOBAL MESSAGING                           **
013578**  15DEC99  60     3270 REMOVAL                               **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       COPY XCSSPRT1.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       COPY XCSDPRT1.
       COPY XCSRPRT1.
      /
       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSBM3630'.

       COPY SQLCA.

       01  WS-PGM-WORK-AREA.
           05  WS-LINE-CNT                  PIC S9(04) COMP.
           05  WS-TOT-CNT                   PIC S9(04) COMP.
           05  WS-PAGE-CNT                  PIC S9(04) COMP.
           05  WS-SUB                       PIC S9(04) COMP.
           05  WS-CTL-CARD-CTR              PIC S9(04) COMP.
           05  WS-DISP-NUM                  PIC ZZZZ9.
           05  WPRT-IO-STATUS               PIC X(02).

       01  WS-SWITCHES.
           05  WS-FATAL-ERROR-SW             PIC X.
               88  WS-FATAL-ERROR            VALUE 'Y'.
           05  WS-PROGRAM-ID-FOUND-SW        PIC X.
               88  WS-PROGRAM-ID-FOUND       VALUE 'Y'.
           05  WS-COMPANY-FOUND-SW           PIC X.
               88  WS-COMPANY-FOUND          VALUE 'Y'.

      **************************************************************
      *  NOTE: STANDARD HEADING LINES WILL BE AUTOMATICALLY BE
      *        CREATED. WS-HEADING-1 & 2, ARE HEADINGS THAT ARE
      *        UNIQUE TO YOUR PROGRAM.
      *
      **************************************************************

       01  WS-HEADING-1.
           05  FILLER                       PIC X(133)  VALUE
               ' USER                               POLICY/   TERM'.

       01  WS-HEADING-2.
           05  FILLER                       PIC X(54)   VALUE
               '  ID      TRAN   DATE       TIME    CLIENT    ID'.
           05  FILLER                       PIC X(79)  VALUE
               'ERROR MESSAGE'.

       01  WS-PRINT-LINE-1.
           05  FILLER                       PIC X(01)   VALUE SPACES.
           05  WS-P1-USER-ID                PIC X(08).
           05  FILLER                       PIC X(01)   VALUE SPACES.
           05  WS-P1-TRANSACTION            PIC X(04).
           05  FILLER                       PIC X(01)   VALUE SPACES.
           05  WS-P1-DATE                   PIC X(10).
           05  FILLER                       PIC X(01)   VALUE SPACES.
           05  WS-P1-TIME                   PIC X(08).
           05  FILLER                       PIC X(01)   VALUE SPACES.
           05  WS-P1-POL-CLIENT-NO          PIC X(10).
           05  FILLER                       PIC X(01)   VALUE SPACES.
013578*    05  WS-P1-TERMINAL-ID            PIC X(04).
013578*    05  FILLER                       PIC X(02)   VALUE SPACES.
           05  WS-P1-MESSAGE-USER-CLASS     PIC X(01).
           05  FILLER                       PIC X(01)   VALUE SPACES.
014660*    05  WS-P1-ERROR-MESSAGE          PIC X(79).
014660     05  WS-P1-ERROR-MESSAGE          PIC X(120).
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY XCWTFCMD.
      /
       COPY XCWWHDG.
      /
       COPY XCWWPARM.
      /
       COPY XCWWTIME.
      /
       COPY XCWWWKDT.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
       COPY XCSWPRT1.
      /
       COPY XCFWMSAU.
       COPY XCFRMSAU.
      /
       COPY XCFWXTAB.
       COPY XCFRXTAB.
      /
       COPY XCSWBCF.
       COPY XCSRBCF.
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
P02229 COPY XCWL0035.

       COPY CCWL0950.
      /
       COPY XCWL0010.
      /
014590*COPY XCWL0030.
      /
       COPY XCWL0040.
      /
       COPY XCWL1640.
      /
       COPY XCWLDTLK.
      /
      ********************
       PROCEDURE DIVISION.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM 0100-OPEN-FILES
              THRU 0100-OPEN-FILES-X.

           PERFORM 1000-INITIALIZE
              THRU 1000-INITIALIZE-X.

           PERFORM 2000-PROCESS-MSAU-FILE
              THRU 2000-PROCESS-MSAU-FILE-X
              UNTIL NOT WMSAU-IO-OK.

           PERFORM 3000-END-OF-JOB
              THRU 3000-END-OF-JOB-X.

           PERFORM 9999-CLOSE-FILES
              THRU 9999-CLOSE-FILES-X.

P02229     PERFORM  0035-1000-COMMIT
P02229         THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAINLINE-X.
           EXIT.
      /
      *****************
       0100-OPEN-FILES.
      *****************

           PERFORM OCF-3000-OPEN-OUTPUT
              THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM BCF-1000-OPEN-INPUT
              THRU BCF-1000-OPEN-INPUT-X.

           PERFORM PRT1-3000-OPEN-OUTPUT
              THRU PRT1-3000-OPEN-OUTPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
       1000-INITIALIZE.

           MOVE WPGWS-CRNT-PGM-ID  TO WGLOB-MAIN-PGM-ID.

           PERFORM  0010-1000-INIT-TPI-GLOB
               THRU 0010-1000-INIT-TPI-GLOB-X.

           PERFORM 0950-0000-INIT-PARM-INFO
              THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM 0950-1000-GET-COMPANY-NAME
              THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE L0950-COMPANY-NAME     TO L0040-COMPANY-NAME.
           MOVE ZERO                   TO L0040-ERROR-CNT.
           MOVE SPACES                 TO L0040-HDG-LINE-3.
           MOVE 'XS36300001'           TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-2000-GET-MESSAGE
              THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT          TO L0040-PROGRAM-DESC.
           MOVE 'XS00000146'           TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-2000-GET-MESSAGE
              THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT          TO L0040-SYSTEM-ID.
           PERFORM 0040-1000-INIT-TITLE
              THRU 0040-1000-INIT-TITLE-X.

           MOVE ZERO                   TO WS-PAGE-CNT.
           MOVE 99                     TO WS-LINE-CNT.
           MOVE ZERO                   TO WS-TOT-CNT.

           MOVE SPACE                  TO WHDG-WORK-AREA.
           PERFORM HDG-1000-INIT-CONSTANTS
              THRU HDG-1000-INIT-CONSTANTS-X.
           MOVE WGLOB-SYSTEM-DATE-INT  TO L1640-INTERNAL-DATE.

           PERFORM 1640-2000-INTERNAL-TO-EXT
              THRU 1640-2000-INTERNAL-TO-EXT-X.
           MOVE L1640-EXTERNAL-DATE    TO WHDG-DATE.

           MOVE 'XS36300002'           TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-2000-GET-MESSAGE
              THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT          TO WHDG-REPORT-TITLE.
           MOVE WGLOB-MAIN-PGM-ID      TO WHDG-PROGRAM-ID.
           MOVE L0040-SYSTEM-ID        TO WHDG-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME     TO WHDG-COMPANY-NAME.
           MOVE WGLOB-SYSTEM-TIME      TO WTIME-EDIT-TIME.
           MOVE 'Y'                    TO WTIME-24-HOUR-CLOCK-SW.
           MOVE 'N'                    TO WTIME-DISP-AM-OR-PM-SW.
           MOVE 'N'                    TO WTIME-DISP-SECONDS-SW.
           PERFORM TIME-1000-REFORMAT
              THRU TIME-1000-REFORMAT-X.
           MOVE WTIME-DISPLAY-TIME     TO WHDG-TIME.
           PERFORM 2200-HEADER-PRINT
              THRU 2200-HEADER-PRINT-X.

           PERFORM 4000-EDIT-CONTROL-CARDS
              THRU 4000-EDIT-CONTROL-CARDS-X.

           IF WS-FATAL-ERROR
               PERFORM 0030-4000-CTL-CARD-ERROR
                  THRU 0030-4000-CTL-CARD-ERROR-X
           END-IF.

           MOVE LOW-VALUES             TO WMSAU-KEY.
           MOVE WWKDT-LOW-DT           TO WMSAU-AUD-MSG-DT.
           MOVE ZERO                   TO WMSAU-AUD-MSG-TIME.
           MOVE HIGH-VALUES            TO WMSAU-ENDBR-KEY.
           MOVE WWKDT-HIGH-DT          TO WMSAU-ENDBR-AUD-MSG-DT.
           MOVE +9999999               TO WMSAU-ENDBR-AUD-MSG-TIME.
           PERFORM MSAU-1000-TBL-BROWSE
              THRU MSAU-1000-TBL-BROWSE-X.

           IF NOT WMSAU-IO-OK
               MOVE 'XS36300004'       TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           END-IF.

           PERFORM MSAU-2000-TBL-READ-NEXT
              THRU MSAU-2000-TBL-READ-NEXT-X.

       1000-INITIALIZE-X.
           EXIT.
      /
      ************************
       2000-PROCESS-MSAU-FILE.
      ************************

           ADD +1                         TO WS-TOT-CNT.

           IF WS-LINE-CNT NOT = ZERO
               MOVE  SPACES               TO  RPRT1-SEQ-REC-INFO
               MOVE  1                    TO  WPRT1-NUMBER-LINES
               PERFORM  PRT1-1000-WRITE
                   THRU PRT1-1000-WRITE-X
               ADD +1                     TO WS-LINE-CNT
           END-IF.

           IF WS-LINE-CNT > 50
               PERFORM  2200-HEADER-PRINT
                   THRU 2200-HEADER-PRINT-X
           END-IF.

           MOVE SPACE                    TO WS-PRINT-LINE-1.
           MOVE RMSAU-USER-ID            TO WS-P1-USER-ID.
012624*    MOVE RMSAU-TRXN-ID            TO WS-P1-TRANSACTION.
012624     MOVE RMSAU-BUS-FCN-ID         TO WS-P1-TRANSACTION.

           MOVE RMSAU-AUD-MSG-DT         TO L1640-INTERNAL-DATE.
           PERFORM 1640-2000-INTERNAL-TO-EXT
              THRU 1640-2000-INTERNAL-TO-EXT-X.
           MOVE L1640-EXTERNAL-DATE      TO WS-P1-DATE.

           MOVE RMSAU-AUD-MSG-TIME       TO WTIME-EDIT-TIME.
           MOVE 'Y'                      TO WTIME-24-HOUR-CLOCK-SW.
           MOVE 'N'                      TO WTIME-DISP-AM-OR-PM-SW.
           MOVE 'Y'                      TO WTIME-DISP-SECONDS-SW.
           PERFORM TIME-1000-REFORMAT
              THRU TIME-1000-REFORMAT-X.
           MOVE WTIME-DISPLAY-TIME       TO WS-P1-TIME.

           MOVE RMSAU-POL-ID-R           TO WS-P1-POL-CLIENT-NO.
013578*    MOVE RMSAU-AUD-MSG-TRMNL-ID   TO WS-P1-TERMINAL-ID.
           MOVE RMSAU-MSG-SECUR-CLAS-CD  TO WS-P1-MESSAGE-USER-CLASS.
           MOVE RMSAU-AUD-MSG-TXT        TO WS-P1-ERROR-MESSAGE.

           MOVE  WS-PRINT-LINE-1       TO  RPRT1-SEQ-REC-INFO.
           MOVE  1                     TO  WPRT1-NUMBER-LINES.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.
           ADD 1                       TO   WS-LINE-CNT.

           PERFORM  MSAU-2000-TBL-READ-NEXT
               THRU MSAU-2000-TBL-READ-NEXT-X.
       2000-PROCESS-MSAU-FILE-X.
           EXIT.
      /
      *******************
       2200-HEADER-PRINT.
      *******************

           MOVE ZERO           TO WS-LINE-CNT.
           ADD 1               TO WS-PAGE-CNT.
           MOVE WS-PAGE-CNT    TO WHDG-PAGE.
           MOVE  WHDG-LINE-1   TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-2000-WRITE
               THRU PRT1-2000-WRITE-X.
           MOVE  WHDG-LINE-2   TO  RPRT1-SEQ-REC-INFO.
           MOVE  2             TO  WPRT1-NUMBER-LINES.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.
           MOVE  WS-HEADING-1  TO  RPRT1-SEQ-REC-INFO.
           MOVE  2             TO  WPRT1-NUMBER-LINES.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.
           MOVE  WS-HEADING-2  TO  RPRT1-SEQ-REC-INFO.
           MOVE  1             TO  WPRT1-NUMBER-LINES.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.
           MOVE  SPACES        TO  RPRT1-SEQ-REC-INFO.
           MOVE  1             TO  WPRT1-NUMBER-LINES.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

       2200-HEADER-PRINT-X.
           EXIT.
      /
      *****************
       3000-END-OF-JOB.
      *****************

           MOVE WS-TOT-CNT        TO WS-DISP-NUM.
           MOVE WS-DISP-NUM       TO WGLOB-MSG-PARM (1).
           MOVE 'XS36300003'      TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-2000-GET-MESSAGE
              THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT       TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       3000-END-OF-JOB-X.
           EXIT.
      /
       4000-EDIT-CONTROL-CARDS.

           MOVE 'N' TO WS-FATAL-ERROR-SW.
           MOVE 'N' TO WS-COMPANY-FOUND-SW.
           MOVE 'N' TO WS-PROGRAM-ID-FOUND-SW.

           PERFORM BCF-1000-READ
               THRU BCF-1000-READ-X.

           IF WBCF-SEQ-IO-OK
               ADD 1 TO WS-CTL-CARD-CTR
           ELSE
               MOVE 'Y'      TO WS-FATAL-ERROR-SW
      ***  MESSAGE (S) CONTROL CARD FILE EMPTY, NO PROCESSING DONE
               MOVE 'XS00000151' TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4000-EDIT-CONTROL-CARDS-X
           END-IF.

           MOVE RBCF-SEQ-REC-INFO TO WPARM-CARD-AREA.
           IF NOT WPARM-PROGRAM-ID
               MOVE 'Y'      TO WS-FATAL-ERROR-SW
      ***  MESSAGE (S) FIRST CONTROL CARD MUST BE PROGRAM ID CARD
               MOVE 'XS00000147' TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           PERFORM 4100-EDIT-CONTROL-CARD
               THRU 4100-EDIT-CONTROL-CARD-X
               UNTIL WBCF-SEQ-IO-EOF.

           IF NOT WS-PROGRAM-ID-FOUND
               MOVE 'Y'      TO WS-FATAL-ERROR-SW
      ***  MESSAGE (S) MISSING PROGRAM ID CARD
               MOVE 'XS00000122' TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           IF NOT WS-COMPANY-FOUND
               MOVE 'Y'      TO WS-FATAL-ERROR-SW
      ***  MESSAGE (S) COMPANY CONTROL CARD MISSING
               MOVE 'XS00000134' TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

      *** PRINT CONTROL CARD TOTALS
      * MESSAGE (I) TOTAL NUMBER OF PARM CARDS READ @1
           MOVE 'XS00000142' TO WGLOB-MSG-REF-INFO.
           MOVE WS-CTL-CARD-CTR     TO WS-DISP-NUM.
           MOVE WS-DISP-NUM         TO WGLOB-MSG-PARM (1).
           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.

           PERFORM 0040-4000-WRITE-ERROR-TOTAL
               THRU 0040-4000-WRITE-ERROR-TOTAL-X.

       4000-EDIT-CONTROL-CARDS-X.
           EXIT.
      /
       4100-EDIT-CONTROL-CARD.

      *** PRINT CONTROL CARD
           MOVE RBCF-SEQ-REC-INFO TO L0040-INPUT-LINE.
           PERFORM 0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           EVALUATE TRUE
               WHEN WPARM-PROGRAM-ID
                    PERFORM 4110-EDIT-PROGRAM-ID
                       THRU 4110-EDIT-PROGRAM-ID-X

               WHEN WPARM-COMPANY-CODE
                    PERFORM 4120-EDIT-COMPANY-CODE
                       THRU 4120-EDIT-COMPANY-CODE-X

               WHEN OTHER
                    MOVE 'Y'      TO WS-FATAL-ERROR-SW
      *** MESSAGE (S) INVALID PARM CARD TYPE
                    MOVE 'XS00000152' TO WGLOB-MSG-REF-INFO
                    PERFORM 0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
           END-EVALUATE.

           PERFORM BCF-1000-READ
               THRU BCF-1000-READ-X.

           IF WBCF-SEQ-IO-OK
               MOVE RBCF-SEQ-REC-INFO TO WPARM-CARD-AREA
               ADD 1 TO WS-CTL-CARD-CTR
           END-IF.

       4100-EDIT-CONTROL-CARD-X.
           EXIT.
      /
      *---------------------
       4110-EDIT-PROGRAM-ID.
      *---------------------

           IF WS-PROGRAM-ID-FOUND
               MOVE 'Y'      TO WS-FATAL-ERROR-SW
      *** MESSAGE (S) MUST ONLY HAVE ONE PROGRAM ID CARD
               MOVE 'XS00000162' TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           MOVE 'Y' TO WS-PROGRAM-ID-FOUND-SW.

           IF WPARM-VALUE = WPGWS-CRNT-PGM-ID
               NEXT SENTENCE
           ELSE
               MOVE 'Y'      TO WS-FATAL-ERROR-SW
      *** MESSAGE (S) INVALID PROGRAM ID CARD
               MOVE 'XS00000121' TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       4110-EDIT-PROGRAM-ID-X.
           EXIT.
      /
      *-----------------------
       4120-EDIT-COMPANY-CODE.
      *-----------------------

           MOVE 'Y'         TO WS-COMPANY-FOUND-SW.
           MOVE WPARM-VALUE TO WXTAB-ETBL-VALU-ID.
           PERFORM COMP-1000-EDIT-COMPANY
               THRU COMP-1000-EDIT-COMPANY-X.

           IF WXTAB-IO-OK
               MOVE WXTAB-ETBL-VALU-ID TO WGLOB-COMPANY-CODE
           ELSE
               MOVE 'Y'      TO WS-FATAL-ERROR-SW
      *** MESSAGE (S) COMPANY CODE MUST BE IN EDIT TYPE 'COMP'
               MOVE 'XS00000082' TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       4120-EDIT-COMPANY-CODE-X.
           EXIT.
      /
      *****************
       9999-CLOSE-FILES.
      *****************

           PERFORM PRT1-4000-CLOSE
              THRU PRT1-4000-CLOSE-X.

           PERFORM BCF-4000-CLOSE
              THRU BCF-4000-CLOSE-X.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
       COPY CCPS0950.
      /
       COPY XCPECOMP.
      /
       COPY XCPPHDG.
      /
       COPY XCPPTIME.
      /
      ****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                *
      ****************************************************************
P02229 COPY XCPL0035.

       COPY CCPL0950.
      /
       COPY XCPL0010.
      /
       COPY XCPL0040.
      /
       COPY XCPL0260.
      /
       COPY XCPL1640.
      /
      ****************************************************************
      *  FILE I/O PROCESS MODULES                                    *
      ****************************************************************
       COPY XCPNBCF.
       COPY XCPOBCF.
       COPY XCPLBCF.
      /
       COPY XCPOOCF.
       COPY XCPLOCF.
      /
       COPY XCPTMSAU.
      /
       COPY XCPNXTAB.
      /
       COPY XCPIPRT1.
      /
      ****************************************************************
      *  ERROR HANDLING ROUTINES                                     *
      ****************************************************************
       COPY XCPL0030.
      ******************************************************************
      **           END OF PROGRAM XSBM3630                            **
      ******************************************************************
