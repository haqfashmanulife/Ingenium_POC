      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM4917.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM4917                                         **
      **  REMARKS:  DMAD TABLE RETRIEVE PROCESS DRIVER FOR INITIAL   **
      **            LOAD OF ALL DATA MODEL VALUES.  SUBSET TABLES    **
      **            ARE INCLUDED AT THE END OF THE DATA FOR A COMPANY**
      **                                                             **
      **            THE STREAM FORMAT IS AS FOLLOWS:                 **
      **             KEY SEPARATOR                                   **
      **             COMPANY                                         **
      **             FIELD SEPARATOR                                 **
      **             LANGUAGE                                        **
      **             FIELD SEPARATOR                                 **
      **             AV-TBL-CD                                       **
      **             FIELD SEPARATOR                                 **
      **             SUBSET-TBL-CD                                   **
      **             DATA SEPARATOR                                  **
      **             DESCRIPTION                                     **
      **             FIELD SEPARATOR                                 **
      **             AV-CD                                           **
      **             RECORD SEPARATOR                                **
      **                                                             **
      **             DESCRIPTION AND AV-CD WILL REPEAT UNTIL ALL     **
      **             MEMBERS OF THE SUBSET ARE INCLUDED.             **
      **                                                             **
      **             THE NEXT TABLE BEGINS AGAIN WITH THE KEY        **
      **             SEPARATOR AND CONTINUES UNTIL THE DATA AREA IS  **
      **             FULL.                                           **
      **                                                             **
      **             WHERE THERE IS NO SUBSET, ONLY A DELIMITER WILL **
      **             BE SENT TO REPRESENT THAT NOTHING WAS           **
      **             TRANSMITTED IN THAT SPOT.                       **
      **                                                             **
      **                                                             **
      **  DOMAIN :  SY                                               **
      *****************************************************************
      **  RELEASE  DESCRIPTION                                       **
      **                                                             **
PF 13 **  1.3      RENAME FIELDS THAT ARE NOT STANDARD -- FIELD NAMES**
PF 13 **           ARE REPLACED INSTREAM AND NOT COMMENTED OUT       **
PF 13 **                                                             **
PF 13 **           OLD NAME               NEW NAME                   **
PF 13 **           MIR-DV-TOTAL-TABLES    MIR-DV-TOT-TBL-QTY         **
PF 13 **           MIR-DV-TOTAL-RECORDS   MIR-DV-TOT-REC-QTY         **
PF 13 **           MIR-DV-STREAM          MIR-DV-CHAR-DELIM-INFO     **
PF 20 ** 6.3.1     PATHFINDER 2.0 UPGRADE                            **
ADF128** 6.4       FIX DMAS LAST ENTRY                               **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************
      *
       WORKING-STORAGE SECTION.
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM4917'.
      /
       COPY SQLCA.
       COPY XCWLPTR.

      /
       01  WS-PGM-WORK-AREA.
           05  WS-IDX                                PIC S9(04) BINARY
                                                     VALUE 0.
           05  WS-TOTAL-RECORD-CNT                   PIC S9(04) BINARY
                                                     VALUE 0.
           05  WS-TOTAL-TABLE-CNT                    PIC S9(04) BINARY
                                                     VALUE 0.
           05  WS-CRNT-TABLE-REC-CNT                 PIC S9(04) BINARY
                                                     VALUE 0.
           05  WS-DISPLAY-X-4.
               10  WS-DISPLAY-9-4                    PIC 9(04).
           05  WS-BUS-FCN-ID                         PIC X(04).
               88  WS-BUS-FCN-VALID                  VALUE '4917'.
               88  WS-BUS-FCN-LIST                   VALUE '4917'.
           05  WS-STREAM-FULL-IND                    PIC X(01).
               88 WS-STREAM-FULL                     VALUE 'Y'.
               88 WS-STREAM-NOT-FULL                 VALUE 'N'.

           05  WS-RECORD-SEP-IDX                     PIC S9(04) BINARY
                                                     VALUE 0.
           05  WS-TABLE-SEP-IDX                      PIC S9(04) BINARY
                                                     VALUE 0.
           05  WS-ENGLISH                            PIC X(01)
                                                     VALUE 'E'.
      *  PARAMETER VALUES FOR COMPRESSION UTILITY
           05  WS-TRIM-DATA-LEN                      PIC S9(04) BINARY
                                                     VALUE 0.
           05  WS-NON-TRIM-DATA                      PIC X(80).
           05  WS-TRIM-DATA                          PIC X(81).
           05  WS-TRIM-DELIMITER                     PIC X(1).
               88  WS-TRIM-KEY-SEP                   VALUE ''.
               88  WS-TRIM-DATA-SEP                  VALUE ''.
               88  WS-TRIM-FIELD-SEP                 VALUE ''.
               88  WS-TRIM-RECORD-SEP                VALUE ''.


           05  WS-REC-CONTROL-INFO.
               10  WS-TABLE-ID                       PIC X(04).
                   88  WS-TABLE-DMAD                 VALUE 'DMAD'.
                   88  WS-TABLE-DMAS                 VALUE 'DMAS'.
               10  WS-IO-STATUS                      PIC 9(01).
                   88  WS-IO-OK                      VALUE 0.
                   88  WS-IO-EOF                     VALUE 8.

           05  WS-REC-INFO.
               10  WS-DM-AV-DESC-LANG-CD             PIC X(01).
               10  WS-CO-ID                          PIC X(02).
               10  WS-DM-AV-TBL-CD                   PIC X(30).
               10  WS-DM-AV-SUBSET-CD                PIC X(04).
               10  WS-DM-AV-DESC-TXT                 PIC X(80).
               10  WS-DM-AV-CD                       PIC X(15).

           05  WS-LAST-KEY.
               10  WS-LAST-DM-AV-DESC-LANG-CD        PIC X(01).
               10  WS-LAST-CO-ID                     PIC X(02).
               10  WS-LAST-DM-AV-TBL-CD              PIC X(30).
               10  WS-LAST-DM-AV-SUBSET-CD           PIC X(04).

           05  WS-CURRENT-KEY.
               10  WS-CURRENT-DM-AV-DESC-LANG-CD     PIC X(01).
               10  WS-CURRENT-CO-ID                  PIC X(02).
               10  WS-CURRENT-DM-AV-TBL-CD           PIC X(30).
               10  WS-CURRENT-DM-AV-SUBSET-CD        PIC X(04).

       COPY XCFRDMAD.
       COPY XCFWDMAE.

       COPY XCFRDMAT.
       COPY XCFWDMAT.

       COPY XCFRXTAB.
       COPY XCFWXTAB.
      /
       LINKAGE SECTION.

       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM4917.
      *
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                MIR-PARM-AREA.
      *
      *-------------
       0000-MAINLINE.
      *-------------
      *
           PERFORM  ABND-1000-HANDLE-ABEND
               THRU ABND-1000-HANDLE-ABEND-X.

           PERFORM  INIT-1000-INITIALIZE
               THRU INIT-1000-INITIALIZE-X.
      *
           PERFORM  2000-PROCESS-REQUEST
               THRU 2000-PROCESS-REQUEST-X.

           PERFORM  EXIT-1000-FINALIZE
               THRU EXIT-1000-FINALIZE-X.
      *
           GOBACK.
      *
       0000-MAINLINE-X.
           EXIT.
      *
      /
      *--------------------
       2000-PROCESS-REQUEST.
      *--------------------
      *
           MOVE MIR-BUS-FCN-ID             TO WS-BUS-FCN-ID.
           SET MIR-RETRN-OK                TO TRUE.

           EVALUATE TRUE

               WHEN WS-BUS-FCN-LIST
                    PERFORM  3000-PROCESS-LIST
                        THRU 3000-PROCESS-LIST-X

               WHEN OTHER
                    SET MIR-RETRN-INVALD-RQST
                      TO TRUE
                    GO TO 2000-PROCESS-REQUEST-X
           END-EVALUATE.

       2000-PROCESS-REQUEST-X.
           EXIT.

      /
      *-----------------
       3000-PROCESS-LIST.
      *-----------------
      *
      *  PROCESSING IS BY COMPANY ORDER AS DEFINED BY THE
      *  COMPANY CODES STORED IN THE XTAB TABLE 'COMP'.
      *  FOR EVERY COMPANY FOUND IN THIS TABLE, AN ATTEMPT
      *  WILL BE MADE TO EXTRACT THE DATA MODEL RECORDS
      *  DEFINED FOR THAT COMPANY.
      *
           MOVE +1                         TO WS-TOTAL-TABLE-CNT.
           MOVE +1                         TO WS-IDX.
           MOVE ZERO                       TO WS-TOTAL-RECORD-CNT.
           MOVE SPACES                     TO MIR-OUTPUT-AREA.
           SET WS-STREAM-NOT-FULL          TO TRUE.

      *  RETRIEVE COMPANY CODES

           MOVE LOW-VALUES                 TO WXTAB-KEY.
           MOVE 'COMP'                     TO WXTAB-ETBL-TYP-ID.
           IF MIR-CO-ID > SPACES
               MOVE MIR-CO-ID              TO WXTAB-ETBL-VALU-ID
           END-IF.
           MOVE 'E'                        TO WXTAB-ETBL-LANG-CD.
           MOVE WXTAB-KEY                  TO WXTAB-ENDBR-KEY.
           MOVE HIGH-VALUES                TO WXTAB-ENDBR-ETBL-VALU-ID.

           PERFORM  XTAB-1000-BROWSE
               THRU XTAB-1000-BROWSE-X.

           PERFORM  XTAB-2000-READ-NEXT
               THRU XTAB-2000-READ-NEXT-X.

           PERFORM  3100-PROCESS-ONE-COMPANY
               THRU 3100-PROCESS-ONE-COMPANY-X
              UNTIL WXTAB-IO-EOF
                 OR WS-STREAM-FULL.

           PERFORM  XTAB-3000-END-BROWSE
               THRU XTAB-3000-END-BROWSE-X.
PF 20 
PF 20      MOVE WS-TRIM-DELIMITER
PF 20        TO MIR-DV-CHAR-DELIM-INFO (WS-RECORD-SEP-IDX:).
PF 20 
PF 20      IF  WS-CRNT-TABLE-REC-CNT < 1
PF 20          MOVE WS-TRIM-DELIMITER
PF 20            TO MIR-DV-CHAR-DELIM-INFO (WS-TABLE-SEP-IDX:)
PF 20      END-IF.

       3000-PROCESS-LIST-X.
           EXIT.


      *------------------------
       3100-PROCESS-ONE-COMPANY.
      *------------------------
      *
           MOVE RXTAB-ETBL-VALU-ID         TO WGLOB-COMPANY-CODE.
           MOVE RXTAB-ETBL-VALU-ID         TO MIR-CO-ID.

           MOVE MIR-DM-AV-DESC-LANG-CD     TO WS-DM-AV-DESC-LANG-CD.
           MOVE MIR-CO-ID                  TO WS-CO-ID.
           MOVE MIR-DM-AV-TBL-CD           TO WS-DM-AV-TBL-CD.
           MOVE MIR-DM-AV-DESC-TXT         TO WS-DM-AV-DESC-TXT.
           MOVE MIR-DM-AV-CD               TO WS-DM-AV-CD.
           MOVE MIR-DM-AV-SUBSET-CD        TO WS-DM-AV-SUBSET-CD.

           IF  MIR-DM-AV-SUBSET-CD > SPACES
               SET WS-TABLE-DMAS           TO TRUE
           ELSE
               SET WS-TABLE-DMAD           TO TRUE
           END-IF.

           PERFORM  8500-SET-DATA-MODEL-KEY
               THRU 8500-SET-DATA-MODEL-KEY-X.

           SET  WS-STREAM-NOT-FULL         TO TRUE.

           PERFORM  8000-DATA-MODEL-BROWSE
               THRU 8000-DATA-MODEL-BROWSE-X.

           PERFORM  8100-DATA-MODEL-READ-NEXT
               THRU 8100-DATA-MODEL-READ-NEXT-X.

           IF WS-IO-OK
               MOVE WS-CO-ID               TO WS-CURRENT-CO-ID
               MOVE WS-DM-AV-DESC-LANG-CD
                 TO WS-CURRENT-DM-AV-DESC-LANG-CD
               MOVE WS-DM-AV-TBL-CD        TO WS-CURRENT-DM-AV-TBL-CD
               MOVE WS-DM-AV-SUBSET-CD     TO WS-CURRENT-DM-AV-SUBSET-CD
               MOVE WS-CURRENT-KEY         TO WS-LAST-KEY
               PERFORM  7000-NEW-KEY
                   THRU 7000-NEW-KEY-X
               MOVE WS-TOTAL-TABLE-CNT     TO WS-DISPLAY-9-4
PF 13          MOVE WS-DISPLAY-X-4         TO MIR-DV-TOT-TBL-QTY
           END-IF.

           PERFORM
               UNTIL WS-IO-EOF
                  OR WS-STREAM-FULL

               MOVE WS-DM-AV-DESC-LANG-CD
                 TO WS-CURRENT-DM-AV-DESC-LANG-CD
               MOVE WS-CO-ID               TO WS-CURRENT-CO-ID
               MOVE WS-DM-AV-TBL-CD        TO WS-CURRENT-DM-AV-TBL-CD
               MOVE WS-DM-AV-SUBSET-CD     TO WS-CURRENT-DM-AV-SUBSET-CD
               IF WS-CURRENT-KEY NOT = WS-LAST-KEY
                   MOVE WS-CURRENT-KEY     TO WS-LAST-KEY
                   PERFORM  7000-NEW-KEY
                       THRU 7000-NEW-KEY-X
                   IF WS-STREAM-NOT-FULL
                       ADD 1               TO WS-TOTAL-TABLE-CNT
                       MOVE WS-TOTAL-TABLE-CNT
                         TO WS-DISPLAY-9-4
PF 13                  MOVE WS-DISPLAY-X-4 TO MIR-DV-TOT-TBL-QTY
                   END-IF
               END-IF

               IF  WS-STREAM-NOT-FULL
                   PERFORM  3110-ADD-RECORD
                       THRU 3110-ADD-RECORD-X
               END-IF

               IF  WS-STREAM-NOT-FULL
                   PERFORM  8100-DATA-MODEL-READ-NEXT
                       THRU 8100-DATA-MODEL-READ-NEXT-X
               END-IF

           END-PERFORM.

ADF128     IF WS-IO-EOF
ADF128         ADD 1                       TO WS-TOTAL-TABLE-CNT
ADF128         MOVE WS-TOTAL-TABLE-CNT     TO WS-DISPLAY-9-4
ADF128         MOVE WS-DISPLAY-X-4         TO MIR-DV-TOT-TBL-QTY
ADF128     END-IF.

           IF  NOT WS-IO-EOF
               SET WGLOB-MORE-DATA-EXISTS  TO TRUE
               MOVE WS-DM-AV-DESC-TXT      TO MIR-DM-AV-DESC-TXT
               MOVE WS-DM-AV-CD            TO MIR-DM-AV-CD
               MOVE WS-DM-AV-DESC-LANG-CD  TO MIR-DM-AV-DESC-LANG-CD
               MOVE WS-CO-ID               TO MIR-CO-ID
               MOVE WS-DM-AV-TBL-CD        TO MIR-DM-AV-TBL-CD
               MOVE WS-DM-AV-SUBSET-CD     TO MIR-DM-AV-SUBSET-CD
           END-IF.

           PERFORM  8200-DATA-MODEL-END-BROWSE
               THRU 8200-DATA-MODEL-END-BROWSE-X.

           IF  WS-STREAM-NOT-FULL
               MOVE SPACES                 TO RXTAB-ETBL-LANG-CD
               PERFORM  XTAB-2000-READ-NEXT
                   THRU XTAB-2000-READ-NEXT-X
                  UNTIL RXTAB-ETBL-LANG-CD = WS-ENGLISH
                     OR WXTAB-IO-EOF
               MOVE SPACES                 TO MIR-DM-AV-DESC-LANG-CD
               MOVE SPACES                 TO MIR-CO-ID
               MOVE SPACES                 TO MIR-DM-AV-TBL-CD
               MOVE SPACES                 TO MIR-DM-AV-DESC-TXT
               MOVE SPACES                 TO MIR-DM-AV-CD
               MOVE SPACES                 TO MIR-DM-AV-SUBSET-CD
PF 20 *    ELSE
PF 20 *        IF  WS-CRNT-TABLE-REC-CNT < 1
PF 20 *            MOVE SPACES
PF 20 *                   TO MIR-DV-CHAR-DELIM-INFO (WS-TABLE-SEP-IDX:)
PF 20 *        ELSE
PF 20 *            MOVE SPACES
PF 20 *                   TO MIR-DV-CHAR-DELIM-INFO (WS-RECORD-SEP-IDX:)
PF 20 *        END-IF
           END-IF.

       3100-PROCESS-ONE-COMPANY-X.
           EXIT.

      *---------------
       3110-ADD-RECORD.
      *---------------
      * THIS PARAGRAPH APPENDS THE CODE AND DESCRIPTION TO THE STREAM.
      * FOR EVERY RECORD READ, APPEND THE CODE AND DESCRIPTION,
      * UPDATE THE FIELD WS-IDX TO TRACK YOUR POSITION IN THE STREAM,
      * AND SET WS-STREAM-FULL FLAG WHEN WS-IDX EXCEEDS LENGTH OF THE
      * STREAM.

           MOVE WS-IDX                     TO WS-RECORD-SEP-IDX.
           MOVE WS-DM-AV-CD                TO WS-NON-TRIM-DATA.
           MOVE LENGTH OF WS-DM-AV-CD      TO WS-TRIM-DATA-LEN.
           PERFORM  9000-TRIM
               THRU 9000-TRIM-X.
PF 13      IF ((WS-IDX + WS-TRIM-DATA-LEN)
PF 13                             < LENGTH OF MIR-DV-CHAR-DELIM-INFO)
PF 13          MOVE WS-TRIM-DATA     TO MIR-DV-CHAR-DELIM-INFO (WS-IDX:)
               ADD  WS-TRIM-DATA-LEN       TO WS-IDX
               SET  WS-TRIM-FIELD-SEP      TO TRUE
           ELSE
               SET WS-STREAM-FULL          TO TRUE
               GO TO 3110-ADD-RECORD-X
           END-IF.

           MOVE WS-DM-AV-DESC-TXT          TO WS-NON-TRIM-DATA.
           MOVE LENGTH OF WS-DM-AV-DESC-TXT TO WS-TRIM-DATA-LEN.
           PERFORM  9000-TRIM
               THRU 9000-TRIM-X.
PF 13      IF ((WS-IDX + WS-TRIM-DATA-LEN)
PF 13                             < LENGTH OF MIR-DV-CHAR-DELIM-INFO)
PF 13          MOVE WS-TRIM-DATA     TO MIR-DV-CHAR-DELIM-INFO (WS-IDX:)
               ADD  WS-TRIM-DATA-LEN       TO WS-IDX
               SET  WS-TRIM-RECORD-SEP     TO TRUE
           ELSE
               SET WS-STREAM-FULL          TO TRUE
               GO TO 3110-ADD-RECORD-X
           END-IF.

           ADD +1                          TO WS-CRNT-TABLE-REC-CNT.
           ADD +1                          TO WS-TOTAL-RECORD-CNT.
           MOVE WS-TOTAL-RECORD-CNT        TO WS-DISPLAY-9-4.
PF 13      MOVE WS-DISPLAY-X-4             TO MIR-DV-TOT-REC-QTY.
ADF128     MOVE WS-IDX                     TO WS-RECORD-SEP-IDX.


       3110-ADD-RECORD-X.
           EXIT.

      *------------
       7000-NEW-KEY.
      *------------
      *  KEY ORDER:  LANGUAGE
      *              COMPANY
      *              TABLE
      *              SUBSET
      *
      *  SUBSET WILL BE NULL FOR THE CASES WHERE THERE IS NO SUBSET
      *  DEFINED IN DMAS.  FOR THOSE SITUATIONS, THE DELIMITER ONLY
      *  WILL BE LEFT ON THE RECORD.
      *

           MOVE ZERO                       TO WS-CRNT-TABLE-REC-CNT.
           MOVE WS-IDX                     TO WS-RECORD-SEP-IDX.
           MOVE WS-IDX                     TO WS-TABLE-SEP-IDX.
           SET  WS-TRIM-KEY-SEP            TO TRUE.
           MOVE WS-LAST-CO-ID              TO WS-NON-TRIM-DATA.
           MOVE LENGTH OF WS-LAST-CO-ID    TO WS-TRIM-DATA-LEN.
           PERFORM  9000-TRIM
               THRU 9000-TRIM-X.
PF 13      IF ((WS-IDX + WS-TRIM-DATA-LEN)
PF 13                             < LENGTH OF MIR-DV-CHAR-DELIM-INFO)
PF 13          MOVE WS-TRIM-DATA     TO MIR-DV-CHAR-DELIM-INFO (WS-IDX:)
               ADD  WS-TRIM-DATA-LEN       TO WS-IDX
           ELSE
               SET WS-STREAM-FULL          TO TRUE
               GO TO 7000-NEW-KEY-X
           END-IF.

           SET  WS-TRIM-FIELD-SEP          TO TRUE.
           MOVE WS-LAST-DM-AV-DESC-LANG-CD TO WS-NON-TRIM-DATA.
           MOVE LENGTH OF WS-LAST-DM-AV-DESC-LANG-CD
             TO WS-TRIM-DATA-LEN.
           PERFORM  9000-TRIM
               THRU 9000-TRIM-X.
PF 13      IF ((WS-IDX + WS-TRIM-DATA-LEN)
PF 13                                < LENGTH OF MIR-DV-CHAR-DELIM-INFO)
PF 13          MOVE WS-TRIM-DATA     TO MIR-DV-CHAR-DELIM-INFO (WS-IDX:)
               ADD  WS-TRIM-DATA-LEN       TO WS-IDX
           ELSE
               SET WS-STREAM-FULL          TO TRUE
               GO TO 7000-NEW-KEY-X
           END-IF.

           MOVE WS-LAST-DM-AV-TBL-CD       TO WS-NON-TRIM-DATA.
           MOVE LENGTH OF WS-LAST-DM-AV-TBL-CD
             TO WS-TRIM-DATA-LEN.
           SET  WS-TRIM-FIELD-SEP          TO TRUE.
           PERFORM  9000-TRIM
               THRU 9000-TRIM-X.
PF 13      IF ((WS-IDX + WS-TRIM-DATA-LEN)
PF 13                               < LENGTH OF MIR-DV-CHAR-DELIM-INFO)
PF 13          MOVE WS-TRIM-DATA    TO MIR-DV-CHAR-DELIM-INFO (WS-IDX:)
               ADD  WS-TRIM-DATA-LEN       TO WS-IDX
           ELSE
               SET WS-STREAM-FULL          TO TRUE
               GO TO 7000-NEW-KEY-X
           END-IF.

           MOVE WS-LAST-DM-AV-SUBSET-CD    TO WS-NON-TRIM-DATA.
           MOVE LENGTH OF WS-LAST-DM-AV-SUBSET-CD
             TO WS-TRIM-DATA-LEN.
           SET  WS-TRIM-FIELD-SEP          TO TRUE.
           PERFORM  9000-TRIM
               THRU 9000-TRIM-X.
PF 13      IF ((WS-IDX + WS-TRIM-DATA-LEN)
PF 13                                < LENGTH OF MIR-DV-CHAR-DELIM-INFO)
PF 13          MOVE WS-TRIM-DATA     TO MIR-DV-CHAR-DELIM-INFO (WS-IDX:)
               ADD  WS-TRIM-DATA-LEN       TO WS-IDX
           ELSE
               SET WS-STREAM-FULL          TO TRUE
               GO TO 7000-NEW-KEY-X
           END-IF.

           SET WS-TRIM-DATA-SEP            TO TRUE.

       7000-NEW-KEY-X.
           EXIT.

      *--------------------------
       8000-DATA-MODEL-BROWSE.
      *--------------------------

           EVALUATE TRUE
               WHEN WS-TABLE-DMAD
                   PERFORM  DMAE-1000-TBL-BROWSE
                       THRU DMAE-1000-TBL-BROWSE-X

               WHEN WS-TABLE-DMAS
                   PERFORM  DMAT-1000-BROWSE
                       THRU DMAT-1000-BROWSE-X

           END-EVALUATE.

       8000-DATA-MODEL-BROWSE-X.
           EXIT.

      *-----------------------------
       8100-DATA-MODEL-READ-NEXT.
      *-----------------------------

           EVALUATE TRUE
               WHEN WS-TABLE-DMAD
                   PERFORM  8110-READ-NEXT-DMAD
                       THRU 8110-READ-NEXT-DMAD-X

               WHEN WS-TABLE-DMAS
                   PERFORM  8120-READ-NEXT-DMAS
                       THRU 8120-READ-NEXT-DMAS-X

           END-EVALUATE.

       8100-DATA-MODEL-READ-NEXT-X.
           EXIT.

      *-------------------
       8110-READ-NEXT-DMAD.
      *-------------------

           PERFORM  DMAE-2000-TBL-READ-NEXT
               THRU DMAE-2000-TBL-READ-NEXT-X.
           MOVE WDMAE-IO-STATUS            TO WS-IO-STATUS.
           IF WS-IO-OK
               MOVE RDMAD-DM-AV-DESC-LANG-CD TO WS-DM-AV-DESC-LANG-CD
               MOVE RDMAD-CO-ID            TO WS-CO-ID
               MOVE RDMAD-DM-AV-TBL-CD     TO WS-DM-AV-TBL-CD
               MOVE RDMAD-DM-AV-DESC-TXT   TO WS-DM-AV-DESC-TXT
               MOVE RDMAD-DM-AV-CD         TO WS-DM-AV-CD
               MOVE SPACES                 TO WS-DM-AV-SUBSET-CD
               GO TO 8110-READ-NEXT-DMAD-X
           END-IF.

           IF WS-IO-EOF
               PERFORM  DMAE-3000-TBL-END-BROWSE
                   THRU DMAE-3000-TBL-END-BROWSE-X

               MOVE LOW-VALUES             TO WS-REC-INFO
               PERFORM  8520-SET-DMAS-KEY
                   THRU 8520-SET-DMAS-KEY-X

               SET WS-TABLE-DMAS           TO TRUE
               PERFORM  DMAT-1000-BROWSE
                   THRU DMAT-1000-BROWSE-X
               PERFORM  8120-READ-NEXT-DMAS
                   THRU 8120-READ-NEXT-DMAS-X
           ELSE
               MOVE SPACES                 TO WS-REC-INFO
           END-IF.

       8110-READ-NEXT-DMAD-X.
           EXIT.

      *-------------------
       8120-READ-NEXT-DMAS.
      *-------------------

           PERFORM  DMAT-2000-READ-NEXT
               THRU DMAT-2000-READ-NEXT-X.
           MOVE WDMAT-IO-STATUS            TO WS-IO-STATUS.
           IF WS-IO-OK
               MOVE RDMAT-DM-AV-DESC-LANG-CD TO WS-DM-AV-DESC-LANG-CD
               MOVE RDMAT-CO-ID            TO WS-CO-ID
               MOVE RDMAT-DM-AV-TBL-CD     TO WS-DM-AV-TBL-CD
               MOVE RDMAT-DM-AV-DESC-TXT   TO WS-DM-AV-DESC-TXT
               MOVE RDMAT-DM-AV-CD         TO WS-DM-AV-CD
               MOVE RDMAT-DM-AV-SUBSET-CD  TO WS-DM-AV-SUBSET-CD
           ELSE
               MOVE SPACES                 TO WS-REC-INFO
           END-IF.

       8120-READ-NEXT-DMAS-X.
           EXIT.

      *--------------------------
       8200-DATA-MODEL-END-BROWSE.
      *--------------------------

           EVALUATE TRUE
               WHEN WS-TABLE-DMAD
                   PERFORM  DMAE-3000-TBL-END-BROWSE
                       THRU DMAE-3000-TBL-END-BROWSE-X

               WHEN WS-TABLE-DMAS
                   PERFORM  DMAT-3000-END-BROWSE
                       THRU DMAT-3000-END-BROWSE-X

           END-EVALUATE.

       8200-DATA-MODEL-END-BROWSE-X.
           EXIT.

      *-----------------------
       8500-SET-DATA-MODEL-KEY.
      *-----------------------

           EVALUATE TRUE
               WHEN WS-TABLE-DMAD
                   PERFORM  8510-SET-DMAD-KEY
                       THRU 8510-SET-DMAD-KEY-X

               WHEN WS-TABLE-DMAS
                   PERFORM  8520-SET-DMAS-KEY
                       THRU 8520-SET-DMAS-KEY-X

           END-EVALUATE.


       8500-SET-DATA-MODEL-KEY-X.
           EXIT.

      *-----------------
       8510-SET-DMAD-KEY.
      *-----------------

           MOVE WS-CO-ID                   TO WDMAE-CO-ID.
           MOVE WS-DM-AV-DESC-LANG-CD      TO WDMAE-DM-AV-DESC-LANG-CD.
           MOVE WS-DM-AV-TBL-CD            TO WDMAE-DM-AV-TBL-CD.
           MOVE WS-DM-AV-DESC-TXT          TO WDMAE-DM-AV-DESC-TXT.
           MOVE WS-DM-AV-CD                TO WDMAE-DM-AV-CD.
           MOVE HIGH-VALUES                TO WDMAE-ENDBR-KEY.

       8510-SET-DMAD-KEY-X.
           EXIT.

      *-----------------
       8520-SET-DMAS-KEY.
      *-----------------

           MOVE WS-CO-ID                   TO WDMAT-CO-ID.
           MOVE WS-DM-AV-DESC-LANG-CD      TO WDMAT-DM-AV-DESC-LANG-CD.
           MOVE WS-DM-AV-TBL-CD            TO WDMAT-DM-AV-TBL-CD.
           MOVE WS-DM-AV-SUBSET-CD         TO WDMAT-DM-AV-SUBSET-CD.
           MOVE WS-DM-AV-DESC-TXT          TO WDMAT-DM-AV-DESC-TXT.
           MOVE WS-DM-AV-CD                TO WDMAT-DM-AV-CD.
           MOVE HIGH-VALUES                TO WDMAT-ENDBR-KEY.

       8520-SET-DMAS-KEY-X.
           EXIT.

      *---------
       9000-TRIM.
      *---------

           PERFORM
               VARYING WS-TRIM-DATA-LEN
                  FROM WS-TRIM-DATA-LEN BY -1
                 UNTIL WS-TRIM-DATA-LEN = 1
                    OR WS-NON-TRIM-DATA (WS-TRIM-DATA-LEN:1) NOT = SPACE
           END-PERFORM.

           MOVE WS-TRIM-DELIMITER          TO WS-TRIM-DATA.
           MOVE WS-NON-TRIM-DATA           TO WS-TRIM-DATA(2:).
           ADD +1                          TO WS-TRIM-DATA-LEN.

       9000-TRIM-X.
           EXIT.
      /
      *
      *****************************************************
      * PROCESSING COPYBOOKS                              *
      *****************************************************
       COPY XCPPINIT.

       COPY XCPPEXIT.
      /
       COPY XCCPABND.
       COPY XCCP0030.
      *****************************************************
      * FILE I/O PROCESS MODULES                          *
      *****************************************************
       COPY XCPTDMAE.
       COPY XCPBDMAT.
       COPY XCPBXTAB.
      /
      ******************************************************************
      *                END OF PROGRAM XSOM4917                         *
      ******************************************************************

