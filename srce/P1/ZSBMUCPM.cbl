      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMUCPM.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMUCPM                                         **
      **  REMARKS:  THIS WILL CONVERT THE MOVEMENT FILE TO A NEW     **
      **            FORMAT.                                          **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  13JUN05  BP     CREATED FOR UCP RELEASE                    **
MFFVA1**  03OCT05  GW     ALTERED FOR NEW LAYOUT                     **
MFFVA1**  03OCT05  KM     EXRACT SA FUNDS ANNUALIZED PREMIUM         **
5-0449**  03OCT05  KM     FIXED BASE CVG ANN. PREM DISPLAY           **
IPVAL1**  17APR07  CTS    ALTERED FOR NEW LAYOUT                     **
RP2I03**  20JUL07  CTS    CHANGED LAYOUT FOR MEDICAL REPRICING       **
ABF264**  04JAN08  CTS    CHANGED LAYOUT FOR IPMP                    **
RPLI01**  21JAN08  CTS    CHANGED LAYOUT FOR RP2 LIMITED PAY         **
FEID21**  03JUN08  CTS    VA1 CHANGES FOR FLEX FUND ENHANCEMENT      **
EN4742**  20OCT08  CTS    VA1 CHANGES FOR EN4742                     **
      **                                                             **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT IMVT-DATA-FILE ASSIGN TO ZSIMVT
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WIMVT-SEQ-FILE-STATUS.

           SELECT UCPM-DATA-FILE ASSIGN TO ZSUCPM
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WUCPM-SEQ-FILE-STATUS.
      /
       DATA DIVISION.
       FILE SECTION.

       FD  IMVT-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RIMVT-SEQ-REC-INFO.
           05  RIMVT-REC-TYP                     PIC X.
           05  RIMVT-POL-ID                      PIC X(07).
           05  RIMVT-CVG-PLAN-ID.
               10  RIMVT-CVG-PLAN-ID-BASE        PIC X(5).
               10  RIMVT-CVG-PLAN-ID-RS          PIC X.
MFFVA1     05  RIMVT-FND-ID                      PIC X(5).
           05  RIMVT-LN-NUM                      PIC XXX.
           05  RIMVT-CVG-NUM                     PIC 99.
SAC09B     05  RIMVT-CONC-POL-CVG.
SAC09B         10  RIMVT-CONC-POL-ID             PIC X(07).
SAC09B         10  RIMVT-CONC-CVG-NUM            PIC 99.
           05  RIMVT-POL-COUNT-IND               PIC 9.
           05  RIMVT-CVG-COUNT-IND               PIC 9.
           05  RIMVT-ON-OFF-IND                  PIC XX.
           05  RIMVT-PRCES-DT.
               06  RIMVT-PRCES-DT-YR             PIC 9(04).
               06  FILLER                        PIC X(01).
               06  RIMVT-PRCES-DT-MO             PIC 9(02).
               06  FILLER                        PIC X(01).
               06  RIMVT-PRCES-DT-DY             PIC 9(02).
           05  RIMVT-CVG-SUM-INS-AMT             PIC 9(13).
           05  RIMVT-CVG-ISS-EFF-DT              PIC X(10).
RPLI01     05  RIMVT-BNFT-PMT-CMNC-DT            PIC X(10).
           05  RIMVT-CVG-STAT-CD                 PIC X(3).
5-0449     05  RIMVT-ANN-PREM-AMT-SIGN           PIC X(01).
           05  RIMVT-ANN-PREM-AMT                PIC 9(13).
           05  RIMVT-FND-VAL                     PIC 9(13).
           05  RIMVT-NB-PREM-AMT                 PIC 9(13).
SAC09N     05  RIMVT-POL-CNVR-TYP-CD             PIC XX.
SAC09N     05  RIMVT-CVG-CNVR-TYP-CD             PIC XX.
UCPVAL     05  RIMVT-POL-UCP-CD                  PIC X(01).
UCPVAL     05  RIMVT-CVG-UCP-CD                  PIC X(01).
U10870     05  RIMVT-ESC-AMT-SIGN                PIC X.
U10870     05  RIMVT-ESC-AMT                     PIC 9(12).
SAC09N     05  RIMVT-TOT-CNVR-FUND-AMT           PIC 9(13).
UCPVAL*    05  RIMVT-ORIG-POL-ID                 PIC X(07).
UCPVAL*    05  RIMVT-ORIG-SML-PROD-CD            PIC X(03).
UCPVAL*    05  RIMVT-ORIG-SPRCD-POLID.
UCPVAL*        10  RIMVT-CONC-SML-PROD-CD        PIC X(03).
UCPVAL*        10  RIMVT-CONC-POLICY-ID          PIC X(07).
UCPVAL     05  RIMVT-ORIG-POL-DATA          OCCURS 5 TIMES.
UCPVAL         10  RIMVT-ORIG-POL-ID             PIC X(07).
UCPVAL         10  RIMVT-ORIG-SML-PROD-CD        PIC X(03).
UCPVAL         10  RIMVT-ORIG-SPRCD-POLID.
UCPVAL             15  RIMVT-CONC-SML-PROD-CD    PIC X(03).
UCPVAL             15  RIMVT-CONC-POLICY-ID      PIC X(07).
PR006M     05  RIMVT-CVG-SUB-STAT-CD             PIC X(02).
PR006M     05  RIMVT-POL-SUB-STAT-CD             PIC X(02).
PR006M     05  RIMVT-CVG-STBL-2-CD               PIC X(03).
PR006M     05  RIMVT-POL-APP-TYP-CD              PIC X(02).
V03091     05  RIMVT-CVG-SWITCH-CD               PIC X(02).
MFPVA1     05  RIMVT-SUB-LN-NUM                  PIC X(03).
MFPVA1     05  RIMVT-CVG-TERM                    PIC 9(03).
RPLI01     05  RIMVT-BNFT-PMT-MONTH              PIC 9(02).
MP8SPM     05  RIMVT-CVG-SPCL-PREM-DUR           PIC 9(03).
RP2I03     05  RIMVT-MTHLY-BNFT-AMT              PIC 9(13).
RP2I03     05  RIMVT-AVG-CNVR-FACE-AMT           PIC 9(13).
ABF264     05  RIMVT-SURG-BNFT-IND               PIC X(01).
RPLI01     05  RIMVT-ANNL-ANTY-AMT               PIC 9(13).
RPLI01     05  RIMVT-PRE-CMNC-POL-NUM            PIC X(10).
RPLI01     05  RIMVT-PRE-CMNC-CVG-NUM            PIC X(02).
FEID21     05  RIMVT-PREM-PMT-PERI               PIC 9(03).
EN4742     05  RIMVT-CVG-INGM-CSTAT-CD           PIC X(01).




       FD  UCPM-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RUCPM-SEQ-REC-INFO.
           05  RUCPM-REC-TYP                     PIC X.
               88 RUCPM-REC-TYP-HDR                 VALUE '1'.
               88 RUCPM-REC-TYP-DTL                 VALUE '2'.
               88 RUCPM-REC-TYP-TLR                 VALUE '3'.
           05  RUCPM-POL-ID                      PIC X(07).
           05  RUCPM-CVG-PLAN-ID.
               10  RUCPM-CVG-PLAN-ID-BASE        PIC X(5).
               10  RUCPM-CVG-PLAN-ID-RS          PIC X.
MFFVA1     05  RUCPM-FND-ID                      PIC X(5).
           05  RUCPM-LN-NUM                      PIC XXX.
           05  RUCPM-CVG-NUM                     PIC 99.
SAC09B     05  RUCPM-CONC-POL-CVG.
SAC09B         10  RUCPM-CONC-POL-ID             PIC X(07).
SAC09B         10  RUCPM-CONC-CVG-NUM            PIC 99.
           05  RUCPM-POL-COUNT-IND               PIC 9.
           05  RUCPM-CVG-COUNT-IND               PIC 9.
           05  RUCPM-ON-OFF-IND                  PIC XX.
           05  RUCPM-PRCES-DT.
               06  RUCPM-PRCES-DT-YR             PIC 9(04).
               06  FILLER                        PIC X(01).
               06  RUCPM-PRCES-DT-MO             PIC 9(02).
               06  FILLER                        PIC X(01).
               06  RUCPM-PRCES-DT-DY             PIC 9(02).
           05  RUCPM-CVG-SUM-INS-AMT             PIC 9(13).
           05  RUCPM-CVG-ISS-EFF-DT              PIC X(10).
ABF264     05  RUCPM-BNFT-PMT-CMNC-DT            PIC X(10).
           05  RUCPM-CVG-STAT-CD                 PIC X(3).
5-0449     05  RUCPM-ANN-PREM-AMT-SIGN           PIC X(01).
MFFVA1     05  RUCPM-ANN-PREM-AMT                PIC 9(13).
           05  RUCPM-FND-VAL                     PIC 9(13).
           05  RUCPM-NB-PREM-AMT                 PIC 9(13).
SAC09N     05  RUCPM-POL-CNVR-TYP-CD             PIC XX.
SAC09N     05  RUCPM-CVG-CNVR-TYP-CD             PIC XX.
UCPVAL     05  RUCPM-POL-UCP-CD                  PIC X(01).
UCPVAL     05  RUCPM-CVG-UCP-CD                  PIC X(01).
U10870     05  RUCPM-ESC-AMT-SIGN                PIC X.
U10870     05  RUCPM-ESC-AMT                     PIC 9(12).
SAC09N     05  RUCPM-TOT-CNVR-FUND-AMT           PIC 9(13).
UCPVAL*    05  RUCPM-ORIG-POL-ID                 PIC X(07).
UCPVAL*    05  RUCPM-ORIG-SML-PROD-CD            PIC X(03).
UCPVAL*    05  RUCPM-ORIG-SPRCD-POLID.
UCPVAL*        10  RUCPM-CONC-SML-PROD-CD        PIC X(03).
UCPVAL*        10  RUCPM-CONC-POLICY-ID          PIC X(07).
UCPVAL     05  RUCPM-ORIG-POL-DATA          OCCURS 5 TIMES.
UCPVAL         10  RUCPM-ORIG-POL-ID             PIC X(07).
UCPVAL         10  RUCPM-ORIG-SML-PROD-CD        PIC X(03).
UCPVAL         10  RUCPM-ORIG-SPRCD-POLID.
UCPVAL             15  RUCPM-CONC-SML-PROD-CD    PIC X(03).
UCPVAL             15  RUCPM-CONC-POLICY-ID      PIC X(07).
PR006M     05  RUCPM-CVG-SUB-STAT-CD             PIC X(02).
PR006M     05  RUCPM-POL-SUB-STAT-CD             PIC X(02).
PR006M     05  RUCPM-CVG-STBL-2-CD               PIC X(03).
PR006M     05  RUCPM-POL-APP-TYP-CD              PIC X(02).
V03091     05  RUCPM-CVG-SWITCH-CD               PIC X(02).
MFPVA1     05  RUCPM-SUB-LN-NUM                  PIC X(03).
MFPVA1     05  RUCPM-CVG-TERM                    PIC 9(03).
ABF264     05  RUCPM-BNFT-PMT-MONTH              PIC 9(02).
MP8SPM     05  RUCPM-CVG-SPCL-PREM-DUR           PIC 9(03).
IPVAL1*     05  RUCPM-MTHLY-BNFT-AMT              PIC S9(13)V99 COMP-3.
IPVAL1*     05  RUCPM-AVG-CNVR-FACE-AMT           PIC S9(13)V99 COMP-3.
IPVAL1     05  RUCPM-MTHLY-BNFT-AMT              PIC 9(13).
IPVAL1     05  RUCPM-AVG-CNVR-FACE-AMT           PIC 9(13).
RP2I03     05  RUCPM-SURG-BNFT-IND               PIC X(01).
ABF264     05  RUCPM-ANNL-ANTY-AMT               PIC 9(13).
ABF264     05  RUCPM-PRE-CMNC-POL-NUM            PIC X(10).
ABF264     05  RUCPM-PRE-CMNC-CVG-NUM            PIC X(02).
RPLI01     05  RUCPM-PREM-PMT-PERI               PIC 9(03).
FEID21     05  RUCPM-CVG-INGM-CSTAT-CD           PIC X(01).
EN4742     05  RUCPM-CVG-REINS-IND               PIC X(01).
EN4742     05  RUCPM-CVG-REINS-CO-ID             PIC X(02).
EN4742     05  RUCPM-CVG-REINS-TRTY-NUM          PIC X(03).
EN4742     05  RUCPM-CVG-REINS-CED-PCT           PIC 9(03).
EN4742     05  RUCPM-CVG-REINS-CED-AMT           PIC 9(13).99.
      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMUCPM'.

       COPY SQLCA.

       01  WS-PROGRAM-WORK-AREA.
           05  WS-ERROR-SW               PIC X(1).
               88  WS-NO-ERRORS                      VALUE 'N'.
               88  WS-ERRORS-FOUND                   VALUE 'Y'.
           05  WS-ANNIV-SW               PIC X(1).
               88  WS-ANNIV-NOT-FOUND                VALUE 'N'.
               88  WS-ANNIV-FOUND                    VALUE 'Y'.

       COPY XCWWWKDT.
       01  SUBS-AND-THINGS.
           05  I                         PIC S9(8) COMP.

       01  WORK-AREAS.
           05  WS-MAX-REDO-DT            PIC X(10) VALUE '2004-02-20'.
           05  WS-ANNIV-DT               PIC X(10).
           05  WS-TEST-DT                PIC X(10).
           05  WS-TEST-DT-R              REDEFINES
               WS-TEST-DT.
               10  WS-TEST-DT-YR         PIC 9(04).
               10  FILLER                PIC X(01).
               10  WS-TEST-DT-MO         PIC 9(02).
               10  FILLER                PIC X(01).
               10  WS-TEST-DT-DY         PIC 9(02).
           05  WS-OLDEST-BAD-DT          PIC X(10).
           05  WS-PREV-POL-ID            PIC X(10).
           05  WS-PHST-ACTV-CD           PIC X(04).
               88  WS-PHST-SKIP-ACTV     VALUES
                   '1901' '1902' '1903' '1904'
                   '3001' '3005' '3901'
                   '4901' '4902' '4903'.
               88  WS-PHST-ESC-ACTV      VALUES
                   '3902' '3903' '3904' '3905' '1003'.

       01  WS-OUTPUT-LINE.
           05  WS-OUTPUT-POL-ID                 PIC X(10).
           05  FILLER                           PIC X(01).
           05  WS-OUTPUT-MESSAGE                PIC X(40).
           05  FILLER                           PIC X(81).

       01  WIMVT-SEQ-IO-WORK-AREA.
           05  WIMVT-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'IMVT'.
           05  WIMVT-SEQ-IO-COMMAND             PIC X(02).
           05  WIMVT-SEQ-FILE-STATUS            PIC X(02).
           05  WIMVT-SEQ-IO-STATUS              PIC 9(01).
               88  WIMVT-SEQ-IO-OK              VALUE 0.
               88  WIMVT-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WIMVT-SEQ-IO-EOF             VALUE 8.
               88  WIMVT-SEQ-IO-ERROR           VALUE 9.

       01  WUCPM-SEQ-IO-WORK-AREA.
           05  WUCPM-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'UCPM'.
           05  WUCPM-SEQ-IO-COMMAND             PIC X(02).
           05  WUCPM-SEQ-FILE-STATUS            PIC X(02).
           05  WUCPM-SEQ-IO-STATUS              PIC 9(01).
               88  WUCPM-SEQ-IO-OK              VALUE 0.
               88  WUCPM-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WUCPM-SEQ-IO-EOF             VALUE 8.
               88  WUCPM-SEQ-IO-ERROR           VALUE 9.

       COPY CCFWPHST.
       COPY CCFRPHST.

       COPY CCFWPTAB.
       COPY CCFRPTAB.

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
              UNTIL WIMVT-SEQ-IO-EOF
                 OR WS-ERRORS-FOUND.

           PERFORM 9999-CLOSE-FILES
              THRU 9999-CLOSE-FILES-X.

           STOP RUN.

       0000-MAINLINE-X.
           EXIT.

      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM OCF-3000-OPEN-OUTPUT
              THRU OCF-3000-OPEN-OUTPUT-X.

           MOVE ZERO                   TO WIMVT-SEQ-IO-STATUS.

           OPEN INPUT IMVT-DATA-FILE.

           IF WIMVT-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR
                 THRU 9700-HANDLE-ERROR-X
           END-IF.

           MOVE ZERO                   TO WUCPM-SEQ-IO-STATUS.

           OPEN OUTPUT UCPM-DATA-FILE.

           IF WUCPM-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9800-HANDLE-ERROR
                 THRU 9800-HANDLE-ERROR-X
           END-IF.


       0100-OPEN-FILES-X.
           EXIT.

      *--------------------
       1000-INITIALIZATION.
      *--------------------

           MOVE 'N' TO WS-ERROR-SW.

           MOVE 'CP'                 TO WGLOB-COMPANY-CODE.

           MOVE 'ZSBMUCPM'           TO WGLOB-MAIN-PGM-ID
                                        WGLOB-CRNT-PGM-ID.
      *    PERFORM 0010-0000-INIT-PARM-INFO
      *       THRU 0010-0000-INIT-PARM-INFO-X.
      *    PERFORM 0010-1000-INIT-DEFAULT
      *       THRU 0010-1000-INIT-DEFAULT-X.

       1000-INITIALIZATION-X.
           EXIT.
      /
      *----------------------
       2000-PROCESS-IN-RECS.
      *----------------------

           PERFORM  9500-IMVT-READ
               THRU 9500-IMVT-READ-X.
           IF NOT WIMVT-SEQ-IO-OK
               MOVE 'Y' TO WS-ERROR-SW
               GO TO 2000-PROCESS-IN-RECS-X
           END-IF.

           MOVE SPACES                  TO RUCPM-SEQ-REC-INFO.
           MOVE RIMVT-REC-TYP           TO RUCPM-REC-TYP.
           MOVE RIMVT-POL-ID            TO RUCPM-POL-ID.
           MOVE RIMVT-CVG-PLAN-ID       TO RUCPM-CVG-PLAN-ID.
           MOVE RIMVT-LN-NUM            TO RUCPM-LN-NUM.
           MOVE RIMVT-FND-ID            TO RUCPM-FND-ID.
           MOVE RIMVT-CVG-NUM           TO RUCPM-CVG-NUM.
           MOVE RIMVT-CONC-POL-CVG      TO RUCPM-CONC-POL-CVG.
           MOVE RIMVT-POL-COUNT-IND     TO RUCPM-POL-COUNT-IND.
           MOVE RIMVT-CVG-COUNT-IND     TO RUCPM-CVG-COUNT-IND.
           MOVE RIMVT-ON-OFF-IND        TO RUCPM-ON-OFF-IND.
           MOVE RIMVT-PRCES-DT          TO RUCPM-PRCES-DT.
           MOVE RIMVT-CVG-SUM-INS-AMT   TO RUCPM-CVG-SUM-INS-AMT.
           MOVE RIMVT-CVG-ISS-EFF-DT    TO RUCPM-CVG-ISS-EFF-DT.
           MOVE RIMVT-CVG-STAT-CD       TO RUCPM-CVG-STAT-CD.
           MOVE RIMVT-ANN-PREM-AMT-SIGN TO RUCPM-ANN-PREM-AMT-SIGN.
           MOVE RIMVT-ANN-PREM-AMT      TO RUCPM-ANN-PREM-AMT.
           MOVE RIMVT-FND-VAL           TO RUCPM-FND-VAL.
           MOVE RIMVT-NB-PREM-AMT       TO RUCPM-NB-PREM-AMT.
           MOVE RIMVT-POL-CNVR-TYP-CD   TO RUCPM-POL-CNVR-TYP-CD.
           MOVE RIMVT-CVG-CNVR-TYP-CD   TO RUCPM-CVG-CNVR-TYP-CD.
MFFVA1     MOVE RIMVT-POL-UCP-CD        TO RUCPM-POL-UCP-CD.
MFFVA1     MOVE RIMVT-CVG-UCP-CD        TO RUCPM-CVG-UCP-CD.
           MOVE RIMVT-ESC-AMT-SIGN      TO RUCPM-ESC-AMT-SIGN.
           MOVE RIMVT-ESC-AMT           TO RUCPM-ESC-AMT.
           MOVE RIMVT-TOT-CNVR-FUND-AMT TO RUCPM-TOT-CNVR-FUND-AMT.
MFFVA1*    MOVE RIMVT-ORIG-POL-ID       TO RUCPM-ORIG-POL-ID (1).
MFFVA1*    MOVE RIMVT-ORIG-SML-PROD-CD  TO RUCPM-ORIG-SML-PROD-CD (1).
MFFVA1*    MOVE RIMVT-ORIG-SPRCD-POLID  TO RUCPM-ORIG-SPRCD-POLID (1).
MFFVA1     PERFORM
MFFVA1        VARYING I FROM 1 BY 1
MFFVA1        UNTIL I > 5
MFFVA1
MFFVA1        MOVE RIMVT-ORIG-POL-ID (I)      TO RUCPM-ORIG-POL-ID (I)
MFFVA1        MOVE RIMVT-ORIG-SML-PROD-CD (I) TO
MFFVA1                                   RUCPM-ORIG-SML-PROD-CD (I)
MFFVA1        MOVE RIMVT-ORIG-SPRCD-POLID (I) TO
MFFVA1                                   RUCPM-ORIG-SPRCD-POLID (I)
MFFVA1     END-PERFORM.

           MOVE RIMVT-CVG-SUB-STAT-CD   TO RUCPM-CVG-SUB-STAT-CD.
           MOVE RIMVT-POL-SUB-STAT-CD   TO RUCPM-POL-SUB-STAT-CD.
           MOVE RIMVT-CVG-STBL-2-CD     TO RUCPM-CVG-STBL-2-CD.
           MOVE RIMVT-POL-APP-TYP-CD    TO RUCPM-POL-APP-TYP-CD.
           MOVE RIMVT-CVG-SWITCH-CD     TO RUCPM-CVG-SWITCH-CD.
           MOVE RIMVT-SUB-LN-NUM        TO RUCPM-SUB-LN-NUM.
           MOVE RIMVT-CVG-TERM          TO RUCPM-CVG-TERM.
           MOVE RIMVT-CVG-SPCL-PREM-DUR TO RUCPM-CVG-SPCL-PREM-DUR.
RP2I03*IPVAL1     MOVE ZEROS                   TO RUCPM-MTHLY-BNFT-AMT.
RP2I03*IPVAL1     MOVE ZEROS                   TO RUCPM-AVG-CNVR-FACE-AMT.
RP2I03     MOVE RIMVT-MTHLY-BNFT-AMT    TO RUCPM-MTHLY-BNFT-AMT.
RP2I03     MOVE RIMVT-AVG-CNVR-FACE-AMT TO RUCPM-AVG-CNVR-FACE-AMT.
ABF264*RP2I03     MOVE SPACES           TO RUCPM-SURG-BNFT-IND.
ABF264     MOVE RIMVT-SURG-BNFT-IND     TO RUCPM-SURG-BNFT-IND.
RPLI01*ABF264     MOVE ZEROES                  TO RUCPM-ANNL-ANTY-AMT.
RPLI01*ABF264     MOVE SPACES                  TO RUCPM-PRE-CMNC-POL-NUM.
RPLI01*ABF264     MOVE SPACES                  TO RUCPM-PRE-CMNC-CVG-NUM.
RPLI01*ABF264     MOVE SPACES                  TO RUCPM-BNFT-PMT-CMNC-DT.
RPLI01*ABF264     MOVE ZEROES                  TO RUCPM-BNFT-PMT-MONTH.
RPLI01     MOVE RIMVT-ANNL-ANTY-AMT     TO RUCPM-ANNL-ANTY-AMT.
RPLI01     MOVE RIMVT-PRE-CMNC-POL-NUM  TO RUCPM-PRE-CMNC-POL-NUM.
RPLI01     MOVE RIMVT-PRE-CMNC-CVG-NUM  TO RUCPM-PRE-CMNC-CVG-NUM.
RPLI01     MOVE RIMVT-BNFT-PMT-CMNC-DT  TO RUCPM-BNFT-PMT-CMNC-DT.
RPLI01     MOVE RIMVT-BNFT-PMT-MONTH    TO RUCPM-BNFT-PMT-MONTH.
FEID21*RPLI01     MOVE ZEROES                  TO RUCPM-PREM-PMT-PERI.
FEID21     MOVE RIMVT-PREM-PMT-PERI         TO RUCPM-PREM-PMT-PERI.
EN4742*FEID21     MOVE SPACES                      TO RUCPM-CVG-INGM-CSTAT-CD.
EN4742     MOVE RIMVT-CVG-INGM-CSTAT-CD     TO RUCPM-CVG-INGM-CSTAT-CD.
EN4742     MOVE SPACES                      TO RUCPM-CVG-REINS-IND.
EN4742     MOVE SPACES                      TO RUCPM-CVG-REINS-CO-ID.
EN4742     MOVE SPACES                      TO
EN4742                                     RUCPM-CVG-REINS-TRTY-NUM.
EN4742     MOVE ZEROS                       TO
EN4742                                     RUCPM-CVG-REINS-CED-PCT.
EN4742     MOVE ZEROS                       TO
EN4742                                     RUCPM-CVG-REINS-CED-AMT.
FEID21
           PERFORM 9400-UCPM-WRITE
              THRU 9400-UCPM-WRITE-X.

       2000-PROCESS-IN-RECS-X.
           EXIT.

      *----------------
       9400-UCPM-WRITE.
      *----------------

           MOVE ZERO                   TO WUCPM-SEQ-IO-STATUS.

           WRITE RUCPM-SEQ-REC-INFO.

           IF WUCPM-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9800-HANDLE-ERROR
                 THRU 9800-HANDLE-ERROR-X
           END-IF.

       9400-UCPM-WRITE-X.
           EXIT.

      *---------------
       9500-IMVT-READ.
      *---------------

           MOVE ZERO                   TO WIMVT-SEQ-IO-STATUS.

           READ IMVT-DATA-FILE
                AT END
                  MOVE 8               TO WIMVT-SEQ-IO-STATUS
                  GO TO 9500-IMVT-READ-X.

           IF RIMVT-SEQ-REC-INFO EQUAL HIGH-VALUES
              MOVE 8                   TO WIMVT-SEQ-IO-STATUS
           END-IF.

           IF WIMVT-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR
                 THRU 9700-HANDLE-ERROR-X
           END-IF.

       9500-IMVT-READ-X.
           EXIT.

      *-----------------------
       9700-HANDLE-ERROR.
      *-----------------------

           MOVE WIMVT-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WIMVT-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WIMVT-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-ERROR-X.
           EXIT.

      *-----------------------
       9800-HANDLE-ERROR.
      *-----------------------

           MOVE WUCPM-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WUCPM-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WUCPM-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9800-HANDLE-ERROR-X.
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                   TO WIMVT-SEQ-IO-STATUS.

           CLOSE IMVT-DATA-FILE.

           IF WIMVT-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR
                 THRU 9700-HANDLE-ERROR-X
           END-IF.

           MOVE ZERO                   TO WUCPM-SEQ-IO-STATUS.

           CLOSE UCPM-DATA-FILE.

           IF WUCPM-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9800-HANDLE-ERROR
                 THRU 9800-HANDLE-ERROR-X
           END-IF.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.

      *******  I/O ROUTINES

       COPY XCPOOCF.

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
      **                 END OF PROGRAM ZSBMUCPM                     **
      *****************************************************************
