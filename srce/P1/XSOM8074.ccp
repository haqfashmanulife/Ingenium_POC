      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM8074.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM8074                                         **
      **  REMARKS:  THIS MODULE PERFORMS TABLE LIST FUNCTION         **
      **            FOR THE BFCN TABLE                               **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
012624**  15DEC99  60     DESCRIPTION                                **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM8074'.

       COPY SQLCA.

014590*COPY XCWL0030.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                           PIC X(04).
               88  WS-BUS-FCN-LIST                     VALUE '8074'.
           05  WS-MAX-LIST-LINES                       PIC S9(04) COMP
                                                       VALUE +100.
           05  WS-SUB                                  PIC S9(04) COMP.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
       COPY XCWWWKDT.
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
       COPY XCWLDTLK.
       COPY XCWL1640.
      /
      *****************
       LINKAGE SECTION.
      *****************

       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM8074.
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

               WHEN WS-BUS-FCN-LIST
                    PERFORM  2000-LIST
                        THRU 2000-LIST-X

               WHEN OTHER
      *MSG:  INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID
                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM8074'
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

           PERFORM  BFCN-1000-BROWSE
               THRU BFCN-1000-BROWSE-X.

           PERFORM  BFCN-2000-READ-NEXT
               THRU BFCN-2000-READ-NEXT-X.

           IF  WBFCN-IO-EOF
               PERFORM  BFCN-3000-END-BROWSE
                   THRU BFCN-3000-END-BROWSE-X
      *MSG: 'NO RECORDS FOUND TO DISPLAY'
               MOVE 'XS00000034'       TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-LIST-X
           END-IF.

           PERFORM  2010-BROWSE-BFCN
               THRU 2010-BROWSE-BFCN-X
               VARYING WS-SUB FROM 1 BY 1
               UNTIL   WS-SUB > WS-MAX-LIST-LINES
               OR      WBFCN-IO-EOF.

           IF  WBFCN-IO-EOF
               CONTINUE
           ELSE
               SET WGLOB-MORE-DATA-EXISTS
                                      TO TRUE
               MOVE RBFCN-BUS-FCN-ID  TO MIR-DV-ENTR-BUS-FCN-ID
           END-IF.

           PERFORM  BFCN-3000-END-BROWSE
               THRU BFCN-3000-END-BROWSE-X.

       2000-LIST-X.
           EXIT.


      *-----------------
       2010-BROWSE-BFCN.
      *-----------------

           PERFORM  9200-MOVE-RECORD-TO-SCREEN
               THRU 9200-MOVE-RECORD-TO-SCREEN-X.

           PERFORM  BFCN-2000-READ-NEXT
               THRU BFCN-2000-READ-NEXT-X.

       2010-BROWSE-BFCN-X.
           EXIT.
      /
      *----------------
       7000-BUILD-KEYS.
      *----------------

           MOVE LOW-VALUES             TO WBFCN-KEY.
           MOVE MIR-DV-ENTR-BUS-FCN-ID TO WBFCN-BUS-FCN-ID.

           MOVE WBFCN-KEY              TO WBFCN-ENDBR-KEY.
           MOVE HIGH-VALUES            TO WBFCN-ENDBR-BUS-FCN-ID.

       7000-BUILD-KEYS-X.
           EXIT.

      /

      *-----------------------
       9000-BLANK-DATA-FIELDS.
      *-----------------------

           MOVE SPACE                 TO MIR-BUS-FCN-ID-G.
           MOVE SPACE                 TO MIR-BUS-FCN-CONN-IND-G.
           MOVE SPACE                 TO MIR-BUS-FCN-AUD-IND-G.
           MOVE SPACE                 TO MIR-BUS-FCN-PDRVR-ID-G.

       9000-BLANK-DATA-FIELDS-X.
           EXIT.

      /
      *---------------------------
       9200-MOVE-RECORD-TO-SCREEN.
      *---------------------------

           MOVE RBFCN-BUS-FCN-ID
             TO MIR-BUS-FCN-ID-T (WS-SUB).

           MOVE RBFCN-BUS-FCN-CONN-IND
             TO MIR-BUS-FCN-CONN-IND-T (WS-SUB).

           MOVE RBFCN-BUS-FCN-AUD-IND
             TO MIR-BUS-FCN-AUD-IND-T (WS-SUB).

           MOVE RBFCN-BUS-FCN-PDRVR-ID
             TO MIR-BUS-FCN-PDRVR-ID-T (WS-SUB).

       9200-MOVE-RECORD-TO-SCREEN-X.
           EXIT.
      /
      *--------------------------
       9300-SETUP-MSIN-REFERENCE.
      *--------------------------

           MOVE SPACES                TO WGLOB-MSIN-REFERENCE.
           MOVE WGLOB-COMPANY-CODE    TO WGLOB-REF-COMPANY-CODE.

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
       COPY XCPL1640.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
       COPY XCPBBFCN.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM XSOM8074
      *****************************************************************
