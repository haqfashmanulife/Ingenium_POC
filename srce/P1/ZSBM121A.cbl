      *****************************************************************
      **  MEMBER :  ZSBM121A                                         **
      **  REMARKS:  CREATE INTERMEDIATE INSURED CLIENT EXTRACT       **
      **                                                             **
      **            THE FINAL EXTRACT FILE IS TO INCLUDE ONE RECORD  **
      **            FOR EACH INSURED CLIENT ON THE POLICY.             
      **                                                             **
      **            THIS PROGRAM WILL CREATE DETAILED RECORDS THAT   **
      **            WILL BE SORTED AND ROLLED UP IN A SUBSEQUENT     **
      **            PROGRAM.                                         **
      **                                                             **
      **  DOMAIN :  TX                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
P01211** 25MAR04   AT     INITIAL VERSION                            **
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
      *****************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID.      ZSBM121A.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
        
       FILE-CONTROL.
        
           SELECT I121-DATA-FILE ASSIGN TO ZSI121
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WI121-SEQ-FILE-STATUS.
        
           SELECT O121-DATA-FILE ASSIGN TO ZSO121
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WO121-SEQ-FILE-STATUS.

       DATA DIVISION.
        
       FILE SECTION.
       
       FD  I121-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

      *
      * RECORD LENGTH = 10
      *
       01  RI121-SEQ-REC-INFO.
           05  RI121-POL-ID              PIC X(10).                             
 
       FD  O121-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

      *
      * RECORD LENGTH = 100
      *
       01  RO121-SEQ-REC-INFO.
           05  RO121-POL-ID              PIC X(10).                             
           05  F                         PIC X(01).                             
           05  RO121-INSRD-CLI-ID        PIC X(10).
           05  F                         PIC X(01).                             
           05  RO121-INSRD-CLI-ISS-AGE   PIC X(03).
           05  F                         PIC X(01).                             
           05  RO121-DTH-FACE-AMT        PIC 9(15).
           05  F                         PIC X(01).                             
           05  RO121-DLY-HOSP-AMT        PIC 9(15).
           05  F                         PIC X(01).
           05  RO121-DLY-CHOSP-AMT       PIC 9(15).
           05  F                         PIC X(27).

      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM121A'.

       COPY SQLCA.
P02229 COPY XCWL0035.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY CCWLPGA.
        
      ****************************************************************
      *    WORK VARIABLES
      ****************************************************************

       01  WI121-SEQ-IO-WORK-AREA.
           05  WI121-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'I121'.
           05  WI121-SEQ-IO-COMMAND             PIC X(02).
           05  WI121-SEQ-FILE-STATUS            PIC X(02).
           05  WI121-SEQ-IO-STATUS              PIC 9(01).
               88  WI121-SEQ-IO-OK              VALUE 0.
               88  WI121-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WI121-SEQ-IO-EOF             VALUE 8.
               88  WI121-SEQ-IO-ERROR           VALUE 9.
 
       01  WO121-SEQ-IO-WORK-AREA.
           05  WO121-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'O121'.
           05  WO121-SEQ-IO-COMMAND             PIC X(02).
           05  WO121-SEQ-FILE-STATUS            PIC X(02).
           05  WO121-SEQ-IO-STATUS              PIC 9(01).
               88  WO121-SEQ-IO-OK              VALUE 0.
               88  WO121-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WO121-SEQ-IO-EOF             VALUE 8.
               88  WO121-SEQ-IO-ERROR           VALUE 9.

       01  WS-MISC.
           05  WS-I121-CNT                    PIC 9(07)  VALUE ZERO.
           05  WS-O121-CNT                    PIC 9(07)  VALUE ZERO.
           05  WS-TXT-SRC-REF-ID              PIC X(05)  VALUE SPACES.
           05  WS-PLAN-ID                     PIC X(05).
               88  WS-PLAN-ID-VALID           VALUE '41400',
                                                    '41500','41501',
                                                    '41600','41601',
                                                    '41700','41701',
                                                    '41800','41801',
                                                    '42000',
                                                    '43400','43500',
                                                    '43600','43700'.
               88  WS-PLAN-ID-DEATH           VALUE '41400',
                                                    '41500','41501',
                                                    '41600','41601',
                                                    '41700','41701',
                                                    '41800','41801'.
               88  WS-PLAN-ID-DLY-HOSP        VALUE '42000',
                                                    '43400','43500'.
               88  WS-PLAN-ID-DLY-CHOSP       VALUE '43600','43700'.
                                                      
       COPY XCWWHDG.
       COPY XCWWTIME.
       COPY CCWWINDX.
        
      *
      * COVERAGE ARRAY
      *
       COPY CCWWCVGS.
       
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
        
      ***************************************************************
      *    FILES                                   
      ***************************************************************
       
      ***************************************************************
      *    TABLES                                  
      ***************************************************************
       
      *
      * POLICY                                      
      *
       COPY CCFWPOL.
       COPY CCFRPOL.
        
      *
      * COVERAGE                                      
      *
       COPY CCFWCVG.
       COPY CCFRCVG.
        
      *
      * COVERAGE CLIENT                                     
      *
       COPY CCFRCVGC.
       COPY CCFWCVGC.
        
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

           PERFORM  2000-PROCESS-I121  
               THRU 2000-PROCESS-I121-X
                    UNTIL WI121-SEQ-IO-EOF.
                    
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

      *
      * BATCH CONTROL FILE
      *
           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.
       
      *
      * INPUT TRANSACTIONS  
      *
           MOVE ZERO TO WI121-SEQ-IO-STATUS.

           OPEN INPUT I121-DATA-FILE.

           IF WI121-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-I121-ERROR                                   
                 THRU 9700-HANDLE-I121-ERROR-X                                 
           END-IF.

      *
      * OUTPUT CONTROL FILE
      *
           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.
                
      *
      * OUTPUT EXTRACT DATA (INTERMEDIATE DATA)
      *
           MOVE ZERO TO WO121-SEQ-IO-STATUS.

           OPEN OUTPUT O121-DATA-FILE.

           IF WO121-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9710-HANDLE-O121-ERROR                                    
                 THRU 9710-HANDLE-O121-ERROR-X                                  
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

           PERFORM PGA-1000-BUILD-PARMS
              THRU PGA-1000-BUILD-PARMS-X.

      *
      * GET FIRST INPUT POLICY     
      *
           PERFORM 9500-I121-READ
              THRU 9500-I121-READ-X.
 
       1000-INITIALIZE-X.
           EXIT.
      /
      *------------------
       2000-PROCESS-I121.
      *------------------
      ********************************************************************    
      ********************************************************************    
      * PROCESS ALL REQUESTED POLICIES                                   *
      ********************************************************************    
      ********************************************************************    
            
           ADD 1 TO WS-I121-CNT.
                     
      *
      * GET THE POLICY
      *
           MOVE RI121-POL-ID TO WPOL-POL-ID.

           PERFORM POL-1000-READ
              THRU POL-1000-READ-X.

           IF WPOL-IO-NOT-FOUND
               MOVE WPOL-KEY           TO  WGLOB-MSG-PARM (1)
               MOVE 'XS00000097'       TO  WGLOB-MSG-REF-INFO
      *MSG: (S) 'POLICY RECORD NOT FOUND'
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM 9500-I121-READ
                  THRU 9500-I121-READ-X
               GO TO 2000-PROCESS-I121-X
           END-IF.

      *
      * LOAD THE COVERAGES
      *
           PERFORM CVGS-1000-LOAD-CVGS-ARRAY
              THRU CVGS-1000-LOAD-CVGS-ARRAY-X.

      *
      * PROCESS ALL COVERAGES
      *
           PERFORM 2200-PROCESS-CVG
              THRU 2200-PROCESS-CVG-X
                VARYING I FROM 1 BY 1
                  UNTIL I > RPOL-POL-CVG-REC-CTR-N.

      *
      * GET NEXT INPUT POLICY
      *
           PERFORM 9500-I121-READ
              THRU 9500-I121-READ-X.

       2000-PROCESS-I121-X.
           EXIT.
                   
      *-----------------
       2200-PROCESS-CVG.
      *-----------------
      ********************************************************************    
      ********************************************************************    
      * PROCESS ONE COVERAGE                                             *
      ********************************************************************    
      ********************************************************************    
            
      *
      * PROCESS ONLY RELEVANT COVERAGES               
      *
           MOVE WCVGS-PLAN-ID (I) TO WS-PLAN-ID.
            
           IF NOT WS-PLAN-ID-VALID
              GO TO 2200-PROCESS-CVG-X
           END-IF.
            
      *
      * BYPASS PIRA
      *
           IF WCVGS-CVG-ISS-EFF-DT (I) > RPOL-POL-ISS-EFF-DT
              GO TO 2200-PROCESS-CVG-X
           END-IF.
            
      *
      * PROCESS ALL CLIENTS INSURED BY THIS COVERAGE
      *
           MOVE LOW-VALUES            TO WCVGC-KEY.
           MOVE HIGH-VALUES           TO WCVGC-ENDBR-KEY.
            
           MOVE RPOL-POL-ID           TO WCVGC-POL-ID 
                                         WCVGC-ENDBR-POL-ID 
           MOVE WCVGS-CVG-SEQ-NUM (I)
                                      TO WCVGC-CVG-NUM
                                         WCVGC-ENDBR-CVG-NUM.
            
           PERFORM CVGC-1000-BROWSE       
              THRU CVGC-1000-BROWSE-X.
 
           IF WCVGC-IO-OK 
              PERFORM CVGC-2000-READ-NEXT
                 THRU CVGC-2000-READ-NEXT-X
              IF WCVGC-IO-OK
                 PERFORM 2220-PROCESS-INSRD-CLI
                    THRU 2220-PROCESS-INSRD-CLI-X
                         UNTIL WCVGC-IO-EOF 
              END-IF
              PERFORM CVGC-3000-END-BROWSE 
                 THRU CVGC-3000-END-BROWSE-X
           END-IF.
 
       2200-PROCESS-CVG-X.
           EXIT.
 
      *-----------------------
       2220-PROCESS-INSRD-CLI.
      *-----------------------
      ********************************************************************    
      ********************************************************************    
      * PROCESS ONE INSURED CLIENT                                       *
      ********************************************************************    
      ********************************************************************    
            
           INITIALIZE RO121-SEQ-REC-INFO.

           MOVE RPOL-POL-ID              TO RO121-POL-ID.
           MOVE RCVGC-INSRD-CLI-ID       TO RO121-INSRD-CLI-ID.
           MOVE WCVGS-CVG-RT-AGE (I)     TO RO121-INSRD-CLI-ISS-AGE.   
            
           EVALUATE TRUE
            
           WHEN WS-PLAN-ID-DEATH 
            
                MOVE WCVGS-CVG-FACE-AMT (I) 
                TO   RO121-DTH-FACE-AMT
 
           WHEN WS-PLAN-ID-DLY-HOSP 
            
                MOVE WCVGS-CVG-FACE-AMT (I) 
                TO   RO121-DLY-HOSP-AMT 
 
           WHEN WS-PLAN-ID-DLY-CHOSP 
            
                MOVE WCVGS-CVG-FACE-AMT (I) 
                TO   RO121-DLY-CHOSP-AMT
                 
           END-EVALUATE.
            
           PERFORM 9400-O121-WRITE
              THRU 9400-O121-WRITE-X.
               
           ADD 1 TO WS-O121-CNT.
            
           PERFORM CVGC-2000-READ-NEXT
              THRU CVGC-2000-READ-NEXT-X.
                  
       2220-PROCESS-INSRD-CLI-X.
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
       9400-O121-WRITE.
      *----------------

           MOVE ZERO TO WO121-SEQ-IO-STATUS.

           WRITE RO121-SEQ-REC-INFO.

           IF WO121-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9710-HANDLE-O121-ERROR                                    
                 THRU 9710-HANDLE-O121-ERROR-X                                  
           END-IF.

       9400-O121-WRITE-X.
           EXIT.
            
      *---------------
       9500-I121-READ.
      *---------------

           MOVE ZERO                   TO WI121-SEQ-IO-STATUS.

           READ I121-DATA-FILE
                AT END
                  MOVE 8               TO WI121-SEQ-IO-STATUS
                  GO TO 9500-I121-READ-X.

           IF RI121-SEQ-REC-INFO EQUAL HIGH-VALUES
              MOVE 8                   TO WI121-SEQ-IO-STATUS
           END-IF.

           IF WI121-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-I121-ERROR                                    
                 THRU 9700-HANDLE-I121-ERROR-X                                  
           END-IF.

       9500-I121-READ-X.
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
       9700-HANDLE-I121-ERROR.                                                  
      *-----------------------

           MOVE WI121-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WI121-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WI121-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-I121-ERROR-X.                                                
           EXIT.
            
      *-----------------------
       9710-HANDLE-O121-ERROR.                                                  
      *-----------------------

           MOVE WO121-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WO121-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WO121-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9710-HANDLE-O121-ERROR-X.                                                
           EXIT.
            
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE WS-I121-CNT             TO  WGLOB-MSG-PARM (1).
            
           MOVE 'ZS121A0001'            TO  WGLOB-MSG-REF-INFO.
            
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
                
           MOVE WS-O121-CNT             TO  WGLOB-MSG-PARM (1).
            
           MOVE 'ZS121A0002'            TO  WGLOB-MSG-REF-INFO.
            
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
            
           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           CLOSE I121-DATA-FILE.

           IF WI121-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-I121-ERROR                                    
                 THRU 9700-HANDLE-I121-ERROR-X                                  
           END-IF.

           CLOSE O121-DATA-FILE.

           IF WO121-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9710-HANDLE-O121-ERROR                                    
                 THRU 9710-HANDLE-O121-ERROR-X                                  
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
      * TIME REFORMAT ROUTINE  
      *
      * COPY XCPPTIME.
        
      *
      * INITIALIZATION ROUTINE FOR CCWL0010 FIELDS    
      *
       COPY CCPS0010.
        
      *
      * ROUTINE TO BUILD THE GENERAL INPUT PARAMETERS   
      *
       COPY CCPSPGA.
        
      *
      * SELECT FROM TPOL
      *
       COPY CCPNPOL.
        
      *
      * SELECT FROM TCVG
      *
       COPY CCPNCVG.
        
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
      * BROWSE TCVGC (COVERAGE CLIENT)
      *
       COPY CCPBCVGC.
        
      *
      * LOAD ALL COVERAGES FOR A POLICY
      *
       COPY NCPPCVGS.
        
      *****************************************************************
      **                 END OF PROGRAM ZSBM121A                     **
      *****************************************************************
