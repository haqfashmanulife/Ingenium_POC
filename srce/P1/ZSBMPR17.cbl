      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBMPR17.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  ZSBMPR17                                         **
      **                                                             **
      **  REMARKS:  THIS PROGRAM WILL ADD IN A NEW PHST RECORD FOR   **         
      **            POLICIES THAT HAVE BEEN REINSTATED FROM A LAPSE. **
      **                                                             **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
02PR17**  30JUN02  WBP    CREATED FOR CASH BACK BONUSES              **         
P02229**  20OCT04  CY     ADD COMMIT LOGIC TO MAINLINES              **
      *****************************************************************

      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMPR17'.

       COPY SQLCA.

       01  WS-PGM-WORK-AREA.
           05  WS-HOLD-KEY                  PIC X(21).                          
           05  WS-PROCESS-IND               PIC X(1).                           
               88  WS-PROCESS-END           VALUE '1'.                          
           05  WS-PHST-IND                  PIC X(1).                           
               88  WS-PHST-NOT-FOUND        VALUE '0'.                          
               88  WS-PHST-FOUND            VALUE '1'.                          
               88  WS-PHST-EOF              VALUE '9'.                          

       01  WS-REPORT-DET-LINE.
           05  WS-POL-ID                    PIC X(10).                          
           05  FILLER                       PIC X(20) VALUE                     
                                            ' PHST WRITTEN'.                    
           05  FILLER                       PIC X(102) VALUE SPACES.            

       01  WS-REPORT-ERR-LINE.
           05  WS-ERR-POL-ID                PIC X(10).                          
           05  FILLER                       PIC X(20) VALUE                     
                                            ' ERROR WRITING PHST'.              
           05  FILLER                       PIC X(102) VALUE SPACES.            
      /
P02229 COPY XCWL0035.

       COPY XCWWWKDT.
       COPY CCWL0950.
       COPY CCWL2408.
       COPY CCWL0010.
       COPY CCWWINDX.
      /
       COPY XCWWHDG.
       COPY XCWWTIME.
       COPY XCWL0040.
       COPY XCWTFCMD.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY CCFWPHST.
       COPY CCFRPHST.
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
      ********************
       PROCEDURE DIVISION.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  2000-INITIALIZE
               THRU 2000-INITIALIZE-X.

           PERFORM  3000-UPDATE-PROCESS
               THRU 3000-UPDATE-PROCESS-X
               UNTIL WS-PROCESS-END.                                            

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

P02229     PERFORM  0035-1000-COMMIT
P02229         THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAINLINE-X.
           EXIT.
      /
      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       2000-INITIALIZE.
      *----------------

           MOVE '0'                     TO WS-PROCESS-IND.
           MOVE 'CP'                    TO WGLOB-COMPANY-CODE.

           PERFORM 0010-0000-INIT-PARM-INFO
              THRU 0010-0000-INIT-PARM-INFO-X.

           PERFORM 0010-1000-INIT-DEFAULT
              THRU 0010-1000-INIT-DEFAULT-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE L0950-COMPANY-NAME      TO L0040-COMPANY-NAME.

           PERFORM  2100-INIT-OCF-TITLES
               THRU 2100-INIT-OCF-TITLES-X.

      *                                                                         
      *  BUILD START/END BROWSE KEY
      *
           MOVE LOW-VALUES           TO WPHST-KEY.                              
           MOVE ZERO                 TO WPHST-PCHST-SEQ-NUM.                    
           MOVE WPHST-KEY            TO WS-HOLD-KEY.                            

       2000-INITIALIZE-X.
           EXIT.
      /
      *---------------------
       2100-INIT-OCF-TITLES.
      *---------------------
      *
      * SET UP THE TITLE/HEADING LINES FOR THE OCF REPORT
      *
           MOVE ZERO                    TO L0040-ERROR-CNT.

      *
      * GET THE SYSTEM ID
      *
           MOVE 'CS00000056'            TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT           TO L0040-SYSTEM-ID.

      *
      * GET THE PROGRAM DESCRIPTION
      *
           MOVE '02PR17 PHST CONVERSION' TO L0040-PROGRAM-DESC.                 

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

       2100-INIT-OCF-TITLES-X.
           EXIT.
      /
      *--------------------
       3000-UPDATE-PROCESS.
      *--------------------

      *
      *  POSITION AT THE FIRST RECORD
      *
           MOVE WS-HOLD-KEY    TO WPHST-KEY.                                    
           ADD +1              TO WPHST-PCHST-SEQ-NUM.                          
           MOVE HIGH-VALUES    TO WPHST-ENDBR-KEY.                              
           MOVE 999            TO WPHST-ENDBR-PCHST-SEQ-NUM.                    
           PERFORM  PHST-1000-BROWSE
               THRU PHST-1000-BROWSE-X.

           IF NOT WPHST-IO-OK                                                   
               SET WS-PROCESS-END TO TRUE                                       
               GO TO 3000-UPDATE-PROCESS-X                                      
           END-IF.

           SET WS-PHST-NOT-FOUND TO TRUE.
           PERFORM  3100-CHECK-PHST     
               THRU 3100-CHECK-PHST-X                                           
               UNTIL NOT WS-PHST-NOT-FOUND.                                     

           PERFORM  PHST-3000-END-BROWSE
               THRU PHST-3000-END-BROWSE-X.

           IF WS-PHST-EOF                                                       
               SET WS-PROCESS-END TO TRUE                                       
               GO TO 3000-UPDATE-PROCESS-X                                      
           END-IF.

           PERFORM  2408-1000-WRITE-PHST
               THRU 2408-1000-WRITE-PHST-X.

           IF  NOT L2408-RETRN-OK
               MOVE L2408-POL-ID        TO WS-ERR-POL-ID                        
               MOVE WS-REPORT-ERR-LINE  TO L0040-INPUT-LINE                     
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
               GO TO 3000-UPDATE-PROCESS-X                                      
           END-IF.

           MOVE L2408-POL-ID            TO WS-POL-ID.                           
           MOVE WS-REPORT-DET-LINE      TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       3000-UPDATE-PROCESS-X.
           EXIT.

      *----------------                                                         
       3100-CHECK-PHST.                                                         
      *----------------                                                         

           PERFORM  PHST-2000-READ-NEXT
               THRU PHST-2000-READ-NEXT-X.

           IF NOT WPHST-IO-OK                                                   
               SET WS-PHST-EOF TO TRUE                                          
               GO TO 3100-CHECK-PHST-X                                          
           END-IF.

           IF RPHST-POL-ACTV-TYP-ID NOT = '3003'                                
               GO TO 3100-CHECK-PHST-X                                          
           END-IF.

           IF RPHST-CVG-NUM NOT = '00'                                          
               GO TO 3100-CHECK-PHST-X                                          
           END-IF.

           IF RPHST-PCHST-NEW-VALU-TXT NOT = '1'                                
               GO TO 3100-CHECK-PHST-X                                          
           END-IF.

           IF RPHST-PCHST-OLD-VALU-TXT NOT = 'B'                                
               GO TO 3100-CHECK-PHST-X                                          
           END-IF.

           SET WS-PHST-FOUND           TO TRUE.
           MOVE RPHST-KEY              TO WS-HOLD-KEY.
      *
      *  INITIALIZE THE PHST WRITE PARMS
      *
           PERFORM  2408-0000-INIT-PARM-INFO
               THRU 2408-0000-INIT-PARM-INFO-X.

           MOVE  'CC24003901'          TO WGLOB-MSG-REF-INFO.                   
           MOVE  00                    TO L2408-CVG-NUM.                        
           SET   L2408-STAT-OVERRIDE   TO TRUE.                                 
           MOVE  SPACES                TO L2408-OLD-VALU-TXT.                   
           MOVE  SPACES                TO L2408-NEW-VALU-TXT.                   

           PERFORM  2408-1000-BUILD-PARM-INFO
               THRU 2408-1000-BUILD-PARM-INFO-X.

           MOVE RPHST-POL-ID           TO L2408-POL-ID.                         
           MOVE RPHST-PREV-UPDT-DT     TO L2408-EFF-DT.                         

       3100-CHECK-PHST-X.                                                       
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************
      * LINK COPYBOOKS
      *****************************************************************
P02229 COPY XCPL0035.

       COPY CCPS0010.
       COPY CCPL0010.
      /
       COPY CCPL0950.
       COPY CCPS0950.
      /
       COPY CCPS2408.
       COPY CCPL2408.
      /
       COPY XCPL0030.
      /
       COPY XCPL0040.
      /
       COPY XCPL0260.
      /
       COPY XCPLOCF.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS
      *****************************************************************
       COPY XCPPHDG.
      /
       COPY XCPPTIME.
      /
      *****************************************************************
      *  FILE I/O COPYBOOKS
      *****************************************************************
      /
       COPY CCPBPHST.
      /
       COPY XCPOOCF.

      *****************************************************************
      **                 END OF PROGRAM ZSBMPR17                     **
      *****************************************************************
