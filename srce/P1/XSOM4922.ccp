      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM4922.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM4922                                         **
      **  REMARKS:  THIS MODULE RETRIEVES ALL OF THE CURRENCY        **
      **            FORMATTING ATTRIBUTES FOR A GIVEN CURRENCY CODE  **
      **                                                             **
      **  DOMAIN :  SY                                               **
      *****************************************************************
      **  RELEASE   DESCRIPTION                                      **
      **                                                             **
020116**  2.2       MULTI-CURRENCY FUND PROCESSING                   **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM4922'.

       COPY SQLCA.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                     PIC X(04).
               88  WS-BUS-FCN-RETRIEVE           VALUE '4922'.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY XCFWCRCY.
       COPY XCFRCRCY.
      /
       COPY XCFWXTAB.
       COPY XCFRXTAB.
      /
       COPY XCWL0290.
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
       COPY XCWM4922.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                MIR-PARM-AREA.
      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  ABND-1000-HANDLE-ABEND
               THRU ABND-1000-HANDLE-ABEND-X.

           PERFORM  9990-INIT-WORKING-STORAGE
               THRU 9990-INIT-WORKING-STORAGE-X.

           PERFORM  INIT-1000-INITIALIZE
               THRU INIT-1000-INITIALIZE-X.

           PERFORM  1000-PROCESS-REQUEST
               THRU 1000-PROCESS-REQUEST-X.

           PERFORM  EXIT-1000-FINALIZE
               THRU EXIT-1000-FINALIZE-X.

       0000-MAINLINE-X.
           GOBACK.
      /
      *---------------------
       1000-PROCESS-REQUEST.
      *---------------------

           PERFORM  9300-SETUP-MSIN-REFERENCE
               THRU 9300-SETUP-MSIN-REFERENCE-X.
      *
      *   CHECK ENTER CODE FOR FUNCTION REQUESTED
      *
           SET MIR-RETRN-OK                       TO TRUE.
           MOVE MIR-BUS-FCN-ID                    TO WS-BUS-FCN-ID.

           EVALUATE TRUE

               WHEN WS-BUS-FCN-RETRIEVE
                    PERFORM  2000-RETRIEVE
                        THRU 2000-RETRIEVE-X

               WHEN OTHER
      *MSG: INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID           TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM4922'               TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000237'             TO WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET MIR-RETRN-INVALD-RQST TO TRUE

           END-EVALUATE.

       1000-PROCESS-REQUEST-X.
           EXIT.
      /
      *--------------
       2000-RETRIEVE.
      *--------------

           PERFORM  9000-BLANK-DATA-FIELDS
               THRU 9000-BLANK-DATA-FIELDS-X.

           PERFORM  0290-1000-BUILD-PARM-INFO
               THRU 0290-1000-BUILD-PARM-INFO-X.

           MOVE MIR-CO-ID                       TO WCRCY-CO-ID.
           MOVE MIR-CRCY-CD                     TO WCRCY-CRCY-CD.

           PERFORM  CRCY-1000-READ
               THRU CRCY-1000-READ-X.

           IF  WCRCY-IO-OK
               PERFORM  8000-MOVE-RECORD-TO-MIR
                   THRU 8000-MOVE-RECORD-TO-MIR-X
           ELSE
      *MSG: CURRENCY RECORD (@1) NOT FOUND
               MOVE 'XS49220001'                TO WGLOB-MSG-REF-INFO
               MOVE MIR-CRCY-CD                 TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-RQST-FAILED        TO TRUE
               GO TO 2000-RETRIEVE-X
           END-IF.

       2000-RETRIEVE-X.
           EXIT.
      /
      *------------------------
       8000-MOVE-RECORD-TO-MIR.
      *------------------------

      *
      *  TRANSLATE THE CURRENCY SYMBOL FROM IDENTIFIER TO THE ACTUAL
      *  CODE FOR DISPLAY
      *
           MOVE RCRCY-CRCY-SYMBL-CD          TO WXTAB-ETBL-VALU-ID.
           MOVE 'CSYMB'                      TO WXTAB-ETBL-TYP-ID.
           MOVE MIR-LANG-CD                  TO WXTAB-ETBL-LANG-CD.

           PERFORM  XTAB-1000-READ
               THRU XTAB-1000-READ-X.

           IF  NOT WXTAB-IO-OK
      *MSG: RECORD @1 NOT FOUND
               MOVE WXTAB-KEY                TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000001'             TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
               MOVE RXTAB-ETBL-DESC-TXT      TO MIR-CRCY-SYMBL-CD
           END-IF.

           MOVE RCRCY-CRCY-THOU-SPRT-CD      TO MIR-CRCY-THOU-SPRT-CD.
           MOVE RCRCY-CRCY-DCML-SPRT-CD      TO MIR-CRCY-DCML-SPRT-CD.
           MOVE RCRCY-CRCY-NEG-PLACE-CD      TO MIR-CRCY-NEG-PLACE-CD.
           MOVE RCRCY-CRCY-PLACE-CD          TO MIR-CRCY-PLACE-CD.

           COMPUTE L0290-INPUT-NUMBER = RCRCY-CRCY-SCALE-QTY.
           MOVE ZERO                         TO L0290-PRECISION.
           MOVE LENGTH OF MIR-CRCY-SCALE-QTY TO L0290-MAX-OUT-LEN.

           PERFORM  0290-1000-NUMERIC-FORMAT
               THRU 0290-1000-NUMERIC-FORMAT-X.

           MOVE L0290-OUTPUT-DATA            TO MIR-CRCY-SCALE-QTY.

       8000-MOVE-RECORD-TO-MIR-X.
           EXIT.

      *-----------------------
       9000-BLANK-DATA-FIELDS.
      *-----------------------

           MOVE SPACES                       TO MIR-OUTPUT-AREA.

       9000-BLANK-DATA-FIELDS-X.
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
      *--------------------------
       9990-INIT-WORKING-STORAGE.
      *--------------------------

           INITIALIZE WS-WORKING-STORAGE.

       9990-INIT-WORKING-STORAGE-X.
           EXIT.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************
      /
       COPY XCPPINIT.
       COPY XCPPEXIT.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
      /
       COPY XCPL0260.
      /
       COPY XCPS0290.
       COPY XCPL0290.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
       COPY XCPNCRCY.
      /
       COPY XCPNXTAB.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM XSOM4922                     **
      *****************************************************************
