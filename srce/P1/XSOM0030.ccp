      *****************************************************************
      **  MEMBER :  XSOM0030                                         **
      **  REMARKS:  HANDLE CICS AND SQL ERROR CONDITIONS BY ROLLING  **
      **            BACK UPDATES AND ADDING AN ERROR LOG ENTRY.      **
      **            THIS MODULE HANDLES CICS AND SQL ERRORS BY       **
      **            PERFORMING CICS SYNCPOINT ROLLBACK TO UNDO THE   **
      **            UNIT OF WORK.  IT ALSO WRITES A RECORD TO THE    **
      **            ERROR LOG CONTAINING INFORMATION ABOUT THE ERROR **
      **            AND DELETES TSQS.  THE ERROR SCREEN IS DISPLAYED **
      **            TO THE TERMINAL OPERATOR.                        **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
015858**  15DEC99  60     ENHANCEMENT FOR TRACKING PROCESS PATH      **
01AR01**  16MAY01  MAW    ARCHITECTURAL CHANGES TO SUPPORT MULTIPLE  **
01AR01**                  CICS ENVIRONMENTS                          **
      *****************************************************************
      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM0030.

       COPY XCWWCRHT.

      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM0030'.

       COPY SQLCA.
       COPY XCWLPTR.


       01  WS-WORKING-STORAGE.
           05  WS-NUM-X.
               10  WS-NUM                   PIC 9(02).

           05  WS-SQLCODE                   PIC -9(05) VALUE ZERO.
           05  WS-ABEND-CODE                PIC X(04)  VALUE SPACES.
           05  WS-SQL-IO-DESC-TEXT          PIC X(50).

           05  WS-SQL-IMPRV-TEXT            PIC X(70).
           05  WS-SQL-ERROR-TEXT            PIC X(70).
           05  WS-GEN-TSQ-ERROR-TEXT        PIC X(70).
           05  WS-CICS-NOT-ACTIVE-TEXT      OCCURS 2  TIMES
                                            PIC X(70).
           05  WS-ERROR-LOG-ABEND-TEXT      OCCURS 2 TIMES
                                            PIC X(70).
           05  WS-SRC-REF-ID-N              PIC 9(05).
015858     05  WS-HOLD-CRNT-PGM-ID          PIC X(08).
015858     05  WS-HOLD-PREV-PGM-ID          PIC X(08).

       01  WS-BUFFER-AREA                   PIC X(04).

      /
       COPY XCWTEMSG.
      /
       COPY XCWWWKDT.
      /
01AR01 COPY XCWWENVT.
      /
       COPY XCFRERLG.
       COPY XCFWERLG.
      /
       COPY XCFHERLG.
       COPY XCFWERLH.

      /
       COPY XCWL0270.
014590*COPY XCWL0030.
NTDEV  COPY XCWL0035.
      /
      *****************
       LINKAGE SECTION.
      *****************

       01  DFHCOMMAREA.
       02  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /

      ********************
       PROCEDURE DIVISION.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------

015858     MOVE WGLOB-CRNT-PGM-ID          TO WS-HOLD-CRNT-PGM-ID.
015858     MOVE WGLOB-PREV-PGM-ID          TO WS-HOLD-PREV-PGM-ID.

           IF  WGLOB-OPTM-SQL-IMPRV
               NEXT SENTENCE
           ELSE
               EXEC CICS HANDLE ABEND
                    LABEL(6000-ERROR-LOG-ABENDED)
               END-EXEC
           END-IF.

           IF  WGLOB-OPTM-SQL-IMPRV
               PERFORM  1000-PROCESS-WARNING
                   THRU 1000-PROCESS-WARNING-X
           ELSE
               PERFORM  2000-PROCESS-ROLLBACK
                   THRU 2000-PROCESS-ROLLBACK-X
           END-IF.

           GOBACK.

       0000-MAINLINE-X.
           EXIT.

      *---------------------
       1000-PROCESS-WARNING.
      *---------------------

           PERFORM  3000-BUILD-ERROR-LOG
               THRU 3000-BUILD-ERROR-LOG-X.

      * CHECK IF THIS MESSAGE ALREADY EXISTS IN THE ERROR LOG
           MOVE RERLG-REC-INFO             TO  HERLG-REC-INFO.
           MOVE RERLG-ERROR-CRNT-PGM-ID    TO  WERLH-ERROR-CRNT-PGM-ID.
           MOVE RERLG-ERROR-DESC-TXT       TO  WERLH-ERROR-DESC-TXT.
           MOVE WERLH-KEY                  TO  WERLH-ENDBR-KEY.

           PERFORM  ERLH-4000-BROWSE-INDEX
               THRU ERLH-4000-BROWSE-INDEX-X.

015858     MOVE WS-HOLD-CRNT-PGM-ID        TO WGLOB-CRNT-PGM-ID.
015858     MOVE WS-HOLD-PREV-PGM-ID        TO WGLOB-PREV-PGM-ID.

           PERFORM  ERLH-5000-READ-NEXT-INDEX
               THRU ERLH-5000-READ-NEXT-INDEX-X.

015858     MOVE WS-HOLD-CRNT-PGM-ID        TO WGLOB-CRNT-PGM-ID.
015858     MOVE WS-HOLD-PREV-PGM-ID        TO WGLOB-PREV-PGM-ID.

           IF  WERLH-IO-EOF
               MOVE HERLG-REC-INFO         TO  RERLG-REC-INFO
               PERFORM  ERLG-1000-WRITE
                   THRU ERLG-1000-WRITE-X
015858         MOVE WS-HOLD-CRNT-PGM-ID    TO WGLOB-CRNT-PGM-ID
015858         MOVE WS-HOLD-PREV-PGM-ID    TO WGLOB-PREV-PGM-ID
           END-IF.

           PERFORM  ERLH-6000-END-BROWSE-INDEX
               THRU ERLH-6000-END-BROWSE-INDEX-X.

015858     MOVE WS-HOLD-CRNT-PGM-ID        TO WGLOB-CRNT-PGM-ID.
015858     MOVE WS-HOLD-PREV-PGM-ID        TO WGLOB-PREV-PGM-ID.

           PERFORM  2100-RETURN
               THRU 2100-RETURN-X.

       1000-PROCESS-WARNING-X.
           EXIT.


      *----------------------
       2000-PROCESS-ROLLBACK.
      *----------------------

01AR01     IF WENVT-IBM-CICS
MVS            EXEC CICS
MVS                 SYNCPOINT ROLLBACK
MVS            END-EXEC
01AR01     ELSE
NTDEV          PERFORM  0035-2000-ROLLBACK
NTDEV              THRU 0035-2000-ROLLBACK-X
01AR01     END-IF.

015858     MOVE WS-HOLD-CRNT-PGM-ID        TO WGLOB-CRNT-PGM-ID.
015858     MOVE WS-HOLD-PREV-PGM-ID        TO WGLOB-PREV-PGM-ID.

           EXEC CICS ASSIGN
                ABCODE(WGLOB-ABEND-CD)
           END-EXEC.
      *
      *  WRITE A RECORD ON THE ERROR LOG WHEN CICS ATTACH IS UP
      *
           PERFORM  3000-BUILD-ERROR-LOG
               THRU 3000-BUILD-ERROR-LOG-X.

           IF  WS-ABEND-CODE  =  'AEY9'
               CONTINUE
           ELSE
               PERFORM  ERLG-1000-WRITE
                   THRU ERLG-1000-WRITE-X
015858         MOVE WS-HOLD-CRNT-PGM-ID    TO WGLOB-CRNT-PGM-ID
015858         MOVE WS-HOLD-PREV-PGM-ID    TO WGLOB-PREV-PGM-ID
           END-IF.

      *
      *  WRITE AN ENTRY TO THE MSIN TABLE FOR BACKGROUND TASKS,
      *  AND RETURN FOR ALL ENVIRONMENT TYPES (INCLUDING GUI).
      *
           EVALUATE TRUE

               WHEN WGLOB-ENVRMNT-BACKGROUND
                    PERFORM  2300-WRITE-MSIN-AND-RETURN
                        THRU 2300-WRITE-MSIN-AND-RETURN-X

               WHEN OTHER
                    PERFORM  2100-RETURN
                        THRU 2100-RETURN-X

           END-EVALUATE.

       2000-PROCESS-ROLLBACK-X.
           EXIT.

      *-----------
       2100-RETURN.
      *-----------

           EXEC CICS
               RETURN
           END-EXEC.

       2100-RETURN-X.
           EXIT.
      /
      *---------------------------
       2300-WRITE-MSIN-AND-RETURN.
      *---------------------------
      *
      *  GENERATE MESSAGE, WHICH CAUSES MSIN RECORD TO BE WRITTEN
      *
           MOVE  'XS00300001'              TO  WGLOB-MSG-REF-INFO.
           IF  WGLOB-ABEND-CD  =  SPACES
           OR  WGLOB-ABEND-CD  =  'SQLC'
               MOVE  WGLOB-SQLCODE         TO  WGLOB-MSG-PARM (1)
           ELSE
               MOVE  WGLOB-ABEND-CD        TO  WGLOB-MSG-PARM (1)
           END-IF.

           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.
015858     MOVE WS-HOLD-CRNT-PGM-ID        TO WGLOB-CRNT-PGM-ID.
015858     MOVE WS-HOLD-PREV-PGM-ID        TO WGLOB-PREV-PGM-ID.

           PERFORM  2100-RETURN
               THRU 2100-RETURN-X.

       2300-WRITE-MSIN-AND-RETURN-X.
           EXIT.
      /
      *---------------------
       3000-BUILD-ERROR-LOG.
      *---------------------

           MOVE WGLOB-SYSTEM-DATE-INT      TO  WERLG-ERROR-DT.
           MOVE WGLOB-SYSTEM-TIME-INT      TO  WERLG-ERROR-TIME.
           MOVE WERLG-KEY                  TO  RERLG-KEY.
           MOVE WGLOB-USER-ID              TO  RERLG-USER-ID.
           MOVE WGLOB-BUS-FCN-ID           TO  RERLG-BUS-FCN-ID.
           MOVE WGLOB-CRNT-PGM-ID          TO  RERLG-ERROR-CRNT-PGM-ID.
           MOVE WGLOB-PREV-PGM-ID          TO  RERLG-ERROR-PREV-PGM-ID.

           EVALUATE TRUE

                WHEN WGLOB-SQL-ERROR
                     IF WGLOB-OPTM-SQL-IMPRV
                         PERFORM  7110-RETRIEVE-SQL-IMPRV-TEXT
                             THRU 7110-RETRIEVE-SQL-IMPRV-TEXT-X
                     END-IF
                     IF WGLOB-OPTM-SQL-ERROR
                         PERFORM  7120-RETRIEVE-SQL-ERROR-TEXT
                             THRU 7120-RETRIEVE-SQL-ERROR-TEXT-X
                     END-IF
                     PERFORM  7130-RETRIEVE-SQL-IODES-TEXT
                         THRU 7130-RETRIEVE-SQL-IODES-TEXT-X

                     PERFORM  3100-MOVE-SQL-INFO
                         THRU 3100-MOVE-SQL-INFO-X

                WHEN WGLOB-CICS-ERROR
                     PERFORM  3200-MOVE-CICS-INFO
                         THRU 3200-MOVE-CICS-INFO-X

                WHEN WGLOB-LOGIC-ERROR
                     PERFORM  3200-MOVE-CICS-INFO
                         THRU 3200-MOVE-CICS-INFO-X

           END-EVALUATE.


       3000-BUILD-ERROR-LOG-X.
           EXIT.


      *-------------------
       3100-MOVE-SQL-INFO.
      *-------------------

           MOVE WGLOB-TABLE-NAME               TO RERLG-ERROR-TBL-NM.

           EVALUATE TRUE

               WHEN WGLOB-OPTM-SQL-IMPRV
                    MOVE 'SQLW'                TO RERLG-ERROR-TYP-CD
                    MOVE SPACES                TO RERLG-ERROR-CD
                    MOVE WS-SQL-IMPRV-TEXT     TO RERLG-ERROR-DESC-TXT

               WHEN WGLOB-OPTM-SQL-ERROR
                    MOVE 'SQLE'                TO RERLG-ERROR-TYP-CD
                    MOVE SPACES                TO RERLG-ERROR-CD
                    MOVE WS-SQL-ERROR-TEXT     TO RERLG-ERROR-DESC-TXT

               WHEN OTHER
                    MOVE 'SQL'                 TO RERLG-ERROR-TYP-CD
                    MOVE WGLOB-SQLCODE         TO WS-SQLCODE
                    MOVE WS-SQLCODE            TO RERLG-ERROR-CD
                    MOVE WGLOB-ERROR-DESC-TXT  TO RERLG-ERROR-DESC-TXT

           END-EVALUATE.

           MOVE WS-SQL-IO-DESC-TEXT            TO  RERLG-ERROR-RQST-TXT.

       3100-MOVE-SQL-INFO-X.
           EXIT.


      *--------------------
       3200-MOVE-CICS-INFO.
      *--------------------

           IF  WGLOB-LOGIC-ERROR
               MOVE 'LGIC'                     TO  RERLG-ERROR-TYP-CD
           ELSE
               MOVE 'CICS'                     TO  RERLG-ERROR-TYP-CD
           END-IF.
           MOVE SPACES                         TO  RERLG-ERROR-TBL-NM.
           MOVE WGLOB-ABEND-CD                 TO  RERLG-ERROR-CD.
           MOVE SPACES                         TO  RERLG-ERROR-RQST-TXT.
           MOVE WGLOB-ABEND-CD                 TO  RERLG-ERROR-DESC-TXT.

       3200-MOVE-CICS-INFO-X.
           EXIT.

      /
      *-----------------------
       6000-ERROR-LOG-ABENDED.
      *-----------------------

           IF  WGLOB-OPTM-SQL-IMPRV
           OR  WGLOB-ENVRMNT-BACKGROUND
           OR  WGLOB-ENVRMNT-GUI
               PERFORM  2100-RETURN
                   THRU 2100-RETURN-X
           END-IF.

       6000-ERROR-LOG-ABENDED-X.
           EXIT.
      /
      *-----------------------------
       7110-RETRIEVE-SQL-IMPRV-TEXT.
      *-----------------------------

           MOVE TEMSG-GENERROR-RECORD (02)     TO L0270-MSG-IN.

           MOVE WGLOB-OPTM-SQL-REQIR           TO L0270-MSG-PARM (1).
           MOVE WGLOB-OPTM-SQL-EXEC            TO L0270-MSG-PARM (2).

           PERFORM  0270-1000-TOKEN-REPLACEMENT
               THRU 0270-1000-TOKEN-REPLACEMENT-X.
015858     MOVE WS-HOLD-CRNT-PGM-ID            TO WGLOB-CRNT-PGM-ID.
015858     MOVE WS-HOLD-PREV-PGM-ID            TO WGLOB-PREV-PGM-ID.

           IF  L0270-RETRN-OK
               MOVE L0270-MSG-OUT              TO WS-SQL-IMPRV-TEXT
           END-IF.

       7110-RETRIEVE-SQL-IMPRV-TEXT-X.
           EXIT.

      *-----------------------------
       7120-RETRIEVE-SQL-ERROR-TEXT.
      *-----------------------------

           MOVE TEMSG-GENERROR-RECORD (01)     TO L0270-MSG-IN.

           MOVE WGLOB-OPTM-SQL-REQIR           TO L0270-MSG-PARM (1).

           PERFORM  0270-1000-TOKEN-REPLACEMENT
               THRU 0270-1000-TOKEN-REPLACEMENT-X.
015858     MOVE WS-HOLD-CRNT-PGM-ID            TO WGLOB-CRNT-PGM-ID.
015858     MOVE WS-HOLD-PREV-PGM-ID            TO WGLOB-PREV-PGM-ID.

           IF  L0270-RETRN-OK
               MOVE L0270-MSG-OUT              TO WS-SQL-ERROR-TEXT
           END-IF.

       7120-RETRIEVE-SQL-ERROR-TEXT-X.
           EXIT.

      *-----------------------------
       7130-RETRIEVE-SQL-IODES-TEXT.
      *-----------------------------

           MOVE WGLOB-IO-COMMAND               TO WS-NUM-X.
           MOVE TEMSG-SQLIOERR-RECORD (WS-NUM) TO WS-SQL-IO-DESC-TEXT.

       7130-RETRIEVE-SQL-IODES-TEXT-X.
           EXIT.
      /
       COPY XCCL0260.
      /
NTDEV  COPY XCPL0035.
      /
       COPY XCCP0030.
      /
       COPY XCPAERLG.
      /
       COPY XCPBERLH.
      /
       COPY XCPL0270.

      *****************************************************************
      **                 END OF PROGRAM XSOM0030                     **
      *****************************************************************
