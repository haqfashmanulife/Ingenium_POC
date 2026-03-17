      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMCMBA.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMCMBA                                         **         
      **  REMARKS:  THIS WILL READ IN THE 'ULST' FILE AND CREATE THE **
      **            'DLY' FILE - INPUT FOR JOB NJPD9600 FOR ACTUATE  **
      **            TO CREATE THE 'FLEXI' CERTIFICATES.              **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT ULST-DATA-FILE ASSIGN TO ZSULST
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WULST-SEQ-FILE-STATUS.
      /
       DATA DIVISION.
       FILE SECTION.

       FD  ULST-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RULST-SEQ-REC-INFO.
           05  RULST-POL-ID              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RULST-POL-TYP             PIC X(02).                             
           05  FILLER                    PIC X(01).                             
           05  RULST-POL-STAT            PIC X(01).                             
           05  FILLER                    PIC X(01).                             
           05  RULST-ISS-DT              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RULST-UNDO-DT             PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RULST-REDO-DT             PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RULST-REDO-ANNV-IND       PIC X(01).                             
      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCMBA'.

       COPY SQLCA.

       01  WS-PROGRAM-WORK-AREA.
           05  WS-ERROR-SW               PIC X(1).
               88  WS-NO-ERRORS                      VALUE 'N'.
               88  WS-ERRORS-FOUND                   VALUE 'Y'.

       COPY XCWWWKDT.
       01  SUBS-AND-THINGS.
           05  I                         PIC S9(8) COMP.

       01  WORK-AREAS.
           05  WS-PREV-POL-ID            PIC X(10).                             

       01  WS-OUTPUT-LINE.         
           05  WS-OUTPUT-POL-ID                 PIC X(10).
           05  FILLER                           PIC X(01).
           05  WS-OUTPUT-MESSAGE                PIC X(40).
           05  FILLER                           PIC X(81).

       01  WULST-SEQ-IO-WORK-AREA.
           05  WULST-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'ULST'.
           05  WULST-SEQ-IO-COMMAND             PIC X(02).
           05  WULST-SEQ-FILE-STATUS            PIC X(02).
           05  WULST-SEQ-IO-STATUS              PIC 9(01).
               88  WULST-SEQ-IO-OK              VALUE 0.
               88  WULST-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WULST-SEQ-IO-EOF             VALUE 8.
               88  WULST-SEQ-IO-ERROR           VALUE 9.

       COPY CCSW9600.
       COPY CCSR9600.

       COPY CCFWMAST.
       COPY CCFRMAST.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWL0010.
       COPY XCWL0040.
       COPY XCWL1660.
       COPY XCWL1670.
       COPY XCWL1680.
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
              UNTIL WULST-SEQ-IO-EOF                                            
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

           MOVE ZERO                   TO WULST-SEQ-IO-STATUS.

           OPEN INPUT ULST-DATA-FILE.                                           

           IF WULST-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           PERFORM  9600-3000-OPEN-OUTPUT
               THRU 9600-3000-OPEN-OUTPUT-X.

       0100-OPEN-FILES-X.
           EXIT.

      *--------------------
       1000-INITIALIZATION.
      *--------------------

           MOVE 'N' TO WS-ERROR-SW.

           MOVE 'CP'                 TO WGLOB-COMPANY-CODE.                     
 
           MOVE 'ZSBMCMBA'           TO WGLOB-MAIN-PGM-ID                       
                                        WGLOB-CRNT-PGM-ID.

      
           MOVE WGLOB-COMPANY-CODE   TO WMAST-CO-ID.
           PERFORM  MAST-1000-READ
               THRU MAST-1000-READ-X.
      
           IF  WMAST-IO-OK
               MOVE RMAST-APPL-CTL-PRCES-DT TO WGLOB-PROCESS-DATE
           ELSE
               MOVE SPACES                       TO WS-OUTPUT-LINE
               MOVE '* MASTER CONTROL RECORD NOT FOUND *'
                                                 TO WS-OUTPUT-MESSAGE
               MOVE WS-OUTPUT-LINE               TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
           END-IF.

       1000-INITIALIZATION-X.
           EXIT.
      /
      *----------------------                                                   
       2000-PROCESS-IN-RECS.                                                    
      *----------------------                                                   

           PERFORM  9500-ULST-READ                                              
               THRU 9500-ULST-READ-X.                                           
           IF NOT WULST-SEQ-IO-OK                                               
               MOVE 'Y' TO WS-ERROR-SW
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.
      
           MOVE LOW-VALUES               TO R9600-SEQ-REC-INFO.
           MOVE 'CP'                     TO R9600-CO-ID.
           MOVE 'FLEXI'                  TO R9600-DOC-ID.
           MOVE 'J'                      TO R9600-LANG-CD.
           MOVE RULST-POL-ID             TO R9600-POL-ID.
           MOVE SPACES                   TO R9600-CLI-ID.
           MOVE SPACES                   TO R9600-CVG-NUM.
           MOVE 'P001304'                TO R9600-USER-ID.
           MOVE SPACES                   TO R9600-TRIGGERED-BY-CD.
           MOVE WGLOB-PROCESS-DATE       TO R9600-TRNXT-EFF-DT.
           MOVE '000'                    TO R9600-TRNXT-SEQ-NUM.
      
           PERFORM  9600-1000-WRITE
               THRU 9600-1000-WRITE-X.
       
       2000-PROCESS-IN-RECS-X.                                                  
           EXIT.


      *----------------
      *9400-CMBA-WRITE.
      *----------------
      *
01PT02*8600-WRITE-9600-REC.
      *
      *    MOVE LOW-VALUES               TO R9600-SEQ-REC-INFO.
      *
      *    MOVE 'CP'                     TO R9600-CO-ID.
      *    MOVE 'FLEXI'                  TO R9600-DOC-ID.
      *    MOVE 'J'                      TO R9600-LANG-CD.
      *    MOVE RULST-POLICY-ID          TO R9600-POL-ID.
      *    MOVE SPACES                   TO R9600-CLI-ID.
      *    MOVE SPACES                   TO R9600-CVG-NUM.
      *    MOVE 'P001304'                TO R9600-USER-ID.
      *    MOVE '000'                    TO R9600-TRNXT-SEQ-NUM.
      *    MOVE WGLOB-SYSTEM-DATE-INT    TO R9600-TRNXT-EFF-DT
      
      ******************************************************************
      *    MOVE R0880-TRNXT-RPT-CD       TO R9600-TRNXT-RPT-CD.
      *    MOVE R0880-TRNXT-TRXN-EFF-DT  TO R9600-TRNXT-EFF-DT.
      *    MOVE R0880-TRNXT-TRXN-AMT     TO R9600-TRNXT-TRXN-AMT.               
      *
      *
      ** 16JUL2002 AT     ADD A DATE FIELD SO THAT WE CAN GET THE    **
      **                  PRTX DATE (THE REQUEST DATE) ON TO THE     **
      **                  INTERIM FLEX REPORT INSTEAD OF THE SYSTEM  **
      **                  DATE                                       **
      **       10  R9600-TRNXT-EFF-DT          PIC X(10).
      *
      *
      ** INTERIM AND ANNUAL FLEX REPORTS NEED TO CONTROL THE EFFECTIVE     
      ** DATE SUCH THAT FUND BALANCES ARE CALCULATED AS AT THE      
      ** CORRECT DATE      
      *
      **02AD12     IF R0880-DOCUMENT-NAME = 'FLEXA'
      *    IF R0880-DOCUMENT-NAME = 'FLEXI' 
      **02AD12        MOVE R0880-TRNXT-TRXN-EFF-DT TO R9600-TRNXT-EFF-DT
      **02AD12     ELSE
      *       MOVE WGLOB-SYSTEM-DATE-INT        TO R9600-TRNXT-EFF-DT
      *    END-IF.
      *
      *
      *    MOVE WGLOB-SYSTEM-DATE-INT  TO RPOL-POL-REPRT-DT.
      *    PERFORM  1640-2000-INTERNAL-TO-EXT
      *        THRU 1640-2000-INTERNAL-TO-EXT-X.
      *    MOVE L1640-EXTERNAL-DATE     TO R9600-TRNXT-EFF-DT.
      ******************************************************************

      *    PERFORM  9600-1000-WRITE
      *        THRU 9600-1000-WRITE-X.
      *
      *
      *9400-CMBA-WRITE-X.
      *    EXIT.

      *---------------
       9500-ULST-READ.
      *---------------

           MOVE ZERO                   TO WULST-SEQ-IO-STATUS.

           READ ULST-DATA-FILE
                AT END
                  MOVE 8               TO WULST-SEQ-IO-STATUS
                  GO TO 9500-ULST-READ-X.

           IF RULST-SEQ-REC-INFO EQUAL HIGH-VALUES
              MOVE 8                   TO WULST-SEQ-IO-STATUS
           END-IF.

           IF WULST-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

       9500-ULST-READ-X.
           EXIT.

      *-----------------------
       9700-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WULST-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WULST-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WULST-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                   TO WULST-SEQ-IO-STATUS.

           CLOSE ULST-DATA-FILE.

           IF WULST-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           PERFORM 9600-4000-CLOSE
              THRU 9600-4000-CLOSE-X.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.

      *******  I/O ROUTINES

      /
       COPY CCPA9600.
       COPY CCPL9600.
       COPY CCPO9600.
      /
       COPY XCPOOCF.
      /
       COPY CCPNMAST.

      ******   LINKAGE ROUTINES

       COPY CCPL0010.
       COPY CCPS0010.

       COPY XCPL0030.
       COPY XCPL0040.
       COPY XCPL0260.
       COPY XCPL1660.
       COPY XCPL1680.
       COPY XCPLOCF.

      *****************************************************************
      **                 END OF PROGRAM ZSBMCMBA                     **         
      *****************************************************************
