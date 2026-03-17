      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBM9921.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSBM9921                                          **
      **  REMARKS: CREATION FOR COVID POLICIES TAX SYSTEM            **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
23342E**  13AUG20  CTS    CREATION FOR COVID POLICIES TRAD TAXSYSTEM **
MP798B**  14JUL21  CTS    COVID-19 RELATED CHANGES FOR 2ND, 3RD AND  **
MP798B**                  4TH STATE OF EMERGENCY                     **
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

       WORKING-STORAGE SECTION.


       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM9921'.

       COPY SQLCA.

           
       01 WS-MISC-FIELDS.
           05  WS-REC-CTCD-CTR               PIC 9(10).
           05  WS-REC-NCTD-CTR               PIC 9(10).
           
       01 WS-BCTX-TRL-REC-INFO.
           05  WS-FILLER                     PIC X(02). 
           05  WS-REC-CTR                    PIC 9(10).
            
      /
       COPY XCWL0035.

       COPY XCWWHDG.
      /
           
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
       COPY XCWWWKDT.
       COPY XCWWTIME.
      /
       COPY XCWLDTLK.
      /
       COPY XCWTFCMD.
      /
       COPY CCWWCCC.
      /
       COPY CCWWINDX.
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSRBCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.  
       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCTX
                               ==':ID:'==  BY =='BCTX'==. 
       COPY XCSWSEQ  REPLACING ==:ID:==  BY CTCD
                               ==':ID:'==  BY =='CTCD'==.
       COPY XCSWSEQ  REPLACING ==:ID:==  BY NCTD
                               ==':ID:'==  BY =='NCTD'==.                     
                               
       COPY CCSRBCTX.
       COPY CCSR9921.
       COPY ZCSRNCTD.       
       COPY ZCSRCTCD.       
       COPY CCFRMAST.
       COPY CCFWMAST.
       COPY CCFRPOL.
       COPY CCFWPOL.
      /
      *****************************************************************
      *  CALL MODULE PARAMETER INFORMATION                            *
      *****************************************************************
       COPY CCWL0010.
      /
       COPY XCWL0040.
      /
       COPY XCWL0290.
      /
       COPY CCWL0950.
      /
       COPY XCWL1640.
       COPY XCWL1660.
       COPY XCWL1670.
       COPY XCWL1680.
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
      ********************
       PROCEDURE DIVISION.
      ********************

      *---------------
       0000-MAIN-LINE.
      *---------------

           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  2000-INITIALIZE
               THRU 2000-INITIALIZE-X.

           PERFORM  3000-PROCESS-RECORDS
               THRU 3000-PROCESS-RECORDS-X
               UNTIL WBCTX-SEQ-IO-EOF.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

           PERFORM  0035-1000-COMMIT
               THRU 0035-1000-COMMIT-X.

           STOP RUN.

       0000-MAIN-LINE-X.
           EXIT.
      /
      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM  BCF-1000-OPEN-INPUT
               THRU BCF-1000-OPEN-INPUT-X.  
    
           PERFORM  BCTX-1000-OPEN-INPUT
               THRU BCTX-1000-OPEN-INPUT-X.    

           PERFORM  CTCD-3000-OPEN-OUTPUT
               THRU CTCD-3000-OPEN-OUTPUT-X.  
               
           PERFORM  NCTD-3000-OPEN-OUTPUT
               THRU NCTD-3000-OPEN-OUTPUT-X. 
                              
               
       0100-OPEN-FILES-X.
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

      * SET UP THE TITLE/HEADING LINES FOR THE OCF REPORT

           MOVE ZERO                        TO L0040-ERROR-CNT.

      * GET SYSTEM ID
           MOVE 'CS00000056'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           PERFORM  MAST-1000-READ
               THRU MAST-1000-READ-X.

           IF  WMAST-IO-OK
               MOVE RMAST-APPL-CTL-PRCES-DT TO WGLOB-PROCESS-DATE
           ELSE
      *MSG: 'MASTER CONTROL RECORD (@1) NOT FOUND'
               MOVE WMAST-KEY               TO WGLOB-MSG-PARM (1)
               MOVE 'CS00000001'            TO WGLOB-MSG-REF-INFO

               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X

               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X

           END-IF.

           MOVE ZEROES                      TO WS-REC-CTCD-CTR.
           MOVE ZEROES                      TO WS-REC-NCTD-CTR.
          
       2000-INITIALIZE-X.
           EXIT.
      /
      *---------------------
       3000-PROCESS-RECORDS.
      *---------------------           
                              
           PERFORM  BCTX-1000-READ
               THRU BCTX-1000-READ-X.
               
           IF  WBCTX-SEQ-IO-EOF
               GO TO 3000-PROCESS-RECORDS-X
           END-IF.               
               
           PERFORM  3100-SPLIT-TAX-CERT-DATA
               THRU 3100-SPLIT-TAX-CERT-DATA-X.

       3000-PROCESS-RECORDS-X.
           EXIT.
      /                
      *----------------------
       3100-SPLIT-TAX-CERT-DATA.
      *----------------------

           MOVE RBCTX-SEQ-REC-INFO          TO R9921-SEQ-REC-INFO.

           IF  R9921-HDR-REC-CTL = '00'
               ADD +1                       TO WS-REC-NCTD-CTR
               MOVE R9921-SEQ-REC-INFO      TO RNCTD-SEQ-REC-INFO
              
               PERFORM  NCTD-1000-WRITE
                   THRU NCTD-1000-WRITE-X 
               ADD +1                       TO WS-REC-CTCD-CTR
               MOVE R9921-SEQ-REC-INFO      TO RCTCD-SEQ-REC-INFO
              
               PERFORM  CTCD-1000-WRITE
                   THRU CTCD-1000-WRITE-X 
               GO TO 3100-SPLIT-TAX-CERT-DATA-X
           END-IF.

           IF  R9921-TRL-EXTRCT-CD  = '02'
               ADD +1                       TO WS-REC-CTCD-CTR
               MOVE R9921-SEQ-REC-INFO      TO WS-BCTX-TRL-REC-INFO
               MOVE WS-REC-CTCD-CTR         TO WS-REC-CTR
               MOVE WS-BCTX-TRL-REC-INFO    TO RCTCD-SEQ-REC-INFO
              
               PERFORM  CTCD-1000-WRITE
                   THRU CTCD-1000-WRITE-X 
               ADD +1                       TO WS-REC-NCTD-CTR
               MOVE WS-REC-NCTD-CTR         TO WS-REC-CTR
               MOVE WS-BCTX-TRL-REC-INFO    TO RNCTD-SEQ-REC-INFO
              
               PERFORM  NCTD-1000-WRITE
                   THRU NCTD-1000-WRITE-X 
               GO TO 3100-SPLIT-TAX-CERT-DATA-X
           END-IF.
                                                          
           MOVE R9921-POL-ID                TO WPOL-POL-ID.
      
           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.
              
           IF NOT WPOL-IO-OK
      *MSG:'   POLICY (@1) DOES NOT EXIST'
               MOVE 'ZS99210001'            TO WGLOB-MSG-REF-INFO
               MOVE WPOL-POL-ID             TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 3100-SPLIT-TAX-CERT-DATA-X
           END-IF.

          
MP798B*           IF  RPOL-DSASTR-CD = '4'
MP798B     IF  (RPOL-DSASTR-CD = '7'
MP798B     OR  RPOL-DSASTR-CD = '8'
MP798B     OR  RPOL-DSASTR-CD = '9'
MP798B     OR  RPOL-DSASTR-CD = 'A'
MP798B     OR  RPOL-DSASTR-CD = 'B'
MP798B     OR  RPOL-DSASTR-CD = 'C'
MP798B     OR  RPOL-DSASTR-CD = 'D'
MP798B     OR  RPOL-DSASTR-CD = 'E'
MP798B     OR  RPOL-DSASTR-CD = 'F'
MP798B     OR  RPOL-DSASTR-CD = 'G'
MP798B     OR  RPOL-DSASTR-CD = 'H')
           AND RPOL-POL-CSTAT-CD = 'Q1'
             
               MOVE RBCTX-SEQ-REC-INFO      TO RCTCD-SEQ-REC-INFO
               ADD +1                       TO WS-REC-CTCD-CTR
               
      *        MSGS: NOW PROCESSING POLICY(@1) FOR CTCD

               MOVE 'ZS99210002'            TO WGLOB-MSG-REF-INFO
               MOVE RPOL-POL-ID             TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X  
                
               PERFORM  CTCD-1000-WRITE
                   THRU CTCD-1000-WRITE-X 
           ELSE
                
               MOVE RBCTX-SEQ-REC-INFO      TO RNCTD-SEQ-REC-INFO
               ADD +1                       TO WS-REC-NCTD-CTR
      *        MSGS: NOW PROCESSING POLICY(@2) FOR NCTD

               MOVE 'ZS99210003'            TO WGLOB-MSG-REF-INFO
               MOVE  RPOL-POL-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X 
                   
               PERFORM  NCTD-1000-WRITE
                   THRU NCTD-1000-WRITE-X
           END-IF.

                
       3100-SPLIT-TAX-CERT-DATA-X.
           EXIT.
      / 
                
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.  
               
           PERFORM  BCTX-4000-CLOSE
               THRU BCTX-4000-CLOSE-X.                
               
           PERFORM  CTCD-4000-CLOSE
               THRU CTCD-4000-CLOSE-X. 
               
           PERFORM  NCTD-4000-CLOSE
               THRU NCTD-4000-CLOSE-X. 
             
           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.             

       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************
       COPY XCPL0035.

       COPY XCPPHDG.
       COPY XCPPTIME.
       COPY CCPPCCC.
      /
       COPY XCPL0040.
      /
       COPY CCPS0010.
       COPY CCPL0010.
      /
       COPY CCPS0950.
       COPY CCPL0950.
      /
       COPY XCPL0260.
      /
       COPY XCPS0290.
       COPY XCPL0290.
      /
       COPY CCPNMAST.
       COPY CCPNPOL.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULE                                      *
      *****************************************************************
       COPY XCPLOCF.
       COPY XCPOOCF.
      /
       COPY XCPLBCF.
       COPY XCPNBCF.
       COPY XCPOBCF.
       COPY XCPL1640.
       COPY XCPL1680.
       COPY XCPL1660.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY CTCD
                               ==':PGM:'== BY =='ZSRQCTCD'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY CTCD.
       COPY XCSASEQ  REPLACING ==:ID:==  BY CTCD.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY CTCD.       
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY NCTD
                               ==':PGM:'== BY =='ZSRQNCTD'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY NCTD.
       COPY XCSASEQ  REPLACING ==:ID:==  BY NCTD.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY NCTD.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY BCTX
                               ==':PGM:'== BY =='CSRQBCTX'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY BCTX.
       COPY XCSASEQ  REPLACING ==:ID:==  BY BCTX.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY BCTX.
      /      
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM ZSBM9921                     **
      *****************************************************************

