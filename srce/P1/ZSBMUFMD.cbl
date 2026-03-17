      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBMUFMD.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : CSBMUFMD                                          **
      **  REMARKS: ONE SHOT PROGAM FOR DATE CONVERSION               **
      **           THIS MODULE WILL CONVERT DATE FROM EMPIOR DATE    **
      **           FORMAT TO WESTERN DATE FORMAT                     **
      **  DOMAIN :                                                   **
      **  CLASS  :                                                   **
      *****************************************************************
      **  DATE      AUTH.  DESCRIPTION                               **
015550**  14MAR2019 CTS    INITIAL REVISION                          **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

           SELECT CIPF-DATA-FILE ASSIGN     TO ZSCIPF
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WCIPF-SEQ-FILE-STATUS.


      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.
       
       FD  CIPF-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

        01  RCIPF-SEQ-REC-INFO               PIC X(867).
        
    
      *************************
       WORKING-STORAGE SECTION.
      *************************
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMUFMD'.

       COPY SQLCA.
      /
       COPY XCWL0035.

       COPY XCWWHDG.
      /
      
      
       01  WS-931A-OLD-SEQ-REC-INFO.  
           05  WS-931A-DATA-CLASS-IND             PIC X(01).                  
           05  WS-931A-BR-ID                      PIC X(03).              
           05  WS-931A-MED-EXAM-CD                PIC X(06).                    
           05  WS-931A-MED-HANDWRIT-1-IND         PIC X(01).                           
           05  WS-931A-MED-HANDWRIT-2-IND         PIC X(01).                           
           05  WS-931A-MED-INCMPLT-IND            PIC X(02).                        
           05  WS-931A-MED-NON-CNTRCT-IND         PIC X(01).                           
           05  WS-931A-SHT-1-ID                   PIC X(05).                 
           05  WS-931A-MED-RPT-NUM-ID             PIC X(07).                       
           05  WS-931A-MED-FILE-PERS-ID           PIC X(06).                         
           05  WS-931A-MED-GNRL-COND-IND          PIC X(02).                          
           05  WS-931A-CLI-HT                     PIC X(03).               
           05  WS-931A-MED-CHST-IND               PIC X(02).                     
           05  WS-931A-MED-CIRC-CHST-QTY          PIC X(03).                          
           05  WS-931A-MED-ABDMN-IND              PIC X(02).                      
           05  WS-931A-MED-CIRC-ABDMN-QTY         PIC X(03).                           
           05  WS-931A-MED-NERV-SYS-IND           PIC X(02).                         
           05  WS-931A-CLI-WGT                    PIC X(03).                
           05  WS-931A-MED-SENS-SYS-IND           PIC X(02).                         
           05  WS-931A-MED-PULS-RT                PIC X(03).                    
           05  WS-931A-MED-MOTR-ORGN-IND          PIC X(02).                          
           05  WS-931A-MED-ARRHTHM-IND            PIC X(02).                                                                    
           05  WS-931A-MED-ARRHTHM-RT             PIC X(02).                       
           05  WS-931A-MED-DSTNC-CHAR-IND         PIC X(02).                           
           05  WS-931A-MED-MAX-BLOOD-RT           PIC X(03).                         
           05  WS-931A-MED-OTH-IND                PIC X(02).                    
           05  WS-931A-MED-MIN-BLOOD-RT           PIC X(03).                                       
           05  WS-931A-MED-URIN-TST-IND           PIC X(01).                                                                     
           05  WS-931A-MED-EXAM-DT1               PIC X(06).              
           05  WS-931A-MED-URIN-PROTN-NUM         PIC X(05).                           
           05  WS-931A-MED-EXAM-DUR               PIC X(04).                     
           05  WS-931A-MED-OUTSD-WRK-IND          PIC X(01).                          
           05  WS-931A-MED-HLDY-IND               PIC X(01).                     
           05  WS-931A-MED-URIN-SUGR-NUM          PIC X(05).                          
           05  WS-931A-MED-EXAM-LOC-CD            PIC X(06).                        
           05  WS-931A-MED-URIN-BLOOD-CD          PIC X(04).                          
           05  WS-931A-MED-ALCHL-IND              PIC X(02).                      
           05  WS-931A-MED-SMK-IND                PIC X(02).                    
           05  WS-931A-MED-SMK-CIG-QTY            PIC X(03).                        
           05  WS-931A-MED-EKG-IND                PIC X(01).                    
           05  WS-931A-MED-XRAY-IND               PIC X(01).                     
           05  WS-931A-MED-BLOOD-TST-IND          PIC X(01).                      
           05  WS-931A-MED-BLOOD-TST-AMT          PIC X(04).                          
           05  WS-931A-MED-ACQNT-IND              PIC X(02).                                                                  
           05  WS-931A-MED-PSTL-AMT               PIC X(03).                     
           05  WS-931A-MED-EFF-IND                PIC X(02).                    
           05  WS-931A-STCKR-ID                   PIC X(11).                 
           05  WS-931A-SHT-2-ID                   PIC X(05).                 
           05  WS-931A-SELF-INSRD-KA-NM           PIC X(16).                         
           05  WS-931A-SELF-EMPRR-CD              PIC X(03).
           05  WS-931A-SELF-BTH-DT                PIC X(06).                    
           05  WS-931A-SELF-SEX-CD                PIC X(02).                                                                
           05  WS-931A-SELF-DSCLSRE-DT            PIC X(06).              
           05  WS-931A-SELF-REL-IND               PIC X(02).                     
           05  WS-931A-SELF-PROF-CD               PIC X(02).                     
           05  WS-931A-MED-CNFRM-CD               PIC X(01).                     
           05  WS-931A-DNGR-JOB-IND               PIC X(02).                     
           05  WS-931A-CNSLT-DOCTOR-IND           PIC X(02).                                                                     
           05  WS-931A-SELF-HOSP-5YRS-IND         PIC X(02).                           
           05  WS-931A-OTHR-ILL-SURGY-IND         PIC X(02).                           
           05  WS-931A-SELF-HD-RECV-IND           PIC X(02).                         
           05  WS-931A-SELF-MOTR-ORGN-IND         PIC X(02).                           
           05  WS-931A-CLI-DISAB-IND              PIC X(02).                      
           05  WS-931A-SELF-FMLE-HOSP-IND         PIC X(02).                           
           05  WS-931A-SELF-PREG-IND              PIC X(02).                                                                  
           05  WS-931A-SELF-PREG-WK               PIC X(02).                     
           05  WS-931A-SELF-PREG-MO               PIC X(02).                     
           05  WS-931A-MED-CANCER-Q2-IND          PIC X(02).                                                                      
           05  WS-931A-MED-CANCER-Q3-IND          PIC X(02).                          
           05  WS-931A-MED-LTC-Q1-IND             PIC X(02).                       
           05  WS-931A-MED-LTC-Q2-IND             PIC X(02).                       
           05  WS-931A-MED-EXAM-DT                PIC X(08).
           05  WS-931A-SELF-DSCLSRE-DT2           PIC X(08).                   
           05  FILLER                             PIC X(639).


       
       
        01  WS-PGM-WORK-AREA.
            05  WS-LEN-NUM                     PIC 9(04).
            05  WS-DT.
                10  WS-YY                     PIC 9(02).
                10  WS-MM                     PIC 9(02).
                10  WS-DD                     PIC 9(02).    
            05  WS-INPUT-EDIT-IND             PIC X(01).
                88  WS-INPUT-EDIT-NOT-OK      VALUE 'N'.
                88  WS-INPUT-EDIT-OK          VALUE 'Y'.           
            05  WS-INPUT-CD                   PIC X(01).
                88  WS-INPUT-EDIT             VALUE 'E'.           
                88  WS-INPUT-PRCES            VALUE 'P'. 
            05  WS-931A-DT.
                10  WS-931A-YYYY              PIC 9(04).
                10  FILLER                    PIC X.
                10  WS-931A-MM                PIC 9(02).
                10  FILLER                    PIC X.
                10  WS-931A-DD                PIC 9(02).
            05  WS-NEW-931A-DT.
                10  WS-NEW-931A-YYYY          PIC 9(04).
                10  WS-NEW-931A-MM            PIC 9(02).
                10  WS-NEW-931A-DD            PIC 9(02). 
                      
       01  WCIPF-SEQ-IO-WORK-AREA.
           05  WCIPF-SEQ-FILE-NAME          PIC X(04)
                                            VALUE 'CIPF'.
           05  WCIPF-SEQ-IO-COMMAND         PIC X(02).
           05  WCIPF-SEQ-FILE-STATUS        PIC X(02).
           05  WCIPF-SEQ-IO-STATUS          PIC 9(01).
               88  WCIPF-SEQ-IO-OK          VALUE 0.
               88  WCIPF-SEQ-IO-NOT-FOUND   VALUE 7.
               88  WCIPF-SEQ-IO-EOF         VALUE 8.
               88  WCIPF-SEQ-IO-ERROR       VALUE 9.   
               
     /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.

       COPY XCWWWKDT.
       COPY XCWWTIME.
      /
       COPY XCWLDTLK.
      /
       COPY XCWTFCMD.
      /
       COPY CCWWCCC.
      /
       COPY CCWWINDX.
      /

      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWBCF.
       COPY XCSRBCF.
       COPY NCSR931A.
       COPY NCSW931A.
       COPY NCSRUSDL.
      /
      *****************************************************************
      *  CALL MODULE PARAMETER INFORMATION                            *
      *****************************************************************
       COPY CCWLPGA.
       COPY CCWL0010.
       COPY XCWL0040.
       COPY CCWL0950.
      /
       COPY XCWL2490.
       COPY XCWL1670.
       COPY XCWL1680.
       COPY XCWL1640.
       COPY XCWL9680.
      /
      ********************
       PROCEDURE DIVISION.
      ********************

      *---------------
       0000-MAIN-LINE.
      *---------------

           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  1000-INIT-FOR-COMPANY
               THRU 1000-INIT-FOR-COMPANY-X.

           PERFORM  2000-PROCESS-TRANSACTIONS
               THRU 2000-PROCESS-TRANSACTIONS-X
              UNTIL WCIPF-SEQ-IO-EOF.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

           STOP RUN.

       0000-MAIN-LINE-X.
           EXIT.
      /
      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           MOVE ZERO                        TO WCIPF-SEQ-IO-STATUS.

           OPEN INPUT CIPF-DATA-FILE.

           IF WCIPF-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM  9700-HANDLE-ERROR
                  THRU 9700-HANDLE-ERROR-X
           END-IF.

           PERFORM  931A-4000-OPEN-OUTPUT
               THRU 931A-4000-OPEN-OUTPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------------
       1000-INIT-FOR-COMPANY.
      *----------------------

           MOVE 'CP'                        TO WGLOB-COMPANY-CODE.

           MOVE 'ZSBMUSDL'                  TO WGLOB-MAIN-PGM-ID
                                               WGLOB-CRNT-PGM-ID.

           PERFORM  0010-1000-INIT-DEFAULT
               THRU 0010-1000-INIT-DEFAULT-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           PERFORM  1100-INIT-OCF-TITLES
               THRU 1100-INIT-OCF-TITLES-X.

       1000-INIT-FOR-COMPANY-X.
           EXIT.
      /
      *---------------------
       1100-INIT-OCF-TITLES.
      *---------------------
      *
      * SET UP THE TITLE/HEADING LINES FOR THE OCF REPORT
      *
           MOVE ZERO                        TO L0040-ERROR-CNT.
      *
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       1100-INIT-OCF-TITLES-X.
           EXIT.
      /
      *-------------------------
       2000-PROCESS-TRANSACTIONS.
      *-------------------------
      *
      * READ RECORD FROM INPUT FILE(931A) ONE AT TIME
      * UNTIL END-OF FILE REACHED.
      *

           PERFORM  9500-CIPF-READ
               THRU 9500-CIPF-READ-X.
           IF NOT WCIPF-SEQ-IO-OK
               GO TO 2000-PROCESS-TRANSACTIONS-X
           END-IF.

       2000-PROCESS-TRANSACTIONS-X.
           EXIT.
      /

      *---------------
       9500-CIPF-READ.
      *---------------


           INITIALIZE WS-931A-OLD-SEQ-REC-INFO.
           

           MOVE ZERO                        TO WCIPF-SEQ-IO-STATUS.

           READ CIPF-DATA-FILE
                AT END
                  MOVE 8                    TO WCIPF-SEQ-IO-STATUS
                  GO TO 9500-CIPF-READ-X.

           IF RCIPF-SEQ-REC-INFO EQUAL HIGH-VALUES
              MOVE 8                        TO WCIPF-SEQ-IO-STATUS
           END-IF.

           IF WCIPF-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM  9700-HANDLE-ERROR
                  THRU 9700-HANDLE-ERROR-X
           END-IF.

           MOVE RCIPF-SEQ-REC-INFO          TO WS-931A-OLD-SEQ-REC-INFO.
           
      * SKIP THE HEADER AND TAILER RECORD. PERFORM ONLY FOR DETAIL RECORD
           IF WS-931A-DATA-CLASS-IND  = '1'    
      * DATE CONVERSION FROM EMPIOR DATE TO WESTER DATE     
                    PERFORM  3006-SELF-DSCLSRE-DT
                        THRU 3006-SELF-DSCLSRE-DT-X 
           END-IF.
           
           MOVE WS-931A-OLD-SEQ-REC-INFO        TO R931A-SEQ-REC-INFO.
      *
      *  WRITE THE NEW FORMAT FILE IN THE PATH SPECIFIED IN THE PROC
      *
           PERFORM  931A-2000-WRITE
               THRU 931A-2000-WRITE-X.

       9500-CIPF-READ-X.
           EXIT.
           
      *---------------------
       3006-SELF-DSCLSRE-DT.
      *---------------------        
      
      * SELF DISCLOSURE DATE


      * UPDATE SELF DISCLOSURE DATE USING EMPEROR DATE CONVERSION UTILITY
               MOVE WS-931A-SELF-DSCLSRE-DT
                                            TO WS-DT
               MOVE WS-YY                   TO L9680-EMP-YY
               MOVE WS-MM                   TO L9680-EMP-MM
               MOVE WS-DD                   TO L9680-EMP-DD
               MOVE SPACES                  TO L9680-EMPEROR-NUM
               SET L9680-EMPEROR-HEISEI     TO TRUE
               PERFORM  9680-2000-EMP-TO-INT
                   THRU 9680-2000-EMP-TO-INT-X
               MOVE L9680-INTERNAL-DATE     TO L1640-EXTERNAL-DATE
               PERFORM  1640-6000-CTL-CARD-TO-INT
                   THRU 1640-6000-CTL-CARD-TO-INT-X     
               IF  L1640-NOT-VALID   
                   SET WS-INPUT-EDIT-NOT-OK TO TRUE
                   MOVE 'NSUPLE0000'        TO WGLOB-MSG-REF-INFO
               ELSE
                   MOVE L1640-INTERNAL-DATE TO WS-931A-DT
                   MOVE WS-931A-YYYY        TO WS-NEW-931A-YYYY
                   MOVE WS-931A-MM          TO WS-NEW-931A-MM
                   MOVE WS-931A-DD          TO WS-NEW-931A-DD
                   MOVE WS-NEW-931A-DT      TO WS-931A-SELF-DSCLSRE-DT2
               END-IF.
      * UPDATE MEDICAL EXAM DATE USING EMPEROR DATE CONVERSION UTILITY
               MOVE WS-931A-MED-EXAM-DT1
                                            TO WS-DT
               MOVE WS-YY                   TO L9680-EMP-YY
               MOVE WS-MM                   TO L9680-EMP-MM
               MOVE WS-DD                   TO L9680-EMP-DD
               MOVE SPACES                  TO L9680-EMPEROR-NUM
               SET L9680-EMPEROR-HEISEI     TO TRUE
               PERFORM  9680-2000-EMP-TO-INT
                   THRU 9680-2000-EMP-TO-INT-X
               MOVE L9680-INTERNAL-DATE     TO L1640-EXTERNAL-DATE
               PERFORM  1640-6000-CTL-CARD-TO-INT
                   THRU 1640-6000-CTL-CARD-TO-INT-X     
               IF  L1640-NOT-VALID   
                   SET WS-INPUT-EDIT-NOT-OK TO TRUE
                   MOVE 'NSUPLE0000'        TO WGLOB-MSG-REF-INFO
               ELSE
                   MOVE L1640-INTERNAL-DATE TO WS-931A-DT
                   MOVE WS-931A-YYYY        TO WS-NEW-931A-YYYY
                   MOVE WS-931A-MM          TO WS-NEW-931A-MM
                   MOVE WS-931A-DD          TO WS-NEW-931A-DD
                   MOVE WS-NEW-931A-DT      TO WS-931A-MED-EXAM-DT
               END-IF.
      
       3006-SELF-DSCLSRE-DT-X.
           EXIT.
      /  

      *-----------------------
       9700-HANDLE-ERROR.
      *-----------------------

           MOVE WCIPF-SEQ-FILE-NAME          TO WGLOB-TABLE-NAME.
           MOVE WCIPF-SEQ-FILE-STATUS        TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCIPF-SEQ-IO-COMMAND         TO WGLOB-IO-COMMAND.
           PERFORM  0030-3000-QSAM-ERROR
               THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-ERROR-X.
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                        TO W931A-SEQ-IO-STATUS.

           CLOSE CIPF-DATA-FILE.

           IF WCIPF-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM  9700-HANDLE-ERROR
                  THRU 9700-HANDLE-ERROR-X
           END-IF.

           PERFORM  931A-5000-CLOSE
               THRU 931A-5000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /

      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************
       COPY XCPL0035.
       COPY XCPPTIME.
       COPY CCPPCCC.
      /
       COPY XCPL0040.
      /
       COPY CCPS0010.
       COPY CCPL0010.
      /
       COPY CCPS0950.
       COPY CCPL0950.
      /
       COPY XCPL0260.
      /
       COPY XCPL2490.
       COPY XCPS2490.
       COPY XCPL9680.
       COPY XCPS9680.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULE                                      *
      *****************************************************************
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPLBCF.
       COPY XCPNBCF.
       COPY XCPOBCF.
      /
       COPY XCPL1680.
       COPY XCPL1640.
      /
       COPY NCPO931A.
       COPY NCPA931A.
       COPY NCPL931A.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM ZSBMMCOM                     **
      *****************************************************************
