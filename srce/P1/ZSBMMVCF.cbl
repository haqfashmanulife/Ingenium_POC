      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBMMVCF.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER : CSBMMCOM                                          **
      **  REMARKS: ONE SHOT PROGAM FOR MVCF RECORD LAYOUT            **
      **           CHANGE                                            **
      **           THIS MODULE WILL CONVERT OLD VCF AND              **
      **           FILE FORMAT IN TO NEW VCF FILE FORMAT             **
      **  DOMAIN : AG                                                **
      **  CLASS  : PD                                                **
      *****************************************************************
      **  DATE      AUTH.  DESCRIPTION                               **
      **                                                             **
M245W1**  12AUG14  CTS    CREATION OF MODULE                         **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

           SELECT VCF-DATA-FILE ASSIGN     TO ZSVCF
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WVCF-SEQ-FILE-STATUS.


      /
      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

       FD  VCF-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

       01 RVCF-SEQ-REC-INFO.                                               
          05 RVCF-DATA-AREA.
             10 RVCF-POL-ID                    PIC  X(07).
             10 RVCF-CVG-NUM                   PIC  X(02).
             10 RVCF-CSTAT-CD                  PIC  X(04).
             10 RVCF-ISS-PRCES-DT              PIC  X(10).
             10 RVCF-PLAN-ID                   PIC  X(05).
             10 RVCF-BILL-MODE-CD              PIC  X(02).
             10 RVCF-BILL-TYP-CD               PIC  X(01).
             10 RVCF-CLI-GR-TYP-CD             PIC  X(01).
             10 RVCF-SEX-CD                    PIC  X(01).
             10 RVCF-RT-AGE                    PIC  X(03).
             10 RVCF-INS-TYP-CD                PIC  X(01).
             10 RVCF-MAT-XPRY-DT               PIC  X(10).
             10 RVCF-UL-PU-DT                  PIC  X(10).
             10 RVCF-ISS-EFF-DT                PIC  X(10).
             10 RVCF-FACE-AMT-SIGN             PIC  X(01).
             10 RVCF-FACE-AMT                  PIC  X(10).
M280A1*             10 RVCF-BNFT-TYP-CD               PIC  X(01).
M280A1       10 RVCF-BNFT-TYP-CD               PIC  X(02).
             10 RVCF-CNVR-P-AMT-SIGN           PIC  X(01).
             10 RVCF-CNVR-P-AMT                PIC  X(10).
             10 RVCF-SSTD-CNVR-P-AMT-SIGN      PIC  X(01).
             10 RVCF-SSTD-CNVR-P-AMT           PIC  X(10).
             10 RVCF-SERV-BR-ID                PIC  X(05).
             10 RVCF-STD-PREM-AMT-SIGN         PIC  X(01).
             10 RVCF-STD-PREM-AMT              PIC  X(10).
             10 RVCF-PFEE-AMT-SIGN             PIC  X(01).
             10 RVCF-PFEE-AMT                  PIC  X(10).
             10 RVCF-SSTD-PREM-AMT-SIGN        PIC  X(01).
             10 RVCF-SSTD-PREM-AMT             PIC  X(10).
             10 RVCF-ME-AMT                    PIC  X(04).
             10 RVCF-REINS-IND                 PIC  X(01).
             10 RVCF-REINS-TRTY-NUM            PIC  X(03).
             10 RVCF-POL-CHNL-CD               PIC  X(01).
             10 RVCF-AGT-ID                    PIC  X(06).
             10 RVCF-CLI-CRNT-LOC-CD           PIC  X(02).
             10 RVCF-SUB-STAT-CD               PIC  X(02).
             10 RVCF-ISS-DT-TYP-CD             PIC  X(01).
             10 RVCF-PREV-STAT-CD              PIC  X(03).
             10 RVCF-STAT-CHNG-DT              PIC  X(10).
             10 RVCF-ME-DUR                    PIC  X(03).
             10 RVCF-REINS-CO-ID               PIC  X(03).
             10 RVCF-REINS-CED-PCT             PIC  X(03).
             10 RVCF-SERV-AGT-ID               PIC  X(06).
             10 RVCF-LIAB-STRT-DT              PIC  X(10).
             10 RVCF-PDF-AMT-SIGN              PIC  X(01).
             10 RVCF-PDF-AMT                   PIC  X(10).
             10 RVCF-PREM-SUSP-AMT-SIGN        PIC  X(01).
             10 RVCF-PREM-SUSP-AMT             PIC  X(10).
             10 RVCF-CSV-AMT-SIGN              PIC  X(01).
             10 RVCF-CSV-AMT                   PIC  X(15).
             10 RVCF-CVG-STBL-2-CD             PIC  X(03).
             10 RVCF-CVG-STBL-3-CD             PIC  X(05).
             10 RVCF-CVG-STBL-1-CD             PIC  X(02).
             10 RVCF-UNIT-VALU-AMT             PIC  X(07).
             10 RVCF-SMKR-CD                   PIC  X(01).
             10 RVCF-ORIG-FACE-AMT-SIGN        PIC  X(01).
             10 RVCF-ORIG-FACE-AMT             PIC  X(10).
             10 RVCF-CLI-ID                    PIC  X(10).
             10 RVCF-PROD-APP-TYP-CD           PIC  X(02).
             10 RVCF-CVG-TOT-PREM-AMT-SIGN     PIC  X(01).
             10 RVCF-CVG-TOT-PREM-AMT          PIC  X(15).
             10 RVCF-ACT-DPOS-AMT-SIGN         PIC  X(01).
             10 RVCF-ACT-DPOS-AMT              PIC  X(15).
             10 RVCF-POL-PD-TO-DT-NUM          PIC  X(10).
             10 RVCF-PREV-PD-TO-DT-NUM         PIC  X(10).
             10 RVCF-TRAD-PD-TO-DT-NUM         PIC  X(10).
             10 RVCF-VCF-CREATE-DATE           PIC  X(10).
             10 RVCF-PREM-CHNG-DT              PIC  X(10).
             10 RVCF-BASE-CVG-NUM              PIC  9(04).
             10 RVCF-UWGDECN-DT                PIC  X(10).
             10 RVCF-PREV-MAT-XPRY-DT          PIC  X(10).
             10 RVCF-APP-RECV-DT               PIC  X(10).
             10 RVCF-CWA-SUSP-AMT-SIGN         PIC  X(01).
             10 RVCF-CWA-SUSP-AMT              PIC  X(13).
             10 RVCF-INIT-PREM-SUSP-AMT-SIGN   PIC  X(01).
             10 RVCF-INIT-PREM-SUSP-AMT        PIC  X(17).
             10 RVCF-ADV-PMT-TYP-CD            PIC  X(01).
             10 RVCF-ADV-PMT-DUR               PIC  X(03).
             10 RVCF-ADV-PMT-DUR-N             REDEFINES
                RVCF-ADV-PMT-DUR               PIC  9(03).             
             10 RVCF-ACRU-PDF-INT              PIC  X(10).
             10 RVCF-UNEARN-PREM-AMT           PIC  X(10).
             10 RVCF-ADV-PMT-DSCNT-AMT         PIC  X(10).
             10 RVCF-PREV-ADV-PMT-TYP-CD       PIC  X(01).
             10 RVCF-PREV-ADV-PMT-STRT-DT      PIC  X(10).
             10 RVCF-PREV-ADV-PMT-EFF-DT       PIC  X(10).
             10 RVCF-PREV-ADV-PMT-DUR          PIC  X(03).
             10 RVCF-PREV-ADV-PMT-DUR-N        REDEFINES
                RVCF-PREV-ADV-PMT-DUR          PIC  9(03).
             10 RVCF-ADV-PMT-DPOS-AMT          PIC  X(17).
             10 RVCF-LATST-ACTV-ID             PIC  X(04).
             10 RVCF-LATST-ACTV-EFF-DT         PIC  X(10).
             10 RVCF-PAYO-AMT                  PIC  X(10).
             10 RVCF-OVR-SHRT-PREM-AMT-SIGN    PIC  X(01).
             10 RVCF-OVR-SHRT-PREM-AMT         PIC  X(17).
             10 RVCF-INT-CAP-DT                PIC  X(10).
             10 RVCF-PREV-UNEARN-PREM-AMT      PIC  X(10).
             10 RVCF-APL-AMT                   PIC  X(10).
             10 RVCF-TOT-PAID-MED-BNFT-AMT     PIC  X(10).
             10 RVCF-NXT-SRVBEN-DT             PIC  X(10).
             10 RVCF-SRVBEN-DUR-PAID-AMT       PIC  X(17). 
             10 RVCF-CSV-STD-AMT               PIC  X(15).
             10 RVCF-CSV-SSTD-AMT              PIC  X(15).
             10 RVCF-ADV-PMT-RECV-DT           PIC  X(10).
             10 RVCF-ADV-PMT-PREPAY-FLAG       PIC  X(01).
             10 RVCF-CVG-STBL-4-CD             PIC  X(02).
             10 RVCF-INIT-PMT-TYP-CD           PIC  X(01).
             10 RVCF-PRES-CNVR-FACE-AMT-SIGN   PIC  X(01).
             10 RVCF-PRES-CNVR-FACE-AMT        PIC  X(10).
             10 RVCF-AVG-CNVR-FACE-AMT-SIGN    PIC  X(01).
             10 RVCF-AVG-CNVR-FACE-AMT         PIC  X(10).
             10 RVCF-CVG-WP-IND                PIC  X(01).
             10 RVCF-CVG-WP-PREM-AMT-SIGN      PIC  X(01).
             10 RVCF-CVG-WP-PREM-AMT           PIC  X(10).
             10 RVCF-PREV-CVG-WP-PREM-AMT      PIC  X(10).
             10 RVCF-SSTD-WP-PREM-AMT          PIC  X(10).
             10 RVCF-PREV-SSTD-WP-PREM-AMT     PIC  X(10).
             10 RVCF-LATST-TOT-PREM-AMT-SIGN   PIC  X(01).
             10 RVCF-LATST-TOT-PREM-AMT        PIC  X(15).
             10 RVCF-LATST-SSTD-PREM-AMT-SIGN  PIC  X(01).
             10 RVCF-LATST-SSTD-PREM-AMT       PIC  X(10). 
             10 RVCF-AGE-CALC-MTHD-CD          PIC  X(01).
             10 RVCF-PACK-CVG-NUM              PIC  X(02).
             10 RVCF-FND-BAL-AMT-SIGN          PIC  X(01).
             10 RVCF-FND-BAL-AMT               PIC  X(16).
             10 RVCF-FND-UNIT-PRIC-AMT-SIGN    PIC  X(01).
             10 RVCF-FND-UNIT-PRIC-AMT         PIC  9(07).9(08).
             10 RVCF-FND-UNITS-QTY-SIGN        PIC  X(01). 
             10 RVCF-FND-UNITS-QTY             PIC  9(11).9(04).
             10 RVCF-FND-ID                    PIC  X(05).
             10 RVCF-ACQ-COST-AMT-SIGN         PIC  X(01).  
             10 RVCF-ACQ-COST-AMT              PIC  X(13). 
             10 RVCF-MAINT-COST-AMT-SIGN       PIC  X(01).  
             10 RVCF-MAINT-COST-AMT            PIC  X(13). 
             10 RVCF-SA-PREM-FEE-AMT-SIGN      PIC  X(01). 
             10 RVCF-SA-PREM-FEE-AMT           PIC  X(13). 
             10 RVCF-INS-FEE-AMT-SIGN          PIC  X(01).
             10 RVCF-INS-FEE-AMT               PIC  X(13).
             10 RVCF-FND-SWITCH-XPNS-AMT-SIGN  PIC  X(01).
             10 RVCF-FND-SWITCH-XPNS-AMT       PIC  X(13).
             10 RVCF-RSK-PREM-AMT-SIGN         PIC  X(01).
             10 RVCF-RSK-PREM-AMT              PIC  X(13).
             10 RVCF-SSTD-RSK-PREM-AMT-SIGN    PIC  X(01).
             10 RVCF-SSTD-RSK-PREM-AMT         PIC  X(13).
             10 RVCF-WP-COST-AMT-SIGN          PIC  X(01).
             10 RVCF-WP-COST-AMT               PIC  X(13).
             10 RVCF-SA-XFER-IND               PIC  X(01).
             10 RVCF-PREV-MO-STAT-CD           PIC  X(01).
             10 RVCF-SURR-CHRG-AMT-SIGN        PIC  X(01).
             10 RVCF-SURR-CHRG-AMT             PIC  X(13).
             10 RVCF-ISS-STD-PREM-AMT-SIGN     PIC  X(01).
             10 RVCF-ISS-STD-PREM-AMT          PIC  X(13).
             10 RVCF-PREV-FND-BAL-AMT-SIGN     PIC  X(01).
             10 RVCF-PREV-FND-BAL-AMT          PIC  X(13).
             10 RVCF-SA-DPOS-AMT-SIGN          PIC  X(01).
             10 RVCF-SA-DPOS-AMT               PIC  X(13).
             10 RVCF-MVMT-FND-BAL-AMT-SIGN     PIC  X(01). 
             10 RVCF-MVMT-FND-BAL-AMT          PIC  X(13). 
             10 RVCF-FAR-FND-TRXN-AMT-SIGN     PIC  X(01).
             10 RVCF-FAR-FND-TRXN-AMT          PIC  X(13).
             10 RVCF-SURR-FND-TRXN-AMT-SIGN    PIC  X(01).
             10 RVCF-SURR-FND-TRXN-AMT         PIC  X(13).
             10 RVCF-DTH-FND-TRXN-AMT-SIGN     PIC  X(01).
             10 RVCF-DTH-FND-TRXN-AMT          PIC  X(13).
             10 RVCF-MAT-FND-TRXN-AMT-SIGN     PIC  X(01).  
             10 RVCF-MAT-FND-TRXN-AMT          PIC  X(13).  
             10 RVCF-OTHR-FND-TRXN-AMT-SIGN    PIC  X(01).
             10 RVCF-OTHR-FND-TRXN-AMT         PIC  X(13).
             10 RVCF-REINST-FND-TRXN-AMT-SIGN  PIC  X(01).
             10 RVCF-REINST-FND-TRXN-AMT       PIC  X(13).
             10 RVCF-FND-SWITCH-IND            PIC  X(01).
             10 RVCF-XPCT-SURR-CHRG-AMT-SIGN   PIC  X(01).
             10 RVCF-XPCT-SURR-CHRG-AMT        PIC  X(13).
             10 RVCF-MAT-DT-CALC-CD            PIC  X(01).  
             10 RVCF-LIFE-RSK-TYP-CD           PIC  X(01).
             10 RVCF-INIT-SA-TRNS-DT           PIC  X(10).
             10 RVCF-POL-FEE-AMT-SIGN          PIC  X(01).
             10 RVCF-POL-FEE-AMT               PIC  X(13).
             10 RVCF-ADV-PMT-ANNV-DT           PIC  X(10).
             10 RVCF-ADV-PMT-INT-AMT-SIGN      PIC  X(01).
             10 RVCF-ADV-PMT-INT-AMT           PIC  X(10).
             10 RVCF-LMPSM-DSCNT-AMT-SIGN      PIC  X(01).
             10 RVCF-LMPSM-DSCNT-AMT           PIC  X(10).
             10 RVCF-HYBRID-DSCNT-AMT-SIGN     PIC  X(01).
             10 RVCF-HYBRID-DSCNT-AMT          PIC  X(10).
             10 RVCF-CVG-LIEN-DUR              PIC  X(01).
             10 RVCF-ADJ-PERI-DEP-AMT          PIC  X(15).
             10 RVCF-APS-IND                   PIC  X(01).
             10 RVCF-PREV-FND-ID               PIC  X(05).
             10 RVCF-PREV-FND-UNITS-QTY-SIGN   PIC  X(01). 
             10 RVCF-PREV-FND-UNITS-QTY        PIC  9(11).9(04).

      *************************
       WORKING-STORAGE SECTION.
      *************************
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMMVCF'.

       COPY SQLCA.
      /
       COPY XCWL0035.

       COPY XCWWHDG.
      /
       01  WS-VCF-SEQ-REC-INFO.                                               
           05 WS-DATA-AREA.
              10 WS-POL-ID                    PIC  X(07).
              10 WS-CVG-NUM                   PIC  X(02).
              10 WS-CSTAT-CD                  PIC  X(04).
              10 WS-ISS-PRCES-DT              PIC  X(10).
              10 WS-PLAN-ID                   PIC  X(05).
              10 WS-BILL-MODE-CD              PIC  X(02).
              10 WS-BILL-TYP-CD               PIC  X(01).
              10 WS-CLI-GR-TYP-CD             PIC  X(01).
              10 WS-SEX-CD                    PIC  X(01).
              10 WS-RT-AGE                    PIC  X(03).
              10 WS-INS-TYP-CD                PIC  X(01).
              10 WS-MAT-XPRY-DT               PIC  X(10).
              10 WS-UL-PU-DT                  PIC  X(10).
              10 WS-ISS-EFF-DT                PIC  X(10).
              10 WS-FACE-AMT-SIGN             PIC  X(01).
              10 WS-FACE-AMT                  PIC  X(10).
M280A1*              10 WS-BNFT-TYP-CD               PIC  X(01).
M280A1        10 WS-BNFT-TYP-CD               PIC  X(02).
              10 WS-CNVR-P-AMT-SIGN           PIC  X(01).
              10 WS-CNVR-P-AMT                PIC  X(10).
              10 WS-SSTD-CNVR-P-AMT-SIGN      PIC  X(01).
              10 WS-SSTD-CNVR-P-AMT           PIC  X(10).
              10 WS-SERV-BR-ID                PIC  X(05).
              10 WS-STD-PREM-AMT-SIGN         PIC  X(01).
              10 WS-STD-PREM-AMT              PIC  X(15).
              10 WS-STD-PREM-AMT-N            REDEFINES
                 WS-STD-PREM-AMT              PIC  9(13)V9(02).
              10 WS-PFEE-AMT-SIGN             PIC  X(01).
              10 WS-PFEE-AMT                  PIC  X(10).
              10 WS-SSTD-PREM-AMT-SIGN        PIC  X(01).
              10 WS-SSTD-PREM-AMT             PIC  X(10).
              10 WS-ME-AMT                    PIC  X(04).
              10 WS-REINS-IND                 PIC  X(01).
              10 WS-REINS-TRTY-NUM            PIC  X(03).
              10 WS-POL-CHNL-CD               PIC  X(01).
              10 WS-AGT-ID                    PIC  X(06).
              10 WS-CLI-CRNT-LOC-CD           PIC  X(02).
              10 WS-SUB-STAT-CD               PIC  X(02).
              10 WS-ISS-DT-TYP-CD             PIC  X(01).
              10 WS-PREV-STAT-CD              PIC  X(03).
              10 WS-STAT-CHNG-DT              PIC  X(10).
              10 WS-ME-DUR                    PIC  X(03).
              10 WS-REINS-CO-ID               PIC  X(03).
              10 WS-REINS-CED-PCT             PIC  X(03).
              10 WS-SERV-AGT-ID               PIC  X(06).
              10 WS-LIAB-STRT-DT              PIC  X(10).
              10 WS-PDF-AMT-SIGN              PIC  X(01).
              10 WS-PDF-AMT                   PIC  X(10).
              10 WS-PREM-SUSP-AMT-SIGN        PIC  X(01).
              10 WS-PREM-SUSP-AMT             PIC  X(10).
              10 WS-CSV-AMT-SIGN              PIC  X(01).
              10 WS-CSV-AMT                   PIC  X(15).
              10 WS-CSV-AMT-N                 REDEFINES
                 WS-CSV-AMT                   PIC  9(13)V9(02).
              10 WS-CVG-STBL-2-CD             PIC  X(03).
              10 WS-CVG-STBL-3-CD             PIC  X(05).
              10 WS-CVG-STBL-1-CD             PIC  X(02).
              10 WS-UNIT-VALU-AMT             PIC  X(07).
              10 WS-SMKR-CD                   PIC  X(01).
              10 WS-ORIG-FACE-AMT-SIGN        PIC  X(01).
              10 WS-ORIG-FACE-AMT             PIC  X(10).
              10 WS-CLI-ID                    PIC  X(10).
              10 WS-PROD-APP-TYP-CD           PIC  X(02).
              10 WS-CVG-TOT-PREM-AMT-SIGN     PIC  X(01).
              10 WS-CVG-TOT-PREM-AMT          PIC  X(15).
              10 WS-CVG-TOT-PREM-AMT-N        REDEFINES
                 WS-CVG-TOT-PREM-AMT          PIC  9(13)V9(02).
              10 WS-ACT-DPOS-AMT-SIGN         PIC  X(01).
              10 WS-ACT-DPOS-AMT              PIC  X(15).
              10 WS-POL-PD-TO-DT-NUM          PIC  X(10).
              10 WS-PREV-PD-TO-DT-NUM         PIC  X(10).
              10 WS-TRAD-PD-TO-DT-NUM         PIC  X(10).
              10 WS-VCF-CREATE-DATE           PIC  X(10).
              10 WS-PREM-CHNG-DT              PIC  X(10).
              10 WS-BASE-CVG-NUM              PIC  9(04).
              10 WS-UWGDECN-DT                PIC  X(10).
              10 WS-PREV-MAT-XPRY-DT          PIC  X(10).
              10 WS-APP-RECV-DT               PIC  X(10).
              10 WS-CWA-SUSP-AMT-SIGN         PIC  X(01).
              10 WS-CWA-SUSP-AMT              PIC  X(13).
              10 WS-INIT-PREM-SUSP-AMT-SIGN   PIC  X(01).
              10 WS-INIT-PREM-SUSP-AMT        PIC  X(17).
              10 WS-ADV-PMT-TYP-CD            PIC  X(01).
              10 WS-ADV-PMT-DUR               PIC  X(03).
              10 WS-ADV-PMT-DUR-N             REDEFINES
                 WS-ADV-PMT-DUR               PIC  9(03).             
              10 WS-ACRU-PDF-INT              PIC  X(10).
              10 WS-UNEARN-PREM-AMT           PIC  X(10).
              10 WS-ADV-PMT-DSCNT-AMT         PIC  X(10).
              10 WS-PREV-ADV-PMT-TYP-CD       PIC  X(01).
              10 WS-PREV-ADV-PMT-STRT-DT      PIC  X(10).
              10 WS-PREV-ADV-PMT-EFF-DT       PIC  X(10).
              10 WS-PREV-ADV-PMT-DUR          PIC  X(03).
              10 WS-PREV-ADV-PMT-DUR-N        REDEFINES
                 WS-PREV-ADV-PMT-DUR          PIC  9(03).
              10 WS-ADV-PMT-DPOS-AMT          PIC  X(17).
              10 WS-LATST-ACTV-ID             PIC  X(04).
              10 WS-LATST-ACTV-EFF-DT         PIC  X(10).
              10 WS-PAYO-AMT                  PIC  X(10).
              10 WS-OVR-SHRT-PREM-AMT-SIGN    PIC  X(01).
              10 WS-OVR-SHRT-PREM-AMT         PIC  X(17).
              10 WS-INT-CAP-DT                PIC  X(10).
              10 WS-PREV-UNEARN-PREM-AMT      PIC  X(10).
              10 WS-APL-AMT                   PIC  X(10).
              10 WS-TOT-PAID-MED-BNFT-AMT     PIC  X(10).
              10 WS-NXT-SRVBEN-DT             PIC  X(10).
              10 WS-SRVBEN-DUR-PAID-AMT       PIC  X(17). 
              10 WS-CSV-STD-AMT               PIC  X(15).
              10 WS-CSV-SSTD-AMT              PIC  X(15).
              10 WS-ADV-PMT-RECV-DT           PIC  X(10).
              10 WS-ADV-PMT-PREPAY-FLAG       PIC  X(01).
              10 WS-CVG-STBL-4-CD             PIC  X(02).
              10 WS-INIT-PMT-TYP-CD           PIC  X(01).
              10 WS-PRES-CNVR-FACE-AMT-SIGN   PIC  X(01).
              10 WS-PRES-CNVR-FACE-AMT        PIC  X(10).
              10 WS-AVG-CNVR-FACE-AMT-SIGN    PIC  X(01).
              10 WS-AVG-CNVR-FACE-AMT         PIC  X(10).
              10 WS-CVG-WP-IND                PIC  X(01).
              10 WS-CVG-WP-PREM-AMT-SIGN      PIC  X(01).
              10 WS-CVG-WP-PREM-AMT           PIC  X(10).
              10 WS-PREV-CVG-WP-PREM-AMT      PIC  X(10).
              10 WS-SSTD-WP-PREM-AMT          PIC  X(10).
              10 WS-PREV-SSTD-WP-PREM-AMT     PIC  X(10).
              10 WS-LATST-TOT-PREM-AMT-SIGN   PIC  X(01).
              10 WS-LATST-TOT-PREM-AMT        PIC  X(15).
              10 WS-LATST-TOT-PREM-AMT-N      REDEFINES
                 WS-LATST-TOT-PREM-AMT        PIC  9(13)V9(02).
              10 WS-LATST-SSTD-PREM-AMT-SIGN  PIC  X(01).
              10 WS-LATST-SSTD-PREM-AMT       PIC  X(10). 
              10 WS-AGE-CALC-MTHD-CD          PIC  X(01).
              10 WS-PACK-CVG-NUM              PIC  X(02).
              10 WS-FND-BAL-AMT-SIGN          PIC  X(01).
              10 WS-FND-BAL-AMT               PIC  X(16).
              10 WS-FND-UNIT-PRIC-AMT-SIGN    PIC  X(01).
              10 WS-FND-UNIT-PRIC-AMT         PIC  9(07).9(08).
              10 WS-FND-UNITS-QTY-SIGN        PIC  X(01). 
              10 WS-FND-UNITS-QTY             PIC  9(11).9(04).
              10 WS-FND-ID                    PIC  X(05).
              10 WS-ACQ-COST-AMT-SIGN         PIC  X(01).  
              10 WS-ACQ-COST-AMT              PIC  X(13). 
              10 WS-MAINT-COST-AMT-SIGN       PIC  X(01).  
              10 WS-MAINT-COST-AMT            PIC  X(13). 
              10 WS-SA-PREM-FEE-AMT-SIGN      PIC  X(01). 
              10 WS-SA-PREM-FEE-AMT           PIC  X(13). 
              10 WS-INS-FEE-AMT-SIGN          PIC  X(01).
              10 WS-INS-FEE-AMT               PIC  X(13).
              10 WS-FND-SWITCH-XPNS-AMT-SIGN  PIC  X(01).
              10 WS-FND-SWITCH-XPNS-AMT       PIC  X(13).
              10 WS-RSK-PREM-AMT-SIGN         PIC  X(01).
              10 WS-RSK-PREM-AMT              PIC  X(13).
              10 WS-SSTD-RSK-PREM-AMT-SIGN    PIC  X(01).
              10 WS-SSTD-RSK-PREM-AMT         PIC  X(13).
              10 WS-WP-COST-AMT-SIGN          PIC  X(01).
              10 WS-WP-COST-AMT               PIC  X(13).
              10 WS-SA-XFER-IND               PIC  X(01).
              10 WS-PREV-MO-STAT-CD           PIC  X(01).
              10 WS-SURR-CHRG-AMT-SIGN        PIC  X(01).
              10 WS-SURR-CHRG-AMT             PIC  X(13).
              10 WS-ISS-STD-PREM-AMT-SIGN     PIC  X(01).
              10 WS-ISS-STD-PREM-AMT          PIC  X(15).
              10 WS-ISS-STD-PREM-AMT-N        REDEFINES
                 WS-ISS-STD-PREM-AMT          PIC  9(13)V9(02).
              10 WS-PREV-FND-BAL-AMT-SIGN     PIC  X(01).
              10 WS-PREV-FND-BAL-AMT          PIC  X(13).
              10 WS-SA-DPOS-AMT-SIGN          PIC  X(01).
              10 WS-SA-DPOS-AMT               PIC  X(13).
              10 WS-MVMT-FND-BAL-AMT-SIGN     PIC  X(01). 
              10 WS-MVMT-FND-BAL-AMT          PIC  X(13). 
              10 WS-FAR-FND-TRXN-AMT-SIGN     PIC  X(01).
              10 WS-FAR-FND-TRXN-AMT          PIC  X(13).
              10 WS-SURR-FND-TRXN-AMT-SIGN    PIC  X(01).
              10 WS-SURR-FND-TRXN-AMT         PIC  X(13).
              10 WS-DTH-FND-TRXN-AMT-SIGN     PIC  X(01).
              10 WS-DTH-FND-TRXN-AMT          PIC  X(13).
              10 WS-MAT-FND-TRXN-AMT-SIGN     PIC  X(01).  
              10 WS-MAT-FND-TRXN-AMT          PIC  X(13).  
              10 WS-OTHR-FND-TRXN-AMT-SIGN    PIC  X(01).
              10 WS-OTHR-FND-TRXN-AMT         PIC  X(13).
              10 WS-REINST-FND-TRXN-AMT-SIGN  PIC  X(01).
              10 WS-REINST-FND-TRXN-AMT       PIC  X(13).
              10 WS-FND-SWITCH-IND            PIC  X(01).
              10 WS-XPCT-SURR-CHRG-AMT-SIGN   PIC  X(01).
              10 WS-XPCT-SURR-CHRG-AMT        PIC  X(13).
              10 WS-MAT-DT-CALC-CD            PIC  X(01).  
              10 WS-LIFE-RSK-TYP-CD           PIC  X(01).
              10 WS-INIT-SA-TRNS-DT           PIC  X(10).
              10 WS-POL-FEE-AMT-SIGN          PIC  X(01).
              10 WS-POL-FEE-AMT               PIC  X(13).
              10 WS-ADV-PMT-ANNV-DT           PIC  X(10).
              10 WS-ADV-PMT-INT-AMT-SIGN      PIC  X(01).
              10 WS-ADV-PMT-INT-AMT           PIC  X(10).
              10 WS-LMPSM-DSCNT-AMT-SIGN      PIC  X(01).
              10 WS-LMPSM-DSCNT-AMT           PIC  X(10).
              10 WS-HYBRID-DSCNT-AMT-SIGN     PIC  X(01).
              10 WS-HYBRID-DSCNT-AMT          PIC  X(10).
              10 WS-CVG-LIEN-DUR              PIC  X(01).
              10 WS-ADJ-PERI-DEP-AMT          PIC  X(15).
              10 WS-APS-IND                   PIC  X(01).
              10 WS-PREV-FND-ID               PIC  X(05).
              10 WS-PREV-FND-UNITS-QTY-SIGN   PIC  X(01). 
              10 WS-PREV-FND-UNITS-QTY        PIC  9(11).9(04).
              10 WS-INT-CRED-RT               PIC  9(01).9(05).
              10 WS-POL-CRCY-CD               PIC  X(02).
              10 WS-PMT-CRCY-CD               PIC  X(02).
              10 WS-LNB-IND                   PIC  X(01).
              10 WS-POL-FRGN-CRCY-IND         PIC  X(01).
              10 WS-SSTD-AGE-ADD-DUR          PIC  9(02).
              10 WS-CSV-POL-VAL               PIC  X(15).
              10 WS-CSV-POL-VAL-N             REDEFINES      
                 WS-CSV-POL-VAL               PIC  9(13)V9(02).
              10 WS-MVA                       PIC  9(01).9(05).
              10 WS-XCHNG-RT                  PIC  9(05).
              10 WS-ACQ-COST-RT               PIC  9(09)V9(06).
              10 WS-MAINT-COST-RT             PIC  9(09)V9(06).
           05 WS-STD-DATA.  
              10 WS-STD-1-AMT                 PIC  X(05).
              10 WS-STD-2-AMT                 PIC  X(10).
           05 WS-ISS-STD-DATA. 
              10 WS-ISS-STD-1-AMT             PIC  X(02).
              10 WS-ISS-STD-2-AMT             PIC  X(13).
              
       01  WVCF-SEQ-IO-WORK-AREA.
           05  WVCF-SEQ-FILE-NAME          PIC X(04)
                                            VALUE 'VCF'.
           05  WVCF-SEQ-IO-COMMAND         PIC X(02).
           05  WVCF-SEQ-FILE-STATUS        PIC X(02).
           05  WVCF-SEQ-IO-STATUS          PIC 9(01).
               88  WVCF-SEQ-IO-OK          VALUE 0.
               88  WVCF-SEQ-IO-NOT-FOUND   VALUE 7.
               88  WVCF-SEQ-IO-EOF         VALUE 8.
               88  WVCF-SEQ-IO-ERROR       VALUE 9.

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
       COPY CCSRMVCF.
       COPY XCSWSEQ  REPLACING ==:ID:==  BY MVCF
                               ==':ID:'==  BY =='MVCF'==.
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
              UNTIL WVCF-SEQ-IO-EOF.

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

           MOVE ZERO                        TO WVCF-SEQ-IO-STATUS.

           OPEN INPUT VCF-DATA-FILE.

           IF WVCF-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM  9700-HANDLE-ERROR
                  THRU 9700-HANDLE-ERROR-X
           END-IF.

           PERFORM  MVCF-3000-OPEN-OUTPUT
               THRU MVCF-3000-OPEN-OUTPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------------
       1000-INIT-FOR-COMPANY.
      *----------------------

           MOVE 'CP'                        TO WGLOB-COMPANY-CODE.

           MOVE 'ZSBMMVCF'                  TO WGLOB-MAIN-PGM-ID
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
      * READ RECORD FROM INPUT FILE(VCF,NB88) ONE AT TIME
      * UNTIL END-OF FILE REACHED.
      *
           PERFORM  9500-VCF-READ
               THRU 9500-VCF-READ-X.
           IF NOT WVCF-SEQ-IO-OK
               GO TO 2000-PROCESS-TRANSACTIONS-X
           END-IF.

       2000-PROCESS-TRANSACTIONS-X.
           EXIT.
      /

      *---------------
       9500-VCF-READ.
      *---------------


           INITIALIZE WS-VCF-SEQ-REC-INFO.
           
           MOVE ZERO                        TO WVCF-SEQ-IO-STATUS.

           READ VCF-DATA-FILE
                AT END
                  MOVE 8                    TO WVCF-SEQ-IO-STATUS
                  GO TO 9500-VCF-READ-X.

           IF RVCF-SEQ-REC-INFO EQUAL HIGH-VALUES
              MOVE 8                        TO WVCF-SEQ-IO-STATUS
           END-IF.

           IF WVCF-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM  9700-HANDLE-ERROR
                  THRU 9700-HANDLE-ERROR-X
           END-IF.

           MOVE RVCF-POL-ID                TO WS-POL-ID.                    
           MOVE RVCF-CVG-NUM               TO WS-CVG-NUM.                  
           MOVE RVCF-CSTAT-CD              TO WS-CSTAT-CD.                  
           MOVE RVCF-ISS-PRCES-DT          TO WS-ISS-PRCES-DT.             
           MOVE RVCF-PLAN-ID               TO WS-PLAN-ID.                   
           MOVE RVCF-BILL-MODE-CD          TO WS-BILL-MODE-CD.              
           MOVE RVCF-BILL-TYP-CD           TO WS-BILL-TYP-CD.              
           MOVE RVCF-CLI-GR-TYP-CD         TO WS-CLI-GR-TYP-CD.             
           MOVE RVCF-SEX-CD                TO WS-SEX-CD.                    
           MOVE RVCF-RT-AGE                TO WS-RT-AGE.                    
           MOVE RVCF-INS-TYP-CD            TO WS-INS-TYP-CD.                
           MOVE	RVCF-MAT-XPRY-DT           TO WS-MAT-XPRY-DT.               
           MOVE	RVCF-UL-PU-DT              TO WS-UL-PU-DT.                  
           MOVE	RVCF-ISS-EFF-DT            TO WS-ISS-EFF-DT.                
           MOVE	RVCF-FACE-AMT-SIGN         TO WS-FACE-AMT-SIGN.             
           MOVE	RVCF-FACE-AMT              TO WS-FACE-AMT.                  
           MOVE	RVCF-BNFT-TYP-CD           TO WS-BNFT-TYP-CD.               
           MOVE	RVCF-CNVR-P-AMT-SIGN       TO WS-CNVR-P-AMT-SIGN.           
           MOVE	RVCF-CNVR-P-AMT            TO WS-CNVR-P-AMT.                
           MOVE	RVCF-SSTD-CNVR-P-AMT-SIGN  TO WS-SSTD-CNVR-P-AMT-SIGN.      
           MOVE	RVCF-SSTD-CNVR-P-AMT       TO WS-SSTD-CNVR-P-AMT.           
           MOVE	RVCF-SERV-BR-ID            TO WS-SERV-BR-ID.                
           MOVE	RVCF-STD-PREM-AMT-SIGN     TO WS-STD-PREM-AMT-SIGN. 
           MOVE '00000'                    TO WS-STD-1-AMT.
           MOVE	RVCF-STD-PREM-AMT          TO WS-STD-2-AMT.
           MOVE WS-STD-DATA                TO WS-STD-PREM-AMT.              
           MOVE	RVCF-PFEE-AMT-SIGN         TO WS-PFEE-AMT-SIGN.           
           MOVE	RVCF-PFEE-AMT              TO WS-PFEE-AMT.                              
           MOVE	RVCF-SSTD-PREM-AMT-SIGN    TO WS-SSTD-PREM-AMT-SIGN.        
           MOVE	RVCF-SSTD-PREM-AMT         TO WS-SSTD-PREM-AMT.             
           MOVE	RVCF-ME-AMT                TO WS-ME-AMT.                    
           MOVE	RVCF-REINS-IND             TO WS-REINS-IND.                 
           MOVE	RVCF-REINS-TRTY-NUM        TO WS-REINS-TRTY-NUM.            
           MOVE	RVCF-POL-CHNL-CD           TO WS-POL-CHNL-CD.               
           MOVE	RVCF-AGT-ID                TO WS-AGT-ID.                    
           MOVE	RVCF-CLI-CRNT-LOC-CD       TO WS-CLI-CRNT-LOC-CD.           
           MOVE	RVCF-SUB-STAT-CD           TO WS-SUB-STAT-CD.               
           MOVE	RVCF-ISS-DT-TYP-CD         TO WS-ISS-DT-TYP-CD.             
           MOVE	RVCF-PREV-STAT-CD          TO WS-PREV-STAT-CD.              
           MOVE	RVCF-STAT-CHNG-DT          TO WS-STAT-CHNG-DT.              
           MOVE	RVCF-ME-DUR                TO WS-ME-DUR.                    
           MOVE	RVCF-REINS-CO-ID           TO WS-REINS-CO-ID.               
           MOVE	RVCF-REINS-CED-PCT         TO WS-REINS-CED-PCT.             
           MOVE	RVCF-SERV-AGT-ID           TO WS-SERV-AGT-ID.               
           MOVE	RVCF-LIAB-STRT-DT          TO WS-LIAB-STRT-DT.              
           MOVE	RVCF-PDF-AMT-SIGN          TO WS-PDF-AMT-SIGN.              
           MOVE	RVCF-PDF-AMT               TO WS-PDF-AMT.                   
           MOVE	RVCF-PREM-SUSP-AMT-SIGN    TO WS-PREM-SUSP-AMT-SIGN.        
           MOVE	RVCF-PREM-SUSP-AMT         TO WS-PREM-SUSP-AMT.             
           MOVE	RVCF-CSV-AMT-SIGN          TO WS-CSV-AMT-SIGN.              
           MOVE	RVCF-CSV-AMT               TO WS-CSV-AMT.                   
           MOVE	RVCF-CVG-STBL-2-CD         TO WS-CVG-STBL-2-CD.                              
           MOVE	RVCF-CVG-STBL-3-CD         TO WS-CVG-STBL-3-CD.                                
           MOVE	RVCF-CVG-STBL-1-CD         TO WS-CVG-STBL-1-CD.             
           MOVE	RVCF-UNIT-VALU-AMT         TO WS-UNIT-VALU-AMT.             
           MOVE	RVCF-SMKR-CD               TO WS-SMKR-CD.                   
           MOVE	RVCF-ORIG-FACE-AMT-SIGN    TO WS-ORIG-FACE-AMT-SIGN.        
           MOVE	RVCF-ORIG-FACE-AMT         TO WS-ORIG-FACE-AMT.             
           MOVE	RVCF-CLI-ID                TO WS-CLI-ID.                    
           MOVE	RVCF-PROD-APP-TYP-CD       TO WS-PROD-APP-TYP-CD.           
           MOVE	RVCF-CVG-TOT-PREM-AMT-SIGN TO 
                                        WS-CVG-TOT-PREM-AMT-SIGN.     
           MOVE	RVCF-CVG-TOT-PREM-AMT      TO WS-CVG-TOT-PREM-AMT.          
           MOVE	RVCF-ACT-DPOS-AMT-SIGN     TO WS-ACT-DPOS-AMT-SIGN.                 
           MOVE	RVCF-ACT-DPOS-AMT          TO WS-ACT-DPOS-AMT.                        
           MOVE	RVCF-POL-PD-TO-DT-NUM      TO WS-POL-PD-TO-DT-NUM.          
           MOVE	RVCF-PREV-PD-TO-DT-NUM     TO WS-PREV-PD-TO-DT-NUM.         
           MOVE	RVCF-TRAD-PD-TO-DT-NUM     TO WS-TRAD-PD-TO-DT-NUM.         
           MOVE	RVCF-VCF-CREATE-DATE       TO WS-VCF-CREATE-DATE.           
           MOVE	RVCF-PREM-CHNG-DT          TO WS-PREM-CHNG-DT.              
           MOVE	RVCF-BASE-CVG-NUM          TO WS-BASE-CVG-NUM.              
           MOVE	RVCF-UWGDECN-DT            TO WS-UWGDECN-DT.                
           MOVE	RVCF-PREV-MAT-XPRY-DT      TO WS-PREV-MAT-XPRY-DT.          
           MOVE	RVCF-APP-RECV-DT           TO WS-APP-RECV-DT.               
           MOVE	RVCF-CWA-SUSP-AMT-SIGN     TO WS-CWA-SUSP-AMT-SIGN.         
           MOVE	RVCF-CWA-SUSP-AMT          TO WS-CWA-SUSP-AMT.              
           MOVE	RVCF-INIT-PREM-SUSP-AMT-SIGN 
                                            TO 
                                           WS-INIT-PREM-SUSP-AMT-SIGN.   
           MOVE	RVCF-INIT-PREM-SUSP-AMT    TO WS-INIT-PREM-SUSP-AMT.        
           MOVE	RVCF-ADV-PMT-TYP-CD        TO WS-ADV-PMT-TYP-CD.            
           MOVE	RVCF-ADV-PMT-DUR           TO WS-ADV-PMT-DUR.               
           MOVE	RVCF-ADV-PMT-DUR-N         TO WS-ADV-PMT-DUR-N.             
           MOVE	RVCF-ADV-PMT-DUR           TO WS-ADV-PMT-DUR.               
           MOVE	RVCF-ACRU-PDF-INT          TO WS-ACRU-PDF-INT.              
           MOVE	RVCF-UNEARN-PREM-AMT       TO WS-UNEARN-PREM-AMT.           
           MOVE	RVCF-ADV-PMT-DSCNT-AMT     TO WS-ADV-PMT-DSCNT-AMT.         
           MOVE	RVCF-PREV-ADV-PMT-TYP-CD   TO WS-PREV-ADV-PMT-TYP-CD.       
           MOVE	RVCF-PREV-ADV-PMT-STRT-DT  TO WS-PREV-ADV-PMT-STRT-DT.      
           MOVE	RVCF-PREV-ADV-PMT-EFF-DT   TO WS-PREV-ADV-PMT-EFF-DT.       
           MOVE	RVCF-PREV-ADV-PMT-DUR      TO WS-PREV-ADV-PMT-DUR.          
           MOVE	RVCF-PREV-ADV-PMT-DUR-N    TO WS-PREV-ADV-PMT-DUR-N.        
           MOVE	RVCF-PREV-ADV-PMT-DUR      TO WS-PREV-ADV-PMT-DUR.          
           MOVE	RVCF-ADV-PMT-DPOS-AMT      TO WS-ADV-PMT-DPOS-AMT.           
           MOVE	RVCF-LATST-ACTV-ID         TO WS-LATST-ACTV-ID.             
           MOVE	RVCF-LATST-ACTV-EFF-DT     TO WS-LATST-ACTV-EFF-DT.         
           MOVE	RVCF-PAYO-AMT              TO WS-PAYO-AMT.                  
           MOVE	RVCF-OVR-SHRT-PREM-AMT-SIGN 
                                            TO 
                                            WS-OVR-SHRT-PREM-AMT-SIGN.   
           MOVE	RVCF-OVR-SHRT-PREM-AMT     TO WS-OVR-SHRT-PREM-AMT.         
           MOVE	RVCF-INT-CAP-DT            TO WS-INT-CAP-DT.                
           MOVE	RVCF-PREV-UNEARN-PREM-AMT  TO WS-PREV-UNEARN-PREM-AMT.      
           MOVE	RVCF-APL-AMT               TO WS-APL-AMT.                   
           MOVE	RVCF-TOT-PAID-MED-BNFT-AMT TO WS-TOT-PAID-MED-BNFT-AMT.     
           MOVE	RVCF-NXT-SRVBEN-DT         TO WS-NXT-SRVBEN-DT.             
           MOVE	RVCF-SRVBEN-DUR-PAID-AMT   TO WS-SRVBEN-DUR-PAID-AMT.       
           MOVE	RVCF-CSV-STD-AMT           TO WS-CSV-STD-AMT.               
           MOVE	RVCF-CSV-SSTD-AMT          TO WS-CSV-SSTD-AMT.              
           MOVE	RVCF-ADV-PMT-RECV-DT       TO WS-ADV-PMT-RECV-DT.           
           MOVE	RVCF-ADV-PMT-PREPAY-FLAG   TO WS-ADV-PMT-PREPAY-FLAG.       
           MOVE	RVCF-CVG-STBL-4-CD         TO WS-CVG-STBL-4-CD.             
           MOVE	RVCF-INIT-PMT-TYP-CD       TO WS-INIT-PMT-TYP-CD.           
           MOVE	RVCF-PRES-CNVR-FACE-AMT-SIGN 
                                            TO 
                                         WS-PRES-CNVR-FACE-AMT-SIGN.   
           MOVE	RVCF-PRES-CNVR-FACE-AMT    TO WS-PRES-CNVR-FACE-AMT.        
           MOVE	RVCF-AVG-CNVR-FACE-AMT-SIGN
                                            TO 
                                           WS-AVG-CNVR-FACE-AMT-SIGN.    
           MOVE	RVCF-AVG-CNVR-FACE-AMT     TO WS-AVG-CNVR-FACE-AMT.         
           MOVE	RVCF-CVG-WP-IND            TO WS-CVG-WP-IND.                
           MOVE	RVCF-CVG-WP-PREM-AMT-SIGN  TO WS-CVG-WP-PREM-AMT-SIGN.      
           MOVE	RVCF-CVG-WP-PREM-AMT       TO WS-CVG-WP-PREM-AMT.           
           MOVE	RVCF-PREV-CVG-WP-PREM-AMT  TO WS-PREV-CVG-WP-PREM-AMT.      
           MOVE	RVCF-SSTD-WP-PREM-AMT      TO WS-SSTD-WP-PREM-AMT.           
           MOVE	RVCF-PREV-SSTD-WP-PREM-AMT TO 
                                            WS-PREV-SSTD-WP-PREM-AMT.     
           MOVE	RVCF-LATST-TOT-PREM-AMT-SIGN 
                                            TO 
                                            WS-LATST-TOT-PREM-AMT-SIGN.   
           MOVE	RVCF-LATST-TOT-PREM-AMT    TO WS-LATST-TOT-PREM-AMT.        
           MOVE	RVCF-LATST-SSTD-PREM-AMT-SIGN 
                                            TO 
                                         WS-LATST-SSTD-PREM-AMT-SIGN.        
           MOVE	RVCF-LATST-SSTD-PREM-AMT   TO WS-LATST-SSTD-PREM-AMT.               
           MOVE	RVCF-AGE-CALC-MTHD-CD      TO WS-AGE-CALC-MTHD-CD.          
           MOVE	RVCF-PACK-CVG-NUM          TO WS-PACK-CVG-NUM.              
           MOVE	RVCF-FND-BAL-AMT-SIGN      TO WS-FND-BAL-AMT-SIGN.          
           MOVE	RVCF-FND-BAL-AMT           TO WS-FND-BAL-AMT.               
           MOVE	RVCF-FND-UNIT-PRIC-AMT-SIGN
                                            TO 
                                          WS-FND-UNIT-PRIC-AMT-SIGN.    
           MOVE	RVCF-FND-UNIT-PRIC-AMT     TO  WS-FND-UNIT-PRIC-AMT.         
           MOVE	RVCF-FND-UNITS-QTY-SIGN    TO  WS-FND-UNITS-QTY-SIGN.        
           MOVE	RVCF-FND-UNITS-QTY         TO  WS-FND-UNITS-QTY.             
           MOVE	RVCF-FND-ID                TO  WS-FND-ID.                    
           MOVE	RVCF-ACQ-COST-AMT-SIGN     TO  WS-ACQ-COST-AMT-SIGN.         
           MOVE	RVCF-ACQ-COST-AMT          TO  WS-ACQ-COST-AMT.              
           MOVE	RVCF-MAINT-COST-AMT-SIGN   TO  WS-MAINT-COST-AMT-SIGN.       
           MOVE	RVCF-MAINT-COST-AMT        TO  WS-MAINT-COST-AMT.            
           MOVE	RVCF-SA-PREM-FEE-AMT-SIGN  TO  
                                              WS-SA-PREM-FEE-AMT-SIGN.      
           MOVE	RVCF-SA-PREM-FEE-AMT       TO  WS-SA-PREM-FEE-AMT.           
           MOVE	RVCF-INS-FEE-AMT-SIGN      TO  WS-INS-FEE-AMT-SIGN.          
           MOVE	RVCF-INS-FEE-AMT           TO WS-INS-FEE-AMT.               
           MOVE	RVCF-FND-SWITCH-XPNS-AMT-SIGN 
                                            TO 
                                        WS-FND-SWITCH-XPNS-AMT-SIGN.  
           MOVE	RVCF-FND-SWITCH-XPNS-AMT   TO WS-FND-SWITCH-XPNS-AMT.       
           MOVE	RVCF-RSK-PREM-AMT-SIGN     TO WS-RSK-PREM-AMT-SIGN.         
           MOVE	RVCF-RSK-PREM-AMT          TO WS-RSK-PREM-AMT.              
           MOVE	RVCF-SSTD-RSK-PREM-AMT-SIGN
                                            TO
                                         WS-SSTD-RSK-PREM-AMT-SIGN.    
           MOVE	RVCF-SSTD-RSK-PREM-AMT     TO WS-SSTD-RSK-PREM-AMT.         
           MOVE	RVCF-WP-COST-AMT-SIGN      TO WS-WP-COST-AMT-SIGN.          
           MOVE	RVCF-WP-COST-AMT           TO WS-WP-COST-AMT.               
           MOVE	RVCF-SA-XFER-IND           TO WS-SA-XFER-IND.               
           MOVE	RVCF-PREV-MO-STAT-CD       TO WS-PREV-MO-STAT-CD.           
           MOVE	RVCF-SURR-CHRG-AMT-SIGN    TO WS-SURR-CHRG-AMT-SIGN.        
           MOVE	RVCF-SURR-CHRG-AMT         TO WS-SURR-CHRG-AMT.             
           MOVE	RVCF-ISS-STD-PREM-AMT-SIGN TO 
                                          WS-ISS-STD-PREM-AMT-SIGN.
           MOVE '00'                        TO WS-ISS-STD-1-AMT.
           MOVE	RVCF-ISS-STD-PREM-AMT      TO WS-ISS-STD-2-AMT.
           MOVE WS-ISS-STD-DATA             TO WS-ISS-STD-PREM-AMT.           
           MOVE	RVCF-PREV-FND-BAL-AMT-SIGN TO
                                       WS-PREV-FND-BAL-AMT-SIGN.           
           MOVE	RVCF-PREV-FND-BAL-AMT      TO WS-PREV-FND-BAL-AMT.                  
           MOVE	RVCF-SA-DPOS-AMT-SIGN      TO WS-SA-DPOS-AMT-SIGN.          
           MOVE	RVCF-SA-DPOS-AMT           TO WS-SA-DPOS-AMT.               
           MOVE	RVCF-MVMT-FND-BAL-AMT-SIGN TO
                                          WS-MVMT-FND-BAL-AMT-SIGN.     
           MOVE	RVCF-MVMT-FND-BAL-AMT      TO WS-MVMT-FND-BAL-AMT.          
           MOVE	RVCF-FAR-FND-TRXN-AMT-SIGN TO 
                                          WS-FAR-FND-TRXN-AMT-SIGN.     
           MOVE	RVCF-FAR-FND-TRXN-AMT      TO WS-FAR-FND-TRXN-AMT.          
           MOVE	RVCF-SURR-FND-TRXN-AMT-SIGN 
                                            TO 
                                         WS-SURR-FND-TRXN-AMT-SIGN.    
           MOVE	RVCF-SURR-FND-TRXN-AMT      TO WS-SURR-FND-TRXN-AMT.         
           MOVE	RVCF-DTH-FND-TRXN-AMT-SIGN  TO
                                 WS-DTH-FND-TRXN-AMT-SIGN.     
           MOVE	RVCF-DTH-FND-TRXN-AMT       TO WS-DTH-FND-TRXN-AMT.          
           MOVE	RVCF-MAT-FND-TRXN-AMT-SIGN  TO 
                                       WS-MAT-FND-TRXN-AMT-SIGN.     
           MOVE	RVCF-MAT-FND-TRXN-AMT       TO WS-MAT-FND-TRXN-AMT.          
           MOVE	RVCF-OTHR-FND-TRXN-AMT-SIGN TO 
                                          WS-OTHR-FND-TRXN-AMT-SIGN.    
           MOVE	RVCF-OTHR-FND-TRXN-AMT      TO WS-OTHR-FND-TRXN-AMT.         
           MOVE	RVCF-REINST-FND-TRXN-AMT-SIGN 
                                             TO 
                                         WS-REINST-FND-TRXN-AMT-SIGN.  
           MOVE	RVCF-REINST-FND-TRXN-AMT    TO WS-REINST-FND-TRXN-AMT.       
           MOVE	RVCF-FND-SWITCH-IND         TO WS-FND-SWITCH-IND            
           MOVE	RVCF-XPCT-SURR-CHRG-AMT-SIGN 
                                             TO 
                                           WS-XPCT-SURR-CHRG-AMT-SIGN.   
           MOVE	RVCF-XPCT-SURR-CHRG-AMT     TO WS-XPCT-SURR-CHRG-AMT.        
           MOVE	RVCF-MAT-DT-CALC-CD         TO WS-MAT-DT-CALC-CD.            
           MOVE	RVCF-LIFE-RSK-TYP-CD        TO WS-LIFE-RSK-TYP-CD.           
           MOVE	RVCF-INIT-SA-TRNS-DT        TO WS-INIT-SA-TRNS-DT.           
           MOVE	RVCF-POL-FEE-AMT-SIGN       TO WS-POL-FEE-AMT-SIGN.          
           MOVE	RVCF-POL-FEE-AMT            TO WS-POL-FEE-AMT.               
           MOVE	RVCF-ADV-PMT-ANNV-DT        TO WS-ADV-PMT-ANNV-DT.           
           MOVE	RVCF-ADV-PMT-INT-AMT-SIGN   TO 
                                       WS-ADV-PMT-INT-AMT-SIGN.      
           MOVE	RVCF-ADV-PMT-INT-AMT        TO WS-ADV-PMT-INT-AMT.           
           MOVE	RVCF-LMPSM-DSCNT-AMT-SIGN   TO 
                                        WS-LMPSM-DSCNT-AMT-SIGN.      
           MOVE	RVCF-LMPSM-DSCNT-AMT        TO WS-LMPSM-DSCNT-AMT.           
           MOVE	RVCF-HYBRID-DSCNT-AMT-SIGN  TO 
                                          WS-HYBRID-DSCNT-AMT-SIGN.     
           MOVE	RVCF-HYBRID-DSCNT-AMT       TO WS-HYBRID-DSCNT-AMT.          
           MOVE	RVCF-CVG-LIEN-DUR           TO WS-CVG-LIEN-DUR.              
           MOVE	RVCF-ADJ-PERI-DEP-AMT       TO WS-ADJ-PERI-DEP-AMT.          
           MOVE	RVCF-APS-IND                TO WS-APS-IND.                   
           MOVE	RVCF-PREV-FND-ID            TO WS-PREV-FND-ID.               
           MOVE	RVCF-PREV-FND-UNITS-QTY-SIGN
                                             TO 
                                         WS-PREV-FND-UNITS-QTY-SIGN.   
           MOVE	RVCF-PREV-FND-UNITS-QTY     TO WS-PREV-FND-UNITS-QTY.        
						               
           MOVE ZERO                        TO WS-INT-CRED-RT.
           MOVE 'JP'                        TO WS-POL-CRCY-CD.
           MOVE 'JP'                        TO WS-PMT-CRCY-CD.
           MOVE SPACES                      TO WS-LNB-IND.
           MOVE 'N'                         TO WS-POL-FRGN-CRCY-IND.
           MOVE ZEROES                      TO WS-SSTD-AGE-ADD-DUR.
           MOVE ZEROES                      TO WS-CSV-POL-VAL-N.   
           MOVE ZEROES                      TO WS-MVA.
           MOVE ZEROES                      TO WS-XCHNG-RT.
           MOVE ZEROES                      TO WS-ACQ-COST-RT.
           MOVE ZEROES                      TO WS-MAINT-COST-RT.           
      *
      *  WRITE THE NEW FORMAT FILE IN THE PATH SPECIFIED IN THE PROC
      *
           MOVE WS-VCF-SEQ-REC-INFO         TO RMVCF-SEQ-REC-INFO.
           PERFORM  MVCF-1000-WRITE
               THRU MVCF-1000-WRITE-X.

       9500-VCF-READ-X.
           EXIT.

      *-----------------------
       9700-HANDLE-ERROR.
      *-----------------------

           MOVE WVCF-SEQ-FILE-NAME          TO WGLOB-TABLE-NAME.
           MOVE WVCF-SEQ-FILE-STATUS        TO WGLOB-SEQ-FILE-STATUS.
           MOVE WVCF-SEQ-IO-COMMAND         TO WGLOB-IO-COMMAND.
           PERFORM  0030-3000-QSAM-ERROR
               THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-ERROR-X.
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                        TO WVCF-SEQ-IO-STATUS.

           CLOSE VCF-DATA-FILE.

           IF WVCF-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM  9700-HANDLE-ERROR
                  THRU 9700-HANDLE-ERROR-X
           END-IF.

           PERFORM  MVCF-4000-CLOSE
               THRU MVCF-4000-CLOSE-X.

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
       COPY XCSLFILE REPLACING ==:ID:==  BY MVCF
                                     ==':PGM:'== BY =='CSRQMVCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY MVCF.
       COPY XCSASEQ  REPLACING ==:ID:==  BY MVCF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY MVCF.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCPL0030.
      *****************************************************************
      **                 END OF PROGRAM ZSBMMVCF                     **
      *****************************************************************
