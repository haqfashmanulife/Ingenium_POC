      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM8070.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM8070                                         **
      **  REMARKS:  THIS MODULE PERFORMS TABLE RETRIEVE FUNCTION     **
      **            FOR THE TBFCN TABLE                              **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
012624**  15DEC99  60     NEW                                        **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM8070'.

       COPY SQLCA.

014590*COPY XCWL0030.

       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                 PIC X(04).
               88  WS-BUS-FCN-RETRIEVE       VALUE '8070'.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
       COPY XCWLDTLK.
       COPY XCWL1640.
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
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
       COPY XCWM8070.
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

               WHEN WS-BUS-FCN-RETRIEVE
                    PERFORM  2000-RETRIEVE
                        THRU 2000-RETRIEVE-X

               WHEN OTHER
      *MSG:  INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID
                                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM8070'   TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000000' TO WGLOB-MSG-REF-INFO
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
      *
           PERFORM  7000-BUILD-KEYS
               THRU 7000-BUILD-KEYS-X.

           PERFORM  9000-BLANK-DATA-FIELDS
               THRU 9000-BLANK-DATA-FIELDS-X.

           PERFORM  BFCN-1000-READ
               THRU BFCN-1000-READ-X.

           IF  WBFCN-IO-NOT-FOUND
      *MSG: RECORD @1 NOT FOUND
               MOVE WBFCN-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000001'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
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

           MOVE LOW-VALUES             TO WBFCN-KEY.
           MOVE MIR-DV-ENTR-BUS-FCN-ID TO WBFCN-BUS-FCN-ID.

       7000-BUILD-KEYS-X.
           EXIT.
      /
      *-----------------
       9000-BLANK-DATA-FIELDS.
      *-----------------

           MOVE SPACE                 TO MIR-BUS-FCN-CONN-IND.
           MOVE SPACE                 TO MIR-BUS-FCN-AUD-IND.
           MOVE SPACE                 TO MIR-BUS-FCN-PDRVR-ID.

       9000-BLANK-DATA-FIELDS-X.
           EXIT.
      /
      *--------------------------
       9200-MOVE-RECORD-TO-MIR.
      *--------------------------

           MOVE RBFCN-BUS-FCN-CONN-IND
                                      TO MIR-BUS-FCN-CONN-IND.

           MOVE RBFCN-BUS-FCN-AUD-IND TO MIR-BUS-FCN-AUD-IND.

           MOVE RBFCN-BUS-FCN-PDRVR-ID
                                      TO MIR-BUS-FCN-PDRVR-ID.

       9200-MOVE-RECORD-TO-MIR-X.
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
       COPY XCPNBFCN.

      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **              END OF PROGRAM XSOM8070 **
      *****************************************************************
