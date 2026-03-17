
      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.    ZSBMFSUP.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  ZSBMFSUP                                         **
      **  REMARKS:  ONE SHOT BATCH PROGRAM                           **
      **  DOMAIN :  BC                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
27037B**  04MAY22  CTS    TVI AND TVIV2 FUND TRANSITION(ADDED TWO    **
27037B**                  FUNDS 811 AND 812)                         **
NVCT01**  08APR25  CTS    TVI AND TVIV2 FUND TRANSITION(ADDED NEW    **
NVCT01**                  FUND 813)                                  **
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
      
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMFSUP'.
      
       COPY SQLCA.
      
       01 WS-SEQ-NUM-N             PIC S9(13)V9(02).
       01 WS-POL-COUNT             PIC 9(10).
       01 WS-TVI-POL-COUNT         PIC 9(10).
       01 WS-TOT-COUNT-FS          PIC 9(10).
27037B 01 WS-TOT-COUNT-POL-FS      PIC 9(10).       
       01 WS-FUND-CNT              PIC 9(10).              
       01 WS-CVG-NUM               PIC X(02). 
       01 WS-FND-ID                PIC X(03).
NVCT01*27037B   88 FUND-804                  VALUE '804'.
27037B*         88 FUND-807                  VALUE '807'.
27037B*         88 FUND-808                  VALUE '808'.
27037B*         88 FUND-809                  VALUE '809'.
27037B*         88 FUND-810                  VALUE '810'.
27037B   88 FUND-811                  VALUE '811'.
27037B   88 FUND-812                  VALUE '812'.
NVCT01   88 FUND-813                  VALUE '813'.
       01 WS-FND-STAT              PIC X(01).
         88 STAT-ACTIVE               VALUE 'A'.
         88 STAT-COMPLETE             VALUE 'C'.
27037B 01 WS-FUND-NUMBER           PIC S9(8) COMP.
NVCT01 01 WS-POL-READ-ERR-IND      PIC X(01).
NVCT01   88 WS-POL-READ-ERR-YES    VALUE 'Y'.
NVCT01   88 WS-POL-READ-ERR-NO     VALUE 'N'.
   
      /
       COPY XCWL0035.
       COPY CCWWCCC.
      /
       COPY CCWWINDX.
      /
       COPY XCWWWKDT.
      /
       COPY XCWWTIME.
      /
       COPY XCWLDTLK.
      /
       COPY XCWTFCMD.
       COPY CCWTAKEY.       
      /
       COPY CCWWBTAX.       
      /
       COPY XCWWHDG.
      /
      *****************************************************************
      *     I/O COPYBOOKS                                             *
      *****************************************************************
      /
       COPY SCFRFS.   
       COPY SCFWFS. 
27037B COPY SCFRFC.
27037B COPY SCFWFC.
       COPY CCFRPOL.
       COPY CCFWPOL.
      /
       COPY XCSWPRT  REPLACING ==:ID:==  BY OCF
                               ==':ID:'==  BY =='OCF'==.
       COPY XCSROCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.
      /
      *****************************************************************
      *     CALLED MODULES                                            *
      *****************************************************************
      
       
       COPY XCWL0040.
       COPY XCWL0270.
       COPY XCWL2490.
       COPY CCWL0010.
       COPY CCWL0950.
       COPY CCWL0083.
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

NVCT01     IF NOT WPOL-IO-OK
NVCT01
NVCT01         PERFORM  9999-CLOSE-FILES
NVCT01             THRU 9999-CLOSE-FILES-X
NVCT01         
NVCT01         PERFORM  0035-1000-COMMIT
NVCT01             THRU 0035-1000-COMMIT-X
NVCT01         
NVCT01         STOP RUN
NVCT01
NVCT01         GO TO 0000-MAINLINE-X
NVCT01     END-IF.
NVCT01       
NVCT01*    PERFORM  3000-PROCESS-FSUP
NVCT01*        THRU 3000-PROCESS-FSUP-X
NVCT01*      UNTIL WPOL-IO-EOF OR NOT WPOL-IO-OK.
NVCT01
NVCT01     IF NOT WS-POL-READ-ERR-YES  
NVCT01         PERFORM  3000-PROCESS-FSUP
NVCT01             THRU 3000-PROCESS-FSUP-X
NVCT01           UNTIL NOT WPOL-IO-OK
NVCT01     END-IF.
           
           IF NOT WPOL-IO-OK
             PERFORM  POL-3000-TBL-END-BROWSE
                 THRU POL-3000-TBL-END-BROWSE-X        
      **** MSGS: 'TOTAL POLICY READ - , FUNDS ADDED -'     
             MOVE 'ZSFSUP0001'            TO WGLOB-MSG-REF-INFO
             MOVE  WS-POL-COUNT        TO WGLOB-MSG-PARM (1)          
             STRING WS-TOT-COUNT-FS  DELIMITED BY SIZE
                    ' FOR '          DELIMITED BY SIZE
                    WS-TVI-POL-COUNT DELIMITED BY SIZE
                    ' TVI POLICIES'  DELIMITED BY SIZE
                                       INTO WGLOB-MSG-PARM (2)           
             PERFORM  0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF. 
           
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
       2000-INITIALIZE.
      *----------------
      
           MOVE SPACES                      TO WGLOB-COMPANY-CODE.
      
           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.
      
           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.
      
           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.
      
           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.
           MOVE SPACES                      TO WHDG-LINE-1.
           MOVE SPACES                      TO WHDG-LINE-2.
           MOVE SPACES                      TO WHDG-LINE-3.
           MOVE SPACES                      TO L0040-INPUT-LINE.
         
           MOVE ZEROES                      TO WS-TOT-COUNT-FS
27037B                                         WS-TOT-COUNT-POL-FS           
                                               WS-POL-COUNT
                                               WS-TVI-POL-COUNT.
           MOVE '01'                        TO WS-CVG-NUM.
           SET STAT-COMPLETE                TO TRUE.
NVCT01     SET WS-POL-READ-ERR-NO           TO TRUE.		   
      
           MOVE WPGWS-CRNT-PGM-ID           TO L2490-TXT-SRC-ID.
      
           PERFORM  2100-INIT-OCF-TITLES
               THRU 2100-INIT-OCF-TITLES-X.
      
      **** OUTPUT A BLANK LINE
      
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

      **** READ THE POL TVI POLICIES
           MOVE LOW-VALUES                  TO WPOL-KEY.
           MOVE HIGH-VALUES                 TO WPOL-ENDBR-KEY.
      
           PERFORM  POL-1000-TBL-BROWSE
               THRU POL-1000-TBL-BROWSE-X.

           IF NOT WPOL-IO-OK
      **** MSGS:'POLICY READ ERROR'
             MOVE 'ZSFSUP0002'              TO  WGLOB-MSG-REF-INFO  
             PERFORM  0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
             GO TO   2000-INITIALIZE-X           
           END-IF.

           PERFORM  POL-2000-TBL-READ-NEXT
               THRU POL-2000-TBL-READ-NEXT-X.

           IF NOT WPOL-IO-OK
      **** MSGS:'POLICY READ ERROR'
NVCT01         SET WS-POL-READ-ERR-YES      TO TRUE	  
             MOVE 'ZSFSUP0002'              TO  WGLOB-MSG-REF-INFO
NVCT01         PERFORM  POL-3000-TBL-END-BROWSE
NVCT01             THRU POL-3000-TBL-END-BROWSE-X
NVCT01
             PERFORM  0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
             GO TO 2000-INITIALIZE-X            
           END-IF.
           
           ADD 1                            TO WS-POL-COUNT.
  	            
       2000-INITIALIZE-X.
           EXIT.
      /
      *--------------------
       2100-INIT-OCF-TITLES.
      *--------------------
      
           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
      
           MOVE L2490-TXT-STR-TXT           TO L0040-PROGRAM-DESC.
      
      **** MSGS: 'GET THE SYSTEM ID FOR THE HEADING'
      
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
      
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
      
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.
      
      **** MSGS: 'RUN MESSAGES'
      
           MOVE 'XS00000153'                TO WGLOB-MSG-REF-INFO.
      
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
      
           MOVE WGLOB-MSG-TXT               TO L0040-HDG-LINE-3.
      
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.
      
       2100-INIT-OCF-TITLES-X.
           EXIT.
      /     
      *--------------------
       3000-PROCESS-FSUP.
      *--------------------                
27037B
27037B     MOVE ZEROS                       TO WS-FUND-NUMBER.
27037B
27037B     PERFORM  3300-READ-FC
27037B         THRU 3300-READ-FC-X.

27037B*    IF RPOL-PROD-APP-TYP-TVI
27037B*       PERFORM  3100-INSERT-FUNDS-FS
27037B*           THRU 3100-INSERT-FUNDS-FS-X
NVCT01*27037B     IF (RPOL-PROD-APP-TYP-TVI
NVCT01*27037B     OR RPOL-PROD-APP-TYP-TVI2)
NVCT01*27037B         IF  WS-FUND-NUMBER = 6
NVCT01*27037B             PERFORM  3100-INSERT-FUNDS-FS
NVCT01*27037B                 THRU 3100-INSERT-FUNDS-FS-X
NVCT01*27037B         END-IF
NVCT01*27037B         IF  WS-FUND-NUMBER = 7
NVCT01*27037B             PERFORM  3400-INSERT-NEW-FUNDS-FS
NVCT01*27037B                 THRU 3400-INSERT-NEW-FUNDS-FS-X
NVCT01*27037B         END-IF
NVCT01*      ADD 1                          TO WS-TVI-POL-COUNT
NVCT01*    END-IF.
NVCT01
NVCT01* EXECUTE THIS PARA ONLY FOR TVI AND TVI2 POLICIES
NVCT01     IF  (RPOL-PROD-APP-TYP-TVI
NVCT01     OR  RPOL-PROD-APP-TYP-TVI2)
NVCT01         CONTINUE 
NVCT01     ELSE 
NVCT01         PERFORM  POL-2000-TBL-READ-NEXT
NVCT01             THRU POL-2000-TBL-READ-NEXT-X
NVCT01
NVCT01         EVALUATE TRUE
NVCT01
NVCT01             WHEN WPOL-IO-OK
NVCT01                 ADD 1                TO WS-POL-COUNT
NVCT01
NVCT01             WHEN WPOL-IO-EOF
NVCT01                 CONTINUE
NVCT01
NVCT01             WHEN NOT WPOL-IO-OK
NVCT01**** MSGS:'POLICY READ ERROR'
NVCT01                 MOVE 'ZSFSUP0002'    TO  WGLOB-MSG-REF-INFO  
NVCT01                 PERFORM  0260-1000-GENERATE-MESSAGE
NVCT01                     THRU 0260-1000-GENERATE-MESSAGE-X
NVCT01               
NVCT01         END-EVALUATE
NVCT01         GO TO 3000-PROCESS-FSUP-X
NVCT01     END-IF.
NVCT01    
NVCT01* ADD THE NEW FUNDS 813 TO THE TVI / TVI2 POLICIES. 
NVCT01* IN ADDITION, ADD ALSO THE MISSING 811 FUND IN 60 POLICIES AND THE 
NVCT01* MISSING 812 FUND IN 64 POLICIES
NVCT01        
NVCT01     EVALUATE TRUE
NVCT01
NVCT01         WHEN WS-FUND-NUMBER = 7
NVCT01              PERFORM  3100-INSERT-FUNDS-FS
NVCT01                  THRU 3100-INSERT-FUNDS-FS-X
NVCT01       
NVCT01         WHEN WS-FUND-NUMBER = 8 
NVCT01              PERFORM  3400-INSERT-NEW-FUNDS-FS
NVCT01                  THRU 3400-INSERT-NEW-FUNDS-FS-X
NVCT01              
NVCT01         WHEN WS-FUND-NUMBER = 9
NVCT01              PERFORM  3500-INSERT-NEW-FUNDS-FS
NVCT01                  THRU 3500-INSERT-NEW-FUNDS-FS-X
NVCT01
NVCT01     END-EVALUATE.
NVCT01
NVCT01     ADD 1                          TO WS-TVI-POL-COUNT.
NVCT01
           PERFORM  POL-2000-TBL-READ-NEXT
               THRU POL-2000-TBL-READ-NEXT-X

           EVALUATE TRUE
             WHEN WPOL-IO-OK
               ADD 1                        TO WS-POL-COUNT
             WHEN WPOL-IO-EOF
               CONTINUE
             WHEN NOT WPOL-IO-OK
      **** MSGS:'POLICY READ ERROR'
               MOVE 'ZSFSUP0002'            TO  WGLOB-MSG-REF-INFO  
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X                
               GO TO 3000-PROCESS-FSUP-X            
           END-EVALUATE.
              
       3000-PROCESS-FSUP-X.
           EXIT.   
      /     
      *--------------------
       3100-INSERT-FUNDS-FS.
      *-------------------- 
27037B
27037B     MOVE ZEROES                      TO WS-TOT-COUNT-POL-FS.
27037B
      **** MSGS: 'NOW PROCESSING POLICY :'
           MOVE 'ZSFSUP0003'                TO WGLOB-MSG-REF-INFO.
           STRING 'POLICY :'  DELIMITED BY SIZE
                  RPOL-POL-ID DELIMITED BY SIZE
                                            INTO WGLOB-MSG-PARM (1).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.                     

           MOVE RPOL-POL-ID                 TO WFS-POL-ID
           MOVE WS-CVG-NUM                  TO WFS-CVG-NUM
           
           PERFORM 
               VARYING  WS-FUND-CNT FROM 1 BY 1 
27037B*               UNTIL WS-FUND-CNT > 4
27037B         UNTIL WS-FUND-CNT > 3

               EVALUATE WS-FUND-CNT
27037B*                   WHEN 1
27037B*                   SET FUND-807 TO TRUE
27037B*                   WHEN 2
27037B*                   SET FUND-808 TO TRUE
27037B*                   WHEN 3
27037B*                   SET FUND-809 TO TRUE
27037B*                   WHEN 4
27037B*                   SET FUND-810 TO TRUE
NVCT01*27037B             WHEN 1
NVCT01*27037B             SET FUND-804 TO TRUE
NVCT01*27037B             WHEN 2
NVCT01*27037B             SET FUND-811 TO TRUE
NVCT01*27037B             WHEN 3
NVCT01*27037B             SET FUND-812 TO TRUE
NVCT01             WHEN 1
NVCT01                 SET FUND-811         TO TRUE
NVCT01
NVCT01             WHEN 2
NVCT01                 SET FUND-812         TO TRUE
NVCT01
NVCT01             WHEN 3
NVCT01                 SET FUND-813         TO TRUE
NVCT01
               END-EVALUATE

               MOVE WS-FND-ID               TO WFS-FND-ID           
               PERFORM  FS-1000-CREATE
                   THRU FS-1000-CREATE-X
                
               MOVE WS-FND-STAT             TO RFS-CFN-STAT-CD           
               
      **** MSGS: 'NOW PROCESSING FUND :'               
               MOVE 'ZSFSUP0003'            TO WGLOB-MSG-REF-INFO
               STRING 'FUND INSERT :'  DELIMITED BY SIZE
                       RFS-FND-ID      DELIMITED BY SIZE
                                            INTO WGLOB-MSG-PARM (1)   
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X               
            
               PERFORM  FS-1000-WRITE
                   THRU FS-1000-WRITE-X
                   
               IF  WFS-IO-OK
                 ADD 1                      TO WS-TOT-COUNT-FS
27037B           ADD 1                      TO WS-TOT-COUNT-POL-FS
               ELSE
      **** MSGS: 'ERROR IN INSERT TO FS, FS KEY' 
                 MOVE WFS-KEY               TO WGLOB-MSG-PARM (1)
                 MOVE 'ZSFSUP0004'          TO WGLOB-MSG-REF-INFO
                 PERFORM  0260-1000-GENERATE-MESSAGE
                     THRU 0260-1000-GENERATE-MESSAGE-X
                 PERFORM  0030-5000-LOGIC-ERROR
                     THRU 0030-5000-LOGIC-ERROR-X
               END-IF
           
           END-PERFORM.
27037B
27037B**** MSGS: 'FOR POLICY @1 TOTAL NUMBER OF FUNDS PROCESSED :@2'
27037B     MOVE 'ZSFSUP0005'                TO WGLOB-MSG-REF-INFO.
27037B     MOVE RPOL-POL-ID                 TO WGLOB-MSG-PARM (1).
27037B     MOVE WS-TOT-COUNT-POL-FS         TO WGLOB-MSG-PARM (2).
27037B     PERFORM  0260-1000-GENERATE-MESSAGE
27037B         THRU 0260-1000-GENERATE-MESSAGE-X.
      
       3100-INSERT-FUNDS-FS-X.
           EXIT.      
      /
27037B*-------------
27037B 3300-READ-FC.
27037B*-------------
27037B
27037B     IF (RPOL-PROD-APP-TYP-TVI
27037B     OR RPOL-PROD-APP-TYP-TVI2)
27037B         CONTINUE 
27037B     ELSE     
27037B         GO TO 3300-READ-FC-X
27037B     END-IF.
27037B
27037B     MOVE RPOL-POL-ID                 TO WFC-POL-ID.
27037B     MOVE 01                          TO WFC-CVG-NUM-N.
27037B
27037B     PERFORM  FC-1000-READ
27037B         THRU FC-1000-READ-X.
27037B
27037B     IF (NOT WFC-IO-OK)
27037B     OR RFC-CVG-CFN-REC-CTR = 0
27037B         GO TO 3300-READ-FC-X
27037B     END-IF.
27037B
27037B
27037B     MOVE RFC-CVG-CFN-REC-CTR         TO WS-FUND-NUMBER.
27037B
27037B 3300-READ-FC-X.
27037B     EXIT.
27037B/
27037B*-------------------------
27037B 3400-INSERT-NEW-FUNDS-FS.
27037B*-------------------------
27037B
27037B     MOVE ZEROES                      TO WS-TOT-COUNT-POL-FS.
27037B**** MSGS: 'NOW PROCESSING POLICY :'
27037B     MOVE 'ZSFSUP0003'                TO WGLOB-MSG-REF-INFO.
27037B     STRING 'POLICY :'  DELIMITED BY SIZE
27037B            RPOL-POL-ID DELIMITED BY SIZE
27037B                                      INTO WGLOB-MSG-PARM (1).
27037B     PERFORM  0260-1000-GENERATE-MESSAGE
27037B         THRU 0260-1000-GENERATE-MESSAGE-X.
27037B
27037B     MOVE RPOL-POL-ID                 TO WFS-POL-ID
27037B     MOVE WS-CVG-NUM                  TO WFS-CVG-NUM
27037B
27037B     PERFORM 
27037B         VARYING  WS-FUND-CNT FROM 1 BY 1
27037B         UNTIL WS-FUND-CNT > 2
27037B
27037B         EVALUATE WS-FUND-CNT
NVCT01*27037B             WHEN 1
NVCT01*27037B               SET FUND-811           TO TRUE
NVCT01*27037B             WHEN 2
NVCT01*27037B               SET FUND-812           TO TRUE
NVCT01             WHEN 1
NVCT01                 SET FUND-812         TO TRUE
NVCT01
NVCT01             WHEN 2
NVCT01                 SET FUND-813         TO TRUE
NVCT01
27037B         END-EVALUATE
27037B
27037B         MOVE WS-FND-ID               TO WFS-FND-ID
27037B
27037B         PERFORM  FS-1000-CREATE
27037B             THRU FS-1000-CREATE-X
27037B
27037B         MOVE WS-FND-STAT             TO RFS-CFN-STAT-CD
27037B
27037B**** MSGS: 'NOW PROCESSING FUND :'               
27037B         MOVE 'ZSFSUP0003'            TO WGLOB-MSG-REF-INFO
27037B         STRING 'FUND INSERT :'  DELIMITED BY SIZE
27037B                 RFS-FND-ID      DELIMITED BY SIZE
27037B                                      INTO WGLOB-MSG-PARM (1)
27037B         PERFORM  0260-1000-GENERATE-MESSAGE
27037B             THRU 0260-1000-GENERATE-MESSAGE-X
27037B
27037B         PERFORM  FS-1000-WRITE
27037B             THRU FS-1000-WRITE-X
27037B
27037B         IF  WFS-IO-OK
27037B           ADD 1                      TO WS-TOT-COUNT-FS
27037B           ADD 1                      TO WS-TOT-COUNT-POL-FS
27037B         ELSE
27037B**** MSGS: 'ERROR IN INSERT TO FS, FS KEY' 
27037B           MOVE WFS-KEY               TO WGLOB-MSG-PARM (1)
27037B           MOVE 'ZSFSUP0004'          TO WGLOB-MSG-REF-INFO
27037B           PERFORM  0260-1000-GENERATE-MESSAGE
27037B               THRU 0260-1000-GENERATE-MESSAGE-X
27037B           PERFORM  0030-5000-LOGIC-ERROR
27037B               THRU 0030-5000-LOGIC-ERROR-X
27037B         END-IF
27037B     END-PERFORM.
27037B
27037B**** MSGS: 'FOR POLICY @1 TOTAL NUMBER OF FUNDS PROCESSED :@2'
27037B     MOVE 'ZSFSUP0005'                TO WGLOB-MSG-REF-INFO.
27037B     MOVE RPOL-POL-ID                 TO WGLOB-MSG-PARM (1).
27037B     MOVE WS-TOT-COUNT-POL-FS         TO WGLOB-MSG-PARM (2).
27037B     PERFORM  0260-1000-GENERATE-MESSAGE
27037B         THRU 0260-1000-GENERATE-MESSAGE-X.  
27037B
27037B 3400-INSERT-NEW-FUNDS-FS-X.
27037B     EXIT.
27037B/
NVCT01*-------------------------
NVCT01 3500-INSERT-NEW-FUNDS-FS.
NVCT01*-------------------------
NVCT01
NVCT01     MOVE ZEROES                      TO WS-TOT-COUNT-POL-FS.
NVCT01**** MSGS: 'NOW PROCESSING POLICY :'
NVCT01     MOVE 'ZSFSUP0003'                TO WGLOB-MSG-REF-INFO.
NVCT01     STRING 'POLICY :'  DELIMITED BY SIZE
NVCT01            RPOL-POL-ID DELIMITED BY SIZE
NVCT01                                      INTO WGLOB-MSG-PARM (1).
NVCT01     PERFORM  0260-1000-GENERATE-MESSAGE
NVCT01         THRU 0260-1000-GENERATE-MESSAGE-X.
NVCT01
NVCT01     MOVE RPOL-POL-ID                 TO WFS-POL-ID.
NVCT01     MOVE WS-CVG-NUM                  TO WFS-CVG-NUM.
NVCT01
NVCT01     SET FUND-813                     TO TRUE.
NVCT01     MOVE WS-FND-ID                   TO WFS-FND-ID.
NVCT01     
NVCT01     PERFORM  FS-1000-CREATE
NVCT01         THRU FS-1000-CREATE-X.
NVCT01     
NVCT01     MOVE WS-FND-STAT                 TO RFS-CFN-STAT-CD.
NVCT01     
NVCT01**** MSGS: 'NOW PROCESSING FUND :'               
NVCT01     MOVE 'ZSFSUP0003'                TO WGLOB-MSG-REF-INFO.
NVCT01     STRING 'FUND INSERT :'  DELIMITED BY SIZE
NVCT01             RFS-FND-ID      DELIMITED BY SIZE
NVCT01                                  INTO WGLOB-MSG-PARM (1).
NVCT01     PERFORM  0260-1000-GENERATE-MESSAGE
NVCT01         THRU 0260-1000-GENERATE-MESSAGE-X.
NVCT01
NVCT01     PERFORM  FS-1000-WRITE
NVCT01         THRU FS-1000-WRITE-X.
NVCT01
NVCT01     IF  WFS-IO-OK
NVCT01         ADD 1                        TO WS-TOT-COUNT-FS
NVCT01         ADD 1                        TO WS-TOT-COUNT-POL-FS
NVCT01     ELSE
NVCT01**** MSGS: 'ERROR IN INSERT TO FS, FS KEY' 
NVCT01         MOVE WFS-KEY                 TO WGLOB-MSG-PARM (1)
NVCT01         MOVE 'ZSFSUP0004'            TO WGLOB-MSG-REF-INFO
NVCT01         PERFORM  0260-1000-GENERATE-MESSAGE
NVCT01             THRU 0260-1000-GENERATE-MESSAGE-X
NVCT01         PERFORM  0030-5000-LOGIC-ERROR
NVCT01             THRU 0030-5000-LOGIC-ERROR-X
NVCT01     END-IF.
NVCT01
NVCT01**** MSGS: 'FOR POLICY @1 TOTAL NUMBER OF FUNDS PROCESSED :@2'
NVCT01     MOVE 'ZSFSUP0005'                TO WGLOB-MSG-REF-INFO.
NVCT01     MOVE RPOL-POL-ID                 TO WGLOB-MSG-PARM (1).
NVCT01     MOVE WS-TOT-COUNT-POL-FS         TO WGLOB-MSG-PARM (2).
NVCT01     PERFORM  0260-1000-GENERATE-MESSAGE
NVCT01         THRU 0260-1000-GENERATE-MESSAGE-X.  
NVCT01
NVCT01 3500-INSERT-NEW-FUNDS-FS-X.
NVCT01     EXIT.
NVCT01/
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
      *****************************************************************
      * LINK COPYBOOKS
      *****************************************************************
      
       COPY XCPL0035.
       COPY CCPS0010.
       COPY CCPL0010.
       COPY CCPS0950.
       COPY CCPL0950.
       COPY XCPL0040.
       COPY XCPL0260.
       COPY XCPL0270.
       COPY XCPL0030.
       COPY CCPS0083.
       COPY CCPL0083.
       COPY XCPL2490.
       COPY XCPS2490.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS
      *****************************************************************
       COPY CCPPCCC.
       COPY XCPPHDG.
       COPY XCPPTIME.
      /
      *****************************************************************
      *  FILE I/O COPYBOOKS
      *****************************************************************
      
       COPY SCPAFS.
       COPY SCPCFS.
27037B COPY SCPNFC.
       COPY CCPTPOL.
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
      **                 END OF PROGRAM ZSBMFSUP                     **
      *****************************************************************
      