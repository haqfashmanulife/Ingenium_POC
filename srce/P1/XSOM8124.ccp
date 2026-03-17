      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM8124.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM8124                                         **
      **  REMARKS:  THIS MODULE PERFORMS TABLE LIST FUNCTION         **
      **            FOR THE CTLC TABLE                               **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
006002** 15DEC99   60     NEW PROGRAM FOR CTLC LIST                  **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM8124'.

       COPY SQLCA.

014590*COPY XCWL0030.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                           PIC X(04).
               88  WS-BUS-FCN-LIST                     VALUE '8124'.
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
       COPY XCFWCTLC.
       COPY XCFRCTLC.
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
       COPY XCWM8124.
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
                    MOVE 'XSOM8124'
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
      *------------
       2000-LIST.
      *------------

           PERFORM  9000-BLANK-DATA-FIELDS
               THRU 9000-BLANK-DATA-FIELDS-X.

           PERFORM  7000-BUILD-KEYS
               THRU 7000-BUILD-KEYS-X.

           PERFORM  CTLC-1000-BROWSE
               THRU CTLC-1000-BROWSE-X.

           PERFORM  CTLC-2000-READ-NEXT
               THRU CTLC-2000-READ-NEXT-X.

           IF  WCTLC-IO-EOF
               PERFORM  CTLC-3000-END-BROWSE
                   THRU CTLC-3000-END-BROWSE-X
      *MSG: 'NO RECORDS FOUND TO DISPLAY'
               MOVE 'XS00000034'           TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-LIST-X
           END-IF.

           PERFORM  2010-BROWSE-CTLC
               THRU 2010-BROWSE-CTLC-X
               VARYING WS-SUB FROM 1 BY 1
               UNTIL   WS-SUB > WS-MAX-LIST-LINES
               OR      WCTLC-IO-EOF.

           IF  WCTLC-IO-EOF
               MOVE 'XS00000015'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
               SET WGLOB-MORE-DATA-EXISTS
                 TO TRUE
               MOVE RCTLC-CTRY-CD
                 TO MIR-CTRY-CD
               MOVE RCTLC-CO-ID
                 TO MIR-CO-ID
               MOVE RCTLC-CTRY-LOC-TYP-CD
                 TO MIR-CTRY-LOC-TYP-CD
               MOVE RCTLC-CTRY-LOC-CD
                 TO MIR-CTRY-LOC-CD
               MOVE 'XS00000014'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           PERFORM  CTLC-3000-END-BROWSE
               THRU CTLC-3000-END-BROWSE-X.

       2000-LIST-X.
           EXIT.


      *-----------------
       2010-BROWSE-CTLC.
      *-----------------

           PERFORM  9200-MOVE-RECORD-TO-SCREEN
               THRU 9200-MOVE-RECORD-TO-SCREEN-X.

           PERFORM  CTLC-2000-READ-NEXT
               THRU CTLC-2000-READ-NEXT-X.

       2010-BROWSE-CTLC-X.
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

           MOVE WCTLC-KEY              TO WCTLC-ENDBR-KEY.
           MOVE HIGH-VALUES            TO WCTLC-ENDBR-CTRY-CD.
           MOVE HIGH-VALUES            TO WCTLC-ENDBR-CO-ID.
           MOVE HIGH-VALUES            TO WCTLC-ENDBR-CTRY-LOC-TYP-CD.
           MOVE HIGH-VALUES            TO WCTLC-ENDBR-CTRY-LOC-CD.

       7000-BUILD-KEYS-X.
           EXIT.

      /

      *-----------------------
       9000-BLANK-DATA-FIELDS.
      *-----------------------

           MOVE SPACES
             TO MIR-CTRY-CD-G.
           MOVE SPACES
             TO MIR-CO-ID-G.
           MOVE SPACES
             TO MIR-CTRY-LOC-TYP-CD-G.
           MOVE SPACES
             TO MIR-CTRY-LOC-CD-G.

       9000-BLANK-DATA-FIELDS-X.
           EXIT.

      /
      *---------------------------
       9200-MOVE-RECORD-TO-SCREEN.
      *---------------------------

           MOVE RCTLC-CTRY-CD
             TO MIR-CTRY-CD-T (WS-SUB).

           MOVE RCTLC-CO-ID
             TO MIR-CO-ID-T (WS-SUB).

           MOVE RCTLC-CTRY-LOC-TYP-CD
             TO MIR-CTRY-LOC-TYP-CD-T (WS-SUB).

           MOVE RCTLC-CTRY-LOC-CD
             TO MIR-CTRY-LOC-CD-T (WS-SUB).

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
       COPY XCPBCTLC.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM XSOM8124                      *
      *****************************************************************
