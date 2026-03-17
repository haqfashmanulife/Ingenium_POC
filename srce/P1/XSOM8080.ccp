      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM8080.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM8080                                         **
      **  REMARKS:  THIS MODULE PERFORMS TABLE RETRIEVE FUNCTION     **
      **            FOR THE BPFS TABLE                               **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
012624**  15DEC99  60     SECURITY ENHANCEMENTS                      **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM8080'.

       COPY SQLCA.

014590*COPY XCWL0030.

       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                 PIC X(04).
               88  WS-BUS-FCN-RETRIEVE       VALUE '8080'.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY XCFWBPFS.
       COPY XCFRBPFS.
      /
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                          *
      *****************************************************************
       COPY XCWL0290.
      /
      *****************
       LINKAGE SECTION.
      *****************

       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM8080.
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
                    MOVE 'XSOM8080'
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

           PERFORM  BPFS-1000-READ
               THRU BPFS-1000-READ-X.

           IF  WBPFS-IO-NOT-FOUND
      *MSG: RECORD @1 NOT FOUND
               MOVE WBPFS-KEY
                 TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000001'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-RQST-FAILED
                 TO TRUE
               GO TO 2000-RETRIEVE-X
           END-IF.
      *
      *  MOVE RECORD INFORMATION TO THE MIR
      *
           PERFORM  9200-MOVE-RECORD-TO-MIR
               THRU 9200-MOVE-RECORD-TO-MIR-X.

           MOVE 'XS00000002'  
             TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.

       2000-RETRIEVE-X.
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
      *-----------------------
       9000-BLANK-DATA-FIELDS.
      *-----------------------

           MOVE SPACES
             TO MIR-BPF-SECUR-AUD-IND.
           MOVE SPACES
             TO MIR-MSG-SECUR-CLAS-CD.
           MOVE SPACES
             TO MIR-BPF-SECUR-GR-CD.
           MOVE SPACES
             TO MIR-BPF-SECUR-LVL-NUM.
     
       9000-BLANK-DATA-FIELDS-X.
           EXIT.
      /
      *--------------------------
       9200-MOVE-RECORD-TO-MIR.
      *--------------------------

           MOVE RBPFS-BPF-SECUR-AUD-IND
             TO MIR-BPF-SECUR-AUD-IND.
     
           MOVE RBPFS-MSG-SECUR-CLAS-CD
             TO MIR-MSG-SECUR-CLAS-CD.
     
           MOVE RBPFS-BPF-SECUR-GR-CD
             TO MIR-BPF-SECUR-GR-CD.
     
           PERFORM  0290-1000-BUILD-PARM-INFO
               THRU 0290-1000-BUILD-PARM-INFO-X.

           MOVE RBPFS-BPF-SECUR-LVL-NUM
             TO L0290-INPUT-NUMBER.
           MOVE ZERO                  
             TO L0290-PRECISION.
           MOVE LENGTH OF MIR-BPF-SECUR-LVL-NUM
             TO L0290-MAX-OUT-LEN.

           PERFORM  0290-1000-NUMERIC-FORMAT
              THRU  0290-1000-NUMERIC-FORMAT-X.

           MOVE L0290-OUTPUT-DATA   
             TO MIR-BPF-SECUR-LVL-NUM.
     
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
       COPY XCPL0290.
       COPY XCPS0290.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
       COPY XCPNBPFS.

      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **              END OF PROGRAM XSOM8080                        **
      *****************************************************************
