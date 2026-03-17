      *****************************************************************
      **  MEMBER :  XSOM0060                                         **
      **  REMARKS:  PROCESS THE APPLICATION SIGN ON TRANSACTION      **
      **            (APLS / ENTR).                                   **
      **                                                             **
      **            ON INITIAL ENTRY, THIS MODULE PRESENTS THE LOGO  **
      **            SCREEN TO ALLOW THE USER TO SIGN ON.  IF A VALID **
      **            USERID, PASSWORD AND COMPANY ARE ENTERED, THE    **
      **            ALLOWABLE APPLICATIONS ARE RETRIEVED FROM THE    **
      **            ASCL TABLE.  THE USER MAY CONNECT, DISCONNECT,   **
      **            OR SIGNOFF.  THE APPLICATION EXIT PROGRAM FROM   **
      **            THE APPL RECORD IS CALLED FOR EACH APPLICATION   **
      **            REQUESTED.                                       **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
53-062**  30NOV95  VK     ARCHITECTURE CHANGES TO SUPPORT GRAPHICAL  **
53-062**                  USER INTERFACE                             **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
53-062**  30NOV95  CG     CHANGE COPY XC4GMSIN TO XCPGMSIN           **
53-068**  30NOV95  REC    HIDDEN FIELDS IN THE MIR MUST BE MOVED TO  **
53-068**                  THE COMM SPECIFIC AREA                     **
530128**  01APR96  RLE    CICS DISCONNECT SHOULD NOT BE ISSUED WHEN  **
530128**                  SIGN-OFF REQUEST ORIGINATED FROM THE GUI,  **
530128**                  UPDATE TERM ID REGARDLESS OF SYSTEM RECORD **
530143**  10MAY96  RLE    ADDED LOGIC TO CHECK FOR PASSWORD EXPIRY   **
530143**                  IN 3000-PROCESS-SIGN-ON FOR GUI SUPPORT    **
54-001**  01SEP96  MIG    MODIFICATIONS FOR MAINTAINABILITY          **
54-010**  01JAN97  JMG    MODIFICATIONS FOR SPANISH SUPPORT          **
54-700**  31DEC96  FM     PREVENT ACCESS WHEN PASSWORD EXPIRED       **
554712**  30SEP97  MS     READ APPL DESC TXT FROM XTAB TABLE         **
557660**  30SEP97  CG     CHANGE TO STANDARD                         **
557698**  30SEP97  MS     ADD COPYBOOKS XCWL0005, XCPS0005, AND      **
557698**                  XCPL0005 FOR MIXED-CASE SUPPORT            **
557708**  30SEP97  MS     INCLUDE NEW ABEND HANDLING                 **
557756**  30SEP97  SC     REMOVE MULTILANGUAGE TEXT                  **
008445**  31MAR98  552    GENERATE MIR FROM TECH ARCH DATA BASE      **
008453**  31MAR98  552    ADD DATE FORMATTING TO GLOBAL AREA         **
008455**  31MAR98  552    ADD NUMERIC FORMATTING TO GLOBAL AREA      **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
005409**  30OCT98  56     MODIFICATIONS FOR LEAP YEAR                **
010418**  30OCT98  56     MODIFICATIONS REQUIRED TO SUPPORT MULTI-CO **
011554**  30OCT98  56     FIX TO AVOID CICS ABENDS WHEN TRYING TO    **
011554**                  START A TRANSACTION ON A NON-EXISTING TERM **
010311**  30OCT98  56     CODE CLEANUP - FIX MSG 0020                **
012675**  30OCT98  56     'DISCARD' MIR-USER-PSWD-TXT WHEN NO LONGER **
012675**                  REQUIRED                                   **
013578**  15DEC99  60     RENAME OF MIR FIELDS, REMOVAL OF 3270 LOGIC**
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
015543**  15DEC99  60     CODE CLEANUP                               **
016083**  30JUN00  602J   SPACES OUT PROCESSING DATE IF IT IS EQUAL  **
016083**                  LOW-DATE IN SIGN-ON CONNECT                **
PF 1.2**           612J   UPGRADE TO PATHFINDER 1.2                  **
01MI06**  01AUG01  EKM    MCL SECURITY CHANGES                       **
B10255**  01AUG01  EKM    FIX PROBLEM WITH PASSWORD CHANGE IN FUTURE.**
02MI01**  30JUN02  MAW    LOGIN FAILURE MONITORING AND PASSWORD      **
02MI01**                  ENCRYPTION                                 **
      **                                                             **
PF 13 ** -----  RETROFITTED PATHFINDER RELEASE 1.3 CODE  ----------- **
      **                                                             **
017150**  09FEB01  612J    CURRENCY SCALING   (ADDED WITH PF 13 CHGS)**
016548**  6.2       CHANGE COMP TO BINARY     (ADDED WITH PF 13 CHGS)**
016686**  6.2       PROCESSING DATE CHANGES FOR CONCURRENCY          **
016770**  6.2       USES TABLE ACCESS TUNING                         **
018273**  6.2       PATHFINDER 1.2                                   **
PF 13 **  1.3       PATHFINDER 1.3                                   **
PF 20 **  2.0       PATHFINDER 2.0                                   **
SESCAP**  31OCT04  AC     SESSION CAP ENHANCEMENT                    **
P02188**  21MAR05  RZ     NEW SECURITY ENHANCEMENT                   **
      *****************************************************************

       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM0060.

       COPY XCWWCRHT.

      /
      *--------------------
       ENVIRONMENT DIVISION.
      *--------------------
      *
      *--------------
       DATA DIVISION.
      *--------------
      *
       WORKING-STORAGE SECTION.
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM0060'.

       COPY SQLCA.
       COPY XCWLPTR.

014590*COPY XCWL0030.

       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                 PIC X(04).
               88  WS-BUS-FCN-VALID          VALUE '0060',
                                                   '0061',
                                                   '0062',
                                                   '0063',
                                                   '0064'.
               88  WS-BUS-FCN-RETRIEVE       VALUE '0060'.
               88  WS-BUS-FCN-CONNECT        VALUE '0061'.
               88  WS-BUS-FCN-SIGNOFF        VALUE '0062'.
               88  WS-BUS-FCN-PASSWORD       VALUE '0063'.
               88  WS-BUS-FCN-LOGIN          VALUE '0064'.

016548*    05  SUB1                         PIC S9(4)  VALUE ZERO COMP.         
016548     05  SUB1                         PIC S9(4)  VALUE ZERO               
016548                                      BINARY.                         
016548*    05  SUB2                         PIC S9(4)  VALUE ZERO COMP.         
016548     05  SUB2                         PIC S9(4)  VALUE ZERO               
016548                                      BINARY.                         
           05  WS-PASS-EXP-DAYS             PIC S9(7)  COMP-3.
           05  WS-BATCH-NUMBER-DISP         PIC ZZ99999.
           05  WS-ERROR-SW                  PIC X(01).
               88  WS-ERROR-FOUND           VALUE 'Y'.
               88  WS-ERROR-NO              VALUE 'N'.
           05  WS-VALID-PSWD-IND            PIC X(01).
               88  WS-VALID-PSWD-OK         VALUE 'Y'.
               88  WS-VALID-PSWD-EXPIRED    VALUE 'N'.
           05  WS-HOLD-USES-REC-INFO        PIC X(150).
           05  WS-PROCESS-DATE              PIC X(10).
02MI01     05  WS-TIME                      PIC X(07).
02MI01     05  WS-TIME-N                    REDEFINES
02MI01         WS-TIME                      PIC 9(07).
02MI01     05  WS-TXT-SRC-REF-ID            PIC X(05)   VALUE SPACES.
      /
           05  WS-DV-APPL-STAT-CD           PIC X(01).
               88  WS-DV-APPL-STAT-ACTIVE   VALUE '1'.
               88  WS-DV-APPL-STAT-STOPPED  VALUE '2'.
               88  WS-DV-APPL-STAT-INACTIVE VALUE '3'.
               88  WS-DV-APPL-STAT-UNKNOWN  VALUE '9'.

           05  WS-USER-SESN-CTRY-CD         PIC X(02).
           05  WS-USER-SESN-CRCY-CD         PIC X(02).
           05  WS-USER-SESN-PRCES-DT        PIC X(10).
SESCAP     05  WS-MAX-SESN-NUM              PIC 9(05).
SESCAP     05  WS-TOT-ACT-SESN-NUM          PIC 9(05).
 
      /
SESCAP COPY XCWL0035.
SESCAP COPY XCWL1580.
SESCAP COPY CCFRPSYS.
SESCAP COPY CCFWPSYS.
      /
       COPY XCWL1640.
       COPY XCWL8095.
      /
       COPY XCWL0020.
      /
       COPY XCFWAPPL.
       COPY XCFRAPPL.
      /
       COPY XCFWASCL.
       COPY XCFRASCL.
      /
       COPY XCFWUSCL.
       COPY XCFRUSCL.
      /
02MI01 COPY CCFWUSAU.
02MI01 COPY CCFRUSAU.
      /
       COPY XCFWUSEC.
       COPY XCFRUSEC.
      /
       COPY XCFWUSEU.
SESCAP COPY XCFWUSEE.
       COPY XCFWUSES.
       COPY XCFRUSES.
      /
       COPY XCFWXTAB.
       COPY XCFRXTAB.
      /
       COPY XCWWPASS.
      /
       COPY XCWLDTLK.
      /
       COPY XCWL1670.
      /
       COPY XCWL1680.
      /
       COPY XCWWWKDT.
      /
       COPY XCWL0005.
      /
       COPY XCWL2490.
      /
02MI01 COPY XCWL9684.
      /
      *---------------
       LINKAGE SECTION.
      *---------------

       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM0060.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                MIR-PARM-AREA.

      *-------------
       0000-MAINLINE.
      *-------------

           PERFORM  ABND-1000-HANDLE-ABEND
               THRU ABND-1000-HANDLE-ABEND-X.

           PERFORM  1000-PROCESS-REQUEST
               THRU 1000-PROCESS-REQUEST-X.

           PERFORM EXIT-1000-FINALIZE
              THRU EXIT-1000-FINALIZE-X.


           GOBACK.

       0000-MAINLINE-X.
           EXIT.
      /

      *--------------------
       1000-PROCESS-REQUEST.
      *--------------------

           PERFORM  9300-SETUP-MSIN-REFERENCE
               THRU 9300-SETUP-MSIN-REFERENCE-X.

           MOVE MIR-BUS-FCN-ID                 TO WS-BUS-FCN-ID.
           SET MIR-RETRN-OK                    TO TRUE.
           SET WS-VALID-PSWD-OK                TO TRUE.

           EVALUATE TRUE

               WHEN WS-BUS-FCN-LOGIN
                    PERFORM  2000-PROCESS-LOGIN
                        THRU 2000-PROCESS-LOGIN-X

               WHEN WS-BUS-FCN-RETRIEVE
                    PERFORM  3000-PROCESS-RETRIEVE
                        THRU 3000-PROCESS-RETRIEVE-X

               WHEN WS-BUS-FCN-CONNECT
                    PERFORM  4000-PROCESS-CONNECT
                        THRU 4000-PROCESS-CONNECT-X

               WHEN WS-BUS-FCN-SIGNOFF

                    PERFORM  5000-PROCESS-LOGOUT
                        THRU 5000-PROCESS-LOGOUT-X

               WHEN WS-BUS-FCN-PASSWORD
                    PERFORM  6000-PROCESS-PASSWORD
                        THRU 6000-PROCESS-PASSWORD-X

               WHEN OTHER
      *MSG:  INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID        TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM0060'            TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000237'          TO WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET MIR-RETRN-INVALD-RQST  TO TRUE

           END-EVALUATE.

       1000-PROCESS-REQUEST-X.
           EXIT.
      /
      *------------------
       2000-PROCESS-LOGIN.
      *------------------

           SET WS-ERROR-NO                     TO TRUE.

           PERFORM  7000-LOGIN-EDITS
               THRU 7000-LOGIN-EDITS-X.

P02188     IF RUSEC-USER-LOGIN-LOCK
P02188     OR RUSEC-USER-LOGIN-XPRY
P02188         PERFORM  9100-DISPLAY-THIS-APPL
P02188             THRU 9100-DISPLAY-THIS-APPL-X
P02188         GO TO 2000-PROCESS-LOGIN-X
P02188     END-IF.

           IF WS-ERROR-FOUND
               PERFORM  9100-DISPLAY-THIS-APPL
                   THRU 9100-DISPLAY-THIS-APPL-X
               GO TO 2000-PROCESS-LOGIN-X
           END-IF.

           MOVE MIR-USER-ID                TO WUSEU-USER-ID.

           PERFORM  USEU-1000-READ
               THRU USEU-1000-READ-X.

           IF  WUSEU-IO-OK
               SET WUSES-IO-OK             TO TRUE
               IF  RUSES-CO-ID         NOT =  MIR-CO-ID
PF 1.2*        AND RUSES-USER-SESN-STAT-CONN
PF 1.2         AND RUSES-USER-SESN-STAT-API-CONN
      *MSG: USERID CURRENTLY SIGNED ON ANOTHER COMPANY
                   MOVE 'XS00600021'       TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
                   PERFORM  9100-DISPLAY-THIS-APPL
                       THRU 9100-DISPLAY-THIS-APPL-X
                   GO TO 2000-PROCESS-LOGIN-X
               END-IF
           END-IF.

           IF  WUSEU-IO-OK
PF 1.2*        IF  RUSES-USER-SESN-STAT-NOT-CONN
PF 1.2         IF  NOT RUSES-USER-SESN-STAT-API-CONN
                   PERFORM  2010-DELETE-OLD-USES
                       THRU 2010-DELETE-OLD-USES-X
               ELSE
                   PERFORM  2020-REESTABLISH-USES-RECORD
                       THRU 2020-REESTABLISH-USES-RECORD-X
               END-IF
           END-IF.

           MOVE RUSCL-SECUR-CNFD-ACCS-CD   TO WGLOB-SECUR-CNFD-ACCS-CD.
           MOVE RUSCL-SECUR-LVL-CD         TO WGLOB-SECUR-LVL-CD.
           MOVE RUSEC-SECUR-CLAS-ID        TO WGLOB-SECUR-CLAS-ID.
           MOVE RUSEC-BR-ID                TO WGLOB-USER-BRANCH-CODE.
           MOVE RUSEC-USER-RPT-DSTRB-CD    TO WGLOB-USER-RPT-DSTRB-CD.

           PERFORM  2490-1000-BUILD-PARM-INFO
               THRU 2490-1000-BUILD-PARM-INFO-X.

           MOVE 'XSDU1640'                TO L2490-TXT-SRC-ID.
           MOVE '00001'                   TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           IF L2490-RETRN-OK
               MOVE L2490-TXT-STR-TXT     TO WGLOB-MOS-ABBR-TXT
           ELSE
               MOVE 'JANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC'
                                          TO WGLOB-MOS-ABBR-TXT
           END-IF.

           PERFORM  9000-COMPUTE-PASS-EXP-DAYS
               THRU 9000-COMPUTE-PASS-EXP-DAYS-X.

           PERFORM 9500-CHECK-ASCL
              THRU 9500-CHECK-ASCL-X.

           IF WS-DV-APPL-STAT-ACTIVE
           OR RUSES-USER-SESN-STAT-NOT-CONN
               PERFORM 2040-COMPLETE-SIGNON
                  THRU 2040-COMPLETE-SIGNON-X
           ELSE
               IF WUSEU-IO-NOT-FOUND
                   PERFORM 2050-SIGNON-NOT-CONNECT
                      THRU 2050-SIGNON-NOT-CONNECT-X
               END-IF
           END-IF.

           PERFORM 9100-DISPLAY-THIS-APPL
              THRU 9100-DISPLAY-THIS-APPL-X.
    I
016686     MOVE RUSES-USER-SESN-ID       TO WUSES-USER-SESN-ID.
016686     PERFORM USES-1000-READ-FOR-UPDATE
016686        THRU USES-1000-READ-FOR-UPDATE-X.
016686     IF WUSES-IO-OK
016770        MOVE WGLOB-SECUR-CNFD-ACCS-CD  TO RUSES-SECUR-CNFD-ACCS-CD
016770        MOVE WGLOB-SECUR-LVL-CD        TO RUSES-SECUR-LVL-CD
016770        MOVE WGLOB-SECUR-CLAS-ID       TO RUSES-SECUR-CLAS-ID
016770        MOVE WGLOB-USER-BRANCH-CODE    TO RUSES-BR-ID
016770        MOVE WGLOB-USER-RPT-DSTRB-CD   TO RUSES-RPT-DSTRB-CD
016770        MOVE WGLOB-DT-FRMT-CD          TO RUSES-CTRY-DT-FRMT-CD
016770        MOVE WGLOB-DT-SEPARATOR-SYMBL  TO RUSES-CTRY-DT-SPRT-CD
016770        MOVE WGLOB-DT-ZERO-SUPRES-IND  TO RUSES-CTRY-LEAD-ZERO-IND
016770        MOVE WGLOB-CRCY-SYMBL          TO RUSES-CRCY-SYMBL-CD
016770        MOVE WGLOB-CRCY-POSN-CD        TO RUSES-CRCY-PLACE-CD
016770        MOVE WGLOB-SIGN-POSN-CD        TO RUSES-CRCY-NEG-PLACE-CD
016770        MOVE WGLOB-DCML-SYMBL          TO RUSES-CRCY-DCML-SPRT-CD
016770        MOVE WGLOB-THOUSANDS-SYMBL     TO RUSES-CRCY-THOU-SPRT-CD
016686        PERFORM USES-2000-REWRITE
016686           THRU USES-2000-REWRITE-X
016686     END-IF.

P02188     IF  WS-ERROR-FOUND 
P02188     OR  WS-VALID-PSWD-EXPIRED
P02188        GO TO 2000-PROCESS-LOGIN-X
P02188     END-IF.

P02188     IF RUSEC-USER-UNSUCS-QTY NOT = '0'
P02188     OR RUSEC-USER-ID-XPRY-DT NOT = SPACES
P02188     OR NOT RUSEC-USER-LOGIN-PASSED  

P02188         MOVE WGLOB-USER-ID            TO WUSEC-USER-ID
P02188         PERFORM  USEC-1000-READ-FOR-UPDATE
P02188             THRU USEC-1000-READ-FOR-UPDATE-X

P02188         IF WUSEC-IO-OK
P02188            MOVE ZERO                  TO RUSEC-USER-UNSUCS-QTY-N
P02188            SET  RUSEC-USER-LOGIN-PASSED    TO TRUE
P02188            MOVE SPACES                TO RUSEC-USER-ID-XPRY-DT
P02188            PERFORM  USEC-2000-REWRITE
P02188                THRU USEC-2000-REWRITE-X
P02188         END-IF
P02188     END-IF.

       2000-PROCESS-LOGIN-X.
           EXIT.

      *--------------------
       2010-DELETE-OLD-USES.
      *--------------------

           MOVE RUSES-USER-SESN-ID        TO WUSES-USER-SESN-ID.
           PERFORM  USES-1000-READ-FOR-UPDATE
               THRU USES-1000-READ-FOR-UPDATE-X.
           IF WUSES-IO-OK
               PERFORM  USES-1000-DELETE
                   THRU USES-1000-DELETE-X
               INITIALIZE RUSES-REC-INFO
           END-IF.
           SET WUSES-IO-NOT-FOUND         TO TRUE.

       2010-DELETE-OLD-USES-X.
           EXIT.
      /
      *----------------------------
       2020-REESTABLISH-USES-RECORD.
      *----------------------------

           IF  RUSES-USER-SESN-ID NOT = WGLOB-USER-SESN-ID
               PERFORM  2021-CREATE-NEW-USES
                   THRU 2021-CREATE-NEW-USES-X
           END-IF.

           MOVE RUSES-USER-ID                  TO L8095-USER-ID.
           PERFORM  8095-2000-CLEANUP-TWRK
               THRU 8095-2000-CLEANUP-TWRK-X.

       2020-REESTABLISH-USES-RECORD-X.
           EXIT.

      *--------------------
       2021-CREATE-NEW-USES.
      *--------------------

      *** MSG:  USES RECORD RE-ESTABLISHED
           MOVE 'XS00600020'                   TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

           MOVE RUSES-REC-INFO                 TO WS-HOLD-USES-REC-INFO.
           MOVE RUSES-KEY                      TO WUSES-KEY.
           PERFORM  USES-1000-READ-FOR-UPDATE
               THRU USES-1000-READ-FOR-UPDATE-X.

           IF WUSES-IO-OK
               PERFORM  USES-1000-DELETE
                   THRU USES-1000-DELETE-X
           END-IF.

           MOVE WGLOB-USER-SESN-ID             TO WUSES-USER-SESN-ID.
           PERFORM  USES-1000-CREATE
               THRU USES-1000-CREATE-X.

           MOVE WS-HOLD-USES-REC-INFO          TO RUSES-REC-INFO.
PF 1.2*    SET RUSES-USER-SESN-STAT-CONN       TO TRUE.
PF 1.2     SET RUSES-USER-SESN-STAT-API-CONN   TO TRUE.
           MOVE WUSES-KEY                      TO RUSES-KEY.
           IF  WS-VALID-PSWD-EXPIRED
               SET RUSES-USER-SESN-STAT-NOT-CONN TO TRUE
               MOVE SPACES                    TO RUSES-USER-SESN-CTRY-CD
               MOVE SPACES                    TO RUSES-USER-SESN-CRCY-CD
           END-IF.
           PERFORM  USES-1000-WRITE
               THRU USES-1000-WRITE-X.

       2021-CREATE-NEW-USES-X.
           EXIT.

      *--------------------
       2040-COMPLETE-SIGNON.
      *--------------------

           PERFORM 9200-SETUP-L0020-AREA
              THRU 9200-SETUP-L0020-AREA-X.

           IF WUSEU-IO-OK
               NEXT SENTENCE
           ELSE
               MOVE WS-PROCESS-DATE        TO L1640-INTERNAL-DATE
               PERFORM 1640-2000-INTERNAL-TO-EXT
                  THRU 1640-2000-INTERNAL-TO-EXT-X
               MOVE L1640-EXTERNAL-DATE    TO L0020-PROCESS-DATE-DISP
               MOVE WS-PROCESS-DATE        TO L0020-PROCESS-DATE
               MOVE WS-USER-SESN-CTRY-CD   TO L0020-COUNTRY-CODE
               MOVE WS-USER-SESN-CRCY-CD   TO L0020-CURRENCY-CODE
           END-IF.

           MOVE RUSEC-PRTR-ID              TO L0020-USER-PDEST.
           MOVE RUSEC-USER-RPT-DSTRB-CD    TO L0020-USER-DIST-CODE.

           SET L0020-REQ-SIGN-ON           TO TRUE

           MOVE MIR-DV-APPL-STAT-CD        TO WS-DV-APPL-STAT-CD

           SET WS-ERROR-NO                 TO TRUE.
           EVALUATE TRUE

              WHEN  WS-DV-APPL-STAT-INACTIVE
              WHEN  WS-DV-APPL-STAT-STOPPED
      *MSG: DID NOT CONNECT. APPLICATION NOT AVAILABLE FOR SIGN-ON
                  MOVE 'XS00600015'        TO WGLOB-MSG-REF-INFO
                  PERFORM  0260-1000-GENERATE-MESSAGE
                      THRU 0260-1000-GENERATE-MESSAGE-X
                  SET WS-ERROR-FOUND       TO TRUE

              WHEN  WS-DV-APPL-STAT-ACTIVE
                  PERFORM  7570-EDIT-CTRY-CURR
                      THRU 7570-EDIT-CTRY-CURR-X
                  IF WS-USER-SESN-CTRY-CD NOT =
                     RASCL-ASCL-CTRY-CD (SUB1)
                  OR WS-USER-SESN-CRCY-CD NOT =
                     RASCL-ASCL-CRCY-CD (SUB1 SUB2)
                      SET WS-ERROR-FOUND       TO TRUE
                  END-IF

           END-EVALUATE.

           IF WS-ERROR-FOUND
               PERFORM  9100-DISPLAY-THIS-APPL
                   THRU 9100-DISPLAY-THIS-APPL-X
               GO TO 2040-COMPLETE-SIGNON-X
           END-IF.

           PERFORM 0020-1000-LINK-TO-APPL
              THRU 0020-1000-LINK-TO-APPL-X.

           IF L0020-RES-DATA-ERROR
               PERFORM 8000-DATA-ERROR
                  THRU 8000-DATA-ERROR-X
               GO TO 2040-COMPLETE-SIGNON-X
           END-IF.

P02188     IF  RUSEC-USER-ID-XPRY-DT NOT = SPACES
P02188     AND L0020-PROCESS-DATE > RUSEC-USER-ID-XPRY-DT
P02188         PERFORM  2045-USER-ID-XPRY
P02188            THRU  2045-USER-ID-XPRY-X
P02188         SET WS-ERROR-FOUND               TO TRUE
P02188         GO TO 2040-COMPLETE-SIGNON-X
P02188     END-IF.
P02188
           MOVE  WGLOB-USER-SESN-ID             TO WUSES-USER-SESN-ID.
           PERFORM  USES-1000-READ
               THRU USES-1000-READ-X.

           IF WUSES-IO-NOT-FOUND
               PERFORM  2041-ACTION-WITHOUT-USES
                   THRU 2041-ACTION-WITHOUT-USES-X
           END-IF.

       2040-COMPLETE-SIGNON-X.
           EXIT.
      /
      *------------------------
       2041-ACTION-WITHOUT-USES.
      *------------------------

           EVALUATE TRUE
             WHEN L0020-RES-SIGN-ON
                MOVE WGLOB-USER-SESN-ID      TO WUSES-USER-SESN-ID
                PERFORM  USES-1000-CREATE
                    THRU USES-1000-CREATE-X
                MOVE L0020-CO-ID             TO RUSES-CO-ID
                MOVE MIR-USER-ID             TO RUSES-USER-ID
                MOVE L0020-COUNTRY-CODE      TO RUSES-USER-SESN-CTRY-CD
                MOVE L0020-CURRENCY-CODE     TO RUSES-USER-SESN-CRCY-CD
                MOVE L0020-PROCESS-DATE      TO L1680-INTERNAL-1
                MOVE ZERO                    TO L1680-NUMBER-OF-YEARS
                MOVE ZERO                    TO L1680-NUMBER-OF-MONTHS
                MOVE ZERO                    TO L1680-NUMBER-OF-DAYS
                PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
                    THRU 1680-3000-ADD-Y-M-D-TO-DATE-X
                MOVE L1680-INTERNAL-2        TO RUSES-USER-SESN-PRCES-DT
                MOVE L0020-BATCH-NUMBER      TO RUSES-USER-SESN-BTCH-NUM
                MOVE RAPPL-APPL-EDIT-LANG-CD TO RUSES-EDIT-LANG-CD
                IF  WS-VALID-PSWD-EXPIRED
                    SET RUSES-USER-SESN-STAT-NOT-CONN TO TRUE
                    MOVE SPACES              TO RUSES-USER-SESN-CTRY-CD
                    MOVE SPACES              TO RUSES-USER-SESN-CRCY-CD
                END-IF
                PERFORM  USES-1000-WRITE
                    THRU USES-1000-WRITE-X

             WHEN L0020-RES-DISCONNECT
      *MSG: ANOTHER USER IS SIGNED ONTO THE APPLICATION ON THIS TERMINAL
                MOVE 'XS00600019'        TO WGLOB-MSG-REF-INFO
                PERFORM  0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X

             WHEN L0020-RES-EDITS-FAILURE
      *MSG: PROCESS DATE, COUNTRY AND CURRENCY MUST BE THE SAME FOR ALL
      *          APPS
                MOVE 'XS00600028'        TO WGLOB-MSG-REF-INFO
                PERFORM  0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X

             WHEN OTHER
                MOVE 'XS00600027'        TO WGLOB-MSG-REF-INFO
                PERFORM  0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X
           END-EVALUATE.

       2041-ACTION-WITHOUT-USES-X.
           EXIT.

P02188*------------------
P02188 2045-USER-ID-XPRY.
P02188*------------------
P02188
P02188     MOVE WGLOB-USER-ID                 TO WUSEC-USER-ID.
P02188     PERFORM  USEC-1000-READ-FOR-UPDATE
P02188         THRU USEC-1000-READ-FOR-UPDATE-X.
P02188
P02188     IF WUSEC-IO-OK
P02188
P02188        SET RUSEC-USER-LOGIN-XPRY       TO TRUE
P02188
P02188        PERFORM  USEC-2000-REWRITE
P02188            THRU USEC-2000-REWRITE-X
P02188
P02188        IF  WS-VALID-PSWD-OK
P02188*MSG:USER PASSWORD HAS EXPIRIED,PLEASE CONTACT ADMINSTRATOR TO UNLOCK IT.
P02188            MOVE 'XS00609002'           TO WGLOB-MSG-REF-INFO
P02188            PERFORM 0260-1000-GENERATE-MESSAGE
P02188                THRU 0260-1000-GENERATE-MESSAGE-X
P02188        END-IF
P02188     ELSE
P02188        MOVE WUSEC-KEY                  TO WGLOB-MSG-PARM (1)
P02188        MOVE 'XS00000006'               TO WGLOB-MSG-REF-INFO
P02188        PERFORM  0260-1000-GENERATE-MESSAGE
P02188            THRU 0260-1000-GENERATE-MESSAGE-X
P02188
P02188     END-IF.
P02188
P02188 2045-USER-ID-XPRY-X.
P02188     EXIT.

      *-----------------------
       2050-SIGNON-NOT-CONNECT.
      *-----------------------
      *  THIS PARAGRAPH WILL CREATE A USES RECORD FOR THE USER WITHOUT
      *  THE REQUIRED BATCH NUMBER, PROCESSING DATE, COUNTRY AND CURRENCY

           IF  NOT WS-DV-APPL-STAT-INACTIVE
           AND NOT WS-DV-APPL-STAT-STOPPED
               GO TO 2050-SIGNON-NOT-CONNECT-X
           END-IF.

           MOVE WGLOB-USER-SESN-ID      TO WUSES-USER-SESN-ID.
           PERFORM  USES-1000-CREATE
               THRU USES-1000-CREATE-X.
           MOVE L0020-CO-ID             TO RUSES-CO-ID.
           MOVE MIR-USER-ID             TO RUSES-USER-ID.
           MOVE SPACE                   TO RUSES-USER-SESN-CTRY-CD.
           MOVE SPACE                   TO RUSES-USER-SESN-CRCY-CD.
           MOVE WWKDT-LOW-DT            TO RUSES-USER-SESN-PRCES-DT.
           MOVE ZERO                    TO RUSES-USER-SESN-BTCH-NUM.
           MOVE RAPPL-APPL-EDIT-LANG-CD TO RUSES-EDIT-LANG-CD.
           SET RUSES-USER-SESN-STAT-NOT-CONN  TO TRUE.
           PERFORM  USES-1000-WRITE
               THRU USES-1000-WRITE-X.

       2050-SIGNON-NOT-CONNECT-X.
           EXIT.
      /
      *---------------------
       3000-PROCESS-RETRIEVE.
      *---------------------
           MOVE WGLOB-USER-SESN-ID              TO WUSES-USER-SESN-ID.
           PERFORM  USES-1000-READ
               THRU USES-1000-READ-X.

PF 13 *    MOVE WGLOB-USER-ID                   TO WUSEC-USER-ID.
PF 13 *    PERFORM  USEC-1000-READ
PF 13 *        THRU USEC-1000-READ-X.
PF 13 *
PF 13 *    IF NOT WUSEC-IO-OK
PF 13 *        GO TO 3000-PROCESS-RETRIEVE-X
PF 13 *    END-IF.
PF 13 *
PF 13 *    PERFORM  9000-COMPUTE-PASS-EXP-DAYS
PF 13 *        THRU 9000-COMPUTE-PASS-EXP-DAYS-X
PF 13 *
PF 13 *    IF WS-PASS-EXP-DAYS > RUSEC-USER-PSWD-XPRY-DUR OR
PF 13 *        WS-PASS-EXP-DAYS = RUSEC-USER-PSWD-XPRY-DUR
PF 13 *MSG: YOUR PASSWORD HAS EXPIRED. USE APPLICATION SIGN-ON TO
PF 13 *           CHANGE PASSWORD.
PF 13 *        MOVE 'XS00600004'                TO WGLOB-MSG-REF-INFO
PF 13 *        PERFORM  0260-1000-GENERATE-MESSAGE
PF 13 *            THRU 0260-1000-GENERATE-MESSAGE-X
PF 13 *    END-IF.

           PERFORM 9100-DISPLAY-THIS-APPL
              THRU 9100-DISPLAY-THIS-APPL-X.
           MOVE WGLOB-USER-ID                   TO MIR-USER-ID.
           MOVE WGLOB-COMPANY-CODE              TO MIR-CO-ID.

       3000-PROCESS-RETRIEVE-X.
           EXIT.

      /
      *--------------------
       4000-PROCESS-CONNECT.
      *--------------------
      *  THIS OPTION WILL ALLOW A USER TO RECONNECT TO A SESSION IF IT
      *  BEEN DISCONNECTED UNDER THE FOLLOWING CIRCUMSTANCES:
      *
      *   1. USER HAS BEEN DISCONNECTED BECAUSE THEY LOGGED INTO ANOTHER
      *        SESSION
      *   2. USER HAS BEEN DISCONNECTED BECAUSE THEY SIGNED OFF THE
      *        SYSTEM TO CONNECT TO ANOTHER COUNTRY OR CURRENCY

           SET WS-ERROR-NO                     TO TRUE.

           PERFORM  7100-CONNECT-EDITS
               THRU 7100-CONNECT-EDITS-X.

           IF MIR-RETRN-RQST-NO-CHANGE
PF 20          PERFORM 9100-DISPLAY-THIS-APPL
PF 20             THRU 9100-DISPLAY-THIS-APPL-X
               GO TO 4000-PROCESS-CONNECT-X
           END-IF.

           MOVE WGLOB-USER-ID          TO MIR-USER-ID.
           MOVE WGLOB-COMPANY-CODE     TO MIR-CO-ID.


           IF WS-ERROR-NO
               PERFORM  4100-CONNECT
                   THRU 4100-CONNECT-X
           END-IF.

       4000-PROCESS-CONNECT-X.
           EXIT.
      /
      *-------------------
       4100-CONNECT.
      *-------------------

           MOVE WGLOB-COMPANY-CODE         TO WAPPL-CO-ID.
           PERFORM APPL-1000-READ
              THRU APPL-1000-READ-X.

           IF NOT WAPPL-IO-OK
      *MSG: APPLICATION (@1) NOT FOUND. FILES OUT OF SYNC.
      *          CONTACT SYSTEMS
               MOVE WAPPL-KEY              TO WGLOB-MSG-PARM (1)
               MOVE 'XS00600006'           TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4100-CONNECT-X
           END-IF.

           PERFORM 9200-SETUP-L0020-AREA
              THRU 9200-SETUP-L0020-AREA-X.

           MOVE MIR-CO-ID                  TO L0020-CO-ID.
           MOVE MIR-USER-SESN-CTRY-CD      TO L0020-COUNTRY-CODE
           MOVE MIR-USER-SESN-CRCY-CD      TO L0020-CURRENCY-CODE

           MOVE RUSEC-PRTR-ID              TO L0020-USER-PDEST.
           MOVE RUSEC-USER-RPT-DSTRB-CD    TO L0020-USER-DIST-CODE.

      * DELETE EXISTING USES RECORD
           MOVE  WGLOB-USER-SESN-ID             TO WUSES-USER-SESN-ID.

           PERFORM USES-1000-READ-FOR-UPDATE
              THRU USES-1000-READ-FOR-UPDATE-X.
           IF WUSES-IO-OK
               PERFORM  USES-1000-DELETE
                   THRU USES-1000-DELETE-X
           END-IF.

           SET L0020-REQ-SIGN-ON           TO TRUE

           PERFORM 0020-1000-LINK-TO-APPL
              THRU 0020-1000-LINK-TO-APPL-X.

           IF L0020-RES-DATA-ERROR
               PERFORM 8000-DATA-ERROR
                  THRU 8000-DATA-ERROR-X
               GO TO 4100-CONNECT-X
           END-IF.

           PERFORM 4120-EVALUATE-L0020-RETURN
              THRU 4120-EVALUATE-L0020-RETURN-X.

           IF WS-ERROR-FOUND
               PERFORM 9100-DISPLAY-THIS-APPL
                  THRU 9100-DISPLAY-THIS-APPL-X
               GO TO 4100-CONNECT-X
           END-IF.

           MOVE  WGLOB-USER-SESN-ID             TO WUSES-USER-SESN-ID.

           PERFORM USES-1000-CREATE
              THRU USES-1000-CREATE-X

           PERFORM  4140-UPDATE-SESSION-REC
               THRU 4140-UPDATE-SESSION-REC-X.

           PERFORM 9100-DISPLAY-THIS-APPL
              THRU 9100-DISPLAY-THIS-APPL-X.

       4100-CONNECT-X.
           EXIT.
      /
      *--------------------------
       4120-EVALUATE-L0020-RETURN.
      *--------------------------

      *    MSG NUM    MEANING
      *     0010      APPLICATION NOT AVAILABLE
      *     0011      USER NOT ON APPLICATION
      *     0018      USES AND APPL CONTROL FILES OUT OF SYNC
      *     0019      ANOTHER USER ALREADY ON THIS TERMINAL (INGENIUM)
      **    0027      UNKNOWN RESPONSE FOR THIS REQUEST

           EVALUATE TRUE
               WHEN L0020-RES-SIGN-ON
                   CONTINUE

               WHEN L0020-RES-DISCONNECT
      *MSG: ANOTHER USER IS SIGNED ONTO THE APPLICATION ON
      *    THIS TERMINAL
                   MOVE 'XS00600019'            TO WGLOB-MSG-REF-INFO
                   PERFORM 0260-1000-GENERATE-MESSAGE
                      THRU 0260-1000-GENERATE-MESSAGE-X
                   SET WS-ERROR-FOUND           TO TRUE

               WHEN L0020-RES-CLOSE-APPL
      *MSG: USER SESSION RECORD EXISTS BUT SYSTEM UNAVAILABLE
                   MOVE 'XS00600010'            TO WGLOB-MSG-REF-INFO
                   PERFORM 0260-1000-GENERATE-MESSAGE
                      THRU 0260-1000-GENERATE-MESSAGE-X
                   SET WS-ERROR-FOUND           TO TRUE

               WHEN L0020-RES-PROHIBIT-ACCESS
      *MSG: USER SESSION RECORD EXISTS BUT USER WAS NOT ON APPLICATION
                   MOVE 'XS00600011'            TO WGLOB-MSG-REF-INFO
                   PERFORM 0260-1000-GENERATE-MESSAGE
                      THRU 0260-1000-GENERATE-MESSAGE-X
                   SET WS-ERROR-FOUND           TO TRUE

               WHEN L0020-RES-LOGOFF
      *MSG: SESSION FILE AND (@1) CONTROL FILES OUT OF SYNC, CONTACT
      *        SYSTEMS
                   MOVE WAPPL-KEY               TO WGLOB-MSG-PARM (1)
                   MOVE 'XS00600018'            TO WGLOB-MSG-REF-INFO
                   PERFORM 0260-1000-GENERATE-MESSAGE
                      THRU 0260-1000-GENERATE-MESSAGE-X
                   SET WS-ERROR-FOUND           TO TRUE

               WHEN OTHER
      *MSG: UNKNOWN RESPONSE FROM APPLICATION EXIT - CONTACT SYSTEMS
                   MOVE 'XS00600027'            TO WGLOB-MSG-REF-INFO
                   PERFORM 0260-1000-GENERATE-MESSAGE
                      THRU 0260-1000-GENERATE-MESSAGE-X
                   SET WS-ERROR-FOUND           TO TRUE

           END-EVALUATE.

       4120-EVALUATE-L0020-RETURN-X.
           EXIT.

      *-----------------------
       4140-UPDATE-SESSION-REC.
      *-----------------------
      *
      *    CLEAN UP MSIN, TWRK, AND USER RECORDS FROM OLD SESSION
      *
           PERFORM  8095-1000-CLEANUP-MSIN-TWRK
               THRU 8095-1000-CLEANUP-MSIN-TWRK-X.
           PERFORM  8095-3000-CLEANUP-USER
               THRU 8095-3000-CLEANUP-USER-X.

           MOVE L0020-COUNTRY-CODE          TO RUSES-USER-SESN-CTRY-CD.
           MOVE L0020-CURRENCY-CODE         TO RUSES-USER-SESN-CRCY-CD.
           MOVE L0020-CO-ID                 TO RUSES-CO-ID.
           MOVE WGLOB-USER-ID               TO RUSES-USER-ID.
           MOVE L0020-PROCESS-DATE          TO RUSES-USER-SESN-PRCES-DT.
           MOVE RAPPL-APPL-EDIT-LANG-CD     TO RUSES-EDIT-LANG-CD.
           MOVE L0020-BATCH-NUMBER          TO RUSES-USER-SESN-BTCH-NUM.
PF 1.2*    SET RUSES-USER-SESN-STAT-CONN    TO TRUE.
PF 1.2     SET RUSES-USER-SESN-STAT-API-CONN TO TRUE.
016770     MOVE WGLOB-SECUR-CNFD-ACCS-CD    TO RUSES-SECUR-CNFD-ACCS-CD.
016770     MOVE WGLOB-SECUR-LVL-CD          TO RUSES-SECUR-LVL-CD.
016770     MOVE WGLOB-SECUR-CLAS-ID         TO RUSES-SECUR-CLAS-ID.
016770     MOVE WGLOB-USER-BRANCH-CODE      TO RUSES-BR-ID.
016770     MOVE WGLOB-USER-RPT-DSTRB-CD     TO RUSES-RPT-DSTRB-CD.
016770     MOVE WGLOB-DT-FRMT-CD            TO RUSES-CTRY-DT-FRMT-CD.
016770     MOVE WGLOB-DT-SEPARATOR-SYMBL    TO RUSES-CTRY-DT-SPRT-CD.
016770     MOVE WGLOB-DT-ZERO-SUPRES-IND    TO RUSES-CTRY-LEAD-ZERO-IND.
016770     MOVE WGLOB-CRCY-SYMBL            TO RUSES-CRCY-SYMBL-CD.
016770     MOVE WGLOB-CRCY-POSN-CD          TO RUSES-CRCY-PLACE-CD.
016770     MOVE WGLOB-SIGN-POSN-CD          TO RUSES-CRCY-NEG-PLACE-CD.
016770     MOVE WGLOB-DCML-SYMBL            TO RUSES-CRCY-DCML-SPRT-CD.
016770     MOVE WGLOB-THOUSANDS-SYMBL       TO RUSES-CRCY-THOU-SPRT-CD.

           PERFORM  USES-1000-WRITE
               THRU USES-1000-WRITE-X.

           MOVE RUSES-USER-SESN-CTRY-CD     TO WGLOB-COUNTRY-CODE.
           MOVE RUSES-USER-SESN-CRCY-CD     TO WGLOB-CURRENCY-CODE.
           MOVE RUSES-CO-ID                 TO WGLOB-COMPANY-CODE.
           MOVE RUSES-USER-SESN-BTCH-NUM    TO WGLOB-USER-SESN-BTCH-NUM.
           MOVE RUSES-USER-SESN-PRCES-DT    TO WGLOB-PROCESS-DATE.

       4140-UPDATE-SESSION-REC-X.
           EXIT.
      /
      *-------------------
       5000-PROCESS-LOGOUT.
      *-------------------

           MOVE WGLOB-USER-SESN-ID         TO WUSES-USER-SESN-ID.
           PERFORM  USES-1000-READ-FOR-UPDATE
               THRU USES-1000-READ-FOR-UPDATE-X.

           MOVE WGLOB-USER-ID              TO L8095-USER-ID.
           PERFORM  8095-1000-CLEANUP-MSIN-TWRK
               THRU 8095-1000-CLEANUP-MSIN-TWRK-X.

           PERFORM  8095-3000-CLEANUP-USER
               THRU 8095-3000-CLEANUP-USER-X.

           MOVE SPACES                     TO L0020-EXIT-RESPONSE.
           MOVE WGLOB-USER-ID              TO L0020-USER-ID.
           MOVE WGLOB-USER-SESN-ID         TO L0020-USER-SESN-ID.
           MOVE WGLOB-COMPANY-CODE         TO L0020-CO-ID.
           SET L0020-REQ-LOGOFF            TO TRUE.

           PERFORM  0020-1000-LINK-TO-APPL
               THRU 0020-1000-LINK-TO-APPL-X.

           PERFORM  USES-1000-DELETE
               THRU USES-1000-DELETE-X.

           IF L0020-RES-LOGOFF
               SET MIR-RETRN-OK            TO TRUE
           END-IF.

       5000-PROCESS-LOGOUT-X.
           EXIT.

      *---------------------
       6000-PROCESS-PASSWORD.
      *---------------------

      *     READ USEC FILE AND UPDATE THE USER'S PASSWORD
      *     IF THE PASSWORD ENTERED IS NOT THE SAME AS THEIR
      *     PREVIOUS PASSWORD.

           MOVE WGLOB-USER-ID                TO WUSEC-USER-ID.

           PERFORM USEC-1000-READ
              THRU USEC-1000-READ-X.
      *
      *    RECORD LOST IN PASSWORD CHANGE  --
      *
           IF NOT WUSEC-IO-OK
      *MSG: USER SECURITY RECORD (@1) LOST - CONTACT SYSTEMS
              MOVE WUSEC-KEY      TO WGLOB-MSG-PARM (1)
              MOVE 'XS00600005'   TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
02MI01        MOVE '90002'        TO WS-TXT-SRC-REF-ID
02MI01        PERFORM  7600-OUTPUT-USAU-RECORD
02MI01            THRU 7600-OUTPUT-USAU-RECORD-X
              GO TO 6000-PROCESS-PASSWORD-X
           END-IF.

P02188     IF RUSEC-USER-LOGIN-LOCK
P02188     OR RUSEC-USER-LOGIN-XPRY
P02188*MSG: USER ID HAS BEEN LOCKED PLEASE CONTACT ADMINSTRATOR TO UNLOCK IT.
P02188         MOVE 'XS00609001'   TO WGLOB-MSG-REF-INFO
P02188         PERFORM 0260-1000-GENERATE-MESSAGE
P02188            THRU 0260-1000-GENERATE-MESSAGE-X
P02188         GO TO 6000-PROCESS-PASSWORD-X
P02188     END-IF.

      *
      *    MUST KNOW CURRENT PASSWORD TO SET NEW PASSWORD
      *
02MI01     PERFORM  9684-1000-BUILD-PARM-INFO
02MI01         THRU 9684-1000-BUILD-PARM-INFO-X.
02MI01     MOVE MIR-USER-PSWD-TXT   TO L9684-INPUT-STRING.
02MI01     PERFORM  9684-1000-ENCRYPT-DATA
02MI01         THRU 9684-1000-ENCRYPT-DATA-X.

02MI01*    IF MIR-USER-PSWD-TXT NOT = RUSEC-USER-PSWD-TXT
02MI01     IF L9684-OUTPUT-STRING NOT = RUSEC-USER-PSWD-TXT
      *MSG: PASSWORD NOT AUTHORIZED FOR USERID. RE-ENTER
               MOVE SPACE          TO MIR-USER-PSWD-TXT
               MOVE SPACE          TO MIR-USER-PSWD-TXT-2
               MOVE 'XS00600003'   TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
02MI01         MOVE '90001'        TO WS-TXT-SRC-REF-ID
02MI01         PERFORM  7600-OUTPUT-USAU-RECORD
02MI01             THRU 7600-OUTPUT-USAU-RECORD-X
               GO TO 6000-PROCESS-PASSWORD-X
           END-IF.
      *
      *    PASSWORD REPEATS OLD PASSWORD, NOT VALID
      *
02MI01     PERFORM  9684-1000-BUILD-PARM-INFO
02MI01         THRU 9684-1000-BUILD-PARM-INFO-X.
02MI01     MOVE MIR-USER-PSWD-TXT-2   TO L9684-INPUT-STRING.
02MI01     PERFORM  9684-1000-ENCRYPT-DATA
02MI01         THRU 9684-1000-ENCRYPT-DATA-X.

02MI01*    IF  MIR-USER-PSWD-TXT-2 = RUSEC-USER-PSWD-TXT
02MI01*    OR  MIR-USER-PSWD-TXT-2 = RUSEC-PREV-PSWD-1-TXT
02MI01*    OR  MIR-USER-PSWD-TXT-2 = RUSEC-PREV-PSWD-2-TXT
02MI01*    OR  MIR-USER-PSWD-TXT-2 = RUSEC-PREV-PSWD-3-TXT
02MI01*    OR  MIR-USER-PSWD-TXT-2 = RUSEC-PREV-PSWD-4-TXT
02MI01*    OR  MIR-USER-PSWD-TXT-2 = RUSEC-PREV-PSWD-5-TXT
02MI01*    OR  MIR-USER-PSWD-TXT-2 = RUSEC-PREV-PSWD-6-TXT
02MI01*    OR  MIR-USER-PSWD-TXT-2 = RUSEC-PREV-PSWD-7-TXT
02MI01*    OR  MIR-USER-PSWD-TXT-2 = RUSEC-PREV-PSWD-8-TXT

02MI01     IF  L9684-OUTPUT-STRING = RUSEC-USER-PSWD-TXT
02MI01     OR  L9684-OUTPUT-STRING = RUSEC-PREV-PSWD-1-TXT
02MI01     OR  L9684-OUTPUT-STRING = RUSEC-PREV-PSWD-2-TXT
02MI01     OR  L9684-OUTPUT-STRING = RUSEC-PREV-PSWD-3-TXT
02MI01     OR  L9684-OUTPUT-STRING = RUSEC-PREV-PSWD-4-TXT
02MI01     OR  L9684-OUTPUT-STRING = RUSEC-PREV-PSWD-5-TXT
02MI01     OR  L9684-OUTPUT-STRING = RUSEC-PREV-PSWD-6-TXT
02MI01     OR  L9684-OUTPUT-STRING = RUSEC-PREV-PSWD-7-TXT
02MI01     OR  L9684-OUTPUT-STRING = RUSEC-PREV-PSWD-8-TXT
      *MSG: NEW PASSWORD ALREADY USED. PLEASE RE-ENTER A NEW PASSWORD
              MOVE 'XS00600007'               TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              MOVE SPACE                      TO MIR-USER-PSWD-TXT
              MOVE SPACE                      TO MIR-USER-PSWD-TXT-2
              MOVE SPACE                      TO MIR-USER-PSWD-TXT-3
              GO TO 6000-PROCESS-PASSWORD-X
           END-IF.
      *
      *    IF PASSWORDS AREN'T EQUAL, THEN THIS IS FIRST TIME TYPING IT
      *    OR IT WASN'T VERIFIED PROPERLY
      *
           IF MIR-USER-PSWD-TXT-2 NOT = MIR-USER-PSWD-TXT-3
               PERFORM 6020-PASSWORD-NOT-VERIFIED
                  THRU 6020-PASSWORD-NOT-VERIFIED-X
               GO TO 6000-PROCESS-PASSWORD-X
           END-IF.

           PERFORM 6010-CHECK-NEW-PASSWORD
              THRU 6010-CHECK-NEW-PASSWORD-X.
      *
      *    IF NO NEW PASSWORD, OLD ONE EXPIRED AND USER JUST HIT ENTER
      *
           IF  WPASS-PASSWORD-IN-ERROR
               MOVE 'XS00600004'              TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 6000-PROCESS-PASSWORD-X
           END-IF.

           MOVE WGLOB-USER-ID                 TO WUSEC-USER-ID.
           PERFORM  USEC-1000-READ-FOR-UPDATE
               THRU USEC-1000-READ-FOR-UPDATE-X.

           IF WUSEC-IO-OK
01MI06        MOVE RUSEC-PREV-PSWD-7-TXT      TO RUSEC-PREV-PSWD-8-TXT
01MI06        MOVE RUSEC-PREV-PSWD-6-TXT      TO RUSEC-PREV-PSWD-7-TXT
01MI06        MOVE RUSEC-PREV-PSWD-5-TXT      TO RUSEC-PREV-PSWD-6-TXT
01MI06        MOVE RUSEC-PREV-PSWD-4-TXT      TO RUSEC-PREV-PSWD-5-TXT
01MI06        MOVE RUSEC-PREV-PSWD-3-TXT      TO RUSEC-PREV-PSWD-4-TXT
              MOVE RUSEC-PREV-PSWD-2-TXT      TO RUSEC-PREV-PSWD-3-TXT
              MOVE RUSEC-PREV-PSWD-1-TXT      TO RUSEC-PREV-PSWD-2-TXT
              MOVE RUSEC-USER-PSWD-TXT        TO RUSEC-PREV-PSWD-1-TXT
02MI01*       MOVE MIR-USER-PSWD-TXT-2        TO RUSEC-USER-PSWD-TXT
02MI01        MOVE L9684-OUTPUT-STRING        TO RUSEC-USER-PSWD-TXT
              MOVE WGLOB-SYSTEM-DATE-INT      TO RUSEC-USER-PSWD-CHNG-DT

P02188        MOVE ZERO                       TO RUSEC-USER-UNSUCS-QTY-N
P02188        SET RUSEC-USER-LOGIN-OTHER      TO TRUE
P02188     
P02188        MOVE WGLOB-PROCESS-DATE         TO L1680-INTERNAL-1
P02188        MOVE ZERO                       TO L1680-NUMBER-OF-YEARS
P02188        MOVE ZERO                       TO L1680-NUMBER-OF-MONTHS
P02188        MOVE 30                         TO L1680-NUMBER-OF-DAYS
P02188        PERFORM 1680-3000-ADD-Y-M-D-TO-DATE
P02188           THRU 1680-3000-ADD-Y-M-D-TO-DATE-X
P02188        MOVE L1680-INTERNAL-2           TO RUSEC-USER-ID-XPRY-DT

              PERFORM  USEC-2000-REWRITE
                  THRU USEC-2000-REWRITE-X

              MOVE SPACE                      TO MIR-USER-PSWD-TXT
              MOVE SPACE                      TO MIR-USER-PSWD-TXT-2
              MOVE SPACE                      TO MIR-USER-PSWD-TXT-3
      *MSG: PASSWORD UPDATED
              MOVE 'XS00600026'               TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
              MOVE WUSEC-KEY                  TO WGLOB-MSG-PARM (1)
              MOVE 'XS00000006'               TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X

           END-IF.

           MOVE SPACE                         TO MIR-USER-PSWD-TXT.
           MOVE SPACE                         TO MIR-USER-PSWD-TXT-2.
           MOVE SPACE                         TO MIR-USER-PSWD-TXT-3.

       6000-PROCESS-PASSWORD-X.
           EXIT.
      /
      *-----------------------
       6010-CHECK-NEW-PASSWORD.
      *-----------------------

           MOVE MIR-USER-PSWD-TXT-2           TO WPASS-PASSWORD.
           PERFORM PASS-1000-EDIT-PASSWORD
              THRU PASS-1000-EDIT-PASSWORD-X.

           IF WPASS-PASSWORD-IN-ERROR
               MOVE SPACE                     TO MIR-USER-PSWD-TXT-2
               MOVE SPACE                     TO MIR-USER-PSWD-TXT-3
           END-IF.

       6010-CHECK-NEW-PASSWORD-X.
           EXIT.
      /
      *--------------------------
       6020-PASSWORD-NOT-VERIFIED.
      *--------------------------

           MOVE SPACE              TO MIR-USER-PSWD-TXT.
           MOVE SPACE              TO MIR-USER-PSWD-TXT-2.
      *MSG:  NEW PASSWORD NOT VERIFIED
           MOVE 'XS00600009'       TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.
           PERFORM 9000-COMPUTE-PASS-EXP-DAYS
              THRU 9000-COMPUTE-PASS-EXP-DAYS-X.

           IF WS-PASS-EXP-DAYS > RUSEC-USER-PSWD-XPRY-DUR
      *MSG: YOUR PASSWORD HAS EXPIRED.
               MOVE 'XS00600004'      TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       6020-PASSWORD-NOT-VERIFIED-X.
           EXIT.

      *
      *----------------
       7000-LOGIN-EDITS.
      *----------------

           PERFORM  7590-EDIT-USES-WITH-USER
               THRU 7590-EDIT-USES-WITH-USER-X.

           IF  WS-ERROR-FOUND
               GO TO 7000-LOGIN-EDITS-X
           END-IF.

           PERFORM  7510-EDIT-USER-ID
               THRU 7510-EDIT-USER-ID-X.

P02188     IF RUSEC-USER-LOGIN-LOCK
P02188     OR RUSEC-USER-LOGIN-XPRY
P02188         GO TO 2000-PROCESS-LOGIN-X
P02188     END-IF.

           PERFORM  7520-EDIT-PASSWORD
               THRU 7520-EDIT-PASSWORD-X.

           PERFORM  7530-EDIT-CO-ID
               THRU 7530-EDIT-CO-ID-X.

       7000-LOGIN-EDITS-X.
           EXIT.

      *------------------
       7100-CONNECT-EDITS.
      *------------------

           PERFORM  7540-EDIT-USES
               THRU 7540-EDIT-USES-X.

           IF WS-ERROR-NO
               PERFORM  7580-CHECK-FOR-UPDATES
                   THRU 7580-CHECK-FOR-UPDATES-X
               IF MIR-RETRN-RQST-NO-CHANGE
                   GO TO 7100-CONNECT-EDITS-X
               END-IF
           END-IF.

           IF WS-ERROR-NO
               PERFORM  7550-EDIT-USEC
                   THRU 7550-EDIT-USEC-X
           END-IF.

           IF WS-ERROR-NO
               PERFORM  7560-EDIT-USCL
                   THRU 7560-EDIT-USCL-X
           END-IF.

           IF WS-ERROR-NO
               PERFORM  7520-EDIT-PASSWORD
                   THRU 7520-EDIT-PASSWORD-X
           END-IF.

           IF WS-ERROR-NO
               PERFORM  7530-EDIT-CO-ID
                   THRU 7530-EDIT-CO-ID-X
           END-IF.

       7100-CONNECT-EDITS-X.
           EXIT.

      *-----------------
       7510-EDIT-USER-ID.
      *-----------------
           IF MIR-USER-ID NOT > SPACES
      *MSG:  USER-ID REQUIRED FOR LOGIN
               MOVE 'XS00600012'                TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND               TO TRUE
               GO TO 7510-EDIT-USER-ID-X
           END-IF.

           MOVE MIR-USER-ID                    TO L0005-INPUT-STRING.
           PERFORM  0005-1000-CONVERT-STRING
               THRU 0005-1000-CONVERT-STRING-X.
           MOVE L0005-OUTPUT-STRING            TO MIR-USER-ID.

           MOVE MIR-USER-ID                    TO WGLOB-USER-ID.
           MOVE MIR-USER-ID                    TO WUSEC-USER-ID.
           PERFORM  USEC-1000-READ
               THRU USEC-1000-READ-X.

           IF NOT WUSEC-IO-OK
      *MSG: USERID (@1) NOT FOUND. RE-ENTER VALID USERID
               MOVE WUSEC-USER-ID               TO WGLOB-MSG-PARM (1)
               MOVE 'XS00600001'                TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND               TO TRUE
02MI01         MOVE '90002'                     TO WS-TXT-SRC-REF-ID
02MI01         PERFORM  7600-OUTPUT-USAU-RECORD
02MI01             THRU 7600-OUTPUT-USAU-RECORD-X
               GO TO 7510-EDIT-USER-ID-X
           END-IF.

P02188     IF RUSEC-USER-LOGIN-LOCK
P02188     OR RUSEC-USER-LOGIN-XPRY
P02188*MSG: USER ID HAS BEEN LOCKED PLEASE CONTACT ADMINSTRATOR TO UNLOCK IT.
P02188         MOVE 'XS00609001'   TO WGLOB-MSG-REF-INFO
P02188         PERFORM 0260-1000-GENERATE-MESSAGE
P02188            THRU 0260-1000-GENERATE-MESSAGE-X
P02188         GO TO 7510-EDIT-USER-ID-X
P02188     END-IF.
           MOVE RUSEC-SECUR-CLAS-ID            TO WUSCL-SECUR-CLAS-ID.
           PERFORM  USCL-1000-READ
               THRU USCL-1000-READ-X.

           IF NOT WUSCL-IO-OK
               MOVE WUSCL-KEY                   TO WGLOB-MSG-PARM (1)
      *MSG: SECURITY CLASS RECORD (@1) NOT FOUND
               MOVE 'XS00600013'                TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND               TO TRUE
               GO TO 7510-EDIT-USER-ID-X
           END-IF.

SESCAP* Add logic to check user session limit
SESCAP     IF RUSCL-SESN-CTL
SESCAP         PERFORM  7515-EDIT-USER-SESN-LIMIT
SESCAP             THRU 7515-EDIT-USER-SESN-LIMIT-X
SESCAP         IF WS-ERROR-FOUND
SESCAP             GO TO 7510-EDIT-USER-ID-X
SESCAP         END-IF
SESCAP     END-IF.
 
       7510-EDIT-USER-ID-X.
           EXIT.

SESCAP*--------------------------
SESCAP 7515-EDIT-USER-SESN-LIMIT.
SESCAP*--------------------------
SESCAP*  READ PSYS FOR SESSION EXPIRY PERIOD
SESCAP*  SUBTRACT SESSION EXPIRY PERIOD FROM SYSTEM TIMESTAMP
SESCAP*  GET NUMBER OF ACTIVE SESSIONS FROM TUSES 
SESCAP*  (USE NEW CUSTOM IO MODULE XSIFUSES)
SESCAP*  IF THE NUMBER OF ACTIVE SESSIONS IS NOT LESS THAN 
SESCAP*  MAXIMUM NUMBER OF ACTIVE SESSIONS
SESCAP*  FOR THE SECURITY CLASS, REJECT THE SIGN-ON REQUEST WITH ERROR MESSAGE
SESCAP* READ PSYS
SESCAP     SET WPSYS-SYS-CTL-INGENIUM TO TRUE.
SESCAP     PERFORM  PSYS-1000-READ
SESCAP         THRU PSYS-1000-READ-X.
SESCAP
SESCAP* CALL XSDU1580 TO SUBTRACT SESSION EXPIRY PERIOD
SESCAP     INITIALIZE L1580-TIME-INT-TIME.
SESCAP
SESCAP     PERFORM  0035-5000-TIMESTAMP
SESCAP         THRU 0035-5000-TIMESTAMP-X.
SESCAP     MOVE L0035-TIMESTAMP  TO L1580-INT-TS
SESCAP                              L1580-IO-INT-TS.
SESCAP     MOVE RPSYS-SESN-XPRY-DUR TO L1580-INT-TIME-MI.
SESCAP     PERFORM  1580-3000-TIME-SUBTRACTION
SESCAP         THRU 1580-3000-TIME-SUBTRACTION-X.
SESCAP
SESCAP* SELECT COUNT FROM TUSES WITH 
SESCAP*     SAME SECURITY CLASS AND TIMESTAMP > CALCULATED VALUE
SESCAP     MOVE RUSCL-SECUR-CLAS-ID TO WUSEE-SECUR-CLAS-ID
SESCAP                                 WUSEE-ENDBR-SECUR-CLAS-ID.
SESCAP     MOVE L1580-IO-INT-TS TO WUSEE-PREV-UPDT-TS.
SESCAP     MOVE WWKDT-HIGH-TS TO WUSEE-ENDBR-PREV-UPDT-TS.
SESCAP     PERFORM  USEE-3000-READ-COUNT
SESCAP         THRU USEE-3000-READ-COUNT-X.
SESCAP* CHECK WHETHER LIMIT IS REACHED
SESCAP     MOVE RUSCL-MAX-SESN-NUM        TO WS-MAX-SESN-NUM.
SESCAP     MOVE WUSEE-COUNT-SECUR-CLAS-ID TO WS-TOT-ACT-SESN-NUM
SESCAP     IF WS-TOT-ACT-SESN-NUM >= WS-MAX-SESN-NUM
SESCAP* MSG: SIGN-ON UNSUCCESSFUL, SECURITY CLASS SESSION LIMIT REACHED"
SESCAP         MOVE 'XS00009000'                TO WGLOB-MSG-REF-INFO
SESCAP         PERFORM  0260-1000-GENERATE-MESSAGE
SESCAP             THRU 0260-1000-GENERATE-MESSAGE-X
SESCAP* SET THE ERROR INDICATOR TO TRUE SO THAT SIGN-ON WILL BE REJECTED
SESCAP         SET WS-ERROR-FOUND               TO TRUE
SESCAP     END-IF.
SESCAP      
SESCAP 7515-EDIT-USER-SESN-LIMIT-X.
SESCAP     EXIT.
SESCAP
      *------------------
       7520-EDIT-PASSWORD.
      *------------------

           IF NOT WUSEC-IO-OK
               GO TO 7520-EDIT-PASSWORD-X
           END-IF.

02MI01     PERFORM  9684-1000-BUILD-PARM-INFO
02MI01         THRU 9684-1000-BUILD-PARM-INFO-X.
02MI01     MOVE MIR-USER-PSWD-TXT   TO L9684-INPUT-STRING.
02MI01     PERFORM  9684-1000-ENCRYPT-DATA
02MI01         THRU 9684-1000-ENCRYPT-DATA-X.

02MI01*    IF MIR-USER-PSWD-TXT = RUSEC-USER-PSWD-TXT
02MI01     IF L9684-OUTPUT-STRING = RUSEC-USER-PSWD-TXT
               NEXT SENTENCE
           ELSE
P02188       IF RUSEC-USER-UNSUCS-QTY-N < 2
P02188
      *MSG: PASSWORD NOT AUTHORIZED FOR USERID. RE-ENTER
               MOVE SPACE                       TO MIR-USER-PSWD-TXT
               MOVE 'XS00600003'                TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND               TO TRUE
02MI01         MOVE '90001'        TO WS-TXT-SRC-REF-ID
02MI01         PERFORM  7600-OUTPUT-USAU-RECORD
02MI01             THRU 7600-OUTPUT-USAU-RECORD-X
P02188
P02188         PERFORM  7710-ADD-UNSUCS-QTY
P02188             THRU 7710-ADD-UNSUCS-QTY-X
P02188       ELSE
P02188         PERFORM  7720-USERID-PWD-LOCK
P02188             THRU 7720-USERID-PWD-LOCK-X
P02188       END-IF
             GO TO 7520-EDIT-PASSWORD-X
           END-IF.


       7520-EDIT-PASSWORD-X.
           EXIT.

      *---------------
       7530-EDIT-CO-ID.
      *---------------

           IF MIR-CO-ID = SPACES
      *MSG: COMPANY CODE IS REQUIRED.
               MOVE 'XS00600030'               TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND              TO TRUE
               GO TO 7530-EDIT-CO-ID-X
           END-IF.

           MOVE MIR-CO-ID                      TO L0005-INPUT-STRING.
           PERFORM  0005-1000-CONVERT-STRING
               THRU 0005-1000-CONVERT-STRING-X.
           MOVE L0005-OUTPUT-STRING            TO MIR-CO-ID.

           MOVE MIR-CO-ID                      TO WXTAB-ETBL-VALU-ID.
           PERFORM  COMP-1000-EDIT-COMPANY
               THRU COMP-1000-EDIT-COMPANY-X.

           IF WXTAB-IO-OK
               MOVE MIR-CO-ID                  TO WGLOB-COMPANY-CODE
           ELSE
      *MSG: INVALID COMPANY CODE ENTERED. RE-ENTER
               MOVE 'XS00600002'               TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND              TO TRUE
               GO TO 7530-EDIT-CO-ID-X
           END-IF.

       7530-EDIT-CO-ID-X.
           EXIT.

      *--------------
       7540-EDIT-USES.
      *--------------

           MOVE WGLOB-USER-SESN-ID            TO WUSES-USER-SESN-ID.
           PERFORM  USES-1000-READ
               THRU USES-1000-READ-X.
           IF WUSES-IO-OK
               MOVE RUSES-USER-ID             TO WGLOB-USER-ID
           ELSE
      *MSG:  USER SESSION ID NOT FOUND - PLEASE LOG ON AGAIN
               MOVE WUSEC-USER-ID               TO WGLOB-MSG-PARM (1)
               MOVE 'XS00600031'                TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND               TO TRUE
               GO TO 7540-EDIT-USES-X
           END-IF.

       7540-EDIT-USES-X.
           EXIT.

      *--------------
       7550-EDIT-USEC.
      *--------------

           MOVE WGLOB-USER-ID                   TO WUSEC-USER-ID.
           PERFORM  USEC-1000-READ
               THRU USEC-1000-READ-X.

           IF NOT WUSEC-IO-OK
      *MSG: USERID (@1) NOT FOUND. RE-ENTER VALID USERID
               MOVE WUSEC-USER-ID               TO WGLOB-MSG-PARM (1)
               MOVE 'XS00600001'                TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND               TO TRUE
02MI01         MOVE '90002'                     TO WS-TXT-SRC-REF-ID
02MI01         PERFORM  7600-OUTPUT-USAU-RECORD
02MI01             THRU 7600-OUTPUT-USAU-RECORD-X
               GO TO 7550-EDIT-USEC-X
           END-IF.

       7550-EDIT-USEC-X.
           EXIT.

      *--------------
       7560-EDIT-USCL.
      *--------------

           MOVE RUSEC-SECUR-CLAS-ID             TO WUSCL-SECUR-CLAS-ID.
           PERFORM  USCL-1000-READ
               THRU USCL-1000-READ-X.

           IF NOT WUSCL-IO-OK
               MOVE WUSCL-KEY                   TO WGLOB-MSG-PARM (1)
      *MSG: SECURITY CLASS RECORD (@1) NOT FOUND
               MOVE 'XS00600013'                TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND               TO TRUE
               GO TO 7560-EDIT-USCL-X
           END-IF.

       7560-EDIT-USCL-X.
           EXIT.

      *-------------------
       7570-EDIT-CTRY-CURR.
      *-------------------

           MOVE RUSEC-SECUR-CLAS-ID     TO WASCL-SECUR-CLAS-ID.
           MOVE MIR-CO-ID               TO WASCL-CO-ID.

           IF WASCL-KEY NOT = RASCL-KEY
              PERFORM ASCL-1000-READ
                 THRU ASCL-1000-READ-X
           END-IF.

           PERFORM
              VARYING SUB1 FROM +1 BY +1
              UNTIL   SUB1 = +5
              OR RASCL-ASCL-CTRY-CD (SUB1) =
                 WS-USER-SESN-CTRY-CD
015543        CONTINUE
           END-PERFORM.

           IF RASCL-ASCL-CTRY-CD (SUB1) =
              WS-USER-SESN-CTRY-CD
               PERFORM
                  VARYING SUB2 FROM +1 BY +1
                  UNTIL   SUB2 = +5
                  OR RASCL-ASCL-CRCY-CD (SUB1, SUB2) =
                     WS-USER-SESN-CRCY-CD
015543            CONTINUE
               END-PERFORM
               IF RASCL-ASCL-CRCY-CD (SUB1, SUB2) =
                  WS-USER-SESN-CRCY-CD
                   NEXT SENTENCE
               ELSE
      *MSG: NOT AUTHORIZED FOR REQUESTED CURRENCY. RE-ENTER
                   MOVE 'XS00600024'   TO WGLOB-MSG-REF-INFO
                   PERFORM 0260-1000-GENERATE-MESSAGE
                      THRU 0260-1000-GENERATE-MESSAGE-X
               END-IF
           ELSE
      *MSG: NOT AUTHORIZED FOR REQUESTED COUNTRY. RE-ENTER
               MOVE 'XS00600023'       TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       7570-EDIT-CTRY-CURR-X.
           EXIT.

      *----------------------
       7580-CHECK-FOR-UPDATES.
      *----------------------
      *  THIS PARAGRAPH WILL VERIFY THAT THERE ARE CHANGES TO BE
      *  APPLIED AGAINST USES.  IF THE USER ENTERS THE EXACT SAME
      *  DATA THAT ALREADY EXISTED ON USES, NO FURTHER CHECKING
      *  WILL BE DONE - THE PROGRAM WILL REPOPULATE THE MIR FIELDS
      *  AND RETURN BACK TO THE USER INTERFACE.
      *

PF 1.2*    IF  RUSES-USER-SESN-STAT-NOT-CONN
PF 1.2     IF  NOT RUSES-USER-SESN-STAT-API-CONN
               GO TO 7580-CHECK-FOR-UPDATES-X
           END-IF.

           IF  RUSES-CO-ID             = MIR-CO-ID
           AND RUSES-USER-SESN-CTRY-CD = MIR-USER-SESN-CTRY-CD
           AND RUSES-USER-SESN-CRCY-CD = MIR-USER-SESN-CRCY-CD
               SET MIR-RETRN-RQST-NO-CHANGE   TO TRUE
               MOVE RUSES-USER-ID             TO MIR-USER-ID
               MOVE RUSES-USER-SESN-BTCH-NUM  TO WS-BATCH-NUMBER-DISP
               MOVE WS-BATCH-NUMBER-DISP      TO MIR-USER-SESN-BTCH-NUM
               MOVE RUSES-USER-SESN-PRCES-DT  TO L1640-INTERNAL-DATE
               PERFORM 1640-2000-INTERNAL-TO-EXT
                  THRU 1640-2000-INTERNAL-TO-EXT-X
               MOVE L1640-EXTERNAL-DATE       TO MIR-USER-SESN-PRCES-DT
               MOVE RUSES-USER-SESN-STAT-CD   TO MIR-USER-SESN-STAT-CD
               PERFORM  9200-SETUP-L0020-AREA
                   THRU 9200-SETUP-L0020-AREA-X
               SET L0020-REQ-APPL-STATUS      TO TRUE
               PERFORM  0020-1000-LINK-TO-APPL
                   THRU 0020-1000-LINK-TO-APPL-X
               PERFORM  9400-FORMAT-RESPONSE
                   THRU 9400-FORMAT-RESPONSE-X
           END-IF.

       7580-CHECK-FOR-UPDATES-X.
           EXIT.
      /
      *-----------------------
       7590-EDIT-USES-WITH-USER.
      *-----------------------

           MOVE WGLOB-USER-SESN-ID            TO WUSES-USER-SESN-ID.
           PERFORM  USES-1000-READ
               THRU USES-1000-READ-X.
           IF NOT WUSES-IO-OK
               GO TO 7590-EDIT-USES-WITH-USER-X
           END-IF.

015543     MOVE RUSES-USER-ID                 TO WGLOB-USER-ID.
           IF RUSES-USER-ID = MIR-USER-ID
               NEXT SENTENCE
           ELSE
      *MSG: CURRENT SESSION IS ACTIVE, SIGN ON TO CURRENT SESSION WITH
      *     NEW USER ID IS NOT ALLOWED.
               MOVE 'XS00600032'              TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND             TO TRUE
               GO TO 7590-EDIT-USES-WITH-USER-X
           END-IF.

PF 1.2*    IF RUSES-USER-SESN-STAT-CONN
PF 1.2     IF RUSES-USER-SESN-STAT-API-CONN
      *MSG: YOU ARE ALREADY SIGNED ON TO INGENIUM IN THIS SESSION.
      *     LOGIN REQUEST IS IGNORED
               MOVE 'XS00600033'              TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND             TO TRUE
               GO TO 7590-EDIT-USES-WITH-USER-X
           END-IF.

       7590-EDIT-USES-WITH-USER-X.
           EXIT.
02MI01/
02MI01*------------------------
02MI01 7600-OUTPUT-USAU-RECORD.
02MI01*------------------------
02MI01
02MI01     MOVE WGLOB-USER-ID             TO WUSAU-USER-ID.
02MI01     MOVE WGLOB-SYSTEM-DATE-INT     TO WUSAU-LOGIN-FAIL-DT.
02MI01     MOVE WGLOB-SYSTEM-TIME         TO WS-TIME-N.
02MI01     MOVE WS-TIME                   TO WUSAU-LOGIN-FAIL-TIME.
02MI01
02MI01     PERFORM  USAU-1000-CREATE
02MI01         THRU USAU-1000-CREATE-X.
02MI01
02MI01     PERFORM  2490-1000-BUILD-PARM-INFO
02MI01         THRU 2490-1000-BUILD-PARM-INFO-X.
02MI01
02MI01     MOVE 'XSOM0060'         TO L2490-TXT-SRC-ID.
02MI01     MOVE WS-TXT-SRC-REF-ID  TO L2490-TXT-SRC-REF-ID.
02MI01
02MI01     PERFORM  2490-1000-RETRIEVE-TEXT
02MI01         THRU 2490-1000-RETRIEVE-TEXT-X.
02MI01
02MI01     MOVE L2490-TXT-STR-TXT  TO RUSAU-LOGIN-FAIL-MSG-TXT.
02MI01
02MI01     PERFORM  USAU-1000-WRITE
02MI01         THRU USAU-1000-WRITE-X.
02MI01
02MI01 7600-OUTPUT-USAU-RECORD-X.
02MI01     EXIT.

P02188*--------------------
P02188 7710-ADD-UNSUCS-QTY.
P02188*--------------------
P02188 
P02188     MOVE WGLOB-USER-ID               TO WUSEC-USER-ID.
P02188     PERFORM  USEC-1000-READ-FOR-UPDATE
P02188         THRU USEC-1000-READ-FOR-UPDATE-X.
P02188
P02188     IF WUSEC-IO-OK
P02188        ADD +1                        TO RUSEC-USER-UNSUCS-QTY-N
P02188        PERFORM  USEC-2000-REWRITE
P02188            THRU USEC-2000-REWRITE-X
P02188     ELSE
P02188        MOVE WUSEC-KEY                TO WGLOB-MSG-PARM (1)
P02188        MOVE 'XS00000006'             TO WGLOB-MSG-REF-INFO
P02188        PERFORM  0260-1000-GENERATE-MESSAGE
P02188            THRU 0260-1000-GENERATE-MESSAGE-X
P02188     END-IF.
P02188
P02188 7710-ADD-UNSUCS-QTY-X.
P02188     EXIT.

P02188*---------------------
P02188 7720-USERID-PWD-LOCK.
P02188*---------------------
P02188
P02188     MOVE WGLOB-USER-ID               TO WUSEC-USER-ID.
P02188     PERFORM  USEC-1000-READ-FOR-UPDATE
P02188         THRU USEC-1000-READ-FOR-UPDATE-X.
P02188
P02188     IF WUSEC-IO-OK
P02188        SET RUSEC-USER-LOGIN-LOCK     TO TRUE
P02188        ADD +1                        TO RUSEC-USER-UNSUCS-QTY-N
P02188        PERFORM  USEC-2000-REWRITE
P02188            THRU USEC-2000-REWRITE-X
P02188
P02188*MSG: USER ID HAS BEEN LOCKED PLEASE CONTACT ADMINSTRATOR TO UNLOCK IT.
P02188        MOVE 'XS00609001'   TO WGLOB-MSG-REF-INFO
P02188        PERFORM 0260-1000-GENERATE-MESSAGE
P02188            THRU 0260-1000-GENERATE-MESSAGE-X
P02188     ELSE
P02188        MOVE WUSEC-KEY                  TO WGLOB-MSG-PARM (1)
P02188        MOVE 'XS00000006'               TO WGLOB-MSG-REF-INFO
P02188        PERFORM  0260-1000-GENERATE-MESSAGE
P02188            THRU 0260-1000-GENERATE-MESSAGE-X
P02188     END-IF.
P02188 
P02188 7720-USERID-PWD-LOCK-X.
P02188     EXIT.

      /
      *---------------
       8000-DATA-ERROR.
      *---------------
      *
           IF L0020-CURRENCY-CODE = HIGH-VALUES
      *MSG: NOT AUTHORIZED FOR REQUESTED CURRENCY. RE-ENTER
               MOVE 'XS00600024'              TO WGLOB-MSG-REF-INFO
           ELSE
               IF L0020-COUNTRY-CODE = HIGH-VALUES
      *MSG: NOT AUTHORIZED FOR REQUESTED COUNTRY. RE-ENTER
                   MOVE 'XS00600023'          TO WGLOB-MSG-REF-INFO
               ELSE
      *MSG: UNKNOWN DATA ERROR FROM EXIT - CONTACT SYSTEMS
                   MOVE 'XS00600025'          TO WGLOB-MSG-REF-INFO
               END-IF
           END-IF.

           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.

           PERFORM 9100-DISPLAY-THIS-APPL
              THRU 9100-DISPLAY-THIS-APPL-X.

       8000-DATA-ERROR-X.
           EXIT.
      /
      *--------------------------
       9000-COMPUTE-PASS-EXP-DAYS.
      *--------------------------

           MOVE +9999                   TO WS-PASS-EXP-DAYS.

           MOVE RUSEC-USER-PSWD-CHNG-DT TO L1680-INTERNAL-1.
           MOVE WGLOB-SYSTEM-DATE-INT   TO L1680-INTERNAL-2.
           PERFORM  1680-2000-COMP-DAYS-BETWEEN
               THRU 1680-2000-COMP-DAYS-BETWEEN-X.

           IF L1680-VALID
           AND L1680-TOTAL-DAYS NOT < ZERO
              MOVE L1680-TOTAL-DAYS     TO WS-PASS-EXP-DAYS
B10255     ELSE
B10255        IF  RUSEC-USER-PSWD-CHNG-DT NOT = WWKDT-ZERO-DT
B10255            GO TO 9000-COMPUTE-PASS-EXP-DAYS-X
B10255        END-IF
           END-IF.

           IF WS-PASS-EXP-DAYS > RUSEC-USER-PSWD-XPRY-DUR
           OR WS-PASS-EXP-DAYS = RUSEC-USER-PSWD-XPRY-DUR
      *MSG: YOUR PASSWORD HAS EXPIRED. PLEASE ENTER A NEW PASSWORD
              MOVE 'XS00600004'            TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              MOVE 'Y'                     TO MIR-DV-PSWD-XPRD-IND
              SET WS-VALID-PSWD-EXPIRED    TO TRUE
           END-IF.

       9000-COMPUTE-PASS-EXP-DAYS-X.
           EXIT.

      *----------------------
       9100-DISPLAY-THIS-APPL.
      *----------------------

           MOVE SPACE                         TO MIR-USER-SESN-BTCH-NUM.
           MOVE SPACE                         TO MIR-USER-SESN-STAT-CD.
           MOVE SPACE                         TO MIR-DV-APPL-STAT-CD.
           MOVE SPACE                         TO MIR-USER-SESN-CTRY-CD.
           MOVE SPACE                         TO MIR-USER-SESN-CRCY-CD.

           MOVE MIR-CO-ID                     TO WAPPL-CO-ID.
           PERFORM  APPL-1000-READ
               THRU APPL-1000-READ-X.

           IF NOT WAPPL-IO-OK
      *    INTEGRITY PROBLEM WITH ASCL AND APPL TABLES.
              MOVE WAPPL-KEY                   TO WGLOB-MSG-PARM (1)
      *MSG: APPLICATION (@1) NOT FOUND. FILES OUT OF SYNC. CONTACT
      *  SYSTEMS
              MOVE 'XS00600006'                TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              GO TO 9100-DISPLAY-THIS-APPL-X
           END-IF.

           PERFORM  9200-SETUP-L0020-AREA
               THRU 9200-SETUP-L0020-AREA-X.
      *
      *    REQUEST APPLICATION STATUS FROM EXIT
      *
           SET L0020-REQ-APPL-STATUS           TO TRUE.
           PERFORM  0020-1000-LINK-TO-APPL
               THRU 0020-1000-LINK-TO-APPL-X.

           PERFORM  9400-FORMAT-RESPONSE
               THRU 9400-FORMAT-RESPONSE-X.

PF 13      MOVE WGLOB-DT-FRMT-CD              TO MIR-CTRY-DT-FRMT-CD.
PF 13      MOVE WGLOB-DT-SEPARATOR-SYMBL      TO MIR-CTRY-DT-SPRT-CD.
PF 13      MOVE WGLOB-DT-ZERO-SUPRES-IND      TO MIR-CTRY-LEAD-ZERO-IND.
PF 13      MOVE WGLOB-CRCY-SYMBL              TO MIR-CRCY-SYMBL-CD.
PF 13      MOVE WGLOB-THOUSANDS-SYMBL         TO MIR-CRCY-THOU-SPRT-CD.
PF 13      MOVE WGLOB-DCML-SYMBL              TO MIR-CRCY-DCML-SPRT-CD.
PF 13      MOVE WGLOB-SIGN-POSN-CD            TO MIR-CRCY-NEG-PLACE-CD.
PF 13      MOVE WGLOB-CRCY-POSN-CD            TO MIR-CRCY-PLACE-CD.
PF 20      MOVE WGLOB-CRCY-SCALE-QTY          TO MIR-CRCY-SCALE-QTY.

PF 13 *  WHEN SUPPORT FOR ISO DATES IS ADDED THE FOLLOWING LINE SHOULD
PF 13 *  BE MODIFIED TO INDICATE THIS.
PF 20 *    MOVE 'N'                           TO MIR-ISO-DT-FRMT-IND.
PF 20      MOVE 'N'                           TO MIR-DV-ISO-DT-FRMT-IND.
PF 13 *  WHEN CURRENCY SCALING LOGIC FROM THE 612J PROJECT IS ADDED
PF 13 *  THE FOLLOWING LINE SHOULD BE MODIFIED TO REFLECT THE ADDITIONAL
PF 13 *  SUPPORT.
PF 13 *    MOVE '2'                           TO MIR-CRCY-SCALE-QTY.
PF 20 *    MOVE WGLOB-CRCY-SCALE-QTY          TO MIR-CRCY-SCALE-QTY.

           IF L0020-RES-DATA-ERROR
           OR L0020-RES-DISCONNECT
           OR L0020-RES-LOGOFF
               GO TO 9100-DISPLAY-THIS-APPL-X
           END-IF.

           IF NOT WUSES-IO-OK
               GO TO 9100-DISPLAY-THIS-APPL-X
           END-IF.

           IF L0020-RES-CLOSE-APPL
      *MSG: USER SESSION RECORD EXISTS BUT SYSTEM UNAVAILABLE
               MOVE 'XS00600010'  TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 9100-DISPLAY-THIS-APPL-X
           END-IF.

           MOVE RUSES-USER-SESN-CTRY-CD       TO MIR-USER-SESN-CTRY-CD.
           MOVE RUSES-USER-SESN-CRCY-CD       TO MIR-USER-SESN-CRCY-CD.
           MOVE L0020-BATCH-NUMBER            TO WS-BATCH-NUMBER-DISP.
           MOVE WS-BATCH-NUMBER-DISP          TO MIR-USER-SESN-BTCH-NUM.
016083     IF  RUSES-USER-SESN-PRCES-DT = WWKDT-LOW-DT
016083         MOVE SPACES                    TO MIR-USER-SESN-PRCES-DT
016083     ELSE
016083         MOVE RUSES-USER-SESN-PRCES-DT  TO L1640-INTERNAL-DATE
016083         PERFORM 1640-2000-INTERNAL-TO-EXT
016083            THRU 1640-2000-INTERNAL-TO-EXT-X
016083         MOVE L1640-EXTERNAL-DATE       TO MIR-USER-SESN-PRCES-DT
016083     END-IF.
016083*    MOVE RUSES-USER-SESN-PRCES-DT      TO L1640-INTERNAL-DATE.
016083*    PERFORM 1640-2000-INTERNAL-TO-EXT
016083*       THRU 1640-2000-INTERNAL-TO-EXT-X.
016083*    MOVE L1640-EXTERNAL-DATE           TO MIR-USER-SESN-PRCES-DT.
           MOVE RUSES-USER-SESN-STAT-CD       TO MIR-USER-SESN-STAT-CD.
           MOVE WS-DV-APPL-STAT-CD            TO MIR-DV-APPL-STAT-CD.

       9100-DISPLAY-THIS-APPL-X.
           EXIT.
      /
      *---------------------
       9200-SETUP-L0020-AREA.
      *---------------------

           MOVE WGLOB-USER-ID                  TO WUSEU-USER-ID.

           PERFORM  USEU-1000-READ
               THRU USEU-1000-READ-X.

           IF WUSEU-IO-OK
               MOVE RUSES-CO-ID                TO L0020-CO-ID
               MOVE RUSES-USER-SESN-CTRY-CD    TO L0020-COUNTRY-CODE
               MOVE RUSES-USER-SESN-CRCY-CD    TO L0020-CURRENCY-CODE
               MOVE RUSES-USER-SESN-PRCES-DT   TO L0020-PROCESS-DATE
               MOVE SPACE                    TO L0020-PROCESS-DATE-DISP
           ELSE
               MOVE MIR-CO-ID                  TO L0020-CO-ID
               MOVE SPACES                     TO L0020-PROCESS-DATE
               MOVE SPACES                     TO L0020-COUNTRY-CODE
               MOVE SPACES                     TO L0020-CURRENCY-CODE
           END-IF.

           MOVE SPACES                         TO L0020-EXIT-RESPONSE.
           MOVE MIR-USER-ID                    TO L0020-USER-ID.
           MOVE WGLOB-USER-SESN-ID             TO L0020-USER-SESN-ID.
           MOVE ZERO                           TO L0020-BATCH-NUMBER.

       9200-SETUP-L0020-AREA-X.
           EXIT.
      /
      *-------------------------
       9300-SETUP-MSIN-REFERENCE.
      *-------------------------

           MOVE SPACES
             TO WGLOB-MSIN-REFERENCE.
           MOVE WGLOB-COMPANY-CODE
             TO WGLOB-REF-COMPANY-CODE.

       9300-SETUP-MSIN-REFERENCE-X.
           EXIT.
      /
      *--------------------
       9400-FORMAT-RESPONSE.
      *--------------------

           SET WS-DV-APPL-STAT-UNKNOWN         TO TRUE.

           EVALUATE TRUE
               WHEN L0020-RES-CLOSE-APPL
                 SET WS-DV-APPL-STAT-INACTIVE  TO TRUE
                 MOVE WWKDT-ZERO-DT            TO WS-PROCESS-DATE

               WHEN L0020-RES-INIT-APPL
               WHEN L0020-RES-SIGN-ON
                 SET WS-DV-APPL-STAT-ACTIVE    TO TRUE
                 MOVE L0020-PROCESS-DATE-DISP  TO WS-USER-SESN-PRCES-DT
                 MOVE L0020-COUNTRY-CODE       TO WS-USER-SESN-CTRY-CD
                 MOVE L0020-CURRENCY-CODE      TO WS-USER-SESN-CRCY-CD
                 MOVE L0020-PROCESS-DATE       TO WS-PROCESS-DATE

               WHEN L0020-RES-PROHIBIT-ACCESS
                 SET WS-DV-APPL-STAT-STOPPED   TO TRUE
                 MOVE L0020-PROCESS-DATE-DISP  TO WS-USER-SESN-PRCES-DT
                 MOVE L0020-COUNTRY-CODE       TO WS-USER-SESN-CTRY-CD

                 MOVE L0020-CURRENCY-CODE      TO WS-USER-SESN-CRCY-CD
                 MOVE L0020-PROCESS-DATE       TO WS-PROCESS-DATE

               WHEN L0020-RES-DISCONNECT
               WHEN L0020-RES-LOGOFF
      *MSG: SESSION FILE AND (@1) USER FILE OUT OF SYNC - CONTACT
      *       SYSTEMS
                 MOVE 'XS00600022'             TO WGLOB-MSG-REF-INFO
                 PERFORM  0260-1000-GENERATE-MESSAGE
                     THRU 0260-1000-GENERATE-MESSAGE-X

               WHEN L0020-RES-DATA-ERROR
      *MSG: SESSION FILE AND (@1) USER FILE OUT OF SYNC - CONTACT
      *           SYSTEMS
                 MOVE 'XS00600022'             TO WGLOB-MSG-REF-INFO
                 PERFORM  0260-1000-GENERATE-MESSAGE
                     THRU 0260-1000-GENERATE-MESSAGE-X

               WHEN OTHER
                 SET WS-DV-APPL-STAT-UNKNOWN   TO TRUE
           END-EVALUATE.

           MOVE WS-DV-APPL-STAT-CD             TO MIR-DV-APPL-STAT-CD.

       9400-FORMAT-RESPONSE-X.
           EXIT.
      /
      *---------------
       9500-CHECK-ASCL.
      *---------------

           MOVE RUSEC-SECUR-CLAS-ID        TO WASCL-SECUR-CLAS-ID.
           MOVE WGLOB-COMPANY-CODE         TO WASCL-CO-ID.

           PERFORM  ASCL-1000-READ
               THRU ASCL-1000-READ-X.

           IF WASCL-IO-NOT-FOUND
               GO TO 9500-CHECK-ASCL-X
           END-IF.

           PERFORM  9100-DISPLAY-THIS-APPL
               THRU 9100-DISPLAY-THIS-APPL-X.

       9500-CHECK-ASCL-X.
           EXIT.
      /
       COPY XCPPINIT.
      /
       COPY XCPPEXIT.
      /
       COPY XCCPABND.
      /
       COPY XCPPPASS.
      /
       COPY XCCL0020.
      /
       COPY XCPECOMP.
      /
       COPY XCCL0260.
      /
       COPY XCPL1640.
      /
       COPY XCPL1680.
      /
       COPY XCCP0030.
      /
       COPY XCPEAPPL.
      /
       COPY XCPS0005.
      /
       COPY XCPL0005.
      /
       COPY XCPS2490.
      /
       COPY XCCL2490.
       COPY XCCL8095.
      /
02MI01 COPY XCCL9684.
02MI01 COPY XCPS9684.
      /
SESCAP COPY XCPL0035.
SESCAP COPY XCPL1580.
SESCAP COPY CCPNPSYS.
SESCAP COPY XCPFUSEE.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
       COPY XCPNAPPL.
      /
       COPY XCPBASCL.
       COPY XCPNASCL.
      /
       COPY XCPNUSCL.
      /
       COPY XCPNUSEC.
       COPY XCPUUSEC.
      /
02MI01 COPY CCPAUSAU.
02MI01 COPY CCPCUSAU.
      /
       COPY XCPAUSES.
       COPY XCPBUSES.
       COPY XCPNUSES.
       COPY XCPUUSES.
       COPY XCPXUSES.
       COPY XCPCUSES.

       COPY XCPNUSEU.
      /
       COPY XCPNXTAB.
      *****************************************************************
      **                 END OF PROGRAM XSOM0060                     **
      *****************************************************************
