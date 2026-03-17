      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM8121.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM8121                                         **
      **  REMARKS:  THIS MODULE PERFORMS THE TABLE CREATE FUNCTION   **
      **            FOR THE CTLC TABLE                               **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
006002** 15DEC99   60     NEW PROGRAM FOR CTLC CREATE                **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM8121'.

       COPY SQLCA.

014590*COPY XCWL0030.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                    PIC X(04).
               88  WS-BUS-FCN-CREATE            VALUE '8121'.
           05  WS-CTRY-LOC-TYP-CD               PIC X(5).
               88  WS-VALID-CTRY-LOC-TYP-CD     VALUE 'CLOC' 'ILOC'.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY CCFWEDIT.
       COPY CCFREDIT.
      /
       COPY CCFWPCOM.
       COPY CCFRPCOM.
      /
       COPY XCFWCTLC.
       COPY XCFRCTLC.
      /
       COPY XCFWCTRY.
       COPY XCFRCTRY.
      /
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                          *
      *****************************************************************
      /
      *****************
       LINKAGE SECTION.
      *****************

       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM8121.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                MIR-PARM-AREA.
      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  ABND-1000-HANDLE-ABEND
               THRU ABND-1000-HANDLE-ABEND-X.

           PERFORM  1000-PROCESS-REQUEST
               THRU 1000-PROCESS-REQUEST-X.

           PERFORM  EXIT-1000-FINALIZE
               THRU EXIT-1000-FINALIZE-X.

       0000-MAINLINE-X.
           GOBACK.

      /
      *--------------------
       1000-PROCESS-REQUEST.
      *--------------------

           PERFORM  9300-SETUP-MSIN-REFERENCE
               THRU 9300-SETUP-MSIN-REFERENCE-X.

           MOVE MIR-BUS-FCN-ID
             TO WS-BUS-FCN-ID.

           EVALUATE TRUE

               WHEN WS-BUS-FCN-CREATE
                    PERFORM  2000-CREATE
                        THRU 2000-CREATE-X

               WHEN OTHER
      *MSG:  INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID
                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM8121'
                      TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000000'
                      TO WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET MIR-RETRN-INVALD-RQST
                      TO TRUE

           END-EVALUATE.

       1000-PROCESS-REQUEST-X.
           EXIT.

      /
      *------------
       2000-CREATE.
      *------------
      *
      *  THE RECORD SHOULD NOT EXIST ON A CREATE
      *
           PERFORM  7000-BUILD-KEYS
               THRU 7000-BUILD-KEYS-X.

           PERFORM  2100-VALIDATE-KEYS
               THRU 2100-VALIDATE-KEYS-X.

           IF  WGLOB-MSG-ERROR-SW > ZERO
               GO TO 2000-CREATE-X
           END-IF.

           PERFORM  CTLC-1000-READ
               THRU CTLC-1000-READ-X.

           IF  WCTLC-IO-OK
      *MSG: 'RECORD @1 ALREADY EXISTS'
               MOVE WCTLC-KEY
                 TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000003'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-CREATE-X
           END-IF.
      *
      *  CREATE THE NEW RECORD
      *
           PERFORM  CTLC-1000-CREATE
               THRU CTLC-1000-CREATE-X.

           MOVE WGLOB-USER-ID          TO RCTLC-PREV-UPDT-USER-ID.
           MOVE WGLOB-SYSTEM-DATE-INT  TO RCTLC-PREV-UPDT-DT.

           PERFORM  CTLC-1000-WRITE
               THRU CTLC-1000-WRITE-X.

       2000-CREATE-X.
           EXIT.
      /

      *--------------------
       2100-VALIDATE-KEYS.
      *--------------------

           PERFORM  4110-EDIT-CO-ID
               THRU 4110-EDIT-CO-ID-X.

           PERFORM  4120-EDIT-CTRY-CD
               THRU 4120-EDIT-CTRY-CD-X.

           PERFORM  4130-EDIT-CTRY-LOC-TYP-CD
               THRU 4130-EDIT-CTRY-LOC-TYP-CD-X.

           PERFORM  4140-EDIT-CTRY-LOC-CD
               THRU 4140-EDIT-CTRY-LOC-CD-X.

       2100-VALIDATE-KEYS-X.
           EXIT.
      /
      *----------------
       4110-EDIT-CO-ID.
      *----------------

           IF  MIR-CO-ID = SPACES
      *MSG: COMPANY CODE MUST BE ENTERED
               MOVE 'XS81210001'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4110-EDIT-CO-ID-X
           END-IF.

           MOVE MIR-CO-ID                    TO WPCOM-CO-ID.

           PERFORM  PCOM-1000-READ
               THRU PCOM-1000-READ-X.
           IF  NOT WPCOM-IO-OK
      *MSG: COMPANY CODE IS NOT DEFINED
               MOVE MIR-CO-ID
                 TO WGLOB-MSG-PARM (1)
               MOVE 'XS81210002'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4110-EDIT-CO-ID-X
           END-IF.

           MOVE MIR-CO-ID                    TO WCTLC-CO-ID.

       4110-EDIT-CO-ID-X.
           EXIT.
      /

      *------------------
       4120-EDIT-CTRY-CD.
      *------------------

           IF  MIR-CTRY-CD = SPACES
      *MSG: COUNTRY CODE MUST BE ENTERED
               MOVE 'XS81210003'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4120-EDIT-CTRY-CD-X
           END-IF.

           MOVE MIR-CTRY-CD                  TO WCTRY-CTRY-CD.
           MOVE MIR-CO-ID                    TO WCTRY-CO-ID.

           PERFORM  CTRY-1000-READ
               THRU CTRY-1000-READ-X.
           IF  NOT WCTRY-IO-OK
      *MSG: COUNTRY CODE IS NOT DEFINED
               MOVE MIR-CTRY-CD
                 TO WGLOB-MSG-PARM (1)
               MOVE 'XS81210004'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4120-EDIT-CTRY-CD-X
           END-IF.

           MOVE MIR-CTRY-CD                  TO WCTLC-CTRY-CD.

       4120-EDIT-CTRY-CD-X.
           EXIT.
      /

      *--------------------------
       4130-EDIT-CTRY-LOC-TYP-CD.
      *--------------------------

           MOVE MIR-CTRY-LOC-TYP-CD          TO WS-CTRY-LOC-TYP-CD.
           IF NOT WS-VALID-CTRY-LOC-TYP-CD
      *MSG: INVALID LOCATION TYPE CODE
               MOVE 'XS81210005'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4130-EDIT-CTRY-LOC-TYP-CD-X
           END-IF.

           MOVE MIR-CTRY-LOC-TYP-CD
             TO WCTLC-CTRY-LOC-TYP-CD.

       4130-EDIT-CTRY-LOC-TYP-CD-X.
           EXIT.

      /
      *----------------------
       4140-EDIT-CTRY-LOC-CD.
      *----------------------

           IF  MIR-CTRY-LOC-CD = SPACES
      *MSG: LOCATION CODE MUST BE ENTERED
               MOVE 'XS81210006'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4140-EDIT-CTRY-LOC-CD-X
           END-IF.

           MOVE MIR-CTRY-LOC-CD              TO WEDIT-ETBL-VALU-ID.
           MOVE 'LOCAT'                      TO WEDIT-ETBL-TYP-ID.
           MOVE WGLOB-USER-LANG              TO WEDIT-ETBL-LANG-CD.

           PERFORM  EDIT-1000-READ
               THRU EDIT-1000-READ-X.

           IF  NOT WEDIT-IO-OK
      *MSG: LOCATION CODE IS NOT DEFINED
               MOVE MIR-CTRY-LOC-CD
                 TO WGLOB-MSG-PARM (1)
               MOVE 'XS81210007'             TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4140-EDIT-CTRY-LOC-CD-X
           END-IF.

           MOVE MIR-CTRY-LOC-CD              TO WCTLC-CTRY-LOC-CD.

       4140-EDIT-CTRY-LOC-CD-X.
           EXIT.

      /
      *----------------
       7000-BUILD-KEYS.
      *----------------

           MOVE LOW-VALUES             TO WCTLC-KEY.
           MOVE MIR-CTRY-CD            TO WCTLC-CTRY-CD.
           MOVE MIR-CO-ID              TO WCTLC-CO-ID.
           MOVE MIR-CTRY-LOC-TYP-CD    TO WCTLC-CTRY-LOC-TYP-CD.
           MOVE MIR-CTRY-LOC-CD        TO WCTLC-CTRY-LOC-CD.

       7000-BUILD-KEYS-X.
           EXIT.


      /
      *--------------------------
       9300-SETUP-MSIN-REFERENCE.
      *--------------------------

           MOVE SPACES
             TO WGLOB-MSIN-REFERENCE.
           MOVE WGLOB-COMPANY-CODE
             TO WGLOB-REF-COMPANY-CODE.

       9300-SETUP-MSIN-REFERENCE-X.
           EXIT.

      /
      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************
       COPY XCPPEXIT.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
       COPY XCCL0260.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
       COPY CCPNEDIT.
       COPY CCPNPCOM.

       COPY XCPACTLC.
       COPY XCPCCTLC.
       COPY XCPNCTLC.

       COPY XCPNCTRY.
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM XSOM8121                     **
      *****************************************************************
