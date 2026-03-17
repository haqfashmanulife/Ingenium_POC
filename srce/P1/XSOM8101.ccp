      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM8101.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM8101                                         **
      **  REMARKS:  THIS MODULE PERFORMS THE TABLE CREATE FUNCTION   **
      **            FOR THE DMAD TABLE                               **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
006002** 15DEC99   60     NEW PROGRAM FOR DMAD CREATE                **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM8101'.

       COPY SQLCA.

014590*COPY XCWL0030.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                    PIC X(04).
               88  WS-BUS-FCN-CREATE            VALUE '8101'.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
      /
       COPY XCFWDMAD.
       COPY XCFRDMAD.
      /
       COPY XCFWDMAV.
       COPY XCFRDMAV.
      /
       COPY XCFWXTAB.
       COPY XCFRXTAB.
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
       COPY XCWM8101.
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
                    MOVE 'XSOM8101'
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

           PERFORM  DMAD-1000-READ
               THRU DMAD-1000-READ-X.

           IF  WDMAD-IO-OK
      *MSG: 'RECORD @1 ALREADY EXISTS'
               MOVE WDMAD-KEY
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
           PERFORM  DMAD-1000-CREATE
               THRU DMAD-1000-CREATE-X.

           MOVE WGLOB-USER-ID          TO RDMAD-PREV-UPDT-USER-ID.
           MOVE WGLOB-SYSTEM-DATE-INT  TO RDMAD-PREV-UPDT-DT.

           PERFORM  DMAD-1000-WRITE
               THRU DMAD-1000-WRITE-X.

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

           PERFORM  4130-EDIT-AV-DESC-LANG-CD
               THRU 4130-EDIT-AV-DESC-LANG-CD-X.

       2100-VALIDATE-KEYS-X.
           EXIT.
      /


      *----------------------
       4110-EDIT-AV-TABLE-CD.
      *----------------------

           IF  MIR-DM-AV-TBL-CD = SPACES
      *MSG: ALLOWED VALUE TABLE CODE MUST BE ENTERED
               MOVE 'XS81010001'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4110-EDIT-AV-TABLE-CD-X
           END-IF.

           MOVE MIR-DM-AV-TBL-CD         TO WDMAD-DM-AV-TBL-CD.

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
               MOVE 'XS81010002'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4120-EDIT-AV-CD-X
           END-IF.

           MOVE MIR-DM-AV-CD             TO WDMAD-DM-AV-CD.

       4120-EDIT-AV-CD-X.
           EXIT.

      /
      *--------------------------
       4130-EDIT-AV-DESC-LANG-CD.
      *--------------------------

           IF  MIR-DM-AV-DESC-LANG-CD = SPACES
      *MSG: LANGUAGE FOR ALLOWED VALUE DESCRIPTION IS INVALID
               MOVE 'XS81010003'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4130-EDIT-AV-DESC-LANG-CD-X
           END-IF.

           MOVE LOW-VALUE                TO WXTAB-KEY.
           MOVE 'LANG'                   TO WXTAB-ETBL-TYP-ID.
           MOVE MIR-DM-AV-DESC-LANG-CD   TO WXTAB-ETBL-VALU-ID.
           MOVE MIR-DM-AV-DESC-LANG-CD   TO WXTAB-ETBL-LANG-CD.

           PERFORM  XTAB-1000-READ
               THRU XTAB-1000-READ-X.

           IF  NOT WXTAB-IO-OK
      *MSG: LANGUAGE IS NOT DEFINED
               MOVE 'XS81010004'         TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4130-EDIT-AV-DESC-LANG-CD-X
           END-IF.

           MOVE MIR-DM-AV-DESC-LANG-CD   TO WDMAD-DM-AV-DESC-LANG-CD.

       4130-EDIT-AV-DESC-LANG-CD-X.
           EXIT.

      /
      *----------------
       7000-BUILD-KEYS.
      *----------------

           MOVE LOW-VALUES             TO WDMAD-KEY.
           MOVE WGLOB-COMPANY-CODE     TO WDMAD-CO-ID.
           MOVE MIR-DM-AV-TBL-CD       TO WDMAD-DM-AV-TBL-CD.
           MOVE MIR-DM-AV-CD           TO WDMAD-DM-AV-CD.
           MOVE MIR-DM-AV-DESC-LANG-CD TO WDMAD-DM-AV-DESC-LANG-CD.

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
       COPY XCPADMAD.
       COPY XCPCDMAD.
       COPY XCPNDMAD.
       COPY XCPNDMAV.
       COPY XCPNXTAB.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM XSOM8101                     **
      *****************************************************************
