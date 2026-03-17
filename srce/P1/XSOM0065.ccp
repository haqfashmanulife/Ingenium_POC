      *****************************************************************
      **  MEMBER :  XSOM0065                                         **
      **  REMARKS:  PROCESS THE APPLICATION SIGN ON TRANSACTION      **
      **            FROM A TRUSTED CLIENT                            **
      **                                                             **
      **            THIS MODULE PERFORMS THE INGENIUM SIGN-ON        **
      **            BUSINESS FUNCTION WITH THE REQUIREMENT THAT      **
      **            ALL INFORMATION ABOUT THE USER, INCLUDING        **
      **            THE USER'S ID BE PASSED IN AS DATA TO THE PROCESS**
      **                                                             **
      **  DOMAIN :  SY                                               **
      *****************************************************************
      **  RELEASE   DESCRIPTION                                      **
      **                                                             **
PF 13 **  1.3       SUPPORT FOR EXTERNAL AUTHENTICATION - LDAP       **
PF 20 **  6.3.1     PATHFINDER 2.0 UPGRADE                           **
FT2001**  BOBAKB    CHANGES FOR LDAP SUPPORT                         **
FT2001**            (MOSTLY 7X24 PROCESSING CHGS REMOVED)            **
FT2001**  BOBAKB    MAKE USER-ID UPPERCASE FROM LDAP                 **
SESCAP**  31OCT04  AC     SESSION CAP ENHANCEMENT                    **
MP161N**  21DEC11  CTS    CHANGES TO MAKE WEBSERVICE WORKING WHILE   **
MP161N**                  BATCH RUN.                                 **
      *****************************************************************

       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM0065.

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
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM0065'.

       COPY SQLCA.
       COPY XCWLPTR.


       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                 PIC X(04).
               88  WS-BUS-FCN-VALID          VALUE '0065'.
               88  WS-BUS-FCN-LOGIN          VALUE '0065'.

           05  SUB1                         PIC S9(4)  VALUE ZERO
                                            BINARY.
           05  SUB2                         PIC S9(4)  VALUE ZERO
                                            BINARY.
           05  WS-ERROR-SW                  PIC X(01).
               88  WS-ERROR-FOUND           VALUE 'Y'.
               88  WS-ERROR-NO              VALUE 'N'.
           05  WS-HOLD-USES-REC-INFO        PIC X(220).
           05  WS-PROCESS-DATE              PIC X(10).
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
       COPY XCFWUSEU.
       COPY XCFWUSES.
       COPY XCFRUSES.
      /
       COPY XCFWXTAB.
       COPY XCFRXTAB.
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
SESCAP COPY XCWL0035.
SESCAP COPY XCWL1580.
SESCAP COPY CCFRPSYS.
SESCAP COPY CCFWPSYS.
SESCAP COPY XCFWUSEE.
      /
      *---------------
       LINKAGE SECTION.
      *---------------

       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM0065.
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
           SET  MIR-RETRN-OK                   TO TRUE.
MP161N     IF  MIR-CONCURRENT-IND = 'Y'
MP161N         SET  L0020-CONCURRENT-YES       TO TRUE
MP161N     END-IF.

           EVALUATE TRUE

               WHEN WS-BUS-FCN-LOGIN
                    PERFORM  2000-PROCESS-LOGIN
                        THRU 2000-PROCESS-LOGIN-X

               WHEN OTHER
      *MSG:  INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID        TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM0065'            TO WGLOB-MSG-PARM (2)
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

           IF WS-ERROR-FOUND
               PERFORM  9100-DISPLAY-THIS-APPL
                   THRU 9100-DISPLAY-THIS-APPL-X
               GO TO 2000-PROCESS-LOGIN-X
           END-IF.

           MOVE MIR-USER-ID                TO WUSEU-USER-ID.

           PERFORM  USEU-1000-READ
               THRU USEU-1000-READ-X.

           IF  WUSEU-IO-OK
               MOVE RUSES-CO-ID            TO WGLOB-COMPANY-CODE
               SET WUSES-IO-OK             TO TRUE
               IF  NOT RUSES-USER-SESN-STAT-API-CONN
                   PERFORM  2010-DELETE-OLD-USES
                       THRU 2010-DELETE-OLD-USES-X
               ELSE
                   PERFORM  2020-REESTABLISH-USES-RECORD
                       THRU 2020-REESTABLISH-USES-RECORD-X
               END-IF
           END-IF.

           MOVE RUSCL-SECUR-CNFD-ACCS-CD   TO WGLOB-SECUR-CNFD-ACCS-CD.
           MOVE RUSCL-SECUR-LVL-CD         TO WGLOB-SECUR-LVL-CD.
           MOVE MIR-BR-ID                  TO WGLOB-USER-BRANCH-CODE.
           MOVE MIR-USER-RPT-DSTRB-CD      TO WGLOB-USER-RPT-DSTRB-CD.

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

           MOVE RUSES-USER-SESN-ID       TO WUSES-USER-SESN-ID.
           PERFORM USES-1000-READ-FOR-UPDATE
              THRU USES-1000-READ-FOR-UPDATE-X.
           IF WUSES-IO-OK
FT2001*       MOVE L0020-ONLN-DT-CHNG-TIME   TO RUSES-ONLN-DT-CHNG-TIME
FT2001*       MOVE L0020-CHNG-LEAD-TIME-DUR  TO RUSES-CHNG-LEAD-TIME-DUR
              MOVE WGLOB-SECUR-CNFD-ACCS-CD  TO RUSES-SECUR-CNFD-ACCS-CD
              MOVE WGLOB-SECUR-LVL-CD        TO RUSES-SECUR-LVL-CD
              MOVE WGLOB-SECUR-CLAS-ID       TO RUSES-SECUR-CLAS-ID
              MOVE WGLOB-USER-BRANCH-CODE    TO RUSES-BR-ID
              MOVE WGLOB-USER-RPT-DSTRB-CD   TO RUSES-RPT-DSTRB-CD
              MOVE WGLOB-DT-FRMT-CD          TO RUSES-CTRY-DT-FRMT-CD
              MOVE WGLOB-DT-SEPARATOR-SYMBL  TO RUSES-CTRY-DT-SPRT-CD
              MOVE WGLOB-DT-ZERO-SUPRES-IND  TO RUSES-CTRY-LEAD-ZERO-IND
              MOVE WGLOB-CRCY-SYMBL          TO RUSES-CRCY-SYMBL-CD
              MOVE WGLOB-CRCY-POSN-CD        TO RUSES-CRCY-PLACE-CD
              MOVE WGLOB-SIGN-POSN-CD        TO RUSES-CRCY-NEG-PLACE-CD
              MOVE WGLOB-DCML-SYMBL          TO RUSES-CRCY-DCML-SPRT-CD
              MOVE WGLOB-THOUSANDS-SYMBL     TO RUSES-CRCY-THOU-SPRT-CD
              PERFORM USES-2000-REWRITE
                 THRU USES-2000-REWRITE-X
           END-IF.


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
           MOVE 'XS00650001'                   TO WGLOB-MSG-REF-INFO.
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
           SET RUSES-USER-SESN-STAT-API-CONN   TO TRUE.

           MOVE WUSES-KEY                      TO RUSES-KEY.
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
FT2001*        MOVE L1640-EXTERNAL-DATE    TO L0020-ONLN-PRCES-DT-DISP
FT2001*        MOVE WS-PROCESS-DATE        TO L0020-ONLN-PRCES-DT
               MOVE WS-USER-SESN-CTRY-CD   TO L0020-COUNTRY-CODE
               MOVE WS-USER-SESN-CRCY-CD   TO L0020-CURRENCY-CODE
           END-IF.

           MOVE MIR-USER-RPT-DSTRB-CD      TO L0020-USER-DIST-CODE.

           SET L0020-REQ-SIGN-ON           TO TRUE

           MOVE MIR-DV-APPL-STAT-CD        TO WS-DV-APPL-STAT-CD

           SET WS-ERROR-NO                 TO TRUE.
           EVALUATE TRUE

              WHEN  WS-DV-APPL-STAT-INACTIVE
              WHEN  WS-DV-APPL-STAT-STOPPED
      *MSG: DID NOT CONNECT. APPLICATION NOT AVAILABLE FOR SIGN-ON
                  MOVE 'XS00650002'        TO WGLOB-MSG-REF-INFO
                  PERFORM  0260-1000-GENERATE-MESSAGE
                      THRU 0260-1000-GENERATE-MESSAGE-X
                  SET WS-ERROR-FOUND       TO TRUE

              WHEN  WS-DV-APPL-STAT-ACTIVE
                  PERFORM  7580-EDIT-CTRY-CURR
                      THRU 7580-EDIT-CTRY-CURR-X
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
FT2001*         MOVE L0020-ONLN-PRCES-DT     TO L1680-INTERNAL-1
                MOVE ZERO                    TO L1680-NUMBER-OF-YEARS
                MOVE ZERO                    TO L1680-NUMBER-OF-MONTHS
                MOVE ZERO                    TO L1680-NUMBER-OF-DAYS
                PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
                    THRU 1680-3000-ADD-Y-M-D-TO-DATE-X
                MOVE L1680-INTERNAL-2        TO RUSES-USER-SESN-PRCES-DT
                MOVE L0020-BATCH-NUMBER      TO RUSES-USER-SESN-BTCH-NUM
                MOVE RAPPL-APPL-EDIT-LANG-CD TO RUSES-EDIT-LANG-CD
                PERFORM  USES-1000-WRITE
                    THRU USES-1000-WRITE-X

             WHEN L0020-RES-DISCONNECT
      *MSG: ANOTHER USER IS SIGNED ONTO THE APPLICATION ON THIS TERMINAL
                MOVE 'XS00650003'        TO WGLOB-MSG-REF-INFO
                PERFORM  0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X

             WHEN L0020-RES-EDITS-FAILURE
      *MSG: USER SESSION RECORD AND APPLICATION MASTER (TMAST) RECORD
      *          OUT OF SYNC
                MOVE 'XS00650004'        TO WGLOB-MSG-REF-INFO
                PERFORM  0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X

             WHEN OTHER
      *MSG:  UNKNOWN RETURN CODE FROM L0020
                MOVE 'XS00650005'        TO WGLOB-MSG-REF-INFO
                PERFORM  0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X
           END-EVALUATE.

       2041-ACTION-WITHOUT-USES-X.
           EXIT.

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
      *----------------
       7000-LOGIN-EDITS.
      *----------------

           PERFORM  7510-EDIT-USER-ID
               THRU 7510-EDIT-USER-ID-X.

           PERFORM  7590-EDIT-USES-WITH-USER
               THRU 7590-EDIT-USES-WITH-USER-X.

           IF  WS-ERROR-FOUND
               GO TO 7000-LOGIN-EDITS-X
           END-IF.

           PERFORM  7520-EDIT-SECUR-CLAS-ID
               THRU 7520-EDIT-SECUR-CLAS-ID-X.

SESCAP* PERFORM USER SESSION LIMIT CHECK IF SESSION CONTROL INDICATOR SAYS SO
SESCAP     IF RUSCL-SESN-CTL
SESCAP         PERFORM  7530-EDIT-SESN-CTL
SESCAP             THRU 7530-EDIT-SESN-CTL-X
SESCAP         IF WS-ERROR-FOUND
SESCAP             GO TO 7000-LOGIN-EDITS-X
SESCAP         END-IF
SESCAP     END-IF.
 
           PERFORM  7550-EDIT-BR-ID
               THRU 7550-EDIT-BR-ID-X.

           PERFORM  7570-EDIT-RPT-DSTRB-CD
               THRU 7570-EDIT-RPT-DSTRB-CD-X.


       7000-LOGIN-EDITS-X.
           EXIT.


      *-----------------
       7510-EDIT-USER-ID.
      *-----------------
           IF MIR-USER-ID = SPACES
      *MSG:  USER-ID REQUIRED FOR LOGIN
               MOVE 'XS00650006'                TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND               TO TRUE
               GO TO 7510-EDIT-USER-ID-X
           END-IF.

FT2001     MOVE MIR-USER-ID                    TO L0005-INPUT-STRING.
FT2001     PERFORM  0005-1000-CONVERT-STRING
FT2001         THRU 0005-1000-CONVERT-STRING-X.
FT2001     MOVE L0005-OUTPUT-STRING            TO MIR-USER-ID.
 
           MOVE MIR-USER-ID                    TO WGLOB-USER-ID.

       7510-EDIT-USER-ID-X.
           EXIT.

      *-----------------------
       7520-EDIT-SECUR-CLAS-ID.
      *-----------------------

           MOVE MIR-SECUR-CLAS-ID              TO WUSCL-SECUR-CLAS-ID.
           PERFORM  USCL-1000-READ
               THRU USCL-1000-READ-X.

           IF NOT WUSCL-IO-OK
               MOVE WUSCL-KEY                   TO WGLOB-MSG-PARM (1)
      *MSG: SECURITY CLASS RECORD (@1) NOT FOUND
               MOVE 'XS00650007'                TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND               TO TRUE
           ELSE
               MOVE MIR-SECUR-CLAS-ID           TO WGLOB-SECUR-CLAS-ID
           END-IF.

       7520-EDIT-SECUR-CLAS-ID-X.
           EXIT.
SESCAP*------------------
SESCAP 7530-EDIT-SESN-CTL.
SESCAP*------------------
SESCAP*  READ PSYS FOR SESSION EXPIRY PERIOD
SESCAP*  SUBTRACT SESSION EXPIRY PERIOD FROM SYSTEM TIMESTAMP
SESCAP*  GET NUMBER OF ACTIVE SESSIONS FROM TUSES (USE NEW CUSTOM IO MODULE XSIFUSES)
SESCAP*  IF THE NUMBER OF ACTIVE SESSIONS IS NOT LESS THAN MAXIMUM NUMBER OF ACTIVE SESSIONS
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
SESCAP     MOVE RPSYS-SESN-XPRY-DUR  TO L1580-INT-TIME-MI.
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
SESCAP     MOVE RUSCL-MAX-SESN-NUM TO WS-MAX-SESN-NUM.
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
SESCAP 7530-EDIT-SESN-CTL-X.
           EXIT.
            
      *----------------
       7550-EDIT-BR-ID.
      *----------------

           MOVE MIR-BR-ID             TO WXTAB-ETBL-VALU-ID.
           PERFORM BRCH-1000-EDIT-BRANCH-CODE
              THRU BRCH-1000-EDIT-BRANCH-CODE-X.

           IF WXTAB-IO-OK
               CONTINUE
           ELSE
      *MSG:  INVALID BRANCH ID
               MOVE 'XS00650012'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       7550-EDIT-BR-ID-X.
           EXIT.

      *----------------------
       7570-EDIT-RPT-DSTRB-CD.
      *----------------------

           MOVE MIR-USER-RPT-DSTRB-CD TO WXTAB-ETBL-VALU-ID.
           PERFORM DIST-1000-EDIT-DIST-CD
              THRU DIST-1000-EDIT-DIST-CD-X.

           IF WXTAB-IO-OK
               CONTINUE
           ELSE
      *MSG:  INVALID REPORT DISTRIBUTION CODE
               MOVE 'XS00650014'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       7570-EDIT-RPT-DSTRB-CD-X.
           EXIT.

      *-------------------
       7580-EDIT-CTRY-CURR.
      *-------------------

           MOVE WGLOB-SECUR-CLAS-ID     TO WASCL-SECUR-CLAS-ID.
           MOVE WGLOB-COMPANY-CODE      TO WASCL-CO-ID.

           IF WASCL-KEY NOT = RASCL-KEY
              PERFORM ASCL-1000-READ
                 THRU ASCL-1000-READ-X
           END-IF.

           PERFORM
              VARYING SUB1 FROM +1 BY +1
              UNTIL   SUB1 = +5
              OR RASCL-ASCL-CTRY-CD (SUB1) =
                 WS-USER-SESN-CTRY-CD
              CONTINUE
           END-PERFORM.

           IF RASCL-ASCL-CTRY-CD (SUB1) =
              WS-USER-SESN-CTRY-CD
               PERFORM
                  VARYING SUB2 FROM +1 BY +1
                  UNTIL   SUB2 = +5
                  OR RASCL-ASCL-CRCY-CD (SUB1, SUB2) =
                     WS-USER-SESN-CRCY-CD
                  CONTINUE
               END-PERFORM
               IF RASCL-ASCL-CRCY-CD (SUB1, SUB2) =
                  WS-USER-SESN-CRCY-CD
                   NEXT SENTENCE
               ELSE
      *MSG: NOT AUTHORIZED FOR REQUESTED CURRENCY. RE-ENTER
                   MOVE 'XS00650015'   TO WGLOB-MSG-REF-INFO
                   PERFORM 0260-1000-GENERATE-MESSAGE
                      THRU 0260-1000-GENERATE-MESSAGE-X
               END-IF
           ELSE
      *MSG: NOT AUTHORIZED FOR REQUESTED COUNTRY. RE-ENTER
               MOVE 'XS00650016'       TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       7580-EDIT-CTRY-CURR-X.
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

           MOVE RUSES-CO-ID                   TO WGLOB-COMPANY-CODE

           IF RUSES-USER-ID NOT = MIR-USER-ID
      *MSG: CURRENT SESSION IS ACTIVE, SIGN ON TO CURRENT SESSION WITH
      *     NEW USER ID IS NOT ALLOWED.
               MOVE 'XS00650017'              TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND             TO TRUE
               GO TO 7590-EDIT-USES-WITH-USER-X
           END-IF.

           IF RUSES-USER-SESN-STAT-API-CONN
      *MSG: WARNING: YOU ARE ALREADY SIGNED ON TO INGENIUM IN THIS
      *     SESSION.  LOGIN REQUEST IS IGNORED
               MOVE 'XS00650018'              TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               IF WGLOB-MSG-SEVRTY-FATAL
                   SET WS-ERROR-FOUND         TO TRUE
                   GO TO 7590-EDIT-USES-WITH-USER-X
               END-IF
           END-IF.

       7590-EDIT-USES-WITH-USER-X.
           EXIT.
      /
      *---------------
       8000-DATA-ERROR.
      *---------------
      *
           IF L0020-CURRENCY-CODE = HIGH-VALUES
      *MSG: NOT AUTHORIZED FOR REQUESTED CURRENCY. RE-ENTER
               MOVE 'XS00650015'              TO WGLOB-MSG-REF-INFO
           ELSE
               IF L0020-COUNTRY-CODE = HIGH-VALUES
      *MSG: NOT AUTHORIZED FOR REQUESTED COUNTRY. RE-ENTER
                   MOVE 'XS00650016'          TO WGLOB-MSG-REF-INFO
               ELSE
      *MSG: UNKNOWN DATA ERROR FROM EXIT - CONTACT SYSTEMS
                   MOVE 'XS00650019'          TO WGLOB-MSG-REF-INFO
               END-IF
           END-IF.

           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.

           PERFORM 9100-DISPLAY-THIS-APPL
              THRU 9100-DISPLAY-THIS-APPL-X.

       8000-DATA-ERROR-X.
           EXIT.
      /
      *----------------------
       9100-DISPLAY-THIS-APPL.
      *----------------------

           MOVE SPACE                         TO MIR-USER-SESN-BTCH-NUM.
           MOVE SPACE                         TO MIR-USER-SESN-STAT-CD.
           MOVE SPACE                         TO MIR-DV-APPL-STAT-CD.
           MOVE SPACE                         TO MIR-USER-SESN-CTRY-CD.
           MOVE SPACE                         TO MIR-USER-SESN-CRCY-CD.

           MOVE WGLOB-COMPANY-CODE            TO WAPPL-CO-ID.
           PERFORM  APPL-1000-READ
               THRU APPL-1000-READ-X.

           IF NOT WAPPL-IO-OK
      *    INTEGRITY PROBLEM WITH ASCL AND APPL TABLES.
              MOVE WAPPL-KEY                   TO WGLOB-MSG-PARM (1)
      *MSG: APPLICATION (@1) NOT FOUND. FILES OUT OF SYNC. CONTACT
      *  SYSTEMS
              MOVE 'XS00650020'                TO WGLOB-MSG-REF-INFO
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

           MOVE WGLOB-COMPANY-CODE            TO MIR-CO-ID.
           MOVE WGLOB-DT-FRMT-CD              TO MIR-CTRY-DT-FRMT-CD.
           MOVE WGLOB-DT-SEPARATOR-SYMBL      TO MIR-CTRY-DT-SPRT-CD.
           MOVE WGLOB-DT-ZERO-SUPRES-IND      TO MIR-CTRY-LEAD-ZERO-IND.
           MOVE WGLOB-CRCY-SYMBL              TO MIR-CRCY-SYMBL-CD.
           MOVE WGLOB-THOUSANDS-SYMBL         TO MIR-CRCY-THOU-SPRT-CD.
           MOVE WGLOB-DCML-SYMBL              TO MIR-CRCY-DCML-SPRT-CD.
           MOVE WGLOB-SIGN-POSN-CD            TO MIR-CRCY-NEG-PLACE-CD.
           MOVE WGLOB-CRCY-POSN-CD            TO MIR-CRCY-PLACE-CD.
PF 20      MOVE WGLOB-CRCY-SCALE-QTY          TO MIR-CRCY-SCALE-QTY.

      *  WHEN SUPPORT FOR ISO DATES IS ADDED THE FOLLOWING LINE SHOULD
      *  BE MODIFIED TO INDICATE THIS.
PF 20 *    MOVE 'N'                           TO MIR-ISO-DT-FRMT-IND.
PF 20      MOVE 'N'                           TO MIR-DV-ISO-DT-FRMT-IND.
      *  WHEN CURRENCY SCALING LOGIC FROM THE 612J PROJECT IS ADDED
      *  THE FOLLOWING LINE SHOULD BE MODIFIED TO REFLECT THE ADDITIONAL
      *  SUPPORT.
PF 20 *    MOVE '2'                           TO MIR-CRCY-SCALE-QTY.


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
               MOVE 'XS00650021'  TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           MOVE RUSES-USER-SESN-CTRY-CD       TO MIR-USER-SESN-CTRY-CD.
           MOVE RUSES-USER-SESN-CRCY-CD       TO MIR-USER-SESN-CRCY-CD.
           MOVE L0020-BATCH-NUMBER            TO MIR-USER-SESN-BTCH-NUM.
           IF  RUSES-USER-SESN-PRCES-DT = WWKDT-LOW-DT
               MOVE SPACES                    TO MIR-USER-SESN-PRCES-DT
           ELSE
               MOVE RUSES-USER-SESN-PRCES-DT  TO L1640-INTERNAL-DATE
               PERFORM 1640-2000-INTERNAL-TO-EXT
                  THRU 1640-2000-INTERNAL-TO-EXT-X
               MOVE L1640-EXTERNAL-DATE       TO MIR-USER-SESN-PRCES-DT
           END-IF.
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
FT2001*        MOVE RUSES-USER-SESN-PRCES-DT   TO L0020-ONLN-PRCES-DT
FT2001*        MOVE SPACE                    TO L0020-ONLN-PRCES-DT-DISP
FT2001*        MOVE RUSES-ONLN-DT-CHNG-TIME  TO L0020-ONLN-DT-CHNG-TIME
FT2001*        MOVE RUSES-CHNG-LEAD-TIME-DUR TO L0020-CHNG-LEAD-TIME-DUR
           ELSE
               MOVE WGLOB-COMPANY-CODE         TO L0020-CO-ID
FT2001*        MOVE SPACES                     TO L0020-ONLN-PRCES-DT
               MOVE SPACES                     TO L0020-COUNTRY-CODE
               MOVE SPACES                     TO L0020-CURRENCY-CODE
FT2001*        MOVE WWKDT-ZERO-TIME        TO L0020-ONLN-DT-CHNG-TIME
FT2001*        MOVE ZERO                   TO L0020-CHNG-LEAD-TIME-DUR
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

           MOVE SPACES                        TO WGLOB-MSIN-REFERENCE.
           MOVE WGLOB-COMPANY-CODE            TO WGLOB-REF-COMPANY-CODE.

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
FT2001*          MOVE L0020-ONLN-PRCES-DT-DISP TO WS-USER-SESN-PRCES-DT
                 MOVE L0020-COUNTRY-CODE       TO WS-USER-SESN-CTRY-CD
                 MOVE L0020-CURRENCY-CODE      TO WS-USER-SESN-CRCY-CD
FT2001*          MOVE L0020-ONLN-PRCES-DT      TO WS-PROCESS-DATE

               WHEN L0020-RES-PROHIBIT-ACCESS
                 SET WS-DV-APPL-STAT-STOPPED   TO TRUE
FT2001*          MOVE L0020-ONLN-PRCES-DT-DISP TO WS-USER-SESN-PRCES-DT
                 MOVE L0020-COUNTRY-CODE       TO WS-USER-SESN-CTRY-CD

                 MOVE L0020-CURRENCY-CODE      TO WS-USER-SESN-CRCY-CD
FT2001*          MOVE L0020-ONLN-PRCES-DT      TO WS-PROCESS-DATE
        
               WHEN L0020-RES-DISCONNECT
               WHEN L0020-RES-LOGOFF
      *MSG: SESSION FILE AND USER FILE OUT OF SYNC - CONTACT
      *       SYSTEMS
                 MOVE 'XS00650022'             TO WGLOB-MSG-REF-INFO
                 PERFORM  0260-1000-GENERATE-MESSAGE
                     THRU 0260-1000-GENERATE-MESSAGE-X

               WHEN L0020-RES-DATA-ERROR
      *MSG: SESSION FILE AND (@1) USER FILE OUT OF SYNC - CONTACT
      *           SYSTEMS
                 MOVE 'XS00650022'             TO WGLOB-MSG-REF-INFO
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

           MOVE WGLOB-SECUR-CLAS-ID        TO WASCL-SECUR-CLAS-ID.
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
       COPY XCCL0020.
      /
       COPY XCPECOMP.
       COPY XCPEBRCH.
       COPY XCPEDIST.
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
      **                 END OF PROGRAM XSOM0065                     **
      *****************************************************************
