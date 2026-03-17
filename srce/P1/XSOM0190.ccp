       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM0190.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM0190                                         **
      **  REMARKS:  LIST ALL USERS SIGNED ON TO THE SYSTEM OR FORCE  **
      **            ONE OR ALL USERS OFF THE SYSTEM.                 **
      **            THIS MODULE WILL LIST ALL USERS SIGNED ON TO     **
      **            APPLICATIONS WITHIN TPI. THE TERMINAL OPERATOR   **
      **            MAY THEN FORCE ONE OR ALL USERS OFF THE          **
      **            APPLICATIONS. A PASSWORD IS REQUIRED WHEN        **
      **            FORCING OFF USERS.                               **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
53-062**  30NOV95  VK     ARCHITECTURE CHANGES TO SUPPORT GRAPHICAL  **
53-062**                  USER INTERFACE                             **
53-064**  30NOV95  CG     MOREDATA (GUI)                             **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
530109**  08JAN96  TSW    INIT MIR PRIOR TO DISPLAY (REQUIRED FOR GUI)*
54-001**  01SEP96  MTW    MODIFICATIONS FOR MAINTAINABILITY          **
557660**  30SEP97  CG     CHANGE TO STANDARD                         **
557708**  30SEP97  GV     MODIFICATIONS FOR CICS ABENDS HANDLING     **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
011554**  30OCT98  56     FIX TO AVOID CICS ABENDS WHEN TRYING TO    **
011554**                  START A TRANSACTION ON A NON-EXISTING TERM **
013578**  15DEC99  60     REMOVAL OF 3270 LOGIC, MIR RENAMES         **
014660**  15DEC99  60     REMOVAL OF XCPPMEXT                        **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
02MI01**  30JUN02  MAW    LOGIN FAILURE MONITORING AND PASSWORD      **
02MI01**                  ENCRYPTION                                 **
PF 13 **  6.2      BMB    PATHFINDER 1.2 APPLIED AS PER 1.3 RELEASE  **
      *****************************************************************

       ENVIRONMENT DIVISION.
      **********************
      *
       DATA DIVISION.
      ***************
      *
       WORKING-STORAGE SECTION.
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM0190'.

       COPY SQLCA.
       COPY XCWLPTR.


014590*COPY XCWL0030.
       COPY XCWL8090.


       01  WS-WORKING-STORAGE.
           05  WS-SUB                       PIC S9(4) COMP VALUE ZERO.
           05  WS-MAX-BROWSE-LINES          PIC S9(4) COMP VALUE +100.
           05  WS-HOLD-USER                 PIC X(08)  VALUE SPACES.
           05  WS-HOLD-APPL                 PIC X(02)  VALUE SPACES.
           05  WS-HOLD-COMP                 PIC X(02)  VALUE SPACES.
           05  WS-HOLD-PASSWRD              PIC X(08)  VALUE SPACES.
           05  WS-BUS-FCN-ID                PIC X(04).
               88  WS-BUS-FCN-ID-VALID                 VALUES ARE
                   '1990', '1991'.
               88  WS-BUS-FCN-DISPLAY                  VALUE '1990'.
               88  WS-BUS-FCN-FORCE                    VALUE '1991'.
      *
           05  COUNT-FORCE-OFF-APPL-RECS    PIC 9(04).
           05  I                            REDEFINES
               COUNT-FORCE-OFF-APPL-RECS    PIC 9(04).

           05  WS-BROWSE-IO-TYPE-CD         PIC X(04).
               88  WS-BROWSE-BY-USER        VALUE 'USEU'.
               88  WS-BROWSE-BY-CO-ID       VALUE 'USEB'.
               88  WS-BROWSE-BY-STATUS      VALUE 'USEA'.
           05  WS-USES-IO-STATUS            PIC 9(01).
               88  WS-USES-IO-OK            VALUE 0.
               88  WS-USES-IO-NOT-FOUND     VALUE 7.
               88  WS-USES-IO-EOF           VALUE 8.
               88  WS-USES-IO-ERROR         VALUE 9.
      *
       01  WS-TWRK-KEY                      PIC X(04)  VALUE '1990'.

       01  WS-TWRK-WORK-AREA.
           05  WS-TWRK-KEY-FIELDS-AREA.
               10  WS-TWRK-MIR-CO-ID             PIC X(02).
               10  WS-TWRK-MIR-DV-CO-ID-IND      PIC X(01).
               10  WS-TWRK-MIR-USER-ID           PIC X(08).
               10  WS-TWRK-MIR-DV-USER-ID-IND    PIC X(01).
           05  WS-TWRK-NXT-REC-AREA.
               10  WS-TWRK-NXT-CO-ID             PIC X(02).
               10  WS-TWRK-NXT-USER-ID           PIC X(08).
               10  WS-TWRK-NXT-USER-SESN-STAT-CD PIC X(01).
      /
       COPY XCWL0020.
      /
       COPY XCWL8095.
      /
02MI01 COPY XCWL9684.
      /
       COPY XCFWAPPL.
       COPY XCFRAPPL.
      /
       COPY XCFWUSEC.
       COPY XCFRUSEC.
      /
       COPY XCFWUSEA.
       COPY XCFWUSEB.
       COPY XCFWUSEU.
       COPY XCFWUSES.
       COPY XCFRUSES.
      *
      /
       COPY XCWWWKDT.
      /
       LINKAGE SECTION.
      *****************

      *
       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM0190.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                MIR-PARM-AREA.

      ***************
       0000-MAINLINE.
      ***************
      *
           PERFORM  ABND-1000-HANDLE-ABEND
               THRU ABND-1000-HANDLE-ABEND-X.

           PERFORM INIT-1000-INITIALIZE
              THRU INIT-1000-INITIALIZE-X.
      *
           PERFORM 2000-PROCESS-REQUEST
              THRU 2000-PROCESS-REQUEST-X.
      *
           PERFORM EXIT-1000-FINALIZE
              THRU EXIT-1000-FINALIZE-X.

           GOBACK.

       0000-MAINLINE-X.
           EXIT.
      /
      **********************
       2000-PROCESS-REQUEST.
      **********************

           SET  MIR-RETRN-OK       TO TRUE.
           MOVE MIR-BUS-FCN-ID     TO WS-BUS-FCN-ID.
      *
      *---- PROCESS SCREEN FUNCTIONS

           EVALUATE TRUE

               WHEN WS-BUS-FCN-DISPLAY
                    PERFORM  3000-PROCESS-DISPLAY
                        THRU 3000-PROCESS-DISPLAY-X

               WHEN WS-BUS-FCN-FORCE
                    PERFORM  4000-PROCESS-FORCE
                        THRU 4000-PROCESS-FORCE-X

               WHEN OTHER
      *MSG: INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID    TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM0190'        TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000237'      TO WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET MIR-RETRN-INVALD-RQST  TO TRUE

           END-EVALUATE.

       2000-PROCESS-REQUEST-X.
           EXIT.
      /
      **********************
       3000-PROCESS-DISPLAY.
      **********************
      *
           INITIALIZE WS-TWRK-WORK-AREA.
           MOVE ZERO  TO WGLOB-MORE-DATA-IND.

           PERFORM  9700-RETRIEVE-TWRK
               THRU 9700-RETRIEVE-TWRK-X.

           IF L8090-RETRN-OK
               MOVE L8090-AREA-INFO-TEXT  TO WS-TWRK-WORK-AREA
               PERFORM  9900-DELETE-TWRK
                   THRU 9900-DELETE-TWRK-X
           END-IF.

           PERFORM  9110-EDIT-KEY
               THRU 9110-EDIT-KEY-X.
      *
           IF  WGLOB-MSG-ERROR-SW > ZERO
               GO TO 3000-PROCESS-DISPLAY-X
           END-IF.

           IF  WS-TWRK-MIR-CO-ID          = MIR-CO-ID
           AND WS-TWRK-MIR-DV-CO-ID-IND   = MIR-DV-CO-ID-IND
           AND WS-TWRK-MIR-USER-ID        = MIR-USER-ID
           AND WS-TWRK-MIR-DV-USER-ID-IND = MIR-DV-USER-ID-IND
               CONTINUE
           ELSE
               MOVE MIR-CO-ID             TO WS-TWRK-NXT-CO-ID
               MOVE MIR-USER-ID           TO WS-TWRK-NXT-USER-ID
           END-IF.
      *
           PERFORM  8000-MOVE-DATA-TO-SCREEN
               THRU 8000-MOVE-DATA-TO-SCREEN-X.

           IF WGLOB-MORE-DATA-EXISTS
               MOVE RUSES-CO-ID           TO WS-TWRK-NXT-CO-ID
               MOVE RUSES-USER-ID         TO WS-TWRK-NXT-USER-ID
               MOVE RUSES-USER-SESN-STAT-CD
                 TO WS-TWRK-NXT-USER-SESN-STAT-CD
           END-IF.

           MOVE MIR-CO-ID                 TO WS-TWRK-MIR-CO-ID.
           MOVE MIR-DV-CO-ID-IND          TO WS-TWRK-MIR-DV-CO-ID-IND.
           MOVE MIR-USER-ID               TO WS-TWRK-MIR-USER-ID.
           MOVE MIR-DV-USER-ID-IND        TO WS-TWRK-MIR-DV-USER-ID-IND.

           PERFORM  9800-WRITE-TWRK
               THRU 9800-WRITE-TWRK-X.

       3000-PROCESS-DISPLAY-X.
           EXIT.
      *
      *
      ********************
       4000-PROCESS-FORCE.
      ********************

           IF MIR-DV-PRCES-STATE-CD = '3'
               PERFORM  4200-FORCE-PASS-2
                   THRU 4200-FORCE-PASS-2-X
           ELSE
               PERFORM  4100-FORCE-PASS-1
                   THRU 4100-FORCE-PASS-1-X
           END-IF.
      *
       4000-PROCESS-FORCE-X.
           EXIT.
      /
      *-----------------
       4100-FORCE-PASS-1.
      *-----------------

           PERFORM  9110-EDIT-KEY
               THRU 9110-EDIT-KEY-X.

           PERFORM  9120-EDIT-PASSWORD
               THRU 9120-EDIT-PASSWORD-X.

           IF  WGLOB-MSG-ERROR-SW > ZERO
               GO TO 4100-FORCE-PASS-1-X
           END-IF.

           INITIALIZE WS-TWRK-WORK-AREA.
           MOVE MIR-CO-ID          TO WS-TWRK-NXT-CO-ID.
           MOVE MIR-USER-ID        TO WS-TWRK-NXT-USER-ID.

           PERFORM  8000-MOVE-DATA-TO-SCREEN
               THRU 8000-MOVE-DATA-TO-SCREEN-X.

       4100-FORCE-PASS-1-X.
           EXIT.
      /
      *-----------------
       4200-FORCE-PASS-2.
      *-----------------

           PERFORM  9110-EDIT-KEY
               THRU 9110-EDIT-KEY-X.

           PERFORM  9120-EDIT-PASSWORD
               THRU 9120-EDIT-PASSWORD-X.

           IF  WGLOB-MSG-ERROR-SW > ZERO
               GO TO 4200-FORCE-PASS-2-X
           END-IF.

           MOVE ZERO                  TO COUNT-FORCE-OFF-APPL-RECS.
           MOVE SPACES                TO MIR-USER-ID-G.
           MOVE SPACES                TO MIR-CO-ID-G.
           MOVE SPACES                TO MIR-USER-SESN-STAT-CD-G.

           INITIALIZE WS-TWRK-WORK-AREA.
           MOVE MIR-CO-ID          TO WS-TWRK-NXT-CO-ID.
           MOVE MIR-USER-ID        TO WS-TWRK-NXT-USER-ID.

           PERFORM  9130-SET-BROWSE-KEY
               THRU 9130-SET-BROWSE-KEY-X.

           PERFORM  9150-USES-BROWSE
               THRU 9150-USES-BROWSE-X.

           PERFORM  9170-USES-READ-NEXT
               THRU 9170-USES-READ-NEXT-X.

           PERFORM  4220-PROCESS-FORCE-OFF
               THRU 4220-PROCESS-FORCE-OFF-X
              UNTIL WS-USES-IO-EOF.

           PERFORM  9190-USES-END-BROWSE
               THRU 9190-USES-END-BROWSE-X.
      *
      *---- FEEDBACK NUMBER OF APPLICATION SESSION RECS FORCED OFF
      *
           MOVE COUNT-FORCE-OFF-APPL-RECS  TO WGLOB-MSG-PARM (1).
           MOVE 'XS01900002'               TO WGLOB-MSG-REF-INFO.
      *MSG: (@1) APPLICATION SESSIONS FORCED OFF
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

       4200-FORCE-PASS-2-X.
           EXIT.
      /
      ************************
       4220-PROCESS-FORCE-OFF.
      ************************
      *
           PERFORM  4240-BREAK-CONNECTION
               THRU 4240-BREAK-CONNECTION-X
      *
           PERFORM  9170-USES-READ-NEXT
               THRU 9170-USES-READ-NEXT-X.
      *
       4220-PROCESS-FORCE-OFF-X.
           EXIT.
      /
      ***************************
       4240-BREAK-CONNECTION.
      ***************************

           MOVE RUSES-CO-ID           TO WAPPL-CO-ID.
           PERFORM  APPL-1000-READ
               THRU APPL-1000-READ-X.
           IF  WAPPL-IO-NOT-FOUND
               MOVE WAPPL-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000001'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4240-BREAK-CONNECTION-X
           END-IF.

      *---- CALL EXIT SUBPROGRAM TO LOGOFF CERTAIN USER
           MOVE RUSES-USER-ID         TO L0020-USER-ID.
           MOVE RUSES-CO-ID           TO L0020-CO-ID.
           SET  L0020-REQ-LOGOFF      TO TRUE.

           PERFORM  0020-1000-LINK-TO-APPL
               THRU 0020-1000-LINK-TO-APPL-X.

           IF  NOT L0020-RES-LOGOFF
               MOVE L0020-EXIT-RESPONSE TO WGLOB-MSG-PARM (1)
               MOVE 'XS01900006'        TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4240-BREAK-CONNECTION-X
           END-IF.
      *
      *---- PERFORM CLEANUP OF MSIN, TWRK AND USER RECORDS

           MOVE RUSES-USER-ID           TO L8095-USER-ID.
           PERFORM  8095-1000-CLEANUP-MSIN-TWRK
               THRU 8095-1000-CLEANUP-MSIN-TWRK-X.
           IF NOT L8095-RETRN-OK
      *MSG: CLEANUP OF MSIN AND TWRK FAILED FOR USERID (@1)
               MOVE L8095-USER-ID       TO WGLOB-MSG-PARM (1)
               MOVE 'XS01900005'        TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4240-BREAK-CONNECTION-X
           END-IF.

           PERFORM  8095-3000-CLEANUP-USER
               THRU 8095-3000-CLEANUP-USER-X.
           IF NOT L8095-RETRN-OK
      *MSG: CLEANUP OF SESSION TOTAL RECORDS FAILED FOR USERID (@1)
               MOVE L8095-USER-ID       TO WGLOB-MSG-PARM (1)
               MOVE 'XS01900003'        TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4240-BREAK-CONNECTION-X
           END-IF.

           MOVE RUSES-USER-ID         TO WUSEU-USER-ID.
           PERFORM  USEU-1000-READ
               THRU USEU-1000-READ-X.
           IF WUSEU-IO-OK
               NEXT SENTENCE
           ELSE
               MOVE WUSEU-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000010'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
            END-IF.

           MOVE RUSES-KEY             TO WUSES-KEY.
           PERFORM  USES-1000-READ-FOR-UPDATE
               THRU USES-1000-READ-FOR-UPDATE-X.
      *
           IF  WUSES-IO-OK
               SET RUSES-USER-SESN-STAT-NOT-CONN   TO TRUE
               MOVE SPACE             TO RUSES-USER-SESN-CTRY-CD
               MOVE SPACE             TO RUSES-USER-SESN-CRCY-CD
               MOVE WWKDT-ZERO-DT     TO RUSES-USER-SESN-PRCES-DT
               ADD  +1 TO COUNT-FORCE-OFF-APPL-RECS
               MOVE RUSES-USER-ID     TO MIR-USER-ID-T (I)
               MOVE RUSES-CO-ID       TO MIR-CO-ID-T (I)
               MOVE RUSES-USER-SESN-STAT-CD
                                      TO MIR-USER-SESN-STAT-CD-T (I)
               PERFORM  USES-2000-REWRITE
                   THRU USES-2000-REWRITE-X
           ELSE
               MOVE WUSES-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000010'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
            END-IF.
      *
       4240-BREAK-CONNECTION-X.
           EXIT.
      /
      *------------------------
       8000-MOVE-DATA-TO-SCREEN.
      *------------------------

           PERFORM  9130-SET-BROWSE-KEY
               THRU 9130-SET-BROWSE-KEY-X.

           PERFORM  9150-USES-BROWSE
               THRU 9150-USES-BROWSE-X.

           PERFORM  9170-USES-READ-NEXT
               THRU 9170-USES-READ-NEXT-X.
      *
      * INITIALIZE THE MIR RECORD PRIOR TO FILLING WITH BROWSE INFO
      *
           MOVE SPACES                TO MIR-USER-ID-G.
           MOVE SPACES                TO MIR-CO-ID-G.
           MOVE SPACES                TO MIR-USER-SESN-STAT-CD-G.
      *
           PERFORM  8100-BROWSE-ONE-REC
               THRU 8100-BROWSE-ONE-REC-X
            VARYING WS-SUB FROM 1 BY 1
              UNTIL WS-SUB > WS-MAX-BROWSE-LINES
                 OR WS-USES-IO-EOF.
      *
      *---- FEEDBACK END OF FILE OR MORE ON NEXT SCREEN
           IF  WS-USES-IO-EOF
               MOVE 'XS00000025'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
               SET WGLOB-MORE-DATA-EXISTS TO TRUE
               MOVE 'XS00000014'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           PERFORM  9190-USES-END-BROWSE
               THRU 9190-USES-END-BROWSE-X.
      *
       8000-MOVE-DATA-TO-SCREEN-X.
           EXIT.
      /
      *-------------------
       8100-BROWSE-ONE-REC.
      *-------------------

           MOVE RUSES-USER-ID
             TO MIR-USER-ID-T (WS-SUB).
           MOVE RUSES-USER-SESN-STAT-CD
             TO MIR-USER-SESN-STAT-CD-T (WS-SUB).
           MOVE RUSES-CO-ID
             TO MIR-CO-ID-T (WS-SUB).

           PERFORM  9170-USES-READ-NEXT
               THRU 9170-USES-READ-NEXT-X.

       8100-BROWSE-ONE-REC-X.
           EXIT.
      /
      *-------------
       9110-EDIT-KEY.
      *-------------

           IF  MIR-USER-ID = SPACES
           AND MIR-DV-USER-ID-IND NOT = 'Y'
      *MSG: USER ID INFORMATION REQUIRED. PLEASE ENTER USER ID
      *       OR SELECT ALL USERS
               MOVE 'XS01900004'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 9110-EDIT-KEY-X
           END-IF.
      *
           IF  MIR-CO-ID = SPACES
           AND MIR-DV-CO-ID-IND NOT = 'Y'
      *MSG: COMPANY ID INFORMATION REQUIRED.  PLEASE ENTER COMPANY ID
      *       OR SELECT ALL COMPANIES.
               MOVE 'XS01900007'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 9110-EDIT-KEY-X
           END-IF.
      *

           IF MIR-DV-CO-ID-IND = 'Y'
           OR MIR-CO-ID = SPACES
               SET WS-BROWSE-BY-STATUS      TO TRUE
           END-IF.

           IF  MIR-CO-ID > SPACES
               SET WS-BROWSE-BY-CO-ID       TO TRUE
           END-IF.

           IF MIR-USER-ID > SPACES
               SET WS-BROWSE-BY-USER           TO TRUE
           END-IF.

       9110-EDIT-KEY-X.
            EXIT.
      /
      *------------------
       9120-EDIT-PASSWORD.
      *------------------

      *---- CHECK PASSWORD
           MOVE WGLOB-USER-ID         TO WUSEC-USER-ID.
           PERFORM  USEC-1000-READ
               THRU USEC-1000-READ-X.

02MI01*    IF  WUSEC-IO-OK
02MI01*    AND RUSEC-USER-PSWD-TXT = MIR-USER-PSWD-TXT
02MI01*        NEXT SENTENCE
02MI01*    ELSE
02MI01*MSG: PASSWORD INCORRECT FOR USERID. RE-ENTER
02MI01*        MOVE 'XS01900001'      TO WGLOB-MSG-REF-INFO
02MI01*        PERFORM  0260-1000-GENERATE-MESSAGE
02MI01*            THRU 0260-1000-GENERATE-MESSAGE-X
02MI01*    END-IF.

02MI01     IF NOT WUSEC-IO-OK
02MI01         GO TO 9120-EDIT-PASSWORD-X
02MI01     END-IF.
02MI01
02MI01     PERFORM  9684-1000-BUILD-PARM-INFO
02MI01         THRU 9684-1000-BUILD-PARM-INFO-X.
02MI01     MOVE MIR-USER-PSWD-TXT     TO L9684-INPUT-STRING.
02MI01     PERFORM  9684-1000-ENCRYPT-DATA
02MI01         THRU 9684-1000-ENCRYPT-DATA-X.
02MI01
02MI01     IF L9684-OUTPUT-STRING = RUSEC-USER-PSWD-TXT
02MI01         NEXT SENTENCE
02MI01     ELSE
02MI01*MSG: PASSWORD INCORRECT FOR USERID. RE-ENTER
02MI01         MOVE 'XS01900001'      TO WGLOB-MSG-REF-INFO
02MI01         PERFORM  0260-1000-GENERATE-MESSAGE
02MI01             THRU 0260-1000-GENERATE-MESSAGE-X
02MI01     END-IF.
 
       9120-EDIT-PASSWORD-X.
           EXIT.
      /
      *-------------------
       9130-SET-BROWSE-KEY.
      *-------------------

           EVALUATE TRUE

               WHEN WS-BROWSE-BY-USER
                   MOVE WS-TWRK-NXT-USER-ID   TO WUSEU-USER-ID
                   MOVE WS-TWRK-NXT-USER-ID   TO WUSEU-ENDBR-USER-ID

               WHEN WS-BROWSE-BY-CO-ID
                   MOVE LOW-VALUES            TO WUSEB-KEY
                   MOVE HIGH-VALUES           TO WUSEB-ENDBR-KEY
                   MOVE WS-TWRK-NXT-CO-ID     TO WUSEB-CO-ID
                   MOVE WS-TWRK-NXT-USER-ID   TO WUSEB-USER-ID
                   MOVE WS-TWRK-NXT-USER-SESN-STAT-CD
                     TO WUSEB-USER-SESN-STAT-CD
                   MOVE WS-TWRK-NXT-CO-ID     TO WUSEB-ENDBR-CO-ID
                   IF WS-BUS-FCN-FORCE
PF 13 *                SET  WUSEB-USER-SESN-STAT-CONN
PF 13 *                  TO TRUE
PF 13                  SET  WUSEB-USER-SESN-STAT-API-CONN
PF 13                    TO TRUE
                       MOVE WUSEB-USER-SESN-STAT-CD
                         TO WUSEB-ENDBR-USER-SESN-STAT-CD
                   END-IF

               WHEN WS-BROWSE-BY-STATUS
                   MOVE WS-TWRK-NXT-USER-SESN-STAT-CD
                     TO WUSEA-USER-SESN-STAT-CD
                   MOVE WS-TWRK-NXT-CO-ID     TO WUSEA-CO-ID
                   MOVE WS-TWRK-NXT-USER-ID   TO WUSEA-USER-ID
                   MOVE HIGH-VALUES           TO WUSEA-ENDBR-KEY
                   IF WS-BUS-FCN-FORCE
PF 13 *                SET  WUSEA-USER-SESN-STAT-CONN
PF 13 *                  TO TRUE
PF 13                  SET  WUSEA-USER-SESN-STAT-API-CONN
PF 13                    TO TRUE
                       MOVE WUSEA-USER-SESN-STAT-CD
                         TO WUSEA-ENDBR-USER-SESN-STAT-CD
                   END-IF

           END-EVALUATE.

       9130-SET-BROWSE-KEY-X.
           EXIT.

      *----------------
       9150-USES-BROWSE.
      *----------------

           EVALUATE TRUE

               WHEN WS-BROWSE-BY-USER
                   PERFORM  USEU-1000-BROWSE
                       THRU USEU-1000-BROWSE-X
                   MOVE WUSEU-IO-STATUS   TO WS-USES-IO-STATUS

               WHEN WS-BROWSE-BY-CO-ID
                   PERFORM  USEB-4000-BROWSE-INDEX
                       THRU USEB-4000-BROWSE-INDEX-X
                   MOVE WUSEB-IO-STATUS   TO WS-USES-IO-STATUS

               WHEN WS-BROWSE-BY-STATUS
                   PERFORM  USEA-4000-BROWSE-INDEX
                       THRU USEA-4000-BROWSE-INDEX-X
                   MOVE WUSEA-IO-STATUS   TO WS-USES-IO-STATUS

           END-EVALUATE.

       9150-USES-BROWSE-X.
           EXIT.

      *-------------------
       9170-USES-READ-NEXT.
      *-------------------

           EVALUATE TRUE

               WHEN WS-BROWSE-BY-USER
                   PERFORM  USEU-2000-READ-NEXT
                       THRU USEU-2000-READ-NEXT-X
                   MOVE WUSEU-IO-STATUS   TO WS-USES-IO-STATUS

               WHEN WS-BROWSE-BY-CO-ID
                   PERFORM  USEB-5000-READ-NEXT-INDEX
                       THRU USEB-5000-READ-NEXT-INDEX-X
                   MOVE WUSEB-IO-STATUS   TO WS-USES-IO-STATUS

               WHEN WS-BROWSE-BY-STATUS
                   PERFORM  USEA-5000-READ-NEXT-INDEX
                       THRU USEA-5000-READ-NEXT-INDEX-X
                   MOVE WUSEA-IO-STATUS   TO WS-USES-IO-STATUS

           END-EVALUATE.

       9170-USES-READ-NEXT-X.
           EXIT.

      *--------------------
       9190-USES-END-BROWSE.
      *--------------------

           EVALUATE TRUE

               WHEN WS-BROWSE-BY-USER
                   PERFORM  USEU-3000-END-BROWSE
                       THRU USEU-3000-END-BROWSE-X
                   MOVE WUSEU-IO-STATUS   TO WS-USES-IO-STATUS

               WHEN WS-BROWSE-BY-CO-ID
                   PERFORM  USEB-6000-END-BROWSE-INDEX
                       THRU USEB-6000-END-BROWSE-INDEX-X
                   MOVE WUSEB-IO-STATUS   TO WS-USES-IO-STATUS

               WHEN WS-BROWSE-BY-STATUS
                   PERFORM  USEA-6000-END-BROWSE-INDEX
                       THRU USEA-6000-END-BROWSE-INDEX-X
                   MOVE WUSEA-IO-STATUS   TO WS-USES-IO-STATUS

           END-EVALUATE.

       9190-USES-END-BROWSE-X.
           EXIT.

      *-------------------
       9500-BUILD-TWRK-KEY.
      *-------------------

           MOVE WS-TWRK-KEY               TO L8090-BUS-FCN-ID.
           MOVE ZEROS                     TO L8090-TEMP-WRK-SEQ-NUM.
           SET L8090-USAGE-COMM           TO TRUE.

       9500-BUILD-TWRK-KEY-X.
           EXIT.

      *-------------------
       9700-RETRIEVE-TWRK.
      *-------------------

           PERFORM  9500-BUILD-TWRK-KEY
               THRU 9500-BUILD-TWRK-KEY-X.

           PERFORM  8090-2000-RETRIEVE-TWRK
               THRU 8090-2000-RETRIEVE-TWRK-X.

       9700-RETRIEVE-TWRK-X.
           EXIT.

      *-------------------
       9800-WRITE-TWRK.
      *-------------------

           PERFORM  9500-BUILD-TWRK-KEY
               THRU 9500-BUILD-TWRK-KEY-X.
           MOVE LENGTH OF WS-TWRK-WORK-AREA TO L8090-AREA-LEN.
           MOVE WS-TWRK-WORK-AREA           TO L8090-AREA-INFO-TEXT.

           PERFORM  8090-1000-WRITE-TWRK
               THRU 8090-1000-WRITE-TWRK-X.

       9800-WRITE-TWRK-X.
           EXIT.


      *-------------------
       9900-DELETE-TWRK.
      *-------------------

           PERFORM  9500-BUILD-TWRK-KEY
               THRU 9500-BUILD-TWRK-KEY-X.

           PERFORM  8090-3000-DELETE-TWRK
               THRU 8090-3000-DELETE-TWRK-X.

       9900-DELETE-TWRK-X.
           EXIT.


      /
       COPY XCPPINIT.
      *
       COPY XCPPEXIT.
      /
       COPY XCCL0260.
      /
       COPY XCCL0020.
      /
       COPY XCCL8090.
       COPY XCCL8095.
      /
       COPY XCCPABND.
       COPY XCCP0030.
      /
02MI01 COPY XCCL9684.
02MI01 COPY XCPS9684.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
       COPY XCPNAPPL.
      /
       COPY XCPBUSEA.
       COPY XCPBUSEB.
       COPY XCPBUSEU.
       COPY XCPNUSEU.
      /
       COPY XCPUUSES.
      /
       COPY XCPNUSEC.
      *
      *****************************************************************
      **                 END OF PROGRAM XSOM0190                     **
      *****************************************************************
