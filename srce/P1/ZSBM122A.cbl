      *****************************************************************
      **  MEMBER :  ZSBM122A                                         **
      **  REMARKS:  CREATE INSURED CLIENT EXTRACT                    **
      **                                                             **
      **  DOMAIN :  TX                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
P01211** 31DEC03   AT     INITIAL VERSION                            **
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
      *****************************************************************

       IDENTIFICATION DIVISION.

       PROGRAM-ID.      ZSBM122A.

      ***********************
       ENVIRONMENT DIVISION.
      ***********************

       CONFIGURATION SECTION.

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
        
           SELECT I122-DATA-FILE ASSIGN TO ZSI122
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WI122-SEQ-FILE-STATUS.
                   
           SELECT O122-DATA-FILE ASSIGN TO ZSO122
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WO122-SEQ-FILE-STATUS.

      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.
        
       FD  I122-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.
        
      *
      * RECORD LENGTH = 100
      *
       01  RI122-SEQ-REC-INFO.
           05  RI122-POL-ID              PIC X(10).                             
           05  F                         PIC X(01).                             
           05  RI122-INSRD-CLI-ID        PIC X(10).
           05  F                         PIC X(01).                             
           05  RI122-INSRD-CLI-ISS-AGE   PIC X(03).
           05  F                         PIC X(01).                             
           05  RI122-DTH-FACE-AMT        PIC 9(15).
           05  F                         PIC X(01).                             
           05  RI122-DLY-HOSP-AMT        PIC 9(15).
           05  F                         PIC X(01).
           05  RI122-DLY-CHOSP-AMT       PIC 9(15).
           05  F                         PIC X(27).

       FD  O122-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.
            
      *
      * RECORD LENGTH = 200
      *
       01  RO122-SEQ-REC-INFO.
           05  RO122-POL-ID              PIC X(10).                             
           05  RO122-DEL1                PIC X(01).                            
           05  RO122-INSRD-CLI-ID        PIC X(10).                             
           05  RO122-DEL2                PIC X(01).                            
           05  RO122-INSRD-CLI-NM-TXT    PIC X(51).
           05  RO122-DEL3                PIC X(01).                             
           05  RO122-INSRD-CLI-BIRTH-DT  PIC X(10).
           05  RO122-DEL4                PIC X(01).                             
           05  RO122-INSRD-CLI-SEX-CD    PIC X(01).
           05  RO122-DEL5                PIC X(01).                             
           05  RO122-INSRD-CLI-ISS-AGE   PIC X(03).
           05  RO122-DEL6                PIC X(01).
           05  RO122-DTH-FACE-AMT        PIC 9(15).
           05  RO122-DEL7                PIC X(01).
           05  RO122-DLY-HOSP-AMT        PIC 9(15).
           05  RO122-DEL8                PIC X(01).
           05  RO122-DLY-CHOSP-AMT       PIC 9(15).
           05  RO122-DEL9                PIC X(01).
           05  RO122-INSRD-CLI-OCC-CD    PIC X(03).
           05  RO122-DEL10               PIC X(01).
           05  RO122-PRE-CNVR-FACE-AMT   PIC 9(15).
           05  RO122-DEL11               PIC X(01).
           05  RO122-PRE-CNVR-HOSP-AMT   PIC 9(15).
           05  R0122-F1                  PIC X(23).

      *************************
       WORKING-STORAGE SECTION.
      *************************

       01  WS-HOLD-R0122-SEQ-REC-INFO.
           05 WS-HOLD-R0122-DATA         PIC X(200).
            
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM122A'.

       COPY SQLCA.
P02229 COPY XCWL0035.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
        
      ****************************************************************
      *    WORK VARIABLES
      ****************************************************************
       
       01  WI122-SEQ-IO-WORK-AREA.
           05  WI122-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'I122'.
           05  WI122-SEQ-IO-COMMAND             PIC X(02).
           05  WI122-SEQ-FILE-STATUS            PIC X(02).
           05  WI122-SEQ-IO-STATUS              PIC 9(01).
               88  WI122-SEQ-IO-OK              VALUE 0.
               88  WI122-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WI122-SEQ-IO-EOF             VALUE 8.
               88  WI122-SEQ-IO-ERROR           VALUE 9.
 
       01  WO122-SEQ-IO-WORK-AREA.
           05  WO122-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'O122'.
           05  WO122-SEQ-IO-COMMAND             PIC X(02).
           05  WO122-SEQ-FILE-STATUS            PIC X(02).
           05  WO122-SEQ-IO-STATUS              PIC 9(01).
               88  WO122-SEQ-IO-OK              VALUE 0.
               88  WO122-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WO122-SEQ-IO-EOF             VALUE 8.
               88  WO122-SEQ-IO-ERROR           VALUE 9.

       01  WS-MISC.
           05  WS-TXT-SRC-REF-ID               PIC X(05)  VALUE SPACES.
           05  WS-I122-CNT                     PIC 9(07)  VALUE ZERO.
           05  WS-O122-CNT                     PIC 9(07)  VALUE ZERO.
           05  WS-TOT-FACE-AMT       VALUE ZEROS PIC S9(15)V99 COMP-3.
           05  WS-TOT-DLY-HOSP-AMT   VALUE ZEROS PIC S9(15)V99 COMP-3.
           05  WS-TOT-DLY-CHOSP-AMT  VALUE ZEROS PIC S9(15)V99 COMP-3.
           05  WS-CURR-KEY. 
               10 WS-CURR-KEY-POL-ID           PIC X(10).
               10 WS-CURR-KEY-INSRD-CLI-ID     PIC X(10).
           05  WS-PREV-KEY. 
               10 WS-PREV-KEY-POL-ID           PIC X(10).
               10 WS-PREV-KEY-INSRD-CLI-ID     PIC X(10).
           05  WS-DEL                          PIC X(01) VALUE ','.
                                                      
       COPY XCWWHDG.
       COPY XCWWTIME.
       COPY CCWWINDX.
        
      ***************************************************************
      *    CALLED MODULE PARAMETER INFORMATION
      ***************************************************************
        
      *
      * INGENIUM GLOBAL AREA
      *
       COPY CCWL0010.
       COPY CCWL0460.
        
      *
      * LINK PARMS FOR BATCH CONTROLS REPORT MODULE 
      *
       COPY XCWL0040.
        
      *
      * OUTPUT CONTROL FILE (OCF) PROCESSING
      *
       COPY XCSWOCF.
       COPY XCSROCF.
        
      *
      * OBTAIN SYSTEM DATE / TIME LINK AREA COPYBOOK 
      *
       COPY XCWL1610.
        
      *
      * WORK FIELDS FOR GENERAL DATE & TIME MANIPULATION
      *
       COPY XCWWWKDT.
        
      *
      * BATCH FILE I/O COMMAND CONSTANTS
      *
       COPY XCWTFCMD.
        
      *
      * DATE CONVERSION
      *
       COPY XCWLDTLK.
       COPY XCWL1670.
       COPY XCWL1680.
        
      *
      * TEXT RETRIEVAL
      *
       COPY XCWL2490.
        
      *
      * COMPANY NAME
      *
       COPY CCWL0950.
        
      *
      * LAYOUT OF COMPANY CONTROL FILE
      *
       COPY CCWWCCC.
        
      *
      * BATCH CONTROL FILE
      *
       COPY XCSWBCF.
       COPY XCSRBCF.
        
      *
      * CLIENT DATA
      *
       COPY CCWL2433.
       COPY CCWL2435.
       COPY CCWL2440.
        
      *
      * POINTER WORKING STORAGE AREA
      *
       COPY XCWLPTR.
        
      *
      * CLIENT UNDERWRITING TYPE TOKEN
      *
       COPY CCWL7348.
        
      ***************************************************************
      *    FILES                                   
      ***************************************************************
       
      ***************************************************************
      *    TABLES                                  
      ***************************************************************
       
      *
      * EDIT                                      
      *
       COPY CCFREDIT.
       COPY CCFWEDIT.
        
      *
      * CLIENT UNDERWRITING                               
      *
       COPY NCFRCLIU.
       COPY NCFWCLUA.
        
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

           PERFORM  2000-PROCESS-I122  
               THRU 2000-PROCESS-I122-X
                    UNTIL WI122-SEQ-IO-EOF.
                    
           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

P02229     PERFORM  0035-1000-COMMIT
P02229         THRU 0035-1000-COMMIT-X.
           STOP RUN.

       0000-MAINLINE-X.
           EXIT.

      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.
       
      *
      * INPUT TRANSACTIONS  
      *
           MOVE ZERO TO WI122-SEQ-IO-STATUS.

           OPEN INPUT I122-DATA-FILE.

           IF WI122-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-I122-ERROR                                   
                 THRU 9700-HANDLE-I122-ERROR-X                                 
           END-IF.

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.
                
      *
      * OUTPUT EXTRACT DATA 
      *
           MOVE ZERO TO WO122-SEQ-IO-STATUS.

           OPEN OUTPUT O122-DATA-FILE.

           IF WO122-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9710-HANDLE-O122-ERROR                                    
                 THRU 9710-HANDLE-O122-ERROR-X                                  
           END-IF.
            
       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       1000-INITIALIZE.
      *----------------
       
      *
      * GET VALID CONTROL RECORD
      *
           PERFORM CCC-1000-PRCES-CO-CTL-CARD
              THRU CCC-1000-PRCES-CO-CTL-CARD-X.

      *
      * GET CURRENT DATE AND TIME
      *
           PERFORM 1610-1000-GET-DATE-TIME
              THRU 1610-1000-GET-DATE-TIME-X.
               
           PERFORM 0950-0000-INIT-PARM-INFO
              THRU 0950-0000-INIT-PARM-INFO-X.

               
           PERFORM 0950-1000-GET-COMPANY-NAME
              THRU 0950-1000-GET-COMPANY-NAME-X.
                
           PERFORM 9100-INIT-OCF-TITLES
              THRU 9100-INIT-OCF-TITLES-X.

      *
      * GET FIRST INPUT TRANSACTION
      *
           PERFORM 9500-I122-READ
              THRU 9500-I122-READ-X.
               
           INITIALIZE WS-CURR-KEY.
           INITIALIZE WS-PREV-KEY.

           INITIALIZE RO122-SEQ-REC-INFO.
            
       1000-INITIALIZE-X.
           EXIT.
      /
      *------------------
       2000-PROCESS-I122.
      *------------------
      ********************************************************************    
      ********************************************************************    
      * PROCESS ALL I122 RECORDS                                         *
      ********************************************************************    
      ********************************************************************    
       
           ADD 1 TO WS-I122-CNT.
            
      *
      * SEQUENCE CHECK
      *
           MOVE RI122-POL-ID       TO WS-CURR-KEY-POL-ID.
           MOVE RI122-INSRD-CLI-ID TO WS-CURR-KEY-INSRD-CLI-ID.
            
           IF WS-CURR-KEY < WS-PREV-KEY
              MOVE 'ZS122A0003'       TO WGLOB-MSG-REF-INFO
              MOVE WS-CURR-KEY TO WGLOB-MSG-PARM (1)
              MOVE WS-PREV-KEY TO WGLOB-MSG-PARM (2)
              PERFORM 0260-1000-GENERATE-MESSAGE
                 THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM 0030-5000-LOGIC-ERROR
                 THRU 0030-5000-LOGIC-ERROR-X
           END-IF.
            
      *
      * IF ANY KEY VALUE CHANGES WRITE THE CURRENT EXTRACT DATA
      *
           IF WS-CURR-KEY <> WS-PREV-KEY
              IF WS-PREV-KEY NOT = SPACES
                 PERFORM 2100-WRITE-EXTRACT
                    THRU 2100-WRITE-EXTRACT-X
              END-IF
           END-IF.
         
      *
      * REFRESH DATA ASSOCIATED WITH CHANGED KEY VALUES
      *
           IF WS-CURR-KEY-POL-ID <> WS-PREV-KEY-POL-ID
              PERFORM 2200-REFRESH-POL-DATA
                 THRU 2200-REFRESH-POL-DATA-X
              MOVE WS-CURR-KEY-POL-ID TO WS-PREV-KEY-POL-ID
           END-IF.
       
           IF WS-CURR-KEY-INSRD-CLI-ID <> WS-PREV-KEY-INSRD-CLI-ID
              PERFORM 2300-REFRESH-INSRD-CLI-DATA
                 THRU 2300-REFRESH-INSRD-CLI-DATA-X
              MOVE WS-CURR-KEY-INSRD-CLI-ID 
              TO   WS-PREV-KEY-INSRD-CLI-ID
           END-IF.
            
      *
      * ACCUMULATE FACE AMOUNTS AND DAILY BENEFIT AMOUNTS
      *
           ADD RI122-DTH-FACE-AMT   TO WS-TOT-FACE-AMT.
           ADD RI122-DLY-HOSP-AMT   TO WS-TOT-DLY-HOSP-AMT.  
           ADD RI122-DLY-CHOSP-AMT  TO WS-TOT-DLY-CHOSP-AMT.  
            
      *
      * GET NEXT INPUT TRANSACTION
      *
           PERFORM 9500-I122-READ
              THRU 9500-I122-READ-X.

       2000-PROCESS-I122-X.
           EXIT.

      *-------------------
       2100-WRITE-EXTRACT.
      *-------------------
      ********************************************************************    
      ********************************************************************    
      * WRITE AN EXTRACT RECORD                                          *
      ********************************************************************    
      ********************************************************************    
       
           MOVE WS-TOT-FACE-AMT       TO RO122-DTH-FACE-AMT.
           MOVE WS-TOT-DLY-HOSP-AMT   TO RO122-DLY-HOSP-AMT.
           MOVE WS-TOT-DLY-CHOSP-AMT  TO RO122-DLY-CHOSP-AMT.
       
           MOVE ',' TO RO122-DEL1
                       RO122-DEL2
                       RO122-DEL3
                       RO122-DEL4
                       RO122-DEL5
                       RO122-DEL6
                       RO122-DEL7
                       RO122-DEL8
                       RO122-DEL9
                       RO122-DEL10
                       RO122-DEL11.
            
           MOVE RO122-SEQ-REC-INFO TO WS-HOLD-R0122-DATA.
                  
           PERFORM 9400-O122-WRITE
              THRU 9400-O122-WRITE-X.
               
           MOVE WS-HOLD-R0122-DATA TO RO122-SEQ-REC-INFO.
               
           ADD 1 TO WS-O122-CNT.
 
      *
      * INITIALIZE ACCUMULATORS
      *
           MOVE ZEROS TO WS-TOT-FACE-AMT.
           MOVE ZEROS TO WS-TOT-DLY-HOSP-AMT.
           MOVE ZEROS TO WS-TOT-DLY-CHOSP-AMT.
            
 
       2100-WRITE-EXTRACT-X.
           EXIT.
            
      *----------------------
       2200-REFRESH-POL-DATA.
      *----------------------
      ********************************************************************    
      ********************************************************************    
      * REFRESH POLICY DATA                                              *
      ********************************************************************    
      ********************************************************************    
 
      *
      * BASIC POLICY DATA
      *
           MOVE RI122-POL-ID TO RO122-POL-ID                      
            
      *
      * PRE-CONVERSION DATA
      *
       
      *
      * PRE-CONVERSION DATA
      *
      * GET EVERY CLIENT UNDERWRITING FOR THE CURRENT POLICY/CLIENT COMBO
      *
           MOVE ZEROS TO RO122-PRE-CNVR-FACE-AMT.
           MOVE ZEROS TO RO122-PRE-CNVR-HOSP-AMT.
 
           MOVE LOW-VALUES                TO WCLUA-KEY.
           MOVE RI122-INSRD-CLI-ID        TO WCLUA-CLI-ID
           MOVE RI122-POL-ID              TO WCLUA-POL-ID.

           MOVE HIGH-VALUES               TO WCLUA-ENDBR-KEY.
           MOVE RI122-INSRD-CLI-ID        TO WCLUA-ENDBR-CLI-ID
           MOVE RI122-POL-ID              TO WCLUA-ENDBR-POL-ID.

           PERFORM  CLUA-1000-BROWSE
               THRU CLUA-1000-BROWSE-X.

           PERFORM  CLUA-2000-READ-NEXT
               THRU CLUA-2000-READ-NEXT-X.

           PERFORM  2220-ACCUM-PRE-CNVR-AMTS
               THRU 2220-ACCUM-PRE-CNVR-AMTS-X
              UNTIL NOT WCLUA-IO-OK
                 OR     WCLUA-IO-EOF.

           PERFORM  CLUA-3000-END-BROWSE
               THRU CLUA-3000-END-BROWSE-X.
                
      *------------------------
       2200-REFRESH-POL-DATA-X.
      *------------------------

      *-------------------------
       2220-ACCUM-PRE-CNVR-AMTS.
      *-------------------------
      
           IF WCLUA-IO-OK
              ADD RCLIU-CNVR-ORIG-DB-AMT   TO RO122-PRE-CNVR-FACE-AMT
              ADD RCLIU-CNVR-ORIG-HOSP-AMT TO RO122-PRE-CNVR-HOSP-AMT
           END-IF.
            
           PERFORM  CLUA-2000-READ-NEXT
               THRU CLUA-2000-READ-NEXT-X.
                
       2220-ACCUM-PRE-CNVR-AMTS-X.
           EXIT.
       
      *----------------------------
       2300-REFRESH-INSRD-CLI-DATA.
      *----------------------------
      ********************************************************************    
      ********************************************************************    
      * REFRESH INSURED CLIENT DATA                                      *
      ********************************************************************    
      ********************************************************************    
            
      *
      * BASIC CLIENT DATA
      *
           MOVE RI122-INSRD-CLI-ID TO RO122-INSRD-CLI-ID.
            
           MOVE SPACES TO RO122-INSRD-CLI-NM-TXT 
                          RO122-INSRD-CLI-BIRTH-DT
                          RO122-INSRD-CLI-SEX-CD.
 
           PERFORM 2435-1000-BUILD-PARM-INFO
              THRU 2435-1000-BUILD-PARM-INFO-X.
               
           MOVE RI122-INSRD-CLI-ID TO L2435-CLI-ID.
               
           PERFORM 2435-1000-OBTAIN-CLI-INFO
              THRU 2435-1000-OBTAIN-CLI-INFO-X.
               
           IF L2435-RETRN-OK         
              MOVE L2435-CLI-NM-COMPRESSED TO RO122-INSRD-CLI-NM-TXT 
              MOVE L2435-CLI-BTH-DT        TO RO122-INSRD-CLI-BIRTH-DT 
              MOVE L2435-CLI-SEX-CD        TO RO122-INSRD-CLI-SEX-CD
           END-IF.
            
      *
      * CLIENT ISSUE AGE 
      *
           MOVE RI122-INSRD-CLI-ISS-AGE TO RO122-INSRD-CLI-ISS-AGE.
            
      *
      * CLIENT OCCUPATION CODE 
      *
           MOVE WGLOB-USER-LANG         TO WEDIT-ETBL-LANG-CD.            
           MOVE 'OCCCL'                 TO WEDIT-ETBL-TYP-ID.
           MOVE L2435-CLI-OCCP-CLAS-CD  TO WEDIT-ETBL-VALU-ID.    
            
           PERFORM EDIT-1000-READ
              THRU EDIT-1000-READ-X.
            
           IF WEDIT-IO-OK
              MOVE REDIT-ETBL-DESC-TXT     TO RO122-INSRD-CLI-OCC-CD
           ELSE
              MOVE L2435-CLI-OCCP-CLAS-CD  TO RO122-INSRD-CLI-OCC-CD
           END-IF.            
            
       2300-REFRESH-INSRD-CLI-DATA-X.
           EXIT.
            
      *---------------------
       9100-INIT-OCF-TITLES.
      *---------------------

           MOVE L0950-COMPANY-NAME TO L0040-COMPANY-NAME.
           MOVE ZERO               TO L0040-ERROR-CNT.

      **** SET UP THE OCF TITLE AND DETAIL REPORT HEADING LINES
      **** MOVE THE PROGRAM ID
           MOVE SPACES             TO WHDG-LINE-1.
           MOVE SPACES             TO WHDG-LINE-2.
           MOVE WPGWS-CRNT-PGM-ID  TO WHDG-PROGRAM-ID.

      **** MOVE THE COMPANY NAME
           MOVE L0950-COMPANY-NAME TO WHDG-COMPANY-NAME.

      **** GET THE SYSTEM ID
           MOVE 'XS00000145'       TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-2000-GET-MESSAGE
              THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT      TO L0040-SYSTEM-ID.

      **** GET THE REPORT TITLE :
           MOVE '00001'            TO WS-TXT-SRC-REF-ID.
           PERFORM 9600-GET-TEXT-DESC
              THRU 9600-GET-TEXT-DESC-X.
           MOVE L2490-TXT-STR-TXT  TO L0040-PROGRAM-DESC.
           MOVE L2490-TXT-STR-TXT  TO WHDG-REPORT-TITLE.

           PERFORM 0040-1000-INIT-TITLE
              THRU 0040-1000-INIT-TITLE-X.

       9100-INIT-OCF-TITLES-X.
           EXIT.

      *----------------
       9400-O122-WRITE.
      *----------------

           MOVE ZERO TO WO122-SEQ-IO-STATUS.

           WRITE RO122-SEQ-REC-INFO.

           IF WO122-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9710-HANDLE-O122-ERROR                                    
                 THRU 9710-HANDLE-O122-ERROR-X                                  
           END-IF.

       9400-O122-WRITE-X.
           EXIT.
            
      *---------------
       9500-I122-READ.
      *---------------

           MOVE ZERO                   TO WI122-SEQ-IO-STATUS.

           READ I122-DATA-FILE
                AT END
                  MOVE 8               TO WI122-SEQ-IO-STATUS
                  GO TO 9500-I122-READ-X.

           IF RI122-SEQ-REC-INFO EQUAL HIGH-VALUES
              MOVE 8                   TO WI122-SEQ-IO-STATUS
           END-IF.

           IF WI122-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-I122-ERROR                                    
                 THRU 9700-HANDLE-I122-ERROR-X                                  
           END-IF.

       9500-I122-READ-X.
           EXIT.

      *-------------------
       9600-GET-TEXT-DESC.
      *-------------------

           PERFORM 2490-1000-BUILD-PARM-INFO
              THRU 2490-1000-BUILD-PARM-INFO-X.
           MOVE WPGWS-CRNT-PGM-ID  TO L2490-TXT-SRC-ID.
           MOVE WS-TXT-SRC-REF-ID  TO L2490-TXT-SRC-REF-ID.
           PERFORM 2490-1000-RETRIEVE-TEXT
              THRU 2490-1000-RETRIEVE-TEXT-X.

       9600-GET-TEXT-DESC-X.
           EXIT.

      *-----------------------
       9700-HANDLE-I122-ERROR.                                                  
      *-----------------------

           MOVE WI122-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WI122-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WI122-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-I122-ERROR-X.                                                
           EXIT.
            
      *-----------------------
       9710-HANDLE-O122-ERROR.                                                  
      *-----------------------

           MOVE WO122-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WO122-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WO122-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9710-HANDLE-O122-ERROR-X.                                                
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

      *
      * WRITE LAST EXTRACT RECORD
      *
           IF WS-I122-CNT > ZERO
              PERFORM 2100-WRITE-EXTRACT
                 THRU 2100-WRITE-EXTRACT-X
           END-IF.
            
           MOVE WS-I122-CNT        TO  WGLOB-MSG-PARM (1).
            
           MOVE 'ZS122A0001'       TO  WGLOB-MSG-REF-INFO.
            
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
            
           MOVE WS-O122-CNT        TO  WGLOB-MSG-PARM (1).
            
           MOVE 'ZS122A0002'       TO  WGLOB-MSG-REF-INFO.
            
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.
                
           CLOSE I122-DATA-FILE.

           IF WI122-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-I122-ERROR                                    
                 THRU 9700-HANDLE-I122-ERROR-X                                  
           END-IF.

           CLOSE O122-DATA-FILE.

           IF WO122-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9710-HANDLE-O122-ERROR                                    
                 THRU 9710-HANDLE-O122-ERROR-X                                  
           END-IF.
                
       9999-CLOSE-FILES-X.
           EXIT.
            
P02229 COPY XCPL0035.
      *
      * CONTROL CARD PROCESSING
      *
       COPY CCPPCCC.
        
      *
      * BATCH CONTROL FILE (BCF) PROCESSING
      *
       COPY XCPOBCF.
       COPY XCPLBCF.
       COPY XCPNBCF.
 
      *
      * COMPANY NAME AND ADDRESS PROCESSING
      *
       COPY CCPL0950.
       COPY CCPS0950.
        
      *
      * INITIALIZE GLOBAL AREA
      *
       COPY CCPL0010.
        
      *
      * OBTAIN SYSTEM DATE AND TIME FOR BATCH PROGRAMS
      *
       COPY XCPL1610.
        
      *
      * TEXT TABLE PROCESSING
      *
       COPY XCPL2490.
       COPY XCPS2490.
       
      *
      * INITIALIZATION ROUTINE FOR CCWL0010 FIELDS    
      *
       COPY CCPS0010.
        
      *
      * OUTPUT CONTROL FILE (OCF) PROCESSING
      *
       COPY XCPOOCF.
       COPY XCPLOCF.
        
      *
      * MESSAGE PROCESSING
      *
       COPY XCPL0260.
        
      *
      * BATCH ERROR & ROLLBACK
      *
       COPY XCPL0030.
        
      *
      * BATCH CONTROL FILE (BCF) PROCESSING
      *
       COPY XCPL0040.
        
      *
      * SELECT FROM TEDIT
      *
       COPY CCPNEDIT.

      *
      * CLIENT TABLE PROCESSING
      *
       COPY CCPL2433.
       COPY CCPS2433.
       COPY CCPL2435.
       COPY CCPS2435.
       COPY CCPL2440.
 
      *
      * TOKEN PROCESSING
      *
        COPY CCPL7348.   
    
      *
      * POLICY CLIENT TABLE PROCESSING
      *
       COPY NCPBCLUA.
        
      *****************************************************************
      **                 END OF PROGRAM ZSBM122A                     **
      *****************************************************************
