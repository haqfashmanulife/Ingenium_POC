      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBM0216.

      *****************************************************************
      **  MEMBER :  ZSBM0216                                         **
      **  REMARKS:  BATCH PRINT ROUTINE.                             **
      **            ONE SHOT JOB                                     **
      **                                                             **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
M216A1**  14FEB13  CTS    ONE SHOT JOB FOR ADDING CVG NUM AND        **
      **                  ACCOUNT TYP CODE                           **
      *****************************************************************

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

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM0216'.

       COPY SQLCA.
       
       01  WORK-AREA-R72.
               05  RZ72                      PIC XX.
               05  72-ENTRY-POLICY           PIC X(10).
               05  72-ENTRY-DATE             PIC X(10).
               05  72-TRANS-KEY.
                   10  72-USER-ID            PIC X(08).
                   10  72-TRANS-DATE         PIC X(10).
                   10  72-TRANS-TIME         PIC ZZZZZZZ.
                   10  72-TRANS-TASK-ID      PIC X(04).
                   10  72-TRANS-SEQ          PIC S9(3).
               05  72-JOURNAL-BUS-FCN-ID     PIC X(04).
               05  72-ENTRY-ACNT             PIC X(29).
               05  72-ENTRY-ACNT-REDE REDEFINES 72-ENTRY-ACNT.
                   10  72-ENTRY-ACNT-BASE    PIC X(06).
                   10  72-ENTRY-ACNT-YR      PIC X(4).
                   10  72-ENTRY-ACNT-SUBCO   PIC X(02).
                   10  72-ENTRY-ACNT-CURR    PIC XX.
                   10  72-ENTRY-ACNT-PLAN-ID PIC X(06).
                   10  72-ENTRY-ACNT-BRC     PIC X(05).
                   10  72-ENTRY-ACNT-IL      PIC XX.
                   10  72-ENTRY-ACNT-CL      PIC XX.
               05  72-TRANS-BATCH            PIC S9(7).
               05  72-ENTRY-AGENT            PIC X(06).
               05  72-ENTRY-PLAN             PIC X(05).
               05  72-ENTRY-DESCRIPTION      PIC X(20).
               05  72-ENTRY-AMOUNT           PIC S9(15)V99.
               05  72-ENTRY-CHEQUE-ID        PIC X(16).
               05  72-ENTRY-CHEQUE-RUSH      PIC X(01).
               05  72-ENTRY-CODE             PIC X(01).
               05  72-ENTRY-SOURCE           PIC X(01).
               05  72-ENTRY-LAST-DATE        PIC X(10).
               05  72-ENTRY-ACNT-SUB-TYPE    PIC X(01).
               05  72-PAY-CD                 PIC X(01).
               05  72-APP-RECV-DT            PIC X(10).
               05  72-JRNL-DT                PIC X(10).
               05  72-OPER-CAT-CD            PIC X(06).
               05  72-SO-ID                  PIC X(05).
               05  72-MCL-BASE-ID            PIC X(08). 
               05  72-BR-ID                  PIC X(05). 
               05  72-GL-PROD-CD             PIC X(07).
               05  72-CSH-RFND-CD            PIC X(01).
                   88  72-CSH-RFND-FULL-CWA      VALUE 'F'.
                   88  72-CSH-RFND-PARTL-CWA     VALUE 'P'.
               05  72-ACCT-FEED-OP-CAT       PIC X(06).
               05  72-FND-ID                 PIC X(05).
               05  72-CWA-PRCES-DT           PIC X(10).
               05  72-CVG-NUM                PIC X(02).
               05  72-ACCT-TYP-CD            PIC X(01).
                   88  72-ACCT-TYP-MANL      VALUE 'M'.
                   88  72-ACCT-TYP-AUTO      VALUE 'A'.   

      *****************************************************************
      * COMMON COPYBOOKS
      *****************************************************************
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.      
      /
       COPY XCWTFCMD.
      / 
       COPY XCWWWKDT.
      /
       COPY XCWLDTLK. 
      /
       COPY CCWWCCC.
      /
       COPY CCWL0010.
      ****************************************************************
      *  TABLE LAYOUT & WORK AREAS FOR EXTRACT/REPORT TABLES         *
      ****************************************************************
      / 
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                          *
      *****************************************************************
      
       COPY CCFRHI.
       COPY CCFWHI.

      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
       
       COPY XCSROCF.      
       COPY ZCSR0217.
       COPY CCSR0216.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY 0216
                               ==':ID:'==  BY =='0216'==.  
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY 0217
                               ==':ID:'==  BY =='0217'==.
      /                         
       COPY XCSWOCF  REPLACING ==:ID:==  BY OCF
                               ==':ID:'==  BY =='OCF'==.
      / 
       COPY XCSWBCF.
       COPY XCSRBCF.
      /                               
      
      ****************************************************************
      *  FILE WORK AREA FOR EXTRACT/REPORT FILES                     *
      ****************************************************************
      /
      ********************
       PROCEDURE DIVISION.
      ********************
      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.
 
           PERFORM  0200-INITIALIZE-VALUES
               THRU 0200-INITIALIZE-VALUES-X.

           PERFORM  2000-PROCESS-REPORT
               THRU 2000-PROCESS-REPORT-X
              UNTIL W0216-SEQ-IO-EOF.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.
               
           STOP RUN.

       0000-MAINLINE-X.
           EXIT.
      /
      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.
               
           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM  0216-1000-OPEN-INPUT
               THRU 0216-1000-OPEN-INPUT-X.
               
           PERFORM  0217-3000-OPEN-OUTPUT
               THRU 0217-3000-OPEN-OUTPUT-X.               

       0100-OPEN-FILES-X.
           EXIT.
      /
      *-----------------------
       0200-INITIALIZE-VALUES.
      *-----------------------
      
           INITIALIZE WORK-AREA-R72. 
           
           PERFORM  0216-1000-READ
               THRU 0216-1000-READ-X.

           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.               

           IF NOT W0216-SEQ-IO-OK
      *    MSG:'INPUT FILE EMPTY'
               MOVE  'ZS02160001'           TO  WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X  
               GO TO 0200-INITIALIZE-VALUES-X
           END-IF.        

       0200-INITIALIZE-VALUES-X.
           EXIT.
      /
      *--------------------
       2000-PROCESS-REPORT.
      *--------------------
     
           MOVE R0216-SEQ-REC-INFO          TO WORK-AREA-R72.       
           
      *BUILD KEYS 
           IF (72-CVG-NUM = SPACES
           OR  72-JOURNAL-BUS-FCN-ID = SPACES)
           
               SET WHI-COMPANY-REQUIRED         TO TRUE
               MOVE 72-ENTRY-POLICY             TO WHI-POL-ID
               MOVE 'A'                         TO WHI-POL-HIST-TYP-CD
               MOVE 72-ENTRY-DATE               TO WHI-POL-TRXN-EFF-DT
               MOVE 72-TRANS-DATE               TO WHI-POL-TRXN-DT
               MOVE 72-TRANS-TIME               TO WHI-POL-TRXN-TIME         
               MOVE 72-TRANS-TASK-ID            TO WHI-POL-TRXN-TASK-ID
               MOVE 72-TRANS-SEQ                TO WHI-POL-TRXN-SEQ-NUM

               PERFORM  HI-1000-READ
                   THRU HI-1000-READ-X             
               
               IF  WHI-IO-OK 
                   
                   MOVE RHI-POL-TRXN-DTL-INFO-TXT(302:2) 
                                                TO 72-CVG-NUM                                      
                                        
                   IF  72-JOURNAL-BUS-FCN-ID = '1281'
                       SET 72-ACCT-TYP-MANL     TO TRUE
                   ELSE 
                       SET 72-ACCT-TYP-AUTO     TO TRUE
                   END-IF
               END-IF
           END-IF.                  
           
           PERFORM  3000-WRITE-0217
               THRU 3000-WRITE-0217-X.

           PERFORM  0216-1000-READ   
               THRU 0216-1000-READ-X.
               
       2000-PROCESS-REPORT-X.
           EXIT.
      /
      *--------------------
       3000-WRITE-0217.
      *--------------------
      
           MOVE  WORK-AREA-R72              TO R0217-SEQ-REC-INFO   
           
           PERFORM  0217-1000-WRITE
               THRU 0217-1000-WRITE-X.           

       3000-WRITE-0217-X.
           EXIT.
      /
      
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  0216-4000-CLOSE
               THRU 0216-4000-CLOSE-X.               

           PERFORM  0217-4000-CLOSE
               THRU 0217-4000-CLOSE-X.
               
           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
      ****************************************************
      ** PROCESSING WITH COMMON CODE
      **************************************************** 
      /
       COPY CCPPCCC.
      ****************************************************
      ** LINKAGE TO COMMON MODULES
      ****************************************************
      /
       COPY XCPL0260.
      /
       COPY CCPS0010.
       COPY CCPL0010.
      /
      ****************************************************
      ** FILE I/O                                       **
      ****************************************************     
       COPY CCPNHI.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY OCF
                               ==':PGM:'== BY =='XSRQOCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY OCF.
      /
       COPY XCSNSEQ  REPLACING ==:ID:==  BY 0216.
       COPY XCSLFILE REPLACING ==:ID:==  BY 0216
                               ==':PGM:'== BY =='CSRQ0216'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY 0216.
       
       COPY XCSLFILE REPLACING ==:ID:==  BY 0217
                               ==':PGM:'== BY =='ZSRQ0217'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY 0217.
       COPY XCSASEQ  REPLACING ==:ID:==  BY 0217.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY 0217.
      /
       COPY XCPLBCF.
       COPY XCPOBCF.
       COPY XCPNBCF.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.      
      *****************************************************************
      **                 END OF PROGRAM ZSBM0216                     **
      *****************************************************************