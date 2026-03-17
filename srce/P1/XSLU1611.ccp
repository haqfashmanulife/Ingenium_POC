      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSLU1611.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSLU1611                                         **
      **  REMARKS:  RETRIEVE LAST 100 MSIN RECORDS IN SEVERITY       **
      **            ORDER FOR THE LAST TASK EXECUTED, PERFORM A      **
      **            ROLLBACK, AND RE-INSERT THE RECORDS THAT WERE    **
      **            EXTRACTED.                                       **
      **                                                             **
      **  DOMAIN :  XS                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      ** 30MAR1999  60    NEW                                        **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
016227**  30JUN00  602    CODE CLEANUP                               **
01AR01**  16MAY01  MAW    ARCHITECTURAL CHANGES TO SUPPORT MULTIPLE  **
01AR01**                  CICS ENVIRONMENTS                          **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSLU1611'.

       COPY SQLCA.
       COPY XCWLPTR.

      *  BUFFER AREA FOR RETRIEVING MSIN RECORDS PRIOR TO ISSUING A ROLLBACK.

014590*COPY XCWL0030.
       COPY XCWL0035.

01AR01 COPY XCWWENVT.
 
      *****************************************************************
      * CALLED MODULE PARAMETER INFORMATION                           *
      *****************************************************************

       COPY XCWW1611.
       COPY XCFRMSIN.
       COPY XCFWMSIN.
       COPY XCFWMSIS.
      /
      *****************
       LINKAGE SECTION.
      *****************

       01   DFHCOMMAREA.
         02  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL1611.

      ********************
       PROCEDURE DIVISION.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------

           SET ADDRESS OF L1611-PARM-INFO    TO WGLOB-PARM-ADDR-PTR (1).
           SET L1611-RETRN-OK                TO TRUE.

           INITIALIZE L1611-OUTPUT-PARM-INFO.

           EVALUATE TRUE

               WHEN L1611-RQST-ROLLBACK-SAVE-MSIN
                   PERFORM  1000-ROLLBACK-AND-SAVE-MSIN
                       THRU 1000-ROLLBACK-AND-SAVE-MSIN-X

               WHEN L1611-RQST-RETRIEVE-MSIN
                   PERFORM  2000-RETRIEVE-MSIN
                       THRU 2000-RETRIEVE-MSIN-X


               WHEN OTHER
                   SET  L1611-RETRN-INVALID-REQUEST  TO  TRUE

           END-EVALUATE.


           GOBACK.

       0000-MAINLINE-X.
           EXIT.


      *---------------------------
       1000-ROLLBACK-AND-SAVE-MSIN.
      *---------------------------
      *****************************************************************
      ** THIS PARAGRAPH WILL OBTAIN UP TO 100 OF THE LAST MSIN       **
      ** GENERATED, STORE THEM IN A BUFFER, PERFORM A ROLLBACK       **
      ** AND REWRITE THE RECORDS                                     **
      *****************************************************************

           PERFORM  9100-READ-MSIN-INTO-BUFFER
               THRU 9100-READ-MSIN-INTO-BUFFER-X.

           PERFORM  9200-ROLLBACK
               THRU 9200-ROLLBACK-X.

           PERFORM  9300-REWRITE-LAST-100-MSIN
               THRU 9300-REWRITE-LAST-100-MSIN-X.

       1000-ROLLBACK-AND-SAVE-MSIN-X.
           EXIT.
      /
      *------------------
       2000-RETRIEVE-MSIN.
      *------------------

           PERFORM  9100-READ-MSIN-INTO-BUFFER
               THRU 9100-READ-MSIN-INTO-BUFFER-X.

       2000-RETRIEVE-MSIN-X.
           EXIT.

      /
      *---------------------------
       9100-READ-MSIN-INTO-BUFFER.
      *---------------------------

           INITIALIZE L1611-MSIN-BUFFER-AREA.

      * SETUP FOR END-BROWSE KEY

           MOVE WGLOB-USER-ID           TO WMSIS-USER-ID.
           MOVE WGLOB-SYSTEM-DATE-INT   TO WMSIS-USER-MSG-DT.
           MOVE WGLOB-SYSTEM-TIME       TO WMSIS-USER-MSG-TIME.
           MOVE WGLOB-TASK-ID           TO WMSIS-USER-MSG-TASK-ID.
           SET  WMSIS-MSG-SEVRTY-INFO   TO TRUE.
           MOVE +001                    TO WMSIS-USER-MSG-SEQ-NUM.

           MOVE WMSIS-KEY               TO WMSIS-ENDBR-KEY.

      * SETUP FOR START BROWSE KEY

           SET  WMSIS-MSG-SEVRTY-SYSTEM TO TRUE.
           MOVE +999                    TO WMSIS-USER-MSG-SEQ-NUM.

           PERFORM  MSIS-1000-BROWSE-PREV
               THRU MSIS-1000-BROWSE-PREV-X.

           PERFORM  MSIS-2000-READ-PREV
               THRU MSIS-2000-READ-PREV-X.

           MOVE ZERO                    TO L1611-MSIN-REC-CTR.
           MOVE +1                      TO W1611-SUB.
           PERFORM  9110-UPDATE-MSIN-BUFFER
               THRU 9110-UPDATE-MSIN-BUFFER-X
              UNTIL W1611-SUB > L1611-MAX-BUFFER-CTR
                 OR WMSIS-IO-EOF.

           IF  WMSIS-IO-OK
           AND L1611-RQST-RETRIEVE-MSIN
016227*        PERFORM  MSIS-2000-READ-PREV
016227*            THRU MSIS-2000-READ-PREV-X
016227*        IF WMSIS-IO-OK
                   SET L1611-MSIN-MORE-MESSAGES  TO TRUE
016227*        END-IF
           END-IF.

           PERFORM  MSIS-3000-END-BROWSE-PREV
               THRU MSIS-3000-END-BROWSE-PREV-X.

       9100-READ-MSIN-INTO-BUFFER-X.
           EXIT.

      *-----------------------
       9110-UPDATE-MSIN-BUFFER.
      *-----------------------

           SET  W1611-DUPS-NOT-FOUND  TO TRUE.

           PERFORM  9111-SCAN-FOR-DUPS
               THRU 9111-SCAN-FOR-DUPS-X
            VARYING W1611-SUB2 FROM 1 BY 1
              UNTIL W1611-SUB2 > W1611-SUB
                 OR W1611-DUPS-FOUND.

           IF W1611-DUPS-NOT-FOUND
               IF L1611-RQST-RETRIEVE-MSIN
               AND RMSIN-USER-MSG-GUI-NO
                   NEXT SENTENCE
               END-IF
               MOVE RMSIN-REC-INFO    TO L1611-MSIN-REC-INFO (W1611-SUB)
               ADD  +1                TO L1611-MSIN-REC-CTR
               ADD  +1                TO W1611-SUB
           END-IF.

           PERFORM  MSIS-2000-READ-PREV
               THRU MSIS-2000-READ-PREV-X.

       9110-UPDATE-MSIN-BUFFER-X.
           EXIT.
      /

      *------------------
       9111-SCAN-FOR-DUPS.
      *------------------

           IF RMSIN-USER-MSG-TXT = L1611-MSIN-USER-MSG-TXT (W1611-SUB2)
               SET  W1611-DUPS-FOUND    TO TRUE
           END-IF.

       9111-SCAN-FOR-DUPS-X.
           EXIT.

      *-------------
       9200-ROLLBACK.
      *-------------

01AR01     IF WENVT-IBM-CICS
MVS           EXEC CICS
MVS                SYNCPOINT ROLLBACK
MVS           END-EXEC
01AR01     ELSE 
NTDEV         PERFORM  0035-2000-ROLLBACK
NTDEV             THRU 0035-2000-ROLLBACK-X
01AR01     END-IF.


       9200-ROLLBACK-X.
           EXIT.
      /
      *--------------------------
       9300-REWRITE-LAST-100-MSIN.
      *--------------------------

           MOVE +1                      TO W1611-SUB.
           PERFORM  9310-REWRITE-ONE-MSIN
               THRU 9310-REWRITE-ONE-MSIN-X
              UNTIL W1611-SUB > L1611-MSIN-REC-CTR.

       9300-REWRITE-LAST-100-MSIN-X.
           EXIT.

      *---------------------
       9310-REWRITE-ONE-MSIN.
      *---------------------

           MOVE L1611-MSIN-REC-INFO (W1611-SUB) TO RMSIN-REC-INFO.

           MOVE RMSIN-KEY               TO WMSIN-KEY.

           PERFORM  MSIN-1000-WRITE
               THRU MSIN-1000-WRITE-X.

           ADD  +1                      TO W1611-SUB.

       9310-REWRITE-ONE-MSIN-X.
           EXIT.

      *****************************************************************
      **                   PROCESSING COPYBOOKS                      **
      *****************************************************************

       COPY XCPVMSIS.
       COPY XCPAMSIN.
       COPY XCCP0030.
       COPY XCPL0035.

      *****************************************************************
      **                 END OF PROGRAM XSLU1611                     **
      *****************************************************************
