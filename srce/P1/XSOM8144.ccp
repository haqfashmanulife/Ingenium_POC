      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM8144.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM8144                                         **
      **  REMARKS:  THIS MODULE PERFORMS TABLE LIST FUNCTION         **
      **            FOR THE BPFL TABLE                               **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
012624** 15DEC99   60     NEW PROGRAM FOR BPFL LIST                  **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM8144'.

       COPY SQLCA.

014590*COPY XCWL0030.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                           PIC X(04).
               88  WS-BUS-FCN-LIST                     VALUE '8144'.
           05  WS-SUB                                  PIC 9(3).
           05  WS-MAX-LIST-LINES                       PIC 9(3)
                                                       VALUE 100.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY XCFWBPFL.
       COPY XCFRBPFL.
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
       COPY XCWM8144.
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
                    MOVE 'XSOM8144'
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

           PERFORM  BPFL-1000-BROWSE
               THRU BPFL-1000-BROWSE-X.

           PERFORM  BPFL-2000-READ-NEXT
               THRU BPFL-2000-READ-NEXT-X.

           IF  WBPFL-IO-EOF
               PERFORM  BPFL-3000-END-BROWSE
                   THRU BPFL-3000-END-BROWSE-X
      *MSG: 'NO RECORDS FOUND TO DISPLAY'
               MOVE 'XS00000034'           TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-LIST-X
           END-IF.

           PERFORM  2010-BROWSE-BPFL
               THRU 2010-BROWSE-BPFL-X
               VARYING WS-SUB FROM 1 BY 1
               UNTIL   WS-SUB > WS-MAX-LIST-LINES
               OR      WBPFL-IO-EOF.

           IF  WBPFL-IO-EOF
               CONTINUE
           ELSE
               SET WGLOB-MORE-DATA-EXISTS
                 TO TRUE
               MOVE RBPFL-BPF-ID
                 TO MIR-BPF-ID
           END-IF.

           PERFORM  BPFL-3000-END-BROWSE
               THRU BPFL-3000-END-BROWSE-X.

       2000-LIST-X.
           EXIT.


      *-----------------
       2010-BROWSE-BPFL.
      *-----------------

           PERFORM  9200-MOVE-RECORD-TO-SCREEN
               THRU 9200-MOVE-RECORD-TO-SCREEN-X.

           PERFORM  BPFL-2000-READ-NEXT
               THRU BPFL-2000-READ-NEXT-X.

       2010-BROWSE-BPFL-X.
           EXIT.
      /
      *----------------
       7000-BUILD-KEYS.
      *----------------

           MOVE LOW-VALUES             TO WBPFL-KEY.
           MOVE MIR-BPF-ID             TO WBPFL-BPF-ID.
           MOVE WBPFL-KEY              TO WBPFL-ENDBR-KEY.
           MOVE HIGH-VALUES            TO WBPFL-ENDBR-BPF-ID.

       7000-BUILD-KEYS-X.
           EXIT.

      /
      *-----------------------
       9000-BLANK-DATA-FIELDS.
      *-----------------------

           MOVE SPACES
             TO MIR-BPF-ID-G.

       9000-BLANK-DATA-FIELDS-X.
           EXIT.

      /
      *---------------------------
       9200-MOVE-RECORD-TO-SCREEN.
      *---------------------------

           MOVE RBPFL-BPF-ID
             TO MIR-BPF-ID-T (WS-SUB).

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
       COPY XCPBBPFL.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM XSOM8144                      *
      *****************************************************************
