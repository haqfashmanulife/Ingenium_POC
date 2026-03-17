
      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM4906.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM4906                                         **
      **  REMARKS:  THIS MODULE PERFORMS TABLE LIST FUNCTION         **
      **            FOR THE BPFS TABLE USING ALT. ACCESS BPFT        **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
015375**  15DEC99  60     NAVIGATION                                 **
015543**  15DEC99  60     CODE CLEANUP                               **
PF 1.2**           612J   UPGRADE TO PATHFINDER 1.2                  **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM4906'.

       COPY SQLCA.

014590*COPY XCWL0030.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                       PIC X(04).
               88  WS-BUS-FCN-LIST                 VALUE '4906'.
           05  WS-SUB                              PIC S9(04) COMP SYNC.
           05  WS-MAX-LIST-LINES                   PIC 9(03) VALUE 500.
           05  WS-BPFT-RETRN-CD                    PIC X(02).
               88  WS-BPFT-RETRN-OK                VALUE '00'.
               88  WS-BPFT-RETRN-ERROR             VALUE '99'.
           05  WS-MORE-DATA-EXISTS-SW              PIC X(01).
               88  WS-MORE-DATA-EXISTS-YES         VALUE 'Y'.
               88  WS-MORE-DATA-EXISTS-NO          VALUE 'N'.
           05  WS-SECUR-LVL-NUM                    PIC X(03).
           05  WS-SECUR-LVL-NUM-N                  REDEFINES
               WS-SECUR-LVL-NUM                    PIC 9(03).
           05  WS-PREV-SECUR-GR-CD                 PIC X(15).
PF 1.2 01  WS-MENU-SUPPRESS-GROUP-CD               PIC X(15).
PF 1.2
PF 1.2     88  WS-MENU-SUPPRESS-GROUP VALUE  '99999          '.
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
       COPY XCWWWKDT.
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
      /
       COPY XCFWBPFT.
       COPY XCFRBPFS.
      /
       COPY XCFRXTAB.
       COPY XCFWXTAB.
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      *****************************************************************
       COPY XCWLDTLK.
      /
      *****************
       LINKAGE SECTION.
      *****************

       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM4906.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                MIR-PARM-AREA.
      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  ABND-1000-HANDLE-ABEND
               THRU ABND-1000-HANDLE-ABEND-X.

           PERFORM  INIT-1000-INITIALIZE
               THRU INIT-1000-INITIALIZE-X.

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
PF 1.2     SET WS-MENU-SUPPRESS-GROUP TO TRUE.

           PERFORM  9300-SETUP-MSIN-REFERENCE
               THRU 9300-SETUP-MSIN-REFERENCE-X.

           MOVE MIR-BUS-FCN-ID
              TO WS-BUS-FCN-ID.

           EVALUATE TRUE

               WHEN WS-BUS-FCN-LIST
                    PERFORM  2000-LIST
                        THRU 2000-LIST-X
               WHEN OTHER
      *MSG:  INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID  TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM4906'      TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000237'    TO WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET  MIR-RETRN-INVALD-RQST TO TRUE

           END-EVALUATE.

       1000-PROCESS-REQUEST-X.
           EXIT.

      /
      *------------
       2000-LIST.
      *------------


           PERFORM  9000-BLANK-DATA-FIELDS
               THRU 9000-BLANK-DATA-FIELDS-X.

           MOVE +1                          TO WS-SUB.

           PERFORM 2100-BROWSE-FROM-BPFS
              THRU 2100-BROWSE-FROM-BPFS-X.

           IF  WS-MORE-DATA-EXISTS-YES
               SET WGLOB-MORE-DATA-EXISTS   TO TRUE
               SET MIR-RETRN-OK             TO TRUE
               GO TO 2000-LIST-X
           END-IF.

           IF  WS-BPFT-RETRN-ERROR
      *MSG: NO RECORDS FOUND TO DISPLAY
               MOVE 'XS00000034'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-RQST-FAILED TO TRUE
               GO TO 2000-LIST-X
           END-IF.

           SET MIR-RETRN-OK             TO TRUE.

       2000-LIST-X.
           EXIT.


      *----------------------
       2100-BROWSE-FROM-BPFS.
      *----------------------

           MOVE SPACES                      TO WS-BPFT-RETRN-CD.
           SET  WS-MORE-DATA-EXISTS-NO      TO TRUE.

           PERFORM  7000-BUILD-BPFT-KEYS
               THRU 7000-BUILD-BPFT-KEYS-X.

           PERFORM  BPFT-1000-BROWSE
               THRU BPFT-1000-BROWSE-X.

PF 1.2*    IF  NOT WBPFT-IO-OK
PF 1.2*        SET WS-BPFT-RETRN-ERROR      TO TRUE
PF 1.2*        GO TO 2100-BROWSE-FROM-BPFS-X
PF 1.2*    END-IF.

           PERFORM  BPFT-2000-READ-NEXT
               THRU BPFT-2000-READ-NEXT-X.

           IF  WBPFT-IO-EOF
               PERFORM  BPFT-3000-END-BROWSE
                   THRU BPFT-3000-END-BROWSE-X
               SET WS-BPFT-RETRN-ERROR   TO TRUE
               GO TO 2100-BROWSE-FROM-BPFS-X
           END-IF.

           PERFORM  2110-BROWSE-BPFS
               THRU 2110-BROWSE-BPFS-X
               VARYING WS-SUB FROM WS-SUB BY 1
               UNTIL   WS-SUB > WS-MAX-LIST-LINES
               OR      WBPFT-IO-EOF.

           IF  WBPFT-IO-EOF
               CONTINUE
           ELSE
               SET WS-MORE-DATA-EXISTS-YES TO TRUE
               MOVE RBPFS-BPF-SECUR-GR-CD      TO MIR-BPF-SECUR-GR-CD
               MOVE RBPFS-BPF-SECUR-LVL-NUM    TO MIR-BPF-SECUR-LVL-NUM
               MOVE RBPFS-BPF-ID               TO MIR-BPF-ID
           END-IF.

           PERFORM  BPFT-3000-END-BROWSE
               THRU BPFT-3000-END-BROWSE-X.

           SET WS-BPFT-RETRN-OK             TO TRUE.

       2100-BROWSE-FROM-BPFS-X.
           EXIT.

      *-----------------
       2110-BROWSE-BPFS.
      *-----------------

           PERFORM  9200-MOVE-RECORD-TO-SCREEN
               THRU 9200-MOVE-RECORD-TO-SCREEN-X.

           PERFORM  BPFT-2000-READ-NEXT
               THRU BPFT-2000-READ-NEXT-X.

PF 1.2     IF RBPFS-BPF-SECUR-GR-CD = WS-MENU-SUPPRESS-GROUP-CD
PF 1.2         PERFORM  BPFT-2000-READ-NEXT
PF 1.2             THRU BPFT-2000-READ-NEXT-X
PF 1.2            UNTIL RBPFS-BPF-SECUR-GR-CD NOT =
PF 1.2                  WS-MENU-SUPPRESS-GROUP-CD
PF 1.2               OR WBPFT-IO-EOF
PF 1.2     END-IF.

       2110-BROWSE-BPFS-X.
           EXIT.
      /
      *----------------
       7000-BUILD-BPFT-KEYS.
      *----------------
      *
           MOVE LOW-VALUES               TO WBPFT-KEY.
           MOVE WGLOB-SECUR-CLAS-ID      TO WBPFT-SECUR-CLAS-ID.
           MOVE MIR-BPF-SECUR-GR-CD      TO WBPFT-BPF-SECUR-GR-CD.
           MOVE MIR-BPF-ID               TO WBPFT-BPF-ID.

           IF MIR-BPF-SECUR-LVL-NUM = SPACES
              MOVE ZEROES                TO WBPFT-BPF-SECUR-LVL-NUM
           ELSE
              MOVE MIR-BPF-SECUR-LVL-NUM TO WS-SECUR-LVL-NUM
              MOVE WS-SECUR-LVL-NUM-N    TO WBPFT-BPF-SECUR-LVL-NUM
           END-IF.

           MOVE HIGH-VALUES           TO WBPFT-ENDBR-KEY.
           MOVE WGLOB-SECUR-CLAS-ID   TO WBPFT-ENDBR-SECUR-CLAS-ID.
           MOVE 999                   TO WBPFT-ENDBR-BPF-SECUR-LVL-NUM.

       7000-BUILD-BPFT-KEYS-X.
           EXIT.

      /

      *-----------------------
       9000-BLANK-DATA-FIELDS.
      *-----------------------

           MOVE SPACES              TO MIR-BPF-ID-G.
           MOVE SPACES              TO MIR-ETBL-DESC-TXT-G.
           MOVE SPACES              TO MIR-DV-DESC-TYPE-G.


       9000-BLANK-DATA-FIELDS-X.
           EXIT.

      /
      *---------------------------
       9200-MOVE-RECORD-TO-SCREEN.
      *---------------------------


      *
      *  GET XTAB DESCRIPTIONS FOR GROUP CODE & PROCESS FLOW ID
      *

      ***  PERFORM KEY XTAB ON GROUP CODE. THE TYPE MUST EXIST
      ***  ON THE XTAB TABLE.
      *

           IF RBPFS-BPF-SECUR-GR-CD   NOT EQUAL TO WS-PREV-SECUR-GR-CD

              MOVE 'BPFGR'               TO WXTAB-ETBL-TYP-ID
              MOVE RBPFS-BPF-SECUR-GR-CD TO WXTAB-ETBL-VALU-ID
              MOVE WGLOB-USER-LANG       TO WXTAB-ETBL-LANG-CD

              MOVE RBPFS-BPF-SECUR-GR-CD TO WS-PREV-SECUR-GR-CD

              PERFORM XTAB-1000-READ
                 THRU XTAB-1000-READ-X

              IF NOT WXTAB-IO-OK
                      MOVE SPACES      TO RXTAB-ETBL-DESC-TXT
              END-IF

              MOVE '1'                 TO MIR-DV-DESC-TYPE-T (WS-SUB)
              MOVE RXTAB-ETBL-DESC-TXT TO MIR-ETBL-DESC-TXT-T (WS-SUB)
              ADD 1                    TO WS-SUB

           END-IF.

015543     IF WS-SUB > WS-MAX-LIST-LINES
015543         GO TO 9200-MOVE-RECORD-TO-SCREEN-X
015543     END-IF.

           MOVE RBPFS-BPF-ID              TO MIR-BPF-ID-T (WS-SUB).

           MOVE 'BPFID'               TO WXTAB-ETBL-TYP-ID.
           MOVE RBPFS-BPF-ID          TO WXTAB-ETBL-VALU-ID.
           MOVE WGLOB-USER-LANG       TO WXTAB-ETBL-LANG-CD.

           PERFORM XTAB-1000-READ
              THRU XTAB-1000-READ-X.

           IF NOT WXTAB-IO-OK
                   MOVE SPACES        TO RXTAB-ETBL-DESC-TXT
           END-IF.

           MOVE '2'                  TO MIR-DV-DESC-TYPE-T (WS-SUB).
           MOVE RXTAB-ETBL-DESC-TXT  TO MIR-ETBL-DESC-TXT-T (WS-SUB).


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
       COPY XCPPINIT.
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
       COPY XCPBBPFT.
       COPY XCPNXTAB.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM XSOM4906
      *****************************************************************
