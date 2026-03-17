

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM0390.


       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM0390                                         **
      **  REMARKS:  PROCESS DRIVER FOR CKPT                          **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  30OCT98  56     CREATED FOR CHECKPOINT PROCESSING.         **
013578**  15DEC99  60     ELIMINATE SUPPORT FOR CHARACTER INTERFACE  **
014588**  15DEC99  60     MIR CHANGES                                **
013578**  15DEC99  60     REMOVAL OF 3270 LOGIC, MIR RENAMES         **
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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM0390'.

       COPY SQLCA.
       COPY XCWLPTR.

014590*COPY XCWL0030.

       01  WS-PGM-WORK-AREA.
           05  WS-EDIT-CHECKS.
               10  WS-BUS-FCN-ID            PIC X(04).
                   88  WS-BUS-FCN-VALID     VALUE '0390' '0391' '0392'
                                                  '0393' '0394'.
                   88  WS-BUS-FCN-RETRIEVE  VALUE '0390'.
                   88  WS-BUS-FCN-CREATE    VALUE '0391'.
                   88  WS-BUS-FCN-UPDATE    VALUE '0392'.
                   88  WS-BUS-FCN-DELETE    VALUE '0393'.
                   88  WS-BUS-FCN-LIST      VALUE '0394'.

           05  WS-SUB                       PIC S9(04) COMP.
           05  WS-WKSTA-SUB                 PIC S9(04) COMP.
           05  WS-MAX-BROWSE-LINES          PIC S9(04) COMP
                                                       VALUE +11.
           05  WS-INSTANCE-NO               PIC 9(03)  VALUE ZEROES.
               88  WS-INSTANCE-DEFAULT      VALUE 001.

           05  WS-PARAMETERS-USED           PIC X(01).
           05  WS-MAX-MESSAGE-LENGTH        PIC S9(04) COMP
                                                       VALUE +20.

           05  WS-CKPT-WKSTA                PIC X(237).
           05  FILLER                       REDEFINES WS-CKPT-WKSTA.
               10  WS-WKSTA                 PIC X(79)
                                            OCCURS 3 TIMES.

           05  WS-CKPT-KEY-DISPLAY.
               10  WS-CKPT-KEY-CHKPT-PGM-ID    PIC X(08).
               10  FILLER                      PIC X(01)  VALUE SPACES.
               10  WS-CKPT-KEY-CHKPT-INSTC-ID  PIC X(03).

           05  WS-COMIT-FREQ-UOW-QTY        PIC 9(05) COMP-3.
           05  WS-COMIT-MIN-SEC-DUR         PIC 9(05) COMP-3.
           05  WS-COMIT-MAX-SEC-DUR         PIC 9(05) COMP-3.

           05  WS-XEDIT-MIN-MAX-IND         PIC X(01).
               88 WS-XEDIT-MIN-MAX-OK       VALUE 'Y'.
               88 WS-XEDIT-MIN-MAX-FAILED   VALUE 'N'.

      *****************************************************************
      *  LINKAGE COPYBOOKS                                            *
      *****************************************************************
      /
       COPY XCWL0280.
       COPY XCWL0290.
      /
       COPY XCWEBLCH.
      /
       COPY XCWWWKDT.
       COPY XCWLDTLK.
       COPY XCWL1640.
      /

      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY XCFWCKPT.
       COPY XCFRCKPT.
      /
       COPY XCFWXTAB.
       COPY XCFRXTAB.
      /
      *****************
       LINKAGE SECTION.
      *****************
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM0390.

       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                MIR-PARM-AREA.

      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM ABND-1000-HANDLE-ABEND
              THRU ABND-1000-HANDLE-ABEND-X.

           PERFORM  INIT-1000-INITIALIZE
               THRU INIT-1000-INITIALIZE-X.

           PERFORM  2000-PROCESS-REQUEST
               THRU 2000-PROCESS-REQUEST-X.

           PERFORM  EXIT-1000-FINALIZE
               THRU EXIT-1000-FINALIZE-X.

           GOBACK.

       0000-MAINLINE-X.
           EXIT.
      /
      *--------------------------
       2000-PROCESS-REQUEST.
      *--------------------------

           PERFORM  0290-1000-BUILD-PARM-INFO
               THRU 0290-1000-BUILD-PARM-INFO-X.

           PERFORM  9300-SETUP-MSIN-REFERENCE
               THRU 9300-SETUP-MSIN-REFERENCE-X.

           MOVE MIR-BUS-FCN-ID        TO WS-BUS-FCN-ID.

           IF WGLOB-MSG-ERROR-SW > ZERO
               PERFORM  9100-BLANK-DATA-FIELDS
                   THRU 9100-BLANK-DATA-FIELDS-X
               GO TO 2000-PROCESS-REQUEST-X
           END-IF.


      ***  VALIDATE KEY AND CONTROL FIELDS.

           PERFORM  8000-CHECK-KEY-FIELDS
               THRU 8000-CHECK-KEY-FIELDS-X.

           IF WGLOB-MSG-ERROR-SW > ZERO
           OR NOT WGLOB-GOOD-RETURN
               PERFORM  9100-BLANK-DATA-FIELDS
                   THRU 9100-BLANK-DATA-FIELDS-X
               GO TO 2000-PROCESS-REQUEST-X
           END-IF.


           IF WS-BUS-FCN-RETRIEVE
           OR WS-BUS-FCN-UPDATE
           OR WS-BUS-FCN-DELETE
      * READ RECORD BY INPUT KEY
               PERFORM  7100-BUILD-CKPT-KEY
                   THRU 7100-BUILD-CKPT-KEY-X
               PERFORM  CKPT-1000-READ
                   THRU CKPT-1000-READ-X
               IF WCKPT-IO-NOT-FOUND
                   PERFORM  9100-BLANK-DATA-FIELDS
                       THRU 9100-BLANK-DATA-FIELDS-X
      *MSG: 'NO COMMIT FREQUENCY FOUND FOR THIS PROGRAM AND
      *      INSTANCE NUMBER'
                   MOVE 'XS03900002'  TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
                   GO TO 2000-PROCESS-REQUEST-X
               END-IF
           END-IF.

           IF  WS-BUS-FCN-DELETE
           AND RCKPT-CHKPT-STAT-RUNNING
      *MSG:    'COMMIT FREQUENCY CANNOT BE TURNED OFF WHEN BATCH
      *         RUNNING'
               MOVE 'XS03900008'      TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-PROCESS-REQUEST-X
           END-IF.

           EVALUATE TRUE

               WHEN WS-BUS-FCN-RETRIEVE
                   PERFORM  3000-PROCESS-RETRIEVE
                       THRU 3000-PROCESS-RETRIEVE-X

               WHEN WS-BUS-FCN-LIST
                   PERFORM  3500-PROCESS-LIST
                       THRU 3500-PROCESS-LIST-X

               WHEN WS-BUS-FCN-CREATE
                   PERFORM  4000-PROCESS-CREATE
                       THRU 4000-PROCESS-CREATE-X

               WHEN WS-BUS-FCN-UPDATE
                   PERFORM  5000-PROCESS-UPDATE
                       THRU 5000-PROCESS-UPDATE-X

               WHEN WS-BUS-FCN-DELETE
                   PERFORM  6000-PROCESS-DELETE
                       THRU 6000-PROCESS-DELETE-X

               WHEN OTHER
      *MSG: INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID
                                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM0390'
                                      TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000237' TO  WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET MIR-RETRN-INVALD-RQST TO TRUE

           END-EVALUATE.

       2000-PROCESS-REQUEST-X.
           EXIT.

      /

      *-------------
       3000-PROCESS-RETRIEVE.
      *-------------
      ****************************************************************
      * READ CHECKPOINT FILE FOR SPECIFIC DESC AND DISPLAY           *
      ****************************************************************

           PERFORM  9100-BLANK-DATA-FIELDS
               THRU 9100-BLANK-DATA-FIELDS-X.

           PERFORM  9200-MOVE-RECORD-TO-SCREEN
               THRU 9200-MOVE-RECORD-TO-SCREEN-X.

       3000-PROCESS-RETRIEVE-X.
           EXIT.
      /

      *------------
       3500-PROCESS-LIST.
      *------------

           PERFORM  9100-BLANK-DATA-FIELDS
               THRU 9100-BLANK-DATA-FIELDS-X.

           MOVE +1                    TO WS-SUB.

           PERFORM  3520-BROWSE-CKPT
               THRU 3520-BROWSE-CKPT-X.

       3500-PROCESS-LIST-X.
           EXIT.

      /

      *-----------------
       3520-BROWSE-CKPT.
      *-----------------
      * BROWSE AND MOVE DATA TO MIR

           MOVE LOW-VALUES            TO WCKPT-KEY.
           MOVE HIGH-VALUES           TO WCKPT-ENDBR-KEY.
           MOVE 999                   TO WCKPT-ENDBR-CHKPT-INSTC-ID.

           MOVE MIR-CHKPT-PGM-ID      TO WCKPT-CHKPT-PGM-ID.

      * ALWAYS START FROM THE BEGINNING IF PROGRAM NAME IS NOT ENTERED
           IF  MIR-CHKPT-PGM-ID = SPACE
           OR  MIR-CHKPT-INSTC-ID = SPACE
               MOVE 0                 TO WCKPT-CHKPT-INSTC-ID
           ELSE
               SET L0280-SIGN-NOT-PERMITTED TO TRUE
               MOVE ZERO              TO L0280-PRECISION
               MOVE LENGTH OF MIR-CHKPT-INSTC-ID
                                      TO L0280-INPUT-SIZE
               COMPUTE L0280-LENGTH = L0280-INPUT-SIZE - 0
               MOVE MIR-CHKPT-INSTC-ID               TO L0280-INPUT-DATA
               PERFORM 0280-1000-NUMERIC-EDIT
                  THRU 0280-1000-NUMERIC-EDIT-X
               IF  L0280-OK
                   MOVE L0280-OUTPUT-V00
                                      TO WCKPT-CHKPT-INSTC-ID
                   COMPUTE L0290-INPUT-NUMBER =
                           L0280-OUTPUT-V00 * 1
                   MOVE 0             TO L0290-PRECISION
                   MOVE LENGTH OF MIR-CHKPT-INSTC-ID
                                      TO L0290-MAX-OUT-LEN
                   PERFORM  0290-1000-NUMERIC-FORMAT
                       THRU 0290-1000-NUMERIC-FORMAT-X
                   MOVE L0290-OUTPUT-DATA
                                      TO MIR-CHKPT-INSTC-ID
               ELSE
      *MSG:    'INSTANCE NUMBER MUST BE NUMERIC'
                   MOVE 'XS03900009'  TO WGLOB-MSG-REF-INFO
                   PERFORM 0260-1000-GENERATE-MESSAGE
                      THRU 0260-1000-GENERATE-MESSAGE-X
                   GO TO 3520-BROWSE-CKPT-X
               END-IF
           END-IF.

           PERFORM  CKPT-1000-BROWSE
               THRU CKPT-1000-BROWSE-X.

           IF WCKPT-IO-EOF
      *MSG:   'NO RECORDS FOUND TO DISPLAY'
               MOVE 'XS00000034'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 3520-BROWSE-CKPT-X
           ELSE
               PERFORM  CKPT-2000-READ-NEXT
                   THRU CKPT-2000-READ-NEXT-X
               IF WCKPT-IO-EOF
      *MSG:   'NO RECORDS FOUND TO DISPLAY'
                   MOVE 'XS00000034'  TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
                   GO TO 3520-BROWSE-CKPT-X
               END-IF
           END-IF.

           MOVE +1                    TO WS-SUB.
           PERFORM  3525-BROWSE-CKPT-READ
               THRU 3525-BROWSE-CKPT-READ-X
               UNTIL (WS-SUB  > WS-MAX-BROWSE-LINES)
               OR    WCKPT-IO-EOF.

           IF WS-SUB > WS-MAX-BROWSE-LINES
               MOVE RCKPT-CHKPT-PGM-ID               TO MIR-CHKPT-PGM-ID
               COMPUTE L0290-INPUT-NUMBER =
                       RCKPT-CHKPT-INSTC-ID * 1
               MOVE 0                 TO L0290-PRECISION
               MOVE LENGTH OF MIR-CHKPT-INSTC-ID
                                      TO L0290-MAX-OUT-LEN
               PERFORM 0290-1000-NUMERIC-FORMAT
                  THRU 0290-1000-NUMERIC-FORMAT-X
               MOVE L0290-OUTPUT-DATA TO MIR-CHKPT-INSTC-ID
           END-IF.

           IF WCKPT-IO-EOF
      *MSG:    'END OF LIST'
               MOVE 'XS00000015'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
               SET WGLOB-MORE-DATA-EXISTS TO TRUE
      *MSG:    '** TO VIEW MORE DATA PRESS ENTER **'
               MOVE 'XS00000014'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           PERFORM  CKPT-3000-END-BROWSE
               THRU CKPT-3000-END-BROWSE-X.

       3520-BROWSE-CKPT-X.
           EXIT.
      /


      *----------------------
       3525-BROWSE-CKPT-READ.
      *----------------------

           PERFORM  9200-MOVE-RECORD-TO-SCREEN
               THRU 9200-MOVE-RECORD-TO-SCREEN-X.

           ADD 1                              TO WS-SUB.

           PERFORM  CKPT-2000-READ-NEXT
               THRU CKPT-2000-READ-NEXT-X.

       3525-BROWSE-CKPT-READ-X.
           EXIT.
      /

      *------------
       4000-PROCESS-CREATE.
      *------------
      ****************************************************************
      * CREATE NEW CHECKPOINT RECORD.  THE RECORD IS CREATED WITH THE
      * KEY FIELDS ENTERED.  THE REMAINING DATA WILL BE UPDATED VIA
      * THE MAINTAIN SCREEN.
      ****************************************************************

           PERFORM  9100-BLANK-DATA-FIELDS
               THRU 9100-BLANK-DATA-FIELDS-X.


           PERFORM  7100-BUILD-CKPT-KEY
               THRU 7100-BUILD-CKPT-KEY-X.

           PERFORM  CKPT-1000-READ
               THRU CKPT-1000-READ-X.

           IF WCKPT-IO-OK
               MOVE WS-CKPT-KEY-DISPLAY
                                      TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000003'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4000-PROCESS-CREATE-X
           END-IF.

           PERFORM  4100-CREATE-EDITS
               THRU 4100-CREATE-EDITS-X.

           IF WGLOB-MSG-ERROR-SW > ZERO
               GO TO 4000-PROCESS-CREATE-X
           END-IF.

           PERFORM  7100-BUILD-CKPT-KEY
               THRU 7100-BUILD-CKPT-KEY-X.

           PERFORM  CKPT-1000-CREATE
               THRU CKPT-1000-CREATE-X.
           PERFORM  9200-MOVE-RECORD-TO-SCREEN
               THRU 9200-MOVE-RECORD-TO-SCREEN-X.

           PERFORM  CKPT-1000-WRITE
               THRU CKPT-1000-WRITE-X.

           MOVE 'XS00000004'          TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

       4000-PROCESS-CREATE-X.
           EXIT.
      /

      *------------------
       4100-CREATE-EDITS.
      *------------------
      *****************************************************************
      *  EDIT PROGRAM NAME.
      *****************************************************************

           MOVE MIR-CHKPT-PGM-ID      TO WXTAB-ETBL-VALU-ID.

           PERFORM  PRGM-1000-EDIT-PROGRAM-NAME
               THRU PRGM-1000-EDIT-PROGRAM-NAME-X.

           IF  WXTAB-IO-OK
               MOVE MIR-CHKPT-PGM-ID  TO WCKPT-CHKPT-PGM-ID
           ELSE
      *MSG: 'PROGRAM ID MUST BE IN XTAB TYPE 'PROGM''
               MOVE 'XS03900001'      TO WGLOB-MSG-REF-INFO
               MOVE MIR-CHKPT-PGM-ID  TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.


      *****************************************************************
      *  EDIT INSTANCE NUMBER.
      *****************************************************************

           PERFORM  4300-EDIT-INSTANCE
               THRU 4300-EDIT-INSTANCE-X.

       4100-CREATE-EDITS-X.
           EXIT.

      ****************************************************************
      *   FORMAT INSTANCE #:
      *   ENSURE THAT THE SUPPLIED CHECKPOINT INSTANCE NUMBER
      *   IS NUMERIC.
      ****************************************************************
      *-------------------
       4300-EDIT-INSTANCE.
      *-------------------

           MOVE ZERO                  TO WS-INSTANCE-NO.
           SET L0280-SIGN-NOT-PERMITTED  TO TRUE.
           MOVE 0                     TO L0280-PRECISION.
           MOVE LENGTH OF MIR-CHKPT-INSTC-ID
                                      TO L0280-INPUT-SIZE.
           COMPUTE L0280-LENGTH = L0280-INPUT-SIZE - 0.
           MOVE MIR-CHKPT-INSTC-ID    TO L0280-INPUT-DATA.

           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X.

           IF  L0280-OK
               MOVE L0280-OUTPUT-V00  TO WCKPT-CHKPT-INSTC-ID
               COMPUTE L0290-INPUT-NUMBER =
                       L0280-OUTPUT-V00 * 1
               MOVE 0                 TO L0290-PRECISION
               MOVE LENGTH OF MIR-CHKPT-INSTC-ID
                                      TO L0290-MAX-OUT-LEN
               PERFORM  0290-1000-NUMERIC-FORMAT
                   THRU 0290-1000-NUMERIC-FORMAT-X
               MOVE L0290-OUTPUT-DATA TO MIR-CHKPT-INSTC-ID
               GO TO 4300-EDIT-INSTANCE-X
           ELSE
               MOVE MIR-CHKPT-INSTC-ID             TO WGLOB-MSG-PARM (1)
      * MSG INSTANCE NUMBER MUST BE NUMERIC
               MOVE 'XS03900009'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.


       4300-EDIT-INSTANCE-X.
           EXIT.
      /


      *--------------
       5000-PROCESS-UPDATE.
      *--------------


           PERFORM  7100-BUILD-CKPT-KEY
               THRU 7100-BUILD-CKPT-KEY-X.

           PERFORM  CKPT-1000-READ-FOR-UPDATE
               THRU CKPT-1000-READ-FOR-UPDATE-X.

           IF WCKPT-IO-NOT-FOUND
               MOVE WCKPT-KEY         TO WGLOB-MSG-PARM (1)
      *MSG: 'NO COMMIT FREQUENCY FOUND FOR THIS PROGRAM AND
      *MSG:  INSTANCE NUMBER'
               MOVE 'XS03900002'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  9100-BLANK-DATA-FIELDS
                   THRU 9100-BLANK-DATA-FIELDS-X
               GO TO 5000-PROCESS-UPDATE-X
           END-IF.

           PERFORM  5220-MAINTAIN-EDITS
               THRU 5220-MAINTAIN-EDITS-X.

           PERFORM  CKPT-2000-REWRITE
               THRU CKPT-2000-REWRITE-X.

           IF WGLOB-MSG-ERROR-SW > ZERO
               MOVE 'XS00000008'      TO WGLOB-MSG-REF-INFO
           ELSE
               MOVE 'XS00000007'      TO WGLOB-MSG-REF-INFO
               PERFORM  9200-MOVE-RECORD-TO-SCREEN
                   THRU 9200-MOVE-RECORD-TO-SCREEN-X
           END-IF.

           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

       5000-PROCESS-UPDATE-X.
           EXIT.
      /

      *--------------------
       5220-MAINTAIN-EDITS.
      *--------------------
      ****************************************************************
      * EDIT INPUT FIELDS.                                           *
      ****************************************************************

           PERFORM  5221-EDIT-CHKPT-FREQ-UNIT
               THRU 5221-EDIT-CHKPT-FREQ-UNIT-X.

           PERFORM  5222-EDIT-FREQ-MIN-TIME
               THRU 5222-EDIT-FREQ-MIN-TIME-X.

           PERFORM  5223-EDIT-FREQ-MAX-TIME
               THRU 5223-EDIT-FREQ-MAX-TIME-X.

           PERFORM  5224-XEDIT-MIN-MAX-TIME
               THRU 5224-XEDIT-MIN-MAX-TIME-X.

           PERFORM  5225-XEDIT-STAT-COMIT-FREQ
               THRU 5225-XEDIT-STAT-COMIT-FREQ-X.

           EVALUATE TRUE

             WHEN WGLOB-MSG-ERROR-SW = 0
               MOVE WS-COMIT-FREQ-UOW-QTY
                                      TO RCKPT-COMIT-FREQ-UOW-QTY
               MOVE WS-COMIT-MIN-SEC-DUR
                                      TO RCKPT-COMIT-MIN-SEC-DUR
               MOVE WS-COMIT-MAX-SEC-DUR
                                      TO RCKPT-COMIT-MAX-SEC-DUR

             WHEN WS-XEDIT-MIN-MAX-FAILED
               MOVE WS-COMIT-FREQ-UOW-QTY
                                      TO RCKPT-COMIT-FREQ-UOW-QTY

           END-EVALUATE.

           IF  RCKPT-COMIT-FREQ-UOW-QTY = 0
           AND RCKPT-COMIT-MIN-SEC-DUR  = 0
           AND RCKPT-COMIT-MAX-SEC-DUR  = 0
      *WARNING MSG: 'NO COMMIT FREQUENCY INFO ENTERED. NO CHECKPOINT
      *         PROCESSING EXECUTED'
               MOVE 'XS03900007'      TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       5220-MAINTAIN-EDITS-X.
           EXIT.

      *--------------------------
       5221-EDIT-CHKPT-FREQ-UNIT.
      *--------------------------

           MOVE     RCKPT-COMIT-FREQ-UOW-QTY
                                      TO
                    WS-COMIT-FREQ-UOW-QTY.

           EVALUATE MIR-COMIT-FREQ-UOW-QTY

               WHEN SPACES
                    MOVE RCKPT-COMIT-FREQ-UOW-QTY
                      TO L0290-INPUT-NUMBER
                    MOVE 0            TO L0290-PRECISION
                    MOVE LENGTH OF MIR-COMIT-FREQ-UOW-QTY
                                      TO L0290-MAX-OUT-LEN
                    PERFORM 0290-1000-NUMERIC-FORMAT
                       THRU 0290-1000-NUMERIC-FORMAT-X
                    MOVE L0290-OUTPUT-DATA
                                      TO MIR-COMIT-FREQ-UOW-QTY

               WHEN EBLCH-BLANK-FIELD-CHAR
                    MOVE ZERO         TO L0290-INPUT-NUMBER
                    MOVE 0            TO L0290-PRECISION
                    MOVE LENGTH OF MIR-COMIT-FREQ-UOW-QTY
                                      TO L0290-MAX-OUT-LEN
                    PERFORM 0290-1000-NUMERIC-FORMAT
                       THRU 0290-1000-NUMERIC-FORMAT-X
                    MOVE L0290-OUTPUT-DATA
                                      TO MIR-COMIT-FREQ-UOW-QTY
                    MOVE 0            TO
                         WS-COMIT-FREQ-UOW-QTY

               WHEN OTHER
                    SET L0280-SIGN-NOT-PERMITTED TO TRUE
                    MOVE ZERO         TO L0280-PRECISION
                    MOVE LENGTH OF MIR-COMIT-FREQ-UOW-QTY
                                      TO L0280-INPUT-SIZE
                    COMPUTE L0280-LENGTH = L0280-INPUT-SIZE - 0
                    MOVE MIR-COMIT-FREQ-UOW-QTY
                                      TO L0280-INPUT-DATA
                    PERFORM 0280-1000-NUMERIC-EDIT
                       THRU 0280-1000-NUMERIC-EDIT-X
                    IF  L0280-OK
                        COMPUTE L0290-INPUT-NUMBER =
                                L0280-OUTPUT-V00 * 1
                        MOVE 0        TO L0290-PRECISION
                        MOVE LENGTH OF MIR-COMIT-FREQ-UOW-QTY
                                      TO L0290-MAX-OUT-LEN
                        PERFORM  0290-1000-NUMERIC-FORMAT
                            THRU 0290-1000-NUMERIC-FORMAT-X
                        MOVE L0290-OUTPUT-DATA
                                      TO MIR-COMIT-FREQ-UOW-QTY
                        MOVE L0280-OUTPUT-V00
                                      TO
                             WS-COMIT-FREQ-UOW-QTY
                    ELSE
      *MSG:    'COMMIT FREQUENCY MUST BE NUMERIC'
                        MOVE 'XS03900003'
                                      TO WGLOB-MSG-REF-INFO
                        PERFORM 0260-1000-GENERATE-MESSAGE
                           THRU 0260-1000-GENERATE-MESSAGE-X
                    END-IF

           END-EVALUATE.

       5221-EDIT-CHKPT-FREQ-UNIT-X.
           EXIT.

      *------------------------
       5222-EDIT-FREQ-MIN-TIME.
      *------------------------

           MOVE     RCKPT-COMIT-MIN-SEC-DUR
                                      TO
                    WS-COMIT-MIN-SEC-DUR.

           EVALUATE MIR-COMIT-MIN-SEC-DUR

               WHEN SPACES
                    MOVE RCKPT-COMIT-MIN-SEC-DUR
                                      TO
                         L0290-INPUT-NUMBER
                    MOVE 0            TO L0290-PRECISION
                    MOVE LENGTH OF MIR-COMIT-MIN-SEC-DUR
                                      TO L0290-MAX-OUT-LEN
                    PERFORM 0290-1000-NUMERIC-FORMAT
                       THRU 0290-1000-NUMERIC-FORMAT-X
                    MOVE L0290-OUTPUT-DATA
                                      TO MIR-COMIT-MIN-SEC-DUR

               WHEN EBLCH-BLANK-FIELD-CHAR
                    MOVE ZERO         TO L0290-INPUT-NUMBER
                    MOVE 0            TO L0290-PRECISION
                    MOVE LENGTH OF MIR-COMIT-MIN-SEC-DUR
                                      TO L0290-MAX-OUT-LEN
                    PERFORM 0290-1000-NUMERIC-FORMAT
                       THRU 0290-1000-NUMERIC-FORMAT-X
                    MOVE L0290-OUTPUT-DATA
                                      TO MIR-COMIT-MIN-SEC-DUR
                    MOVE 0            TO
                         WS-COMIT-MIN-SEC-DUR

               WHEN OTHER
                    SET L0280-SIGN-NOT-PERMITTED TO TRUE
                    MOVE ZERO         TO L0280-PRECISION
                    MOVE LENGTH OF MIR-COMIT-MIN-SEC-DUR
                                      TO L0280-INPUT-SIZE
                    COMPUTE L0280-LENGTH = L0280-INPUT-SIZE - 0
                    MOVE MIR-COMIT-MIN-SEC-DUR
                                      TO L0280-INPUT-DATA
                    PERFORM 0280-1000-NUMERIC-EDIT
                       THRU 0280-1000-NUMERIC-EDIT-X
                    IF  L0280-OK
                        COMPUTE L0290-INPUT-NUMBER =
                                L0280-OUTPUT-V00 * 1
                        MOVE 0        TO L0290-PRECISION
                        MOVE LENGTH OF MIR-COMIT-MIN-SEC-DUR
                                      TO L0290-MAX-OUT-LEN
                        PERFORM  0290-1000-NUMERIC-FORMAT
                            THRU 0290-1000-NUMERIC-FORMAT-X
                        MOVE L0290-OUTPUT-DATA
                                      TO MIR-COMIT-MIN-SEC-DUR
                        MOVE L0280-OUTPUT-V00
                                      TO
                             WS-COMIT-MIN-SEC-DUR
                    ELSE
      *MSG:    'COMMIT FREQUENCY MINIMUM TIME MUST BE NUMERIC'
                        MOVE 'XS03900004'
                                      TO WGLOB-MSG-REF-INFO
                        PERFORM 0260-1000-GENERATE-MESSAGE
                           THRU 0260-1000-GENERATE-MESSAGE-X
                    END-IF

           END-EVALUATE.

       5222-EDIT-FREQ-MIN-TIME-X.
           EXIT.

      *------------------------
       5223-EDIT-FREQ-MAX-TIME.
      *------------------------

           MOVE     RCKPT-COMIT-MAX-SEC-DUR
                                      TO
                    WS-COMIT-MAX-SEC-DUR.

           EVALUATE MIR-COMIT-MAX-SEC-DUR

               WHEN SPACES
                    MOVE RCKPT-COMIT-MAX-SEC-DUR
                                      TO
                         L0290-INPUT-NUMBER
                    MOVE 0            TO L0290-PRECISION
                    MOVE LENGTH OF MIR-COMIT-MAX-SEC-DUR
                                      TO L0290-MAX-OUT-LEN
                    PERFORM 0290-1000-NUMERIC-FORMAT
                       THRU 0290-1000-NUMERIC-FORMAT-X
                    MOVE L0290-OUTPUT-DATA
                                      TO MIR-COMIT-MAX-SEC-DUR

               WHEN EBLCH-BLANK-FIELD-CHAR
                    MOVE ZERO         TO L0290-INPUT-NUMBER
                    MOVE 0            TO L0290-PRECISION
                    MOVE LENGTH OF MIR-COMIT-MAX-SEC-DUR
                                      TO L0290-MAX-OUT-LEN
                    PERFORM 0290-1000-NUMERIC-FORMAT
                       THRU 0290-1000-NUMERIC-FORMAT-X
                    MOVE L0290-OUTPUT-DATA
                                      TO MIR-COMIT-MAX-SEC-DUR
                    MOVE 0            TO
                         WS-COMIT-MAX-SEC-DUR

               WHEN OTHER
                    SET L0280-SIGN-NOT-PERMITTED TO TRUE
                    MOVE ZERO         TO L0280-PRECISION
                    MOVE LENGTH OF MIR-COMIT-MAX-SEC-DUR
                                      TO L0280-INPUT-SIZE
                    COMPUTE L0280-LENGTH = L0280-INPUT-SIZE - 0
                    MOVE MIR-COMIT-MAX-SEC-DUR
                                      TO L0280-INPUT-DATA
                    PERFORM 0280-1000-NUMERIC-EDIT
                       THRU 0280-1000-NUMERIC-EDIT-X
                    IF  L0280-OK
                        COMPUTE L0290-INPUT-NUMBER =
                                L0280-OUTPUT-V00 * 1
                        MOVE 0        TO L0290-PRECISION
                        MOVE LENGTH OF MIR-COMIT-MAX-SEC-DUR
                                      TO L0290-MAX-OUT-LEN
                        PERFORM  0290-1000-NUMERIC-FORMAT
                            THRU 0290-1000-NUMERIC-FORMAT-X
                        MOVE L0290-OUTPUT-DATA
                                      TO MIR-COMIT-MAX-SEC-DUR
                        MOVE L0280-OUTPUT-V00
                                      TO
                             WS-COMIT-MAX-SEC-DUR
                    ELSE
      *MSG:    'COMMIT FREQUENCY MAXIMUM TIME MUST BE NUMERIC'
                        MOVE 'XS03900005'
                                      TO WGLOB-MSG-REF-INFO
                        PERFORM 0260-1000-GENERATE-MESSAGE
                           THRU 0260-1000-GENERATE-MESSAGE-X
                    END-IF

           END-EVALUATE.

       5223-EDIT-FREQ-MAX-TIME-X.
           EXIT.

      *------------------------
       5224-XEDIT-MIN-MAX-TIME.
      *------------------------

           SET WS-XEDIT-MIN-MAX-OK TO TRUE.

           IF WS-COMIT-MAX-SEC-DUR < WS-COMIT-MIN-SEC-DUR
      *MSG:    'COMMIT FREQUENCY MINIMUM TIME MUST BE <=
      *         TO THE MAXIMUM TIME'
               MOVE 'XS03900006'      TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-XEDIT-MIN-MAX-FAILED TO TRUE
           END-IF.

       5224-XEDIT-MIN-MAX-TIME-X.
           EXIT.


      *---------------------------
       5225-XEDIT-STAT-COMIT-FREQ.
      *---------------------------

           IF RCKPT-CHKPT-STAT-RUNNING
           AND WS-COMIT-FREQ-UOW-QTY = 0
           AND WS-COMIT-MIN-SEC-DUR  = 0
           AND WS-COMIT-MAX-SEC-DUR  = 0
      *MSG:    'COMMIT FREQUENCY CANNOT BE TURNED OFF WHEN BATCH
      *         RUNNING'
               MOVE 'XS03900008'      TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       5225-XEDIT-STAT-COMIT-FREQ-X.
           EXIT.
      /
      *------------
       6000-PROCESS-DELETE.
      *------------

      ****************************************************************
      * DELETE CHECKPOINT RECORD.                                    *
      ****************************************************************

           PERFORM  7100-BUILD-CKPT-KEY
               THRU 7100-BUILD-CKPT-KEY-X.

           PERFORM  CKPT-1000-READ-FOR-UPDATE
               THRU CKPT-1000-READ-FOR-UPDATE-X.

           IF WCKPT-IO-OK
               PERFORM  CKPT-1000-DELETE
                   THRU CKPT-1000-DELETE-X
      *MSG:  'DELETE COMPLETED - CONTINUE'
               MOVE 'XS00000011'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
      *MSG:  'RECORD @1 LOST IN DELETE - CONTACT SYSTEMS'
               MOVE WS-CKPT-KEY-DISPLAY
                                      TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000010'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           PERFORM  9100-BLANK-DATA-FIELDS
               THRU 9100-BLANK-DATA-FIELDS-X.

       6000-PROCESS-DELETE-X.
           EXIT.
      /


      *--------------------
       7100-BUILD-CKPT-KEY.
      *--------------------

      ****************************************************************
      * BUILD THE KEY.                                               *
      ****************************************************************

           MOVE MIR-CHKPT-PGM-ID      TO WS-CKPT-KEY-CHKPT-PGM-ID.
           MOVE MIR-CHKPT-INSTC-ID    TO WS-CKPT-KEY-CHKPT-INSTC-ID.

           MOVE MIR-CHKPT-PGM-ID      TO WCKPT-CHKPT-PGM-ID.

           SET L0280-SIGN-NOT-PERMITTED TO TRUE.
           MOVE ZERO                  TO L0280-PRECISION.
           MOVE LENGTH OF MIR-CHKPT-INSTC-ID
                                      TO L0280-INPUT-SIZE.
           COMPUTE L0280-LENGTH = L0280-INPUT-SIZE - 0.
           MOVE MIR-CHKPT-INSTC-ID    TO L0280-INPUT-DATA.
           PERFORM 0280-1000-NUMERIC-EDIT
              THRU 0280-1000-NUMERIC-EDIT-X.
           IF L0280-OK
              MOVE L0280-OUTPUT-V00   TO WCKPT-CHKPT-INSTC-ID
           END-IF.

           MOVE SPACE                 TO RCKPT-CHKPT-WRK-INFO-TEXT.

       7100-BUILD-CKPT-KEY-X.
           EXIT.

      /
      ****************************************************************
      *   CHECK KEY FIELDS:
      *   CHECK VALIDITY OF ALL KEY AND CONTROL FIELDS.
      *   NUMERIC FIELDS ARE RIGHT JUSTIFIED, ZERO FILLED AND CHECKED
      *   FOR VALIDITY.  DATE FIELDS ARE CHECKED FOR VALIDITY.
      ****************************************************************
      *----------------------
       8000-CHECK-KEY-FIELDS.
      *----------------------

      ****************************************************************
      *  EDIT PROGRAM NAME.
      ****************************************************************

           IF  WS-BUS-FCN-LIST
               NEXT SENTENCE
           ELSE
               MOVE MIR-CHKPT-PGM-ID  TO WXTAB-ETBL-VALU-ID
               PERFORM PRGM-1000-EDIT-PROGRAM-NAME
                  THRU PRGM-1000-EDIT-PROGRAM-NAME-X
               IF WXTAB-IO-OK
                   MOVE MIR-CHKPT-PGM-ID
                                      TO RCKPT-CHKPT-PGM-ID
               ELSE
      *** MSG (S) PROGRAM NAME MUST BE IN EDIT TYPE 'PROGM'
                   MOVE 'XS03900001'  TO WGLOB-MSG-REF-INFO
                   PERFORM 0260-1000-GENERATE-MESSAGE
                      THRU 0260-1000-GENERATE-MESSAGE-X
               END-IF
           END-IF.

      *****************************************************************
      *  EDIT INSTANCE NUMBER.
      *****************************************************************

      * FOR BROWSE AND CREATE, INSTANCE NUMBER IS OPTIONAL WITH 001 AS
      * DEFAULT VALUE
           IF  (WS-BUS-FCN-LIST
           OR   WS-BUS-FCN-CREATE)
           AND MIR-CHKPT-INSTC-ID =  SPACES
               SET  WS-INSTANCE-DEFAULT  TO TRUE
               MOVE WS-INSTANCE-NO    TO MIR-CHKPT-INSTC-ID
           ELSE
               MOVE ZERO              TO WS-INSTANCE-NO
               PERFORM  8100-EDIT-INSTANCE
                   THRU 8100-EDIT-INSTANCE-X
           END-IF.

       8000-CHECK-KEY-FIELDS-X.
           EXIT.

      /
      ****************************************************************
      *   EDIT INSTANCE #:
      *   ENSURE THAT THE SUPPLIED REQUIREMENT INSTANCE NUMBER
      *   IS NUMERIC.
      ****************************************************************
      *-------------------
       8100-EDIT-INSTANCE.
      *-------------------

           MOVE 'N'                   TO L0280-SIGN-IND.
           MOVE 0                     TO L0280-PRECISION.
           MOVE 3                     TO L0280-LENGTH.
           MOVE 3                     TO L0280-INPUT-SIZE.
           MOVE MIR-CHKPT-INSTC-ID    TO L0280-INPUT-DATA.

           PERFORM  0280-1000-NUMERIC-EDIT
               THRU 0280-1000-NUMERIC-EDIT-X.

           IF  L0280-OK
               IF  L0280-OUTPUT = ZERO
      * MSG : INSTANCE NUMBER MUST BE NUMERIC AND GREATER THAN ZERO
                   MOVE 'XS03900009'  TO WGLOB-MSG-REF-INFO
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
               ELSE
                   MOVE L0280-OUTPUT  TO WS-INSTANCE-NO
                   MOVE WS-INSTANCE-NO             TO MIR-CHKPT-INSTC-ID
                   GO TO 8100-EDIT-INSTANCE-X
               END-IF

           ELSE
      * MSG : INSTANCE NUMBER MUST BE NUMERIC AND GREATER THAN ZERO
               MOVE 'XS03900009'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.


       8100-EDIT-INSTANCE-X.
           EXIT.

      /

      *-----------------------
       9100-BLANK-DATA-FIELDS.
      *-----------------------

           IF WS-BUS-FCN-LIST
               MOVE SPACES            TO MIR-CHKPT-PGM-ID-G
               MOVE SPACES            TO MIR-CHKPT-INSTC-ID-G
               MOVE SPACES            TO MIR-COMIT-FREQ-UOW-QTY-G
               MOVE SPACES            TO MIR-COMIT-MIN-SEC-DUR-G
               MOVE SPACES            TO MIR-COMIT-MAX-SEC-DUR-G
               MOVE SPACES            TO MIR-CHKPT-STAT-CD-G
               MOVE SPACES            TO MIR-PREV-UPDT-USER-ID-G
               MOVE SPACES            TO MIR-PREV-UPDT-DT-G
           ELSE
               MOVE SPACES            TO MIR-COMIT-FREQ-UOW-QTY
               MOVE SPACES            TO MIR-COMIT-MIN-SEC-DUR
               MOVE SPACES            TO MIR-COMIT-MAX-SEC-DUR
               MOVE SPACES            TO MIR-CHKPT-STAT-CD
               MOVE SPACES            TO MIR-PREV-UPDT-USER-ID
               MOVE SPACES            TO MIR-PREV-UPDT-DT
               MOVE SPACES            TO MIR-CHKPT-WRK-INFO
013578*        MOVE SPACES            TO MIR-WKSTA02
013578*        MOVE SPACES            TO MIR-WKSTA03
           END-IF.

       9100-BLANK-DATA-FIELDS-X.
           EXIT.
      /

      *---------------------------
       9200-MOVE-RECORD-TO-SCREEN.
      *---------------------------

           EVALUATE TRUE

               WHEN WS-BUS-FCN-LIST


                   MOVE RCKPT-CHKPT-PGM-ID
                                      TO MIR-CHKPT-PGM-ID-T (WS-SUB)
                   MOVE RCKPT-CHKPT-INSTC-ID
                                      TO L0290-INPUT-NUMBER
                   MOVE 0             TO L0290-PRECISION
                   MOVE LENGTH OF MIR-CHKPT-INSTC-ID-T
                                      TO
                        L0290-MAX-OUT-LEN
                   PERFORM 0290-1000-NUMERIC-FORMAT
                      THRU 0290-1000-NUMERIC-FORMAT-X
                   MOVE L0290-OUTPUT-DATA
                                      TO MIR-CHKPT-INSTC-ID-T (WS-SUB)

                   MOVE RCKPT-COMIT-FREQ-UOW-QTY
                                      TO L0290-INPUT-NUMBER
                   MOVE 0             TO L0290-PRECISION
                   MOVE LENGTH OF MIR-COMIT-FREQ-UOW-QTY-T
                                      TO
                        L0290-MAX-OUT-LEN
                   PERFORM 0290-1000-NUMERIC-FORMAT
                      THRU 0290-1000-NUMERIC-FORMAT-X
                   MOVE L0290-OUTPUT-DATA
                                    TO MIR-COMIT-FREQ-UOW-QTY-T (WS-SUB)

                   MOVE RCKPT-COMIT-MIN-SEC-DUR
                                      TO L0290-INPUT-NUMBER
                   MOVE 0             TO L0290-PRECISION
                   MOVE LENGTH OF MIR-COMIT-MIN-SEC-DUR-T
                                      TO
                        L0290-MAX-OUT-LEN
                   PERFORM 0290-1000-NUMERIC-FORMAT
                      THRU 0290-1000-NUMERIC-FORMAT-X
                   MOVE L0290-OUTPUT-DATA
                                      TO
                        MIR-COMIT-MIN-SEC-DUR-T (WS-SUB)

                   MOVE RCKPT-COMIT-MAX-SEC-DUR
                                      TO L0290-INPUT-NUMBER
                   MOVE 0             TO L0290-PRECISION
                   MOVE LENGTH OF MIR-COMIT-MAX-SEC-DUR-T
                                      TO
                        L0290-MAX-OUT-LEN
                   PERFORM 0290-1000-NUMERIC-FORMAT
                      THRU 0290-1000-NUMERIC-FORMAT-X
                   MOVE L0290-OUTPUT-DATA
                                      TO
                        MIR-COMIT-MAX-SEC-DUR-T (WS-SUB)

                   MOVE RCKPT-CHKPT-STAT-CD
                                      TO MIR-CHKPT-STAT-CD-T (WS-SUB)
                   MOVE RCKPT-PREV-UPDT-USER-ID
                                     TO MIR-PREV-UPDT-USER-ID-T (WS-SUB)
                   MOVE RCKPT-PREV-UPDT-DT
                                      TO L1640-INTERNAL-DATE
                   PERFORM  1640-2000-INTERNAL-TO-EXT
                       THRU 1640-2000-INTERNAL-TO-EXT-X
                   MOVE L1640-EXTERNAL-DATE
                                      TO MIR-PREV-UPDT-DT-T (WS-SUB)

               WHEN WS-BUS-FCN-UPDATE
                 OR WS-BUS-FCN-CREATE
                 OR WS-BUS-FCN-RETRIEVE
                 OR WS-BUS-FCN-DELETE
                   MOVE RCKPT-COMIT-FREQ-UOW-QTY
                                      TO L0290-INPUT-NUMBER
                   MOVE 0             TO L0290-PRECISION
                   MOVE LENGTH OF MIR-COMIT-FREQ-UOW-QTY
                                      TO L0290-MAX-OUT-LEN
                   PERFORM 0290-1000-NUMERIC-FORMAT
                      THRU 0290-1000-NUMERIC-FORMAT-X
                   MOVE L0290-OUTPUT-DATA
                                      TO MIR-COMIT-FREQ-UOW-QTY

                   MOVE RCKPT-COMIT-MIN-SEC-DUR
                                      TO L0290-INPUT-NUMBER
                   MOVE 0             TO L0290-PRECISION
                   MOVE LENGTH OF MIR-COMIT-MIN-SEC-DUR
                                      TO L0290-MAX-OUT-LEN
                   PERFORM 0290-1000-NUMERIC-FORMAT
                      THRU 0290-1000-NUMERIC-FORMAT-X
                   MOVE L0290-OUTPUT-DATA
                                      TO MIR-COMIT-MIN-SEC-DUR

                   MOVE RCKPT-COMIT-MAX-SEC-DUR
                                      TO L0290-INPUT-NUMBER
                   MOVE 0             TO L0290-PRECISION
                   MOVE LENGTH OF MIR-COMIT-MAX-SEC-DUR
                                      TO L0290-MAX-OUT-LEN
                   PERFORM 0290-1000-NUMERIC-FORMAT
                      THRU 0290-1000-NUMERIC-FORMAT-X
                   MOVE L0290-OUTPUT-DATA
                                      TO MIR-COMIT-MAX-SEC-DUR

                   MOVE RCKPT-CHKPT-STAT-CD
                                      TO MIR-CHKPT-STAT-CD
                   MOVE RCKPT-PREV-UPDT-USER-ID
                                      TO MIR-PREV-UPDT-USER-ID
                   MOVE RCKPT-PREV-UPDT-DT
                                      TO
                        L1640-INTERNAL-DATE
                   PERFORM  1640-2000-INTERNAL-TO-EXT
                       THRU 1640-2000-INTERNAL-TO-EXT-X
                   MOVE L1640-EXTERNAL-DATE
                                      TO MIR-PREV-UPDT-DT
                   MOVE RCKPT-CHKPT-WRK-INFO-TEXT
013578                                TO MIR-CHKPT-WRK-INFO
013578*            MOVE WS-WKSTA (1)  TO MIR-CHKPT-WRK-INFO
013578*            MOVE WS-WKSTA (2)  TO MIR-WKSTA02
013578*            MOVE WS-WKSTA (3)  TO MIR-WKSTA03

           END-EVALUATE.

       9200-MOVE-RECORD-TO-SCREEN-X.
           EXIT.
      /

      *--------------------------
       9300-SETUP-MSIN-REFERENCE.
      *--------------------------

           MOVE SPACES                TO WGLOB-MSIN-REFERENCE.
           MOVE WGLOB-COMPANY-CODE    TO WGLOB-REF-COMPANY-CODE.

       9300-SETUP-MSIN-REFERENCE-X.
           EXIT.
      /


      ****************************************************************
      * PROCESSING COPYBOOKS                                         *
      ****************************************************************
       COPY XCPPINIT.
       COPY XCPPEXIT.
       COPY XCPEPRGM.
      /
      ****************************************************************
      * LINKING COPYBOOKS                                            *
      ****************************************************************

      *
      * LINK TO PROGRAM 0280 FOR NUMERIC EDITS
      *
       COPY XCPL0280.
      /
       COPY XCPS0290.
       COPY XCPL0290.
      /
       COPY XCPL1640.
      /
      ****************************************************************
      * MESSAGE PROCESSING COPYBOOKS
      ****************************************************************

013578*COPY XCPPMEXT.
      /
       COPY XCCL0260.

      *****************************************************************
      *  FILE I/O PROCESS MODULES
      *****************************************************************
      *COPY CCPNEDIT.
       COPY XCPNXTAB.
      /

       COPY XCPACKPT.
       COPY XCPBCKPT.
       COPY XCPCCKPT.
       COPY XCPNCKPT.
       COPY XCPUCKPT.
       COPY XCPXCKPT.

       COPY XCCPABND.
       COPY XCCP0030.
      *****************************************************************
      **                 END OF PROGRAM XSOM0390                     **
      *****************************************************************

