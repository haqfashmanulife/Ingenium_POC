      *****************************************************************
      **  MEMBER :  XSRU0030                                         **
      **  REMARKS: BATCH ERROR ROLLBACK AND LOG PROGRAM.  THIS       **
      **           PROGRAM HANDLES SQL, QSAM, CONTROL CARD AND       **
      **           LOGIC ERRORS ENCOUNTERED BY BATCH PROGRAMS.  IT   **
      **           ALSO HANDLES SQL OPTIMIZATION WARNING MESSAGES.   **
      **           FOR THE DB2 PLATFORM, AN SQL ROLLBACK IS          **
      **           PERFORMED FOR ALL ERROR CONDITIONS TO ROLLBACK    **
      **           THE UNIT OF WORK.  FOR BOTH ERROR AND WARNING     **
      **           CONDITIONS, A RECORD IS WRITTEN TO THE ERROR LOG  **
      **           TABLE.  ERROR CONDITIONS ARE ALSO DISPLAYED ON    **
      **           OCF PRINT.                                        **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
557658**  30SEP97  JTS    REPLACE SYSTEM DATE EXTRACTION LOGIC       **
557756**  30SEP97  SC     ENHANCED MULTIPLE LANGUAGE SUPPORT         **
007684**  30OCT98  56     CHECKPOINT/RESTART                         **
010311**  30OCT98  56     CODE CLEANUP AND STANDARDIZATION  - APPLIED**
010311**                  NEW NAMING/NUMBERING SCHEME TO TXT MESSAGES**
010311**                  REMOVED OLD LOGIC, COMMENTED OUT CODE, AND **
010311**                  RESTRUCTURED PARAGRAPHS TO BE MORE READABLE**
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
MP310E**  05AUG18   MP310E - INGENIUM  SCV INTERFACE                 **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSRU0030.

       COPY XCWWCRHT.

      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRU0030'.

       COPY SQLCA.

       01  WS-WORK-FIELDS.
           05  WS-SUB.
557756         10  WS-SUB-N                 PIC 9(05).
           05  WS-RETURN-CODE               PIC S9(4) COMP VALUE ZERO.
           05  WS-FORMAT-TIME.
               10  WS-FORMAT-HOUR           PIC X(02).
               10  FILLER                   PIC X(01)  VALUE '.'.
               10  WS-FORMAT-MIN            PIC X(02).
               10  FILLER                   PIC X(01)  VALUE '.'.
               10  WS-FORMAT-SEC            PIC X(02).
           05  WS-SQLCODE                   PIC -9(05).
014590     05  WS-OPTM-SQL-MSG-IND          PIC X(01).
014590         88  WS-OPTM-SQL-MSG-FOUND     VALUE 'F'.
014590         88  WS-OPTM-SQL-MSG-NOT-FOUND VALUE 'N'.


       01  WS-ABEND-DESC-TABLE-FILLER.
           05  FILLER                            PIC X(95) VALUE SPACE.
           05  FILLER                            PIC X(95) VALUE SPACE.
           05  FILLER                            PIC X(95) VALUE SPACE.
557756     05  WS-ABEND-DESC-LINE1               PIC X(95).
           05  FILLER                            PIC X(95) VALUE SPACE.
           05  FILLER                            PIC X(95) VALUE SPACE.
557756     05  WS-ABEND-DESC-LINE2               PIC X(95).
557756     05  WS-ABEND-DESC-LINE3               PIC X(95).
           05  FILLER                            PIC X(95) VALUE SPACE.
557756     05  WS-ABEND-DESC-LINE4               PIC X(95).
557756     05  WS-ABEND-DESC-LINE5               PIC X(95).
           05  FILLER                            PIC X(95) VALUE SPACE.
557756     05  WS-ABEND-DESC-LINE6               PIC X(95).
557756     05  WS-ABEND-DESC-LINE7               PIC X(95).
557756     05  WS-ABEND-DESC-LINE8               PIC X(95).
557756     05  WS-ABEND-DESC-LINE9               PIC X(95).
557756     05  WS-ABEND-DESC-LINE10              PIC X(95).
           05  FILLER                            PIC X(95) VALUE SPACE.
           05  WS-AD-ERLG-MSG                    PIC X(95) VALUE SPACE.
           05  FILLER                            PIC X(95) VALUE SPACE.

       01  WS-ABEND-DESC-TABLE                   REDEFINES
           WS-ABEND-DESC-TABLE-FILLER.
557756     05  WS-AD-LINE                        OCCURS 20 PIC X(95).
      /
       COPY XCWTEMSG.
       COPY XCWTFCMD.
      /
       COPY XCWWWKDT.
      /
       COPY XCWL0035.
       COPY XCWL0040.
010311 COPY XCWL0270.
557658 COPY XCWL1610.
      /
       COPY XCFWERLG.
       COPY XCFRERLG.
       COPY XCFHERLG.
       COPY XCFWERLH.
      /
014590*COPY XCWL0030.
      *****************
       LINKAGE SECTION.
      *****************

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.

014590 PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA.

      ****************
       0000-MAIN-LINE.
      ****************

      ***********************************************************
      **                                                       **
      **   THE FOLLOWING SQL RELATED CODE SHOULD BE            **
      **   UNCOMMENTED FOR THE DB2 VERSION OF THIS PROGRAM.    **
      **                                                       **
      ***********************************************************

014590     IF  WGLOB-OPTM-SQL-IMPRV
               NEXT SENTENCE
           ELSE
               PERFORM  0035-2000-ROLLBACK
                   THRU 0035-2000-ROLLBACK-X
           END-IF.

557658     PERFORM  1610-1000-GET-DATE-TIME
557658         THRU 1610-1000-GET-DATE-TIME-X.
557658     MOVE L1610-SYSTEM-DATE-INT    TO WERLG-ERROR-DT.
557658     MOVE L1610-SYSTEM-TIME-INT-HH TO WS-FORMAT-HOUR.
557658     MOVE L1610-SYSTEM-TIME-INT-MM TO WS-FORMAT-MIN.
557658     MOVE L1610-SYSTEM-TIME-INT-SS TO WS-FORMAT-SEC.

           MOVE WS-FORMAT-TIME           TO WERLG-ERROR-TIME.
           MOVE WERLG-KEY                TO RERLG-KEY.


           MOVE 'BATCH'                  TO RERLG-USER-ID.
014590     MOVE WGLOB-bus-fcn-id         TO RERLG-bus-fcn-id.
014590     MOVE WGLOB-TABLE-NAME         TO RERLG-ERROR-TBL-NM.
014590     MOVE WGLOB-CRNT-PGM-ID        TO RERLG-ERROR-CRNT-PGM-ID.
014590     MOVE WGLOB-PREV-PGM-ID        TO RERLG-ERROR-PREV-PGM-ID.
           SET  WS-OPTM-SQL-MSG-NOT-FOUND  TO  TRUE.
      *
      *    INITIALIZE THE DESCRIPTION FIELDS
      *
           MOVE SPACES                   TO RERLG-ERROR-RQST-TXT.
           MOVE SPACES                   TO RERLG-ERROR-DESC-TXT.

           EVALUATE TRUE

014590         WHEN WGLOB-SQL-ERROR
                  PERFORM 1000-SQL-ERROR
                     THRU 1000-SQL-ERROR-X

014590         WHEN WGLOB-QSAM-ERROR
                  PERFORM 3000-QSAM-ERROR
                     THRU 3000-QSAM-ERROR-X

014590        WHEN WGLOB-CTL-CARD-ERROR
                  PERFORM 4000-CTL-CARD-ERROR
                     THRU 4000-CTL-CARD-ERROR-X

014590        WHEN WGLOB-LOGIC-ERROR
                  PERFORM 5000-LOGIC-ERROR
                     THRU 5000-LOGIC-ERROR-X
MP310E
MP310E        WHEN WGLOB-COMUN-ERROR
MP310E            PERFORM 5500-COMUN-ERROR
MP310E               THRU 5500-COMUN-ERROR-X
MP310E
           END-EVALUATE.

           IF  WS-OPTM-SQL-MSG-NOT-FOUND
                PERFORM  ERLG-1000-WRITE
                    THRU ERLG-1000-WRITE-X
           END-IF.

014590     IF  WGLOB-OPTM-SQL-IMPRV
               GOBACK
           ELSE
               PERFORM  0035-1000-COMMIT
                   THRU 0035-1000-COMMIT-X
           END-IF.

           PERFORM 6000-OUTPUT-ABEND-DESCR
              THRU 6000-OUTPUT-ABEND-DESCR-X.

           MOVE +99                       TO WS-RETURN-CODE.
           CALL 'ILBOABN0' USING WS-RETURN-CODE.
           STOP RUN.

       0000-MAIN-LINE-X.
           EXIT.
      /
      ****************
       1000-SQL-ERROR.
      ****************
010311*  THIS PARAGRAPH HAS BEEN RESTRUCTURED TO NOT GO TO THE TEXT
010311*  TABLE FOR DESCRIPTIONS.  ALL CODE MAKING REFERENCES
010311*  TO 2490 LOOKUPS AND ALL COMMENTED OUT CODE HAS BEEN REMOVED.

010311     EVALUATE TRUE
010311
014590         WHEN WGLOB-OPTM-SQL-IMPRV
010311*MSG: Warning, required optimization level @1 not found,
010311*     @2 was executed
010311              MOVE 'SQLW'                TO RERLG-ERROR-TYP-CD
010311              MOVE SPACES                TO RERLG-ERROR-CD
010311              MOVE TEMSG-GENERROR-RECORD (02)  TO L0270-MSG-IN
014590              MOVE WGLOB-OPTM-SQL-REQIR  TO L0270-MSG-PARM (1)
014590              MOVE WGLOB-OPTM-SQL-EXEC   TO L0270-MSG-PARM (2)
010311              PERFORM  0270-1000-TOKEN-REPLACEMENT
010311                  THRU 0270-1000-TOKEN-REPLACEMENT-X
010311              MOVE L0270-MSG-OUT         TO RERLG-ERROR-DESC-TXT
014590* CHECK IF THIS MESSAGE ALREADY EXISTS IN THE ERROR LOG
014590              MOVE RERLG-REC-INFO        TO  HERLG-REC-INFO
014590              MOVE RERLG-ERROR-CRNT-PGM-ID
014590                                      TO  WERLH-ERROR-CRNT-PGM-ID
014590              MOVE RERLG-ERROR-DESC-TXT  TO  WERLH-ERROR-DESC-TXT
014590              MOVE WERLH-KEY             TO  WERLH-ENDBR-KEY
014590
014590              PERFORM  ERLH-4000-BROWSE-INDEX
014590                  THRU ERLH-4000-BROWSE-INDEX-X
014590
014590              PERFORM  ERLH-5000-READ-NEXT-INDEX
014590                  THRU ERLH-5000-READ-NEXT-INDEX-X
014590
014590              IF  WERLH-IO-OK
014590                  SET  WS-OPTM-SQL-MSG-FOUND TO  TRUE
014590              END-IF
014590
014590              PERFORM  ERLH-6000-END-BROWSE-INDEX
014590                  THRU ERLH-6000-END-BROWSE-INDEX-X
014590
014590              MOVE HERLG-REC-INFO    TO  RERLG-REC-INFO


014590         WHEN WGLOB-OPTM-SQL-ERROR
010311*MSG: Required optimization level @1 not found in SQL I/O program
010311              MOVE 'SQLE'                TO RERLG-ERROR-TYP-CD
010311              MOVE SPACES                TO RERLG-ERROR-CD
010311              MOVE TEMSG-GENERROR-RECORD (01)  TO L0270-MSG-IN
014590              MOVE WGLOB-OPTM-SQL-REQIR  TO L0270-MSG-PARM (1)
010311              PERFORM  0270-1000-TOKEN-REPLACEMENT
010311                  THRU 0270-1000-TOKEN-REPLACEMENT-X
010311              MOVE L0270-MSG-OUT         TO RERLG-ERROR-DESC-TXT

010311         WHEN OTHER
010311              MOVE 'SQL'                 TO RERLG-ERROR-TYP-CD
014590              MOVE WGLOB-SQLCODE         TO WS-SQLCODE
010311              MOVE WS-SQLCODE            TO RERLG-ERROR-CD
014590              MOVE WGLOB-ERROR-DESC-TXT  TO RERLG-ERROR-DESC-TXT
010311
010311     END-EVALUATE.

014590     IF  WGLOB-IO-COMMAND NOT NUMERIC
010311         MOVE TEMSG-GENERROR-RECORD (6)
                 TO RERLG-ERROR-RQST-TXT
010311     ELSE
014590         MOVE WGLOB-IO-COMMAND           TO WS-SUB-N
010311         MOVE TEMSG-SQLIOERR-RECORD (WS-SUB-N)
010311           TO RERLG-ERROR-RQST-TXT
010311     END-IF.

       1000-SQL-ERROR-X.
           EXIT.

      *****************
       3000-QSAM-ERROR.
      *****************
010311*  THIS PARAGRAPH HAS BEEN RESTRUCTURED TO NOT GO TO THE TEXT
010311*  TABLE FOR DESCRIPTIONS.  ALL CODE MAKING REFERENCES
010311*  TO 2490 LOOKUPS AND ALL COMMENTED OUT CODE HAS BEEN REMOVED.

010311     MOVE 'QSAM'                    TO RERLG-ERROR-TYP-CD.
014590     MOVE WGLOB-SEQ-FILE-STATUS     TO RERLG-ERROR-CD.
010311     MOVE TEMSG-GENERROR-RECORD (5) TO RERLG-ERROR-DESC-TXT.
010311
014590     IF  WGLOB-IO-COMMAND NOT NUMERIC
010311         MOVE TEMSG-GENERROR-RECORD (6) TO RERLG-ERROR-RQST-TXT
010311     ELSE
014590         MOVE WGLOB-IO-COMMAND           TO WS-SUB-N
010311         MOVE TEMSG-QSAMERR-RECORD (WS-SUB-N)
010311           TO RERLG-ERROR-RQST-TXT
010311     END-IF.

       3000-QSAM-ERROR-X.
           EXIT.

      *********************
       4000-CTL-CARD-ERROR.
      *********************
010311*  THIS PARAGRAPH HAS BEEN RESTRUCTURED TO NOT GO TO THE TEXT
010311*  TABLE FOR DESCRIPTIONS.  ALL CODE MAKING REFERENCES
010311*  TO 2490 LOOKUPS AND ALL COMMENTED OUT CODE HAS BEEN REMOVED.

010311     MOVE 'CARD'                    TO RERLG-ERROR-TYP-CD.
014590     MOVE WGLOB-SEQ-FILE-STATUS     TO RERLG-ERROR-CD.
010311     MOVE TEMSG-GENERROR-RECORD (3) TO RERLG-ERROR-RQST-TXT.

       4000-CTL-CARD-ERROR-X.
           EXIT.

      ******************
       5000-LOGIC-ERROR.
      ******************
010311*  THIS PARAGRAPH HAS BEEN RESTRUCTURED TO NOT GO TO THE TEXT
010311*  TABLE FOR DESCRIPTIONS.  ALL CODE MAKING REFERENCES
010311*  TO 2490 LOOKUPS AND ALL COMMENTED OUT CODE HAS BEEN REMOVED.

010311     MOVE 'LGIC'                    TO RERLG-ERROR-TYP-CD.
014590     MOVE WGLOB-SEQ-FILE-STATUS     TO RERLG-ERROR-CD.
010311     MOVE TEMSG-GENERROR-RECORD (4) TO RERLG-ERROR-RQST-TXT.

       5000-LOGIC-ERROR-X.
           EXIT.
MP310E
MP310E******************
MP310E 5500-COMUN-ERROR.
MP310E******************
MP310E
MP310E     MOVE 'COMU'                      TO RERLG-ERROR-TYP-CD.
MP310E     MOVE 'COMU'                      TO RERLG-ERROR-CD.
MP310E     MOVE WGLOB-ERROR-DESC-TXT        TO RERLG-ERROR-DESC-TXT.
MP310E     MOVE SPACES                      TO RERLG-ERROR-RQST-TXT.
MP310E
MP310E 5500-COMUN-ERROR-X.
MP310E     EXIT.
MP310E/
      *************************
       6000-OUTPUT-ABEND-DESCR.
      *************************

557756     PERFORM  7200-RETRIEVE-ABEND-DESC
557756         THRU 7200-RETRIEVE-ABEND-DESC-X
010311      VARYING WS-SUB-N FROM 1 BY 1
010311        UNTIL WS-SUB-N > 10.

           PERFORM  6100-OUTPUT-ABEND-DESCR-LINE
               THRU 6100-OUTPUT-ABEND-DESCR-LINE-X
            VARYING WS-SUB-N FROM +1 BY +1
              UNTIL WS-SUB-N > +20.

       6000-OUTPUT-ABEND-DESCR-X.
           EXIT.

      ******************************
       6100-OUTPUT-ABEND-DESCR-LINE.
      ******************************

014590     IF WGLOB-TABLE-NAME = 'OCF '
557756        DISPLAY WS-AD-LINE (WS-SUB-N)
           ELSE
557756        MOVE WS-AD-LINE (WS-SUB-N) TO L0040-INPUT-LINE
              PERFORM 0040-3000-WRITE-OTHER
                 THRU 0040-3000-WRITE-OTHER-X
           END-IF.

       6100-OUTPUT-ABEND-DESCR-LINE-X.
           EXIT.
      /
557756**************************
557756 7200-RETRIEVE-ABEND-DESC.
557756**************************

           MOVE TEMSG-ABENDERR-RECORD (WS-SUB-N)  TO L0270-MSG-IN.

557756     EVALUATE TRUE
557756
010311         WHEN WS-SUB-N = 6
557756              MOVE RERLG-KEY    TO L0270-MSG-PARM (1)
557756
010311         WHEN WS-SUB-N = 7
557756              MOVE RERLG-ERROR-CD
557756                                TO L0270-MSG-PARM (1)
557756
010311         WHEN WS-SUB-N = 8
557756              MOVE RERLG-ERROR-TBL-NM
557756                                TO L0270-MSG-PARM (1)
557756
010311         WHEN WS-SUB-N = 9
557756              MOVE RERLG-ERROR-DESC-TXT
557756                                TO L0270-MSG-PARM (1)
557756
010311         WHEN WS-SUB-N = 10
557756              PERFORM  7210-MOVE-ERROR-RQST-PARM
557756                  THRU 7210-MOVE-ERROR-RQST-PARM-X
557756
557756     END-EVALUATE.
557756
010311     PERFORM  0270-1000-TOKEN-REPLACEMENT
010311         THRU 0270-1000-TOKEN-REPLACEMENT-X.
557756
557756     EVALUATE TRUE
557756
010311         WHEN WS-SUB-N = 1
557756              MOVE L0270-MSG-OUT     TO WS-ABEND-DESC-LINE1
557756
010311         WHEN WS-SUB-N = 2
557756              MOVE L0270-MSG-OUT     TO WS-ABEND-DESC-LINE2
557756
010311         WHEN WS-SUB-N = 3
557756              MOVE L0270-MSG-OUT     TO WS-ABEND-DESC-LINE3
557756
010311         WHEN WS-SUB-N = 4
557756              MOVE L0270-MSG-OUT     TO WS-ABEND-DESC-LINE4
557756
010311         WHEN WS-SUB-N = 5
557756              MOVE L0270-MSG-OUT     TO WS-ABEND-DESC-LINE5
557756
010311         WHEN WS-SUB-N = 6
557756              MOVE L0270-MSG-OUT     TO WS-ABEND-DESC-LINE6
557756
010311         WHEN WS-SUB-N = 7
557756              MOVE L0270-MSG-OUT     TO WS-ABEND-DESC-LINE7
557756
010311         WHEN WS-SUB-N = 8
557756              MOVE L0270-MSG-OUT     TO WS-ABEND-DESC-LINE8
557756
010311         WHEN WS-SUB-N = 9
557756              MOVE L0270-MSG-OUT     TO WS-ABEND-DESC-LINE9
557756
010311         WHEN WS-SUB-N = 10
010311              MOVE L0270-MSG-OUT     TO WS-ABEND-DESC-LINE10
557756
557756     END-EVALUATE.
557756
557756
557756 7200-RETRIEVE-ABEND-DESC-X.
557756     EXIT.

557756***************************
557756 7210-MOVE-ERROR-RQST-PARM.
557756***************************
557756
557756     IF  RERLG-ERROR-RQST-TXT > SPACES
557756         MOVE RERLG-ERROR-RQST-TXT  TO L0270-MSG-PARM (1)
557756     ELSE
557756         MOVE 'N/A'                 TO L0270-MSG-PARM (1)
557756     END-IF.
557756
557756 7210-MOVE-ERROR-RQST-PARM-X.
557756     EXIT.
      /
      *********************
       0030-1000-SQL-ERROR.
      *********************

           MOVE TEMSG-ABENDERR-RECORD (11) TO L0270-MSG-IN.
557756     MOVE SQLCODE                   TO L0270-MSG-PARM (1).
010311     PERFORM  0270-1000-TOKEN-REPLACEMENT
010311         THRU 0270-1000-TOKEN-REPLACEMENT-X.
557756     MOVE L0270-MSG-OUT             TO WS-AD-ERLG-MSG.

       0030-1000-SQL-ERROR-X.
           EXIT.
      /
      **  NON-IO COPYBOOKS
       COPY XCPL0035.
       COPY XCPL0040.
557658 COPY XCPL1610.
010311 COPY XCPL0270.
      /
      *----------------------
       0030-5000-LOGIC-ERROR.
      *----------------------

           MOVE L0270-MSG-IN          TO L0270-MSG-OUT.

       0030-5000-LOGIC-ERROR-X.
           EXIT.
      **      IO COPYBOOKS
       COPY XCPAERLG.
014590 COPY XCPBERLH.
      /
      *****************************************************************
      **                 END OF PROGRAM XSRU0030                     **
      *****************************************************************
