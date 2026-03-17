      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM0090.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM0090                                         **
      **  REMARKS:  THIS MODULE PERFORMS TABLE LIST FUNCTION         **
      **            FOR THE MSIN TABLE                               **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
014653**  15DEC99  60     MODIFIED FOR LIST FUNCTION                 **
013578**  15DEC99  60     REMOVAL OF 3270 LOGIC, MIR RENAMES         **
014660**  15DEC99  60     GLOBAL MESSAGING                           **
012624**  15DEC99  60     SECURITY                                   **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
016091**  30JUN00  602J   CODE CLEANUP                               **
016227**  30JUN00  602J   CODE CLEANUP                               **
R10440** 10APR15    CTS   VM MIGRATION PLAN - REGARDING DUMMY        ** 
      **                  DEPLOYMENT FOR INGENIUM PRODUCTION         **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM0090'.

       COPY SQLCA.

014590*COPY XCWL0030.
013578 COPY XCWL8090.
      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                       PIC  X(04).
               88  WS-BUS-FCN-LIST                   VALUE '0090'.
           05  WS-SUB                              PIC S9(04)  COMP.
013578     05  WS-SUB-1                            PIC S9(04)  COMP.
013578     05  WS-LAST-SUB                         PIC S9(04)  COMP.
           05  WS-MAX-LIST-LINES                   PIC S9(04)  COMP
                                                     VALUE +50.
           05  WS-HOLD-7-0                         PIC  9(07)
                                                     VALUE ZEROS.
           05  WS-USER-MSG-TIME.
               10  WS-HH-TIME                      PIC  X(02).
               10  WS-MM-TIME                      PIC  X(02).
               10  WS-SS-TIME                      PIC  X(02).
           05  WS-CHECK-TIME                       PIC  9(06).
           05  WS-CHECK-ALPHA   REDEFINES
                  WS-CHECK-TIME.
               10  WS-HH-CHECK                     PIC 9(02).
               10  WS-MM-CHECK                     PIC 9(02).
               10  WS-SS-CHECK                     PIC 9(02).

           05  WS-HOLD-EVNT-ID.
               10  WS-HOLD-TIME                    PIC S9(07) COMP-3.
               10  WS-HOLD-DATE                    PIC  X(10).
               10  WS-HOLD-TASK                    PIC  X(04).
014660         10  WS-HOLD-SEV                     PIC  X(01).
013578     05  WS-MAX-PAGE-COUNT                   PIC S9(04) COMP
013578                                             VALUE 100.
013578     05  WS-SAME-PAGE-DISPLAY-IND            PIC X.
013578         88  WS-SAME-PAGE-DISPLAY-YES        VALUE 'Y'.
013578         88  WS-SAME-PAGE-DISPLAY-NO         VALUE 'N'.

013578 01  WS-TWRK-KEY                             PIC X(04)
013578                                             VALUE '0090'.
013578 01  WS-WORK-AREA.
013578     05  WS-CURRENT-KEY.
013578         10  WS-CURRENT-USER-ID              PIC X(08).
013578         10  WS-CURRENT-USER-MSG-DT          PIC X(10).
013578         10  WS-CURRENT-USER-MSG-TIME        PIC X(06).
013578         10  WS-CURRENT-USER-MSG-TASK-ID     PIC X(04).
013578         10  WS-CURRENT-USER-MSG-SEQ-NUM     PIC X(03).
013578         10  WS-CURRENT-USER-MSG-SEVRTY-CD   PIC X.
013578     05  WS-PAGE-POINTER                     PIC 9(04).
013578     05  WS-PAGE-KEY-INFO.
013578         10  WS-PAGE-KEY                     OCCURS 100 TIMES.
013578             15  WS-PAGE-USER-ID             PIC X(08).
013578             15  WS-PAGE-USER-MSG-DT         PIC X(10).
013578             15  WS-PAGE-USER-MSG-TIME       PIC X(06).
013578             15  WS-PAGE-USER-MSG-TASK-ID    PIC X(04).
013578             15  WS-PAGE-USER-MSG-SEQ-NUM    PIC X(03).
013578             15  WS-PAGE-USER-MSG-SEVRTY-CD  PIC X.


      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
       COPY XCWWWKDT.
013578*COPY XCWWTIME.
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
      /
014660*COPY XCFWMSIN.
014660 COPY XCFWMSIS.
       COPY XCFRMSIN.
      /
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      *****************************************************************
       COPY XCWLDTLK.
       COPY XCWL0280.
       COPY XCWL1640.
013578 COPY XCWLPTR.
      /
      *****************
       LINKAGE SECTION.
      *****************

       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM0090.
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

               WHEN WS-BUS-FCN-LIST
                    PERFORM  2000-LIST
                        THRU 2000-LIST-X

               WHEN OTHER
      *MSG:  INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID
                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM0090'
                      TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000000'
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

013578     PERFORM  9700-RETRIEVE-TWRK
013578         THRU 9700-RETRIEVE-TWRK-X.
013578
013578     IF  L8090-RETRN-OK
013578         MOVE L8090-AREA-INFO-TEXT  TO WS-WORK-AREA
013578         PERFORM  9900-DELETE-TWRK
013578             THRU 9900-DELETE-TWRK-X
013578     ELSE
013578         INITIALIZE WS-WORK-AREA
013578     END-IF.
013578
013578     IF MIR-DV-BCKWRD-SCROLL-IND NOT = 'Y'
013578        IF MIR-USER-ID           NOT = WS-CURRENT-USER-ID
013578        OR MIR-USER-MSG-DT       NOT = WS-CURRENT-USER-MSG-DT
013578        OR MIR-USER-MSG-TIME     NOT = WS-CURRENT-USER-MSG-TIME
013578        OR MIR-USER-MSG-TASK-ID  NOT = WS-CURRENT-USER-MSG-TASK-ID
013578        OR MIR-USER-MSG-SEQ-NUM  NOT = WS-CURRENT-USER-MSG-SEQ-NUM
013578        OR MIR-USER-MSG-SEVRTY-CD NOT =
013578                                     WS-CURRENT-USER-MSG-SEVRTY-CD
013578           INITIALIZE WS-WORK-AREA
013578        END-IF
013578     END-IF.


      *** ASSUMING A BROWSE OF THE MSIN TABLE ENTRIES IN DESCENDING
      *** ORDER (READ PREVIOUS)


           MOVE WWKDT-ZERO-DT                TO WS-HOLD-DATE.
           MOVE ZEROES                       TO WS-HOLD-TIME.
           MOVE ZEROES                       TO WS-HOLD-TASK.
014660     MOVE ZEROES                       TO WS-HOLD-SEV.

           PERFORM  7000-BUILD-KEYS
               THRU 7000-BUILD-KEYS-X.

           PERFORM  9000-BLANK-DATA-FIELDS
               THRU 9000-BLANK-DATA-FIELDS-X.


014660*    PERFORM  MSIN-1000-BROWSE-PREV
014660*        THRU MSIN-1000-BROWSE-PREV-X.

014660     PERFORM  MSIS-1000-BROWSE-PREV
014660         THRU MSIS-1000-BROWSE-PREV-X.

014660*    PERFORM  MSIN-2000-READ-PREV
014660*        THRU MSIN-2000-READ-PREV-X.

016227*    MOVE 'N'           TO RMSIN-USER-MSG-GUI-IND.
016227     SET RMSIN-USER-MSG-GUI-NO   TO TRUE.

014660     PERFORM  MSIS-2000-READ-PREV
014660         THRU MSIS-2000-READ-PREV-X
016227*       UNTIL RMSIN-USER-MSG-GUI-IND = 'Y'.
016227        UNTIL RMSIN-USER-MSG-GUI
016227           OR WMSIS-IO-EOF.

014660*    IF  WMSIN-IO-EOF
014660*        PERFORM  MSIN-3000-END-BROWSE-PREV
014660*            THRU MSIN-3000-END-BROWSE-PREV-X
014660     IF  WMSIS-IO-EOF
014660         PERFORM  MSIS-3000-END-BROWSE-PREV
014660             THRU MSIS-3000-END-BROWSE-PREV-X
      *MSG: 'NO RECORDS FOUND TO DISPLAY'
               MOVE 'XS00000034'           TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET MIR-RETRN-RQST-FAILED
                 TO TRUE
               GO TO 2000-LIST-X
           END-IF.

013578     PERFORM  7100-SAVE-PAGE-KEY
013578        THRU  7100-SAVE-PAGE-KEY-X.

014660*    PERFORM  2010-BROWSE-MSIN
014660*        THRU 2010-BROWSE-MSIN-X
014660     PERFORM  2010-BROWSE-MSIS
014660         THRU 2010-BROWSE-MSIS-X
               VARYING WS-SUB FROM 1 BY 1
               UNTIL   WS-SUB > WS-MAX-LIST-LINES
014660*        OR      WMSIN-IO-EOF.
014660         OR      WMSIS-IO-EOF.

014660*    IF  WMSIN-IO-EOF
014660     IF  WMSIS-IO-EOF
      *MSG: 'END OF LIST'
               MOVE 'XS00000015'           TO WGLOB-MSG-REF-INFO
           ELSE
      *MSG: 'MORE DATA TO DISPLAY'
               MOVE 'XS00000014'           TO WGLOB-MSG-REF-INFO
               SET WGLOB-MORE-DATA-EXISTS  TO TRUE

      ***    Establish the start point for the next browse
      ***    Re-set of USER-ID NOT necessary
      ***    Display of "key" fields should be in external format

               MOVE RMSIN-USER-MSG-DT        TO L1640-INTERNAL-DATE
               PERFORM  1640-2000-INTERNAL-TO-EXT
                   THRU 1640-2000-INTERNAL-TO-EXT-X
               MOVE  L1640-EXTERNAL-DATE     TO MIR-USER-MSG-DT

013578*        MOVE RMSIN-USER-MSG-TIME      TO WTIME-EDIT-TIME
013578*        PERFORM  TIME-1000-REFORMAT
013578*            THRU TIME-1000-REFORMAT-X
013578*        MOVE WTIME-DISPLAY-TIME       TO MIR-USER-MSG-TIME

013578         MOVE RMSIN-USER-MSG-TIME      TO WS-CHECK-TIME
013578         MOVE WS-CHECK-TIME            TO MIR-USER-MSG-TIME

               MOVE RMSIN-USER-MSG-TASK-ID   TO MIR-USER-MSG-TASK-ID
014660         MOVE RMSIN-USER-MSG-SEVRTY-CD TO MIR-USER-MSG-SEVRTY-CD
               MOVE RMSIN-USER-MSG-SEQ-NUM   TO MIR-USER-MSG-SEQ-NUM
           END-IF.

           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

014660*    PERFORM  MSIN-3000-END-BROWSE-PREV
014660*        THRU MSIN-3000-END-BROWSE-PREV-X.
014660     PERFORM  MSIS-3000-END-BROWSE-PREV
014660         THRU MSIS-3000-END-BROWSE-PREV-X.

013578     MOVE MIR-USER-ID            TO WS-CURRENT-USER-ID.
013578     MOVE MIR-USER-MSG-DT        TO WS-CURRENT-USER-MSG-DT.
013578     MOVE MIR-USER-MSG-TIME      TO WS-CURRENT-USER-MSG-TIME.
013578     MOVE MIR-USER-MSG-TASK-ID   TO WS-CURRENT-USER-MSG-TASK-ID.
013578     MOVE MIR-USER-MSG-SEQ-NUM   TO WS-CURRENT-USER-MSG-SEQ-NUM.
013578     MOVE MIR-USER-MSG-SEVRTY-CD TO WS-CURRENT-USER-MSG-SEVRTY-CD.

013578     PERFORM  9800-WRITE-TWRK
013578         THRU 9800-WRITE-TWRK-X.

       2000-LIST-X.
           EXIT.


      *-----------------
014660*2010-BROWSE-MSIN.
014660 2010-BROWSE-MSIS.
      *-----------------

           PERFORM  9200-MOVE-RECORD-TO-SCREEN
               THRU 9200-MOVE-RECORD-TO-SCREEN-X.

014660*    PERFORM  MSIN-2000-READ-PREV
014660*        THRU MSIN-2000-READ-PREV-X.

014660     MOVE 'N'        TO RMSIN-USER-MSG-GUI-IND.

014660     PERFORM  MSIS-2000-READ-PREV
014660         THRU MSIS-2000-READ-PREV-X
014660        UNTIL RMSIN-USER-MSG-GUI-IND = 'Y'
014660           OR WMSIS-IO-EOF.

014660*2010-BROWSE-MSIN-X.
014660 2010-BROWSE-MSIS-X.
           EXIT.
      /
      *----------------
       7000-BUILD-KEYS.
      *----------------

013578     IF  MIR-DV-BCKWRD-SCROLL-IND = 'Y'
013578         IF WS-PAGE-POINTER > 1
013578            MOVE SPACES
013578              TO WS-PAGE-KEY (WS-PAGE-POINTER)
013578            SUBTRACT 1     FROM WS-PAGE-POINTER
013578         ELSE
013578*MSG: 'CANNOT SCROLL BACKWARD'
013578            MOVE 'XS00000241'           TO WGLOB-MSG-REF-INFO
013578            PERFORM  0260-1000-GENERATE-MESSAGE
013578                THRU 0260-1000-GENERATE-MESSAGE-X
013578         END-IF
013578         MOVE WS-PAGE-USER-ID (WS-PAGE-POINTER)
013578           TO MIR-USER-ID
013578         MOVE WS-PAGE-USER-MSG-DT (WS-PAGE-POINTER)
013578           TO MIR-USER-MSG-DT
013578         MOVE WS-PAGE-USER-MSG-TIME (WS-PAGE-POINTER)
013578           TO MIR-USER-MSG-TIME
013578         MOVE WS-PAGE-USER-MSG-SEQ-NUM (WS-PAGE-POINTER)
013578           TO MIR-USER-MSG-SEQ-NUM
013578         MOVE WS-PAGE-USER-MSG-TASK-ID (WS-PAGE-POINTER)
013578           TO MIR-USER-MSG-TASK-ID
013578         MOVE WS-PAGE-USER-MSG-SEVRTY-CD (WS-PAGE-POINTER)
013578           TO MIR-USER-MSG-SEVRTY-CD
013578     END-IF.


014660*    MOVE HIGH-VALUES            TO WMSIN-KEY.
014660     MOVE HIGH-VALUES            TO WMSIS-KEY.

           IF  MIR-USER-ID = SPACES
014660*        MOVE WGLOB-USER-ID      TO WMSIN-USER-ID
014660         MOVE WGLOB-USER-ID      TO WMSIS-USER-ID
           ELSE
      ***       system or user provided
014660*        MOVE MIR-USER-ID        TO WMSIN-USER-ID
014660         MOVE MIR-USER-ID        TO WMSIS-USER-ID
           END-IF.

           IF  MIR-USER-MSG-DT = SPACES
               MOVE WGLOB-SYSTEM-DATE-INT
014660*                                TO WMSIN-USER-MSG-DT
014660                                 TO WMSIS-USER-MSG-DT
               MOVE WGLOB-SYSTEM-DATE-INT
                                       TO L1640-INTERNAL-DATE
               PERFORM  1640-2000-INTERNAL-TO-EXT
                   THRU 1640-2000-INTERNAL-TO-EXT-X
               MOVE L1640-EXTERNAL-DATE
                                       TO MIR-USER-MSG-DT
           ELSE
      ***       system or user provided
               MOVE MIR-USER-MSG-DT    TO L1640-EXTERNAL-DATE
               PERFORM  1640-3000-EXTERNAL-TO-INT
                   THRU 1640-3000-EXTERNAL-TO-INT-X
               MOVE L1640-INTERNAL-DATE
014660*                                TO WMSIN-USER-MSG-DT
014660                                 TO WMSIS-USER-MSG-DT
           END-IF.

           IF  MIR-USER-MSG-TIME = SPACES
013578*        MOVE WGLOB-SYSTEM-TIME  TO WS-HOLD-7-0
013578*        MOVE WS-HOLD-7-0        TO WMSIN-USER-MSG-TIME
013578*        MOVE WS-HOLD-7-0        TO WMSIS-USER-MSG-TIME
013578*        MOVE WS-HOLD-7-0        TO WTIME-EDIT-TIME
013578*        PERFORM  TIME-1000-REFORMAT
013578*            THRU TIME-1000-REFORMAT-X
013578*        MOVE WTIME-DISPLAY-TIME TO MIR-USER-MSG-TIME
013578         MOVE WGLOB-SYSTEM-TIME  TO WMSIS-USER-MSG-TIME
           ELSE

               PERFORM  7010-FORMAT-INPUT-TIME
                   THRU 7010-FORMAT-INPUT-TIME-X
014660*        MOVE WS-CHECK-TIME       TO WMSIN-USER-MSG-TIME
014660         MOVE WS-CHECK-TIME       TO WMSIS-USER-MSG-TIME

           END-IF.

014660*    MOVE SPACES                 TO WMSIN-USER-MSG-TASK-ID.
014660*    MOVE ZEROES                 TO WMSIN-USER-MSG-SEQ-NUM.

014660*    MOVE WMSIN-KEY              TO WMSIN-ENDBR-KEY.
014660*    MOVE ZEROES                 TO WMSIN-ENDBR-USER-MSG-TIME.
014660*    MOVE WWKDT-LOW-DT           TO WMSIN-ENDBR-USER-MSG-DT.


014660     IF MIR-USER-MSG-SEVRTY-CD = SPACES
014660        MOVE '5'                 TO WMSIS-USER-MSG-SEVRTY-CD
014660     ELSE
014660        MOVE MIR-USER-MSG-SEVRTY-CD
014660                                 TO WMSIS-USER-MSG-SEVRTY-CD
014660     END-IF.


014660     IF MIR-USER-MSG-SEQ-NUM = SPACES
014660        MOVE '999'                TO WMSIS-USER-MSG-SEQ-NUM
014660     ELSE
014660        MOVE MIR-USER-MSG-SEQ-NUM TO WMSIS-USER-MSG-SEQ-NUM
014660     END-IF.


014660     IF MIR-USER-MSG-TASK-ID = SPACES
014660        MOVE '9999'               TO WMSIS-USER-MSG-TASK-ID
014660     ELSE
014660        MOVE MIR-USER-MSG-TASK-ID TO WMSIS-USER-MSG-TASK-ID
014660     END-IF.


014660     MOVE WMSIS-KEY           TO WMSIS-ENDBR-KEY.
014660     MOVE WWKDT-LOW-DT        TO WMSIS-ENDBR-USER-MSG-DT.
014660     MOVE ZEROES              TO WMSIS-ENDBR-USER-MSG-TIME.
014660     MOVE ZEROES              TO WMSIS-ENDBR-USER-MSG-TASK-ID.
014660     MOVE '1'                 TO WMSIS-ENDBR-USER-MSG-SEVRTY-CD.
014660     MOVE ZEROES              TO WMSIS-ENDBR-USER-MSG-SEQ-NUM.

       7000-BUILD-KEYS-X.
           EXIT.

      *-----------------------
       7010-FORMAT-INPUT-TIME.
      *-----------------------
      *
      *  SET PARAMETERS FOR NUMERIC EDIT ROUTINE.
      *
           MOVE MIR-USER-MSG-TIME   TO WS-USER-MSG-TIME.

           MOVE 'N'                 TO L0280-SIGN-IND.
           MOVE '0'                 TO L0280-PRECISION.
           MOVE '2'                 TO L0280-LENGTH.
           MOVE '2'                 TO L0280-INPUT-SIZE.
           MOVE WS-HH-TIME          TO L0280-INPUT-DATA.
           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X.
           IF L0280-OK
               MOVE L0280-OUTPUT         TO WS-HH-CHECK
           ELSE
               MOVE 24                   TO WS-HH-CHECK
           END-IF.

           MOVE WS-MM-TIME          TO L0280-INPUT-DATA.
           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X.
           IF L0280-OK
               MOVE L0280-OUTPUT         TO WS-MM-CHECK
           ELSE
               MOVE 59                   TO WS-MM-CHECK
           END-IF.

           MOVE WS-SS-TIME          TO L0280-INPUT-DATA.
           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X.
           IF L0280-OK
               MOVE L0280-OUTPUT         TO WS-SS-CHECK
           ELSE
               MOVE 59                   TO WS-SS-CHECK
           END-IF.

       7010-FORMAT-INPUT-TIME-X.
           EXIT.

      /
013578*-------------------
013578 7100-SAVE-PAGE-KEY.
013578*-------------------
013578
013578     IF  MIR-DV-BCKWRD-SCROLL-IND NOT = 'Y'
013578         PERFORM 7120-CHECK-SAME-PAGE
013578            THRU 7120-CHECK-SAME-PAGE-X
013578         IF  WS-SAME-PAGE-DISPLAY-YES
013578             GO TO 7100-SAVE-PAGE-KEY-X
013578         END-IF
013578         IF  WS-PAGE-POINTER = WS-MAX-PAGE-COUNT
013578             PERFORM 7110-SHIFT-PAGE-TABLE
013578                THRU 7110-SHIFT-PAGE-TABLE-X
013578         ELSE
013578             ADD  1                    TO WS-PAGE-POINTER
013578         END-IF
013578         MOVE WS-CURRENT-KEY
013578           TO WS-PAGE-KEY (WS-PAGE-POINTER)
013578     END-IF.
013578
013578
013578 7100-SAVE-PAGE-KEY-X.
013578     EXIT.
013578
013578*----------------------
013578 7110-SHIFT-PAGE-TABLE.
013578*----------------------
013578
013578     MOVE WS-MAX-PAGE-COUNT   TO WS-LAST-SUB.
013578     SUBTRACT 1             FROM WS-LAST-SUB.
013578
013578     PERFORM 7111-MOVE-PAGE-ROW
013578        THRU 7111-MOVE-PAGE-ROW-X
013578        VARYING WS-SUB FROM 1 BY 1
013578        UNTIL   WS-SUB > WS-LAST-SUB.
013578
013578     MOVE SPACES   TO WS-PAGE-KEY (WS-MAX-PAGE-COUNT).
013578
013578 7110-SHIFT-PAGE-TABLE-X.
013578     EXIT.
013578
013578*------------------
013578 7111-MOVE-PAGE-ROW.
013578*------------------
013578
013578     MOVE WS-SUB         TO WS-SUB-1.
013578     ADD  1              TO WS-SUB-1.
013578     MOVE WS-PAGE-KEY (WS-SUB-1)
013578       TO WS-PAGE-KEY (WS-SUB).
013578
013578 7111-MOVE-PAGE-ROW-X.
013578     EXIT.
013578
013578*----------------------
013578 7120-CHECK-SAME-PAGE.
013578*----------------------
013578
013578     MOVE MIR-USER-ID              TO WS-CURRENT-USER-ID.
013578
013578     MOVE RMSIN-USER-MSG-DT        TO L1640-INTERNAL-DATE.
013578     PERFORM  1640-2000-INTERNAL-TO-EXT
013578         THRU 1640-2000-INTERNAL-TO-EXT-X.
013578     MOVE  L1640-EXTERNAL-DATE     TO WS-CURRENT-USER-MSG-DT.
013578
013578     MOVE RMSIN-USER-MSG-TIME      TO WS-CHECK-TIME.
013578     MOVE WS-CHECK-TIME            TO WS-CURRENT-USER-MSG-TIME.
013578
013578     MOVE RMSIN-USER-MSG-TASK-ID   TO WS-CURRENT-USER-MSG-TASK-ID.
013578     MOVE RMSIN-USER-MSG-SEQ-NUM   TO WS-CURRENT-USER-MSG-SEQ-NUM.
013578     MOVE RMSIN-USER-MSG-SEVRTY-CD TO
013578                                   WS-CURRENT-USER-MSG-SEVRTY-CD.
013578     IF  WS-PAGE-POINTER > ZERO
013578     AND WS-CURRENT-KEY = WS-PAGE-KEY (WS-PAGE-POINTER)
013578         SET WS-SAME-PAGE-DISPLAY-YES  TO TRUE
013578     ELSE
013578         SET WS-SAME-PAGE-DISPLAY-NO    TO TRUE
013578     END-IF.
013578
013578 7120-CHECK-SAME-PAGE-X.
016091*  EXIT.
016091     EXIT.

      *-----------------------
       9000-BLANK-DATA-FIELDS.
      *-----------------------

           MOVE SPACES                  TO MIR-USER-MSG-DT-G.
           MOVE SPACES                  TO MIR-USER-MSG-TASK-ID-G.
           MOVE SPACES                  TO MIR-USER-MSG-TIME-G.
           MOVE SPACES                  TO MIR-USER-MSG-SEQ-NUM-G.
           MOVE SPACES                  TO MIR-POL-OR-CLI-CO-ID-G.
           MOVE SPACES                  TO MIR-POL-OR-CLI-CD-G.
           MOVE SPACES                  TO MIR-POL-OR-CLI-ID-G.
           MOVE SPACES                  TO MIR-CVG-NUM-G.
           MOVE SPACES                  TO MIR-USER-MSG-TXT-G.
014660     MOVE SPACES                  TO MIR-MSG-REF-ID-G.
014660     MOVE SPACES                  TO MIR-MSG-REF-NUM-G.
           MOVE SPACES                  TO MIR-USER-MSG-SEVRTY-CD-G.

       9000-BLANK-DATA-FIELDS-X.
           EXIT.

      /
      *---------------------------
       9200-MOVE-RECORD-TO-SCREEN.
      *---------------------------

           IF  RMSIN-USER-MSG-DT        =  WS-HOLD-DATE
           AND RMSIN-USER-MSG-TIME      =  WS-HOLD-TIME
           AND RMSIN-USER-MSG-TASK-ID   =  WS-HOLD-TASK
014660     AND RMSIN-USER-MSG-SEVRTY-CD =  WS-HOLD-SEV
               MOVE SPACES
                 TO MIR-USER-MSG-DT-T (WS-SUB)
                    MIR-USER-MSG-TASK-ID-T (WS-SUB)
                    MIR-USER-MSG-TIME-T (WS-SUB)
014660              MIR-USER-MSG-SEVRTY-CD-T (WS-SUB)
                    MIR-USER-MSG-SEQ-NUM-T (WS-SUB)
                    MIR-POL-OR-CLI-CO-ID-T (WS-SUB)
                    MIR-POL-OR-CLI-CD-T (WS-SUB)
                    MIR-POL-OR-CLI-ID-T (WS-SUB)
                    MIR-CVG-NUM-T (WS-SUB)
           ELSE
               MOVE RMSIN-USER-MSG-DT  TO L1640-INTERNAL-DATE
               PERFORM  1640-2000-INTERNAL-TO-EXT
                   THRU 1640-2000-INTERNAL-TO-EXT-X
               MOVE L1640-EXTERNAL-DATE
                 TO MIR-USER-MSG-DT-T (WS-SUB)

013578*        MOVE RMSIN-USER-MSG-TIME TO WTIME-EDIT-TIME
013578*        PERFORM  TIME-1000-REFORMAT
013578*            THRU TIME-1000-REFORMAT-X
013578*        MOVE WTIME-DISPLAY-TIME
013578*          TO MIR-USER-MSG-TIME-T (WS-SUB)

013578         MOVE RMSIN-USER-MSG-TIME TO WS-CHECK-TIME
013578         MOVE WS-CHECK-TIME       TO MIR-USER-MSG-TIME-T (WS-SUB)


012624*        MOVE RMSIN-TRXN-ID
012624*          TO MIR-TRXN-ID-T (WS-SUB)

               MOVE RMSIN-BUS-FCN-ID
                 TO MIR-BUS-FCN-ID-T (WS-SUB)

               MOVE RMSIN-USER-MSG-TASK-ID
                 TO MIR-USER-MSG-TASK-ID-T (WS-SUB)

014660         MOVE RMSIN-USER-MSG-SEVRTY-CD
014660           TO MIR-USER-MSG-SEVRTY-CD-T (WS-SUB)

               MOVE RMSIN-USER-MSG-SEQ-NUM
                 TO MIR-USER-MSG-SEQ-NUM-T (WS-SUB)

               MOVE RMSIN-POL-OR-CLI-CO-ID
                 TO MIR-POL-OR-CLI-CO-ID-T (WS-SUB)

               MOVE RMSIN-POL-OR-CLI-CD
                 TO MIR-POL-OR-CLI-CD-T (WS-SUB)

               MOVE RMSIN-POL-OR-CLI-ID
                 TO MIR-POL-OR-CLI-ID-T (WS-SUB)

               MOVE RMSIN-CVG-NUM
                 TO MIR-CVG-NUM-T (WS-SUB)

               MOVE RMSIN-USER-MSG-DT           TO WS-HOLD-DATE
               MOVE RMSIN-USER-MSG-TIME         TO WS-HOLD-TIME
               MOVE RMSIN-USER-MSG-TASK-ID      TO WS-HOLD-TASK
014660         MOVE RMSIN-USER-MSG-SEVRTY-CD    TO WS-HOLD-SEV
           END-IF.

014660     MOVE RMSIN-MSG-REF-ID       TO MIR-MSG-REF-ID-T (WS-SUB).
014660     MOVE RMSIN-MSG-REF-NUM      TO MIR-MSG-REF-NUM-T (WS-SUB).

           MOVE RMSIN-USER-MSG-TXT
             TO MIR-USER-MSG-TXT-T (WS-SUB).

014660*    MOVE RMSIN-USER-MSG-SEVRTY-CD
014660*      TO MIR-USER-MSG-SEVRTY-CD-T (WS-SUB).

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
013578*--------------------
013578 9500-BUILD-TWRK-KEY.
013578*--------------------
013578
013578     MOVE WS-TWRK-KEY               TO  L8090-BUS-FCN-ID.
013578     MOVE ZEROS                     TO  L8090-TEMP-WRK-SEQ-NUM.
013578     SET  L8090-USAGE-COMM          TO  TRUE.
013578
013578 9500-BUILD-TWRK-KEY-X.
013578     EXIT.
013578/
013578*-------------------
013578 9700-RETRIEVE-TWRK.
013578*-------------------
013578
013578     PERFORM  9500-BUILD-TWRK-KEY
013578         THRU 9500-BUILD-TWRK-KEY-X.
013578
013578     PERFORM  8090-2000-RETRIEVE-TWRK
013578         THRU 8090-2000-RETRIEVE-TWRK-X.
013578
013578
013578 9700-RETRIEVE-TWRK-X.
013578     EXIT.
013578/
013578*----------------
013578 9800-WRITE-TWRK.
013578*----------------
013578
013578     PERFORM  9500-BUILD-TWRK-KEY
013578         THRU 9500-BUILD-TWRK-KEY-X.
013578
013578     MOVE LENGTH OF WS-WORK-AREA TO L8090-AREA-LEN.
013578     MOVE WS-WORK-AREA           TO L8090-AREA-INFO-TEXT.
013578
013578     PERFORM  8090-1000-WRITE-TWRK
013578         THRU 8090-1000-WRITE-TWRK-X.
013578
013578 9800-WRITE-TWRK-X.
013578     EXIT.
013578/
013578*-----------------
013578 9900-DELETE-TWRK.
013578*-----------------
013578
013578     PERFORM  9500-BUILD-TWRK-KEY
013578         THRU 9500-BUILD-TWRK-KEY-X.
013578
013578     PERFORM  8090-3000-DELETE-TWRK
013578         THRU 8090-3000-DELETE-TWRK-X.
013578
013578
013578 9900-DELETE-TWRK-X.
013578     EXIT.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************
       COPY XCPPEXIT.
014660*COPY XCPPMEXT.
013578*COPY XCPPTIME.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
013578 COPY XCCL8090.
       COPY XCCL0260.
       COPY XCPL0280.
       COPY XCPL1640.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
014660*COPY XCPVMSIN.
014660 COPY XCPVMSIS.
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM XSOM0090
      *****************************************************************
