      *****************************************************************
      **  MEMBER :  ZSBM9A50                                         **
      **  REMARKS:  CREATES LOAN ACTV IN PHST TABLE                  **
      **                                                             **
      **  DOMAIN :  PR                                               **
      **  CLASS  :  BC                                               **
      *****************************************************************
      **  DATE     AUTH   DESCRIPTION                                **
      **                                                             **
MP166T**  22JAN12  CTS    INITIAL VERSION                            **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBM9A50.

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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM9A50'.
      /
       COPY SQLCA.
      /
       01  WS-PGM-WORK-AREA.
           05  WS-USER-MP166T                        PIC X(08)
                                                     VALUE 'MP166T'.
           05  WS-INPUT-REC-INFO                     PIC X(53).
           05  WS-START-SEQ-NUM                      PIC S9(03) 
                                                         COMP-3.
           05  WS-START-DT.
               10  WS-START-YYYY                     PIC 9(04).
               10  FILLER                            PIC X(01).
               10  WS-START-MM                       PIC 9(02).
               10  FILLER                            PIC X(01).
               10  WS-START-DD                       PIC 9(02).
               10  FILLER                            PIC X(01).
           05  WS-STAT-CD                            PIC X(01).
               88  WS-STAT-ACTIVE                    VALUE 'A'.
               88  WS-STAT-REVRS                     VALUE 'R'.
           05  WS-PREV-STAT-CD                       PIC X(01).
               88  WS-PREV-STAT-ACTIVE               VALUE 'A'.
               88  WS-PREV-STAT-REVRS                VALUE 'R'.
           05  WS-CURR-STAT-CD                       PIC X(01).
               88  WS-CURR-STAT-ACTIVE               VALUE 'A'.
               88  WS-CURR-STAT-HISTORY              VALUE 'H'.
               88  WS-CURR-STAT-REVRS                VALUE 'R'.
               88  WS-CURR-STAT-OVERRIDE             VALUE 'O'.
           05  WS-ACTV-TYP-ID                        PIC X(04).
               88  WS-ACTV-TYP-NEW-APL               VALUE '7021'.
               88  WS-ACTV-TYP-CL                    VALUE '7022'.
               88  WS-ACTV-TYP-APL-REPAY             VALUE '7023'.
               88  WS-ACTV-TYP-CL-REPAY              VALUE '7024'.
           05  WS-HOLD-PHST-REC                      PIC X(118).
           05  WS-POL-ACTV-TYP-ID                    PIC X(04).
           05  WS-COUNT                              PIC 9(02).
           
       01  WS-MSGS-TXT                               PIC X(80).
               88  WS-MSGS-ZS9A500001                    VALUE
              'ONE-TIME TRANSITION JOB FOR PHST ACTIVITIES FOR LOAN'.
               88  WS-MSGS-ZS9A500002                    VALUE
              'NO RECORDS TO PROCESS'.
               88  WS-MSGS-ZS9A500003                    VALUE
              'PROCESSING POLICY NO '.
       
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY CCFRPHST.
       COPY CCFWPHST.
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==    BY    9A50
                               ==':ID:'==  BY =='9A50'==.
       COPY ZCSR9A50.                               
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
               UNTIL W9A50-SEQ-IO-EOF.    
               
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

           PERFORM  9A50-1000-OPEN-INPUT
               THRU 9A50-1000-OPEN-INPUT-X.

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
           SET  WS-MSGS-ZS9A500001          TO TRUE.
           MOVE WS-MSGS-TXT                 TO L0040-PROGRAM-DESC.

           MOVE ZERO                        TO L0040-ERROR-CNT.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           MOVE WS-USER-MP166T              TO WGLOB-USER-ID.

           PERFORM  9A50-1000-READ
               THRU 9A50-1000-READ-X.

           IF  NOT W9A50-SEQ-IO-OK
      *MSG: NO RECORDS TO PROCESS
               MOVE SPACES                  TO L0040-INPUT-LINE
               SET  WS-MSGS-ZS9A500002      TO TRUE
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
           
           MOVE R9A50-SEQ-REC-INFO          TO WS-INPUT-REC-INFO.
      
      *MSG: PROCESSING POLICY NO @1
           MOVE SPACES                      TO L0040-INPUT-LINE.
           SET  WS-MSGS-ZS9A500003          TO TRUE.
           STRING WS-MSGS-TXT  DELIMITED BY '  '
                  ' '          DELIMITED BY SIZE
                  R9A50-POL-ID              INTO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
               
           IF  R9A50-LOAN-ID ='A'
               PERFORM  3000-CREAT-APL-REC
                   THRU 3000-CREAT-APL-REC-X
           ELSE
               PERFORM  4000-CREAT-CL-REC
                   THRU 4000-CREAT-CL-REC-X
           END-IF.
           
           PERFORM  9A50-1000-READ
               THRU 9A50-1000-READ-X.

       2000-PRCES-INPUT-RECORDS-X.
           EXIT.
      /
      *-------------------
       3000-CREAT-APL-REC.
      *-------------------
      
           IF  R9A50-LOAN-TRXN-CD = 'N'
           AND R9A50-LOAN-STAT-CD = 'A'
               PERFORM  3100-CREAT-7021-ACTV
                   THRU 3100-CREAT-7021-ACTV-X
               GO TO 3000-CREAT-APL-REC-X
           END-IF.
           
           IF  (R9A50-LOAN-TRXN-CD = 'F'
           OR  R9A50-LOAN-TRXN-CD = 'P')
           AND R9A50-LOAN-STAT-CD = 'A'
               PERFORM  3200-CREAT-7023-ACTV
                   THRU 3200-CREAT-7023-ACTV-X
               GO TO 3000-CREAT-APL-REC-X
           END-IF.
     
           IF  R9A50-LOAN-TRXN-CD = 'N'
           AND R9A50-LOAN-STAT-CD = 'R'
               PERFORM  3300-CREAT-7021-REVRS-ACTV
                   THRU 3300-CREAT-7021-REVRS-ACTV-X
               GO TO 3000-CREAT-APL-REC-X
           END-IF.

       3000-CREAT-APL-REC-X.
          EXIT.
     /
      *---------------------
       3100-CREAT-7021-ACTV.
      *---------------------
     
           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           MOVE R9A50-LOAN-EFF-DT           TO L1660-INTERNAL-DATE.
      
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
      
           MOVE L1660-INVERTED-DATE         TO WPHST-PCHST-EFF-IDT-NUM.

      *  SET UP ENDBROWSE KEY
      *
           MOVE ZEROES                      TO WPHST-PCHST-SEQ-NUM.
           MOVE WPHST-KEY                   TO WPHST-ENDBR-KEY.
           MOVE 999                         TO
                                     WPHST-ENDBR-PCHST-SEQ-NUM.
      
           PERFORM  PHST-1000-BROWSE
               THRU PHST-1000-BROWSE-X.
      
           PERFORM  PHST-2000-READ-NEXT
               THRU PHST-2000-READ-NEXT-X.
            
           IF  WPHST-IO-EOF
               PERFORM  PHST-3000-END-BROWSE
                   THRU PHST-3000-END-BROWSE-X           
               PERFORM  3110-WRIT-7021-PHST-1
                   THRU 3110-WRIT-7021-PHST-1-X
               GO TO 3100-CREAT-7021-ACTV-X   
           END-IF.
           
           IF  WPHST-IO-OK
           AND RPHST-POL-ACTV-TYP-ID = '1910'
               MOVE  RPHST-PCHST-SEQ-NUM    TO WS-START-SEQ-NUM
               MOVE  RPHST-PCHST-EFF-IDT-NUM
                                            TO WS-START-DT
               CONTINUE
           ELSE
               PERFORM  PHST-3000-END-BROWSE
                   THRU PHST-3000-END-BROWSE-X
               PERFORM  3110-WRIT-7021-PHST-1
                   THRU 3110-WRIT-7021-PHST-1-X           
               GO TO 3100-CREAT-7021-ACTV-X
           END-IF.
           
           PERFORM  PHST-3000-END-BROWSE
               THRU PHST-3000-END-BROWSE-X.
               
           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           MOVE WS-START-SEQ-NUM            TO WPHST-PCHST-SEQ-NUM.
           MOVE WS-START-DT                 TO WPHST-PCHST-EFF-IDT-NUM.
           
           PERFORM  PHST-1000-READ
               THRU PHST-1000-READ-X.
           
           MOVE RPHST-REC-INFO              TO WS-HOLD-PHST-REC.
           
           COMPUTE WPHST-PCHST-SEQ-NUM  = WS-START-SEQ-NUM
                                        - 1.
           MOVE WPHST-PCHST-SEQ-NUM         TO RPHST-PCHST-SEQ-NUM.
           
      * TO MOVE THE LATEST RECORD IN PHST UP BY ONE NUMBER.
           PERFORM  PHST-1000-WRITE
               THRU PHST-1000-WRITE-X.
           
           PERFORM  3120-LOOP-PHST
               THRU 3120-LOOP-PHST-X.
               
       3100-CREAT-7021-ACTV-X.
           EXIT.
      /
      *----------------------
       3110-WRIT-7021-PHST-1.
      *----------------------

           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           MOVE R9A50-LOAN-EFF-DT           TO L1660-INTERNAL-DATE.
      
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
      
           MOVE L1660-INVERTED-DATE         TO WPHST-PCHST-EFF-IDT-NUM.

      *  SET UP ENDBROWSE KEY
      *
           MOVE ZEROES                      TO WPHST-PCHST-SEQ-NUM.      
           MOVE WPHST-KEY                   TO WPHST-ENDBR-KEY.
           MOVE 999                         TO
                                     WPHST-ENDBR-PCHST-SEQ-NUM.
      
           PERFORM  PHST-1000-BROWSE
               THRU PHST-1000-BROWSE-X.
      
           PERFORM  PHST-2000-READ-NEXT
               THRU PHST-2000-READ-NEXT-X.
            
           IF  WPHST-IO-OK
               MOVE  RPHST-PCHST-SEQ-NUM    TO WS-START-SEQ-NUM
               MOVE  RPHST-PCHST-EFF-IDT-NUM
                                            TO WS-START-DT
           ELSE
               MOVE +999                    TO WS-START-SEQ-NUM
           END-IF.
           
           PERFORM  PHST-3000-END-BROWSE
               THRU PHST-3000-END-BROWSE-X.
               
           MOVE  R9A50-POL-ID             TO  WPHST-POL-ID.
           MOVE  R9A50-LOAN-EFF-DT        TO  L1660-INTERNAL-DATE.
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE       TO WPHST-PCHST-EFF-IDT-NUM.

           SUBTRACT +1                    FROM  WS-START-SEQ-NUM.
           MOVE  WS-START-SEQ-NUM         TO  WPHST-PCHST-SEQ-NUM.
           
           PERFORM  PHST-1000-CREATE
               THRU PHST-1000-CREATE-X.
      
           MOVE R9A50-LOAN-EFF-DT         TO L1680-INTERNAL-1.
           MOVE ZERO                      TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO                      TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                      TO L1680-NUMBER-OF-DAYS.
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
           MOVE L1680-INTERNAL-2          TO RPHST-PCHST-EFF-DT.
           MOVE ZEROES                    TO RPHST-CVG-NUM.
           SET WS-STAT-ACTIVE             TO TRUE.
           MOVE WS-STAT-CD                TO RPHST-PCHST-STAT-CD.
           MOVE SPACES                    TO RPHST-PCHST-PREV-STAT-CD.
           SET WS-ACTV-TYP-NEW-APL        TO TRUE.
           MOVE WS-ACTV-TYP-ID            TO RPHST-POL-ACTV-TYP-ID.
           MOVE SPACES                    TO RPHST-PCHST-OLD-VALU-TXT.
           MOVE R9A50-LOAN-SEQ-NUM        TO RPHST-PCHST-NEW-VALU-TXT.
           MOVE R9A50-LOAN-PRCES-DT       TO RPHST-PREV-PRCES-DT.
           
           PERFORM  PHST-1000-WRITE
               THRU PHST-1000-WRITE-X.
           
       3110-WRIT-7021-PHST-1-X.
           EXIT.
      /      
      *---------------
       3120-LOOP-PHST.
      *---------------
      * READ THE 1910 RECORD AND MOVE THE RECORD UP BY ONE SEQ NUMBER 
           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           MOVE WS-START-SEQ-NUM            TO WPHST-PCHST-SEQ-NUM.
           MOVE WS-START-DT                 TO WPHST-PCHST-EFF-IDT-NUM.           
           
           PERFORM  PHST-1000-READ
               THRU PHST-1000-READ-X.
               
           IF  RPHST-POL-ACTV-TYP-ID ='1910'
           AND RPHST-PCHST-STAT-ACTIVE
               CONTINUE
           ELSE 
               GO TO 3120-LOOP-PHST-X
           END-IF.
           
           MOVE RPHST-REC-INFO              TO WS-HOLD-PHST-REC.
           
      * UPDATE THE EXISTING RECORD WITH APL RECORD VALUES
           
           PERFORM  PHST-1000-READ-FOR-UPDATE
               THRU PHST-1000-READ-FOR-UPDATE-X.
               
           MOVE R9A50-LOAN-EFF-DT           TO RPHST-PCHST-EFF-DT.
           MOVE R9A50-LOAN-PRCES-DT         TO RPHST-PREV-PRCES-DT.
           SET WS-ACTV-TYP-NEW-APL          TO TRUE.
           MOVE WS-ACTV-TYP-ID              TO RPHST-POL-ACTV-TYP-ID.
           MOVE SPACES                      TO
                                            RPHST-PCHST-OLD-VALU-TXT.
           MOVE R9A50-LOAN-SEQ-NUM          TO 
                                            RPHST-PCHST-NEW-VALU-TXT.
           SET WS-STAT-ACTIVE               TO TRUE.
           MOVE WS-STAT-CD                  TO RPHST-PCHST-STAT-CD.                                            

           PERFORM  PHST-2000-REWRITE
               THRU PHST-2000-REWRITE-X.
         
       3120-LOOP-PHST-X.
           EXIT.
      /
      *---------------------
       3200-CREAT-7023-ACTV.
      *---------------------
      
           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           MOVE R9A50-LOAN-EFF-DT           TO L1660-INTERNAL-DATE.
      
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
      
           MOVE L1660-INVERTED-DATE         TO WPHST-PCHST-EFF-IDT-NUM.

      *  SET UP ENDBROWSE KEY
      *
           MOVE ZEROES                      TO WPHST-PCHST-SEQ-NUM.      
           MOVE WPHST-KEY                   TO WPHST-ENDBR-KEY.
           MOVE 999                         TO
                                     WPHST-ENDBR-PCHST-SEQ-NUM.
                                     
           PERFORM  PHST-1000-BROWSE
               THRU PHST-1000-BROWSE-X.
      
           PERFORM  PHST-2000-READ-NEXT
               THRU PHST-2000-READ-NEXT-X.
            
           IF  WPHST-IO-OK
               MOVE  RPHST-PCHST-SEQ-NUM    TO WS-START-SEQ-NUM
               MOVE  RPHST-PCHST-EFF-IDT-NUM
                                            TO WS-START-DT
           ELSE
               MOVE +999                    TO WS-START-SEQ-NUM
           END-IF.
           
           PERFORM  PHST-3000-END-BROWSE
               THRU PHST-3000-END-BROWSE-X.
               
           MOVE  R9A50-POL-ID               TO  WPHST-POL-ID.
           MOVE  R9A50-LOAN-EFF-DT          TO  L1660-INTERNAL-DATE.
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE       TO WPHST-PCHST-EFF-IDT-NUM.

           SUBTRACT +1                    FROM  WS-START-SEQ-NUM.
           MOVE  WS-START-SEQ-NUM         TO  WPHST-PCHST-SEQ-NUM.
           
           PERFORM  PHST-1000-CREATE
               THRU PHST-1000-CREATE-X.
      
           MOVE R9A50-LOAN-EFF-DT         TO L1680-INTERNAL-1.
           MOVE ZERO                      TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO                      TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                      TO L1680-NUMBER-OF-DAYS.
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
           MOVE L1680-INTERNAL-2          TO RPHST-PCHST-EFF-DT.
           MOVE ZEROES                    TO RPHST-CVG-NUM.
           SET WS-STAT-ACTIVE             TO TRUE.
           MOVE WS-STAT-CD                TO RPHST-PCHST-STAT-CD.
           MOVE SPACES                    TO RPHST-PCHST-PREV-STAT-CD.
           SET WS-ACTV-TYP-APL-REPAY      TO TRUE.
           MOVE WS-ACTV-TYP-ID            TO RPHST-POL-ACTV-TYP-ID.
           MOVE SPACES                    TO RPHST-PCHST-OLD-VALU-TXT.
           MOVE R9A50-LOAN-SEQ-NUM        TO RPHST-PCHST-NEW-VALU-TXT.
           MOVE R9A50-LOAN-PRCES-DT       TO RPHST-PREV-PRCES-DT.
           
           PERFORM  PHST-1000-WRITE
               THRU PHST-1000-WRITE-X.
           
       3200-CREAT-7023-ACTV-X.
           EXIT.
      /
      *---------------------------
       3300-CREAT-7021-REVRS-ACTV.
      *---------------------------
      * TO UPDATE THE PHST WITH APL REC FOR REVRS CASES.

           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           MOVE R9A50-LOAN-EFF-DT           TO L1660-INTERNAL-DATE.
      
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
      
           MOVE L1660-INVERTED-DATE         TO WPHST-PCHST-EFF-IDT-NUM.

      *  SET UP ENDBROWSE KEY
      *
           MOVE ZEROES                      TO WPHST-PCHST-SEQ-NUM.      
           MOVE WPHST-KEY                   TO WPHST-ENDBR-KEY.
           MOVE 999                         TO
                                     WPHST-ENDBR-PCHST-SEQ-NUM.
      
           PERFORM  PHST-1000-BROWSE
               THRU PHST-1000-BROWSE-X.
      
           PERFORM  PHST-2000-READ-NEXT
               THRU PHST-2000-READ-NEXT-X.
            
           IF  WPHST-IO-OK
               MOVE  RPHST-PCHST-SEQ-NUM    TO WS-START-SEQ-NUM
               MOVE  RPHST-PCHST-EFF-IDT-NUM
                                            TO WS-START-DT
               MOVE  RPHST-POL-ACTV-TYP-ID  TO WS-POL-ACTV-TYP-ID
               MOVE  RPHST-PCHST-STAT-CD    TO WS-CURR-STAT-CD
           END-IF.

           PERFORM  PHST-3000-END-BROWSE
               THRU PHST-3000-END-BROWSE-X. 
               
           IF  WS-START-SEQ-NUM = 998
           AND WS-POL-ACTV-TYP-ID ='1910'
               PERFORM  3310-CREAT-REVRS-7021-1
                   THRU 3310-CREAT-REVRS-7021-1-X
               GO TO 3300-CREAT-7021-REVRS-ACTV-X
           ELSE
               IF  WS-START-SEQ-NUM = 997
               AND WS-POL-ACTV-TYP-ID ='1910'
               AND WS-CURR-STAT-HISTORY
                   MOVE 2                   TO WS-COUNT
                   PERFORM  3320-CREAT-REVRS-7021-2
                       THRU 3320-CREAT-REVRS-7021-2-X
                   GO TO 3300-CREAT-7021-REVRS-ACTV-X
               END-IF
           END-IF.
           
           IF  WS-START-SEQ-NUM = 997
           AND WS-POL-ACTV-TYP-ID ='1910'
           AND WS-CURR-STAT-ACTIVE
               PERFORM  3340-CREAT-REVRS-7021-4
                   THRU 3340-CREAT-REVRS-7021-4-X
               GO TO 3300-CREAT-7021-REVRS-ACTV-X
           END-IF.
           
           IF  WS-START-SEQ-NUM = 995
           AND WS-POL-ACTV-TYP-ID ='1910'
           AND WS-CURR-STAT-HISTORY
               PERFORM  3350-CREAT-REVRS-7021-5
                   THRU 3350-CREAT-REVRS-7021-5-X
               GO TO 3300-CREAT-7021-REVRS-ACTV-X
           END-IF.

           PERFORM  3330-CREAT-REVRS-7021-3           
               THRU 3330-CREAT-REVRS-7021-3-X.
           
       3300-CREAT-7021-REVRS-ACTV-X.
           EXIT.
      /
      *------------------------
       3310-CREAT-REVRS-7021-1.
      *------------------------
      * TO UPDATE IN CASE OF ONE REVERSED RECORD
      
           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           MOVE WS-START-SEQ-NUM            TO WPHST-PCHST-SEQ-NUM.
           MOVE WS-START-DT                 TO WPHST-PCHST-EFF-IDT-NUM.           
           
           PERFORM  PHST-1000-READ
               THRU PHST-1000-READ-X.

           MOVE RPHST-REC-INFO              TO WS-HOLD-PHST-REC.
           
           COMPUTE WPHST-PCHST-SEQ-NUM  = WS-START-SEQ-NUM
                                        - 1.
           MOVE WPHST-PCHST-SEQ-NUM         TO RPHST-PCHST-SEQ-NUM.
         
      * TO MOVE THE LATEST RECORD IN PHST UP BY ONE NUMBER.
           PERFORM  PHST-1000-WRITE
               THRU PHST-1000-WRITE-X.

           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           MOVE WS-START-SEQ-NUM            TO WPHST-PCHST-SEQ-NUM.
           MOVE WS-START-DT                 TO WPHST-PCHST-EFF-IDT-NUM.           
           
           PERFORM  PHST-1000-READ-FOR-UPDATE
               THRU PHST-1000-READ-FOR-UPDATE-X.
               
           MOVE R9A50-LOAN-EFF-DT           TO RPHST-PCHST-EFF-DT.
           MOVE R9A50-LOAN-PRCES-DT         TO RPHST-PREV-PRCES-DT.
           SET WS-ACTV-TYP-NEW-APL              TO TRUE.
           MOVE WS-ACTV-TYP-ID              TO RPHST-POL-ACTV-TYP-ID.
           MOVE R9A50-LOAN-SEQ-NUM          TO 
                                            RPHST-PCHST-OLD-VALU-TXT.
           MOVE SPACES                      TO
                                            RPHST-PCHST-NEW-VALU-TXT.
           SET WS-STAT-REVRS                TO TRUE.                                            
           MOVE WS-STAT-CD                  TO RPHST-PCHST-STAT-CD.
           SET WS-PREV-STAT-ACTIVE          TO TRUE.
           MOVE WS-PREV-STAT-CD             TO 
                                            RPHST-PCHST-PREV-STAT-CD.

           PERFORM  PHST-2000-REWRITE
               THRU PHST-2000-REWRITE-X.  
               
       3310-CREAT-REVRS-7021-1-X.
           EXIT.
      /
      *------------------------
       3320-CREAT-REVRS-7021-2.
      *------------------------
           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           MOVE WS-START-SEQ-NUM            TO WPHST-PCHST-SEQ-NUM.
           MOVE WS-START-DT                 TO WPHST-PCHST-EFF-IDT-NUM.           
           
           PERFORM  PHST-1000-READ
               THRU PHST-1000-READ-X.

           MOVE RPHST-REC-INFO              TO WS-HOLD-PHST-REC.
           
           COMPUTE WPHST-PCHST-SEQ-NUM  = WS-START-SEQ-NUM
                                        - WS-COUNT.
           MOVE WPHST-PCHST-SEQ-NUM         TO RPHST-PCHST-SEQ-NUM.
           
      * TO MOVE THE LATEST RECORD IN PHST UP BY ONE NUMBER.
           PERFORM  PHST-1000-WRITE
               THRU PHST-1000-WRITE-X.

           MOVE  R9A50-POL-ID             TO  WPHST-POL-ID.
           MOVE  R9A50-LOAN-EFF-DT        TO  L1660-INTERNAL-DATE.
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE       TO WPHST-PCHST-EFF-IDT-NUM.

           COMPUTE WPHST-PCHST-SEQ-NUM = WS-START-SEQ-NUM - 1.

           PERFORM  PHST-1000-CREATE
               THRU PHST-1000-CREATE-X.
      
           MOVE R9A50-LOAN-EFF-DT         TO L1680-INTERNAL-1.
           MOVE ZERO                      TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO                      TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                      TO L1680-NUMBER-OF-DAYS.
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
           MOVE L1680-INTERNAL-2          TO RPHST-PCHST-EFF-DT.
           MOVE ZEROES                    TO RPHST-CVG-NUM.
           SET WS-STAT-REVRS              TO TRUE.
           MOVE WS-STAT-CD                TO RPHST-PCHST-STAT-CD.
           SET WS-PREV-STAT-ACTIVE        TO TRUE.
           MOVE WS-PREV-STAT-CD           TO RPHST-PCHST-PREV-STAT-CD.
           SET WS-ACTV-TYP-NEW-APL        TO TRUE.
           MOVE WS-ACTV-TYP-ID            TO RPHST-POL-ACTV-TYP-ID.
           MOVE R9A50-LOAN-SEQ-NUM        TO RPHST-PCHST-OLD-VALU-TXT.
           MOVE SPACES                    TO RPHST-PCHST-NEW-VALU-TXT.
           MOVE R9A50-LOAN-PRCES-DT       TO RPHST-PREV-PRCES-DT.
           
           PERFORM  PHST-1000-WRITE
               THRU PHST-1000-WRITE-X.
               
      * TO UPDATE THE EXITING RECORDS
      
           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           COMPUTE WPHST-PCHST-SEQ-NUM   = WS-START-SEQ-NUM + 1.
           MOVE WS-START-DT                 TO WPHST-PCHST-EFF-IDT-NUM.   

           PERFORM  PHST-1000-READ
               THRU PHST-1000-READ-X.

           MOVE RPHST-REC-INFO              TO WS-HOLD-PHST-REC.
           
           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           MOVE WS-START-SEQ-NUM            TO WPHST-PCHST-SEQ-NUM.
           MOVE WS-START-DT                 TO WPHST-PCHST-EFF-IDT-NUM.   

           PERFORM  PHST-1000-READ-FOR-UPDATE
               THRU PHST-1000-READ-FOR-UPDATE-X.         
           
           MOVE WS-HOLD-PHST-REC            TO RPHST-REC-INFO.
           MOVE WS-START-SEQ-NUM            TO RPHST-PCHST-SEQ-NUM.
           
           PERFORM  PHST-2000-REWRITE
               THRU PHST-2000-REWRITE-X. 

           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           COMPUTE WPHST-PCHST-SEQ-NUM   = WS-START-SEQ-NUM + 1.
           MOVE WS-START-DT                 TO WPHST-PCHST-EFF-IDT-NUM.                  
           
           PERFORM  PHST-1000-READ-FOR-UPDATE
               THRU PHST-1000-READ-FOR-UPDATE-X.
               
           MOVE R9A50-LOAN-EFF-DT          TO RPHST-PCHST-EFF-DT.
           MOVE R9A50-LOAN-PRCES-DT        TO RPHST-PREV-PRCES-DT.
           SET WS-PREV-STAT-ACTIVE         TO TRUE.
           MOVE WS-PREV-STAT-CD            TO RPHST-PCHST-PREV-STAT-CD.
           SET WS-ACTV-TYP-NEW-APL         TO TRUE.
           MOVE WS-ACTV-TYP-ID             TO RPHST-POL-ACTV-TYP-ID.
           MOVE R9A50-LOAN-SEQ-NUM         TO RPHST-PCHST-OLD-VALU-TXT.
           MOVE SPACES                     TO RPHST-PCHST-NEW-VALU-TXT.           
           SET WS-STAT-REVRS               TO TRUE.                                            
           MOVE WS-STAT-CD                 TO RPHST-PCHST-STAT-CD.

           PERFORM  PHST-2000-REWRITE
               THRU PHST-2000-REWRITE-X.  

       3320-CREAT-REVRS-7021-2-X.
           EXIT.
      /
      *------------------------
       3330-CREAT-REVRS-7021-3.
      *------------------------

           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           MOVE R9A50-LOAN-EFF-DT           TO L1660-INTERNAL-DATE.
      
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
      
           MOVE L1660-INVERTED-DATE         TO WPHST-PCHST-EFF-IDT-NUM.

      *  SET UP ENDBROWSE KEY
      *
           MOVE ZEROES                      TO WPHST-PCHST-SEQ-NUM.      
           MOVE WPHST-KEY                   TO WPHST-ENDBR-KEY.
           MOVE 999                         TO
                                     WPHST-ENDBR-PCHST-SEQ-NUM.
      
           PERFORM  PHST-1000-BROWSE
               THRU PHST-1000-BROWSE-X.
      
           PERFORM  PHST-2000-READ-NEXT
               THRU PHST-2000-READ-NEXT-X.
            
           IF  WPHST-IO-OK
               MOVE  RPHST-PCHST-SEQ-NUM    TO WS-START-SEQ-NUM
               MOVE  RPHST-PCHST-EFF-IDT-NUM
                                            TO WS-START-DT
           ELSE
               MOVE +999                    TO WS-START-SEQ-NUM
           END-IF.
           
           PERFORM  PHST-3000-END-BROWSE
               THRU PHST-3000-END-BROWSE-X.                 
           MOVE  R9A50-POL-ID               TO  WPHST-POL-ID.
           MOVE  R9A50-LOAN-EFF-DT          TO  L1660-INTERNAL-DATE.
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE       TO WPHST-PCHST-EFF-IDT-NUM.

           SUBTRACT +1                    FROM  WS-START-SEQ-NUM.
           MOVE  WS-START-SEQ-NUM         TO  WPHST-PCHST-SEQ-NUM.
           
           PERFORM  PHST-1000-CREATE
               THRU PHST-1000-CREATE-X.
      
           MOVE R9A50-LOAN-EFF-DT         TO L1680-INTERNAL-1.
           MOVE ZERO                      TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO                      TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                      TO L1680-NUMBER-OF-DAYS.
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
           MOVE L1680-INTERNAL-2          TO RPHST-PCHST-EFF-DT.
           MOVE ZEROES                    TO RPHST-CVG-NUM.
           SET WS-STAT-REVRS              TO TRUE.
           MOVE WS-STAT-CD                TO RPHST-PCHST-STAT-CD.
           SET WS-PREV-STAT-ACTIVE        TO TRUE.
           MOVE WS-PREV-STAT-CD           TO RPHST-PCHST-PREV-STAT-CD.
           SET WS-ACTV-TYP-NEW-APL        TO TRUE.
           MOVE WS-ACTV-TYP-ID            TO RPHST-POL-ACTV-TYP-ID.
           MOVE R9A50-LOAN-SEQ-NUM        TO RPHST-PCHST-OLD-VALU-TXT.
           MOVE SPACES                    TO RPHST-PCHST-NEW-VALU-TXT.
           MOVE R9A50-LOAN-PRCES-DT       TO RPHST-PREV-PRCES-DT.
           
           PERFORM  PHST-1000-WRITE
               THRU PHST-1000-WRITE-X.
           
       3330-CREAT-REVRS-7021-3-X.
           EXIT.
      /
      *------------------------
       3340-CREAT-REVRS-7021-4.
      *------------------------
      
           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           MOVE WS-START-SEQ-NUM            TO WPHST-PCHST-SEQ-NUM.
           MOVE WS-START-DT                 TO WPHST-PCHST-EFF-IDT-NUM.           
           
           PERFORM  PHST-1000-READ
               THRU PHST-1000-READ-X.

           MOVE RPHST-REC-INFO              TO WS-HOLD-PHST-REC.
           
           COMPUTE WPHST-PCHST-SEQ-NUM  = WS-START-SEQ-NUM
                                        - 1.
           MOVE WPHST-PCHST-SEQ-NUM         TO RPHST-PCHST-SEQ-NUM.
           
      * TO MOVE THE LATEST RECORD IN PHST UP BY ONE NUMBER.
           PERFORM  PHST-1000-WRITE
               THRU PHST-1000-WRITE-X.
               
           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           COMPUTE WPHST-PCHST-SEQ-NUM = WS-START-SEQ-NUM + 1.
           MOVE WS-START-DT                 TO WPHST-PCHST-EFF-IDT-NUM.   

           PERFORM  PHST-1000-READ
               THRU PHST-1000-READ-X.

           MOVE RPHST-REC-INFO              TO WS-HOLD-PHST-REC.
               
           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           MOVE WS-START-SEQ-NUM            TO WPHST-PCHST-SEQ-NUM.
           MOVE WS-START-DT                 TO WPHST-PCHST-EFF-IDT-NUM.   
           
           PERFORM  PHST-1000-READ-FOR-UPDATE
               THRU PHST-1000-READ-FOR-UPDATE-X.
               
           MOVE WS-HOLD-PHST-REC            TO RPHST-REC-INFO.
           MOVE WS-START-SEQ-NUM            TO RPHST-PCHST-SEQ-NUM.
           
           PERFORM  PHST-2000-REWRITE
               THRU PHST-2000-REWRITE-X.  
               
           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           COMPUTE WPHST-PCHST-SEQ-NUM = WS-START-SEQ-NUM + 1.
           MOVE WS-START-DT                 TO WPHST-PCHST-EFF-IDT-NUM. 

           PERFORM  PHST-1000-READ-FOR-UPDATE
               THRU PHST-1000-READ-FOR-UPDATE-X.

           MOVE R9A50-LOAN-EFF-DT          TO RPHST-PCHST-EFF-DT.
           MOVE R9A50-LOAN-PRCES-DT        TO RPHST-PREV-PRCES-DT.
           SET WS-PREV-STAT-ACTIVE         TO TRUE.
           MOVE WS-PREV-STAT-CD            TO RPHST-PCHST-PREV-STAT-CD.
           SET WS-ACTV-TYP-NEW-APL         TO TRUE.
           MOVE WS-ACTV-TYP-ID             TO RPHST-POL-ACTV-TYP-ID.
           MOVE R9A50-LOAN-SEQ-NUM         TO RPHST-PCHST-OLD-VALU-TXT.
           MOVE SPACES                     TO RPHST-PCHST-NEW-VALU-TXT.           
           SET WS-STAT-REVRS               TO TRUE.                                            
           MOVE WS-STAT-CD                 TO RPHST-PCHST-STAT-CD.

           PERFORM  PHST-2000-REWRITE
               THRU PHST-2000-REWRITE-X.
               
       3340-CREAT-REVRS-7021-4-X.
           EXIT.
      /
      *------------------------
       3350-CREAT-REVRS-7021-5.
      *------------------------
      
           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           MOVE 996                         TO WPHST-PCHST-SEQ-NUM.
           MOVE WS-START-DT                 TO WPHST-PCHST-EFF-IDT-NUM.
           
           PERFORM  PHST-1000-READ-FOR-UPDATE
               THRU PHST-1000-READ-FOR-UPDATE-X.

           MOVE R9A50-LOAN-EFF-DT          TO RPHST-PCHST-EFF-DT.
           MOVE R9A50-LOAN-PRCES-DT        TO RPHST-PREV-PRCES-DT.
           MOVE ZEROES                     TO RPHST-CVG-NUM.
           SET WS-STAT-REVRS               TO TRUE.
           MOVE WS-STAT-CD                 TO RPHST-PCHST-STAT-CD.
           SET WS-PREV-STAT-ACTIVE         TO TRUE.
           MOVE WS-PREV-STAT-CD            TO RPHST-PCHST-PREV-STAT-CD.
           SET WS-ACTV-TYP-NEW-APL         TO TRUE.
           MOVE WS-ACTV-TYP-ID             TO RPHST-POL-ACTV-TYP-ID.
           MOVE R9A50-LOAN-SEQ-NUM         TO RPHST-PCHST-OLD-VALU-TXT.
           MOVE SPACES                     TO RPHST-PCHST-NEW-VALU-TXT.
           MOVE R9A50-LOAN-PRCES-DT        TO RPHST-PREV-PRCES-DT.

           PERFORM  PHST-2000-REWRITE
               THRU PHST-2000-REWRITE-X.
               
       3350-CREAT-REVRS-7021-5-X.
           EXIT.
      /
      *------------------
       4000-CREAT-CL-REC.
      *------------------
      
           IF  R9A50-LOAN-TRXN-CD = 'L'
           AND R9A50-LOAN-STAT-CD = 'A'
               PERFORM  4100-CREAT-7022-ACTV
                   THRU 4100-CREAT-7022-ACTV-X
               GO TO 4000-CREAT-CL-REC-X
           END-IF.
           
           IF  (R9A50-LOAN-TRXN-CD = 'F'
           OR  R9A50-LOAN-TRXN-CD = 'P')
           AND R9A50-LOAN-STAT-CD = 'A'
               PERFORM  4200-CREAT-7024-ACTV
                   THRU 4200-CREAT-7024-ACTV-X
               GO TO 4000-CREAT-CL-REC-X
           END-IF.
     
           IF  R9A50-LOAN-TRXN-CD = 'L'
           AND R9A50-LOAN-STAT-CD = 'R'
               PERFORM  4300-CREAT-7022-REVRS-ACTV
                   THRU 4300-CREAT-7022-REVRS-ACTV-X
               GO TO 4000-CREAT-CL-REC-X
           END-IF.
           
           IF  R9A50-LOAN-TRXN-CD = 'B'
               PERFORM  4400-CREAT-7024-ACTV-2
                   THRU 4400-CREAT-7024-ACTV-2-X
               GO TO 4000-CREAT-CL-REC-X
           END-IF.
           
           IF  R9A50-LOAN-TRXN-CD = 'A'
               PERFORM  4500-CREAT-7022-ACTV-2
                   THRU 4500-CREAT-7022-ACTV-2-X
               GO TO 4000-CREAT-CL-REC-X
           END-IF.
           
       4000-CREAT-CL-REC-X.
           EXIT.
      /
      *---------------------
       4100-CREAT-7022-ACTV.
      *---------------------
      
           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           MOVE R9A50-LOAN-EFF-DT           TO L1660-INTERNAL-DATE.
      
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
      
           MOVE L1660-INVERTED-DATE         TO WPHST-PCHST-EFF-IDT-NUM.

      *  SET UP ENDBROWSE KEY
      *
           MOVE ZEROES                      TO WPHST-PCHST-SEQ-NUM.      
           MOVE WPHST-KEY                   TO WPHST-ENDBR-KEY.
           MOVE 999                         TO
                                     WPHST-ENDBR-PCHST-SEQ-NUM.

           PERFORM  PHST-1000-BROWSE
               THRU PHST-1000-BROWSE-X.
      
           PERFORM  PHST-2000-READ-NEXT
               THRU PHST-2000-READ-NEXT-X.
            
           IF  WPHST-IO-OK
               MOVE  RPHST-PCHST-SEQ-NUM    TO WS-START-SEQ-NUM
               MOVE  RPHST-PCHST-EFF-IDT-NUM
                                            TO WS-START-DT
           ELSE
               MOVE +999                    TO WS-START-SEQ-NUM
           END-IF.
           
           PERFORM  PHST-3000-END-BROWSE
               THRU PHST-3000-END-BROWSE-X. 
               
           MOVE  R9A50-POL-ID             TO  WPHST-POL-ID.
           MOVE  R9A50-LOAN-EFF-DT        TO  L1660-INTERNAL-DATE.
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE       TO WPHST-PCHST-EFF-IDT-NUM.

           SUBTRACT +1                    FROM  WS-START-SEQ-NUM.
           MOVE  WS-START-SEQ-NUM         TO  WPHST-PCHST-SEQ-NUM.

           PERFORM  PHST-1000-CREATE
               THRU PHST-1000-CREATE-X.
      
           MOVE R9A50-LOAN-EFF-DT         TO L1680-INTERNAL-1.
           MOVE ZERO                      TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO                      TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                      TO L1680-NUMBER-OF-DAYS.
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
           MOVE L1680-INTERNAL-2          TO RPHST-PCHST-EFF-DT.
           MOVE ZEROES                    TO RPHST-CVG-NUM.
           SET WS-STAT-ACTIVE             TO TRUE.
           MOVE WS-STAT-CD                TO RPHST-PCHST-STAT-CD.
           MOVE SPACES                    TO RPHST-PCHST-PREV-STAT-CD.
           SET WS-ACTV-TYP-CL             TO TRUE.
           MOVE WS-ACTV-TYP-ID            TO RPHST-POL-ACTV-TYP-ID.
           MOVE SPACES                    TO RPHST-PCHST-OLD-VALU-TXT.
           MOVE R9A50-LOAN-SEQ-NUM        TO RPHST-PCHST-NEW-VALU-TXT.
           MOVE R9A50-LOAN-PRCES-DT       TO RPHST-PREV-PRCES-DT.
           
           PERFORM  PHST-1000-WRITE
               THRU PHST-1000-WRITE-X.
           
       4100-CREAT-7022-ACTV-X.
           EXIT.
      /
      *---------------------
       4200-CREAT-7024-ACTV.
      *---------------------
      
           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           MOVE R9A50-LOAN-EFF-DT           TO L1660-INTERNAL-DATE.
      
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
      
           MOVE L1660-INVERTED-DATE         TO WPHST-PCHST-EFF-IDT-NUM.

      *  SET UP ENDBROWSE KEY
      *
           MOVE ZEROES                      TO WPHST-PCHST-SEQ-NUM.      
           MOVE WPHST-KEY                   TO WPHST-ENDBR-KEY.
           MOVE 999                         TO
                                     WPHST-ENDBR-PCHST-SEQ-NUM.
      
           PERFORM  PHST-1000-BROWSE
               THRU PHST-1000-BROWSE-X.
      
           PERFORM  PHST-2000-READ-NEXT
               THRU PHST-2000-READ-NEXT-X.
            
           IF  WPHST-IO-OK
               MOVE  RPHST-PCHST-SEQ-NUM    TO WS-START-SEQ-NUM
               MOVE  RPHST-PCHST-EFF-IDT-NUM
                                            TO WS-START-DT
           ELSE
               MOVE +999                    TO WS-START-SEQ-NUM
           END-IF.
           
           PERFORM  PHST-3000-END-BROWSE
               THRU PHST-3000-END-BROWSE-X.  
               
           MOVE  R9A50-POL-ID             TO  WPHST-POL-ID.
           MOVE  R9A50-LOAN-EFF-DT        TO  L1660-INTERNAL-DATE.
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE       TO WPHST-PCHST-EFF-IDT-NUM.

           SUBTRACT +1                    FROM  WS-START-SEQ-NUM.
           MOVE  WS-START-SEQ-NUM         TO  WPHST-PCHST-SEQ-NUM.

           PERFORM  PHST-1000-CREATE
               THRU PHST-1000-CREATE-X.

           MOVE R9A50-LOAN-EFF-DT         TO L1680-INTERNAL-1.
           MOVE ZERO                      TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO                      TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                      TO L1680-NUMBER-OF-DAYS.
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
           MOVE L1680-INTERNAL-2          TO RPHST-PCHST-EFF-DT.
           MOVE ZEROES                    TO RPHST-CVG-NUM.
           SET WS-STAT-ACTIVE             TO TRUE.
           MOVE WS-STAT-CD                TO RPHST-PCHST-STAT-CD.
           MOVE SPACES                    TO RPHST-PCHST-PREV-STAT-CD.
           SET WS-ACTV-TYP-CL-REPAY       TO TRUE.
           MOVE WS-ACTV-TYP-ID            TO RPHST-POL-ACTV-TYP-ID.
           MOVE SPACES                    TO RPHST-PCHST-OLD-VALU-TXT.
           MOVE R9A50-LOAN-SEQ-NUM        TO RPHST-PCHST-NEW-VALU-TXT.
           MOVE R9A50-LOAN-PRCES-DT       TO RPHST-PREV-PRCES-DT.
           
           PERFORM  PHST-1000-WRITE
               THRU PHST-1000-WRITE-X.
           
       4200-CREAT-7024-ACTV-X.
           EXIT.
      /
      *---------------------------
       4300-CREAT-7022-REVRS-ACTV.
      *---------------------------
      
           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           MOVE R9A50-LOAN-EFF-DT           TO L1660-INTERNAL-DATE.
      
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
      
           MOVE L1660-INVERTED-DATE         TO WPHST-PCHST-EFF-IDT-NUM.

      *  SET UP ENDBROWSE KEY
      *
           MOVE ZEROES                      TO WPHST-PCHST-SEQ-NUM.      
           MOVE WPHST-KEY                   TO WPHST-ENDBR-KEY.
           MOVE 999                         TO
                                     WPHST-ENDBR-PCHST-SEQ-NUM.
      
           PERFORM  PHST-1000-BROWSE
               THRU PHST-1000-BROWSE-X.
      
           PERFORM  PHST-2000-READ-NEXT
               THRU PHST-2000-READ-NEXT-X.
            
           IF  WPHST-IO-OK
               MOVE  RPHST-PCHST-SEQ-NUM    TO WS-START-SEQ-NUM
               MOVE  RPHST-PCHST-EFF-IDT-NUM
                                            TO WS-START-DT
           ELSE
               MOVE +999                    TO WS-START-SEQ-NUM
           END-IF.
           
           PERFORM  PHST-3000-END-BROWSE
               THRU PHST-3000-END-BROWSE-X.    
               
           MOVE  R9A50-POL-ID             TO  WPHST-POL-ID.
           MOVE  R9A50-LOAN-EFF-DT        TO  L1660-INTERNAL-DATE.
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE       TO WPHST-PCHST-EFF-IDT-NUM.

           PERFORM  PHST-1000-CREATE
               THRU PHST-1000-CREATE-X.

           SUBTRACT +1                    FROM  WS-START-SEQ-NUM.
           MOVE  WS-START-SEQ-NUM         TO  WPHST-PCHST-SEQ-NUM.
      
           MOVE R9A50-LOAN-EFF-DT         TO L1680-INTERNAL-1.
           MOVE ZERO                      TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO                      TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                      TO L1680-NUMBER-OF-DAYS.
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
           MOVE L1680-INTERNAL-2          TO RPHST-PCHST-EFF-DT.
           MOVE ZEROES                    TO RPHST-CVG-NUM.
           SET WS-STAT-REVRS              TO TRUE.
           MOVE WS-STAT-CD                TO RPHST-PCHST-STAT-CD.
           SET WS-PREV-STAT-ACTIVE        TO TRUE.
           MOVE WS-PREV-STAT-CD           TO RPHST-PCHST-PREV-STAT-CD.           
           SET WS-ACTV-TYP-CL             TO TRUE.
           MOVE WS-ACTV-TYP-ID            TO RPHST-POL-ACTV-TYP-ID.
           MOVE R9A50-LOAN-SEQ-NUM        TO RPHST-PCHST-OLD-VALU-TXT.
           MOVE SPACES                    TO RPHST-PCHST-NEW-VALU-TXT.
           MOVE R9A50-LOAN-PRCES-DT       TO RPHST-PREV-PRCES-DT.
           
           PERFORM  PHST-1000-WRITE
               THRU PHST-1000-WRITE-X.
           
       4300-CREAT-7022-REVRS-ACTV-X.
           EXIT.
      /
      *-----------------------
       4400-CREAT-7024-ACTV-2.
      *-----------------------
           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           MOVE R9A50-LOAN-EFF-DT           TO L1660-INTERNAL-DATE.
      
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
      
           MOVE L1660-INVERTED-DATE         TO WPHST-PCHST-EFF-IDT-NUM.

      *  SET UP ENDBROWSE KEY
      *
           MOVE ZEROES                      TO WPHST-PCHST-SEQ-NUM.      
           MOVE WPHST-KEY                   TO WPHST-ENDBR-KEY.
           MOVE 999                         TO
                                     WPHST-ENDBR-PCHST-SEQ-NUM.
      
           PERFORM  PHST-1000-BROWSE
               THRU PHST-1000-BROWSE-X.
      
           PERFORM  PHST-2000-READ-NEXT
               THRU PHST-2000-READ-NEXT-X.
            
           IF  WPHST-IO-OK
               MOVE  RPHST-PCHST-SEQ-NUM    TO WS-START-SEQ-NUM
               MOVE  RPHST-PCHST-EFF-IDT-NUM
                                            TO WS-START-DT
           ELSE
               MOVE +999                    TO WS-START-SEQ-NUM
           END-IF.
           
           PERFORM  PHST-3000-END-BROWSE
               THRU PHST-3000-END-BROWSE-X.
               
           MOVE  R9A50-POL-ID             TO  WPHST-POL-ID.
           MOVE  R9A50-LOAN-EFF-DT        TO  L1660-INTERNAL-DATE.
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE       TO WPHST-PCHST-EFF-IDT-NUM.

           SUBTRACT +1                    FROM  WS-START-SEQ-NUM.
           MOVE  WS-START-SEQ-NUM         TO  WPHST-PCHST-SEQ-NUM.

           PERFORM  PHST-1000-CREATE
               THRU PHST-1000-CREATE-X.

           MOVE R9A50-LOAN-EFF-DT         TO L1680-INTERNAL-1.
           MOVE ZERO                      TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO                      TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                      TO L1680-NUMBER-OF-DAYS.
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
           MOVE L1680-INTERNAL-2          TO RPHST-PCHST-EFF-DT.
           MOVE ZEROES                    TO RPHST-CVG-NUM.
           SET WS-STAT-ACTIVE             TO TRUE.
           MOVE WS-STAT-CD                TO RPHST-PCHST-STAT-CD.
           MOVE SPACES                    TO RPHST-PCHST-PREV-STAT-CD.
           SET WS-ACTV-TYP-CL-REPAY       TO TRUE.
           MOVE WS-ACTV-TYP-ID            TO RPHST-POL-ACTV-TYP-ID.
           MOVE SPACES                    TO RPHST-PCHST-OLD-VALU-TXT.
           MOVE R9A50-LOAN-SEQ-NUM        TO RPHST-PCHST-NEW-VALU-TXT.
           MOVE R9A50-LOAN-PRCES-DT       TO RPHST-PREV-PRCES-DT.
           
           PERFORM  PHST-1000-WRITE
               THRU PHST-1000-WRITE-X.
               
       4400-CREAT-7024-ACTV-2-X.
           EXIT.
      /
      *-----------------------
       4500-CREAT-7022-ACTV-2.
      *-----------------------

           MOVE R9A50-POL-ID                TO WPHST-POL-ID.
           MOVE R9A50-LOAN-EFF-DT           TO L1660-INTERNAL-DATE.
      
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
      
           MOVE L1660-INVERTED-DATE         TO WPHST-PCHST-EFF-IDT-NUM.

      *  SET UP ENDBROWSE KEY
      *
           MOVE ZEROES                      TO WPHST-PCHST-SEQ-NUM.      
           MOVE WPHST-KEY                   TO WPHST-ENDBR-KEY.
           MOVE 999                         TO
                                     WPHST-ENDBR-PCHST-SEQ-NUM.
      
           PERFORM  PHST-1000-BROWSE
               THRU PHST-1000-BROWSE-X.
      
           PERFORM  PHST-2000-READ-NEXT
               THRU PHST-2000-READ-NEXT-X.
               
           IF  WPHST-IO-OK
               MOVE  RPHST-PCHST-SEQ-NUM    TO WS-START-SEQ-NUM
               MOVE  RPHST-PCHST-EFF-IDT-NUM
                                            TO WS-START-DT
           ELSE
               MOVE +999                    TO WS-START-SEQ-NUM
           END-IF.
           
           PERFORM  PHST-3000-END-BROWSE
               THRU PHST-3000-END-BROWSE-X.   
               
           MOVE  R9A50-POL-ID             TO  WPHST-POL-ID.
           MOVE  R9A50-LOAN-EFF-DT        TO  L1660-INTERNAL-DATE.
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE       TO WPHST-PCHST-EFF-IDT-NUM.

           SUBTRACT +1                    FROM  WS-START-SEQ-NUM.
           MOVE  WS-START-SEQ-NUM         TO  WPHST-PCHST-SEQ-NUM.

           PERFORM  PHST-1000-CREATE
               THRU PHST-1000-CREATE-X.  

           MOVE R9A50-LOAN-EFF-DT         TO L1680-INTERNAL-1.
           MOVE ZERO                      TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO                      TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                      TO L1680-NUMBER-OF-DAYS.
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
           MOVE L1680-INTERNAL-2          TO RPHST-PCHST-EFF-DT.
           MOVE ZEROES                    TO RPHST-CVG-NUM.
           SET WS-STAT-ACTIVE             TO TRUE.
           MOVE WS-STAT-CD                TO RPHST-PCHST-STAT-CD.
           MOVE SPACES                    TO RPHST-PCHST-PREV-STAT-CD.
           SET WS-ACTV-TYP-CL             TO TRUE.
           MOVE WS-ACTV-TYP-ID            TO RPHST-POL-ACTV-TYP-ID.
           MOVE SPACES                    TO RPHST-PCHST-OLD-VALU-TXT.
           MOVE R9A50-LOAN-SEQ-NUM        TO RPHST-PCHST-NEW-VALU-TXT.
           MOVE R9A50-LOAN-PRCES-DT       TO RPHST-PREV-PRCES-DT.
           
           PERFORM  PHST-1000-WRITE
               THRU PHST-1000-WRITE-X. 
               
       4500-CREAT-7022-ACTV-2-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  9A50-4000-CLOSE
               THRU 9A50-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************
      *               I/O PROCESSING COPYBOOKS                        *
      *****************************************************************
       COPY CCPAPHST.
       COPY CCPBPHST.
       COPY CCPCPHST.
       COPY CCPUPHST.
       COPY CCPVPHST.
       COPY CCPNPHST.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY 9A50
                               ==':PGM:'== BY =='ZSRQ9A50'==.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY  ==9A50==.
       COPY XCSOFILE REPLACING ==:ID:==  BY 9A50.
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
      *                END OF PROGRAM ZSBM9A50                        *
      *****************************************************************