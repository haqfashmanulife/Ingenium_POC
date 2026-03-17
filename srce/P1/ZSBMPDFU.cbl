      *************************
       IDENTIFICATION DIVISION.
      *************************
      
       PROGRAM-ID. ZSBMPDFU.
      
       COPY XCWWCRHT.
      
      *****************************************************************
      **  MEMBER :  ZSBMPDFU                                         **
      **  REMARKS:  ONE SHOT JOB TO SET PROPORTIONAL PREM IND.       **
      **                                                             **
      **  DOMAIN :  PR                                               **
      **  CLASS  :  FD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
UYS104**  12DEC21  CTS    ONE SHOT JOB TO SET PROPORTIONAL PREM IND  **
UD1185**  15MAR21  CTS    FIX FOR RIDER SURRENDER ISSUE              **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
      
       DATA DIVISION.
      
       WORKING-STORAGE SECTION.
      
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMPDFU'.
      
       COPY SQLCA.
       COPY XCWLPTR.
      /
       01 WS-WORK-AREA.      
          05 WS-RETRN-CD                     PIC X(002).
             88 WS-RETRN-OK                  VALUE '00'.
             88 WS-RETRN-EDIT-ERROR          VALUE '01'.
             88 WS-RETRN-RQST-FAILED         VALUE '02'.
             88 WS-RETRN-INVALD-RQST         VALUE '99'.
          05 WS-ACTV-CD                      PIC X(001).
             88 WS-ACTV-FOUND-YES            VALUE 'Y'.
             88 WS-ACTV-FOUND-NO             VALUE 'N'.
      /              
      ***********************************************************
      * COMMON COPYBOOKS
      ***********************************************************
       COPY XCWWWKDT.
       COPY XCWEBLCH.
       COPY CCWWLOCK.
      /
       COPY XCWLDTLK.
       COPY XCWL1640.
       COPY XCWL1680.
       COPY XCWL1670.
      /
       COPY CCWWBTAX.
       COPY CCWWINDX.
       COPY XCWWHDG.
       COPY CCWL5020.
       COPY CCWL3320.
       COPY XCWL0040.
       COPY CCWWCCC.
       COPY XCWTFCMD.
       COPY XCWL0035.
       COPY CCWLPGA.
       COPY NCWL0960.
       COPY XCWL1660.
       COPY CCWL0010.
       COPY CCWL0950.
   
      **********************************************************
      * I/O COPYBOOKS
      **********************************************************
      /
       COPY XCSWPRT  REPLACING ==:ID:==  BY OCF
                               ==':ID:'==  BY =='OCF'==.
       COPY XCSROCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:== BY ==PDFU==
                               ==':ID:'==  BY =='PDFU'==.
       COPY ZCSRPDFU.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.
      /
       COPY CCFRPHST.
       COPY CCFWPHST.
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
      ***********************************************************
      * CALLED MODULE PARAMETER INFORMATION
      ***********************************************************
       01 WGLOB-GLOBAL-AREA.
          COPY XCWWGLOB.      
      /
       LINKAGE SECTION.      
      /
       PROCEDURE DIVISION.
      
      *--------------
       0000-MAINLINE.
      *--------------
      
           PERFORM  1000-OPEN-FILES
               THRU 1000-OPEN-FILES-X.
      
           PERFORM  2000-INITIALIZE
               THRU 2000-INITIALIZE-X.
      
           PERFORM  3000-PROCESS-RECORDS 
               THRU 3000-PROCESS-RECORDS-X
               UNTIL WPDFU-SEQ-IO-EOF.
      
           PERFORM  4000-CLOSE-FILES
               THRU 4000-CLOSE-FILES-X.
      
           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.
      
        STOP RUN.
               
       0000-MAINLINE-X.
          EXIT.
      /
      *----------------
       1000-OPEN-FILES.
      *----------------
      
           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.
      
           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.
       
           PERFORM  PDFU-1000-OPEN-INPUT
               THRU PDFU-1000-OPEN-INPUT-X.
       
       1000-OPEN-FILES-X.
           EXIT.
      /
      
      *----------------
       2000-INITIALIZE.
      *----------------
  
           MOVE SPACES                      TO WGLOB-COMPANY-CODE.
        
           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.
      
           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.
      
           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.
      
           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.
           MOVE SPACES                      TO WHDG-LINE-1.
           MOVE SPACES                      TO WHDG-LINE-2.
           MOVE SPACES                      TO WHDG-LINE-3.
           MOVE SPACES                      TO L0040-INPUT-LINE.
                      
           PERFORM 0960-0000-INIT-PARM-INFO
              THRU 0960-0000-INIT-PARM-INFO-X.
              
           MOVE WPGWS-CRNT-PGM-ID      TO L0960-PROGRAM-ID.
           
           PERFORM 0960-2000-INIT-DEFAULT
              THRU 0960-2000-INIT-DEFAULT-X.
      
      * GET THE DETAIL HEADINGS FOR PRINTING CONTROL CARDS
           MOVE 'XS00000150'           TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-2000-GET-MESSAGE
              THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT          TO L0040-HDG-LINE-3.
      
           PERFORM  2500-INIT-TITLES
               THRU 2500-INIT-TITLES-X.

UD1185     MOVE 'UYS104'                   TO WGLOB-USER-ID.
           
       2000-INITIALIZE-X.
           EXIT.
      /
      
      *-----------------
       2500-INIT-TITLES.
      *-----------------
      
           MOVE L0960-COMPANY-NAME          TO L0040-COMPANY-NAME.
           MOVE ZERO                        TO L0040-ERROR-CNT.
      
      **** SET UP THE TITLE/HEADING LINES
      
      **** GET THE SYSTEM ID
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-2000-GET-MESSAGE
              THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.
      
      **** GET THE PROGRAM DESCRIPTION
      *MSG:  'GET THE PROGRAM DESCRIPTION'
      
           MOVE 'ZSPDFU0001'                TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-2000-GET-MESSAGE
              THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-PROGRAM-DESC.
      
           PERFORM 0040-1000-INIT-TITLE
              THRU 0040-1000-INIT-TITLE-X.
      
           PERFORM  PDFU-1000-READ
               THRU PDFU-1000-READ-X.
      
           IF NOT WPDFU-SEQ-IO-OK
      *MSG: 'ERROR IN READING RECORD FROM INPUT FILE'
              MOVE 'ZSPDFU0002'            TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.
      
       2500-INIT-TITLES-X.
           EXIT.
      
      *---------------------
       3000-PROCESS-RECORDS.
      *---------------------
  
           SET WS-ACTV-FOUND-NO     TO TRUE.

           MOVE RPDFU-POL-ID        TO WPOL-POL-ID.
           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.
   
           IF NOT WPOL-IO-OK
      *MSG: 'POLICY(@1) NOT FOUND IN TPOL' 
              MOVE 'ZSPDFU0004'            TO WGLOB-MSG-REF-INFO
              MOVE RPDFU-POL-ID            TO WGLOB-MSG-PARM (1)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              PERFORM  PDFU-1000-READ
                  THRU PDFU-1000-READ-X
              GO TO 3000-PROCESS-RECORDS-X
           END-IF.

           MOVE RPDFU-POL-ID        TO WPHST-POL-ID.                      
           MOVE ZEROES              TO WPHST-PCHST-SEQ-NUM.
           MOVE ZEROES              TO WPHST-PCHST-EFF-IDT-NUM.
         
           MOVE WPHST-KEY           TO WPHST-ENDBR-KEY.
           MOVE RPDFU-POL-ID        TO WPHST-ENDBR-POL-ID.
           MOVE 9999999             TO WPHST-ENDBR-PCHST-EFF-IDT-NUM.          
           MOVE 999                 TO WPHST-ENDBR-PCHST-SEQ-NUM.            
      
           PERFORM  PHST-1000-BROWSE
               THRU PHST-1000-BROWSE-X.
   
           IF NOT WPHST-IO-OK
              GO TO 3000-PROCESS-RECORDS-X
           END-IF.
   
           PERFORM  PHST-2000-READ-NEXT
               THRU PHST-2000-READ-NEXT-X
   
           IF WPHST-IO-OK
              PERFORM  3500-FIND-PHST
                THRU 3500-FIND-PHST-X
            UNTIL NOT WPHST-IO-OK
              OR WS-ACTV-FOUND-YES
           END-IF.
   
           MOVE RPDFU-POL-ID             TO WPOL-POL-ID.
          
           PERFORM  POL-1000-READ-FOR-UPDATE
               THRU POL-1000-READ-FOR-UPDATE-X.
           
           IF NOT WPOL-IO-OK
              GO TO 3000-PROCESS-RECORDS-X
           END-IF.

           IF WS-ACTV-FOUND-YES
              SET RPOL-PROPORTN-PREM-YES  TO TRUE
           ELSE
              SET RPOL-PROPORTN-PREM-NO   TO TRUE
           END-IF.
   
           PERFORM  POL-2000-REWRITE
               THRU POL-2000-REWRITE-X.
         
           IF WPOL-IO-OK
      *MSG: 'FLAG SUCESSFULLY UPDATED FOR POLICY(@1)'
              MOVE 'ZSPDFU0003'            TO WGLOB-MSG-REF-INFO
              MOVE RPDFU-POL-ID            TO WGLOB-MSG-PARM (1)
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.
      
           PERFORM  PHST-3000-END-BROWSE
               THRU PHST-3000-END-BROWSE-X.

           PERFORM  PDFU-1000-READ
               THRU PDFU-1000-READ-X.
      
       3000-PROCESS-RECORDS-X.
         EXIT.
      
      *---------------
       3500-FIND-PHST.
      *---------------
      
           IF RPHST-PCHST-STAT-CD = 'A'
UD1185     OR RPHST-PCHST-STAT-CD = 'O'   
              CONTINUE
           ELSE
              PERFORM  PHST-2000-READ-NEXT
                  THRU PHST-2000-READ-NEXT-X
              GO TO 3500-FIND-PHST-X
           END-IF.
       
      *ADDED BELOW LOGIC TO CHECK IF RPU/FA REDUCTION/RIDER SURRENDER
      *HAS BEEN DONE BEFORE MIGRATION

           IF RPHST-POL-ACTV-TYP-ID = '2010'
           OR (RPHST-POL-ACTV-TYP-ID = '3003'
           AND (RPHST-PCHST-NEW-VALU-TXT = '3'
           OR RPHST-PCHST-NEW-VALU-TXT = 'E'))
              SET WS-ACTV-FOUND-YES        TO TRUE
           END-IF
   
           PERFORM  PHST-2000-READ-NEXT
               THRU PHST-2000-READ-NEXT-X.

      
       3500-FIND-PHST-X.
          EXIT. 
      *-----------------
       4000-CLOSE-FILES.
      *-----------------
           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.
      
           PERFORM  PDFU-4000-CLOSE
               THRU PDFU-4000-CLOSE-X.
      
           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.
      
       4000-CLOSE-FILES-X.
           EXIT.
      
      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************
       COPY CCPPCCC.
       COPY NCPS0960.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
       COPY XCPL0035.     
       COPY XCPL0260.
       COPY XCPL1640.
       COPY NCPL0960.
       COPY XCPL0040.
       COPY XCPL1660.
       COPY CCPL0010.
       COPY CCPS0010.
       COPY CCPS0950.
       COPY CCPL0950.

      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
       COPY CCPBPHST.
       COPY CCPUPOL.
       COPY CCPNPOL.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY OCF
                               ==':PGM:'== BY =='XSRQOCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY OCF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY OCF.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY PDFU
                               ==':PGM:'== BY =='ZSRQPDFU'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY PDFU.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY PDFU.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY BCF
                               ==':PGM:'== BY =='XSRQBCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY BCF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY BCF.
      
      / 
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
      
      *****************************************************************
      **                 END OF PROGRAM ZSBMPDFU                     **
      ***************************************************************** 