      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM8130.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM8130                                         **
      **  REMARKS:  THIS MODULE PERFORMS THE SELECTION BOX CONTENTS  **
      **            RETRIEVAL USING AVT.                             **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
006002** 15DEC99   60     NEW PROGRAM FOR SELECTION BOX RETRIEVAL    **
014590** 15DEC99   60     ARCHITECTURAL CHANGES                      **
PF1055** 01MAR00          USE INPUT LANGUAGE INSTEAD OF WGLOB LANG   **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM8130'.

       COPY SQLCA.

014590*COPY XCWL0030.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                    PIC X(04).
               88  WS-BUS-FCN-RETRIEVE          VALUE '8130'.
           05  WS-SUB                           PIC 9(3).
           05  WS-MAX-LIST-LINES                PIC 9(3)
                                                VALUE 250.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY XCFWDMAD.
       COPY XCFRDMAD.
       COPY XCFWDMAE.
      /
       COPY XCFWDMAS.
       COPY XCFRDMAS.
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
       COPY XCWM8130.
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

               WHEN WS-BUS-FCN-RETRIEVE
                    PERFORM  2000-RETRIEVE
                        THRU 2000-RETRIEVE-X

               WHEN OTHER
      *MSG:  INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID
                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM8130'
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
      *-------------
       2000-RETRIEVE.
      *-------------

           PERFORM  7510-BUILD-DMAE-KEYS
               THRU 7510-BUILD-DMAE-KEYS-X.

           PERFORM  9000-BLANK-DATA-FIELDS
               THRU 9000-BLANK-DATA-FIELDS-X.

           PERFORM  DMAE-1000-BROWSE
               THRU DMAE-1000-BROWSE-X.

           IF  NOT WDMAE-IO-OK
               PERFORM  DMAE-3000-END-BROWSE
                   THRU DMAE-3000-END-BROWSE-X
               SET MIR-RETRN-RQST-FAILED
                 TO TRUE
               GO TO 2000-RETRIEVE-X
           END-IF.

           PERFORM  DMAE-2000-READ-NEXT
               THRU DMAE-2000-READ-NEXT-X.

           MOVE 1                          TO WS-SUB.

           PERFORM
               UNTIL WDMAE-IO-EOF
               OR    (WS-SUB > WS-MAX-LIST-LINES)


               IF  MIR-DM-AV-SUBSET-CD = SPACE

                   PERFORM  9250-MOVE-DMADREC-TO-MIR
                       THRU 9250-MOVE-DMADREC-TO-MIR-X
                   ADD 1                    TO WS-SUB

               ELSE
                   MOVE MIR-DM-AV-TBL-CD    TO WDMAS-DM-AV-TBL-CD
                   MOVE RDMAD-DM-AV-CD      TO WDMAS-DM-AV-CD
                   MOVE MIR-DM-AV-SUBSET-CD TO WDMAS-DM-AV-SUBSET-CD

                   PERFORM  DMAS-1000-READ
                       THRU DMAS-1000-READ-X
                   IF  WDMAS-IO-OK
                       PERFORM  9250-MOVE-DMADREC-TO-MIR
                           THRU 9250-MOVE-DMADREC-TO-MIR-X
                       ADD 1                TO WS-SUB
                   END-IF
               END-IF

               PERFORM  DMAE-2000-READ-NEXT
                   THRU DMAE-2000-READ-NEXT-X

           END-PERFORM.

           IF  NOT WDMAE-IO-EOF
               MOVE RDMAD-DM-AV-CD   TO MIR-DM-AV-CD
               MOVE RDMAD-DM-AV-DESC-TXT TO MIR-DM-AV-DESC-TXT
               SET WGLOB-MORE-DATA-EXISTS TO TRUE
           END-IF.

           PERFORM  DMAE-3000-END-BROWSE
               THRU DMAE-3000-END-BROWSE-X.

       2000-RETRIEVE-X.
           EXIT.

      /
      *---------------------
       7510-BUILD-DMAE-KEYS.
      *---------------------

           MOVE LOW-VALUES             TO WDMAE-KEY.
           MOVE MIR-DM-AV-TBL-CD       TO WDMAE-DM-AV-TBL-CD.
PF1055***  MOVE WGLOB-USER-LANG        TO WDMAE-DM-AV-DESC-LANG-CD.
PF1055     MOVE MIR-DM-AV-DESC-LANG-CD TO WDMAE-DM-AV-DESC-LANG-CD.
           MOVE MIR-DM-AV-DESC-TXT     TO WDMAE-DM-AV-DESC-TXT.
           MOVE MIR-DM-AV-CD           TO WDMAE-DM-AV-CD.
           MOVE WDMAE-KEY              TO WDMAE-ENDBR-KEY.
           MOVE HIGH-VALUES            TO WDMAE-ENDBR-DM-AV-DESC-TXT.
           MOVE HIGH-VALUES            TO WDMAE-ENDBR-DM-AV-CD.

       7510-BUILD-DMAE-KEYS-X.
           EXIT.

      /
      *-----------------------
       9000-BLANK-DATA-FIELDS.
      *-----------------------

           MOVE SPACES
             TO MIR-DM-AV-CD-G.
           MOVE SPACES
             TO MIR-DM-AV-DESC-TXT-G.

       9000-BLANK-DATA-FIELDS-X.
           EXIT.
      /
      *--------------------------
       9250-MOVE-DMADREC-TO-MIR.
      *--------------------------

           MOVE RDMAD-DM-AV-CD
             TO MIR-DM-AV-CD-T (WS-SUB).
           MOVE RDMAD-DM-AV-DESC-TXT
             TO MIR-DM-AV-DESC-TXT-T (WS-SUB).

       9250-MOVE-DMADREC-TO-MIR-X.
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
       COPY XCPNDMAD.
       COPY XCPBDMAE.
       COPY XCPNDMAS.


      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **              END OF PROGRAM XSOM8130                        **
      *****************************************************************
