      *****************************************************************
      **  MEMBER :  ZSBM998D                                         **
      **  REMARKS:  THIS PROGRAM WILL UPDATE THE EXPIRY DATE FIELD   **
      **            IN TREIN WITH THE EXISTING LOGIC FOR ALL THE     **
      **            POLICIES ALREADY THERE IN REIN TABLE             **
      **                                                             **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
      **  09AUG10  CTS    EXPIRY DATE FIELD UPDATION IN TREIN        **
      *****************************************************************

       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.    ZSBM998D.

       COPY XCWWCRHT.
      /
       ENVIRONMENT DIVISION.
      *************************

       CONFIGURATION SECTION.
      /
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM998D'.

       COPY SQLCA.

       01  WS-PROGRAM-WORK-AREA.
           05  WS-REIN-REC-PRCES-CTR        PIC 9(6)  VALUE ZERO.
           05  WS-EXP-DT                    PIC X(10).
           05  WS-LAST-DAY-IN-MO            PIC X(02).
               88 WS-LAST-DAY               VALUE '31'.

      /
       COPY XCWL0035.

       COPY CCWL0010.
      /
       COPY CCFWREIN.
       COPY CCFRREIN.
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWBCF.
       COPY XCSRBCF.
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY XCWTFCMD.
      /
       COPY XCWL0040.
       COPY NCWL0960.
      /
       COPY XCWL1670.
       COPY XCWL1640.
       COPY XCWL1680.
      /
       COPY XCWLDTLK.
      /
       COPY XCWWWKDT.
       COPY NCWWPARM.
      /
       COPY CCWWCCC.
      /
       COPY CCWLPGA.
      /
       PROCEDURE DIVISION.
      *************************

      *--------------
       0000-MAINLINE.
      *--------------


           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  0200-INITIALIZE
               THRU 0200-INITIALIZE-X.

           PERFORM  1000-PROCESS-REQUEST
               THRU 1000-PROCESS-REQUEST-X.

           PERFORM  5000-PRINT-GRAND-TOTALS
               THRU 5000-PRINT-GRAND-TOTALS-X

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAIN-LINE-X.
           EXIT.

      /
      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
 
      /
      *----------------
       0200-INITIALIZE.
      *----------------

           MOVE WPGWS-CRNT-PGM-ID           TO L0960-PROGRAM-ID.
           MOVE SPACES                      TO L0960-COMPANY-CODE.

           PERFORM  0960-2000-INIT-DEFAULT
               THRU 0960-2000-INIT-DEFAULT-X.

           PERFORM  BCF-1000-READ
               THRU BCF-1000-READ-X.

           IF  WBCF-SEQ-IO-OK
               MOVE RBCF-SEQ-REC-INFO       TO WPARM-CARD-AREA
           ELSE
      *MSG: CONTROL CARD FILE EMPTY, NO PROCESSING DONE
               MOVE 'XS00000151'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 0200-INITIALIZE-X 
           END-IF.
                 
           MOVE L0960-COMPANY-NAME          TO L0040-COMPANY-NAME.
           MOVE ZERO                        TO L0040-ERROR-CNT.

      * SET UP THE TITLE/HEADING LINES
      * GET THE SYSTEM ID
      *
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.
      *
      * GET THE PROGRAM DESCRIPTION
      *
           MOVE 'ZS998D0001'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-PROGRAM-DESC.
      *
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

       0200-INITIALIZE-X.
           EXIT.
      /
      *---------------------
       1000-PROCESS-REQUEST.
      *---------------------
           
           INITIALIZE WS-PROGRAM-WORK-AREA.
           
           MOVE LOW-VALUES                  TO WREIN-KEY.
           MOVE HIGH-VALUES                 TO WREIN-ENDBR-KEY.
           MOVE WWKDT-LOW-DT                TO WREIN-PRCES-DT.
           MOVE WWKDT-HIGH-DT               TO WREIN-ENDBR-PRCES-DT.           
           
           PERFORM  REIN-1000-BROWSE
               THRU REIN-1000-BROWSE-X.

           PERFORM  REIN-2000-READ-NEXT
               THRU REIN-2000-READ-NEXT-X.

           PERFORM  2000-PROCESS-REIN-REC
               THRU 2000-PROCESS-REIN-REC-X
               UNTIL NOT WREIN-IO-OK.

           PERFORM  REIN-3000-END-BROWSE
               THRU REIN-3000-END-BROWSE-X.
           
       1000-PROCESS-REQUEST-X.
           EXIT.

      /
      *-----------------------
       2000-PROCESS-REIN-REC.
      *-----------------------
          
           PERFORM  REIN-1000-READ-FOR-UPDATE
               THRU REIN-1000-READ-FOR-UPDATE-X.
               
           IF  WREIN-IO-OK 
               CONTINUE
           ELSE
               PERFORM  REIN-3000-UNLOCK
                   THRU REIN-3000-UNLOCK-X
               PERFORM  REIN-2000-READ-NEXT
                   THRU REIN-2000-READ-NEXT-X    
               GO TO 2000-PROCESS-REIN-REC-X    
           END-IF.            
           
      *    DERIVE EXPIRY DATE FROM SELF DISCLOSURE DATE
      
           IF  RREIN-SELF-DSCLSRE-DT = WWKDT-ZERO-DT
               PERFORM  REIN-3000-UNLOCK
                   THRU REIN-3000-UNLOCK-X
               PERFORM  REIN-2000-READ-NEXT
                   THRU REIN-2000-READ-NEXT-X                  
               GO TO 2000-PROCESS-REIN-REC-X
           END-IF.    
              
           MOVE RREIN-SELF-DSCLSRE-DT       TO L1680-INTERNAL-1.               
           MOVE 1                           TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                        TO L1680-NUMBER-OF-DAYS.
           MOVE ZERO                        TO L1680-NUMBER-OF-YEARS.
           PERFORM  1680-5000-ADD-M-TO-DATE
               THRU 1680-5000-ADD-M-TO-DATE-X.
           MOVE L1680-INTERNAL-2            TO WS-EXP-DT.
      
           SET  WS-LAST-DAY                 TO TRUE.
           MOVE WS-EXP-DT                   TO L1640-INTERNAL-DATE.
           MOVE WS-LAST-DAY-IN-MO           TO L1640-DD-1.
                   
           PERFORM  1640-2000-INTERNAL-TO-EXT
               THRU 1640-2000-INTERNAL-TO-EXT-X.
               
           IF  L1640-VALID
               MOVE L1640-EXTERNAL-DATE     TO WS-EXP-DT
           ELSE
               MOVE WWKDT-ZERO-DT           TO WS-EXP-DT
           END-IF.  
           
           MOVE WS-EXP-DT                   TO RREIN-REINST-XPRY-DT.

           PERFORM  REIN-2000-REWRITE
               THRU REIN-2000-REWRITE-X.
               
           IF  WREIN-IO-OK 
               ADD 1                        TO WS-REIN-REC-PRCES-CTR
           END-IF.
           
           PERFORM  REIN-2000-READ-NEXT
               THRU REIN-2000-READ-NEXT-X.
           
       2000-PROCESS-REIN-REC-X.
           EXIT.

      /
      *-----------------------
       5000-PRINT-GRAND-TOTALS.
      *-----------------------
               
      * TOTAL NO OF TREIN RECORDS UPDATED: @1
           MOVE WS-REIN-REC-PRCES-CTR       TO WGLOB-MSG-PARM (1).
           MOVE 'ZS998D0002'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
             
       5000-PRINT-GRAND-TOTALS-X.
           EXIT.
      /
      *------------------
       9999-CLOSE-FILES.
      *------------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
 
      /
       COPY XCPL0035.
      /
       COPY CCPBREIN.
       COPY CCPNREIN.
       COPY CCPUREIN.
       COPY CCPAREIN.
      /
       COPY CCPL0010.
       COPY CCPS0010.
       COPY CCPPCCC.
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
       COPY XCPL0040.
      /
       COPY XCPL0260.
       COPY NCPL0960. 
      /
       COPY XCPL1640.
       COPY XCPL1680.
      /
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM ZSBM998D                     **
      *****************************************************************
