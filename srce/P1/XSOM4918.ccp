      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM4918.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM4918                                         **
      **  REMARKS:  XTAB TABLE RETRIEVE PROCESS DRIVER FOR INITIAL   **
      **            LOAD OF ALL EDIT TABLE VALUES.                   **
      **                                                             **
      **            THE STREAM FORMAT IS AS FOLLOWS:                 **
      **             KEY SEPARATOR                                   **
      **             LANGUAGE                                        **
      **             FIELD SEPARATOR                                 **
      **             TABLE TYPE ID                                   **
      **             DATA SEPARATOR                                  **
      **             DESCRIPTION                                     **
      **             FIELD SEPARATOR                                 **
      **             TABLE VALUE                                     **
      **             RECORD SEPARATOR                                **
      **                                                             **
      **             DESCRIPTION AND TABLE VALUE WILL REPEAT UNTIL   **
      **             ALL MEMBERS OF THE SUBSET ARE INCLUDED.         **
      **                                                             **
      **             THE NEXT TABLE BEGINS AGAIN WITH THE KEY        **
      **             SEPARATOR AND CONTINUES UNTIL THE DATA AREA IS  **
      **             FULL.                                           **
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
PF 13 **  1.3      CORRECTION TO LOGIC THAT BLANKED OUT THE LAST     **
PF 13 **           RECORD IN THE FILE                                **
PF 20 **  6.3.1    PATHFINDER 2.0 UPGRADE                            **
      *****************************************************************
      /
      *--------------------
       ENVIRONMENT DIVISION.
      *--------------------

      *-------------
       DATA DIVISION.
      *-------------
      *
       WORKING-STORAGE SECTION.
      *
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM4918'.
      /
       COPY SQLCA.
       COPY XCWLPTR.

      /
       01  WS-PGM-WORK-AREA.
           05  WS-IDX                 PIC S9(04) BINARY VALUE 0.
           05  WS-TOTAL-RECORD-CNT    PIC S9(04) BINARY VALUE 0.
           05  WS-TOTAL-TABLE-CNT     PIC S9(04) BINARY VALUE 0.
           05  WS-CRNT-TABLE-REC-CNT  PIC S9(04) BINARY VALUE 0.
           05  WS-DISPLAY-X-4.
               10  WS-DISPLAY-9-4     PIC 9(04).
           05  WS-BUS-FCN-ID          PIC X(04).
               88  WS-BUS-FCN-VALID         VALUE '4918'.
               88  WS-BUS-FCN-LIST          VALUE '4918'.
           05  WS-STREAM-FULL-IND     PIC X(01).
               88 WS-STREAM-FULL      VALUE 'Y'.
               88 WS-STREAM-NOT-FULL  VALUE 'N'.

           05  WS-RECORD-SEP-IDX      PIC S9(04) BINARY VALUE 0.
           05  WS-TABLE-SEP-IDX       PIC S9(04) BINARY VALUE 0.

      *  PARAMETER VALUES FOR COMPRESSION UTILITY
           05  WS-TRIM-DATA-LEN       PIC S9(04) BINARY VALUE 0.
           05  WS-NON-TRIM-DATA       PIC X(80).
           05  WS-TRIM-DATA           PIC X(81).
           05  WS-TRIM-DELIMITER      PIC X(1).
               88  WS-TRIM-KEY-SEP    VALUE ''.
               88  WS-TRIM-DATA-SEP   VALUE ''.
               88  WS-TRIM-FIELD-SEP  VALUE ''.
               88  WS-TRIM-RECORD-SEP VALUE ''.

           05  WS-LAST-KEY.
               10  WS-LAST-ETBL-TYP-ID               PIC X(05).
               10  WS-LAST-ETBL-LANG-CD              PIC X(01).

           05  WS-CURRENT-KEY.
               10  WS-CURRENT-ETBL-TYP-ID            PIC X(05).
               10  WS-CURRENT-ETBL-LANG-CD           PIC X(01).

       COPY XCFRXTAB.
       COPY XCFWXTAD.
      /
       LINKAGE SECTION.

       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM4918.
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
      *--------------------
       2000-PROCESS-REQUEST.
      *--------------------
      *
           MOVE MIR-BUS-FCN-ID        TO WS-BUS-FCN-ID.
           SET MIR-RETRN-OK           TO TRUE.

           EVALUATE TRUE

               WHEN WS-BUS-FCN-LIST
                    PERFORM  3000-PROCESS-LIST
                        THRU 3000-PROCESS-LIST-X

               WHEN OTHER
                    SET MIR-RETRN-INVALD-RQST TO TRUE
                    GO TO 2000-PROCESS-REQUEST-X
           END-EVALUATE.

       2000-PROCESS-REQUEST-X.
           EXIT.

      /
      *-----------------
       3000-PROCESS-LIST.
      *-----------------

           MOVE SPACES                 TO MIR-OUTPUT-AREA.

           MOVE LOW-VALUES             TO WXTAD-KEY.
           MOVE MIR-ETBL-LANG-CD       TO WXTAD-ETBL-LANG-CD.
           MOVE MIR-ETBL-TYP-ID        TO WXTAD-ETBL-TYP-ID.
           MOVE MIR-ETBL-DESC-TXT      TO WXTAD-ETBL-DESC-TXT.
           MOVE MIR-ETBL-VALU-ID       TO WXTAD-ETBL-VALU-ID.

           MOVE HIGH-VALUES            TO WXTAD-ENDBR-KEY.
           SET  WS-STREAM-NOT-FULL     TO TRUE.

           PERFORM  XTAD-1000-TBL-BROWSE
               THRU XTAD-1000-TBL-BROWSE-X.

           PERFORM  XTAD-2000-TBL-READ-NEXT
               THRU XTAD-2000-TBL-READ-NEXT-X.

           IF WXTAD-IO-OK
               MOVE WXTAD-KEY          TO WS-CURRENT-KEY
               MOVE WXTAD-KEY          TO WS-LAST-KEY
               MOVE +1                 TO WS-TOTAL-TABLE-CNT
               MOVE +1                 TO WS-IDX
               PERFORM  3100-NEW-KEY
                   THRU 3100-NEW-KEY-X
               MOVE WS-TOTAL-TABLE-CNT TO WS-DISPLAY-9-4
PF 13          MOVE WS-DISPLAY-X-4     TO MIR-DV-TOT-TBL-QTY
           END-IF.

           PERFORM
               UNTIL WXTAD-IO-EOF
                  OR WS-STREAM-FULL

               MOVE WXTAD-KEY          TO WS-CURRENT-KEY
               IF WS-CURRENT-KEY NOT = WS-LAST-KEY
                   MOVE WXTAD-KEY        TO WS-LAST-KEY
                   PERFORM  3100-NEW-KEY
                       THRU 3100-NEW-KEY-X
                   IF WS-STREAM-NOT-FULL
                       ADD 1                 TO WS-TOTAL-TABLE-CNT
                       MOVE WS-TOTAL-TABLE-CNT TO WS-DISPLAY-9-4
PF 13                  MOVE WS-DISPLAY-X-4   TO MIR-DV-TOT-TBL-QTY
                   END-IF
               END-IF

               PERFORM  3200-ADD-RECORD
                   THRU 3200-ADD-RECORD-X

               IF  WS-STREAM-NOT-FULL
                   PERFORM  XTAD-2000-TBL-READ-NEXT
                       THRU XTAD-2000-TBL-READ-NEXT-X
               END-IF

           END-PERFORM.

           IF  NOT WXTAD-IO-EOF
               SET WGLOB-MORE-DATA-EXISTS TO TRUE
               MOVE RXTAB-ETBL-DESC-TXT   TO MIR-ETBL-DESC-TXT
               MOVE RXTAB-ETBL-VALU-ID    TO MIR-ETBL-VALU-ID
               MOVE RXTAB-ETBL-LANG-CD    TO MIR-ETBL-LANG-CD
               MOVE RXTAB-ETBL-TYP-ID     TO MIR-ETBL-TYP-ID
           END-IF.

           PERFORM  XTAD-3000-TBL-END-BROWSE
               THRU XTAD-3000-TBL-END-BROWSE-X.

PF 20      MOVE WS-TRIM-DELIMITER
PF 20        TO MIR-DV-CHAR-DELIM-INFO (WS-RECORD-SEP-IDX:).
PF 20 
PF 20      IF  WS-CRNT-TABLE-REC-CNT < 1
PF 20          MOVE WS-TRIM-DELIMITER
PF 20            TO MIR-DV-CHAR-DELIM-INFO (WS-TABLE-SEP-IDX:)
PF 20      END-IF.

PF 20 *    IF  WS-CRNT-TABLE-REC-CNT < 1
PF 20 *        MOVE SPACES TO MIR-DV-CHAR-DELIM-INFO (WS-TABLE-SEP-IDX:)
PF 20 *    ELSE
PF 20 *        MOVE SPACES
PF 20 *                   TO MIR-DV-CHAR-DELIM-INFO (WS-RECORD-SEP-IDX:)
PF 20 *    END-IF.
       3000-PROCESS-LIST-X.
           EXIT.

      *------------
       3100-NEW-KEY.
      *------------

           MOVE ZERO               TO WS-CRNT-TABLE-REC-CNT.
           MOVE WS-IDX             TO WS-RECORD-SEP-IDX.
           MOVE WS-IDX             TO WS-TABLE-SEP-IDX.
           MOVE RXTAB-ETBL-LANG-CD TO WS-NON-TRIM-DATA.
           MOVE LENGTH OF RXTAB-ETBL-LANG-CD
             TO WS-TRIM-DATA-LEN.
           SET  WS-TRIM-KEY-SEP    TO TRUE.
           PERFORM  9000-TRIM
               THRU 9000-TRIM-X.
PF 13      IF ((WS-IDX + WS-TRIM-DATA-LEN)
PF 13                                < LENGTH OF MIR-DV-CHAR-DELIM-INFO)
PF 13          MOVE WS-TRIM-DATA     TO MIR-DV-CHAR-DELIM-INFO (WS-IDX:)
               ADD  WS-TRIM-DATA-LEN  TO WS-IDX
           ELSE
               SET WS-STREAM-FULL     TO TRUE
               GO TO 3100-NEW-KEY-X
           END-IF.

           MOVE RXTAB-ETBL-TYP-ID  TO WS-NON-TRIM-DATA.
           MOVE LENGTH OF RXTAB-ETBL-TYP-ID
             TO WS-TRIM-DATA-LEN.
           SET  WS-TRIM-FIELD-SEP  TO TRUE.
           PERFORM  9000-TRIM
               THRU 9000-TRIM-X.
PF 13      IF ((WS-IDX + WS-TRIM-DATA-LEN)
PF 13                                < LENGTH OF MIR-DV-CHAR-DELIM-INFO)
PF 13          MOVE WS-TRIM-DATA     TO MIR-DV-CHAR-DELIM-INFO (WS-IDX:)
               ADD  WS-TRIM-DATA-LEN  TO WS-IDX
           ELSE
               SET WS-STREAM-FULL     TO TRUE
               GO TO 3100-NEW-KEY-X
           END-IF.

           SET WS-TRIM-DATA-SEP    TO TRUE.

       3100-NEW-KEY-X.
           EXIT.

      *---------------
       3200-ADD-RECORD.
      *---------------

PF 13 *    MOVE WS-IDX                TO WS-RECORD-SEP-IDX.
           MOVE RXTAB-ETBL-VALU-ID    TO WS-NON-TRIM-DATA.
           MOVE LENGTH OF RXTAB-ETBL-VALU-ID
             TO WS-TRIM-DATA-LEN.
           PERFORM  9000-TRIM
               THRU 9000-TRIM-X.
PF 13      IF ((WS-IDX + WS-TRIM-DATA-LEN)
PF 13                                < LENGTH OF MIR-DV-CHAR-DELIM-INFO)
PF 13          MOVE WS-TRIM-DATA     TO MIR-DV-CHAR-DELIM-INFO (WS-IDX:)
               ADD  WS-TRIM-DATA-LEN  TO WS-IDX
               SET  WS-TRIM-FIELD-SEP TO TRUE
           ELSE
               SET WS-STREAM-FULL     TO TRUE
               GO TO 3200-ADD-RECORD-X
           END-IF.

           MOVE RXTAB-ETBL-DESC-TXT   TO WS-NON-TRIM-DATA.
           MOVE LENGTH OF RXTAB-ETBL-DESC-TXT
             TO WS-TRIM-DATA-LEN.
           PERFORM  9000-TRIM
               THRU 9000-TRIM-X.
PF 13      IF ((WS-IDX + WS-TRIM-DATA-LEN)
PF 13                                < LENGTH OF MIR-DV-CHAR-DELIM-INFO)
PF 13          MOVE WS-TRIM-DATA     TO MIR-DV-CHAR-DELIM-INFO (WS-IDX:)
               ADD  WS-TRIM-DATA-LEN  TO WS-IDX
               SET  WS-TRIM-RECORD-SEP TO TRUE
           ELSE
               SET WS-STREAM-FULL     TO TRUE
               GO TO 3200-ADD-RECORD-X
           END-IF.

           ADD +1                     TO WS-CRNT-TABLE-REC-CNT.
           ADD +1                     TO WS-TOTAL-RECORD-CNT.
           MOVE WS-TOTAL-RECORD-CNT   TO WS-DISPLAY-9-4.
PF 13      MOVE WS-DISPLAY-X-4        TO MIR-DV-TOT-REC-QTY.
PF 13      MOVE WS-IDX                TO WS-RECORD-SEP-IDX.

       3200-ADD-RECORD-X.
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

           MOVE WS-TRIM-DELIMITER     TO WS-TRIM-DATA.
           MOVE WS-NON-TRIM-DATA      TO WS-TRIM-DATA(2:).
           ADD +1                     TO WS-TRIM-DATA-LEN.


       9000-TRIM-X.
           EXIT.
      /
      *
      *****************************************************
      * PROCESSING COPYBOOKS                              *
      *****************************************************
       COPY XCPPINIT.
      /
       COPY XCPPEXIT.
      /
      *****************************************************
      * FILE I/O PROCESS MODULES                          *
      *****************************************************
       COPY XCPTXTAD.

       COPY XCCPABND.
       COPY XCCP0030.
      ******************************************************************
      *                END OF PROGRAM XSOM4918                         *
      ******************************************************************

