      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM8104.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM8104                                         **
      **  REMARKS:  THIS MODULE PERFORMS TABLE LIST FUNCTION         **
      **            FOR THE DMAD TABLE                               **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
006002** 15DEC99   60     NEW PROGRAM FOR DMAD LIST                  **
014590** 15DEC99   60     ARCHITECTURAL CHANGES                      **
016070** 30JUN00   602J   ALLOW FILTERING BY LANGUAGE                **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM8104'.

       COPY SQLCA.

014590*COPY XCWL0030.
016070 COPY XCWEBLCH.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                           PIC X(04).
               88  WS-BUS-FCN-LIST                     VALUE '8104'.
           05  WS-SUB                                  PIC 9(3).
           05  WS-MAX-LIST-LINES                       PIC 9(3)
                                                       VALUE 50.
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
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      *****************************************************************
      /
      *****************
       LINKAGE SECTION.
      *****************

       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM8104.
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

               WHEN WS-BUS-FCN-LIST
                    PERFORM  2000-LIST
                        THRU 2000-LIST-X

               WHEN OTHER
      *MSG:  INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID
                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM8104'
                      TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000000'
                      TO WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET  MIR-RETRN-INVALD-RQST
                      TO TRUE

           END-EVALUATE.

       1000-PROCESS-REQUEST-X.
           EXIT.

      /
      *----------
       2000-LIST.
      *----------

           PERFORM  9000-BLANK-DATA-FIELDS
               THRU 9000-BLANK-DATA-FIELDS-X.

           PERFORM  7000-BUILD-KEYS
               THRU 7000-BUILD-KEYS-X.

           PERFORM  DMAD-1000-BROWSE
               THRU DMAD-1000-BROWSE-X.

           PERFORM  DMAD-2000-READ-NEXT
               THRU DMAD-2000-READ-NEXT-X.

           IF  WDMAD-IO-EOF
               PERFORM  DMAD-3000-END-BROWSE
                   THRU DMAD-3000-END-BROWSE-X
      *MSG: 'NO RECORDS FOUND TO DISPLAY'
               MOVE 'XS00000034'           TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-LIST-X
           END-IF.

016070     MOVE ZERO                       TO WS-SUB.
           PERFORM  2010-BROWSE-DMAD
               THRU 2010-BROWSE-DMAD-X
016070*        VARYING WS-SUB FROM 1 BY 1
               UNTIL   WS-SUB > WS-MAX-LIST-LINES
               OR      WDMAD-IO-EOF.

           IF  WDMAD-IO-EOF
               CONTINUE
           ELSE
               SET WGLOB-MORE-DATA-EXISTS
                 TO TRUE
               MOVE RDMAD-DM-AV-TBL-CD
                 TO MIR-DM-AV-TBL-CD
               MOVE RDMAD-DM-AV-CD
                 TO MIR-DM-AV-CD
016070*        MOVE RDMAD-DM-AV-DESC-LANG-CD
016070*          TO MIR-DM-AV-DESC-LANG-CD
           END-IF.

           PERFORM  DMAD-3000-END-BROWSE
               THRU DMAD-3000-END-BROWSE-X.

       2000-LIST-X.
           EXIT.


      *-----------------
       2010-BROWSE-DMAD.
      *-----------------

016070     IF  (MIR-DM-AV-DESC-LANG-CD = SPACE)
016070     OR  (MIR-DM-AV-DESC-LANG-CD = RDMAD-DM-AV-DESC-LANG-CD)
016070         ADD 1                    TO WS-SUB
               PERFORM  9200-MOVE-RECORD-TO-SCREEN
016070*            THRU 9200-MOVE-RECORD-TO-SCREEN-X.
016070             THRU 9200-MOVE-RECORD-TO-SCREEN-X 
016070     END-IF.


           PERFORM  DMAD-2000-READ-NEXT
               THRU DMAD-2000-READ-NEXT-X.

       2010-BROWSE-DMAD-X.
           EXIT.
      /
      *----------------
       7000-BUILD-KEYS.
      *----------------

016070     IF  MIR-DM-AV-DESC-LANG-CD = EBLCH-BLANK-FIELD-CHAR
016070         MOVE SPACES             TO MIR-DM-AV-DESC-LANG-CD
016070     END-IF.
           
           MOVE LOW-VALUES             TO WDMAD-KEY.
           MOVE MIR-DM-AV-TBL-CD       TO WDMAD-DM-AV-TBL-CD.
           MOVE MIR-DM-AV-CD           TO WDMAD-DM-AV-CD.
           MOVE MIR-DM-AV-DESC-LANG-CD TO WDMAD-DM-AV-DESC-LANG-CD.

           MOVE WDMAD-KEY          TO WDMAD-ENDBR-KEY.
           MOVE HIGH-VALUES        TO WDMAD-ENDBR-DM-AV-TBL-CD.
           MOVE HIGH-VALUES        TO WDMAD-ENDBR-DM-AV-CD.
           MOVE HIGH-VALUES        TO WDMAD-ENDBR-DM-AV-DESC-LANG-CD.

       7000-BUILD-KEYS-X.
           EXIT.

      /

      *-----------------------
       9000-BLANK-DATA-FIELDS.
      *-----------------------

           MOVE SPACES
             TO MIR-DM-AV-TBL-CD-G.
           MOVE SPACES
             TO MIR-DM-AV-CD-G.
           MOVE SPACES
             TO MIR-DM-AV-DESC-LANG-CD-G.
           MOVE SPACES
             TO MIR-DM-AV-DESC-TXT-G.

       9000-BLANK-DATA-FIELDS-X.
           EXIT.

      /
      *---------------------------
       9200-MOVE-RECORD-TO-SCREEN.
      *---------------------------

016070     IF  WS-SUB > WS-MAX-LIST-LINES
016070         GO TO 9200-MOVE-RECORD-TO-SCREEN-X
016070     END-IF.
           
           MOVE RDMAD-DM-AV-TBL-CD
             TO MIR-DM-AV-TBL-CD-T (WS-SUB).

           MOVE RDMAD-DM-AV-CD
             TO MIR-DM-AV-CD-T (WS-SUB).

           MOVE RDMAD-DM-AV-DESC-LANG-CD
             TO MIR-DM-AV-DESC-LANG-CD-T (WS-SUB).

           MOVE RDMAD-DM-AV-DESC-TXT
             TO MIR-DM-AV-DESC-TXT-T (WS-SUB).

       9200-MOVE-RECORD-TO-SCREEN-X.
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
       COPY XCPBDMAD.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM XSOM8104
      *****************************************************************
