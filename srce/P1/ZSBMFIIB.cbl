      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBMFIIB.                                                    

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  ZSBMFIIB                                         **
      **  REMARKS:  FORMULA II BRANCH ALMAGAMATION PROJECT           **         
      **            CONVERT BRANCH NUMBERS ON THE FOLLOWING HITACHI  **  
      **            UPLOAD FILES:                                    **
      **                          UMPR (MEDICAL PHYSICIAN REPORT)    **         
      **                          UMHM (MEDICAL HEALTH MANAGEMENT)   **         
      **                          UMIR (MEDICAL PHYSICIAN INTERVIEW) **
      **  DOMAIN : UW                                                **
      **  CLASS  : PD                                                **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
FII001** 04FEB03   DPK    NEW PROGRAM                                **      
P00916** 11APR03   AT     IMPROVE REUSABILITY (FACILITATE FUTURE     **
P00916**                  CONVERSIONS) BY REPLACING THE HARDWIRED    **
P00916**                  CONVERSION PHASE LETTER PROVIDED BY THE    **
P00916**                  *FIIB/C COPYBOOKS WITH THE PHASE LETTER    **
P00916**                  FROM THE CONTROL RECORD.                   **
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
BU8813**  16FEB10  CTS    CHANGED THE FILE LENGTH OF UMIR,UMHM & UMPR**                                                                                       
C24269**  04FEB15  CTS    CHANGES DONE TO INCREASE THE LENGTH OF UMIR**
C24269**                  UMHM & UMPR                                **
      *****************************************************************

      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
                                                                                
           SELECT NEW-UMPR-DATA-FILE ASSIGN TO NEWNSUMPR                        
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WNEWUMPR-SEQ-FILE-STATUS.                   
      
           SELECT NEW-UMHM-DATA-FILE ASSIGN TO NEWNSUMHM                        
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WNEWUMHM-SEQ-FILE-STATUS.                   

           SELECT NEW-UMIR-DATA-FILE ASSIGN TO NEWNSUMIR                        
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WNEWUMIR-SEQ-FILE-STATUS.                   
      
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.
        
       FD  NEW-UMPR-DATA-FILE                                                   
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.
      
       01  RNEWUMPR-SEQ-REC-INFO.                                               
BU8813*           05  RNEWUMPR-REC-DETAIL                 PIC X(211).
C24269*BU8813     05  RNEWUMPR-REC-DETAIL                 PIC X(215).
C24269     05  RNEWUMPR-REC-DETAIL                 PIC X(218).
      
       FD  NEW-UMHM-DATA-FILE                                                   
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.
      
       01  RNEWUMHM-SEQ-REC-INFO.                                               
BU8813*           05  RNEWUMHM-REC-DETAIL                 PIC X(228).
C24269*BU8813     05  RNEWUMHM-REC-DETAIL                 PIC X(235).
C24269     05  RNEWUMHM-REC-DETAIL                 PIC X(238).                  
      
       FD  NEW-UMIR-DATA-FILE                                                   
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.
      
       01  RNEWUMIR-SEQ-REC-INFO.                                               
BU8813*           05  RNEWUMIR-REC-DETAIL                 PIC X(175).                 
C24269*BU8813     05  RNEWUMIR-REC-DETAIL                 PIC X(183).
C24269     05  RNEWUMIR-REC-DETAIL                 PIC X(186).
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMFIIB'.

       COPY SQLCA.


       01  WS-REPORT-TOTALS.
           05  WS-UMPR-RECORDS-READ         PIC S9(07) COMP-3 VALUE +0.
           05  WS-UMPR-RECORDS-WRITTEN      PIC S9(07) COMP-3 VALUE +0.
           05  WS-UMHM-RECORDS-READ         PIC S9(07) COMP-3 VALUE +0.
           05  WS-UMHM-RECORDS-WRITTEN      PIC S9(07) COMP-3 VALUE +0.
           05  WS-UMIR-RECORDS-READ         PIC S9(07) COMP-3 VALUE +0.
           05  WS-UMIR-RECORDS-WRITTEN      PIC S9(07) COMP-3 VALUE +0.
            
      /
P02229 COPY XCWL0035.

       COPY NCSWUMPR.
       COPY NCSRUMPR.
      /
       COPY NCSWUMHM.
       COPY NCSRUMHM.
      /
       COPY NCSWUMIR.
       COPY NCSRUMIR.
      /                                                                         
       01  WNEWUMPR-SEQ-IO-WORK-AREA.                                           
           05  WNEWUMPR-SEQ-FILE-NAME              PIC X(07)                    
                                                VALUE 'NEWUMPR'.                
           05  WNEWUMPR-SEQ-IO-COMMAND             PIC X(02).                   
           05  WNEWUMPR-SEQ-FILE-STATUS            PIC X(02).                   
           05  WNEWUMPR-SEQ-IO-STATUS              PIC 9(01).                   
               88  WNEWUMPR-SEQ-IO-OK              VALUE 0.                     
               88  WNEWUMPR-SEQ-IO-NOT-FOUND       VALUE 7.                     
               88  WNEWUMPR-SEQ-IO-EOF             VALUE 8.                     
               88  WNEWUMPR-SEQ-IO-ERROR           VALUE 9.                     
      
       01  WNEWUMHM-SEQ-IO-WORK-AREA.                                           
           05  WNEWUMHM-SEQ-FILE-NAME              PIC X(07)                    
                                                VALUE 'NEWUMHM'.                
           05  WNEWUMHM-SEQ-IO-COMMAND             PIC X(02).                   
           05  WNEWUMHM-SEQ-FILE-STATUS            PIC X(02).                   
           05  WNEWUMHM-SEQ-IO-STATUS              PIC 9(01).                   
               88  WNEWUMHM-SEQ-IO-OK              VALUE 0.                     
               88  WNEWUMHM-SEQ-IO-NOT-FOUND       VALUE 7.                     
               88  WNEWUMHM-SEQ-IO-EOF             VALUE 8.                     
               88  WNEWUMHM-SEQ-IO-ERROR           VALUE 9.                     
      
       01  WNEWUMIR-SEQ-IO-WORK-AREA.                                           
           05  WNEWUMIR-SEQ-FILE-NAME              PIC X(07)                    
                                                VALUE 'NEWUMIR'.                
           05  WNEWUMIR-SEQ-IO-COMMAND             PIC X(02).                   
           05  WNEWUMIR-SEQ-FILE-STATUS            PIC X(02).                   
           05  WNEWUMIR-SEQ-IO-STATUS              PIC 9(01).                   
               88  WNEWUMIR-SEQ-IO-OK              VALUE 0.                     
               88  WNEWUMIR-SEQ-IO-NOT-FOUND       VALUE 7.                     
               88  WNEWUMIR-SEQ-IO-EOF             VALUE 8.                     
               88  WNEWUMIR-SEQ-IO-ERROR           VALUE 9.                     
P00916*     
P00916* INTERNAL DEFINITION OF THE BATCH CONTROL RECORD
P00916*     
P00916 01  WS-CNVR-CTL.
P00916     05  F                        PIC X(20).
P00916     05  F                        PIC X(06).
P00916     05  WS-CNVR-PHASE            PIC X(1).
P00916         88  WS-CNVR-PHASE-VALID  VALUE 'A',
P00916                                        'B',
P00916                                        'C',
                                              'D'.
                                               
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY XCWWWKDT.
       COPY CCWL0950.
       COPY CCWL0010.
       COPY CCWWCCC.
       COPY CCWWINDX.
      /
       COPY XCWWHDG.
       COPY XCWWTIME.
       COPY XCWL0040.
       COPY XCWTFCMD.
       COPY XCWL1640.
       COPY XCWL1670.
       COPY XCWL1680.
       COPY XCWL0280.
       COPY XCWLDTLK.
      /
       COPY XCSWOCF.
       COPY XCSROCF.
       COPY XCSWBCF.
       COPY XCSRBCF.
      /
       COPY NCFWTTAB.
       COPY NCFRTTAB.

      /
       COPY CCWLPGA.
      ********************
       PROCEDURE DIVISION.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------
       
           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  0200-INITIALIZE
               THRU 0200-INITIALIZE-X.

           PERFORM  2100-START-UMPR                                             
               THRU 2100-START-UMPR-X.                                          
      
           PERFORM  2200-START-UMHM                                             
               THRU 2200-START-UMHM-X.                                          
      
           PERFORM  2300-START-UMIR                                             
               THRU 2300-START-UMIR-X.                                          
      
           PERFORM  8000-PRINT-STATS                                            
               THRU 8000-PRINT-STATS-X.                                         
 
           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.
 
P02229     PERFORM  0035-1000-COMMIT
P02229         THRU 0035-1000-COMMIT-X.

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
       0200-INITIALIZE.
      *----------------
 
           MOVE SPACES                  TO WGLOB-COMPANY-CODE.
           SET  WGLOB-ENVRMNT-BATCH TO TRUE.

           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.
 
P00916     MOVE WCCC-COMPANY-CONTROL-RECORD TO WS-CNVR-CTL. 
P00916
P00916*
P00916* VALIDATE PHASE LETTER
P00916*
P00916     IF NOT WS-CNVR-PHASE-VALID
P00916         MOVE  'ZSFIIA0004'       TO  WGLOB-MSG-REF-INFO
P00916         MOVE  WS-CNVR-PHASE      TO  WGLOB-MSG-PARM (1)
P00916         PERFORM  0260-1000-GENERATE-MESSAGE
P00916             THRU 0260-1000-GENERATE-MESSAGE-X
P00916         PERFORM  0030-5000-LOGIC-ERROR
P00916             THRU 0030-5000-LOGIC-ERROR-X
P00916     END-IF.
 
           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE L0950-COMPANY-NAME      TO L0040-COMPANY-NAME.
 
           PERFORM  0210-INIT-OCF-TITLES
               THRU 0210-INIT-OCF-TITLES-X.

       0200-INITIALIZE-X.
           EXIT.
      /
      *---------------------
       0210-INIT-OCF-TITLES.
      *---------------------
      *
      * SET UP THE TITLE/HEADING LINES FOR THE OCF REPORT
      *
           MOVE ZERO                    TO L0040-ERROR-CNT.
      
      *
      * GET THE SYSTEM ID
      *
           MOVE 'CS00000056'            TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT           TO L0040-SYSTEM-ID.
      
      *
      * GET THE PROGRAM DESCRIPTION : FORMULA II BRANCH CONVERSION 
      *
           MOVE 'ZSFIIB0001'            TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT           TO L0040-PROGRAM-DESC.
      
      * MSG : RUN MESSAGES.
           MOVE 'ZSFIIB0002'            TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT           TO L0040-HDG-LINE-3.
      
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.
      
       0210-INIT-OCF-TITLES-X.
           EXIT.
      /
      *----------------
       2100-START-UMPR.                                                         
      *----------------
      
           PERFORM  UMPR-1000-OPEN-INPUT
               THRU UMPR-1000-OPEN-INPUT-X.
                
           PERFORM 5000-NEW-UMPR-OPEN-OUTPUT
              THRU 5000-NEW-UMPR-OPEN-OUTPUT-X.
      
           PERFORM  UMPR-1000-READ
               THRU UMPR-1000-READ-X.
                
           ADD +1             TO WS-UMPR-RECORDS-READ.
      
           IF  WUMPR-SEQ-IO-EOF
      * MSG: UMPR INPUT FILE IS EMPTY. JOB COMPLETED NORMALLY. 
               MOVE 'ZSFIIB0003'  TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.
            
           PERFORM  3000-CONVERT-UMPR-BRANCH
               THRU 3000-CONVERT-UMPR-BRANCH-X
               UNTIL WUMPR-SEQ-IO-EOF
      
           PERFORM  UMPR-4000-CLOSE
               THRU UMPR-4000-CLOSE-X.
                
           PERFORM 6000-NEW-UMPR-CLOSE-OUTPUT                                   
              THRU 6000-NEW-UMPR-CLOSE-OUTPUT-X.                                
      
       2100-START-UMPR-X.                                                       
           EXIT.
      /
      *----------------
       2200-START-UMHM.                                                         
      *----------------
      
           PERFORM  UMHM-1000-OPEN-INPUT
               THRU UMHM-1000-OPEN-INPUT-X.
                
           PERFORM 5100-NEW-UMHM-OPEN-OUTPUT
              THRU 5100-NEW-UMHM-OPEN-OUTPUT-X.
      
           PERFORM  UMHM-1000-READ
               THRU UMHM-1000-READ-X.
                
           ADD +1             TO WS-UMHM-RECORDS-READ.
      
           IF  WUMHM-SEQ-IO-EOF
      * MSG: UMHM INPUT FILE IS EMPTY. JOB COMPLETED NORMALLY. 
               MOVE 'ZSFIIB0004'  TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.
      
           PERFORM  3100-CONVERT-UMHM-BRANCH
               THRU 3100-CONVERT-UMHM-BRANCH-X
               UNTIL WUMHM-SEQ-IO-EOF
      
           PERFORM  UMHM-4000-CLOSE
               THRU UMHM-4000-CLOSE-X.
                
           PERFORM 6100-NEW-UMHM-CLOSE-OUTPUT                                   
              THRU 6100-NEW-UMHM-CLOSE-OUTPUT-X.                                
      
       2200-START-UMHM-X.                                                       
           EXIT.
      /
      *----------------
       2300-START-UMIR.                                                         
      *----------------
      
           PERFORM  UMIR-1000-OPEN-INPUT
               THRU UMIR-1000-OPEN-INPUT-X.
                
           PERFORM 5200-NEW-UMIR-OPEN-OUTPUT
              THRU 5200-NEW-UMIR-OPEN-OUTPUT-X.
      
           PERFORM  UMIR-1000-READ
               THRU UMIR-1000-READ-X.
                
           ADD +1             TO WS-UMIR-RECORDS-READ
      
           IF  WUMIR-SEQ-IO-EOF
      * MSG: UMIR INPUT FILE IS EMPTY. JOB COMPLETED NORMALLY.                
               MOVE 'ZSFIIB0005'  TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.
      
           PERFORM  3200-CONVERT-UMIR-BRANCH
               THRU 3200-CONVERT-UMIR-BRANCH-X
               UNTIL WUMIR-SEQ-IO-EOF
                
           PERFORM  UMIR-4000-CLOSE
               THRU UMIR-4000-CLOSE-X.
                
           PERFORM 6200-NEW-UMIR-CLOSE-OUTPUT                                   
              THRU 6200-NEW-UMIR-CLOSE-OUTPUT-X.                                
      
       2300-START-UMIR-X.                                                       
           EXIT.
      /
      *--------------------
       3000-CONVERT-UMPR-BRANCH.
      *--------------------
      
      * ONLY CONVERT DETAIL RECORDS. SKIP HEADER AND TRAILER RECORDS.
       
           IF RUMPR-DATA-CLASS-IND = '1'
      * MSG: UMPR BRANCH CONVERSION PROCESS FOR STICKER : @1.
              MOVE 'ZSFIIB0006'   TO WGLOB-MSG-REF-INFO
              MOVE RUMPR-STCKR-ID TO WGLOB-MSG-PARM (1)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM 3010-UMPR-BRANCH-TRANSLATE
                 THRU 3010-UMPR-BRANCH-TRANSLATE-X
           END-IF.

           PERFORM 4000-NEW-UMPR-WRITE
              THRU 4000-NEW-UMPR-WRITE-X.
               
      * PASS TO NEXT UMPR RECORD.

           PERFORM  UMPR-1000-READ
               THRU UMPR-1000-READ-X.
                
           IF WUMPR-SEQ-IO-OK
              ADD +1                   TO WS-UMPR-RECORDS-READ
           END-IF.

       3000-CONVERT-UMPR-BRANCH-X.                                              
           EXIT.
      *--------------------------------
       3010-UMPR-BRANCH-TRANSLATE.
      *--------------------------------

           MOVE RUMPR-BR-ID            TO WTTAB-ETBL-VALU-ID.

           PERFORM  FIIB-1000-EDIT
               THRU FIIB-1000-EDIT-X.

           IF NOT WTTAB-IO-OK
              MOVE SPACES                 TO RUMPR-BR-ID
           ELSE
              MOVE RTTAB-TTBL-VALU-TXT    TO RUMPR-BR-ID       
           END-IF.

       3010-UMPR-BRANCH-TRANSLATE-X.
           EXIT.
      /
      *--------------------
       3100-CONVERT-UMHM-BRANCH.
      *--------------------
      
      * ONLY CONVERT DETAIL RECORDS. SKIP HEADER AND TRAILER RECORDS.
 
           IF RUMHM-DATA-CLASS-IND = '1'
      * MSG: UMHM BRANCH CONVERSION PROCESS FOR STICKER : @1.
              MOVE 'ZSFIIB0007'   TO WGLOB-MSG-REF-INFO
              MOVE RUMHM-STCKR-ID TO WGLOB-MSG-PARM (1)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM 3110-UMHM-BRANCH-TRANSLATE
                 THRU 3110-UMHM-BRANCH-TRANSLATE-X
           END-IF.

           PERFORM 4100-NEW-UMHM-WRITE
              THRU 4100-NEW-UMHM-WRITE-X.
               
      * PASS TO NEXT UMHM RECORD.
      
           PERFORM  UMHM-1000-READ
               THRU UMHM-1000-READ-X.
      
           IF WUMHM-SEQ-IO-OK
              ADD +1                   TO WS-UMHM-RECORDS-READ
           END-IF.
             
       3100-CONVERT-UMHM-BRANCH-X.                                              
           EXIT.
      *--------------------------------
       3110-UMHM-BRANCH-TRANSLATE.
      *--------------------------------

           MOVE RUMHM-BR-ID            TO WTTAB-ETBL-VALU-ID.

           PERFORM  FIIB-1000-EDIT
               THRU FIIB-1000-EDIT-X.

           IF NOT WTTAB-IO-OK
              MOVE SPACES                 TO RUMHM-BR-ID
           ELSE
              MOVE RTTAB-TTBL-VALU-TXT    TO RUMHM-BR-ID       
           END-IF.

       3110-UMHM-BRANCH-TRANSLATE-X.
           EXIT.
      /
      *--------------------
       3200-CONVERT-UMIR-BRANCH.
      *--------------------
      
      * ONLY CONVERT DETAIL RECORDS. SKIP HEADER AND TRAILER RECORDS.
 
           IF RUMIR-DATA-CLASS-IND = '1'
      * MSG: UMIR BRANCH CONVERSION PROCESS FOR STICKER : @1.
              MOVE 'ZSFIIB0008'   TO WGLOB-MSG-REF-INFO
              MOVE RUMIR-STCKR-ID TO WGLOB-MSG-PARM (1)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM 3210-UMIR-BRANCH-TRANSLATE
                 THRU 3210-UMIR-BRANCH-TRANSLATE-X
           END-IF.

           PERFORM 4200-NEW-UMIR-WRITE
              THRU 4200-NEW-UMIR-WRITE-X.
               
      * PASS TO NEXT UMIR RECORD.
      
           PERFORM  UMIR-1000-READ
               THRU UMIR-1000-READ-X.
      
           IF WUMIR-SEQ-IO-OK
              ADD +1                   TO WS-UMIR-RECORDS-READ
           END-IF.
             
       3200-CONVERT-UMIR-BRANCH-X.                                              
           EXIT.
      *--------------------------------
       3210-UMIR-BRANCH-TRANSLATE.
      *--------------------------------

           MOVE RUMIR-BR-CD            TO WTTAB-ETBL-VALU-ID.

           PERFORM  FIIB-1000-EDIT
               THRU FIIB-1000-EDIT-X.

           IF NOT WTTAB-IO-OK
              MOVE SPACES                 TO RUMIR-BR-CD
           ELSE
              MOVE RTTAB-TTBL-VALU-TXT    TO RUMIR-BR-CD       
           END-IF.

       3210-UMIR-BRANCH-TRANSLATE-X.
           EXIT.
      /                                                                         
      *----------------
       4000-NEW-UMPR-WRITE.                                                     
      *----------------
      
           MOVE ZERO                   TO WNEWUMPR-SEQ-IO-STATUS.               
      
           MOVE SPACES                 TO RNEWUMPR-SEQ-REC-INFO.
            
           MOVE RUMPR-SEQ-REC-INFO     TO RNEWUMPR-SEQ-REC-INFO.
            
           WRITE RNEWUMPR-SEQ-REC-INFO.                                         
      
           IF WNEWUMPR-SEQ-FILE-STATUS  NOT = ZERO                              
               PERFORM 9000-NEW-UMPR-HANDLE-ERROR                               
                   THRU 9000-NEW-UMPR-HANDLE-ERROR-X                            
           END-IF.
      
           ADD +1                   TO WS-UMPR-RECORDS-WRITTEN.
                                                                                
       4000-NEW-UMPR-WRITE-X.                                                   
           EXIT.
      /                                                                         
      *----------------
       4100-NEW-UMHM-WRITE.                                                     
      *----------------
      
           MOVE ZERO                   TO WNEWUMHM-SEQ-IO-STATUS.               
      
           MOVE SPACES                 TO RNEWUMHM-SEQ-REC-INFO.
            
           MOVE RUMHM-SEQ-REC-INFO     TO RNEWUMHM-SEQ-REC-INFO.
            
           WRITE RNEWUMHM-SEQ-REC-INFO.                                         
      
           IF WNEWUMHM-SEQ-FILE-STATUS  NOT = ZERO                              
               PERFORM 9100-NEW-UMHM-HANDLE-ERROR                               
                   THRU 9100-NEW-UMHM-HANDLE-ERROR-X                            
           END-IF.
      
           ADD +1                   TO WS-UMHM-RECORDS-WRITTEN.                 
                                                                                
       4100-NEW-UMHM-WRITE-X.                                                   
           EXIT.
      /                                                                         
      *----------------
       4200-NEW-UMIR-WRITE.                                                     
      *----------------
      
           MOVE ZERO                   TO WNEWUMIR-SEQ-IO-STATUS.               
      
           MOVE SPACES                 TO RNEWUMIR-SEQ-REC-INFO.
            
           MOVE RUMIR-SEQ-REC-INFO     TO RNEWUMIR-SEQ-REC-INFO.
            
           WRITE RNEWUMIR-SEQ-REC-INFO.                                         
      
           IF WNEWUMIR-SEQ-FILE-STATUS  NOT = ZERO                              
               PERFORM 9200-NEW-UMIR-HANDLE-ERROR                               
                   THRU 9200-NEW-UMIR-HANDLE-ERROR-X                            
           END-IF.
                                                                                
           ADD +1                   TO WS-UMIR-RECORDS-WRITTEN.                 
      
       4200-NEW-UMIR-WRITE-X.                                                   
           EXIT.
      /
      *----------------------
       5000-NEW-UMPR-OPEN-OUTPUT.                                               
      *----------------------
      
           MOVE ZERO                   TO WNEWUMPR-SEQ-IO-STATUS.               
      
           OPEN OUTPUT NEW-UMPR-DATA-FILE.                                      
      
           IF WNEWUMPR-SEQ-FILE-STATUS  NOT = ZERO                              
               PERFORM 9000-NEW-UMPR-HANDLE-ERROR                               
                   THRU 9000-NEW-UMPR-HANDLE-ERROR-X                            
           END-IF.
      
       5000-NEW-UMPR-OPEN-OUTPUT-X.                                             
           EXIT.
      /
      *----------------------
       5100-NEW-UMHM-OPEN-OUTPUT.                                               
      *----------------------
      
           MOVE ZERO                   TO WNEWUMHM-SEQ-IO-STATUS.               
      
           OPEN OUTPUT NEW-UMHM-DATA-FILE.                                      
      
           IF WNEWUMHM-SEQ-FILE-STATUS  NOT = ZERO                              
               PERFORM 9100-NEW-UMHM-HANDLE-ERROR                               
                   THRU 9100-NEW-UMHM-HANDLE-ERROR-X                            
           END-IF.
      
       5100-NEW-UMHM-OPEN-OUTPUT-X.                                             
           EXIT.
      /
      *----------------------
       5200-NEW-UMIR-OPEN-OUTPUT.                                               
      *----------------------
      
           MOVE ZERO                   TO WNEWUMIR-SEQ-IO-STATUS.               
      
           OPEN OUTPUT NEW-UMIR-DATA-FILE.                                      
      
           IF WNEWUMIR-SEQ-FILE-STATUS  NOT = ZERO                              
               PERFORM 9200-NEW-UMIR-HANDLE-ERROR                               
                   THRU 9200-NEW-UMIR-HANDLE-ERROR-X                            
           END-IF.
      
       5200-NEW-UMIR-OPEN-OUTPUT-X.                                             
           EXIT.
      /
      *----------------------
       6000-NEW-UMPR-CLOSE-OUTPUT.
      *----------------------
      
           MOVE ZERO                   TO WNEWUMPR-SEQ-IO-STATUS.               
      
           CLOSE NEW-UMPR-DATA-FILE.                                     
      
           IF WNEWUMPR-SEQ-FILE-STATUS  NOT = ZERO                              
               PERFORM 9000-NEW-UMPR-HANDLE-ERROR                               
                   THRU 9000-NEW-UMPR-HANDLE-ERROR-X                            
           END-IF.
      
       6000-NEW-UMPR-CLOSE-OUTPUT-X.
           EXIT.
      /
      *----------------------
       6100-NEW-UMHM-CLOSE-OUTPUT.
      *----------------------
      
           MOVE ZERO                   TO WNEWUMHM-SEQ-IO-STATUS.               
      
           CLOSE NEW-UMHM-DATA-FILE.                                     
      
           IF WNEWUMHM-SEQ-FILE-STATUS  NOT = ZERO                              
               PERFORM 9100-NEW-UMHM-HANDLE-ERROR                               
                   THRU 9100-NEW-UMHM-HANDLE-ERROR-X                            
           END-IF.
      
       6100-NEW-UMHM-CLOSE-OUTPUT-X.
           EXIT.
      /
      *----------------------
       6200-NEW-UMIR-CLOSE-OUTPUT.
      *----------------------
      
           MOVE ZERO                   TO WNEWUMIR-SEQ-IO-STATUS.               
      
           CLOSE NEW-UMIR-DATA-FILE.
      
           IF WNEWUMIR-SEQ-FILE-STATUS  NOT = ZERO                              
               PERFORM 9200-NEW-UMIR-HANDLE-ERROR                               
                   THRU 9200-NEW-UMIR-HANDLE-ERROR-X                            
           END-IF.
      
       6200-NEW-UMIR-CLOSE-OUTPUT-X.
           EXIT.
      /
      *-----------------
       8000-PRINT-STATS.                                                        
      *-----------------
 
           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
 
      *MSG:'UMPR RECORDS READ: @1. UMPR RECORDS CONVERTED: @2.
           MOVE 'ZSFIIB0009'            TO WGLOB-MSG-REF-INFO.
           MOVE WS-UMPR-RECORDS-READ    TO WGLOB-MSG-PARM (1).
           MOVE WS-UMPR-RECORDS-WRITTEN TO WGLOB-MSG-PARM (2).           
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT           TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
 
      *MSG:'UMHM RECORDS READ: @1. UMHM RECORDS CONVERTED: @2.
           MOVE 'ZSFIIB0010'            TO WGLOB-MSG-REF-INFO.
           MOVE WS-UMHM-RECORDS-READ    TO WGLOB-MSG-PARM (1).
           MOVE WS-UMHM-RECORDS-WRITTEN TO WGLOB-MSG-PARM (2).           
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT           TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
 
      *MSG:'UMIR RECORDS READ: @1. UMIR RECORDS CONVERTED: @2.
           MOVE 'ZSFIIB0011'            TO WGLOB-MSG-REF-INFO.
           MOVE WS-UMIR-RECORDS-READ    TO WGLOB-MSG-PARM (1).
           MOVE WS-UMIR-RECORDS-WRITTEN TO WGLOB-MSG-PARM (2).           
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT           TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
 
       8000-PRINT-STATS-X.                                                      
           EXIT.
      /
      *-----------------------
       9000-NEW-UMPR-HANDLE-ERROR.                                              
      *-----------------------
      
           MOVE WNEWUMPR-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.                  
           MOVE WNEWUMPR-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.             
           MOVE WNEWUMPR-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.                  
      
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.
      
       9000-NEW-UMPR-HANDLE-ERROR-X.                                            
           EXIT.
      /
      *-----------------------
       9100-NEW-UMHM-HANDLE-ERROR.                                              
      *-----------------------
      
           MOVE WNEWUMHM-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.                  
           MOVE WNEWUMHM-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.             
           MOVE WNEWUMHM-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.                  
      
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.
      
       9100-NEW-UMHM-HANDLE-ERROR-X.                                            
           EXIT.
      /
      *-----------------------
       9200-NEW-UMIR-HANDLE-ERROR.                                              
      *-----------------------
      
           MOVE WNEWUMIR-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.                  
           MOVE WNEWUMIR-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.             
           MOVE WNEWUMIR-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.                  
      
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.
      
       9200-NEW-UMIR-HANDLE-ERROR-X.                                            
           EXIT.
 
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
P02229 COPY XCPL0035.

       COPY XCPPHDG.
       COPY XCPPTIME.
      /
       COPY XCPL0260.
       COPY XCPL0040.
       COPY XCPL1640.
      /
       COPY NCPLUMPR.
       COPY NCPLUMHM.
       COPY NCPLUMIR.
      /
       COPY NCPOUMPR.
       COPY NCPOUMHM.
       COPY NCPOUMIR.
      /
       COPY NCPNUMPR.
       COPY NCPNUMHM.
       COPY NCPNUMIR.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
       COPY XCPOBCF.
      /
       COPY XCPLBCF.
       COPY XCPNBCF.
      /
       COPY CCPPCCC.
       COPY CCPL0950.
       COPY CCPS0950.
       COPY CCPS0010.
       COPY CCPL0010.
       COPY XCPL0030.
      /
       COPY ZCPEFIIB.
       COPY NCPNTTAB.
       
      /
       COPY XCPL0280.
      /
       COPY XCPL1680.       

      *****************************************************************
      **                 END OF PROGRAM ZSBMFIIB                     **
      *****************************************************************
