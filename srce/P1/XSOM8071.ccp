      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM8071.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM8071                                         **
      **  REMARKS:  THIS MODULE PERFORMS THE TABLE CREATE FUNCTION   **
      **            FOR THE BFCN TABLE                               **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
012624**  15DEC99  60     NEW                                        **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM8071'.

       COPY SQLCA.

014590*COPY XCWL0030.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                    PIC X(04).
               88  WS-BUS-FCN-CREATE            VALUE '8071'.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
      /
       COPY XCFWBFCN.
       COPY XCFRBFCN.
      /
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      *****************************************************************
      /
      *****************
       LINKAGE SECTION.
      *****************

       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM8071.
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

           MOVE MIR-BUS-FCN-ID        TO WS-BUS-FCN-ID.
           SET MIR-RETRN-OK           TO TRUE.

           EVALUATE TRUE

               WHEN WS-BUS-FCN-CREATE
                    PERFORM  2000-CREATE
                        THRU 2000-CREATE-X

               WHEN OTHER
      *MSG:  INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID
                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM8071'
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

           PERFORM  BFCN-1000-READ
               THRU BFCN-1000-READ-X.

           IF  WBFCN-IO-OK
      *MSG: 'RECORD @1 ALREADY EXISTS'
               MOVE WBFCN-KEY
                 TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000003'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-CREATE-X
           END-IF.
      *
      *  CREATE THE NEW RECORD AND AUDIT THE CHANGE
      *
           PERFORM  BFCN-1000-CREATE
               THRU BFCN-1000-CREATE-X.

           MOVE WGLOB-USER-ID         TO RBFCN-PREV-UPDT-USER-ID.
           MOVE WGLOB-SYSTEM-DATE-INT TO RBFCN-PREV-UPDT-DT.

           PERFORM  BFCN-1000-WRITE
               THRU BFCN-1000-WRITE-X.

           MOVE 'XS00000004'          TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

       2000-CREATE-X.
           EXIT.
      /

      *--------------------
       2100-VALIDATE-KEYS.
      *--------------------

           PERFORM  4110-EDIT-DV-ENTR-BUS-FCN-ID
               THRU 4110-EDIT-DV-ENTR-BUS-FCN-ID-X.

       2100-VALIDATE-KEYS-X.
           EXIT.
      /

      *-------------------------
       4110-EDIT-DV-ENTR-BUS-FCN-ID.
      *-------------------------

           IF  MIR-DV-ENTR-BUS-FCN-ID = SPACES
      *MSG: @1 MUST BE ENTERED
               MOVE 'BFID'
                 TO WGLOB-MSG-PARM (1)
               MOVE 'CS99990001'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4110-EDIT-DV-ENTR-BUS-FCN-ID-X
           END-IF.

           MOVE MIR-DV-ENTR-BUS-FCN-ID TO WBFCN-BUS-FCN-ID.


       4110-EDIT-DV-ENTR-BUS-FCN-ID-X.
           EXIT.

      /
      *----------------
       7000-BUILD-KEYS.
      *----------------

           MOVE LOW-VALUES             TO WBFCN-KEY.
           MOVE MIR-BUS-FCN-ID         TO WBFCN-BUS-FCN-ID.

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
012624*COPY XCPPMEXT.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
       COPY XCCL0260.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
       COPY XCPABFCN.
       COPY XCPCBFCN.
       COPY XCPNBFCN.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM CSOM9999                     **
      *****************************************************************
