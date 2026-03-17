      *****************************************************************
      **  MEMBER :  ZSBMCLIZ                                         **
      **  REMARKS:  THIS PROGRAM WILL UPDATE THE CLI-ADDR-LOC-CD     **
      **            BY NEW-ADDR-CD FROM TADCD TABLE                  **         
      **                                                             **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
C12393**  11JUN12  CTS    CLIENT ADDRESS CODE RESET.                 **
      *****************************************************************

       IDENTIFICATION DIVISION.

       PROGRAM-ID.    ZSBMCLIZ.

       COPY XCWWCRHT.
      /
       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
      /
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMCLIZ'.

       COPY SQLCA.

       01  WS-ADCD-RECS-LINE.
           05  WS-REP-ADCD-RECS-LINE.
               10  FILLER                   PIC X(40)
                   VALUE 'TOTAL CLIA RECORDS REPLACED        '.
               10  WS-CLIA-REP-PRCES-CTR    PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.
           05  WS-UPDT-ADCD-RECS-LINE.
               10  FILLER                   PIC X(40)
                   VALUE 'TOTAL CLIA RECORDS UPDATED         '.
               10  WS-CLIA-UPDT-PRCES-CTR   PIC 9(6)  VALUE ZERO.
               10  FILLER                   PIC X(86) VALUE SPACE.                          
      
       01  WS-CONTROL-CARD.
           05  WS-CTL-EDIT-ONLY             PIC X(10).
               88  WS-CTL-EDIT-TEXT         VALUE 'EDIT ONLY='.
           05  WS-CTL-EDIT-SW               PIC X(01).
               88 EDIT-ONLY                 VALUE 'Y'. 
               88 EDIT-ONLY-NO              VALUE 'N'.
                
       01  WS-CLIA-PRINT-LINE.                                                  
           05  FILLER                       PIC X(08) 
                                            VALUE 'CLIENT: '.
           05  WS-CLI-ID                    PIC X(10).
           05  FILLER                       PIC X(03)
                                            VALUE ' IS'.
           05  WS-CLI-UPDATE-IND            PIC X(20).
               88 WS-CLI-REPLACED           VALUE 'ADDRESS REPLACED'.
               88 WS-CLI-UPDATED            VALUE 'ADDRESS UPDATED'.

      
       01  WS-MISC-WORK-AREA.
           05  WS-NEW-ADDR-LOC-CD.
               10  WS-NEW-ADDR-LOC-PREFCT-CD PIC X(02).
               10  WS-NEW-ADDR-LOC-CITY-CD   PIC X(03).
               10  WS-NEW-ADDR-LOC-NGHBR-CD  PIC X(03).           

           05  WS-SWITCHES.               
               10  WS-ADDR-SUB               PIC S9(9)    
                                             VALUE +0.
               10  WS-SUB                    PIC S9(9)    
                                             VALUE +0.
           05  WS-CLIA-VALUES-DIFFERENT-IND  PIC X(01).
               88 WS-CLIA-VALUES-DIFFERENT   VALUE 'Y'.
               88 WS-CLIA-VALUES-DIFFERENT-NO
                                             VALUE 'N'.
           05  WS-CLAS-STAT-CD               PIC X(01).
               88 WS-CLAS-STAT-ACTIVE        VALUE '1'.
               88 WS-CLAS-STAT-ABOLISHED     VALUE '5'.
           05  WS-ACTV-REC-IND               PIC X(01).
               88 WS-ACTV-REC-FOUND          VALUE 'Y'.
               88 WS-ACTV-REC-EOF            VALUE 'N'.
                                             

      /
       COPY CCWL0010.
       COPY CCWL0950.
       COPY XCWL0035.
        
      /
       COPY CCFWADCD.
       COPY CCFRADCD.
      /
       COPY CCFRCLIA.                                                           
       COPY CCFWCLIA.  
       COPY CCFHCLIA.       
      /       
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY ADCL
                               ==':ID:'==  BY =='ADCL'==.
      /                              
       COPY CCSRADCL.
       COPY XCSWBCF.
       COPY XCSRBCF.
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY XCWTFCMD.
      /
       COPY XCWL0040.
      /
       COPY XCWL1670.
       COPY XCWL1660.
       COPY XCWL1680.
       COPY XCWLDTLK.
      /
       COPY XCWWWKDT.
      /
       COPY CCWWCCC.
       COPY CCWWFRMT.
      /
       COPY CCWLPGA.
      /
       COPY CCWWINDX.
      /
       PROCEDURE DIVISION.

      *---------------------
       0000-MAIN-LINE-START.
      *---------------------

           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.
           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE 'ZSBMCLIZ'                  TO WGLOB-USER-ID.
           MOVE 'INGENIUM'                  TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.
           MOVE ZERO                        TO L0040-ERROR-CNT.
           MOVE SPACES                      TO L0040-PROGRAM-DESC.
           MOVE SPACES                      TO L0040-HDG-LINE-3.
            
           PERFORM  BCF-1000-READ
               THRU BCF-1000-READ-X.

           IF  WBCF-SEQ-IO-OK
               MOVE RBCF-SEQ-REC-INFO       TO WS-CONTROL-CARD
           END-IF.
            
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           PERFORM  2000-READ-REWRITE-LOOP
               THRU 2000-READ-REWRITE-LOOP-X
               UNTIL WADCL-SEQ-IO-EOF.

           PERFORM  8000-PRINT-STATS
               THRU 8000-PRINT-STATS-X.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.                                        

           STOP RUN.

       0000-MAIN-LINE-START-X.
           EXIT.
      /
      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.

           PERFORM  ADCL-1000-OPEN-INPUT
               THRU ADCL-1000-OPEN-INPUT-X.               
               

       0100-OPEN-FILES-X.
           EXIT.

      *-----------------------
       2000-READ-REWRITE-LOOP.
      *-----------------------
           INITIALIZE   WS-MISC-WORK-AREA.

      * READ THE SEQUENTIAL FILE CSADCL TO OBTAIN FIRST INPUT RECORD.
           PERFORM  ADCL-1000-READ
               THRU ADCL-1000-READ-X.

           IF  WADCL-SEQ-IO-EOF
               GO TO 2000-READ-REWRITE-LOOP-X
           END-IF.                         

      *READ THE TADCD TABLE WITH THE FETCHED ADDR-LOC-CD FROM THE FILE CSADCL.
      
           MOVE  RADCL-ADDR-LOC-CD           TO WADCD-ADDR-LOC-CD. 
           
           PERFORM  ADCD-1000-READ
               THRU ADCD-1000-READ-X.
               
      *MOVE THE RADCD-ADDR-LOC-CD  TO WS-ADDR-LOC-CD WHICH WILL BE USED FURTHER
      *TO BROWSE THE TCLIA TABLE

           MOVE RADCD-CLAS-STAT-CD          TO WS-CLAS-STAT-CD.
          
           EVALUATE TRUE
               WHEN  RADCD-CLAS-STAT-ACTIVE

               PERFORM  3000-REWRITE-ACTIVE-ADDR-CD
                   THRU 3000-REWRITE-ACTIVE-ADDR-CD-X

               WHEN  RADCD-CLAS-STAT-ABOLISH

               PERFORM  3100-REWRITE-ABOLISH-ADDR-CD
                   THRU 3100-REWRITE-ABOLISH-ADDR-CD-X

           END-EVALUATE.
           
           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.                 
       
       2000-READ-REWRITE-LOOP-X.
           EXIT.
      /
      *----------------------------
       3000-REWRITE-ACTIVE-ADDR-CD.
      *----------------------------
      
           MOVE RADCL-CLI-ID                TO WCLIA-CLI-ID.
           
           IF  WGLOB-COUNTRY-JAPAN
               SET  WCLIA-CLI-ADDR-GR-KANJI TO TRUE
           ELSE
               SET  WCLIA-CLI-ADDR-GR-ALPHA TO TRUE
           END-IF.
      
           SET WCLIA-CLI-ADDR-TYP-PRIM-ADDR TO TRUE.
           MOVE '001'                       TO WCLIA-CLI-ADDR-SEQ-NUM.              
      
           PERFORM  CLIA-1000-READ
               THRU CLIA-1000-READ-X.

           IF NOT WCLIA-IO-OK
               GO TO 3000-REWRITE-ACTIVE-ADDR-CD-X
           END-IF.
           
           PERFORM  3200-UPDT-CLIA
               THRU 3200-UPDT-CLIA-X.

       3000-REWRITE-ACTIVE-ADDR-CD-X.
           EXIT.
      /
      *----------------------------
       3100-REWRITE-ABOLISH-ADDR-CD.
      *---------------------------- 

           MOVE RADCD-NEW-ADDR-CD           TO WADCD-ADDR-LOC-CD.

      * GET THE LATEST ACTIVE ADDRSES.IF THE NEW ADDRESS IS TERMINATED,THEN SKIP
      
           PERFORM   3600-GET-LATEST-ACTV-ADDR
               THRU  3600-GET-LATEST-ACTV-ADDR-X
               UNTIL WS-ACTV-REC-FOUND
                  OR WS-ACTV-REC-EOF.

           IF  WS-ACTV-REC-EOF
               GO TO 3100-REWRITE-ABOLISH-ADDR-CD-X
           END-IF.
           
           MOVE RADCD-ADDR-LOC-CD           TO WS-NEW-ADDR-LOC-CD.           
           MOVE RADCL-CLI-ID                TO WCLIA-CLI-ID.
           
           IF  WGLOB-COUNTRY-JAPAN
               SET  WCLIA-CLI-ADDR-GR-KANJI TO TRUE
           ELSE
               SET  WCLIA-CLI-ADDR-GR-ALPHA TO TRUE
           END-IF.
      
           SET WCLIA-CLI-ADDR-TYP-PRIM-ADDR TO TRUE.
           MOVE '001'                       TO WCLIA-CLI-ADDR-SEQ-NUM.              
      
           PERFORM  CLIA-1000-READ
               THRU CLIA-1000-READ-X.

           IF NOT WCLIA-IO-OK
               GO TO 3100-REWRITE-ABOLISH-ADDR-CD-X
           END-IF.
           
           PERFORM  3200-UPDT-CLIA
               THRU 3200-UPDT-CLIA-X.
               
       3100-REWRITE-ABOLISH-ADDR-CD-X.
           EXIT.
      /

      *----------------
       3200-UPDT-CLIA.
      *----------------
      
           INITIALIZE   WS-CLIA-PRINT-LINE.
                      
           IF  WS-CLAS-STAT-ACTIVE
               PERFORM  3500-CHECK-FOR-CHANGE
                   THRU 3500-CHECK-FOR-CHANGE-X                  
               IF  WS-CLIA-VALUES-DIFFERENT
                   CONTINUE
               ELSE 
                   GO TO 3200-UPDT-CLIA-X 
               END-IF
           END-IF. 
           
      * MOVE THE CURRENT PR ADDRESS TO UPDATE THE PA ADDRESS 
      
           PERFORM  3300-PREV-ADDR-CHNG
               THRU 3300-PREV-ADDR-CHNG-X
               VARYING WS-ADDR-SUB FROM 2 BY -1
               UNTIL   WS-ADDR-SUB = ZERO.
      
           MOVE RCLIA-CLI-ID                TO WCLIA-CLI-ID.
           IF  WGLOB-COUNTRY-JAPAN
               SET  WCLIA-CLI-ADDR-GR-KANJI TO TRUE
           ELSE
               SET  WCLIA-CLI-ADDR-GR-ALPHA TO TRUE
           END-IF.
      
           SET WCLIA-CLI-ADDR-TYP-PRIM-ADDR TO TRUE.
           MOVE '001'                       TO WCLIA-CLI-ADDR-SEQ-NUM.
           
      * UPDATE THE PR ADRESS WITH THE CURRENT ADCD INFORMATION
      
           PERFORM  CLIA-1000-READ-FOR-UPDATE
               THRU CLIA-1000-READ-FOR-UPDATE-X.
      
           IF  WS-CLAS-STAT-ABOLISHED
               MOVE WS-NEW-ADDR-LOC-CD      TO RCLIA-CLI-ADDR-LOC-CD
               MOVE WS-NEW-ADDR-LOC-PREFCT-CD     
                                            TO RCLIA-CLI-CRNT-LOC-CD
           END-IF.
      
           MOVE RADCD-PSTL-CD               TO RCLIA-CLI-PSTL-CD.  
           MOVE RADCD-KA-PREFCT-TXT         TO RCLIA-CLI-KA-PREFCT-TXT.
           MOVE RADCD-KA-CITY-TXT           TO RCLIA-CLI-KA-CITY-TXT.
           MOVE RADCD-KA-NGHBRHD-TXT        TO 
                                              RCLIA-CLI-KA-NGHBRHD-TXT.
           MOVE RADCD-KJ-PREFCT-TXT         TO RCLIA-CLI-PREFCT-TXT.
           MOVE RADCD-KJ-CITY-TXT           TO RCLIA-CLI-CITY-NM-TXT.
           MOVE RADCD-KJ-NGHBRHD-TXT        TO RCLIA-CLI-ADDR-LN-1-TXT.
      
           PERFORM  CLIA-2000-REWRITE
               THRU CLIA-2000-REWRITE-X.
                               
           PERFORM  7000-PRINT-DETAILS
               THRU 7000-PRINT-DETAILS-X.                              

       3200-UPDT-CLIA-X.
           EXIT.
           
      *-------------------
       3300-PREV-ADDR-CHNG.
      *-------------------
      
           COMPUTE WS-SUB = WS-ADDR-SUB - 1.
      
           IF  WS-ADDR-SUB = 1
               SET  WCLIA-CLI-ADDR-TYP-PRIM-ADDR 
                                            TO TRUE
           ELSE
               SET  WCLIA-CLI-ADDR-TYP-PREV-ADDR 
                                            TO TRUE
               MOVE WS-SUB                  TO WCLIA-CLI-ADDR-SEQ-NUM-N
           END-IF.
      
           MOVE RCLIA-CLI-ID                TO WCLIA-CLI-ID.
      
           IF  WGLOB-COUNTRY-JAPAN
               SET  WCLIA-CLI-ADDR-GR-KANJI TO TRUE
           ELSE
               SET  WCLIA-CLI-ADDR-GR-ALPHA TO TRUE
           END-IF.
      
           MOVE '001'                       TO WCLIA-CLI-ADDR-SEQ-NUM.
      
      *
      * READ THE OLD RECORD, IF NOT FOUND CREATE ONE WITH DEFAULTS.
      *
           PERFORM  CLIA-1000-READ
               THRU CLIA-1000-READ-X.
           IF NOT WCLIA-IO-OK
               GO TO 3300-PREV-ADDR-CHNG-X
           END-IF.
      
           MOVE RCLIA-REC-INFO              TO HCLIA-REC-INFO.
           SET WCLIA-CLI-ADDR-TYP-PREV-ADDR TO TRUE.
      
           MOVE WS-ADDR-SUB                 TO WCLIA-CLI-ADDR-SEQ-NUM-N.
      
      *
      * UPDATE THE PREVIOUS ADDRESS RECORD.
      *
           PERFORM  3400-UPDATE-PREV-ADDR
               THRU 3400-UPDATE-PREV-ADDR-X.   

       3300-PREV-ADDR-CHNG-X.
           EXIT.
      *----------------------
       3400-UPDATE-PREV-ADDR.
      *----------------------
           SET WCLIA-CLI-ADDR-TYP-PREV-ADDR TO TRUE.  
      
           PERFORM  CLIA-1000-READ-FOR-UPDATE
               THRU CLIA-1000-READ-FOR-UPDATE-X.
        
           MOVE HCLIA-REC-INFO              TO RCLIA-REC-INFO.
           MOVE WCLIA-KEY                   TO RCLIA-KEY.
      
           IF  WCLIA-IO-OK
               PERFORM  CLIA-2000-REWRITE
                   THRU CLIA-2000-REWRITE-X
           ELSE
               PERFORM  CLIA-1000-WRITE
                   THRU CLIA-1000-WRITE-X
           END-IF. 
       3400-UPDATE-PREV-ADDR-X.
           EXIT.
           
      *----------------------
       3500-CHECK-FOR-CHANGE.
      *---------------------- 
           IF  RADCD-PSTL-CD         = RCLIA-CLI-PSTL-CD 
           AND RADCD-KA-PREFCT-TXT   = RCLIA-CLI-KA-PREFCT-TXT
           AND RADCD-KA-CITY-TXT     = RCLIA-CLI-KA-CITY-TXT
           AND RADCD-KA-NGHBRHD-TXT  = RCLIA-CLI-KA-NGHBRHD-TXT
           AND RADCD-KJ-PREFCT-TXT   = RCLIA-CLI-PREFCT-TXT
           AND RADCD-KJ-CITY-TXT     = RCLIA-CLI-CITY-NM-TXT
           AND RADCD-KJ-NGHBRHD-TXT  = RCLIA-CLI-ADDR-LN-1-TXT
               SET WS-CLIA-VALUES-DIFFERENT-NO 
                                            TO TRUE
           ELSE
               SET WS-CLIA-VALUES-DIFFERENT    
                                            TO TRUE
           END-IF. 
       3500-CHECK-FOR-CHANGE-X.
           EXIT.
      *--------------------------
       3600-GET-LATEST-ACTV-ADDR.
      *--------------------------
                
           PERFORM  ADCD-1000-READ
               THRU ADCD-1000-READ-X.
 
      *** IF THERE IS NO EXISTING ROW OR THE NEW ADDRESS IS TERMINATED, EXIT THE LOOPING PROCEDURE     
           EVALUATE TRUE
               WHEN  RADCD-CLAS-STAT-CD  = '9'
                 OR  NOT WADCD-IO-OK                 
                     SET WS-ACTV-REC-EOF          TO TRUE
      *** IF THE NEW ADDRESS CODE IS ABOLISHED GET THE LATEST ACTIVE ADDRESS                     
               WHEN  RADCD-CLAS-STAT-CD  = '5'
                     MOVE RADCD-NEW-ADDR-CD       TO WADCD-ADDR-LOC-CD
                     
      *** IF THE NEW ADDRESS CODE IS ACTIVE SKIP THE PARAGRAPH                      
               WHEN  RADCD-CLAS-STAT-CD  = '1'                     
                     SET WS-ACTV-REC-FOUND        TO TRUE
                     
           END-EVALUATE.
           
       3600-GET-LATEST-ACTV-ADDR-X.
           EXIT.
           
      *--------------------
       7000-PRINT-DETAILS.
      *--------------------

           MOVE RCLIA-CLI-ID                TO WS-CLIA-PRINT-LINE.
           
           IF  WS-CLAS-STAT-ABOLISHED
               SET  WS-CLI-REPLACED         TO TRUE 
               ADD +1                       TO WS-CLIA-REP-PRCES-CTR
           ELSE
               SET  WS-CLI-UPDATED          TO TRUE 
               ADD +1                       TO WS-CLIA-UPDT-PRCES-CTR
           END-IF.
           
           MOVE SPACES                      TO L0040-INPUT-LINE.
           MOVE WS-CLIA-PRINT-LINE          TO L0040-INPUT-LINE.

           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       7000-PRINT-DETAILS-X.
           EXIT.

      /
       8000-PRINT-STATS.

           MOVE SPACES                      TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                      TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                      TO L0040-INPUT-LINE.
           MOVE WS-REP-ADCD-RECS-LINE       TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

           MOVE SPACES                      TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
               
           MOVE SPACES                      TO L0040-INPUT-LINE.
           MOVE WS-UPDT-ADCD-RECS-LINE      TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X. 

           MOVE SPACES                      TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.               
           
           MOVE SPACES                      TO L0040-INPUT-LINE.
           MOVE '*** END OF REPORT ***'     TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.


       8000-PRINT-STATS-X.
           EXIT.
      /
       9999-CLOSE-FILES.

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.
               
           PERFORM  ADCL-4000-CLOSE
               THRU ADCL-4000-CLOSE-X.               

       9999-CLOSE-FILES-X.
           EXIT.
      /
       COPY CCPL0010.
       COPY CCPS0010.
       COPY CCPL0950.
       COPY CCPS0950.
       COPY CCPPCCC.
      /
       COPY CCPNADCD.
      /
       COPY CCPUCLIA.
       COPY CCPNCLIA.
       COPY CCPACLIA.  
      /               
       COPY XCSLFILE REPLACING ==:ID:==  BY ADCL
                               ==':PGM:'== BY =='CSRQADCL'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY ADCL.
       COPY XCSASEQ  REPLACING ==:ID:==  BY ADCL.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY ADCL.       
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
       COPY XCPL0035.
       COPY XCPL0040.
       COPY XCPL0260.
      /
       COPY XCPL1660.
       COPY XCPL1680.
      /
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM ZSBMCLIZ                     **
      *****************************************************************
