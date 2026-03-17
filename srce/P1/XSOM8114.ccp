      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM8114.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM8114                                         **
      **  REMARKS:  THIS MODULE PERFORMS TABLE LIST FUNCTION         **
      **            FOR THE DMAS TABLE                               **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
006002** 15DEC99   60     NEW PROGRAM FOR DMAS LIST                  **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM8114'.

       COPY SQLCA.

014590*COPY XCWL0030.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                           PIC X(04).
               88  WS-BUS-FCN-LIST                     VALUE '8114'.
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
       COPY XCFWDMAS.
       COPY XCFRDMAS.
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
       COPY XCWM8114.
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
                    MOVE 'XSOM8114'
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

           PERFORM  DMAS-1000-BROWSE
               THRU DMAS-1000-BROWSE-X.

           PERFORM  DMAS-2000-READ-NEXT
               THRU DMAS-2000-READ-NEXT-X.

           IF  WDMAS-IO-EOF
               PERFORM  DMAS-3000-END-BROWSE
                   THRU DMAS-3000-END-BROWSE-X
      *MSG: 'NO RECORDS FOUND TO DISPLAY'
               MOVE 'XS00000034'           TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-LIST-X
           END-IF.

           PERFORM  2010-BROWSE-DMAS
               THRU 2010-BROWSE-DMAS-X
               VARYING WS-SUB FROM 1 BY 1
               UNTIL   WS-SUB > WS-MAX-LIST-LINES
               OR      WDMAS-IO-EOF.

           IF  WDMAS-IO-EOF
               CONTINUE
           ELSE
               SET WGLOB-MORE-DATA-EXISTS
                 TO TRUE
               MOVE RDMAS-DM-AV-TBL-CD
                 TO MIR-DM-AV-TBL-CD
               MOVE RDMAS-DM-AV-CD
                 TO MIR-DM-AV-CD
               MOVE RDMAS-DM-AV-SUBSET-CD
                 TO MIR-DM-AV-SUBSET-CD
           END-IF.

           PERFORM  DMAS-3000-END-BROWSE
               THRU DMAS-3000-END-BROWSE-X.

       2000-LIST-X.
           EXIT.


      *-----------------
       2010-BROWSE-DMAS.
      *-----------------

           PERFORM  9200-MOVE-RECORD-TO-SCREEN
               THRU 9200-MOVE-RECORD-TO-SCREEN-X.

           PERFORM  DMAS-2000-READ-NEXT
               THRU DMAS-2000-READ-NEXT-X.

       2010-BROWSE-DMAS-X.
           EXIT.
      /
      *----------------
       7000-BUILD-KEYS.
      *----------------

           MOVE LOW-VALUES             TO WDMAS-KEY.
           MOVE MIR-DM-AV-TBL-CD       TO WDMAS-DM-AV-TBL-CD.
           MOVE MIR-DM-AV-CD           TO WDMAS-DM-AV-CD.
           MOVE MIR-DM-AV-SUBSET-CD    TO WDMAS-DM-AV-SUBSET-CD.

           MOVE WDMAS-KEY              TO WDMAS-ENDBR-KEY.
           MOVE HIGH-VALUES            TO WDMAS-ENDBR-DM-AV-TBL-CD.
           MOVE HIGH-VALUES            TO WDMAS-ENDBR-DM-AV-CD.
           MOVE HIGH-VALUES            TO WDMAS-ENDBR-DM-AV-SUBSET-CD.


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
             TO MIR-DM-AV-SUBSET-CD-G.


       9000-BLANK-DATA-FIELDS-X.
           EXIT.

      /
      *---------------------------
       9200-MOVE-RECORD-TO-SCREEN.
      *---------------------------

           MOVE RDMAS-DM-AV-TBL-CD
             TO MIR-DM-AV-TBL-CD-T (WS-SUB).

           MOVE RDMAS-DM-AV-CD
             TO MIR-DM-AV-CD-T (WS-SUB).

           MOVE RDMAS-DM-AV-SUBSET-CD
             TO MIR-DM-AV-SUBSET-CD-T (WS-SUB).

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
       COPY XCPBDMAS.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM XSOM8114                      *
      *****************************************************************
