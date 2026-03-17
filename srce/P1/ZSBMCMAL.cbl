
      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBMCMAL.

      *****************************************************************
      **  MEMBER :  ZSBMCMAL                                         **
      **  REMARKS:  BATCH PROGRAM FOR THE UPDATE OF CLIENT'S CWS     **
      **            REGISTERED EMAIL ADDRESS                         **
      **                                                             **
      **            THIS PROGRAM READS THE CSV FILE PROVIDED AND     **
      **            UPDATES TCLI.CWS_EMAIL_ADDR_TXT WITH THE VALUE   **
      **            SPECIFIED FOR EACH CLIENT IN THE CSV FILE        **
      **                                                             **
      **  DOMAIN :  CL                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
23823C**  07OCT20  CTS    INTIAL VERSION                             **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       CONFIGURATION SECTION.
      /
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

      /
       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCMAL'.

       COPY SQLCA.

       01  WS-CMAL-WORK-AREA.
           05  WS-CWS-EMAIL-ADDR-TXT       PIC X(80).
           05  WS-CWS-CLI-ID               PIC X(10).

       01  WS-RPT-TOT-CTR.
           05  WS-TOT-REC-CTR              PIC S9(07) COMP-3 VALUE +0.
           05  WS-CLI-ID-ERROR-CTR         PIC S9(07) COMP-3 VALUE +0.
           05  WS-UPDT-REC-CTR             PIC S9(07) COMP-3 VALUE +0.

       01  WS-CONSTANT-AREA.
           05  WS-COMMA-DELIM-CHAR         PIC X(01) VALUE ','.
       01  WS-WORK-AREA.
           05  WS-KEY-CLI-ID               PIC X(10).
           05  WS-DISP-CTR                 PIC Z,ZZZ,ZZ9.
       01  WS-ERROR-SW                     PIC X(01).
           88  WS-ERROR-FOUND              VALUE 'Y'.

      *****************************************************************
      *     COMMON COPYBOOKS                                          *
      ***************************************************************** 
      /
       COPY CCWWCCC.
      /
      *****************************************************************
      *     I/O COPYBOOKS                                             *
      *****************************************************************
      /      
       COPY CCFWCLI.
       COPY CCFRCLI.
      /     
       COPY CCFWMAST.
       COPY CCFRMAST.
      / 
       COPY XCSWSEQ  REPLACING ==:ID:==  BY CMAL
                               ==':ID:'==  BY =='CMAL'==.
       COPY ZCSRCMAL.       

       COPY XCSWPRT  REPLACING ==:ID:==  BY OCF
                               ==':ID:'==  BY =='OCF'==.
       COPY XCSROCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.
      /
       COPY XCWTFCMD.
      /
      *****************************************************************
      *     CALLED MODULES                                            *
      *****************************************************************

       COPY XCWL0040.
      /
       COPY CCWL0010.
      /
       COPY CCWL0950.
      /
       COPY XCWL2490.
      /
       COPY XCWL0035.
      /
       COPY XCWL0800.
       COPY XCWL1580.
       COPY XCWL1610.
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY XCWWCKPT.
           05  WCKPT-TBL-KEY-AREA.
               10  WCKPT-FILE-NM                         PIC X(04).
               10  WCKPT-KEY-VALU                        PIC X(10).
           05  WCKPT-GLOBAL-AREA                         PIC X(992).
      /

      ********************
       PROCEDURE DIVISION.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  1000-INITIALIZE
               THRU 1000-INITIALIZE-X.

      * CMAL FILE PROCESSING
           PERFORM  2000-PROCESS-CMAL
               THRU 2000-PROCESS-CMAL-X
               UNTIL WCMAL-SEQ-IO-EOF
                  OR WS-ERROR-FOUND.

           PERFORM  0800-3000-FINISH-CKPT
               THRU 0800-3000-FINISH-CKPT-X.

           PERFORM  9000-PRINT-STATS
               THRU 9000-PRINT-STATS-X.

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

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.

           PERFORM  OCF-5000-OPEN-EXTEND
               THRU OCF-5000-OPEN-EXTEND-X.

           PERFORM  CMAL-1000-OPEN-INPUT
               THRU CMAL-1000-OPEN-INPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       1000-INITIALIZE.
      *----------------

      **   READ THE COMPANY CONTROL CARD

           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.

           PERFORM  1100-INIT-OCF-TITLES
               THRU 1100-INIT-OCF-TITLES-X.

           PERFORM  MAST-1000-READ
               THRU MAST-1000-READ-X.

           IF  WMAST-IO-OK
               MOVE RMAST-APPL-CTL-PRCES-DT TO WGLOB-PROCESS-DATE
           ELSE
      *MSG: 'MASTER CONTROL RECORD (@1) NOT FOUND'
               MOVE WMAST-KEY               TO WGLOB-MSG-PARM (1)
               MOVE 'CS00000061'            TO WGLOB-MSG-REF-INFO

               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X

               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           END-IF.

      *FIRST RECORD WILL BE HEADER IN INPUT FILE 
           PERFORM  CMAL-1000-READ
               THRU CMAL-1000-READ-X.
               
           IF NOT WCMAL-SEQ-IO-OK
      * MSG:'ERROR WHILE READING INPUT FILE @1; STATUS = @2'
               MOVE 'ZSCMAL0001'            TO WGLOB-MSG-REF-INFO
               MOVE 'CMAL'                  TO WGLOB-MSG-PARM (1)
               MOVE WCMAL-SEQ-IO-STATUS     TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 1000-INITIALIZE-X
           END-IF.

           PERFORM  CKPT-CHECK-RESTART-INIT
               THRU CKPT-CHECK-RESTART-INIT-X.
      
           PERFORM  0800-1000-BUILD-PARM-INFO
               THRU 0800-1000-BUILD-PARM-INFO-X.
      
           MOVE WPGWS-CRNT-PGM-ID           TO L0800-CHKPT-PGM-ID.
           MOVE WGLOB-CHKPT-INSTC-ID        TO L0800-CHKPT-INSTC-ID.
           MOVE WGLOB-COMPANY-CODE          TO L0800-CO-ID.
           MOVE LENGTH OF WCKPT-WORK-AREA   TO L0800-CHKPT-WRK-INFO-LEN.
      
           PERFORM  0800-1000-INIT-CKPT
               THRU 0800-1000-INIT-CKPT-X.
      
           MOVE WCMAL-SEQ-FILE-NAME         TO WCKPT-FILE-NM.
      
      * IF WE ARE IN RESTART MODE THEN RESTORE THE DATA
      * AND BYPASS INPUT RECORDS UNTIL WE GET TO THE ONE THAT
      * WAS BEING PROCESSED WHEN IT FAILED
           IF  L0800-CHKPT-STAT-RUNNING
               PERFORM  8000-RESTORE-CKPT-DATA
                   THRU 8000-RESTORE-CKPT-DATA-X
      * MSG : PROGRAM RESTART FOR @1
               MOVE 'XS00000099'            TO WGLOB-MSG-REF-INFO
               MOVE WPGWS-CRNT-PGM-ID       TO WGLOB-MSG-PARM (1)
               PERFORM  0260-2000-GET-MESSAGE
                   THRU 0260-2000-GET-MESSAGE-X
               MOVE WGLOB-MSG-TXT           TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
      * READ THE RECORDS 
               PERFORM  2100-READ-FILE-CMAL
                   THRU 2100-READ-FILE-CMAL-X
                   UNTIL WS-CWS-CLI-ID = WS-KEY-CLI-ID
                     OR  (NOT WCMAL-SEQ-IO-OK)
           END-IF.     
           PERFORM  2100-READ-FILE-CMAL
               THRU 2100-READ-FILE-CMAL-X.

       1000-INITIALIZE-X.
           EXIT.
      /
      *---------------------
       1100-INIT-OCF-TITLES.
      *---------------------

      * SET UP THE TITLE/HEADING LINES FOR THE OCF REPORT
           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.
           MOVE ZERO                        TO L0040-ERROR-CNT.

      **   GET THE SYSTEM ID
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.

      *    PROGRAM DESCRIPTION - CLIENT'S CWS REGISTERED EMAIL ADDRESS UPDATE'
           MOVE WPGWS-CRNT-PGM-ID           TO L2490-TXT-SRC-ID.
           MOVE '0001'                      TO L2490-TXT-SRC-REF-ID.
           MOVE WGLOB-USER-LANG             TO L2490-TXT-LANG-CD.
           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
           MOVE L2490-TXT-STR-TXT           TO L0040-PROGRAM-DESC.

      *    GET THE 'RUN MESSAGES' MESSAGE TEXT
           MOVE 'XS00000153'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-HDG-LINE-3.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

       1100-INIT-OCF-TITLES-X.
           EXIT.
      /
      *------------------
       2000-PROCESS-CMAL.
      *------------------

           PERFORM  2500-WRIT-CLI-TBL
               THRU 2500-WRIT-CLI-TBL-X.

           PERFORM  CKPT-CHECK-RESTART-FREQ
               THRU CKPT-CHECK-RESTART-FREQ-X.
      
           IF  WCKPT-CKPT-FREQ-YES
               PERFORM  8100-SAVE-CKPT-DATA
                   THRU 8100-SAVE-CKPT-DATA-X
               PERFORM  0800-2000-COMMIT-CKPT
                   THRU 0800-2000-COMMIT-CKPT-X
               PERFORM  CKPT-CHECK-RESTART-INIT
                   THRU CKPT-CHECK-RESTART-INIT-X
           END-IF.

           PERFORM  2100-READ-FILE-CMAL
               THRU 2100-READ-FILE-CMAL-X.

       2000-PROCESS-CMAL-X.
           EXIT.

      *--------------------
       2100-READ-FILE-CMAL.
      *--------------------

           INITIALIZE WS-CMAL-WORK-AREA.
           INITIALIZE WS-ERROR-SW.

           PERFORM  CMAL-1000-READ
               THRU CMAL-1000-READ-X.

           IF  WCMAL-SEQ-IO-EOF
      * MSG:'END-OF-FILE @1'
               MOVE 'ZSCMAL0002'            TO WGLOB-MSG-REF-INFO
               MOVE 'CMAL'                  TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2100-READ-FILE-CMAL-X
           ELSE
               IF NOT WCMAL-SEQ-IO-OK 
                   SET WS-ERROR-FOUND       TO TRUE
      * MSG:'ERROR WHILE READING INPUT FILE @1; STATUS = @2'
                   MOVE 'ZSCMAL0001'        TO WGLOB-MSG-REF-INFO
                   MOVE 'CMAL'              TO WGLOB-MSG-PARM (1)
                   MOVE WCMAL-SEQ-IO-STATUS TO WGLOB-MSG-PARM (2)
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
                   GO TO 2100-READ-FILE-CMAL-X
               END-IF
           END-IF.

           ADD +1                           TO WS-TOT-REC-CTR.

      * UNSTRING THE CMAL FILE RECORD

           UNSTRING RCMAL-SEQ-REC-INFO
                    DELIMITED BY WS-COMMA-DELIM-CHAR
               INTO WS-CWS-EMAIL-ADDR-TXT,
                    WS-CWS-CLI-ID
           END-UNSTRING.

       2100-READ-FILE-CMAL-X.
           EXIT.

      /
      *--------------------
       2500-WRIT-CLI-TBL.
      *--------------------

           MOVE LOW-VALUES                  TO WCLI-KEY.
           MOVE WS-CWS-CLI-ID               TO WCLI-CLI-ID.

           PERFORM  CLI-1000-READ-FOR-UPDATE 
               THRU CLI-1000-READ-FOR-UPDATE-X.

           IF NOT WCLI-IO-OK
      * MSG: CLIENT RECORD (@1) NOT FOUND
               MOVE WS-CWS-CLI-ID           TO WGLOB-MSG-PARM (1)
               MOVE 'ZSCMAL0003'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               ADD +1                       TO WS-CLI-ID-ERROR-CTR
               GO TO 2500-WRIT-CLI-TBL-X
           END-IF.
           MOVE WS-CWS-EMAIL-ADDR-TXT       TO RCLI-CWS-EMAIL-ADDR-TXT.
           PERFORM  CLI-2000-REWRITE
               THRU CLI-2000-REWRITE-X.
           IF NOT WCLI-IO-OK
               PERFORM  CLI-3000-UNLOCK
                   THRU CLI-3000-UNLOCK-X
      * MSG: ERROR WHILE UPDATING CLIENT RECORD (@1)
               MOVE WS-CWS-CLI-ID           TO WGLOB-MSG-PARM (1)
               MOVE 'ZSCMAL0004'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               ADD +1                       TO WS-CLI-ID-ERROR-CTR
               GO TO 2500-WRIT-CLI-TBL-X
           END-IF.
           ADD +1                           TO WS-UPDT-REC-CTR.

       2500-WRIT-CLI-TBL-X.
           EXIT. 
      /
      *-----------------------
       8000-RESTORE-CKPT-DATA.
      *-----------------------
      
           MOVE L0800-CHKPT-WRK-INFO-TEXT   TO WCKPT-WORK-AREA.
           MOVE WCKPT-KEY-VALU              TO WS-KEY-CLI-ID.
           MOVE WCKPT-GLOBAL-AREA           TO WGLOB-GLOBAL-AREA.
      
       8000-RESTORE-CKPT-DATA-X.
           EXIT.
      /
      *--------------------
       8100-SAVE-CKPT-DATA.
      *--------------------
      
           MOVE WS-CWS-CLI-ID               TO WCKPT-KEY-VALU.
           MOVE WGLOB-GLOBAL-AREA           TO WCKPT-GLOBAL-AREA.
           MOVE WCKPT-WORK-AREA             TO
                                           L0800-CHKPT-WRK-INFO-TEXT.
      
       8100-SAVE-CKPT-DATA-X.
           EXIT.
      /

      *-----------------
       9000-PRINT-STATS.
      *-----------------

           MOVE SPACES                      TO L0040-INPUT-LINE.

           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                      TO L0040-INPUT-LINE.

      **   MSG:'NUMBER OF RECORDS READ FROM CMAL INPUT FILE...... @1'
           MOVE 'ZSCMAL0005'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-TOT-REC-CTR              TO WS-DISP-CTR.
           MOVE WS-DISP-CTR                 TO WGLOB-MSG-PARM (1).
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                      TO L0040-INPUT-LINE.

      **   MSG:'NUMBER OF CLIENT RECORDS NOT FOUND............... @1'
           MOVE 'ZSCMAL0006'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-CLI-ID-ERROR-CTR         TO WS-DISP-CTR.
           MOVE WS-DISP-CTR                 TO WGLOB-MSG-PARM (1).
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                      TO L0040-INPUT-LINE.


      **   MSG:'NUMBER OF RECORDS UPDATED IN TCLI TABLE.......... @1'
           MOVE 'ZSCMAL0007'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-UPDT-REC-CTR             TO WS-DISP-CTR.
           MOVE WS-DISP-CTR                 TO WGLOB-MSG-PARM (1).
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                      TO L0040-INPUT-LINE.


       9000-PRINT-STATS-X.
           EXIT.
      /  
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

           PERFORM  CMAL-4000-CLOSE
               THRU CMAL-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************
      * LINK COPYBOOKS
      *****************************************************************

       COPY XCPL0035.

       COPY CCPS0950.
       COPY CCPL0950.

       COPY CCPS0010.
       COPY CCPL0010.

       COPY XCPL0040.

       COPY XCPL0260.

       COPY XCPS2490.
       COPY XCPL2490.

       COPY XCPL0030.
      /
       COPY XCPS0800.
       COPY XCPL0800.
      /

      *****************************************************************
      *  PROCESSING COPYBOOKS
      *****************************************************************

       COPY CCPPCCC.
      /
       COPY XCPPCKPT.
       COPY XCPL1580.
       COPY XCPL1610.
      /
      *****************************************************************
      *  FILE I/O COPYBOOKS
      *****************************************************************
      /
       COPY CCPNCLI.
       COPY CCPUCLI.
      / 
       COPY CCPNMAST.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY CMAL
                               ==':PGM:'== BY =='ZSRQCMAL'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY CMAL.
       COPY XCSASEQ  REPLACING ==:ID:==  BY CMAL.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY CMAL.
      /      
       COPY XCSLFILE REPLACING ==:ID:==  BY OCF
                               ==':PGM:'== BY =='XSRQOCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY OCF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY OCF.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY BCF
                               ==':PGM:'== BY =='XSRQBCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY BCF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY BCF.
      /
      *****************************************************************
      **                 END OF PROGRAM ZSBMCMAL                     **
      *****************************************************************
      