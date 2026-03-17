      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM4908.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM4908                                         **
      **  REMARKS:  THIS MODULE RETURNS A LIST OF COUNTRY LOCATIONS  **
      **            AND DESCRIPTIONS USING CTLC.                     **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
006002** 15DEC99   60     NEW PROGRAM FOR CTLC LIST RETRIEVAL        **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM4908'.

       COPY SQLCA.

014590*COPY XCWL0030.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                    PIC X(04).
               88  WS-BUS-FCN-RETRIEVE          VALUE '4908'.
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
       COPY XCFWCTLC.
       COPY XCFRCTLC.
      /
       COPY CCFWEDIT.
       COPY CCFREDIT.
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
       COPY XCWM4908.
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
                    MOVE 'XSOM4908'
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

           PERFORM  7500-BUILD-CTLC-KEYS
               THRU 7500-BUILD-CTLC-KEYS-X.

           PERFORM  9000-BLANK-DATA-FIELDS
               THRU 9000-BLANK-DATA-FIELDS-X.

           PERFORM  CTLC-1000-BROWSE
               THRU CTLC-1000-BROWSE-X.

           IF  NOT WCTLC-IO-OK
               PERFORM  CTLC-3000-END-BROWSE
                   THRU CTLC-3000-END-BROWSE-X
               SET MIR-RETRN-RQST-FAILED
                 TO TRUE
               GO TO 2000-RETRIEVE-X
           END-IF.

           PERFORM  CTLC-2000-READ-NEXT
               THRU CTLC-2000-READ-NEXT-X.

           PERFORM
               VARYING WS-SUB FROM 1 BY 1
               UNTIL WCTLC-IO-EOF
               OR    (WS-SUB > WS-MAX-LIST-LINES)

               MOVE RCTLC-CTRY-LOC-CD   TO WEDIT-ETBL-VALU-ID
               MOVE WGLOB-USER-LANG     TO WEDIT-ETBL-LANG-CD
               MOVE 'LOCAT'             TO WEDIT-ETBL-TYP-ID

               PERFORM  EDIT-1000-READ
                   THRU EDIT-1000-READ-X

               IF WEDIT-IO-OK
                   PERFORM  9200-MOVE-DATA-TO-MIR
                       THRU 9200-MOVE-DATA-TO-MIR-X
               END-IF

               PERFORM  CTLC-2000-READ-NEXT
                   THRU CTLC-2000-READ-NEXT-X

           END-PERFORM.

           IF  NOT WCTLC-IO-EOF
               MOVE RCTLC-CTRY-LOC-CD   TO MIR-CTRY-LOC-CD
               SET WGLOB-MORE-DATA-EXISTS
                                        TO TRUE
           END-IF.

           PERFORM  CTLC-3000-END-BROWSE
               THRU CTLC-3000-END-BROWSE-X.

       2000-RETRIEVE-X.
           EXIT.


      /
      *---------------------
       7500-BUILD-CTLC-KEYS.
      *---------------------

           MOVE LOW-VALUES             TO WCTLC-KEY.
           MOVE MIR-CTRY-CD            TO WCTLC-CTRY-CD.
           MOVE WGLOB-COMPANY-CODE     TO WCTLC-CO-ID.
           MOVE MIR-CTRY-LOC-TYP-CD    TO WCTLC-CTRY-LOC-TYP-CD.
           MOVE MIR-CTRY-LOC-CD        TO WCTLC-CTRY-LOC-CD.
           MOVE WCTLC-KEY              TO WCTLC-ENDBR-KEY.
           IF  MIR-CTRY-LOC-TYP-CD = SPACE
               MOVE HIGH-VALUES        TO WCTLC-ENDBR-CTRY-LOC-TYP-CD
           END-IF.
           MOVE HIGH-VALUES            TO WCTLC-ENDBR-CTRY-LOC-CD.

       7500-BUILD-CTLC-KEYS-X.
           EXIT.

      /
      *-----------------------
       9000-BLANK-DATA-FIELDS.
      *-----------------------

           MOVE SPACES
             TO MIR-CTRY-LOC-CD-G.
           MOVE SPACES
             TO MIR-ETBL-DESC-TXT-G.

       9000-BLANK-DATA-FIELDS-X.
           EXIT.
      /
      *--------------------------
       9200-MOVE-DATA-TO-MIR.
      *--------------------------

           MOVE RCTLC-CTRY-LOC-CD
             TO MIR-CTRY-LOC-CD-T (WS-SUB).
           MOVE REDIT-ETBL-DESC-TXT
             TO MIR-ETBL-DESC-TXT-T (WS-SUB).

       9200-MOVE-DATA-TO-MIR-X.
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
       COPY XCPBCTLC.


      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **              END OF PROGRAM XSOM4908                        **
      *****************************************************************
