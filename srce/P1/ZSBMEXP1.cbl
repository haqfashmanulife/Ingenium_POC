      *****************************************************************
      **  MEMBER : ZSBMEXP1                                          **
      **  REMARKS: THIS IS A ZAP PROGRAM TO SET THE CONVERSION EXPIRY**         
      **           DATE FOR THE EXISTING SUBSTANDARD RATED TERM LIFE **    
      **           OR MEDICAL RIDERS.                                **
      **           THIS IS RELATED TO ZSBMEXPD WHICH CONVERTED THE   **
      **           MATURE EXPIRY DATE.                               **
      *****************************************************************
      **  DATE     AUTHOR DESCRIPTION                                **
      **                                                             **
02PR59**  04SEP02  BP     (NEW) RE-INITIALIZING CONVERSION EXP DATE  **
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
      *****************************************************************
      *
       IDENTIFICATION DIVISION.
        
       PROGRAM-ID. ZSBMEXP1.
       
       COPY XCWWCRHT.
      / 
       ENVIRONMENT DIVISION.
        
       CONFIGURATION SECTION.
      /
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       
       COPY CCSSPRT1.
      /
       DATA DIVISION.
       FILE SECTION.
       
       COPY CCSDPRT1.
       COPY CCSRPRT1.
      /
       WORKING-STORAGE SECTION.
      *=======================
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMEXP1'.
 
       COPY SQLCA.

       01  START-STORAGE.
           05  I                         PIC S9(4)   COMP.
           05  WS-NUM-CTL-LINES          PIC S9(04)  COMP VALUE +99.
           05  WS-CTL-PAGES              PIC S9(04)  COMP VALUE +0.
           05  WS-CVG-STBL-1-CD          PIC X(02).
           05  WS-CVG-STBL-1-CD-N        REDEFINES
               WS-CVG-STBL-1-CD          PIC 9(02).
      *
       01  WS-CTL-REPORT-TITLE1.
           05  FILLER                 PIC X(08) VALUE 'ZSBMEXP1'.
           05  FILLER                 PIC X(47) VALUE SPACES.
           05  FILLER                 PIC X(20)
                      VALUE ' CONTROL     REPORT '.
           05  FILLER                 PIC X(47) VALUE SPACES.
           05  FILLER                 PIC X(06) VALUE 'PAGE: '.
           05  WS-CTL-TITLE1-PAGE     PIC ZZ9B.
           05  FILLER                 PIC X(01) VALUE SPACES.

       01  WS-CTL-REPORT-TITLE2.
           05  FILLER                 PIC X(10) VALUE SPACES.
           05  FILLER                 PIC X(16)
                      VALUE 'POLICY NO.      '.
           05  FILLER                 PIC X(10)
                      VALUE 'COV. NO.  '.      
           05  FILLER                 PIC X(10)
                      VALUE 'PLAN ID.  '.
           05  FILLER                 PIC X(16)
                      VALUE 'ISSUE DATE      '.
           05  FILLER                 PIC X(10)
                      VALUE 'DURATION  '.      
           05  FILLER                 PIC X(16)
                      VALUE 'ORI C/E DATE    '.
           05  FILLER                 PIC X(16)
                      VALUE 'NEW C/E DATE    '.
           05  FILLER                 PIC X(12)
                      VALUE 'CHANGE CODE '.
           05  FILLER                 PIC X(16) VALUE SPACES.

       01  WS-CTL-REPORT-DATA.
           05  FILLER                 PIC X(10) VALUE SPACES.
           05  WS-CTL-POL-ID          PIC X(10).
           05  FILLER                 PIC X(06) VALUE SPACES.
           05  WS-CTL-COV-NO          PIC X(02).
           05  FILLER                 PIC X(08) VALUE SPACES.
           05  WS-CTL-PLAN-ID         PIC X(06).
           05  FILLER                 PIC X(04) VALUE SPACES.
           05  WS-CTL-CVG-ISS-DT      PIC X(10).
           05  FILLER                 PIC X(06) VALUE SPACES.
           05  WS-CTL-DUR.                      
               10  WS-CTL-DUR-1       PIC X(01).
               10  WS-CTL-DUR-2-3     PIC X(02).
           05  FILLER                 PIC X(07) VALUE SPACES.
           05  WS-CTL-ORI-C-E-DT      PIC X(10).
           05  FILLER                 PIC X(06) VALUE SPACES.
           05  WS-CTL-NEW-C-E-DT      PIC X(10).
           05  FILLER                 PIC X(06) VALUE SPACES.
           05  WS-CTL-PREM-CHNG-CD    PIC X(01).
           05  FILLER                 PIC X(27) VALUE SPACES.

      *
P02229 COPY XCWL0035.

       COPY XCWWWKDT.
       COPY XCWLDTLK.
       COPY XCWL1640.
       COPY XCWL1660.
       COPY XCWL1670.
       COPY XCWL1680.
      *
       COPY CCSWPRT1.
      *
       COPY CCFRMAST.
      /
       COPY XCWTFCMD.
      *
       COPY CCWL0950.
       COPY CCWL0010.
      /
       COPY CCFWPH.
       COPY CCFRPH.
      /
       COPY CCWWCCC.
      /
       COPY CCFWCVG.
       COPY CCFRCVG.
      /
       COPY CCFRPOL.
       COPY CCFWPOL.
      *
       COPY XCWL0040.
       COPY XCSWOCF.
       COPY XCSROCF.
      *
       COPY XCSRBCF.
       COPY XCSWBCF.
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      *
       COPY CCWWCVGS.
      /
       01  MISC-WORK-AREAS.
           05  WS-PROGRAM-ID    PIC X(08)      VALUE 'ZSBMEXP1'.
      /
      *===================
       PROCEDURE DIVISION.
      *===================
      *--------------
       0000-MAINLINE.
      *--------------
       
           PERFORM 0100-OPEN-FILES
              THRU 0100-OPEN-FILES-X.
       
           PERFORM 1000-INITIALIZE
              THRU 1000-INITIALIZE-X.
       
           PERFORM 2000-POLICY-PROCESSING
              THRU 2000-POLICY-PROCESSING-X
              UNTIL WPOL-IO-EOF.
       
           PERFORM  POL-3000-TBL-END-BROWSE
               THRU POL-3000-TBL-END-BROWSE-X.

           PERFORM 9999-CLOSE-FILES
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

           PERFORM OCF-3000-OPEN-OUTPUT
              THRU OCF-3000-OPEN-OUTPUT-X.
      *
           PERFORM BCF-1000-OPEN-INPUT
              THRU BCF-1000-OPEN-INPUT-X.
      *
           PERFORM PRT1-3000-OPEN-OUTPUT
              THRU PRT1-3000-OPEN-OUTPUT-X.
      *
       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       1000-INITIALIZE.
      *----------------
      *
           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.
           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE 'INGENIUM'         TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME TO L0040-COMPANY-NAME.
           MOVE ZERO               TO L0040-ERROR-CNT.
           MOVE SPACES             TO L0040-PROGRAM-DESC.
           MOVE SPACES             TO L0040-HDG-LINE-3.

           MOVE 'CONV EXP DATES FOR SUBSTANDARD RIDERS CONVERSION'
                                   TO L0040-HDG-LINE-3.
      *
           PERFORM 0040-1000-INIT-TITLE
              THRU 0040-1000-INIT-TITLE-X.
      *
           MOVE LOW-VALUES    TO WPOL-KEY.
           MOVE HIGH-VALUES   TO WPOL-ENDBR-KEY.
           PERFORM  POL-1000-TBL-BROWSE
               THRU POL-1000-TBL-BROWSE-X.
           IF NOT WPOL-IO-OK
                MOVE '***NO POLICIES FROM RPOL TABLE***'
                                       TO L0040-INPUT-LINE
                PERFORM 0040-2000-WRITE-ERROR
                   THRU 0040-2000-WRITE-ERROR-X
                GO TO 1000-INITIALIZE-X
           END-IF.
      *
           PERFORM  POL-2000-TBL-READ-NEXT
               THRU POL-2000-TBL-READ-NEXT-X.

           PERFORM  2080-CONTROL-TITLES
               THRU 2080-CONTROL-TITLES-X.
      *
       1000-INITIALIZE-X.
           EXIT.
      /
      *-----------------------
       2000-POLICY-PROCESSING.
      *-----------------------


      *** SELECT INFORCE/PENDING/COMPLETE POLICIES ONLY

           IF  RPOL-POL-STAT-IN-FORCE
           OR  RPOL-POL-STAT-PENDING 
           OR  RPOL-POL-STAT-COMPLETE
               CONTINUE
           ELSE
               PERFORM  POL-2000-TBL-READ-NEXT
                   THRU POL-2000-TBL-READ-NEXT-X
               GO TO 2000-POLICY-PROCESSING-X
           END-IF.

           PERFORM  3000-READ-RIDERS-IN
               THRU 3000-READ-RIDERS-IN-X
               VARYING I FROM 1 BY 1
               UNTIL I > RPOL-POL-CVG-REC-CTR-N.

           PERFORM  POL-2000-TBL-READ-NEXT
               THRU POL-2000-TBL-READ-NEXT-X.

       2000-POLICY-PROCESSING-X.
           EXIT.
      /
      *------------------
       2080-CONTROL-TITLES.
      *------------------

           MOVE +0                          TO WS-NUM-CTL-LINES.
           ADD +1                           TO WS-CTL-PAGES.
           MOVE WS-CTL-PAGES                TO WS-CTL-TITLE1-PAGE.
           MOVE WS-CTL-REPORT-TITLE1        TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-2000-WRITE
               THRU PRT1-2000-WRITE-X.
           MOVE 2                           TO WPRT1-NUMBER-LINES.
           MOVE WS-CTL-REPORT-TITLE2        TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.
           MOVE 2                           TO WPRT1-NUMBER-LINES.
           MOVE SPACES                      TO RPRT1-SEQ-REC-INFO.
           PERFORM  PRT1-1000-WRITE
               THRU PRT1-1000-WRITE-X.

       2080-CONTROL-TITLES-X.
           EXIT.
      /
      *----------------------
       3000-READ-RIDERS-IN.
      *----------------------
      *
           MOVE RPOL-POL-ID            TO WCVG-POL-ID.
           MOVE I                      TO WCVG-CVG-NUM-N.

           PERFORM  CVG-1000-READ
               THRU CVG-1000-READ-X.

           IF NOT WCVG-IO-OK
               GO TO 3000-READ-RIDERS-IN-X
           END-IF.

           MOVE RCVG-CVG-INFO          TO WCVGS-CVG-INFO (I).

      ***  CHECK WHETHER THE COVERAGE IS INFORCE/PENDING AND IN    
      ***  SUBSTANDARD RATING.
           IF  WCVGS-CVG-STAT-IN-FORCE (I)
           OR  WCVGS-CVG-STAT-PENDING  (I)
               CONTINUE
           ELSE
               GO TO 3000-READ-RIDERS-IN-X
           END-IF.
            
           IF  WCVGS-CVG-ME-FCT (I) > +1
           OR  WCVGS-CVG-FE-PREM-AMT (I) > ZERO
               PERFORM 4000-CHECK-PLAN-HEADER
                  THRU 4000-CHECK-PLAN-HEADER-X
           END-IF.

       3000-READ-RIDERS-IN-X.
           EXIT.
      /
      *----------------------
       4000-CHECK-PLAN-HEADER.
      *----------------------
      *
           PERFORM  PLIN-1000-PLAN-HEADER-IN
               THRU PLIN-1000-PLAN-HEADER-IN-X.

           IF NOT WPH-IO-OK
               GO TO 4000-CHECK-PLAN-HEADER-X
           END-IF.

      ***  CHECK TO SEE WHETHER IT IS A TERM LIFE/MEDICAL RIDER
      *                 
           IF  (RPH-MAT-DT-CALC-ATTAINED-AGE
           OR   RPH-XPRY-DT-CALC-ATTAINED-AGE)
           AND (RPH-PREM-CHNG-DT-CD = 'C'
           OR   RPH-PREM-CHNG-DT-CD = 'S')
               PERFORM  5000-RESET-COV-C-E-DATE
                  THRU  5000-RESET-COV-C-E-DATE-X
           END-IF.
      *
       4000-CHECK-PLAN-HEADER-X.
           EXIT.
      /
      *----------------------
       5000-RESET-COV-C-E-DATE.
      *----------------------
      *
      *    MAKE SURE COVERAGE MAT/EXP DATE IS THERE                             
      *
           IF  WCVGS-CVG-MAT-XPRY-DT (I) = WWKDT-ZERO-DT                        
               GO TO 5000-RESET-COV-C-E-DATE-X
           END-IF.
           IF NOT WCVGS-CVG-CNVR-XPRY-DT (I)
                 > WCVGS-CVG-MAT-XPRY-DT (I)
               GO TO 5000-RESET-COV-C-E-DATE-X
           END-IF.
      *
           MOVE SPACES                  TO WS-CTL-REPORT-DATA.
           MOVE WCVGS-CVG-CNVR-XPRY-DT (I)  TO WS-CTL-ORI-C-E-DT.               
           MOVE RPOL-POL-ID             TO WS-CTL-POL-ID.
           MOVE WCVG-CVG-NUM            TO WS-CTL-COV-NO.
           MOVE RPH-PLAN-ID             TO WS-CTL-PLAN-ID.
           MOVE WCVGS-CVG-ISS-EFF-DT (I) TO WS-CTL-CVG-ISS-DT.                  
           MOVE RPH-PREM-CHNG-DT-CD     TO WS-CTL-PREM-CHNG-CD.
      *
      *
      ***  FOR LIFE RIDERS
      *
      *    IF  RPH-PREM-CHNG-DT-CD = 'C'
      *        MOVE RPH-PREM-CHNG-AGE-DUR-N  TO L1680-NUMBER-OF-YEARS
      *        MOVE RPH-PREM-CHNG-AGE-DUR    TO WS-CTL-DUR           
      *    END-IF.
      *
      ***  FOR MEDICAL RIDERS
      *
      *    IF RPH-PREM-CHNG-DT-CD = 'S'
      *       IF WCVGS-CVG-STBL-1-CD (I) NOT = SPACES
      *          MOVE WCVGS-CVG-STBL-1-CD (I) TO WS-CVG-STBL-1-CD 
      *          MOVE '0'                     TO WS-CTL-DUR-1
      *          MOVE WCVGS-CVG-STBL-1-CD (I) TO WS-CTL-DUR-2-3   
      *          MOVE WS-CVG-STBL-1-CD-N      TO L1680-NUMBER-OF-YEARS
      *       ELSE
      *          GO TO 5000-RESET-COV-C-E-DATE-X
      *       END-IF
      *    END-IF.
      *
      *    MOVE ZERO                         TO L1680-NUMBER-OF-MONTHS.
      *    MOVE ZERO                         TO L1680-NUMBER-OF-DAYS.
      *    MOVE WCVGS-CVG-MAT-XPRY-DT (I)    TO L1680-INTERNAL-1.

      *    PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
      *        THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
       
      *    MOVE L1680-INTERNAL-2          TO WCVGS-CVG-MAT-XPRY-DT (I).
           MOVE WCVGS-CVG-MAT-XPRY-DT (I)                                       
                 TO WCVGS-CVG-CNVR-XPRY-DT (I).                                 
           MOVE WCVGS-CVG-CNVR-XPRY-DT (I) TO WS-CTL-NEW-C-E-DT.                
      *
           PERFORM CVG-1000-READ-FOR-UPDATE
              THRU CVG-1000-READ-FOR-UPDATE-X.
               
           IF RCVG-CVG-INFO = WCVGS-CVG-INFO (I)
               PERFORM CVG-3000-UNLOCK
                  THRU CVG-3000-UNLOCK-X
           ELSE
               MOVE WCVGS-CVG-INFO (I)
                                      TO RCVG-CVG-INFO
               PERFORM CVG-2000-REWRITE
                  THRU CVG-2000-REWRITE-X
           END-IF.
      *
           IF  WS-NUM-CTL-LINES > +50
               PERFORM  2080-CONTROL-TITLES
                   THRU 2080-CONTROL-TITLES-X
           END-IF.
      *        
           ADD  +1                 TO WS-NUM-CTL-LINES.
           MOVE +1                 TO WPRT1-NUMBER-LINES.
           MOVE WS-CTL-REPORT-DATA TO RPRT1-SEQ-REC-INFO.
           PERFORM PRT1-1000-WRITE
              THRU PRT1-1000-WRITE-X.
      *
       5000-RESET-COV-C-E-DATE-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------
      *
           PERFORM BCF-4000-CLOSE
              THRU BCF-4000-CLOSE-X.
      *
           PERFORM PRT1-4000-CLOSE
              THRU PRT1-4000-CLOSE-X.
      *
           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.
      *
       9999-CLOSE-FILES-X.
           EXIT.
      /
P02229 COPY XCPL0035.

       COPY XCPL1680.
       COPY XCPL1670.
       COPY XCPL1660.
       COPY XCPL1640.
      /
       COPY CCPIPRT1.
      /
       COPY CCPPCCC.
      /
       COPY CCPL0950.
       COPY CCPS0950.
       COPY CCPL0010.
       COPY CCPS0010.
      /
       COPY CCPNPOL.
       COPY CCPTPOL.
      /
       COPY CCPNCVG.
       COPY CCPUCVG.
      /
       COPY CCPPPLIN.
       COPY CCPPMIDT.
      /
       COPY CCPNPH.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPOBCF.
       COPY XCPLBCF.
       COPY XCPNBCF.
      /
       COPY XCPL0040.
       COPY XCPL0260.
       COPY XCPL0030.
      *
      *****************************************************************
      **                 END OF PROGRAM ZSBMEXP1                     **
      *****************************************************************
