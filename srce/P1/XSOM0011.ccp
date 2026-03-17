      *****************************************************************
      **  MEMBER :  XSOM0011                                         **
      **  REMARKS:  SIGN-IN FOR SINGLE P-STEP PROCESS                **
      **                                                             **
      **            IF THE SESSION RECORD EXISTS, IT WILL BE RETURNED**
      **            FOR USE BY XSOM0010 TO POPULATE THE GLOBAL AREA. **
      **            IF COMPANY CODE DIFFERS, AN ERROR MESSAGE WILL BE**
      **            GENERATED.                                       **
      **            IF NO USES EXISTS, ONE WILL BE CREATED USING     **
      **            PROCESS ID AS THE KEY TO THE RECORD.             **
      **                                                             **
      **  DOMAIN :  SY                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
02MI01**  30JUN02  MAW    LOGIN FAILURE MONITORING AND PASSWORD      **
02MI01**                  ENCRYPTION                                 **
MP310B**  13APR18  CTS    MP310 - UW SUMMARY SCREEN CHANES           **
      *****************************************************************

       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM0011.

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
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM0011'.

       COPY SQLCA.
       COPY XCWLPTR.


       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                 PIC X(04).
               88  WS-BUS-FCN-VALID          VALUE '0011'.
               88  WS-BUS-FCN-SIGN-IN        VALUE '0011'.

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
      /
           05  WS-DV-APPL-STAT-CD           PIC X(01).
               88  WS-DV-APPL-STAT-ACTIVE   VALUE '1'.
               88  WS-DV-APPL-STAT-STOPPED  VALUE '2'.
               88  WS-DV-APPL-STAT-INACTIVE VALUE '3'.
               88  WS-DV-APPL-STAT-UNKNOWN  VALUE '9'.

           05  WS-USER-SESN-CTRY-CD         PIC X(02).
           05  WS-USER-SESN-CRCY-CD         PIC X(02).
           05  WS-USER-SESN-PRCES-DT        PIC X(10).
      /
       COPY XCWL1640.
      /
       COPY XCWL0020.
      /
       COPY XCFWUSCL.
       COPY XCFRUSCL.
      /
       COPY XCFWUSEC.
       COPY XCFRUSEC.
      /
       COPY XCFWUSEU.
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
       COPY XCWL2490.
      /
02MI01 COPY XCWL9684.
      /
      *---------------
       LINKAGE SECTION.
      *---------------

       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM0011.
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

           IF NOT MIR-RETRN-OK
               SET WGLOB-RETURN-ERROR        TO TRUE
           END-IF

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

               WHEN WS-BUS-FCN-SIGN-IN
                    PERFORM  2000-PROCESS-SIGN-IN
                        THRU 2000-PROCESS-SIGN-IN-X

               WHEN OTHER
      *MSG:  INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID        TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM0011'            TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000237'          TO WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET MIR-RETRN-INVALD-RQST  TO TRUE

           END-EVALUATE.

      *
      * CLEAR THE PASSWORD FIELD SO THAT IT DOES NOT RETURN TO THE USER
      *
           MOVE SPACES                     TO MIR-USER-PSWD-TXT.

       1000-PROCESS-REQUEST-X.
           EXIT.
      /
      *------------------
       2000-PROCESS-SIGN-IN.
      *------------------
      *  THIS FUNCTION REQUIRES A VALIDATION OF THE USER-ID,
      *  PASSWORD AND COMPANY CODE.  ALL THREE MUST BE
      *  SUCCESSFULLY VALIDATED IN ORDER TO PROCEED.  A FAILURE
      *  ON ANY OF THEM WILL RESULT IN A BAD RETURN CODE AND
      *  AN IMMEDIATE RETURN TO THE CALLING PROGRAM.
      *
           SET WS-ERROR-NO                     TO TRUE.

           PERFORM  7000-SIGN-IN-EDITS
               THRU 7000-SIGN-IN-EDITS-X.

           IF WS-ERROR-FOUND
               SET MIR-RETRN-EDIT-ERROR    TO TRUE
               GO TO 2000-PROCESS-SIGN-IN-X
           END-IF.
      *
      *  THE PASSWORD MUST NOT HAVE EXPIRED.  AN EXPIRED PASSWORD WILL
      *  BE FLAGGED WITH A CORRESPONDING RETURN CODE, AND THE PROGRAM
      *  WILL TERMINATE IMMEDIATELY AS A RESULT.
      *
           PERFORM  9000-COMPUTE-PASS-EXP-DAYS
               THRU 9000-COMPUTE-PASS-EXP-DAYS-X.
           IF  WS-VALID-PSWD-EXPIRED
               SET MIR-RETRN-PSWD-EXPIRED  TO TRUE
               GO TO 2000-PROCESS-SIGN-IN-X
           END-IF.
      *
      *  SEARCH FOR EXISTING USES RECORD.  IF IT EXISTS, ENSURE THAT
      *  THE USER IS SIGNED ON TO THE SAME COMPANY THAT WAS INDICATED
      *  ON THE INPUT MIR FIELD.  IF NOT,  THIS IS AN EDIT ERROR, AND
      *  SIGN-IN PROCESSING MUST BE TERMINATED.

           MOVE MIR-USER-ID                TO WUSEU-USER-ID.

           PERFORM  USEU-1000-READ
               THRU USEU-1000-READ-X.

           IF  WUSEU-IO-OK
               SET WUSES-IO-OK             TO TRUE
               IF  RUSES-CO-ID         NOT =  MIR-CO-ID
               AND RUSES-USER-SESN-STAT-API-CONN
      *MSG: USERID CURRENTLY SIGNED ON ANOTHER COMPANY
                   SET MIR-RETRN-EDIT-ERROR TO TRUE
                   MOVE 'XS00110009'       TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
                   GO TO 2000-PROCESS-SIGN-IN-X
               END-IF
           END-IF.
      *
      *  TAKE ALL SESSION VALUES FROM THE RETRIEVED USES RECORD. IF THE
      *  USES RECORD DOES NOT EXIST, CREATE A SESSION RECORD.  THE
      *  PRIMARY KEY TO THE SESSION RECORD WILL BECOME THE SAME AS THE
      *  PROCESS ID.
      *
           IF  WUSEU-IO-OK
               EVALUATE TRUE
                   WHEN RUSES-USER-SESN-STAT-API-CONN
                   WHEN RUSES-USER-SESN-STAT-BFCN-CONN
                       CONTINUE

                   WHEN RUSES-USER-SESN-STAT-NOT-CONN
                       PERFORM  2010-DELETE-OLD-USES
                           THRU 2010-DELETE-OLD-USES-X
               END-EVALUATE
           END-IF.
      *
      *  RETRIEVE MAST INFORMATION.
      *
           PERFORM  9100-RETRIEVE-APPL-INFO
               THRU 9100-RETRIEVE-APPL-INFO-X.

      *
      *  IF THE APPLICATION IS NOT UP AND RUNNING, OUTPUT AN ERROR
      *  MESSAGE INDICATING THAT THE SYSTEM IS NOT AVAILABLE AND THE
      *  USER COULD NOT BE SIGNED ON.
      *
           IF  NOT WS-DV-APPL-STAT-ACTIVE
               SET MIR-RETRN-EDIT-ERROR    TO TRUE
               GO TO 2000-PROCESS-SIGN-IN-X
           END-IF.
      *
      *  IF THE SESSION RECORD WAS NOT FOUND, WE'LL NEED TO CREATE ONE.
      *
           IF  NOT WUSEU-IO-OK
               PERFORM 2050-CREATE-USES
                  THRU 2050-CREATE-USES-X
           END-IF.

           PERFORM  2020-UPDATE-GLOB
               THRU 2020-UPDATE-GLOB-X.

       2000-PROCESS-SIGN-IN-X.
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

      *----------------
       2020-UPDATE-GLOB.
      *----------------

           MOVE RUSES-USER-SESN-ID         TO WGLOB-USER-SESN-ID
           MOVE RUSCL-SECUR-CNFD-ACCS-CD   TO WGLOB-SECUR-CNFD-ACCS-CD.
           MOVE RUSCL-SECUR-LVL-CD         TO WGLOB-SECUR-LVL-CD.
           MOVE RUSEC-SECUR-CLAS-ID        TO WGLOB-SECUR-CLAS-ID.
           MOVE RUSEC-BR-ID                TO WGLOB-USER-BRANCH-CODE.
           MOVE RUSEC-USER-RPT-DSTRB-CD    TO WGLOB-USER-RPT-DSTRB-CD.
MP310B     MOVE RUSEC-UW-CLAS-CD           TO WGLOB-UW-CLAS-CD.

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

       2020-UPDATE-GLOB-X.
           EXIT.

      *-----------------------
       2050-CREATE-USES.
      *-----------------------
      *  THIS PARAGRAPH WILL CREATE A USES RECORD FOR THE USER
      *  THE STATUS WILL BE "NO SESSION", AND BATCH NUMBER IS DEFAULTED
      *  TO 99999.

           IF  WS-DV-APPL-STAT-INACTIVE
           OR  WS-DV-APPL-STAT-STOPPED
               GO TO 2050-CREATE-USES-X
           END-IF.

           MOVE WGLOB-PRCES-ID          TO WGLOB-USER-SESN-ID.
           MOVE WGLOB-USER-SESN-ID      TO WUSES-USER-SESN-ID.
           PERFORM  USES-1000-CREATE
               THRU USES-1000-CREATE-X.
           MOVE L0020-CO-ID             TO RUSES-CO-ID.
           MOVE MIR-USER-ID             TO RUSES-USER-ID.
           MOVE WS-USER-SESN-CTRY-CD    TO RUSES-USER-SESN-CTRY-CD.
           MOVE WS-USER-SESN-CRCY-CD    TO RUSES-USER-SESN-CRCY-CD.
           MOVE WS-PROCESS-DATE         TO RUSES-USER-SESN-PRCES-DT.
           MOVE 99999                   TO RUSES-USER-SESN-BTCH-NUM.
           MOVE WGLOB-EDIT-LANG         TO RUSES-EDIT-LANG-CD.
           SET RUSES-USER-SESN-STAT-BFCN-CONN TO TRUE.
           PERFORM  USES-1000-WRITE
               THRU USES-1000-WRITE-X.

       2050-CREATE-USES-X.
           EXIT.
      /
      *
      *----------------
       7000-SIGN-IN-EDITS.
      *----------------

           PERFORM  7510-EDIT-USER-ID
               THRU 7510-EDIT-USER-ID-X.
           PERFORM  7520-EDIT-PASSWORD
               THRU 7520-EDIT-PASSWORD-X.
           PERFORM  7530-EDIT-CO-ID
               THRU 7530-EDIT-CO-ID-X.

       7000-SIGN-IN-EDITS-X.
           EXIT.

      *-----------------
       7510-EDIT-USER-ID.
      *-----------------
           IF MIR-USER-ID NOT > SPACES
      *MSG:  USER-ID REQUIRED FOR SIGN-IN
               MOVE 'XS00110007'                TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND               TO TRUE
               GO TO 7510-EDIT-USER-ID-X
           END-IF.

           MOVE MIR-USER-ID                    TO WGLOB-USER-ID.
           MOVE MIR-USER-ID                    TO WUSEC-USER-ID.
           PERFORM  USEC-1000-READ
               THRU USEC-1000-READ-X.

           IF NOT WUSEC-IO-OK
      *MSG: USERID (@1) NOT FOUND. RE-ENTER VALID USERID
               MOVE WUSEC-USER-ID               TO WGLOB-MSG-PARM (1)
               MOVE 'XS00110001'                TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND               TO TRUE
               GO TO 7510-EDIT-USER-ID-X
           END-IF.

           MOVE RUSEC-SECUR-CLAS-ID            TO WUSCL-SECUR-CLAS-ID.
           PERFORM  USCL-1000-READ
               THRU USCL-1000-READ-X.

           IF NOT WUSCL-IO-OK
               MOVE WUSCL-KEY                   TO WGLOB-MSG-PARM (1)
      *MSG: SECURITY CLASS RECORD (@1) NOT FOUND
               MOVE 'XS00110008'                TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND               TO TRUE
               GO TO 7510-EDIT-USER-ID-X
           END-IF.

       7510-EDIT-USER-ID-X.
           EXIT.


      *------------------
       7520-EDIT-PASSWORD.
      *------------------

           IF NOT WUSEC-IO-OK
               GO TO 7520-EDIT-PASSWORD-X
           END-IF.

02MI01     PERFORM  9684-1000-BUILD-PARM-INFO
02MI01         THRU 9684-1000-BUILD-PARM-INFO-X.
02MI01     MOVE MIR-USER-PSWD-TXT     TO L9684-INPUT-STRING.
02MI01     PERFORM  9684-1000-ENCRYPT-DATA
02MI01         THRU 9684-1000-ENCRYPT-DATA-X.
 
02MI01*    IF MIR-USER-PSWD-TXT = RUSEC-USER-PSWD-TXT
02MI01     IF L9684-OUTPUT-STRING = RUSEC-USER-PSWD-TXT
               NEXT SENTENCE
           ELSE
      *MSG: PASSWORD NOT AUTHORIZED FOR USERID. RE-ENTER
               MOVE 'XS00110003'                TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND               TO TRUE
               GO TO 7520-EDIT-PASSWORD-X
           END-IF.


       7520-EDIT-PASSWORD-X.
           EXIT.

      *---------------
       7530-EDIT-CO-ID.
      *---------------

           IF MIR-CO-ID = SPACES
      *MSG: COMPANY CODE IS REQUIRED.
               MOVE 'XS00110011'               TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND              TO TRUE
               GO TO 7530-EDIT-CO-ID-X
           END-IF.

           MOVE MIR-CO-ID                      TO WXTAB-ETBL-VALU-ID.
           PERFORM  COMP-1000-EDIT-COMPANY
               THRU COMP-1000-EDIT-COMPANY-X.

           IF WXTAB-IO-OK
               MOVE MIR-CO-ID                  TO WGLOB-COMPANY-CODE
           ELSE
      *MSG: INVALID COMPANY CODE ENTERED. RE-ENTER
               MOVE 'XS00110002'               TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND              TO TRUE
               GO TO 7530-EDIT-CO-ID-X
           END-IF.

       7530-EDIT-CO-ID-X.
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
           END-IF.

           IF WS-PASS-EXP-DAYS > RUSEC-USER-PSWD-XPRY-DUR
           OR WS-PASS-EXP-DAYS = RUSEC-USER-PSWD-XPRY-DUR
      *MSG: YOUR PASSWORD HAS EXPIRED. PLEASE ENTER A NEW PASSWORD
              MOVE 'XS00110004'            TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              SET WS-VALID-PSWD-EXPIRED    TO TRUE
           END-IF.

       9000-COMPUTE-PASS-EXP-DAYS-X.
           EXIT.
      *----------------------
       9100-RETRIEVE-APPL-INFO.
      *----------------------

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

           IF L0020-RES-DATA-ERROR
           OR L0020-RES-DISCONNECT
           OR L0020-RES-LOGOFF
               GO TO 9100-RETRIEVE-APPL-INFO-X
           END-IF.

           IF NOT WUSES-IO-OK
               GO TO 9100-RETRIEVE-APPL-INFO-X
           END-IF.

           IF L0020-RES-CLOSE-APPL
      *MSG: USER SESSION RECORD EXISTS BUT SYSTEM UNAVAILABLE
               MOVE 'XS00110005'  TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 9100-RETRIEVE-APPL-INFO-X
           END-IF.

       9100-RETRIEVE-APPL-INFO-X.
           EXIT.
      /
      *---------------------
       9200-SETUP-L0020-AREA.
      *---------------------

           IF WUSEU-IO-OK
               MOVE RUSES-CO-ID               TO L0020-CO-ID
               MOVE RUSES-USER-SESN-CTRY-CD   TO L0020-COUNTRY-CODE
               MOVE RUSES-USER-SESN-CRCY-CD   TO L0020-CURRENCY-CODE
               MOVE RUSES-USER-SESN-PRCES-DT  TO L0020-PROCESS-DATE
               MOVE SPACE                     TO L0020-PROCESS-DATE-DISP
           ELSE
               MOVE MIR-CO-ID                 TO L0020-CO-ID
               MOVE SPACES                    TO L0020-PROCESS-DATE
               MOVE SPACES                    TO L0020-COUNTRY-CODE
               MOVE SPACES                    TO L0020-CURRENCY-CODE
           END-IF.

           MOVE SPACES                        TO L0020-EXIT-RESPONSE.
           MOVE MIR-USER-ID                   TO L0020-USER-ID.
           MOVE WGLOB-USER-SESN-ID            TO L0020-USER-SESN-ID.
           MOVE ZERO                          TO L0020-BATCH-NUMBER.

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
               WHEN L0020-RES-DATA-ERROR
      *MSG: SESSION FILE AND (@1) USER FILE OUT OF SYNC - CONTACT
      *       SYSTEMS
                 MOVE 'XS00110010'             TO WGLOB-MSG-REF-INFO
                 PERFORM  0260-1000-GENERATE-MESSAGE
                     THRU 0260-1000-GENERATE-MESSAGE-X

               WHEN OTHER
                 SET WS-DV-APPL-STAT-UNKNOWN   TO TRUE
      *MSG: SYSTEM STATUS IS UNKNOWN.  CONTACT SYSTEMS
                   SET MIR-RETRN-EDIT-ERROR    TO TRUE
                   MOVE 'XS00110006'           TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X

           END-EVALUATE.

       9400-FORMAT-RESPONSE-X.
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
      /
       COPY XCCL0260.
      /
       COPY XCPL1640.
      /
       COPY XCPL1680.
      /
       COPY XCCP0030.
      /
       COPY XCPS2490.
      /
       COPY XCCL2490.
      /
02MI01 COPY XCCL9684.
02MI01 COPY XCPS9684.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
       COPY XCPNUSCL.
      /
       COPY XCPNUSEC.
       COPY XCPUUSEC.
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
      **                 END OF PROGRAM XSOM0011                     **
      *****************************************************************
