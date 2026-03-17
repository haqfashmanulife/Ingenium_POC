      *****************************************************************
      **  MEMBER :  ZSBMRENC                                         **
      **  REMARKS:  THIS PROGRAM WILL UPDATE THREE NEW FIELDS ADDED  **
      **            TO THE CVG TABLE AS PART OF MANUMED SP6I         **
      **                                                             **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
PR006I**  26JUN02  AT     MANUMED CONVERSION                         **
MM0166**  26JUN02  BMB    MOVE IN DEFAULT DURATION                   **
PR006I**  26JUN02  BMB    CVG COUNTER SHOULD BE 3 BYTES FOR 99 CVGS  **
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
MP0010**  30JUN05  BP     BYPASS COVERAGES THAT ALREADY CONTAIN      **
MP0010**                  DATA IN THE RENEWAL FIELDS                 **
      *****************************************************************

       IDENTIFICATION DIVISION.

       PROGRAM-ID.    ZSBMRENC.

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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMRENC'.

       COPY SQLCA.

       01  WS-MISC-AREAS.
           05  WS-POL-ERROR-IND             PIC X(01).
               88  WS-POL-ERROR-NO              VALUE 'N'.
               88  WS-POL-ERROR                 VALUE 'Y'.
           05  WS-POLICIES-RECS-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'TOTAL POLICIES PROCESSED                '.
               10  WS-POLICIES-PRCES-CTR    PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
           05 WS-42000-CNT                  PIC 9(7)  VALUE ZERO.
           05 WS-41900-CNT                  PIC 9(7)  VALUE ZERO.
           05 WS-43000-CNT                  PIC 9(7)  VALUE ZERO.
           05 WS-42400-CNT                  PIC 9(7)  VALUE ZERO.
           05 WS-42200-CNT                  PIC 9(7)  VALUE ZERO.
           05 WS-42300-CNT                  PIC 9(7)  VALUE ZERO.
           05 WS-43100-CNT                  PIC 9(7)  VALUE ZERO.
           05 WS-42600-CNT                  PIC 9(7)  VALUE ZERO.
           05 WS-42500-CNT                  PIC 9(7)  VALUE ZERO.
      
       01  WS-CONTROL-CARD.
           05  WS-CTL-EDIT-ONLY             PIC X(10).
               88  WS-CTL-EDIT-TEXT         VALUE 'EDIT ONLY='.
           05  WS-CTL-EDIT-SW               PIC X(01).
               88 EDIT-ONLY                 VALUE 'Y'. 
               88 EDIT-ONLY-NO              VALUE 'N'.
                
       01  WS-TYPE-OF-RUN-LINE.
           05  FILLER                       PIC X(10)
                                            VALUE 'RUN TYPE: '.
           05  WS-TYPE-OF-RUN-TXT           PIC X(11).
            
       01  WS-STAT-LINE.
           05  FILLER                       PIC X(10)
                                            VALUE 'PLAN ID: '.
           05  WS-STAT-PLAN-ID              PIC X(6).
           05  F                            PIC X(1).
           05  WS-STAT-LINE-CNT             PIC ZZZZZZ9.

       01  WS-CVG-PRINT-LINE.
           05  FILLER                       PIC X(08) 
                                            VALUE 'POLICY: '.
           05  WS-CVGP-POL-ID               PIC X(10).
           05  FILLER                       PIC X(10)
                                            VALUE ' CVG NUM: '.
           05  WS-CVGP-CVG-NUM              PIC X(02).
           05  FILLER                       PIC X(10)
                                            VALUE ' PLAN ID: '.
           05  WS-CVGP-PLAN-ID              PIC X(06).
           05  FILLER                       PIC X(10) 
                                            VALUE ' OV PLAN: '.
           05  WS-CVGP-OV-PLAN-ID           PIC X(06).
           05  FILLER                       PIC X(11)
                                            VALUE ' OV STBL1: '.
           05  WS-CVGP-OV-STBL-1-CD         PIC X(2).
           05  FILLER                       PIC X(11)
                                            VALUE ' OV STBL2: '.
           05  WS-CVGP-OV-STBL-2-CD         PIC X(3).
      
       01  WS-MISC-WORK-AREA.
PR006I*    05  WS-CVG                       PIC 9(02) VALUE ZERO.
PR006I     05  WS-CVG                       PIC 9(03) VALUE ZERO.
           05  WS-CVG-STBL-1-CD             PIC X(02).
           05  WS-CVG-STBL-1-CD-N           REDEFINES 
               WS-CVG-STBL-1-CD             PIC 9(02).
            
      /
       COPY CCWL0010.
       COPY CCWL0950.
       COPY XCWL0035.
        
      /
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFRCVG.
       COPY CCFWCVG.
       COPY CCWWCVGS.
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
      /
       COPY XCWLDTLK.
      /
       COPY XCWWWKDT.
      /
       COPY CCWWCCC.
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

           MOVE 'ZSBMRENC'         TO WGLOB-USER-ID.
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
                
           MOVE WS-CONTROL-CARD     TO WS-TYPE-OF-RUN-TXT.
           MOVE WS-TYPE-OF-RUN-LINE TO L0040-INPUT-LINE.
                
           PERFORM 0040-3000-WRITE-OTHER
              THRU 0040-3000-WRITE-OTHER-X.

           PERFORM  1000-PROCESS-POLS
               THRU 1000-PROCESS-POLS-X.

           PERFORM  8000-PRINT-STATS
               THRU 8000-PRINT-STATS-X.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

P02229     PERFORM  0035-1000-COMMIT
P02229         THRU 0035-1000-COMMIT-X.

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
       1000-PROCESS-POLS.
      *------------------
           
           MOVE LOW-VALUES        TO WPOL-KEY.
           MOVE HIGH-VALUES       TO WPOL-ENDBR-KEY.
           PERFORM  POL-1000-TBL-BROWSE
               THRU POL-1000-TBL-BROWSE-X.
           
           PERFORM  2000-READ-REWRITE-LOOP
               THRU 2000-READ-REWRITE-LOOP-X
              UNTIL WPOL-IO-EOF
                 OR NOT WPOL-IO-OK.

       1000-PROCESS-POLS-X.
           EXIT.
      /
      *---------------------
       2000-READ-REWRITE-LOOP.
      *---------------------

           PERFORM  POL-2000-TBL-READ-NEXT
               THRU POL-2000-TBL-READ-NEXT-X.
           
           IF  NOT WPOL-IO-OK
               DISPLAY '*** END OF POLICIES - JOB COMPLETED NORMALLY***'
               GO TO 2000-READ-REWRITE-LOOP-X
           END-IF.
           
           IF  WPOL-IO-EOF           
               GO TO 2000-READ-REWRITE-LOOP-X
           END-IF.

           ADD 1                        TO WS-POLICIES-PRCES-CTR.
           SET WS-POL-ERROR-NO          TO TRUE.
            
           PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
               THRU CVGS-1000-LOAD-CVGS-ARRAY-X.
 
           PERFORM  3000-REWRITE-COVERAGE
               THRU 3000-REWRITE-COVERAGE-X
               VARYING WS-CVG FROM 1 BY 1
               UNTIL WS-CVG > RPOL-POL-CVG-REC-CTR-N.
 
           PERFORM 0035-1000-COMMIT 
              THRU 0035-1000-COMMIT-X.
               
       
       2000-READ-REWRITE-LOOP-X.
           EXIT.
      /
      *----------------------
       3000-REWRITE-COVERAGE.
      *----------------------

      *
      * BYPASS SUBSTANDARD COVERAGES
      *
           IF WCVGS-CVG-ME-FCT      (WS-CVG) > +1
           OR WCVGS-CVG-FE-PREM-AMT (WS-CVG) > ZERO
              GO TO 3000-REWRITE-COVERAGE-X
           END-IF.
MP0010*
MP0010* BYPASS COVERAGES THAT ALREADY CONTAIN RENEWAL DATA
MP0010*
MP0010     IF  WCVGS-CVG-RENW-PLAN-ID (WS-CVG) = SPACES
MP0010     AND WCVGS-CVG-RENW-STBL-1-CD (WS-CVG) = SPACES
MP0010     AND WCVGS-CVG-RENW-STBL-2-CD (WS-CVG) = SPACES
MP0010        CONTINUE                         
MP0010     ELSE                                      
MP0010        GO TO 3000-REWRITE-COVERAGE-X
MP0010     END-IF.
            
      *
      * DEFAULT OVERRIDE RENEWAL PLAN ID 
      *
           MOVE SPACES TO WCVGS-CVG-RENW-PLAN-ID (WS-CVG)
            
      *
      * DEFAULT OVERRIDE RENEWAL BENEFIT LIMIT TO SPACES
      *
           MOVE SPACES TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG) 
            
MM0166* DEFAULT OVERRIDE DURATION TO SPACES
MM0166*
MM0166     MOVE SPACES TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG) 
            
      *
      * OVERRIDE RENEWAL PLAN AND RENEWAL BENEFIT LIMIT
      *
           EVALUATE TRUE
            
           WHEN WCVGS-PLAN-ID (WS-CVG) = '42000'
            
                MOVE '43400' TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
                MOVE '2'     TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG)
MM0166          MOVE WCVGS-CVG-STBL-1-CD (WS-CVG)
MM0166                       TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                ADD 1 TO WS-42000-CNT
                 
           WHEN WCVGS-PLAN-ID (WS-CVG) = '41900'
                MOVE '43200' TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
                MOVE '2'     TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG)
MM0166          MOVE WCVGS-CVG-STBL-1-CD (WS-CVG)
MM0166                       TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                ADD 1 TO WS-41900-CNT
                 
           WHEN WCVGS-PLAN-ID (WS-CVG) = '43000'
                MOVE '45100' TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
MM0166          MOVE WCVGS-CVG-STBL-1-CD (WS-CVG)
MM0166                       TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                ADD 1 TO WS-43000-CNT
                 
           WHEN WCVGS-PLAN-ID (WS-CVG) = '42400'
                MOVE '44200' TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
                MOVE '2'     TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG)
MM0166          MOVE WCVGS-CVG-STBL-1-CD (WS-CVG)
MM0166                       TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                ADD 1 TO WS-42400-CNT
                 
           WHEN WCVGS-PLAN-ID (WS-CVG) = '42200'
                MOVE '43800' TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
MM0166          MOVE WCVGS-CVG-STBL-1-CD (WS-CVG)
MM0166                       TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                ADD 1 TO WS-42200-CNT
                 
           WHEN WCVGS-PLAN-ID (WS-CVG) = '42300'
                MOVE '44000' TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
MM0166          MOVE WCVGS-CVG-STBL-1-CD (WS-CVG)
MM0166                       TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                ADD 1 TO WS-42300-CNT
                 
           WHEN WCVGS-PLAN-ID (WS-CVG) = '43100'
                MOVE '45300' TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
MM0166          MOVE WCVGS-CVG-STBL-1-CD (WS-CVG)
MM0166                       TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                ADD 1 TO WS-43100-CNT
                 
           WHEN WCVGS-PLAN-ID (WS-CVG) = '42600'
                MOVE '45000' TO WCVGS-CVG-RENW-PLAN-ID   (WS-CVG)
MM0166          MOVE WCVGS-CVG-STBL-1-CD (WS-CVG)
MM0166                       TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                ADD 1 TO WS-42600-CNT
                 
           WHEN WCVGS-PLAN-ID (WS-CVG) = '42500'
                MOVE '2'     TO WCVGS-CVG-RENW-STBL-2-CD (WS-CVG)
MM0166          MOVE WCVGS-CVG-STBL-1-CD (WS-CVG)
MM0166                       TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG)
                ADD 1 TO WS-42500-CNT
                 
           END-EVALUATE.
            
      *
      * OVERRIDE RENEWAL DURATION
      *
MM0166*    MOVE SPACES TO WCVGS-CVG-RENW-STBL-1-CD (WS-CVG).
            
      *      
      * BUILD PRINT LINE     
      *      
           MOVE SPACES                   TO L0040-INPUT-LINE.
                
           MOVE RPOL-POL-ID                       TO WS-CVGP-POL-ID.          
           MOVE WCVGS-CVG-SEQ-NUM        (WS-CVG) TO WS-CVGP-CVG-NUM.
           MOVE WCVGS-PLAN-ID            (WS-CVG) TO WS-CVGP-PLAN-ID.         
           MOVE WCVGS-CVG-RENW-PLAN-ID   (WS-CVG) TO WS-CVGP-OV-PLAN-ID.
           MOVE WCVGS-CVG-RENW-STBL-1-CD (WS-CVG) 
           TO   WS-CVGP-OV-STBL-1-CD.  
           MOVE WCVGS-CVG-RENW-STBL-2-CD (WS-CVG) 
           TO   WS-CVGP-OV-STBL-2-CD.  
            
           MOVE WS-CVG-PRINT-LINE        TO L0040-INPUT-LINE.
                
           PERFORM 0040-3000-WRITE-OTHER
              THRU 0040-3000-WRITE-OTHER-X.
            
           MOVE WPOL-POL-ID TO WCVG-POL-ID.
           MOVE WS-CVG      TO WCVG-CVG-NUM-N.

           PERFORM  CVG-1000-READ-FOR-UPDATE
               THRU CVG-1000-READ-FOR-UPDATE-X.

           MOVE WCVGS-CVG-INFO (WS-CVG) TO RCVG-CVG-INFO.

           IF EDIT-ONLY-NO
              PERFORM CVG-2000-REWRITE
                 THRU CVG-2000-REWRITE-X
           ELSE
              PERFORM CVG-3000-UNLOCK
                 THRU CVG-3000-UNLOCK-X
           END-IF.

       3000-REWRITE-COVERAGE-X.
           EXIT.
      /
       8000-PRINT-STATS.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
            
           MOVE SPACES         TO L0040-INPUT-LINE.
           MOVE '42000'        TO WS-STAT-PLAN-ID
           MOVE WS-42000-CNT   TO WS-STAT-LINE-CNT.
           MOVE WS-STAT-LINE   TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
                
           MOVE SPACES         TO L0040-INPUT-LINE.
           MOVE '41900'        TO WS-STAT-PLAN-ID
           MOVE WS-41900-CNT   TO WS-STAT-LINE-CNT.
           MOVE WS-STAT-LINE   TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
                
           MOVE SPACES         TO L0040-INPUT-LINE.
           MOVE '43000'        TO WS-STAT-PLAN-ID
           MOVE WS-43000-CNT   TO WS-STAT-LINE-CNT.
           MOVE WS-STAT-LINE   TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
                
           MOVE SPACES         TO L0040-INPUT-LINE.
           MOVE '42400'        TO WS-STAT-PLAN-ID
           MOVE WS-42400-CNT   TO WS-STAT-LINE-CNT.
           MOVE WS-STAT-LINE   TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
                
           MOVE SPACES         TO L0040-INPUT-LINE.
           MOVE '42200'        TO WS-STAT-PLAN-ID
           MOVE WS-42200-CNT   TO WS-STAT-LINE-CNT.
           MOVE WS-STAT-LINE   TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
                
           MOVE SPACES         TO L0040-INPUT-LINE.
           MOVE '42300'        TO WS-STAT-PLAN-ID
           MOVE WS-42300-CNT   TO WS-STAT-LINE-CNT.
           MOVE WS-STAT-LINE   TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
                
           MOVE SPACES         TO L0040-INPUT-LINE.
           MOVE '43100'        TO WS-STAT-PLAN-ID
           MOVE WS-43100-CNT   TO WS-STAT-LINE-CNT.
           MOVE WS-STAT-LINE   TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
                
           MOVE SPACES         TO L0040-INPUT-LINE.
           MOVE '42600'        TO WS-STAT-PLAN-ID
           MOVE WS-42600-CNT   TO WS-STAT-LINE-CNT.
           MOVE WS-STAT-LINE   TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
                
           MOVE SPACES         TO L0040-INPUT-LINE.
           MOVE '42400'        TO WS-STAT-PLAN-ID
           MOVE WS-42400-CNT   TO WS-STAT-LINE-CNT.
           MOVE WS-STAT-LINE   TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
                
           MOVE SPACES         TO L0040-INPUT-LINE.
           MOVE '42500'        TO WS-STAT-PLAN-ID
           MOVE WS-42500-CNT   TO WS-STAT-LINE-CNT.
           MOVE WS-STAT-LINE   TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-POLICIES-RECS-LINE   TO L0040-INPUT-LINE.
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
       COPY CCPTPOL.
       COPY CCPUCVG.
       COPY CCPNCVG.
       COPY NCPPCVGS.
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
      /
       COPY XCPL0260.
      /
       COPY XCPL1660.
       COPY XCPL1680.
      /
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM ZSBMRENC                     **
      *****************************************************************
