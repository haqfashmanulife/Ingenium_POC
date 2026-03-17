      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSRU1610.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER  : XSRU1610                                         **
      **  REMARKS : OBTAIN SYSTEM DATE AND TIME FOR BATCH PROGRAMS   **
      **            THIS MODULE WILL EXTRACT THE DATE AND TIME FROM  **
      **            THE SYSTEM, FOR ALL BATCH PROGRAMS.  THE RESULTS **
      **            WILL BE THE DATE IN ISO FORMAT (INTERNAL), AND   **
      **            THE TIME IN ISO FORMAT (INTERNAL).               **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTHOR  DESCRIPTION                               **
557658** 30SEP97    CG    NEW                                        **
B10135**  01AUG01  EKM    SYSTEM FUTURE DATING                       **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRU1610'.
 
       COPY XCWW1610.
      /
       COPY XCWLDTLK.
      /
       COPY XCWWWKDT.
B10135/ 
B10135 COPY XCWWFUTD.
 
      *****************
       LINKAGE SECTION.
      *****************
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
 
       COPY XCWL1610.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L1610-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           SET L1610-RETRN-OK TO TRUE.
 
           EVALUATE TRUE
 
               WHEN L1610-RQST-GET-DATE-TIME
                   PERFORM 1000-GET-DATE-TIME
                      THRU 1000-GET-DATE-TIME-X
 
               WHEN OTHER
                   SET L1610-RETRN-INVALID-REQUEST TO TRUE
 
           END-EVALUATE.
 
           GOBACK.
 
       0000-MAINLINE-X.
           EXIT.
      /
      *-------------------
       1000-GET-DATE-TIME.
      *-------------------
 
      ******************************************************************
      ** THIS PARAGRAPH WILL OBTAIN THE SYSTEM DATE AND TIME
      **    DATE IN FORMAT YYYYMMDD
      **            INPUT FIELD = W1610-CURRENT-DATE
      **           OUTPUT FIELD = L1610-SYSTEM-DATE-INT
      **    TIME IN FORMAT HHMMSS
      **            INPUT FIELD = W1610-CURRENT-TIME
      **           OUTPUT FIELD = L1610-SYSTEM-TIME
      **                          L1610-SYSTEM-TIME-INT
      ******************************************************************
 
           ACCEPT W1610-CURRENT-DATE FROM DATE.
 
           MOVE WWKDT-ZERO-DT            TO L1610-SYSTEM-DATE-INT.
           MOVE W1610-CURR-DATE-YY       TO L1610-SYSTEM-DATE-INT-YYYY.
 
           IF W1610-CURR-DATE-YY > 96
               ADD 1900                  TO L1610-SYSTEM-DATE-INT-YYYY
           ELSE
               ADD 2000                  TO L1610-SYSTEM-DATE-INT-YYYY
           END-IF.
 
           MOVE W1610-CURR-DATE-MM       TO L1610-SYSTEM-DATE-INT-MM.
           MOVE W1610-CURR-DATE-DD       TO L1610-SYSTEM-DATE-INT-DD.
 
B10135     IF  WFUTD-ALLOW-FUTR-DT
B10135     AND WGLOB-PROCESS-DATE > L1610-SYSTEM-DATE-INT
B10135         MOVE WGLOB-PROCESS-DATE   TO L1610-SYSTEM-DATE-INT
B10135     END-IF.
 
           ACCEPT W1610-CURRENT-TIME FROM TIME.
           MOVE W1610-CURRENT-TIME (1:6) TO L1610-SYSTEM-TIME.
 
           MOVE WWKDT-ZERO-TIME          TO L1610-SYSTEM-TIME-INT.
           MOVE W1610-CURR-TIME-HH       TO L1610-SYSTEM-TIME-INT-HH.
           MOVE W1610-CURR-TIME-MM       TO L1610-SYSTEM-TIME-INT-MM.
           MOVE W1610-CURR-TIME-SS       TO L1610-SYSTEM-TIME-INT-SS.
 
       1000-GET-DATE-TIME-X.
           EXIT.
      /
 
      *****************************************************************
      **                 END OF PROGRAM XSRU1610                     **
      *****************************************************************
 
