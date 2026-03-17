      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM8085.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM8085                                         **
      **  REMARKS:  THIS MODULE PERFORMS COPY FUNCTION TO KLON       **
      **            BPFS INFORMATION OF DIFFERENT SECURITY CLASS     **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
016207** 30JUN00   602J   ORIGINAL                                   **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM8085'.

       COPY SQLCA.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID              PIC X(04).
               88  WS-BUS-FCN-KLONE       VALUE '8085'.
           05  WS-SUB                     PIC S9(04) VALUE ZERO COMP.
           05  WS-KLONE-CNT               PIC S9(04) COMP.
           05  WS-KLONE-CNT-NOTIN-ASCL    PIC S9(04) COMP.
           05  WS-HOLD-BPFS-KEY           PIC X(27).
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
       COPY XCWEBLCH.
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
      /
       COPY XCFWASCL.
       COPY XCFRASCL.
      /
       COPY XCFWUSCL.
       COPY XCFRUSCL.
      /
       COPY XCFWBPFS.
       COPY XCFRBPFS.
      /
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      *****************************************************************
       COPY XCWL0290.
      /
      *****************
       LINKAGE SECTION.
      *****************

       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM8085.
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

               WHEN WS-BUS-FCN-KLONE
                    PERFORM  2000-PROCESS-KLONE
                        THRU 2000-PROCESS-KLONE-X

               WHEN OTHER
      *MSG:  INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID
                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM8085'
                      TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000237'
                      TO WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET  MIR-RETRN-INVALD-RQST
                      TO TRUE

           END-EVALUATE.

       1000-PROCESS-REQUEST-X.
           EXIT.
      /
      *------------------
       2000-PROCESS-KLONE.
      *------------------

           PERFORM  7000-KLONE-SRCE-EDIT
               THRU 7000-KLONE-SRCE-EDIT-X.

           IF  WGLOB-MSG-ERROR-SW > ZEROS
               MOVE 'XS00000034'      TO WGLOB-MSG-REF-INFO
      * MSG: RECORD(S) NOT CLONED
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO  2000-PROCESS-KLONE-X
           END-IF.

           PERFORM  7200-KLONE-DEST-EDIT
               THRU 7200-KLONE-DEST-EDIT-X.

           IF WGLOB-MSG-ERROR-SW > ZEROS
               MOVE 'XS00000034'      TO WGLOB-MSG-REF-INFO
      * MSG: RECORD(S) NOT CLONED
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-PROCESS-KLONE-X
           END-IF.

           MOVE LOW-VALUES            TO WBPFS-KEY.
           MOVE MIR-SECUR-CLAS-ID-1   TO WBPFS-SECUR-CLAS-ID

           MOVE HIGH-VALUES           TO WBPFS-ENDBR-KEY.
           MOVE MIR-SECUR-CLAS-ID-1   TO WBPFS-ENDBR-SECUR-CLAS-ID.
      *

           PERFORM  BPFS-1000-BROWSE
               THRU BPFS-1000-BROWSE-X.

           IF  NOT WBPFS-IO-OK
           OR  WBPFS-IO-EOF
               PERFORM  BPFS-3000-END-BROWSE
                   THRU BPFS-3000-END-BROWSE-X
      *MSG: 'NO RECORDS FOUND FOR COPY'
               MOVE 'XS80850005'           TO  WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-RQST-FAILED   TO  TRUE
               GO TO 2000-PROCESS-KLONE-X
           END-IF.

           PERFORM  BPFS-2000-READ-NEXT
               THRU BPFS-2000-READ-NEXT-X.

           IF  NOT WBPFS-IO-OK
           OR  WBPFS-IO-EOF
               PERFORM  BPFS-3000-END-BROWSE
                   THRU BPFS-3000-END-BROWSE-X
      *MSG: 'NO RECORDS FOUND FOR COPY'
               MOVE 'XS80850005'           TO  WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-RQST-FAILED   TO  TRUE
               GO TO 2000-PROCESS-KLONE-X
           END-IF.

           MOVE ZEROS                     TO  WS-KLONE-CNT.
           MOVE ZEROS                     TO  WS-KLONE-CNT-NOTIN-ASCL.
           
           PERFORM  2200-KLONE-RECORD
               THRU 2200-KLONE-RECORD-X
               VARYING WS-SUB FROM 1 BY 1
               UNTIL   WBPFS-IO-EOF
               OR  NOT WBPFS-IO-OK.

           PERFORM  BPFS-3000-END-BROWSE
               THRU BPFS-3000-END-BROWSE-X.

           
           IF WGLOB-MSG-ERROR-SW = ZEROS
      *MSG:  '@1 RECORD(S) IS/ARE CLONED
              MOVE WS-KLONE-CNT       TO WGLOB-MSG-PARM (1)
              MOVE 'XS80850006'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       2000-PROCESS-KLONE-X.
           EXIT.
      /
      *-----------------
       2200-KLONE-RECORD.
      *-----------------

           
           MOVE RBPFS-KEY                TO  WS-HOLD-BPFS-KEY.

           MOVE MIR-SECUR-CLAS-ID-2      TO  WBPFS-SECUR-CLAS-ID.
           MOVE MIR-SECUR-CLAS-ID-2      TO  RBPFS-SECUR-CLAS-ID.

           PERFORM  BPFS-1000-WRITE
               THRU BPFS-1000-WRITE-X.

           IF  WBPFS-IO-OK
               ADD  +1                   TO  WS-KLONE-CNT
           END-IF.

           MOVE WS-HOLD-BPFS-KEY         TO  WBPFS-KEY.

           PERFORM  BPFS-2000-READ-NEXT
               THRU BPFS-2000-READ-NEXT-X.

       2200-KLONE-RECORD-X.
           EXIT.
      /
      *--------------------
       7000-KLONE-SRCE-EDIT.
      *--------------------

           IF  MIR-SECUR-CLAS-ID-1 = SPACES
           OR  MIR-SECUR-CLAS-ID-1 = EBLCH-BLANK-FIELD-CHAR
      *MSG: SOURCE SECURITY CLASS IS REQUIRED
               MOVE 'XS80850001'       TO  WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 7000-KLONE-SRCE-EDIT-X
           END-IF.

           MOVE LOW-VALUES             TO WBPFS-KEY.
           MOVE MIR-SECUR-CLAS-ID-1    TO WBPFS-SECUR-CLAS-ID.
           MOVE HIGH-VALUES            TO WBPFS-ENDBR-KEY.
           MOVE MIR-SECUR-CLAS-ID-1    TO WBPFS-ENDBR-SECUR-CLAS-ID.

           PERFORM  BPFS-1000-BROWSE
               THRU BPFS-1000-BROWSE-X.

           IF NOT WBPFS-IO-OK
           OR WBPFS-IO-EOF
      *MSG:  KLONE SOURCE INFORMATION DOES NOT EXIST
              MOVE 'XS80850002'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM  BPFS-3000-END-BROWSE
                  THRU BPFS-3000-END-BROWSE-X
              GO TO 7000-KLONE-SRCE-EDIT-X
           END-IF.

           PERFORM  BPFS-2000-READ-NEXT
               THRU BPFS-2000-READ-NEXT-X

           IF NOT WBPFS-IO-OK
           OR WBPFS-IO-EOF
      *MSG:  KLONE SOURCE INFORMATION DOES NOT EXIST
              MOVE 'XS80850002'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM  BPFS-3000-END-BROWSE
                  THRU BPFS-3000-END-BROWSE-X
              GO TO 7000-KLONE-SRCE-EDIT-X
           END-IF.

           PERFORM  BPFS-3000-END-BROWSE
               THRU BPFS-3000-END-BROWSE-X.

           MOVE WGLOB-COMPANY-CODE     TO WASCL-CO-ID.
           MOVE MIR-SECUR-CLAS-ID-1    TO WASCL-SECUR-CLAS-ID.

           MOVE MIR-SECUR-CLAS-ID-1    TO WUSCL-SECUR-CLAS-ID.
           
           MOVE MIR-SECUR-CLAS-ID-1    TO WGLOB-MSG-PARM (1).
           
           PERFORM 7300-SECURITY-EDIT
              THRU 7300-SECURITY-EDIT-X.
       
       7000-KLONE-SRCE-EDIT-X.
           EXIT.
      /
      *---------------------
       7200-KLONE-DEST-EDIT.
      *---------------------

           IF  MIR-SECUR-CLAS-ID-2 = SPACES
           OR  MIR-SECUR-CLAS-ID-2 = EBLCH-BLANK-FIELD-CHAR
      *MSG: DESTINATIION SECURITY CLASS IS REQUIRED
               MOVE 'XS80850003'       TO  WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 7200-KLONE-DEST-EDIT-X
           END-IF.

           MOVE LOW-VALUES             TO WBPFS-KEY.
           MOVE MIR-SECUR-CLAS-ID-2    TO WBPFS-SECUR-CLAS-ID.
           MOVE HIGH-VALUES            TO WBPFS-ENDBR-KEY.
           MOVE MIR-SECUR-CLAS-ID-2    TO WBPFS-ENDBR-SECUR-CLAS-ID.

           PERFORM  BPFS-1000-BROWSE
               THRU BPFS-1000-BROWSE-X.

           IF NOT WBPFS-IO-OK
           OR WBPFS-IO-EOF
              GO TO 7200-KLONE-DEST-EDIT-X
           END-IF.

           PERFORM  BPFS-2000-READ-NEXT
               THRU BPFS-2000-READ-NEXT-X.

           IF WBPFS-IO-OK
      *MSG:  KLONE DESTINATION INFORMATION DOES ALREADY EXIST
              MOVE 'XS80850004'       TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           PERFORM  BPFS-3000-END-BROWSE
               THRU BPFS-3000-END-BROWSE-X.

           MOVE WGLOB-COMPANY-CODE     TO WASCL-CO-ID.
           MOVE MIR-SECUR-CLAS-ID-2    TO WASCL-SECUR-CLAS-ID.
           
           MOVE MIR-SECUR-CLAS-ID-2    TO WUSCL-SECUR-CLAS-ID.
           
           MOVE MIR-SECUR-CLAS-ID-2    TO WGLOB-MSG-PARM (1).
           
           PERFORM 7300-SECURITY-EDIT
              THRU 7300-SECURITY-EDIT-X.
       
       7200-KLONE-DEST-EDIT-X.
           EXIT.
      /
      *---------------------
       7300-SECURITY-EDIT.
      *---------------------
      
      *===VALIDATE SECURITY CLASS ID
      
           PERFORM  USCL-2000-READ-INDEX
               THRU USCL-2000-READ-INDEX-X.
           
           IF  WUSCL-IO-OK
               CONTINUE
           ELSE
      *MSG: SECURITY CLASS (@1) DOES NOT EXIST
               MOVE 'XS80850008'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 7300-SECURITY-EDIT-X 
           END-IF.
      
      
      *
      *==== VALIDATE SYSTEM SECURITY CLASS
      *
      *
           PERFORM ASCL-1000-READ  
              THRU ASCL-1000-READ-X.
           
           IF NOT WASCL-IO-OK
               MOVE 'XS80850007'         TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 7300-SECURITY-EDIT-X 
           END-IF.
           

       7300-SECURITY-EDIT-X.
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
       COPY XCPABPFS.
       COPY XCPBASCL.
      / 
       COPY XCPNASCL.
       COPY XCPNUSCL.
       COPY XCPBBPFS.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM XSOM8085                     **
      *****************************************************************
