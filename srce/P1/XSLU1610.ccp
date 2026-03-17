      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSLU1610.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  XSLU1610                                         **
      **  REMARKS:  TO RETRIEVE THE SYSTEM DATE AND TIME             **
      **            FOR ON-LINE PROGRAMS.                            **
      **                                                             **
      **  DOMAIN :  XS                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
557658** 30SEP97    CG    NEW                                        **
557658** 30SEP97    ML    INITIALIZE THE 'TIME' STD TO HAVE THE ':'  **
557658**                  WITHIN THE FORMAT                          **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
B10135**  01AUG01  EKM    SYSTEM FUTURE DATING                       **
      *****************************************************************
 
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSLU1610'.
 
       COPY SQLCA.
007766 COPY XCWLPTR.
 
 
014590*COPY XCWL0030.
 
      *****************************************************************
      * CALLED MODULE PARAMETER INFORMATION                           *
      *****************************************************************
 
       COPY XCWWWKDT.
B10135/ 
B10135 COPY XCWWFUTD.
      /
       COPY XCWL1670.
      /
       COPY XCWLDTLK.
      /
       COPY XCWW1610.
      /
      /
      *****************
       LINKAGE SECTION.
      *****************
 
       01   DFHCOMMAREA.
         02  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
007766 COPY XCWL1610.
 
      ********************
       PROCEDURE DIVISION.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
007766     SET ADDRESS OF L1610-PARM-INFO    TO WGLOB-PARM-ADDR-PTR (1).
 
           SET L1610-RETRN-OK                   TO TRUE.
 
           EVALUATE TRUE
 
               WHEN L1610-RQST-GET-DATE-TIME
                   PERFORM  1000-GET-DATE-TIME
                       THRU 1000-GET-DATE-TIME-X
 
               WHEN OTHER
                   SET  L1610-RETRN-INVALID-REQUEST TO TRUE
 
           END-EVALUATE.
 
 
           GOBACK.
 
       0000-MAINLINE-X.
           EXIT.
 
 
      *-------------------
       1000-GET-DATE-TIME.
      *-------------------
      *****************************************************************
      ** THIS PARAGRAPH WILL OBTAIN THE SYSTEM DATE AND TIME         **
      **   DATE IN FORMTA 0CYYDDD                                    **
      **           INPUT FIELD = W1610-EIBDATE                       **
      **          OUTPUT FIELD = L1610-SYSTEM-DATE-INT               **
      **                                                             **
      **   TIME IN FORMAT HHMMSS                                     **
      **           INPUT FIELD = W1610-EIBTIME                       **
      **          OUTPUT FIELD = L1610-SYSTEM-TIME                   **
      **          OUTPUT FIELD = L1610-SYSTEM-TIME-INT               **
      **                                                             **
      *****************************************************************
 
           MOVE EIBDATE                    TO W1610-EIBDATE.
           ADD 1900000                     TO W1610-EIBDATE.
 
           MOVE WWKDT-ZERO-DT              TO L1610-SYSTEM-DATE-INT.
 
           MOVE W1610-EIBDATE              TO L1670-JULIAN-DATE.
           PERFORM  1670-6000-YYYYDDD-INTERNAL
               THRU 1670-6000-YYYYDDD-INTERNAL-X.
           MOVE L1670-INTERNAL-DATE        TO L1610-SYSTEM-DATE-INT.

B10135     IF  WFUTD-ALLOW-FUTR-DT
B10135     AND WGLOB-PROCESS-DATE > L1610-SYSTEM-DATE-INT
B10135         MOVE WGLOB-PROCESS-DATE     TO L1610-SYSTEM-DATE-INT
B10135     END-IF.
           
           MOVE EIBTIME                    TO W1610-EIBTIME.
           MOVE W1610-EIBTIME              TO L1610-SYSTEM-TIME.
 
557658     MOVE '00:00:00'                 TO L1610-SYSTEM-TIME-INT.
           MOVE W1610-EIBTIME-HH           TO L1610-SYSTEM-TIME-INT-HH.
           MOVE W1610-EIBTIME-MM           TO L1610-SYSTEM-TIME-INT-MM.
           MOVE W1610-EIBTIME-SS           TO L1610-SYSTEM-TIME-INT-SS.
 
       1000-GET-DATE-TIME-X.
 
           EXIT.
      /
      *****************************************************************
      **           LINKAGE PROCESSING COPYBOOKS                      **
      *****************************************************************
       COPY XCPL1670.
 
      *****************************************************************
      **                 END OF PROGRAM XSLU1610                     **
      *****************************************************************
