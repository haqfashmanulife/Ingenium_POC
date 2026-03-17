      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBM989A.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : ZSBM989A                                          **
      **  REMARKS: ONE SHOT PROGAM FOR COMMISSION RECORD LAYOUT      **
      **           CHANGE                                            **
      **           THIS MODULE WILL CONVERT OLD 9898                 **
      **           FILE FORMAT IN TO NEW 9898 FILE FORMAT            **
      **  DOMAIN : AG                                                **
      **  CLASS  : PD                                                **
      *****************************************************************
      **  DATE      AUTH.  DESCRIPTION                               **
      **                                                             **
NWLTRI**  07JUN10   CTS    CREATION OF MODULE                        **
MP211C**  05DEC12  CTS    TRAD NIP ENHANCEMENTS(2013) SUBSTANDARD    **
MP211C**  05DEC12  CTS    LIEN (REPORTS & EXTRACTS)                  **
MP266F**  20FEB15  CTS    ARMII REINSURANCE CHANGES                  **
RPU008**  19JUL21  CTS    RPU REINSURANCE CHANGES                    **
UYS128**  24MAY23  CTS    UNISYS REINSURANCE CHANGES                 **
28610X**  04OCT24  CTS    CHANGES FOR REINSURANCE  OF BEAVER         **
NVCR02**  07JUL25  CTS    CHANGES DONE AS PART OF REINSURANCE EXTRACT**
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
      /
      *************************
       WORKING-STORAGE SECTION.
      *************************
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBM989A'.

       COPY SQLCA.
      /
       COPY XCWL0035.

       COPY XCWWHDG.
      /
       01  WS-9898-SEQ-REC-INFO.
MP211C*           05  WS-OLD-9898-SEQ-REC-INFO     PIC X(157).
MP266F*MP211C     05  WS-OLD-9898-SEQ-REC-INFO     PIC X(162).
MP266F     05  WS-OLD-9898-SEQ-REC-INFO.
MP266F         10  WS-CODE                       PIC X(02).
MP266F         10  FILLER                        PIC X(02).
MP266F         10  WS-POL-ID                     PIC X(10).
MP266F         10  WS-CVG-NUM                    PIC X(02).
MP266F         10  WS-MVMT-CD                    PIC X(03).
MP266F         10  WS-CVG-CSTAT-CD               PIC X(03).
MP266F         10  WS-CVG-SUB-STAT-CD            PIC X(02).
MP266F         10  WS-CHNG-DT                    PIC X(10).
MP266F         10  WS-CVG-REINS-CO-ID            PIC X(02).
MP266F         10  WS-CVG-REINS-TRTY-NUM         PIC X(03).
MP266F         10  WS-INSRD-NM                   PIC X(51).
MP266F         10  WS-INSRD-BTH-DT               PIC X(10).
MP266F         10  WS-INSRD-SEX-CD               PIC X(01).
MP266F         10  WS-INSRD-ISS-AGE              PIC 9(03).
MP266F         10  WS-PLAN-ID                    PIC X(06).
MP266F         10  WS-CLI-LNB-IND                PIC X(01).
MP266F         10  WS-CVG-ISS-EFF-DT             PIC X(10).
MP266F         10  WS-INS-DUR                    PIC 9(03).
MP266F         10  WS-PMT-MODE                   PIC X(02).
MP266F         10  WS-CVG-FACE-AMT               PIC S9(13)V99 COMP-3.
MP266F         10  WS-CVG-ME-FCT                 PIC S9V99     COMP-3.
MP266F         10  WS-CVG-REINS-CED-PCT          PIC 9(03).
MP266F         10  WS-CVG-REINS-CED-AMT          PIC S9(13)V99 COMP-3.
MP266F         10  WS-PRCES-DT                   PIC X(10).
MP266F         10  WS-PREM-PYMT-PERI             PIC X(02).
MP266F         10  WS-SUB-LN-NUM                 PIC X(03).            
MP266F         10  WS-CVG-LIEN-DUR               PIC X(01). 
MP266F         10  WS-GUAR-PERI                  PIC X(02).
RPU008         10  WS-PACK-CVG-NUM               PIC X(02).
RPU008         10  WS-HOSP-BNFT-LMT-TYP-CD       PIC X(03).
RPU008         10  WS-POL-CRCY-CD                PIC X(03).
RPU008         10  WS-POL-VALU-AMT               PIC S9(13)V99 COMP-3.
RPU008         10  WS-POL-VALU-IND               PIC X(01).
RPU008         10  WS-SPCL-DISAB-EXCL-IND        PIC X(01).
UYS128         10  WS-RPU-IND                    PIC X(01).
UYS128         10  WS-ACTV-PRCES-TMESTMP         PIC X(19).
UYS128         10  WS-RENEWAL-IND                PIC X(01).
UYS128         10  WS-CVG-REINS-TYP-CD           PIC X(02).
UYS128         10  WS-COLI-PROD-IND              PIC X(01).
28610X         10  WS-CSV-RIDER-CD               PIC X(04).
28610X         10  WS-BASE-PLAN-ID               PIC X(06).
28610X         10  WS-MTHLY-STD-PREM             PIC S9(13)V99 COMP-3.
28610X         10  WS-3DD-WOP-FLAG               PIC X(01).
NVCR02         10  WS-DB-AMT                     PIC S9(13)V99 COMP-3.


MP266F     05  WS-ADDED-9898-SEQ-REC-INFO.
MP211C*               10  WS-PREM-PYMT-PERI        PIC 9(02).
MP211C*               10  WS-SUB-LN-NUM            PIC 9(03).
MP266A*MP211C         10 WS-CVG-LIEN-DUR           PIC 9(01).
RPU008*MP266F         10  WS-PACK-CVG-NUM               PIC X(02).
RPU008*MP266F         10  WS-HOSP-BNFT-LMT-TYP-CD       PIC X(03).
UYS128*RPU008         10  WS-RPU-IND                    PIC X(01).
UYS128*RPU008         10  WS-ACTV-PRCES-TMESTMP         PIC X(19).
UYS128*RPU008         10  WS-RENEWAL-IND                PIC X(01).
28610X*UYS128         10  WS-CSV-RIDER-CD               PIC X(04).	
28610X*UYS128         10  WS-BASE-PLAN-ID               PIC X(06).
NVCR02*28610X         10 WS-DB-AMT                     PIC S9(13)V99 COMP-3.
NVCR02     10  WS-3DD-WOP-TYP                PIC X(01).

RPU008 01  WS-TMP-WORK-INFO.
RPU008     05  WS-TMP-ACTV-PRCES-TMESTMP.
RPU008         10  WS-TRNXT-DT                   PIC X(10).
RPU008         10  FILLER                        PIC X(01) VALUE ' '.
RPU008         10  WS-TRNXT-TIME                 PIC X(08).
RPU008     05  WS-DOT                            PIC X(01) VALUE '.'.
RPU008     05  WS-COLEN                          PIC X(01) VALUE ':'.
              
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.

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
       COPY CCSR9898.
      /
       COPY CCSRTEMP.
      /
UYS128 COPY CCFRPOL.
UYS128 COPY CCFWPOL.
      
      ****************************************************************
      *  FILE WORK AREA FOR EXTRACT/REPORT FILES                     *
      ****************************************************************
       COPY XCSWSEQ  REPLACING ==:ID:==  BY 9898
                               ==':ID:'==  BY =='9898'==.
       COPY XCSWSEQ  REPLACING ==:ID:==  BY TEMP
                               ==':ID:'==  BY =='TEMP'==.
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
      /
       COPY XCSWOCF.
       COPY XCSROCF.
      /
       COPY XCSWBCF.
       COPY XCSRBCF.
      /
      *****************************************************************
      *  CALL MODULE PARAMETER INFORMATION                            *
      *****************************************************************
       COPY CCWLPGA.
       COPY CCWL0010.
       COPY XCWL0040.
       COPY CCWL0950.
      /
       COPY XCWL2490.
       COPY XCWL1670.
       COPY XCWL1680.
       COPY XCWL1640.
      /
MP266F COPY CCFRCVG. 
MP266F COPY CCFWCVG. 
      ********************
       PROCEDURE DIVISION.
      ********************

      *---------------
       0000-MAIN-LINE.
      *---------------

           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.

           PERFORM  1000-INIT-FOR-COMPANY
               THRU 1000-INIT-FOR-COMPANY-X.

           PERFORM  2000-PROCESS-TRANSACTIONS
               THRU 2000-PROCESS-TRANSACTIONS-X
              UNTIL W9898-SEQ-IO-EOF.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

           STOP RUN.

       0000-MAIN-LINE-X.
           EXIT.
      /
      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM  OCF-3000-OPEN-OUTPUT
               THRU OCF-3000-OPEN-OUTPUT-X.

           PERFORM  9898-1000-OPEN-INPUT
               THRU 9898-1000-OPEN-INPUT-X.
              
           PERFORM  TEMP-3000-OPEN-OUTPUT
               THRU TEMP-3000-OPEN-OUTPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------------
       1000-INIT-FOR-COMPANY.
      *----------------------

           MOVE 'CP'                        TO WGLOB-COMPANY-CODE.

           MOVE 'ZSBM989A'                  TO WGLOB-MAIN-PGM-ID
                                               WGLOB-CRNT-PGM-ID.

           PERFORM  0010-1000-INIT-DEFAULT
               THRU 0010-1000-INIT-DEFAULT-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           PERFORM  1100-INIT-OCF-TITLES
               THRU 1100-INIT-OCF-TITLES-X.

       1000-INIT-FOR-COMPANY-X.
           EXIT.
      /
      *---------------------
       1100-INIT-OCF-TITLES.
      *---------------------
      *
      * SET UP THE TITLE/HEADING LINES FOR THE OCF REPORT
      *
           MOVE ZERO                        TO L0040-ERROR-CNT.
      *
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

           PERFORM  0040-3000-WRITE-OTHER
               THRU 0040-3000-WRITE-OTHER-X.

       1100-INIT-OCF-TITLES-X.
           EXIT.
      /
      *-------------------------
       2000-PROCESS-TRANSACTIONS.
      *-------------------------
      *
      * READ RECORD FROM INPUT FILE TEMP.
      * UNTIL END-OF FILE REACHED.
      *
           PERFORM  9500-9898-READ
               THRU 9500-9898-READ-X.
           IF NOT W9898-SEQ-IO-OK
               GO TO 2000-PROCESS-TRANSACTIONS-X
           END-IF.

       2000-PROCESS-TRANSACTIONS-X.
           EXIT.
      /

      *---------------
       9500-9898-READ.
      *---------------


           INITIALIZE WS-9898-SEQ-REC-INFO.
RPU008     INITIALIZE WS-TMP-ACTV-PRCES-TMESTMP.

           PERFORM  9898-1000-READ
               THRU 9898-1000-READ-X.

           IF  W9898-SEQ-IO-EOF
               GO TO 9500-9898-READ-X
           END-IF.

           MOVE R9898-SEQ-REC-INFO          TO WS-OLD-9898-SEQ-REC-INFO.           

UYS128     MOVE R9898-POL-ID                TO WPOL-POL-ID.
UYS128     PERFORM  POL-1000-READ
UYS128         THRU POL-1000-READ-X.
UYS128
UYS128     IF NOT WPOL-IO-OK
UYS128         GO TO 9500-9898-READ-X
UYS128     END-IF.
RPU008*MP266F           
RPU008*MP266F     MOVE WS-POL-ID                   TO WCVG-POL-ID.
RPU008*MP266F     MOVE WS-CVG-NUM                  TO WCVG-CVG-NUM.
RPU008*MP266F
RPU008*MP266F     PERFORM  CVG-1000-READ
RPU008*MP266F         THRU CVG-1000-READ-X.
RPU008*MP266F
RPU008*MP266F     IF NOT WCVG-IO-OK
RPU008*MP266F         GO TO 9500-9898-READ-X
RPU008*MP266F     END-IF.
RPU008*MP266F
RPU008*MP266F    MOVE RCVG-PACK-CVG-NUM            TO WS-PACK-CVG-NUM.
RPU008*MP266F    MOVE RCVG-CVG-STBL-2-CD           TO WS-HOSP-BNFT-LMT-TYP-CD.
RPU008*MP266F 
RPU008

UYS128*RPU008     MOVE  ZEROES                     TO WS-RPU-IND.
UYS128*RPU008     MOVE  ZEROES                     TO WS-RENEWAL-IND.
UYS128*RPU008     MOVE  WGLOB-SYSTEM-DATE-INT      TO WS-TRNXT-DT.
UYS128*RPU008     MOVE  WGLOB-SYSTEM-TIME-INT      TO WS-TRNXT-TIME.
UYS128*RPU008
UYS128*RPU008     INSPECT WS-TRNXT-TIME
UYS128*RPU008                     REPLACING ALL WS-DOT
UYS128*RPU008                                      BY WS-COLEN.
UYS128*RPU008     MOVE  WS-TMP-ACTV-PRCES-TMESTMP  TO  WS-ACTV-PRCES-TMESTMP.
UYS128*
28610X*UYS128     MOVE SPACES                      TO WS-CSV-RIDER-CD.
28610X*UYS128     MOVE RPOL-PLAN-ID                TO WS-BASE-PLAN-ID.
28610X*UYS128
NVCR02*28610X     MOVE ZEROES                      TO WS-DB-AMT.
NVCR02            MOVE ZEROES                      TO WS-3DD-WOP-TYP.
           MOVE WS-9898-SEQ-REC-INFO        TO RTEMP-SEQ-REC-INFO.
      *
      *  WRITE THE NEW FORMAT FILE IN THE PATH SPECIFIED IN THE PROC
      *
           PERFORM  TEMP-1000-WRITE
               THRU TEMP-1000-WRITE-X.

       9500-9898-READ-X.
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  TEMP-4000-CLOSE
               THRU TEMP-4000-CLOSE-X.

           PERFORM  9898-4000-CLOSE
               THRU 9898-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************
       COPY XCPL0035.
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
       COPY XCPL2490.
       COPY XCPS2490.
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
      /
       COPY XCPL1680.
       COPY XCPL1640.
      /
MP266F COPY CCPNCVG.
      /
UYS128 COPY CCPNPOL.
      *****************************************************************
      *    FILE I/O LINKAGE & PROCESS MODULES                         *
      *****************************************************************

       COPY XCSLFILE REPLACING ==:ID:==  BY 9898
                               ==':PGM:'== BY =='CSRQ9898'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY 9898.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY ==9898==.

       COPY XCSLFILE REPLACING ==:ID:==  BY TEMP
                               ==':PGM:'== BY =='CSRQTEMP'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY TEMP.
       COPY XCSASEQ  REPLACING ==:ID:==  BY TEMP.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM ZSBM989A                     **
      *****************************************************************
