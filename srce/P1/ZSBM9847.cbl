      *************************
       IDENTIFICATION DIVISION.
      *************************
      
       PROGRAM-ID. ZSBM9847.
      
       COPY XCWWCRHT.
       
      *****************************************************************
      **  MEMBER :  ZSBM9847                                         **
      **  REMARKS:  THIS PROGRAM WILL AUTOMATE POST LAPSE SURRENDER  **
      **            TRANSITION                                       **
      **                                                             **
      **                                                             **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
MP7303**  19SEP08  CTS    INITIAL VERSION.                           **
BU5355**  07JAN09  CTS    ADDED CHECKS FOR ASSIGNEE,POLICY SUB-STATUS**
BU5355**                  BILL TYPE CD AND POLICY CEASE DATE         **
EN6515**  04JUN09  CTS    REMOVE THE CHECK OF POL-CEASE-DATE         **
EN6515**                  IMPLEMENTED BY BU5355                      **
BU6723**  25JUN09  CTS    REPLACE EFFECTIVE DATE WITH POLICY CEASE   **
BU6723**                  DATE                                       **
ISLADM**  18DEC09  CTS    CHANGES FOR INSURANCE LAW PROJECT          **
EN5239**  01OCT10  CTS    CHANGES TO ALLOW TRANSACTION FOR PO        **
C17240**  27APR12  CTS    CHANGES DONE FOR CALCULATING LAPSE DATE    **
C17240**                  AND REINSTATEMENT PERIOD FOR DISASTER      **
C17240**                  POLICIES                                   **
Q19045**  29MAY12  CTS    CALCULATION OF REINSTATEMENT PERIOD FOR    **
Q19045**                  YEAR END CASES                             **
      *****************************************************************

      *
      **********************
       ENVIRONMENT DIVISION.
      **********************

       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       COPY CCSSPRT9.
      /
      ***************
       DATA DIVISION.
      ***************
      *
       FILE SECTION.
       COPY CCSDPRT9.
       COPY CCSRPRT9.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM9847'.


       COPY SQLCA.
      /
       COPY XCWLDTLK.
       COPY XCWL0040.
       COPY XCWL1640.
      /
       COPY XCWWHDG.
       COPY CCWWINDX.
      /
       COPY XCWTFCMD.
       COPY XCWWWKDT.
      /

       01  WS-PROGRAM-WORK-AREA.
           05  WS-DLY-INPUT-READ            PIC S9(9) VALUE ZERO.
           05  WS-PLSA-PRCES-SUCS           PIC S9(9) VALUE ZERO.
           05  WS-PLSA-PRCES-ERROR          PIC S9(9) VALUE ZERO.
           05  WS-ERROR-WRITE               PIC S9(9) VALUE ZERO.
           05  WS-CONTROL-TOTAL-LINE.
               10  WS-TOTAL-TEXT            PIC X(50) VALUE SPACES.
               10  FILLER                   PIC X(02).
               10  WS-TOTAL-VALUE           PIC Z(09) VALUE SPACES.
           05  WS-IN-RECORD.
               10  WS-IN-PGM-ID             PIC X(08).
               10  FILLER                   PIC X(01).
               10  WS-IN-PRCES-DT.
                   15  WS-IN-PRCES-YR       PIC 9(04).
                   15  FILLER               PIC X.
                   15  WS-IN-PRCES-MO       PIC 9(02).
                   15  FILLER               PIC X.
                   15  WS-IN-PRCES-DY       PIC 9(02).
           05  WS-CO-RECORD.
               10  FILLER                   PIC X(17).
               10  WS-CO-ID                 PIC X(02).
           05  WS-PLSN-ERROR-IND            PIC X(01).
               88  WS-PLSN-ERROR-YES        VALUE 'Y'.
               88  WS-PLSN-ERROR-NO         VALUE 'N'.
           05  WS-PLSE-ERROR-IND            PIC X(01).
               88  WS-PLSE-ERROR-NO                   VALUE 'N'.
               88  WS-PLSE-ERROR-YES                  VALUE 'Y'.
           05  WS-BNK-FIRM-IND              PIC X(01) VALUE 'N'..
               88  WS-BNK-FIRM-NO                     VALUE 'N'.
               88  WS-BNK-FIRM-YES                    VALUE 'Y'.
           05  WS-PLSE-HDR-IND              PIC X(01) VALUE 'Y'.
               88  WS-PLSE-HDR-NO                     VALUE 'N'.
               88  WS-PLSE-HDR-YES                    VALUE 'Y'.
           05  WS-PSTL-CD-MO                PIC X(03) VALUE '(MO'.
           05  WS-HOLD-POL-ID               PIC X(07) VALUE SPACES.
           05  WS-TXT-SRC-REF-ID            PIC X(05).
           05  WS-CLI-INFO.
               10  WS-OWN-CLI-ID            PIC X(10).
               10  WS-PAYE-CO-NM            PIC X(50).
               10  WS-PAYE-CLI-FRST-NM      PIC X(25).
               10  WS-PAYE-CLI-LAST-NM      PIC X(25).
               10  WS-CLI-ADDR-ADDL-TXT     PIC X(60).
               10  WS-CLI-ADDR-LOC-CD       PIC X(08).
               10  WS-KJ-CMPLT-ADDR-TXT     PIC X(50).
               10  WS-BNK-ID                PIC X(04).
                   88  WS-BNK-ID-PO                   VALUE '9900'.
               10  WS-OWN-PSTL-CD           PIC X(09).
               10  WS-ACCT-TYP-CD           PIC X(03).
EN5239             88  WS-ACCT-TYP-SAV      VALUE '1  '.                
               10  WS-BNK-ACCT-ID           PIC X(17).
               10  WS-ACCT-HLDR-NM          PIC X(51).
               10  WS-CASH-SURR-VALU        PIC X(17).
               10  WS-BNK-BR-ID             PIC X(05).
EN5239         10  WS-BNK-BR-ID-R           REDEFINES
EN5239             WS-BNK-BR-ID.
EN5239             15  WS-BNK-BR-ID-1       PIC X(02).
EN5239             15  WS-BNK-BR-ID-2       PIC X(01).
EN5239                 88  WS-BNK-BR-ID-P3  VALUE '8'. 
EN5239             15  WS-BNK-BR-ID-3       PIC X(02).                
BU5355         10  WS-ASSIGNEE-IND          PIC X(01).
BU5355             88  WS-ASSIGNEE-EXIST              VALUE 'Y'.
BU5355             88  WS-ASSIGNEE-NONE               VALUE 'N'.
EN6515*BU5355     05  WS-POL-CEASE-DT              PIC X(10)
EN6515*BU5355                                      VALUE '2008-03-29'.
C17240     05  WS-DSASTR-CD                 PIC X(01).
C17240         88 WS-DSASTR-CD-3            VALUE '3'.
C17240     05  WS-POL-SUB-STAT-CD           PIC X(02).
C17240         88 WS-POL-SUB-STAT-DL        VALUE 'DL'.
                                            
      *--- DETAIL LINE - WITH DELIMETER FOR EXCEL (XLS)
      *
       01  WS-XLS-LINE.
           05  WS-XLS-POL-ID                PIC X(07).
           05  FILLER                       PIC X(01)  VALUE ','.
           05  WS-XLS-OWN-NM                PIC X(51).
           05  FILLER                       PIC X(01)  VALUE ','.
           05  WS-XLS-POL-LAPS-DT           PIC X(10).
           05  FILLER                       PIC X(01)  VALUE ','.
           05  WS-XLS-REINST-PERI           PIC X(10).
           05  FILLER                       PIC X(01)  VALUE ','.
           05  WS-XLS-CASH-SURR-VALU        PIC X(17).
           05  FILLER                       PIC X(01)  VALUE ','.
           05  WS-XLS-ASURR-ERROR-REASN     PIC X(50).
           05  FILLER                       PIC X(01)  VALUE ','.
           05  WS-XLS-SERV-BR-ID            PIC X(05).
           05  FILLER                       PIC X(01)  VALUE ','.
           05  WS-XLS-SERV-SO-ID            PIC X(05).
           05  FILLER                       PIC X(01)  VALUE ','.
           05  WS-XLS-PRCES-DT              PIC X(10).
           05  FILLER                       PIC X(01)  VALUE ','.
           05  FILLER                       PIC X(126) VALUE SPACES.
           
       01  WS-PLSA-REC.
           05  WS-OWN-NM                    PIC X(51).
           05  WS-SERV-BR-ID                PIC X(05).
           05  WS-POL-ID                    PIC X(07).
           05  WS-SERV-SO-ID                PIC X(05).
           05  WS-PRCES-DT                  PIC X(10).
           05  WS-POL-ISS-EFF-DT            PIC X(10).
           05  WS-POL-LAPS-DT               PIC X(10).
           05  WS-REINST-PERI               PIC X(10).
           05  WS-PLAPS-SURR-AMT            PIC X(17).
           05  WS-SERV-AGT-ID               PIC X(06).
           05  WS-SERV-AGT-NM               PIC X(51).
       
      /
      *****************************************************************
      *    COMMON COPYBOOKS                                           *
      *****************************************************************
       COPY CCWWCCC.
      / 
      ****************************************************************
      *  FILE WORK AREA FOR EXTRACT/REPORT FILES                     *
      ****************************************************************
       COPY XCSWSEQ  REPLACING ==:ID:==  BY 9847
                               ==':ID:'==  BY =='9847'==.
       COPY XCSWSEQ  REPLACING ==:ID:==  BY PLSN
                               ==':ID:'==  BY =='PLSN'==.
       COPY CCSWPRT9.
      /
      ****************************************************************
      *  TABLE LAYOUT & WORK AREAS FOR EXTRACT/REPORT TABLES         *
      ****************************************************************
       COPY XCFRTEXT.
       COPY XCFWTEXT.
      /
       COPY XCSRBCF.
       COPY XCSWBCF.
      /
       COPY XCSROCF.
       COPY XCSWOCF.
      /
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFRCVG.
       COPY CCFWCVG.
       COPY CCWWCVGS.
      /
       COPY CCSR9847.
      / 
       COPY CCSRPLSN.
      /
      *****************************************************************
      *    CALLED MODULE PARAMETER INFORMATION                        *
      *****************************************************************
       COPY CCWL0010.
       COPY NCWL0960.
       COPY XCWL0035.
       COPY XCWL0290.
       COPY CCWL0950.
       COPY CCWL5020.
       COPY CCWL9450.
       COPY XCWL9124.
       COPY XCWL2490.
       COPY XCWL1670.
       COPY XCWL1680.
       COPY CCWL2430.
       COPY NCWL0303.
       COPY CCWL0083.
       COPY CCWL9215.
       COPY CCWL2440.
      /
       01   WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY CCWLPGA.
      /
       PROCEDURE DIVISION.
      *
      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.
               
           PERFORM  2000-INITIALIZE
               THRU 2000-INITIALIZE-X.
               
           PERFORM  3000-PROCESS-TRANSACTION
               THRU 3000-PROCESS-TRANSACTION-X.
               
           PERFORM  9000-PRINT-STATS
               THRU 9000-PRINT-STATS-X.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.

           GOBACK.

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
               
           PERFORM  9847-1000-OPEN-INPUT
               THRU 9847-1000-OPEN-INPUT-X.
               
           PERFORM  PLSN-3000-OPEN-OUTPUT
               THRU PLSN-3000-OPEN-OUTPUT-X.
               
           PERFORM  PRT9-3000-OPEN-OUTPUT
               THRU PRT9-3000-OPEN-OUTPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       2000-INITIALIZE.
      *----------------

           INITIALIZE WGLOB-GLOBAL-AREA.
           
           PERFORM  BCF-1000-READ
               THRU BCF-1000-READ-X.
               
           MOVE RBCF-SEQ-REC-INFO           TO WS-CO-RECORD.
           MOVE WPGWS-CRNT-PGM-ID           TO WGLOB-MAIN-PGM-ID.
           MOVE WS-CO-ID                    TO WGLOB-COMPANY-CODE.
           
           PERFORM  0010-0000-INIT-PARM-INFO
               THRU 0010-0000-INIT-PARM-INFO-X.

           PERFORM  0010-1000-INIT-DEFAULT
               THRU 0010-1000-INIT-DEFAULT-X.

           PERFORM  0290-1000-BUILD-PARM-INFO
               THRU 0290-1000-BUILD-PARM-INFO-X.
               
           PERFORM  PGA-1000-BUILD-PARMS
               THRU PGA-1000-BUILD-PARMS-X.
              
       2000-INITIALIZE-X.
           EXIT.
      /
      *-------------------------
       3000-PROCESS-TRANSACTION.
      *-------------------------

           PERFORM  3100-VALIDATE-PARM-CARD
               THRU 3100-VALIDATE-PARM-CARD-X.

           PERFORM  9847-1000-READ
               THRU 9847-1000-READ-X.

           IF  W9847-SEQ-IO-OK
               PERFORM
                   UNTIL W9847-SEQ-IO-EOF
                   PERFORM  3200-PROCESS-PLSA
                       THRU 3200-PROCESS-PLSA-X
                   PERFORM  9847-1000-READ
                       THRU 9847-1000-READ-X
               END-PERFORM
           ELSE
      *MSG: FILE IS EMPTY.
               MOVE 'CS98470001'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-2000-GET-MESSAGE
                   THRU 0260-2000-GET-MESSAGE-X
               MOVE WGLOB-MSG-TXT           TO L0040-INPUT-LINE
               PERFORM  0040-2000-WRITE-ERROR
                   THRU 0040-2000-WRITE-ERROR-X
           END-IF.
           
       3000-PROCESS-TRANSACTION-X.
           EXIT.
      /
      *------------------------
       3100-VALIDATE-PARM-CARD.
      *------------------------
      
           PERFORM  BCF-1000-READ
               THRU BCF-1000-READ-X.

           IF  WBCF-SEQ-IO-EOF
      **** MESSAGE (S) 'CONTROL CARD FILE EMPTY, NO PROCESSING DONE
               MOVE 'XS00000119'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-4000-CTL-CARD-ERROR
                   THRU 0030-4000-CTL-CARD-ERROR-X
           END-IF.

           MOVE RBCF-SEQ-REC-INFO           TO WS-IN-RECORD.
           MOVE WS-IN-PRCES-DT              TO L0040-INPUT-LINE.
           
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           
       3100-VALIDATE-PARM-CARD-X.
           EXIT.
      /
      *------------------
       3200-PROCESS-PLSA.
      *------------------
      
           INITIALIZE WS-PLSA-REC
                      WS-XLS-LINE
                      WS-CLI-INFO.
                      
           ADD 1 TO WS-DLY-INPUT-READ.
           
           MOVE R9847-POL-ID                TO WPOL-POL-ID.
           
           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.
               
C17240     MOVE RPOL-POL-SUB-STAT-CD        TO WS-POL-SUB-STAT-CD.
C17240     MOVE RPOL-DSASTR-CD              TO WS-DSASTR-CD.
C17240
BU5355* CHECK FOR POLICY SUB-STATUS,BILL TYPE CD AND
BU5355* POLICY CEASE DATE
BU5355
C17240*BU5355     IF  RPOL-POL-SUB-STAT-NONE
C17240     IF  (RPOL-POL-SUB-STAT-NONE
C17240     OR  WS-POL-SUB-STAT-DL)
BU5355     AND RPOL-POL-BILL-TYP-PAC
EN6515*BU5355     AND RPOL-POL-CEAS-DT <= WS-POL-CEASE-DT
BU5355         CONTINUE
BU5355     ELSE
BU5355         GO TO 3200-PROCESS-PLSA-X
BU5355     END-IF.
BU5355
BU5355* CHECK FOR ASSIGNEE
BU5355
BU5355     PERFORM  3210-CHECK-ASSIGNEE
BU5355         THRU 3210-CHECK-ASSIGNEE-X.
BU5355
BU5355     IF  WS-ASSIGNEE-EXIST
BU5355         GO TO 3200-PROCESS-PLSA-X
BU5355     END-IF.
BU5355
           PERFORM  3220-CALC-PLSA-REC
               THRU 3220-CALC-PLSA-REC-X.

      * VALIDATE ERROR CONDITIONS
      *
           SET WS-PLSE-ERROR-NO TO TRUE.
           
           PERFORM  3230-VALIDATE-PLSE
               THRU 3230-VALIDATE-PLSE-X.
      
           IF  WS-PLSE-ERROR-YES
               GO TO 3200-PROCESS-PLSA-X
           END-IF.
           
      * VALIDATE SUCCESSFUL CONDITIONS
      *
           SET WS-PLSN-ERROR-NO TO TRUE.
           
           PERFORM  3240-VALIDATE-PLSN
               THRU 3240-VALIDATE-PLSN-X.
           
           IF  WS-PLSN-ERROR-YES
               GO TO 3200-PROCESS-PLSA-X
           END-IF.

           MOVE R9847-POL-ID                TO WPOL-POL-ID.
           
           PERFORM  POL-1000-READ-FOR-UPDATE
               THRU POL-1000-READ-FOR-UPDATE-X.
               
           IF  NOT WPOL-IO-OK
               PERFORM  POL-3000-UNLOCK
                   THRU POL-3000-UNLOCK-X
               GO TO 3200-PROCESS-PLSA-X
           END-IF.
           
           PERFORM  3250-XFER-DISB
               THRU 3250-XFER-DISB-X.

           IF  NOT L9450-RETRN-OK
      *MSG: POST LAPSE SURRENDER PROCESSING NOT COMPLETED
               MOVE 'CS98470008'        TO WGLOB-MSG-REF-INFO
               MOVE R9847-POL-ID        TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  POL-3000-UNLOCK
                   THRU POL-3000-UNLOCK-X
               GO TO 3200-PROCESS-PLSA-X
           END-IF.
           
           PERFORM  3260-POL-SUB-STAT-UPDT
               THRU 3260-POL-SUB-STAT-UPDT-X.
               
           PERFORM  3270-WRITE-PLSN
               THRU 3270-WRITE-PLSN-X.
               
           PERFORM  3280-GEN-PLSN-NOTI-DOC
               THRU 3280-GEN-PLSN-NOTI-DOC-X.
               
       3200-PROCESS-PLSA-X.
           EXIT.
      /
BU5355*-------------------
BU5355 3210-CHECK-ASSIGNEE.
BU5355*-------------------
BU5355
BU5355     SET  WS-ASSIGNEE-NONE            TO TRUE.
BU5355     MOVE ZERO                        TO I.
BU5355
BU5355     PERFORM  2430-1000-BUILD-PARM-INFO
BU5355         THRU 2430-1000-BUILD-PARM-INFO-X.
BU5355
BU5355     MOVE R9847-POL-ID                TO L2430-POL-ID.
BU5355
BU5355     PERFORM  2430-2600-GET-ASSIGNEE
BU5355         THRU 2430-2600-GET-ASSIGNEE-X.
BU5355
BU5355     IF  L2430-RETRN-RELA-NOT-FOUND
BU5355     AND NOT RPOL-POL-ASIGN
BU5355     AND (RPOL-POL-ASIGN-DT = SPACES
BU5355     OR  RPOL-POL-ASIGN-DT = WWKDT-ZERO-DT)
BU5355         CONTINUE
BU5355     ELSE
BU5355         SET WS-ASSIGNEE-EXIST        TO TRUE
BU5355         MOVE 'ZS98479001'            TO WGLOB-MSG-REF-INFO
BU5355         MOVE R9847-POL-ID            TO WGLOB-MSG-PARM (1)
BU5355         PERFORM  0260-1000-GENERATE-MESSAGE
BU5355             THRU 0260-1000-GENERATE-MESSAGE-X
BU5355     END-IF.
BU5355
BU5355 3210-CHECK-ASSIGNEE-X.
BU5355     EXIT.
BU5355/
      *-------------------
       3220-CALC-PLSA-REC.
      *-------------------
               
      * GET OWNER'S NAME

           MOVE ZERO                        TO I.
           
           PERFORM  2430-1000-BUILD-PARM-INFO
               THRU 2430-1000-BUILD-PARM-INFO-X.

           MOVE R9847-POL-ID                TO L2430-POL-ID.

           PERFORM  2430-2100-GET-OWNER
               THRU 2430-2100-GET-OWNER-X.

           IF  L2430-RETRN-OK
               MOVE L2430-CLI-ID            TO WS-OWN-CLI-ID
               IF  L2430-CLI-SEX-COMPANY
                   MOVE L2430-CLI-ENTR-CO-NM
                                            TO WS-OWN-NM
                   MOVE L2430-KJ-ENTR-CO-NM TO WS-XLS-OWN-NM
                   MOVE L2430-KJ-CO-NM      TO WS-PAYE-CO-NM
                   MOVE SPACES              TO WS-PAYE-CLI-FRST-NM
                                               WS-PAYE-CLI-LAST-NM
               ELSE
                   MOVE L2430-CLI-NM-COMPRESSED
                                            TO WS-OWN-NM
                   MOVE L2430-KJ-NM-COMPRESSED
                                            TO WS-XLS-OWN-NM
                   MOVE L2430-KJ-GIV-NM
                                            TO WS-PAYE-CLI-FRST-NM
                   MOVE L2430-KJ-SUR-NM
                                            TO WS-PAYE-CLI-LAST-NM
                   MOVE SPACES              TO WS-PAYE-CO-NM
               END-IF
           END-IF.
           
      *  GET OWNER'S ADDRESS INFO
      *
           MOVE WS-OWN-CLI-ID               TO L2440-CLI-ID.
           SET  L2440-CLI-ADDR-GR-KANJI TO TRUE.

           PERFORM  2440-1000-PRIMARY-ADDRESS
               THRU 2440-1000-PRIMARY-ADDRESS-X.

           IF  L2440-RETRN-OK
               MOVE L2440-CLI-ADDR-LOC-CD   TO WS-CLI-ADDR-LOC-CD
               MOVE L2440-CLI-PSTL-CD       TO WS-OWN-PSTL-CD
               MOVE L2440-CLI-ADDR-ADDL-TXT TO WS-CLI-ADDR-ADDL-TXT
               PERFORM  9124-1000-BUILD-PARM-INFO
                   THRU 9124-1000-BUILD-PARM-INFO-X
               MOVE L2440-CLI-ADDR-LOC-CD   TO L9124-ADDR-LOC-CD
               PERFORM  9124-1000-READ-ADCD
                   THRU 9124-1000-READ-ADCD-X
               IF  L9124-RETRN-OK
                   MOVE L9124-KJ-CMPLT-ADDR-TXT
                                            TO WS-KJ-CMPLT-ADDR-TXT
               ELSE
      *MSG: ERROR RETRIEVING PAYEE ADDRESS LOCATION CODE @1
                   MOVE L9124-ADDR-LOC-CD   TO WGLOB-MSG-PARM (1)
                   MOVE R9847-POL-ID        TO WGLOB-MSG-PARM (2)
                   MOVE 'CS98470002'        TO WGLOB-MSG-REF-INFO
                  PERFORM  0260-1000-GENERATE-MESSAGE
                      THRU 0260-1000-GENERATE-MESSAGE-X
               END-IF
           END-IF.

      * GET PAYOR'S BANK ACCOUNT INFO
      *
           MOVE ZERO                        TO I.
           
           PERFORM  2430-1000-BUILD-PARM-INFO
               THRU 2430-1000-BUILD-PARM-INFO-X.

           MOVE R9847-POL-ID                TO L2430-POL-ID.

           PERFORM  2430-2200-GET-PAYOR
               THRU 2430-2200-GET-PAYOR-X.
               
           IF  NOT L2430-RETRN-OK
      * MSG: PAYOR INFORMATION CAN NOT BE FOUND.
               MOVE 'CS98470003'            TO WGLOB-MSG-REF-INFO
               MOVE R9847-POL-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.
           
           IF  L2430-RELATIONSHIP-FOUND
           AND L2430-CLI-ID > SPACES
           AND L2430-PAC-NUM NOT = ZERO
               PERFORM  5020-1000-BUILD-PARM-INFO
                   THRU 5020-1000-BUILD-PARM-INFO-X
               MOVE L2430-CLI-ID            TO L5020-CLI-ID
               MOVE L2430-PAC-NUM           TO L5020-PAC-NUM
               SET L5020-BANK-QTY-ONE       TO TRUE
               PERFORM  5020-2000-GET-SPECIFIC-BANK
                   THRU 5020-2000-GET-SPECIFIC-BANK-X
               IF  L5020-RETRN-OK
                   MOVE L5020-BNK-BR-ID (1) TO WS-BNK-BR-ID
                   MOVE L5020-BNK-ACCT-ID (1)
                                            TO WS-BNK-ACCT-ID
                   MOVE L5020-BNK-ACCT-HLDR-NM (1)
                                            TO WS-ACCT-HLDR-NM
                   MOVE L5020-BNK-ACCT-TYP-CD (1)
                                            TO WS-ACCT-TYP-CD
                   MOVE L5020-BNK-ID (1)    TO WS-BNK-ID
                   MOVE L5020-BNK-FIRM-IND (1)
                                            TO WS-BNK-FIRM-IND 
EN5239             IF  WS-BNK-ID-PO 
EN5239                 SET WS-ACCT-TYP-SAV  TO TRUE
EN5239                 SET WS-BNK-BR-ID-P3  TO TRUE 
EN5239                 SET WS-BNK-FIRM-YES  TO TRUE 
EN5239             END-IF
EN5239                                            
               END-IF
           END-IF.
           
      * CALCULATE REINSTATEMENT PERIOD
      *
           MOVE RPOL-POL-CEAS-DT            TO L1680-INTERNAL-1.
           MOVE ZERO                        TO L1680-NUMBER-OF-YEARS.
           MOVE +5                          TO L1680-NUMBER-OF-MONTHS.
Q19045*    MOVE -1                          TO L1680-NUMBER-OF-DAYS.
Q19045     MOVE ZERO                        TO L1680-NUMBER-OF-DAYS.
           
C17240
C17240* REINSTATEMENT PERIOD FOR DISASTER POLICIES IS CALCULATED AS
C17240* DSASTR-LAPS-DT + 3 MONTHS -1 DAY
C17240
C17240     IF  WS-DSASTR-CD-3
C17240         MOVE RPOL-DSASTR-LAPS-DT     TO L1680-INTERNAL-1
C17240         MOVE +3                      TO L1680-NUMBER-OF-MONTHS
C17240     END-IF.
C17240
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
               
Q19045
Q19045     MOVE L1680-INTERNAL-2            TO L1680-INTERNAL-1.
Q19045     MOVE ZERO                        TO L1680-NUMBER-OF-MONTHS.
Q19045     MOVE ZERO                        TO L1680-NUMBER-OF-YEARS.
Q19045     MOVE 1                           TO L1680-NUMBER-OF-DAYS.
Q19045
Q19045     PERFORM  1680-4000-SUB-YMD-FROM-DATE
Q19045         THRU 1680-4000-SUB-YMD-FROM-DATE-X.
Q19045
           MOVE L1680-INTERNAL-2            TO WS-REINST-PERI.
           
      * RETRIEVE SERVICING AGENT NAME AND SO CODE
      *
           IF  RPOL-SERV-AGT-ID NOT = SPACES
               PERFORM  0083-0000-INIT-PARM-INFO
                   THRU 0083-0000-INIT-PARM-INFO-X
               MOVE RPOL-SERV-AGT-ID   TO L0083-AGENT-ID
               SET L0083-AGENT-NAME-REQD TO TRUE
               PERFORM  0083-1000-RETRIEVE-AGT-INFO
                   THRU 0083-1000-RETRIEVE-AGT-INFO-X
               IF  L0083-RETRN-OK
                   MOVE L0083-AGT-SO-ID
                                            TO WS-SERV-SO-ID
                   MOVE L0083-AGT-NM-COMPRESSED
                                            TO WS-SERV-AGT-NM
               END-IF
           END-IF.
           PERFORM  0290-1000-BUILD-PARM-INFO
               THRU 0290-1000-BUILD-PARM-INFO-X.
         
           MOVE ZERO                        TO L0290-PRECISION.
           MOVE LENGTH OF WS-CASH-SURR-VALU TO L0290-MAX-OUT-LEN.
           COMPUTE L0290-INPUT-NUMBER = RPOL-POST-LAPS-SURR-AMT.
  
           PERFORM  0290-1000-NUMERIC-FORMAT
               THRU 0290-1000-NUMERIC-FORMAT-X.
 
           MOVE L0290-OUTPUT-DATA      TO WS-CASH-SURR-VALU.
           
      * CALCULATE POLICY LAPSE DATE
      *
           MOVE RPOL-POL-CEAS-DT            TO L1680-INTERNAL-1.
           MOVE ZERO                        TO L1680-NUMBER-OF-YEARS.
           MOVE +2                          TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                        TO L1680-NUMBER-OF-DAYS.
           
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
               
           MOVE L1680-INTERNAL-2            TO WS-POL-LAPS-DT.
           
C17240
C17240* POLICY LAPSE DATE IS CALCULATED AS DISASTER
C17240* LAPSE START DATE FOR THE DISASTER POLICIES.
C17240
C17240     IF  WS-DSASTR-CD-3
C17240         MOVE RPOL-DSASTR-LAPS-DT     TO WS-POL-LAPS-DT
C17240     END-IF.
C17240
      * POPULATE SERVICING BRANCH ID
      *
           MOVE RPOL-SERV-BR-ID             TO WS-SERV-BR-ID.

       3220-CALC-PLSA-REC-X.
           EXIT.
      /
      *-------------------
       3230-VALIDATE-PLSE.
      *-------------------
      
      * CHECK IF POLICYHOLDER NAME AND ACCOUNTHOLDER NAME IS SAME
      *
           IF  NOT WS-OWN-NM = WS-ACCT-HLDR-NM
               SET WS-PLSE-ERROR-YES TO TRUE
               MOVE '00002'                 TO WS-TXT-SRC-REF-ID
               PERFORM  3231-WRITE-PLSE
                   THRU 3231-WRITE-PLSE-X
           END-IF.
           
      * CHECK IF ANY VALUE IS REMAINING IN ANY OF THE FOLLOWING ACCOUNTS
      *
           IF  RPOL-POL-BT-SUSP-AMT   NOT = ZEROES
           OR  RPOL-POL-OS-DISB-AMT   NOT = ZEROES
           OR  RPOL-POL-MISC-SUSP-AMT NOT = ZEROES
           OR  RPOL-OS-DISB-SURR-AMT  NOT = ZEROES
           OR  RPOL-OS-DISB-MAT-AMT   NOT = ZEROES
           OR  RPOL-OS-DISB-DTH-AMT   NOT = ZEROES
           OR  RPOL-OS-DISB-CLM-AMT   NOT = ZEROES
           OR  RPOL-OS-DISB-AD-AMT    NOT = ZEROES
           OR  RPOL-POL-PD-SUSP-AMT   NOT = ZEROES
           OR  RPOL-POL-CC-SUSP-AMT   NOT = ZEROES
           OR  RPOL-POL-CWA-SUSP-AMT  NOT = ZEROES
           OR  RPOL-CSH-RFND-SUSP-AMT NOT = ZEROES
               SET WS-PLSE-ERROR-YES TO TRUE
               MOVE '00003'                 TO WS-TXT-SRC-REF-ID
               PERFORM  3231-WRITE-PLSE
                   THRU 3231-WRITE-PLSE-X
           END-IF.
           
      * CHECK IF BANK RELATED INFORMATION IS PRESENT
      *
           IF  WS-BNK-ID = SPACES
           OR  WS-BNK-BR-ID = SPACES
           OR  WS-ACCT-TYP-CD = SPACES
           OR  WS-BNK-ACCT-ID = SPACES
           OR  WS-ACCT-HLDR-NM = SPACES
               SET WS-PLSE-ERROR-YES TO TRUE
               MOVE '00004'                 TO WS-TXT-SRC-REF-ID
               PERFORM  3231-WRITE-PLSE
                   THRU 3231-WRITE-PLSE-X
           END-IF.
          
      * CHECK FOR FIRM BANKING
      *
           IF  WS-BNK-FIRM-NO
               SET WS-PLSE-ERROR-YES TO TRUE
               MOVE '00005'                 TO WS-TXT-SRC-REF-ID
               PERFORM  3231-WRITE-PLSE
                   THRU 3231-WRITE-PLSE-X
           END-IF.
       
       3230-VALIDATE-PLSE-X.
           EXIT.
      /
      *-----------------
       3231-WRITE-PLSE.
      *-----------------
      
      * WRITE RECORD IN ERROR LIST
      *
           IF  WS-PLSE-HDR-YES
               PERFORM  3232-PRINT-ERROR-XLS-HDG
                   THRU 3232-PRINT-ERROR-XLS-HDG-X
               SET WS-PLSE-HDR-NO TO TRUE
           END-IF.
           
           PERFORM  3233-BUILD-PLSE
               THRU 3233-BUILD-PLSE-X.
           
           INITIALIZE RPRT9-SEQ-REC-INFO.
           MOVE WS-XLS-LINE                 TO RPRT9-SEQ-REC-INFO.
           MOVE +1                          TO WPRT9-NUMBER-LINES.

           PERFORM  PRT9-1000-WRITE
               THRU PRT9-1000-WRITE-X.
               
           ADD 1 TO WS-ERROR-WRITE.
           
           IF  NOT WS-XLS-POL-ID = WS-HOLD-POL-ID
               ADD 1 TO WS-PLSA-PRCES-ERROR
               MOVE WS-XLS-POL-ID           TO WS-HOLD-POL-ID
           END-IF.
               
       3231-WRITE-PLSE-X.
           EXIT.
      /
      *-------------------------
       3232-PRINT-ERROR-XLS-HDG.
      *-------------------------
      
      * WRITE HEADER IN ERROR LIST
      *
           PERFORM  2490-1000-BUILD-PARM-INFO
               THRU 2490-1000-BUILD-PARM-INFO-X.
      
           MOVE WS-IN-PGM-ID                TO L2490-TXT-SRC-ID.
           MOVE '00001'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
           
           INITIALIZE RPRT9-SEQ-REC-INFO.
           MOVE L2490-TXT-STR-TXT           TO RPRT9-SEQ-REC-INFO.
           MOVE ZEROES                      TO WPRT9-NUMBER-LINES.

           PERFORM  PRT9-2000-WRITE
               THRU PRT9-2000-WRITE-X.
               
       3232-PRINT-ERROR-XLS-HDG-X.
           EXIT.
      /
      *----------------
       3233-BUILD-PLSE.
      *----------------
      
           PERFORM  2490-1000-BUILD-PARM-INFO
               THRU 2490-1000-BUILD-PARM-INFO-X.
                   
           MOVE WS-IN-PGM-ID                TO L2490-TXT-SRC-ID.
           MOVE WS-TXT-SRC-REF-ID           TO L2490-TXT-SRC-REF-ID.
           
           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-XLS-ASURR-ERROR-REASN.
           MOVE R9847-POL-ID                TO WS-XLS-POL-ID.
           MOVE WS-POL-LAPS-DT              TO WS-XLS-POL-LAPS-DT.
           MOVE WS-CASH-SURR-VALU           TO WS-XLS-CASH-SURR-VALU.
           MOVE WS-REINST-PERI              TO WS-XLS-REINST-PERI.
           MOVE WS-SERV-BR-ID               TO WS-XLS-SERV-BR-ID.
           MOVE WS-SERV-SO-ID               TO WS-XLS-SERV-SO-ID.
           MOVE WS-IN-PRCES-DT              TO WS-XLS-PRCES-DT.
           
           
       3233-BUILD-PLSE-X.
           EXIT.
      /
      *-------------------
       3240-VALIDATE-PLSN.
      *-------------------

      * CHECK IF ADDRESS IS PRESENT
      *
           MOVE ZEROES                      TO JJ.
      
           IF  WS-CLI-ADDR-ADDL-TXT = SPACES
               SET WS-PLSN-ERROR-YES TO TRUE
               GO TO 3240-VALIDATE-PLSN-X
           ELSE
               INSPECT WS-CLI-ADDR-ADDL-TXT TALLYING JJ
                   FOR ALL WS-PSTL-CD-MO
               IF  JJ = ZERO
                   CONTINUE
               ELSE
                   SET WS-PLSN-ERROR-YES TO TRUE
                   GO TO 3240-VALIDATE-PLSN-X
               END-IF
           END-IF.
           
      * CHECK IF BANK ID IS NOT POST OFFICE
      *
EN5239*           IF  WS-BNK-ID-PO
EN5239*               SET WS-PLSN-ERROR-YES TO TRUE
EN5239*               GO TO 3240-VALIDATE-PLSN-X
EN5239*           END-IF.
      
       3240-VALIDATE-PLSN-X.
           EXIT.
      /
      *---------------
       3250-XFER-DISB.
      *---------------
       
      * TRANSFER POST LAPSE DISB TO O/S DISB
      *
           PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
               THRU CVGS-1000-LOAD-CVGS-ARRAY-X.

           PERFORM  9450-1000-BUILD-PARM-INFO
               THRU 9450-1000-BUILD-PARM-INFO-X.
               
           MOVE WS-IN-PRCES-DT              TO L1680-INTERNAL-1.
           MOVE ZERO                        TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO                        TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                        TO L1680-NUMBER-OF-DAYS.

           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
               
BU6723     MOVE RPOL-POL-CEAS-DT            TO L9450-EFF-DT.
BU6723*           MOVE L1680-INTERNAL-2            TO L9450-EFF-DT
BU6723     MOVE L1680-INTERNAL-2            TO LPGA-JRNL-DT
ISLADM*                                        L9450-HO-FORM-ACPT-DT.
ISLADM                                         L9450-CO-RECV-DT.
           SET LPGA-EVNT-CD-PLAPS-SURR TO TRUE.
           SET L9450-FRM-BNK TO TRUE.
           
           MOVE R9847-POL-ID                TO LPGA-POLICY-NUMBER.
           
           MOVE WS-BNK-ID                   TO L9450-BNK-ID.
           MOVE WS-BNK-BR-ID                TO L9450-BNK-BR-ID.
           MOVE WS-BNK-ACCT-ID              TO L9450-BNK-ACCT-ID.
           MOVE WS-ACCT-HLDR-NM             TO L9450-BNK-ACCT-HLDR-NM.
           MOVE WS-ACCT-TYP-CD              TO L9450-BNK-ACCT-TYP-CD.
           MOVE WS-PAYE-CLI-FRST-NM         TO L9450-PAYE-CLI-FRST-NM.
           MOVE WS-PAYE-CLI-LAST-NM         TO L9450-PAYE-CLI-LAST-NM.
           MOVE WS-PAYE-CO-NM               TO L9450-PAYE-CO-NM.
           MOVE WS-CLI-ADDR-LOC-CD          TO L9450-CLI-ADDR-LOC-CD.
           MOVE WS-OWN-PSTL-CD              TO L9450-CLI-PSTL-CD.
           MOVE WS-CLI-ADDR-ADDL-TXT        TO L9450-CLI-ADDR-ADDL-TXT.
           MOVE WS-KJ-CMPLT-ADDR-TXT        TO L9450-DV-CLI-ADDR.
           
           SET L9450-PRCES-TYP-ALL TO TRUE.
           
           PERFORM  9450-1000-PROCESS-SURRENDER
               THRU 9450-1000-PROCESS-SURRENDER-X.
               
       3250-XFER-DISB-X.
           EXIT.
      /
      *------------------------
       3260-POL-SUB-STAT-UPDT.
      *------------------------
      
      * UPDATE POLICY SUB STATUS FOR POST LAPSE AUTOMATIC SURRENDER
      *
           SET RPOL-POL-SUB-STAT-PLAPS-ASUR TO TRUE.
           
           PERFORM  POL-2000-REWRITE
               THRU POL-2000-REWRITE-X.
               
       3260-POL-SUB-STAT-UPDT-X.
           EXIT.
      /
      *----------------
       3270-WRITE-PLSN.
      *----------------
      
      * WRITE RECORD IN SUCCESSFUL NOTIFICATION LIST
      *
           INITIALIZE  RPLSN-SEQ-REC-INFO.
           
           PERFORM  3271-BUILD-PLSN
               THRU 3271-BUILD-PLSN-X.
               
           PERFORM  PLSN-1000-WRITE
               THRU PLSN-1000-WRITE-X.
               
           ADD 1 TO WS-PLSA-PRCES-SUCS.
      
       3270-WRITE-PLSN-X.
           EXIT.
      /
      *----------------
       3271-BUILD-PLSN.
      *----------------
      
           MOVE R9847-POL-ID                TO WS-POL-ID.
           MOVE WS-IN-PRCES-DT              TO WS-PRCES-DT.
           MOVE RPOL-POL-ISS-EFF-DT         TO WS-POL-ISS-EFF-DT.
           MOVE WS-CASH-SURR-VALU           TO WS-PLAPS-SURR-AMT.
           MOVE RPOL-SERV-AGT-ID            TO WS-SERV-AGT-ID.
           MOVE WS-XLS-OWN-NM               TO WS-OWN-NM.
           
           MOVE WS-PLSA-REC                 TO RPLSN-SEQ-REC-INFO.
      
       3271-BUILD-PLSN-X.
           EXIT.
      /
      *------------------------
       3280-GEN-PLSN-NOTI-DOC.
      *------------------------
      
      * PRTX ENTRY FOR POST LAPSE AUTOMATIC SURRENDER
      *
           PERFORM  0303-1000-BUILD-PARM-INFO
               THRU 0303-1000-BUILD-PARM-INFO-X.
               
           MOVE WS-IN-PRCES-DT              TO L0303-TRNXT-TRXN-EFF-DT.
           MOVE RPOL-SBSDRY-CO-ID           TO L0303-SBSDRY-CO-ID.
           MOVE R9847-POL-ID                TO L0303-POL-ID.
           MOVE WS-OWN-CLI-ID               TO L0303-CLI-ID.
           MOVE ZEROES                      TO L0303-CVG-NUM-N.
           MOVE ZEROES                      TO L0303-TRNXT-TRXN-AMT.
           MOVE L9450-REMIT-DT              TO L0303-TRNXT-VAR-1-INFO.

           SET L0303-PLAPS-ASURR-RPT-DOC  TO TRUE.
           SET L0303-TRNXT-TYP-MISC-PRT  TO TRUE.

           PERFORM  0303-1000-WRITE-PRTX-TRAN
               THRU 0303-1000-WRITE-PRTX-TRAN-X.
               
       3280-GEN-PLSN-NOTI-DOC-X.
           EXIT.
      /
      *-----------------
       9000-PRINT-STATS.
      *-----------------

           MOVE SPACES                      TO WS-CONTROL-TOTAL-LINE.
      
      *MSG: TOTAL NUMBER OF INPUT RECORDS READ  =
           MOVE 'CS98470004'           TO WGLOB-MSG-REF-INFO.
           
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
      
           MOVE WGLOB-MSG-TXT          TO WS-TOTAL-TEXT.
           MOVE WS-DLY-INPUT-READ      TO WS-TOTAL-VALUE.
      
           MOVE WS-CONTROL-TOTAL-LINE  TO L0040-INPUT-LINE.
      
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

      *MSG: NUMBER OF PLSA RECORDS PROCESSED SUCCESSFULLY =
           MOVE 'CS98470005'           TO WGLOB-MSG-REF-INFO.
           
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
      
           MOVE WGLOB-MSG-TXT          TO WS-TOTAL-TEXT.
           MOVE WS-PLSA-PRCES-SUCS     TO WS-TOTAL-VALUE.

           MOVE WS-CONTROL-TOTAL-LINE  TO L0040-INPUT-LINE.

           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

      *MSG: NUMBER OF PLSA POLICIES ERRORED OUT  =
           MOVE 'CS98470006'           TO WGLOB-MSG-REF-INFO.
           
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
      
           MOVE WGLOB-MSG-TXT          TO WS-TOTAL-TEXT.
           MOVE WS-PLSA-PRCES-ERROR    TO WS-TOTAL-VALUE.

           MOVE WS-CONTROL-TOTAL-LINE  TO L0040-INPUT-LINE.

           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
               
      *MSG: NUMBER OF RECORDS WRITTEN IN ERROR LIST  =
           MOVE 'CS98470007'           TO WGLOB-MSG-REF-INFO.
           
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
      
           MOVE WGLOB-MSG-TXT          TO WS-TOTAL-TEXT.
           MOVE WS-ERROR-WRITE         TO WS-TOTAL-VALUE.

           MOVE WS-CONTROL-TOTAL-LINE  TO L0040-INPUT-LINE.

           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       9000-PRINT-STATS-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  9847-4000-CLOSE
               THRU 9847-4000-CLOSE-X.
               
           PERFORM  PLSN-4000-CLOSE
               THRU PLSN-4000-CLOSE-X.
               
           PERFORM  PRT9-4000-CLOSE
               THRU PRT9-4000-CLOSE-X.
               
           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.
           
       9999-CLOSE-FILES-X.
           EXIT.

      /
      *****************************************************************
      *    PROCESSING COPYBOOKS                                       *
      *****************************************************************
      *
       COPY CCPPCCC.
      /
      *****************************************************************
      *    LINKAGE COPYBOOKS                                          *
      *****************************************************************
       COPY CCPS0010.
       COPY CCPL0010.
      /
       COPY NCPS0960.
       COPY NCPL0960.
      /
       COPY XCPL0040.
      /
       COPY XCPL0260.
      /
       COPY XCPS0290.
       COPY XCPL0290.
      /
       COPY XCPL1640.
      /
       COPY XCPL1680.
      /
       COPY XCPL0030.
       COPY XCPL0035.
      /
       COPY CCPS0950.
       COPY CCPL0950.
      /
       COPY CCPS5020.
       COPY CCPL5020.
      /
       COPY CCPS9450.
       COPY CCPL9450.
      /
       COPY XCPS9124.
       COPY XCPL9124.
      /
       COPY XCPS2490.
       COPY XCPL2490.
      /
       COPY CCPL2430.
       COPY CCPS2430.
      /
       COPY NCPS0303.
       COPY NCPL0303.
      /
       COPY CCPS0083.
       COPY CCPL0083.
      /
       COPY CCPS9215.
       COPY CCPL9215.
      /
       COPY CCPL2440.
      /
       COPY CCPSPGA.
      /
      ****************************************************************
      *  FILE I/O PROCESS MODULE                                     *
      ****************************************************************
       COPY CCPUPOL.
      /
       COPY NCPPCVGS.
      /
       COPY CCPIPRT9.
      /
      *****************************************************************
      *    FILE I/O LINKAGE & PROCESS MODULES                         *
      *****************************************************************
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
       COPY CCPNCVG.
      /
       COPY CCPNPOL.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY 9847
                               ==':PGM:'== BY =='CSRQ9847'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY 9847.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY ==9847==.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY PLSN
                               ==':PGM:'== BY =='CSRQPLSN'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY PLSN.
       COPY XCSASEQ  REPLACING ==:ID:==  BY PLSN.
      /
      *
      *****************************************************************
      **                 END OF PROGRAM ZSBM9847                     **
      *****************************************************************
