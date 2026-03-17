      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMCMBK.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMCMBK                                         **         
      **  REMARKS:  THIS WILL READ IN AN INPUT FILE OF BAD COLLECTION**
      **            METHOD POLICIES FROM ZSBMCMBF. IT WILL OUTPUT A  **
      **            FILE TO BE USED IN A USER SPREADSHEET FOR APOLOGY**         
      **            LETTERS. THE OLD AND NEW CMB AMOUNTS ARE TAKEN   **         
      **            FROM THE CMBF INPUT FILE (NSBMCMBF GETS THEM FROM**         
      **            CFLW RECORDS.                                    **         
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT CMBF-DATA-FILE ASSIGN TO ZSCMBF
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WCMBF-SEQ-FILE-STATUS.
      /
           SELECT CMBK-DATA-FILE ASSIGN TO ZSCMBK
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WCMBK-SEQ-FILE-STATUS.
      /
       DATA DIVISION.
       FILE SECTION.

       FD  CMBF-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RCMBF-SEQ-REC-INFO.
           05  RCMBF-POL-ID              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-POL-STAT            PIC X(01).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-ISS-DT              PIC X(10).                             
           05  FILLER                    PIC X(01).
           05  RCMBF-CEASE-DT            PIC X(10).
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB1-OLD-AMT        PIC 9(13).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB1-OLD-DT         PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB1-NEW-AMT        PIC 9(13).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB1-NEW-DT         PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB1-CFLW-NUM       PIC 9(02).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB2-OLD-AMT        PIC 9(13).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB2-OLD-DT         PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB2-NEW-AMT        PIC 9(13).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB2-NEW-DT         PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBF-CMB2-CFLW-NUM       PIC 9(02).                             

       FD  CMBK-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RCMBK-SEQ-REC-INFO.
           05  RCMBK-POL-ID              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBK-POL-STAT            PIC X(14).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBK-ISS-DT              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBK-OWNER-KANA-NAME     PIC X(56).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBK-OWNER-KANJI-NAME    PIC X(56).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBK-ZIP-CD              PIC X(20).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBK-ADDRESS             PIC X(60).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBK-SAMAKATA-BU1        PIC X(60).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBK-SAMAKATA-BU2        PIC X(12).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBK-PHONE-NUMBER        PIC X(15).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBK-RO-CD               PIC X(03).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBK-SO-CD               PIC X(03).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBK-AGT-CD              PIC X(06).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBK-AGT-NAME            PIC X(56).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBK-CMB1-OLD-AMT        PIC 9(13).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBK-CMB1-NEW-AMT        PIC 9(13).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBK-CMB1-DT             PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBK-CMB2-OLD-AMT        PIC 9(13).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBK-CMB2-NEW-AMT        PIC 9(13).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBK-CMB2-DT             PIC X(10).                             
           05  FILLER                    PIC X(01).
           05  RCMBK-CEASE-DT            PIC X(10).
           05  FILLER                    PIC X(01).
           05  RCMBK-GRACE-DT            PIC X(10).
           05  FILLER                    PIC X(01).                             
           05  RCMBK-PREM-AMT            PIC 9(13).                             
      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCMBK'.

       COPY SQLCA.

       01  WS-PROGRAM-WORK-AREA.
           05  WS-ERROR-SW               PIC X(1).
               88  WS-NO-ERRORS                      VALUE 'N'.
               88  WS-ERRORS-FOUND                   VALUE 'Y'.
           05  WS-CMB-DIFF-SW            PIC X(1).
               88  WS-CMB-DIFF-NOT-FOUND             VALUE 'N'.                 
               88  WS-CMB-DIFF-FOUND                 VALUE 'Y'.                 

       01  SUBS-AND-THINGS.
           05  I                         PIC S9(4) COMP.
           05  J                         PIC S9(4) COMP.
           05  K                         PIC S9(4) COMP.
           05  L                         PIC S9(4) COMP.
           05  WS-BLD-CNT                PIC S9(4) COMP.

       01  WORK-AREAS.
           05  WS-ANNIV-DT               PIC X(10).                             
           05  WS-ISS-DT                 PIC X(10).                             
           05  WS-ISS-DT-R               REDEFINES                              
               WS-ISS-DT.                                                       
               10  WS-ISS-DT-YR          PIC 9(04).                             
               10  FILLER                PIC X(01).                             
               10  WS-ISS-DT-MO          PIC 9(02).                             
               10  FILLER                PIC X(01).                             
               10  WS-ISS-DT-DY          PIC 9(02).                             
           05  WS-TEST-DT                PIC X(10).                             
           05  WS-TEST-DT-R              REDEFINES                              
               WS-TEST-DT.                                                      
               10  WS-TEST-DT-YR         PIC 9(04).                             
               10  FILLER                PIC X(01).                             
               10  WS-TEST-DT-MO         PIC 9(02).                             
               10  FILLER                PIC X(01).                             
               10  WS-TEST-DT-DY         PIC 9(02).                             
           05  WS-CMB-ERR-AMT            PIC S9(13).                            
           05  WS-CMB-NEW-AMT            PIC S9(13).                            
           05  WS-POSTAL-CODE                          PIC X(20).
           05  WS-PREFECTURE                           PIC X(20).
           05  WS-CITY                                 PIC X(20).
P00132     05  WS-LRG-NGHBRHD                          PIC X(40).
           05  WS-ADDR-FIELD                           PIC X(40).
MM0081     05  WS-SAMAKATA-BU.
MM0081         10 WS-SAMAKATA-BU-MAIN                  PIC X(60).
MM0081         10 WS-SAMAKATA-BU-MORE                  PIC X(12).
P00059     05  WS-SAMAKATA-BU-SB-LEN          COMP     PIC S9(04).
P00059     05  WS-SAMAKATA-BU-DB-LEN          COMP     PIC S9(04).
           05  WS-SAMAKATA-BU-LEN             COMP     PIC S9(04).
           05  WS-ADDR-FIELD-LEN              COMP     PIC S9(04).
           05  WS-DB-SPACE-SPACE   VALUE X'20202020'   PIC X(04).
           05  WS-SB-SPACE-SPACE   VALUE X'2020'       PIC X(02).

       01  WS-ERROR-LINE.                                                       
           05  WS-ERROR-POL-ID           PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-DATE             PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-MESSAGE          PIC X(50).                             
           05  FILLER                    PIC X(01).                             
           05  WS-ERROR-DATA             PIC X(01).                             
           05  FILLER                    PIC X(58).                             

       01  WCMBF-SEQ-IO-WORK-AREA.
           05  WCMBF-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'CMBF'.
           05  WCMBF-SEQ-IO-COMMAND             PIC X(02).
           05  WCMBF-SEQ-FILE-STATUS            PIC X(02).
           05  WCMBF-SEQ-IO-STATUS              PIC 9(01).
               88  WCMBF-SEQ-IO-OK              VALUE 0.
               88  WCMBF-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WCMBF-SEQ-IO-EOF             VALUE 8.
               88  WCMBF-SEQ-IO-ERROR           VALUE 9.

       01  WCMBK-SEQ-IO-WORK-AREA.
           05  WCMBK-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'CMBK'.
           05  WCMBK-SEQ-IO-COMMAND             PIC X(02).
           05  WCMBK-SEQ-FILE-STATUS            PIC X(02).
           05  WCMBK-SEQ-IO-STATUS              PIC 9(01).
               88  WCMBK-SEQ-IO-OK              VALUE 0.
               88  WCMBK-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WCMBK-SEQ-IO-EOF             VALUE 8.
               88  WCMBK-SEQ-IO-ERROR           VALUE 9.

       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFWCVG.
       COPY CCFRCVG.
       COPY CCWWCVGS.
      /
P01213 COPY CCFWCLIC.
P01213 COPY CCFRCLIC.

       COPY XCWWWKDT.
       COPY XCWWCVGM.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWLPGA.
       COPY CCWL0010.
       COPY CCWL0083.
       COPY CCWL7348.
       COPY CCWL7350.
       COPY XCWL0015.
       COPY XCWL0040.
       COPY XCWL0289.
       COPY XCWL1660.
       COPY XCWL1670.
       COPY XCWL1680.
       COPY XCWL9683.
       COPY XCWLDTLK.
       COPY XCSWOCF.
       COPY XCSROCF.
      /
      ********************
       PROCEDURE DIVISION.
      ********************
      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM 0100-OPEN-FILES
              THRU 0100-OPEN-FILES-X.

           PERFORM 1000-INITIALIZATION
              THRU 1000-INITIALIZATION-X.

           PERFORM 2000-PROCESS-IN-RECS                                         
              THRU 2000-PROCESS-IN-RECS-X                                       
              UNTIL WCMBF-SEQ-IO-EOF                                            
                 OR WS-ERRORS-FOUND.                                            

           PERFORM 9999-CLOSE-FILES
              THRU 9999-CLOSE-FILES-X.

       0000-MAINLINE-X.
           STOP RUN.

      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM OCF-3000-OPEN-OUTPUT
              THRU OCF-3000-OPEN-OUTPUT-X.

           MOVE ZERO                   TO WCMBK-SEQ-IO-STATUS.

           OPEN OUTPUT CMBK-DATA-FILE.

           IF WCMBK-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           MOVE ZERO                   TO WCMBF-SEQ-IO-STATUS.

           OPEN INPUT CMBF-DATA-FILE.

           IF WCMBF-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9600-HANDLE-ERROR                                         
                 THRU 9600-HANDLE-ERROR-X                                       
           END-IF.

       0100-OPEN-FILES-X.
           EXIT.

      *--------------------
       1000-INITIALIZATION.
      *--------------------

           MOVE 'N' TO WS-ERROR-SW.

           MOVE 'CP'                 TO WGLOB-COMPANY-CODE.                     
 
           MOVE 'ZSBMCMBK'           TO WGLOB-MAIN-PGM-ID.                      
 
           PERFORM 0010-0000-INIT-PARM-INFO
              THRU 0010-0000-INIT-PARM-INFO-X.
           PERFORM 0010-1000-INIT-DEFAULT
              THRU 0010-1000-INIT-DEFAULT-X.
 
           MOVE 'ZSBMCMBK'           TO WGLOB-CRNT-PGM-ID                       
                                        WGLOB-USER-ID.                          

           PERFORM PGA-1000-BUILD-PARMS
              THRU PGA-1000-BUILD-PARMS-X.

           MOVE SPACES TO RCMBK-SEQ-REC-INFO.

       1000-INITIALIZATION-X.
           EXIT.
      /
      *----------------------                                                   
       2000-PROCESS-IN-RECS.                                                    
      *----------------------                                                   

           PERFORM  9500-CMBF-READ                                              
               THRU 9500-CMBF-READ-X.                                           
           IF NOT WCMBF-SEQ-IO-OK                                               
               MOVE 'Y' TO WS-ERROR-SW
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

           IF  RCMBF-CMB1-OLD-AMT = RCMBF-CMB1-NEW-AMT                          
           AND RCMBF-CMB2-OLD-AMT = RCMBF-CMB2-NEW-AMT                          
               MOVE SPACES                       TO WS-ERROR-LINE               
               MOVE RCMBF-POL-ID                 TO WS-ERROR-POL-ID             
               MOVE '*** NO CMB AMOUNT CHANGE ***'                              
                                                 TO WS-ERROR-MESSAGE            
               MOVE WS-ERROR-LINE                TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

           PERFORM 2100-NEW-POL                                                 
              THRU 2100-NEW-POL-X.                                              

           PERFORM 9400-CMBK-WRITE                                              
              THRU 9400-CMBK-WRITE-X.                                           
       
       2000-PROCESS-IN-RECS-X.                                                  
           EXIT.

      *-------------                                                            
       2100-NEW-POL.                                                            
      *-------------                                                            

           MOVE SPACES             TO RCMBK-SEQ-REC-INFO.                       
           MOVE RCMBF-POL-ID       TO RCMBK-POL-ID.                             
 

           MOVE RCMBF-POL-ID       TO WPOL-POL-ID.                              

           PERFORM POL-1000-READ                                                
              THRU POL-1000-READ-X.                                             

           IF WPOL-IO-NOT-FOUND                                                 
               MOVE WPOL-KEY       TO  WGLOB-MSG-PARM (1)                       
               MOVE 'XS00000097'   TO  WGLOB-MSG-REF-INFO                       
      *MSG: (S) 'POLICY RECORD NOT FOUND'
               PERFORM 0260-1000-GENERATE-MESSAGE                               
                  THRU 0260-1000-GENERATE-MESSAGE-X                             
               GO TO 2100-NEW-POL-X                                             
           END-IF.                                                              
       
           MOVE RPOL-POL-ID         TO  LPGA-POLICY-NUMBER.                     

           PERFORM CVGS-1000-LOAD-CVGS-ARRAY
              THRU CVGS-1000-LOAD-CVGS-ARRAY-X.

           EVALUATE RPOL-POL-STAT-CD                                            

               WHEN '1'
                    MOVE 'Premium Paying' TO RCMBK-POL-STAT

               WHEN 'A'
                    MOVE 'Cancelled     ' TO RCMBK-POL-STAT

               WHEN 'B'
                    MOVE 'Lapsed        ' TO RCMBK-POL-STAT

               WHEN 'D'
                    MOVE 'Death         ' TO RCMBK-POL-STAT

               WHEN 'E'
                    MOVE 'Surrendered   ' TO RCMBK-POL-STAT

               WHEN OTHER
                    MOVE RPOL-POL-STAT-CD TO RCMBK-POL-STAT

           END-EVALUATE.

           MOVE RPOL-POL-ISS-EFF-DT       TO RCMBK-ISS-DT.                      
           IF RPOL-POL-STAT-CD NOT = '1'                                        
               MOVE RPOL-POL-CEAS-DT      TO RCMBK-CEASE-DT                     
           END-IF.                                                              
           IF RPOL-POL-STAT-CD = 'B'                      
               MOVE RPOL-POL-CEAS-DT      TO RCMBK-GRACE-DT                     
           END-IF.                                                              

           PERFORM 7350-1000-BUILD-PARM-INFO
              THRU 7350-1000-BUILD-PARM-INFO-X.
   
           PERFORM 7348-1000-BUILD-PARM-INFO
              THRU 7348-1000-BUILD-PARM-INFO-X.

      * GET OWNER NAME - KANA  
           MOVE ' OWNERKA'             TO L7348-TOKEN-FIELD.
           PERFORM 7348-1000-VALUE-CLI-TOKEN
              THRU 7348-1000-VALUE-CLI-TOKEN-X.
           IF  L7348-RETRN-OK
               MOVE L7348-TOKEN-EXPAND  TO RCMBK-OWNER-KANA-NAME                

      * GET OWNER NAME - KANJI 
           MOVE ' OWNERKJ'             TO L7348-TOKEN-FIELD.
           PERFORM 7348-1000-VALUE-CLI-TOKEN
              THRU 7348-1000-VALUE-CLI-TOKEN-X.
           IF  L7348-RETRN-OK
               MOVE L7348-TOKEN-EXPAND  TO RCMBK-OWNER-KANJI-NAME               
      *        IF  L9610-LANG-CD = 'J'
      *            STRING L7348-TOKEN-EXPAND, ' ', WS-SAMA-LITERAL
      *                DELIMITED BY WS-DB-SPACE-SPACE
      *                        INTO RCMBK-OWNER-KANJI-NAME
      *        ELSE
      *            STRING L7348-TOKEN-EXPAND, ' ', WS-SAMA-LITERAL
      *                DELIMITED BY WS-SB-SPACE-SPACE
      *                        INTO RCMBK-OWNER-KANJI-NAME
      *        END-IF
           END-IF.
 
02PR63* CHECK LENGTH OF OWNER NAME - MUST BE 26 DOUBLE BYTE CHARS OR LESS 
      * (NOTE: L0015-OUT-SUB IS ONE BYTE MORE THAN THE LENGTH OF THE FIELD)   
           MOVE L7348-TOKEN-EXPAND    TO L0015-COMP-AREA-IN.
           PERFORM  0015-1000-COMPRESS-BLANKS
               THRU 0015-1000-COMPRESS-BLANKS-X.
02PR63     IF  (L0015-OUT-SUB - 1) > 56
               MOVE L0015-COMP-AREA-OUT (1:L0015-OUT-SUB)
                                            TO WGLOB-MSG-PARM (1)
               MOVE 'CS96100001'            TO WGLOB-MSG-REF-INFO
      *MSG: (I) 'OWNER NAME TOO LONG (MORE THAN 12 CHARS): @1'
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.
 
      * GET OWNER POSTAL CODE 
           MOVE ' OWNPC'               TO L7348-TOKEN-FIELD.
           PERFORM 7348-1000-VALUE-CLI-TOKEN
              THRU 7348-1000-VALUE-CLI-TOKEN-X.
           IF  L7348-RETRN-OK
               MOVE L7348-TOKEN-EXPAND TO WS-POSTAL-CODE
           ELSE
               MOVE SPACES             TO WS-POSTAL-CODE
           END-IF.
 
      * GET OWNER PREFECTURE 
           MOVE ' OWPREFCT'            TO L7348-TOKEN-FIELD.
           PERFORM 7348-1000-VALUE-CLI-TOKEN
              THRU 7348-1000-VALUE-CLI-TOKEN-X.
           IF  L7348-RETRN-OK
               MOVE L7348-TOKEN-EXPAND TO WS-PREFECTURE
           ELSE
               MOVE SPACES             TO WS-PREFECTURE
           END-IF.
 
      * GET OWNER CITY 
           MOVE ' OWCITY'              TO L7348-TOKEN-FIELD.
           PERFORM 7348-1000-VALUE-CLI-TOKEN
              THRU 7348-1000-VALUE-CLI-TOKEN-X.
           IF  L7348-RETRN-OK
               MOVE L7348-TOKEN-EXPAND TO WS-CITY
           ELSE
               MOVE SPACES             TO WS-CITY
           END-IF.
 
      * GET OWNER NEIGHBOURHOOD  
           MOVE ' OWNAD1'              TO L7348-TOKEN-FIELD.
           PERFORM 7348-1000-VALUE-CLI-TOKEN
              THRU 7348-1000-VALUE-CLI-TOKEN-X.
           IF  L7348-RETRN-OK
               MOVE L7348-TOKEN-EXPAND TO WS-LRG-NGHBRHD
           ELSE
               MOVE SPACES             TO WS-LRG-NGHBRHD
           END-IF.
 
      * GET OWNER SAMAKATA BU    
      * (SAMAKATA BU FIELD IS STORED IN INGENIUM AS SINGLE BYTE KATAKANA   
      *  CHARACTERS.  WE NEED DOUBLE BYTE KATAKANA CHARACTERS.)   
           MOVE ' OWNADDL'             TO L7348-TOKEN-FIELD.
           PERFORM 7348-1000-VALUE-CLI-TOKEN
              THRU 7348-1000-VALUE-CLI-TOKEN-X.
           IF  L7348-RETRN-OK
P00059*       (GET THE LENGTH OF THE SINGLE BYTE SAMAKATA BU FIELD)
P00059         MOVE L7348-TOKEN-EXPAND   TO L0015-COMP-AREA-IN
P00059         PERFORM  0015-1000-COMPRESS-BLANKS
P00059             THRU 0015-1000-COMPRESS-BLANKS-X
P00059         COMPUTE WS-SAMAKATA-BU-SB-LEN = L0015-OUT-SUB - 1
P00059*       (CONVERT THE SINGLE BYTE FIELD TO A DOUBLE BYTE FIELD)
               PERFORM 9683-1000-BUILD-PARM-INFO
                  THRU 9683-1000-BUILD-PARM-INFO-X
               MOVE L7348-TOKEN-EXPAND   TO L9683-INPUT-TEXT
               SET  L9683-RQST-SB-TO-DB  TO TRUE
               PERFORM 9683-1000-CONVERT-KATAKANA
                  THRU 9683-1000-CONVERT-KATAKANA-X
P00059*       (GET THE LENGTH OF THE DOUBLE BYTE SAMAKATA BU FIELD)
               MOVE L9683-OUTPUT-TEXT  TO L0015-COMP-AREA-IN
               PERFORM  0015-1000-COMPRESS-BLANKS
                   THRU 0015-1000-COMPRESS-BLANKS-X
               COMPUTE WS-SAMAKATA-BU-DB-LEN = L0015-OUT-SUB - 1
P00059*       (IF THERE ARE MORE THAN 20 SAMAKATA BU CHARACTERS, THEN 
P00059*        OUTPUT A SINGLE BYTE SAMAKATA BU FIELD RATHER THAN THE 
P00059*        CONVERTED DOUBLE BYTE SAMAKATA BU FIELD.)
MM0081*P00059  IF  WS-SAMAKATA-BU-SB-LEN > 20
MM0081         IF  WS-SAMAKATA-BU-SB-LEN > 30
P00059             MOVE L7348-TOKEN-EXPAND    TO WS-SAMAKATA-BU 
P00059             MOVE WS-SAMAKATA-BU-SB-LEN TO WS-SAMAKATA-BU-LEN 
P00059         ELSE
P00059             MOVE L9683-OUTPUT-TEXT     TO WS-SAMAKATA-BU 
P00059             MOVE WS-SAMAKATA-BU-DB-LEN TO WS-SAMAKATA-BU-LEN 
P00059         END-IF
MM0081*P00059*(OUTPUT AN ERROR MESSAGE IF THERE ARE MORE THAN 40 SINGLE  
MM0081*P00059*BYTE SAMAKATA BU CHARACTERS) 
MM0081*P00059  IF  WS-SAMAKATA-BU-SB-LEN > 40
MM0081*P00059      SET L9610-RETRN-ERROR TO TRUE
MM0081*P00059      MOVE L7348-TOKEN-EXPAND (1:WS-SAMAKATA-BU-SB-LEN)
MM0081*P00059                                   TO WGLOB-MSG-PARM (1)
MM0081*P00059      MOVE 'CS96100002'            TO WGLOB-MSG-REF-INFO
MM0081*P00059*MSG: (I) 'ERROR: SAMAKATA BU TOO LONG (MORE THAN 40 SB CHARS): @1'
MM0081*P00059      PERFORM  0260-1000-GENERATE-MESSAGE
MM0081*P00059          THRU 0260-1000-GENERATE-MESSAGE-X
MM0081*P00059      END-IF
           ELSE
               MOVE SPACES  TO WS-SAMAKATA-BU 
               MOVE ZEROS   TO WS-SAMAKATA-BU-LEN 
           END-IF.
 
      * IF NO ERRORS OCCURRED WHILE GETTING THE OUTPUT DATA, THEN VALUE
      * THE OUTPUT ADDRESS LINES.  OTHERWISE, MOVE 'DATA FORMAT ERROR'   
      * TEXT TO THE OUTPUT ADDRESS LINES.  
      *    IF  L9610-RETRN-OK 
      *        PERFORM 2200-FORMAT-ADDR-LINES
      *           THRU 2200-FORMAT-ADDR-LINES-X
      *    ELSE
      *        MOVE '00006'             TO L2490-TXT-SRC-REF-ID
      *        MOVE 'CSRF9610'          TO L2490-TXT-SRC-ID
      *        MOVE L9610-LANG-CD       TO L2490-TXT-LANG-CD
      *        PERFORM 2490-1000-RETRIEVE-TEXT
      *           THRU 2490-1000-RETRIEVE-TEXT-X                 
      *        MOVE L2490-TXT-STR-TXT   TO RCMBK-ADDRESS            
      *    END-IF.
      *
      * STRING THE PREFECTURE, CITY AND NEIGHBOURHOOD FIELDS TOGETHER.
      * (THEY WILL ALWAYS GO ON ADDRESS LINE 2.)
      *
           MOVE SPACES TO WS-ADDR-FIELD.

           STRING WS-PREFECTURE, WS-CITY, WS-LRG-NGHBRHD
              DELIMITED BY ' '  INTO WS-ADDR-FIELD.

      * GET THE LENGTH OF ADDRESS LINE 2 SO FAR

           MOVE WS-ADDR-FIELD   TO L0015-COMP-AREA-IN.
           PERFORM  0015-1000-COMPRESS-BLANKS
               THRU 0015-1000-COMPRESS-BLANKS-X.
           COMPUTE WS-ADDR-FIELD-LEN  = L0015-OUT-SUB - 1.

02AD12     MOVE WS-POSTAL-CODE        TO RCMBK-ZIP-CD.                          
MM0081     MOVE WS-ADDR-FIELD         TO RCMBK-ADDRESS.                         
MM0081     MOVE WS-SAMAKATA-BU-MAIN   TO RCMBK-SAMAKATA-BU1.
MM0081     MOVE WS-SAMAKATA-BU-MORE   TO RCMBK-SAMAKATA-BU2.
 
      * GET SALES OFFICE ID   
           MOVE ' SRVSO'               TO L7350-TOKEN-FIELD.
           PERFORM 7350-1000-VALUE-POL-TOKEN
              THRU 7350-1000-VALUE-POL-TOKEN-X.
           IF  L7350-RETRN-OK
               MOVE L7350-TOKEN-EXPAND TO RCMBK-SO-CD
           END-IF.
 
      * GET SERVICE BRANCH ID   
           MOVE RPOL-SERV-BR-ID        TO RCMBK-RO-CD.                          
02AD12*
02AD12* GET THE AGENT DATA
02AD12*
02AD12     PERFORM 0083-0000-INIT-PARM-INFO
02AD12        THRU 0083-0000-INIT-PARM-INFO-X.
02AD12
02AD12     MOVE RPOL-SERV-AGT-ID TO L0083-AGENT-ID.
02AD12     MOVE RPOL-SERV-AGT-ID TO RCMBK-AGT-CD.                               
02AD12
02AD12     SET L0083-AGENT-NAME-REQD TO TRUE.
02AD12
02AD12     PERFORM 0083-1000-RETRIEVE-AGT-INFO
02AD12        THRU 0083-1000-RETRIEVE-AGT-INFO-X.
02AD12
02AD12     IF L0083-RETRN-OK
02AD12        MOVE  L0083-AGT-NM-COMPRESSED TO RCMBK-AGT-NAME
02AD12     END-IF.
       
           MOVE RPOL-POL-MPREM-AMT     TO RCMBK-PREM-AMT.                       

      * GET OWNER CLIENT ID 
           MOVE ' OWNNUM'              TO L7348-TOKEN-FIELD.
           PERFORM 7348-1000-VALUE-CLI-TOKEN
              THRU 7348-1000-VALUE-CLI-TOKEN-X.
           IF  L7348-RETRN-OK
               MOVE L7348-TOKEN-EXPAND TO WCLIC-CLI-ID         
P01213         MOVE 'HO'               TO WCLIC-CLI-CNTCT-ID-CD                 
P01213
P01213         PERFORM CLIC-1000-READ                                           
P01213            THRU CLIC-1000-READ-X                                         
P01213
P01213         IF WCLIC-IO-OK                                                   
P01213             MOVE RCLIC-CLI-CNTCT-ID-TXT TO RCMBK-PHONE-NUMBER            
P01213         END-IF                                                           
P01213
           END-IF.
       
           IF RCMBF-CMB1-OLD-AMT = RCMBF-CMB1-NEW-AMT                           
               MOVE RCMBF-CMB2-OLD-AMT TO RCMBK-CMB1-OLD-AMT                    
               MOVE RCMBF-CMB2-NEW-AMT TO RCMBK-CMB1-NEW-AMT                    
               MOVE RCMBF-CMB2-OLD-DT  TO RCMBK-CMB1-DT                         
               MOVE 0                  TO RCMBK-CMB2-OLD-AMT                    
               MOVE 0                  TO RCMBK-CMB2-NEW-AMT                    
               GO TO 2100-NEW-POL-X                                             
           ELSE                                                                 
               MOVE RCMBF-CMB1-OLD-AMT TO RCMBK-CMB1-OLD-AMT                    
               MOVE RCMBF-CMB1-NEW-AMT TO RCMBK-CMB1-NEW-AMT                    
               MOVE RCMBF-CMB1-OLD-DT  TO RCMBK-CMB1-DT                         
           END-IF.
           IF RCMBF-CMB2-OLD-AMT = RCMBF-CMB2-NEW-AMT                           
               MOVE 0                  TO RCMBK-CMB2-OLD-AMT                    
               MOVE 0                  TO RCMBK-CMB2-NEW-AMT                    
           ELSE                                                                 
               MOVE RCMBF-CMB2-OLD-AMT TO RCMBK-CMB2-OLD-AMT                    
               MOVE RCMBF-CMB2-NEW-AMT TO RCMBK-CMB2-NEW-AMT                    
               MOVE RCMBF-CMB2-OLD-DT  TO RCMBK-CMB2-DT                         
           END-IF.
       
       2100-NEW-POL-X.                                                          
           EXIT.

      *----------------
       9400-CMBK-WRITE.
      *----------------

           MOVE ZERO                   TO WCMBK-SEQ-IO-STATUS.

           WRITE RCMBK-SEQ-REC-INFO.

           IF WCMBK-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

       9400-CMBK-WRITE-X.
           EXIT.

      *---------------
       9500-CMBF-READ.
      *---------------

           MOVE ZERO                   TO WCMBF-SEQ-IO-STATUS.

           READ CMBF-DATA-FILE
                AT END
                  MOVE 8               TO WCMBF-SEQ-IO-STATUS
                  GO TO 9500-CMBF-READ-X.

           IF RCMBF-SEQ-REC-INFO EQUAL HIGH-VALUES
              MOVE 8                   TO WCMBF-SEQ-IO-STATUS
           END-IF.

           IF WCMBF-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9600-HANDLE-ERROR                                         
                 THRU 9600-HANDLE-ERROR-X                                       
           END-IF.

       9500-CMBF-READ-X.
           EXIT.

      *-----------------------
       9600-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WCMBF-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WCMBF-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCMBF-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9600-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------------
       9700-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WCMBK-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WCMBK-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCMBK-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                   TO WCMBF-SEQ-IO-STATUS.

           CLOSE CMBF-DATA-FILE.

           IF WCMBF-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9600-HANDLE-ERROR                                         
                 THRU 9600-HANDLE-ERROR-X                                       
           END-IF.

           MOVE ZERO                   TO WCMBK-SEQ-IO-STATUS.

           CLOSE CMBK-DATA-FILE.

           IF WCMBK-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
 
      *****************************************************************
      **                 END OF COPYBOOK CCPP9495                    **
      *****************************************************************
 
       COPY CCPPMIDT.
       COPY NCPPCVGS.
 
      *******  I/O ROUTINES

       COPY CCPNPOL.
       COPY CCPNCVG.
P01213 COPY CCPNCLIC.

       COPY XCPOOCF.

      ******   LINKAGE ROUTINES

54-001 COPY CCPL0010.
54-001 COPY CCPS0010.
      /
02AD12 COPY CCPS0083.
02AD12 COPY CCPL0083.
      /
       COPY CCPSPGA.
      /
       COPY XCPL9683.
       COPY XCPS9683.
      /
       COPY CCPS7348.
       COPY CCPL7348.
      /
       COPY CCPS7350.
       COPY CCPL7350.

       COPY XCPL0015.
       COPY XCPL0030.
       COPY XCPL0040.
       COPY XCPL0260.
       COPY XCPL0289.
       COPY XCPL1660.
       COPY XCPL1680.
       COPY XCPLOCF.

      *****************************************************************
      **                 END OF PROGRAM ZSBMCMBK                     **         
      *****************************************************************
