      *****************************************************************
      **  MEMBER :  ZSBM9ETH                                         **
      **  REMARKS:  UPDATE THE NEWLY ADDED FIELDS IN TH TABLE        **
      **                                                             **
      **  DOMAIN :  PR                                               **
      **  CLASS  :  BC                                               **
      *****************************************************************
      **  DATE     AUTH   DESCRIPTION                                **
      **                                                             **
UYS026**  28SEP20  CTS    INITIAL VERSION                            **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBM9ETH.

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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM9ETH'.
      /
       COPY XCWWWKDT.
       COPY CCWWINDX.
       COPY SQLCA.
      /
       01  WS-PGM-WORK-AREA.
           05  WS-USER-UYS026               PIC X(08)
                                            VALUE 'UYS026'.
           05  WS-POL-CVG-REC-CTR           PIC X(02).
           05  WS-POL-CVG-REC-CTR-N         REDEFINES
               WS-POL-CVG-REC-CTR           PIC 9(02).
           05  WS-CVG-NUM                   PIC 9(02).
           05  WS-CVG                       PIC 9(02).
           05  WS-INPUT-CVG-NUM             PIC 9(02).
           05  WS-CVG-WP-PREM-AMT           PIC S9(13)V9(2) COMP-3.
           05  WS-PREV-WP-PREM-AMT          PIC S9(13)V9(2) COMP-3.
           05  WS-INSTANCE-ID               PIC X(03).
           05  WS-POL-PREV-BILL-CD          PIC X(01).
           05  WS-CTL-CARD.
               10  CTL-PGM                      PIC X(08).
               10  FILLER                       PIC X(01).
               10  FILLER                       PIC X(70).
           05  WS-CTL-CARD-03 REDEFINES WS-CTL-CARD.
               10 CTL-REC                       PIC X(06).
               10 FILLER                        PIC X(01).
               10 CTL-START-POLICY              PIC X(10).
               10 FILLER                        PIC X.
               10 CTL-FINISH-POLICY             PIC X(10).
               10 FILLER                        PIC X.
               10 CTL-INSTANCE-ID               PIC X(03).

       01  WS-MSGS-TXT                      PIC X(80).
               88  WS-MSGS-ZS9ETH0001       VALUE
              'ONE-TIME TRANSITION JOB FOR UPDATING TH RECORDS'.
               88  WS-MSGS-ZS9ETH0002       VALUE
              'NO RECORDS TO PROCESS'.
               88  WS-MSGS-ZS9ETH0003       VALUE
              'PROCESSING POLICY NO @1'.
               88  WS-MSGS-ZS9ETH0004       VALUE
              'NO TTH RECORD - SKPI POLICY NO @1'.
       01   WS-CTL-POLICY.
           05  WS-START-POLICY              PIC X(10).
           05  WS-FINISH-POLICY             PIC X(10).

       01  WS-PCHST-INFO                    OCCURS 10 TIMES.
           05  WS-START-DT                  PIC X(10).
           05  WS-START-DT-R                  REDEFINES
               WS-START-DT.
               15  WS-START-DT-YR             PIC 9(04).
               15  FILLER                     PIC X(01).
               15  WS-START-DT-MO             PIC 9(02).
               15  FILLER                     PIC X(01).
               15  WS-START-DT-DY             PIC 9(02).
           05  WS-END-DT                     PIC X(10).
           05  WS-END-DT-R                  REDEFINES
               WS-END-DT.
               15  WS-END-DT-YR             PIC 9(04).
               15  FILLER                     PIC X(01).
               15  WS-END-DT-MO                PIC 9(02).
               15  FILLER                     PIC X(01).
               15  WS-END-DT-DY               PIC 9(02).
           05  WS-PREV-BILL-TYP-CD           PIC X(01).
           05  WS-POL-BILL-TYP-CD            PIC X(01).
       01  WORK-STORE-SPACES.
           05  FILLER                       PIC X(10) VALUE SPACES.

      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY CCFRTH.
       COPY CCFWTH.
       COPY CCWWCCC. 
      /
       COPY CCFRPH.
       COPY CCFWPH.
       COPY CCFWCVG.
       COPY CCFRCVG.
       
       COPY CCFWPOLB.
      /
       COPY CCFWPHST.
       COPY CCFRPHST.
       COPY ZCFW9ETH.
       COPY ZCFWWPTH.
      /
       COPY CCFWPHS3.
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.
      /
       COPY XCWWCKPT.
           05  WCKPT-TBL-KEY-AREA.
               10  WCKPT-TBL-NM                  PIC X(04).
               10  WCKPT-KEY-VALU                PIC X(50).
           05  WCKPT-INPUT-PARM-AREA.
               10  WCKPT-WORK-STORE-SPACES       PIC X(102).
           05  WCKPT-TOTAL-AREA.
               10 FILLER                         PIC X(01).
           05  WCKPT-OTHER-AREA.
               10 FILLER                         PIC X(84).
      ***********************************************************
      * CALLED MODULE PARAMETER INFORMATION
      ***********************************************************
      /
       COPY XCWL1680.
       COPY XCWL1670.
       COPY CCWL0186.
       COPY XCWL0289.
       COPY XCWL0800.
       COPY XCWL1610.
       COPY XCWL1580.
      /
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
       COPY CCFRPOL.
      /
       COPY CCWWCVGS.
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
               THRU 2000-PRCES-INPUT-RECORDS-X.

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

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.


       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       1000-INITIALIZE.
      *----------------

           MOVE 'CP'                        TO WGLOB-COMPANY-CODE.

           MOVE WPGWS-CRNT-PGM-ID           TO WGLOB-MAIN-PGM-ID
                                               WGLOB-CRNT-PGM-ID.
      
      **   READ THE COMPANY CONTROL CARD
      
           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

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
           SET  WS-MSGS-ZS9ETH0001          TO TRUE.
           MOVE WS-MSGS-TXT                 TO L0040-PROGRAM-DESC.

           MOVE ZERO                        TO L0040-ERROR-CNT.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.
               PERFORM  BCF-1000-READ
                   THRU BCF-1000-READ-X
      
      **   IF THE RANGE IS NOT FOUND, ABORT THE RUN
               IF  WBCF-SEQ-IO-EOF
      *MSG:  POLICY RANGE CONTROL CARD MISSING
                   MOVE 'CS9D779004'        TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
                   PERFORM  0030-4000-CTL-CARD-ERROR
                       THRU 0030-4000-CTL-CARD-ERROR-X
               END-IF
      
      **   EDIT THE DATES CONTROL CARD
               MOVE RBCF-SEQ-REC-INFO       TO WS-CTL-CARD
               
      
           MOVE CTL-START-POLICY            TO WS-START-POLICY.
           MOVE CTL-FINISH-POLICY           TO WS-FINISH-POLICY.
           MOVE CTL-INSTANCE-ID             TO WS-INSTANCE-ID.
      **   CKPT CONTROL STARTS HERE
           PERFORM  CKPT-CHECK-RESTART-INIT
               THRU CKPT-CHECK-RESTART-INIT-X.

           PERFORM  0800-1000-BUILD-PARM-INFO
               THRU 0800-1000-BUILD-PARM-INFO-X.

           MOVE WPGWS-CRNT-PGM-ID           TO L0800-CHKPT-PGM-ID.
           MOVE WGLOB-CHKPT-INSTC-ID        TO L0800-CHKPT-INSTC-ID.
           MOVE WGLOB-COMPANY-CODE          TO L0800-CO-ID.
           MOVE LENGTH OF WCKPT-WORK-AREA   TO 
                                            L0800-CHKPT-WRK-INFO-LEN.

           PERFORM  0800-1000-INIT-CKPT
               THRU 0800-1000-INIT-CKPT-X.

           MOVE W9ETH-TABLE-NAME             TO WCKPT-TBL-NM.
           
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
           END-IF.
      
      **   MSG:'RUN INSTANCE NUMBER   : @1'
           MOVE 'CS9D779005'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-INSTANCE-ID              TO WGLOB-MSG-PARM (1).
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                      TO L0040-INPUT-LINE.

      **   MSG:'STARTING POLICY NUMBER: @1'
           MOVE 'CS9D779006'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-START-POLICY             TO WGLOB-MSG-PARM (1).
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                      TO L0040-INPUT-LINE.

      **   MSG:'ENDING POLICY NUMBER  : @1'
           MOVE 'CS9D779007'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-FINISH-POLICY            TO WGLOB-MSG-PARM (1).
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                      TO L0040-INPUT-LINE.

           IF  CTL-INSTANCE-ID < '001'
           OR  CTL-INSTANCE-ID > '099'
      **       MSG:  CONTROL CARD INVALID
               MOVE 'CS9D779008'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-4000-CTL-CARD-ERROR
                   THRU 0030-4000-CTL-CARD-ERROR-X
           ELSE
               MOVE CTL-INSTANCE-ID         TO WGLOB-CHKPT-INSTC-ID
           END-IF.


       1000-INITIALIZE-X.
           EXIT.
      /
      *-------------------------
       2000-PRCES-INPUT-RECORDS.
      *-------------------------


           INITIALIZE WS-PGM-WORK-AREA.
           


           MOVE LOW-VALUES                  TO WPOLB-KEY.
           MOVE WS-START-POLICY             TO WPOLB-POL-ID.
           MOVE WWKDT-LOW-DT                TO WPOLB-VCF-LAST-UPDT-DT.
           MOVE HIGH-VALUES                 TO WPOLB-ENDBR-KEY.
           MOVE WS-FINISH-POLICY             TO WPOLB-ENDBR-POL-ID.
           MOVE WWKDT-HIGH-DT               TO
                                         WPOLB-ENDBR-VCF-LAST-UPDT-DT.

           SET  WPOLB-POL-BUS-CLAS-TRAD     TO TRUE.
           MOVE WPOLB-POL-BUS-CLAS-CD       TO
                                         WPOLB-ENDBR-POL-BUS-CLAS-CD.

           PERFORM  POLB-1000-TBL-BROWSE
               THRU POLB-1000-TBL-BROWSE-X.

           IF NOT WPOLB-IO-OK
              GO TO 2000-PRCES-INPUT-RECORDS-X
           END-IF.

           PERFORM  POLB-2000-TBL-READ-NEXT
               THRU POLB-2000-TBL-READ-NEXT-X.

           PERFORM  2100-PROCESS-POLICY
               THRU 2100-PROCESS-POLICY-X
               UNTIL NOT WPOLB-IO-OK.

           IF NOT WPOLB-IO-EOF
      *MSG: ERROR ENCOUNTERED WHEN FETCHING TRADITIONAL POLICIES
      *    (LAST POLICY: @1)
               MOVE 'CS9A870007'            TO WGLOB-MSG-REF-INFO
               MOVE RPOL-KEY                TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           PERFORM  POLB-3000-TBL-END-BROWSE
               THRU POLB-3000-TBL-END-BROWSE-X.
               
       2000-PRCES-INPUT-RECORDS-X.
           EXIT.
      /
      *--------------------
       2100-PROCESS-POLICY.
      *---------------------
       
      *MSG: PROCESSING POLICY NO @1
            MOVE SPACES                      TO L0040-INPUT-LINE.
            SET  WS-MSGS-ZS9ETH0003          TO TRUE.
            STRING WS-MSGS-TXT  DELIMITED BY '  '
                   ' '          DELIMITED BY SIZE
                RPOL-POL-ID              INTO L0040-INPUT-LINE.
            PERFORM  0040-3000-WRITE-OTHER
                THRU 0040-3000-WRITE-OTHER-X.
 
            PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
                THRU CVGS-1000-LOAD-CVGS-ARRAY-X.
                
      
           MOVE RPOL-POL-ID                 TO WTH-POL-ID.
           MOVE RPOL-POL-ISS-EFF-DT         TO WTH-PREM-PD-DT-NUM.
           MOVE ZERO                        TO WTH-PREM-PD-DT-NUM-DY.
           MOVE 01                          TO WTH-CVG-NUM-N.
           PERFORM  TH-1000-READ
               THRU TH-1000-READ-X.

           IF  NOT  WTH-IO-OK
      *MSG: PROCESSING POLICY NO @1
            MOVE SPACES                      TO L0040-INPUT-LINE
               SET  WS-MSGS-ZS9ETH0004          TO TRUE
               STRING WS-MSGS-TXT  DELIMITED BY '  '
                   ' '          DELIMITED BY SIZE
               RPOL-POL-ID              INTO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                  THRU 0040-3000-WRITE-OTHER-X
	       PERFORM  POLB-2000-TBL-READ-NEXT
                   THRU POLB-2000-TBL-READ-NEXT-X
               GO TO 2100-PROCESS-POLICY-X
           END-IF.
           
            PERFORM  3100-CHK-IF-BILL-TYP-CHNG
                THRU 3100-CHK-IF-BILL-TYP-CHNG-X.
 
            IF  I = ZERO
                ADD +1                      TO I
                MOVE RPOL-POL-PD-TO-DT-NUM  TO WS-END-DT(I)
                MOVE RPOL-POL-BILL-TYP-CD   TO WS-POL-BILL-TYP-CD (I)
                MOVE RPOL-POL-ISS-EFF-DT    TO WS-START-DT(I)
                MOVE I                      TO J
            ELSE
                IF  RPOL-POL-ISS-EFF-DT (1:7) = WS-START-DT(I)(1:7)
                    NEXT SENTENCE
                END-IF
                MOVE WS-START-DT(I)         TO L1680-INTERNAL-1
                MOVE 01                     TO L1680-NUMBER-OF-MONTHS
                MOVE ZERO                   TO L1680-NUMBER-OF-DAYS
                MOVE ZERO                   TO L1680-NUMBER-OF-YEARS
                PERFORM  1680-6000-SUB-M-FROM-DATE
                    THRU 1680-6000-SUB-M-FROM-DATE-X
                ADD +1                      TO I
                MOVE L1680-INTERNAL-2       TO WS-END-DT(I)
                MOVE RPOL-POL-ISS-EFF-DT    TO WS-START-DT(I)

                MOVE WS-PREV-BILL-TYP-CD (J) 
                                            TO WS-POL-BILL-TYP-CD (I)
                MOVE I                      TO J
           END-IF.
            
            MOVE SPACES                     TO WS-POL-PREV-BILL-CD
            PERFORM  2200-VALIDATE-INPUT-REC
                THRU 2200-VALIDATE-INPUT-REC-X
                VARYING I FROM 1 BY 1
                UNTIL I > J.
                
           MOVE RPOL-POL-PD-TO-DT-NUM  TO L1680-INTERNAL-1
           MOVE 01                     TO L1680-NUMBER-OF-MONTHS
           MOVE ZERO                   TO L1680-NUMBER-OF-DAYS
           MOVE ZERO                   TO L1680-NUMBER-OF-YEARS
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X
           ADD +1                           TO I
           MOVE L1680-INTERNAL-2            TO WS-START-DT(I)
           MOVE WGLOB-PROCESS-DATE          TO WS-END-DT(I)
           MOVE SPACES                      TO WS-POL-BILL-TYP-CD (I)
          MOVE RPOL-POL-BILL-TYP-CD         TO WS-POL-PREV-BILL-CD
           PERFORM  2200-VALIDATE-INPUT-REC
               THRU 2200-VALIDATE-INPUT-REC-X   
                
           PERFORM  3200-UPDATE-WP-PREM
               THRU 3200-UPDATE-WP-PREM-X
               VARYING I FROM 1 BY 1
               UNTIL I > RPOL-POL-CVG-REC-CTR-N.
               
      * SET THE CKPT PARMS TO START AT NEXT RECORD
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

           PERFORM  POLB-2000-TBL-READ-NEXT
               THRU POLB-2000-TBL-READ-NEXT-X.
 
       
       2100-PROCESS-POLICY-X.
           EXIT.
      /
      *------------------------
       2200-VALIDATE-INPUT-REC.
      *-----------------------
      
                      
           MOVE HIGH-VALUES                 TO W9ETH-KEY.
           MOVE RPOL-POL-ID                 TO W9ETH-POL-ID.
           MOVE '00'                        TO WS-START-DT-DY(I)
                                               WS-END-DT-DY(I).
           MOVE WS-START-DT(I)              TO W9ETH-STRT-PREM-PD-DT-NUM.
           MOVE WS-END-DT(I)                TO
                                            W9ETH-END-PREM-PD-DT-NUM.
           MOVE WS-POL-BILL-TYP-CD (I)      TO W9ETH-POL-BILL-TYP-CD.
           MOVE WS-POL-PREV-BILL-CD         TO W9ETH-PREV-BILL-TYP-CD.

           PERFORM  9ETH-2000-UPDATE
               THRU 9ETH-2000-UPDATE-X.


       2200-VALIDATE-INPUT-REC-X.
           EXIT.
      /
      
      *--------------------------
       3100-CHK-IF-BILL-TYP-CHNG.
      *--------------------------
      *
      *  FIND PHST RECORD
      *
           MOVE ZERO                        TO I.
           MOVE RPOL-POL-ID                 TO WPHS3-POL-ID.
           MOVE '1003'                      TO WPHS3-POL-ACTV-TYP-ID.
           MOVE 'O'                         TO WPHS3-PCHST-STAT-CD.
           MOVE RPOL-POL-PD-TO-DT-NUM       TO WPHS3-PCHST-EFF-DT.
      *
      *  SET UP ENDBROWSE KEY
      *
           MOVE WPHS3-KEY                   TO WPHS3-ENDBR-KEY.
           MOVE WWKDT-LOW-DT                TO WPHS3-ENDBR-PCHST-EFF-DT.

           PERFORM  PHS3-1000-BROWSE-PREV
               THRU PHS3-1000-BROWSE-PREV-X.
      
           IF NOT WPHS3-IO-OK
               GO TO 3100-CHK-IF-BILL-TYP-CHNG-X
           END-IF.

           IF WPHS3-IO-OK
               PERFORM  PHS3-2000-READ-PREV
                   THRU PHS3-2000-READ-PREV-X
               IF WPHS3-IO-OK
                   PERFORM  3150-FIND-PHST
                       THRU 3150-FIND-PHST-X
                       UNTIL WPHS3-IO-EOF
               END-IF
               PERFORM  PHS3-3000-END-BROWSE-PREV
                   THRU PHS3-3000-END-BROWSE-PREV-X
           END-IF.

       3100-CHK-IF-BILL-TYP-CHNG-X.
           EXIT.
      /
      *---------------
       3150-FIND-PHST.
      *---------------

           ADD +1                           TO I.
           MOVE RPHST-PCHST-EFF-DT          TO WS-START-DT(I).
           IF  WS-START-DT-DY (I) > RPOL-POL-ISS-EFF-DT-DY
 
              MOVE WS-START-DT (I)        TO L1680-INTERNAL-1
              MOVE 01                     TO L1680-NUMBER-OF-MONTHS
              MOVE ZERO                   TO L1680-NUMBER-OF-DAYS
              MOVE ZERO                   TO L1680-NUMBER-OF-YEARS
              PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
                  THRU 1680-3000-ADD-Y-M-D-TO-DATE-X
              MOVE L1680-INTERNAL-2       TO WS-START-DT(I)
           END-IF
           IF  I = 1
               MOVE RPOL-POL-PD-TO-DT-NUM   TO WS-END-DT (I)
           ELSE
                MOVE WS-START-DT(J)         TO L1680-INTERNAL-1
                MOVE 01                     TO L1680-NUMBER-OF-MONTHS
                MOVE ZERO                   TO L1680-NUMBER-OF-DAYS
                MOVE ZERO                   TO L1680-NUMBER-OF-YEARS
                PERFORM  1680-6000-SUB-M-FROM-DATE
                    THRU 1680-6000-SUB-M-FROM-DATE-X
                MOVE L1680-INTERNAL-2       TO WS-END-DT(I)
           END-IF
           MOVE RPHST-PCHST-NEW-VALU-TXT    TO WS-POL-BILL-TYP-CD (I).         
           MOVE RPHST-PCHST-OLD-VALU-TXT    TO WS-PREV-BILL-TYP-CD (I).
           
           MOVE I                           TO J.
                                            
           PERFORM  PHS3-2000-READ-PREV
               THRU PHS3-2000-READ-PREV-X.

       3150-FIND-PHST-X.
           EXIT.
      /
      *-------------------
       3200-UPDATE-WP-PREM.
      *--------------------
          
           IF  WCVGS-CVG-WP-PREM-AMT (I) = ZERO
               GO TO 3200-UPDATE-WP-PREM-X
           END-IF.
           
           MOVE RPOL-POL-ID                 TO WWPTH-POL-ID.
           MOVE I                           TO WWPTH-CVG-NUM-N.
           
           COMPUTE  WWPTH-CVG-WP-PREM-AMT = WCVGS-CVG-WP-PREM-AMT (I)
                                             * RPOL-POL-BILL-MODE-CD-N
                                          / 12.
           
           PERFORM  WPTH-2000-UPDATE
               THRU WPTH-2000-UPDATE-X.
           
       
       3200-UPDATE-WP-PREM-X.
           EXIT.
      /
      *-----------------------
       8000-RESTORE-CKPT-DATA.
      *-----------------------

           MOVE L0800-CHKPT-WRK-INFO-TEXT   TO WCKPT-WORK-AREA.
           MOVE WCKPT-KEY-VALU              TO WS-START-POLICY.
           MOVE WCKPT-WORK-STORE-SPACES     TO WORK-STORE-SPACES.

       8000-RESTORE-CKPT-DATA-X.
           EXIT.
      /

      *--------------------
       8100-SAVE-CKPT-DATA.
      *--------------------

           MOVE RPOL-POL-ID                 TO WCKPT-KEY-VALU.
           MOVE WORK-STORE-SPACES           TO WCKPT-WORK-STORE-SPACES.
           MOVE WCKPT-WORK-AREA             TO 
                                            L0800-CHKPT-WRK-INFO-TEXT.

       8100-SAVE-CKPT-DATA-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
      /
       COPY NCPPCVGS.
       COPY CCPPCCC.
       COPY CCPPMIDT.
       COPY CCPPPLIN.
       COPY CCPNPH.
       COPY CCPNTH.
       COPY CCPNCVG.
       COPY CCPUTH.
       COPY CCPVTH.
       COPY CCPVPHS3.
       COPY CCPTPOLB.
       COPY ZCPU9ETH.
       COPY ZCPUWPTH.
       COPY XCPPCKPT.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY BCF
                               ==':PGM:'== BY =='XSRQBCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY BCF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY BCF.
      /
      *****************************************************************
      *               I/O PROCESSING COPYBOOKS                        *
      *****************************************************************
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
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
       COPY XCPL1680.
      /
       COPY XCPL0289.
       COPY CCPS0186.
       COPY CCPL0186.
       COPY XCPS0800.
       COPY XCPL0800.
       COPY XCPL1610.
       COPY XCPL1580.
      *****************************************************************
      *                END OF PROGRAM ZSBM9A51                        *
      *****************************************************************