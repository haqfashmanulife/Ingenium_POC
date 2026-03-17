      *************************
       IDENTIFICATION DIVISION.
      *************************
      *
       PROGRAM-ID. ZSBM9905.
      *
       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER : ZSBM9905                                          **
      **  REMARKS: THIS ONE SHOT JOB MODULE FOR THE INGENIUM POLICIES**
      **           THE POLICY INFORMATION WHICH IS NOT THERE IN      **
      **           UNISYS WILL BE EXTRACTED IN INGENIUM AND IT WILL  **
      **           BE SHARED TO UNISYS FOR PD MASTER MIGRATION TO    **
      **           MIDAS. APPLICABLE POLICY WILL BE                  **
      **           PROVIDED BY INGENIUM.                             **
      **                                                             **
      **  DOMAIN : BC                                                **
      **  CLASS  : PD                                                **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
MP308B**  10FEB22  CTS    INITIAL VERSION                            **
JP9374**  27APR22  CTS    IO-OK VALIDATION ADDED IN 2000-PROCESS PARA**        
      *****************************************************************
      *
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
       WORKING-STORAGE SECTION.
      
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM9905'.
      
       COPY SQLCA.
      
       01  MISCELLANEOUS.
           05 WS-PIC-COUNTER                PIC 9(08).
           05 WS-INP-REC-READ               PIC S9(09) COMP-3 VALUE +0. 
           05 WS-OUT-REC-WRITE              PIC S9(09) COMP-3 VALUE +0. 

       01  WS-DTL-REC-INFO.
           05  WS-GROUP-CD                  PIC X(05).
           05  FILLER                       PIC X(01) VALUE ','.
           05  WS-GROUP-OFC-CD              PIC X(03).
           05  FILLER                       PIC X(01) VALUE ','.
           05  WS-POLICY-NUMBER             PIC X(07).
           05  FILLER                       PIC X(01) VALUE ','.
           05  WS-LRG-PROD-CD               PIC X(03).
           05  FILLER                       PIC X(01) VALUE ','.
           05  WS-SML-PROD-CD               PIC X(03).
           05  FILLER                       PIC X(01) VALUE ','.
           05  WS-CLI-OWNER-SEX-CD          PIC X(01).
               88 WS-CLI-OWNER-SEX-MALE     VALUE 'M'.
               88 WS-CLI-OWNER-SEX-FEMALE   VALUE 'F'.
               88 WS-CLI-OWNER-COMPANY      VALUE 'C'.
               88 WS-CLI-OWNER-JOINT        VALUE 'J'.
               88 WS-CLI-OWNER-PAYMENT      VALUE 'P'.
           05  FILLER                       PIC X(01) VALUE ','.
		   05  WS-INSRD-SEX-CD              PIC X(01).
               88 WS-CLI-INSRD-SEX-MALE     VALUE 'M'.
               88 WS-CLI-INSRD-SEX-FEMALE   VALUE 'F'.
               88 WS-CLI-INSRD-COMPANY      VALUE 'C'.
               88 WS-CLI-INSRD-JOINT        VALUE 'J'.
               88 WS-CLI-INSRD-PAYMENT      VALUE 'P'.
           05  FILLER                       PIC X(01) VALUE ','.
		   05  WS-INSRD-BTH-DT.         
               10  WS-OWNER-BTH-DT-YR       PIC 9(04).
               10  FILLER                   PIC X(1).  
               10  WS-OWNER-BTH-DT-MO       PIC 9(02).
               10  FILLER                   PIC X(1).  
               10  WS-OWNER-BTH-DT-DY       PIC 9(02).
           
      
      *****************************************************************
      *    COMMON COPYBOOKS                                           *
      *****************************************************************
       COPY XCWLDTLK.
       COPY XCWWTIME.
       COPY XCWWWKDT.
       COPY CCWWINDX.
      /
       COPY CCWWCCC.
      /
      *****************************************************************
      *    CALLED MODULE PARAMETER INFORMATION                        *
      *****************************************************************
       COPY XCWL0035.
      
       COPY CCWL0010.
       COPY XCWL0015.
       COPY XCWL0040.
       COPY XCWL0290.
       COPY XCWL1640.
       COPY XCWL1670.
       COPY XCWL1680.
       COPY XCWL2490.
       COPY CCWL9285.
      /
       COPY CCWL5620.
      /
       COPY CCWL0083.
       COPY CCWL2430.
      / 
       COPY XCWTFCMD.
      / 
      *****************************************************************
      *    I/O COPYBOOKS                                              *
      *****************************************************************
       COPY ZCSR9905.
      / 
       COPY CCFHCVGS.
       COPY CCWWCVGS.
      / 
       COPY XCWWHDG.
      /
       COPY CCWLPGA.
      /
       COPY XCSROCF.
       COPY XCSWOCF.
      / 
       COPY ZCSRPDOS.
      /
       COPY CCFWPOL.
       COPY CCFHPOL.
       COPY CCFRPOL.
      /
       COPY CCFRCVG.
       COPY CCFWCVG.
      /
       COPY CCFWMAST.
       COPY CCFRMAST.
      /      
       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY 9905
                               ==':ID:'==  BY =='9905'==.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY PDOS
                               ==':ID:'==  BY =='PDOS'==.
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
  

      ********************
       PROCEDURE DIVISION. 
      *******************
      *---------------
       0000-MAIN-LINE.
      *---------------
      
           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.
      
           PERFORM  1000-INITIALIZE
               THRU 1000-INITIALIZE-X.
         
           PERFORM  2000-PROCESS-POLICY-REC
               THRU 2000-PROCESS-POLICY-REC-X
               UNTIL W9905-SEQ-IO-EOF.
         
           PERFORM  9000-FINALIZE
               THRU 9000-FINALIZE-X.

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

           PERFORM  9905-1000-OPEN-INPUT
               THRU 9905-1000-OPEN-INPUT-X.
      
           PERFORM  PDOS-3000-OPEN-OUTPUT
               THRU PDOS-3000-OPEN-OUTPUT-X.
      
       0100-OPEN-FILES-X.
           EXIT.      
      /
      *-----------------
       1000-INITIALIZE.
      *-----------------
           
           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.
      
           PERFORM  MAST-1000-READ
               THRU MAST-1000-READ-X.

           IF NOT WMAST-IO-OK
               MOVE WMAST-KEY               TO WGLOB-MSG-PARM (1)
      * MSG: MASTER CONTROL RECORD NOT FOUND (@1)
               MOVE 'CS00000061'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM  0030-5000-LOGIC-ERROR
                   THRU 0030-5000-LOGIC-ERROR-X
           ELSE
               MOVE RMAST-APPL-CTL-PRCES-DT TO WGLOB-PROCESS-DATE
           END-IF.
           PERFORM  9905-1000-READ
               THRU 9905-1000-READ-X.

           IF  W9905-SEQ-IO-OK    
JP9374*               ADD +1                       TO WS-INP-REC-READ
JP9374         CONTINUE
           ELSE
      * MSG: 'NO RECORDS FOUND IN INPUT FILE ZS9905'
               MOVE 'ZS99050003'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           
       1000-INITIALIZE-X.
           EXIT.
      /
      *------------------------
       2000-PROCESS-POLICY-REC.
      *------------------------
           INITIALIZE WS-DTL-REC-INFO.           
        
JP9374     ADD +1                           TO WS-INP-REC-READ.
JP9374
           MOVE R9905-POLICY-NUMBER         TO WPOL-POL-ID.
           
           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.

JP9374     IF NOT WPOL-IO-OK
JP9374         PERFORM  9905-1000-READ
JP9374             THRU 9905-1000-READ-X
JP9374         GO TO 2000-PROCESS-POLICY-REC-X
JP9374     END-IF.
    
           PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
               THRU CVGS-1000-LOAD-CVGS-ARRAY-X.
      
JP9374*           IF  WPOL-IO-OK
JP9374*               PERFORM  2100-CREATE-EXTRACT
JP9374*                   THRU 2100-CREATE-EXTRACT-X         
JP9374*           END-IF.               
JP9374
JP9374     PERFORM  2100-CREATE-EXTRACT
JP9374         THRU 2100-CREATE-EXTRACT-X.
      
           PERFORM  9905-1000-READ
               THRU 9905-1000-READ-X.

JP9374*           IF  W9905-SEQ-IO-OK    
JP9374*               ADD +1                       TO WS-INP-REC-READ
JP9374*           END-IF.
      
       2000-PROCESS-POLICY-REC-X.
           EXIT.
      /           
      *-----------------
       2100-CREATE-EXTRACT.
      *-----------------
      
      *  GROUP CODE
           MOVE R9905-GROUP-CD              TO WS-GROUP-CD.

      *  GROUP OFFICE CODE 
           MOVE R9905-GROUP-OFC-CD          TO WS-GROUP-OFC-CD.

      *  POLICY ID
           MOVE RPOL-POL-ID                 TO WS-POLICY-NUMBER.
         
      * GET LARGE PRODUCT CODE      
           MOVE R9905-LRG-PROD-CD           TO WS-LRG-PROD-CD.
      
      * GET SMALL PRODUCT CODE
           MOVE R9905-SML-PROD-CD           TO WS-SML-PROD-CD.

      * GET OWNER SEX CODE     
           MOVE ZEROS                       TO I.
           PERFORM  2430-1000-BUILD-PARM-INFO
               THRU 2430-1000-BUILD-PARM-INFO-X.
              
           PERFORM  2430-2100-GET-OWNER
               THRU 2430-2100-GET-OWNER-X.
               
           IF  L2430-RETRN-OK
               MOVE L2430-CLI-SEX-CD        TO WS-CLI-OWNER-SEX-CD
           ELSE
               GO TO 2100-CREATE-EXTRACT-X
           END-IF.

      * GET INSURED SEX CODE AND BIRTH DATE      
           MOVE ZEROS                       TO I.
           PERFORM  2430-1000-BUILD-PARM-INFO
               THRU 2430-1000-BUILD-PARM-INFO-X.
              
           PERFORM  2430-3100-GET-PRIM-INSRD
               THRU 2430-3100-GET-PRIM-INSRD-X.
               
           IF  L2430-RETRN-OK
               MOVE L2430-CLI-SEX-CD        TO WS-INSRD-SEX-CD
               MOVE L2430-CLI-BTH-DT        TO WS-INSRD-BTH-DT
           ELSE
               GO TO 2100-CREATE-EXTRACT-X
           END-IF.
		   
           INITIALIZE RPDOS-SEQ-REC-INFO.
           
           MOVE WS-DTL-REC-INFO             TO RPDOS-SEQ-REC-INFO. 

		   
           PERFORM  PDOS-1000-WRITE
               THRU PDOS-1000-WRITE-X.
           ADD +1                           TO WS-OUT-REC-WRITE.

       2100-CREATE-EXTRACT-X.
           EXIT.
      /      
      *---------------
       9000-FINALIZE.
      *---------------

      **   MSG:'NUMBER OF INPUT RECORS READ ....... @1'
           MOVE 'ZS99050001'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-INP-REC-READ             TO WS-PIC-COUNTER.
           MOVE WS-PIC-COUNTER              TO WGLOB-MSG-PARM (1).
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                      TO L0040-INPUT-LINE.

      **   MSG:'NUMBER OF OUTPUT RECORDS WRITTEN..... @1'
           MOVE 'ZS99050002'                TO WGLOB-MSG-REF-INFO.
           MOVE WS-OUT-REC-WRITE            TO WS-PIC-COUNTER.
           MOVE WS-PIC-COUNTER              TO WGLOB-MSG-PARM (1).
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-INPUT-LINE.
           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.
           MOVE SPACES                      TO L0040-INPUT-LINE.
     
       9000-FINALIZE-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------
      
           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.
 
           PERFORM  9905-4000-CLOSE
               THRU 9905-4000-CLOSE-X.
      
           PERFORM  PDOS-4000-CLOSE
               THRU PDOS-4000-CLOSE-X.
                      
           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.
      
       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************
      *    PROCESSING COPYBOOKS                                       *
      *****************************************************************
       COPY CCPPCCC.
       COPY XCPPHDG.
       COPY XCPPTIME.
       COPY NCPPCVGS.
      /
      *****************************************************************
      *    LINKAGE PROCESSING COPYBOOKS                               *
      *****************************************************************
       COPY XCPL0035.
       COPY CCPL0010.
       COPY CCPS0010.
       COPY XCPL0040.
       COPY XCPL1640.
       COPY XCPL0015.
       COPY XCPL0260.
      /

       COPY CCPS2430.
       COPY CCPL2430.
      /  
      *****************************************************************
      *    FILE I/O PROCESS MODULES                                   *
      *****************************************************************
      
      /
       COPY XCPLOCF.
       COPY XCPOOCF.
      /      
       COPY CCPNPOL.
      /      
       COPY CCPNCVG.
      / 
       COPY CCPNMAST.
      /    
       COPY XCSNSEQ  REPLACING ==:ID:==  BY 9905.
       COPY XCSLFILE REPLACING ==:ID:==  BY 9905
                                      ==':PGM:'== BY =='ZSRQ9905'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY 9905.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY PDOS.
       COPY XCSLFILE REPLACING ==:ID:==  BY PDOS
                                      ==':PGM:'== BY =='ZSRQPDOS'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY PDOS. 
       COPY XCSASEQ  REPLACING ==:ID:==  BY PDOS.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY PDOS.
      /      
       COPY XCSLFILE REPLACING ==:ID:==  BY BCF
                               ==':PGM:'== BY =='XSRQBCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY BCF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY BCF.  
      /

       
      *****************************************************************
      *    ERROR HANDLING ROUTINES                                    *
      *****************************************************************
       COPY XCPL0030.
      
      *****************************************************************
      **                 END OF PROGRAM ZSBM9905                     **
      *****************************************************************
