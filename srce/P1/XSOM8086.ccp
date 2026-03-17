      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM8086.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM8086                                         **
      **  REMARKS:  THIS MODULE PERFORMS TABLE LIST FUNCTION         **
      **            FOR THE BPFS TABLE (IN ORDER OF SECURITY GROUP   **
      **            AND SECURITY CLASS)                              **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
016213** 30JUN00   602J   ORIGINAL                                   **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM8086'.

       COPY SQLCA.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                PIC X(04).
               88  WS-BUS-FCN-LIST          VALUE '8086'.
           05  WS-SUB                       PIC S9(4) VALUE ZERO COMP.
           05  WS-MAX-LIST-LINES            PIC S9(4) VALUE 100  COMP.
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
       COPY XCFWBPFS.
       COPY XCFWBPFT.
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
       COPY XCWM8086.
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

           IF  MIR-BPF-ID = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACES               TO  MIR-BPF-ID
           END-IF.

           IF  MIR-SECUR-CLAS-ID  = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACES               TO  MIR-SECUR-CLAS-ID
           END-IF.

           IF  MIR-BPF-SECUR-GR-CD = EBLCH-BLANK-FIELD-CHAR
               MOVE SPACES               TO  MIR-BPF-SECUR-GR-CD
           END-IF.

           IF MIR-BPF-SECUR-LVL-NUM = EBLCH-BLANK-FIELD-CHAR
           OR MIR-BPF-SECUR-LVL-NUM = SPACES
              MOVE ZEROS                 TO  MIR-BPF-SECUR-LVL-NUM
           END-IF.

           EVALUATE TRUE

               WHEN WS-BUS-FCN-LIST
                    PERFORM  2000-LIST
                        THRU 2000-LIST-X

               WHEN OTHER
      *MSG:  INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID
                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM8086'
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
      *------------
       2000-LIST.
      *------------

           PERFORM  9000-BLANK-DATA-FIELDS
               THRU 9000-BLANK-DATA-FIELDS-X.

           PERFORM  7000-BUILD-KEYS
               THRU 7000-BUILD-KEYS-X.

           PERFORM  BPFT-1000-BROWSE
               THRU BPFT-1000-BROWSE-X.

           PERFORM  BPFT-2000-READ-NEXT
               THRU BPFT-2000-READ-NEXT-X.

           IF  WBPFT-IO-EOF
               PERFORM  BPFT-3000-END-BROWSE
                   THRU BPFT-3000-END-BROWSE-X
      *MSG: 'NO RECORDS FOUND TO DISPLAY'
               MOVE 'XS00000034'           TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-RQST-FAILED
                 TO TRUE
               GO TO 2000-LIST-X
           END-IF.

           PERFORM  2010-BROWSE-BPFT
               THRU 2010-BROWSE-BPFT-X
               VARYING WS-SUB FROM 1 BY 1
               UNTIL   WS-SUB > WS-MAX-LIST-LINES
               OR      WBPFT-IO-EOF.

           IF  WBPFT-IO-EOF
      *MSG:    MESSAGE "** END OF LIST **"
               MOVE 'XS00000015'
                 TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
               SET WGLOB-MORE-DATA-EXISTS
                 TO TRUE
      *MSG:    MESSAGE "** TO VIEW MORE DATA PRESS ENTER **"
               MOVE 'XS00000014'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               MOVE RBPFS-SECUR-CLAS-ID
                 TO MIR-SECUR-CLAS-ID
               MOVE RBPFS-BPF-ID
                 TO MIR-BPF-ID
               MOVE RBPFS-BPF-SECUR-GR-CD
                 TO MIR-BPF-SECUR-GR-CD
               MOVE RBPFS-BPF-SECUR-LVL-NUM
                 TO MIR-BPF-SECUR-LVL-NUM
           END-IF.

           PERFORM  BPFT-3000-END-BROWSE
               THRU BPFT-3000-END-BROWSE-X.

       2000-LIST-X.
           EXIT.


      *-----------------
       2010-BROWSE-BPFT.
      *-----------------

           PERFORM  9200-MOVE-RECORD-TO-SCREEN
               THRU 9200-MOVE-RECORD-TO-SCREEN-X.

           PERFORM  BPFT-2000-READ-NEXT
               THRU BPFT-2000-READ-NEXT-X.

       2010-BROWSE-BPFT-X.
           EXIT.
      /
      *----------------
       7000-BUILD-KEYS.
      *----------------

           MOVE LOW-VALUES            TO WBPFT-KEY.
           MOVE MIR-SECUR-CLAS-ID     TO WBPFT-SECUR-CLAS-ID.
           MOVE MIR-BPF-SECUR-GR-CD   TO WBPFT-BPF-SECUR-GR-CD.
           MOVE MIR-BPF-SECUR-LVL-NUM TO WBPFT-BPF-SECUR-LVL-NUM.

           MOVE HIGH-VALUES           TO WBPFT-ENDBR-KEY.
           MOVE WBPFT-SECUR-CLAS-ID   TO WBPFT-ENDBR-SECUR-CLAS-ID.
           MOVE +999                  TO WBPFT-ENDBR-BPF-SECUR-LVL-NUM.

       7000-BUILD-KEYS-X.
           EXIT.

      /

      *-----------------------
       9000-BLANK-DATA-FIELDS.
      *-----------------------

           MOVE SPACES
             TO MIR-SECUR-CLAS-ID-G.
           MOVE SPACES
             TO MIR-BPF-ID-G.
           MOVE SPACES
             TO MIR-BPF-SECUR-AUD-IND-G.
           MOVE SPACES
             TO MIR-MSG-SECUR-CLAS-CD-G.
           MOVE SPACES
             TO MIR-BPF-SECUR-GR-CD-1-G.
           MOVE SPACES
             TO MIR-BPF-SECUR-GR-CD-2-G.
           MOVE SPACES
             TO MIR-BPF-SECUR-LVL-NUM-G.

       9000-BLANK-DATA-FIELDS-X.
           EXIT.

      /
      *---------------------------
       9200-MOVE-RECORD-TO-SCREEN.
      *---------------------------

           MOVE RBPFS-SECUR-CLAS-ID
             TO MIR-SECUR-CLAS-ID-T (WS-SUB).

           MOVE RBPFS-BPF-ID
             TO MIR-BPF-ID-T (WS-SUB).

           MOVE RBPFS-BPF-SECUR-AUD-IND
             TO MIR-BPF-SECUR-AUD-IND-T (WS-SUB).

           MOVE RBPFS-MSG-SECUR-CLAS-CD
             TO MIR-MSG-SECUR-CLAS-CD-T (WS-SUB).

           MOVE RBPFS-BPF-SECUR-GR-CD
             TO MIR-BPF-SECUR-GR-CD-1-T (WS-SUB).

           MOVE RBPFS-BPF-SECUR-GR-CD
             TO MIR-BPF-SECUR-GR-CD-2-T (WS-SUB).

           PERFORM  0290-1000-BUILD-PARM-INFO
               THRU 0290-1000-BUILD-PARM-INFO-X.

           MOVE RBPFS-BPF-SECUR-LVL-NUM
             TO L0290-INPUT-NUMBER.
           MOVE ZERO
             TO L0290-PRECISION.
           MOVE LENGTH OF MIR-BPF-SECUR-LVL-NUM-T (WS-SUB)
             TO L0290-MAX-OUT-LEN.

           PERFORM  0290-1000-NUMERIC-FORMAT
              THRU  0290-1000-NUMERIC-FORMAT-X.

           MOVE L0290-OUTPUT-DATA
             TO MIR-BPF-SECUR-LVL-NUM-T (WS-SUB).

       9200-MOVE-RECORD-TO-SCREEN-X.
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
       COPY XCPBBPFT.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM XSOM8086                     **
      *****************************************************************
