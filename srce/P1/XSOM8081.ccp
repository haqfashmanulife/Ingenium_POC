      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM8081.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM8081                                         **
      **  REMARKS:  THIS MODULE PERFORMS THE TABLE CREATE FUNCTION   **
      **            FOR THE BPFS TABLE                               **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
012624**  15DEC99  60     SECURITY ENHANCEMENTS                      **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
016221**  30JUN00  602J   SYSTEM SECURITY EDIT                       **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM8081'.

       COPY SQLCA.

014590*COPY XCWL0030.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                    PIC X(04).
               88  WS-BUS-FCN-CREATE            VALUE '8081'.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
      /
       COPY XCFWBPFL.
       COPY XCFRBPFL.
      /
       COPY XCFWBPFS.
       COPY XCFRBPFS.
      /
016221 COPY XCFWASCL.
016221 COPY XCFRASCL.
016221/
       COPY XCFWUSCL.
       COPY XCFRUSCL.
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
       COPY XCWM8081.
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

               WHEN WS-BUS-FCN-CREATE
                    PERFORM  2000-CREATE
                        THRU 2000-CREATE-X

               WHEN OTHER
      *MSG:  INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID
                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM8081'
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
      *------------
       2000-CREATE.
      *------------
      *
      *  THE RECORD SHOULD NOT EXIST ON A CREATE
      *
           PERFORM  7000-BUILD-KEYS
               THRU 7000-BUILD-KEYS-X.

           PERFORM  2100-VALIDATE-KEYS
               THRU 2100-VALIDATE-KEYS-X.

           IF  WGLOB-MSG-ERROR-SW > ZERO
               SET MIR-RETRN-RQST-FAILED
                 TO TRUE
               GO TO 2000-CREATE-X
           END-IF.

           PERFORM  BPFS-2000-READ-INDEX
               THRU BPFS-2000-READ-INDEX-X.

           IF  WBPFS-IO-OK
      *MSG: 'RECORD @1 ALREADY EXISTS'
               MOVE WBPFS-KEY
                 TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000003'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-CREATE-X
           END-IF.
      *
      *  CREATE THE NEW RECORD 
      *
           PERFORM  BPFS-1000-CREATE
               THRU BPFS-1000-CREATE-X.

           PERFORM  BPFS-1000-WRITE
               THRU BPFS-1000-WRITE-X.

           MOVE 'XS00000004'
             TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

            
       2000-CREATE-X.
           EXIT.
      /

      *--------------------
       2100-VALIDATE-KEYS.
      *--------------------

           PERFORM  4110-EDIT-SECUR-CLAS-ID
               THRU 4110-EDIT-SECUR-CLAS-ID-X.
     
016221     PERFORM  4115-EDIT-SYS-SECUR-CLAS-ID
016221         THRU 4115-EDIT-SYS-SECUR-CLAS-ID-X.
           
           PERFORM  4120-EDIT-BPF-ID
               THRU 4120-EDIT-BPF-ID-X.
     
       2100-VALIDATE-KEYS-X.
           EXIT.
      /


      *------------------------
       4110-EDIT-SECUR-CLAS-ID.
      *------------------------
     
           IF  MIR-SECUR-CLAS-ID = SPACES
      *MSG: SECURITY CLASS MUST BE ENTERED
               MOVE 'XS80810001'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4110-EDIT-SECUR-CLAS-ID-X
           END-IF.
    
           MOVE MIR-SECUR-CLAS-ID
             TO WUSCL-SECUR-CLAS-ID.
    
           PERFORM  USCL-2000-READ-INDEX
               THRU USCL-2000-READ-INDEX-X.

           IF  WUSCL-IO-OK
               CONTINUE
           ELSE
      *MSG: SECURITY CLASS (@1) DOES NOT EXIST
               MOVE MIR-SECUR-CLAS-ID
                 TO WGLOB-MSG-PARM (1)
               MOVE 'XS80810002'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4110-EDIT-SECUR-CLAS-ID-X
           END-IF.
    
       4110-EDIT-SECUR-CLAS-ID-X.
           EXIT.
      /
    
016221*----------------------------
016221 4115-EDIT-SYS-SECUR-CLAS-ID.
016221*----------------------------
016221
016221     MOVE MIR-SECUR-CLAS-ID        TO WASCL-SECUR-CLAS-ID
016221     MOVE WGLOB-COMPANY-CODE       TO WASCL-CO-ID
016221
016221     PERFORM ASCL-1000-READ
016221        THRU ASCL-1000-READ-X.
016221
016221     IF NOT WASCL-IO-OK
016221         MOVE MIR-SECUR-CLAS-ID    TO WGLOB-MSG-PARM (1)
016221         MOVE 'XS80810005'         TO WGLOB-MSG-REF-INFO
016221         PERFORM 0260-1000-GENERATE-MESSAGE
016221            THRU 0260-1000-GENERATE-MESSAGE-X
016221     END-IF.
016221
016221
016221 4115-EDIT-SYS-SECUR-CLAS-ID-X.
016221     EXIT.
    
      *-----------------
       4120-EDIT-BPF-ID.
      *-----------------
     
           IF  MIR-BPF-ID = SPACES
      *MSG: BUSINESS PROCESS FLOW MUST BE ENTERED
               MOVE 'XS80810003'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4120-EDIT-BPF-ID-X
           END-IF.
    
           MOVE MIR-BPF-ID
             TO WBPFL-BPF-ID.
    
           PERFORM  BPFL-2000-READ-INDEX
               THRU BPFL-2000-READ-INDEX-X.

           IF  WBPFL-IO-OK
               CONTINUE
           ELSE
      *MSG: BUSINESS PROCESS FLOW (@1) DOES NOT EXIST
               MOVE MIR-BPF-ID
                 TO WGLOB-MSG-PARM (1)
               MOVE 'XS80810004'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4120-EDIT-BPF-ID-X
           END-IF.
    
       4120-EDIT-BPF-ID-X.
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
       COPY XCPNBPFL.
       COPY XCPABPFS.
       COPY XCPNBPFS.
       COPY XCPCBPFS.
016221 COPY XCPBASCL.
016221 COPY XCPNASCL.
       COPY XCPNUSCL.
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **              END OF PROGRAM XSOM8081                        **
      *****************************************************************
