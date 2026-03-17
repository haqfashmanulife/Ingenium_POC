      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM8082.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM8082                                         **
      **  REMARKS:  THIS MODULE PERFORMS THE RECORD UPDATE FUNCTION  **
      **            FOR THE BPFS TABLE                               **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
012624**  15DEC99  60     SECURITY ENHANCEMENTS                      **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
016227**  30jun00  602J   CODE CLEANUP                               **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM8082'.

       COPY SQLCA.

014590*COPY XCWL0030.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                 PIC X(04).
               88  WS-BUS-FCN-UPDATE         VALUE '8082'.
016227     05  WS-HOLD-BPFS-INFO             PIC X(85).
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
016227 COPY XCFWBPFT.
       COPY XCFWBPFS.
       COPY XCFRBPFS.
      /
       COPY XCFWXTAB.
       COPY XCFRXTAB.
      /
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      *****************************************************************
       COPY XCWL0280.
       COPY XCWL0290.
      /
      *****************
       LINKAGE SECTION.
      *****************

       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM8082.
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

               WHEN WS-BUS-FCN-UPDATE
                    PERFORM  2000-UPDATE
                        THRU 2000-UPDATE-X

               WHEN OTHER
      *MSG:  INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID
                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM8082'
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
      *-----------
       2000-UPDATE.
      *-----------
      *
      *  THE RECORD MUST EXIST ON A MAINTAIN
      *
           PERFORM  7000-BUILD-KEYS
               THRU 7000-BUILD-KEYS-X.

           PERFORM  BPFS-1000-READ-FOR-UPDATE
               THRU BPFS-1000-READ-FOR-UPDATE-X.

           IF  WBPFS-IO-NOT-FOUND
      *MSG: 'LOST RECORD (@1) IN MAINTAIN - CONTACT SYSTEMS'
               MOVE WBPFS-KEY      
                 TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000006'
                 TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-RQST-FAILED
                 TO TRUE
               GO TO 2000-UPDATE-X
           END-IF.
      *
      *  EDIT THE DATA ENTERED FOR THE RECORD 
      *
           PERFORM  8000-EDITS
               THRU 8000-EDITS-X.

           IF  WGLOB-MSG-ERROR-SW = ZERO
               PERFORM  9200-MOVE-RECORD-TO-MIR
                   THRU 9200-MOVE-RECORD-TO-MIR-X
           ELSE
               SET MIR-RETRN-EDIT-ERROR
                 TO TRUE
           END-IF.

           PERFORM  BPFS-2000-REWRITE
               THRU BPFS-2000-REWRITE-X.

           MOVE 'XS00000008'
             TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.

       2000-UPDATE-X.
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
      *--------------------
       8000-EDITS.
      *--------------------

           IF  MIR-BPF-SECUR-AUD-IND NOT = SPACE
               PERFORM  8100-EDIT-BPF-SECUR-AUD-IND
                   THRU 8100-EDIT-BPF-SECUR-AUD-IND-X
           END-IF.

           IF  MIR-MSG-SECUR-CLAS-CD NOT = SPACE
               PERFORM  8110-EDIT-MSG-SECUR-CLAS-CD
                   THRU 8110-EDIT-MSG-SECUR-CLAS-CD-X
           END-IF.

           IF  MIR-BPF-SECUR-GR-CD NOT = SPACE
               PERFORM  8120-EDIT-BPF-SECUR-GR-CD
                   THRU 8120-EDIT-BPF-SECUR-GR-CD-X
           END-IF.

           IF  MIR-BPF-SECUR-LVL-NUM NOT = SPACE
               PERFORM  8130-EDIT-BPF-SECUR-LVL-NUM
                   THRU 8130-EDIT-BPF-SECUR-LVL-NUM-X
           END-IF.

       8000-EDITS-X.
           EXIT.

      *----------------------------
       8100-EDIT-BPF-SECUR-AUD-IND.
      *----------------------------
       
           IF  MIR-BPF-SECUR-AUD-IND = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACES           TO MIR-BPF-SECUR-AUD-IND
           END-IF.
       
           IF  MIR-BPF-SECUR-AUD-IND = 'Y'
           OR  MIR-BPF-SECUR-AUD-IND = 'N'
           OR  MIR-BPF-SECUR-AUD-IND = SPACE
               MOVE MIR-BPF-SECUR-AUD-IND
                 TO RBPFS-BPF-SECUR-AUD-IND
           ELSE
      *MSG: AUDIT INDICATOR MUST BE Y, N OR SPACE
               MOVE 'XS80820001'     TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.
       
       8100-EDIT-BPF-SECUR-AUD-IND-X.
           EXIT.

      *----------------------------
       8110-EDIT-MSG-SECUR-CLAS-CD.
      *----------------------------
       
           IF  MIR-MSG-SECUR-CLAS-CD = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACES           TO MIR-MSG-SECUR-CLAS-CD
           END-IF.
       
           MOVE MIR-MSG-SECUR-CLAS-CD
             TO WXTAB-ETBL-VALU-ID.

           PERFORM  MSGC-1000-EDIT-MESSAGE-CLASS
               THRU MSGC-1000-EDIT-MESSAGE-CLASS-X.
       
           IF  WXTAB-IO-OK
               MOVE MIR-MSG-SECUR-CLAS-CD
                 TO RBPFS-MSG-SECUR-CLAS-CD
           ELSE
      *MSG: SECURITY CLASS CODE MUST EXIST ON XTAB/MSGC
               MOVE 'XS80820002'     TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.
       
       8110-EDIT-MSG-SECUR-CLAS-CD-X.
           EXIT.

      *----------------------------
       8120-EDIT-BPF-SECUR-GR-CD.
      *----------------------------
       
           IF  MIR-BPF-SECUR-GR-CD = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACES           TO MIR-BPF-SECUR-GR-CD
           END-IF.
       
           MOVE MIR-BPF-SECUR-GR-CD
             TO WXTAB-ETBL-VALU-ID.

           PERFORM  BPFG-1000-EDIT-BPFS-GROUP
               THRU BPFG-1000-EDIT-BPFS-GROUP-X.
       
           IF  WXTAB-IO-OK
               MOVE MIR-BPF-SECUR-GR-CD
                 TO RBPFS-BPF-SECUR-GR-CD
           ELSE
      *MSG: SECURITY GROUP CODE MUST EXIST ON XTAB/BPFGR
               MOVE 'XS80820003'     TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.
       
       8120-EDIT-BPF-SECUR-GR-CD-X.
           EXIT.

      *----------------------------
       8130-EDIT-BPF-SECUR-LVL-NUM.
      *----------------------------

           IF  MIR-BPF-SECUR-LVL-NUM = EBLCH-BLANK-FIELD-CHAR
               MOVE ZEROES           TO MIR-BPF-SECUR-LVL-NUM
           END-IF.

           SET L0280-SIGN-NOT-PERMITTED TO TRUE.
           MOVE 0                     TO L0280-PRECISION.
           MOVE 3                     TO L0280-LENGTH.
           MOVE 3                     TO L0280-INPUT-SIZE.
           MOVE MIR-BPF-SECUR-LVL-NUM TO L0280-INPUT-DATA.

           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X.

016227*    IF  L0280-OK
016227*         MOVE L0280-OUTPUT
016227*          TO RBPFS-BPF-SECUR-LVL-NUM
016227*    ELSE
016227     IF  NOT L0280-OK
      *MSG: SECURITY LEVEL MUST BE NUMERIC
               MOVE 'XS80820004'     TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

016227     MOVE RBPFS-REC-INFO            TO  WS-HOLD-BPFS-INFO.

016227     MOVE LOW-VALUES                TO  WBPFT-KEY.
016227     MOVE MIR-SECUR-CLAS-ID         TO  WBPFT-SECUR-CLAS-ID.
016227     MOVE MIR-BPF-SECUR-GR-CD       TO  WBPFT-BPF-SECUR-GR-CD.
016227     MOVE MIR-BPF-SECUR-LVL-NUM     TO  WBPFT-BPF-SECUR-LVL-NUM.

016227     MOVE WBPFT-KEY                 TO  WBPFT-ENDBR-KEY.
016227     MOVE HIGH-VALUES               TO  WBPFT-ENDBR-BPF-ID.

016227     PERFORM  BPFT-1000-BROWSE
016227         THRU BPFT-1000-BROWSE-X.

016227     IF  NOT WBPFT-IO-OK
016227         MOVE WS-HOLD-BPFS-INFO    TO  RBPFS-REC-INFO
016227         MOVE L0280-OUTPUT      TO RBPFS-BPF-SECUR-LVL-NUM
016227         GO TO 8130-EDIT-BPF-SECUR-LVL-NUM-X
016227     END-IF.

016227     PERFORM  BPFT-2000-READ-NEXT
016227         THRU BPFT-2000-READ-NEXT-X.

016227     MOVE WS-HOLD-BPFS-INFO         TO  RBPFS-REC-INFO.

016227     IF  WBPFT-IO-OK
016227*MSG: SECURITY LEVEL (@1) FOR SELECTED SECURITY CLASS/GROUP HAS
016227*     ALREADY EXISTED
016227         MOVE 'XS80820006'          TO  WGLOB-MSG-REF-INFO
016227         MOVE MIR-BPF-SECUR-LVL-NUM TO  WGLOB-MSG-PARM (01)
016227         PERFORM  0260-1000-GENERATE-MESSAGE
016227             THRU 0260-1000-GENERATE-MESSAGE-X
016227     ELSE
016227         MOVE L0280-OUTPUT       TO RBPFS-BPF-SECUR-LVL-NUM
016227     END-IF.

016227     PERFORM  BPFT-3000-END-BROWSE
016227         THRU BPFT-3000-END-BROWSE-X.
       8130-EDIT-BPF-SECUR-LVL-NUM-X.
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

           PERFORM  9000-BLANK-DATA-FIELDS
               THRU 9000-BLANK-DATA-FIELDS-X.

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
       COPY XCPEMSGC.
       COPY XCPEBPFG.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
       COPY XCCL0260.
       COPY XCPL0280.
       COPY XCPL0290.
       COPY XCPS0290.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
       COPY XCPUBPFS.
016227 COPY XCPBBPFT.
       COPY XCPNXTAB.
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.
      /
      *****************************************************************
      **                 END OF PROGRAM XSOM8082                     **
      *****************************************************************
