      *****************************************************************
      **  MEMBER :  XSRU0040                                         **
      **  REMARKS:  OUTPUT CONTROL FILE PRINT.  THIS MODULE PRINTS   **
      **            CONTROL INFORMATION SUCH AS CONTROL CARDS AND    **
      **            ERROR TOTALS FOR BATCH EXECUTABLE MODULES.       **
      **                                                             **
      **  DOMAIN : SY                                                **
      **  CLASS  : PD                                                **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  15JUN89  EWD    CREATED FOR BATCH PROCESSING               **
53-062**  30NOV95  VK     RENAME WGLOB-PROGRAM-ID TO WGLOB-PGM-ID    **
53-062**  30NOV95  VK     ADD WORKING STORAGE COPYBOOK XCWWPGWS      **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
54-001**  01SEP96  STB    MODIFICATIONS FOR MAINTAINABILITY          **
010418**  30OCT98  56     ADD SUB-COMPANY NAME                       **
007684**  30OCT98  56     CHECKPOINT/RESTART                         **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
 
       IDENTIFICATION DIVISION.
      *************************
 
54-001 PROGRAM-ID. XSRU0040.
 
       COPY XCWWCRHT.
 
      /
       ENVIRONMENT DIVISION.
      **********************
 
       INPUT-OUTPUT SECTION.
 
       FILE-CONTROL.
 
       DATA DIVISION.
      ***************
 
       FILE SECTION.
 
       WORKING-STORAGE SECTION.
 
54-001 COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRU0040'.
 
       COPY SQLCA.
 
014590*COPY XCWL0030.
 
       01  WS-PGM-WORK-AREA.
           05  WS-LANG-USED                 PIC 9(01)  VALUE ZERO.
           05  WS-MAX-LINES                 PIC S9(04) COMP  VALUE +52.
           05  WS-N-COUNT                   PIC 9(07)  VALUE ZEROS.
           05  WS-N-PAGE                    PIC 9(04)  VALUE ZEROS.
           05  WS-PAGE-CNT                  PIC 9(04)  COMP VALUE ZEROS.
           05  WS-LINE-CNT                  PIC 9(04)  COMP VALUE ZEROS.
           05  WS-ERROR-CNT                 PIC 9(04)  COMP VALUE ZEROS.
           05  WS-DISP-ERROR-CNT            PIC Z(06)9      VALUE ZEROS.
           05  WS-HEADING-LINES.
               10  WS-HEADING-LINES-A       OCCURS 3 TIMES.
                   15  WS-HEADING-LINE      PIC X(132).
           05  WS-PRINT-LINE.
               10  WS-PRINT-TEXT            PIC X(132) VALUE SPACES.
       COPY XCWWTIME.
       COPY XCWWHDG.
       COPY XCWTFCMD.
       COPY XCSWOCF.
       COPY XCSROCF.
       COPY XCWL1640.
       COPY XCWLDTLK.
 
       LINKAGE SECTION.
 
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL0040.
      /
 
       PROCEDURE DIVISION USING  WGLOB-GLOBAL-AREA
54-001                           L0040-PARM-INFO.
 
      ***************
       0000-MAINLINE.
      ***************
 
           MOVE 'Y'   TO L0040-RETURN-CODE.
007684     MOVE ZEROS TO WOCF-SEQ-FILE-STATUS .
 
           PERFORM 1000-PROCESS-FUNCTIONS
              THRU 1000-PROCESS-FUNCTIONS-X.
 
           GOBACK.
 
       0000-MAINLINE-X.
54-001     EXIT.
 
      ************************
       1000-PROCESS-FUNCTIONS.
      ************************
 
54-001     EVALUATE TRUE
 
54-001         WHEN L0040-INIT-TITLE
                   PERFORM 2000-INIT-TITLES
                      THRU 2000-INIT-TITLES-X
 
54-001         WHEN L0040-WRITE-ERROR
                   PERFORM 3000-WRITE-ERROR
                      THRU 3000-WRITE-ERROR-X
 
54-001         WHEN L0040-WRITE-OTHER
                    PERFORM 4000-WRITE-OTHER
                       THRU 4000-WRITE-OTHER-X
 
54-001         WHEN L0040-WRITE-TOTALS
                     PERFORM 5000-WRITE-TOTALS
                        THRU 5000-WRITE-TOTALS-X
 
54-001         WHEN OTHER
                     MOVE 'N' TO L0040-RETURN-CODE
 
54-001     END-EVALUATE.
 
       1000-PROCESS-FUNCTIONS-X.
           EXIT.
 
 
      ******************
       2000-INIT-TITLES.
      ******************
 
           MOVE SPACES                TO WS-HEADING-LINES.
           MOVE SPACES                TO WHDG-LINE-1.
           MOVE SPACES                TO WHDG-LINE-2.
           PERFORM HDG-1000-INIT-CONSTANTS
              THRU HDG-1000-INIT-CONSTANTS-X.
           MOVE WGLOB-SYSTEM-TIME     TO WTIME-EDIT-TIME.
           PERFORM TIME-1000-REFORMAT
              THRU TIME-1000-REFORMAT-X.
           MOVE WTIME-DISPLAY-TIME    TO WHDG-TIME.
           MOVE L0040-SYSTEM-ID       TO WHDG-SYSTEM-ID.
           MOVE L0040-COMPANY-NAME    TO WHDG-COMPANY-NAME.
010418     MOVE L0040-SBSDRY-CO-NAME     TO WHDG-SBSDRY-CO-NAME.
           MOVE L0040-PROGRAM-DESC    TO WHDG-REPORT-TITLE.
53-062     MOVE WGLOB-MAIN-PGM-ID     TO WHDG-PROGRAM-ID.
           MOVE WGLOB-SYSTEM-DATE-INT TO L1640-INTERNAL-DATE.
           PERFORM 1640-2000-INTERNAL-TO-EXT
              THRU 1640-2000-INTERNAL-TO-EXT-X.
           MOVE L1640-EXTERNAL-DATE   TO WHDG-DATE.
           MOVE +99                   TO WS-LINE-CNT.
           MOVE ZERO                  TO WS-ERROR-CNT.
           MOVE ZERO                  TO WS-PAGE-CNT.
           MOVE WHDG-LINE-1           TO WS-HEADING-LINES-A (1).
           MOVE WHDG-LINE-2           TO WS-HEADING-LINES-A (2).
           MOVE L0040-HDG-LINE-3      TO WS-HEADING-LINE (3).
 
       2000-INIT-TITLES-X.
           EXIT.
 
      ******************
       3000-WRITE-ERROR.
      ******************
 
           PERFORM 9000-WRITE-LINE
              THRU 9000-WRITE-LINE-X.
           ADD +1            TO WS-ERROR-CNT.
           MOVE WS-ERROR-CNT TO L0040-ERROR-CNT.
 
       3000-WRITE-ERROR-X.
           EXIT.
 
      ******************
       4000-WRITE-OTHER.
      ******************
 
           PERFORM 9000-WRITE-LINE
              THRU 9000-WRITE-LINE-X.
 
       4000-WRITE-OTHER-X.
           EXIT.
 
      *******************
       5000-WRITE-TOTALS.
      *******************
 
           PERFORM 8000-PRINT-TOTAL-LINE
              THRU 8000-PRINT-TOTAL-LINE-X.
 
       5000-WRITE-TOTALS-X.
           EXIT.
 
      ***********************
       7000-CHECK-PAGE-BREAK.
      ***********************
 
           IF WS-LINE-CNT > WS-MAX-LINES
               COMPUTE WS-PAGE-CNT = WS-PAGE-CNT + 1
               MOVE WS-HEADING-LINES-A (1) TO WHDG-LINE-1
               MOVE WS-PAGE-CNT            TO WS-N-PAGE
               MOVE WS-N-PAGE              TO WHDG-PAGE
               MOVE WHDG-LINE-1            TO WS-HEADING-LINES-A (1)
007684         MOVE WS-HEADING-LINES-A (1) TO ROCF-SEQ-REC-INFO
               MOVE +99                    TO WOCF-NUMBER-LINES
               PERFORM OCF-1000-WRITE
                  THRU OCF-1000-WRITE-X
007684         MOVE WS-HEADING-LINES-A (2) TO ROCF-SEQ-REC-INFO
               MOVE +2                     TO WOCF-NUMBER-LINES
               PERFORM OCF-1000-WRITE
                  THRU OCF-1000-WRITE-X
007684         MOVE WS-HEADING-LINES-A (3) TO ROCF-SEQ-REC-INFO
               PERFORM OCF-1000-WRITE
                  THRU OCF-1000-WRITE-X
007684         MOVE SPACES                 TO ROCF-SEQ-REC-INFO
               PERFORM OCF-1000-WRITE
                  THRU OCF-1000-WRITE-X
               MOVE ZEROS                  TO WS-LINE-CNT
54-001     END-IF.
 
       7000-CHECK-PAGE-BREAK-X.
           EXIT.
 
      ***********************
       8000-PRINT-TOTAL-LINE.
      ***********************
 
           PERFORM 7000-CHECK-PAGE-BREAK
              THRU 7000-CHECK-PAGE-BREAK-X.
           MOVE +2                   TO WOCF-NUMBER-LINES.
           MOVE WS-ERROR-CNT         TO L0040-ERROR-CNT.
           MOVE WS-ERROR-CNT         TO WS-DISP-ERROR-CNT.
           MOVE WS-DISP-ERROR-CNT    TO WGLOB-MSG-PARM (1).
           MOVE 'XS00400001'         TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-2000-GET-MESSAGE
              THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT        TO L0040-INPUT-LINE.
           PERFORM 9000-WRITE-LINE
              THRU 9000-WRITE-LINE-X.
           MOVE SPACES               TO L0040-INPUT-LINE.
           MOVE +99                  TO WS-LINE-CNT.
 
       8000-PRINT-TOTAL-LINE-X.
           EXIT.
 
      *****************
       9000-WRITE-LINE.
      *****************
 
           PERFORM 7000-CHECK-PAGE-BREAK
              THRU 7000-CHECK-PAGE-BREAK-X.
           MOVE L0040-INPUT-LINE TO WS-PRINT-TEXT.
           MOVE +1               TO WOCF-NUMBER-LINES.
007684     MOVE WS-PRINT-LINE    TO ROCF-SEQ-REC-INFO.
           PERFORM OCF-1000-WRITE
              THRU OCF-1000-WRITE-X.
           COMPUTE WS-LINE-CNT = WS-LINE-CNT + 1.
 
       9000-WRITE-LINE-X.
           EXIT.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************
       COPY XCPPHDG.
       COPY XCPPTIME.
       COPY XCPL1640.
       COPY XCPAOCF.
 
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
       COPY XCPLOCF.
 
       COPY XCPL0260.
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM XSRU0040                     **
      *****************************************************************
