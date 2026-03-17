      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM8083.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM8083                                         **
      **  REMARKS:  THIS MODULE PERFORMS THE DELETE RECORD FUNCTION  **
      **            FOR THE BPFS TABLE                               **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
012624** 15DEC99   60     SECURITY ENHANCEMENTS                      **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM8083'.

       COPY SQLCA.

014590*COPY XCWL0030.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                    PIC X(04).
               88  WS-BUS-FCN-DELETE            VALUE '8083'.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
      /
       COPY XCFWBPFS.
       COPY XCFRBPFS.
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
       COPY XCWM8083.
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
                    MOVE 'XSOM8083'
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

           PERFORM  BPFS-1000-READ-FOR-UPDATE
               THRU BPFS-1000-READ-FOR-UPDATE-X.

           IF  WBPFS-IO-NOT-FOUND
      *MSG: 'RECORD (@1) on table (@2) not found. Delete failed'
               MOVE WBPFS-KEY
                 TO WGLOB-MSG-PARM (1)
               MOVE 'TBPFS'
                 TO WGLOB-MSG-PARM (2)
               MOVE 'XS00000010'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-RQST-FAILED
                 TO TRUE
               GO TO 2000-DELETE-X
           END-IF.

      *
      *  DELETE THE RECORD 
      *
           PERFORM  BPFS-1000-DELETE
               THRU BPFS-1000-DELETE-X.

           MOVE 'XS00000011'  
             TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.


       2000-DELETE-X.
           EXIT.
      /
      *----------------
       7000-BUILD-KEYS.
      *----------------

           MOVE LOW-VALUES             TO WBPFS-KEY.
           MOVE MIR-SECUR-CLAS-ID      TO WBPFS-SECUR-CLAS-ID.
           MOVE MIR-BPF-ID             TO WBPFS-BPF-ID.

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
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
       COPY XCCL0260.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
       COPY XCPUBPFS.
       COPY XCPXBPFS.
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM XSOM8083                     **
      *****************************************************************
