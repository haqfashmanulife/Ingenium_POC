      *****************************************************************
      **  MEMBER :  ZSBMPALC                                         **
      **                                                             **
      **  REMARKS:  CONVERSION PROGRAM FOR CAIN AND CDSI TABLE       **
      **                                                             **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
P00105**  05NOV01  EKM    NEW ZAP PROGRAM TO CORRECT JOURNAL DATE    **
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
MFFALL**  03OCT05  SW     MODIFIED THE PROGRAM FOR FUNDS PROJECT     **
      *****************************************************************

       IDENTIFICATION DIVISION.

       PROGRAM-ID.    ZSBMPALC.

       COPY XCWWCRHT.
      /
       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
      /
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

      *****************************************************************
      *    FILE DESCRIPTIONS :                                        *
      *       CASH ALLOCATION INSTRUCTION DETAILS:                    *
      *****************************************************************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMPALC'.

       COPY SQLCA.

       01  WS-MISC-AREAS.
           05  WS-POL-CAIN-CTR                  PIC 9(03).
           05  WS-POL-CDSI-CTR                  PIC 9(03).
           05  WS-CAIN-ERROR-IND            PIC X(01).
               88  WS-CAIN-ERROR-NO             VALUE 'N'.
               88  WS-CAIN-ERROR                VALUE 'Y'.
           05  WS-CDSI-ERROR-IND            PIC X(01).
               88  WS-CDSI-ERROR-NO             VALUE 'N'.
               88  WS-CDSI-ERROR                VALUE 'Y'.
           05  WS-POL-ERROR-IND             PIC X(01).
               88  WS-POL-ERROR-NO              VALUE 'N'.
               88  WS-POL-ERROR                 VALUE 'Y'.
MFFALL     05  WS-TOT-POLX-AMT              PIC S9(15)V9(02) COMP-3.
MFFALL     05  WS-HOLD-CDI-TYP-CD           PIC X(01).
MFFALL         88  WS-HOLD-CDI-TYP-INIT-PREM    VALUE 'I'.
MFFALL         88  WS-HOLD-CDI-TYP-SUBSEQ-PREM  VALUE 'S'.
MFFALL         88  WS-HOLD-CDI-TYP-INIT-LMPSM   VALUE 'U'.
MFFALL         88  WS-HOLD-CDI-TYP-CNVR-FND     VALUE 'X'.
           05  WS-POLICIES-RECS-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'TOTAL POLICIES PROCESSED                '.
               10  WS-POLICIES-PRCES-CTR    PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
           
           05  WS-CAIN-RECS-READ-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'TOTAL CAIN RECORDS READ                 '.
               10  WS-CAIN-RECS-READ-CTR    PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
           05  WS-CAIN-DELETED-RECS-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'TOTAL CAIN RECORDS DELETED              '.
               10  WS-CAIN-RECS-DELETED-CTR PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
           05  WS-CAIN-ADDED-RECS-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'TOTAL CAIN RECORDS ADDED                '.
               10  WS-CAIN-RECS-ADDED-CTR   PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
MFFALL     05  WS-CAIN-UPDATED-LINE.
MFFALL         10  FILLER                   PIC X(40)
MFFALL         VALUE 'TOTAL CAIN RECORDS UPDATED              '.
MFFALL         10  WS-CAIN-RECORD-UPDT-CTR  PIC 9(6)  VALUE ZERO.
MFFALL         10  FILLER                   PIC X(86) VALUE SPACE.
MFFALL     05  WS-CAIN-ERROR-LINE.
MFFALL         10  FILLER                   PIC X(40)
MFFALL         VALUE 'TOTAL ERROR FOR CAIN RECORDS            '.
MFFALL         10  WS-CAIN-ERROR-CTR        PIC 9(6)  VALUE ZERO.
MFFALL         10  FILLER                   PIC X(86) VALUE SPACE.
           
           05  WS-CDSI-RECS-READ-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'TOTAL CDSI RECORDS READ '.
               10  WS-CDSI-RECS-READ-CTR    PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
           05  WS-CDSI-DELETED-RECS-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'TOTAL CDSI RECORDS DELETED              '.
               10  WS-CDSI-RECS-DELETED-CTR PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
           05  WS-CDSI-ADDED-RECS-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'TOTAL CDSI RECORDS ADDED                '.
               10  WS-CDSI-RECS-ADDED-CTR   PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
           05  WS-CDSI-UPDATED-RECS-LINE.
               10  FILLER                   PIC X(40)
               VALUE 'TOTAL CDSI RECORDS UPDATED              '.
               10  WS-CDSI-RECORD-UPDT-CTR  PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
MFFALL     05  WS-CDSI-ERROR-LINE.
MFFALL         10  FILLER                   PIC X(40)
MFFALL         VALUE 'TOTAL ERROR FOR CDSI RECORDS            '.
MFFALL         10  WS-CDSI-ERROR-CTR        PIC 9(6)  VALUE ZERO.
MFFALL         10  FILLER                   PIC X(86) VALUE SPACE.
      
       01  WS-CAIN-PRINT-LINE.
           05  WS-CAIN-PRINT-TYP-CD         PIC X(17).
               88 WS-CAIN-PRINT-TYP-ADD       VALUE 'CAIN ADDED.....: '.
               88 WS-CAIN-PRINT-TYP-DELETE    VALUE 'CAIN DELETED...: '.
MFFALL         88 WS-CAIN-PRINT-TYP-ORIGINAL  VALUE 'CAIN ORIGINAL..: '.
MFFALL         88 WS-CAIN-PRINT-TYP-UPDATED   VALUE 'CAIN UPDATED...: '.
           05  FILLER                       PIC X(01).
           05  WS-CAIN-CO-ID                PIC X(02).
           05  WS-CAIN-POL-ID               PIC X(10).
           05  WS-CAIN-CDI-TYP-CD           PIC X(01).
           05  WS-CAIN-POL-PAYO-NUM         PIC S9(05).
           05  WS-CAIN-CDI-EFF-IDT-NUM      PIC X(07).
           05  WS-CAIN-PREV-UPDT-USER-ID    PIC X(08).
           05  WS-CAIN-PREV-UPDT-DT         PIC X(10).
           05  WS-CAIN-CDI-STAT-CD          PIC X(01).
MFFALL     05  WS-CAIN-CDI-TOT-ALLOC-AMT    PIC S9(15)V9(02).
      
       01  WS-CDSI-PRINT-LINE.
           05  WS-CDSI-PRINT-TYP-CD         PIC X(17).
               88 WS-CDSI-PRINT-TYP-ADD       VALUE 'CDSI ADDED.....: '.
               88 WS-CDSI-PRINT-TYP-DELETE    VALUE 'CDSI DELETED...: '.
               88 WS-CSDI-PRINT-TYP-ORIGINAL  VALUE 'CDSI ORIGINAL..: '.
               88 WS-CSDI-PRINT-TYP-UPDATED   VALUE 'CDSI UPDATED...: '.
           05  FILLER                       PIC X(01).
           05  WS-CDSI-CO-ID                PIC X(02).
           05  WS-CDSI-POL-ID               PIC X(10).
           05  WS-CDSI-CDI-TYP-CD           PIC X(01).
           05  WS-CDSI-POL-PAYO-NUM         PIC S9(05).
           05  WS-CDSI-CDI-EFF-IDT-NUM      PIC X(07).
           05  WS-CDSI-CDI-ALLOC-NUM        PIC S9(03).
MFFALL*    05  WS-CDSI-PREV-UPDT-USER-ID    PIC X(08).
           05  WS-CDSI-PREV-UPDT-DT         PIC X(10).
           05  WS-CDSI-CVG-NUM              PIC X(02).
           05  WS-CDSI-CDI-EFF-DT           PIC X(10).
           05  WS-CDSI-CDI-ALLOC-CD         PIC X(01).
           05  WS-CDSI-CDI-ALLOC-AMT        PIC S9(13)V9(02).
           05  WS-CDSI-CDI-ALLOC-PCT        PIC S9(03)V9(04).
           05  WS-CDSI-CDI-ALLOC-UNIT-QTY   PIC S9(09)V9(09).
           05  WS-CDSI-CDI-PAYO-MTHD-CD     PIC X(01).
           05  WS-CDSI-DPOS-TRM-MO-DUR      PIC X(03).
           05  WS-CDSI-DPOS-TRM-DY-DUR      PIC X(03).
MFFALL     05  WS-CDSI-CDI-CVG-ALLOC-AMT    PIC S9(13)V9(02).
      *    05  WS-CDSI-DEST-POL-ID          PIC X(10).
      *    05  WS-CDSI-DEST-CVG-NUM         PIC X(02).
      *    05  WS-CDSI-DEST-FND-ID          PIC X(05).
      *    05  WS-CDSI-BNK-ID               PIC X(04).
      *    05  WS-CDSI-BNK-BR-ID            PIC X(05).
      *    05  WS-CDSI-BNK-ACCT-ID          PIC X(17).
      *    05  WS-CDSI-BNK-ACCT-HLDR-NM     PIC X(50).
      *    05  WS-CDSI-BNK-ACCT-TYP-CD      PIC X(03).
      
       01  WS-POL-PRINT-LINE.
           05  FILLER                       PIC X(08) 
                                                VALUE 'POLICY: '.
           05  WS-POL-ID                    PIC X(10).
           05  FILLER                       PIC X(09) 
                                                VALUE ' STATUS: '.
           05  WS-POL-CSTAT-CD              PIC X(04).
           05  FILLER                       PIC X(12) 
                                                VALUE ' PREM SUSP: '.
           05  WS-POL-PREM-SUSP-AMT         PIC -9(15).9(02).
           05  FILLER                       PIC X(12) 
                                                VALUE ' MISC SUSP: '.
           05  WS-POL-MISC-SUSP-AMT         PIC -9(15).9(02).
      
      /
P02229 COPY XCWL0035.

       COPY CCWL0010.
      /
       COPY CCWL0950.
      /
MFFALL COPY CCWL9806.
      /
       COPY CCFWCAIN.
       COPY CCFRCAIN.
      /
       COPY CCFWCDSI.
       COPY CCFRCDSI.
      /
       COPY CCFWPOL.
       COPY CCFRPOL.
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
MFFALL COPY CCWLPGA.
      /
MFFALL COPY CCWWCVGS.
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

           MOVE 'ZSBMPALC'         TO WGLOB-USER-ID.
           MOVE 'INGENIUM'         TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME TO L0040-COMPANY-NAME.
           MOVE ZERO               TO L0040-ERROR-CNT.
           MOVE SPACES             TO L0040-PROGRAM-DESC.
           MOVE SPACES             TO L0040-HDG-LINE-3.

           MOVE '            POLICY ALLOCATION CORRECTION PROCESSING'
                                   TO L0040-HDG-LINE-3.

MFFALL*    DISPLAY '**** ZSBMPALC - CORRECTION PROGRAM RUNNING ****'
           
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
      ***  MOVE '0500001'         TO WPOL-POL-ID.
      ***  MOVE '0500132'         TO WPOL-ENDBR-POL-ID.

           PERFORM  POL-1000-TBL-BROWSE
               THRU POL-1000-TBL-BROWSE-X.
           
           PERFORM  2000-READ-WRITE-LOOP
               THRU 2000-READ-WRITE-LOOP-X
              UNTIL WPOL-IO-EOF
                 OR NOT WPOL-IO-OK.

       1000-PROCESS-POLS-X.
           EXIT.
      /
      *---------------------
       2000-READ-WRITE-LOOP.
      *---------------------

           PERFORM  POL-2000-TBL-READ-NEXT
               THRU POL-2000-TBL-READ-NEXT-X.
           
           IF  NOT WPOL-IO-OK
MFFALL*    DISPLAY '*** END OF POLICIES - JOB COMPLETED NORMALLY***'
               GO TO 2000-READ-WRITE-LOOP-X
           END-IF.
           
MFFALL*    DISPLAY '*** PROCESSING POLICY ===> ', RPOL-POL-ID.
           
           ADD 1                        TO WS-POLICIES-PRCES-CTR.
           SET WS-POL-ERROR-NO          TO TRUE.
           
           IF  WPOL-IO-EOF           
      ***  OR  RPOL-POL-APPL-CTL-NBS
               GO TO 2000-READ-WRITE-LOOP-X
           END-IF.

      * PROCESS CAIN RECORDS     
MFFALL*    PERFORM  4000-PRCES-CAIN-REC
MFFALL*        THRU 4000-PRCES-CAIN-REC-X.

      * PROCESS CDSI RECORDS     
MFFALL*    PERFORM  4600-READ-CDSI-REC
MFFALL*        THRU 4600-READ-CDSI-REC-X.

MFFALL* PROCESS CAIN AND CDSI RECORDS
MFFALL     PERFORM  5000-PROCESS-CAIN-CDSI-RECS
MFFALL         THRU 5000-PROCESS-CAIN-CDSI-RECS-X.

MFFALL*    IF  WS-POL-ERROR
MFFALL*        PERFORM  7500-PRINT-POL-LINE
MFFALL*            THRU 7500-PRINT-POL-LINE-X
MFFALL*    END-IF.
       
       2000-READ-WRITE-LOOP-X.
           EXIT.
      /
      *-------------------
       4000-PRCES-CAIN-REC.
      *-------------------

      *
      * CHECK CAIN RECORDS FOR ERRORS
      *
           MOVE LOW-VALUES              TO WCAIN-KEY.
           MOVE HIGH-VALUES             TO WCAIN-ENDBR-KEY.
           
           MOVE RPOL-POL-ID             TO WCAIN-POL-ID.
           MOVE +9999999                TO WCAIN-CDI-EFF-IDT-NUM-N.
           MOVE +00000                  TO WCAIN-POL-PAYO-NUM.
           
           MOVE RPOL-POL-ID             TO WCAIN-ENDBR-POL-ID.
           MOVE +0000000                TO WCAIN-ENDBR-CDI-EFF-IDT-NUM.
           MOVE +99999                  TO WCAIN-ENDBR-POL-PAYO-NUM.
           
           PERFORM  CAIN-1000-BROWSE
               THRU CAIN-1000-BROWSE-X.
       
           MOVE 0                       TO WS-POL-CAIN-CTR.
           SET  WS-CAIN-ERROR-NO        TO TRUE.
           PERFORM  4100-READ-CAIN-LOOP
               THRU 4100-READ-CAIN-LOOP-X
              UNTIL WCAIN-IO-EOF
                 OR NOT WCAIN-IO-OK.
                 
           PERFORM CAIN-3000-END-BROWSE
              THRU CAIN-3000-END-BROWSE-X.
           
      *
      * IF CAIN ERRORS, DELETE & RE-CREATE THE RECORDS.
      *
           
           IF  WS-CAIN-ERROR
           OR  WS-POL-CAIN-CTR > 2
               PERFORM  4200-FIX-CAIN-RECS
                   THRU 4200-FIX-CAIN-RECS-X
               SET WS-POL-ERROR             TO TRUE
           END-IF.
                                       
       4000-PRCES-CAIN-REC-X.
           EXIT.
      /
      *---------------------
       4100-READ-CAIN-LOOP.
      *---------------------

           PERFORM  CAIN-2000-READ-NEXT
               THRU CAIN-2000-READ-NEXT-X.
           
           IF  NOT WCAIN-IO-OK
               GO TO 4100-READ-CAIN-LOOP-X
           END-IF.

           ADD 1                        TO WS-CAIN-RECS-READ-CTR.
           
      * CHECK THAT CAIN EFFECTIVE DATE MATCHES POLICY ISSUE DATE.
           
           MOVE RCAIN-CDI-EFF-IDT-NUM       TO L1660-INVERTED-DATE.
           PERFORM  1660-3000-CONVERT-INV-TO-INT
               THRU 1660-3000-CONVERT-INV-TO-INT-X
           
           IF  L1660-INTERNAL-DATE NOT = RPOL-POL-ISS-EFF-DT
               SET  WS-CAIN-ERROR           TO TRUE
           END-IF.
       
       4100-READ-CAIN-LOOP-X.
           EXIT.
      /
      *---------------------
       4200-FIX-CAIN-RECS.
      *---------------------

      * DELETE OLD CAIN RECORDS
      
           MOVE LOW-VALUES              TO WCAIN-KEY.
           MOVE HIGH-VALUES             TO WCAIN-ENDBR-KEY.
           
           MOVE RPOL-POL-ID             TO WCAIN-POL-ID.
           MOVE +9999999                TO WCAIN-CDI-EFF-IDT-NUM-N.
           MOVE +00000                  TO WCAIN-POL-PAYO-NUM.
           
           MOVE RPOL-POL-ID             TO WCAIN-ENDBR-POL-ID.
           MOVE +0000000                TO WCAIN-ENDBR-CDI-EFF-IDT-NUM.
           MOVE +99999                  TO WCAIN-ENDBR-POL-PAYO-NUM.
           
           PERFORM  CAIN-1000-BROWSE
               THRU CAIN-1000-BROWSE-X.
          
           PERFORM  4300-DELETE-CAIN-RECS
               THRU 4300-DELETE-CAIN-RECS-X
              UNTIL WCAIN-IO-EOF
                 OR NOT WCAIN-IO-OK.
           
           PERFORM CAIN-3000-END-BROWSE
              THRU CAIN-3000-END-BROWSE-X.
               

      * CREATE NEW CAIN RECORDS.    

      * CALCULATE CORRECT EFFECTIVE DATE
      
           MOVE RPOL-POL-ISS-EFF-DT     TO L1660-INTERNAL-DATE.
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           
      * CREATE INITIAL DEPOSIT CAIN RECORD
      * ----------------------------------
           MOVE RPOL-POL-ID             TO RCAIN-POL-ID.                    
           MOVE 'I'                     TO RCAIN-CDI-TYP-CD.                    
           MOVE 0                       TO RCAIN-POL-PAYO-NUM.                  
  
           MOVE L1660-INVERTED-DATE     TO RCAIN-CDI-EFF-IDT-NUM-N.
           MOVE 'C'                     TO RCAIN-CDI-STAT-CD.
           MOVE RCAIN-KEY               TO WCAIN-KEY.
           
           PERFORM  CAIN-1000-WRITE
               THRU CAIN-1000-WRITE-X.
               
           PERFORM  7000-MOVE-CAIN-TO-WS
               THRU 7000-MOVE-CAIN-TO-WS-X.
           
           ADD 1                        TO WS-CAIN-RECS-ADDED-CTR.
           
      *    PRINT LINE FOR THE ADDED RECORD
           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           SET  WS-CAIN-PRINT-TYP-ADD   TO TRUE.
           MOVE WS-CAIN-PRINT-LINE      TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
       
      * CREATE SUBSEQUENT DEPOSIT CAIN RECORD
      * -------------------------------------
           MOVE RPOL-POL-ID             TO RCAIN-POL-ID.                    
           MOVE 'S'                     TO RCAIN-CDI-TYP-CD.                    
           MOVE 0                       TO RCAIN-POL-PAYO-NUM.                  
  
           MOVE L1660-INVERTED-DATE     TO RCAIN-CDI-EFF-IDT-NUM-N.
           MOVE 'C'                     TO RCAIN-CDI-STAT-CD.
           MOVE RCAIN-KEY               TO WCAIN-KEY.
           
           PERFORM  CAIN-1000-WRITE
               THRU CAIN-1000-WRITE-X.
           
           PERFORM  7000-MOVE-CAIN-TO-WS
               THRU 7000-MOVE-CAIN-TO-WS-X.
           
           ADD 1                        TO WS-CAIN-RECS-ADDED-CTR.
           
      *    PRINT LINE FOR THE ADDED RECORD
           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           SET  WS-CAIN-PRINT-TYP-ADD   TO TRUE.
           MOVE WS-CAIN-PRINT-LINE      TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
       
           
       4200-FIX-CAIN-RECS-X.
           EXIT.
      /
      *----------------------
       4300-DELETE-CAIN-RECS.
      *----------------------

      * DELETE OLD CAIN RECORDS
      
           
           PERFORM  CAIN-2000-READ-NEXT
               THRU CAIN-2000-READ-NEXT-X.
           
           IF  NOT WCAIN-IO-OK
               GO TO 4300-DELETE-CAIN-RECS-X
           END-IF.
           
           PERFORM  7000-MOVE-CAIN-TO-WS
               THRU 7000-MOVE-CAIN-TO-WS-X.
           
           MOVE RCAIN-KEY               TO WCAIN-KEY
           PERFORM  CAIN-1000-READ-FOR-UPDATE
               THRU CAIN-1000-READ-FOR-UPDATE-X
           PERFORM  CAIN-1000-DELETE
               THRU CAIN-1000-DELETE-X

           ADD 1                        TO WS-CAIN-RECS-DELETED-CTR.
           
      *    PRINT LINE FOR THE DELETED RECORD
           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                   TO L0040-INPUT-LINE.
           SET  WS-CAIN-PRINT-TYP-DELETE TO TRUE.
           MOVE WS-CAIN-PRINT-LINE       TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
       
       4300-DELETE-CAIN-RECS-X.
           EXIT.
      /
      *-------------------
       4600-READ-CDSI-REC.
      *-------------------
           
      *
      * CHECK CDSI RECORDS FOR ERRORS
      *
           MOVE LOW-VALUES             TO WCDSI-KEY.
           MOVE HIGH-VALUES            TO WCDSI-ENDBR-KEY.
           
           MOVE RPOL-POL-ID            TO WCDSI-POL-ID.
           MOVE +9999999               TO WCDSI-CDI-EFF-IDT-NUM-N.
           MOVE +00000                 TO WCDSI-POL-PAYO-NUM.
           MOVE +000                   TO WCDSI-CDI-ALLOC-NUM.
           
           MOVE RPOL-POL-ID            TO WCDSI-ENDBR-POL-ID.
           MOVE +0000000               TO WCDSI-ENDBR-CDI-EFF-IDT-NUM-N.
           MOVE +99999                 TO WCDSI-ENDBR-POL-PAYO-NUM.
           MOVE +999                   TO WCDSI-ENDBR-CDI-ALLOC-NUM.
           
           PERFORM  CDSI-1000-BROWSE
               THRU CDSI-1000-BROWSE-X.
       
           MOVE 0                       TO WS-POL-CDSI-CTR.
           SET  WS-CDSI-ERROR-NO        TO TRUE.
           PERFORM  4700-READ-CDSI-LOOP
               THRU 4700-READ-CDSI-LOOP-X
              UNTIL WCDSI-IO-EOF
                 OR NOT WCDSI-IO-OK.
                 
           PERFORM CDSI-3000-END-BROWSE
              THRU CDSI-3000-END-BROWSE-X.
           
      *
      * IF CDSI ERRORS, DELETE & RE-CREATE THE RECORDS.
      *
           
           IF  WS-CDSI-ERROR
           OR  WS-POL-CDSI-CTR > 2
               PERFORM  4800-FIX-CDSI-RECS
                   THRU 4800-FIX-CDSI-RECS-X
               SET WS-POL-ERROR             TO TRUE
           END-IF.
                                       
       4600-READ-CDSI-REC-X.
           EXIT.
      /
      *---------------------
       4700-READ-CDSI-LOOP.
      *---------------------

           PERFORM  CDSI-2000-READ-NEXT
               THRU CDSI-2000-READ-NEXT-X.
           
           IF  NOT WCDSI-IO-OK
               GO TO 4700-READ-CDSI-LOOP-X
           END-IF.

           ADD 1                        TO WS-CDSI-RECS-READ-CTR.
           
      * CHECK THAT THE ALLOCATION NUMBER IS NOT 000. 
           
           IF  RCDSI-CDI-ALLOC-NUM = +000
               SET  WS-CDSI-ERROR       TO TRUE
               GO TO 4700-READ-CDSI-LOOP-X
           END-IF.
      
      * CHECK THAT CDSI KEY EFFECTIVE DATE MATCHES POLICY ISSUE DATE.
           
           MOVE RCDSI-CDI-EFF-IDT-NUM   TO L1660-INVERTED-DATE.
           PERFORM  1660-3000-CONVERT-INV-TO-INT
               THRU 1660-3000-CONVERT-INV-TO-INT-X
           
           IF  L1660-INTERNAL-DATE NOT = RPOL-POL-ISS-EFF-DT
               SET  WS-CDSI-ERROR       TO TRUE
               GO TO 4700-READ-CDSI-LOOP-X
           END-IF.

      * CHECK IF UPDATE NEEDED.
           IF  RCDSI-CDI-EFF-DT    NOT = RPOL-POL-ISS-EFF-DT
               
               PERFORM  7100-MOVE-CDSI-TO-WS
                   THRU 7100-MOVE-CDSI-TO-WS-X
      
      *    PRINT LINE FOR THE ORIGINAL RECORD.
               MOVE SPACES              TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X

               MOVE SPACES              TO L0040-INPUT-LINE
               SET WS-CSDI-PRINT-TYP-ORIGINAL TO TRUE
               MOVE WS-CDSI-PRINT-LINE  TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               
               MOVE RCDSI-KEY           TO WCDSI-KEY
               PERFORM  CDSI-1000-READ-FOR-UPDATE
                   THRU CDSI-1000-READ-FOR-UPDATE-X
               
               MOVE RPOL-POL-ISS-EFF-DT TO RCDSI-CDI-EFF-DT
               PERFORM  CDSI-2000-REWRITE
                   THRU CDSI-2000-REWRITE-X
               
               PERFORM  7100-MOVE-CDSI-TO-WS
                   THRU 7100-MOVE-CDSI-TO-WS-X
               
      
      *    PRINT LINE FOR THE UPDATED RECORD.
               MOVE SPACES              TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X

               MOVE SPACES              TO L0040-INPUT-LINE
               SET WS-CSDI-PRINT-TYP-UPDATED TO TRUE
               MOVE WS-CDSI-PRINT-LINE  TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               
               SET WS-POL-ERROR             TO TRUE
               
               ADD 1                    TO WS-CDSI-RECORD-UPDT-CTR
           END-IF.
       
       4700-READ-CDSI-LOOP-X.
           EXIT.
      /
      *---------------------
       4800-FIX-CDSI-RECS.
      *---------------------

      * DELETE OLD CDSI RECORDS
      
           MOVE LOW-VALUES             TO WCDSI-KEY.
           MOVE HIGH-VALUES            TO WCDSI-ENDBR-KEY.
           
           MOVE RPOL-POL-ID            TO WCDSI-POL-ID.
           MOVE +9999999               TO WCDSI-CDI-EFF-IDT-NUM-N.
           MOVE +00000                 TO WCDSI-POL-PAYO-NUM.
           MOVE +000                   TO WCDSI-CDI-ALLOC-NUM.
           
           MOVE RPOL-POL-ID            TO WCDSI-ENDBR-POL-ID.
           MOVE +0000000               TO WCDSI-ENDBR-CDI-EFF-IDT-NUM-N.
           MOVE +99999                 TO WCDSI-ENDBR-POL-PAYO-NUM.
           MOVE +999                   TO WCDSI-ENDBR-CDI-ALLOC-NUM.
                                        
           PERFORM  CDSI-1000-BROWSE
               THRU CDSI-1000-BROWSE-X.
          
           PERFORM  4900-DELETE-CDSI-RECS
               THRU 4900-DELETE-CDSI-RECS-X
              UNTIL WCDSI-IO-EOF
                 OR NOT WCDSI-IO-OK.
           
           PERFORM CDSI-3000-END-BROWSE
              THRU CDSI-3000-END-BROWSE-X.
               

      * CREATE NEW CDSI RECORDS.    

      * CALCULATE CORRECT EFFECTIVE DATE
      
           MOVE RPOL-POL-ISS-EFF-DT     TO L1660-INTERNAL-DATE.
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.

      * CREATE INITIAL DEPOSIT CDSI RECORD
      * ----------------------------------
           PERFORM  CDSI-1000-CREATE
               THRU CDSI-1000-CREATE-X.
           
           MOVE RPOL-POL-ID             TO RCDSI-POL-ID.                    
           MOVE 'I'                     TO RCDSI-CDI-TYP-CD.                    
           MOVE 0                       TO RCDSI-POL-PAYO-NUM.                  
  
           MOVE L1660-INVERTED-DATE     TO RCDSI-CDI-EFF-IDT-NUM-N.
           MOVE 001                     TO RCDSI-CDI-ALLOC-NUM.                 
   
           MOVE RPOL-POL-ISS-EFF-DT     TO RCDSI-CDI-EFF-DT.
           MOVE 'P'                     TO RCDSI-CDI-ALLOC-CD.
           MOVE 100                     TO RCDSI-CDI-ALLOC-PCT.
           MOVE 01                      TO RCDSI-DEST-CVG-NUM.
           MOVE RCDSI-KEY               TO WCDSI-KEY.
           
           PERFORM  CDSI-1000-WRITE
               THRU CDSI-1000-WRITE-X.
           
           PERFORM  7100-MOVE-CDSI-TO-WS
               THRU 7100-MOVE-CDSI-TO-WS-X.
               
           ADD 1                        TO WS-CDSI-RECS-ADDED-CTR.
           
      *    PRINT LINE FOR THE ADDED RECORD
           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           SET  WS-CDSI-PRINT-TYP-ADD   TO TRUE.
           MOVE WS-CDSI-PRINT-LINE      TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
       
      * CREATE SUBSEQUENT DEPOSIT CDSI RECORD
      * -------------------------------------
           MOVE RPOL-POL-ID             TO RCDSI-POL-ID.                    
           MOVE 'S'                     TO RCDSI-CDI-TYP-CD.                    
           MOVE 0                       TO RCDSI-POL-PAYO-NUM.                  
  
           MOVE L1660-INVERTED-DATE     TO RCDSI-CDI-EFF-IDT-NUM-N.
           MOVE 001                     TO RCDSI-CDI-ALLOC-NUM.                 
   
           MOVE RPOL-POL-ISS-EFF-DT     TO RCDSI-CDI-EFF-DT.
           MOVE 'P'                     TO RCDSI-CDI-ALLOC-CD.
           MOVE 100                     TO RCDSI-CDI-ALLOC-PCT.
           MOVE 01                      TO RCDSI-DEST-CVG-NUM.
           MOVE RCDSI-KEY               TO WCDSI-KEY.
                      
           PERFORM  CDSI-1000-WRITE
               THRU CDSI-1000-WRITE-X.
           
           PERFORM  7100-MOVE-CDSI-TO-WS
               THRU 7100-MOVE-CDSI-TO-WS-X.
           
           ADD 1                        TO WS-CDSI-RECS-ADDED-CTR.
           
      *    PRINT LINE FOR THE ADDED RECORD
           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           SET  WS-CDSI-PRINT-TYP-ADD   TO TRUE.
           MOVE WS-CDSI-PRINT-LINE      TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
       
       4800-FIX-CDSI-RECS-X.
           EXIT.
      /
      *----------------------
       4900-DELETE-CDSI-RECS.
      *----------------------

      * DELETE OLD CDSI RECORDS
      
           
           PERFORM  CDSI-2000-READ-NEXT
               THRU CDSI-2000-READ-NEXT-X.
           
           IF  NOT WCDSI-IO-OK
               GO TO 4900-DELETE-CDSI-RECS-X
           END-IF.

           PERFORM  7100-MOVE-CDSI-TO-WS
               THRU 7100-MOVE-CDSI-TO-WS-X.
           
           MOVE RCDSI-KEY               TO WCDSI-KEY
           PERFORM  CDSI-1000-READ-FOR-UPDATE
               THRU CDSI-1000-READ-FOR-UPDATE-X
           PERFORM  CDSI-1000-DELETE
               THRU CDSI-1000-DELETE-X

           ADD 1                        TO WS-CDSI-RECS-DELETED-CTR.
           
      *    PRINT LINE FOR THE DELETED RECORD
           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           SET  WS-CDSI-PRINT-TYP-DELETE TO TRUE.
           MOVE WS-CDSI-PRINT-LINE      TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
       
       4900-DELETE-CDSI-RECS-X.
           EXIT.
      /
MFFALL*----------------------------
MFFALL 5000-PROCESS-CAIN-CDSI-RECS.
MFFALL*----------------------------
MFFALL 
MFFALL     PERFORM  5100-UPDATE-CAIN-CDSI-RECS
MFFALL         THRU 5100-UPDATE-CAIN-CDSI-RECS-X.
MFFALL
MFFALL     IF  RPOL-POL-LUMP-SUM-AMT > ZERO
MFFALL         SET WS-HOLD-CDI-TYP-INIT-LMPSM TO TRUE
MFFALL         PERFORM  5200-CREATE-CAIN-CDSI-RECS
MFFALL             THRU 5200-CREATE-CAIN-CDSI-RECS-X
MFFALL     END-IF.
MFFALL     
MFFALL     IF  RPOL-POL-CNVR-TYP-DHY-PHASE1
MFFALL         SET WS-HOLD-CDI-TYP-CNVR-FND TO TRUE
MFFALL         PERFORM  5200-CREATE-CAIN-CDSI-RECS
MFFALL             THRU 5200-CREATE-CAIN-CDSI-RECS-X
MFFALL     END-IF.
MFFALL
MFFALL 5000-PROCESS-CAIN-CDSI-RECS-X.
MFFALL     EXIT.
      /
MFFALL*----------------------------
MFFALL 5100-UPDATE-CAIN-CDSI-RECS.
MFFALL*----------------------------
MFFALL
MFFALL     MOVE LOW-VALUES              TO WCAIN-KEY.
MFFALL     MOVE HIGH-VALUES             TO WCAIN-ENDBR-KEY.
MFFALL           
MFFALL     MOVE RPOL-POL-ID             TO WCAIN-POL-ID.
MFFALL     MOVE +9999999                TO WCAIN-CDI-EFF-IDT-NUM-N.
MFFALL     MOVE +00000                  TO WCAIN-POL-PAYO-NUM.
MFFALL           
MFFALL     MOVE RPOL-POL-ID             TO WCAIN-ENDBR-POL-ID.
MFFALL     MOVE +0000000                TO WCAIN-ENDBR-CDI-EFF-IDT-NUM.
MFFALL     MOVE +99999                  TO WCAIN-ENDBR-POL-PAYO-NUM.
MFFALL           
MFFALL     PERFORM  CAIN-1000-BROWSE
MFFALL         THRU CAIN-1000-BROWSE-X.
MFFALL
MFFALL     IF  NOT WCAIN-IO-OK
MFFALL*MSG NO EXISTING CAIN RECORD FOR POLICY (@1)
MFFALL         MOVE 'ZSPALC0002'   TO WGLOB-MSG-REF-INFO
MFFALL         MOVE RPOL-POL-ID    TO WGLOB-MSG-PARM (1)
MFFALL         PERFORM  0260-1000-GENERATE-MESSAGE
MFFALL             THRU 0260-1000-GENERATE-MESSAGE-X
MFFALL         ADD 1               TO WS-CAIN-ERROR-CTR
MFFALL         GO TO 5100-UPDATE-CAIN-CDSI-RECS-X
MFFALL     END-IF.
MFFALL
MFFALL     PERFORM  5110-UPDATE-PRINT-CAIN
MFFALL         THRU 5110-UPDATE-PRINT-CAIN-X
MFFALL         UNTIL  WCAIN-IO-EOF
MFFALL         OR NOT WCAIN-IO-OK.
MFFALL 
MFFALL     PERFORM  CAIN-3000-END-BROWSE
MFFALL         THRU CAIN-3000-END-BROWSE-X.
MFFALL               
MFFALL 5100-UPDATE-CAIN-CDSI-RECS-X.
MFFALL     EXIT.
      /
MFFALL*-----------------------
MFFALL 5110-UPDATE-PRINT-CAIN.
MFFALL*-----------------------
MFFALL
MFFALL     PERFORM  CAIN-2000-READ-NEXT
MFFALL         THRU CAIN-2000-READ-NEXT-X.
MFFALL           
MFFALL     IF  NOT WCAIN-IO-OK
MFFALL         GO TO 5110-UPDATE-PRINT-CAIN-X
MFFALL     END-IF.
MFFALL
MFFALL     IF  RCAIN-CDI-TYP-INIT-LMPSM
MFFALL     OR  RCAIN-CDI-TYP-SUBSEQ-LMPSM
MFFALL     OR  RCAIN-CDI-TYP-CNVR-FND
MFFALL         GO TO 5110-UPDATE-PRINT-CAIN-X
MFFALL     END-IF.
MFFALL
MFFALL     ADD 1                        TO WS-CAIN-RECS-READ-CTR.
MFFALL
MFFALL* CHECK IF UPDATE NEEDED.
MFFALL               
MFFALL     PERFORM  7000-MOVE-CAIN-TO-WS
MFFALL         THRU 7000-MOVE-CAIN-TO-WS-X.
MFFALL
MFFALL* PRINT LINE FOR THE ORIGINAL RECORD.
MFFALL     MOVE SPACES              TO L0040-INPUT-LINE.
MFFALL     PERFORM  0040-3000-WRITE-OTHER
MFFALL         THRU 0040-3000-WRITE-OTHER-X.
MFFALL
MFFALL     MOVE SPACES              TO L0040-INPUT-LINE.
MFFALL     SET WS-CAIN-PRINT-TYP-ORIGINAL TO TRUE.
MFFALL     MOVE WS-CAIN-PRINT-LINE  TO L0040-INPUT-LINE.
MFFALL     PERFORM  0040-3000-WRITE-OTHER
MFFALL         THRU 0040-3000-WRITE-OTHER-X.
MFFALL
MFFALL     MOVE RCAIN-KEY           TO WCAIN-KEY.
MFFALL     PERFORM  CAIN-1000-READ-FOR-UPDATE
MFFALL         THRU CAIN-1000-READ-FOR-UPDATE-X.
MFFALL
MFFALL     IF  NOT WCAIN-IO-OK
MFFALL         GO TO 5110-UPDATE-PRINT-CAIN-X
MFFALL     END-IF.
MFFALL               
MFFALL     MOVE RPOL-POL-SNDRY-AMT  TO RCAIN-CDI-TOT-ALLOC-AMT.
MFFALL
MFFALL     PERFORM  CAIN-2000-REWRITE
MFFALL         THRU CAIN-2000-REWRITE-X.
MFFALL
MFFALL     IF  NOT WCAIN-IO-OK
MFFALL*MSG PROBLEM OCCURRED WHEN UPDATING CAIN RECORD FOR POLICY (@1)
MFFALL         MOVE 'ZSPALC0005'   TO WGLOB-MSG-REF-INFO
MFFALL         MOVE RPOL-POL-ID    TO WGLOB-MSG-PARM (1)
MFFALL         PERFORM  0260-1000-GENERATE-MESSAGE
MFFALL             THRU 0260-1000-GENERATE-MESSAGE-X
MFFALL         ADD 1               TO WS-CAIN-ERROR-CTR
MFFALL         GO TO 5110-UPDATE-PRINT-CAIN-X
MFFALL     END-IF.
MFFALL               
MFFALL     PERFORM  7000-MOVE-CAIN-TO-WS
MFFALL         THRU 7000-MOVE-CAIN-TO-WS-X.
MFFALL               
MFFALL* PRINT LINE FOR THE UPDATED RECORD.
MFFALL
MFFALL     MOVE SPACES              TO L0040-INPUT-LINE.
MFFALL     PERFORM  0040-3000-WRITE-OTHER
MFFALL         THRU 0040-3000-WRITE-OTHER-X.
MFFALL
MFFALL     MOVE SPACES              TO L0040-INPUT-LINE.
MFFALL     SET WS-CAIN-PRINT-TYP-UPDATED TO TRUE.
MFFALL     MOVE WS-CAIN-PRINT-LINE  TO L0040-INPUT-LINE.
MFFALL     PERFORM  0040-3000-WRITE-OTHER
MFFALL         THRU 0040-3000-WRITE-OTHER-X.
MFFALL               
MFFALL     ADD 1                    TO WS-CAIN-RECORD-UPDT-CTR.
MFFALL
MFFALL     PERFORM  5130-READ-CDSI-REC
MFFALL         THRU 5130-READ-CDSI-REC-X.
MFFALL
MFFALL 5110-UPDATE-PRINT-CAIN-X.
MFFALL     EXIT.
      /
MFFALL*-------------------
MFFALL 5130-READ-CDSI-REC.
MFFALL*-------------------
MFFALL
MFFALL     MOVE WCAIN-KEY               TO WCDSI-KEY.
MFFALL     MOVE ZERO                    TO WCDSI-CDI-ALLOC-NUM.
MFFALL     MOVE WCDSI-KEY               TO WCDSI-ENDBR-KEY.
MFFALL     MOVE +999                    TO WCDSI-ENDBR-CDI-ALLOC-NUM.
MFFALL
MFFALL     PERFORM  CDSI-1000-BROWSE
MFFALL         THRU CDSI-1000-BROWSE-X.
MFFALL       
MFFALL     IF  NOT WCDSI-IO-OK
MFFALL*MSG NO EXISTING CDSI RECORD FOR POLICY (@1)
MFFALL         MOVE 'ZSPALC0006'   TO WGLOB-MSG-REF-INFO
MFFALL         MOVE RPOL-POL-ID    TO WGLOB-MSG-PARM (1)
MFFALL         PERFORM  0260-1000-GENERATE-MESSAGE
MFFALL             THRU 0260-1000-GENERATE-MESSAGE-X
MFFALL         ADD 1               TO WS-CDSI-ERROR-CTR
MFFALL         GO TO 5130-READ-CDSI-REC-X
MFFALL     END-IF.
MFFALL
MFFALL     PERFORM  5135-UPDATE-PRINT-CDSI
MFFALL         THRU 5135-UPDATE-PRINT-CDSI-X
MFFALL         UNTIL WCDSI-IO-EOF
MFFALL         OR NOT WCDSI-IO-OK.
MFFALL                 
MFFALL     PERFORM  CDSI-3000-END-BROWSE
MFFALL         THRU CDSI-3000-END-BROWSE-X.
MFFALL 
MFFALL 5130-READ-CDSI-REC-X.
MFFALL     EXIT.
      /
MFFALL*-----------------------
MFFALL 5135-UPDATE-PRINT-CDSI.
MFFALL*-----------------------
MFFALL
MFFALL     PERFORM  CDSI-2000-READ-NEXT
MFFALL         THRU CDSI-2000-READ-NEXT-X.
MFFALL           
MFFALL     IF  NOT WCDSI-IO-OK
MFFALL         GO TO 5135-UPDATE-PRINT-CDSI-X
MFFALL     END-IF.
MFFALL
MFFALL     ADD 1                        TO WS-CDSI-RECS-READ-CTR.
MFFALL
MFFALL     PERFORM  7100-MOVE-CDSI-TO-WS
MFFALL         THRU 7100-MOVE-CDSI-TO-WS-X.
MFFALL      
MFFALL*    PRINT LINE FOR THE ORIGINAL RECORD.
MFFALL
MFFALL     MOVE SPACES              TO L0040-INPUT-LINE.
MFFALL     PERFORM  0040-3000-WRITE-OTHER
MFFALL         THRU 0040-3000-WRITE-OTHER-X.
MFFALL
MFFALL     MOVE SPACES              TO L0040-INPUT-LINE.
MFFALL     SET WS-CSDI-PRINT-TYP-ORIGINAL TO TRUE.
MFFALL     MOVE WS-CDSI-PRINT-LINE  TO L0040-INPUT-LINE.
MFFALL     PERFORM  0040-3000-WRITE-OTHER
MFFALL         THRU 0040-3000-WRITE-OTHER-X.
MFFALL               
MFFALL     MOVE RCDSI-KEY           TO WCDSI-KEY.
MFFALL     PERFORM  CDSI-1000-READ-FOR-UPDATE
MFFALL         THRU CDSI-1000-READ-FOR-UPDATE-X.
MFFALL
MFFALL     IF  NOT WCDSI-IO-OK
MFFALL         GO TO 5135-UPDATE-PRINT-CDSI-X
MFFALL     END-IF.
MFFALL               
MFFALL     MOVE RPOL-POL-ISS-EFF-DT TO RCDSI-CDI-EFF-DT.
MFFALL     MOVE RPOL-POL-SNDRY-AMT  TO RCDSI-CDI-CVG-ALLOC-AMT.
MFFALL     MOVE RPOL-POL-SNDRY-AMT  TO RCDSI-CDI-ALLOC-AMT.
MFFALL     MOVE 'A'                 TO RCDSI-CDI-ALLOC-CD.
MFFALL               
MFFALL     IF  RCDSI-CDI-ALLOC-PCT NOT = +100
MFFALL         MOVE +100            TO RCDSI-CDI-ALLOC-PCT
MFFALL     END-IF.
MFFALL
MFFALL     PERFORM  CDSI-2000-REWRITE
MFFALL         THRU CDSI-2000-REWRITE-X.
MFFALL
MFFALL     IF  NOT WCDSI-IO-OK
MFFALL*MSG PROBLEM OCCURRED WHEN UPDATING CDSI RECORD FOR POLICY (@1)
MFFALL         MOVE 'ZSPALC0009'   TO WGLOB-MSG-REF-INFO
MFFALL         MOVE RPOL-POL-ID    TO WGLOB-MSG-PARM (1)
MFFALL         PERFORM  0260-1000-GENERATE-MESSAGE
MFFALL             THRU 0260-1000-GENERATE-MESSAGE-X
MFFALL         ADD 1               TO WS-CDSI-ERROR-CTR
MFFALL         GO TO 5135-UPDATE-PRINT-CDSI-X
MFFALL     END-IF.
MFFALL               
MFFALL     PERFORM  7100-MOVE-CDSI-TO-WS
MFFALL         THRU 7100-MOVE-CDSI-TO-WS-X.
MFFALL      
MFFALL*    PRINT LINE FOR THE UPDATED RECORD.
MFFALL
MFFALL     MOVE SPACES              TO L0040-INPUT-LINE.
MFFALL     PERFORM  0040-3000-WRITE-OTHER
MFFALL         THRU 0040-3000-WRITE-OTHER-X.
MFFALL
MFFALL     MOVE SPACES              TO L0040-INPUT-LINE.
MFFALL     SET WS-CSDI-PRINT-TYP-UPDATED TO TRUE.
MFFALL     MOVE WS-CDSI-PRINT-LINE  TO L0040-INPUT-LINE.
MFFALL     PERFORM  0040-3000-WRITE-OTHER
MFFALL         THRU 0040-3000-WRITE-OTHER-X.
MFFALL               
MFFALL     ADD 1                    TO WS-CDSI-RECORD-UPDT-CTR.
MFFALL
MFFALL 5135-UPDATE-PRINT-CDSI-X.
MFFALL     EXIT.
      /
MFFALL*---------------------------
MFFALL 5200-CREATE-CAIN-CDSI-RECS.
MFFALL*---------------------------
MFFALL
MFFALL* CHECK IF CAIN RECORD FOR DHY EXSITS
MFFALL
MFFALL     MOVE RPOL-POL-ID             TO WCAIN-POL-ID.                  
MFFALL     MOVE WS-HOLD-CDI-TYP-CD      TO WCAIN-CDI-TYP-CD.     
MFFALL     MOVE +00000                  TO WCAIN-POL-PAYO-NUM.            
MFFALL     MOVE RPOL-POL-ISS-EFF-DT     TO L1660-INTERNAL-DATE.
MFFALL     PERFORM  1660-2000-CONVERT-INT-TO-INV
MFFALL         THRU 1660-2000-CONVERT-INT-TO-INV-X.
MFFALL     MOVE L1660-INVERTED-DATE     TO WCAIN-CDI-EFF-IDT-NUM-N.
MFFALL           
MFFALL     PERFORM  CAIN-1000-READ
MFFALL         THRU CAIN-1000-READ-X.
MFFALL
MFFALL     IF  WCAIN-IO-OK
MFFALL         IF  WS-HOLD-CDI-TYP-INIT-LMPSM
MFFALL*MSG CAIN RECORD FOR LUMP SUM ALREADY EXITS FOR POLICY (@1)
MFFALL             MOVE 'ZSPALC0010'   TO WGLOB-MSG-REF-INFO
MFFALL         END-IF
MFFALL         IF  WS-HOLD-CDI-TYP-CNVR-FND
MFFALL*MSG CAIN RECORD FOR DHY ALREADY EXITS FOR POLICY (@1)
MFFALL             MOVE 'ZSPALC0004'   TO WGLOB-MSG-REF-INFO
MFFALL         END-IF
MFFALL         MOVE RPOL-POL-ID    TO WGLOB-MSG-PARM (1)
MFFALL         PERFORM  0260-1000-GENERATE-MESSAGE
MFFALL             THRU 0260-1000-GENERATE-MESSAGE-X
MFFALL         ADD 1               TO WS-CAIN-ERROR-CTR
MFFALL         GO TO 5200-CREATE-CAIN-CDSI-RECS-X
MFFALL     END-IF.
MFFALL
MFFALL* CREATE CAIN RECORD
MFFALL
MFFALL     PERFORM  CAIN-1000-CREATE
MFFALL         THRU CAIN-1000-CREATE-X.
MFFALL
MFFALL     IF  WS-HOLD-CDI-TYP-INIT-LMPSM
MFFALL         MOVE RPOL-POL-LUMP-SUM-AMT
MFFALL                                  TO RCAIN-CDI-TOT-ALLOC-AMT
MFFALL     END-IF.
MFFALL
MFFALL     IF  WS-HOLD-CDI-TYP-CNVR-FND
MFFALL         PERFORM  5300-GET-CNVR-FND-AMT
MFFALL             THRU 5300-GET-CNVR-FND-AMT-X
MFFALL
MFFALL         IF  WS-POL-ERROR
MFFALL             ADD 1               TO WS-CAIN-ERROR-CTR
MFFALL             GO TO 5200-CREATE-CAIN-CDSI-RECS-X
MFFALL         END-IF
MFFALL
MFFALL         IF  WS-TOT-POLX-AMT <= ZEROS
MFFALL*MSG NO CONVERSION FUND FOR POLICY (@1)
MFFALL             MOVE 'ZSPALC0001'   TO WGLOB-MSG-REF-INFO
MFFALL             MOVE RPOL-POL-ID    TO WGLOB-MSG-PARM (1)
MFFALL             PERFORM  0260-1000-GENERATE-MESSAGE
MFFALL                 THRU 0260-1000-GENERATE-MESSAGE-X
MFFALL             ADD 1               TO WS-CAIN-ERROR-CTR
MFFALL             GO TO 5200-CREATE-CAIN-CDSI-RECS-X
MFFALL         END-IF   
MFFALL
MFFALL         MOVE WS-TOT-POLX-AMT TO RCAIN-CDI-TOT-ALLOC-AMT
MFFALL                  
MFFALL     END-IF.
MFFALL
MFFALL     MOVE 'C'                     TO RCAIN-CDI-STAT-CD.
MFFALL
MFFALL     PERFORM  CAIN-1000-WRITE
MFFALL         THRU CAIN-1000-WRITE-X.
MFFALL
MFFALL     IF  NOT WCAIN-IO-OK
MFFALL*MSG PROBLEM OCCURRED WHEN WRITING CAIN RECORD FOR POLICY (@1)
MFFALL         MOVE 'ZSPALC0003'   TO WGLOB-MSG-REF-INFO
MFFALL         MOVE RPOL-POL-ID    TO WGLOB-MSG-PARM (1)
MFFALL         PERFORM  0260-1000-GENERATE-MESSAGE
MFFALL             THRU 0260-1000-GENERATE-MESSAGE-X
MFFALL         ADD 1               TO WS-CAIN-ERROR-CTR
MFFALL         GO TO 5200-CREATE-CAIN-CDSI-RECS-X
MFFALL     END-IF.
MFFALL        
MFFALL     PERFORM  7000-MOVE-CAIN-TO-WS
MFFALL         THRU 7000-MOVE-CAIN-TO-WS-X.
MFFALL
MFFALL     ADD 1                        TO WS-CAIN-RECS-ADDED-CTR.
MFFALL
MFFALL     PERFORM  5210-PRINT-CAIN-ADD-LINE
MFFALL         THRU 5210-PRINT-CAIN-ADD-LINE-X.
MFFALL
MFFALL* CHECK IF CDSI RECORD FOR DHY EXSITS
MFFALL
MFFALL     MOVE WCAIN-KEY               TO WCDSI-KEY.
MFFALL     MOVE +001                    TO WCDSI-CDI-ALLOC-NUM.
MFFALL           
MFFALL     PERFORM  CDSI-1000-READ
MFFALL         THRU CDSI-1000-READ-X.
MFFALL
MFFALL     IF  WCDSI-IO-OK
MFFALL         IF  WS-HOLD-CDI-TYP-INIT-LMPSM
MFFALL*MSG CDSI RECORD FOR LUMP SUM ALREADY EXITS FOR POLICY (@1)
MFFALL             MOVE 'ZSPALC0011'   TO WGLOB-MSG-REF-INFO
MFFALL         END-IF
MFFALL         IF  WS-HOLD-CDI-TYP-CNVR-FND
MFFALL*MSG CDSI RECORD FOR DHY ALREADY EXITS FOR POLICY (@1)
MFFALL             MOVE 'ZSPALC0008'   TO WGLOB-MSG-REF-INFO
MFFALL         END-IF
MFFALL         MOVE RPOL-POL-ID    TO WGLOB-MSG-PARM (1)
MFFALL         PERFORM  0260-1000-GENERATE-MESSAGE
MFFALL             THRU 0260-1000-GENERATE-MESSAGE-X
MFFALL         ADD 1               TO WS-CDSI-ERROR-CTR
MFFALL         GO TO 5200-CREATE-CAIN-CDSI-RECS-X
MFFALL     END-IF.
MFFALL
MFFALL     PERFORM  CDSI-1000-CREATE
MFFALL         THRU CDSI-1000-CREATE-X.
MFFALL
MFFALL     MOVE RCAIN-CDI-TOT-ALLOC-AMT TO RCDSI-CDI-CVG-ALLOC-AMT.
MFFALL     MOVE 'A'                     TO RCDSI-CDI-ALLOC-CD.
MFFALL     MOVE RCAIN-CDI-TOT-ALLOC-AMT TO RCDSI-CDI-ALLOC-AMT.
MFFALL     MOVE +100                    TO RCDSI-CDI-ALLOC-PCT.
MFFALL     MOVE RPOL-POL-ISS-EFF-DT     TO RCDSI-CDI-EFF-DT.
MFFALL     MOVE '01'                    TO RCDSI-DEST-CVG-NUM.
MFFALL
MFFALL     PERFORM  CDSI-1000-WRITE
MFFALL         THRU CDSI-1000-WRITE-X.
MFFALL
MFFALL     IF  NOT WCDSI-IO-OK
MFFALL*MSG PROBLEM OCCURRED WHEN WRITING CDSI RECORD FOR POLICY (@1)
MFFALL         MOVE 'ZSPALC0007'   TO WGLOB-MSG-REF-INFO
MFFALL         MOVE RPOL-POL-ID    TO WGLOB-MSG-PARM (1)
MFFALL         PERFORM  0260-1000-GENERATE-MESSAGE
MFFALL             THRU 0260-1000-GENERATE-MESSAGE-X
MFFALL         ADD 1               TO WS-CDSI-ERROR-CTR
MFFALL         GO TO 5200-CREATE-CAIN-CDSI-RECS-X
MFFALL     END-IF.
MFFALL
MFFALL     PERFORM  7100-MOVE-CDSI-TO-WS
MFFALL         THRU 7100-MOVE-CDSI-TO-WS-X.
MFFALL               
MFFALL     ADD 1                        TO WS-CDSI-RECS-ADDED-CTR.
MFFALL
MFFALL     PERFORM  5220-PRINT-CDSI-ADD-LINE
MFFALL         THRU 5220-PRINT-CDSI-ADD-LINE-X.
MFFALL
MFFALL 5200-CREATE-CAIN-CDSI-RECS-X.
MFFALL     EXIT.
      /
MFFALL*-------------------------
MFFALL 5210-PRINT-CAIN-ADD-LINE.
MFFALL*-------------------------
MFFALL
MFFALL*    PRINT LINE FOR THE ADDED RECORD
MFFALL
MFFALL     MOVE SPACES                  TO L0040-INPUT-LINE.
MFFALL     PERFORM  0040-3000-WRITE-OTHER
MFFALL         THRU 0040-3000-WRITE-OTHER-X.
MFFALL
MFFALL     MOVE SPACES                  TO L0040-INPUT-LINE.
MFFALL     SET  WS-CAIN-PRINT-TYP-ADD   TO TRUE.
MFFALL     MOVE WS-CAIN-PRINT-LINE      TO L0040-INPUT-LINE.
MFFALL     PERFORM  0040-3000-WRITE-OTHER
MFFALL         THRU 0040-3000-WRITE-OTHER-X.
MFFALL
MFFALL 5210-PRINT-CAIN-ADD-LINE-X.
MFFALL     EXIT.
      /
MFFALL*-------------------------
MFFALL 5220-PRINT-CDSI-ADD-LINE.
MFFALL*-------------------------
MFFALL
MFFALL*    PRINT LINE FOR THE ADDED RECORD
MFFALL
MFFALL     MOVE SPACES                  TO L0040-INPUT-LINE.
MFFALL     PERFORM  0040-3000-WRITE-OTHER
MFFALL         THRU 0040-3000-WRITE-OTHER-X.
MFFALL
MFFALL     MOVE SPACES                  TO L0040-INPUT-LINE.
MFFALL     SET  WS-CDSI-PRINT-TYP-ADD   TO TRUE.
MFFALL     MOVE WS-CDSI-PRINT-LINE      TO L0040-INPUT-LINE.
MFFALL     PERFORM  0040-3000-WRITE-OTHER
MFFALL         THRU 0040-3000-WRITE-OTHER-X.
MFFALL
MFFALL 5220-PRINT-CDSI-ADD-LINE-X.
MFFALL     EXIT.
      /
MFFALL*----------------------
MFFALL 5300-GET-CNVR-FND-AMT.
MFFALL*----------------------
MFFALL
MFFALL* CALCULATE CONVERSION FUND
MFFALL
MFFALL     MOVE ZERO                      TO WS-TOT-POLX-AMT.
MFFALL
MFFALL     PERFORM  9806-1000-BUILD-PARM-INFO
MFFALL         THRU 9806-1000-BUILD-PARM-INFO-X.
MFFALL
MFFALL     MOVE RPOL-POL-BASE-CVG-NUM     TO L9806-CVG-NUM.
MFFALL
MFFALL     PERFORM  9806-1000-FLEXFUND-CALC
MFFALL         THRU 9806-1000-FLEXFUND-CALC-X.
MFFALL
MFFALL     IF  L9806-RETRN-OK
MFFALL         COMPUTE WS-TOT-POLX-AMT
MFFALL                = L9806-ESC-SPREM-AMT
MFFALL                + L9806-ESC-RSRV-AMT
MFFALL     ELSE
MFFALL         SET WS-POL-ERROR            TO TRUE
MFFALL     END-IF.
MFFALL 
MFFALL 5300-GET-CNVR-FND-AMT-X.
MFFALL     EXIT.
      /
      *--------------------- 
       7000-MOVE-CAIN-TO-WS.
      *--------------------- 
           MOVE SPACES                  TO WS-CAIN-PRINT-LINE.
           MOVE RCAIN-CO-ID             TO WS-CAIN-CO-ID.
           MOVE RCAIN-POL-ID            TO WS-CAIN-POL-ID.
           MOVE RCAIN-CDI-TYP-CD        TO WS-CAIN-CDI-TYP-CD.
           MOVE RCAIN-POL-PAYO-NUM      TO WS-CAIN-POL-PAYO-NUM.
           MOVE RCAIN-CDI-EFF-IDT-NUM   TO WS-CAIN-CDI-EFF-IDT-NUM.
           MOVE RCAIN-PREV-UPDT-USER-ID TO WS-CAIN-PREV-UPDT-USER-ID.
           MOVE RCAIN-PREV-UPDT-DT      TO WS-CAIN-PREV-UPDT-DT.
           MOVE RCAIN-CDI-STAT-CD       TO WS-CAIN-CDI-STAT-CD.
MFFALL     MOVE RCAIN-CDI-TOT-ALLOC-AMT TO WS-CAIN-CDI-TOT-ALLOC-AMT.
           
       7000-MOVE-CAIN-TO-WS-X.
           EXIT.

      /
      *--------------------- 
       7100-MOVE-CDSI-TO-WS.
      *--------------------- 
           
           MOVE SPACES                  TO WS-CDSI-PRINT-LINE.
           MOVE RCDSI-CO-ID             TO WS-CDSI-CO-ID.
           MOVE RCDSI-POL-ID            TO WS-CDSI-POL-ID.
           MOVE RCDSI-CDI-TYP-CD        TO WS-CDSI-CDI-TYP-CD.
           MOVE RCDSI-POL-PAYO-NUM      TO WS-CDSI-POL-PAYO-NUM.
           MOVE RCDSI-CDI-EFF-IDT-NUM   TO WS-CDSI-CDI-EFF-IDT-NUM.
           MOVE RCDSI-CDI-ALLOC-NUM     TO WS-CDSI-CDI-ALLOC-NUM.
MFFALL*    MOVE RCDSI-PREV-UPDT-USER-ID TO WS-CDSI-PREV-UPDT-USER-ID.
           MOVE RCDSI-PREV-UPDT-DT      TO WS-CDSI-PREV-UPDT-DT.
           MOVE RCDSI-CVG-NUM           TO WS-CDSI-CVG-NUM.
           MOVE RCDSI-CDI-EFF-DT        TO WS-CDSI-CDI-EFF-DT.
           MOVE RCDSI-CDI-ALLOC-CD      TO WS-CDSI-CDI-ALLOC-CD.
           MOVE RCDSI-CDI-ALLOC-AMT     TO WS-CDSI-CDI-ALLOC-AMT.
           MOVE RCDSI-CDI-ALLOC-PCT     TO WS-CDSI-CDI-ALLOC-PCT.
           MOVE RCDSI-CDI-ALLOC-UNIT-QTY  TO WS-CDSI-CDI-ALLOC-UNIT-QTY.
           MOVE RCDSI-CDI-PAYO-MTHD-CD  TO WS-CDSI-CDI-PAYO-MTHD-CD.
           MOVE RCDSI-DPOS-TRM-MO-DUR   TO WS-CDSI-DPOS-TRM-MO-DUR.
           MOVE RCDSI-DPOS-TRM-DY-DUR   TO WS-CDSI-DPOS-TRM-DY-DUR.
MFFALL     MOVE RCDSI-CDI-CVG-ALLOC-AMT TO WS-CDSI-CDI-CVG-ALLOC-AMT.
      *    MOVE RCDSI-DEST-POL-ID       TO WS-CDSI-DEST-POL-ID.
      *    MOVE RCDSI-DEST-CVG-NUM      TO WS-CDSI-DEST-CVG-NUM.
      *    MOVE RCDSI-DEST-FND-ID       TO WS-CDSI-DEST-FND-ID.
      *    MOVE RCDSI-DEST-FND-ID       TO WS-CDSI-DEST-FND-ID.
      *    MOVE RCDSI-BNK-ID            TO WS-CDSI-BNK-ID.
      *    MOVE RCDSI-BNK-BR-ID         TO WS-CDSI-BNK-BR-ID.
      *    MOVE RCDSI-BNK-ACCT-ID       TO WS-CDSI-BNK-ACCT-ID.
      *    MOVE RCDSI-BNK-ACCT-HLDR-NM  TO WS-CDSI-BNK-ACCT-HLDR-NM.
      *    MOVE RCDSI-BNK-ACCT-TYP-CD   TO WS-CDSI-BNK-ACCT-TYP-CD.
           
           
       7100-MOVE-CDSI-TO-WS-X.
           EXIT.
      /
      *--------------------
       7500-PRINT-POL-LINE.
      *--------------------

      * PRINT POLICY LINE
      
      *    MOVE SPACES                  TO WS-POL-PRINT-LINE.
      *    INITIALIZE WS-POL-PRINT-LINE.
           MOVE RPOL-POL-ID             TO WS-POL-ID.
           MOVE RPOL-POL-CSTAT-CD       TO WS-POL-CSTAT-CD.
           MOVE RPOL-POL-PREM-SUSP-AMT  TO WS-POL-PREM-SUSP-AMT.
           MOVE RPOL-POL-MISC-SUSP-AMT  TO WS-POL-MISC-SUSP-AMT.
           
      *    PRINT LINE FOR THE DELETED RECORD
           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-POL-PRINT-LINE       TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
       
      * EXTRA BLANK LINE BETWEEN POLICIES     
           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
       
       7500-PRINT-POL-LINE-X.
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
           MOVE WS-CAIN-RECS-READ-LINE  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-CAIN-DELETED-RECS-LINE TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-CAIN-ADDED-RECS-LINE TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

MFFALL     MOVE SPACES                  TO L0040-INPUT-LINE.
MFFALL     PERFORM  0040-3000-WRITE-OTHER
MFFALL         THRU 0040-3000-WRITE-OTHER-X.
MFFALL           
MFFALL     MOVE SPACES                  TO L0040-INPUT-LINE.
MFFALL     MOVE WS-CAIN-UPDATED-LINE    TO L0040-INPUT-LINE.
MFFALL     PERFORM  0040-3000-WRITE-OTHER
MFFALL         THRU 0040-3000-WRITE-OTHER-X.
MFFALL
MFFALL     MOVE SPACES                  TO L0040-INPUT-LINE.
MFFALL     PERFORM  0040-3000-WRITE-OTHER
MFFALL         THRU 0040-3000-WRITE-OTHER-X.
MFFALL           
MFFALL     MOVE SPACES                  TO L0040-INPUT-LINE.
MFFALL     MOVE WS-CAIN-ERROR-LINE      TO L0040-INPUT-LINE.
MFFALL     PERFORM  0040-3000-WRITE-OTHER
MFFALL         THRU 0040-3000-WRITE-OTHER-X.
MFFALL
           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-CDSI-RECS-READ-LINE  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           
           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-CDSI-DELETED-RECS-LINE  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           
           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-CDSI-ADDED-RECS-LINE TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           
           MOVE SPACES                  TO L0040-INPUT-LINE.
           MOVE WS-CDSI-UPDATED-RECS-LINE TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                  TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
MFFALL           
MFFALL     MOVE SPACES                  TO L0040-INPUT-LINE.
MFFALL     MOVE WS-CDSI-ERROR-LINE      TO L0040-INPUT-LINE.
MFFALL     PERFORM  0040-3000-WRITE-OTHER
MFFALL         THRU 0040-3000-WRITE-OTHER-X.
MFFALL
MFFALL     MOVE SPACES                  TO L0040-INPUT-LINE.
MFFALL     PERFORM  0040-3000-WRITE-OTHER
MFFALL         THRU 0040-3000-WRITE-OTHER-X.
           
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
P02229 COPY XCPL0035.

       COPY CCPPCCC.
      /
       COPY CCPL0010.
       COPY CCPS0010.
      /
       COPY CCPL0950.
       COPY CCPS0950.
      /
MFFALL COPY CCPL9806.
MFFALL COPY CCPS9806.
      /
       COPY CCPACAIN.
       COPY CCPBCAIN.
MFFALL COPY CCPCCAIN.
       COPY CCPNCAIN.
       COPY CCPUCAIN.
       COPY CCPXCAIN.
      /
       COPY CCPACDSI.
       COPY CCPBCDSI.
       COPY CCPCCDSI.
       COPY CCPNCDSI.
       COPY CCPUCDSI.
       COPY CCPXCDSI.
      /
       COPY CCPTPOL.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
       COPY XCPL0040.
      /
       COPY XCPL0260.
      /
       COPY XCPL1660.
       COPY XCPL1680.
      /
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM ZSBMPALC                     **
      *****************************************************************
