      *****************************************************************
      **  MEMBER :  ZSBMPLSR                                         **
      **  REMARKS:  PERFORM POST LAPS SURRENDER REVERSAL FOR TRAD    **
      **            POLICY WITH REFUND AMOUNT ZERO                   **
      **  DOMAIN :  AG                                               **
      **  CLASS  :  BC                                               **
      *****************************************************************
      **  DATE     AUTH   DESCRIPTION                                **
      **                                                             **
R15776**  02OCT10  CTS    INITIAL VERSION                            **
      *****************************************************************
      
      *************************
       IDENTIFICATION DIVISION.
      *************************
      
       PROGRAM-ID. ZSBMPLSR.
      
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
      
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMPLSR'.
      /
       COPY SQLCA.
       01  WS-PGM-WORK-AREA.
       
           05  WS-USER-R15776                        PIC X(08)
                                                     VALUE 'R15776'.
           05  I                 PIC S9(04) COMP.                                       
       01  WS-MSGS-TXT                               PIC X(80).
               88  WS-MSGS-ZSPLSR0001                    VALUE
              'ONE-TIME TRANSITION JOB WHICH POST LAPS SURR REVRS'.
               88  WS-MSGS-ZSPLSR0002                    VALUE
              'NO RECORDS TO PROCESS'.
               88  WS-MSGS-ZSPLSR0003                    VALUE
              'PROCESSING POLICY NO '. 
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       COPY CCFHPOL.
       COPY CCFRPOL.
       COPY CCFWPOL.
       COPY CCFHCVGS.       
      /
       COPY CCFRCVG.
       COPY CCFWCVG.
       COPY CCFRPOLC.
       COPY CCFWPOLC.
       COPY CCFWRL.
       COPY CCFRRL.
       COPY CCFRPCLH.
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.
       COPY XCSWSEQ  REPLACING ==:ID:==    BY    PLSR
                               ==':ID:'==  BY =='PLSR'==.
      /
       COPY ZCSRPLSR.
       COPY CCWWLOCK.
       COPY XCWWWKDT.
       COPY XCWWTIME.
      /
      ***********************************************************
      * CALLED MODULE PARAMETER INFORMATION
      ***********************************************************   
       COPY XCWL1680.
       COPY CCWLPGA.
      /
       COPY XCWL1670.
       COPY CCWL9B44.   
       COPY CCWWCVGS.
       COPY CCWL9215.
       COPY XCWL1640.
       COPY XCWL8090.       
       COPY CCWL9E98.
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
               UNTIL WPLSR-SEQ-IO-EOF.    
                     
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
               
           PERFORM  PLSR-1000-OPEN-INPUT
               THRU PLSR-1000-OPEN-INPUT-X.
      
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
           SET  WS-MSGS-ZSPLSR0001          TO TRUE.
           MOVE WS-MSGS-TXT                 TO L0040-PROGRAM-DESC.
      
           MOVE ZERO                        TO L0040-ERROR-CNT.
      
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.
      
           MOVE WS-USER-R15776              TO WGLOB-USER-ID.
      
           PERFORM  PLSR-1000-READ
               THRU PLSR-1000-READ-X.
      
           IF  NOT WPLSR-SEQ-IO-OK
      *MSG: NO RECORDS TO PROCESS
               MOVE SPACES                  TO L0040-INPUT-LINE
               SET  WS-MSGS-ZSPLSR0002      TO TRUE
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
          
      
      *MSG: PROCESSING POLICY NO @1
           MOVE RPLSR-POL-ID                      TO L0040-INPUT-LINE.
                  
           PERFORM  0040-3000-WRITE-OTHER      
               THRU 0040-3000-WRITE-OTHER-X.       
                  
           MOVE RPLSR-POL-ID                TO WPOL-POL-ID.
                
           PERFORM  POL-1000-READ       
               THRU POL-1000-READ-X.
               
           IF  WPOL-IO-OK     
               PERFORM  3000-PROCESS-PLSR-REC
                   THRU 3000-PROCESS-PLSR-REC-X
           END-IF
      
            PERFORM PLSR-1000-READ
               THRU PLSR-1000-READ-X.
      
       2000-PRCES-INPUT-RECORDS-X.
           EXIT.
      /
      *-----------------------
       3000-PROCESS-PLSR-REC.
      *-----------------------
                    
      
           MOVE RPOL-POL-ID                 TO WPOL-POL-ID.
      
           PERFORM  POL-1000-READ-FOR-UPDATE
               THRU POL-1000-READ-FOR-UPDATE-X.
               
           PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
               THRU CVGS-1000-LOAD-CVGS-ARRAY-X.
    
           PERFORM  TASK-1000-INCR-TASK-ID
               THRU TASK-1000-INCR-TASK-ID-X.
           MOVE RPOL-POL-ID                 TO LPGA-POLICY-NUMBER.
      
           PERFORM  9B44-1000-BUILD-PARM-INFO
               THRU 9B44-1000-BUILD-PARM-INFO-X.
      
           MOVE RPOL-POL-CEAS-DT     TO L9B44-EFF-DT
      
           PERFORM  9B44-2000-REINST-PLS
               THRU 9B44-2000-REINST-PLS-X.
      
           IF  L9B44-RETRN-OK
               PERFORM  POL-2000-REWRITE
                   THRU POL-2000-REWRITE-X
               PERFORM  CVGR-1000-REWRITE-CVGS-ARRAY
                   THRU CVGR-1000-REWRITE-CVGS-ARRAY-X

               MOVE RPOL-POL-ID                 TO WPOL-POL-ID
      
               PERFORM  POL-1000-READ-FOR-UPDATE
                   THRU POL-1000-READ-FOR-UPDATE-X
               MOVE '2020-08-31'         TO RPOL-VCF-LAST-UPDT-DT
               PERFORM  POL-2000-REWRITE
                   THRU POL-2000-REWRITE-X
           ELSE
               PERFORM  POL-3000-UNLOCK
                   THRU POL-3000-UNLOCK-X
           END-IF.
      
         
       3000-PROCESS-PLSR-REC-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------
      
           PERFORM  PLSR-4000-CLOSE
               THRU PLSR-4000-CLOSE-X.
               
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
       COPY CCPNCVG.
       COPY CCPUCVG.
      /     
       COPY XCPL0260.
      
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY PLSR
                                ==':PGM:'== BY =='ZSRQPLSR'==.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY  ==PLSR==.
       COPY XCSOFILE REPLACING ==:ID:==  BY PLSR.
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
       COPY CCPL9B44.
       COPY CCPS9B44.
      /
       COPY XCPL1680.
       COPY CCPS9215.
       COPY CCPL9215.
       COPY XCPL1640.
       COPY XCPL8090.       
       COPY XCPS8090.       
       COPY CCPL9E98.
       COPY CCPS9E98.
      *****************************************************************
      *                END OF PROGRAM ZSBMPLSR                        *
      ******************************************************************