      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSLU8095.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSLU8095                                         **
      **  REMARKS:  PERFORM CLEAN UP ON MSIN, TWRK AND USER FILES FOR**
      **            THE USER PASSED IN ON THE PARM AREA              **
      **                                                             **
      **  DOMAIN :  XS                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      ** 30MAR1999  60    NEW                                        **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
017618**  09FEB01  612J   ADD NEW PARAGRAPH TO DELETE RECS ONLY      **
017618**                  RELATED TO A SINGLE PROCESS ID             **
      *****************************************************************

      *--------------------
       ENVIRONMENT DIVISION.
      *--------------------

      *--------------
       DATA DIVISION.
      *--------------

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSLU8095'.

       COPY SQLCA.
       COPY XCWLPTR.
       COPY XCWWWKDT.

014590*COPY XCWL0030.

      *****************************************************************
      * CALLED MODULE PARAMETER INFORMATION                           *
      *****************************************************************

       COPY CCFRUSER.
       COPY CCFWUSER.

       COPY XCFRMSIN.
       COPY XCFWMSIN.

       COPY XCFRTWRK.
       COPY XCFWTWRK.

      /
      *----------------
       LINKAGE SECTION.
      *----------------

       01   DFHCOMMAREA.
         02  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL8095.

      *------------------
       PROCEDURE DIVISION.
      *------------------

      *--------------
       0000-MAINLINE.
      *--------------

           SET ADDRESS OF L8095-PARM-INFO    TO WGLOB-PARM-ADDR-PTR (1).
           SET L8095-RETRN-OK                TO TRUE.

           INITIALIZE L8095-OUTPUT-PARM-INFO.

           EVALUATE TRUE

               WHEN L8095-RQST-CLEANUP-MSIN-TWRK
                   PERFORM  1000-CLEANUP-MSIN
                       THRU 1000-CLEANUP-MSIN-X
                   PERFORM  2000-CLEANUP-TWRK
                       THRU 2000-CLEANUP-TWRK-X

               WHEN L8095-RQST-CLEANUP-TWRK
                   PERFORM  2000-CLEANUP-TWRK
                       THRU 2000-CLEANUP-TWRK-X

               WHEN L8095-RQST-CLEANUP-USER
                   PERFORM  3000-CLEANUP-USER
                       THRU 3000-CLEANUP-USER-X

017618         WHEN L8095-RQST-CLEANUP-TWRK-PID
017618             PERFORM  4000-CLEANUP-TWRK-PID
017618                 THRU 4000-CLEANUP-TWRK-PID-X

               WHEN OTHER
                   SET  L8095-RETRN-INVALID-REQUEST  TO  TRUE

           END-EVALUATE.


           GOBACK.

       0000-MAINLINE-X.
           EXIT.


      *-----------------
       1000-CLEANUP-MSIN.
      *-----------------

           MOVE L8095-USER-ID       TO WMSIN-USER-ID.
           MOVE WWKDT-LOW-DT        TO WMSIN-USER-MSG-DT.
           MOVE ZERO                TO WMSIN-USER-MSG-TIME.
           MOVE LOW-VALUES          TO WMSIN-USER-MSG-TASK-ID.
           MOVE ZERO                TO WMSIN-USER-MSG-SEQ-NUM.

           MOVE WMSIN-KEY           TO WMSIN-ENDBR-KEY.
           MOVE WWKDT-HIGH-DT       TO WMSIN-ENDBR-USER-MSG-DT.
           MOVE +9999999            TO WMSIN-ENDBR-USER-MSG-TIME.
           MOVE HIGH-VALUES         TO WMSIN-ENDBR-USER-MSG-TASK-ID.
           MOVE +999                TO WMSIN-ENDBR-USER-MSG-SEQ-NUM.

           PERFORM  MSIN-1000-DELETE-KEY-RANGE
               THRU MSIN-1000-DELETE-KEY-RANGE-X.

       1000-CLEANUP-MSIN-X.
           EXIT.

      *--------------------------
       2000-CLEANUP-TWRK.
      *--------------------------

           MOVE L8095-USER-ID       TO WTWRK-USER-ID.
           MOVE LOW-VALUES          TO WTWRK-TEMP-WRK-PRCES-ID.
           MOVE LOW-VALUES          TO WTWRK-TEMP-WRK-AREA-ID.
           MOVE ZERO                TO WTWRK-TEMP-WRK-INSTC-ID.
           MOVE ZERO                TO WTWRK-TEMP-WRK-SEQ-NUM.

           MOVE WTWRK-KEY           TO WTWRK-ENDBR-KEY.
017618*    MOVE LOW-VALUES          TO WTWRK-ENDBR-TEMP-WRK-PRCES-ID.
017618     MOVE HIGH-VALUES         TO WTWRK-ENDBR-TEMP-WRK-PRCES-ID.
           MOVE HIGH-VALUES         TO WTWRK-ENDBR-TEMP-WRK-AREA-ID.
           MOVE +999                TO WTWRK-ENDBR-TEMP-WRK-INSTC-ID.
           MOVE +99999              TO WTWRK-ENDBR-TEMP-WRK-SEQ-NUM.

           PERFORM  TWRK-1000-DELETE-KEY-RANGE
               THRU TWRK-1000-DELETE-KEY-RANGE-X.

       2000-CLEANUP-TWRK-X.
           EXIT.


      *-----------------
       3000-CLEANUP-USER.
      *-----------------

           MOVE L8095-USER-ID        TO WUSER-USER-ID.
           MOVE LOW-VALUES           TO WUSER-SBSDRY-CO-ID.
           MOVE WWKDT-LOW-TS         TO WUSER-USER-SESN-TS.

           MOVE WUSER-KEY            TO WUSER-ENDBR-KEY.
           MOVE HIGH-VALUES          TO WUSER-ENDBR-SBSDRY-CO-ID.
           MOVE WWKDT-HIGH-TS        TO WUSER-ENDBR-USER-SESN-TS.

           PERFORM  USER-1000-DELETE-KEY-RANGE
               THRU USER-1000-DELETE-KEY-RANGE-X.

       3000-CLEANUP-USER-X.
           EXIT.


017618*--------------------------
017618 4000-CLEANUP-TWRK-PID.
017618*--------------------------
017618
017618     MOVE L8095-USER-ID       TO WTWRK-USER-ID.
017618     MOVE WGLOB-PRCES-ID      TO WTWRK-TEMP-WRK-PRCES-ID.
017618     MOVE LOW-VALUES          TO WTWRK-TEMP-WRK-AREA-ID.
017618     MOVE ZERO                TO WTWRK-TEMP-WRK-INSTC-ID.
017618     MOVE ZERO                TO WTWRK-TEMP-WRK-SEQ-NUM.
017618
017618     MOVE WTWRK-KEY           TO WTWRK-ENDBR-KEY.
017618     MOVE HIGH-VALUES         TO WTWRK-ENDBR-TEMP-WRK-AREA-ID.
017618     MOVE +999                TO WTWRK-ENDBR-TEMP-WRK-INSTC-ID.
017618     MOVE +99999              TO WTWRK-ENDBR-TEMP-WRK-SEQ-NUM.
017618
017618     PERFORM  TWRK-1000-DELETE-KEY-RANGE
017618         THRU TWRK-1000-DELETE-KEY-RANGE-X.
017618
017618 4000-CLEANUP-TWRK-PID-X.
017618     EXIT.

      /
      *****************************************************************
      **                   PROCESSING COPYBOOKS                      **
      *****************************************************************

       COPY CCPGUSER.
       COPY XCPGMSIN.
       COPY XCPGTWRK.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM XSLU8095                     **
      *****************************************************************
