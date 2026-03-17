      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM8072.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM8072                                         **
      **  REMARKS:  THIS MODULE PERFORMS THE RECORD UPDATE FUNCTION  **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM8072'.

       COPY SQLCA.

014590*COPY XCWL0030.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                 PIC X(04).
               88  WS-BUS-FCN-UPDATE         VALUE '8072'.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
       COPY XCWEBLCH.
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
       COPY XCWM8072.
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

               WHEN WS-BUS-FCN-UPDATE
                    PERFORM  2000-UPDATE
                        THRU 2000-UPDATE-X

               WHEN OTHER
      *MSG:  INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID
                                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM8072'   TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000000' TO WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET MIR-RETRN-INVALD-RQST
                                      TO TRUE

           END-EVALUATE.

       1000-PROCESS-REQUEST-X.
           EXIT.
      /
      *-----------
       2000-UPDATE.
      *-----------
      *
      *  THE RECORD MUST EXIST ON A MAINTAIN
      *
           PERFORM  7000-BUILD-KEYS
               THRU 7000-BUILD-KEYS-X.

           PERFORM  BFCN-1000-READ-FOR-UPDATE
               THRU BFCN-1000-READ-FOR-UPDATE-X.

           IF  WBFCN-IO-NOT-FOUND
      *MSG: 'LOST RECORD (@1) IN MAINTAIN - CONTACT SYSTEMS'
               MOVE WBFCN-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000006'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-UPDATE-X
           END-IF.

           PERFORM  8000-EDITS
               THRU 8000-EDITS-X.

           IF  WGLOB-MSG-ERROR-SW = ZERO
               PERFORM  9200-MOVE-RECORD-TO-MIR
                   THRU 9200-MOVE-RECORD-TO-MIR-X
               MOVE WGLOB-USER-ID     TO RBFCN-PREV-UPDT-USER-ID
               MOVE WGLOB-SYSTEM-DATE-INT
                                      TO RBFCN-PREV-UPDT-DT
               PERFORM  BFCN-2000-REWRITE
                   THRU BFCN-2000-REWRITE-X
               MOVE 'XS00000008'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       2000-UPDATE-X.
           EXIT.
      /
      *----------------
       7000-BUILD-KEYS.
      *----------------

           MOVE LOW-VALUES             TO WBFCN-KEY.
           MOVE MIR-DV-ENTR-BUS-FCN-ID TO WBFCN-BUS-FCN-ID.

       7000-BUILD-KEYS-X.
           EXIT.

      /
      *--------------------
       8000-EDITS.
      *--------------------

           PERFORM  8010-EDIT-BUS-FCN-CONN-IND
               THRU 8010-EDIT-BUS-FCN-CONN-IND-X.

           PERFORM  8020-EDIT-BUS-FCN-AUD-IND
               THRU 8020-EDIT-BUS-FCN-AUD-IND-X.

           PERFORM  8030-EDIT-BUS-FCN-PDRVR-ID
               THRU 8030-EDIT-BUS-FCN-PDRVR-ID-X.


       8000-EDITS-X.
           EXIT.

      *---------------------------
       8010-EDIT-BUS-FCN-CONN-IND.
      *---------------------------

           EVALUATE MIR-BUS-FCN-CONN-IND

               WHEN 'Y'
               WHEN 'N'
                    MOVE MIR-BUS-FCN-CONN-IND
                                       TO RBFCN-BUS-FCN-CONN-IND

               WHEN EBLCH-BLANK-FIELD-CHAR
                    MOVE SPACE         TO RBFCN-BUS-FCN-CONN-IND

               WHEN SPACE
                    CONTINUE

               WHEN OTHER
      *MSG: CONNECTION INDICATOR MUST BE 'Y' OR 'N'
                    MOVE 'XS80720001'  TO WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X

           END-EVALUATE.


       8010-EDIT-BUS-FCN-CONN-IND-X.
           EXIT.


      *--------------------------
       8020-EDIT-BUS-FCN-AUD-IND.
      *--------------------------

           EVALUATE MIR-BUS-FCN-AUD-IND

               WHEN 'Y'
               WHEN 'N'
                    MOVE MIR-BUS-FCN-AUD-IND
                                       TO RBFCN-BUS-FCN-AUD-IND

               WHEN EBLCH-BLANK-FIELD-CHAR
                    MOVE SPACE         TO RBFCN-BUS-FCN-AUD-IND

               WHEN SPACE
                    CONTINUE

               WHEN OTHER
      *MSG: AUDIO INDICATOR MUST BE 'Y' OR 'N'
                    MOVE 'XS80720002'  TO WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X

           END-EVALUATE.


       8020-EDIT-BUS-FCN-AUD-IND-X.
           EXIT.

      *---------------------------
       8030-EDIT-BUS-FCN-PDRVR-ID.
      *---------------------------

           EVALUATE MIR-BUS-FCN-PDRVR-ID

               WHEN EBLCH-BLANK-FIELD-CHAR
                    MOVE SPACE         TO RBFCN-BUS-FCN-PDRVR-ID

               WHEN SPACE
                    CONTINUE

               WHEN OTHER
                    MOVE MIR-BUS-FCN-PDRVR-ID
                                       TO RBFCN-BUS-FCN-PDRVR-ID

           END-EVALUATE.


       8030-EDIT-BUS-FCN-PDRVR-ID-X.
           EXIT.

      /
      *-----------------
       9000-BLANK-DATA-FIELDS.
      *-----------------

           MOVE SPACES                 TO MIR-BUS-FCN-CONN-IND.
           MOVE SPACES                 TO MIR-BUS-FCN-AUD-IND.
           MOVE SPACES                 TO MIR-BUS-FCN-PDRVR-ID.


       9000-BLANK-DATA-FIELDS-X.
           EXIT.
      /
      *--------------------------
       9200-MOVE-RECORD-TO-MIR.
      *--------------------------

           PERFORM  9000-BLANK-DATA-FIELDS
               THRU 9000-BLANK-DATA-FIELDS-X.

           MOVE RBFCN-BUS-FCN-CONN-IND TO MIR-BUS-FCN-CONN-IND.
           MOVE RBFCN-BUS-FCN-AUD-IND  TO MIR-BUS-FCN-AUD-IND.
           MOVE RBFCN-BUS-FCN-PDRVR-ID TO MIR-BUS-FCN-PDRVR-ID.


       9200-MOVE-RECORD-TO-MIR-X.
           EXIT.
      /
      *--------------------------
       9300-SETUP-MSIN-REFERENCE.
      *--------------------------

           MOVE SPACES                 TO WGLOB-MSIN-REFERENCE.
           MOVE WGLOB-COMPANY-CODE     TO WGLOB-REF-COMPANY-CODE.

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
       COPY XCPUBFCN.
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.
      /
      *****************************************************************
      **                 END OF PROGRAM CSOM9999                     **
      *****************************************************************
