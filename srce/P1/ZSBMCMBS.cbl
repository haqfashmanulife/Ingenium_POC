      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMZMBS.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMZMBS                                         **         
      **  REMARKS:  THIS WILL READ IN AN INPUT FILE OF POLICY NUMBERS**
      **            AND UNDO DATES AND WILL SCAN PHST LOOKING FOR    **
      **            ACTIVITY THAT WILL PREVENT AN UNDO FROM WORKING  **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT ULST-DATA-FILE ASSIGN TO ZSULST
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WULST-SEQ-FILE-STATUS.

           SELECT ZAPS-DATA-FILE ASSIGN TO ZZAPS
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WZAPS-SEQ-FILE-STATUS.
           SELECT ZAPU-DATA-FILE ASSIGN TO ZZAPU
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WZAPU-SEQ-FILE-STATUS.
           SELECT UZAP-DATA-FILE ASSIGN TO ZUZAP
NT                ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WUZAP-SEQ-FILE-STATUS.
      /
       DATA DIVISION.
       FILE SECTION.

       FD  ULST-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RULST-SEQ-REC-INFO.
           05  RULST-POL-ID              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RULST-POL-TYP             PIC X(02).                             
           05  FILLER                    PIC X(01).                             
           05  RULST-POL-STAT            PIC X(01).                             
           05  FILLER                    PIC X(01).                             
           05  RULST-ISS-DT              PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RULST-UNDO-DT             PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RULST-REDO-DT             PIC X(10).                             
           05  FILLER                    PIC X(01).                             
           05  RULST-REDO-ANNV-IND       PIC X(01).                             

       FD  ZAPS-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RZAPS-SEQ-REC-INFO.
           05  RZAPS-FILLER              PIC X(72).                       

       FD  ZAPU-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RZAPU-SEQ-REC-INFO.
           05  RZAPU-FILLER              PIC X(72).                       

       FD  UZAP-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01  RUZAP-SEQ-REC-INFO.
           05  RUZAP-FILLER              PIC X(72).                       
      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMZMBS'.

       COPY SQLCA.

       01  WS-PROGRAM-WORK-AREA.
           05  WS-ERROR-SW               PIC X(1).
               88  WS-NO-ERRORS                      VALUE 'N'.
               88  WS-ERRORS-FOUND                   VALUE 'Y'.
           05  WS-ANNIV-SW               PIC X(1).
               88  WS-ANNIV-NOT-FOUND                VALUE 'N'.
               88  WS-ANNIV-FOUND                    VALUE 'Y'.                 

       COPY XCWWWKDT.
       01  SUBS-AND-THINGS.
           05  I                         PIC S9(8) COMP.
           05  WS-CNT                    PIC S9(4) COMP.

       01  WORK-AREAS.
           05  WS-MAX-REDO-DT            PIC X(10) VALUE '2004-03-26'.          
           05  WS-ANNIV-DT               PIC X(10).                             
           05  WS-TEST-DT                PIC X(10).                             
           05  WS-TEST-DT-R              REDEFINES                              
               WS-TEST-DT.                                                      
               10  WS-TEST-DT-YR         PIC 9(04).                             
               10  FILLER                PIC X(01).                             
               10  WS-TEST-DT-MO         PIC 9(02).                             
               10  FILLER                PIC X(01).                             
               10  WS-TEST-DT-DY         PIC 9(02).                             
           05  WS-OLDEST-BAD-DT          PIC X(10).                             
           05  WS-PREV-POL-ID            PIC X(10).                             
           05  WS-PHST-ACTV-CD           PIC X(04).                             
               88  WS-PHST-SKIP-ACTV     VALUES                                 
                   '1901' '1902' '1903' '1904'
                   '3001' '3005' '3901'                                         
                   '4901' '4902' '4903'.        
               88  WS-PHST-ESC-ACTV      VALUES                                 
                   '3902' '3903' '3904' '3905'.
           05  WS-REC-SW                 PIC X.
               88  WS-REC-FOUND          VALUE 'Y'.
           05  WZAPS-SEQ-FILE-STATUS            PIC X(02).
           05  WZAPU-SEQ-FILE-STATUS            PIC X(02).
           05  WUZAP-SEQ-FILE-STATUS            PIC X(02).
           05  WS-POLICY.
               10  FILLER                       PIC X VALUE "'".
               10  WS-POLICY-ID                 PIC X(7).
               10  FILLER                       PIC XXX VALUE "', ".

       01  WS-OUTPUT-LINE.         
           05  WS-OUTPUT-POL-ID                 PIC X(10).
           05  FILLER                           PIC X(01).
           05  WS-OUTPUT-MESSAGE                PIC X(40).
           05  FILLER                           PIC X(81).

       01  WS-PRINT-LINE.
           05  FILLER                           PIC XXX VALUE SPACE.
           05  WS-SEL-POLICY        OCCURS 6    PIC X(11).
           05  FILLER                           PIC XXX.
       01  WULST-SEQ-IO-WORK-AREA.
           05  WULST-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'ULST'.
           05  WULST-SEQ-IO-COMMAND             PIC X(02).
           05  WULST-SEQ-FILE-STATUS            PIC X(02).
           05  WULST-SEQ-IO-STATUS              PIC 9(01).
               88  WULST-SEQ-IO-OK              VALUE 0.
               88  WULST-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WULST-SEQ-IO-EOF             VALUE 8.
               88  WULST-SEQ-IO-ERROR           VALUE 9.

      *
      *01  WZAP-SEQ-IO-WORK-AREA.
      *    05  WZAP-SEQ-FILE-NAME              PIC X(04)
      *        88  WZAP-SEQ-FILE-NAME-ZAPS      VALUE 'ZAPS'.
      *        88  WZAP-SEQ-FILE-NAME-ZAPU      VALUE 'ZAPU'.
      *        88  WZAP-SEQ-FILE-NAME-UZAP      VALUE 'UZAP'.
      *    05  WZAP-SEQ-IO-COMMAND             PIC X(02).
      *    05  WZAP-SEQ-FILE-STATUS            PIC X(02).
      *    05  WZAP-SEQ-IO-STATUS              PIC 9(01).
      *        88  WZAP-SEQ-IO-OK              VALUE 0.
      *        88  WZAP-SEQ-IO-NOT-FOUND       VALUE 7.
      *        88  WZAP-SEQ-IO-EOF             VALUE 8.
      *        88  WZAP-SEQ-IO-ERROR           VALUE 9.

       COPY CCFWPHST.
       COPY CCFRPHST.

       COPY CCFWPTAB.
       COPY CCFRPTAB.

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.

       COPY CCWL0010.
       COPY XCWL0040.
       COPY XCWL1660.
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
              UNTIL WULST-SEQ-IO-EOF                                            
                 OR WS-ERRORS-FOUND.                                            

           PERFORM 4000-FINALIZE
              THRU 4000-FINALIZEN-X.

           PERFORM 9999-CLOSE-FILES
              THRU 9999-CLOSE-FILES-X.

       0000-MAINLINE-X.
           STOP RUN.

      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM OCF-3000-OPEN-OUTPUT
              THRU OCF-3000-OPEN-OUTPUT-X.

           MOVE ZERO                   TO WULST-SEQ-IO-STATUS.

           OPEN INPUT ULST-DATA-FILE.                                           

           IF WULST-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           OPEN OUTPUT ZAPS-DATA-FILE.
           OPEN OUTPUT ZAPU-DATA-FILE.
           OPEN OUTPUT UZAP-DATA-FILE.

       0100-OPEN-FILES-X.
           EXIT.

      *--------------------
       1000-INITIALIZATION.
      *--------------------

           MOVE 'N' TO WS-ERROR-SW.

           MOVE 'CP'                 TO WGLOB-COMPANY-CODE.                     
 
           MOVE 'ZSBMZMBS'           TO WGLOB-MAIN-PGM-ID                       
                                        WGLOB-CRNT-PGM-ID.
      *    PERFORM 0010-0000-INIT-PARM-INFO
      *       THRU 0010-0000-INIT-PARM-INFO-X.
      *    PERFORM 0010-1000-INIT-DEFAULT
      *       THRU 0010-1000-INIT-DEFAULT-X.
           MOVE ' select pol_id , POL_ACTV_TYP_ID , pchst_eff_dt ,'
                                                 TO RZAPS-FILLER.          
           WRITE RZAPS-SEQ-REC-INFO.
           MOVE ' pchst_stat_cd , pchst_prev_stat_cd '
                                                 TO RZAPS-FILLER.          
           WRITE RZAPS-SEQ-REC-INFO.
           MOVE ' from ingmp1s.tphst '
                                                 TO RZAPS-FILLER.          
           WRITE RZAPS-SEQ-REC-INFO.
           MOVE ' update ingmp1s.tphst '         TO RZAPU-FILLER          
                                                    RUZAP-FILLER.         
           WRITE RZAPU-SEQ-REC-INFO.                     
           WRITE RUZAP-SEQ-REC-INFO.
            
           MOVE "   set pchst_stat_cd = 'E' "    TO RZAPU-FILLER.          
           WRITE RZAPU-SEQ-REC-INFO.                     
            
           MOVE "   set pchst_stat_cd = 'A' "    TO RUZAP-FILLER.          
           WRITE RUZAP-SEQ-REC-INFO.                     
            
           MOVE " where co_id = 'CP' and pol_id in ( " 
                                                 TO RZAPS-FILLER          
                                                    RZAPU-FILLER          
                                                    RUZAP-FILLER.         
           WRITE RZAPS-SEQ-REC-INFO.
           WRITE RZAPU-SEQ-REC-INFO.                     
           WRITE RUZAP-SEQ-REC-INFO.                     
           MOVE "   set pchst_stat_cd = 'E' "    TO RZAPU-FILLER          
                                                    RUZAP-FILLER.         
           
           MOVE +0                               TO WS-CNT.
           MOVE SPACES                           TO WS-PRINT-LINE.


       1000-INITIALIZATION-X.
           EXIT.
      /
      *----------------------                                                   
       2000-PROCESS-IN-RECS.                                                    
      *----------------------                                                   

           PERFORM  9500-ULST-READ                                              
               THRU 9500-ULST-READ-X.                                           
           IF NOT WULST-SEQ-IO-OK                                               
               MOVE 'Y' TO WS-ERROR-SW
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

           SET  WS-ANNIV-NOT-FOUND TO TRUE.                                     
           MOVE RULST-ISS-DT       TO WS-ANNIV-DT.                              
           PERFORM  3000-FIND-ANNIV-DATE                                        
               THRU 3000-FIND-ANNIV-DATE-X                                      
               UNTIL WS-ANNIV-FOUND.                                            
           IF WS-ANNIV-DT > WS-MAX-REDO-DT                                      
               GO TO 2000-PROCESS-IN-RECS-X                                     
           END-IF.

           MOVE RULST-POL-ID              TO WPHST-POL-ID.                      
           MOVE WWKDT-HIGH-DT             TO L1660-INTERNAL-DATE.               
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE ZEROES                    TO WPHST-PCHST-SEQ-NUM.
           MOVE L1660-INVERTED-DATE       TO WPHST-PCHST-EFF-IDT-NUM.
           MOVE WPHST-KEY                 TO WPHST-ENDBR-KEY.
           MOVE RULST-UNDO-DT             TO L1660-INTERNAL-DATE.
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE  TO WPHST-ENDBR-PCHST-EFF-IDT-NUM.          
           MOVE 999                  TO WPHST-ENDBR-PCHST-SEQ-NUM.              
      
           PERFORM  PHST-1000-BROWSE
               THRU PHST-1000-BROWSE-X.
           MOVE SPACE TO WS-REC-SW,
           IF WPHST-IO-OK
               PERFORM  2700-FIND-PHST                                          
                   THRU 2700-FIND-PHST-X                                        
                   UNTIL NOT WPHST-IO-OK                                        
                      OR WS-REC-FOUND                                           
               PERFORM  PHST-3000-END-BROWSE
                   THRU PHST-3000-END-BROWSE-X
           END-IF.

       2000-PROCESS-IN-RECS-X.                                                  
           EXIT.

      *---------------                                                          
       2700-FIND-PHST.                                                          
      *---------------                                                          

           PERFORM  PHST-2000-READ-NEXT                                         
               THRU PHST-2000-READ-NEXT-X.                                      
           IF NOT WPHST-IO-OK                                                   
               GO TO 2700-FIND-PHST-X                                           
           END-IF.                                                              

           IF  RPHST-POL-ACTV-TYP-ID NOT = '1011'                 
           OR  NOT RPHST-PCHST-STAT-ACTIVE
               GO TO 2700-FIND-PHST-X                                           
           END-IF.

           ADD +1 TO WS-CNT.
           MOVE RULST-POL-ID                TO WS-POLICY-ID.
           MOVE WS-POLICY  TO WS-SEL-POLICY (WS-CNT) 
           IF  WS-CNT = 6
               MOVE WS-PRINT-LINE           TO RZAPS-FILLER
                                               RZAPU-FILLER
                                               RUZAP-FILLER

               PERFORM 9400-WRITE
                  THRU 9400-WRITE-X

               MOVE +0 TO WS-CNT
               MOVE SPACES                  TO WS-PRINT-LINE
           SET WS-REC-FOUND TO TRUE.                                 
            
       2700-FIND-PHST-X.                                                        
           EXIT.

      *---------------------
       3000-FIND-ANNIV-DATE.
      *---------------------

           MOVE WS-ANNIV-DT        TO L1680-INTERNAL-1.                         
           MOVE 1                  TO L1680-NUMBER-OF-YEARS.                    
           MOVE ZERO               TO L1680-NUMBER-OF-MONTHS.                   
           MOVE ZERO               TO L1680-NUMBER-OF-DAYS.                     
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE                                 
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.                              
           MOVE L1680-INTERNAL-2   TO WS-ANNIV-DT.                              
       
           IF RULST-UNDO-DT < WS-ANNIV-DT                                       
               SET WS-ANNIV-FOUND  TO TRUE
           END-IF.
       
       3000-FIND-ANNIV-DATE-X.                                                  
           EXIT.

      *--------------
       4000-FINALIZE.
      *--------------
           IF  WS-CNT > +0
               MOVE WS-PRINT-LINE          TO  RZAPS-FILLER
                                               RZAPU-FILLER
                                               RUZAP-FILLER

               PERFORM 9400-WRITE
                  THRU 9400-WRITE-X
           END-IF.
           MOVE "  '9999999' )"            TO  RZAPS-FILLER
                                               RZAPU-FILLER
                                               RUZAP-FILLER.
           PERFORM 9400-WRITE
              THRU 9400-WRITE-X.
               
           MOVE "  and pol_actv_typ_id = '1011'" TO  RZAPS-FILLER
                                                     RZAPU-FILLER
                                                     RUZAP-FILLER.
           PERFORM 9400-WRITE
              THRU 9400-WRITE-X.
               
           MOVE "  and pchst_stat_cd = 'A' ;"    TO  RZAPS-FILLER
                                                     RZAPU-FILLER
           MOVE "  and pchst_stat_cd = 'E'  "    TO  RUZAP-FILLER.
           PERFORM 9400-WRITE
              THRU 9400-WRITE-X.
               
           MOVE "  and pchst_prev_stat_cd = ' ' ;"    TO  RUZAP-FILLER.
           WRITE RUZAP-SEQ-REC-INFO.
            
       4000-FINALIZEN-X.
           EXIT.

      *----------------
       9400-WRITE.
      *----------------

           WRITE RZAPS-SEQ-REC-INFO.
           WRITE RZAPU-SEQ-REC-INFO.
           WRITE RUZAP-SEQ-REC-INFO.
      *
      *    IF WZAPS-SEQ-FILE-STATUS  NOT = ZERO
      *       PERFORM 9800-HANDLE-ERROR                                         
      *          THRU 9800-HANDLE-ERROR-X                                       
      *    END-IF.

       9400-WRITE-X.
           EXIT.

      *---------------
       9500-ULST-READ.
      *---------------

           MOVE ZERO                   TO WULST-SEQ-IO-STATUS.

           READ ULST-DATA-FILE
                AT END
                  MOVE 8               TO WULST-SEQ-IO-STATUS
                  GO TO 9500-ULST-READ-X.

           IF RULST-SEQ-REC-INFO EQUAL HIGH-VALUES
              MOVE 8                   TO WULST-SEQ-IO-STATUS
           END-IF.

           IF WULST-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

       9500-ULST-READ-X.
           EXIT.

      *-----------------------
       9700-HANDLE-ERROR.                                                       
      *-----------------------

           MOVE WULST-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WULST-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WULST-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-ERROR-X.                                                     
           EXIT.

      *-----------------------
      *
      *9800-HANDLE-ERROR.                                                       
      *-----------------------
      *
      *    MOVE WZAPP-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
      *    MOVE WZAPP-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
      *    MOVE WZAPP-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
      *    PERFORM 0030-3000-QSAM-ERROR
      *       THRU 0030-3000-QSAM-ERROR-X.
      *
      *9800-HANDLE-ERROR-X.                                                     
      *    EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                   TO WULST-SEQ-IO-STATUS.

           CLOSE ULST-DATA-FILE.

           IF WULST-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR                                         
                 THRU 9700-HANDLE-ERROR-X                                       
           END-IF.

           CLOSE ZAPS-DATA-FILE.
           CLOSE ZAPU-DATA-FILE.
           CLOSE UZAP-DATA-FILE.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.

      *******  I/O ROUTINES

       COPY CCPNPTAB.
       COPY CCPBPHST.

       COPY XCPOOCF.

      ******   LINKAGE ROUTINES

       COPY CCPL0010.
       COPY CCPS0010.

       COPY XCPL0030.
       COPY XCPL0040.
       COPY XCPL0260.
       COPY XCPL1660.
       COPY XCPL1680.
       COPY XCPLOCF.

      *****************************************************************
      **                 END OF PROGRAM ZSBMZMBS                     **         
      *****************************************************************
