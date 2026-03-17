      *****************************************************************
      **  MEMBER :  ZSBMRPUM                                         **
      **  REMARKS:  PERFORM RPU DATA MIGRATION UPDATION OF POLICY,   **
      **            COVERAGE INFORMATION AND HISTORY CREATION        **
      **  DOMAIN :  AG                                               **
      **  CLASS  :  BC                                               **
      *****************************************************************
      **  DATE     AUTH   DESCRIPTION                                **
      **                                                             **
RPU012**  30OCT20  CTS    INITIAL VERSION                            **
RPUC27**  28APR21  CTS    CR27 DELETE ASSIGNMENT CODE                **
132983**  08JUN21  CTS    BUG FIX DONE FOR RESTRICT BILLING CODE     **
      *****************************************************************
      
      *************************
       IDENTIFICATION DIVISION.
      *************************
      
       PROGRAM-ID. ZSBMRPUM.
      
       COPY XCWWCRHT.
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
      
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
      
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMRPUM'.
      /
       COPY SQLCA.
       01  WS-PGM-WORK-AREA.
       
           05  WS-USER-RPU012                        PIC X(08)
                                                     VALUE 'RPU012'.
           05  WS-CVG-NUM                            PIC X(02).
           05  WS-PHST-CVG-NUM                       PIC X(02).    
           05  I                                     PIC S9(04) COMP.
           05  WS-ACTV-TYP-ID                        PIC X(04).
               88  WS-ACTV-TYP-2010                  VALUE '2010'.
               88  WS-ACTV-TYP-1920                  VALUE '1920'.
               88  WS-ACTV-TYP-3003                  VALUE '3003'.
               88  WS-ACTV-TYP-2001                  VALUE '2001'.
               88  WS-ACTV-TYP-7023                  VALUE '7023'.
               88  WS-ACTV-TYP-7024                  VALUE '7024'.
           05  WS-PHST-STAT-CD                       PIC X(01).
               88  WS-PHST-STAT-ACTIVE               VALUE 'A'.
               88  WS-PHST-STAT-OVERRIDE             VALUE 'O'.
           05  WS-EFF-DT                             PIC X(10).
           05  WS-PLAN-ID                            PIC X(06).           
           05  WS-PRE-RPU-FACE-AMT                   PIC S9(13)V99
                                                     COMP-3.
           05  WS-RPU-FACE-AMT                       PIC S9(11)V99
                                                     COMP-3. 
           05  WS-POL-RPU-EFF-DT                     PIC X(10).
           05  WS-RPU-CO-RECV-DT                     PIC X(10).
           05  WS-MANL-RPU-IND                       PIC X(01).
               88 WS-MANL-RPU-YES                    VALUE 'Y'.
               88 WS-MANL-RPU-NO                     VALUE 'N'.
           05  WS-RPU-REMIT-IND                      PIC X(01).
               88 WS-RPU-REMIT-YES                   VALUE 'Y'.
               88 WS-RPU-REMIT-NO                    VALUE 'N'.
           05  WS-RETURN-CD                          PIC X(02).
               88  WS-RETURN-OK                      VALUE '01'.
               88  WS-RETURN-ERROR                   VALUE '99'. 
           05  WS-CO-ID                              PIC X(02).
           05  WS-POL-ID                             PIC X(10). 
           05  WS-PCHST-EFF-IDT-NUM                  PIC X(07).
           05  WS-START-SEQ-NUM                      PIC S9(03) 
                                                         COMP-3.
           05  WS-PCHST-SEQ-NUM                      PIC S9(03) 
                                                         COMP-3.
           05  WS-PREV-UPDT-USER-ID                  PIC X(08).
           05  WS-PREV-UPDT-DT                       PIC X(10).
           05  WS-PCHST-EFF-DT                       PIC X(10).
           05  WS-PREV-PRCES-DT                      PIC X(10).
           05  WS-PCHST-PREV-STAT-CD                 PIC X(01).
           05  WS-PCHST-OLD-VALU-TXT                 PIC X(20).
           05  WS-PCHST-NEW-VALU-TXT                 PIC X(20).
           05  WS-PREV-UPDT-TS.  
               10  WS-TRNXT-DT                       PIC X(10).
               10  FILLER                            PIC X(01) 
                                                     VALUE ' '.
               10  WS-TRNXT-TIME                     PIC X(08). 
           05  WS-DED-AMT                            PIC S9(13)V9(02)
                                                     COMP-3.
           05  WS-POL-LOAN-TRXN-AMT                  PIC S9(13)V9(02)
                                                     COMP-3.     
           05  WS-POL-PREV-MPREM-AMT                 PIC S9(13)V9(02)
                                                     COMP-3.
           05  WS-CDA-TYP-CD                         PIC X(01).
               88 WS-CDA-TYP-WTHDR                   VALUE 'W'.
           05  WS-CDA-SEQ-NUM                        PIC S9(03)
                                                     COMP-3.
           05  WS-OUTPUT-PARM-INFO.
               10  WS-RETRN-CD                       PIC S9(04) COMP.
                   88  WS-RETRN-OK                   VALUE ZERO.
                   88  WS-RETRN-ERROR                VALUE +1.
               10  FILLER                            PIC X(25).

       01  WS-MSGS-TXT                               PIC X(80).
               88  WS-MSGS-ZSRPUM0001                VALUE
              'ONE-TIME TRANSITION JOB FOR RPU AFTER MIGRATION'.
               88  WS-MSGS-ZSRPUM0002                VALUE
              'NO RECORDS TO PROCESS'.
               88  WS-MSGS-ZSRPUM0003                VALUE
              'PROCESSING POLICY NO '. 
               88  WS-MSGS-ZSRPUM0004                VALUE
              'MASTER CONTROL RECORD NOT FOUND '.
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY CCFHPOL.
       COPY CCFRPOL.
       COPY CCFWPOL.
       COPY CCFHCVGS.       
      /
       COPY CCWWCVGS.
       COPY CCFRCVG.       
       COPY CCFWCVG.
      /       
       COPY CCFWMAST.
       COPY CCFRMAST.      
      /       
       COPY XCSWOCF.
       COPY XCSROCF.
      /  
       COPY CCWWFRMT.
      /      
       COPY CCFRPHST.
       COPY CCFWPHST.       
       COPY CCFWPHS3. 
      /       
       COPY CCFRPH.
       COPY CCFWPH.       
      /
       COPY CCFRTH.
       COPY CCFWTH.
      /
       COPY CCFRLHST.
       COPY CCFWLHSD.
      /
       COPY CCFRCDSA.
       COPY CCFWCDSA.
      
       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.
       COPY XCSWSEQ  REPLACING ==:ID:==    BY    RPUM
                               ==':ID:'==  BY =='RPUM'==.
      /
       COPY ZCSRRPUM.
       COPY CCWWLOCK.
       COPY XCWWWKDT.
       COPY XCWWTIME.
      /
RPUC27 COPY CCFRPOLC.
RPUC27 COPY CCFWPOLC.
RPUC27/
      ***********************************************************
      * CALLED MODULE PARAMETER INFORMATION
      ***********************************************************   
       COPY XCWL1680.
       COPY CCWLPGA.
      /
       COPY XCWL1670.
       COPY CCWL9B44.   
       COPY XCWL8090.
       COPY CCWL2210.
       COPY XCWL0280.
RPUC27 COPY CCWL2430.       
      /      
      *****************************************************************
      *  CALL MODULE PARAMETER INFORMATION                            *
      *****************************************************************
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
       COPY CCWL0010.
      /
       COPY CCWL0950.
      /
       COPY XCWL0035.
      /
       COPY XCWL0040.
      /
       COPY XCWL1660.
      /
       COPY XCWLDTLK.
      /
       COPY XCWTFCMD.
      /
      ********************
       PROCEDURE DIVISION.
      ********************
      /
      *--------------
       0000-MAINLINE.
      *--------------
        
           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.
      
           PERFORM  1000-INITIALIZE
               THRU 1000-INITIALIZE-X.
      
           PERFORM  2000-PRCES-INPUT-RECORDS
               THRU 2000-PRCES-INPUT-RECORDS-X
               UNTIL WRPUM-SEQ-IO-EOF.    
                     
           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.
      
           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.
      
           STOP RUN.     
                
       0000-MAINLINE-X.
           EXIT.
      /              
               
      *----------------
       0100-OPEN-FILES.
      *----------------
      
           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.
      
           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.
               
           PERFORM  RPUM-1000-OPEN-INPUT
               THRU RPUM-1000-OPEN-INPUT-X.
      
       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------
       1000-INITIALIZE.
      *----------------
      
           MOVE 'CP'                        TO WGLOB-COMPANY-CODE.
      
           MOVE WPGWS-CRNT-PGM-ID           TO WGLOB-MAIN-PGM-ID
                                               WGLOB-CRNT-PGM-ID.
      
           PERFORM  0010-0000-INIT-PARM-INFO
               THRU 0010-0000-INIT-PARM-INFO-X.
      
           PERFORM  0010-1000-INIT-DEFAULT
               THRU 0010-1000-INIT-DEFAULT-X.
      
           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.
      
           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.
      
           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.
      
      ***  GET THE SYSTEM ID ***
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.
           PERFORM  PGA-1000-BUILD-PARMS
               THRU PGA-1000-BUILD-PARMS-X
      
      *** GET THE PROGRAM DESCRIPTION ***
           SET  WS-MSGS-ZSRPUM0001          TO TRUE.
           MOVE WS-MSGS-TXT                 TO L0040-PROGRAM-DESC.
      
           MOVE ZEROES                      TO L0040-ERROR-CNT.
      
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

      * GET CURRENT PROCESS DATE FROM MASTER CONTROL TABLE
      
           MOVE SPACES                      TO RMAST-KEY.
           MOVE WGLOB-COMPANY-CODE          TO WMAST-CO-ID.
      
           PERFORM  MAST-1000-READ
               THRU MAST-1000-READ-X.
      
           IF NOT WMAST-IO-OK
      *MSG: 'MASTER CONTROL RECORD NOT FOUND'
               MOVE SPACES                  TO L0040-INPUT-LINE
               SET  WS-MSGS-ZSRPUM0004      TO TRUE
               MOVE WS-MSGS-TXT             TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           END-IF.
      
           MOVE RMAST-APPL-CTL-PRCES-DT     TO WGLOB-PROCESS-DATE.               
      
           MOVE WS-USER-RPU012              TO WGLOB-USER-ID.
      
           PERFORM  RPUM-1000-READ
               THRU RPUM-1000-READ-X.
      
           IF  NOT WRPUM-SEQ-IO-OK
      *MSG: NO RECORDS TO PROCESS
               MOVE SPACES                  TO L0040-INPUT-LINE
               SET  WS-MSGS-ZSRPUM0002      TO TRUE
               MOVE WS-MSGS-TXT             TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
           END-IF.
      
       1000-INITIALIZE-X.
           EXIT.
      /
      *-------------------------
       2000-PRCES-INPUT-RECORDS.
      *-------------------------
      
           INITIALIZE WS-PGM-WORK-AREA.   
           
           MOVE SPACES                      TO L0040-INPUT-LINE.
           SET  WS-MSGS-ZSRPUM0003          TO TRUE.
           MOVE WS-MSGS-TXT                 TO L0040-INPUT-LINE.    
      *MSG: PROCESSING POLICY NO @1
           MOVE RRPUM-POL-ID                TO L0040-INPUT-LINE.
                  
           PERFORM  0040-3000-WRITE-OTHER      
               THRU 0040-3000-WRITE-OTHER-X.       
                  
           MOVE RRPUM-POL-ID                TO WPOL-POL-ID.
      
           PERFORM  POL-1000-READ-FOR-UPDATE
               THRU POL-1000-READ-FOR-UPDATE-X.
               
           IF  WPOL-IO-OK     
               PERFORM  3000-PROCESS-RPU-REC
                   THRU 3000-PROCESS-RPU-REC-X
           END-IF           
      
            PERFORM RPUM-1000-READ
               THRU RPUM-1000-READ-X.
      
       2000-PRCES-INPUT-RECORDS-X.
           EXIT.
      /
      *-----------------------
       3000-PROCESS-RPU-REC.
      *-----------------------
               
           PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
               THRU CVGS-1000-LOAD-CVGS-ARRAY-X.
      
           PERFORM  TASK-1000-INCR-TASK-ID
               THRU TASK-1000-INCR-TASK-ID-X.
           MOVE RRPUM-POL-ID                TO LPGA-POLICY-NUMBER.
      
           PERFORM  3100-POL-INFO-UPDATE
               THRU 3100-POL-INFO-UPDATE-X.
      
           PERFORM  3200-CVG-INFO-UPDATE
               THRU 3200-CVG-INFO-UPDATE-X
               VARYING I FROM 1 BY 1
               UNTIL   I > RPOL-POL-CVG-REC-CTR-N.

           MOVE WS-POL-RPU-EFF-DT           TO RPOL-POL-RPU-EFF-DT.
           MOVE WS-PLAN-ID                  TO RPOL-PLAN-ID.
           MOVE WS-RPU-CO-RECV-DT           TO RPOL-RPU-CO-RECV-DT.
           MOVE WS-PRE-RPU-FACE-AMT         TO RPOL-POL-PREV-FACE-AMT.
           MOVE WS-POL-PREV-MPREM-AMT       TO RPOL-POL-PREV-MPREM-AMT.
           
           PERFORM  POL-2000-REWRITE
               THRU POL-2000-REWRITE-X.
               
           PERFORM  CVGR-1000-REWRITE-CVGS-ARRAY
               THRU CVGR-1000-REWRITE-CVGS-ARRAY-X.
               
           PERFORM  4000-CREATE-HISTORY
               THRU 4000-CREATE-HISTORY-X.

           PERFORM  4400-CDSA-UPDATE
               THRU 4400-CDSA-UPDATE-X.               
         
RPUC27     PERFORM  4500-ASSIGNEE-UPDATE
RPUC27         THRU 4500-ASSIGNEE-UPDATE-X.
RPUC27
       3000-PROCESS-RPU-REC-X.
           EXIT.
      /
      *----------------------
       3100-POL-INFO-UPDATE.
      *----------------------

      *     SET WS-MANL-RPU-NO               TO TRUE.
      
      * CHANGES DONE FOR PLAN ID BEFORE RPU
           MOVE RPOL-PLAN-ID                TO RPOL-ORIG-PLAN-ID.
      
      * CHANGES DONE FOR PLAN ID AFTER RPU           
           MOVE RPOL-POL-BASE-CVG-NUM       TO I.
           
           PERFORM  PLIN-1000-PLAN-HEADER-IN
               THRU PLIN-1000-PLAN-HEADER-IN-X.
      
           MOVE RPH-RPU-TBAC-ID             TO WS-PLAN-ID.       
      
      * CHANGES DONE FOR COI BEFORE RPU              
           MOVE ZEROES                      TO RPOL-POL-MPREM-AMT.
           
      * CHANGES DONE FOR ANNUAL COI BEFORE RPU            
           MOVE ZEROES                      TO RPOL-POL-GRS-APREM-AMT.
      
      * CHANGES DONE FOR RPU EFFECTIVE DATE          
           MOVE RPOL-POL-PD-TO-DT-NUM       TO WS-POL-RPU-EFF-DT.
      
      * CHANGES DONE FOR RPU TRANSFER REQUEST COMPANY RECEIVED DATE
      * AND TIMESTAMP
      
           MOVE RPOL-POL-ID                 TO WPHS3-POL-ID.
           SET  WS-ACTV-TYP-2010            TO TRUE.
           MOVE WS-ACTV-TYP-ID              TO WPHS3-POL-ACTV-TYP-ID.
           SET  WS-PHST-STAT-ACTIVE         TO TRUE.
           MOVE WS-PHST-STAT-CD             TO WPHS3-PCHST-STAT-CD.
           MOVE RPOL-POL-PD-TO-DT-NUM       TO WPHS3-PCHST-EFF-DT.
           MOVE WPHS3-KEY                   TO WPHS3-ENDBR-KEY.
           MOVE RPOL-POL-PD-TO-DT-NUM       TO 
                                          WPHS3-ENDBR-PCHST-EFF-DT.
      
           PERFORM  PHS3-1000-BROWSE-PREV
               THRU PHS3-1000-BROWSE-PREV-X.
      
           IF  WPHS3-IO-OK
               PERFORM  PHS3-2000-READ-PREV
                   THRU PHS3-2000-READ-PREV-X
      
               IF  WPHS3-IO-OK
               PERFORM 
               UNTIL WPHS3-IO-EOF     
                   MOVE RPHST-PCHST-OLD-VALU-TXT
                                            TO WFRMT-WORK-AREA
                   MOVE WFRMT-2010-D1       TO L0280-INPUT-DATA
                   MOVE WGLOB-CRCY-SCALE-QTY    
                                            TO L0280-PRECISION
                   MOVE LENGTH OF WFRMT-2010-D1
                                            TO L0280-INPUT-SIZE
                   MOVE LENGTH OF WS-PRE-RPU-FACE-AMT 
                                            TO L0280-LENGTH
                   SET L0280-SPACES-PERMITTED  
                                            TO TRUE
                   PERFORM  0280-1000-NUMERIC-EDIT
                       THRU 0280-1000-NUMERIC-EDIT-X
                   MOVE L0280-OUTPUT        TO WS-PRE-RPU-FACE-AMT           
                   MOVE RPHST-PREV-PRCES-DT TO WS-RPU-CO-RECV-DT
                   PERFORM  PHS3-2000-READ-PREV
                       THRU PHS3-2000-READ-PREV-X
               END-PERFORM 
               END-IF
      
               PERFORM  PHS3-3000-END-BROWSE-PREV
                   THRU PHS3-3000-END-BROWSE-PREV-X
           END-IF.

      * CHANGE DONE FOR RPU REMIITANCE INDICATOR
           SET WS-RPU-REMIT-NO              TO TRUE.
           MOVE WS-RPU-REMIT-IND            TO RPOL-RPU-REMIT-IND.
           
      * CHANGE DONE FOR MANL RPU INDICATOR
           SET WS-MANL-RPU-YES              TO TRUE.
           MOVE WS-MANL-RPU-IND             TO RPOL-MANL-RPU-IND.
           SET RPOL-POL-PREV-STAT-PREM-REG  TO TRUE. 

      * CHANGE DONE FOR RESTRICT BILLING           
132983*           MOVE 'R'                         TO RPOL-POL-RBILL-CD.
132983     MOVE 'O'                         TO RPOL-POL-RBILL-CD.

           MOVE RPOL-POL-PD-TO-DT-NUM       TO RPOL-POL-STAT-CHNG-DT.
                 
       3100-POL-INFO-UPDATE-X.
           EXIT.
      /      
      *----------------------
       3200-CVG-INFO-UPDATE.
      *----------------------

      * CHANGES DONE FOR PREMIUM BEFORE RPU
           MOVE RRPUM-POL-ID                TO WTH-POL-ID.
           MOVE I                           TO WTH-CVG-NUM-N.
           MOVE RPOL-POL-PD-TO-DT-NUM       TO L1680-INTERNAL-1.
           MOVE ZEROES                      TO L1680-INT-DD-1.
           MOVE RPOL-POL-BILL-MODE-CD       TO L1680-NUMBER-OF-MONTHS.
           MOVE ZEROES                      TO L1680-NUMBER-OF-DAYS.
           MOVE ZEROES                      TO L1680-NUMBER-OF-YEARS.
           PERFORM 1680-4000-SUB-YMD-FROM-DATE
               THRU 1680-4000-SUB-YMD-FROM-DATE-X.
           MOVE L1680-INTERNAL-2            TO WTH-PREM-PD-DT-NUM.    
      
           PERFORM  TH-1000-READ
               THRU TH-1000-READ-X.
               
           IF  WTH-IO-OK
               MOVE RTH-CVG-TOT-PREM-AMT    TO WCVGS-CVG-MPREM-AMT (I)
                                            WCVGS-PRE-RPU-PREM-AMT (I)
                                            
               ADD WCVGS-CVG-MPREM-AMT (I)
                                            TO WS-POL-PREV-MPREM-AMT
           END-IF.
                
            IF I <> RPOL-POL-BASE-CVG-NUM
               GO TO 3200-CVG-INFO-UPDATE-X
            END-IF.

           COMPUTE WCVGS-CVG-BASIC-PREM-AMT (I) = 
                                  ( WCVGS-CVG-MPREM-AMT (I) * (12
                                   / RPOL-POL-BILL-MODE-CD-N ))
                                   - WCVGS-CVG-PFEE-AMT (I)

           MOVE WCVGS-CVG-SEQ-NUM (I)       TO WS-CVG-NUM.           

           MOVE WCVGS-CVG-PREV-FACE-AMT(I)  TO 
                                           WCVGS-CVG-ORIG-FACE-AMT (I)
                                           WCVGS-CVG-UWG-AMT (I).
                                               
      * CHANGES DONE FOR FACE AMOUNT AFTER RPU     
           MOVE WCVGS-CVG-FACE-AMT (I)      TO WS-RPU-FACE-AMT.
           MOVE WS-PRE-RPU-FACE-AMT         TO WCVGS-CVG-FACE-AMT (I).
           
      * CHANGES DONE FOR RPU FUND, POST-ADJUSTMENT RPU FACE AMOUNT
      * AND TIMESTAMP
           PERFORM  3210-LHST-BROWSE
               THRU 3210-LHST-BROWSE-X.
               
           PERFORM  2210-1000-BUILD-PARM-INFO
               THRU 2210-1000-BUILD-PARM-INFO-X.
      
           SET  L2210-CVG-PASSED            TO TRUE.
           MOVE RPOL-POL-BASE-CVG-NUM       TO L2210-CVG-NUM.
           MOVE WS-POL-RPU-EFF-DT           TO L2210-EFF-DT.
           SET  L2210-FCN-DRVR-SECONDARY    TO TRUE.
           MOVE WS-RPU-CO-RECV-DT           TO L2210-CO-EFF-DT.
           MOVE WS-POL-LOAN-TRXN-AMT        TO L2210-OS-PREM-AMT.
           
           PERFORM  2210-1000-RPU-QUOTE
               THRU 2210-1000-RPU-QUOTE-X.
      
           IF L2210-RETRN-OK
               MOVE L2210-PD-FND-AMT        TO WCVGS-RPU-FND-AMT (I)
               MOVE L2210-ADJ-FACE-AMT      TO 
                                            WCVGS-RPU-ADJ-FACE-AMT (I)
           ELSE
               SET  WS-RETURN-ERROR         TO TRUE
           END-IF.

           MOVE WS-RPU-FACE-AMT             TO WCVGS-RPU-FACE-AMT (I)
                                               WCVGS-CVG-FACE-AMT (I).
      * CHANGES DONE FOR PLAN ID AFTER RPU
           
           PERFORM  PLIN-1000-PLAN-HEADER-IN
               THRU PLIN-1000-PLAN-HEADER-IN-X.
             
           MOVE RPH-RPU-TBAC-ID             TO WCVGS-PLAN-ID (I).
           
      * CHANGES DONE FOR FACE AMOUNT AFTER RPU     
           MOVE WCVGS-CVG-FACE-AMT (I)      TO WCVGS-RPU-FACE-AMT (I)
                                               WS-RPU-FACE-AMT.
                                
      * CHANGES DONE FOR FACE AMOUNT BEFORE RPU     
           MOVE WS-PRE-RPU-FACE-AMT         TO 
                                          WCVGS-PRE-RPU-FACE-AMT (I).
           
           MOVE SPACES                      TO
                WCVGS-CVG-PREV-CSTAT-CD (I).
           SET WCVGS-CVG-PREV-STAT-PREM-REG (I) 
                                            TO TRUE.   
                                            
           MOVE RPOL-POL-PD-TO-DT-NUM       TO 
                                         WCVGS-CVG-STAT-PRCES-DT (I)
                                         WCVGS-CVG-STAT-EFF-DT (I).
                                             
                   
       3200-CVG-INFO-UPDATE-X.
           EXIT.
      /  
      *------------------
       3210-LHST-BROWSE.
      *------------------                          
      
           MOVE RRPUM-POL-ID                TO WLHSD-POL-ID.
           MOVE RPOL-POL-PD-TO-DT-NUM       TO WLHSD-POL-LOAN-EFF-DT.
           MOVE 999                         TO WLHSD-POL-LOAN-SEQ-NUM.
           
           MOVE WLHSD-KEY                   TO WLHSD-ENDBR-KEY.
           MOVE RPOL-POL-PD-TO-DT-NUM       TO 
                                      WLHSD-ENDBR-POL-LOAN-EFF-DT.
           MOVE ZEROES                      TO 
                                      WLHSD-ENDBR-POL-LOAN-SEQ-NUM.
      
           PERFORM  LHSD-1000-BROWSE-PREV
               THRU LHSD-1000-BROWSE-PREV-X.
      
           IF  NOT WLHSD-IO-OK
               GO TO 3210-LHST-BROWSE-X
           END-IF.
      
           IF  WLHSD-IO-OK
               PERFORM  LHSD-2000-READ-PREV
                   THRU LHSD-2000-READ-PREV-X                   
      
               IF  WLHSD-IO-OK
                   PERFORM  3220-GET-LHST-DET
                       THRU 3220-GET-LHST-DET-X
                       UNTIL WLHSD-IO-EOF
               END-IF
      
               PERFORM  LHSD-3000-END-BROWSE-PREV
                   THRU LHSD-3000-END-BROWSE-PREV-X
           END-IF.
               
       3210-LHST-BROWSE-X.
           EXIT.
      /       
      *------------------
       3220-GET-LHST-DET.
      *------------------
      
           IF  RLHST-POL-LOAN-STAT-ACTIVE
           AND RLHST-POL-LOAN-TRXN-POL-CHNG
               ADD RLHST-POL-LOAN-TRXN-AMT
                                            TO WS-POL-LOAN-TRXN-AMT                 
           END-IF.         

          PERFORM  LHSD-2000-READ-PREV
              THRU LHSD-2000-READ-PREV-X.  
            
       3220-GET-LHST-DET-X.
           EXIT.
      /      
      *---------------------
       4000-CREATE-HISTORY.
      *---------------------

      * FOR RPU REGISTRATION
           MOVE RPOL-CO-ID                  TO WS-CO-ID.
           MOVE RRPUM-POL-ID                TO WS-POL-ID.
           MOVE WGLOB-USER-ID               TO WS-PREV-UPDT-USER-ID.         
           
           MOVE WS-RPU-CO-RECV-DT           TO L1680-INTERNAL-1.
           MOVE ZEROES                      TO L1680-NUMBER-OF-YEARS.
           MOVE ZEROES                      TO L1680-NUMBER-OF-MONTHS.
           MOVE ZEROES                      TO L1680-NUMBER-OF-DAYS.
           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
           MOVE L1680-INTERNAL-2            TO WS-PREV-PRCES-DT
                                               WS-PREV-UPDT-DT.
             
           MOVE ZEROES                      TO WS-PHST-CVG-NUM.
           SET  WS-PHST-STAT-ACTIVE         TO TRUE.          
           MOVE SPACES                      TO WS-PCHST-PREV-STAT-CD.
           SET  WS-ACTV-TYP-1920            TO TRUE.           
           MOVE SPACES                      TO WS-PCHST-OLD-VALU-TXT.
           MOVE SPACES                      TO WS-PCHST-NEW-VALU-TXT.
           MOVE WGLOB-SYSTEM-DATE-INT       TO WS-TRNXT-DT.
           MOVE WGLOB-SYSTEM-TIME-INT       TO WS-TRNXT-TIME.
           
           IF  WS-RPU-CO-RECV-DT < WS-POL-RPU-EFF-DT
               MOVE WS-RPU-CO-RECV-DT       TO WS-EFF-DT
                                               WS-PCHST-EFF-DT
           ELSE
               MOVE WS-POL-RPU-EFF-DT       TO WS-EFF-DT
                                               WS-PCHST-EFF-DT
           END-IF.

           PERFORM  4010-PHST-BROWSE
               THRU 4010-PHST-BROWSE-X.
           
           PERFORM  4100-MOVE-WS-TO-PHST
               THRU 4100-MOVE-WS-TO-PHST-X.

      * FOR LHST OR APL RECORD

           PERFORM  4200-LHST-BROWSE
               THRU 4200-LHST-BROWSE-X.

      * FOR PLAN ID
           MOVE RPOL-CO-ID                  TO WS-CO-ID.
           MOVE RRPUM-POL-ID                TO WS-POL-ID.
           MOVE WGLOB-USER-ID               TO WS-PREV-UPDT-USER-ID.          
           MOVE RPOL-POL-PD-TO-DT-NUM       TO WS-PCHST-EFF-DT
                                               WS-EFF-DT.             
           MOVE '01'                        TO WS-PHST-CVG-NUM.
           SET  WS-PHST-STAT-ACTIVE         TO TRUE.           
           MOVE SPACES                      TO WS-PCHST-PREV-STAT-CD.
           SET  WS-ACTV-TYP-2001            TO TRUE. 
           MOVE SPACES                      TO WFRMT-2001-AREA.
           MOVE RPOL-ORIG-PLAN-ID           TO WFRMT-2001-D1.
           MOVE '/'                         TO WFRMT-2001-F1.
           MOVE WFRMT-2001-AREA             TO WS-PCHST-OLD-VALU-TXT.           
           MOVE RPOL-PLAN-ID                TO WFRMT-2001-D1.
           MOVE WFRMT-2001-AREA             TO WS-PCHST-NEW-VALU-TXT.
           MOVE WGLOB-SYSTEM-DATE-INT       TO WS-TRNXT-DT.
           MOVE WGLOB-SYSTEM-TIME-INT       TO WS-TRNXT-TIME.          

           PERFORM  4010-PHST-BROWSE
               THRU 4010-PHST-BROWSE-X.
               
           PERFORM  4100-MOVE-WS-TO-PHST
               THRU 4100-MOVE-WS-TO-PHST-X.      
               
      * FOR POLICY STATUS           
           MOVE ZEROES                      TO WS-PHST-CVG-NUM. 
           SET  WS-PHST-STAT-OVERRIDE       TO TRUE.
           SET  WS-ACTV-TYP-3003            TO TRUE.
           MOVE RPOL-POL-PREV-CSTAT-CD      TO WS-PCHST-OLD-VALU-TXT.
           MOVE RPOL-POL-CSTAT-CD           TO WS-PCHST-NEW-VALU-TXT. 
           MOVE WGLOB-SYSTEM-DATE-INT       TO WS-TRNXT-DT.
           MOVE WGLOB-SYSTEM-TIME-INT       TO WS-TRNXT-TIME.            
                       
           PERFORM  4100-MOVE-WS-TO-PHST
               THRU 4100-MOVE-WS-TO-PHST-X.

      * FOR COVERAGE STATUS             
           MOVE '01'                        TO WS-PHST-CVG-NUM.          
           MOVE WCVGS-CVG-PREV-CSTAT-CD (1) TO WS-PCHST-OLD-VALU-TXT.
           MOVE WCVGS-CVG-STAT-CD (1)       TO WS-PCHST-NEW-VALU-TXT.
           MOVE WGLOB-SYSTEM-DATE-INT       TO WS-TRNXT-DT.
           MOVE WGLOB-SYSTEM-TIME-INT       TO WS-TRNXT-TIME.            
           
           PERFORM  4100-MOVE-WS-TO-PHST
               THRU 4100-MOVE-WS-TO-PHST-X.
       
       4000-CREATE-HISTORY-X.
           EXIT.
      / 
      *------------------
       4010-PHST-BROWSE.
      *------------------

           MOVE RRPUM-POL-ID                TO WPHST-POL-ID.
           MOVE WS-EFF-DT                   TO L1660-INTERNAL-DATE.
      
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
      
           MOVE L1660-INVERTED-DATE         TO WPHST-PCHST-EFF-IDT-NUM
                                               WS-PCHST-EFF-IDT-NUM.

      *  SET UP ENDBROWSE KEY
      *
           MOVE ZEROES                      TO WPHST-PCHST-SEQ-NUM.      
           MOVE WPHST-KEY                   TO WPHST-ENDBR-KEY.
           MOVE 999                         TO
                                     WPHST-ENDBR-PCHST-SEQ-NUM.
      
           PERFORM  PHST-1000-BROWSE
               THRU PHST-1000-BROWSE-X.
      
           PERFORM  PHST-2000-READ-NEXT
               THRU PHST-2000-READ-NEXT-X.
            
           IF  WPHST-IO-OK
               MOVE  RPHST-PCHST-SEQ-NUM    TO WS-START-SEQ-NUM
           ELSE
               MOVE +999                    TO WS-START-SEQ-NUM
           END-IF.
           
           PERFORM  PHST-3000-END-BROWSE
               THRU PHST-3000-END-BROWSE-X.  

       4010-PHST-BROWSE-X.
           EXIT.
      /                
      *---------------------
       4100-MOVE-WS-TO-PHST.
      *---------------------                           

           SUBTRACT +1                    FROM  WS-START-SEQ-NUM.
           MOVE  WS-START-SEQ-NUM           TO  WPHST-PCHST-SEQ-NUM.
           
           PERFORM  PHST-1000-CREATE
               THRU PHST-1000-CREATE-X.
               
           MOVE WS-PREV-UPDT-USER-ID        TO RPHST-PREV-UPDT-USER-ID.
           MOVE WS-PREV-UPDT-DT             TO RPHST-PREV-UPDT-DT.
           MOVE WS-PREV-PRCES-DT            TO RPHST-PREV-PRCES-DT.
           MOVE WS-PCHST-EFF-DT             TO RPHST-PCHST-EFF-DT.
           MOVE WS-PHST-CVG-NUM             TO RPHST-CVG-NUM          
           MOVE WS-PHST-STAT-CD             TO RPHST-PCHST-STAT-CD.
           MOVE WS-PCHST-PREV-STAT-CD       TO RPHST-PCHST-PREV-STAT-CD.
           MOVE WS-ACTV-TYP-ID              TO RPHST-POL-ACTV-TYP-ID.
           MOVE WS-PCHST-OLD-VALU-TXT       TO RPHST-PCHST-OLD-VALU-TXT.
           MOVE WS-PCHST-NEW-VALU-TXT       TO RPHST-PCHST-NEW-VALU-TXT.  
           MOVE WS-PREV-UPDT-TS             TO RPHST-PREV-UPDT-TS.
      
           PERFORM  PHST-1000-WRITE
               THRU PHST-1000-WRITE-X.  
               
       4100-MOVE-WS-TO-PHST-X.
           EXIT.
      / 
      *------------------
       4200-LHST-BROWSE.
      *------------------                          
      
           MOVE RRPUM-POL-ID                TO WLHSD-POL-ID.
           MOVE RPOL-POL-PD-TO-DT-NUM       TO WLHSD-POL-LOAN-EFF-DT.
           MOVE 999                         TO WLHSD-POL-LOAN-SEQ-NUM.
           
           MOVE WLHSD-KEY                   TO WLHSD-ENDBR-KEY.
           MOVE RPOL-POL-PD-TO-DT-NUM       TO 
                                      WLHSD-ENDBR-POL-LOAN-EFF-DT.
           MOVE ZEROES                      TO 
                                      WLHSD-ENDBR-POL-LOAN-SEQ-NUM.
      
           PERFORM  LHSD-1000-BROWSE-PREV
               THRU LHSD-1000-BROWSE-PREV-X.
      
           IF  NOT WLHSD-IO-OK
               GO TO 4200-LHST-BROWSE-X
           END-IF.
      
           IF  WLHSD-IO-OK
               PERFORM  LHSD-2000-READ-PREV
                   THRU LHSD-2000-READ-PREV-X                   
      
               IF  WLHSD-IO-OK
                   PERFORM  4300-GET-LHST-DET
                       THRU 4300-GET-LHST-DET-X
                       UNTIL WLHSD-IO-EOF
               END-IF
      
               PERFORM  LHSD-3000-END-BROWSE-PREV
                   THRU LHSD-3000-END-BROWSE-PREV-X
           END-IF.
               
       4200-LHST-BROWSE-X.
           EXIT.
      /       
      *------------------
       4300-GET-LHST-DET.
      *------------------
      
           IF  RLHST-POL-LOAN-STAT-ACTIVE
           AND RLHST-POL-LOAN-TRXN-POL-CHNG
               IF RLHST-POL-LOAN-ID = 'C'   
                   SET  WS-ACTV-TYP-7024    TO TRUE
                   ADD RLHST-POL-LOAN-TRXN-AMT
                                            TO WS-DED-AMT
               ELSE
                   SET  WS-ACTV-TYP-7023    TO TRUE
                   ADD RLHST-POL-LOAN-TRXN-AMT
                                            TO WS-DED-AMT                  
              END-IF
           ELSE
               PERFORM  LHSD-2000-READ-PREV
                   THRU LHSD-2000-READ-PREV-X  
                   GO TO 4300-GET-LHST-DET-X
           END-IF.

           MOVE RPOL-POL-PD-TO-DT-NUM       TO WS-PCHST-EFF-DT.
           MOVE ZEROES                      TO WS-PHST-CVG-NUM.
           SET  WS-PHST-STAT-ACTIVE         TO TRUE.          
           MOVE SPACES                      TO WS-PCHST-PREV-STAT-CD.
           MOVE SPACES                      TO WS-PCHST-OLD-VALU-TXT.
           MOVE RLHST-POL-LOAN-SEQ-NUM      TO WS-PCHST-NEW-VALU-TXT.
           MOVE WGLOB-SYSTEM-DATE-INT       TO WS-TRNXT-DT.
           MOVE WGLOB-SYSTEM-TIME-INT       TO WS-TRNXT-TIME. 

           PERFORM  4100-MOVE-WS-TO-PHST
               THRU 4100-MOVE-WS-TO-PHST-X.           

          PERFORM  LHSD-2000-READ-PREV
              THRU LHSD-2000-READ-PREV-X.  
            
       4300-GET-LHST-DET-X.
           EXIT.
      /  
      *-----------------
       4400-CDSA-UPDATE.
      *-----------------
  
           MOVE RRPUM-POL-ID                TO WCDSA-POL-ID.
           SET  WS-CDA-TYP-WTHDR            TO TRUE.
           MOVE WS-CDA-TYP-CD               TO WCDSA-CDA-TYP-CD.
           MOVE +000                        TO WCDSA-POL-PAYO-NUM.           
           MOVE RPOL-POL-PD-TO-DT-NUM       TO L1660-INTERNAL-DATE.
           PERFORM  1660-2000-CONVERT-INT-TO-INV
               THRU 1660-2000-CONVERT-INT-TO-INV-X.
           MOVE L1660-INVERTED-DATE         TO WCDSA-CDA-EFF-IDT-NUM.
           MOVE +000                        TO WCDSA-CDA-SEQ-NUM.
      
           MOVE WCDSA-KEY                   TO WCDSA-ENDBR-KEY.
           MOVE L1660-INVERTED-DATE         TO
                                           WCDSA-ENDBR-CDA-EFF-IDT-NUM.
           MOVE +999                        TO WCDSA-ENDBR-CDA-SEQ-NUM.

           PERFORM  CDSA-1000-BROWSE
               THRU CDSA-1000-BROWSE-X.

           IF  NOT WCDSA-IO-OK
               SET WS-RETRN-ERROR           TO TRUE
               GO TO 4400-CDSA-UPDATE-X
           END-IF. 
           
           PERFORM  CDSA-2000-READ-NEXT
               THRU CDSA-2000-READ-NEXT-X.
               
           IF  WCDSA-IO-OK
               IF  RCDSA-CDA-STAT-ACTIVE
                   MOVE RCDSA-CDA-SEQ-NUM   TO WS-CDA-SEQ-NUM
               ELSE
                   PERFORM  CDSA-2000-READ-NEXT
                       THRU CDSA-2000-READ-NEXT-X
                       UNTIL RCDSA-CDA-STAT-ACTIVE
                       OR WCDSA-IO-EOF
                   IF  RCDSA-CDA-STAT-ACTIVE
                       MOVE RCDSA-CDA-SEQ-NUM   
                                            TO WS-CDA-SEQ-NUM
                   END-IF
               END-IF
           END-IF.

           PERFORM  CDSA-3000-END-BROWSE
               THRU CDSA-3000-END-BROWSE-X.                   
 
           IF  WS-CDA-SEQ-NUM = ZEROES
               GO TO 4400-CDSA-UPDATE-X
           ELSE
               MOVE WS-CDA-SEQ-NUM          TO WCDSA-CDA-SEQ-NUM
           END-IF.
           
           PERFORM  CDSA-1000-READ-FOR-UPDATE
               THRU CDSA-1000-READ-FOR-UPDATE-X.
  
           IF  WS-DED-AMT > ZEROES
               MOVE WS-DED-AMT              TO RCDSA-CDA-TOT-TRXN-AMT
               PERFORM  CDSA-2000-REWRITE
                   THRU CDSA-2000-REWRITE-X
           ELSE
               PERFORM  CDSA-1000-DELETE
                   THRU CDSA-1000-DELETE-X
           END-IF.
      
       4400-CDSA-UPDATE-X.
           EXIT.
      /       
RPUC27*---------------------
RPUC27 4500-ASSIGNEE-UPDATE.
RPUC27*---------------------
RPUC27
RPUC27     MOVE ZEROS                       TO I.
RPUC27
RPUC27     PERFORM  2430-1000-BUILD-PARM-INFO 
RPUC27         THRU 2430-1000-BUILD-PARM-INFO-X.
RPUC27
RPUC27     PERFORM  2430-2600-GET-ASSIGNEE
RPUC27         THRU 2430-2600-GET-ASSIGNEE-X.
RPUC27
RPUC27     IF  L2430-RELATIONSHIP-FOUND
RPUC27         MOVE L2430-CLI-ID            TO WPOLC-CLI-ID
RPUC27         MOVE L2430-CLI-REL-TYP-CD    TO WPOLC-POL-CLI-REL-TYP-CD
RPUC27         MOVE RRPUM-POL-ID            TO WPOLC-POL-ID
RPUC27   
RPUC27         PERFORM  POLC-1000-READ-FOR-UPDATE
RPUC27             THRU POLC-1000-READ-FOR-UPDATE-X
RPUC27
RPUC27         IF NOT WPOLC-IO-OK
RPUC27             SET WS-RETRN-ERROR       TO TRUE
RPUC27             GO TO 4500-ASSIGNEE-UPDATE-X
RPUC27         END-IF
RPUC27
RPUC27         PERFORM  POLC-1000-DELETE
RPUC27             THRU POLC-1000-DELETE-X
RPUC27
RPUC27         IF NOT WPOLC-IO-OK
RPUC27             SET WS-RETRN-ERROR       TO TRUE
RPUC27             GO TO 4500-ASSIGNEE-UPDATE-X
RPUC27         END-IF
RPUC27     END-IF.
RPUC27
RPUC27*-----------------------
RPUC27 4500-ASSIGNEE-UPDATE-X.
RPUC27*-----------------------
RPUC27/
      *-----------------
       9999-CLOSE-FILES.
      *-----------------
      
           PERFORM  RPUM-4000-CLOSE
               THRU RPUM-4000-CLOSE-X.
               
           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.
      
           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.
      
       9999-CLOSE-FILES-X.
            EXIT.
      /
      *****************************************************************
      *               I/O PROCESSING COPYBOOKS                        *
      *****************************************************************
      / 
       COPY NCPPCVGS.      
       COPY NCPPCVGR.
      /
       COPY CCPNPOL.
       COPY CCPUPOL.
       COPY CCPSPGA.
      /
       COPY CCPAPHST.      
       COPY CCPBPHST.      
       COPY CCPCPHST.
       COPY CCPVPHST.
       COPY CCPNPHST.
      /
       COPY CCPNCVG.
       COPY CCPUCVG.
      /    
       COPY XCPL0280.
      /      
       COPY XCPL0260.
       COPY CCPNMAST.       
       COPY CCPVPHS3.  
       COPY CCPNPH.
      /
       COPY CCPVTH.
       COPY CCPNTH.          
      /
       COPY CCPPPLIN.   
      /
       COPY CCPVLHSD.
      /
       COPY CCPBCDSA.       
       COPY CCPUCDSA.
       COPY CCPXCDSA.       
      /
RPUC27 COPY CCPUPOLC.
RPUC27 COPY CCPXPOLC.
RPUC27/
       COPY XCSLFILE REPLACING ==:ID:==  BY RPUM
                                ==':PGM:'== BY =='ZSRQRPUM'==.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY  ==RPUM==.
       COPY XCSOFILE REPLACING ==:ID:==  BY RPUM.
       COPY XCSLFILE REPLACING ==:ID:==  BY BCF
                               ==':PGM:'== BY =='XSRQBCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY BCF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY BCF.
      /
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
      /
       COPY CCPL0010.
       COPY CCPS0010.
      /
       COPY CCPS0950.
       COPY CCPL0950.
       COPY CCPPTASK.
      /
       COPY XCPL0030.
      /
       COPY XCPL0035.
      /
       COPY XCPL0040.
      /
       COPY XCPL1660.
      /
       COPY CCPS2210.
       COPY CCPL2210.
      /
       COPY XCPL1680.
       COPY XCPL8090.       
       COPY XCPS8090. 
       COPY XCPLOCF.
       COPY XCPOOCF.       
      /       
RPUC27 COPY CCPL2430.
RPUC27 COPY CCPS2430.
RPUC27/
       
      *****************************************************************
      *                END OF PROGRAM ZSBMRPUM                        *
      ******************************************************************