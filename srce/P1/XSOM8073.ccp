      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM8073.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM8073                                         **
      **  REMARKS:  THIS MODULE PERFORMS THE DELETE RECORD FUNCTION  **
      **            FOR THE BFCN TABLE                               **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM8073'.

       COPY SQLCA.

014590*COPY XCWL0030.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                    PIC X(04).
               88  WS-BUS-FCN-DELETE            VALUE '8073'.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
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
      *****************************************************************
      *  INPUT PARAMETER INFORMATION                                  *
      *****************************************************************
      /
      *****************
       LINKAGE SECTION.
      *****************

       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM8073.
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

           MOVE MIR-BUS-FCN-ID         TO WS-BUS-FCN-ID.
           SET MIR-RETRN-OK            TO TRUE.

      *
      *   CHECK ENTER CODE FOR FUNCTION REQUESTED
      *
           EVALUATE TRUE

               WHEN WS-BUS-FCN-DELETE
                    PERFORM  2000-DELETE
                        THRU 2000-DELETE-X

               WHEN OTHER
      *MSG:  INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID
                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM8073'
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
      *--------------
       2000-DELETE.
      *--------------
      *
      *  THE RECORD MUST EXIST ON A DELETE
      *
           PERFORM  7000-BUILD-KEYS
               THRU 7000-BUILD-KEYS-X.

           PERFORM  BFCN-1000-READ-FOR-UPDATE
               THRU BFCN-1000-READ-FOR-UPDATE-X.

           IF  WBFCN-IO-NOT-FOUND
      *MSG: 'RECORD (@1) ON TABLE (@2) NOT FOUND. DELETE FAILED'
               MOVE WBFCN-KEY
                 TO WGLOB-MSG-PARM (1)
               MOVE 'TBFCN'
                 TO WGLOB-MSG-PARM (2)
               MOVE 'XS00000010'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-DELETE-X
           END-IF.

      *
      *  DELETE THE RECORD
      *
           PERFORM  BFCN-1000-DELETE
               THRU BFCN-1000-DELETE-X.

           MOVE 'XS00000011'          TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.


       2000-DELETE-X.
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
       COPY XCPXBFCN.
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM XSOM8073
      *****************************************************************
