      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM8111.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM8111                                         **
      **  REMARKS:  THIS MODULE PERFORMS THE TABLE CREATE FUNCTION   **
      **            FOR THE DMAS TABLE                               **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
006002** 15DEC99   60     NEW PROGRAM FOR DMAS CREATE                **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM8111'.

       COPY SQLCA.

014590*COPY XCWL0030.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                    PIC X(04).
               88  WS-BUS-FCN-CREATE            VALUE '8111'.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY XCFWDMAS.
       COPY XCFRDMAS.
       COPY XCFWDMAV.
       COPY XCFRDMAV.
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
       COPY XCWM8111.
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
                    MOVE 'XSOM8111'
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

           PERFORM  DMAS-1000-READ
               THRU DMAS-1000-READ-X.

           IF  WDMAS-IO-OK
      *MSG: 'RECORD @1 ALREADY EXISTS'
               MOVE WDMAS-KEY
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
           PERFORM  DMAS-1000-CREATE
               THRU DMAS-1000-CREATE-X.

           MOVE WGLOB-USER-ID          TO RDMAS-PREV-UPDT-USER-ID.
           MOVE WGLOB-SYSTEM-DATE-INT  TO RDMAS-PREV-UPDT-DT.

           PERFORM  DMAS-1000-WRITE
               THRU DMAS-1000-WRITE-X.


       2000-CREATE-X.
           EXIT.
      /

      *--------------------
       2100-VALIDATE-KEYS.
      *--------------------

           PERFORM  4110-EDIT-AV-TABLE-CD
               THRU 4110-EDIT-AV-TABLE-CD-X.

           PERFORM  4120-EDIT-AV-CD
               THRU 4120-EDIT-AV-CD-X.

           PERFORM  4130-EDIT-AV-SUBSET-CD
               THRU 4130-EDIT-AV-SUBSET-CD-X.

       2100-VALIDATE-KEYS-X.
           EXIT.
      /

      *----------------------
       4110-EDIT-AV-TABLE-CD.
      *----------------------

           IF  MIR-DM-AV-TBL-CD = SPACES
      *MSG: ALLOWED VALUE TABLE CODE MUST BE ENTERED
               MOVE 'XS81110001'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4110-EDIT-AV-TABLE-CD-X
           END-IF.

           MOVE MIR-DM-AV-TBL-CD         TO WDMAS-DM-AV-TBL-CD.

       4110-EDIT-AV-TABLE-CD-X.
           EXIT.

      /
      *----------------
       4120-EDIT-AV-CD.
      *----------------

           MOVE MIR-DM-AV-TBL-CD         TO WDMAV-DM-AV-TBL-CD.
           MOVE MIR-DM-AV-CD             TO WDMAV-DM-AV-CD.
           PERFORM  DMAV-1000-READ
               THRU DMAV-1000-READ-X.
           IF  NOT WDMAV-IO-OK
      *MSG: ALLOWED VALUE DOES NOT EXIST
               MOVE 'XS81110002'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4120-EDIT-AV-CD-X
           END-IF.

           MOVE MIR-DM-AV-CD             TO WDMAS-DM-AV-CD.

       4120-EDIT-AV-CD-X.
           EXIT.


      /
      *-------------------------
       4130-EDIT-AV-SUBSET-CD.
      *-------------------------

           IF  MIR-DM-AV-SUBSET-CD = SPACES
      *MSG: ALLOWED VALUE SUBSET CODE CANNOT BE SPACE
               MOVE 'XS81110003'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4130-EDIT-AV-SUBSET-CD-X
           END-IF.

           MOVE MIR-DM-AV-SUBSET-CD      TO WDMAS-DM-AV-SUBSET-CD.

       4130-EDIT-AV-SUBSET-CD-X.
           EXIT.

      /
      *----------------
       7000-BUILD-KEYS.
      *----------------

           MOVE LOW-VALUES             TO WDMAS-KEY.
           MOVE MIR-DM-AV-TBL-CD       TO WDMAS-DM-AV-TBL-CD.
           MOVE MIR-DM-AV-CD           TO WDMAS-DM-AV-CD.
           MOVE MIR-DM-AV-SUBSET-CD    TO WDMAS-DM-AV-SUBSET-CD.

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
       COPY XCPADMAS.
       COPY XCPCDMAS.
       COPY XCPNDMAS.
       COPY XCPNDMAV.
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM XSOM8111                     **
      *****************************************************************
