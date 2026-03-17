      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSRU9681.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER  : XSRU9681                                         **
      **  REMARKS : DATE CONVERSION ROUTINE:                         **
      **              FROM YYYY-MM-DD TO WESTERN DATE                **
      **                                                             **
      **        EXAMPLE OF WESTERN DATE FORMAT:                      **
      **                                                             **
      **              2001Y12M23D                                    **
      **    WHERE:                                                   **
      **        Y  = LETTER 'Y' IN ENGLISH OR EQUIVALENT IN JAPANESE **
      **        M  = LETTER 'M' IN ENGLISH OR EQUIVALENT IN JAPANESE **
      **        D  = LETTER 'D' IN ENGLISH OR EQUIVALENT IN JAPANESE **
      **                                                             **
      **     YYYY-MM-DD TO WESTERN DATE CONVERSION:                  **         
      **                                                             **
      **            OBTAIN DATE FROM BATCH PROGRAMS (INTERNAL FORMAT)**
      **            AS CARRIED ON THE DATABASE TABLE FIELDS - THIS   **
      **            MODULE WILL RETURN THE DATE IN 'WESTERN FORMAT'  **
      **            FOR BUSINESS IN JAPAN.                           **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTHOR  DESCRIPTION                               **
01PT02** 01AUG01    MAW    INITIAL VERSION                           **
MP1662** 18JUL11   CTS     LUMPSUM COMPLETION NOTICE                 **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRU9681'.
      /
       COPY XCWLDTLK.
      /
       COPY XCWWWKDT.
      /
       COPY CCWWINDX.
      /
       COPY XCWL2490.
      /
      *****************
       LINKAGE SECTION.
      *****************
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
 
       COPY XCWL9681.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L9681-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------

           SET L9681-RETRN-OK      TO TRUE.

MP1662*     IF  L9681-INTERNAL-DATE NOT = SPACES
MP1662*         PERFORM  1000-CONVERT-DATE
MP1662*             THRU 1000-CONVERT-DATE-X
MP1662*     ELSE
MP1662*         SET L9681-RETRN-INVALID-REQUEST TO TRUE
MP1662*     END-IF.
MP1662 
MP1662     EVALUATE TRUE
MP1662           
MP1662          WHEN L9681-RQST-WEST-DT
MP1662               PERFORM  1000-CONVERT-DATE
MP1662                   THRU 1000-CONVERT-DATE-X
MP1662          WHEN L9681-RQST-WEST-MN
MP1662               PERFORM  2000-GET-MONTH-LIT
MP1662                   THRU 2000-GET-MONTH-LIT-X
MP1662          WHEN OTHER
MP1662               SET L9681-RETRN-INVALID-REQUEST TO TRUE
MP1662                     
MP1662     END-EVALUATE.
MP1662
           GOBACK.
 
       0000-MAINLINE-X.
           EXIT.
      /
      *-------------------
       1000-CONVERT-DATE.
      *-------------------

           PERFORM  2490-1000-BUILD-PARM-INFO
               THRU 2490-1000-BUILD-PARM-INFO-X.

           MOVE 'XSRU9681'         TO L2490-TXT-SRC-ID.
           MOVE L9681-LANG-CD      TO L2490-TXT-LANG-CD.

           MOVE L9681-INT-YYYY     TO L9681-WEST-YYYY.
           MOVE L9681-INT-MM       TO L9681-WEST-MM.
           MOVE L9681-INT-DD       TO L9681-WEST-DD.

           IF  L9681-WEST-MM-X1 = '0'
               MOVE ' ' TO L9681-WEST-MM-X1 
           END-IF.
            
           IF  L9681-WEST-DD-X1 = '0'
               MOVE ' ' TO L9681-WEST-DD-X1
           END-IF.
            
           MOVE '09001'            TO L2490-TXT-SRC-REF-ID.
           PERFORM 2490-1000-RETRIEVE-TEXT
              THRU 2490-1000-RETRIEVE-TEXT-X.
           MOVE L2490-TXT-STR-TXT  TO L9681-WEST-YEAR-LIT.
 
           MOVE '09002'            TO L2490-TXT-SRC-REF-ID.
           PERFORM 2490-1000-RETRIEVE-TEXT
              THRU 2490-1000-RETRIEVE-TEXT-X.
           MOVE L2490-TXT-STR-TXT  TO L9681-WEST-MONTH-LIT.
 
           MOVE '09003'            TO L2490-TXT-SRC-REF-ID.
           PERFORM 2490-1000-RETRIEVE-TEXT
              THRU 2490-1000-RETRIEVE-TEXT-X.
           MOVE L2490-TXT-STR-TXT  TO L9681-WEST-DAY-LIT.
 
       1000-CONVERT-DATE-X.
           EXIT.

MP1662*-------------------
MP1662 2000-GET-MONTH-LIT.
MP1662*-------------------
MP1662
MP1662     PERFORM  2490-1000-BUILD-PARM-INFO
MP1662         THRU 2490-1000-BUILD-PARM-INFO-X.
MP1662
MP1662     MOVE 'XSRU9681'                  TO L2490-TXT-SRC-ID.
MP1662     MOVE L9681-LANG-CD               TO L2490-TXT-LANG-CD.
MP1662
MP1662     MOVE L9681-INT-YYYY              TO L9681-WEST-YYYY1.
MP1662     MOVE L9681-INT-MM                TO L9681-WEST-MM1.
MP1662     MOVE L9681-INT-DD                TO L9681-WEST-DD1.
MP1662
MP1662     IF  L9681-WEST-MM-X1 = '0'
MP1662         MOVE ' '                     TO L9681-WEST-MM1-X1 
MP1662     END-IF.
MP1662
MP1662     IF  L9681-WEST-DD-X1 = '0'
MP1662         MOVE ' '                     TO L9681-WEST-DD1-X1
MP1662     END-IF.
MP1662
MP1662     MOVE '09001'                     TO L2490-TXT-SRC-REF-ID.
MP1662     PERFORM  2490-1000-RETRIEVE-TEXT
MP1662         THRU 2490-1000-RETRIEVE-TEXT-X.
MP1662     MOVE L2490-TXT-STR-TXT           TO L9681-WEST-YEAR1-LIT.
MP1662
MP1662     MOVE '09003'                     TO L2490-TXT-SRC-REF-ID.
MP1662     PERFORM  2490-1000-RETRIEVE-TEXT
MP1662         THRU 2490-1000-RETRIEVE-TEXT-X.
MP1662     MOVE L2490-TXT-STR-TXT           TO L9681-WEST-DAY1-LIT.
MP1662
MP1662     MOVE '09004'                     TO L2490-TXT-SRC-REF-ID.
MP1662     PERFORM  2490-1000-RETRIEVE-TEXT
MP1662         THRU 2490-1000-RETRIEVE-TEXT-X.
MP1662     MOVE L2490-TXT-STR-TXT           TO L9681-WEST-MONTH1-LIT.
MP1662
MP1662 2000-GET-MONTH-LIT-X.
MP1662     EXIT.
MP1662/
      *****************************************************************
      *   LINKAGE PROCESSING COPYBOOKS                                *
      *****************************************************************
      /
       COPY XCPS2490.
       COPY XCPL2490.
       
      *****************************************************************
      **                 END OF PROGRAM XSRU9681                     **
      *****************************************************************
