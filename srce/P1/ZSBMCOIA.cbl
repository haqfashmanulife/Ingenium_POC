      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMCOIA.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMCOIA                                         **         
      **  REMARKS:  THIS WILL READ IN AN INPUT FILE OF BAD COLLECTION**
      **            METHOD MONTHLIVERSARIES FROM ZSBMCMBE AND WILL   **
      **            PRODUCE A FILE OF POLICIES THAT HAVE PIRAS ADDED **
      **            FOLLOWING THE FIRST ANNIVERSARY FOLLOWING THE    **
      **            UNDO DATE.  THESE POLICIES WILL HAVE TO BE       **
      **            EXCLUDED FROM THE 1304 FIXUP RUN BECAUSE THEIR   **
      **            COI WILL BE CALCULATED INCORRECTLY FOLLOWING THE **
      **            FIRST ANNIVERSARY FOLLOWING THE UNDO DATE.       **
M280A1**  21JUL15  CTS   CHANGES TO INCREASE LENGTH OF               **
M280A1**                 PLAN-BNFT-TYP-CD                            **      
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT CMBE-DATA-FILE ASSIGN TO ZSCMBE
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WCMBE-SEQ-FILE-STATUS.
      /
           SELECT COIA-DATA-FILE ASSIGN TO ZSCOIA
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WCOIA-SEQ-FILE-STATUS.
      /
       DATA DIVISION.
       FILE SECTION.

       FD  CMBE-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RCMBE-SEQ-REC-INFO.
           05  RCMBE-POL-ID              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBE-POL-TYP             PIC X(02).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBE-POL-STAT            PIC X(01).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBE-ISS-DT              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBE-CEASE-DT            PIC X(10).                             
           05  FILLER                    PIC X(01).
           05  RCMBE-MTHV-DT             PIC X(10).                             
           05  FILLER                    PIC X(01).
           05  RCMBE-CBB-YEAR            PIC Z9(4).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBE-ERR-UH-CD           PIC X(01).                             
           05  FILLER                    PIC X(01).                             
           05  RCMBE-NEW-UH-CD           PIC X(01).                             
           05  FILLER                    PIC X(01).
           05  RCMBE-COI-AMT             PIC 9(13).                             
           05  FILLER                    PIC X(01).
           05  RCMBE-CMB-ERR-AMT         PIC 9(13).                             
           05  FILLER                    PIC X(01).
           05  RCMBE-CMB-NEW-AMT         PIC 9(13).                             
           05  FILLER                    PIC X(15).

       FD  COIA-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RCOIA-SEQ-REC-INFO.
           05  RCOIA-POL-ID              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RCOIA-CVG-NUM             PIC X(02).
           05  FILLER                    PIC X(01).                             
           05  RCOIA-PLAN-ID             PIC X(06).
           05  FILLER                    PIC X(01).                             
           05  RCOIA-MTHV-DT             PIC X(10).
           05  FILLER                    PIC X(01).                             
           05  RCOIA-POL-ISS-EFF-DT      PIC X(10).
           05  FILLER                    PIC X(01).                             
           05  RCOIA-CVG-ISS-EFF-DT      PIC X(10).
      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCOIA'.

       COPY SQLCA.

       01  WS-PROGRAM-WORK-AREA.
           05  WS-ERROR-SW               PIC X(1).
               88  WS-NO-ERRORS                      VALUE 'N'.
               88  WS-ERRORS-FOUND                   VALUE 'Y'.
           05  WS-PLAN-ID                PIC X(06).
           05  WS-CURR-KEY.
               10  WS-CURR-POL-ID        PIC X(10).
               10  WS-CURR-MTHV-DT       PIC X(10).
           05  WS-PREV-KEY.
               10  WS-PREV-POL-ID        PIC X(10).
               10  WS-PREV-MTHV-DT       PIC X(10).

       COPY XCWWWKDT.
       01  SUBS-AND-THINGS.
           05  I                         PIC S9(8) COMP.

       01  WORK-AREAS.
           05  WS-ANNIV-DT               PIC X(10).                             

       01  WCMBE-SEQ-IO-WORK-AREA.
           05  WCMBE-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'CMBE'.
           05  WCMBE-SEQ-IO-COMMAND             PIC X(02).
           05  WCMBE-SEQ-FILE-STATUS            PIC X(02).
           05  WCMBE-SEQ-IO-STATUS              PIC 9(01).
               88  WCMBE-SEQ-IO-OK              VALUE 0.
               88  WCMBE-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WCMBE-SEQ-IO-EOF             VALUE 8.
               88  WCMBE-SEQ-IO-ERROR           VALUE 9.

       01  WCOIA-SEQ-IO-WORK-AREA.
           05  WCOIA-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'COIA'.
           05  WCOIA-SEQ-IO-COMMAND             PIC X(02).
           05  WCOIA-SEQ-FILE-STATUS            PIC X(02).
           05  WCOIA-SEQ-IO-STATUS              PIC 9(01).
               88  WCOIA-SEQ-IO-OK              VALUE 0.
               88  WCOIA-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WCOIA-SEQ-IO-EOF             VALUE 8.
               88  WCOIA-SEQ-IO-ERROR           VALUE 9.

       COPY CCFWPOL.
       COPY CCFRPOL.
       COPY CCFWCVG.
       COPY CCFRCVG.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWL0010.
       COPY XCWL0040.
       COPY XCWL1670.
       COPY XCWL1680.
       COPY XCWLDTLK.
       COPY XCSWOCF.
       COPY XCSROCF.
        
       COPY CCWWCVGS.
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
              UNTIL WCMBE-SEQ-IO-EOF                                            
                 OR WS-ERRORS-FOUND.                                            

           PERFORM 9999-CLOSE-FILES
              THRU 9999-CLOSE-FILES-X.

       0000-MAINLINE-X.
           STOP RUN.

      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM OCF-3000-OPEN-OUTPUT
              THRU OCF-3000-OPEN-OUTPUT-X.

           MOVE ZERO                   TO WCOIA-SEQ-IO-STATUS.

           OPEN OUTPUT COIA-DATA-FILE.

           IF WCOIA-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           MOVE ZERO                   TO WCMBE-SEQ-IO-STATUS.

           OPEN INPUT CMBE-DATA-FILE.

           IF WCMBE-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9600-HANDLE-ERROR                                         
                 THRU 9600-HANDLE-ERROR-X                                       
           END-IF.

       0100-OPEN-FILES-X.
           EXIT.

      *--------------------
       1000-INITIALIZATION.
      *--------------------

           MOVE 'N' TO WS-ERROR-SW.

           MOVE 'CP'                 TO WGLOB-COMPANY-CODE.                     
 
           MOVE 'ZSBMCOIA'           TO WGLOB-MAIN-PGM-ID.                      
 
           PERFORM 0010-0000-INIT-PARM-INFO
              THRU 0010-0000-INIT-PARM-INFO-X.
           PERFORM 0010-1000-INIT-DEFAULT
              THRU 0010-1000-INIT-DEFAULT-X.
 
           MOVE 'ZSBMCOIA'           TO WGLOB-CRNT-PGM-ID                       
                                        WGLOB-USER-ID.                          

           MOVE SPACES TO RCOIA-SEQ-REC-INFO.

       1000-INITIALIZATION-X.
           EXIT.
      /
      *----------------------                                                   
       2000-PROCESS-IN-RECS.                                                    
      *----------------------                                                   

           PERFORM  9500-CMBE-READ                                              
               THRU 9500-CMBE-READ-X.                                           

           IF NOT WCMBE-SEQ-IO-OK                                               
               MOVE 'Y' TO WS-ERROR-SW
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

      *
      * WHEN THERE ARE MULTIPLE CMBE RECORDS FOR THE SAME POLICY
      * WE WANT TO EXTRACT ONLY THE ONE WITH THE OLDEST UNDO DATE
      *
      * CMBE MUST BE IN ASCENDING SEQUENCE BY:
      *      - POLICY ID (MAJOR)
      *      - UNDO DATE (MINOR)
      *
           MOVE RCMBE-POL-ID  TO WS-CURR-POL-ID.
           MOVE RCMBE-MTHV-DT TO WS-CURR-MTHV-DT.
            
           IF WS-CURR-KEY < WS-PREV-KEY
               MOVE WS-CURR-KEY    TO  WGLOB-MSG-PARM (1)                   
               MOVE 'COISEQERR1'   TO  WGLOB-MSG-REF-INFO                    
               PERFORM 0260-1000-GENERATE-MESSAGE                               
                  THRU 0260-1000-GENERATE-MESSAGE-X                             
               PERFORM 9700-HANDLE-ERROR                                     
                  THRU 9700-HANDLE-ERROR-X                   
           END-IF.                                                              
           
           IF WS-CURR-POL-ID = WS-PREV-POL-ID
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.
            
      *
      * BYPASS SOME POLICIES
      *
           IF RCMBE-POL-TYP NOT = 'IB'                                      
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

           PERFORM 2100-POL                                             
              THRU 2100-POL-X.                                          
 
           MOVE WS-CURR-KEY TO WS-PREV-KEY.
            
       2000-PROCESS-IN-RECS-X.                                                  
           EXIT.

      *-------------                                                            
       2100-POL.                                                            
      *-------------                                                            
       
           MOVE SPACES             TO RCOIA-SEQ-REC-INFO.                       
           MOVE RCMBE-POL-ID       TO RCOIA-POL-ID.                             

           MOVE RCMBE-POL-ID       TO WPOL-POL-ID.                              
       
           PERFORM POL-1000-READ                                                
              THRU POL-1000-READ-X.                                             
       
           IF WPOL-IO-NOT-FOUND                                                 
               MOVE WPOL-KEY       TO  WGLOB-MSG-PARM (1)                     
               MOVE 'XS00000097'   TO  WGLOB-MSG-REF-INFO                       
      *MSG: (S) 'POLICY RECORD NOT FOUND'
               PERFORM 0260-1000-GENERATE-MESSAGE                               
                  THRU 0260-1000-GENERATE-MESSAGE-X                             
               GO TO 2100-POL-X                                             
           END-IF.                                                              
       
      *
      * CALCLATE THE DATE OF THE FIRST ANNIVERSARY FOLLOWING THE
      * UNDO-TO-DATE
      *
           PERFORM 2120-FIND-ANNIV-DATE
              THRU 2120-FIND-ANNIV-DATE-X
               
      *
      * LOAD THE COVERAGES
      *
           PERFORM CVGS-1000-LOAD-CVGS-ARRAY
              THRU CVGS-1000-LOAD-CVGS-ARRAY-X.
       
      *
      * PROCESS ALL COVERAGES
      *
           PERFORM 2140-PROCESS-CVG
              THRU 2140-PROCESS-CVG-X
                VARYING I FROM 1 BY 1
                  UNTIL I > RPOL-POL-CVG-REC-CTR-N.
                   
       2100-POL-X.                                                          
           EXIT.
            

      *-------------------------
       2120-FIND-ANNIV-DATE.
      *-------------------------

      * 
      * DEFAULT TO THE CEASE YEAR & THE ISSUE MONTH AND DAY
      *
      * IF THE CEASE MONTH/DAY IS GREATER THAN THE ISSUE MONTH/DAY
      * THEN ADD ONE YEAR
      *
           MOVE RCMBE-MTHV-DT TO WS-ANNIV-DT.
            
           MOVE RPOL-POL-ISS-EFF-DT (6:5)
           TO   WS-ANNIV-DT (6:5).
            
           IF RCMBE-MTHV-DT (6:5) > RPOL-POL-ISS-EFF-DT (6:5) 
              MOVE WS-ANNIV-DT        TO L1680-INTERNAL-1
              MOVE 1                  TO L1680-NUMBER-OF-YEARS
              MOVE ZERO               TO L1680-NUMBER-OF-MONTHS
              MOVE ZERO               TO L1680-NUMBER-OF-DAYS
              PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
                  THRU 1680-3000-ADD-Y-M-D-TO-DATE-X
              MOVE L1680-INTERNAL-2   TO WS-ANNIV-DT
           END-IF.
            
       2120-FIND-ANNIV-DATE-X.
           EXIT.

      *-----------------
       2140-PROCESS-CVG.
      *-----------------

      *
      * IF THE COVERAGE IS ONE OF THE RELEVANT PLANS
      * AND THE COVERAGE WAS ADDED AFTER THE ANNIVERSARY THAT FOLLOWS
      * THE CEASE DATE THEN WRITE THE POLICY TO THE OUTPUT FILE
      *
           MOVE WCVGS-PLAN-ID (I) TO WS-PLAN-ID.
            
M280A1*           IF  WCVGS-PLAN-BNFT-TYP-CD (I) = ' '
M280A1     IF  WCVGS-PLAN-BNFT-TYP-CD (I) = SPACES
           AND WS-PLAN-ID(1:1)            = '4'
           AND WCVGS-CVG-ISS-EFF-DT   (I) > WS-ANNIV-DT
               MOVE SPACES                   TO RCOIA-SEQ-REC-INFO              
               MOVE RCMBE-POL-ID             TO RCOIA-POL-ID                    
               MOVE WCVGS-CVG-SEQ-NUM (I)    TO RCOIA-CVG-NUM
               MOVE WCVGS-PLAN-ID     (I)    TO RCOIA-PLAN-ID
               MOVE RCMBE-MTHV-DT            TO RCOIA-MTHV-DT
               MOVE RPOL-POL-ISS-EFF-DT      TO RCOIA-POL-ISS-EFF-DT
               MOVE WCVGS-CVG-ISS-EFF-DT (I) TO RCOIA-CVG-ISS-EFF-DT
               MOVE +100 TO I
               PERFORM 9400-COIA-WRITE
                  THRU 9400-COIA-WRITE-X
           END-IF.

       2140-PROCESS-CVG-X.
           EXIT.
            
      *----------------
       9400-COIA-WRITE.
      *----------------

           MOVE ZERO TO WCOIA-SEQ-IO-STATUS.

           WRITE RCOIA-SEQ-REC-INFO.

           IF WCOIA-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

       9400-COIA-WRITE-X.
           EXIT.

      *---------------
       9500-CMBE-READ.
      *---------------

           MOVE ZERO                   TO WCMBE-SEQ-IO-STATUS.

           READ CMBE-DATA-FILE
                AT END
                  MOVE 8               TO WCMBE-SEQ-IO-STATUS
                  GO TO 9500-CMBE-READ-X.

           IF RCMBE-SEQ-REC-INFO EQUAL HIGH-VALUES
              MOVE 8                   TO WCMBE-SEQ-IO-STATUS
           END-IF.

           IF WCMBE-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9600-HANDLE-ERROR                                         
                 THRU 9600-HANDLE-ERROR-X                                       
           END-IF.

       9500-CMBE-READ-X.
           EXIT.

      *-----------------------
       9600-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WCMBE-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WCMBE-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCMBE-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9600-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------------
       9700-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WCOIA-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WCOIA-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WCOIA-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                   TO WCMBE-SEQ-IO-STATUS.

           CLOSE CMBE-DATA-FILE.

           IF WCMBE-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9600-HANDLE-ERROR                                         
                 THRU 9600-HANDLE-ERROR-X                                       
           END-IF.

           MOVE ZERO                   TO WCOIA-SEQ-IO-STATUS.

           CLOSE COIA-DATA-FILE.

           IF WCOIA-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.

      *******  I/O ROUTINES

       COPY CCPNPOL.

       COPY XCPOOCF.

      ******   LINKAGE ROUTINES

54-001 COPY CCPL0010.
54-001 COPY CCPS0010.

       COPY XCPL0030.
       COPY XCPL0040.
       COPY XCPL0260.
       COPY XCPL1680.
       COPY XCPLOCF.
        
      *
      * LOAD ALL COVERAGES FOR A POLICY
      *
       COPY NCPPCVGS.

      *
      * SELECT FROM TCVG
      *
       COPY CCPNCVG.
        
      *****************************************************************
      **                 END OF PROGRAM ZSBMCOIA                     **         
      *****************************************************************
