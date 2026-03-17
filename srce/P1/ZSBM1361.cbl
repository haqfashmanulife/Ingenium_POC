      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBM1361.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBM1361                                         **         
      **  REMARKS:  THIS WILL READ THRU ALL BAC RECORDS AND WILL     **
      **            UPDATE ANY BLANK GROUP SIZES ON RECORDS WITH     **
      **            A BILLING TYPE OF 'G' (PD BILLING)               **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      /
       DATA DIVISION.
       FILE SECTION.
      /
       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM1361'.

       COPY SQLCA.

       01  WS-PROGRAM-WORK-AREA.
           05  WS-ERROR-SW               PIC X(1).
               88  WS-NO-ERRORS                      VALUE 'N'.
               88  WS-ERRORS-FOUND                   VALUE 'Y'.

       COPY XCWWWKDT.
       01  SUBS-AND-THINGS.
           05  I                         PIC S9(4) COMP.

       01  WORK-AREAS.
      *    05  WS-RUN-DT                 PIC X(10) VALUE '2004-02-27'.          
           05  WS-SAVE-KEY               PIC X(25).                             
           05  WS-GROUP-SIZE             PIC X(01).                             

       01  WS-OUTPUT-LINE.         
           05  WS-OUTPUT-POL-ID                 PIC X(10).
           05  FILLER                           PIC X(01).
           05  WS-OUTPUT-DATE                   PIC X(10).
           05  FILLER                           PIC X(01).
           05  WS-OUTPUT-SEQ-NUM                PIC X(03).
           05  FILLER                           PIC X(01).
           05  WS-OUTPUT-MESSAGE                PIC X(40).
           05  FILLER                           PIC X(01).
           05  WS-OUTPUT-DATA                   PIC X(01).
           05  FILLER                           PIC X(64).

       COPY CCFWPOL.
       COPY CCFRPOL.

       COPY CCFWBAC.
       COPY CCFRBAC.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWLPGA.
       COPY CCWL0010.
       COPY XCWL0035.
       COPY XCWL0040.
       COPY XCWL1670.
       COPY XCWL1680.
       COPY XCWLDTLK.
       COPY XCSWOCF.
       COPY XCSROCF.
      /
      ********************
       PROCEDURE DIVISION.
      ********************
      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM 0100-OPEN-FILES
              THRU 0100-OPEN-FILES-X.

           PERFORM 1000-INITIALIZATION
              THRU 1000-INITIALIZATION-X.

           PERFORM 2000-PROCESS-IN-RECS                                         
              THRU 2000-PROCESS-IN-RECS-X                                       
              UNTIL WPOL-IO-EOF                                                 
                 OR WS-ERRORS-FOUND.                                            

           PERFORM POL-3000-TBL-END-BROWSE                                      
              THRU POL-3000-TBL-END-BROWSE-X.                                   

           PERFORM 9999-CLOSE-FILES
              THRU 9999-CLOSE-FILES-X.

       0000-MAINLINE-X.
           STOP RUN.

      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM OCF-3000-OPEN-OUTPUT
              THRU OCF-3000-OPEN-OUTPUT-X.

       0100-OPEN-FILES-X.
           EXIT.

      *--------------------
       1000-INITIALIZATION.
      *--------------------

           MOVE 'N' TO WS-ERROR-SW.

           MOVE 'CP'                 TO WGLOB-COMPANY-CODE.                     
 
           MOVE 'ZSBM1361'           TO WGLOB-MAIN-PGM-ID.                      
 
           PERFORM 0010-0000-INIT-PARM-INFO
              THRU 0010-0000-INIT-PARM-INFO-X.
           PERFORM 0010-1000-INIT-DEFAULT
              THRU 0010-1000-INIT-DEFAULT-X.
 
           MOVE 'ZSBM1361'           TO WGLOB-CRNT-PGM-ID                       
                                        WGLOB-USER-ID.                          
      *    MOVE WS-RUN-DT            TO WGLOB-PROCESS-DATE.                     

           PERFORM PGA-1000-BUILD-PARMS
              THRU PGA-1000-BUILD-PARMS-X.

           MOVE LOW-VALUES          TO WPOL-KEY.
           MOVE HIGH-VALUES         TO WPOL-ENDBR-KEY.
           PERFORM  POL-1000-TBL-BROWSE
               THRU POL-1000-TBL-BROWSE-X.

       1000-INITIALIZATION-X.
           EXIT.
      /
      *----------------------                                                   
       2000-PROCESS-IN-RECS.                                                    
      *----------------------                                                   

           PERFORM  POL-2000-TBL-READ-NEXT
               THRU POL-2000-TBL-READ-NEXT-X.
           IF NOT WPOL-IO-OK                                                    
               MOVE 'Y' TO WS-ERROR-SW
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

           MOVE RPOL-POL-ID         TO  LPGA-POLICY-NUMBER.                     

           MOVE RPOL-POL-ID          TO WBAC-POL-ID.                            
           MOVE WWKDT-LOW-DT         TO WBAC-APPL-CTL-PRCES-DT.
           MOVE LOW-VALUES           TO WBAC-SEQ-NUM.                           
      
           MOVE WBAC-KEY             TO WBAC-ENDBR-KEY.                         
           MOVE WWKDT-HIGH-DT        TO WBAC-ENDBR-APPL-CTL-PRCES-DT.           
           MOVE HIGH-VALUES          TO WBAC-ENDBR-SEQ-NUM.                     
      
           PERFORM  BAC-1000-BROWSE                                             
               THRU BAC-1000-BROWSE-X.                                          
       
           IF NOT WBAC-IO-OK                                                    
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.
       
           PERFORM 2100-CHECK-BAC-RECS                                          
              THRU 2100-CHECK-BAC-RECS-X                                        
                UNTIL NOT WBAC-IO-OK.                                           
       
           PERFORM BAC-3000-END-BROWSE                                          
              THRU BAC-3000-END-BROWSE-X.                                       
       
      *    PERFORM  0035-1000-COMMIT
      *        THRU 0035-1000-COMMIT-X.
       
       2000-PROCESS-IN-RECS-X.                                                  
           EXIT.

      *--------------------                                                     
       2100-CHECK-BAC-RECS.                                                     
      *--------------------                                                     

           PERFORM BAC-2000-READ-NEXT                                           
              THRU BAC-2000-READ-NEXT-X.                                        

           IF NOT WBAC-IO-OK                                                    
               GO TO 2100-CHECK-BAC-RECS-X                                      
           END-IF.

           IF NOT RBAC-POL-BILL-TYP-OTHER-LIST
               GO TO 2100-CHECK-BAC-RECS-X                                      
           END-IF.

           IF RBAC-PAYRL-SIZ-CD NOT = ' '
               GO TO 2100-CHECK-BAC-RECS-X                                      
           END-IF.
       
           MOVE RBAC-KEY             TO WS-SAVE-KEY.                            
       
           PERFORM BAC-3000-END-BROWSE                                          
              THRU BAC-3000-END-BROWSE-X.                                       
       
           MOVE ' '                  TO WS-GROUP-SIZE.                          
       
           PERFORM 2150-CHECK-NEXT-BAC                                          
              THRU 2150-CHECK-NEXT-BAC-X.                                       

           IF WS-GROUP-SIZE = ' '                                               
               MOVE WS-SAVE-KEY                  TO RBAC-KEY                    
               MOVE SPACES                       TO WS-OUTPUT-LINE              
               MOVE RBAC-POL-ID                  TO WS-OUTPUT-POL-ID            
               MOVE RBAC-APPL-CTL-PRCES-DT       TO WS-OUTPUT-DATE              
               MOVE RBAC-SEQ-NUM                 TO WS-OUTPUT-SEQ-NUM           
               MOVE 'GROUP SIZE LEFT UNCHANGED'  TO WS-OUTPUT-MESSAGE           
               MOVE WS-OUTPUT-LINE               TO L0040-INPUT-LINE            
               PERFORM  0040-3000-WRITE-OTHER                                   
                   THRU 0040-3000-WRITE-OTHER-X                                 
           ELSE
               MOVE WS-SAVE-KEY                  TO WBAC-KEY                    

               PERFORM  BAC-1000-READ-FOR-UPDATE                                
                   THRU BAC-1000-READ-FOR-UPDATE-X                              

               IF WBAC-IO-OK                                                    
                   MOVE WS-GROUP-SIZE            TO RBAC-PAYRL-SIZ-CD           
                   PERFORM  BAC-2000-REWRITE                                    
                       THRU BAC-2000-REWRITE-X                                  
                   MOVE WS-SAVE-KEY              TO RBAC-KEY                    
                   MOVE SPACES                   TO WS-OUTPUT-LINE              
                   MOVE RBAC-POL-ID              TO WS-OUTPUT-POL-ID            
                   MOVE RBAC-APPL-CTL-PRCES-DT   TO WS-OUTPUT-DATE              
                   MOVE RBAC-SEQ-NUM             TO WS-OUTPUT-SEQ-NUM           
                   MOVE 'GROUP SIZE CHANGED TO'  TO WS-OUTPUT-MESSAGE           
                   MOVE WS-GROUP-SIZE            TO WS-OUTPUT-DATA              
                   MOVE WS-OUTPUT-LINE           TO L0040-INPUT-LINE            
                   PERFORM  0040-3000-WRITE-OTHER                               
                       THRU 0040-3000-WRITE-OTHER-X                             
               ELSE                                                             
                   MOVE WS-SAVE-KEY              TO RBAC-KEY                    
                   MOVE SPACES                   TO WS-OUTPUT-LINE              
                   MOVE RBAC-POL-ID              TO WS-OUTPUT-POL-ID            
                   MOVE RBAC-APPL-CTL-PRCES-DT   TO WS-OUTPUT-DATE              
                   MOVE RBAC-SEQ-NUM             TO WS-OUTPUT-SEQ-NUM           
                   MOVE 'READ FOR UPDT ERR - GRPSZ LEFT UNCHANGED'              
                                                 TO WS-OUTPUT-MESSAGE           
                   MOVE WS-OUTPUT-LINE           TO L0040-INPUT-LINE            
                   PERFORM  0040-3000-WRITE-OTHER                               
                       THRU 0040-3000-WRITE-OTHER-X                             
               END-IF                                                           
           END-IF.

           MOVE WS-SAVE-KEY          TO WBAC-KEY.
           ADD  1                    TO WBAC-SEQ-NUM-N.

           MOVE WBAC-KEY             TO WBAC-ENDBR-KEY.
           MOVE WWKDT-HIGH-DT        TO WBAC-ENDBR-APPL-CTL-PRCES-DT.
           MOVE HIGH-VALUES          TO WBAC-ENDBR-SEQ-NUM.

           PERFORM  BAC-1000-BROWSE
               THRU BAC-1000-BROWSE-X.

       2100-CHECK-BAC-RECS-X.                                                   
           EXIT.

      *--------------------
       2150-CHECK-NEXT-BAC.
      *--------------------

           MOVE WS-SAVE-KEY          TO WBAC-KEY.
           ADD  1                    TO WBAC-SEQ-NUM-N.

           MOVE WBAC-KEY             TO WBAC-ENDBR-KEY.
           MOVE WWKDT-HIGH-DT        TO WBAC-ENDBR-APPL-CTL-PRCES-DT.
           MOVE HIGH-VALUES          TO WBAC-ENDBR-SEQ-NUM.

           PERFORM  BAC-1000-BROWSE
               THRU BAC-1000-BROWSE-X.

           PERFORM  BAC-2000-READ-NEXT
               THRU BAC-2000-READ-NEXT-X.

           IF  WBAC-IO-OK

               PERFORM
                   UNTIL NOT WBAC-IO-OK

                   IF  RBAC-PREM-AMT NOT = ZERO

                       EVALUATE TRUE

                           WHEN RBAC-PAYRL-SIZ-LARGE
                                MOVE 'L'  TO WS-GROUP-SIZE

                           WHEN RBAC-PAYRL-SIZ-SMALL
                                MOVE 'S'  TO WS-GROUP-SIZE

                       END-EVALUATE
      
                       PERFORM  BAC-3000-END-BROWSE
                           THRU BAC-3000-END-BROWSE-X
                       GO TO 2150-CHECK-NEXT-BAC-X                              
                   END-IF
       
                   PERFORM  BAC-2000-READ-NEXT
                       THRU BAC-2000-READ-NEXT-X
      
               END-PERFORM
      
           END-IF.
      
           PERFORM  BAC-3000-END-BROWSE
               THRU BAC-3000-END-BROWSE-X.

       2150-CHECK-NEXT-BAC-X.
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.

      *******  I/O ROUTINES

       COPY CCPTPOL.

       COPY CCPBBAC.
       COPY CCPUBAC.

       COPY XCPOOCF.

      ******   LINKAGE ROUTINES

       COPY CCPSPGA.

       COPY CCPL0010.
       COPY CCPS0010.

       COPY XCPL0030.
       COPY XCPL0035.
       COPY XCPL0040.
       COPY XCPL0260.
       COPY XCPL1680.
       COPY XCPLOCF.

      *****************************************************************
      **                 END OF PROGRAM ZSBM1361                     **         
      *****************************************************************
