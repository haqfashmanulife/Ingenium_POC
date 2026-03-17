      *************************
       IDENTIFICATION DIVISION.
      *************************
      
       PROGRAM-ID. ZSBMCLNM.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  ZSBMCLNM                                         **
      **  REMARKS:  ONE TIME PROGRAM TO REMOVE ALL LEADING/TRAILING  **
      **            SPACES FROM CLIENT FIRST NAME AND LAST NAME      **
      **                                                             **
      **  DOMAIN :  CL                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  24NOV05  CTS    NEW PROGRAM                                **
      *****************************************************************
      *
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCLNM'.

       COPY SQLCA.
       COPY XCWLPTR.
      *
       COPY XCWL0015.
       COPY XCWL0040.
       COPY XCWTFCMD.
       COPY NCWWPARM.
      *
       COPY NCWL0960.
      *
       01  WS-PROGRAM-WORK-AREA.
           05  WS-SAVE-COMPANY-CODE         PIC X(02).
           05  WS-UPDATE-IND                PIC X(01).
               88 GIV-NM-UPDATE             VALUE 'G'.
               88 CO-NM-UPDATE              VALUE 'C'.
               88 UPDATE-NOT-REQUIRED       VALUE 'N'.
           05  WS-SUR-NM-UPDATE-IND         PIC X(01).
               88 SUR-NM-UPDATE             VALUE 'S'.
               88 NO-UPDATE                 VALUE 'N'.
           05  WS-CLIENT-AGENT-IND          PIC X(01).
               88 CLIENT-AGENT              VALUE 'Y'.
               88 NOT-CLIENT-AGENT          VALUE 'N'.
           05  WS-CLIENT-GROUP-IND          PIC X(01).
               88 CLIENT-GROUP              VALUE 'Y'.
               88 NOT-CLIENT-GROUP          VALUE 'N'.
           05  WS-CHECK-SB-SPACE            PIC X(01).
               88 SB-SPACE                  VALUE 'Y'.
               88 NOT-SB-SPACE              VALUE 'N'.
           05  WS-DB-SPACE                  PIC X(02) VALUE X'8140'.
           05  WS-SB-SPACE-SPACE            PIC X(02) VALUE X'2020'.
           05  WS-SB-SPACE                  PIC X(01) VALUE X'20'.
           05  WS-I                         PIC 9(04) COMP.
           05  WS-J                         PIC 9(04) COMP.
           05  WS-LEN-NM                    PIC S9(02).
           05  WS-LEN-REMN                  PIC S9(02).
           05  WS-DB-SPACE-COUNT            PIC S9(02).
           05  WS-NM-UNCOMP-FIRST           PIC X(50).
           05  WS-NM-UNCOMP-LAST            PIC X(50).
           05  WS-COMPRESSED-NAME           PIC X(50).
           05  WS-NM.
               10  WS-NM-FIRST              PIC X(01).
               10  WS-NM-REST               PIC X(49).
           05  WS-NM-COMPRESSED             PIC X(50).
           05  WS-NM-COMP-DATA-R            REDEFINES
                                            WS-NM-COMPRESSED.
               10  WS-NM-COMP               PIC X
                                            OCCURS 50 TIMES.
           05  WS-NM-DBCS-DATA              PIC X(50).
           05  WS-NM-DBCS-DATA-R            REDEFINES
                                            WS-NM-DBCS-DATA.
               10  WS-NM-DBCS               PIC X
                                            OCCURS 50 TIMES.
                                              
   
       01  WS-RECORD-COUNTERS.
           05  WS-CLI-RECORDS-READ          PIC S9(08).
           05  WS-CLNM-RECORDS-READ         PIC S9(08).
           05  WS-CLNM-RECORDS-UPDATED      PIC S9(08).
      
       01  WS-HOLD-AREA.
           05  WS-HOLD-SYSTEM-DATE-INT      PIC X(10).
           05  WS-HOLD-USER-ID              PIC X(08).
           05  WS-HOLD-GIV-NM               PIC X(25).
           05  WS-HOLD-SUR-NM               PIC X(25).
           05  WS-HOLD-CO-NM                PIC X(50).
      *
       COPY CCFWCLI.
       COPY CCFRCLI.
       COPY XCSWOCF.
       COPY XCSROCF.
      *
       COPY CCFWCLNM.
       COPY CCFRCLNM.
      *
       COPY CCFWAGCL.
       COPY CCFRAGTC.
      *
       COPY CCFWCLIG.
       COPY CCFRCLIG.
      *
       COPY XCSWBCF.
       COPY XCSRBCF.
      /
      *
       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      *

      *
       PROCEDURE DIVISION.

      *--------------
       0000-MAINLINE.
      *--------------


           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  0200-INITIALIZE
               THRU 0200-INITIALIZE-X.

           PERFORM  2000-PROCESS-REQUEST
               THRU 2000-PROCESS-REQUEST-X.

           PERFORM  5000-PRINT-GRAND-TOTALS
               THRU 5000-PRINT-GRAND-TOTALS-X

           PERFORM  9999-CLOSE-FILES  
               THRU 9999-CLOSE-FILES-X.


       0000-MAINLINE-X.
           GOBACK.
      *
      *----------------
       0100-OPEN-FILES.
      *----------------
      *
      * THESE FILES ARE REQUIRED IN ALL BATCH PROGRAMS THAT REQUIRE
      * CONTROL CARDS (I.E. EXCLUDING THE INITIALIZATION PROGRAMS)
      *
           PERFORM  OCF-5000-OPEN-EXTEND
               THRU OCF-5000-OPEN-EXTEND-X.

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.
                   
       0100-OPEN-FILES-X. 
           EXIT.
          
      *----------------
       0200-INITIALIZE.
      *----------------

           MOVE WPGWS-CRNT-PGM-ID          TO L0960-PROGRAM-ID.
           MOVE SPACES                     TO L0960-COMPANY-CODE.
           MOVE ZEROES                     TO WS-CLI-RECORDS-READ.
           MOVE ZEROES                     TO WS-CLNM-RECORDS-READ.
           MOVE ZEROES                     TO WS-CLNM-RECORDS-UPDATED.
      *MOVE THE WGLOB VARIABLES TO TEMP VARIABLES
           MOVE WGLOB-SYSTEM-DATE-INT      TO WS-HOLD-SYSTEM-DATE-INT.
           MOVE WGLOB-USER-ID              TO WS-HOLD-USER-ID.

           PERFORM  0960-2000-INIT-DEFAULT
               THRU 0960-2000-INIT-DEFAULT-X.

           PERFORM  BCF-1000-READ
               THRU BCF-1000-READ-X.

           IF  WBCF-SEQ-IO-OK
               MOVE RBCF-SEQ-REC-INFO      TO WPARM-CARD-AREA
           ELSE
      *MSG: CONTROL CARD FILE EMPTY, NO PROCESSING DONE
               MOVE 'XS00000151'           TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 0200-INITIALIZE-X 
           END-IF.
                 
           IF WPARM-COMPANY-CODE 
              MOVE WPARM-VALUE             TO WS-SAVE-COMPANY-CODE
           END-IF.

           PERFORM  4000-INIT-TITLES
               THRU 4000-INIT-TITLES-X.

       0200-INITIALIZE-X.
           EXIT.

      *---------------------
       2000-PROCESS-REQUEST.
      *---------------------

           PERFORM  2100-BUILD-CLI-KEY 
               THRU 2100-BUILD-CLI-KEY-X.

           PERFORM  2200-BUILD-CLNM-KEY
               THRU 2200-BUILD-CLNM-KEY-X.

           PERFORM  CLI-1000-TBL-BROWSE
               THRU CLI-1000-TBL-BROWSE-X.

           PERFORM  2400-PROCESS-CLIENT
               THRU 2400-PROCESS-CLIENT-X
               UNTIL NOT WCLI-IO-OK.

           PERFORM  CLI-3000-TBL-END-BROWSE
               THRU CLI-3000-TBL-END-BROWSE-X.

       2000-PROCESS-REQUEST-X.
           EXIT.

      *--------------------*
       2100-BUILD-CLI-KEY.
      *--------------------*

           MOVE LOW-VALUES                 TO WCLI-KEY.
           MOVE HIGH-VALUES                TO WCLI-ENDBR-KEY.
           MOVE WS-SAVE-COMPANY-CODE       TO WCLI-CO-ID.
           MOVE WS-SAVE-COMPANY-CODE       TO WCLI-ENDBR-CO-ID.

       2100-BUILD-CLI-KEY-X.
           EXIT.
       
      *--------------------*
       2200-BUILD-CLNM-KEY.
      *--------------------*

           MOVE WS-SAVE-COMPANY-CODE       TO WCLNM-CO-ID.   
           MOVE 001                        TO WCLNM-CLI-INDV-SEQ-NUM.
           SET  WCLNM-CLI-INDV-NM-TYP-CRNT TO TRUE.
              
       2200-BUILD-CLNM-KEY-X.
           EXIT.

      *  PROCESS CLIENT NAME TABLE TCLNM
      *--------------------*
       2400-PROCESS-CLIENT.
      *--------------------*

           PERFORM  CLI-2000-TBL-READ-NEXT
               THRU CLI-2000-TBL-READ-NEXT-X.

           IF  WCLI-IO-OK
               ADD +1 TO WS-CLI-RECORDS-READ
           END-IF.
             
           PERFORM  3100-CHECK-AGTC-TBL
               THRU 3100-CHECK-AGTC-TBL-X.
              
           IF  CLIENT-AGENT
               GO TO 2400-PROCESS-CLIENT-X
           END-IF.
            
           PERFORM  3200-CHECK-CLIG-TBL
               THRU 3200-CHECK-CLIG-TBL-X.

           IF  CLIENT-GROUP
               GO TO 2400-PROCESS-CLIENT-X
           ELSE 
               IF  RCLI-CLI-ID(1:1) = 'G'
                   GO TO 2400-PROCESS-CLIENT-X
               END-IF
           END-IF.
            
           IF  RCLI-CLI-SEX-COMPANY 
               CONTINUE
           ELSE 
              
               PERFORM  2500-PROCESS-CLNM-TBL
                   THRU 2500-PROCESS-CLNM-TBL-X
           END-IF.
              
       2400-PROCESS-CLIENT-X.
           EXIT.

      * PROCESS THE CLIENT NAME CLNM TABLE
      *---------------------
       2500-PROCESS-CLNM-TBL.
      *---------------------

           MOVE RCLI-CLI-ID                TO WCLNM-CLI-ID.
      *PROCESS KATAKANA NAME
           SET  WCLNM-CLI-INDV-GR-KATAKANA TO TRUE.
           PERFORM  2600-PROCESS-READ-WRITE-CLNM
               THRU 2600-PROCESS-READ-WRITE-CLNM-X.

      *PROCESS KANJI NAME
           SET  WCLNM-CLI-INDV-GR-KANJI    TO TRUE.
           PERFORM  2600-PROCESS-READ-WRITE-CLNM
               THRU 2600-PROCESS-READ-WRITE-CLNM-X.

       2500-PROCESS-CLNM-TBL-X.
           EXIT.

      *  UPDATES CLNM TABLE AFTER COMPRESSING 
      *-----------------------------
       2600-PROCESS-READ-WRITE-CLNM.
      *-----------------------------
              
           PERFORM  CLNM-1000-READ-FOR-UPDATE
               THRU CLNM-1000-READ-FOR-UPDATE-X.
              
           ADD +1 TO WS-CLNM-RECORDS-READ.   
           
           MOVE RCLNM-ENTR-GIV-NM          TO WS-HOLD-GIV-NM.
           MOVE RCLNM-ENTR-SUR-NM          TO WS-HOLD-SUR-NM.
           SET  UPDATE-NOT-REQUIRED        TO TRUE.
           SET  NO-UPDATE                  TO TRUE.
           
           IF  WCLNM-IO-OK
               PERFORM  2650-PROCESS-CLNM-NM
                   THRU 2650-PROCESS-CLNM-NM-X

               IF  GIV-NM-UPDATE
               OR  SUR-NM-UPDATE

                   PERFORM  CLNM-2000-REWRITE
                       THRU CLNM-2000-REWRITE-X

                   IF  WCLNM-IO-OK
                       ADD +1 TO WS-CLNM-RECORDS-UPDATED
                       PERFORM  2675-WRITE-OCF-MESSAGES
                           THRU 2675-WRITE-OCF-MESSAGES-X
                   ELSE
      *MSG: "CLNM RECORD @1 NOT UPDATED.STATUS RETURNED @2
                       MOVE RCLNM-CLI-ID    TO WGLOB-MSG-PARM (1)
                       MOVE WCLNM-IO-STATUS TO WGLOB-MSG-PARM (2)
                       MOVE 'ZSCLNM0002'    TO WGLOB-MSG-REF-INFO

                       PERFORM  0260-2000-GET-MESSAGE
                           THRU 0260-2000-GET-MESSAGE-X

                       MOVE WGLOB-MSG-TXT   TO L0040-INPUT-LINE

                       PERFORM  0040-3000-WRITE-OTHER
                           THRU 0040-3000-WRITE-OTHER-X

                   END-IF
               ELSE 
                   PERFORM  CLNM-3000-UNLOCK
                       THRU CLNM-3000-UNLOCK-X
               END-IF
           END-IF.
              
       2600-PROCESS-READ-WRITE-CLNM-X.
           EXIT.
              
      *---------------------
       2650-PROCESS-CLNM-NM.
      *---------------------
              
           MOVE SPACES                     TO WS-NM-UNCOMP-FIRST.
           MOVE SPACES                     TO WS-NM-UNCOMP-LAST.
           MOVE RCLNM-ENTR-GIV-NM          TO WS-NM-UNCOMP-FIRST.
              
           PERFORM  3000-COMPRESS-NAME-DATA 
               THRU 3000-COMPRESS-NAME-DATA-X.
 
           IF  RCLNM-CLI-INDV-GR-KANJI 
               PERFORM  3500-CONVERT-SB-DB-SPACE
                   THRU 3500-CONVERT-SB-DB-SPACE-X
           END-IF.

           MOVE WS-COMPRESSED-NAME         TO RCLNM-ENTR-GIV-NM.
           
           MOVE SPACES                     TO WS-NM-UNCOMP-LAST.
           MOVE SPACES                     TO WS-NM-UNCOMP-FIRST.
           MOVE RCLNM-ENTR-SUR-NM          TO WS-NM-UNCOMP-FIRST.

           PERFORM  3000-COMPRESS-NAME-DATA
               THRU 3000-COMPRESS-NAME-DATA-X.

           IF  RCLNM-CLI-INDV-GR-KANJI
               PERFORM  3500-CONVERT-SB-DB-SPACE
                   THRU 3500-CONVERT-SB-DB-SPACE-X
           END-IF.

           MOVE WS-COMPRESSED-NAME         TO RCLNM-ENTR-SUR-NM.

           IF WS-HOLD-GIV-NM NOT = RCLNM-ENTR-GIV-NM
              SET  GIV-NM-UPDATE           TO TRUE
           END-IF.

           IF WS-HOLD-SUR-NM NOT = RCLNM-ENTR-SUR-NM
              SET  SUR-NM-UPDATE           TO TRUE
           END-IF.

           MOVE RCLNM-PREV-UPDT-DT         TO WGLOB-SYSTEM-DATE-INT.
           MOVE RCLNM-PREV-UPDT-USER-ID    TO WGLOB-USER-ID.

       2650-PROCESS-CLNM-NM-X.
           EXIT.

      *-----------------------------
       2675-WRITE-OCF-MESSAGES.
      *-----------------------------
              
           IF  RCLNM-CLI-INDV-GR-KANJI
               MOVE 'KANJI'                TO WGLOB-MSG-PARM (1)
           ELSE
               MOVE 'KATAKANA'             TO WGLOB-MSG-PARM (1)
           END-IF.
              
      * @1 FIRST NAME FOR CLI ID @2 CHANGED FROM @3 TO @4
           IF  GIV-NM-UPDATE
               MOVE RCLNM-CLI-ID           TO WGLOB-MSG-PARM (2)
               MOVE WS-HOLD-GIV-NM         TO WGLOB-MSG-PARM (3)
               MOVE RCLNM-ENTR-GIV-NM      TO WGLOB-MSG-PARM (4)
               MOVE 'ZSCLNM0001'           TO WGLOB-MSG-REF-INFO

               PERFORM  0260-2000-GET-MESSAGE
                   THRU 0260-2000-GET-MESSAGE-X

               MOVE WGLOB-MSG-TXT          TO L0040-INPUT-LINE

               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
           END-IF.
             
           IF  RCLNM-CLI-INDV-GR-KANJI
               MOVE 'KANJI'                TO WGLOB-MSG-PARM (1)
           ELSE
               MOVE 'KATAKANA'             TO WGLOB-MSG-PARM (1)
           END-IF.

      * @1 LAST NAME FOR CLI ID @2 CHANGED FROM @3 TO @4   

           IF  SUR-NM-UPDATE
               MOVE RCLNM-CLI-ID           TO WGLOB-MSG-PARM (2)
               MOVE WS-HOLD-SUR-NM         TO WGLOB-MSG-PARM (3)
               MOVE RCLNM-ENTR-SUR-NM      TO WGLOB-MSG-PARM (4)
               MOVE 'ZSCLNM0003'           TO WGLOB-MSG-REF-INFO

               PERFORM  0260-2000-GET-MESSAGE
                   THRU 0260-2000-GET-MESSAGE-X

               MOVE WGLOB-MSG-TXT          TO L0040-INPUT-LINE

               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
           END-IF.

       2675-WRITE-OCF-MESSAGES-X.
           EXIT.
              
               
      *-----------------------
       3000-COMPRESS-NAME-DATA.
      *-----------------------

           MOVE SPACES                     TO L0015-COMP-AREA-IN.
           MOVE SPACES                     TO L0015-COMP-AREA-OUT.
           MOVE WS-NM-UNCOMP-FIRST         TO L0015-COMP-AREA-IN-FIRST.
           MOVE WS-NM-UNCOMP-LAST          TO L0015-COMP-AREA-IN-LAST.
           MOVE ZEROES                     TO WS-DB-SPACE-COUNT.

      *CHANGE DB SPACE TO SB SPACE SO THAT COMPRESSION ROUTINE CAN HANDLE IT
           INSPECT  L0015-COMP-AREA-IN
               TALLYING WS-DB-SPACE-COUNT
               FOR ALL  WS-DB-SPACE
               REPLACING ALL  WS-DB-SPACE
                          BY  WS-SB-SPACE-SPACE.

           PERFORM  0015-1000-COMPRESS-BLANKS
               THRU 0015-1000-COMPRESS-BLANKS-X.

           MOVE SPACES                      TO WS-NM.
           MOVE SPACES                      TO WS-NM-DBCS-DATA.
           MOVE SPACES                      TO WS-NM-COMPRESSED.
           MOVE L0015-COMP-AREA-OUT         TO WS-NM.

      *REMOVE THE FIRST BYTE SPACE IF PRESENT. IF INPUT DATA HAS LEADING SPACES
      * COMPRESSION ROUTINE RETURNS A SINGLE BYTE SPACE AT THE FIRST BYTE
           IF  WS-NM-FIRST = WS-SB-SPACE
               MOVE WS-NM-REST             TO WS-NM-COMPRESSED 
               SUBTRACT  1
                   FROM   L0015-OUT-SUB
                   GIVING WS-LEN-NM
           ELSE
               MOVE WS-NM                  TO WS-NM-COMPRESSED
               MOVE L0015-OUT-SUB          TO WS-LEN-NM
           END-IF.

           MOVE WS-NM-COMPRESSED           TO WS-COMPRESSED-NAME.

       3000-COMPRESS-NAME-DATA-X.
           EXIT.

      *--------------------
       3100-CHECK-AGTC-TBL.
      *--------------------

           MOVE LOW-VALUES         TO WAGCL-KEY.
           MOVE HIGH-VALUES        TO WAGCL-ENDBR-KEY.
           SET  NOT-CLIENT-AGENT   TO TRUE. 
           MOVE RCLI-CLI-ID        TO WAGCL-CLI-ID.
           MOVE RCLI-CLI-ID        TO WAGCL-ENDBR-CLI-ID.
            
           PERFORM  AGCL-1000-BROWSE
               THRU AGCL-1000-BROWSE-X.

           PERFORM  AGCL-2000-READ-NEXT
               THRU AGCL-2000-READ-NEXT-X.

           IF  WAGCL-IO-OK 
               SET CLIENT-AGENT     TO TRUE 
           END-IF.

           PERFORM  AGCL-3000-END-BROWSE
               THRU AGCL-3000-END-BROWSE-X.
            
       3100-CHECK-AGTC-TBL-X.
           EXIT.
            
      *--------------------
       3200-CHECK-CLIG-TBL.
      *--------------------

           MOVE RCLI-CLI-ID        TO WCLIG-CLI-ID.
           MOVE RCLI-CLI-ID        TO WCLIG-ENDBR-CLI-ID.
           SET  NOT-CLIENT-GROUP   TO TRUE. 
            
           PERFORM  CLIG-1000-BROWSE
               THRU CLIG-1000-BROWSE-X.

           PERFORM  CLIG-2000-READ-NEXT
               THRU CLIG-2000-READ-NEXT-X.

           IF  WCLIG-IO-OK 
               SET CLIENT-GROUP     TO TRUE 
           END-IF.

           PERFORM  CLIG-3000-END-BROWSE
               THRU CLIG-3000-END-BROWSE-X.
            
       3200-CHECK-CLIG-TBL-X.
           EXIT.

      *------------------------
       3500-CONVERT-SB-DB-SPACE.
      *------------------------
                  
      * CHECK FOR DB-SPACE-COUNT ->INDICATES VALID KANJI NAME(NOT LATIN CHARS)
      * IF VALID KANJI NAME CONVERT SINGLE BYTE TO DOUBLE BYTE SPACE

           IF  WS-DB-SPACE-COUNT > 0

               MOVE 1                      TO WS-J
               PERFORM
                   VARYING WS-I FROM 1 BY 1
                   UNTIL   WS-I >= WS-LEN-NM

                   IF  WS-NM-COMP (WS-I) = WS-SB-SPACE
                       MOVE WS-DB-SPACE
                         TO WS-NM-DBCS-DATA-R (WS-J:2)
                       COMPUTE WS-J = WS-J + 2
                       SET  SB-SPACE TO TRUE
                       PERFORM  3600-CHECK-SB-SPACE
                           THRU 3600-CHECK-SB-SPACE-X
                           UNTIL NOT-SB-SPACE OR WS-I >= WS-LEN-NM
                   ELSE
                       MOVE WS-NM-COMP (WS-I)
                         TO WS-NM-DBCS (WS-J)
                       COMPUTE WS-J = WS-J + 1
                   END-IF
               END-PERFORM

               MOVE WS-NM-DBCS-DATA        TO WS-COMPRESSED-NAME
           END-IF.

       3500-CONVERT-SB-DB-SPACE-X.
           EXIT.

      *--------------------
       3600-CHECK-SB-SPACE.
      *--------------------
       
           IF  WS-NM-COMP (WS-I) = WS-SB-SPACE
               SET SB-SPACE TO TRUE
               ADD +1 TO WS-I
           ELSE 
               SET NOT-SB-SPACE TO TRUE
               MOVE WS-NM-COMP (WS-I)                                  
                 TO WS-NM-DBCS (WS-J)                                  
               COMPUTE WS-J = WS-J + 1
           END-IF.
         
       3600-CHECK-SB-SPACE-X.
           EXIT.
       
      *-----------------
       4000-INIT-TITLES.
      *-----------------

           MOVE L0960-COMPANY-NAME         TO L0040-COMPANY-NAME.
           MOVE ZERO                       TO L0040-ERROR-CNT.

      * SET UP THE TITLE/HEADING LINES
      * GET THE SYSTEM ID
      *
           MOVE 'XS00000145'               TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT              TO L0040-SYSTEM-ID.
      *
      * GET THE PROGRAM DESCRIPTION
      *
           MOVE 'ZSCLNM0004'               TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT              TO L0040-PROGRAM-DESC.
      *
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

       4000-INIT-TITLES-X.
           EXIT.

      *-----------------------
       5000-PRINT-GRAND-TOTALS.
      *-----------------------
               
      * TOTAL NO OF CLI  CLIENT RECORDS READ : @1
           MOVE WS-CLI-RECORDS-READ        TO WGLOB-MSG-PARM (1).
           MOVE 'ZSCLNM0005'               TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT              TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
             
      * TOTAL NO OF CLNM CLIENT RECORDS READ : @1
           MOVE WS-CLNM-RECORDS-READ       TO WGLOB-MSG-PARM (1).
           MOVE 'ZSCLNM0006'               TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT              TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
             
      * TOTAL NO OF CLNM CLIENT RECORDS UPDATED: @1
           MOVE WS-CLNM-RECORDS-UPDATED    TO WGLOB-MSG-PARM (1).
           MOVE 'ZSCLNM0007'               TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT              TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
             
       5000-PRINT-GRAND-TOTALS-X.
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------
      *
      * THIS ROUTINE WILL CLOSE ALL FILES PRIOR TO THE PROGRAM FINISH
      *

           MOVE WS-HOLD-SYSTEM-DATE-INT    TO WGLOB-SYSTEM-DATE-INT.
           MOVE WS-HOLD-USER-ID            TO WGLOB-USER-ID.

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
          
      *****************************************************************
      *    FILE I/O PROCESS MODULES                                   *
      *****************************************************************
       COPY CCPUCLNM. 
       COPY CCPTCLI. 
       COPY CCPBCLIG.
       COPY CCPBAGCL.
        
       COPY XCPL0015. 
       COPY XCPL0040. 
       COPY NCPL0960. 
       COPY XCPL0260.
        
       COPY XCPLBCF.
       COPY XCPNBCF.
       COPY XCPOBCF.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      *****************************************************************
      *    ERROR HANDLING ROUTINES                                    *
      *****************************************************************
       COPY XCPL0030.
      *
