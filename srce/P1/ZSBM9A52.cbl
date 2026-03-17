      *****************************************************************
      **  MEMBER :  ZSBM9A52                                         **
      **  REMARKS:  UPDATES THE PHST OLD VALUE TEXT FIELD OF SA      **
      **            TRANSFER RECORD FOR TVI POLICIES                 **
      **                                                             **
      **  DOMAIN :  PR                                               **
      **  CLASS  :  BC                                               **
      *****************************************************************
      **  DATE     AUTH   DESCRIPTION                                **
      **                                                             **
TVI000**  21JAN13  CTS    INITIAL VERSION                            **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBM9A52.

       COPY XCWWCRHT.
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM9A52'.
      /
       COPY SQLCA.
      /
       01  WS-PGM-WORK-AREA.
           05  WS-USER-TVI000                 PIC X(08)
                                              VALUE 'TVI000'.
           05  WS-INPUT-REC-INFO              PIC X(41).
           05  WS-PCHST-EFF-DT                PIC X(10).
           05  WS-PCHST-EFF-DT-R              REDEFINES
               WS-PCHST-EFF-DT.
               10  WS-PCHST-EFF-DT-YR         PIC 9(04).
               10  FILLER                     PIC X(01).
               10  WS-PCHST-EFF-DT-MO         PIC 9(02).
               10  FILLER                     PIC X(01).
               10  WS-PCHST-EFF-DT-DY         PIC 9(02).
           
       01  WS-MSGS-TXT                               PIC X(80).
               88  WS-MSGS-ZS9A520001                    VALUE
              'ONE-TIME TRANSITION JOB FOR PHST UPDATE FOR TVI'.
               88  WS-MSGS-ZS9A520002                    VALUE
              'NO RECORDS TO PROCESS'.
               88  WS-MSGS-ZS9A520003                    VALUE
              'PROCESSING POLICY NO '.
               88  WS-MSGS-ZS9A520004                    VALUE
              'ERROR UPDATING THE POLICY HISTORY RECORD'.
               88  WS-MSGS-ZS9A520005                    VALUE
              'POLICY CANNOT BE PROCESSED '.
             
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY CCFRPHST.
       COPY CCFWPHST.
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==    BY    9A52
                               ==':ID:'==  BY =='9A52'==.
       COPY ZCSR9A52.                               
      /
      ***********************************************************
      * CALLED MODULE PARAMETER INFORMATION
      ***********************************************************      
       COPY XCWL1680.
       COPY XCWL1670.
      *****************************************************************
      *  CALL MODULE PARAMETER INFORMATION                            *
      *****************************************************************
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY CCWL0010.
      /
       COPY CCWL0950.
      /
       COPY XCWL0035.
      /
       COPY XCWL0040.
      /
       COPY XCWL1660.
      /
       COPY XCWLDTLK.
      /
       COPY XCWTFCMD.
      /
       COPY XCWWWKDT.
      /
      ********************
       PROCEDURE DIVISION.
      ********************
      /
      *--------------
       0000-MAINLINE.
      *--------------
      
           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  1000-INITIALIZE
               THRU 1000-INITIALIZE-X.

           PERFORM  2000-PRCES-INPUT-RECORDS
               THRU 2000-PRCES-INPUT-RECORDS-X
               UNTIL W9A52-SEQ-IO-EOF.
               
           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAINLINE-X.
           EXIT.
      /
      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM  9A52-1000-OPEN-INPUT
               THRU 9A52-1000-OPEN-INPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       1000-INITIALIZE.
      *----------------

           MOVE 'CP'                        TO WGLOB-COMPANY-CODE.

           MOVE WPGWS-CRNT-PGM-ID           TO WGLOB-MAIN-PGM-ID
                                               WGLOB-CRNT-PGM-ID.

           PERFORM  0010-0000-INIT-PARM-INFO
               THRU 0010-0000-INIT-PARM-INFO-X.

           PERFORM  0010-1000-INIT-DEFAULT
               THRU 0010-1000-INIT-DEFAULT-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.

      ***  GET THE SYSTEM ID ***
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.

      *** GET THE PROGRAM DESCRIPTION ***
           SET  WS-MSGS-ZS9A520001          TO TRUE.
           MOVE WS-MSGS-TXT                 TO L0040-PROGRAM-DESC.

           MOVE ZERO                        TO L0040-ERROR-CNT.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           MOVE WS-USER-TVI000              TO WGLOB-USER-ID.

           PERFORM  9A52-1000-READ
               THRU 9A52-1000-READ-X.

           IF  NOT W9A52-SEQ-IO-OK
      *MSG: NO RECORDS TO PROCESS
               MOVE SPACES                  TO L0040-INPUT-LINE
               SET  WS-MSGS-ZS9A520002      TO TRUE
               MOVE WS-MSGS-TXT             TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
           END-IF.

       1000-INITIALIZE-X.
           EXIT.
      /
      *-------------------------
       2000-PRCES-INPUT-RECORDS.
      *-------------------------

           INITIALIZE WS-INPUT-REC-INFO.
           INITIALIZE WS-PGM-WORK-AREA.
           
           MOVE R9A52-SEQ-REC-INFO          TO WS-INPUT-REC-INFO.
      
      *MSG: PROCESSING POLICY NO @1
           MOVE SPACES                      TO L0040-INPUT-LINE.
           SET  WS-MSGS-ZS9A520003          TO TRUE.
           STRING WS-MSGS-TXT  DELIMITED BY '  '
                  ' '          DELIMITED BY SIZE
                  R9A52-POL-ID              INTO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
               
           PERFORM  3000-UPDATE-5021-ACTV
               THRU 3000-UPDATE-5021-ACTV-X.
               
           PERFORM  9A52-1000-READ
               THRU 9A52-1000-READ-X.

       2000-PRCES-INPUT-RECORDS-X.
           EXIT.
      /
      *----------------------
       3000-UPDATE-5021-ACTV.
      *----------------------
      
           MOVE R9A52-POL-ID                TO WPOL-POL-ID.

           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.
               
           IF NOT WPOL-IO-OK
      *MSG: POLICY (@1) CANNOT BE PROCESSED
               MOVE SPACES                      TO L0040-INPUT-LINE
               SET  WS-MSGS-ZS9A520005          TO TRUE
               STRING WS-MSGS-TXT  DELIMITED BY '  '
                     ' '          DELIMITED BY SIZE
                     R9A52-POL-ID              INTO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               GO TO 3000-UPDATE-5021-ACTV-X
           END-IF.

           MOVE R9A52-POL-ID              TO WPHST-POL-ID.
           MOVE R9A52-PCHST-EFF-IDT-NUM   TO WPHST-PCHST-EFF-IDT-NUM.
           MOVE R9A52-PCHST-SEQ-NUM       TO WPHST-PCHST-SEQ-NUM.

           PERFORM  PHST-1000-READ-FOR-UPDATE
               THRU PHST-1000-READ-FOR-UPDATE-X.

           IF NOT WPHST-IO-OK
      *MSG: ERROR UPDATING THE POLICY HISTORY RECORD
               MOVE SPACES                  TO L0040-INPUT-LINE
               SET  WS-MSGS-ZS9A520004      TO TRUE
               MOVE WS-MSGS-TXT             TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               PERFORM  PHST-3000-UNLOCK
                   THRU PHST-3000-UNLOCK-X
               GO TO 3000-UPDATE-5021-ACTV-X
           END-IF.

           MOVE R9A52-PCHST-EFF-DT          TO WS-PCHST-EFF-DT.
           MOVE RPOL-POL-ISS-EFF-DT-DY      TO WS-PCHST-EFF-DT-DY.
           MOVE WS-PCHST-EFF-DT             TO 
                                            RPHST-PCHST-OLD-VALU-TXT.

           PERFORM  PHST-2000-REWRITE
               THRU PHST-2000-REWRITE-X.

       3000-UPDATE-5021-ACTV-X.
            EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  9A52-4000-CLOSE
               THRU 9A52-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************
      *               I/O PROCESSING COPYBOOKS                        *
      *****************************************************************
       COPY CCPBPHST.
       COPY CCPUPHST.
       COPY CCPNPHST.
       COPY CCPNPOL.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY 9A52
                               ==':PGM:'== BY =='ZSRQ9A52'==.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY  ==9A52==.
       COPY XCSOFILE REPLACING ==:ID:==  BY 9A52.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
       COPY CCPL0010.
       COPY CCPS0010.
      /
       COPY CCPS0950.
       COPY CCPL0950.
      /
       COPY XCPL0030.
      /
       COPY XCPL0035.
      /
       COPY XCPL0040.
      /
       COPY XCPL0260.
      /
       COPY XCPL1660.
      /
       COPY XCPL1680.
      *****************************************************************
      *                END OF PROGRAM ZSBM9A52                        *
      *****************************************************************	