      *****************************************************************
      **  MEMBER :  ZSBM9327                                         **
      **  REMARKS:  CLAIM BENEFIT DECISION INTERFACE FILE CREATE     **
      **            ONE SHOT                                         **
      **  DOMAIN :  CM                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
MP282A**  25SEP15  ANTI-SOCIAL CHANGES                               **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBM9327.

       COPY XCWWCRHT.

      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.

      ***************
       DATA DIVISION.
      ***************
       FILE SECTION.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM9327'.
       COPY SQLCA.

       01  WORK-AREAS-COMP                 COMP-3.
           05  WS-TOT-RECS-READ            PIC S9(9) VALUE ZERO.
           05  WS-DETAIL-RECS-WRITTEN      PIC S9(9) VALUE ZERO.
           05  WS-TOT-RECS-WRITTEN         PIC S9(9) VALUE ZERO.

       01  WS-WORK-AREA.
           05  WS-TRANSFER-FILE-ID         PIC X(08) VALUE 'SLH01909'.
           05  WS-DATE-CC                  PIC 9(02).
           05  WS-DATE-C                   PIC 9(01).

SCR010     05  WS-BNFT-DECSN-PRCES-DT      PIC X(10).           
SCR010     05  WS-CLM-ID                   PIC X(08).
SCR010     05  WS-POL-ID                   PIC X(10).
SCR010     05  WS-CLBN-BNFT-DECSN-CD       PIC X(02).

           05  WS-CVG-CLI-REL-TYP-CD       PIC X(01).
               88 WS-CVG-CLI-REL-TYP-PRI   VALUE 'P'.                
               88 WS-CVG-CLI-REL-TYP-SEC   VALUE 'O'.

           05  WS-CONTROL-PIC              PIC Z(6)9.
           05  WS-KATAKANA-PREFIX          PIC X(01) VALUE SPACES.

EN0807     05  WS-CLBN-FINAL-MAJ-CD        PIC X(10).
EN0807     05  WS-CLBN-BNFT-DECSN-IND      PIC X(02).
EN0807         88 WS-CLBN-BNFT-DECSN-PAID  VALUE 'Y'.
EN0807      
      *  Index and Date work areas

P02229 COPY XCWL0035.

       COPY CCWWINDX.
       COPY XCWWWKDT.

      *  Batch File I/O Command constants

       COPY XCWTFCMD.

      *  Company Control record

       COPY CCWWCCC.

      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************

       COPY XCSWPRT  REPLACING ==:ID:==  BY OCF
                               ==':ID:'==  BY =='OCF'==.
       COPY XCSROCF. 
       
       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                                ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.             
       COPY XCSWSEQ  REPLACING ==:ID:==  BY 9326
                               ==':ID:'==  BY =='9326'==.
       COPY ZCSR9326.
       
       COPY XCSWSEQ  REPLACING ==:ID:==  BY 9327
                               ==':ID:'==  BY =='9327'==.
       COPY ZCSR9327.       
                          
       COPY CCFWPOL.
       COPY CCFRPOL.

       COPY CCFWCVGC.
       COPY CCFRCVGC.
       
       COPY NCFWTTAB.
       COPY NCFRTTAB.
       
       COPY XCFWXTAB.
       COPY XCFRXTAB.
      /
      *****************************************************************
      *     LINKAGE COPYBOOKS                                         *
      *****************************************************************
       COPY CCWL0010.
       COPY CCWL0950.
       COPY CCWL2435.
       COPY CCWL2440.

       COPY XCWL0040.
       COPY XCWL0280.
       COPY XCWL0289.
       COPY XCWL0290.
       COPY XCWL1670.
       COPY XCWL1680.
       COPY XCWL2490.
       COPY XCWLDTLK.
      /
      ********************
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       
      ********************
       PROCEDURE DIVISION.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  1000-INITIALIZE
               THRU 1000-INITIALIZE-X.

           PERFORM  2000-PROCESS-INPUT
               THRU 2000-PROCESS-INPUT-X
               UNTIL NOT W9326-SEQ-IO-OK.
               
           PERFORM  9000-FINALIZE
               THRU 9000-FINALIZE-X.

P02229     PERFORM  0035-1000-COMMIT
P02229         THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAINLINE-X.
           EXIT.

      /
      *----------------
       1000-INITIALIZE.
      *----------------

           PERFORM  1100-OPEN-FILES
               THRU 1100-OPEN-FILES-X.

      * Read and process Company control card from Batch Control File

      *    PERFORM  CCC-1000-PRCES-CO-CTL-CARD
      *        THRU CCC-1000-PRCES-CO-CTL-CARD-X.

      * Get Company Name and Report Titles

      *    PERFORM  0950-0000-INIT-PARM-INFO
      *        THRU 0950-0000-INIT-PARM-INFO-X.

      *    PERFORM  0950-1000-GET-COMPANY-NAME
      *        THRU 0950-1000-GET-COMPANY-NAME-X.

      *    PERFORM  1200-INIT-OCF-TITLES
      *        THRU 1200-INIT-OCF-TITLES-X.

      *    PERFORM  VRSN-1000-EDIT
      *        THRU VRSN-1000-EDIT-X.

      *    PERFORM  0290-1000-BUILD-PARM-INFO
      *        THRU 0290-1000-BUILD-PARM-INFO-X.

           MOVE 'CP'                        TO WGLOB-COMPANY-CODE.
           MOVE 'ZSBM9327'                  TO WGLOB-MAIN-PGM-ID
                                               WGLOB-CRNT-PGM-ID.

           PERFORM  0010-1000-INIT-DEFAULT
               THRU 0010-1000-INIT-DEFAULT-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           PERFORM  1200-INIT-OCF-TITLES
               THRU 1200-INIT-OCF-TITLES-X.

      * Check for empty input file 

           PERFORM  7000-READ-INPUT
               THRU 7000-READ-INPUT-X.

           IF  W9326-SEQ-IO-EOF
      *MSG: "INPUT FILE 9326 IS EMPTY; NOTHING TO EXTRACT"
               MOVE 'CS93270001'       TO WGLOB-MSG-REF-INFO
               PERFORM  0260-2000-GET-MESSAGE
                   THRU 0260-2000-GET-MESSAGE-X
               MOVE WGLOB-MSG-TXT      TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
           END-IF.

      * Write output file Header record

           PERFORM  1300-WRITE-HEADER
               THRU 1300-WRITE-HEADER-X.

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

           PERFORM  9326-1000-OPEN-INPUT
       	       THRU 9326-1000-OPEN-INPUT-X.

           PERFORM  9327-3000-OPEN-OUTPUT
               THRU 9327-3000-OPEN-OUTPUT-X.

       1100-OPEN-FILES-X.
           EXIT.

      /
      *---------------------
       1200-INIT-OCF-TITLES.
      *---------------------

           MOVE L0950-COMPANY-NAME     TO L0040-COMPANY-NAME.
           MOVE ZERO                   TO L0040-ERROR-CNT.

      *MSG: ERROR MESSAGES
           MOVE 'CS93270002'           TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT          TO L0040-PROGRAM-DESC.

      *MSG: GET THE SYSTEM ID FOR THE HEADING
           MOVE 'XS00000145'           TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT          TO L0040-SYSTEM-ID.

      *MSG: GET THE DETAIL HEADINGS 'RUN MESSAGES'
           MOVE 'XS00000153'           TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT          TO L0040-HDG-LINE-3.

           MOVE SPACES                 TO L0040-SBSDRY-CO-NAME.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

       1200-INIT-OCF-TITLES-X.
           EXIT.
           
      /
      *------------------
       1300-WRITE-HEADER.
      *------------------
      
      * Create Header record and write to output file
      
           MOVE SPACES TO R9327-SEQ-REC-INFO.

           SET R9327-REC-HEADER      TO TRUE.

           MOVE WS-TRANSFER-FILE-ID  TO R9327-FILE-ID.

           STRING R9326-BNFT-DECSN-PRCES-YR  DELIMITED BY SIZE
                  R9326-BNFT-DECSN-PRCES-MO  DELIMITED BY SIZE
                  R9326-BNFT-DECSN-PRCES-DY  DELIMITED BY SIZE
                                   INTO R9327-FILE-CREAT-DT.

           PERFORM  8000-WRITE-OUTPUT
               THRU 8000-WRITE-OUTPUT-X.

       1300-WRITE-HEADER-X.
           EXIT.
           
      ******************************************************************

      *-------------------
       2000-PROCESS-INPUT.
      *-------------------
SCR010
SCR010* Store key fields
SCR010
SCR010     MOVE R9326-BNFT-DECSN-PRCES-DT TO WS-BNFT-DECSN-PRCES-DT.
SCR010     MOVE R9326-CLM-ID              TO WS-CLM-ID.
SCR010     MOVE R9326-POL-ID              TO WS-POL-ID.
SCR010     MOVE R9326-CLBN-BNFT-DECSN-CD  TO WS-CLBN-BNFT-DECSN-CD.
           
      * Format output record
           
           MOVE SPACES  TO R9327-SEQ-REC-INFO.
           
           SET R9327-REC-DETAIL        TO TRUE.
           SET R9327-LOT-700           TO TRUE.
           SET R9327-CAT-CLAIMS        TO TRUE.
           SET R9327-C-NEW             TO TRUE.
           SET R9327-ERA-CHRISTIAN     TO TRUE.
           
           MOVE SPACES                 TO R9327-SERL-NUM.
           MOVE R9326-CLM-ID           TO R9327-ADMIN-ID.
           MOVE R9326-POL-ID           TO R9327-POL-ID.
           
      * Get Policy record
      
           MOVE R9326-POL-ID           TO WPOL-POL-ID.

           PERFORM POL-1000-READ
              THRU POL-1000-READ-X.

           IF WPOL-IO-NOT-FOUND
               MOVE WPOL-KEY           TO  WGLOB-MSG-PARM (1)
               MOVE 'XS00000097'       TO  WGLOB-MSG-REF-INFO
      *MSG: (S) 'POLICY RECORD NOT FOUND'
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  7000-READ-INPUT
                   THRU 7000-READ-INPUT-X             
               GO TO 2000-PROCESS-INPUT-X
           END-IF.           

      * Translate policy Base Plan ID to 3-digit code

           MOVE 'PRLRG'            TO WTTAB-ETBL-TYP-ID.
           MOVE RPOL-PLAN-ID       TO WTTAB-ETBL-VALU-ID.
           MOVE 'AD'               TO WTTAB-TTAB-ADMIN-APPL-ID.
           PERFORM  TTAB-1000-READ
               THRU TTAB-1000-READ-X.
           IF  WTTAB-IO-OK
               MOVE RTTAB-TTBL-VALU-TXT  TO R9327-POL-TYP-CD
           ELSE
               MOVE SPACES               TO R9327-POL-TYP-CD
           END-IF.           

      * Set Payment Request Date (7-digit MLJ date format YYYMMDD; 
      * year 2000 is converted to 100, 2001 to 101, etc.)
           
           MOVE R9326-PREV-UPDT-DCBD-DT (1:2) TO WS-DATE-CC.
           COMPUTE WS-DATE-C = WS-DATE-CC - 19.
           STRING WS-DATE-C                     DELIMITED BY SIZE
                  R9326-PREV-UPDT-DCBD-DT (3:2) DELIMITED BY SIZE
                  R9326-PREV-UPDT-DCBD-DT (6:2) DELIMITED BY SIZE
                  R9326-PREV-UPDT-DCBD-DT (9:2) DELIMITED BY SIZE
                                          INTO R9327-PMT-RQST-DT.
          
      * Set Creation Date (7-digit MLJ date format YYYMMDD)
          
           MOVE R9326-PREV-UPDT-DCBD-DT (1:2) 
                                            TO WS-DATE-CC.
           COMPUTE WS-DATE-C = WS-DATE-CC - 19.
           STRING WS-DATE-C                     DELIMITED BY SIZE
                  R9326-PREV-UPDT-DCBD-DT (3:2) DELIMITED BY SIZE
                  R9326-PREV-UPDT-DCBD-DT (6:2) DELIMITED BY SIZE
                  R9326-PREV-UPDT-DCBD-DT (9:2) DELIMITED BY SIZE
                                          INTO R9327-REC-CREAT-DT.
           
      * Get Client ID from Coverage Client table
      
           MOVE LOW-VALUES     TO WCVGC-KEY.
           MOVE R9326-POL-ID   TO WCVGC-POL-ID.
           MOVE R9326-CVG-NUM  TO WCVGC-CVG-NUM.
           SET WS-CVG-CLI-REL-TYP-PRI TO TRUE.
           MOVE WS-CVG-CLI-REL-TYP-CD  
                               TO WCVGC-CVG-CLI-REL-TYP-CD.
           MOVE HIGH-VALUES    TO WCVGC-ENDBR-KEY.
           MOVE R9326-POL-ID   TO WCVGC-ENDBR-POL-ID.
           MOVE R9326-CVG-NUM  TO WCVGC-ENDBR-CVG-NUM.
           MOVE WS-CVG-CLI-REL-TYP-CD  
                               TO WCVGC-ENDBR-CVG-CLI-REL-TYP-CD.

           PERFORM  CVGC-1000-BROWSE
               THRU CVGC-1000-BROWSE-X.

           PERFORM  CVGC-2000-READ-NEXT
               THRU CVGC-2000-READ-NEXT-X.

           IF  NOT WCVGC-IO-OK
      *MSG: 'COVERAGE CLIENT RECORD (@1) NOT FOUND'
               MOVE 'CS93270006'  TO WGLOB-MSG-REF-INFO
               MOVE WCVGC-KEY     TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  CVGC-3000-END-BROWSE
                   THRU CVGC-3000-END-BROWSE-X
               PERFORM  7000-READ-INPUT
                   THRU 7000-READ-INPUT-X
               GO TO 2000-PROCESS-INPUT-X
           END-IF.

           PERFORM  CVGC-3000-END-BROWSE
               THRU CVGC-3000-END-BROWSE-X.

      * Get Client details

           PERFORM  2435-1000-BUILD-PARM-INFO
               THRU 2435-1000-BUILD-PARM-INFO-X.

           MOVE RCVGC-INSRD-CLI-ID          TO L2435-CLI-ID.

           PERFORM  2435-1000-OBTAIN-CLI-INFO
               THRU 2435-1000-OBTAIN-CLI-INFO-X.

           IF L2435-RETRN-CLI-NOT-FOUND
               MOVE SPACES                  TO R9327-CLI-NM
           ELSE
               MOVE L2435-CLI-NM-COMPRESSED TO R9327-CLI-NM
           END-IF.

      * Set Birth Date (6-digit format YYMMDD)  

           IF L2435-RETRN-OK
               STRING L2435-CLI-BTH-DT (3:2) DELIMITED BY SIZE
                      L2435-CLI-BTH-DT (6:2) DELIMITED BY SIZE
                      L2435-CLI-BTH-DT (9:2) DELIMITED BY SIZE 
                                          INTO R9327-BTH-DT
           ELSE
               MOVE ZEROS                   TO R9327-BTH-DT
           END-IF.
           
      * Translate Sex Code

           IF L2435-RETRN-CLI-NOT-FOUND
               MOVE SPACES                  TO R9327-CLI-SEX-CD
           ELSE
               MOVE 'SEX'              TO WTTAB-ETBL-TYP-ID
               MOVE L2435-CLI-SEX-CD   TO WTTAB-ETBL-VALU-ID
               MOVE 'AD'               TO WTTAB-TTAB-ADMIN-APPL-ID
               PERFORM  TTAB-1000-READ
                   THRU TTAB-1000-READ-X
               IF WTTAB-IO-OK
                   MOVE RTTAB-TTBL-VALU-TXT TO R9327-CLI-SEX-CD
               ELSE
                   MOVE SPACES              TO R9327-CLI-SEX-CD
               END-IF
           END-IF.

      * Get Client Address details

           MOVE RCVGC-INSRD-CLI-ID          TO L2440-CLI-ID.
      
           PERFORM  2440-1000-PRIMARY-ADDRESS
               THRU 2440-1000-PRIMARY-ADDRESS-X.

           IF L2440-RETRN-OK
               STRING L2440-CLI-KA-PREFCT-TXT  DELIMITED BY '  '
                      ' '                      DELIMITED BY SIZE
                      L2440-CLI-KA-CITY-TXT    DELIMITED BY '  '
                      ' '                      DELIMITED BY SIZE
                      L2440-CLI-KA-NGHBRHD-TXT DELIMITED BY '  '
                      ' '                      DELIMITED BY SIZE
                      L2440-CLI-ADDR-ADDL-TXT  DELIMITED BY SIZE
                                          INTO R9327-CLI-ADDR
           ELSE
               MOVE SPACES                  TO R9327-CLI-ADDR
           END-IF.

EN0807* Read input file until change of 
EN0807*  Decision Date/Claim/Policy
EN0807
EN0807     MOVE R9326-CLBN-FINAL-MAJ-CD     TO WS-CLBN-FINAL-MAJ-CD.
EN0807     INITIALIZE WS-CLBN-BNFT-DECSN-IND.
EN0807    
EN0807     PERFORM 
EN0807         WITH TEST AFTER
EN0807         UNTIL (NOT W9326-SEQ-IO-OK)
EN0807         OR (R9326-BNFT-DECSN-PRCES-DT 
EN0807                          NOT = WS-BNFT-DECSN-PRCES-DT
EN0807         OR R9326-CLM-ID  NOT = WS-CLM-ID
EN0807         OR R9326-POL-ID  NOT = WS-POL-ID)
EN0807     
EN0807         IF  R9326-CLBN-BNFT-DECSN-PAID 
EN0807             SET WS-CLBN-BNFT-DECSN-PAID
EN0807                                      TO TRUE
EN0807         END-IF
EN0807
EN0807         PERFORM  7000-READ-INPUT
EN0807             THRU 7000-READ-INPUT-X
EN0807               
EN0807     END-PERFORM. 
EN0807     
EN0807*    Set Reason using Final Major Code
EN0807
EN0807     IF  WS-CLBN-BNFT-DECSN-PAID
EN0807         MOVE WS-CLBN-FINAL-MAJ-CD    TO R9327-REASN
EN0807     ELSE      
EN0807*      GET TEXT DESCRIPTION FOR KATAKANA PREFIX.
EN0807         MOVE '00001'                 TO L2490-TXT-SRC-REF-ID
EN0807         MOVE 'CSBM9327'              TO L2490-TXT-SRC-ID
EN0807         MOVE WGLOB-USER-LANG         TO L2490-TXT-LANG-CD
EN0807      
EN0807         PERFORM  2490-1000-RETRIEVE-TEXT
EN0807             THRU 2490-1000-RETRIEVE-TEXT-X
EN0807                   
EN0807         MOVE L2490-TXT-STR-TXT       TO WS-KATAKANA-PREFIX
EN0807             
EN0807         STRING WS-KATAKANA-PREFIX DELIMITED BY SIZE
EN0807                WS-CLBN-FINAL-MAJ-CD DELIMITED BY SIZE
EN0807                INTO R9327-REASN
EN0807
EN0807      END-IF. 
EN0807     
           PERFORM  8000-WRITE-OUTPUT
               THRU 8000-WRITE-OUTPUT-X.
               
           ADD 1 TO WS-DETAIL-RECS-WRITTEN.
           

       2000-PROCESS-INPUT-X.
           EXIT.

      /
      *----------------
       7000-READ-INPUT.
      *----------------

           PERFORM  9326-1000-READ
               THRU 9326-1000-READ-X.

           IF W9326-SEQ-IO-OK
               ADD 1 TO WS-TOT-RECS-READ
           END-IF.

       7000-READ-INPUT-X.
           EXIT.

      /
      *--------------------
       8000-WRITE-OUTPUT.
      *--------------------

           PERFORM  9327-1000-WRITE
               THRU 9327-1000-WRITE-X.
               
           ADD 1 TO WS-TOT-RECS-WRITTEN.

       8000-WRITE-OUTPUT-X.
           EXIT.

      ******************************************************************
      /
      *--------------
       9000-FINALIZE.
      *--------------

      * Write Trailer Record
      
           PERFORM  9100-WRITE-TRAILER
               THRU 9100-WRITE-TRAILER-X.
      
      * Control Totals
      
           PERFORM  9900-PRINT-TOTALS
               THRU 9900-PRINT-TOTALS-X.
               
      * Close Files

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.
               
       9000-FINALIZE-X.
           EXIT.

      /
      *-------------------
       9100-WRITE-TRAILER.
      *-------------------
      
      * Create Trailer record and write to output file
      
           MOVE SPACES TO R9327-SEQ-REC-INFO.

           SET R9327-REC-TRAILER     TO TRUE.
           
           COMPUTE R9327-REC-TOT = WS-TOT-RECS-WRITTEN + 1.

           PERFORM  8000-WRITE-OUTPUT
               THRU 8000-WRITE-OUTPUT-X.

       9100-WRITE-TRAILER-X.
           EXIT.

      /
      *------------------
       9900-PRINT-TOTALS.
      *------------------

           MOVE SPACES                TO L0040-INPUT-LINE.

           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
               
      *MSG: TOTAL NUMBER OF INPUT FILE RECORDS READ : @1

           MOVE 'CS93270003'           TO  WGLOB-MSG-REF-INFO.
           MOVE WS-TOT-RECS-READ       TO  WS-CONTROL-PIC.
           MOVE WS-CONTROL-PIC         TO  WGLOB-MSG-PARM (1).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

      *MSG: NUMBER OF OUTPUT FILE DETAIL RECORDS WRITTEN : @1

           MOVE 'CS93270004'           TO  WGLOB-MSG-REF-INFO.
           MOVE WS-DETAIL-RECS-WRITTEN TO  WS-CONTROL-PIC.
           MOVE WS-CONTROL-PIC         TO  WGLOB-MSG-PARM (1).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

      *MSG: TOTAL NUMBER OF OUTPUT FILE RECORDS WRITTEN : @1

           MOVE 'CS93270005'           TO  WGLOB-MSG-REF-INFO.
           MOVE WS-TOT-RECS-WRITTEN    TO  WS-CONTROL-PIC.
           MOVE WS-CONTROL-PIC         TO  WGLOB-MSG-PARM (1).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

       9900-PRINT-TOTALS-X.
           EXIT.

      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  9326-4000-CLOSE
               THRU 9326-4000-CLOSE-X.

           PERFORM  9327-4000-CLOSE
               THRU 9327-4000-CLOSE-X.
           
      *    PERFORM  BCF-4000-CLOSE
      *        THRU BCF-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.

      /
      *****************************************************************
      *    PROCESSING COPYBOOKS                                       *
      *****************************************************************

      *COPY CCPPCCC.

       COPY XCPEVRSN.
      /
      *****************************************************************
      *    LINKAGE COPYBOOKS                                          *
      *****************************************************************

P02229 COPY XCPL0035.

       COPY CCPS0010.
       COPY CCPL0010.

       COPY CCPS0950.
       COPY CCPL0950.

       COPY CCPS2435.
       COPY CCPL2435.

       COPY CCPL2440.

       COPY XCPL0040.

       COPY XCPL0260.

       COPY XCPL0280.

       COPY XCPL0289.

       COPY XCPS0290.
       COPY XCPL0290.

       COPY XCPL1680.

       COPY XCPL2490.
       COPY XCPS2490.
      /
      *****************************************************************
      *    FILE I/O LINKAGE & PROCESS MODULES                         *
      *****************************************************************

       COPY CCPNPOL.

       COPY CCPBCVGC.

       COPY NCPNTTAB.

       COPY XCPNXTAB.

       COPY XCSLFILE REPLACING ==:ID:==  BY 9326
                               ==':PGM:'== BY =='ZSRQ9326'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY 9326.
       COPY XCSASEQ  REPLACING ==:ID:==  BY 9326.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY 9326.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY 9327
                               ==':PGM:'== BY =='ZSRQ9327'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY 9327.
       COPY XCSASEQ  REPLACING ==:ID:==  BY 9327.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY 9327.
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
      *    ERROR HANDLING ROUTINES                                    *
      *****************************************************************
       COPY XCPL0030.

      *****************************************************************
      **                 END OF PROGRAM ZSBM9327                     **
      *****************************************************************
