      *****************************************************************
      **  MEMBER :  ZSBMMP7O                                         **
      **  REMARKS:  THIS PROGRAM WILL UPDATE THE CVG-ORIG-FACE-AMT   **
      **            BY CVG-FACE-AMT                                  **
      **                                                             **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  04NOV04  RZ     COVERAGE ORIGINAL FACE AMOUNT RESET        **
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
      *****************************************************************

       IDENTIFICATION DIVISION.

       PROGRAM-ID.    ZSBMMP7O.

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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMMP7O'.

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
      
       01  WS-CONTROL-CARD.
           05  WS-CTL-EDIT-ONLY             PIC X(10).
               88  WS-CTL-EDIT-TEXT         VALUE 'EDIT ONLY='.
           05  WS-CTL-EDIT-SW               PIC X(01).
               88 EDIT-ONLY                 VALUE 'Y'. 
               88 EDIT-ONLY-NO              VALUE 'N'.
                
       01  WS-CVG-PRINT-LINE.
           05  FILLER                       PIC X(08) 
                                            VALUE 'POLICY: '.
           05  WS-POL-ID                    PIC X(10).
           05  FILLER                       PIC X(10)
                                            VALUE ' CVG NUM: '.
           05  WS-CVG-NUM                   PIC X(02).
           05  FILLER                       PIC X(10)
                                            VALUE ' PLAN ID: '.
           05  WS-PLAN-ID                   PIC X(06).
           05  FILLER                       PIC X(09) 
                                            VALUE ' STATUS: '.
           05  WS-CVG-CSTAT-CD              PIC X(03).
            
           05  FILLER                       PIC X(15)
                                            VALUE ' ORIG FACE AMT:'.
           05  WS-PRT-ORIG-FACE-AMT         PIC X(20).

           05  FILLER                       PIC X(15)
                                            VALUE ' CVG FACE AMT: '.
           05  WS-PRT-FACE-AMT              PIC X(20).
      
       01  WS-MISC-WORK-AREA.
      
           05  WS-CVG                       PIC 9(02) VALUE ZERO.
      
           05  WS-CVG-FACE-AMT              PIC S9(13)V99.
           05  WS-CVG-FACE-AMT-X            REDEFINES
               WS-CVG-FACE-AMT              PIC X(15).

           05  WS-CVG-OLD-ORIG-FACE-AMT     PIC S9(13)V99.
           05  WS-CVG-OLD-ORIG-FACE-AMT-X   REDEFINES
               WS-CVG-OLD-ORIG-FACE-AMT     PIC X(15).

           05  WS-ORIG-FACE-AMT-NUM         PIC S9(13)V99.
           05  WS-ORIG-FACE-AMT-TXT         REDEFINES
               WS-ORIG-FACE-AMT-NUM         PIC X(15).

           05  WS-CVG-ORIG-FACE-AMT-X       PIC X(20).
           05  WS-CVG-ORIG-FACE-AMT         PIC S9(13)V99 COMP-3.

           05  WS-FACE-AMT-UPDATE-STATUS    PIC X(01).
               88  WS-FACE-AMT-UPDATE-YES   VALUE 'Y'. 
               88  WS-FACE-AMT-UPDATE-NO    VALUE 'N'. 
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
       COPY CCFWPHST.
       COPY CCFRPHST.
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
       COPY XCWL0280.
      /
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

           MOVE 'ZSBMMP7O'         TO WGLOB-USER-ID.
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

           IF WCVGS-CVG-FACE-AMT (WS-CVG) = 0
              GO TO 3000-REWRITE-COVERAGE-X
           END-IF.
          
           MOVE WCVGS-CVG-ORIG-FACE-AMT (WS-CVG) 
           TO   WS-CVG-OLD-ORIG-FACE-AMT.
            
           PERFORM 3100-CHECK-CVG-STAT-CHNG
               THRU 3100-CHECK-CVG-STAT-CHNG-X.
             
           IF WS-FACE-AMT-UPDATE-NO  
               MOVE WCVGS-CVG-FACE-AMT (WS-CVG)
                 TO WCVGS-CVG-ORIG-FACE-AMT (WS-CVG)
           ELSE
               MOVE WS-CVG-ORIG-FACE-AMT   
                 TO WCVGS-CVG-ORIG-FACE-AMT (WS-CVG)
           END-IF.
          
           IF WCVGS-CVG-ORIG-FACE-AMT (WS-CVG) = 0        
              GO TO 3000-REWRITE-COVERAGE-X
           END-IF.
          
           MOVE WPOL-POL-ID              TO WCVG-POL-ID.
           MOVE WS-CVG                   TO WCVG-CVG-NUM-N.

           PERFORM  CVG-1000-READ-FOR-UPDATE
               THRU CVG-1000-READ-FOR-UPDATE-X.

           MOVE WCVGS-CVG-INFO (WS-CVG)  TO RCVG-CVG-INFO.

           PERFORM  CVG-2000-REWRITE
               THRU CVG-2000-REWRITE-X.

           IF WS-FACE-AMT-UPDATE-YES
               PERFORM  7000-PRINT-DETAILS
                   THRU 7000-PRINT-DETAILS-X
           END-IF.

       3000-REWRITE-COVERAGE-X.
           EXIT.
      /
      *--------------------------
       3100-CHECK-CVG-STAT-CHNG.
      *--------------------------
      
      *  READ PHST AND FIND CVG STATUS CHANGE RECORD 
      
           INITIALIZE WPHST-KEY.
           SET WS-FACE-AMT-UPDATE-NO  TO TRUE. 
            
           MOVE RPOL-POL-ID       TO WPHST-POL-ID.
           MOVE LOW-VALUES        TO WPHST-PCHST-EFF-IDT-NUM.
           MOVE ZEROS             TO WPHST-PCHST-SEQ-NUM.
      
      *  SET UP ENDBROWSE KEY
      
           MOVE WPHST-KEY         TO WPHST-ENDBR-KEY.
           MOVE HIGH-VALUES       TO WPHST-ENDBR-PCHST-EFF-IDT-NUM.
           MOVE 999               TO WPHST-ENDBR-PCHST-SEQ-NUM.
      
           PERFORM  PHST-1000-BROWSE
               THRU PHST-1000-BROWSE-X.
      
           IF  NOT WPHST-IO-OK
               PERFORM  PHST-3000-END-BROWSE
                   THRU PHST-3000-END-BROWSE-X
               GO TO 3100-CHECK-CVG-STAT-CHNG-X
           END-IF.
      
           PERFORM  4000-CHECK-PHST-LOG
              THRU  4000-CHECK-PHST-LOG-X
               UNTIL WPHST-IO-EOF
               OR NOT WPHST-IO-OK
      
      
           PERFORM  PHST-3000-END-BROWSE
               THRU PHST-3000-END-BROWSE-X.
      
       3100-CHECK-CVG-STAT-CHNG-X.
           EXIT.
      /
            
      *--------------------
       4000-CHECK-PHST-LOG.
      *--------------------

           PERFORM  PHST-2000-READ-NEXT
               THRU PHST-2000-READ-NEXT-X.

           IF WPHST-IO-EOF OR NOT WPHST-IO-OK
               GO TO 4000-CHECK-PHST-LOG-X
           END-IF.
            
           IF  RPHST-CVG-NUM <> WS-CVG
           OR  RPHST-CVG-NUM-N = ZEROS
               GO TO 4000-CHECK-PHST-LOG-X
           END-IF.
            
           IF  RPHST-POL-ACTV-TYP-ID NOT = '2010'
           AND RPHST-POL-ACTV-TYP-ID NOT = '2035'
               GO TO 4000-CHECK-PHST-LOG-X
           END-IF.

           IF  RPHST-PCHST-STAT-ERROR
           OR  RPHST-PCHST-STAT-HISTORY
           OR  RPHST-PCHST-STAT-OVERRIDE
           OR  RPHST-PCHST-STAT-PENDING
           OR  RPHST-PCHST-STAT-REVERSED
           
               GO TO 4000-CHECK-PHST-LOG-X
           END-IF.
                
 
           IF  RPHST-PCHST-STAT-ACTIVE
           AND (RPHST-POL-ACTV-TYP-ID = '2010' OR "2035" )
           AND RPHST-CVG-NUM-N NOT = ZEROS
                   
               MOVE RPHST-PCHST-OLD-VALU-TXT  TO WS-CVG-ORIG-FACE-AMT-X
                   
               PERFORM 4100-TXT-CONVERT-NUM
                  THRU 4100-TXT-CONVERT-NUM-X
                   
               IF WS-CVG-ORIG-FACE-AMT > 0
                  SET WS-FACE-AMT-UPDATE-YES  TO TRUE 
               ELSE
                  SET  WS-FACE-AMT-UPDATE-NO  TO TRUE 
                  MOVE SPACES                 TO WS-CVG-ORIG-FACE-AMT-X
               END-IF
           END-IF.

       4000-CHECK-PHST-LOG-X.
           EXIT.

      *--------------------
       4100-TXT-CONVERT-NUM.
      *--------------------

           MOVE RPHST-PCHST-OLD-VALU-TXT TO L0280-INPUT-DATA.
           MOVE 2                        TO L0280-PRECISION.
           MOVE 'N'                      TO L0280-SIGN-IND.
           MOVE LENGTH OF WFRMT-2010-D1  TO L0280-INPUT-SIZE.

           COMPUTE L0280-LENGTH =      L0280-INPUT-SIZE -
                                       L0280-PRECISION - 1.

           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X.
                
           MOVE L0280-OUTPUT-DOLLAR TO WS-CVG-ORIG-FACE-AMT.

       4100-TXT-CONVERT-NUM-X.
           EXIT.
      /
      *--------------------
       7000-PRINT-DETAILS.
      *--------------------

           MOVE RPOL-POL-ID                 TO WS-POL-ID.
           MOVE WS-CVG                      TO WS-CVG-NUM.
           MOVE WCVGS-PLAN-ID (WS-CVG)      TO WS-PLAN-ID.
           MOVE WCVGS-CVG-CSTAT-CD (WS-CVG) TO WS-CVG-CSTAT-CD.

           MOVE WCVGS-CVG-ORIG-FACE-AMT (WS-CVG)
                                            TO WS-ORIG-FACE-AMT-NUM.
           MOVE WS-ORIG-FACE-AMT-TXT        TO WS-PRT-ORIG-FACE-AMT.

           MOVE WCVGS-CVG-FACE-AMT (WS-CVG) TO WS-CVG-FACE-AMT.
           MOVE WS-CVG-FACE-AMT-X           TO WS-PRT-FACE-AMT.

           MOVE SPACES                      TO L0040-INPUT-LINE.
           MOVE WS-CVG-PRINT-LINE           TO L0040-INPUT-LINE.

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
       COPY CCPBPHST.
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
       COPY XCPL0280.
      /
       COPY XCPL1660.
       COPY XCPL1680.
      /
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM ZSBMMP7O                     **
      *****************************************************************
