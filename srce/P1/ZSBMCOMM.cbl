      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBMCOMM.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSBMCOMM                                          **
      **  REMARKS: ONE SHOT PROGAM FOR COMMISSION RECORD LAYOUT      **
      **           CHANGE                                            **
      **           THIS MODULE WILL CONVERT OLD MCOM                 **
      **           FILE FORMAT IN TO NEW MCOM FILE FORMAT            **
      **  DOMAIN : AG                                                **
      **  CLASS  : PD                                                **
      *****************************************************************
      **  DATE      AUTH.  DESCRIPTION                               **
MP181C**  14JUN12   CTS    CREATION OF MODULE                        **
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
                  
           SELECT MCOM-DATA-FILE ASSIGN     TO CSMCOM
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WMCOM-SEQ-FILE-STATUS.       
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       FD  CIPF-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.
           
       01  RCIPF-SEQ-REC-INFO               PIC X(375).    
           
       FD  MCOM-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.    

       01  RMCOM-SEQ-REC-INFO               PIC X(399).


      *************************
       WORKING-STORAGE SECTION.
      *************************
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCOMM'.

       COPY SQLCA.
      /
       COPY XCWL0035.

       COPY XCWWHDG.
      /
       01  WS-MCOM-SEQ-REC-INFO.
           05  WS-OLD-MCOM-SEQ-REC-INFO     PIC X(375).
           05  WS-ADDED-MCOM-SEQ-REC-INFO.
             10  WS-APL-PREM-IND          PIC X(01).
             10  WS-APL-BAL-AMT           PIC 9(13).
             10  WS-APL-EFF-DT            PIC X(10).
              
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
       COPY CCSWMCOM.
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

           IF  WCIPF-SEQ-FILE-STATUS  NOT = ZERO
           PERFORM  9700-HANDLE-ERROR
               THRU 9700-HANDLE-ERROR-X
           END-IF.
           
           OPEN OUTPUT MCOM-DATA-FILE.
           
           IF  WMCOM-SEQ-FILE-STATUS  NOT = ZERO
               PERFORM  9800-HANDLE-ERROR
                   THRU 9800-HANDLE-ERROR-X
           END-IF.           

       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------------
       1000-INIT-FOR-COMPANY.
      *----------------------

           MOVE 'CP'                        TO WGLOB-COMPANY-CODE.

           MOVE 'ZSBMCOMM'                  TO WGLOB-MAIN-PGM-ID 
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
      * READ RECORD FROM INPUT FILE(MCOM)ONE AT TIME
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

           INITIALIZE WS-MCOM-SEQ-REC-INFO.
           
           MOVE ZERO                        TO WCIPF-SEQ-IO-STATUS.

           READ CIPF-DATA-FILE 
                AT END 
                  MOVE 8                    TO WCIPF-SEQ-IO-STATUS
                  GO TO 9500-CIPF-READ-X.

           IF  RCIPF-SEQ-REC-INFO EQUAL HIGH-VALUES
           MOVE 8                           TO WCIPF-SEQ-IO-STATUS
           END-IF.

           IF  WCIPF-SEQ-FILE-STATUS  NOT = ZERO
           PERFORM  9700-HANDLE-ERROR
               THRU 9700-HANDLE-ERROR-X
           END-IF.
           
           MOVE SPACES                      TO WS-APL-PREM-IND.
	   MOVE ZERO                        TO WS-APL-BAL-AMT.
	   MOVE WWKDT-ZERO-DT               TO WS-APL-EFF-DT.


           MOVE RCIPF-SEQ-REC-INFO          TO WS-OLD-MCOM-SEQ-REC-INFO.
           MOVE WS-MCOM-SEQ-REC-INFO        TO RMCOM-SEQ-REC-INFO.
      *
      *  WRITE THE NEW FORMAT FILE IN THE PATH SPECIFIED IN THE PROC
      *

           MOVE ZERO                        TO WMCOM-SEQ-IO-STATUS.

           WRITE RMCOM-SEQ-REC-INFO.

           IF  WMCOM-SEQ-FILE-STATUS  NOT = ZERO
               PERFORM  9800-HANDLE-ERROR
                   THRU 9800-HANDLE-ERROR-X
           END-IF.


       9500-CIPF-READ-X.
           EXIT.
      /
      *-----------------------
       9700-HANDLE-ERROR.
      *-----------------------

           MOVE WCIPF-SEQ-FILE-NAME         TO WGLOB-TABLE-NAME.
           MOVE WCIPF-SEQ-FILE-STATUS       TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCIPF-SEQ-IO-COMMAND        TO WGLOB-IO-COMMAND.
           PERFORM  0030-3000-QSAM-ERROR
               THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-ERROR-X.
           EXIT.
      /
      *----------------------
       9800-HANDLE-ERROR.
      *----------------------

           MOVE WMCOM-SEQ-FILE-NAME     TO WGLOB-TABLE-NAME.
           MOVE WMCOM-SEQ-FILE-STATUS   TO WGLOB-SEQ-FILE-STATUS.
           MOVE WMCOM-SEQ-IO-COMMAND    TO WGLOB-IO-COMMAND.

           PERFORM  0030-3000-QSAM-ERROR
               THRU 0030-3000-QSAM-ERROR-X.

       9800-HANDLE-ERROR-X.
           EXIT.
      /         
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                        TO WCIPF-SEQ-IO-STATUS.

           CLOSE CIPF-DATA-FILE.

           IF  WCIPF-SEQ-FILE-STATUS  NOT = ZERO
               PERFORM  9700-HANDLE-ERROR
                   THRU 9700-HANDLE-ERROR-X
           END-IF.
           
           CLOSE MCOM-DATA-FILE.
           
           IF  WMCOM-SEQ-FILE-STATUS  NOT = ZERO
               PERFORM  9800-HANDLE-ERROR
                   THRU 9800-HANDLE-ERROR-X
           END-IF.            

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
       COPY CCPOMCOM.
       COPY CCPAMCOM.
       COPY CCPLMCOM.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM ZSBMCOMM                     **
      *****************************************************************
