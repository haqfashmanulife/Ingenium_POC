      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBM989B.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSBM989B                                          **
      **  REMARKS: THIS PROGRAM WILL UPDATE THE NEW RECEIPT TYPE CODE**
      **           FIELD IN TBAC FOR ALL THE POLICIES ALREADY THERE  **
      **           IN TBAC TABLE                                     **
      **                                                             **
      **  DOMAIN : AG                                                **
      **  CLASS  : PD                                                **
      *****************************************************************
      **  DATE      AUTH.  DESCRIPTION                               **
      **                                                             **
MGARVA**  09NOV10   CTS    CREATION OF MODULE                        **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM989B'.

       COPY SQLCA.
      /
       COPY XCWL0035.

       COPY XCWWHDG.
      /
       01  WS-PROGRAM-WORK-AREA.
           05  WS-BAC-REC-PRCES-CTR         PIC 9(10)  VALUE ZERO.
           05  WS-COMMIT-CTR                PIC 9(10)  VALUE ZERO.
           05  WS-POL-ID                    PIC X(10).
           05  WS-MSGS-TXT                  PIC X(80).
               88  WS-MSGS-ZS989B0001       VALUE
               'MGAR VIRTUAL ACCOUNT'.
               88  WS-MSGS-ZS989B0002       VALUE
               'TOTAL NO. OF TBAC RECORD UPDATED:'. 
               88  WS-MSGS-ZS989B0003       VALUE
               'COMMITTED POLICY NO '.
       01  WS-COMMIT-FREQ                   PIC 9(02)  VALUE 20. 
       01  CONTROL-RECORD.
           05 CONTROL-CARD-ID               PIC X(06).
           05 FILLER                        PIC X(01).
           05 START-POLICY                  PIC X(07).
           05 FILLER                        PIC X(04).
           05 END-POLICY                    PIC X(07).
               

               
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
       COPY CCSRTEMP.
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
       COPY CCFWBAC.
       COPY CCFRBAC.
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
       COPY XCWL1580.
       COPY XCWL1610.
       COPY XCWL1680.
       COPY XCWL1640.
      /
       COPY NCWWPARM.
      /      
      ********************
       PROCEDURE DIVISION.
      ********************

      *---------------
       0000-MAIN-LINE.
      *---------------

           PERFORM  1000-OPEN-FILES
               THRU 1000-OPEN-FILES-X.

           PERFORM  2000-INITIALIZE
               THRU 2000-INITIALIZE-X.

           PERFORM  3000-PROCESS-REQUEST
               THRU 3000-PROCESS-REQUEST-X.

           PERFORM  4000-PRINT-GRAND-TOTALS
               THRU 4000-PRINT-GRAND-TOTALS-X

           PERFORM  6000-CLOSE-FILES
               THRU 6000-CLOSE-FILES-X.

           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAIN-LINE-X.
           EXIT.

      /
      *----------------
       1000-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.
               
           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.

       1000-OPEN-FILES-X.
           EXIT.
 
      /
      *----------------
       2000-INITIALIZE.
      *----------------
           MOVE 'CP'                        TO WGLOB-COMPANY-CODE.

           MOVE 'ZSBM989B'                  TO WGLOB-MAIN-PGM-ID
                                               WGLOB-CRNT-PGM-ID.

           PERFORM  0010-1000-INIT-DEFAULT
               THRU 0010-1000-INIT-DEFAULT-X.

           PERFORM  BCF-1000-READ
               THRU BCF-1000-READ-X.

           IF  WBCF-SEQ-IO-OK
               MOVE RBCF-SEQ-REC-INFO       TO CONTROL-RECORD
           ELSE
      *MSG: CONTROL CARD FILE EMPTY, NO PROCESSING DONE
               MOVE 'XS00000151'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-INITIALIZE-X 
           END-IF.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           PERFORM  2100-INIT-OCF-TITLES
               THRU 2100-INIT-OCF-TITLES-X.
               
       2000-INITIALIZE-X.
           EXIT.
      /
      *---------------------
       2100-INIT-OCF-TITLES.
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
           
      *
      * GET THE PROGRAM DESCRIPTION
      *
           SET  WS-MSGS-ZS989B0001          TO TRUE.
           MOVE WS-MSGS-TXT                 TO L0040-PROGRAM-DESC.
           MOVE ZERO                        TO L0040-ERROR-CNT.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

       2100-INIT-OCF-TITLES-X.
           EXIT.
      /
      *---------------------
       3000-PROCESS-REQUEST.
      *---------------------
           
           INITIALIZE WS-PROGRAM-WORK-AREA.
           
           MOVE LOW-VALUES                  TO WBAC-KEY.
           MOVE WWKDT-LOW-DT                TO WBAC-APPL-CTL-PRCES-DT.
           MOVE HIGH-VALUES                 TO WBAC-ENDBR-KEY.
           MOVE WWKDT-HIGH-DT               TO 
                                        WBAC-ENDBR-APPL-CTL-PRCES-DT. 

           IF  START-POLICY NOT = SPACES
               MOVE START-POLICY         TO WBAC-POL-ID
           END-IF.

           PERFORM  BAC-1000-TBL-BROWSE
               THRU BAC-1000-TBL-BROWSE-X.

           PERFORM  BAC-2000-TBL-READ-NEXT
               THRU BAC-2000-TBL-READ-NEXT-X.
               
           IF  RBAC-RECPT-TYP-A-RECPT
           OR  RBAC-RECPT-TYP-B-RECPT
               
               PERFORM  BAC-2000-TBL-READ-NEXT
                   THRU BAC-2000-TBL-READ-NEXT
                   UNTIL RBAC-RECPT-TYP-CD = SPACES
                   
           END-IF.
           
           PERFORM  3100-PROCESS-BAC-REC
               THRU 3100-PROCESS-BAC-REC-X
               UNTIL NOT WBAC-IO-OK.

           PERFORM  BAC-3000-TBL-END-BROWSE
               THRU BAC-3000-TBL-END-BROWSE-X.
           
       3000-PROCESS-REQUEST-X.
           EXIT.

      /
      *-----------------------
       3100-PROCESS-BAC-REC.
      *-----------------------

           IF (RBAC-FND-SRC-A-RECPT
           OR  RBAC-FND-SRC-B0-RECPT
           OR  RBAC-FND-SRC-B5-RECPT
           OR  RBAC-FND-SRC-B9-RECPT
           OR  RBAC-FND-SRC-TRAD-PREM
           OR  RBAC-FND-SRC-SHRT-PREM)
               PERFORM  BAC-1000-READ-FOR-UPDATE
                   THRU BAC-1000-READ-FOR-UPDATE-X
           ELSE 
               PERFORM  BAC-2000-TBL-READ-NEXT
                   THRU BAC-2000-TBL-READ-NEXT-X 
               GO TO  3100-PROCESS-BAC-REC-X
           END-IF.       
               
           IF  WBAC-IO-OK 
               CONTINUE
           ELSE
               PERFORM  BAC-3000-UNLOCK
                   THRU BAC-3000-UNLOCK-X
               PERFORM  BAC-2000-TBL-READ-NEXT
                   THRU BAC-2000-TBL-READ-NEXT-X    
               GO TO 3100-PROCESS-BAC-REC-X    
           END-IF.            
           
      *    UPDATE RECEIPT TYPE CODE BASED ON FUND SOURCE CODE VALUES.

           IF  RBAC-FND-SRC-A-RECPT
               SET RBAC-RECPT-TYP-A-RECPT   TO TRUE
           ELSE
              IF  (RBAC-FND-SRC-B0-RECPT
              OR   RBAC-FND-SRC-B5-RECPT
              OR   RBAC-FND-SRC-B9-RECPT
              OR   RBAC-FND-SRC-TRAD-PREM
              OR   RBAC-FND-SRC-SHRT-PREM)
                   SET RBAC-RECPT-TYP-B-RECPT 
                                            TO TRUE
              END-IF
           END-IF.  
           
           MOVE RBAC-PREV-UPDT-USER-ID      TO WGLOB-USER-ID.
           MOVE RBAC-PREV-UPDT-DT           TO WGLOB-SYSTEM-DATE-INT.

           PERFORM  BAC-2000-REWRITE
               THRU BAC-2000-REWRITE-X.
               
           IF  WBAC-IO-OK 
               ADD 1                        TO WS-BAC-REC-PRCES-CTR
               ADD 1                        TO WS-COMMIT-CTR
           END-IF.
           
           IF WS-COMMIT-CTR = WS-COMMIT-FREQ
              MOVE  RBAC-POL-ID             TO WS-POL-ID
              MOVE  ZERO                    TO WS-COMMIT-CTR
              
              PERFORM  0035-1000-COMMIT
                  THRU 0035-1000-COMMIT-X
                  
      *MSG:UPDATED POLICY NO @1
              MOVE SPACES                   TO L0040-INPUT-LINE
              SET  WS-MSGS-ZS989B0003       TO TRUE
              STRING WS-MSGS-TXT  DELIMITED BY '  '
                     ' '          DELIMITED BY SIZE
                  WS-POL-ID                 INTO L0040-INPUT-LINE
              PERFORM  0040-3000-WRITE-OTHER
                  THRU 0040-3000-WRITE-OTHER-X
                 
           END-IF.
           
           PERFORM  BAC-2000-TBL-READ-NEXT
               THRU BAC-2000-TBL-READ-NEXT-X.
           
       3100-PROCESS-BAC-REC-X.
           EXIT.
           
      *-----------------------
       4000-PRINT-GRAND-TOTALS.
      *-----------------------
               
      * TOTAL NO OF TBAC RECORDS UPDATED: @1
          
           MOVE SPACES                     TO L0040-INPUT-LINE.
           SET  WS-MSGS-ZS989B0002         TO TRUE.
           STRING WS-MSGS-TXT  DELIMITED BY '  '
                  ' '          DELIMITED BY SIZE
                  WS-BAC-REC-PRCES-CTR     INTO L0040-INPUT-LINE.          
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
             
       4000-PRINT-GRAND-TOTALS-X.
           EXIT.
      /
      *------------------
       6000-CLOSE-FILES.
      *------------------

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.
               
           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

       6000-CLOSE-FILES-X.
           EXIT.
           
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
      *  LINKAGE COPYBOOKS                                            *
      *****************************************************************
       COPY XCPL1580.
      /
       COPY XCPL1610.
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
       COPY CCPVBAC.
       COPY CCPTBAC.
       COPY CCPNBAC.
       COPY CCPUBAC.
       COPY CCPABAC.       
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM ZSBM989B                     **
      *****************************************************************

