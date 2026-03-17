      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBMWFIA.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSBMWFIA                                          **
      **  REMARKS: DAILY EXTRACT OF BASIC POLICY INFORMATION FOR     **
      **           WORKFLOW IMAGING                                  **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
WF2006**  24FEB08  CTS    INITIAL REVISION.                          **
AHS155**  26MAR08  CTS    CHANGES TO ASH155                          **
MP143B**  28FEB11  CTS    CHANGES TO ADD NEW FIELD DREAD-DIS-FACE-AMT**
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
       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMWFIA'.

       COPY SQLCA.

      ***  INPUT CONTROL CARD

       01  WS-CTL-CARD-IN.
           05  FILLER                                PIC X(20).
           05  WS-CTL-CARD-IND                       PIC X.
               88  WS-CTL-CARD-NO                    VALUE 'N'.
               88  WS-CTL-CARD-YES                   VALUE 'Y'.
           05  FILLER                                PIC X.
           05  WS-CTL-STRT-DT                        PIC X(10).
           05  FILLER                                PIC X.
           05  WS-CTL-END-DT                         PIC X(10).
           05  FILLER                                PIC X(37).

      ***  WORK AREA

       01  WS-WORK-AREA.
           05  WS-SYS-DT                             PIC X(10).
           05  WS-CLI-ID                             PIC X(10).
           05  WS-DATE-10.
               10  WS-DATE-10-YYYY                   PIC X(04).
               10  FILLER                            PIC X(01).
               10  WS-DATE-10-MM                     PIC X(02).
               10  FILLER                            PIC X(01).
               10  WS-DATE-10-DD                     PIC X(02).
           05  WS-DATE-8.
               10  WS-DATE-8-YYYY                    PIC X(04).
               10  WS-DATE-8-MM                      PIC X(02).
               10  WS-DATE-8-DD                      PIC X(02).
           05  WS-SUB                                PIC S9(2) COMP.
           05  WS-ERROR-DUP-STCKR-IND                PIC X(01).
               88 WS-ERROR-DUP-STCKR-YES             VALUE 'Y'.
               88 WS-ERROR-DUP-STCKR-NO              VALUE 'N'.
AHS155     05  WS-DB-SPACE           VALUE X'8140'   PIC X(02).
AHS155     05  WS-SB-SPACE-SPACE     VALUE X'2020'   PIC X(02).

      ***  DETAIL LINE

       01  WS-BPI-EXTRCT-DATA.
           05  WS-INIT-BIT                           PIC X(01).
           05  WS-POL-APP-FORM-ID                    PIC 9(15).
           05  WS-TYP-CD                             PIC 9(03).
           05  WS-POL-ID-G.
               10  WS-POL-ID-PFX                     PIC X(03).
               10  WS-POL-ID                         PIC X(07).
           05  WS-POL-STAT-CD                        PIC X(15).
           05  WS-APPL-UPLD-DT                       PIC X(08).
           05  WS-POL-APP-RECV-DT                    PIC 9(08).
           05  WS-PLAN-NM                            PIC X(15).
           05  WS-PROD-APP-TYP-CD                    PIC X(15).
           05  WS-SERV-BR-ID-G.
               10  WS-SERV-BR-ID-PFX                 PIC X(02).
               10  WS-SERV-BR-ID                     PIC X(03).
           05  WS-SERV-SO-ID-G.
               10  WS-SERV-SO-ID-PFX                 PIC X(02).
               10  WS-SERV-SO-ID                     PIC X(03).
           05  WS-SERV-AGT-ID                        PIC X(06).
           05  WS-POL-OWN-CLI-ID                     PIC X(10).
           05  WS-POL-OWN-CLI-NM                     PIC X(50).
           05  WS-INSRD-STCKR-ID                     PIC X(11).
           05  WS-INSRD-STCKR-ID-N                   REDEFINES
               WS-INSRD-STCKR-ID                     PIC 9(11).
           05  WS-INSRD-CLI-ID                       PIC X(10).
           05  WS-INSRD-CLI-NM-KANA                  PIC X(50).
           05  WS-INSRD-CLI-NM-KANJI                 PIC X(50).
           05  WS-INSRD-SEX-CD                       PIC X(01).
           05  WS-INSRD-BTH-DT                       PIC 9(08).
           05  WS-UW-TYP-CD                          PIC 9(15).
           05  WS-TOT-CVG-FACE-AMT                   PIC S9(13).
           05  WS-DLY-BNFT-AMT                       PIC S9(13).
           05  WS-MED-RPT-NUM-ID                     PIC X(07).
           05  WS-MED-RPT-NUM-ID-N                   REDEFINES
               WS-MED-RPT-NUM-ID                     PIC 9(07).
           05  WS-MED-EXAM-DT                        PIC 9(08).
           05  WS-AUTO-ISS-IND                       PIC X(01).
           05  WS-CLI-UWGDECN-CD                     PIC X(15).
           05  WS-CLI-UWGDECN-TYP-CD                 PIC X(15).
           05  WS-MATCHING-DT                        PIC 9(08).
           05  WS-INIT-NOTI-DT                       PIC 9(08).
           05  WS-POL-ISS-EFF-DT                     PIC 9(08).
           05  WS-MANUAL-UW-BIT                      PIC X(01).
           05  WS-REG-NUM                            PIC 9(07).
           05  WS-POL-ACC-LCODE                      PIC 9(03).
           05  WS-POL-ACC-MCODE                      PIC 9(02).
           05  WS-POL-ACC-SCODE                      PIC 9(05).
           05  WS-DECN-ASST-CD                       PIC 9(03).
           05  WS-UW-REASN-CD                        PIC 9(03).
           05  WS-POL-MPREM-AMT                      PIC S9(13).
           05  WS-POL-CSH-RFND-STAT                  PIC X(12).
           05  FILLER                                PIC X(01)
                                                     VALUE ZEROES.
           05  WS-CVG-ME-DUR                         PIC 9(03).
           05  WS-ORIG-POL-ID                        PIC X(07).
           05  WS-ORIG-POL-ID-N                      REDEFINES
               WS-ORIG-POL-ID                        PIC 9(07).
           05  WS-SPECCOND-IND                       PIC X(01).
           05  WS-MLJ-EMPLE-ID                       PIC X(06).
           05  WS-MLJ-EMPLE-ID-N                     REDEFINES
               WS-MLJ-EMPLE-ID                       PIC 9(06).
           05  WS-LATST-NBURN-DT                     PIC 9(08).
           05  WS-BNK-NM                             PIC X(36).
           05  WS-BNK-BR-NM                          PIC X(36).
           05  WS-BNK-ACCT-TYP-CD                    PIC X(04).
           05  WS-BNK-ACCT-ID                        PIC X(17).
           05  WS-BNK-ACCT-ID-N                      REDEFINES
               WS-BNK-ACCT-ID                        PIC 9(17).
           05  WS-BNK-ACCT-HLDR-NM                   PIC X(50).
           05  WS-ACCT-HLDR-TYP-CD                   PIC X(01).
           05  WS-POL-CWA-SUSP-AMT                   PIC 9(13).
           05  WS-RECPT-NUM                          PIC X(10).
           05  WS-RECPT-NUM-N                        REDEFINES
               WS-RECPT-NUM                          PIC 9(10).
           05  WS-RECPT-DT                           PIC X(12).
MP143B     05  WS-DREAD-DIS-FACE-AMT                 PIC 9(13).
MP143B*    05  FILLER                                PIC X(19)
MP143B     05  FILLER                                PIC X(06)
                                                     VALUE ZEROES.

      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
       COPY CCWWCCC.
      /
       COPY CCWWINDX.
      /
       COPY XCWLDTLK.
      /
       COPY XCWTFCMD.
      /
       COPY XCWWWKDT.
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY XCSWPRT  REPLACING ==:ID:==  BY OCF
                               ==':ID:'==  BY =='OCF'==.
       COPY XCSROCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY WFIA
                               ==':ID:'==  BY =='WFIA'==.
       COPY ZCSRWFIA.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY WFSI
                               ==':ID:'==  BY =='WFSI'==.
       COPY ZCSRWFSI.
      /
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY XCFWDMAD.
       COPY XCFRDMAD.
      /
       COPY XCFWUSEC.
       COPY XCFRUSEC.
      /
       COPY NCFRREQT.
       COPY NCFWREQT.
      /
       COPY NCFRCLIU.
       COPY NCFWCLUS.
      /
       COPY CCFRCLI.
       COPY CCFWCLI.
      /
       COPY CCFREDIT.
       COPY CCFWEDIT.
      /
       COPY CCFWMAST.
       COPY CCFRMAST.
      /
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                          *
      *****************************************************************
       COPY CCWL0010.
      /
       COPY CCWL0083.
      /
       COPY CCWL0950.
      /
       COPY CCWL0620.
      /
       COPY CCWL2430.
      /
       COPY CCWL2435.
      /
       COPY CCWL5020.
      /
       COPY XCWL0035.
      /
       COPY XCWL0040.
      /
       COPY XCWL0280.
      /
       COPY XCWL0290.
      /
       COPY XCWL1640.
       COPY XCWL1670.
       COPY XCWL1680.
       COPY XCWL0015.
      /
       COPY XCWL2490.
      /
       COPY XCWLPTR.
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
      ********************
       PROCEDURE DIVISION.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  1000-INITIALIZE
               THRU 1000-INITIALIZE-X.

      * READ SEQUENTIAL CSWFSI FILE TO OBTAIN FIRST INPUT RECORD
           PERFORM  WFSI-1000-READ
               THRU WFSI-1000-READ-X.

           IF WWFSI-SEQ-IO-EOF
      * MSG:'INPUT FILE EMPTY'
              MOVE 'CSWFSI0002'             TO  WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
              PERFORM  2000-PROCESS-RECORDS
                  THRU 2000-PROCESS-RECORDS-X
              UNTIL WWFSI-SEQ-IO-EOF
           END-IF.

           PERFORM  9000-FINALIZE
               THRU 9000-FINALIZE-X.

           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAINLINE-X.
           EXIT.
      /
      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.

           PERFORM  WFIA-3000-OPEN-OUTPUT
               THRU WFIA-3000-OPEN-OUTPUT-X.

           PERFORM  WFSI-1000-OPEN-INPUT
               THRU WFSI-1000-OPEN-INPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       1000-INITIALIZE.
      *----------------

           INITIALIZE WS-BPI-EXTRCT-DATA.

           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           PERFORM  MAST-1000-READ
               THRU MAST-1000-READ-X.


       1000-INITIALIZE-X.
           EXIT.
      /
      *---------------------
       2000-PROCESS-RECORDS.
      *---------------------

           MOVE LOW-VALUES             TO WCLUS-KEY
           MOVE RWFSI-STCKR-ID         TO WCLUS-STCKR-ID
           MOVE HIGH-VALUES            TO WCLUS-ENDBR-KEY
           MOVE RWFSI-STCKR-ID         TO WCLUS-ENDBR-STCKR-ID

           PERFORM  CLUS-1000-BROWSE
               THRU CLUS-1000-BROWSE-X.

           PERFORM  CLUS-2000-READ-NEXT
               THRU CLUS-2000-READ-NEXT-X.

           IF  WCLUS-IO-OK
               CONTINUE
           ELSE
              PERFORM  CLUS-3000-END-BROWSE
                  THRU CLUS-3000-END-BROWSE-X

              MOVE 'CSWFIA0001'        TO WGLOB-MSG-REF-INFO
              MOVE RWFSI-STCKR-ID      TO WGLOB-MSG-PARM (1)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  WFSI-1000-READ
                   THRU WFSI-1000-READ-X
               GO TO 2000-PROCESS-RECORDS-X
           END-IF.

           PERFORM  2500-CHECK-DUPLICATE
               THRU 2500-CHECK-DUPLICATE-X

           IF WS-ERROR-DUP-STCKR-YES
              PERFORM  CLUS-3000-END-BROWSE
                  THRU CLUS-3000-END-BROWSE-X

              MOVE 'CSWFIA0002'        TO WGLOB-MSG-REF-INFO
              MOVE RWFSI-STCKR-ID      TO WGLOB-MSG-PARM (1)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  WFSI-1000-READ
                   THRU WFSI-1000-READ-X
               GO TO 2000-PROCESS-RECORDS-X
           END-IF.

           MOVE RCLIU-POL-ID           TO WPOL-POL-ID.
           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.

           IF NOT WPOL-IO-OK
      * MSG: POLICY (@1) DOES NOT EXIST
              MOVE 'XS00000070'        TO WGLOB-MSG-REF-INFO
              MOVE WPOL-POL-ID         TO WGLOB-MSG-PARM (1)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              GO TO 2000-PROCESS-RECORDS-X
           END-IF.

           IF  NOT RPOL-POL-STAT-PENDING
               INITIALIZE WS-BPI-EXTRCT-DATA
               PERFORM  3000-PRCES-EACH-REC
                   THRU 3000-PRCES-EACH-REC-X
           ELSE
              PERFORM  CLUS-3000-END-BROWSE
                  THRU CLUS-3000-END-BROWSE-X

              PERFORM  WFSI-1000-READ
                  THRU WFSI-1000-READ-X

              MOVE 'CSWFIA0003'        TO WGLOB-MSG-REF-INFO
              MOVE RCLIU-POL-ID        TO WGLOB-MSG-PARM (1)
              MOVE RWFSI-STCKR-ID      TO WGLOB-MSG-PARM (2)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              GO TO 2000-PROCESS-RECORDS-X
           END-IF.

           PERFORM  CLUS-3000-END-BROWSE
               THRU CLUS-3000-END-BROWSE-X.

      * READ THE NEXT POLICY RECORD
           PERFORM  WFSI-1000-READ
               THRU WFSI-1000-READ-X.

       2000-PROCESS-RECORDS-X.
           EXIT.
      /
      *--------------------
       2500-CHECK-DUPLICATE.
      *--------------------

           SET   WS-ERROR-DUP-STCKR-NO TO TRUE.

           PERFORM  CLUS-2000-READ-NEXT
               THRU CLUS-2000-READ-NEXT-X.

           IF WCLUS-IO-OK
               SET WS-ERROR-DUP-STCKR-YES TO TRUE
           END-IF.

       2500-CHECK-DUPLICATE-X.
           EXIT.
      /
      *--------------------
       3000-PRCES-EACH-REC.
      *--------------------

           PERFORM  3500-GET-POL-DTLS
               THRU 3500-GET-POL-DTLS-X.

       3000-PRCES-EACH-REC-X.
           EXIT.
      /
      *------------------
       3500-GET-POL-DTLS.
      *------------------

           PERFORM  3510-INIT-REC-DTLS
               THRU 3510-INIT-REC-DTLS-X.

           PERFORM  3550-GET-BASIC-POL-DTLS
               THRU 3550-GET-BASIC-POL-DTLS-X.

           PERFORM  3600-GET-CLI-NM-SEX-BTH-DT
               THRU 3600-GET-CLI-NM-SEX-BTH-DT-X.

       3500-GET-POL-DTLS-X.
           EXIT.
      /
      *-------------------
       3510-INIT-REC-DTLS.
      *-------------------

           MOVE SPACES                      TO WS-INIT-BIT.
           MOVE SPACES                      TO WS-MANUAL-UW-BIT.
           MOVE SPACES                      TO WS-SPECCOND-IND.
           MOVE SPACES                      TO WS-BNK-NM.
           MOVE SPACES                      TO WS-BNK-BR-NM.
           MOVE SPACES                      TO WS-BNK-ACCT-TYP-CD.
           MOVE SPACES                      TO WS-BNK-ACCT-HLDR-NM.
           MOVE SPACES                      TO WS-RECPT-DT.
           MOVE ZEROES                      TO WS-POL-STAT-CD.
           MOVE SPACES                      TO WS-PROD-APP-TYP-CD.
           MOVE SPACES                      TO WS-POL-CSH-RFND-STAT.
           MOVE SPACES                      TO WS-PLAN-NM.
           MOVE SPACES                      TO WS-POL-OWN-CLI-ID.
           MOVE SPACES                      TO WS-POL-OWN-CLI-NM.
           MOVE ZEROES                      TO WS-POL-APP-FORM-ID.
           MOVE ZEROES                      TO WS-POL-ID-G.
           MOVE ZEROES                      TO WS-SERV-BR-ID-G.
           MOVE ZEROES                      TO WS-SERV-SO-ID-G.
           MOVE ZEROES                      TO WS-LATST-NBURN-DT.
           MOVE ZEROES                      TO WS-BNK-ACCT-ID.
           MOVE SPACES                      TO WS-ACCT-HLDR-TYP-CD.
           MOVE ZEROES                      TO WS-POL-MPREM-AMT.
           MOVE ZEROES                      TO WS-SERV-AGT-ID.
           MOVE ZEROES                      TO WS-POL-CWA-SUSP-AMT.
           MOVE ZEROES                      TO WS-APPL-UPLD-DT.
           MOVE ZEROES                      TO WS-POL-APP-RECV-DT.
           MOVE ZEROES                      TO WS-ORIG-POL-ID.
           MOVE ZEROES                      TO WS-RECPT-NUM.
           MOVE SPACES                      TO WS-CLI-UWGDECN-CD.
           MOVE SPACES                      TO WS-CLI-UWGDECN-TYP-CD.
           MOVE SPACES                      TO WS-INSRD-CLI-NM-KANA.
           MOVE SPACES                      TO WS-INSRD-CLI-NM-KANJI.
           MOVE SPACES                      TO WS-INSRD-SEX-CD.
           MOVE ZEROES                      TO WS-MLJ-EMPLE-ID.
           MOVE ZEROES                      TO WS-INSRD-STCKR-ID.
AHS155     MOVE ZEROES                      TO WS-INSRD-CLI-ID.
           MOVE ZEROES                      TO WS-UW-TYP-CD.
           MOVE ZEROES                      TO WS-INSRD-BTH-DT.
           MOVE ZEROES                      TO WS-TOT-CVG-FACE-AMT.
           MOVE ZEROES                      TO WS-DLY-BNFT-AMT.
           MOVE ZEROES                      TO WS-CVG-ME-DUR.
           MOVE ZEROES                      TO WS-MED-RPT-NUM-ID.
           MOVE ZEROES                      TO WS-MED-EXAM-DT.
MP143B     MOVE ZEROES                      TO WS-DREAD-DIS-FACE-AMT.

       3510-INIT-REC-DTLS-X.
           EXIT.
      /
      *------------------------
       3550-GET-BASIC-POL-DTLS.
      *------------------------

      * GET BASIC POLICY DETAILS

           MOVE RPOL-POL-APP-FORM-ID        TO L0280-INPUT-DATA.
           MOVE LENGTH OF RPOL-POL-APP-FORM-ID
             TO L0280-LENGTH.
           MOVE 0                           TO L0280-PRECISION.

           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X.

           IF  L0280-OK
               MOVE L0280-OUTPUT            TO WS-POL-APP-FORM-ID
           END-IF.

           MOVE 500                         TO WS-TYP-CD.
           MOVE RPOL-POL-ID                 TO WS-POL-ID.
           MOVE RPOL-SERV-AGT-ID            TO WS-SERV-AGT-ID

           IF  RPOL-SERV-AGT-ID NOT = SPACES
               PERFORM  0083-0000-INIT-PARM-INFO
                   THRU 0083-0000-INIT-PARM-INFO-X
               MOVE RPOL-SERV-AGT-ID        TO L0083-AGENT-ID
               PERFORM  0083-1000-RETRIEVE-AGT-INFO
                   THRU 0083-1000-RETRIEVE-AGT-INFO-X
               IF  L0083-RETRN-OK
                   MOVE L0083-AGT-BR-ID     TO WS-SERV-BR-ID
                   MOVE L0083-AGT-SO-ID     TO WS-SERV-SO-ID
               END-IF
           END-IF.

           MOVE RCLIU-STCKR-ID          TO L0280-INPUT-DATA.
           MOVE LENGTH OF RCLIU-STCKR-ID
                                        TO L0280-LENGTH.
           MOVE 0                       TO L0280-PRECISION.

           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X .

           IF  L0280-OK
               MOVE L0280-OUTPUT        TO WS-INSRD-STCKR-ID-N
           END-IF.

       3550-GET-BASIC-POL-DTLS-X.
           EXIT.
      /
      *-------------------
       5010-INIT-CLI-DTLS.
      *-------------------


       5010-INIT-CLI-DTLS-X.
           EXIT.
      /
      *---------------------------
       3600-GET-CLI-NM-SEX-BTH-DT.
      *---------------------------

      * GET CLIENT NAME, SEX, DOB


           MOVE RCLIU-CLI-ID                TO L2435-CLI-ID.

           PERFORM  2435-1000-BUILD-PARM-INFO
               THRU 2435-1000-BUILD-PARM-INFO-X.

           PERFORM  2435-1000-OBTAIN-CLI-INFO
               THRU 2435-1000-OBTAIN-CLI-INFO-X.

           IF  NOT L2435-RETRN-OK
               GO TO 3600-GET-CLI-NM-SEX-BTH-DT-X
           END-IF.

           INITIALIZE L0620-INPUT-PARM-INFO.

           IF  L2435-CLI-SEX-COMPANY
               MOVE L2435-CLI-ENTR-CO-NM    TO L0620-CLI-CO-NM
           ELSE
               MOVE L2435-CLI-ENTR-GIV-NM   TO L0620-CLI-GIV-NM
               MOVE L2435-CLI-ENTR-SUR-NM   TO L0620-CLI-SUR-NM
           END-IF.

           MOVE L2435-CLI-SEX-CD            TO L0620-CLI-SEX-CD.

           PERFORM  0620-1000-FORMAT-SCREEN-NAME
               THRU 0620-1000-FORMAT-SCREEN-NAME-X.

           MOVE L0620-SCREEN-NAME           TO WS-INSRD-CLI-NM-KANA.

           MOVE L2435-CLI-SEX-CD            TO WS-INSRD-SEX-CD.
           MOVE L2435-CLI-BTH-DT            TO WS-DATE-10.

           PERFORM 7000-CONVERT-DATE
              THRU 7000-CONVERT-DATE-X.

           MOVE WS-DATE-8                   TO WS-INSRD-BTH-DT.

           PERFORM  8000-WRITE-DETAIL-LINE
               THRU 8000-WRITE-DETAIL-LINE-X.

       3600-GET-CLI-NM-SEX-BTH-DT-X.
           EXIT.
      /
      *------------------
       7000-CONVERT-DATE.
      *------------------

            MOVE WS-DATE-10-YYYY            TO WS-DATE-8-YYYY.
            MOVE WS-DATE-10-MM              TO WS-DATE-8-MM.
            MOVE WS-DATE-10-DD              TO WS-DATE-8-DD.

       7000-CONVERT-DATE-X.
           EXIT.
      /
      *-----------------------
       8000-WRITE-DETAIL-LINE.
      *-----------------------

AHS155     INSPECT WS-BNK-NM
AHS155                     REPLACING ALL WS-SB-SPACE-SPACE
AHS155                                      BY WS-DB-SPACE.
AHS155     INSPECT WS-BNK-BR-NM
AHS155                     REPLACING ALL WS-SB-SPACE-SPACE
AHS155                                      BY WS-DB-SPACE.
AHS155     INSPECT WS-BNK-ACCT-TYP-CD
AHS155                     REPLACING ALL WS-SB-SPACE-SPACE
AHS155                                      BY WS-DB-SPACE.
AHS155     INSPECT WS-POL-CSH-RFND-STAT
AHS155                     REPLACING ALL WS-SB-SPACE-SPACE
AHS155                                      BY WS-DB-SPACE.
AHS155     INSPECT WS-INSRD-CLI-NM-KANJI
AHS155                     REPLACING ALL WS-SB-SPACE-SPACE
AHS155                                      BY WS-DB-SPACE.

           MOVE WS-BPI-EXTRCT-DATA          TO RWFIA-SEQ-REC-INFO.

           PERFORM  WFIA-1000-WRITE
               THRU WFIA-1000-WRITE-X.

       8000-WRITE-DETAIL-LINE-X.
           EXIT.
      /
      *--------------
       9000-FINALIZE.
      *--------------

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

       9000-FINALIZE-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  WFIA-4000-CLOSE
               THRU WFIA-4000-CLOSE-X.

           PERFORM  WFSI-4000-CLOSE
               THRU WFSI-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************
       COPY CCPPCCC.
      /
       COPY CCPECLDE.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
       COPY XCPL0035.
      /
       COPY XCPL0260.
      /
       COPY XCPL0280.
      /
       COPY XCPL0290.
       COPY XCPS0290.
      /
       COPY XCPL1640.
      /
       COPY CCPL0010.
       COPY CCPS0010.
      /
       COPY XCPL0015.
      /
       COPY CCPL0083.
       COPY CCPS0083.
      /
       COPY CCPL0950.
       COPY CCPS0950.
      /
       COPY CCPL0620.
      /
       COPY CCPL2430.
       COPY CCPS2430.
      /
       COPY CCPL2435.
       COPY CCPS2435.
      /
       COPY CCPL5020.
       COPY CCPS5020.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULE                                      *
      *****************************************************************
      /
       COPY CCPTPOL.
      /
       COPY CCPNPOL.
      /
       COPY CCPNMAST.
      /
       COPY NCPEREQT.
      /
       COPY CCPNCLI.
      /
       COPY NCPBREQT.
      /
       COPY CCPNEDIT.
      /
       COPY NCPBCLUS.
      /
      /
       COPY XCPNUSEC.
      /
       COPY XCPNDMAD.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY OCF
                               ==':PGM:'== BY =='XSRQOCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY OCF.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY BCF
                               ==':PGM:'== BY =='XSRQBCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY BCF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY BCF.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY WFIA
                               ==':PGM:'== BY =='ZSRQWFIA'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY WFIA.
       COPY XCSASEQ  REPLACING ==:ID:==  BY WFIA.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY WFIA.
      /
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY WFSI
                               ==':PGM:'== BY =='ZSRQWFSI'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY WFSI.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY WFSI.
      *****************************************************************
      *    ERROR HANDLING ROUTINES                                    *
      *****************************************************************
       COPY XCPL0030.
      /
      *****************************************************************
      **                 END OF PROGRAM ZSBMWFIA                     **
      *****************************************************************
