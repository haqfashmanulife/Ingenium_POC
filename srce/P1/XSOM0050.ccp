      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM0050.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM0050                                         **
      **  REMARKS:  PROCESS THE APPLICATION CONTROL TRANSACTION      **
      **            (APLC/DAPP).                                     **
      **            USING THE USER'S SECURITY CLASS, THIS MODULE     **
      **            RETRIEVES THE APPL RECORD FOR THE APPLICATIONS   **
      **            AND DISPLAYS THE STATUS.  BUSINESS FUNCTIONS     **
      **            TO INIT, CLOSE, PROHIBIT OR START                **
      **            ACCESS, AND RESET APPLICATION STATUS ARE         **
      **            AVAILABLE.  THE APPLICATION PROGRAM XSLU0020     **
      **            IS USED TO PROCESS THE REQUEST.                  **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
014590** 15DEC99   60     ARCHITECTURAL CHANGES                      **
014590**                  THIS CODE HAS BEEN COMPLETELY RESTRUCTURED **
014590**                  BECAUSE OF THE CHANGES MADE TO THE         **
014590**                  UNDERLYING DATA STRUCTURES. ALL TAGS AND   **
014590**                  PREVIOUSLY COMMENTED OUT CODE HAS BEEN     **
014590**                  REMOVED.                                   **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
015543**  15DEC99  60     CODE CLEANUP                               **
02MI01**  30JUN02  MAW    LOGIN FAILURE MONITORING AND PASSWORD      **
02MI01**                  ENCRYPTION                                 **
PF 13 **  6.2      BMB    PATHFINDER 1.2 APPLIED AS PER 1.3 RELEASE  **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM0050'.

       COPY SQLCA.
       COPY XCWLPTR.


014590*COPY XCWL0030.


       01  WS-WORKING-STORAGE.
           05  WS-SUB                       PIC S9(04) COMP.
           05  WS-CTR                       PIC S9(04) COMP.
           05  WS-DISPLAY-CTR               PIC ZZZ9.
           05  WS-SUB1                      PIC S9(04) COMP.
           05  WS-SUB2                      PIC S9(04) COMP.
           05  WS-BUS-FCN-ID                PIC X(04).
               88  WS-BUS-FCN-VALID             VALUE
              '0050', '0051', '0052', '0053', '0054', '0055'.
               88  WS-BUS-FCN-RETRIEVE          VALUE '0050'.
               88  WS-BUS-FCN-CLOSE             VALUE '0051'.
               88  WS-BUS-FCN-PROHIBIT-ACCESS   VALUE '0052'.
               88  WS-BUS-FCN-START-ACCESS      VALUE '0053'.
               88  WS-BUS-FCN-RESET-STATUS      VALUE '0054'.
               88  WS-BUS-FCN-INIT              VALUE '0055'.
           05  WS-ERROR-SW                  PIC X(01).
               88  WS-ERROR-FOUND               VALUE 'Y'.
               88  WS-ERROR-NO                  VALUE 'N'.
           05  WS-DV-APPL-STAT-CD           PIC X(01).
               88  WS-DV-APPL-STAT-ACTIVE   VALUE '1'.
               88  WS-DV-APPL-STAT-STOPPED  VALUE '2'.
               88  WS-DV-APPL-STAT-INACTIVE VALUE '3'.
               88  WS-DV-APPL-STAT-UNKNOWN  VALUE '9'.
02MI01     05  WS-TIME                      PIC X(07).
02MI01     05  WS-TIME-N                    REDEFINES
02MI01         WS-TIME                      PIC 9(07).
02MI01     05  WS-TXT-SRC-REF-ID            PIC X(05)   VALUE SPACES.
      /
       COPY XCWL0020.
      /
       COPY XCFWAPPL.
       COPY XCFRAPPL.
      /
       COPY XCFWASCL.
       COPY XCFRASCL.
      /
02MI01 COPY CCFWUSAU.
02MI01 COPY CCFRUSAU.
      /
       COPY XCFWUSEC.
       COPY XCFRUSEC.
      /
       COPY XCFWUSEB.
       COPY XCFWUSES.
       COPY XCFRUSES.
      /
       COPY XCFWXTAB.
       COPY XCFRXTAB.

       COPY XCWWWKDT.
        
02MI01 COPY XCWL2490.
        
02MI01 COPY XCWL9684.
      /
      *****************
       LINKAGE SECTION.
      *****************

      /
       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM0050.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                MIR-PARM-AREA.

      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  ABND-1000-HANDLE-ABEND
               THRU ABND-1000-HANDLE-ABEND-X.

           PERFORM  INIT-1000-INITIALIZE
               THRU INIT-1000-INITIALIZE-X.

           PERFORM  2000-PROCESS-TRANSACTIONS
               THRU 2000-PROCESS-TRANSACTIONS-X.

           PERFORM  EXIT-1000-FINALIZE
               THRU EXIT-1000-FINALIZE-X.

           GOBACK.

       0000-MAINLINE-X.
           EXIT.
      /
      *--------------------------
       2000-PROCESS-TRANSACTIONS.
      *--------------------------

           SET WS-ERROR-NO               TO TRUE.
           MOVE MIR-BUS-FCN-ID           TO WS-BUS-FCN-ID.


           PERFORM  2300-EDIT-COMPANY
               THRU 2300-EDIT-COMPANY-X.

           PERFORM  2200-EDIT-APPLICATION
               THRU 2200-EDIT-APPLICATION-X.

           IF WS-ERROR-FOUND
               SET MIR-RETRN-EDIT-ERROR  TO TRUE
               GO TO 2000-PROCESS-TRANSACTIONS-X
           END-IF.

           EVALUATE TRUE

               WHEN WS-BUS-FCN-RETRIEVE
                    PERFORM  3000-PROCESS-RETRIEVE
                        THRU 3000-PROCESS-RETRIEVE-X

               WHEN WS-BUS-FCN-PROHIBIT-ACCESS
                    PERFORM  4000-PROCESS-PROHIBIT-ACCESS
                        THRU 4000-PROCESS-PROHIBIT-ACCESS-X

               WHEN WS-BUS-FCN-START-ACCESS
                    PERFORM  5000-PROCESS-START-ACCESS
                        THRU 5000-PROCESS-START-ACCESS-X

               WHEN WS-BUS-FCN-RESET-STATUS
                    PERFORM  6000-PROCESS-RESET-STATUS
                        THRU 6000-PROCESS-RESET-STATUS-X

               WHEN WS-BUS-FCN-INIT
                    PERFORM  7000-PROCESS-INIT
                        THRU 7000-PROCESS-INIT-X

               WHEN WS-BUS-FCN-CLOSE
                    PERFORM  8000-PROCESS-CLOSE
                        THRU 8000-PROCESS-CLOSE-X

               WHEN OTHER
                    SET WGLOB-RETURN-ERROR TO TRUE

           END-EVALUATE.

       2000-PROCESS-TRANSACTIONS-X.
           EXIT.
      /

      *------------------
       2100-EDIT-PASSWORD.
      *------------------

           MOVE WGLOB-USER-ID         TO WUSEC-USER-ID.
           PERFORM  USEC-1000-READ
               THRU USEC-1000-READ-X.

           IF  WUSEC-IO-OK
               NEXT SENTENCE
           ELSE
               MOVE WUSEC-KEY         TO WGLOB-MSG-PARM (1)
      *MSG: USER SECURITY RECORD NOT FOUND FOR (@1) - CONTACT SYSTEMS
               MOVE 'XS00500001'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND     TO TRUE
02MI01         MOVE '90002'           TO WS-TXT-SRC-REF-ID
02MI01         PERFORM  9400-OUTPUT-USAU-RECORD
02MI01             THRU 9400-OUTPUT-USAU-RECORD-X
               GO TO 2100-EDIT-PASSWORD-X
           END-IF.

02MI01     PERFORM  9684-1000-BUILD-PARM-INFO
02MI01         THRU 9684-1000-BUILD-PARM-INFO-X.
02MI01     MOVE MIR-USER-PSWD-TXT     TO L9684-INPUT-STRING.
02MI01     PERFORM  9684-1000-ENCRYPT-DATA
02MI01         THRU 9684-1000-ENCRYPT-DATA-X.
 
02MI01*    IF  MIR-USER-PSWD-TXT = RUSEC-USER-PSWD-TXT
02MI01     IF  L9684-OUTPUT-STRING = RUSEC-USER-PSWD-TXT
               NEXT SENTENCE
           ELSE
      *MSG: PASSWORD INCORRECT FOR USERID. RE-ENTER
               MOVE 'XS00500003'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND     TO TRUE
02MI01         MOVE '90001'           TO WS-TXT-SRC-REF-ID
02MI01         PERFORM  9400-OUTPUT-USAU-RECORD
02MI01             THRU 9400-OUTPUT-USAU-RECORD-X
               GO TO 2100-EDIT-PASSWORD-X
           END-IF.

       2100-EDIT-PASSWORD-X.
           EXIT.

      *---------------------
       2200-EDIT-APPLICATION.
      *---------------------

           MOVE MIR-CO-ID             TO WAPPL-CO-ID.
           PERFORM  APPL-1000-READ
               THRU APPL-1000-READ-X.

           IF  WAPPL-IO-OK
               NEXT SENTENCE
           ELSE
               MOVE MIR-CO-ID         TO WGLOB-MSG-PARM (1)
      *MSG: APPLICATION NOT FOUND, FILES OUT OF SYNC, CONTACT SYSTEMS
               MOVE 'XS00500002'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND     TO TRUE
               GO TO 2200-EDIT-APPLICATION-X
           END-IF.

       2200-EDIT-APPLICATION-X.
           EXIT.


      *-----------------
       2300-EDIT-COMPANY.
      *-----------------

           MOVE MIR-CO-ID             TO WXTAB-ETBL-VALU-ID.
           PERFORM  COMP-1000-EDIT-COMPANY
               THRU COMP-1000-EDIT-COMPANY-X.

           IF  WXTAB-IO-OK
               NEXT SENTENCE
           ELSE
      *MSG: INVALID COMPANY CODE. RE-ENTER
               MOVE 'XS00500012'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND     TO TRUE
           END-IF.

       2300-EDIT-COMPANY-X.
           EXIT.


      *--------------------
       3000-PROCESS-RETRIEVE.
      *--------------------

           PERFORM  9100-DISPLAY-APPL
               THRU 9100-DISPLAY-APPL-X.

       3000-PROCESS-RETRIEVE-X.
           EXIT.

      *---------------------------
       4000-PROCESS-PROHIBIT-ACCESS.
      *---------------------------

           SET WS-ERROR-NO               TO TRUE.
           PERFORM  2100-EDIT-PASSWORD
               THRU 2100-EDIT-PASSWORD-X.

           IF  WS-ERROR-FOUND
               PERFORM  9100-DISPLAY-APPL
                   THRU 9100-DISPLAY-APPL-X
               GO TO 4000-PROCESS-PROHIBIT-ACCESS-X
           END-IF.

           PERFORM  9120-GET-APPLICATION-STATUS
               THRU 9120-GET-APPLICATION-STATUS-X.

           PERFORM  4100-PROHIBIT-ACC-RESPONSE
               THRU 4100-PROHIBIT-ACC-RESPONSE-X.

           IF  WS-DV-APPL-STAT-ACTIVE
               CONTINUE
           ELSE
      *MSG: APPLICATION NOT CORRECT STATUS TO PROHIBIT ACCESS
               MOVE 'XS00500017'         TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND        TO TRUE
               PERFORM  9100-DISPLAY-APPL
                   THRU 9100-DISPLAY-APPL-X
               GO TO 4000-PROCESS-PROHIBIT-ACCESS-X
           END-IF.

           PERFORM  9300-SET-UP-L0020-AREA
               THRU 9300-SET-UP-L0020-AREA-X.
           SET L0020-REQ-PROHIBIT-ACCESS TO TRUE.

           PERFORM  0020-1000-LINK-TO-APPL
               THRU 0020-1000-LINK-TO-APPL-X.

           IF  L0020-RES-DATA-ERROR
                PERFORM  9200-ERROR-RESPONSE
                    THRU 9200-ERROR-RESPONSE-X
           END-IF

           IF  WS-ERROR-FOUND
               PERFORM  9100-DISPLAY-APPL
                   THRU 9100-DISPLAY-APPL-X
               GO TO 4000-PROCESS-PROHIBIT-ACCESS-X
           END-IF.

           PERFORM  9110-DISPLAY-APPL-DETAILS
               THRU 9110-DISPLAY-APPL-DETAILS-X.

       4000-PROCESS-PROHIBIT-ACCESS-X.
           EXIT.

      *---------------------------
       4100-PROHIBIT-ACC-RESPONSE.
      *---------------------------

           EVALUATE TRUE

           WHEN L0020-RES-INIT-APPL
                CONTINUE

           WHEN L0020-RES-CLOSE-APPL
      *MSG: APPLICATION FOR COMPANY (@1) IS ALREADY CLOSED
                MOVE L0020-CO-ID      TO WGLOB-MSG-PARM (1)
                MOVE 'XS00500029'     TO WGLOB-MSG-REF-INFO
                PERFORM  0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X

           WHEN OTHER
      *MSG: UNKNOWN RESPONSE TO PROHIBIT ACCESS REQUEST
                MOVE 'XS00500018'     TO WGLOB-MSG-REF-INFO
                PERFORM  0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X

           END-EVALUATE.

       4100-PROHIBIT-ACC-RESPONSE-X.
           EXIT.
      /
      *------------------------
       5000-PROCESS-START-ACCESS.
      *------------------------

           SET WS-ERROR-NO               TO TRUE.
           PERFORM  2100-EDIT-PASSWORD
               THRU 2100-EDIT-PASSWORD-X.

           IF  WS-ERROR-FOUND
               PERFORM  9100-DISPLAY-APPL
                   THRU 9100-DISPLAY-APPL-X
               GO TO 5000-PROCESS-START-ACCESS-X
           END-IF.

           PERFORM  9120-GET-APPLICATION-STATUS
               THRU 9120-GET-APPLICATION-STATUS-X.

           PERFORM  5100-START-ACCESS-RESPONSE
               THRU 5100-START-ACCESS-RESPONSE-X.

           IF  WS-DV-APPL-STAT-STOPPED
               CONTINUE
           ELSE
      *MSG: APPLICATION NOT CORRECT STATUS TO START ACCESS
               MOVE 'XS00500020'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND        TO TRUE
               PERFORM  9100-DISPLAY-APPL
                   THRU 9100-DISPLAY-APPL-X
               GO TO 5000-PROCESS-START-ACCESS-X
           END-IF.

           PERFORM  9300-SET-UP-L0020-AREA
               THRU 9300-SET-UP-L0020-AREA-X.
           SET L0020-REQ-START-ACCESS    TO TRUE.

           PERFORM  0020-1000-LINK-TO-APPL
               THRU 0020-1000-LINK-TO-APPL-X.

           IF  L0020-RES-DATA-ERROR
                PERFORM  9200-ERROR-RESPONSE
                    THRU 9200-ERROR-RESPONSE-X
           END-IF

           IF  WS-ERROR-FOUND
               PERFORM  9100-DISPLAY-APPL
                   THRU 9100-DISPLAY-APPL-X
               GO TO 5000-PROCESS-START-ACCESS-X
           END-IF.

           PERFORM  9110-DISPLAY-APPL-DETAILS
               THRU 9110-DISPLAY-APPL-DETAILS-X.

       5000-PROCESS-START-ACCESS-X.
           EXIT.

      *---------------------------
       5100-START-ACCESS-RESPONSE.
      *---------------------------

           EVALUATE TRUE

           WHEN L0020-RES-PROHIBIT-ACCESS
                CONTINUE

           WHEN L0020-RES-CLOSE-APPL
      *MSG: FILE SYSTEM ERROR
                MOVE 'XS00500006'     TO WGLOB-MSG-REF-INFO
                PERFORM  0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X

           WHEN OTHER
      *MSG: UNKNOWN RESPONSE TO START ACCESS REQUEST
                MOVE 'XS00500019'     TO WGLOB-MSG-REF-INFO
                PERFORM  0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X

           END-EVALUATE.

       5100-START-ACCESS-RESPONSE-X.
           EXIT.
      /
      *------------------------
       6000-PROCESS-RESET-STATUS.
      *------------------------

           SET WS-ERROR-NO               TO TRUE.
           PERFORM  2100-EDIT-PASSWORD
               THRU 2100-EDIT-PASSWORD-X.

           IF  WS-ERROR-FOUND
               PERFORM  9100-DISPLAY-APPL
                   THRU 9100-DISPLAY-APPL-X
               GO TO 6000-PROCESS-RESET-STATUS-X
           END-IF.

           PERFORM  9120-GET-APPLICATION-STATUS
               THRU 9120-GET-APPLICATION-STATUS-X.

           PERFORM  6100-FORCE-INIT-RESPONSE
               THRU 6100-FORCE-INIT-RESPONSE-X.


           IF  WS-DV-APPL-STAT-INACTIVE
               CONTINUE
           ELSE
      *MSG: APPLICATION NOT CORRECT STATUS TO RESET
               MOVE 'XS00500022'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND                TO TRUE
               PERFORM  9100-DISPLAY-APPL
                   THRU 9100-DISPLAY-APPL-X
               GO TO 6000-PROCESS-RESET-STATUS-X
           END-IF.

           PERFORM  9300-SET-UP-L0020-AREA
               THRU 9300-SET-UP-L0020-AREA-X.
           SET L0020-REQ-FORCE-INIT-APPL TO TRUE.

           PERFORM  0020-1000-LINK-TO-APPL
               THRU 0020-1000-LINK-TO-APPL-X.

           IF  L0020-RES-DATA-ERROR
                PERFORM  9200-ERROR-RESPONSE
                    THRU 9200-ERROR-RESPONSE-X
           END-IF.

           IF  WS-ERROR-FOUND
               PERFORM  9100-DISPLAY-APPL
                   THRU 9100-DISPLAY-APPL-X
               GO TO 6000-PROCESS-RESET-STATUS-X
           END-IF.

           PERFORM  9110-DISPLAY-APPL-DETAILS
               THRU 9110-DISPLAY-APPL-DETAILS-X.

       6000-PROCESS-RESET-STATUS-X.
           EXIT.

      *-------------------------
       6100-FORCE-INIT-RESPONSE.
      *-------------------------

           EVALUATE TRUE

           WHEN L0020-RES-CLOSE-APPL
                CONTINUE

           WHEN L0020-RES-FORCE-INIT-APPL
      *MSG: APPLICATION CONTROL FILE NOT PROPER STATUS TO BE RESET
                MOVE 'XS00500008'     TO WGLOB-MSG-REF-INFO
                PERFORM  0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X

           WHEN L0020-RES-PROHIBIT-ACCESS
      *MSG: FILE SYSTEM ERROR
                MOVE 'XS00500006'     TO WGLOB-MSG-REF-INFO
                PERFORM  0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X

           WHEN OTHER
      *MSG: UNKNOWN RESPONSE TO RESET REQUEST
                MOVE 'XS00500021'     TO WGLOB-MSG-REF-INFO
                PERFORM  0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X

           END-EVALUATE.

       6100-FORCE-INIT-RESPONSE-X.
           EXIT.
      /
      *----------------
       7000-PROCESS-INIT.
      *----------------

           SET WS-ERROR-NO               TO TRUE.
           PERFORM  2100-EDIT-PASSWORD
               THRU 2100-EDIT-PASSWORD-X.

           IF  WS-ERROR-FOUND
               PERFORM  9100-DISPLAY-APPL
                   THRU 9100-DISPLAY-APPL-X
               GO TO 7000-PROCESS-INIT-X
           END-IF.

           PERFORM  9120-GET-APPLICATION-STATUS
               THRU 9120-GET-APPLICATION-STATUS-X.

           PERFORM  7100-INIT-RESPONSE
               THRU 7100-INIT-RESPONSE-X.

           PERFORM  7200-CHECK-INIT-REQUEST
               THRU 7200-CHECK-INIT-REQUEST-X.

           IF  WS-ERROR-FOUND
               PERFORM  9100-DISPLAY-APPL
                   THRU 9100-DISPLAY-APPL-X
               GO TO 7000-PROCESS-INIT-X
           END-IF.

           PERFORM  9300-SET-UP-L0020-AREA
               THRU 9300-SET-UP-L0020-AREA-X.
           SET L0020-REQ-INIT-APPL       TO TRUE.
           MOVE MIR-CO-ID                TO L0020-CO-ID.
           MOVE MIR-APPL-CTL-PRCES-DT    TO L0020-PROCESS-DATE-DISP.
           MOVE MIR-APPL-CTL-CTRY-CD     TO L0020-COUNTRY-CODE.
           MOVE MIR-APPL-CTL-CRCY-CD     TO L0020-CURRENCY-CODE.

           PERFORM  0020-1000-LINK-TO-APPL
               THRU 0020-1000-LINK-TO-APPL-X.

           IF  L0020-RES-DATA-ERROR
                PERFORM  9200-ERROR-RESPONSE
                    THRU 9200-ERROR-RESPONSE-X
           END-IF.

           IF  WS-ERROR-FOUND
               PERFORM  9100-DISPLAY-APPL
                   THRU 9100-DISPLAY-APPL-X
               GO TO 7000-PROCESS-INIT-X
           END-IF.

           PERFORM  9110-DISPLAY-APPL-DETAILS
               THRU 9110-DISPLAY-APPL-DETAILS-X.

       7000-PROCESS-INIT-X.
           EXIT.

      *-------------------
       7100-INIT-RESPONSE.
      *-------------------

           EVALUATE TRUE

               WHEN L0020-RES-CLOSE-APPL
                   CONTINUE

               WHEN L0020-RES-SIGN-ON
      *MSG: CANNOT @1 APPLICATION. PEOPLE STILL SIGNED ON
                   MOVE 'XS00500027'     TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X

               WHEN L0020-RES-PROHIBIT-ACCESS
      *MSG: FILE SYSTEM ERROR
                   MOVE 'XS00500006'     TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X

               WHEN L0020-RES-FORCE-INIT-APPL
      *MSG: APPLICATION CONTROL FILE STATUS NOT CORRECT FOR INIT
                   MOVE 'XS00500011'     TO WGLOB-MSG-REF-INFO
                    PERFORM 0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X

               WHEN OTHER
      *MSG: UNKNOWN RESPONSE TO INIT REQUEST
                   MOVE 'XS00500023'     TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X

           END-EVALUATE.

       7100-INIT-RESPONSE-X.
           EXIT.
      /
      *------------------------
       7200-CHECK-INIT-REQUEST.
      *------------------------

           IF  WS-DV-APPL-STAT-INACTIVE
               PERFORM  7210-EDIT-CTRY-CURR
                   THRU 7210-EDIT-CTRY-CURR-X
               IF  MIR-APPL-CTL-CTRY-CD NOT =
                              RAPPL-APPL-CTRY-CD (WS-SUB1)
               OR  MIR-APPL-CTL-CRCY-CD NOT =
                              RAPPL-APPL-CRCY-CD (WS-SUB1 WS-SUB2)
                   SET WS-ERROR-FOUND            TO TRUE
               END-IF
           ELSE
      *MSG: APPLICATION NOT CORRECT STATUS TO INIT
               MOVE 'XS00500024'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND                TO TRUE
           END-IF.
      *
       7200-CHECK-INIT-REQUEST-X.
           EXIT.
      /
      *--------------------
       7210-EDIT-CTRY-CURR.
      *--------------------

           PERFORM
               VARYING WS-SUB1 FROM +1 BY +1
               UNTIL WS-SUB1 = +5
               OR RAPPL-APPL-CTRY-CD (WS-SUB1) = MIR-APPL-CTL-CTRY-CD
015543         CONTINUE               
           END-PERFORM.

           IF  RAPPL-APPL-CTRY-CD (WS-SUB1) = MIR-APPL-CTL-CTRY-CD
               PERFORM
                   VARYING WS-SUB2 FROM +1 BY +1
                   UNTIL   WS-SUB2 = +5
                   OR RAPPL-APPL-CRCY-CD (WS-SUB1 WS-SUB2) =
                                     MIR-APPL-CTL-CRCY-CD
015543             CONTINUE                                     
               END-PERFORM

               IF  RAPPL-APPL-CRCY-CD (WS-SUB1 WS-SUB2) =
                                  MIR-APPL-CTL-CRCY-CD
                   CONTINUE
               ELSE
      *MSG: INVALID CURRENCY CODE. RE-ENTER
                   MOVE 'XS00500015'  TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
               END-IF

           ELSE
      *MSG: INVALID COUNTRY CODE. RE-ENTER
               MOVE 'XS00500014'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       7210-EDIT-CTRY-CURR-X.
           EXIT.
      /
      *------------------
       8000-PROCESS-CLOSE.
      *------------------

           SET WS-ERROR-NO               TO TRUE.
           PERFORM  2100-EDIT-PASSWORD
               THRU 2100-EDIT-PASSWORD-X.

           IF  WS-ERROR-FOUND
               PERFORM  9100-DISPLAY-APPL
                   THRU 9100-DISPLAY-APPL-X
               GO TO 8000-PROCESS-CLOSE-X
           END-IF.

           PERFORM  9120-GET-APPLICATION-STATUS
               THRU 9120-GET-APPLICATION-STATUS-X.

           PERFORM  8100-CLOSE-RESPONSE
               THRU 8100-CLOSE-RESPONSE-X.

           IF  WS-DV-APPL-STAT-ACTIVE
           OR  WS-DV-APPL-STAT-STOPPED
               CONTINUE
           ELSE
      *MSG: APPLICATION NOT CORRECT STATUS TO CLOSE
               MOVE 'XS00500028'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND                TO TRUE
           END-IF.

           PERFORM  8300-CHECK-USERS-SIGNED-ON
               THRU 8300-CHECK-USERS-SIGNED-ON-X.

           IF  WS-ERROR-FOUND
               PERFORM  9100-DISPLAY-APPL
                   THRU 9100-DISPLAY-APPL-X
               GO TO 8000-PROCESS-CLOSE-X
           END-IF.

           PERFORM  9300-SET-UP-L0020-AREA
               THRU 9300-SET-UP-L0020-AREA-X.
           SET L0020-REQ-CLOSE-APPL      TO TRUE.

           PERFORM  0020-1000-LINK-TO-APPL
               THRU 0020-1000-LINK-TO-APPL-X.

           IF  L0020-RES-DATA-ERROR
                PERFORM  9200-ERROR-RESPONSE
                    THRU 9200-ERROR-RESPONSE-X
           END-IF.

           IF NOT L0020-RES-CLOSE-APPL
               SET WS-ERROR-FOUND        TO TRUE
           END-IF.

           IF  WS-ERROR-FOUND
               PERFORM  9100-DISPLAY-APPL
                   THRU 9100-DISPLAY-APPL-X
               GO TO 8000-PROCESS-CLOSE-X
           END-IF.

           PERFORM  8200-DELETE-USER-SESN-RECS
               THRU 8200-DELETE-USER-SESN-RECS-X.

           PERFORM  9110-DISPLAY-APPL-DETAILS
               THRU 9110-DISPLAY-APPL-DETAILS-X.

       8000-PROCESS-CLOSE-X.
           EXIT.

      *--------------------
       8100-CLOSE-RESPONSE.
      *--------------------

           EVALUATE TRUE

               WHEN L0020-RES-INIT-APPL
               WHEN L0020-RES-PROHIBIT-ACCESS
                   CONTINUE

               WHEN L0020-RES-SIGN-ON
                   MOVE 'XS00500026'     TO WGLOB-MSG-REF-INFO
      *MSG: CANNOT @1 APPLICATION. PEOPLE STILL SIGNED ON
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X

               WHEN L0020-RES-CLOSE-APPL
      *MSG: APPLICATION FOR COMPANY (@1) IS ALREADY CLOSED
                   MOVE L0020-CO-ID      TO WGLOB-MSG-PARM (1)
                   MOVE 'XS00500029'     TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X

               WHEN OTHER
      *MSG: UNKNOWN RESPONSE TO CLOSE REQUEST
                   MOVE 'XS00500025'     TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X

           END-EVALUATE.

       8100-CLOSE-RESPONSE-X.
           EXIT.
      /

      *--------------------------
       8200-DELETE-USER-SESN-RECS.
      *--------------------------

           MOVE ZERO         TO WS-CTR.
           MOVE ZERO         TO WS-DISPLAY-CTR.

           MOVE L0020-CO-ID  TO WUSEB-CO-ID.
           MOVE LOW-VALUES   TO WUSEB-USER-SESN-STAT-CD.
           MOVE WUSEB-KEY    TO WUSEB-ENDBR-KEY,
           MOVE HIGH-VALUES  TO WUSEB-ENDBR-USER-SESN-STAT-CD.

           PERFORM  USEB-1000-BROWSE
               THRU USEB-1000-BROWSE-X

           PERFORM  USEB-2000-READ-NEXT
               THRU USEB-2000-READ-NEXT-X.

           PERFORM  8210-DELETE-ONE-USES-REC
               THRU 8210-DELETE-ONE-USES-REC-X
              UNTIL WUSEB-IO-EOF.

           MOVE 'XS00500030'     TO WGLOB-MSG-REF-INFO.
           MOVE WS-CTR           TO WS-DISPLAY-CTR.
           MOVE WS-DISPLAY-CTR   TO WGLOB-MSG-PARM (1).
      *MSG: (@1) USER SESSION RECORDS HAVE BEEN DELETED
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

           PERFORM  USEB-3000-END-BROWSE
               THRU USEB-3000-END-BROWSE-X.

       8200-DELETE-USER-SESN-RECS-X.
           EXIT.

      *------------------------
       8210-DELETE-ONE-USES-REC.
      *------------------------

           IF RUSES-USER-ID = WGLOB-USER-ID
               CONTINUE
           ELSE
               MOVE RUSES-KEY  TO WUSES-KEY
               PERFORM  USES-2000-DELETE-WITH-KEY
                   THRU USES-2000-DELETE-WITH-KEY-X
               IF WUSES-IO-OK
                   ADD +1      TO WS-CTR
               END-IF
           END-IF.

           PERFORM  USEB-2000-READ-NEXT
               THRU USEB-2000-READ-NEXT-X.

       8210-DELETE-ONE-USES-REC-X.
           EXIT.

      *--------------------------
       8300-CHECK-USERS-SIGNED-ON.
      *--------------------------

           MOVE ZERO             TO WS-CTR.
           MOVE ZERO             TO WS-DISPLAY-CTR.

           MOVE L0020-CO-ID      TO WUSEB-CO-ID.
PF 13 *    SET  WUSEB-USER-SESN-STAT-CONN TO TRUE.
PF 13      SET  WUSEB-USER-SESN-STAT-API-CONN TO TRUE.
           MOVE LOW-VALUES       TO WUSEB-USER-ID.
           MOVE WUSEB-KEY        TO WUSEB-ENDBR-KEY,
           MOVE HIGH-VALUES      TO WUSEB-ENDBR-USER-ID.

           PERFORM  USEB-1000-BROWSE
               THRU USEB-1000-BROWSE-X

           MOVE WGLOB-USER-ID    TO RUSES-USER-ID
           PERFORM  USEB-2000-READ-NEXT
               THRU USEB-2000-READ-NEXT-X
              UNTIL WUSEB-IO-EOF
                 OR RUSES-USER-ID NOT= WGLOB-USER-ID.

           IF WUSEB-IO-OK
               SET WS-ERROR-FOUND    TO TRUE
               MOVE 'XS00500031'     TO WGLOB-MSG-REF-INFO
      *MSG: USERS ARE STILL SIGNED ON.  APPLICATION CLOSE REJECTED
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           PERFORM  USEB-3000-END-BROWSE
               THRU USEB-3000-END-BROWSE-X.

       8300-CHECK-USERS-SIGNED-ON-X.
           EXIT.

      *------------------
       9100-DISPLAY-APPL.
      *------------------

           MOVE SPACES                TO MIR-DV-APPL-STAT-CD.
           MOVE SPACES                TO MIR-APPL-CTL-PRCES-DT.
           MOVE SPACES                TO MIR-APPL-CTL-CTRY-CD.
           MOVE SPACES                TO MIR-APPL-CTL-CRCY-CD.

           MOVE MIR-CO-ID         TO WXTAB-ETBL-VALU-ID
           PERFORM  COMP-1000-EDIT-COMPANY
               THRU COMP-1000-EDIT-COMPANY-X
           IF  WXTAB-IO-OK
               NEXT SENTENCE
           ELSE
      *MSG: INVALID COMPANY CODE. RE-ENTER
               MOVE 'XS00500012'  TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           MOVE WGLOB-USER-ID         TO WUSEC-USER-ID.

           PERFORM  USEC-1000-READ
               THRU USEC-1000-READ-X.

           IF  WUSEC-IO-OK
               NEXT SENTENCE
           ELSE
               MOVE WUSEC-KEY         TO WGLOB-MSG-PARM (1)
      *MSG: USER SECURITY RECORD NOT FOUND FOR (@1) - CONTACT SYSTEMS
               MOVE 'XS00500001'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
02MI01         MOVE '90002'           TO WS-TXT-SRC-REF-ID
02MI01         PERFORM  9400-OUTPUT-USAU-RECORD
02MI01             THRU 9400-OUTPUT-USAU-RECORD-X
               GO TO 9100-DISPLAY-APPL-X
           END-IF.

           MOVE RUSEC-SECUR-CLAS-ID   TO WASCL-SECUR-CLAS-ID.
           MOVE MIR-CO-ID             TO WASCL-CO-ID.
           MOVE WASCL-KEY             TO WASCL-ENDBR-KEY.
           PERFORM  ASCL-1000-READ
               THRU ASCL-1000-READ-X.

           IF WASCL-IO-OK
               PERFORM  9110-DISPLAY-APPL-DETAILS
                   THRU 9110-DISPLAY-APPL-DETAILS-X
           END-IF.

       9100-DISPLAY-APPL-X.
           EXIT.
      /
      *-----------------------
       9110-DISPLAY-APPL-DETAILS.
      *-----------------------

           PERFORM  9120-GET-APPLICATION-STATUS
               THRU 9120-GET-APPLICATION-STATUS-X.

           MOVE L0020-COUNTRY-CODE      TO MIR-APPL-CTL-CTRY-CD.
           MOVE L0020-CURRENCY-CODE     TO MIR-APPL-CTL-CRCY-CD.
           MOVE L0020-PROCESS-DATE-DISP TO MIR-APPL-CTL-PRCES-DT.
           MOVE WS-DV-APPL-STAT-CD      TO MIR-DV-APPL-STAT-CD.
           MOVE WGLOB-USER-ID           TO MIR-USER-ID.

       9110-DISPLAY-APPL-DETAILS-X.
           EXIT.

      *---------------------------
       9120-GET-APPLICATION-STATUS.
      *---------------------------

           PERFORM  9300-SET-UP-L0020-AREA
               THRU 9300-SET-UP-L0020-AREA-X.
           SET  L0020-REQ-APPL-STATUS   TO TRUE.

           PERFORM  0020-1000-LINK-TO-APPL
               THRU 0020-1000-LINK-TO-APPL-X.

           EVALUATE TRUE

           WHEN L0020-RES-CLOSE-APPL
                SET WS-DV-APPL-STAT-INACTIVE  TO TRUE

           WHEN L0020-RES-INIT-APPL
                SET WS-DV-APPL-STAT-ACTIVE    TO TRUE

           WHEN L0020-RES-PROHIBIT-ACCESS
                SET WS-DV-APPL-STAT-STOPPED   TO TRUE

           WHEN OTHER
                SET WS-DV-APPL-STAT-UNKNOWN   TO TRUE

           END-EVALUATE.

       9120-GET-APPLICATION-STATUS-X.
           EXIT.

      /

      *--------------------
       9200-ERROR-RESPONSE.
      *--------------------

           EVALUATE TRUE

           WHEN L0020-CO-ID = HIGH-VALUES
      * MSG: INVALID COMPANY CODE. RE-ENTER
                MOVE 'XS00500012'     TO WGLOB-MSG-REF-INFO
                PERFORM  0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X
                SET WS-ERROR-FOUND              TO TRUE

           WHEN L0020-PROCESS-DATE-DISP = HIGH-VALUES
      * MSG: INVALID PROCESS DATE. RE-ENTER
                MOVE 'XS00500013'     TO WGLOB-MSG-REF-INFO
                PERFORM  0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X
                SET WS-ERROR-FOUND              TO TRUE

           WHEN L0020-COUNTRY-CODE = HIGH-VALUES
      *MSG: INVALID COUNTRY CODE. RE-ENTER
                MOVE 'XS00500014'     TO WGLOB-MSG-REF-INFO
                PERFORM  0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X
                SET WS-ERROR-FOUND              TO TRUE

           WHEN L0020-CURRENCY-CODE = HIGH-VALUES
      *MSG: INVALID CURRENCY CODE. RE-ENTER
                MOVE 'XS00500015'     TO WGLOB-MSG-REF-INFO
                PERFORM  0260-1000-GENERATE-MESSAGE
                    THRU 0260-1000-GENERATE-MESSAGE-X
                SET WS-ERROR-FOUND              TO TRUE

           END-EVALUATE.

       9200-ERROR-RESPONSE-X.
           EXIT.

      *----------------------
       9300-SET-UP-L0020-AREA.
      *----------------------

           MOVE MIR-CO-ID                TO L0020-CO-ID.
           MOVE SPACES                   TO L0020-PROCESS-DATE-DISP.
           MOVE SPACES                   TO L0020-PROCESS-DATE.
           MOVE SPACES                   TO L0020-COUNTRY-CODE.
           MOVE SPACES                   TO L0020-CURRENCY-CODE.
           MOVE SPACES                   TO L0020-EXIT-RESPONSE.
           MOVE SPACES                   TO L0020-USER-ID.
           MOVE ZERO                     TO L0020-BATCH-NUMBER.

       9300-SET-UP-L0020-AREA-X.
           EXIT.
02MI01/
02MI01*------------------------
02MI01 9400-OUTPUT-USAU-RECORD.
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
02MI01     MOVE 'XSOM0050'         TO L2490-TXT-SRC-ID.
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
02MI01 9400-OUTPUT-USAU-RECORD-X.
02MI01     EXIT.
      /
      ****************************************************************
      * PROCESSING COPYBOOKS                                         *
      ****************************************************************
       COPY XCPPINIT.
      /
       COPY XCPPEXIT.
      /
       COPY XCPEAPPL.
      /
       COPY XCPECOMP.
      /
       COPY XCCL0020.
      /
       COPY XCCL0260.
      /
       COPY XCCPABND.
      /
       COPY XCCP0030.
      /
02MI01 COPY XCPS2490.
02MI01 COPY XCCL2490.
      /
02MI01 COPY XCCL9684.
02MI01 COPY XCPS9684.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
       COPY XCPNAPPL.
      /
       COPY XCPNASCL.
      /
02MI01 COPY CCPAUSAU.
02MI01 COPY CCPCUSAU.
      /
       COPY XCPNUSEC.
      /
       COPY XCPBUSEB.
       COPY XCPGUSES.
      /
       COPY XCPNXTAB.

      *****************************************************************
      *  END OF PROGRAM XSOM0050
      *****************************************************************
