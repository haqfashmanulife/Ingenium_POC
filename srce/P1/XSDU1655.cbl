      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. XSDU1655.
 
       COPY XCWWCRHT.
 
      *****************************************************************
      **  MEMBER :  XSDU1655                                         **
      **  REMARKS:  DATE UTILITY - RETURN DAY OF THE WEEK            **
      **            USING THE PASSED IN INTERNAL DATE.               **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
02GL03**  12APR02  BMB    NEW FOR MANUFLEX PHASE 2                   **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU1655'.

       01  WS-DAY-OF-WEEK                 PIC 9(02) VALUE ZERO.
      
       01  WS-DAY-NAME-TABLE.
           05  WS-WEEK-DAY-NAME           OCCURS 7 TIMES
                                          PIC X(10).
      
       01 WS-YYYY                         PIC 9(04) COMP-3.
       01 WS-MM                           PIC 9(02) COMP-3.
       01 WS-N1                           PIC 9(10) COMP-3.
       01 WS-N2                           PIC 9(10) COMP-3.
       01 WS-DAY-INTEGER                  PIC 9(10) COMP-3.
       01 WS-YYYYD400                     PIC 9(10) COMP-3.
       01 WS-YYYYD100                     PIC 9(10) COMP-3.
       01 WS-N7                           PIC 9(10) COMP-3.
 
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      *****************************************************************
       COPY XCWWWKDT.
       COPY XCWL2490.
      /
      *****************
       LINKAGE SECTION.
      *****************
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.

       COPY XCWL1655.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L1655-PARM-INFO.
      *--------------
       0000-MAINLINE.
      *--------------

           SET L1655-RETRN-OK TO TRUE.

           PERFORM  1000-PROCESS-DATE
               THRU 1000-PROCESS-DATE-X.

           GOBACK.

       0000-MAINLINE-X.
           EXIT.
      /
      *------------------
       1000-PROCESS-DATE.
      *------------------

           IF  L1655-INTERNAL-DATE = WWKDT-ZERO-DT
               MOVE SPACES          TO L1655-DAY-OF-WEEK
               SET  L1655-NOT-VALID TO TRUE
               GO TO 1000-PROCESS-DATE-X
           END-IF.
            
           PERFORM  9900-LOAD-DAYS-TABLE
               THRU 9900-LOAD-DAYS-TABLE-X.

           EVALUATE TRUE

               WHEN  L1655-INTERNAL-DAY-OF-WEEK
                    PERFORM  2000-DAY-OF-WEEK
                        THRU 2000-DAY-OF-WEEK-X

               WHEN OTHER
                    SET L1655-RETRN-INVALID-REQUEST TO TRUE

           END-EVALUATE.

       1000-PROCESS-DATE-X.
           EXIT.
      /
      /
      *---------------------
       2000-DAY-OF-WEEK.
      *---------------------

      *  THE FOLLOWING ROUTINE USES ZELLER'S CONGRUENCE
       
           IF L1655-MM-1 < 3
              COMPUTE WS-MM    = L1655-MM-1 + 12
              COMPUTE WS-YYYY  = L1655-YYYY-1 - 1
           ELSE
              MOVE L1655-MM-1       TO WS-MM
              MOVE L1655-YYYY-1     TO WS-YYYY
           END-IF.

           COMPUTE WS-N1          = (WS-MM + 1) * 26 / 10.
           COMPUTE WS-N2          = WS-YYYY * 125 / 100.
           COMPUTE WS-YYYYD400    = WS-YYYY / 400.
           COMPUTE WS-YYYYD100    = WS-YYYY / 100.
           COMPUTE WS-DAY-INTEGER = WS-YYYYD400 - WS-YYYYD100
                                  + L1655-DD-1 + WS-N1 + WS-N2.

           DIVIDE WS-DAY-INTEGER BY 7 GIVING WS-N7
                  REMAINDER WS-DAY-OF-WEEK
           END-DIVIDE.

           IF WS-DAY-OF-WEEK = 0
              MOVE 7 TO WS-DAY-OF-WEEK
           END-IF.

           MOVE WS-WEEK-DAY-NAME (WS-DAY-OF-WEEK) TO L1655-DAY-OF-WEEK.
            
       2000-DAY-OF-WEEK-X.
           EXIT.

      /
      *-----------------------
       9900-LOAD-DAYS-TABLE.
      *-----------------------
                                                         
      * GET THE DAYS TABLE INTO THE WS FIELD 
           PERFORM 2490-1000-BUILD-PARM-INFO
               THRU 2490-1000-BUILD-PARM-INFO-X
                                                         
           MOVE 'XSDU1655'                   TO L2490-TXT-SRC-ID
           MOVE '00001'                      TO L2490-TXT-SRC-REF-ID
                                                         
           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
                                                         
           MOVE L2490-TXT-STR-TXT TO WS-DAY-NAME-TABLE.
      
       9900-LOAD-DAYS-TABLE-X.
           EXIT.
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
       COPY XCPS2490.
       COPY XCPL2490.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************

      *****************************************************************
      **                 END OF PROGRAM XSDU1655                     **
      *****************************************************************
