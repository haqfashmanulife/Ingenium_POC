 
      *****************************************************************
      **  MEMBER : ZSBM9746                                          **
      **  REMARKS: ONE SHOT PROGRAM FOR CS9746                       **
      **           RECORD LAYOUT CHANGE                              **
      **           THIS MODULE WILL CONVERT OLD CS9746 FILE LENGTH   **
      **           FROM 704 TO 772                                   **
      **  DOMAIN : AG                                                **
      **  CLASS  : PD                                                **
      *****************************************************************
      **  DATE      AUTH.  DESCRIPTION                               **
      **                                                             **
MP171A**   22MAY    CTS    CREATED                                   **
      *****************************************************************
      
      ************************
       IDENTIFICATION DIVISION.
      ************************
      
       PROGRAM-ID.    ZSBM9746.
       
       COPY XCWWCRHT.
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
       
           SELECT 9746-DATA-FILE ASSIGN TO ZS9746
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS W9746-SEQ-FILE-STATUS . 
                  
           SELECT TEMP-DATA-FILE ASSIGN TO ZSTEMP
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WTEMP-SEQ-FILE-STATUS .       
      /
      ***************
       DATA DIVISION.
      ***************
 
       FILE SECTION.
       
       FD  9746-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD. 
       01  R9746-SEQ-REC-INFO               PIC X(704).       
       
       FD  TEMP-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD. 
       01  RTEMP-SEQ-REC-INFO               PIC X(772).
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM9746'.
      /
       COPY SQLCA.
      /

       01  WS-NEW-SEQ-REC-INFO.
           05  WS-NEW-INFO                  PIC X(751).
           05  WS-NEW-FILLER                PIC X(21).              
                      
       01  WS-OLD-SEQ-REC-INFO.
           05  WS-OLD-INFO                  PIC X(691).
           05  WS-OLD-FILER                 PIC X(13).              
           
       01  WTEMP-SEQ-IO-WORK-AREA.
           05  WTEMP-SEQ-FILE-NAME          PIC X(04)
                                            VALUE 'TEMP'.
           05  WTEMP-SEQ-IO-COMMAND         PIC X(02).
           05  WTEMP-SEQ-FILE-STATUS        PIC X(02).
           05  WTEMP-SEQ-IO-STATUS          PIC 9(01).
               88  WTEMP-SEQ-IO-OK          VALUE 0.
               88  WTEMP-SEQ-IO-NOT-FOUND   VALUE 7.
               88  WTEMP-SEQ-IO-EOF         VALUE 8.
               88  WTEMP-SEQ-IO-ERROR       VALUE 9.    

       01  W9746-SEQ-IO-WORK-AREA.
           05  W9746-SEQ-FILE-NAME          PIC X(04)
                                            VALUE '9746'.
           05  W9746-SEQ-IO-COMMAND         PIC X(02).
           05  W9746-SEQ-FILE-STATUS        PIC X(02).
           05  W9746-SEQ-IO-STATUS          PIC 9(01).
               88  W9746-SEQ-IO-OK          VALUE 0.
               88  W9746-SEQ-IO-NOT-FOUND   VALUE 7.
               88  W9746-SEQ-IO-EOF         VALUE 8.
               88  W9746-SEQ-IO-ERROR       VALUE 9.                

/
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
      ***********************************************************
      * CALLED MODULE PARAMETER INFORMATION
      ***********************************************************   
       COPY XCWL1680.
       COPY XCWL1670.
      *****************************************************************
      *  CALL MODULE PARAMETER INFORMATION                            *
      *****************************************************************
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY CCWL0010.
      /
       COPY CCWL0950.
      /
       COPY XCWL0035.
      /
       COPY XCWL0040.
      /
       COPY XCWL1660.
      /
       COPY XCWLDTLK.
      /
       COPY XCWTFCMD.
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
               THRU 2000-PROCESS-TRANSACTIONS-X.              

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
               
           SET  W9746-SEQ-IO-OK             TO TRUE.
	  
	   OPEN INPUT 9746-DATA-FILE.
	  
           IF  W9746-SEQ-FILE-STATUS  NOT = ZERO
               MOVE W9746-SEQ-FILE-NAME     TO WGLOB-TABLE-NAME
               MOVE W9746-SEQ-FILE-STATUS   TO WGLOB-SEQ-FILE-STATUS
               MOVE W9746-SEQ-IO-COMMAND    TO WGLOB-IO-COMMAND

               PERFORM 0030-3000-QSAM-ERROR
                  THRU 0030-3000-QSAM-ERROR-X
           END-IF.

           SET  WTEMP-SEQ-IO-OK             TO TRUE.
	  
	   OPEN OUTPUT TEMP-DATA-FILE.
	  
           IF  WTEMP-SEQ-FILE-STATUS  NOT = ZERO
               MOVE WTEMP-SEQ-FILE-NAME     TO WGLOB-TABLE-NAME
               MOVE WTEMP-SEQ-FILE-STATUS   TO WGLOB-SEQ-FILE-STATUS
               MOVE WTEMP-SEQ-IO-COMMAND    TO WGLOB-IO-COMMAND

               PERFORM 0030-3000-QSAM-ERROR
                  THRU 0030-3000-QSAM-ERROR-X
           END-IF.
               
       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------------
       1000-INIT-FOR-COMPANY.
      *----------------------

           MOVE 'CP'                        TO WGLOB-COMPANY-CODE.

           MOVE 'ZSBM9746'                  TO WGLOB-MAIN-PGM-ID
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

           PERFORM 2005-9746-READ
              THRU 2005-9746-READ-X.
            
           IF  W9746-SEQ-IO-EOF
               MOVE 'XS80850005'            TO WGLOB-MSG-REF-INFO           
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-PROCESS-TRANSACTIONS-X
           END-IF.
           
           PERFORM  2100-FILE-CONVERT
               THRU 2100-FILE-CONVERT-X
               UNTIL W9746-SEQ-IO-EOF.
           
       2000-PROCESS-TRANSACTIONS-X.
           EXIT.
      /

      *------------------
       2100-FILE-CONVERT.
      *------------------
       
           INITIALIZE WS-NEW-SEQ-REC-INFO.
           INITIALIZE WS-OLD-SEQ-REC-INFO.
       
           MOVE R9746-SEQ-REC-INFO          TO WS-OLD-SEQ-REC-INFO.
       
           MOVE WS-OLD-INFO                 TO WS-NEW-INFO.
           MOVE ZEROES                      TO WS-NEW-FILLER.
       
           MOVE WS-NEW-SEQ-REC-INFO         TO RTEMP-SEQ-REC-INFO.
       
           SET  WTEMP-SEQ-IO-OK             TO TRUE.

           WRITE RTEMP-SEQ-REC-INFO.

           IF  WTEMP-SEQ-FILE-STATUS  NOT = ZERO
               MOVE WTEMP-SEQ-FILE-NAME     TO WGLOB-TABLE-NAME
               MOVE WTEMP-SEQ-FILE-STATUS   TO WGLOB-SEQ-FILE-STATUS
               MOVE WTEMP-SEQ-IO-COMMAND    TO WGLOB-IO-COMMAND

               PERFORM 0030-3000-QSAM-ERROR
                  THRU 0030-3000-QSAM-ERROR-X
           END-IF.
          
           PERFORM 2005-9746-READ
              THRU 2005-9746-READ-X.
       
       2100-FILE-CONVERT-X.
           EXIT.
      /
      
      *----------------
       2005-9746-READ.
      *----------------

            SET  W9746-SEQ-IO-OK          TO TRUE.
 
            READ 9746-DATA-FILE
                AT END
                    SET  W9746-SEQ-IO-EOF TO TRUE 
                    GO TO 2005-9746-READ-X.
 
            IF  R9746-SEQ-REC-INFO EQUAL HIGH-VALUES
                    SET  W9746-SEQ-IO-EOF TO TRUE 
            END-IF.
 
            IF  W9746-SEQ-FILE-STATUS  NOT = ZERO
                MOVE W9746-SEQ-FILE-NAME     TO WGLOB-TABLE-NAME
                MOVE W9746-SEQ-FILE-STATUS   TO WGLOB-SEQ-FILE-STATUS
                MOVE W9746-SEQ-IO-COMMAND    TO WGLOB-IO-COMMAND
 
                PERFORM 0030-3000-QSAM-ERROR
                   THRU 0030-3000-QSAM-ERROR-X
           END-IF.

       2005-9746-READ-X.
           EXIT.
      /   
      
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           SET  WTEMP-SEQ-IO-OK             TO TRUE.
           
           CLOSE TEMP-DATA-FILE.
                      
           IF  WTEMP-SEQ-FILE-STATUS  NOT = ZERO
               MOVE WTEMP-SEQ-FILE-NAME     TO WGLOB-TABLE-NAME
               MOVE WTEMP-SEQ-FILE-STATUS   TO WGLOB-SEQ-FILE-STATUS
               MOVE WTEMP-SEQ-IO-COMMAND    TO WGLOB-IO-COMMAND

               PERFORM 0030-3000-QSAM-ERROR
                  THRU 0030-3000-QSAM-ERROR-X
           END-IF.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.
               
           SET  W9746-SEQ-IO-OK             TO TRUE.
           
           CLOSE 9746-DATA-FILE.
                      
           IF  W9746-SEQ-FILE-STATUS  NOT = ZERO
               MOVE W9746-SEQ-FILE-NAME     TO WGLOB-TABLE-NAME
               MOVE W9746-SEQ-FILE-STATUS   TO WGLOB-SEQ-FILE-STATUS
               MOVE W9746-SEQ-IO-COMMAND    TO WGLOB-IO-COMMAND

               PERFORM 0030-3000-QSAM-ERROR
                  THRU 0030-3000-QSAM-ERROR-X
           END-IF.

       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************
      *               I/O PROCESSING COPYBOOKS                        *
      *****************************************************************
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
      /
       COPY CCPL0010.
       COPY CCPS0010.
      /
       COPY CCPS0950.
       COPY CCPL0950.
      /
       COPY XCPL0030.
      /
       COPY XCPL0035.
      /
       COPY XCPL0040.
      /
       COPY XCPL0260.
      /
       COPY XCPL1660.
      /
       COPY XCPL1680.
      *****************************************************************
      *                END OF PROGRAM ZSBM9746                        *
      ******************************************************************
