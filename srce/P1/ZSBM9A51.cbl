      *****************************************************************
      **  MEMBER :  ZSBM9A51                                         **
      **  REMARKS:  UPDATES THE NEWLY ADDED FIELDS IN TH TABLE       **
      **                                                             **
      **  DOMAIN :  PR                                               **
      **  CLASS  :  BC                                               **
      *****************************************************************
      **  DATE     AUTH   DESCRIPTION                                **
      **                                                             **
M166T1**  22FEB12  CTS    INITIAL VERSION                            **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBM9A51.

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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM9A51'.
      /
       COPY XCWWWKDT.
       COPY CCWWINDX.        
       COPY SQLCA.
      /
       01  WS-PGM-WORK-AREA.
           05  WS-USER-M166T1               PIC X(08)
                                            VALUE 'M166T1'.
           05  WS-INPUT-REC-INFO            PIC X(42).
           05  WS-CNVR-P-AMT                PIC S9(13)V99 COMP-3.
           05  WS-NO-RENW-CNVR-P-AMT        PIC S9(13)V99 COMP-3.
           05  WS-SSTD-CNVR-P-AMT           PIC S9(13)V99 COMP-3.
           05  WS-AFYC-SSTD-CNVR-P-AMT      PIC S9(13)V99 COMP-3.
           05  WS-CVG-STD-PREM-AMT          PIC S9(13)V99 COMP-3.
           05  WS-CVG-SSTD-PREM-AMT         PIC S9(13)V99 COMP-3.
           05  WS-STD-MPREM-AMT             PIC S9(13)V99 COMP-3.
           05  WS-BAND-USE-AMT              PIC S9(13)V99 COMP-3.
           05  WS-AFYC-RT                   PIC S9(09)V9(06) COMP-3.
           05  WS-NON-RENW-RT               PIC S9(09)V9(06) COMP-3.
           05  WS-SSTD-RT                   PIC S9(09)V9(06) COMP-3.
           05  WS-RT-TYP-CD                 PIC X(05).
               88  WS-RT-TYP-CMTRD          VALUE 'CMTRD'.
               88  WS-RT-TYP-EPCMT          VALUE 'EPCMT'.
           05  WS-BILL-MODE-CD              PIC X(02).
               88  WS-BILL-MODE-MTHLY       VALUE '01'.
               88  WS-BILL-MODE-SEMI-ANN    VALUE '06'.
               88  WS-BILL-MODE-ANN         VALUE '12'.
           05  WS-POL-CVG-REC-CTR           PIC X(02).
           05  WS-POL-CVG-REC-CTR-N         REDEFINES
               WS-POL-CVG-REC-CTR           PIC 9(02).
           05  WS-CVG-NUM                   PIC 9(02).
           05  WS-ACCUM-SSTD-PREM-AMT       PIC S9(13)V99 COMP-3.
           05  WS-ACCUM-MPREM-AMT           PIC S9(13)V99 COMP-3.
           05  WS-ISSUE-HDB-AMT             PIC S9(13)V99 COMP-3.               
           05  WS-CVG                       PIC 9(02).
           05  WS-POL-BILL-MODE-CD          PIC 9(02).
           05  WS-PD-TO-DT-NUM	            PIC X(10).
           05  WS-PD-TO-DT-NUM-R            REDEFINES
               WS-PD-TO-DT-NUM.
               10  WS-PD-TO-DT-NUM-YR       PIC 9(04).
               10  FILLER                   PIC X(01).
               10  WS-PD-TO-DT-NUM-MO       PIC 9(02).
               10  FILLER                   PIC X(01).
               10  WS-PD-TO-DT-NUM-DY       PIC 9(02).
           05  WS-INPUT-CVG-NUM             PIC 9(02).
           05  WS-TRADL-AMT-FIELDS          OCCURS 99.
               10  WS-F-CVG-STD-PREM-AMT      PIC S9(13)V99 COMP-3.
               10  WS-F-CVG-SSTD-PREM-AMT     PIC S9(13)V99 COMP-3.
               10  WS-F-CVG-TOT-PREM-AMT      PIC S9(13)V99 COMP-3.
               10  WS-F-CNVR-P-AMT            PIC S9(13)V99 COMP-3.
               10  WS-F-NO-RENW-CNVR-P-AMT    PIC S9(13)V99 COMP-3.
               10  WS-F-SSTD-CNVR-P-AMT       PIC S9(13)V99 COMP-3.
               10  WS-F-AFYC-SSTD-CNVR-P-AMT  PIC S9(13)V99 COMP-3.
               10  WS-F-STD-PREM-AMT          PIC S9(13)V99 COMP-3.

       01  WS-OUTPUT-PARM-INFO.               
               05  WS-RETRN-CD              PIC S9(04) COMP.
                   88  WS-RETRN-OK                  VALUE ZERO.
                   88  WS-RETRN-ERROR               VALUE +12.
                   88  WS-RETRN-INVALID-REQUEST     VALUE +99.  
                   
       01  WS-REC-COUNTS.
               05  WS-REC-READ-COUNT        PIC 9(04).
               05  WS-REC-UPDT-COUNT        PIC 9(04).
               05  WS-REC-SKIP-COUNT        PIC 9(04).

       01  WS-HOLD-REC-INFO.
               05  WS-HOLD-POL-ID           PIC X(10).
               05  WS-HOLD-PD-TO-DT-NUM     PIC X(10).
           
       01  WS-MSGS-TXT                               PIC X(80).
               88  WS-MSGS-ZS9A510001                    VALUE
              'ONE-TIME TRANSITION JOB FOR UPDATING TH RECORDS'.
               88  WS-MSGS-ZS9A510002                    VALUE
              'NO RECORDS TO PROCESS'.
               88  WS-MSGS-ZS9A510003                    VALUE
              'PROCESSING POLICY NO '.
               88  WS-MSGS-ZS9A510004                    VALUE
              'NUMBER OF RECORDS READ '.
               88  WS-MSGS-ZS9A510005                    VALUE
              'NUMBER OF RECORDS UPDATED '.              
               88  WS-MSGS-ZS9A510006                    VALUE
              'NUMBER OF RECORDS SKIPPED '.              
               88  WS-MSGS-ZS9A510007                    VALUE
              'POLICY IS IN NOT TAKEN STATUS '.              
               88  WS-MSGS-ZS9A510008                    VALUE
              'BACK DATED TH RECORD '.              
               88  WS-MSGS-ZS9A510009                    VALUE
              'RIDER SURRENDER PROCESSED RECORD '.                            
              
              
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY CCFRTH.
       COPY CCFWTH.
      /
       COPY CCFRPH.
       COPY CCFWPH.
       COPY CCFWPOL.
      /
       COPY CCFRCVG.
       COPY CCFWCVG.      
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==    BY    9A51
                               ==':ID:'==  BY =='9A51'==.
       COPY ZCSR9A51.                               
      /
       COPY XCSWSEQ  REPLACING ==:ID:==    BY    951A
                               ==':ID:'==  BY =='951A'==.
       COPY ZCSR951A.   
      /
       COPY XCSWSEQ  REPLACING ==:ID:==    BY    951B
                               ==':ID:'==  BY =='951B'==.
       COPY ZCSR951B.          
      ***********************************************************
      * CALLED MODULE PARAMETER INFORMATION
      ***********************************************************      
       COPY XCWL1680.
       COPY XCWL1670.
       COPY CCWL0186. 
       COPY XCWL0289.       
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
               THRU 2000-PRCES-INPUT-RECORDS-X
               UNTIL W9A51-SEQ-IO-EOF.    
               
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

           PERFORM  9A51-1000-OPEN-INPUT
               THRU 9A51-1000-OPEN-INPUT-X.

           PERFORM  951A-3000-OPEN-OUTPUT
               THRU 951A-3000-OPEN-OUTPUT-X.
               
           PERFORM  951B-3000-OPEN-OUTPUT
               THRU 951B-3000-OPEN-OUTPUT-X.               

       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       1000-INITIALIZE.
      *----------------

           INITIALIZE WS-REC-COUNTS.
           
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
           SET  WS-MSGS-ZS9A510001          TO TRUE.
           MOVE WS-MSGS-TXT                 TO L0040-PROGRAM-DESC.

           MOVE ZERO                        TO L0040-ERROR-CNT.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           MOVE WS-USER-M166T1              TO WGLOB-USER-ID.

           PERFORM  9A51-1000-READ
               THRU 9A51-1000-READ-X.

           IF  NOT W9A51-SEQ-IO-OK
      *MSG: NO RECORDS TO PROCESS
               MOVE SPACES                  TO L0040-INPUT-LINE
               SET  WS-MSGS-ZS9A510002      TO TRUE
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
           INITIALIZE WS-OUTPUT-PARM-INFO.
           IF NOT R9A51-POL-ID = WS-HOLD-POL-ID
               INITIALIZE WS-HOLD-REC-INFO
           END-IF.               
           
           MOVE R9A51-SEQ-REC-INFO          TO WS-INPUT-REC-INFO.
           ADD 1                            TO WS-REC-READ-COUNT.
      
      *MSG: PROCESSING POLICY NO @1
           MOVE SPACES                      TO L0040-INPUT-LINE.
           SET  WS-MSGS-ZS9A510003          TO TRUE.
           STRING WS-MSGS-TXT  DELIMITED BY '  '
                  ' '          DELIMITED BY SIZE
                  R9A51-POL-ID              INTO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
               
           MOVE R9A51-POL-ID                TO WPOL-POL-ID.

           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.

           IF NOT WPOL-IO-OK
      *MSG: 'POLICY (@1) NOT IN FILE'
               MOVE 'CS00000019'            TO WGLOB-MSG-REF-INFO
               MOVE WPOL-POL-ID             TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  9A51-1000-READ
                   THRU 9A51-1000-READ-X
               GO TO 2000-PRCES-INPUT-RECORDS-X
           END-IF. 
           
           MOVE RPOL-POL-ID                 TO WGLOB-REF-POLICY-ID.

           PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
               THRU CVGS-1000-LOAD-CVGS-ARRAY-X.
               
           PERFORM  2500-VALIDATE-INPUT-REC
               THRU 2500-VALIDATE-INPUT-REC-X.
               
           IF  WS-RETRN-ERROR   
               PERFORM  9A51-1000-READ
                   THRU 9A51-1000-READ-X
               GO TO 2000-PRCES-INPUT-RECORDS-X
           END-IF. 
           
           PERFORM  3000-COMPUTE-VALUES
               THRU 3000-COMPUTE-VALUES-X.
               
           PERFORM  4000-UPDT-TH-REC
               THRU 4000-UPDT-TH-REC-X.
           
           PERFORM  5000-WRIT-FILES
               THRU 5000-WRIT-FILES-X.
               
           PERFORM  9A51-1000-READ
               THRU 9A51-1000-READ-X.

       2000-PRCES-INPUT-RECORDS-X.
           EXIT.
      /
      *------------------------
       2500-VALIDATE-INPUT-REC.
      *------------------------
      
	   MOVE  R9A51-CVG-NUM              TO WS-INPUT-CVG-NUM.
           IF  R9A51-POL-BILL-MODE-CD = SPACES
               MOVE RPOL-POL-BILL-MODE-CD   TO 
                                            WS-POL-BILL-MODE-CD
           ELSE
               MOVE R9A51-POL-BILL-MODE-CD  TO 
                                            WS-POL-BILL-MODE-CD
           END-IF.
           
           MOVE WS-POL-BILL-MODE-CD         TO WS-BILL-MODE-CD.
      
           MOVE R9A51-PD-TO-DT-NUM          TO WS-PD-TO-DT-NUM.      
      
      * TO SKIP POLICY WHICH ARE IN NOT TAKEN STATUS
      
           IF  RPOL-POL-CSTAT-CD ='A'
           OR  RPOL-POL-CSTAT-CD ='R'
               ADD 1                        TO WS-REC-SKIP-COUNT
               SET WS-RETRN-ERROR           TO TRUE
               MOVE SPACES                  TO L0040-INPUT-LINE
               SET  WS-MSGS-ZS9A510007      TO TRUE
               MOVE WS-MSGS-TXT             TO L0040-INPUT-LINE           
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X                               
               GO TO 2500-VALIDATE-INPUT-REC-X
           END-IF.
           
           IF  R9A51-CVG-STAT-CD='E'
               MOVE R9A51-POL-ID            TO WS-HOLD-POL-ID
               IF (R9A51-PD-TO-DT-NUM > WS-HOLD-PD-TO-DT-NUM
               AND NOT WS-HOLD-PD-TO-DT-NUM = SPACES)
               ADD 1                        TO WS-REC-SKIP-COUNT
               SET WS-RETRN-ERROR           TO TRUE
               MOVE SPACES                  TO L0040-INPUT-LINE
               SET  WS-MSGS-ZS9A510009      TO TRUE
               MOVE WS-MSGS-TXT             TO L0040-INPUT-LINE           
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               GO TO 2500-VALIDATE-INPUT-REC-X
           END-IF.                   
           
           MOVE R9A51-PD-TO-DT-NUM          TO WS-HOLD-PD-TO-DT-NUM.
           
           INITIALIZE RTH-REC-INFO.
               
           MOVE HIGH-VALUES                 TO WTH-KEY.
           MOVE LOW-VALUES                  TO WTH-ENDBR-KEY.
           MOVE R9A51-POL-ID                TO WTH-POL-ID.
           MOVE WS-INPUT-CVG-NUM            TO WTH-CVG-NUM-N.
           MOVE WTH-KEY                     TO WTH-ENDBR-KEY.
           MOVE ZEROES                      TO WTH-ENDBR-CVG-NUM-N.
           MOVE WWKDT-LOW-DT                TO
                                            WTH-ENDBR-PREM-PD-DT-NUM.
      
           PERFORM  TH-1000-BROWSE-PREV
               THRU TH-1000-BROWSE-PREV-X.
      
           IF  NOT WTH-IO-OK
               GO TO 2500-VALIDATE-INPUT-REC-X
           END-IF.
      
           PERFORM  TH-2000-READ-PREV
               THRU TH-2000-READ-PREV-X
               UNTIL (RTH-CVG-FACE-AMT > ZEROES
               AND RTH-CVG-NUM = WS-INPUT-CVG-NUM)
               OR NOT WTH-IO-OK.

           IF  NOT WTH-IO-OK
               PERFORM  TH-3000-END-BROWSE-PREV
                   THRU TH-3000-END-BROWSE-PREV-X
               GO TO 2500-VALIDATE-INPUT-REC-X
           END-IF.
           
           IF  RTH-PREM-PD-DT-NUM > WS-PD-TO-DT-NUM
           AND RTH-CVG-FACE-AMT > ZEROES
               ADD 1                        TO WS-REC-SKIP-COUNT
               SET WS-RETRN-ERROR           TO TRUE
               MOVE SPACES                  TO L0040-INPUT-LINE
               SET  WS-MSGS-ZS9A510008      TO TRUE
               MOVE WS-MSGS-TXT             TO L0040-INPUT-LINE           
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X               
           END-IF.           

           PERFORM  TH-3000-END-BROWSE-PREV
               THRU TH-3000-END-BROWSE-PREV-X.

       2500-VALIDATE-INPUT-REC-X.
           EXIT.
      /             
      *--------------------
       3000-COMPUTE-VALUES.
      *--------------------

      * TO CALCULATE THE VALUES AS ON THE PREVIOUS PAID TO DATE
      * USING 9699 LOGIC
      
           IF  RPOL-POL-INS-TYP-MEDIC-INS
               MOVE  01                     TO WS-POL-CVG-REC-CTR-N
           ELSE
               MOVE RPOL-POL-CVG-REC-CTR-N  TO WS-POL-CVG-REC-CTR-N
           END-IF.

           PERFORM  3100-GEN-COMM-REC
               THRU 3100-GEN-COMM-REC-X
               VARYING WS-CVG FROM 1 BY 1
               UNTIL WS-CVG > WS-POL-CVG-REC-CTR-N.
               
      * INORDER TO COMPUTE VALUES FOR THE NEW FIELDS 
      * FOR THE SPECIFIC COVERAGE
      
       3000-COMPUTE-VALUES-X.
          EXIT.
     /
      *------------------
       3100-GEN-COMM-REC.
      *------------------
      
           MOVE WS-CVG                   TO I.
           MOVE ZEROES                   TO WS-CVG-NUM.
           
           PERFORM  PLIN-1000-PLAN-HEADER-IN
               THRU PLIN-1000-PLAN-HEADER-IN-X.
               
           IF  RPOL-POL-INS-TYP-MEDIC-INS 
               PERFORM  3200-ACCUM-PREM-AMT
                   THRU 3200-ACCUM-PREM-AMT-X
                 VARYING WS-CVG-NUM FROM 1 BY 1
                 UNTIL WS-CVG-NUM > RPOL-POL-CVG-REC-CTR-N
                                              
               MOVE WS-ACCUM-SSTD-PREM-AMT  
                                            TO 
                                            WS-F-CVG-SSTD-PREM-AMT (I)
               COMPUTE WS-F-CVG-STD-PREM-AMT (I) = 
                                            WS-ACCUM-MPREM-AMT 
                                          - WS-F-CVG-SSTD-PREM-AMT (I)
      
               COMPUTE WS-F-CVG-TOT-PREM-AMT (I)
                                          = WS-F-CVG-STD-PREM-AMT (I)
                                          + WS-F-CVG-SSTD-PREM-AMT (I)
      
               MOVE WS-F-CVG-STD-PREM-AMT (I)  
                                            TO WS-CVG-STD-PREM-AMT
               MOVE WS-F-CVG-SSTD-PREM-AMT (I)
                                            TO WS-CVG-SSTD-PREM-AMT
           ELSE          
               COMPUTE L0289-CRCY-AMT       = WCVGS-CVG-ME-PREM-AMT (I)
                                            * RPOL-POL-BILL-MODE-CD-N
                                              / 12
               PERFORM  0289-1000-CRCY-RND
                   THRU 0289-1000-CRCY-RND-X
               MOVE L0289-CRCY-AMT          TO
                                            WS-F-CVG-SSTD-PREM-AMT (I)

               COMPUTE WS-F-CVG-STD-PREM-AMT (I) = 
                                           WCVGS-CVG-MPREM-AMT (I)
                                          - WS-F-CVG-SSTD-PREM-AMT (I)

               COMPUTE WS-F-CVG-TOT-PREM-AMT (I)
                                          = WS-F-CVG-STD-PREM-AMT (I)
                                          + WS-F-CVG-SSTD-PREM-AMT (I)

               MOVE WS-F-CVG-STD-PREM-AMT (I) 
                                            TO WS-CVG-STD-PREM-AMT
               MOVE WS-F-CVG-SSTD-PREM-AMT (I)
                                            TO WS-CVG-SSTD-PREM-AMT
           END-IF.
           
           PERFORM  3300-CALC-CVG-COMM
               THRU 3300-CALC-CVG-COMM-X.
               
       3100-GEN-COMM-REC-X.
           EXIT.
      /
      *--------------------
       3200-ACCUM-PREM-AMT.
      *--------------------
      
           COMPUTE L0289-CRCY-AMT = 
                                 WCVGS-CVG-ME-PREM-AMT (WS-CVG-NUM)
                                  * RPOL-POL-BILL-MODE-CD-N
                                  / 12.
           PERFORM  0289-1000-CRCY-RND
               THRU 0289-1000-CRCY-RND-X.
           ADD L0289-CRCY-AMT               TO WS-ACCUM-SSTD-PREM-AMT.
           
           ADD WCVGS-CVG-MPREM-AMT (WS-CVG-NUM)
                                            TO WS-ACCUM-MPREM-AMT.
       3200-ACCUM-PREM-AMT-X.
           EXIT.
      /
      *-------------------
       3300-CALC-CVG-COMM.
      *-------------------
      
           PERFORM  3400-CALC-BAND-USE-AMT
               THRU 3400-CALC-BAND-USE-AMT-X
               VARYING J FROM 1 BY 1
               UNTIL J > RPOL-POL-CVG-REC-CTR-N.

      * SET THE RATE TYPE AND GET THE RATES

           SET WS-RT-TYP-CMTRD           TO TRUE.

           PERFORM  3500-GET-COMM-RT
               THRU 3500-GET-COMM-RT-X.

      * POPULATE THE WORKING STORAGE VARIABLES WITH THE RATES BASED ON THE
      * BILL M0DE CODE OF THE POLICY AT THE TIME OF ISSUE.

           EVALUATE TRUE

               WHEN WS-BILL-MODE-MTHLY
                    MOVE L0186-RT (1)       TO WS-AFYC-RT
                    MOVE L0186-RT (2)       TO WS-NON-RENW-RT

               WHEN WS-BILL-MODE-SEMI-ANN
                    MOVE L0186-RT (3)       TO WS-AFYC-RT
                    MOVE L0186-RT (4)       TO WS-NON-RENW-RT

               WHEN WS-BILL-MODE-ANN
                    MOVE L0186-RT (5)       TO WS-AFYC-RT
                    MOVE L0186-RT (6)       TO WS-NON-RENW-RT

           END-EVALUATE.

      * GET THE EXTRA PREMIUM RATES IF SUBSTANDARD PREMIUM COMMISSION IS
      * APPLICABLE

           IF  WS-CVG-SSTD-PREM-AMT > ZERO
               SET WS-RT-TYP-EPCMT       TO TRUE

               PERFORM  3500-GET-COMM-RT
                   THRU 3500-GET-COMM-RT-X

               EVALUATE TRUE

                   WHEN WS-BILL-MODE-MTHLY
                        MOVE L0186-RT (1)   TO WS-SSTD-RT

                   WHEN WS-BILL-MODE-SEMI-ANN
                        MOVE L0186-RT (3)   TO WS-SSTD-RT

                   WHEN WS-BILL-MODE-ANN
                        MOVE L0186-RT (5)   TO WS-SSTD-RT

               END-EVALUATE

           END-IF.

      * CALCULATE AFYC AMOUNT AND NON RENEWAL AFYC AMOUNTS BASED ON THE
      * RATES

           PERFORM  3600-CALC-CNVR-P-AMT
               THRU 3600-CALC-CNVR-P-AMT-X.

       3300-CALC-CVG-COMM-X.
           EXIT.
      /
      *-----------------------
       3400-CALC-BAND-USE-AMT.
      *-----------------------

      * DOES THE ISSUE DATE MATCH THE COVERAGE WE ARE PROCESSING

           IF  WCVGS-CVG-ISS-EFF-DT (I) NOT = WCVGS-CVG-ISS-EFF-DT (J)
               GO TO 3400-CALC-BAND-USE-AMT-X
           END-IF.

      * CALCULATE THE STANDARD PREMIUM AT ISSUE AND BILL MODE AT ISSUE

           IF  WS-PD-TO-DT-NUM = WCVGS-CVG-ISS-EFF-DT (J)
           OR  WS-PD-TO-DT-NUM = WWKDT-ZERO-DT
               COMPUTE WS-STD-MPREM-AMT = WCVGS-CVG-MPREM-AMT (J)
                                        - (WCVGS-CVG-ME-PREM-AMT (J)
                                        * (RPOL-POL-BILL-MODE-CD-N
                                        / 12))
      
               COMPUTE WS-BAND-USE-AMT  = WS-BAND-USE-AMT
                                           + WS-STD-MPREM-AMT
               IF  WCVGS-CVG-INS-TYP-MEDIC-INS (J)
                   MOVE WCVGS-CVG-FACE-AMT (J) 
                                            TO WS-ISSUE-HDB-AMT
               END-IF
               GO TO 3400-CALC-BAND-USE-AMT-X
           ELSE
               MOVE RPOL-POL-ID             TO WTH-POL-ID
               MOVE WCVGS-CVG-ISS-EFF-DT (J)
                                            TO WTH-PREM-PD-DT-NUM
               MOVE ZERO                    TO WTH-PREM-PD-DT-NUM-DY
               MOVE J                       TO WTH-CVG-NUM-N
      
               PERFORM  TH-1000-READ
                   THRU TH-1000-READ-X
      
               IF  WTH-IO-OK
                   COMPUTE WS-BAND-USE-AMT   = WS-BAND-USE-AMT
                                             + RTH-CVG-STD-PREM-AMT
                   IF  WCVGS-CVG-INS-TYP-MEDIC-INS (J)
                       MOVE RTH-CVG-FACE-AMT     
                                            TO WS-ISSUE-HDB-AMT
                   END-IF
               END-IF
               GO TO 3400-CALC-BAND-USE-AMT-X
           END-IF.
      
           COMPUTE WS-BAND-USE-AMT = WS-BAND-USE-AMT
                                   + WS-F-STD-PREM-AMT (J).

       3400-CALC-BAND-USE-AMT-X.
           EXIT.
      /
      *-----------------
       3500-GET-COMM-RT.
      *-----------------
      
      * GET THE COMMISSION RATES USING 0186 UTILITY

           PERFORM  0186-1000-BUILD-PARM-INFO
               THRU 0186-1000-BUILD-PARM-INFO-X.

           MOVE WS-PD-TO-DT-NUM             TO L0186-EFF-DT.
           MOVE WS-RT-TYP-CD                TO L0186-PLAN-RT-TYP-CD.
           MOVE WS-BAND-USE-AMT             TO L0186-TOT-AVAIL-AMT.
           MOVE WS-ISSUE-HDB-AMT            TO
                            L0186-CVG-FACE-AMT(RPOL-POL-BASE-CVG-NUM).
      
           PERFORM  0186-3000-GET-PLRT
               THRU 0186-3000-GET-PLRT-X.

           EVALUATE TRUE

               WHEN L0186-RETRN-OK
                    CONTINUE

               WHEN L0186-RETRN-BAD-PLRT-ACCESS
                    GO TO  3500-GET-COMM-RT-X

               WHEN L0186-RETRN-BAD-RHDR-ACCESS
      *MSG: RATE HEADER RECORD NOT FOUND FOR PLAN (@1) RATE TYPE (@2)
                    MOVE 'CC96990001'       TO WGLOB-MSG-REF-INFO

               WHEN L0186-RETRN-BAD-RLTB-ACCESS
      *MSG: RATE TABLE RECORD NOT FOUND FOR PLAN (@1) RATE TYPE (@2)
                    MOVE 'CC96990002'       TO WGLOB-MSG-REF-INFO

               WHEN L0186-RETRN-BAD-LGAS-ACCESS
      *MSG: LOCATION GROUP RECORD NOT FOUND FOR PLAN (@1) RATE TYPE (@2)
                    MOVE 'CC96990003'       TO WGLOB-MSG-REF-INFO

           END-EVALUATE.

           IF  L0186-RETRN-BAD-RHDR-ACCESS
           OR  L0186-RETRN-BAD-RLTB-ACCESS
           OR  L0186-RETRN-BAD-LGAS-ACCESS
               MOVE L0186-PLAN-ID           TO WGLOB-MSG-PARM (1)
               MOVE L0186-PLAN-RT-TYP-CD    TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-RETRN-ERROR        TO TRUE
           END-IF.

       3500-GET-COMM-RT-X.
           EXIT.
      /
      *---------------------
       3600-CALC-CNVR-P-AMT.
      *---------------------
      
      * CALCULATE AFYC AMOUNTS FOR THE COVERAGE
           COMPUTE L0289-CRCY-AMT           = (WS-CVG-STD-PREM-AMT
                                            * 12
                                            / RPOL-POL-BILL-MODE-CD-N)
                                            * WS-AFYC-RT / 100.
           PERFORM  0289-1000-CRCY-RND
               THRU 0289-1000-CRCY-RND-X.
           MOVE L0289-CRCY-AMT              TO WS-CNVR-P-AMT.

           COMPUTE L0289-CRCY-AMT           = (WS-CVG-STD-PREM-AMT
                                            * 12
                                            / RPOL-POL-BILL-MODE-CD-N)
                                            * WS-NON-RENW-RT / 100.
           PERFORM  0289-1000-CRCY-RND
               THRU 0289-1000-CRCY-RND-X.
           MOVE L0289-CRCY-AMT              TO
                                              WS-NO-RENW-CNVR-P-AMT.

           COMPUTE L0289-CRCY-AMT            = (WS-CVG-SSTD-PREM-AMT
                                             * 12
                                             / RPOL-POL-BILL-MODE-CD-N)
                                             * (WS-AFYC-RT / 100)
                                             * (WS-SSTD-RT / 100).
           PERFORM  0289-1000-CRCY-RND
               THRU 0289-1000-CRCY-RND-X.
           MOVE L0289-CRCY-AMT              TO
                                            WS-AFYC-SSTD-CNVR-P-AMT.

           COMPUTE L0289-CRCY-AMT           = (WS-CVG-SSTD-PREM-AMT
                                            * 12
                                            / RPOL-POL-BILL-MODE-CD-N)
                                            * (WS-NON-RENW-RT / 100)
                                            * (WS-SSTD-RT / 100).
           PERFORM  0289-1000-CRCY-RND
               THRU 0289-1000-CRCY-RND-X.
           MOVE L0289-CRCY-AMT              TO
                                            WS-SSTD-CNVR-P-AMT.

      * PASS THE CALCULATED AFYC TO LINKAGE VARIABLES.

           MOVE WS-CNVR-P-AMT            TO WS-F-CNVR-P-AMT (I).
           MOVE WS-NO-RENW-CNVR-P-AMT    TO
                                          WS-F-NO-RENW-CNVR-P-AMT (I).
           MOVE WS-SSTD-CNVR-P-AMT       TO
                                            WS-F-SSTD-CNVR-P-AMT (I).
           MOVE WS-AFYC-SSTD-CNVR-P-AMT  TO
                                         WS-F-AFYC-SSTD-CNVR-P-AMT (I).

       3600-CALC-CNVR-P-AMT-X.
           EXIT.
      /
      *-----------------
       4000-UPDT-TH-REC.
      *-----------------
      
      
           MOVE R9A51-POL-ID                TO WTH-POL-ID.
           MOVE R9A51-PD-TO-DT-NUM          TO WTH-PREM-PD-DT-NUM.
           MOVE ZERO                        TO WTH-PREM-PD-DT-NUM-DY.
           MOVE WS-INPUT-CVG-NUM            TO WTH-CVG-NUM-N.
      
           PERFORM  TH-1000-READ-FOR-UPDATE
               THRU TH-1000-READ-FOR-UPDATE-X.

           MOVE WCVGS-CVG-FACE-AMT (WS-INPUT-CVG-NUM)
                                            TO RTH-PREV-CVG-FACE-AMT.
           MOVE WS-POL-BILL-MODE-CD         TO 
                                            RTH-PREV-POL-BILL-MODE-CD.
           
           IF  RPOL-POL-INS-TYP-MEDIC-INS          
               COMPUTE L0289-CRCY-AMT  = 
                              WCVGS-CVG-ME-PREM-AMT (WS-INPUT-CVG-NUM)
                                       * RPOL-POL-BILL-MODE-CD-N
                                       / 12
               PERFORM  0289-1000-CRCY-RND
                   THRU 0289-1000-CRCY-RND-X
               MOVE L0289-CRCY-AMT              TO
                                              RTH-PREV-SSTD-PREM-AMT
      
               COMPUTE RTH-PREV-STD-PREM-AMT = 
                               WCVGS-CVG-MPREM-AMT (WS-INPUT-CVG-NUM)
                                             - RTH-PREV-SSTD-PREM-AMT
      
               COMPUTE RTH-PREV-TOT-PREM-AMT = RTH-PREV-STD-PREM-AMT
                                              + RTH-PREV-SSTD-PREM-AMT
           ELSE      
               MOVE WS-F-CVG-STD-PREM-AMT (WS-INPUT-CVG-NUM)  
                                            TO RTH-PREV-STD-PREM-AMT
               MOVE WS-F-CVG-SSTD-PREM-AMT (WS-INPUT-CVG-NUM) 
                                            TO RTH-PREV-SSTD-PREM-AMT
               MOVE WS-F-CVG-TOT-PREM-AMT (WS-INPUT-CVG-NUM)  
                                            TO RTH-PREV-TOT-PREM-AMT
           END-IF.
           
           MOVE WS-F-CNVR-P-AMT (WS-INPUT-CVG-NUM)
                                            TO RTH-PREV-CNVR-P-AMT.
           MOVE WS-F-NO-RENW-CNVR-P-AMT (WS-INPUT-CVG-NUM)
                                            TO RTH-PREV-NREN-CNVR-P-AMT.
           MOVE WS-F-SSTD-CNVR-P-AMT (WS-INPUT-CVG-NUM)   
                                            TO RTH-PREV-SSTD-CNVR-P-AMT.
           MOVE WS-F-AFYC-SSTD-CNVR-P-AMT (WS-INPUT-CVG-NUM)
                                            TO RTH-PREV-AFYC-SSTD-P-AMT.

           IF  R9A51-CVG-STAT-CD = SPACES
               IF  WCVGS-CVG-CSTAT-CD (WS-INPUT-CVG-NUM) ='1'
                   MOVE WCVGS-CVG-CSTAT-CD (WS-INPUT-CVG-NUM) TO 
                                                RTH-PREV-CVG-STAT-CD
               ELSE
                   MOVE WCVGS-CVG-PREV-CSTAT-CD (WS-INPUT-CVG-NUM) TO
                                                RTH-PREV-CVG-STAT-CD
               END-IF
           ELSE
               MOVE WCVGS-CVG-PREV-CSTAT-CD (WS-INPUT-CVG-NUM) TO
                                                RTH-PREV-CVG-STAT-CD
           END-IF.
           
           PERFORM  TH-2000-REWRITE
               THRU TH-2000-REWRITE-X.
               
           IF WTH-IO-OK
              ADD 1                         TO WS-REC-UPDT-COUNT
           END-IF.
               
       4000-UPDT-TH-REC-X.
           EXIT.
      /
      *----------------
       5000-WRIT-FILES.
      *----------------
      
           INITIALIZE R951B-SEQ-REC-INFO.
           INITIALIZE R951A-SEQ-REC-INFO.
           
           MOVE R9A51-POL-ID                TO WTH-POL-ID.
           MOVE R9A51-PD-TO-DT-NUM          TO WTH-PREM-PD-DT-NUM.
           MOVE ZERO                        TO WTH-PREM-PD-DT-NUM-DY.
           MOVE WS-INPUT-CVG-NUM            TO WTH-CVG-NUM-N.
           
           PERFORM  TH-1000-READ
               THRU TH-1000-READ-X.
           
           MOVE RTH-KEY                     TO R951A-KEY.
           MOVE RTH-PREV-CVG-FACE-AMT       TO
                                        R951A-PREV-CVG-FACE-AMT.
           MOVE RTH-PREV-POL-BILL-MODE-CD   TO
                                        R951A-PREV-POL-BILL-MODE-CD.
           MOVE RTH-PREV-STD-PREM-AMT       TO
                                        R951A-PREV-STD-PREM-AMT.
           MOVE RTH-PREV-SSTD-PREM-AMT      TO
                                        R951A-PREV-SSTD-PREM-AMT.   
           MOVE RTH-PREV-TOT-PREM-AMT       TO
                                        R951A-PREV-TOT-PREM-AMT.  
           MOVE RTH-PREV-CVG-STAT-CD        TO
                                        R951A-PREV-CVG-STAT-CD.  
           MOVE RTH-PREV-CNVR-P-AMT         TO
                                        R951A-PREV-CNVR-P-AMT.  
           MOVE RTH-PREV-NREN-CNVR-P-AMT    TO
                                       R951A-PREV-NREN-CNVR-P-AMT.  
           MOVE RTH-PREV-SSTD-CNVR-P-AMT    TO
                                        R951A-PREV-SSTD-CNVR-P-AMT.
           MOVE RTH-PREV-AFYC-SSTD-P-AMT    TO
                                        R951A-PREV-AFYC-SSTD-P-AMT.
           
           PERFORM  951A-1000-WRITE
               THRU 951A-1000-WRITE-X.
           
           INITIALIZE RTH-REC-INFO.
               
           MOVE LOW-VALUES                  TO WTH-KEY.
           MOVE HIGH-VALUES                 TO WTH-ENDBR-KEY.
           MOVE R9A51-POL-ID                TO WTH-POL-ID.
           MOVE R9A51-PD-TO-DT-NUM          TO WTH-PREM-PD-DT-NUM.
           MOVE ZEROES                      TO WTH-PREM-PD-DT-NUM-DY.
           MOVE WS-INPUT-CVG-NUM            TO WTH-CVG-NUM-N.
           MOVE WTH-KEY                     TO WTH-ENDBR-KEY.
           MOVE ZEROES                      TO WTH-ENDBR-CVG-NUM-N.
           MOVE WWKDT-LOW-DT                TO
                                            WTH-ENDBR-PREM-PD-DT-NUM.
      
           PERFORM  TH-1000-BROWSE-PREV
               THRU TH-1000-BROWSE-PREV-X.
      
           IF  NOT WTH-IO-OK
               GO TO 5000-WRIT-FILES-X
           END-IF.
      
           PERFORM  TH-2000-READ-PREV
               THRU TH-2000-READ-PREV-X
               UNTIL (RTH-CVG-FACE-AMT > ZEROES
               AND RTH-CVG-NUM = WS-INPUT-CVG-NUM)
               OR NOT WTH-IO-OK.

           IF  NOT WTH-IO-OK
               PERFORM  TH-3000-END-BROWSE-PREV
                   THRU TH-3000-END-BROWSE-PREV-X
               GO TO 5000-WRIT-FILES-X
           END-IF.

           MOVE RTH-KEY                     TO R951B-KEY.
           MOVE R9A51-PD-TO-DT-NUM          TO R951B-PREM-PD-DT-NUM.
           MOVE RTH-CVG-FACE-AMT            TO 
                                        R951B-CVG-FACE-AMT.
           MOVE RTH-POL-BILL-MODE-CD        TO 
                                        R951B-POL-BILL-MODE-CD.
           MOVE RTH-CVG-STD-PREM-AMT        TO 
                                        R951B-CVG-STD-PREM-AMT.
           MOVE RTH-CVG-SSTD-PREM-AMT       TO
                                        R951B-CVG-SSTD-PREM-AMT.
           MOVE RTH-CVG-TOT-PREM-AMT        TO
                                        R951B-CVG-TOT-PREM-AMT.
           MOVE RTH-CVG-STAT-CD             TO
                                        R951B-CVG-STAT-CD.
           MOVE RTH-CNVR-P-AMT              TO
                                        R951B-CNVR-P-AMT.
           MOVE RTH-NO-RENW-CNVR-P-AMT      TO
                                        R951B-NO-RENW-CNVR-P-AMT.
           MOVE RTH-SSTD-CNVR-P-AMT         TO
                                        R951B-SSTD-CNVR-P-AMT.
           MOVE RTH-AFYC-SSTD-CNVR-P-AMT    TO
                                        R951B-AFYC-SSTD-CNVR-P-AMT.
           MOVE RTH-PREM-PD-DT-NUM          TO R951B-CHK-DT.
           
           PERFORM  951B-1000-WRITE
               THRU 951B-1000-WRITE-X.
               
           PERFORM  TH-3000-END-BROWSE-PREV
               THRU TH-3000-END-BROWSE-PREV-X.
               
       5000-WRIT-FILES-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------
      
           MOVE SPACES                      TO L0040-INPUT-LINE.
           SET  WS-MSGS-ZS9A510004          TO TRUE.
           STRING WS-MSGS-TXT  DELIMITED BY '  '
                  ' '          DELIMITED BY SIZE
                  WS-REC-READ-COUNT         INTO L0040-INPUT-LINE.           
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           
           MOVE SPACES                      TO L0040-INPUT-LINE.
           SET  WS-MSGS-ZS9A510005          TO TRUE.
           STRING WS-MSGS-TXT  DELIMITED BY '  '
                  ' '          DELIMITED BY SIZE
                  WS-REC-UPDT-COUNT         INTO L0040-INPUT-LINE.           
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.     
               
           MOVE SPACES                      TO L0040-INPUT-LINE.
           SET  WS-MSGS-ZS9A510006          TO TRUE.
           STRING WS-MSGS-TXT  DELIMITED BY '  '
                  ' '          DELIMITED BY SIZE
                  WS-REC-SKIP-COUNT         INTO L0040-INPUT-LINE.           
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.                     

           PERFORM  9A51-4000-CLOSE
               THRU 9A51-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

           PERFORM  951A-4000-CLOSE
               THRU 951A-4000-CLOSE-X.
               
           PERFORM  951B-4000-CLOSE
               THRU 951B-4000-CLOSE-X.               

       9999-CLOSE-FILES-X.
           EXIT.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************      
      
       COPY NCPPCVGS.
       COPY CCPPMIDT.      
       COPY CCPPPLIN. 
       COPY CCPNPH.
       COPY CCPNTH.
       COPY CCPNPOL.
       COPY CCPNCVG.
       COPY CCPUTH.
       COPY CCPVTH.
      *****************************************************************
      *               I/O PROCESSING COPYBOOKS                        *
      *****************************************************************
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY 9A51
                               ==':PGM:'== BY =='ZSRQ9A51'==.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY  ==9A51==.
       COPY XCSOFILE REPLACING ==:ID:==  BY 9A51.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY 951A
                               ==':PGM:'== BY =='ZSRQ951A'==.
       COPY XCSASEQ  REPLACING ==:ID:==  BY  ==951A==.
       COPY XCSOFILE REPLACING ==:ID:==  BY 951A.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY 951B
                               ==':PGM:'== BY =='ZSRQ951B'==.
       COPY XCSASEQ  REPLACING ==:ID:==  BY  ==951B==.
       COPY XCSOFILE REPLACING ==:ID:==  BY 951B.
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
       COPY XCPL0289.      
       COPY CCPS0186.
       COPY CCPL0186. 
      *****************************************************************
      *                END OF PROGRAM ZSBM9A51                        *
      *****************************************************************