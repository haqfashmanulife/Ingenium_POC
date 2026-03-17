      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM4907.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM4907                                         **
      **  REMARKS:  THIS MODULE PERFORMS COUNTRY LOCATION RETRIEVAL. **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
      ** 15DEC99   60     NEW FOR COUNTRY LOCATION TABLE             **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM4907'.

       COPY SQLCA.

014590*COPY XCWL0030.

       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                 PIC X(04).
               88  WS-BUS-FCN-RETRIEVE       VALUE '4907'.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY CCFWEDIT.
       COPY CCFREDIT.
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
       COPY XCWM4907.
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
                    MOVE 'XSOM4907'
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

           PERFORM  7000-BUILD-KEYS
               THRU 7000-BUILD-KEYS-X.

           PERFORM  9000-BLANK-DATA-FIELDS
               THRU 9000-BLANK-DATA-FIELDS-X.

           PERFORM  CTLC-1000-READ
               THRU CTLC-1000-READ-X.

           IF  WCTLC-IO-NOT-FOUND
      *MSG: RECORD @1 NOT FOUND
               MOVE WCTLC-KEY
                 TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000001'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-RQST-FAILED
                 TO TRUE
               GO TO 2000-RETRIEVE-X
           END-IF.

           MOVE MIR-CTRY-LOC-CD        TO WEDIT-ETBL-VALU-ID.
           MOVE WGLOB-USER-LANG        TO WEDIT-ETBL-LANG-CD.
           MOVE 'LOCAT'                TO WEDIT-ETBL-TYP-ID.

           PERFORM  EDIT-1000-READ
               THRU EDIT-1000-READ-X.

           IF NOT WEDIT-IO-OK
               SET MIR-RETRN-RQST-FAILED
                 TO TRUE
               GO TO 2000-RETRIEVE-X
           END-IF.

      *
      *  MOVE RECORD INFORMATION TO THE MIR
      *
           PERFORM  9200-MOVE-RECORD-TO-MIR
               THRU 9200-MOVE-RECORD-TO-MIR-X.

       2000-RETRIEVE-X.
           EXIT.

      /
      *----------------
       7000-BUILD-KEYS.
      *----------------

           MOVE LOW-VALUES             TO WCTLC-KEY.
           MOVE MIR-CTRY-CD            TO WCTLC-CTRY-CD.
           MOVE WGLOB-COMPANY-CODE     TO WCTLC-CO-ID.
           MOVE MIR-CTRY-LOC-TYP-CD    TO WCTLC-CTRY-LOC-TYP-CD.
           MOVE MIR-CTRY-LOC-CD        TO WCTLC-CTRY-LOC-CD.

       7000-BUILD-KEYS-X.
           EXIT.
      /
      *-----------------------
       9000-BLANK-DATA-FIELDS.
      *-----------------------

           MOVE SPACES
             TO MIR-ETBL-DESC-TXT.

       9000-BLANK-DATA-FIELDS-X.
           EXIT.
      /
      *--------------------------
       9200-MOVE-RECORD-TO-MIR.
      *--------------------------

           MOVE REDIT-ETBL-DESC-TXT
             TO MIR-ETBL-DESC-TXT.

       9200-MOVE-RECORD-TO-MIR-X.
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
       COPY XCPNCTLC.

      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **              END OF PROGRAM XSOM4907                        **
      *****************************************************************
