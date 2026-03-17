      *****************************************************************
      **  MEMBER :  ZSBM9343                                         **
      **  REMARKS:  MLJ CANCELLATION/RIDER CANCELLATION FILE CREATE  **
      **                                                             **
      **  DOMAIN :  CM                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
MP282A** 20AUG15   CTS    CANCELLATION/RIDER CANCELLATION DATA CREATE**
UYS001** 15FEB21   CTS    CHANGES DONE FOR PLAN AND RATE SETUP       **
      *****************************************************************
      
      *************************
       IDENTIFICATION DIVISION.
      *************************
      
       PROGRAM-ID. ZSBM9343.
      
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
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM9343'.
       COPY SQLCA.
      
       01  WS-WORK-AREA.
           05  WS-TOT-RECS-READ            PIC S9(9) VALUE ZERO.
           05  WS-DETAIL-RECS-WRITTEN      PIC S9(9) VALUE ZERO.
           05  WS-TOT-RECS-WRITTEN         PIC S9(9) VALUE ZERO.
           05  WS-PREV-CLI-ID              PIC X(10).
           05  WS-PREV-POL-ID              PIC X(10).
           05  WS-CVG-NUM                  PIC X(02).
           05  WS-POL-SUB-STAT-IND         PIC X(01).
               88 WS-POL-SUB-STAT-NO       VALUE 'N'.
               88 WS-POL-SUB-STAT-YES      VALUE 'Y'.
           05  WS-CVG-SUB-STAT-IND         PIC X(01).
               88 WS-CVG-SUB-STAT-NO       VALUE 'N'.
               88 WS-CVG-SUB-STAT-YES      VALUE 'Y'.

           05  WS-CONTROL-PIC              PIC Z(6)9.
           05  WS-KATAKANA-PREFIX          PIC X(06) VALUE SPACES.
           05  WS-DATA-POL-CD              PIC X(03).
           05  WS-DATA-POL-CD-N            REDEFINES
               WS-DATA-POL-CD              PIC 9(03).
           05  WS-POL-ID                   PIC X(07).
           05  WS-POL-ID-N                 REDEFINES
               WS-POL-ID                   PIC 9(07).
           05  WS-DATA-SEX-CD              PIC X(01).
           05  WS-DATA-SEX-CD-N            REDEFINES
               WS-DATA-SEX-CD              PIC 9(01).
           05  WS-BR-ID                    PIC X(03).
           05  WS-BR-ID-N                  REDEFINES
               WS-BR-ID                    PIC 9(03).
           05  WS-CVG-WRIT-IND             PIC X(01).
               88  WS-CVG-WRIT-YES         VALUE 'Y'.
               88  WS-CVG-WRIT-NO          VALUE 'N'.

      *  INDEX AND DATE WORK AREAS

       COPY XCWL0035.
      
       COPY CCWWINDX.
       COPY XCWWWKDT.
      
      *  BATCH FILE I/O COMMAND CONSTANTS
      
       COPY XCWTFCMD.
      
      *  COMPANY CONTROL RECORD
      
       COPY CCWWCCC.
      
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY CCFRMAST.
       COPY CCFWMAST.
      
       COPY CCFWPOL.
       COPY CCFRPOL.
      
       COPY CCFRCVGC.
       COPY CCFWCCLI.
       COPY CCWWCVGS.       
       
       COPY NCFWTTAB.
       COPY NCFRTTAB.

UYS001 COPY CCFRETAB.
UYS001 COPY CCFWETAB.
       COPY CCFRCLI.
       COPY CCFWCLI.       

       COPY NCFWCLUA.
       COPY NCFRCLIU.
      /       
      /
      *****************************************************************
      *     LINKAGE COPYBOOKS                                         *
      *****************************************************************
       COPY CCWL0010.
       COPY CCWL0950.
       COPY CCWL2435.
       COPY CCWL2440.
       COPY CCWL7344.       
      
       COPY XCWL0040.
       COPY XCWL0290.
       COPY XCWL1670.
UYS001 COPY XCWL1660.
       COPY XCWL1680.
       COPY XCWL2490.
       COPY XCWLDTLK.
      /
      
      *****************************************************************
      *                   SEQUENTIAL IO MODULES                       *
      *****************************************************************
      /
       COPY XCSWPRT  REPLACING ==:ID:==  BY OCF
                               ==':ID:'==  BY =='OCF'==.
       COPY XCSROCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY 9343
                               ==':ID:'==  BY =='9343'==.
       COPY ZCSR9343.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY CNCL
                               ==':ID:'==  BY =='CNCL'==.         
       COPY ZCSRCNCL. 
       
      ********************
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY CCWLPGA.       
       
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
      
           PERFORM  2000-PROCESS-RECORDS
               THRU 2000-PROCESS-RECORDS-X
               UNTIL W9343-SEQ-IO-EOF.
               
           PERFORM  9000-PRINT-STATS
               THRU 9000-PRINT-STATS-X.
      
           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.
      
           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.
      
           STOP RUN.
      
       0000-MAINLINE-X.
           EXIT.
      
      ******************************************************************
      *----------------
       0100-OPEN-FILES.
      *----------------
      
           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.
               
           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.
      
           PERFORM  9343-1000-OPEN-INPUT
               THRU 9343-1000-OPEN-INPUT-X.
      
           PERFORM  CNCL-3000-OPEN-OUTPUT
               THRU CNCL-3000-OPEN-OUTPUT-X.
      
      
       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       1000-INITIALIZE.
      *----------------
      
      * READ AND PROCESS COMPANY CONTROL CARD FROM BATCH CONTROL FILE
      
           INITIALIZE WS-WORK-AREA.
           
           MOVE 'CP'                        TO WGLOB-COMPANY-CODE.

           MOVE 'ZSBM9343'                  TO WGLOB-MAIN-PGM-ID
                                               WGLOB-CRNT-PGM-ID.

           PERFORM  0010-1000-INIT-DEFAULT
               THRU 0010-1000-INIT-DEFAULT-X.
      
      * GET COMPANY NAME AND REPORT TITLES
      
           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.
      
           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.
      
           PERFORM  1200-INIT-OCF-TITLES
               THRU 1200-INIT-OCF-TITLES-X.
      
      
      * GET CURRENT PROCESS DATE FROM MASTER CONTROL TABLE
      
           MOVE SPACES                      TO RMAST-KEY.
           MOVE WGLOB-COMPANY-CODE          TO WMAST-CO-ID.
      
           PERFORM  MAST-1000-READ
               THRU MAST-1000-READ-X.
      
           IF NOT WMAST-IO-OK
      *MSG: 'MASTER CONTROL RECORD (@1) NOT FOUND'
               MOVE WMAST-KEY               TO WGLOB-MSG-PARM (1)
               MOVE 'CS93439001'           TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           END-IF.
      
           MOVE RMAST-APPL-CTL-PRCES-DT     TO WGLOB-PROCESS-DATE.
           
           PERFORM  0290-1000-BUILD-PARM-INFO
               THRU 0290-1000-BUILD-PARM-INFO-X.
      
      * CHECK FOR EMPTY INPUT FILE 
      
           PERFORM  7000-READ-INPUT
               THRU 7000-READ-INPUT-X.
      
           IF  W9343-SEQ-IO-EOF
      *MSG: "INPUT FILE 9343 IS EMPTY; NOTHING TO EXTRACT"
               MOVE 'CS93439002'       TO WGLOB-MSG-REF-INFO
               PERFORM  0260-2000-GET-MESSAGE
                   THRU 0260-2000-GET-MESSAGE-X
               MOVE WGLOB-MSG-TXT      TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
           END-IF.
      
      * WRITE OUTPUT FILE HEADER RECORD
      
           PERFORM  1300-WRITE-HEADER
               THRU 1300-WRITE-HEADER-X.

      * FIELD 7 : REASON *      
      *    GET TEXT DESCRIPTION FOR KATAKANA PREFIX.
           MOVE '00001'                     TO L2490-TXT-SRC-REF-ID.
           MOVE 'CSBM9343'                  TO L2490-TXT-SRC-ID.
           MOVE WGLOB-USER-LANG             TO L2490-TXT-LANG-CD.
            
           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
                         
           MOVE L2490-TXT-STR-TXT           TO WS-KATAKANA-PREFIX.
                   
       1000-INITIALIZE-X.
           EXIT.      
      /
      
      *---------------------
       1200-INIT-OCF-TITLES.
      *---------------------
      
           MOVE L0950-COMPANY-NAME     TO L0040-COMPANY-NAME.
           MOVE ZERO                   TO L0040-ERROR-CNT.
      
      *MSG: ERROR MESSAGES
           MOVE 'CS93439003'           TO WGLOB-MSG-REF-INFO.
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
      
      * CREATE HEADER RECORD AND WRITE TO OUTPUT FILE
      
           INITIALIZE RCNCL-SEQ-REC-INFO.
           
           MOVE WWKDT-ZERO-DT               TO RCNCL-HDR-CREAT-DT.
      
           SET RCNCL-HDR-DATA-CLAS-HDR      TO TRUE.
      
           SET RCNCL-HDR-FILE               TO TRUE.
           
           MOVE WGLOB-PROCESS-DATE          TO RCNCL-HDR-CREAT-DT.
           
           PERFORM  8000-WRITE-OUTPUT
               THRU 8000-WRITE-OUTPUT-X.
      
       1300-WRITE-HEADER-X.
           EXIT.
           
      
      *---------------------
       2000-PROCESS-RECORDS.
      *---------------------

           INITIALIZE RCNCL-SEQ-REC-DATA.

      * GET POLICY RECORD
           
           MOVE R9343-POL-ID                TO WPOL-POL-ID.
      
           PERFORM POL-1000-READ
              THRU POL-1000-READ-X.
      
           IF  WPOL-IO-NOT-FOUND
               MOVE WPOL-KEY                TO  WGLOB-MSG-PARM (1)
               MOVE 'XS00000097'            TO  WGLOB-MSG-REF-INFO
      *MSG: (S) 'POLICY RECORD NOT FOUND'
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  7000-READ-INPUT
                   THRU 7000-READ-INPUT-X             
               GO TO 2000-PROCESS-RECORDS-X
           END-IF.

           
           IF  R9343-POL-SUB-STAT-CD NOT= SPACES
               SET WS-POL-SUB-STAT-YES      TO TRUE
           ELSE
               SET WS-POL-SUB-STAT-NO       TO TRUE
           END-IF.

           IF  R9343-CVG-SUB-STAT-CD NOT= SPACES
               SET WS-CVG-SUB-STAT-YES      TO TRUE
           MOVE R9343-CVG-NUM               TO WS-CVG-NUM             
           ELSE
               SET WS-CVG-SUB-STAT-NO       TO TRUE
           END-IF.



      * FIELD 5 : POLICY CODE *
      * GET SMALL PRODUCT CODE
      *
UYS001*    MOVE 'PRSML'                     TO WTTAB-ETBL-TYP-ID.
UYS001*    MOVE RPOL-PLAN-ID                TO WTTAB-ETBL-VALU-ID.
UYS001*    MOVE 'AD'                        TO WTTAB-TTAB-ADMIN-APPL-ID.
UYS001*    PERFORM  TTAB-1000-READ
UYS001*        THRU TTAB-1000-READ-X.
UYS001*    IF  WTTAB-IO-OK
UYS001*        MOVE RTTAB-TTBL-VALU-TXT     TO WS-DATA-POL-CD
UYS001*    END-IF.
UYS001     MOVE LOW-VALUES                  TO WETAB-KEY.
UYS001     MOVE HIGH-VALUES                 TO WETAB-ENDBR-KEY.
UYS001     MOVE 'PRSML'                     TO WETAB-ETBL-TYP-ID.
UYS001     MOVE RPOL-PLAN-ID                TO WETAB-ETBL-VALU-ID.
UYS001     MOVE RPOL-POL-ISS-EFF-DT         TO L1660-INTERNAL-DATE.
UYS001         PERFORM  1660-2000-CONVERT-INT-TO-INV
UYS001             THRU 1660-2000-CONVERT-INT-TO-INV-X.
UYS001  
UYS001     MOVE L1660-INVERTED-DATE         TO WETAB-ETBL-IDT-NUM.
UYS001     MOVE HIGH-VALUES                 TO 
UYS001                                  WETAB-ENDBR-ETBL-IDT-NUM.
UYS001                                            
UYS001     PERFORM  ETAB-1000-BROWSE
UYS001         THRU ETAB-1000-BROWSE-X.
UYS001
UYS001     IF  WETAB-IO-OK
UYS001         PERFORM  ETAB-2000-READ-NEXT
UYS001             THRU ETAB-2000-READ-NEXT-X
UYS001         IF  WETAB-IO-OK
UYS001             MOVE RETAB-ETBL-VALU-TXT TO WS-DATA-POL-CD
UYS001         END-IF
UYS001         PERFORM  ETAB-3000-END-BROWSE
UYS001             THRU ETAB-3000-END-BROWSE-X
UYS001     END-IF.
UYS001
           PERFORM  2100-CCLI-INS-INQUIRY
               THRU 2100-CCLI-INS-INQUIRY-X

           PERFORM  CCLI-3000-END-BROWSE
               THRU CCLI-3000-END-BROWSE-X.

      *READ THE NEXT POLICY RECORD.  
      
           PERFORM  7000-READ-INPUT
               THRU 7000-READ-INPUT-X.
              
       2000-PROCESS-RECORDS-X.
           EXIT.
      /      
      *----------------------
       2100-CCLI-INS-INQUIRY.
      *----------------------           
      * FIND ALL THE INSURED CLIENTS FOR ALL THE CVGS ON THE POLICY

           MOVE LOW-VALUES          TO WCCLI-KEY.
           MOVE R9343-POL-ID        TO WCCLI-POL-ID.
           MOVE WCCLI-KEY           TO WCCLI-ENDBR-KEY.

           MOVE HIGH-VALUES         TO WCCLI-ENDBR-INSRD-CLI-ID.
           MOVE HIGH-VALUES         TO WCCLI-ENDBR-CVG-NUM.

           PERFORM  CCLI-1000-BROWSE
               THRU CCLI-1000-BROWSE-X.
           
           IF  NOT WCCLI-IO-OK
               GO TO 2100-CCLI-INS-INQUIRY-X
           END-IF.

           PERFORM  CCLI-2000-READ-NEXT
               THRU CCLI-2000-READ-NEXT-X

           IF  NOT WCCLI-IO-OK
      * MSG: NO INSURED CLIENT RECORDS FOUND FOR POLICY (@1)
               MOVE 'CS93439004'       TO WGLOB-MSG-REF-INFO
               MOVE R9343-POL-ID       TO WGLOB-MSG-PARM (1)
                   
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X

               GO TO 2100-CCLI-INS-INQUIRY-X
           END-IF.
               
           IF  WS-POL-SUB-STAT-YES
           AND WS-CVG-SUB-STAT-NO
               PERFORM  2200-INS-REC
                   THRU 2200-INS-REC-X
                   UNTIL   WCCLI-IO-EOF
           END-IF

           IF  WS-POL-SUB-STAT-NO
           AND WS-CVG-SUB-STAT-YES
               SET WS-CVG-WRIT-NO           TO TRUE
               PERFORM
                   UNTIL WCCLI-IO-EOF
                   OR WS-CVG-WRIT-YES
                   IF  (RCVGC-CVG-NUM = WS-CVG-NUM)
                       PERFORM  2200-INS-REC
                           THRU 2200-INS-REC-X
                       SET WS-CVG-WRIT-YES TO TRUE
                   ELSE
                       PERFORM  CCLI-2000-READ-NEXT
                           THRU CCLI-2000-READ-NEXT-X
                   END-IF
               END-PERFORM
           END-IF.

       2100-CCLI-INS-INQUIRY-X.
           EXIT.
      /       
      *-------------
       2200-INS-REC.
      *-------------
           
           IF  RCVGC-INSRD-CLI-ID = WS-PREV-CLI-ID
           AND RCVGC-POL-ID = WS-PREV-POL-ID
               PERFORM  CCLI-2000-READ-NEXT
                   THRU CCLI-2000-READ-NEXT-X
               GO TO 2200-INS-REC-X
           ELSE 
               MOVE RCVGC-INSRD-CLI-ID      TO WS-PREV-CLI-ID
               MOVE R9343-POL-ID            TO WS-PREV-POL-ID
               
               PERFORM  2300-WRITE-INS-REC
                   THRU 2300-WRITE-INS-REC-X
               PERFORM  CCLI-2000-READ-NEXT
                   THRU CCLI-2000-READ-NEXT-X
           END-IF.
      
       2200-INS-REC-X.
           EXIT.
      /      
      
      *-------------------
       2300-WRITE-INS-REC.
      *-------------------

      * MOVING THE DATA RECORD FIELDS*            
           
      * FIELD 1 : DATA CLASSIFICATION *
      * FIXED VALUE 2 *                
           SET RCNCL-DATA-CLAS-DATA         TO TRUE.
           

      * FIELD 2 : CATEGORY *
      * FIXED VALUE 10 & 12*
      *10:CNCLELLATION  , 12:RIDER CNCLELLATION*

           IF  WS-POL-SUB-STAT-YES
           AND  WS-CVG-SUB-STAT-NO
           
               SET RCNCL-DATA-CAT-CNCL      TO TRUE
           
           END-IF.
      
           IF  WS-CVG-SUB-STAT-YES
           AND  WS-POL-SUB-STAT-NO
           
               SET RCNCL-DATA-CAT-CVG-CNCL  TO TRUE
           
           END-IF.

      * GET CLIENT ID FROM COVERAGE CLIENT TABLE  *   
      
           PERFORM  2435-1000-BUILD-PARM-INFO
               THRU 2435-1000-BUILD-PARM-INFO-X.
      
           MOVE RCVGC-INSRD-CLI-ID          TO L2435-CLI-ID.
      
           PERFORM  2435-1000-OBTAIN-CLI-INFO
               THRU 2435-1000-OBTAIN-CLI-INFO-X.
      
      * FIELD 3: SET BIRTH DATE (10-DIGIT FORMAT YYYY-MM-DD) * 
      
           IF L2435-RETRN-OK
      
               MOVE L2435-CLI-BTH-DT        TO RCNCL-DATA-BTH-DT
           
           ELSE
               
               MOVE WWKDT-ZERO-DT           TO RCNCL-DATA-BTH-DT
           END-IF.

      * FIELD 11 : NAME_KANA * 
      
           IF L2435-RETRN-CLI-NOT-FOUND
               MOVE SPACES                  TO RCNCL-DATA-KANA-NM
           ELSE
               MOVE L2435-CLI-NM-COMPRESSED TO RCNCL-DATA-KANA-NM
           END-IF.           
      * FIELD 4 : VOCATION *
      
           IF  WS-POL-SUB-STAT-YES
           AND WS-CVG-SUB-STAT-NO
               MOVE RCVGC-INSRD-CLI-ID      TO WCLI-CLI-ID
               PERFORM  CLI-1000-READ
                   THRU CLI-1000-READ-X
               IF  WCLI-IO-OK
                   MOVE RCLI-OCCP-ID        TO RCNCL-DATA-VOC
               END-IF
           ELSE
               MOVE SPACES                  TO RCNCL-DATA-VOC
           END-IF.
           
      * FIELD 5: POLICY CODE  *
               MOVE WS-DATA-POL-CD-N        TO RCNCL-DATA-POL-CD

      * FIELD 6 : POLICY NUMBER *           
           MOVE R9343-POL-ID                TO WS-POL-ID.
           MOVE WS-POL-ID-N                 TO RCNCL-DATA-POL-ID.
           
      * FIELD 7 : REASON *
           STRING WS-KATAKANA-PREFIX DELIMITED BY SIZE
                      INTO RCNCL-DATA-REASN-VAL.

      * FIELD 8 : OCCURRENCE DATE *
           MOVE R9343-PHST-PRCES-DT         TO RCNCL-DATA-OCCR-DT

      * FIELD 9 : CARD CREATION DATE*
           IF  WS-CVG-SUB-STAT-YES
           AND WS-POL-SUB-STAT-NO
               MOVE WWKDT-ZERO-DT           TO 
                                          RCNCL-DATA-CARD-CREAT-DT
           ELSE
               MOVE R9343-PHST-PRCES-DT     TO
                                          RCNCL-DATA-CARD-CREAT-DT
           END-IF.
      
      * FIELD 10 : CANCELLATION REQUEST DATE *

           IF  WS-CVG-SUB-STAT-YES
           AND WS-POL-SUB-STAT-NO
               MOVE R9343-PHST-PRCES-DT     TO 
                                          RCNCL-DATA-CNCL-RQST-DT
           ELSE
               MOVE WWKDT-ZERO-DT           TO
                                          RCNCL-DATA-CNCL-RQST-DT
           END-IF.

      * FIELD 12 : SEX *                                             
      * TRANSLATE SEX CODE
      
           IF L2435-RETRN-CLI-NOT-FOUND
               MOVE ZEROS                   TO RCNCL-DATA-SEX-CD
           ELSE
               MOVE 'SEX'                   TO WTTAB-ETBL-TYP-ID
               MOVE L2435-CLI-SEX-CD        TO WTTAB-ETBL-VALU-ID
               MOVE 'AD'                    TO WTTAB-TTAB-ADMIN-APPL-ID
               PERFORM  TTAB-1000-READ
                   THRU TTAB-1000-READ-X
               IF WTTAB-IO-OK
                   MOVE RTTAB-TTBL-VALU-TXT TO WS-DATA-SEX-CD
                   MOVE WS-DATA-SEX-CD-N    TO RCNCL-DATA-SEX-CD
               END-IF
           END-IF.
      * FIELD 13 : ADDRESS *        
      * GET CLIENT ADDRESS DETAILS

           MOVE RCVGC-INSRD-CLI-ID          TO L2440-CLI-ID.
      
           MOVE 'PR'                        TO L2440-CLI-ADDR-TYP-CD.
        
           SET L2440-CLI-ADDR-GR-KANJI      TO TRUE.           
      
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
                                          INTO RCNCL-DATA-ADDR
           ELSE
               MOVE SPACES                  TO RCNCL-DATA-ADDR
           END-IF.

      * FIELD 14 : INSURED APPLICATION STICKER NUMBER*   

           MOVE R9343-POL-ID              TO WCLUA-POL-ID.
           MOVE RCVGC-INSRD-CLI-ID        TO WCLUA-CLI-ID.
      
           MOVE WCLUA-KEY                 TO WCLUA-ENDBR-KEY.
      
           PERFORM  CLUA-1000-BROWSE
               THRU CLUA-1000-BROWSE-X.
      
           IF  WCLUA-IO-OK
               PERFORM  CLUA-2000-READ-NEXT
                   THRU CLUA-2000-READ-NEXT-X
               IF  WCLUA-IO-OK
                   MOVE RCLIU-STCKR-ID      TO 
                                           RCNCL-DATA-INSRD-APP-NO
               END-IF
               PERFORM  CLUA-3000-END-BROWSE
                   THRU CLUA-3000-END-BROWSE-X
           END-IF.

      
      * FIELD 15 : BULK APPLICATION NUMBER*  
      
           MOVE RPOL-POL-BULK-APP-ID        TO RCNCL-DATA-BULK-APP-NO.
      
      * FIELD 16 : BRANCH CODE*             
      
           MOVE RPOL-SERV-BR-ID             TO WS-BR-ID.
           MOVE WS-BR-ID-N                  TO RCNCL-DATA-BR-CD.

      * FIELD 17 : JOURNAL DATE *      
           MOVE WWKDT-ZERO-DT               TO RCNCL-DATA-JRNL-DT.
           
           PERFORM  8000-WRITE-OUTPUT
               THRU 8000-WRITE-OUTPUT-X.
               
           ADD 1                            TO WS-DETAIL-RECS-WRITTEN.
               
       2300-WRITE-INS-REC-X.
           EXIT.
      /
      
      *----------------
       7000-READ-INPUT.
      *----------------
      
           PERFORM  9343-1000-READ
               THRU 9343-1000-READ-X.
      
           IF  W9343-SEQ-IO-OK
               ADD 1                        TO WS-TOT-RECS-READ
           END-IF.
      
       7000-READ-INPUT-X.
           EXIT.
      /
      *--------------------
       8000-WRITE-OUTPUT.
      *--------------------
      
           PERFORM  CNCL-1000-WRITE
               THRU CNCL-1000-WRITE-X.
               
           ADD 1                            TO WS-TOT-RECS-WRITTEN.
      
       8000-WRITE-OUTPUT-X.
           EXIT.
      /
      
      *-----------------
       9000-PRINT-STATS.
      *-----------------
      * CONTROL TOTALS 
      
           PERFORM  9100-WRITE-TRAILER
               THRU 9100-WRITE-TRAILER-X.
               
           MOVE SPACES                     TO L0040-INPUT-LINE.
      
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
               
      *MSG: TOTAL NUMBER OF INPUT FILE RECORDS READ : @1
      
           MOVE 'CS93439005'                TO  WGLOB-MSG-REF-INFO.
           MOVE WS-TOT-RECS-READ            TO  WS-CONTROL-PIC.
           MOVE WS-CONTROL-PIC              TO  WGLOB-MSG-PARM (1).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
      
      *MSG: NUMBER OF OUTPUT FILE DETAIL DATA RECORDS WRITTEN : @1
      
           MOVE 'CS93439006'                TO  WGLOB-MSG-REF-INFO.
           MOVE WS-DETAIL-RECS-WRITTEN      TO  WS-CONTROL-PIC.
           MOVE WS-CONTROL-PIC              TO  WGLOB-MSG-PARM (1).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
      
      *MSG: TOTAL NUMBER OF OUTPUT FILE RECORDS WRITTEN : @1
      
           MOVE 'CS93439007'                TO  WGLOB-MSG-REF-INFO.
           MOVE WS-TOT-RECS-WRITTEN         TO  WS-CONTROL-PIC.
           MOVE WS-CONTROL-PIC              TO  WGLOB-MSG-PARM (1).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
      
       9000-PRINT-STATS-X.
           EXIT.
      /
      
      
      *-------------------
       9100-WRITE-TRAILER.
      *-------------------
      
      * CREATE TRAILER RECORD AND WRITE TO OUTPUT FILE
      
           INITIALIZE RCNCL-SEQ-REC-INFO.
           
      
           SET RCNCL-TRL-CLAS-DATA          TO TRUE.
           
           COMPUTE RCNCL-TOT-REC =  WS-DETAIL-RECS-WRITTEN + 2
      
           PERFORM  8000-WRITE-OUTPUT
               THRU 8000-WRITE-OUTPUT-X.
      
       9100-WRITE-TRAILER-X.
           EXIT.
      
      /      
      *-----------------
       9999-CLOSE-FILES.
      *-----------------
      * CLOSE FILES
      
           PERFORM  9343-4000-CLOSE
               THRU 9343-4000-CLOSE-X.
      
           PERFORM  CNCL-4000-CLOSE
               THRU CNCL-4000-CLOSE-X.
           
           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.
      
           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.
      
       9999-CLOSE-FILES-X.
           EXIT.
      
      /
      *****************************************************************
      *    PROCESSING COPYBOOKS                                       *
      *****************************************************************
      
       COPY CCPPCCC.
      /
      *****************************************************************
      *    LINKAGE COPYBOOKS                                          *
      *****************************************************************
      
       COPY XCPL0035.
      
       COPY CCPS0010.
       COPY CCPL0010.
      
       COPY CCPS0950.
       COPY CCPL0950.
      
       COPY CCPS2435.
       COPY CCPL2435.
      
       COPY CCPL2440.
      
       COPY XCPL0040.
      
       COPY XCPL0260.
      
       COPY XCPS0290.
       COPY XCPL0290.
      
       COPY XCPL1680.
UYS001 COPY XCPL1660.
       COPY XCPL2490.
       COPY XCPS2490.
       COPY CCPS7344.
       COPY CCPL7344.
      /       
      /
      *****************************************************************
      *    FILE I/O LINKAGE & PROCESS MODULES                         *
      *****************************************************************      
      
       COPY CCPNMAST.      
       COPY CCPNPOL.
       COPY CCPBCCLI.             
       COPY NCPNTTAB.
UYS001 COPY CCPBETAB.
       COPY NCPBCLUA.
       COPY CCPNCLI.
      
      /
      *****************************************************************
      *    ERROR HANDLING ROUTINES                                    *
      *****************************************************************
       COPY XCPL0030.      

    *****************************************************************
      *             SEQ FILE I/O PROCESS MODULE                       *
      *****************************************************************
      
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY BCF
                               ==':PGM:'== BY =='XSRQBCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY BCF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY BCF.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY 9343
                               ==':PGM:'== BY =='ZSRQ9343'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY 9343.
       COPY XCSASEQ  REPLACING ==:ID:==  BY 9343.       
       COPY XCSNSEQ  REPLACING ==:ID:==  BY 9343.      
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY CNCL
                               ==':PGM:'== BY =='ZSRQCNCL'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY CNCL.
       COPY XCSASEQ  REPLACING ==:ID:==  BY CNCL.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY CNCL.
      /      
       COPY XCSLFILE REPLACING ==:ID:==  BY OCF
                               ==':PGM:'== BY =='XSRQOCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY OCF.
      /
      
      *****************************************************************
      **                 END OF PROGRAM CSBM9343                    **
      *****************************************************************
      