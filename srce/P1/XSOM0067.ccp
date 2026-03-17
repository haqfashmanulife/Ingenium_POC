      *****************************************************************
      **  MEMBER :  XSOM0067                                         **
      **  REMARKS:  LDAP SIGN-IN FOR SINGLE P-STEP PROCESS           **
      **                                                             **
      **            A SESSION RECORD WILL NOT BE CREATED FOR THIS    **
      **            TYPE OF SIGN-IN.  CURRENCY AND COUNTRY WILL BE   **
      **            DEFAULTED FROM MAST, ALL OTHER SESSION DATA WILL **
      **            BE INITIALIZED DURING VALIDATION OF USER ID      **
      **                                                             **
      **  DOMAIN :  SY                                               **
      *****************************************************************
      **  RELEASE  DESCRIPTION                                       **
      **                                                             **
PF 13 **  PF 13    NEW FOR PF 1.3                                    **
PF 20 **  PF 2.0   PATHFINDER 2.0 UPGRADE                            **
FT2001**  BOBAKB    CHANGES FOR LDAP SUPPORT                         **
FT2001**            (MOSTLY 7X24 PROCESSING CHGS REMOVED)            **
EN8851**  BOBAKB    FT2001 CHANGES ONLY WORK FOR PA INQUIRY BUT      **
EN8851**            BF0067-P IS NOT USED IN THE PATHFINDERCONFIG.XML.**
EN8851**            THEY CAUSE ELINKS AND SINGLE PSTEPS TO ABEND     **
EN8851**            SO THEY ARE REMOVED FOR THE SCV WEBSERVICES      **  
EN8851**            CALLS.                                           **
      *****************************************************************

       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM0067.

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
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM0067'.

       COPY SQLCA.
       COPY XCWLPTR.


       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                 PIC X(04).
               88  WS-BUS-FCN-VALID          VALUE '0067'.
               88  WS-BUS-FCN-SIGN-IN        VALUE '0067'.

           05  WS-ERROR-SW                  PIC X(01).
               88  WS-ERROR-FOUND           VALUE 'Y'.
               88  WS-ERROR-NO              VALUE 'N'.
           05  WS-CTRY-SUB                  PIC S9(04) BINARY.
           05  WS-CRCY-SUB                  PIC S9(04) BINARY.
      /
           05  WS-DV-APPL-STAT-CD           PIC X(01).
               88  WS-DV-APPL-STAT-ACTIVE   VALUE '1'.
               88  WS-DV-APPL-STAT-STOPPED  VALUE '2'.
               88  WS-DV-APPL-STAT-INACTIVE VALUE '3'.
               88  WS-DV-APPL-STAT-UNKNOWN  VALUE '9'.
      /
       COPY XCWWWKDT.
      /
       COPY CCFWMAST.
       COPY CCFRMAST.
      /
       COPY XCFWASCL.
       COPY XCFRASCL.
      /
       COPY XCFWUSCL.
       COPY XCFRUSCL.
      /
       COPY XCFWXTAB.
       COPY XCFRXTAB.
      /
       COPY XCWL0020.
       COPY XCWL2490.
      /
      *---------------
       LINKAGE SECTION.
      *---------------

       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM0067.
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

           EVALUATE TRUE

               WHEN WS-BUS-FCN-SIGN-IN
                    PERFORM  2000-PROCESS-SIGN-IN
                        THRU 2000-PROCESS-SIGN-IN-X

               WHEN OTHER
      *MSG:  INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID        TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM0067'            TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000237'          TO WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET MIR-RETRN-INVALD-RQST  TO TRUE

           END-EVALUATE.

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
           PERFORM  2020-UPDATE-GLOB
               THRU 2020-UPDATE-GLOB-X.

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

       2000-PROCESS-SIGN-IN-X.
           EXIT.

      *----------------
       2020-UPDATE-GLOB.
      *----------------

           MOVE WGLOB-PRCES-ID             TO WGLOB-USER-SESN-ID.
           MOVE 99999                      TO WGLOB-USER-SESN-BTCH-NUM.
           MOVE RUSCL-SECUR-CNFD-ACCS-CD   TO WGLOB-SECUR-CNFD-ACCS-CD.
           MOVE RUSCL-SECUR-LVL-CD         TO WGLOB-SECUR-LVL-CD.
           MOVE MIR-SECUR-CLAS-ID          TO WGLOB-SECUR-CLAS-ID.
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

       2020-UPDATE-GLOB-X.
           EXIT.

      *------------------
       7000-SIGN-IN-EDITS.
      *------------------

           PERFORM  7510-EDIT-USER-ID
               THRU 7510-EDIT-USER-ID-X.
           PERFORM  7520-EDIT-SECUR-CLAS-ID
               THRU 7520-EDIT-SECUR-CLAS-ID-X.
           PERFORM  7530-EDIT-CO-ID
               THRU 7530-EDIT-CO-ID-X.
           PERFORM  7540-EDIT-ASCL
               THRU 7540-EDIT-ASCL-X.

           PERFORM  7550-EDIT-USER-SESN-CTRY-CD
               THRU 7550-EDIT-USER-SESN-CTRY-CD-X.
           PERFORM  7560-EDIT-USER-SESN-CRCY-CD
               THRU 7560-EDIT-USER-SESN-CRCY-CD-X.
           PERFORM  7570-EDIT-BR-ID
               THRU 7570-EDIT-BR-ID-X.
           PERFORM  7580-EDIT-USER-RPT-DSTRB-CD
               THRU 7580-EDIT-USER-RPT-DSTRB-CD-X.

       7000-SIGN-IN-EDITS-X.
           EXIT.

      *------------------
       7510-EDIT-USER-ID.
      *------------------

           IF MIR-USER-ID = SPACES
      *MSG:  USER-ID REQUIRED FOR SIGN-IN
               MOVE 'XS00670001'                TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND               TO TRUE
               GO TO 7510-EDIT-USER-ID-X
           END-IF.

           MOVE MIR-USER-ID                     TO WGLOB-USER-ID.

       7510-EDIT-USER-ID-X.
           EXIT.

      *------------------------
       7520-EDIT-SECUR-CLAS-ID.
      *------------------------

           MOVE MIR-SECUR-CLAS-ID               TO WUSCL-SECUR-CLAS-ID.
           PERFORM  USCL-1000-READ
               THRU USCL-1000-READ-X.

           IF NOT WUSCL-IO-OK
               MOVE WUSCL-KEY                   TO WGLOB-MSG-PARM (1)
      *MSG: SECURITY CLASS RECORD (@1) NOT FOUND
               MOVE 'XS00670002'                TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND               TO TRUE
               GO TO 7520-EDIT-SECUR-CLAS-ID-X
           END-IF.

           MOVE MIR-SECUR-CLAS-ID               TO WGLOB-SECUR-CLAS-ID.

       7520-EDIT-SECUR-CLAS-ID-X.
           EXIT.

      *---------------
       7530-EDIT-CO-ID.
      *---------------

           IF MIR-CO-ID = SPACES
      *MSG: COMPANY CODE IS REQUIRED.
               MOVE 'XS00670003'                TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND               TO TRUE
               GO TO 7530-EDIT-CO-ID-X
           END-IF.

           MOVE MIR-CO-ID                       TO WXTAB-ETBL-VALU-ID.
           PERFORM  COMP-1000-EDIT-COMPANY
               THRU COMP-1000-EDIT-COMPANY-X.

           IF WXTAB-IO-OK
               MOVE MIR-CO-ID                   TO WGLOB-COMPANY-CODE
           ELSE
      *MSG: INVALID COMPANY CODE ENTERED. RE-ENTER
               MOVE 'XS00670004'                TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND               TO TRUE
               GO TO 7530-EDIT-CO-ID-X
           END-IF.

       7530-EDIT-CO-ID-X.
           EXIT.

      *---------------
       7540-EDIT-ASCL.
      *---------------

           MOVE WGLOB-SECUR-CLAS-ID            TO WASCL-SECUR-CLAS-ID.
           MOVE WGLOB-COMPANY-CODE             TO WASCL-CO-ID.

           PERFORM ASCL-1000-READ
              THRU ASCL-1000-READ-X.

           IF WASCL-IO-NOT-FOUND
      *MSG: APPLICATION SECURITY CLASS RECORD NOT FOUND FOR COMPANY (@1)
      *     AND SECURITY CLASS (@2)
               MOVE WASCL-CO-ID                TO WGLOB-MSG-PARM (1)
               MOVE WASCL-SECUR-CLAS-ID        TO WGLOB-MSG-PARM (2)
               MOVE 'XS00670005'               TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND              TO TRUE
           END-IF.

       7540-EDIT-ASCL-X.
           EXIT.
      /
      *----------------------------
       7550-EDIT-USER-SESN-CTRY-CD.
      *----------------------------

           IF  MIR-USER-SESN-CTRY-CD = SPACES
               PERFORM  7551-DEFAULT-CTRY-CD
                   THRU 7551-DEFAULT-CTRY-CD-X
           END-IF.

           PERFORM
           VARYING WS-CTRY-SUB FROM +1 BY +1
             UNTIL WS-CTRY-SUB = +5
                OR RASCL-ASCL-CTRY-CD (WS-CTRY-SUB) =
                   MIR-USER-SESN-CTRY-CD
               CONTINUE
           END-PERFORM.

           IF RASCL-ASCL-CTRY-CD (WS-CTRY-SUB) = MIR-USER-SESN-CTRY-CD
               CONTINUE
           ELSE
               SET WS-ERROR-FOUND        TO TRUE
      *MSG: NOT AUTHORIZED FOR REQUESTED COUNTRY. RE-ENTER
               MOVE 'XS00670007'         TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       7550-EDIT-USER-SESN-CTRY-CD-X.
           EXIT.

      *---------------------
       7551-DEFAULT-CTRY-CD.
      *---------------------

           IF RMAST-CO-ID NOT = WGLOB-COMPANY-CODE
               PERFORM  MAST-1000-READ
                   THRU MAST-1000-READ-X
           END-IF.

           IF WMAST-IO-OK
               MOVE RMAST-APPL-CTL-CTRY-CD TO MIR-USER-SESN-CTRY-CD
               MOVE RMAST-APPL-CTL-CTRY-CD TO WGLOB-MSG-PARM (1)
      *MSG: COUNTRY NOT ENTERED ON MIR.  COUNTRY DEFAULTED TO (@1).
               MOVE 'XS00670006'           TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       7551-DEFAULT-CTRY-CD-X.
           EXIT.
      /
      *----------------------------
       7560-EDIT-USER-SESN-CRCY-CD.
      *----------------------------

           IF  MIR-USER-SESN-CRCY-CD = SPACES
               PERFORM  7561-DEFAULT-CRCY-CD
                   THRU 7561-DEFAULT-CRCY-CD-X
           END-IF.

           PERFORM
           VARYING WS-CRCY-SUB FROM +1 BY +1
             UNTIL WS-CRCY-SUB = +5
                OR RASCL-ASCL-CRCY-CD (WS-CTRY-SUB, WS-CRCY-SUB) =
                   MIR-USER-SESN-CRCY-CD
              CONTINUE
           END-PERFORM.

           IF RASCL-ASCL-CRCY-CD (WS-CTRY-SUB, WS-CRCY-SUB) =
              MIR-USER-SESN-CRCY-CD
               CONTINUE
           ELSE
      *MSG: NOT AUTHORIZED FOR REQUESTED CURRENCY. RE-ENTER
               MOVE 'XS00670009'   TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       7560-EDIT-USER-SESN-CRCY-CD-X.
           EXIT.

      *---------------------
       7561-DEFAULT-CRCY-CD.
      *---------------------

           IF RMAST-CO-ID NOT = WGLOB-COMPANY-CODE
               PERFORM  MAST-1000-READ
                   THRU MAST-1000-READ-X
           END-IF.

           IF WMAST-IO-OK
               MOVE RMAST-APPL-CTL-CRCY-CD TO MIR-USER-SESN-CRCY-CD
               MOVE RMAST-APPL-CTL-CRCY-CD TO WGLOB-MSG-PARM (1)
      *MSG: CURRENCY NOT ENTERED ON MIR.  CURRENCY DEFAULTED TO (@1).
               MOVE 'XS00670008'           TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       7561-DEFAULT-CRCY-CD-X.
           EXIT.
      /
      *----------------
       7570-EDIT-BR-ID.
      *----------------

           MOVE MIR-BR-ID             TO WXTAB-ETBL-VALU-ID.
           PERFORM BRCH-1000-EDIT-BRANCH-CODE
              THRU BRCH-1000-EDIT-BRANCH-CODE-X.

           IF WXTAB-IO-OK
               MOVE MIR-BR-ID         TO WGLOB-USER-BRANCH-CODE
           ELSE
      *MSG:  INVALID BRANCH ID ENTERED
               MOVE 'XS00670010'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       7570-EDIT-BR-ID-X.
           EXIT.
      /
      *----------------------------
       7580-EDIT-USER-RPT-DSTRB-CD.
      *----------------------------

           MOVE MIR-USER-RPT-DSTRB-CD     TO WXTAB-ETBL-VALU-ID.
           PERFORM DIST-1000-EDIT-DIST-CD
              THRU DIST-1000-EDIT-DIST-CD-X.

           IF WXTAB-IO-OK
               MOVE MIR-USER-RPT-DSTRB-CD TO WGLOB-USER-RPT-DSTRB-CD
           ELSE
      *MSG:  INVALID REPORT DISTRIBUTION CODE ENTERED
               MOVE 'XS00670011'          TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       7580-EDIT-USER-RPT-DSTRB-CD-X.
           EXIT.
      /
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

       9100-RETRIEVE-APPL-INFO-X.
           EXIT.
      /
      *---------------------
       9200-SETUP-L0020-AREA.
      *---------------------

           MOVE MIR-CO-ID                     TO L0020-CO-ID.
FT2001*    MOVE SPACES                        TO L0020-ONLN-PRCES-DT.
EN8851     MOVE SPACES                        TO L0020-PROCESS-DATE.
           MOVE MIR-USER-SESN-CTRY-CD         TO L0020-COUNTRY-CODE.
           MOVE MIR-USER-SESN-CRCY-CD         TO L0020-CURRENCY-CODE.

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
                 MOVE WWKDT-ZERO-DT            TO WGLOB-PROCESS-DATE
      *MSG: APPLICATION STATUS IS SET TO "CLOSED", RERUN WHEN
      *     APPLICATION IS ACTIVE
                 MOVE 'XS00670015'             TO WGLOB-MSG-REF-INFO
                 PERFORM  0260-1000-GENERATE-MESSAGE
                     THRU 0260-1000-GENERATE-MESSAGE-X

               WHEN L0020-RES-INIT-APPL
               WHEN L0020-RES-SIGN-ON
                 SET WS-DV-APPL-STAT-ACTIVE    TO TRUE
FT2001*          MOVE L0020-ONLN-PRCES-DT      TO WGLOB-PROCESS-DATE
EN8851           MOVE L0020-PROCESS-DATE       TO WGLOB-PROCESS-DATE
EN8851           MOVE L0020-COUNTRY-CODE       TO WGLOB-COUNTRY-CODE
EN8851           MOVE L0020-CURRENCY-CODE      TO WGLOB-CURRENCY-CODE

               WHEN L0020-RES-PROHIBIT-ACCESS
                 SET WS-DV-APPL-STAT-STOPPED   TO TRUE
FT2001*          MOVE L0020-ONLN-PRCES-DT      TO WGLOB-PROCESS-DATE
EN8851           MOVE L0020-PROCESS-DATE       TO WGLOB-PROCESS-DATE
EN8851           MOVE L0020-COUNTRY-CODE       TO WGLOB-COUNTRY-CODE
EN8851           MOVE L0020-CURRENCY-CODE      TO WGLOB-CURRENCY-CODE
      *MSG: APPLICATION STATUS IS SET TO "ACCESS PROHIBITED",
      *     RERUN WHEN APPLICATION IS ACTIVE
                 MOVE 'XS00670012'             TO WGLOB-MSG-REF-INFO
                 PERFORM  0260-1000-GENERATE-MESSAGE
                     THRU 0260-1000-GENERATE-MESSAGE-X

               WHEN L0020-RES-DISCONNECT
               WHEN L0020-RES-LOGOFF
               WHEN L0020-RES-DATA-ERROR
      *MSG: SESSION FILE AND USER FILE OUT OF SYNC - CONTACT
      *       SYSTEMS
                 MOVE 'XS00670013'             TO WGLOB-MSG-REF-INFO
                 PERFORM  0260-1000-GENERATE-MESSAGE
                     THRU 0260-1000-GENERATE-MESSAGE-X

               WHEN OTHER
                 SET WS-DV-APPL-STAT-UNKNOWN   TO TRUE
      *MSG: SYSTEM STATUS IS UNKNOWN.  CONTACT SYSTEMS
                   SET MIR-RETRN-EDIT-ERROR    TO TRUE
                   MOVE 'XS00670014'           TO WGLOB-MSG-REF-INFO
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
       COPY XCPEBRCH.
      /
       COPY XCPEDIST.
      /
       COPY XCCL0260.
      /
       COPY XCCP0030.
      /
       COPY XCPS2490.
      /
       COPY XCCL2490.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
       COPY XCPNASCL.
      /
       COPY XCPNUSCL.
      /
       COPY CCPNMAST.
      /
       COPY XCPNXTAB.
      *****************************************************************
      **                 END OF PROGRAM XSOM0067                     **
      *****************************************************************
