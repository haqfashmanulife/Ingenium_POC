      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSRU9680.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER  : XSRU9680                                         **
      **  REMARKS : DATE CONVERSION ROUTINE:                         **
      **              FROM JAPANESE EMPEROR DATE TO YYYY-MM-DD       **
      **              FROM YYYY-MM-DD TO EMPEROR DATE                **
      **                                                             **
      **            EMPEROR DATE FORMAT IS:                          **
      **              E-YY-MM-DD                                     **
      **                 WHERE:                                      **
      **                   E   IS THE EMPEROR NUMBER (1, 2, 3, OR 4) **
      **                   YY  IS THE YEAR OF THE EMPEROR'S REIGN    **
      **                   MM  MONTH (SAME AS CHRISTIAN CALENDAR)    **
      **                   DD  DAY   (SAME AS CHRISTIAN CALENDAR)    **
      **                                                             **
      **     YYYY-MM-DD TO EMPEROR DATE CONVERSION:                  **         
      **                                                             **
      **            OBTAIN DATE FROM BATCH PROGRAMS (INTERNAL FORMAT)**
      **            AS CARRIED ON THE DATABASE TABLE FIELDS - THIS   **
      **            MODULE WILL RETURN THE DATE IN 'EMPEROR FORMAT'  **
      **            FOR BUSINESS IN JAPAN.                           **
      **            - RETURNS THE EMPEROR NAME AND NUMBER, YEAR OF   **
      **              REIGN + MONTH & DAY OF YEAR...                 **
      **            - YOU MUST USE THE EMPEROR # TO LOOK UP NAME ON  **
      **              ON THE 'TEXT' TABLE...                         **
      **              INFO RETURNED:                                 **
      **                              EMPEROR NUMBER                 **
      **                              EMPEROR NAME                   **
      **                              YEAR OF REIGN                  **
      **                              MONTH (CHRISTIAN ERA FORMAT)   **
      **                              DAY   (CHRISTIAN ERA FORMAT)   **
      **                        + UNCOMPRESSED 'EMPEROR DATE FORMAT' **
      **                                                             **
      **     EMPEROR DATE TO YYYY-MM-DD CONVERSION:                  **
      **                                                             **
      **            IF VALUE FOR E IS NOT ENTERED (SPACES)           **
      **               DEFAULTS TO CURRENT EMPEROR (4)               **
      **            IF E IS NOT 1, 2, 3 0R 4                         **
      **               L9680-NOT-VALID IS TURNED ON                  ** 
      **                                                             **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTHOR  DESCRIPTION                               **
01PT02** 01AUG01    GW     NEW                                       **
      ** 01AUG01    KRW    UPDATED TO INCLUDE EMP TO INT CONVERSION  **
01PT02** 01AUG01    MAW    ADD L9680-EMPEROR-DT-FMT2                 **
M245O5** 01SEP14           FORMATTING FOR L9680-EMPEROR-YR-FMT       **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
      ***************
       DATA DIVISION.
      ***************
 
       WORKING-STORAGE SECTION.
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSRU9680'.
 
       COPY XCWW9680.
      /
       COPY XCWLDTLK.
      /
       COPY XCWWWKDT.
      /
       COPY CCWWINDX.
      /
       COPY XCWL2490.
      /
       COPY XCWL0015.
      /
      *****************
       LINKAGE SECTION.
      *****************
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
 
       COPY XCWL9680.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L9680-PARM-INFO.
 
      *--------------
       0000-MAINLINE.
      *--------------

           SET L9680-RETRN-OK      TO TRUE.
           SET L9680-VALID         TO TRUE.

           PERFORM  2490-1000-BUILD-PARM-INFO
               THRU 2490-1000-BUILD-PARM-INFO-X.
           MOVE 'XSRU9680'         TO L2490-TXT-SRC-ID.
 
           EVALUATE TRUE
 
               WHEN L9680-RQST-GET-EMP-DATE      
                   PERFORM  1000-SETUP-IN-DATE
                       THRU 1000-SETUP-IN-DATE-X

               WHEN L9680-RQST-EMP-TO-INTERNAL      
                   PERFORM  2000-EMP-TO-INTERNAL
                      THRU  2000-EMP-TO-INTERNAL-X
 
               WHEN OTHER
                   SET L9680-RETRN-INVALID-REQUEST TO TRUE
 
           END-EVALUATE.
 
           GOBACK.
 
       0000-MAINLINE-X.
           EXIT.

      /
      *-------------------
       1000-SETUP-IN-DATE.
      *-------------------

           MOVE L9680-INT-YYYY             TO W9680-IN-YYYY.               
           MOVE L9680-INT-MM               TO W9680-IN-MM.
           MOVE L9680-INT-DD               TO W9680-IN-DD.

           MOVE ZERO                       TO W9680-HOLD-YR.
           SET W9680-EMP-YR-FOUND-NO       TO TRUE. 
         
           PERFORM 1200-EMPEROR-START-DT-SEEK 
               THRU 1200-EMPEROR-START-DT-SEEK-X
                 VARYING I FROM W9680-NUM-OF-EMPERORS BY -1 
                 UNTIL W9680-EMP-YR-FOUND-YES.           
           
           EVALUATE TRUE
               WHEN W9680-HOLD-YR NOT = ZERO
                    PERFORM 1300-EMPEROR-DT-FORMAT
                        THRU 1300-EMPEROR-DT-FORMAT-X
           END-EVALUATE.

       1000-SETUP-IN-DATE-X.
           EXIT.

      /
      *--------------------------
       1200-EMPEROR-START-DT-SEEK.
      *--------------------------
      *****************************************************************
      ** THIS PARAGRAPH WILL OBTAIN THE 'EMPEROR NUMBER' IN WHOSE REIGN
      **    THE DATE PASSED IN FALLS.
      **            THE LOGIC LOOP START WITH THE LATEST EMPEROR (WHOSE
      **            REIGN WE'RE STILL IN) AND WORKS BACK.
      **                          
      **            THE CONDITION WE'RE LOOKING FOR IS:
      **             IS THE INPUT DATE > OR = TO THE 'START DATE' OF
      **                                         EMPEROR'S REIGN...
      *****************************************************************
 
            IF W9680-IN-DATE NOT < W9680-EMPEROR-DATE (I)
               MOVE I                  TO L9680-EMPEROR-NUM-R
               MOVE W9680-IN-MM        TO L9680-EMP-MM
               MOVE W9680-IN-DD        TO L9680-EMP-DD
               MOVE W9680-EMP-YYYY (I) TO W9680-HOLD-YR
               SET  W9680-EMP-YR-FOUND-YES 
                                       TO TRUE
               MOVE ZERO               TO I
            END-IF.

       1200-EMPEROR-START-DT-SEEK-X.
           EXIT.

       
      /
       1300-EMPEROR-DT-FORMAT.
           
      **------------------------------------------------------------
      ** CALCULATE THE NUMBER OF YEARS INTO THE EMPEROR'S REIGN THE    
      **    INPUT DATE OCCURS ON.    
      **            FORMULA:                                           
      **             YR-OF-REIGN = (INPUT-YR - EMPEROR-SART-YR) + 1
      **------------------------------------------------------------

           COMPUTE L9680-EMP-YY = 
                           (W9680-IN-YYYY - W9680-HOLD-YR) + 1.

      **------------------------------------------------------    
      ** RETRIEVE EMPEROR'S NAME                                  
      *-------------------------------------------------------
      *  L2490-TXT-SRC-REF-ID  WILL ALWAYS HAVE '090??'AS THE   
      *  DEFAULT FIRST 3 DIGITS FOR THE TEXT FILE WHEN LOOKING
      *  FOR EMPEROR NAME...
      *-------------------------------------------------------
           IF L9680-RETRN-OK    
              MOVE 090                    TO W9680-HOLD-TXT-NUM-PRE 
              MOVE L9680-EMPEROR-NUM-R    TO W9680-HOLD-TXT-NUM-SUF 
              MOVE W9680-HOLD-TXT-NUM     TO L2490-TXT-SRC-REF-ID
              PERFORM  2490-1000-RETRIEVE-TEXT
                  THRU 2490-1000-RETRIEVE-TEXT-X
              MOVE L2490-TXT-STR-TXT      TO W9680-EMPEROR-NAME
                                             L9680-EMPEROR-NAME
                                             W9680-FMT2-EMPEROR-NAME
           ELSE
              MOVE SPACES TO W9680-EMPEROR-NAME
                             L9680-EMPEROR-NAME  
                             W9680-FMT2-EMPEROR-NAME
           END-IF.
       
           MOVE L9680-EMP-YY           TO W9680-REIGN-YR
                                          W9680-FMT2-REIGN-YR.
           MOVE L9680-EMP-MM           TO W9680-EMP-MONTH 
                                          W9680-FMT2-EMP-MONTH.
           MOVE L9680-EMP-DD           TO W9680-EMP-DAY
                                          W9680-FMT2-EMP-DAY.
                                     
      *  COMPRESS ANY BLANKS AND RETURN THE EMPEROR DATE FORMAT
           MOVE W9680-EMPEROR-DT-FMT   TO L0015-COMP-AREA-IN.
           SET L0015-RQST-COMPRESS-NO-BLANKS  TO  TRUE.
           PERFORM  0015-2000-COMPRESS-NO-BLANKS
               THRU 0015-2000-COMPRESS-NO-BLANKS-X.
           MOVE L0015-COMP-AREA-OUT    TO L9680-EMPEROR-DT-FMT.

      *  GET LETTER 'Y' IN JAPANESE OR ENGLISH
           MOVE 'XSRU9681'         TO L2490-TXT-SRC-ID.
           MOVE '09001'            TO L2490-TXT-SRC-REF-ID.
           PERFORM 2490-1000-RETRIEVE-TEXT
              THRU 2490-1000-RETRIEVE-TEXT-X.
           MOVE L2490-TXT-STR-TXT  TO W9680-FMT2-Y-LIT.

      *  GET LETTER 'M' IN JAPANESE OR ENGLISH
           MOVE '09002'            TO L2490-TXT-SRC-REF-ID.
           PERFORM 2490-1000-RETRIEVE-TEXT
              THRU 2490-1000-RETRIEVE-TEXT-X.
           MOVE L2490-TXT-STR-TXT  TO W9680-FMT2-M-LIT.

      *  GET LETTER 'D' IN JAPANESE OR ENGLISH
           MOVE '09003'            TO L2490-TXT-SRC-REF-ID.
           PERFORM 2490-1000-RETRIEVE-TEXT
              THRU 2490-1000-RETRIEVE-TEXT-X.
           MOVE L2490-TXT-STR-TXT  TO W9680-FMT2-D-LIT.

      *  REMOVE ANY ZEROES FROM THE FRONT OF YR, MM, DD FIELDS 
      *  (IE. '09Y' SHOULD BE CHANGED TO ' 9Y' ETC.) 

           IF  W9680-FMT2-RGN-YR-X1 = '0'
               MOVE ' ' TO W9680-FMT2-RGN-YR-X1 
           END-IF.
            
           IF  W9680-FMT2-EMP-MM-X1 = '0'
               MOVE ' ' TO W9680-FMT2-EMP-MM-X1 
           END-IF.
            
           IF  W9680-FMT2-EMP-DD-X1 = '0'
               MOVE ' ' TO W9680-FMT2-EMP-DD-X1
           END-IF.
            
      *  RETURN THE EMPEROR DATE FORMAT2
 
           MOVE W9680-EMPEROR-DT-FMT2 TO L9680-EMPEROR-DT-FMT2. 
M245O5*
M245O5* RETURN THE EMPEROR WITH THE SPACE BETWEEN YEAR AND STRING   
M245O5     STRING W9680-FMT2-EMPEROR-NAME, W9680-EMPEROR-SPACE, 
M245O5     W9680-FMT2-RGN-YR-XX  INTO L9680-EMPEROR-YR-FMT. 
 
       1300-EMPEROR-DT-FORMAT-X.
           EXIT.

      /
      *---------------------
       2000-EMP-TO-INTERNAL.
      *---------------------
                                  
           IF L9680-EMPEROR-NUM = SPACES
              MOVE  W9680-NUM-OF-EMPERORS  TO L9680-EMPEROR-NUM-R 
           END-IF.
        
           MOVE L9680-EMPEROR-NUM-R        TO W9680-EMP-NUM.
             
           IF EMP-NUM-VALID
              CONTINUE
           ELSE
              SET L9680-NOT-VALID          TO TRUE
              GO TO 2000-EMP-TO-INTERNAL-X
           END-IF.

           MOVE W9680-EMPEROR-DATE (W9680-EMP-NUM)
                                           TO W9680-HOLD-YR.
                                           
           COMPUTE L9680-INT-YYYY = 
                           (W9680-HOLD-YR + L9680-EMP-YY) - 1.
                   
           MOVE L9680-EMP-MM               TO L9680-INT-MM.
           MOVE L9680-EMP-DD               TO L9680-INT-DD.

           MOVE W9680-SEPARATOR            TO L9680-SEP-1.                      
                            
           MOVE W9680-SEPARATOR            TO L9680-SEP-2.                      
                            
       
       2000-EMP-TO-INTERNAL-X.
           EXIT.
      
      /
      *****************************************************************
      *   LINKAGE PROCESSING COPYBOOKS                                *
      *****************************************************************
       
       COPY XCPS2490.
       COPY XCPL2490.
      /              
       COPY XCPL0015.
      /
      *****************************************************************
      **                 END OF PROGRAM XSRU9680                     **
      *****************************************************************
