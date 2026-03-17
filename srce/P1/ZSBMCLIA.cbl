      *****************************************************************
      **  MEMBER :  ZSBMCLIA                                         **
      **  REMARKS:  THIS PROGRAM WILL UPDATE THE CLI-ADDR-LOC-CD     **
      **            BY NEW-ADDR-CD FROM TADCD TABLE                  **         
      **                                                             **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
P2753 **  11MAY05  RZ     CLIENT ADDRESS CODE RESET.                 **
      *****************************************************************

       IDENTIFICATION DIVISION.

       PROGRAM-ID.    ZSBMCLIA.

       COPY XCWWCRHT.
      /
       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
      /
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCLIA'.

       COPY SQLCA.

       01  WS-MISC-AREAS.
           05  WS-CLIA-ERROR-IND             PIC X(01).
               88  WS-CLIA-ERROR-NO              VALUE 'N'.
               88  WS-CLIA-ERROR                 VALUE 'Y'.
      
           05  WS-ADCD-RECS-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'TOTAL CLIA RECORDS PROCESSED        '.
               10  WS-CLIA-REC-PRCES-CTR    PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
      
       01  WS-CONTROL-CARD.
           05  WS-CTL-EDIT-ONLY             PIC X(10).
               88  WS-CTL-EDIT-TEXT         VALUE 'EDIT ONLY='.
           05  WS-CTL-EDIT-SW               PIC X(01).
               88 EDIT-ONLY                 VALUE 'Y'. 
               88 EDIT-ONLY-NO              VALUE 'N'.
                
       01  WS-CLIA-PRINT-LINE.                                                  
           05  FILLER                       PIC X(08) 
                                            VALUE 'CLIENT: '.
           05  WS-CLI-ID                    PIC X(10).
           05  FILLER                       PIC X(10)
                                            VALUE ' CLI SEQ: '.
           05  WS-CLI-SEQ-NUM               PIC X(02).
            
           05  FILLER                       PIC X(15)
                                            VALUE ' ORIG ADDR CD: '.
           05  WS-CLI-ORIG-ADDR-CD          PIC X(08).

           05  FILLER                       PIC X(18)
                                            VALUE ' ADDR STATUS:'.
           05  WS-CLAS-STAT-CD              PIC X(01).

           05  FILLER                       PIC X(15)
                                            VALUE ' NEW ADDR CD : '.
           05  WS-CLI-NEW-ADDR-CD           PIC X(08).
      
       01  WS-MISC-WORK-AREA.
      
           05  WS-CLIA                       PIC 9(02) VALUE ZERO.              
      
           05  WS-OLD-ADDR-LOC-CD            PIC X(08).
           05  WS-OLD-CLAS-STAT-CD           PIC X(01).
           05  WS-NEW-ADDR-LOC-CD            PIC X(08).

           05  WS-ADDR-LOC-CD.
               10  WS-ADDR-LOC-PREFCT-CD     PIC X(02).
               10  WS-ADDR-LOC-CITY-CD       PIC X(03).
               10  WS-ADDR-LOC-NGHBRHD-CD    PIC X(03).

      /
       COPY CCWL0010.
       COPY CCWL0950.
       COPY XCWL0035.
        
      /
       COPY CCFWADCD.
       COPY CCFRADCD.
      /
       COPY CCFRCLIA.                                                           
       COPY CCFWCLIA.                                                           
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWBCF.
       COPY XCSRBCF.
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY XCWTFCMD.
      /
       COPY XCWL0040.
      /
       COPY XCWL1670.
       COPY XCWL1660.
       COPY XCWL1680.
       COPY XCWLDTLK.
      /
       COPY XCWWWKDT.
      /
       COPY CCWWCCC.
       COPY CCWWFRMT.
      /
       COPY CCWLPGA.
      /
       COPY CCWWINDX.
      /
       PROCEDURE DIVISION.

      *---------------------
       0000-MAIN-LINE-START.
      *---------------------

           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.
           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE 'ZSBMCLIA'         TO WGLOB-USER-ID.
           MOVE 'INGENIUM'         TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME TO L0040-COMPANY-NAME.
           MOVE ZERO               TO L0040-ERROR-CNT.
           MOVE SPACES             TO L0040-PROGRAM-DESC.
           MOVE SPACES             TO L0040-HDG-LINE-3.
            
           PERFORM BCF-1000-READ
              THRU BCF-1000-READ-X.

           IF  WBCF-SEQ-IO-OK
               MOVE RBCF-SEQ-REC-INFO    TO WS-CONTROL-CARD
           END-IF.
            
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           PERFORM  1000-PROCESS-CLIA
               THRU 1000-PROCESS-CLIA-X.

           PERFORM  8000-PRINT-STATS
               THRU 8000-PRINT-STATS-X.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

           STOP RUN.

       0000-MAIN-LINE-START-X.
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
      *------------------
       1000-PROCESS-CLIA.
      *------------------
           
           MOVE LOW-VALUES     TO WCLIA-KEY.
           MOVE HIGH-VALUES    TO WCLIA-ENDBR-KEY.
           
           PERFORM  CLIA-1000-TBL-BROWSE
               THRU CLIA-1000-TBL-BROWSE-X.
           
           PERFORM  2000-READ-REWRITE-LOOP
               THRU 2000-READ-REWRITE-LOOP-X
              UNTIL WCLIA-IO-EOF
                 OR NOT WCLIA-IO-OK.

           PERFORM  CLIA-3000-TBL-END-BROWSE
               THRU CLIA-3000-TBL-END-BROWSE-X.
           
       1000-PROCESS-CLIA-X.
           EXIT.
      /
      *---------------------
       2000-READ-REWRITE-LOOP.
      *---------------------

           PERFORM  CLIA-2000-TBL-READ-NEXT
               THRU CLIA-2000-TBL-READ-NEXT-X.
           
           IF  NOT WCLIA-IO-OK
               DISPLAY '*** END OF CLIA - JOB COMPLETED NORMALLY***'
               GO TO 2000-READ-REWRITE-LOOP-X
           END-IF.
           
           IF  WCLIA-IO-EOF
               GO TO 2000-READ-REWRITE-LOOP-X
           END-IF.

           IF RCLIA-CLI-ADDR-LOC-CD = SPACES
               GO TO 2000-READ-REWRITE-LOOP-X
           END-IF.
            
           ADD 1                         TO WS-CLIA-REC-PRCES-CTR.
           SET WS-CLIA-ERROR-NO          TO TRUE.
            
           MOVE RCLIA-CLI-ADDR-LOC-CD    TO WADCD-ADDR-LOC-CD.
            
           PERFORM  ADCD-1000-READ                                 
               THRU ADCD-1000-READ-X.                              
 
           IF NOT WADCD-IO-OK
               GO TO 2000-READ-REWRITE-LOOP-X
           END-IF.
            
           IF RADCD-CLAS-STAT-ACTIVE  OR RADCD-CLAS-STAT-CD = SPACES
               GO TO 2000-READ-REWRITE-LOOP-X
           END-IF.
            
      *    NOT INCLUDE (ABOLISH DATE = SPACES) FOR ZAP
            
           IF RADCD-NEW-ADDR-CD = SPACES
               GO TO 2000-READ-REWRITE-LOOP-X
P02753     ELSE
P02753         MOVE RCLIA-CLI-ADDR-LOC-CD TO WS-CLI-ORIG-ADDR-CD
P02753         MOVE RADCD-NEW-ADDR-CD     TO WADCD-ADDR-LOC-CD
P02753         MOVE RADCD-NEW-ADDR-CD     TO WS-NEW-ADDR-LOC-CD
P02753         MOVE RADCD-CLAS-STAT-CD    TO WS-OLD-CLAS-STAT-CD
P02753     END-IF.
            
P02753     PERFORM  ADCD-1000-READ                                 
P02753         THRU ADCD-1000-READ-X.                              
 
P02753     IF NOT WADCD-IO-OK
P02753         GO TO 2000-READ-REWRITE-LOOP-X
P02753     END-IF.
            
P02753     IF NOT RADCD-CLAS-STAT-ACTIVE 
P02753         GO TO 2000-READ-REWRITE-LOOP-X
P02753     END-IF.
            
           PERFORM  3000-REWRITE-ADDR-CD
               THRU 3000-REWRITE-ADDR-CD-X
 
           PERFORM 0035-1000-COMMIT 
              THRU 0035-1000-COMMIT-X.  
               
       
       2000-READ-REWRITE-LOOP-X.
           EXIT.
      /
      *----------------------
       3000-REWRITE-ADDR-CD.
      *----------------------

           PERFORM  CLIA-1000-READ-FOR-UPDATE                                   
               THRU CLIA-1000-READ-FOR-UPDATE-X.                                

           MOVE RADCD-ADDR-LOC-CD    TO RCLIA-CLI-ADDR-LOC-CD.           
           MOVE RADCD-PSTL-CD        TO RCLIA-CLI-PSTL-CD.  
           MOVE RADCD-KA-PREFCT-TXT  TO RCLIA-CLI-KA-PREFCT-TXT.
           MOVE RADCD-KA-CITY-TXT    TO RCLIA-CLI-KA-CITY-TXT.
           MOVE RADCD-KA-NGHBRHD-TXT TO RCLIA-CLI-KA-NGHBRHD-TXT.

P02753*    20/DEC/2005 ADD KJ ADDRESS TEXT UPDATE
P02753     MOVE RADCD-KJ-PREFCT-TXT  TO RCLIA-CLI-PREFCT-TXT.
P02753     MOVE RADCD-KJ-CITY-TXT    TO RCLIA-CLI-CITY-NM-TXT.
P02753     MOVE RADCD-KJ-NGHBRHD-TXT TO RCLIA-CLI-ADDR-LN-1-TXT.

           MOVE RADCD-ADDR-LOC-CD      TO WS-ADDR-LOC-CD.           
           MOVE WS-ADDR-LOC-PREFCT-CD  TO RCLIA-CLI-CRNT-LOC-CD.          

           PERFORM  CLIA-2000-REWRITE
               THRU CLIA-2000-REWRITE-X.

           PERFORM  7000-PRINT-DETAILS
               THRU 7000-PRINT-DETAILS-X.

       3000-REWRITE-ADDR-CD-X.
           EXIT.
      /
      *--------------------
       7000-PRINT-DETAILS.
      *--------------------

           MOVE RCLIA-CLI-ID            TO WS-CLI-ID.
           MOVE RCLIA-CLI-ADDR-SEQ-NUM  TO WS-CLI-SEQ-NUM.
P02743     MOVE WS-OLD-CLAS-STAT-CD     TO WS-CLAS-STAT-CD.
P02743     MOVE WS-NEW-ADDR-LOC-CD      TO WS-CLI-NEW-ADDR-CD.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-CLIA-PRINT-LINE      TO L0040-INPUT-LINE.

           PERFORM 0040-3000-WRITE-OTHER
              THRU 0040-3000-WRITE-OTHER-X.

       7000-PRINT-DETAILS-X.
           EXIT.

      /
       8000-PRINT-STATS.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-ADCD-RECS-LINE       TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           
           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE '*** END OF REPORT ***' TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.


       8000-PRINT-STATS-X.
           EXIT.
      /
       9999-CLOSE-FILES.

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
       COPY CCPL0010.
       COPY CCPS0010.
       COPY CCPL0950.
       COPY CCPS0950.
       COPY CCPPCCC.
      /
      *COPY CCPTADCD.
       COPY CCPNADCD.
      /
       COPY CCPUCLIA.
       COPY CCPNCLIA.
       COPY CCPTCLIA.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
       COPY XCPL0035.
       COPY XCPL0040.
       COPY XCPL0260.
      /
       COPY XCPL1660.
       COPY XCPL1680.
      /
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM ZSBMCLIA                     **
      *****************************************************************
