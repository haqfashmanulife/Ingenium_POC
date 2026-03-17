      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBM9995.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  ZSBM9995                                         **
      **  REMARKS:  ONE SHOT PROGRAM TO UPDATE REINSURANCE DETAILS   **
      **                                                             **
      **  DOMAIN :  AG                                               **
      *****************************************************************
      **                                                             **
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
UYS015**  22SEP22  CTS    INITIAL VERSION                            **
S24793**  23MAY23  CTS    SYNC UP WITH CVG TABLE                     **
BEVD2G**  10SEP24  CTS    CHANGES DONE AS PART OF BEAVER REINS 2.0   **
      *****************************************************************

      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM9995'.

       COPY SQLCA.

       01  WS-PGM-WORK-AREA.
           05  WS-CVG                           PIC X(02).
           05  WS-CVG-N                         REDEFINES
               WS-CVG                           PIC 9(02).
           05  WS-AUTO-REINS-IND                PIC X(01).
               88  WS-AUTO-REINS-YES            VALUE 'Y'.
               88  WS-AUTO-REINS-NO             VALUE 'N'.
           05  WS-SUB3                          PIC S9(2)  COMP.
           05  WS-REINS-TRTY-NUM                PIC X(05).
           05  WS-REINS-UNIQ-NUM                PIC X(05).
           05  WS-COINS-TRTY-NUM                PIC X(05).
           05  WS-REINS-CED-PCT-AUTO            PIC X(40)  
                                                VALUE SPACES.
           05  WS-REINS-CED-PCT-AU REDEFINES WS-REINS-CED-PCT-AUTO.
               15 WS-REINS-CED-PCT-AU1          PIC 9(03).
               15 FILLER                        PIC X(37).
           05  WS-CONCAT-REINS-NUM-CD.
               15 WS-CONCAT-REINS-NUM           PIC X(06).
               15 WS-CONCAT-REINS-CTR           PIC X(02).
BEVD2G*           05  WS-AU-REINS-CO-ID                PIC X(02).
           05  WS-TREATY-FND-IND                PIC X(01).
               88  WS-TREATY-FND-YES            VALUE 'Y'.
               88  WS-TREATY-FND-NO             VALUE 'N'.
           05  WS-EDIT-FND                      PIC X(01).
               88  WS-EDIT-FND-YES              VALUE 'Y'.
               88  WS-EDIT-FND-NO               VALUE 'N'.
BEVD2G     05  WS-AU-REINS-CO-ID                PIC X(02).
BEVD2G         88  WS-AU-REINS-CO-ID-SWI        VALUE '04'.
BEVD2G         88  WS-AU-REINS-CO-ID-SCO        VALUE '09'.
BEVD2G         88  WS-AU-REINS-CO-ID-PAR        VALUE '10'.
BEVD2G     05  WS-BASIC-S-AMT                   PIC S9(13)V99
BEVD2G                                          COMP-3.
BEVD2G     05  WS-BASIC-BNFT-AMT                PIC S9(13)V99
BEVD2G                                          COMP-3.                                                    
BEVD2G     05  WS-LIMIT-AMT                     PIC S9(13)V99
BEVD2G                                          COMP-3.
BEVD2G     05  WS-CNV-PMT-AMT                   PIC S9(13)V99
BEVD2G                                          COMP-3.
BEVD2G     05  WS-UW-AMT                        PIC S9(13)V99
BEVD2G                                          COMP-3.
BEVD2G     05  WS-QS-AMT                        PIC S9(13)V99
BEVD2G                                          COMP-3.
BEVD2G     05  WS-SUR-PLUS-AMT                  PIC S9(13)V99
BEVD2G                                          COMP-3.
BEVD2G     05  WS-LMT-CHK-AMT-1                 PIC S9(13) COMP-3.
BEVD2G     05  WS-LMT-CHK-AMT-2                 PIC S9(13) COMP-3.
BEVD2G     05  WS-SWI-CED-PCT                   PIC S9(03) COMP-3.
BEVD2G     05  WS-SCOR-CED-PCT                  PIC S9(03) COMP-3.
BEVD2G     05  WS-PAR-CED-PCT                   PIC S9(03) COMP-3.
           05  WS-AU-CVG-NUM                    PIC X(02).
           05  WS-CONCAT-SSLT-PLAN-CD.
               15 WS-SSLT-PLAN-ID               PIC X(06).
               15 WS-CONCAT-ALD-CTR             PIC X(02).
           05  WS-SUB4                          PIC S9(2)  COMP.
BEVD2G     05  WS-MLJ-PCT                       PIC S9(03) COMP-3.
BEVD2G         88  WS-MLJ-PCT1                  VALUE 100.
BEVD2G     05  WS-SRC-POL-PROD-CD               PIC X(02).
BEVD2G         88  WS-SRC-POL-PROD-SW           VALUE 'SW'.
BEVD2G         88  WS-SRC-POL-PROD-SP           VALUE 'SP'.
BEVD2G     05  WS-SPWL-HIST-RETN-AMT            PIC S9(13)V99
BEVD2G                                          COMP-3.
BEVD2G     05  WS-SPWL-BASIC-BNFT-AMT           PIC S9(13)V99
BEVD2G                                          COMP-3.
BEVD2G     05  WS-OVER-ALL-SELF-RETN-AMT        PIC S9(13)V99
BEVD2G                                          COMP-3.
BEVD2G     05  WS-SPWL-SELF-RETN-LMT            PIC S9(13)V99
BEVD2G                                          COMP-3.
BEVD2G     05  WS-MAX-SELF-RETN-AMT             PIC S9(13)V99
BEVD2G                                          COMP-3.
BEVD2G     05  WS-EXCD-SELF-RETN-AMT            PIC S9(13)V99
BEVD2G                                          COMP-3.
BEVD2G     05  WS-SELF-RETN-AMT                 PIC S9(13)V99
BEVD2G                                          COMP-3.	
BEVD2G     05  WS-NOT-EXCD-SELF-RETN-AMT        PIC S9(13)V99
BEVD2G                                          COMP-3.
BEVD2G     05  WS-SELF-RETN-LIMIT               PIC S9(13)V99
BEVD2G                                          COMP-3.
BEVD2G     05  WS-MLJ-UW-AMT                    PIC S9(13)V99
BEVD2G                                          COMP-3.
BEVD2G     05  WS-SP24-SELF-RETN-AMT            PIC S9(13)V99
BEVD2G                                          COMP-3.
BEVD2G     05  WS-SPWL-SELF-RETN-AMT            PIC S9(13)V99
BEVD2G                                          COMP-3.
BEVD2G     05  WS-AGSPWL-DT                     PIC X(10).											
       01  WS-WORK-AREA.
           05 WS-ALD                            PIC X(02) VALUE '01'.

      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
      *
BEVD2G COPY CCWL2430.
BEVD2G COPY CCWL9D95.
BEVD2G COPY CCWLCRCV.
BEVD2G COPY CCWL0186.
       COPY CCWLPGA.
       COPY CCWWCCC.
      /
       COPY XCWWHDG.
       COPY CCWWINDX.
      /
       COPY XCWWTIME.
       COPY XCWWWKDT.
       COPY CCWWLOCK.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      /
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFWCVG.
       COPY CCFRCVG.
      /
       COPY CCFRRINS.
       COPY CCFWRINS.
      /
BEVD2G COPY CCFHCVGS.
BEVD2G COPY CCFHPOL.
BEVD2G COPY CCFRRL.
BEVD2G COPY CCFWRL.	  
       COPY CCFRETAB.
       COPY CCFWETAB.
       COPY NCFWTTAB.
       COPY NCFRTTAB.
       COPY CCFWEDIT.
       COPY CCFREDIT.
       COPY CCFRPD.
       COPY CCFWPD.
      /
       COPY CCFWMAST.
       COPY CCFRMAST.
       COPY CCFRPH.
       COPY CCFWPH.
      /
       COPY XCWL1660.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY 9995
                               ==':ID:'==  BY =='9995'==.
       COPY ZCSR9995.                               
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY OCF
                               ==':ID:'==  BY =='OCF'==.
       COPY XCSROCF.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
      *
       COPY CCWL0950.      
       COPY XCWL0035.
       COPY CCWL0010.
       COPY XCWL0040.
       COPY XCWL8090.
BEVD2G COPY XCWL0289.
       COPY XCWLDTLK.
       COPY XCWTFCMD.
       COPY CCWWCVGS.
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
      
           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.
      
           PERFORM  2000-INITIALIZE
               THRU 2000-INITIALIZE-X.
      
           PERFORM  3000-UPDATE-PROCESS
               THRU 3000-UPDATE-PROCESS-X
               UNTIL W9995-SEQ-IO-EOF.
      
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

           PERFORM  9995-1000-OPEN-INPUT
               THRU 9995-1000-OPEN-INPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       2000-INITIALIZE.
      *----------------

           INITIALIZE WS-PGM-WORK-AREA.

           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.

           PERFORM  BCF-1000-READ
               THRU BCF-1000-READ-X.

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
               GO TO 2000-INITIALIZE-X
           END-IF.

           PERFORM  9995-1000-READ
               THRU 9995-1000-READ-X

           IF NOT W9995-SEQ-IO-OK
      *MSG: INPUT FILE IS EMPTY
               MOVE 'ZS99950001'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-INITIALIZE-X
           END-IF.

       2000-INITIALIZE-X.
           EXIT.
      /
      *--------------------
       3000-UPDATE-PROCESS.
      *--------------------

           MOVE R9995-CVG-NUM               TO WS-CVG.
           MOVE R9995-POL-ID                TO WPOL-POL-ID.
      
           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.
      
           IF  WPOL-IO-NOT-FOUND        
      *MSG : ' POLICY (@1) DOES NOT EXIST'.
               MOVE WPOL-KEY                TO WGLOB-MSG-PARM(1)
               MOVE 'XS00000070'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           
               PERFORM  9995-1000-READ
                   THRU 9995-1000-READ-X

               GO TO 3000-UPDATE-PROCESS-X
           END-IF.
           
           PERFORM  3100-PLIN-HEADER-CALL
               THRU 3100-PLIN-HEADER-CALL-X.
      
           PERFORM  CVGS-1000-LOAD-CVGS-ARRAY    
               THRU CVGS-1000-LOAD-CVGS-ARRAY-X.
      
      *MSG: PROCESSING POLICY ID @1.
           MOVE 'ZS99950002'                TO WGLOB-MSG-REF-INFO.
           MOVE RPOL-POL-ID                 TO WGLOB-MSG-PARM (1).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

           MOVE LOW-VALUES                  TO WRINS-KEY.
           MOVE HIGH-VALUES                 TO WRINS-ENDBR-KEY.
           MOVE RPOL-POL-ID                 TO WRINS-POL-ID.
           MOVE RPOL-POL-ID                 TO WRINS-ENDBR-POL-ID.
           MOVE WS-CVG-N                    TO WRINS-CVG-NUM-N.
           MOVE WS-CVG-N                    TO WRINS-ENDBR-CVG-NUM-N.          

           PERFORM  RINS-1000-BROWSE
               THRU RINS-1000-BROWSE-X.
      
           PERFORM  RINS-2000-READ-NEXT
               THRU RINS-2000-READ-NEXT-X.
      
           IF  WRINS-IO-OK
BEVD2G         CONTINUE
BEVD2G     ELSE
               PERFORM  RINS-3000-END-BROWSE
                   THRU RINS-3000-END-BROWSE-X

               PERFORM  9995-1000-READ
                   THRU 9995-1000-READ-X
               GO TO 3000-UPDATE-PROCESS-X
           END-IF.

           PERFORM  RINS-3000-END-BROWSE
               THRU RINS-3000-END-BROWSE-X.
               
BEVD2G     IF  RPOL-PROD-APP-TYP-SP24
BEVD2G     OR  RPOL-PROD-APP-TYP-SPWL
BEVD2G         MOVE RRINS-HIST-RETN-EXCL-TERM-AMT
BEVD2G                                      TO WS-SP24-SELF-RETN-AMT
BEVD2G         MOVE RRINS-HIST-RETN-INCL-TERM-AMT
BEVD2G                                      TO WS-SPWL-SELF-RETN-AMT
BEVD2G     END-IF
BEVD2G

      *PROCESS THE COMMON FIELDS
           PERFORM  3200-UPDT-REINS-DTLS
               THRU 3200-UPDT-REINS-DTLS-X.
      
           PERFORM  9995-1000-READ
               THRU 9995-1000-READ-X.
      
       3000-UPDATE-PROCESS-X.
           EXIT.
      /
      *----------------------
       3100-PLIN-HEADER-CALL.
      *----------------------
      *
           MOVE RPOL-POL-BASE-CVG-NUM       TO I.
           PERFORM  PLIN-1000-PLAN-HEADER-IN
               THRU PLIN-1000-PLAN-HEADER-IN-X.
      
           MOVE WPH-KEY                     TO WPD-KEY.
      
           PERFORM  PDIN-1000-PLAN-DEFAULTS-IN
               THRU PDIN-1000-PLAN-DEFAULTS-IN-X.
      
       3100-PLIN-HEADER-CALL-X.
           EXIT.
      /
      *---------------------
       3200-UPDT-REINS-DTLS.
      *---------------------

S24793*           SET WS-AUTO-REINS-NO             TO TRUE.
      
S24793*           MOVE 'REATM'                     TO WEDIT-ETBL-TYP-ID.
S24793*           MOVE WCVGS-PLAN-ID (WS-CVG-N)    TO WEDIT-ETBL-VALU-ID.
S24793*           MOVE WGLOB-USER-LANG             TO WEDIT-ETBL-LANG-CD.
S24793*            
S24793*           PERFORM  EDIT-1000-READ
S24793*               THRU EDIT-1000-READ-X.
S24793*      
S24793*      *UPDATE AUTOMATIC REINSURANCE
S24793*           IF  (WEDIT-IO-OK
S24793*           AND REDIT-ETBL-DESC-TXT = WCVGS-CVG-REINS-CO-ID (WS-CVG-N))
S24793*           OR  (RPD-AUTO-REINS-CO-ID NOT = SPACES
S24793*           AND RPD-AUTO-REINS-CO-ID = WCVGS-CVG-REINS-CO-ID (WS-CVG-N))
S24793*               SET WS-AUTO-REINS-YES        TO TRUE
S24793*               PERFORM  3300-WRITE-RINS-DTLS
S24793*                   THRU 3300-WRITE-RINS-DTLS-X
S24793*               GO TO 3200-UPDT-REINS-DTLS-X
S24793*           END-IF.

      *UPDATE FACULTATIVE REINSURANCE
BEVD2G*           PERFORM  3300-WRITE-RINS-DTLS
BEVD2G*               THRU 3300-WRITE-RINS-DTLS-X.
BEVD2G*ONE SHOT PROGRAM MODIFIED TO SUPPORT BEAVER LAUNCH
BEVD2G         PERFORM  3300-WRITE-RINS-SP24-DTLS
BEVD2G             THRU 3300-WRITE-RINS-SP24-DTLS-X.
      
       3200-UPDT-REINS-DTLS-X.
           EXIT.
      /
BEVD2G*-------------------------
BEVD2G 3300-WRITE-RINS-SP24-DTLS.
BEVD2G*-------------------------
BEVD2G* REINSURANCE CREATION FOR BEAVER
BEVD2G
BEVD2G     PERFORM  3310-CALC-REINS-PCT
BEVD2G         THRU 3310-CALC-REINS-PCT-X.
BEVD2G
BEVD2G     PERFORM  3340-GET-AUTO-REINS-DTLS
BEVD2G         THRU 3340-GET-AUTO-REINS-DTLS-X.
BEVD2G
BEVD2G 3300-WRITE-RINS-SP24-DTLS-X.
BEVD2G     EXIT.
BEVD2G/
BEVD2G*-----------------------
BEVD2G 3310-CALC-REINS-PCT.
BEVD2G*-----------------------
BEVD2G*ONE SHOT PROGRAM MODIFIED TO SUPPORT L-SPWL LAUNCH
BEVD2G
BEVD2G     IF  RPOL-PROD-APP-TYP-SPWL
BEVD2G         SET  WS-SRC-POL-PROD-SW      TO TRUE
BEVD2G         PERFORM  3311-CALC-REINS-PCT-SW
BEVD2G             THRU 3311-CALC-REINS-PCT-SW-X
BEVD2G         GO TO 3310-CALC-REINS-PCT-X
BEVD2G     END-IF.
BEVD2G*ORIGINAL POLICY & COVERAGE DETAILS STORED TO RESTORE 
BEVD2G*ONCE CALCULATION COMPLETED
BEVD2G         
BEVD2G     SET WS-SRC-POL-PROD-SP           TO TRUE.
BEVD2G     MOVE RPOL-REC-INFO               TO HPOL-REC-INFO.
BEVD2G     MOVE WCVGS-WORK-AREA             TO HCVGS-WORK-AREA.
BEVD2G
BEVD2G     PERFORM  2430-1000-BUILD-PARM-INFO
BEVD2G         THRU 2430-1000-BUILD-PARM-INFO-X.
BEVD2G         
BEVD2G     MOVE RPOL-POL-ID                TO L2430-POL-ID.
BEVD2G
BEVD2G     PERFORM  2430-3100-GET-PRIM-INSRD
BEVD2G         THRU 2430-3100-GET-PRIM-INSRD-X.
BEVD2G         
BEVD2G     IF  L2430-RETRN-OK
BEVD2G         CONTINUE
BEVD2G     ELSE
BEVD2G*CLIENT ID NOT FOUND FOR POL @1
BEVD2G         MOVE R9995-POL-ID            TO WGLOB-MSG-PARM (1)
BEVD2G         MOVE 'ZS99950003'            TO WGLOB-MSG-REF-INFO
BEVD2G         PERFORM  0260-1000-GENERATE-MESSAGE
BEVD2G             THRU 0260-1000-GENERATE-MESSAGE-X
BEVD2G         GO TO 3310-CALC-REINS-PCT-X
BEVD2G     END-IF.
BEVD2G     
BEVD2G     
BEVD2G     PERFORM  6000-CALC-BASIC-AMT
BEVD2G         THRU 6000-CALC-BASIC-AMT-X.
BEVD2G         
BEVD2G         
BEVD2G     PERFORM  3320-CALC-QS-PART
BEVD2G         THRU 3320-CALC-QS-PART-X.
BEVD2G         
BEVD2G     COMPUTE WS-SUR-PLUS-AMT = 
BEVD2G                   WS-UW-AMT - WS-QS-AMT.
BEVD2G     
BEVD2G     PERFORM  3321-CED-PCT-CALC
BEVD2G         THRU 3321-CED-PCT-CALC-X.
BEVD2G         
BEVD2G         
BEVD2G     MOVE HPOL-REC-INFO               TO RPOL-REC-INFO.
BEVD2G     MOVE HCVGS-WORK-AREA             TO WCVGS-WORK-AREA.
BEVD2G 
BEVD2G 3310-CALC-REINS-PCT-X.
BEVD2G     EXIT.
BEVD2G/
BEVD2G*-------------------------------
BEVD2G 3311-CALC-REINS-PCT-SW.
BEVD2G*-------------------------------
BEVD2G*ORIGINAL POLICY & COVERAGE DETAILS STORED TO RESTORE 
BEVD2G*ONCE CALCULATION COMPLETED
BEVD2G          
BEVD2G     MOVE RPOL-REC-INFO               TO HPOL-REC-INFO.
BEVD2G     MOVE WCVGS-WORK-AREA             TO HCVGS-WORK-AREA.
BEVD2G
BEVD2G     PERFORM  2430-1000-BUILD-PARM-INFO
BEVD2G         THRU 2430-1000-BUILD-PARM-INFO-X.
BEVD2G         
BEVD2G     MOVE RPOL-POL-ID                 TO L2430-POL-ID.
BEVD2G
BEVD2G     PERFORM  2430-3100-GET-PRIM-INSRD
BEVD2G         THRU 2430-3100-GET-PRIM-INSRD-X.
BEVD2G         
BEVD2G     IF  L2430-RETRN-OK
BEVD2G         CONTINUE
BEVD2G     ELSE
BEVD2G*CLIENT ID NOT FOUND FOR POL @1
BEVD2G         MOVE R9995-POL-ID            TO WGLOB-MSG-PARM (1)
BEVD2G         MOVE 'ZS99950003'            TO WGLOB-MSG-REF-INFO
BEVD2G         PERFORM  0260-1000-GENERATE-MESSAGE
BEVD2G             THRU 0260-1000-GENERATE-MESSAGE-X
BEVD2G         GO TO 3311-CALC-REINS-PCT-SW-X
BEVD2G     END-IF.
BEVD2G     
BEVD2G     SET WS-MLJ-PCT1                  TO TRUE.           
BEVD2G
BEVD2G     PERFORM  6000-CALC-BASIC-AMT
BEVD2G         THRU 6000-CALC-BASIC-AMT-X.
BEVD2G		   
BEVD2G     PERFORM  3322-EXCD-RETN-AMT
BEVD2G         THRU 3322-EXCD-RETN-AMT-X.
BEVD2G
BEVD2G     PERFORM  3323-NOT-EXCD-RETN-AMT
BEVD2G         THRU 3323-NOT-EXCD-RETN-AMT-X.
BEVD2G
BEVD2G     PERFORM  3324-CALC-SPWL-CED-PCT
BEVD2G         THRU 3324-CALC-SPWL-CED-PCT-X.
BEVD2G
BEVD2G     MOVE HPOL-REC-INFO               TO RPOL-REC-INFO.
BEVD2G     MOVE HCVGS-WORK-AREA             TO WCVGS-WORK-AREA.        
BEVD2G 
BEVD2G 3311-CALC-REINS-PCT-SW-X.
BEVD2G     EXIT.
BEVD2G/  
BEVD2G*----------------------
BEVD2G 3320-CALC-QS-PART.
BEVD2G*----------------------
BEVD2G
BEVD2G* TOTAL LIMIT RETENTION FOR GI-SPWL
BEVD2G     MOVE R9995-POL-ID                TO WPOL-POL-ID.
BEVD2G
BEVD2G     PERFORM  POL-1000-READ
BEVD2G         THRU POL-1000-READ-X.
BEVD2G         
BEVD2G     PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
BEVD2G         THRU CVGS-1000-LOAD-CVGS-ARRAY-X.
BEVD2G     
BEVD2G     MOVE RPOL-POL-BASE-CVG-NUM       TO I.
BEVD2G
BEVD2G     PERFORM  PLIN-1000-PLAN-HEADER-IN
BEVD2G         THRU PLIN-1000-PLAN-HEADER-IN-X.
BEVD2G
BEVD2G     PERFORM  0186-1000-BUILD-PARM-INFO
BEVD2G         THRU 0186-1000-BUILD-PARM-INFO-X.
BEVD2G
BEVD2G     SET  L0186-PLAN-RT-TYP-REINS     TO TRUE.
BEVD2G     MOVE RPOL-PLAN-ID                TO L0186-PLAN-ID.
BEVD2G     MOVE RPOL-POL-ISS-EFF-DT         TO L0186-EFF-DT.
BEVD2G     MOVE WCVGS-CVG-RT-AGE-N (I)      TO L0186-RT-AGE-N.
BEVD2G
BEVD2G     PERFORM  0186-3000-GET-PLRT
BEVD2G         THRU 0186-3000-GET-PLRT-X.
BEVD2G
BEVD2G     IF  L0186-RETRN-OK   
BEVD2G         COMPUTE WS-LIMIT-AMT = 
BEVD2G                            L0186-RT (7) - WS-BASIC-S-AMT
BEVD2G
BEVD2G         COMPUTE WS-SELF-RETN-LIMIT = 
BEVD2G                                 ( L0186-RT (8) * 100 ) 
BEVD2G                               - (WS-SP24-SELF-RETN-AMT)
BEVD2G     ELSE
BEVD2G         PERFORM  7100-RATE-LOOKUP-ERROR
BEVD2G             THRU 7100-RATE-LOOKUP-ERROR-X
BEVD2G     END-IF.
BEVD2G     
BEVD2G     IF  WS-LIMIT-AMT < ZERO
BEVD2G         MOVE ZEROS                   TO WS-LIMIT-AMT
BEVD2G     END-IF.
BEVD2G     
BEVD2G*SMALLER VALUE WILL CONSIDER FOR QS PART
BEVD2G
BEVD2G     IF  WS-UW-AMT > WS-LIMIT-AMT
BEVD2G         IF WS-LIMIT-AMT > WS-SELF-RETN-LIMIT
BEVD2G             MOVE WS-SELF-RETN-LIMIT  TO WS-QS-AMT
BEVD2G         ELSE
BEVD2G             MOVE WS-LIMIT-AMT        TO WS-QS-AMT
BEVD2G         END-IF
BEVD2G     ELSE
BEVD2G         IF WS-UW-AMT > WS-SELF-RETN-LIMIT
BEVD2G             MOVE WS-SELF-RETN-LIMIT  TO WS-QS-AMT
BEVD2G         ELSE
BEVD2G             MOVE WS-UW-AMT           TO WS-QS-AMT
BEVD2G         END-IF
BEVD2G     END-IF.           
BEVD2G
BEVD2G 3320-CALC-QS-PART-X.
BEVD2G     EXIT.
BEVD2G/
BEVD2G*-------------------------------
BEVD2G 3321-CED-PCT-CALC.
BEVD2G*-------------------------------
BEVD2G
BEVD2G     IF  WS-UW-AMT = ZERO
BEVD2G         GO TO 3321-CED-PCT-CALC-X
BEVD2G     END-IF.
BEVD2G
BEVD2G*CEDING PERCENTAGE FOR SWISS 
BEVD2G
BEVD2G     COMPUTE L0289-CRCY-AMT =
BEVD2G         ((WS-QS-AMT * L0186-RT (1)) +
BEVD2G         (WS-SUR-PLUS-AMT * L0186-RT (2))) /
BEVD2G         WS-UW-AMT.
BEVD2G
BEVD2G     PERFORM  0289-4000-CRCY-RND-UP
BEVD2G         THRU 0289-4000-CRCY-RND-UP-X.
BEVD2G
BEVD2G     MOVE L0289-CRCY-AMT              TO WS-SWI-CED-PCT.
BEVD2G
BEVD2G*CEDING PERCENTAGE FOR SCOR
BEVD2G
BEVD2G     COMPUTE L0289-CRCY-AMT =
BEVD2G         ((WS-QS-AMT * L0186-RT (3)) +
BEVD2G         (WS-SUR-PLUS-AMT * L0186-RT (4))) /
BEVD2G         WS-UW-AMT.
BEVD2G
BEVD2G     PERFORM  0289-4000-CRCY-RND-UP
BEVD2G         THRU 0289-4000-CRCY-RND-UP-X.
BEVD2G
BEVD2G     MOVE L0289-CRCY-AMT              TO WS-SCOR-CED-PCT.
BEVD2G
BEVD2G*CEDING PERCENTAGE FOR PARTNER RE
BEVD2G
BEVD2G     COMPUTE L0289-CRCY-AMT =
BEVD2G         ((WS-QS-AMT * L0186-RT (5)) +
BEVD2G         (WS-SUR-PLUS-AMT * L0186-RT (6))) /
BEVD2G         WS-UW-AMT.
BEVD2G
BEVD2G     PERFORM  0289-4000-CRCY-RND-UP
BEVD2G         THRU 0289-4000-CRCY-RND-UP-X.
BEVD2G         
BEVD2G     MOVE L0289-CRCY-AMT              TO WS-PAR-CED-PCT.
BEVD2G     PERFORM  0186-1000-BUILD-PARM-INFO
BEVD2G         THRU 0186-1000-BUILD-PARM-INFO-X.
BEVD2G
BEVD2G     SET  L0186-PLAN-RT-TYP-REMQS     TO TRUE.
BEVD2G     MOVE RPOL-PLAN-ID                TO L0186-PLAN-ID.
BEVD2G     MOVE RPOL-POL-ISS-EFF-DT         TO L0186-EFF-DT.
BEVD2G     MOVE WCVGS-CVG-RT-AGE-N (I)      TO L0186-RT-AGE-N.
BEVD2G
BEVD2G     PERFORM  0186-3000-GET-PLRT
BEVD2G         THRU 0186-3000-GET-PLRT-X.		   
BEVD2G	   
BEVD2G* CALCULATION OF GI-SPWL MLJ UNDERWRITING AMOUNT
BEVD2G     IF  L0186-RETRN-OK
BEVD2G         COMPUTE L0289-CRCY-AMT =
BEVD2G             ((WS-QS-AMT * L0186-RT (1)) +
BEVD2G             (WS-SUR-PLUS-AMT * L0186-RT (2))) /
BEVD2G              WS-UW-AMT
BEVD2G
BEVD2G         PERFORM  0289-4000-CRCY-RND-UP
BEVD2G             THRU 0289-4000-CRCY-RND-UP-X
BEVD2G         
BEVD2G         MOVE L0289-CRCY-AMT          TO WS-MLJ-PCT
BEVD2G
BEVD2G         COMPUTE WS-MLJ-UW-AMT = WS-UW-AMT 
BEVD2G                               * WS-MLJ-PCT
BEVD2G     END-IF.
BEVD2G
BEVD2G 3321-CED-PCT-CALC-X.
BEVD2G     EXIT.
BEVD2G/
BEVD2G*-------------------------------
BEVD2G 3322-EXCD-RETN-AMT.
BEVD2G*-------------------------------
BEVD2G
BEVD2G     MOVE R9995-POL-ID                TO WPOL-POL-ID.
BEVD2G
BEVD2G     PERFORM  POL-1000-READ
BEVD2G         THRU POL-1000-READ-X.
BEVD2G         
BEVD2G     PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
BEVD2G         THRU CVGS-1000-LOAD-CVGS-ARRAY-X.
BEVD2G     
BEVD2G     MOVE RPOL-POL-BASE-CVG-NUM       TO I.
BEVD2G
BEVD2G     PERFORM  PLIN-1000-PLAN-HEADER-IN
BEVD2G         THRU PLIN-1000-PLAN-HEADER-IN-X.
BEVD2G
BEVD2G     PERFORM  0186-1000-BUILD-PARM-INFO
BEVD2G         THRU 0186-1000-BUILD-PARM-INFO-X.
BEVD2G
BEVD2G     SET  L0186-PLAN-RT-TYP-REINS     TO TRUE.
BEVD2G     MOVE RPOL-PLAN-ID                TO L0186-PLAN-ID.
BEVD2G     MOVE RPOL-POL-ISS-EFF-DT         TO L0186-EFF-DT.
BEVD2G     MOVE WCVGS-CVG-RT-AGE-N (I)      TO L0186-RT-AGE-N.
BEVD2G
BEVD2G     PERFORM  0186-3000-GET-PLRT
BEVD2G         THRU 0186-3000-GET-PLRT-X.
BEVD2G	  
BEVD2G     IF  L0186-RETRN-OK	   
BEVD2G         COMPUTE WS-OVER-ALL-SELF-RETN-AMT = 
BEVD2G           (WS-SPWL-SELF-RETN-AMT + WS-SPWL-BASIC-BNFT-AMT)
BEVD2G         - (L0186-RT (5) * 100 )
BEVD2G								 
BEVD2G         COMPUTE WS-SPWL-SELF-RETN-LMT = 
BEVD2G		                          WS-SPWL-HIST-RETN-AMT
BEVD2G					            - L0186-RT (6) * 100
BEVD2G      ELSE
BEVD2G         PERFORM  7100-RATE-LOOKUP-ERROR
BEVD2G             THRU 7100-RATE-LOOKUP-ERROR-X     
BEVD2G     END-IF.
BEVD2G
BEVD2G     IF  WS-OVER-ALL-SELF-RETN-AMT < 0
BEVD2G         MOVE ZEROES                  TO 
BEVD2G                                    WS-OVER-ALL-SELF-RETN-AMT
BEVD2G     END-IF.
BEVD2G
BEVD2G     IF  WS-SPWL-SELF-RETN-LMT < 0
BEVD2G         MOVE ZEROES                  TO WS-SPWL-SELF-RETN-LMT
BEVD2G     END-IF.
BEVD2G
BEVD2G     
BEVD2G     IF  WS-OVER-ALL-SELF-RETN-AMT > WS-SPWL-SELF-RETN-LMT
BEVD2G         MOVE WS-OVER-ALL-SELF-RETN-AMT  
BEVD2G	                                    TO WS-MAX-SELF-RETN-AMT
BEVD2G     ELSE
BEVD2G         MOVE WS-SPWL-SELF-RETN-LMT   TO WS-MAX-SELF-RETN-AMT
BEVD2G     END-IF.
BEVD2G   
BEVD2G     IF  WS-SPWL-BASIC-BNFT-AMT < WS-MAX-SELF-RETN-AMT
BEVD2G         MOVE WS-SPWL-BASIC-BNFT-AMT
BEVD2G	                                    TO WS-EXCD-SELF-RETN-AMT
BEVD2G     ELSE 
BEVD2G       MOVE WS-MAX-SELF-RETN-AMT      TO WS-EXCD-SELF-RETN-AMT	
BEVD2G     END-IF.			   
BEVD2G   
BEVD2G 3322-EXCD-RETN-AMT-X.
BEVD2G     EXIT.
BEVD2G/
BEVD2G*-------------------------------
BEVD2G 3323-NOT-EXCD-RETN-AMT.
BEVD2G*-------------------------------   
BEVD2G
BEVD2G     COMPUTE WS-SELF-RETN-AMT = WS-SPWL-BASIC-BNFT-AMT -
BEVD2G                                WS-EXCD-SELF-RETN-AMT.
BEVD2G   
BEVD2G     IF  WS-SELF-RETN-AMT > 0
BEVD2G         MOVE WS-SELF-RETN-AMT        TO 
BEVD2G	                               WS-NOT-EXCD-SELF-RETN-AMT
BEVD2G     ELSE
BEVD2G         MOVE ZEROES                  TO 
BEVD2G	                               WS-NOT-EXCD-SELF-RETN-AMT
BEVD2G     END-IF.
BEVD2G   
BEVD2G 3323-NOT-EXCD-RETN-AMT-X.
BEVD2G     EXIT.
BEVD2G/
BEVD2G*-------------------------------
BEVD2G 3324-CALC-SPWL-CED-PCT.
BEVD2G*-------------------------------
BEVD2G
BEVD2G*CEDING PERCENTAGE FOR SWISS 
BEVD2G
BEVD2G     IF  WS-SPWL-BASIC-BNFT-AMT = ZERO
BEVD2G         GO TO 3324-CALC-SPWL-CED-PCT-X
BEVD2G     END-IF.
BEVD2G
BEVD2G     COMPUTE L0289-CRCY-AMT =
BEVD2G         ((WS-EXCD-SELF-RETN-AMT * L0186-RT (1)) +
BEVD2G         (WS-NOT-EXCD-SELF-RETN-AMT * L0186-RT (4))) /
BEVD2G         WS-SPWL-BASIC-BNFT-AMT.
BEVD2G
BEVD2G     PERFORM  0289-4000-CRCY-RND-UP
BEVD2G         THRU 0289-4000-CRCY-RND-UP-X.
BEVD2G
BEVD2G     MOVE L0289-CRCY-AMT              TO WS-SWI-CED-PCT.
BEVD2G
BEVD2G*CEDING PERCENTAGE FOR SCOR
BEVD2G
BEVD2G     COMPUTE L0289-CRCY-AMT =
BEVD2G         ((WS-EXCD-SELF-RETN-AMT * L0186-RT (2)) +
BEVD2G         (WS-NOT-EXCD-SELF-RETN-AMT * L0186-RT (4))) /
BEVD2G         WS-SPWL-BASIC-BNFT-AMT.
BEVD2G
BEVD2G     PERFORM  0289-4000-CRCY-RND-UP
BEVD2G         THRU 0289-4000-CRCY-RND-UP-X.
BEVD2G
BEVD2G     MOVE L0289-CRCY-AMT              TO WS-SCOR-CED-PCT.
BEVD2G
BEVD2G*CEDING PERCENTAGE FOR PARTNER RE
BEVD2G
BEVD2G     COMPUTE L0289-CRCY-AMT =
BEVD2G         ((WS-EXCD-SELF-RETN-AMT * L0186-RT (3)) +
BEVD2G         (WS-NOT-EXCD-SELF-RETN-AMT * L0186-RT (4))) /
BEVD2G         WS-SPWL-BASIC-BNFT-AMT.
BEVD2G
BEVD2G     PERFORM  0289-4000-CRCY-RND-UP
BEVD2G         THRU 0289-4000-CRCY-RND-UP-X.
BEVD2G         
BEVD2G     MOVE L0289-CRCY-AMT              TO WS-PAR-CED-PCT.
BEVD2G
BEVD2G* CALCULATION OF SPWL MLJ UNDERWRITING AMOUNT
BEVD2G     COMPUTE WS-MLJ-PCT = WS-MLJ-PCT - (WS-SWI-CED-PCT
BEVD2G                        + WS-SCOR-CED-PCT + WS-PAR-CED-PCT).
BEVD2G 
BEVD2G     IF  WS-MLJ-PCT < 0
BEVD2G         MOVE ZEROES                  TO WS-MLJ-UW-AMT
BEVD2G         GO TO 3324-CALC-SPWL-CED-PCT-X
BEVD2G     END-IF.
BEVD2G
BEVD2G     COMPUTE WS-MLJ-UW-AMT = WS-SPWL-BASIC-BNFT-AMT 
BEVD2G                              * WS-MLJ-PCT.
BEVD2G
BEVD2G 3324-CALC-SPWL-CED-PCT-X.
BEVD2G     EXIT.
BEVD2G/
BEVD2G
BEVD2G*--------------------------
BEVD2G 3340-GET-AUTO-REINS-DTLS.
BEVD2G*--------------------------  
BEVD2G
BEVD2G    INITIALIZE   WS-REINS-TRTY-NUM.    
BEVD2G     
BEVD2G     MOVE RPOL-POL-BASE-CVG-NUM       TO I.
BEVD2G     MOVE WCVGS-PLAN-ID (I)           TO WETAB-ETBL-VALU-ID.
BEVD2G     MOVE 'TTAUT'                     TO WETAB-ETBL-TYP-ID.
BEVD2G     MOVE WETAB-KEY                   TO WETAB-ENDBR-KEY.
BEVD2G     MOVE HIGH-VALUES                 TO WETAB-ENDBR-ETBL-VALU-ID.
BEVD2G     MOVE RPOL-POL-ISS-EFF-DT         TO L1660-INTERNAL-DATE.
BEVD2G                                          
BEVD2G     PERFORM  1660-2000-CONVERT-INT-TO-INV
BEVD2G         THRU 1660-2000-CONVERT-INT-TO-INV-X.
BEVD2G     
BEVD2G     MOVE L1660-INVERTED-DATE         TO WETAB-ETBL-IDT-NUM.
BEVD2G     MOVE HIGH-VALUES                 TO
BEVD2G                                    WETAB-ENDBR-ETBL-IDT-NUM.
BEVD2G     
BEVD2G     PERFORM  ETAB-1000-BROWSE
BEVD2G         THRU ETAB-1000-BROWSE-X.
BEVD2G     
BEVD2G     PERFORM
BEVD2G         UNTIL NOT WETAB-IO-OK     
BEVD2G         PERFORM  ETAB-2000-READ-NEXT
BEVD2G             THRU ETAB-2000-READ-NEXT-X
BEVD2G     
BEVD2G         IF  WETAB-IO-OK 
BEVD2G             IF  RETAB-ETBL-VALU-ID (1:6) = WCVGS-PLAN-ID (I)
BEVD2G                 MOVE RETAB-ETBL-VALU-TXT 
BEVD2G                                      TO WS-REINS-TRTY-NUM
BEVD2G* GET REINSURANCE COMPANY, CEDING PERCENTAGE AND WRITE RINS RECORDS
BEVD2G      
BEVD2G                 PERFORM  3350-CREATE-AUTO-RINS-DTLS
BEVD2G                     THRU 3350-CREATE-AUTO-RINS-DTLS-X
BEVD2G             ELSE
BEVD2G                 SET WETAB-IO-EOF        TO TRUE
BEVD2G             END-IF
BEVD2G         END-IF
BEVD2G     END-PERFORM.
BEVD2G   
BEVD2G         PERFORM  ETAB-3000-END-BROWSE
BEVD2G             THRU ETAB-3000-END-BROWSE-X.
BEVD2G 
BEVD2G 3340-GET-AUTO-REINS-DTLS-X.
BEVD2G           EXIT.
BEVD2G/
BEVD2G*---------------------------
BEVD2G 3350-CREATE-AUTO-RINS-DTLS.
BEVD2G*---------------------------.
BEVD2G
BEVD2G     MOVE WS-REINS-TRTY-NUM           TO WEDIT-ETBL-VALU-ID.
BEVD2G     MOVE 'RECOM'                     TO WEDIT-ETBL-TYP-ID.
BEVD2G     MOVE WGLOB-USER-LANG             TO WEDIT-ETBL-LANG-CD.
BEVD2G
BEVD2G     PERFORM  EDIT-1000-READ
BEVD2G         THRU EDIT-1000-READ-X.
BEVD2G
BEVD2G     IF  WEDIT-IO-OK
BEVD2G         MOVE REDIT-ETBL-DESC-TXT     TO WS-AU-REINS-CO-ID
BEVD2G                                      
BEVD2G     ELSE
BEVD2G         GO TO 3350-CREATE-AUTO-RINS-DTLS-X
BEVD2G     END-IF.
BEVD2G
BEVD2G     EVALUATE TRUE
BEVD2G
BEVD2G          WHEN WS-AU-REINS-CO-ID-SWI
BEVD2G              MOVE WS-SWI-CED-PCT     TO WS-REINS-CED-PCT-AUTO
BEVD2G 
BEVD2G          WHEN WS-AU-REINS-CO-ID-SCO
BEVD2G              MOVE WS-SCOR-CED-PCT    TO WS-REINS-CED-PCT-AUTO
BEVD2G
BEVD2G          WHEN WS-AU-REINS-CO-ID-PAR
BEVD2G              MOVE WS-PAR-CED-PCT     TO WS-REINS-CED-PCT-AUTO
BEVD2G
BEVD2G          WHEN OTHER
BEVD2G              MOVE ZEROS              TO WS-REINS-CED-PCT-AUTO
BEVD2G
BEVD2G     END-EVALUATE.
BEVD2G     MOVE RPOL-POL-ID                 TO WRINS-POL-ID.
BEVD2G     MOVE R9995-CVG-NUM               TO WRINS-CVG-NUM.
BEVD2G     MOVE WS-REINS-TRTY-NUM           TO WRINS-REINS-TRTY-NUM.
BEVD2G     MOVE WS-AU-REINS-CO-ID           TO WRINS-REINS-CO-ID.
BEVD2G
BEVD2G     PERFORM  RINS-1000-READ
BEVD2G         THRU RINS-1000-READ-X.
BEVD2G
BEVD2G     IF  WRINS-IO-OK
BEVD2G         PERFORM  3360-UPDATE-RINS
BEVD2G             THRU 3360-UPDATE-RINS-X
BEVD2G     ELSE
BEVD2G         PERFORM  3370-CREATE-RINS
BEVD2G             THRU 3370-CREATE-RINS-X
BEVD2G     END-IF.
BEVD2G      
BEVD2G 3350-CREATE-AUTO-RINS-DTLS-X.
BEVD2G     EXIT.
BEVD2G/
BEVD2G*--------------------------
BEVD2G 3360-UPDATE-RINS.
BEVD2G*--------------------------
BEVD2G
BEVD2G     PERFORM  RINS-1000-READ-FOR-UPDATE
BEVD2G         THRU RINS-1000-READ-FOR-UPDATE-X.
BEVD2G
BEVD2G     MOVE WS-REINS-TRTY-NUM           TO RRINS-REINS-TRTY-NUM.
BEVD2G     MOVE WS-AU-REINS-CO-ID           TO RRINS-REINS-CO-ID.
BEVD2G     MOVE WS-REINS-CED-PCT-AU1        TO RRINS-REINS-CED-PCT.
BEVD2G     MOVE R9995-CVG-NUM               TO RRINS-CVG-NUM-N.
BEVD2G     MOVE RPOL-POL-ID                 TO RRINS-POL-ID.   
BEVD2G     SET RRINS-REINS-TYP-AUTO         TO TRUE.
BEVD2G     IF  RPOL-PROD-APP-TYP-SP24       
BEVD2G         MOVE WS-BASIC-S-AMT          TO RRINS-REINS-BASIC-S-AMT
BEVD2G         MOVE ZEROES                  TO 
BEVD2G                                      RRINS-HIST-RETN-AMT
BEVD2G     ELSE
BEVD2G         MOVE ZEROES                  TO RRINS-REINS-BASIC-S-AMT
BEVD2G         MOVE WS-SPWL-HIST-RETN-AMT   TO 
BEVD2G                                      RRINS-HIST-RETN-AMT 
BEVD2G     END-IF.
BEVD2G     MOVE WS-MLJ-UW-AMT               TO RRINS-SELF-RETN-AMT.
BEVD2G
BEVD2G     PERFORM  RINS-2000-REWRITE
BEVD2G         THRU RINS-2000-REWRITE.
BEVD2G
BEVD2G 3360-UPDATE-RINS-X.
BEVD2G     EXIT.
BEVD2G/
BEVD2G*--------------------------
BEVD2G 3370-CREATE-RINS.
BEVD2G*--------------------------
BEVD2G
BEVD2G     PERFORM  RINS-1000-CREATE
BEVD2G         THRU RINS-1000-CREATE-X.
BEVD2G
BEVD2G     MOVE WS-REINS-TRTY-NUM           TO RRINS-REINS-TRTY-NUM.
BEVD2G     MOVE WS-AU-REINS-CO-ID           TO RRINS-REINS-CO-ID.
BEVD2G     MOVE WS-REINS-CED-PCT-AU1        TO RRINS-REINS-CED-PCT.
BEVD2G     MOVE R9995-CVG-NUM               TO RRINS-CVG-NUM-N.
BEVD2G     MOVE RPOL-POL-ID                 TO RRINS-POL-ID.
BEVD2G     IF  RPOL-PROD-APP-TYP-SP24
BEVD2G         MOVE WS-BASIC-S-AMT          TO RRINS-REINS-BASIC-S-AMT
BEVD2G         MOVE ZEROES                  TO 
BEVD2G                                      RRINS-HIST-RETN-AMT
BEVD2G     ELSE
BEVD2G         MOVE ZEROES                  TO RRINS-REINS-BASIC-S-AMT
BEVD2G         MOVE WS-SPWL-HIST-RETN-AMT
BEVD2G                                      TO 
BEVD2G                                       RRINS-HIST-RETN-AMT 
BEVD2G     END-IF.
BEVD2G     MOVE WS-MLJ-UW-AMT               TO RRINS-SELF-RETN-AMT. 
BEVD2G     MOVE ZEROES                      TO 
BEVD2G                                  RRINS-HIST-RETN-EXCL-TERM-AMT.
BEVD2G     MOVE ZEROES                      TO 
BEVD2G                                  RRINS-HIST-RETN-INCL-TERM-AMT.
BEVD2G     
BEVD2G     SET RRINS-REINS-TYP-AUTO         TO TRUE.
BEVD2G
BEVD2G     PERFORM  RINS-1000-WRITE
BEVD2G         THRU RINS-1000-WRITE-X.
BEVD2G
BEVD2G 3370-CREATE-RINS-X.
BEVD2G     EXIT.
BEVD2G/	  
      *---------------------
       3300-WRITE-RINS-DTLS.
      *---------------------
      
           PERFORM  3400-BUILD-RINS-KEY
               THRU 3400-BUILD-RINS-KEY-X.
      
           PERFORM  RINS-1000-CREATE
               THRU RINS-1000-CREATE-X.
      
           MOVE WCVGS-CVG-REINS-TRTY-NUM(WS-CVG-N)
                                            TO RRINS-REINS-TRTY-NUM.
           MOVE WCVGS-CVG-REINS-CO-ID (WS-CVG-N)
                                            TO RRINS-REINS-CO-ID.
           MOVE WCVGS-CVG-REINS-CED-PCT (WS-CVG-N)
                                            TO RRINS-REINS-CED-PCT.
           MOVE WS-CVG                      TO RRINS-CVG-NUM.
           MOVE RPOL-POL-ID                 TO RRINS-POL-ID.
           MOVE WGLOB-COMPANY-CODE          TO RRINS-CO-ID.
           MOVE WGLOB-USER-ID               TO RRINS-PREV-UPDT-USER-ID.
           MOVE WGLOB-TRXN-GR-TS            TO RRINS-PREV-UPDT-TS.

S24793*           IF  WS-AUTO-REINS-YES
S24793*
S24793*               SET RRINS-REINS-TYP-AUTO     TO TRUE
S24793*
S24793*               SET WCVGS-REINS-TYP-AUTO (WS-CVG-N)
S24793*                                            TO TRUE
S24793*           ELSE
S24793*               SET RRINS-REINS-TYP-FACU     TO TRUE
S24793*               SET WCVGS-REINS-TYP-FACU (WS-CVG-N)
S24793*                                            TO TRUE
S24793*           END-IF.
S24793     MOVE WCVGS-REINS-TYP-CD (WS-CVG-N)  
S24793                                      TO RRINS-REINS-TYP-CD.

           PERFORM  RINS-1000-WRITE
               THRU RINS-1000-WRITE-X.

S24793*           MOVE WS-CVG-N                    TO I.
S24793*           PERFORM  CVGR-2000-REWRITE-COVERAGE
S24793*               THRU CVGR-2000-REWRITE-COVERAGE-X.

       3300-WRITE-RINS-DTLS-X.
           EXIT.
      /
      *--------------------
       3400-BUILD-RINS-KEY.
      *--------------------
      
           MOVE RPOL-POL-ID                 TO WRINS-POL-ID.
           MOVE WS-CVG-N                    TO WRINS-CVG-NUM.
           MOVE WCVGS-CVG-REINS-TRTY-NUM (WS-CVG-N)
                                            TO WRINS-REINS-TRTY-NUM.
           MOVE WCVGS-CVG-REINS-CO-ID (WS-CVG-N)
                                            TO WRINS-REINS-CO-ID.
      
       3400-BUILD-RINS-KEY-X.
           EXIT.
      /      
      *---------------------------
S24793*       3500-WRITE-COLI-REINS-INFO.
      *---------------------------

S24793*           IF  WCVGS-REINS-TYP-FACU (WS-CVG-N)
S24793*               PERFORM  3520-WRITE-FACU-REINS-INFO
S24793*                   THRU 3520-WRITE-FACU-REINS-INFO-X
S24793*           ELSE
S24793*               PERFORM  3540-WRITE-AUTO-REINS-INFO
S24793*                   THRU 3540-WRITE-AUTO-REINS-INFO-X
S24793*           END-IF.
S24793*
S24793*       3500-WRITE-COLI-REINS-INFO-X.
S24793*           EXIT.
      /
      *---------------------------
S24793*       3520-WRITE-FACU-REINS-INFO.
      *---------------------------

S24793*           PERFORM  3400-BUILD-RINS-KEY
S24793*               THRU 3400-BUILD-RINS-KEY-X.
      
S24793*           PERFORM  RINS-1000-CREATE
S24793*               THRU RINS-1000-CREATE-X.
      
S24793*           MOVE WCVGS-CVG-REINS-TRTY-NUM(WS-CVG-N)
S24793*                                            TO RRINS-REINS-TRTY-NUM.
S24793*           MOVE WCVGS-CVG-REINS-CO-ID (WS-CVG-N)
S24793*                                            TO RRINS-REINS-CO-ID.
S24793*           MOVE WCVGS-CVG-REINS-CED-PCT (WS-CVG-N)
S24793*                                            TO RRINS-REINS-CED-PCT.
S24793*           MOVE WS-CVG-N                    TO RRINS-CVG-NUM.
S24793*           MOVE RPOL-POL-ID                 TO RRINS-POL-ID.
S24793*           MOVE WGLOB-COMPANY-CODE          TO RRINS-CO-ID.
S24793*           MOVE WGLOB-USER-ID               TO RRINS-PREV-UPDT-USER-ID.
S24793*           MOVE WGLOB-TRXN-GR-TS            TO RRINS-PREV-UPDT-TS.
S24793*
S24793*           SET RRINS-REINS-TYP-FACU     TO TRUE
S24793*
S24793*           PERFORM  RINS-1000-WRITE
S24793*               THRU RINS-1000-WRITE-X.
S24793*
S24793*       3520-WRITE-FACU-REINS-INFO-X.
S24793*           EXIT.
      /      
      *---------------------------
       3540-WRITE-AUTO-REINS-INFO.
      *---------------------------

S24793*           INITIALIZE  WS-SUB3
S24793*                       WS-SUB4
S24793*                       WS-CONCAT-SSLT-PLAN-CD
S24793*                       WS-CONCAT-REINS-NUM-CD
S24793*                       WS-REINS-TRTY-NUM
S24793*                       WS-REINS-UNIQ-NUM.
S24793*           SET WS-TREATY-FND-NO             TO TRUE.
S24793*      
S24793*           MOVE LOW-VALUES                  TO WETAB-KEY.
S24793*           MOVE HIGH-VALUES                 TO WETAB-ENDBR-KEY.
S24793*           MOVE WCVGS-PLAN-ID (WS-CVG-N)    TO WETAB-ETBL-VALU-ID.
S24793*           MOVE 'TTAUT'                     TO WETAB-ETBL-TYP-ID.
S24793*           IF  RPOL-PROD-APP-TYP-SSLT
S24793*               PERFORM 
S24793*                   VARYING WS-SUB4 FROM 1 BY 1
S24793*                   UNTIL WS-SUB4 > RPOL-POL-CVG-REC-CTR-N
S24793*                    IF  WCVGS-PLAN-BNFT-ALD (WS-SUB4)
S24793*      
S24793*                      MOVE RPOL-PLAN-ID     TO WS-SSLT-PLAN-ID
S24793*                      MOVE WS-ALD           TO WS-CONCAT-ALD-CTR
S24793*                      MOVE WS-CONCAT-SSLT-PLAN-CD
S24793*                                            TO WETAB-ETBL-VALU-ID 
S24793*                    END-IF
S24793*                END-PERFORM
S24793*           END-IF.
S24793*           
S24793*           MOVE WETAB-KEY                   TO WETAB-ENDBR-KEY.
S24793*           MOVE RPOL-POL-ISS-EFF-DT         TO L1660-INTERNAL-DATE.
S24793*                                                
S24793*           PERFORM  1660-2000-CONVERT-INT-TO-INV
S24793*               THRU 1660-2000-CONVERT-INT-TO-INV-X.
S24793*           
S24793*           MOVE L1660-INVERTED-DATE         TO WETAB-ETBL-IDT-NUM.
S24793*           MOVE HIGH-VALUES                 TO
S24793*                                          WETAB-ENDBR-ETBL-IDT-NUM.
S24793*      
S24793*           PERFORM  ETAB-1000-BROWSE
S24793*               THRU ETAB-1000-BROWSE-X.
S24793*      
S24793*           IF  WETAB-IO-OK
S24793*      
S24793*               PERFORM  ETAB-2000-READ-NEXT
S24793*                   THRU ETAB-2000-READ-NEXT-X
S24793*      
S24793*               IF  WETAB-IO-OK 
S24793*                   MOVE RETAB-ETBL-VALU-TXT TO
S24793*                                       WS-REINS-TRTY-NUM
S24793*                   SET WS-TREATY-FND-YES    TO TRUE
S24793*               END-IF
S24793*      
S24793*               PERFORM  ETAB-3000-END-BROWSE
S24793*                   THRU ETAB-3000-END-BROWSE-X
S24793*           END-IF.
S24793*      
S24793*           IF  WS-TREATY-FND-YES
S24793*      
S24793*               SET WS-EDIT-FND-YES          TO TRUE
S24793*      
S24793*               MOVE +1                      TO WS-SUB3
S24793*      * GET REINSURANCE COMPANY, CEDING PERCENTAGE AND WRITE RINS RECORDS
S24793*      
S24793*               PERFORM  3550-CREATE-AUTO-RINS-DTLS
S24793*                   THRU 3550-CREATE-AUTO-RINS-DTLS-X
S24793*                   UNTIL WS-EDIT-FND-NO
S24793*           END-IF.
S24793*      
S24793*       3540-WRITE-AUTO-REINS-INFO-X.
S24793*           EXIT.
      /      
BEVD2G**---------------------------
BEVD2G* 3550-CREATE-AUTO-RINS-DTLS.
BEVD2G**---------------------------.
BEVD2G*
BEVD2G*     MOVE WS-REINS-TRTY-NUM           TO WS-CONCAT-REINS-NUM.
BEVD2G*     MOVE WS-SUB3                     TO WS-CONCAT-REINS-CTR.
BEVD2G*     MOVE WS-CONCAT-REINS-NUM-CD      TO WEDIT-ETBL-VALU-ID.
BEVD2G*
BEVD2G*     MOVE 'RECOM'                     TO WEDIT-ETBL-TYP-ID.
BEVD2G*     MOVE WGLOB-USER-LANG             TO WEDIT-ETBL-LANG-CD.
BEVD2G*
BEVD2G*     PERFORM  EDIT-1000-READ
BEVD2G*         THRU EDIT-1000-READ-X.
BEVD2G*
BEVD2G*     IF  WEDIT-IO-OK
BEVD2G*         MOVE REDIT-ETBL-DESC-TXT     TO WS-REINS-UNIQ-NUM
BEVD2G*         MOVE REDIT-ETBL-DESC-TXT (1:2)
BEVD2G*                                      TO WS-AU-REINS-CO-ID
BEVD2G*     ELSE
BEVD2G*               SET WS-EDIT-FND-NO           TO TRUE
BEVD2G*         GO TO 3550-CREATE-AUTO-RINS-DTLS-X
BEVD2G*     END-IF.
BEVD2G*
BEVD2G*    MOVE 'REPCT'                     TO WEDIT-ETBL-TYP-ID.
BEVD2G*    MOVE WS-REINS-UNIQ-NUM           TO WEDIT-ETBL-VALU-ID.
BEVD2G*    MOVE WGLOB-USER-LANG             TO WEDIT-ETBL-LANG-CD.
BEVD2G*     
BEVD2G*    PERFORM  EDIT-1000-READ
BEVD2G*        THRU EDIT-1000-READ-X.
BEVD2G*
BEVD2G*    IF  WEDIT-IO-OK
BEVD2G*        MOVE REDIT-ETBL-DESC-TXT     TO WS-REINS-CED-PCT-AUTO
BEVD2G*    ELSE
BEVD2G*        SET WS-EDIT-FND-NO           TO TRUE
BEVD2G*        GO TO 3550-CREATE-AUTO-RINS-DTLS-X
BEVD2G*    END-IF.
BEVD2G*
BEVD2G*    MOVE WCVGS-CVG-SEQ-NUM (WS-CVG-N)
BEVD2G*                                     TO WS-AU-CVG-NUM.
BEVD2G*     PERFORM  3555-BUILD-RINS-KEY
BEVD2G*         THRU 3555-BUILD-RINS-KEY-X.
BEVD2G*
BEVD2G*     PERFORM  RINS-1000-CREATE
BEVD2G*         THRU RINS-1000-CREATE-X.
BEVD2G*
BEVD2G*     MOVE WS-REINS-TRTY-NUM           TO RRINS-REINS-TRTY-NUM.
BEVD2G*     MOVE WS-AU-REINS-CO-ID           TO RRINS-REINS-CO-ID.
BEVD2G*     MOVE WS-REINS-CED-PCT-AU1        TO RRINS-REINS-CED-PCT.
BEVD2G*     MOVE WS-AU-CVG-NUM               TO RRINS-CVG-NUM.
BEVD2G*     MOVE RPOL-POL-ID                 TO RRINS-POL-ID.
BEVD2G*     MOVE WGLOB-COMPANY-CODE          TO RRINS-CO-ID.
BEVD2G*     MOVE WGLOB-USER-ID               TO RRINS-PREV-UPDT-USER-ID.
BEVD2G*     MOVE WGLOB-TRXN-GR-TS            TO RRINS-PREV-UPDT-TS.
BEVD2G*
BEVD2G*     SET RRINS-REINS-TYP-AUTO         TO TRUE.
BEVD2G*
BEVD2G*     PERFORM  RINS-1000-WRITE
BEVD2G*         THRU RINS-1000-WRITE-X.
BEVD2G*
BEVD2G*          ADD 1                            TO WS-SUB3.      
BEVD2G* 3550-CREATE-AUTO-RINS-DTLS-X.
BEVD2G*     EXIT.
BEVD2G*/
BEVD2G**--------------------
BEVD2G* 3555-BUILD-RINS-KEY.
BEVD2G**--------------------
BEVD2G*
BEVD2G*     MOVE RPOL-POL-ID                 TO WRINS-POL-ID.
BEVD2G*     MOVE WS-AU-CVG-NUM               TO WRINS-CVG-NUM.
BEVD2G*     MOVE WS-REINS-TRTY-NUM           TO WRINS-REINS-TRTY-NUM.
BEVD2G*     MOVE WS-AU-REINS-CO-ID           TO WRINS-REINS-CO-ID.
BEVD2G*
BEVD2G* 3555-BUILD-RINS-KEY-X.
BEVD2G*     EXIT.
BEVD2G*-------------------------
BEVD2G 6000-CALC-BASIC-AMT.
BEVD2G*-------------------------
BEVD2G     
BEVD2G     MOVE L2430-CLI-ID                TO WRL-CLI-ID.
BEVD2G     MOVE LOW-VALUES                  TO WRL-REL-SYS-REF-ID.
BEVD2G     MOVE HIGH-VALUES                 TO WRL-ENDBR-KEY.
BEVD2G     MOVE WRL-CLI-ID                  TO WRL-ENDBR-CLI-ID.
BEVD2G     
BEVD2G     PERFORM  RL-1000-BROWSE
BEVD2G         THRU RL-1000-BROWSE-X.
BEVD2G         
BEVD2G     PERFORM  RL-2000-READ-NEXT
BEVD2G         THRU RL-2000-READ-NEXT-X.
BEVD2G
BEVD2G     PERFORM  6100-CALC-INCR-AMT
BEVD2G         THRU 6100-CALC-INCR-AMT-X
BEVD2G         UNTIL WRL-IO-EOF.
BEVD2G
BEVD2G     PERFORM  RL-3000-END-BROWSE
BEVD2G         THRU RL-3000-END-BROWSE-X.
BEVD2G
BEVD2G 6000-CALC-BASIC-AMT-X.
BEVD2G     EXIT.
BEVD2G/      
BEVD2G*----------------------
BEVD2G 6100-CALC-INCR-AMT.
BEVD2G*-----------------------
BEVD2G
BEVD2G     MOVE RRL-REL-SYS-REF-POL-ID      TO WPOL-POL-ID.
BEVD2G     MOVE RPOL-POL-ISS-EFF-DT         TO R9995-POL-ISS-EFF-DT.
BEVD2G
BEVD2G     PERFORM  POL-1000-READ
BEVD2G         THRU POL-1000-READ-X.
BEVD2G         
BEVD2G         
BEVD2G     IF WPOL-IO-OK
BEVD2G     AND (RPOL-POL-STAT-PENDING
BEVD2G     OR   RPOL-POL-STAT-COMPLETE
BEVD2G     OR   RPOL-POL-STAT-PREM-PAY-REG)
BEVD2G     AND RPOL-POL-ISS-EFF-DT <= R9995-POL-ISS-EFF-DT 
BEVD2G         CONTINUE
BEVD2G     ELSE    
BEVD2G     
BEVD2G         PERFORM  RL-2000-READ-NEXT
BEVD2G             THRU RL-2000-READ-NEXT-X           
BEVD2G         GO TO 6100-CALC-INCR-AMT-X
BEVD2G     END-IF.             
BEVD2G         
BEVD2G     PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
BEVD2G         THRU CVGS-1000-LOAD-CVGS-ARRAY-X.
BEVD2G
BEVD2G
BEVD2G     IF  WS-SRC-POL-PROD-SW
BEVD2G         IF  RPOL-PROD-APP-TYP-SPWL
BEVD2G             PERFORM  6200-SPWL-REINS
BEVD2G                 THRU 6200-SPWL-REINS-X
BEVD2G         END-IF
BEVD2G         PERFORM  RL-2000-READ-NEXT
BEVD2G             THRU RL-2000-READ-NEXT-X
BEVD2G         GO TO 6100-CALC-INCR-AMT-X
BEVD2G     END-IF.
BEVD2G
BEVD2G     IF  RPOL-PROD-APP-TYP-SP24
BEVD2G     AND (RPOL-POL-STAT-PREM-PAYING
BEVD2G     OR  RPOL-POL-STAT-PENDING
BEVD2G     OR  RPOL-POL-STAT-COMPLETE)
BEVD2G     AND (RPOL-POL-ID NOT = R9995-POL-ID)
BEVD2G
BEVD2G         PERFORM  7000-CONV-BNFT-AMT
BEVD2G             THRU 7000-CONV-BNFT-AMT-X
BEVD2G
BEVD2G         COMPUTE WS-BASIC-S-AMT = 
BEVD2G                       WS-BASIC-S-AMT + WS-CNV-PMT-AMT
BEVD2G     END-IF.
BEVD2G     
BEVD2G     IF  RPOL-POL-ID = R9995-POL-ID
BEVD2G         PERFORM  7000-CONV-BNFT-AMT
BEVD2G             THRU 7000-CONV-BNFT-AMT-X
BEVD2G
BEVD2G         MOVE WS-CNV-PMT-AMT   TO WS-UW-AMT    
BEVD2G     END-IF.
BEVD2G
BEVD2G     PERFORM  RL-2000-READ-NEXT
BEVD2G         THRU RL-2000-READ-NEXT-X.
BEVD2G
BEVD2G 6100-CALC-INCR-AMT-X.
BEVD2G     EXIT.
BEVD2G/
BEVD2G*-------------------------------
BEVD2G 6200-SPWL-REINS.
BEVD2G*-------------------------------
BEVD2G
BEVD2G     IF  RPOL-PROD-APP-TYP-SPWL
BEVD2G     AND (RPOL-POL-STAT-PREM-PAYING
BEVD2G     OR  RPOL-POL-STAT-PENDING
BEVD2G     OR  RPOL-POL-STAT-COMPLETE)
BEVD2G
BEVD2G         PERFORM  7000-CONV-BNFT-AMT
BEVD2G             THRU 7000-CONV-BNFT-AMT-X
BEVD2G
BEVD2G         COMPUTE WS-SPWL-HIST-RETN-AMT = 
BEVD2G                     WS-SPWL-HIST-RETN-AMT + WS-CNV-PMT-AMT
BEVD2G     END-IF.
BEVD2G   
BEVD2G     IF  RPOL-POL-ID = R9995-POL-ID 
BEVD2G         PERFORM  7000-CONV-BNFT-AMT
BEVD2G             THRU 7000-CONV-BNFT-AMT-X
BEVD2G
BEVD2G         MOVE WS-CNV-PMT-AMT   TO WS-SPWL-BASIC-BNFT-AMT   
BEVD2G     END-IF.
BEVD2G
BEVD2G   
BEVD2G 6200-SPWL-REINS-X.
BEVD2G     EXIT.
BEVD2G/
BEVD2G*-------------------------------
BEVD2G 7000-CONV-BNFT-AMT.
BEVD2G*-------------------------------
BEVD2G
BEVD2G
BEVD2G     INITIALIZE WS-CNV-PMT-AMT.
BEVD2G               
BEVD2G     INITIALIZE WS-LMT-CHK-AMT-1.
BEVD2G     INITIALIZE WS-LMT-CHK-AMT-2.
BEVD2G
BEVD2G     PERFORM  CRCV-1000-BUILD-PARM
BEVD2G         THRU CRCV-1000-BUILD-PARM-X.
BEVD2G
BEVD2G     MOVE RPOL-POL-CRCY-CD            TO 
BEVD2G                                    LCRCV-XCHNG-FROM-CRCY-CD.
BEVD2G     MOVE 'JP'                        TO
BEVD2G                                    LCRCV-XCHNG-TO-CRCY-CD.
BEVD2G     MOVE WCVGS-CVG-FACE-AMT (RPOL-POL-BASE-CVG-NUM)
BEVD2G                                      TO
BEVD2G                                    LCRCV-XCHNG-INPUT-AMT.
BEVD2G     MOVE WGLOB-PROCESS-DATE          TO
BEVD2G                                    LCRCV-XCHNG-EFF-DT.
BEVD2G
BEVD2G     PERFORM  CRCV-3000-LMT-RT-CRCY-CNVR
BEVD2G         THRU CRCV-3000-LMT-RT-CRCY-CNVR-X.
BEVD2G
BEVD2G     IF  LCRCV-RETRN-OK
BEVD2G         DIVIDE  LCRCV-XCHNG-OUTPUT-AMT BY 100
BEVD2G         GIVING WS-LMT-CHK-AMT-1 
BEVD2G         REMAINDER WS-LMT-CHK-AMT-2
BEVD2G     END-IF.
BEVD2G
BEVD2G     IF  WS-LMT-CHK-AMT-2 > 0
BEVD2G         ADD +1                       TO WS-LMT-CHK-AMT-1
BEVD2G     END-IF.
BEVD2G   
BEVD2G     COMPUTE  WS-LMT-CHK-AMT-1 = WS-LMT-CHK-AMT-1 * 100.
BEVD2G     MOVE WS-LMT-CHK-AMT-1         TO WS-CNV-PMT-AMT.      
BEVD2G           
BEVD2G
BEVD2G 7000-CONV-BNFT-AMT-X.
BEVD2G     EXIT.
BEVD2G/
BEVD2G*----------------------------
BEVD2G 7100-RATE-LOOKUP-ERROR.
BEVD2G*----------------------------
BEVD2G* THIS PARA CHECKS FOR PLRT, RH, RT AND LGAS ERRORS      
BEVD2G     EVALUATE TRUE
BEVD2G         WHEN L0186-RETRN-BAD-PLRT-ACCESS
BEVD2G              GO TO 7100-RATE-LOOKUP-ERROR-X
BEVD2G         WHEN L0186-RETRN-BAD-RHDR-ACCESS
BEVD2G*MSG: RHDR RATE ERR: ID/RATE TYPE (@1/@2) FOR POL/CVG (@3/@4)
BEVD2G              MOVE 'RHDR'             TO WGLOB-MSG-PARM (1)
BEVD2G              MOVE 'ZS99950004'       TO WGLOB-MSG-REF-INFO
BEVD2G         WHEN L0186-RETRN-BAD-RLTB-ACCESS
BEVD2G*MSG: RLTB RATE ERR: ID/RATE TYPE (@1/@2) FOR POL/CVG (@3/@4)
BEVD2G              MOVE 'RLTB'             TO WGLOB-MSG-PARM (1)
BEVD2G              MOVE 'ZS99950005'       TO WGLOB-MSG-REF-INFO
BEVD2G         WHEN L0186-RETRN-BAD-LGAS-ACCESS
BEVD2G*MSG: LGAS RATE ERR: ID/RATE TYPE (@1/@2) FOR POL/CVG (@3/@4)
BEVD2G              MOVE 'LGAS'             TO WGLOB-MSG-PARM (1)
BEVD2G              MOVE 'ZS99950006'       TO WGLOB-MSG-REF-INFO
BEVD2G         WHEN OTHER
BEVD2G*MSG: MISC. RATE ERR: ID/RATE TYPE (@1/@2) FOR POL/CVG (@3/@4)
BEVD2G              MOVE L0186-ID           TO WGLOB-MSG-PARM (1)
BEVD2G              MOVE 'ZS99950007'       TO WGLOB-MSG-REF-INFO
BEVD2G               
BEVD2G     END-EVALUATE.
BEVD2G     MOVE L0186-PLAN-RT-TYP-CD        TO WGLOB-MSG-PARM (2).
BEVD2G     MOVE RPOL-POL-ID                 TO WGLOB-MSG-PARM (3).
BEVD2G     MOVE RCVG-CVG-NUM                TO WGLOB-MSG-PARM (4).
BEVD2G     PERFORM  0260-1000-GENERATE-MESSAGE
BEVD2G         THRU 0260-1000-GENERATE-MESSAGE-X.
BEVD2G             
BEVD2G 7100-RATE-LOOKUP-ERROR-X.
BEVD2G     EXIT.
BEVD2G/
      *-----------------
       9999-CLOSE-FILES.
      *-----------------
              
           PERFORM  9995-4000-CLOSE
               THRU 9995-4000-CLOSE-X.
      
           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.
      
           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.
      
       9999-CLOSE-FILES-X.
           EXIT.
      /     
      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************
       COPY CCPEOCCL.
      /
       COPY CCPEPRSM.
      /
       COPY CCPPCCC.
      /
       COPY XCPPTIME.
      /
       COPY NCPPCVGR.
       COPY NCPPCVGS.
      /
BEVD2G COPY CCPPMIDT.
      /
      *****************************************************************
      *  LINKAGE COPYBOOKS                                            *
      *****************************************************************
       COPY XCPL0035.
       COPY XCPL8090.
      /
       COPY CCPS0010.
       COPY CCPL0010.
      /
BEVD2G COPY CCPL9D95.
BEVD2G COPY CCPS9D95.
BEVD2G/
BEVD2G COPY CCPL2430.
BEVD2G COPY CCPS2430.
BEVD2G/
BEVD2G COPY CCPS0186.
BEVD2G COPY CCPL0186.
BEVD2G/
BEVD2G COPY CCPLCRCV.
BEVD2G COPY CCPSCRCV.
BEVD2G/
       COPY XCPL1660.
      /
       COPY XCPL0030.
      /
       COPY XCPL0040.
      /
       COPY XCPL0260.
      /
       COPY CCPS0950.
       COPY CCPL0950.
      /
       COPY XCPLBCF.
      /
       COPY XCPLOCF.
      /
BEVD2G COPY XCPL0289.
      /
      *****************************************************************
      *  FILE I/O COPYBOOKS                                           *
      *****************************************************************
       COPY CCPNMAST.
      /
       COPY CCPBETAB.
       COPY NCPNTTAB.
      /
       COPY CCPNPOL.
       COPY CCPARINS.
       COPY CCPCRINS.
       COPY CCPBRINS.
       COPY CCPNRINS.
BEVD2G COPY CCPURINS.
       COPY CCPNPH.
       COPY CCPNPD.
       COPY CCPPPLIN.
       COPY CCPPPDIN.
      /
BEVD2G COPY CCPBRL.
BEVD2G COPY CCPVRL.
      /
       COPY CCPNCVG.
       COPY CCPUCVG.
      /
       COPY CCPNEDIT.
      /
       COPY XCPNBCF.
      /
       COPY XCPOBCF.
      /
       COPY XCPOOCF.
      
       COPY XCSLFILE REPLACING ==:ID:==  BY 9995
                               ==':PGM:'== BY =='ZSRQ9995'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY 9995.
       COPY XCSASEQ  REPLACING ==:ID:==  BY 9995.       
       COPY XCSNSEQ  REPLACING ==:ID:==  BY 9995.
      /
      *****************************************************************
      **                 END OF PROGRAM ZSBM9995                     **
      *****************************************************************