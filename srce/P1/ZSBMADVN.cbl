      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. ZSBMADVN.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  ZSBMADVN                                         **
      **  REMARKS:  ADVANCE NOTICE EXTRACT                           **
      **                                                             **
      ** THIS PROGRAM GENERATES THE ADVANCE NOTICE EXTRACT FOR       **
      **      COVID-19                                               **
      **                                                             **
      **                                                             **
      **  DOMAIN :  PR                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
MP771C**  16JUN20  CTS    INITIAL DRAFT                              **
125741**  17JUL20  CTS    INCORRECT SETTING OF RIDER UPDATE FLAG     **
125756**  21JUL20  CTS    HEADER DESCRIPTION VALUE CHANGES           **
125754**  21JUL20  CTS    CHANGES FOR THE RECEIPT AMOUNT FROM TDH    **
125771**  24JUL20  CTS    CHANGES SHORTAGE AMOUNT FOR RENEWAL POLICY **
125759**  27JUL20  CTS    CHANGES FOR TRAD WITH POLICY PAID TO DATE  **
125767**  28JUL20  CTS    CHANGES FOR UL POLICY FUND AMOUNT          **
125779**  28JUL20  CTS    CHANGES FOR SPACES IN THE HEADER           **
125787**  29JUL20  CTS    CHANGES FOR PRECESION VALUES FOR MPREM AND **
125787**                  PREMIUM SUSPENSE AMOUNT                    **
125783**  30JUL20  CTS    CHANGES FOR RIDER RENEWAL DATE             **
125781**  30JUL20  CTS    CHANGES FOR USAGE OF TRAD PD TO POL PD DATE**
125792**  31JUL20  CTS    CHANGES FOR LAPSE START DATE DETERMINATION **
125836**  06AUG20  CTS    CHANGES FOR THE PREMIUM CHANGE DATE        **
125847**  11AUG20  CTS    CHANGES FOR FUND AMOUNT FOR UL PRODUCTS    **
127510**  07OCT20  CTS    CHANGES TO FIX NO OF DEPOSIT MONTHS AND    **
127510**                  PAYMENT DUE MONTH                          **
135503**  16JUN21  CTS    FIX FOR RIDER UPDATE FLAG FIELD            **
MP798C**  09AUG21  CTS    CHANGES DONE FOR NEW STATE EMERGENCY       **
MP798C**                  RELATED TO COVID-19                        **
UYS001**  01MAR21  CTS    CHANGES DONE FOR ETAB CHANGES              **
      *****************************************************************
      **********************
       ENVIRONMENT DIVISION.
      **********************

       CONFIGURATION SECTION.
      /


       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

      /

      ***************
       DATA DIVISION.
      ***************

       FILE SECTION.

      /
      ***************************
       WORKING-STORAGE SECTION.
      ***************************

       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMADVN'.

       COPY SQLCA.

       01  WS-WORK-AREA.
           05  WS-SUB                           PIC S9(8)  COMP.
           05  WS-SML-TYP-POL-ID.
               10 WS-SML-PROD-CD                PIC X(03).
               10 FILLER                        PIC X(01) VALUE '-'.
               10 WS-POL-ID                     PIC X(07).
           05  WS-CURR-MNTH-END-DT              PIC X(10).
           05  WS-PREV-MNTH-END-DT.
               10  WS-PREV-MNTH-END-DT-YY       PIC X(04).
               10  FILLER                       PIC X(01) VALUE '-'.
               10  WS-PREV-MNTH-END-DT-MM       PIC X(02).
               10  FILLER                       PIC X(01) VALUE '-'.
               10  WS-PREV-MNTH-END-DT-DY       PIC X(02).
           05  WS-DH-REC-IND                    PIC X(01).
                88  WS-DH-REC-YES               VALUE 'Y'.
                88  WS-DH-REC-NO                VALUE 'N'.
           05  WS-PREFECTURE                    PIC X(20).
           05  WS-CITY                          PIC X(20).
           05  WS-LRG-NGHBRHD                   PIC X(20).
           05  WS-ADDR-FIELD                    PIC X(60).
           05  WS-ADDR-ADDL-TXT-START           PIC X(60).
           05  WS-ADDR-ADDL-TXT-MORE            PIC X(12).
           05  WS-POL-ARNGMNT                   PIC X(06).
           05  WS-LAPS-GRACE-PER-DT             PIC X(10).
           05  WS-LAPS-SEMI-ANN-DT              PIC X(10).
           05  WS-LAPS-MTHLY-DT                 PIC X(10).
           05  WS-RSC-MTHLY-DT                  PIC X(10).
           05  WS-TMP-PRCES-DT1                 PIC X(10).
           05  WS-TMP-PRCES-DT2                 PIC X(10).
           05  WS-TMP-PRCES-DT3                 PIC X(10).
           05  WS-ISS-DT-AFTR-10Y               PIC X(10).
           05  WS-ISS-DT-AFTR-20Y               PIC X(10).
           05  WS-DEPO-MO-NUM                   PIC 9(03).
           05  WS-POL-HLDR-CLI-ID               PIC X(10).
           05  WS-CLI-SEX-CD                    PIC X(01).
               88 WS-CLI-SEX-MALE               VALUE '1'.
               88 WS-CLI-SEX-FEMALE             VALUE '2'.
           05  WS-FIXD-VALU-TXT1                PIC X(02).
           05  WS-NO-OF-COI-DED                 PIC 9(02).
           05  WS-COI-BEFR-UPDT-MO              PIC 9(02).
           05  WS-COI-AFTR-UPDT-MO              PIC 9(02).
           05  WS-MPREM-BEFR-UPDT-MO            PIC 9(02).
           05  WS-MPREM-AFTR-UPDT-MO            PIC 9(02).
           05  WS-FND-AMT                       PIC S9(13)V9(02)
                                                COMP-3.
           05  WS-BAL-AMT                       PIC S9(13)V9(02)
                                                COMP-3.
           05  WS-GRCE-PREM-SHRT-AMT            PIC S9(16).
           05  WS-UNPAID-MODE                   PIC 9(02).
           05  WS-FRGN-XCHNG-4-RT               PIC S9(9)V9(9) COMP-3.
           05  WS-NO-OF-MNTHS                   PIC 9(02).
           05  WS-CALC-SHRT-AMT-IND             PIC X(01).
               88 WS-CALC-SHRT-AMT-YES          VALUE 'Y'.
               88 WS-CALC-SHRT-AMT-NO           VALUE 'N'.
           05  WS-SEMI-ANNUL-IND                PIC X(01).
               88 WS-SEMI-ANNUL-YES             VALUE 'Y'.
               88 WS-SEMI-ANNUL-NO              VALUE 'N'.
           05  WS-AUTO-RENW-IND                 PIC X(01).
               88 WS-AUTO-RENW-YES              VALUE 'Y'.
               88 WS-AUTO-RENW-NO               VALUE 'N'.             
           05  WS-COI-AMT                       PIC S9(13)V9(02).
           05  WS-CELL-UPDT-DT                  PIC X(10).
           05  WS-CELL-CNTCT-ID-CD              PIC X(01).
           05  WS-CELL-CNTCT-ID-TXT             PIC X(14).
           05  WS-CELL-TEMP-CD                  PIC X(01).
           05  WS-TEMP-VALID-TXT                PIC X(14).
           05  WS-RECPT-DT                      PIC X(08).
           05  WS-UL-PD-TO-DT                   PIC X(10).
           05  WS-PRCES-DATE.
              10  WS-PRCES-DT-YY                PIC X(04).
              10  FILLER                        PIC X(01).
              10  WS-PRCES-DT-MM                PIC X(02).
              10  FILLER                        PIC X(01).
              10  WS-PRCES-DT-DD                PIC X(02).
           05  WS-CVG-PREM-CHNG-DT              PIC X(10).
           05  WS-NXT-ME-GRC-PRD-DT             PIC X(10).
           05  WS-CVG-MAT-XPRY-DT               PIC X(10).
           05  WS-CVG-UL-PAID-UP-DT             PIC X(10).
125754*    05  WS-RECPT-AMT                     PIC X(10).
125754     05  WS-RECPT-AMT                     PIC 9(10).
           05  WS-RDR-UPDT-IND                  PIC X(01).
               88  WS-RDR-UPDT-YES              VALUE 'Y'.
               88  WS-RDR-UPDT-NO               VALUE 'N'.
           05  WS-POSTAL-CODE                   PIC X(60).
           05  WS-BASE-POL-PMT-XPRY-DT          PIC X(10).
           05  WS-NEW-RENW-PREM-AMT             PIC 9(10).
           05  WS-TD-LAPS-DT                    PIC X(10).
           05  WS-RDR-UPDT-DT                   PIC X(10).
           05  WS-TD-RSC-DT.
               10  WS-TD-RSC-DT-YY              PIC X(04).
               10  FILLER                       PIC X(01).
               10  WS-TD-RSC-DT-MM              PIC X(02).
               10  FILLER                       PIC X(01).
               10  WS-TD-RSC-DT-DD              PIC X(02).
           05  WS-DB-SPACE-SPACE   VALUE X'20202020'   PIC X(04).
MP798C     05  WS-TRNS-PROJ-ID.
MP798C         10  WS-TRNS-PROJ-ID-1            PIC X(09).
MP798C         10  WS-TRNS-PROJ-ID-2            PIC X(01).

        01  WS-COMMON-DATA.
           05  WS-GRC-PRD-XPRY-DT               PIC X(10).
           05  WS-PMT-DUE-MM-1.
               10 WS-PMT-DUE-MM-1-1             PIC 9(02).
               10 WS-PMT-DUE-TXT-1-1            PIC X(02).
               10 WS-PMT-DUE-FXD-1-1            PIC X(02).
               10 WS-PMT-DUE-MM-1-2             PIC 9(02).
               10 WS-PMT-DUE-TXT-1-2            PIC X(02).
               10 WS-PMT-DUE-TXT-1              PIC X(02). 
           05  WS-PMT-DUE-MM-2.
               10 WS-PMT-DUE-MM-2-1             PIC 9(02).
               10 WS-PMT-DUE-TXT-2-1            PIC X(02).
               10 WS-PMT-DUE-FXD-2-1            PIC X(02).
               10 WS-PMT-DUE-MM-2-2             PIC 9(02).
               10 WS-PMT-DUE-TXT-2-2            PIC X(02).
               10 WS-PMT-DUE-TXT-2              PIC X(02).
           05  WS-PMT-DUE-MM-3.
               10 WS-PMT-DUE-MM-3-1             PIC 9(02).
               10 WS-PMT-DUE-TXT-3-1            PIC X(02).
               10 WS-PMT-DUE-TXT-3              PIC X(02).
           05  WS-LAPS-INFO-TXT-1               PIC X(20).
           05  WS-APL-INFO-TXT-2                PIC X(20).
           05  WS-CANCL-INFO-TXT-3              PIC X(20).
           05  WS-APS-INFO-TXT-4                PIC X(20).
125779     05  WS-DB-SPACE       VALUE X'8140' PIC X(02).
125779     05  WS-SB-SPACE-SPACE VALUE X'2020' PIC X(02).           

           
      * HEADER LINE FOR ADVANCE PAYMENT NOTICE
      
       01  WS-HEADER-LINE.		        
           05  WS-HDR-POL-HLDR-PSTL-CD          PIC X(60).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-OWNR-ADDR-INFO            PIC X(60).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-OWNR-ADDR-DEPT1           PIC X(60).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-OWNR-ADDR-DEPT2           PIC X(20).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-POL-OWNR-FULL-NM          PIC X(56).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-SML-TYP-POL-ID            PIC X(16).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-SHRT-PREM-AMT             PIC X(20).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-POL-HLDR-PHN-NUM          PIC X(14).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-PMT-DUE-MO                PIC X(20).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-DEPO-MO-NUM               PIC X(10).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-CHNG-INFO-TXT             PIC X(26).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-PMT-TYP-CD                PIC X(10).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-RATE                      PIC X(10).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-RT-BASE-DT                PIC X(14).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-UPDT-CMPLT-STAT           PIC X(28).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-POL-ARNGMNT               PIC X(10).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-COI-AMT                   PIC X(10).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-FND-BAL-AMT               PIC X(14).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-CC-ERR-SUSP-AMT           PIC X(18).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-BT-ERR-SUSP-AMT           PIC X(18).          
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-PD-ERR-SUSP-AMT           PIC X(18).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-MODAL-PREM-AMT            PIC X(14).
           05  FILLER                           PIC X(01) VALUE ','.
125756*    05  WS-HDR-OVR-SHT-PREM-SUSP-AMT     PIC X(42).
125756     05  WS-HDR-OVR-SHT-PREM-SUSP-AMT     PIC X(44).      
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-PREM-SUSP-AMT             PIC X(14).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-MISC-SUSP-AMT             PIC X(10).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-AFTR-UPDT-COI-AMT         PIC X(20).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-UPDT-MPREM-AMT            PIC X(26).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-DSASTR-CD                 PIC X(12).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-UL-SUNDRY-AMT             PIC X(22).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-UL-PD-TO-DT               PIC X(18).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-PMT-XPRY-DT               PIC X(18).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-RDR-UPDT-DT               PIC X(12).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-PREM-CHNG-DT              PIC X(14).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-CVG-MAT-XPRY-DT           PIC X(16).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-UL-PAID-UP-DT             PIC X(12).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-ISS-DT-AFTR-10Y           PIC X(16).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-ISS-DT-AFTR-20Y           PIC X(16).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-CNTRCT-CRCY-CD            PIC X(10).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-LST-RECPT-DT              PIC X(18).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-FNL-RECPT-AMT             PIC X(14).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-GRC-PRD-XPRY-DT           PIC X(20).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-HDR-GRC-STRT-DT               PIC X(12).           

       01  WS-DTL-REC-INFO.
           05  WS-DTL-POL-HLDR-PSTL-CD          PIC X(60).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-OWNR-ADDR-INFO            PIC X(60).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-OWNR-ADDR-DEPT1           PIC X(60).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-OWNR-ADDR-DEPT2           PIC X(12).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-POL-OWNR-FULL-NM          PIC X(56).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-SML-TYP-POL-ID            PIC X(11).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-SHRT-PREM-AMT             PIC 9(10).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-POL-HLDR-PHN-NUM          PIC X(14).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-PMT-DUE-MO                PIC X(20).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-DEPO-MO-NUM               PIC 9(03).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-CHNG-INFO-TXT             PIC X(20).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-PMT-TYP-CD                PIC X(06).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-RATE                      PIC ZZZZZZ9.99.
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-RT-BASE-DT                PIC X(08).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-UPDT-CMPLT-STAT           PIC X(02).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-POL-ARNGMNT               PIC X(06).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-COI-AMT                   PIC 9(10).
           05  FILLER                           PIC X(01) VALUE ','.
125767*    05  WS-DTL-FND-BAL-AMT               PIC 9(10).
125767     05  WS-DTL-FND-BAL-AMT               PIC -9(10).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-CC-ERR-SUSP-AMT           PIC 9(10).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-BT-ERR-SUSP-AMT           PIC 9(10).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-PD-ERR-SUSP-AMT           PIC 9(10).
           05  FILLER                           PIC X(01) VALUE ','.
125787*    05  WS-DTL-POL-MPREM-AMT             PIC 9(10).
125787     05  WS-DTL-POL-MPREM-AMT             PIC X(15).
           05  FILLER                           PIC X(01) VALUE ','.
125787*    05  WS-DTL-OVR-SHRT-PREM-SUSP-AMT    PIC 9(10).
125787     05  WS-DTL-OVR-SHRT-PREM-SUSP-AMT    PIC X(15).
           05  FILLER                           PIC X(01) VALUE ','.
125787*    05  WS-DTL-PREM-SUSP-AMT             PIC 9(10).
125787     05  WS-DTL-PREM-SUSP-AMT             PIC X(15).
           05  FILLER                           PIC X(01) VALUE ','.
125787*    05  WS-DTL-MISC-SUSP-AMT             PIC 9(10).
125787     05  WS-DTL-MISC-SUSP-AMT             PIC X(15).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-AFTR-UPDT-COI-AMT         PIC 9(10).
           05  FILLER                           PIC X(01) VALUE ','.
125787*    05  WS-DTL-UPDT-MODAL-PREM-AMT       PIC 9(10).
125787     05  WS-DTL-UPDT-MODAL-PREM-AMT       PIC X(15).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-DSASTR-CD                 PIC X(01).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-UL-SUNDRY-AMT             PIC 9(10).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-UL-PD-TO-DT               PIC X(08).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-PMT-XPRY-DT               PIC X(08).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-RDR-UPDT-DT               PIC X(08).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-PREM-CHNG-DT              PIC X(08).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-CVG-MAT-XPRY-DT           PIC X(08).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-UL-PAID-UP-DT             PIC X(08).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-ISS-DT-AFTR-10Y           PIC X(08).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-ISS-DT-AFTR-20Y           PIC X(08).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-CNTRCT-CRCY-CD            PIC X(02).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-LST-RECPT-DT              PIC X(08).
           05  FILLER                           PIC X(01) VALUE ','.
125787*    05  WS-DTL-FNL-RECPT-AMT             PIC 9(10).
125787     05  WS-DTL-FNL-RECPT-AMT             PIC X(15).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-GRC-PRD-XPRY-DT           PIC X(08).
           05  FILLER                           PIC X(01) VALUE ','.
           05  WS-DTL-GRC-STRT-DT               PIC X(08).

      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       COPY CCFHCVGS.
       COPY CCWL0010.
       COPY CCWWCCC.
       COPY CCWL0950.
       COPY CCWLPGA.
       COPY CCWL2430.
       COPY CCWL2435.
       COPY CCWLCRCV.
       COPY CCWWCVGS.
       COPY CCFRCVG.
       COPY CCFWCVG.
       COPY CCFRTRNS.
       COPY CCFWTRNS.
       COPY CCWWINDX.
       COPY XCWTFCMD.
       COPY XCWLDTLK.
       COPY XCWWHDG.
       COPY XCWWTIME.
       COPY XCWWWKDT.
       COPY CCWL2440.
       COPY XCWL1680.
       COPY CCWL0182.
       COPY XCWL1670.
       COPY XCWL0290.
       COPY XCWL0289.
       COPY CCWL0951.
       COPY CCWL9215.
       COPY CCWWPLAN.
       COPY CCWW9B65.
       COPY CCWL9B65.
       COPY CCWL9697.
       COPY XCWLPTR.
       COPY CCWL9C70.

      ****************************************************************
      *  TABLE LAYOUT & WORK AREAS FOR EXTRACT/REPORT TABLES         *
      ****************************************************************


      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
       COPY CCFWMAST.
       COPY CCFRMAST.
      /
       COPY CCFWPOL.
       COPY CCFRPOL.
      /
       COPY CCFWCLIC.
       COPY CCFRCLIC.
      /
       COPY CCFWCLIA.
       COPY CCFRCLIA.
      /
       COPY CCFWDH.
       COPY CCFRDH.
       COPY CCFWPH.
       COPY CCFRPH.
       COPY CCFWCLI.
       COPY CCFRCLI.
      /
       COPY CCFWCWAA.
       COPY CCFWCWAR.
       COPY CCFRCWAR.

       COPY CCFHPOL.
       COPY CCFREDIT.
       COPY CCFWEDIT.
      /
       COPY NCFWTTAB.
       COPY NCFRTTAB.
      /
       COPY XCFWDMAD.
       COPY XCFRDMAD.
      /
       COPY CCFWPNFO.
       COPY CCFRPNFO.
      /
UYS001 COPY CCFRETAB.
UYS001 COPY CCFWETAB.
       COPY XCSWPRT  REPLACING ==:ID:==  BY OCF
                               ==':ID:'==  BY =='OCF'==.
       COPY XCSROCF.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY ADVI
                               ==':ID:'==  BY =='ADVI'==.
       COPY ZCSRADVN.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY ADVN
                               ==':ID:'==  BY =='ADVN'==.
       COPY ZCSRADVI.
      /
       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
       COPY XCWL0040.
       COPY XCWL2490.
UYS001 COPY XCWL1660.
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
      /
      ********************
       PROCEDURE DIVISION.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------


           PERFORM  0100-OPEN-FILES
               THRU 0100-OPEN-FILES-X.


           PERFORM  1000-INITIALIZE-VALUES
               THRU 1000-INITIALIZE-VALUES-X.
           
           PERFORM  3000-PROCESS-EXTRACTS
               THRU 3000-PROCESS-EXTRACTS-X
              UNTIL WADVI-SEQ-IO-EOF.

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

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

           PERFORM  ADVI-1000-OPEN-INPUT
               THRU ADVI-1000-OPEN-INPUT-X.

           PERFORM  ADVN-3000-OPEN-OUTPUT
               THRU ADVN-3000-OPEN-OUTPUT-X.

       0100-OPEN-FILES-X.
           EXIT.
      /
      *-----------------------
       1000-INITIALIZE-VALUES.
      *-----------------------


      **   READ THE COMPANY CONTROL CARD

           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           PERFORM  2100-INIT-OCF-TITLES
               THRU 2100-INIT-OCF-TITLES-X.

           PERFORM  PGA-1000-BUILD-PARMS
               THRU PGA-1000-BUILD-PARMS-X.

           PERFORM  MAST-1000-READ
               THRU MAST-1000-READ-X.

           IF  WMAST-IO-OK
               MOVE RMAST-APPL-CTL-PRCES-DT TO WGLOB-PROCESS-DATE
           ELSE
      *    MSG: 'MASTER CONTROL RECORD (@1) NOT FOUND'
               MOVE WMAST-KEY               TO WGLOB-MSG-PARM (1)
               MOVE 'CS00000061'            TO WGLOB-MSG-REF-INFO
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X
           PERFORM  0030-5000-LOGIC-ERROR
               THRU 0030-5000-LOGIC-ERROR-X
           END-IF.

MP798C*  READ THE INPUT FILE
MP798C
MP798C     PERFORM  ADVI-1000-READ
MP798C         THRU ADVI-1000-READ-X.
MP798C
MP798C     IF NOT WADVI-SEQ-IO-OK
MP798C*    MSG:'INPUT FILE EMPTY - NO DATA TO PROCESS'
MP798C         MOVE  'ZSADVN0001'           TO  WGLOB-MSG-REF-INFO
MP798C     PERFORM  0260-1000-GENERATE-MESSAGE
MP798C         THRU 0260-1000-GENERATE-MESSAGE-X
MP798C         GO TO 1000-INITIALIZE-VALUES-X
MP798C     END-IF.
MP798C
      * CALCULATING GRACE PERIOD EXTENSION EXPIRY DATE AT FIRST TO USE
      * IN MULTIPLE PLACES IN THE MODULE

      * GRACE PERIOD EXTENSION EXPIRY DATE

MP798C*           MOVE 'GRCEPEREXP'                TO WTRNS-PROJ-ID.
MP798C     MOVE 'GRCEPER00'                 TO WS-TRNS-PROJ-ID-1.
MP798C     MOVE RADVI-DSASTR-CD             TO WS-TRNS-PROJ-ID-2.
MP798C     MOVE WS-TRNS-PROJ-ID             TO WTRNS-PROJ-ID.

           PERFORM  TRNS-1000-READ
               THRU TRNS-1000-READ-X.

           IF  WTRNS-IO-OK
               MOVE RTRNS-STRT-DT           TO WS-GRC-PRD-XPRY-DT
           ELSE
               MOVE WTRNS-KEY               TO WGLOB-MSG-PARM (1)
      *MSG:   'RECORD (@1) NOT FOUND'
               MOVE 'ZSADVN0005'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.
           
      *  RETRIEVE THE TEXT FOR PAYMENT DUE MONTH FEILD
      
           MOVE '00048'                     TO L2490-TXT-SRC-REF-ID.
           MOVE 'ZSBMADVN'                  TO L2490-TXT-SRC-ID.
           MOVE WGLOB-USER-LANG             TO L2490-TXT-LANG-CD .
      	   
           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
           
           MOVE L2490-TXT-STR-TXT 	    TO WS-PMT-DUE-TXT-1
                                               WS-PMT-DUE-TXT-2
                                               WS-PMT-DUE-TXT-3.
                                               
           MOVE '00049'                     TO L2490-TXT-SRC-REF-ID.
           MOVE 'ZSBMADVN'                  TO L2490-TXT-SRC-ID.
           MOVE WGLOB-USER-LANG             TO L2490-TXT-LANG-CD .
      	   
           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
           
           MOVE L2490-TXT-STR-TXT 	    TO WS-PMT-DUE-TXT-1-1
                                               WS-PMT-DUE-TXT-1-2
                                               WS-PMT-DUE-TXT-2-1
                                               WS-PMT-DUE-TXT-2-2
                                               WS-PMT-DUE-TXT-3-1.
                                               

           MOVE '00050'                     TO L2490-TXT-SRC-REF-ID.
           MOVE 'ZSBMADVN'                  TO L2490-TXT-SRC-ID.
           MOVE WGLOB-USER-LANG             TO L2490-TXT-LANG-CD.
      	   
           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
           
           MOVE L2490-TXT-STR-TXT 	    TO WS-PMT-DUE-FXD-2-1.

           MOVE '00051'                     TO L2490-TXT-SRC-REF-ID.
           MOVE 'ZSBMADVN'                  TO L2490-TXT-SRC-ID.
           MOVE WGLOB-USER-LANG             TO L2490-TXT-LANG-CD.
      	   
           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
           
           MOVE L2490-TXT-STR-TXT 	    TO WS-PMT-DUE-FXD-1-1.
					       
      *  RETRIEVE THE TEXT FOR CHANGE INFORMATION TEXT FEILD
      
           MOVE '00052'                     TO L2490-TXT-SRC-REF-ID.
           MOVE 'ZSBMADVN'                  TO L2490-TXT-SRC-ID.
           MOVE WGLOB-USER-LANG             TO L2490-TXT-LANG-CD .
      	   
           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
           
           MOVE L2490-TXT-STR-TXT 	    TO WS-LAPS-INFO-TXT-1.
                                               
           MOVE '00053'                     TO L2490-TXT-SRC-REF-ID.
           MOVE 'ZSBMADVN'                  TO L2490-TXT-SRC-ID.
           MOVE WGLOB-USER-LANG             TO L2490-TXT-LANG-CD .
      	   
           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
           
           MOVE L2490-TXT-STR-TXT 	    TO WS-APL-INFO-TXT-2.                                              

           MOVE '00054'                     TO L2490-TXT-SRC-REF-ID.
           MOVE 'ZSBMADVN'                  TO L2490-TXT-SRC-ID.
           MOVE WGLOB-USER-LANG             TO L2490-TXT-LANG-CD.
      	   
           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
           
           MOVE L2490-TXT-STR-TXT 	    TO WS-CANCL-INFO-TXT-3.

           MOVE '00055'                     TO L2490-TXT-SRC-REF-ID.
           MOVE 'ZSBMADVN'                  TO L2490-TXT-SRC-ID.
           MOVE WGLOB-USER-LANG             TO L2490-TXT-LANG-CD.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT 	    TO WS-APS-INFO-TXT-4.

      *  READ THE INPUT FILE
MP798C*
MP798C*    PERFORM  ADVI-1000-READ
MP798C*        THRU ADVI-1000-READ-X.
MP798C*
MP798C*    IF NOT WADVI-SEQ-IO-OK
      *    MSG:'INPUT FILE EMPTY - NO DATA TO PROCESS'
MP798C*        MOVE  'ZSADVN0001'           TO  WGLOB-MSG-REF-INFO
MP798C*    PERFORM  0260-1000-GENERATE-MESSAGE
MP798C*        THRU 0260-1000-GENERATE-MESSAGE-X
MP798C*        GO TO 1000-INITIALIZE-VALUES-X
MP798C*    END-IF.

           INITIALIZE WS-HEADER-LINE.
           
           MOVE SPACES                      TO RADVN-SEQ-REC-INFO.
              
      * WRITE HEADING IN THE EXTRACT 

           PERFORM  1200-PAGE-HEADING
               THRU 1200-PAGE-HEADING-X.
               
           MOVE WS-HEADER-LINE              TO RADVN-SEQ-REC-INFO.

           PERFORM  ADVN-1000-WRITE
               THRU ADVN-1000-WRITE-X.            


       1000-INITIALIZE-VALUES-X.
           EXIT.
      /
      *------------------
       1200-PAGE-HEADING.
      *------------------
      *
      *  POSTAL CODE
      
           MOVE WPGWS-CRNT-PGM-ID           TO L2490-TXT-SRC-ID.
           MOVE WGLOB-USER-LANG             TO L2490-TXT-LANG-CD.
           MOVE '00001'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-POL-HLDR-PSTL-CD.
           
      *  OWNER ADDRESS INFORMATION
      
           MOVE '00002'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-OWNR-ADDR-INFO.
           
      *  OWNER ADDRESS DEPARTMENT 
      
           MOVE '00003'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-OWNR-ADDR-DEPT1.
           
      *  OWNER ADDRESS DEPARTMENT 2
      
           MOVE '00004'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-OWNR-ADDR-DEPT2.
           
      *  OWNER FULL NAME           
           MOVE '00005'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-POL-OWNR-FULL-NM.
           
      *  SMALL TYPE/POLICY ID           
           MOVE '00006'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-SML-TYP-POL-ID.
           
      *  SHORTAGE AMOUNT     
           MOVE '00007'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-SHRT-PREM-AMT.
           
      *  PHONE NUMBER(SMS)           
           MOVE '00008'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-POL-HLDR-PHN-NUM.
           
      *  PAYMENT DUE MONTH DURING THE GRACE PERIOD           
           MOVE '00009'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-PMT-DUE-MO.
           
      *  NO. OF DEPOSIT MONTHS           
           MOVE '00010'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-DEPO-MO-NUM.
           
      *  CHANGE INFORMATION WHEN THERE IS NO PAYMENT           
           MOVE '00011'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-CHNG-INFO-TXT.
           
      *  PAYMENT MODE           
           MOVE '00012'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-PMT-TYP-CD.
           
      *  RATE           
           MOVE '00013'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-RATE.
           
      *  RATE BASE DATE           
           MOVE '00014'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-RT-BASE-DT.
           
      *  UPDATE/COMPLETION AVAILABILITY DURING GRACE PERIOD           
           MOVE '00015'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-UPDT-CMPLT-STAT.
           
      *  POLICY ARRANGEMENT           
           MOVE '00016'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-POL-ARNGMNT.
           
      *  COI           
           MOVE '00017'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-COI-AMT.
           
      *  FUND BALANCE
           MOVE '00018'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-FND-BAL-AMT.
           
      *  CC ERROR SUSPENSE           
           MOVE '00019'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-CC-ERR-SUSP-AMT.
           
      *  BT ERROR SUSPENSE           
           MOVE '00020'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-BT-ERR-SUSP-AMT.
           
      *  PD ERROR SUSPENSE           
           MOVE '00021'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-PD-ERR-SUSP-AMT.
           
      *  MODAL PREMIUM           
           MOVE '00022'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-MODAL-PREM-AMT.
           
      *  OVER/ SHORT PREMIUM SUSPENSE           
           MOVE '00023'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X. 
               
           MOVE L2490-TXT-STR-TXT           TO 
                                       WS-HDR-OVR-SHT-PREM-SUSP-AMT.
           
      *  PREMIUM SUSPENSE
           MOVE '00024'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-PREM-SUSP-AMT.
           
      *  MISCELLANEOUS SUSPENSE           
           MOVE '00025'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-MISC-SUSP-AMT.
           
      *  COI AFTER AUTOMATIC UPDATE OF RIDER           
           MOVE '00026'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-AFTR-UPDT-COI-AMT.
           
      *  MODAL PREMIUM AFTER AUTOMATIC UPDATE OF RIDER           
           MOVE '00027'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-UPDT-MPREM-AMT.
           
      *  DISASTER CODE           
           MOVE '00028'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-DSASTR-CD.
           
      *  SUNDRY PAYMENT AMOUNT FOR UL           
           MOVE '00029'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-UL-SUNDRY-AMT.
           
      *  PAID TO DATE           
           MOVE '00030'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-UL-PD-TO-DT.
           
      *  BASE POLICY PAYMENT EXPIRY DATE           
           MOVE '00031'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-PMT-XPRY-DT.
           
      *  RIDER UPDATE DATE           
           MOVE '00032'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-RDR-UPDT-DT.
           
      *  PREMIUM CHANGE DATE           
           MOVE '00033'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-PREM-CHNG-DT.
           
      *  COVERAGE MATURITY EXPIRY DATE           
           MOVE '00034'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-CVG-MAT-XPRY-DT.
           
      *  UL PAID-UP DATE           
           MOVE '00035'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-UL-PAID-UP-DT.
           
      *  ISSUE DATE AFTER 10 YEARS           
           MOVE '00036'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-ISS-DT-AFTR-10Y.
           
      *  ISSUE DATE AFTER 20 YEARS           
           MOVE '00037'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.    
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-ISS-DT-AFTR-20Y.
           
      *  CONTRACT CURRENCY           
           MOVE '00038'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X. 
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-CNTRCT-CRCY-CD.
           
      *  LAST RECEIPT DATE           
           MOVE '00039'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X. 
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-LST-RECPT-DT.
           
      *  FINAL RECEIPT AMOUNT           
           MOVE '00040'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X. 
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-FNL-RECPT-AMT.
           
      *  GRACE PERIOD EXTENSION EXPIRY DATE           
           MOVE '00041'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X. 
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-GRC-PRD-XPRY-DT.
           
      *  GRACE START DATE
           MOVE '00042'                     TO L2490-TXT-SRC-REF-ID.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X. 
               
           MOVE L2490-TXT-STR-TXT           TO WS-HDR-GRC-STRT-DT.
           
       1200-PAGE-HEADING-X.
           EXIT.
      /                  
      *---------------------
       2100-INIT-OCF-TITLES.
      *---------------------

      * SET UP THE TITLE/HEADING LINES FOR THE OCF REPORT

           MOVE ZERO                        TO L0040-ERROR-CNT.

      **   GET THE SYSTEM ID
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.
           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.

      *   GET THE PROGRAM DESCRIPTION
      
           MOVE 'ZSADVN0007'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-PROGRAM-DESC.

      *   GET THE 'RUN MESSAGES' MESSAGE TEXT
           MOVE 'ZSADVN0002'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-HDG-LINE-3.

           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.

       2100-INIT-OCF-TITLES-X.
           EXIT.
      /
      *---------------------
       3000-PROCESS-EXTRACTS.
      *---------------------

           INITIALIZE WS-WORK-AREA.

           INITIALIZE WS-DTL-REC-INFO.

      *    MSGS: NOW PROCESSING POLICY(@1)

           MOVE 'ZSADVN0003'                TO WGLOB-MSG-REF-INFO.
           MOVE RADVI-POL-ID                TO WGLOB-MSG-PARM (1).
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

           PERFORM  3100-GET-RECORD-DETAILS
               THRU 3100-GET-RECORD-DETAILS-X.

      *   INPUT FILE READ

           PERFORM  ADVI-1000-READ
               THRU ADVI-1000-READ-X.

       3000-PROCESS-EXTRACTS-X.
           EXIT.
      /
      *------------------------
       3100-GET-RECORD-DETAILS.
      *------------------------

      *    NOW POPULATING THE ORIGINAL POLICY ID DETAILS

           MOVE RADVI-POL-ID                TO WPOL-POL-ID.

           PERFORM  POL-1000-READ
               THRU POL-1000-READ-X.

           IF  WPOL-IO-NOT-FOUND
      *MSG : ' POLICY (@1) DOES NOT EXIST'
               MOVE WPOL-KEY                TO WGLOB-MSG-PARM(1)
               MOVE 'ZSADVN0004'            TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO  3100-GET-RECORD-DETAILS-X
           END-IF.


           PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
               THRU CVGS-1000-LOAD-CVGS-ARRAY-X.


      * GET POLICY HOLDER INFORMATION   - ADDRESS AND NAME


           PERFORM  3110-GET-POL-OWNR-DTLS
               THRU 3110-GET-POL-OWNR-DTLS-X.



      *  PHONE NUMBER (SMS)
      *  HOME, CELL PHONE, BUSINESS AND PAGER FROM TCLIC

           MOVE L2430-CLI-ID                TO WS-POL-HLDR-CLI-ID.

           MOVE WWKDT-ZERO-DT               TO WS-CELL-UPDT-DT.
           MOVE 0                           TO WS-CELL-CNTCT-ID-CD.
           MOVE SPACES                      TO WS-CELL-CNTCT-ID-TXT.

           MOVE  LOW-VALUES                 TO WCLIC-KEY.
           MOVE  WS-POL-HLDR-CLI-ID         TO WCLIC-CLI-ID.
           MOVE  HIGH-VALUES                TO WCLIC-ENDBR-KEY.
           MOVE  WS-POL-HLDR-CLI-ID         TO WCLIC-ENDBR-CLI-ID.

           PERFORM  CLIC-1000-BROWSE
               THRU CLIC-1000-BROWSE-X.

           PERFORM  CLIC-2000-READ-NEXT
               THRU CLIC-2000-READ-NEXT-X.

           PERFORM  3120-GET-CELL-DTLS
               THRU 3120-GET-CELL-DTLS-X
                  UNTIL WCLIC-IO-EOF.

           PERFORM  CLIC-3000-END-BROWSE
               THRU CLIC-3000-END-BROWSE-X.

           MOVE  WS-CELL-CNTCT-ID-TXT       TO WS-DTL-POL-HLDR-PHN-NUM.
           


      *SMALL TYPE / POLICY NUMBER

           MOVE RPOL-PLAN-ID                TO WTTAB-ETBL-VALU-ID.

           PERFORM  PRSM-1000-EDIT
	       THRU PRSM-1000-EDIT-X.

	   IF  WTTAB-IO-OK
	       MOVE RTTAB-TTBL-VALU-TXT     TO WS-SML-PROD-CD
	   ELSE
      *MSGS: SMALL PRODUCT CODE NOT FOUND FOR PLAN(@1)
               MOVE 'ZSADVN0006'            TO WGLOB-MSG-REF-INFO
               MOVE RPOL-PLAN-ID            TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               MOVE SPACES                  TO WS-SML-PROD-CD
           END-IF.


           MOVE RPOL-POL-ID                 TO WS-POL-ID.

           MOVE WS-SML-TYP-POL-ID           TO WS-DTL-SML-TYP-POL-ID.

      * PREMIUM CHANGE DATE
      * COVERAGE MATURITY EXPIRY DATE
      * UL PAID-UP DATE

           IF  RPOL-POL-INS-TYP-UL

               MOVE WWKDT-HIGH-DT           TO WS-CVG-PREM-CHNG-DT

               MOVE WWKDT-HIGH-DT           TO WS-CVG-MAT-XPRY-DT

               MOVE WWKDT-HIGH-DT           TO WS-CVG-UL-PAID-UP-DT

               PERFORM
               VARYING  WS-SUB FROM 1 BY 1
                  UNTIL WS-SUB > RPOL-POL-CVG-REC-CTR-N
                   IF  WCVGS-CVG-STAT-PREM-PAYING(WS-SUB)
                       IF  WCVGS-CVG-PREM-CHNG-DT (WS-SUB) <
                                              WS-CVG-PREM-CHNG-DT
                        AND WCVGS-CVG-PREM-CHNG-DT (WS-SUB) NOT =
                                                     WWKDT-ZERO-DT
                           MOVE WCVGS-CVG-PREM-CHNG-DT (WS-SUB)
                                            TO WS-CVG-PREM-CHNG-DT
                       END-IF
                       IF  WCVGS-CVG-UL-PU-DT (WS-SUB) <
                                               WS-CVG-UL-PAID-UP-DT
                       AND WCVGS-CVG-UL-PU-DT (WS-SUB) NOT =
                                                     WWKDT-ZERO-DT
                           MOVE WCVGS-CVG-UL-PU-DT (WS-SUB)
                                            TO WS-CVG-UL-PAID-UP-DT
                       END-IF
                       IF  WCVGS-CVG-MAT-XPRY-DT (WS-SUB) <
                                                WS-CVG-MAT-XPRY-DT
                       AND WCVGS-CVG-MAT-XPRY-DT (WS-SUB) NOT =
                                                     WWKDT-ZERO-DT
                           MOVE WCVGS-CVG-MAT-XPRY-DT(WS-SUB)
                                             TO WS-CVG-MAT-XPRY-DT
                       END-IF
                   END-IF
               END-PERFORM
               
125836*        MOVE WS-CVG-PREM-CHNG-DT         TO WS-PRCES-DATE

125836*        STRING WS-PRCES-DT-YY, WS-PRCES-DT-MM, WS-PRCES-DT-DD
125836*                   DELIMITED BY SIZE  INTO WS-DTL-PREM-CHNG-DT
               
               
125836         IF  WS-CVG-PREM-CHNG-DT NOT = WWKDT-HIGH-DT               
125836             MOVE WS-CVG-PREM-CHNG-DT TO WS-PRCES-DATE
125836
125836             STRING WS-PRCES-DT-YY, WS-PRCES-DT-MM, 
125836             WS-PRCES-DT-DD DELIMITED BY SIZE
125836                      INTO WS-DTL-PREM-CHNG-DT
125836         END-IF

               MOVE WS-CVG-MAT-XPRY-DT          TO WS-PRCES-DATE

               STRING WS-PRCES-DT-YY, WS-PRCES-DT-MM, WS-PRCES-DT-DD
                          DELIMITED BY SIZE  INTO WS-DTL-CVG-MAT-XPRY-DT

125836*        MOVE WS-CVG-UL-PAID-UP-DT        TO WS-PRCES-DATE

125836*        STRING WS-PRCES-DT-YY, WS-PRCES-DT-MM, WS-PRCES-DT-DD
125836*               DELIMITED BY SIZE  INTO WS-DTL-UL-PAID-UP-DT

125836         IF  WS-CVG-UL-PAID-UP-DT NOT = WWKDT-HIGH-DT               
125836             MOVE WS-CVG-UL-PAID-UP-DT TO WS-PRCES-DATE
125836
125836             STRING WS-PRCES-DT-YY, WS-PRCES-DT-MM, 
125836             WS-PRCES-DT-DD DELIMITED BY SIZE
125836                      INTO WS-DTL-UL-PAID-UP-DT
125836         END-IF
           END-IF.



           IF  RPOL-POL-INS-TYP-TRAD

               MOVE WWKDT-HIGH-DT           TO WS-CVG-PREM-CHNG-DT


               PERFORM
               VARYING  WS-SUB FROM 1 BY 1
                  UNTIL WS-SUB > RPOL-POL-CVG-REC-CTR-N
                   IF  WCVGS-CVG-STAT-PREM-PAYING(WS-SUB)
                       IF  WCVGS-CVG-PREM-CHNG-DT (WS-SUB) <
                                              WS-CVG-PREM-CHNG-DT
                        AND WCVGS-CVG-PREM-CHNG-DT (WS-SUB) NOT =
                                                     WWKDT-ZERO-DT
                        AND  WCVGS-CVG-PREM-CHNG-DT(WS-SUB) <
                        WCVGS-CVG-UL-PU-DT (RPOL-POL-BASE-CVG-NUM)
                           MOVE WCVGS-CVG-PREM-CHNG-DT (WS-SUB)
                                            TO WS-CVG-PREM-CHNG-DT
                       END-IF
                   END-IF
           END-IF.

125783     MOVE WWKDT-HIGH-DT               TO WS-BASE-POL-PMT-XPRY-DT.

      * BASE POLICY PAYMENT EXPIRY DATE

           IF  RPOL-POL-INS-TYP-TRAD
               IF  WCVGS-CVG-UL-PU-DT (RPOL-POL-BASE-CVG-NUM) NOT =
                                                     WWKDT-ZERO-DT
               AND NOT WCVGS-CVG-STBL-3-07-WL(RPOL-POL-BASE-CVG-NUM)
                   MOVE WCVGS-CVG-UL-PU-DT (RPOL-POL-BASE-CVG-NUM)
                                            TO L1680-INTERNAL-1
                   MOVE ZERO                TO L1680-NUMBER-OF-YEARS
                   MOVE ZERO                TO L1680-NUMBER-OF-MONTHS
                   MOVE 1                   TO L1680-NUMBER-OF-DAYS

                   PERFORM  1680-4000-SUB-YMD-FROM-DATE
                       THRU 1680-4000-SUB-YMD-FROM-DATE-X

	           MOVE L1680-INTERNAL-2        TO WS-PRCES-DATE
	                                       WS-BASE-POL-PMT-XPRY-DT

                  STRING WS-PRCES-DT-YY, WS-PRCES-DT-MM, WS-PRCES-DT-DD
                      DELIMITED BY SIZE  INTO WS-DTL-PMT-XPRY-DT
               END-IF
               IF  WCVGS-CVG-UL-PU-DT (RPOL-POL-BASE-CVG-NUM)  =
                                                     WWKDT-ZERO-DT 
                   MOVE WCVGS-CVG-MAT-XPRY-DT
                       (RPOL-POL-BASE-CVG-NUM)
                                            TO L1680-INTERNAL-1
                   MOVE ZERO                TO L1680-NUMBER-OF-YEARS
                   MOVE ZERO                TO L1680-NUMBER-OF-MONTHS
                   MOVE 1                   TO L1680-NUMBER-OF-DAYS

                   PERFORM  1680-4000-SUB-YMD-FROM-DATE
                       THRU 1680-4000-SUB-YMD-FROM-DATE-X

	           MOVE L1680-INTERNAL-2        TO WS-PRCES-DATE
	                                       WS-BASE-POL-PMT-XPRY-DT

                   STRING WS-PRCES-DT-YY, WS-PRCES-DT-MM, WS-PRCES-DT-DD
                      DELIMITED BY SIZE  INTO WS-DTL-PMT-XPRY-DT
               END-IF
           END-IF

      * RIDER UPDATE DATE

125741     MOVE WWKDT-HIGH-DT               TO WS-RDR-UPDT-DT.

           IF  WS-CVG-PREM-CHNG-DT NOT = WWKDT-HIGH-DT
           AND WCVGS-CVG-UL-PU-DT (RPOL-POL-BASE-CVG-NUM) NOT =
                                                WWKDT-ZERO-DT
           AND WS-CVG-PREM-CHNG-DT <
                            WCVGS-CVG-UL-PU-DT (RPOL-POL-BASE-CVG-NUM)
           AND  WS-CVG-PREM-CHNG-DT <> SPACES
               MOVE WS-CVG-PREM-CHNG-DT     TO WS-PRCES-DATE
                                               WS-RDR-UPDT-DT
               STRING WS-PRCES-DT-YY, WS-PRCES-DT-MM, WS-PRCES-DT-DD
                DELIMITED BY SIZE INTO WS-DTL-RDR-UPDT-DT
           END-IF.
           
      * PAID TO DATE

           EVALUATE TRUE

              WHEN RPOL-POL-INS-TYP-TRAD

                   MOVE RPOL-TRAD-PD-TO-DT-NUM
                                            TO WS-UL-PD-TO-DT
                                               WS-PRCES-DATE
              WHEN RPOL-POL-INS-TYP-UL

                   MOVE RPOL-POL-PD-TO-DT-NUM
                                            TO WS-UL-PD-TO-DT
                                               WS-PRCES-DATE
           END-EVALUATE.
           
           STRING WS-PRCES-DT-YY, WS-PRCES-DT-MM, WS-PRCES-DT-DD
            DELIMITED BY SIZE INTO WS-DTL-UL-PD-TO-DT.           
           

      * SHORTAGE PREMIUM

      * COI AFTER AUTOMATIC UPDATE OF RIDER

      * MODAL PREMIUM AFTER AUTOMATIC UPDATE OF RIDER
      * PAYMENT DUE MONTH DURING THE GRACE PERIOD
      * NO OF DEPOSIT MONTHS

           MOVE RPOL-REC-INFO           TO HPOL-REC-INFO.
           


           SET RPOL-POL-STAT-PREM-PAYING
                                            TO TRUE.

           PERFORM  9B65-1000-BUILD-PARM-INFO
               THRU 9B65-1000-BUILD-PARM-INFO-X.

           MOVE RPOL-POL-ID                TO L9B65-POL-ID.
           MOVE WS-CVG-PREM-CHNG-DT        TO L9B65-EFF-DT.

           MOVE WS-GRC-PRD-XPRY-DT          TO L1680-INTERNAL-1.
           MOVE 1                           TO L1680-INT-DD-1.
           MOVE ZERO                        TO L1680-NUMBER-OF-YEARS.
           MOVE 2                           TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                        TO L1680-NUMBER-OF-DAYS.

           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.

           MOVE L1680-INTERNAL-2            TO L1680-INTERNAL-1.
           MOVE ZERO                        TO L1680-NUMBER-OF-YEARS.
           MOVE ZERO                        TO L1680-NUMBER-OF-MONTHS.
           MOVE 1                           TO L1680-NUMBER-OF-DAYS.

           PERFORM  1680-4000-SUB-YMD-FROM-DATE
               THRU 1680-4000-SUB-YMD-FROM-DATE-X.

           MOVE L1680-INTERNAL-2            TO WS-NXT-ME-GRC-PRD-DT.
           
           IF  WS-CVG-PREM-CHNG-DT < WS-NXT-ME-GRC-PRD-DT
           AND WS-CVG-PREM-CHNG-DT <> SPACES
           AND WS-CVG-PREM-CHNG-DT <> WWKDT-HIGH-DT
               PERFORM  9B65-1000-CALC-DFLT
                   THRU 9B65-1000-CALC-DFLT-X
           END-IF.

           MOVE HPOL-REC-INFO           TO RPOL-REC-INFO


           EVALUATE TRUE

      * CHANGES FOR THE DISASTER GRACE PERIOD EXTENSION
      * FOR THE SHORTAGE AMOUNT CALCULATION FOR UL

               WHEN  RPOL-POL-INS-TYP-UL
                    PERFORM  3130-UL-SHRT-AMT-CALC
                        THRU 3130-UL-SHRT-AMT-CALC-X
      * CALCULATION OF DISASTER SHORTAGE AMOUNT
      * FOR TRAD PRODUCTS

               WHEN  RPOL-POL-INS-TYP-TRAD
               AND RPOL-PREM-CRCY-CD='JP'

                    PERFORM  3140-JPY-PREM-SHRT-AMT-CALC
                        THRU 3140-JPY-PREM-SHRT-AMT-CALC-X
      * CALCULATION OF DISASTER SHORTAGE AMOUNT
      * FOR FXWL AND FFF PRODUCTS

               WHEN  RPOL-POL-INS-TYP-TRAD
               AND RPOL-PREM-CRCY-CD <> 'JP'

                    PERFORM  3150-FRGN-PREM-SHRT-AMT-CALC
                        THRU 3150-FRGN-PREM-SHRT-AMT-CALC-X

           END-EVALUATE.

125787      COMPUTE L0290-INPUT-NUMBER = WS-NEW-RENW-PREM-AMT.
125787      MOVE 0                       TO L0290-PRECISION.
125787
125787      IF  RPOL-PREM-CRCY-CD <> 'JP'
125787          COMPUTE L0290-INPUT-NUMBER =
125787                            WS-NEW-RENW-PREM-AMT
125787                                         * 100
125787          MOVE 2                   TO L0290-PRECISION
125787      END-IF.
125787
125787      MOVE LENGTH OF WS-DTL-UPDT-MODAL-PREM-AMT
125787                                   TO L0290-MAX-OUT-LEN.
125787      PERFORM  0290-1000-NUMERIC-FORMAT
125787          THRU 0290-1000-NUMERIC-FORMAT-X.
125787      MOVE L0290-OUTPUT-DATA        TO 
125787                               WS-DTL-UPDT-MODAL-PREM-AMT.  
          
      
           IF  WGLOB-PROCESS-DATE > WS-GRC-PRD-XPRY-DT
127510*               MOVE WS-UL-PD-TO-DT       TO L1680-INTERNAL-1
127510*               MOVE WGLOB-PROCESS-DATE   TO WS-CURR-MNTH-END-DT 
127510         MOVE WGLOB-PROCESS-DATE      TO L1680-INTERNAL-1
127510                                            
127510         MOVE 31                      TO L1680-INT-DD-1
127510         MOVE ZERO                    TO L1680-NUMBER-OF-YEARS             
127510         MOVE ZERO                    TO L1680-NUMBER-OF-MONTHS              
127510         MOVE ZERO                    TO L1680-NUMBER-OF-DAYS              
127510            
127510         PERFORM  1680-3000-ADD-Y-M-D-TO-DATE              
127510             THRU 1680-3000-ADD-Y-M-D-TO-DATE              
127510            
127510         MOVE L1680-INTERNAL-2        TO WS-CURR-MNTH-END-DT  
127510
               IF  RPOL-POL-INS-TYP-TRAD
                   IF  WCVGS-CVG-UL-PU-DT
                      (RPOL-POL-BASE-CVG-NUM) < WS-CURR-MNTH-END-DT
                   AND WCVGS-CVG-UL-PU-DT(RPOL-POL-BASE-CVG-NUM)
                        NOT= WWKDT-ZERO-DT
            
                       MOVE WCVGS-CVG-UL-PU-DT
                        (RPOL-POL-BASE-CVG-NUM) TO L1680-INTERNAL-1
                       MOVE 01                TO L1680-INT-DD-1
                       MOVE ZERO              TO L1680-NUMBER-OF-YEARS
                       MOVE ZERO              TO L1680-NUMBER-OF-MONTHS
                       MOVE 1                 TO L1680-NUMBER-OF-DAYS
            
                       PERFORM  1680-4000-SUB-YMD-FROM-DATE
                           THRU 1680-4000-SUB-YMD-FROM-DATE-X
            
                       MOVE L1680-INTERNAL-2    TO WS-CURR-MNTH-END-DT
            
                   END-IF 
            
                   IF  WCVGS-CVG-MAT-XPRY-DT(RPOL-POL-BASE-CVG-NUM)
                        NOT= WWKDT-ZERO-DT
                   AND WCVGS-CVG-MAT-XPRY-DT(RPOL-POL-BASE-CVG-NUM)
                       < WS-CURR-MNTH-END-DT
            
                       MOVE WCVGS-CVG-MAT-XPRY-DT
                        (RPOL-POL-BASE-CVG-NUM) TO L1680-INTERNAL-1
                       MOVE ZERO               TO L1680-NUMBER-OF-YEARS
                       MOVE ZERO              TO L1680-NUMBER-OF-MONTHS
                       MOVE 1                  TO L1680-NUMBER-OF-DAYS
            
                       PERFORM  1680-4000-SUB-YMD-FROM-DATE
                           THRU 1680-4000-SUB-YMD-FROM-DATE-X
            
                       MOVE L1680-INTERNAL-2    TO WS-CURR-MNTH-END-DT
            
                   END-IF
               END-IF
127510         MOVE WS-UL-PD-TO-DT          TO L1680-INTERNAL-1
127510         MOVE 01                      TO L1680-INT-DD-1               
               MOVE WS-CURR-MNTH-END-DT   TO L1680-INTERNAL-2
127510         MOVE 01                      TO L1680-INT-DD-2               
               PERFORM  1680-2000-COMP-DAYS-BETWEEN
                   THRU 1680-2000-COMP-DAYS-BETWEEN-X
               COMPUTE WS-DTL-DEPO-MO-NUM = (L1680-NUMBER-OF-MONTHS) +
                                   ( L1680-NUMBER-OF-YEARS * 12 )
      
               IF  RPOL-POL-INS-TYP-TRAD
      
                   COMPUTE WS-DTL-DEPO-MO-NUM = WS-DTL-DEPO-MO-NUM /
                                           RPOL-POL-BILL-MODE-CD-N
                   COMPUTE WS-DTL-DEPO-MO-NUM = WS-DTL-DEPO-MO-NUM + 1
                   
                   EVALUATE TRUE
	         
                       WHEN RPOL-POL-BILL-MODE-MONTHLY
	         
                           PERFORM  3170-GET-PMT-DUE-MO
                               THRU 3170-GET-PMT-DUE-MO-X
	         
                       WHEN RPOL-POL-BILL-MODE-SEMI-ANN
                       AND WS-DTL-DEPO-MO-NUM > 1
	         
                           PERFORM  3173-GET-SEMI-ANN-DUE-MO
                               THRU 3173-GET-SEMI-ANN-DUE-MO-X
	         
                       WHEN (RPOL-POL-BILL-MODE-SEMI-ANN
                       OR  RPOL-POL-BILL-MODE-ANNUALLY)
                       AND WS-DTL-DEPO-MO-NUM = 1
	         
                           PERFORM  3175-GET-SEMI-ANNL-DUE-MO
                               THRU 3175-GET-SEMI-ANNL-DUE-MO-X
	         
                   END-EVALUATE
      
               ELSE
127510*                   COMPUTE WS-DTL-DEPO-MO-NUM = WS-DTL-DEPO-MO-NUM + 1
127510             COMPUTE WS-DTL-DEPO-MO-NUM = WS-DTL-DEPO-MO-NUM + 2
               END-IF
           END-IF.
      * CHANGE INFORMATION WHEN THERE IS NO PAYMENT

      * CALCULATE THE DATES TO GET GRACE PERIOD FOR POLICIES
           PERFORM  3190-CALC-LAPS-STRT-DT
               THRU 3190-CALC-LAPS-STRT-DT-X.


      * PAYMENT MODE

           MOVE RPOL-POL-BILL-MODE-CD       TO WDMAD-DM-AV-CD.
           MOVE 'BILL-MODE-CD'              TO WDMAD-DM-AV-TBL-CD.
           MOVE WGLOB-USER-LANG             TO
                                       WDMAD-DM-AV-DESC-LANG-CD.

           PERFORM  DMAD-1000-READ
               THRU DMAD-1000-READ-X.

           IF  WDMAD-IO-OK
               MOVE RDMAD-DM-AV-DESC-TXT    TO WS-DTL-PMT-TYP-CD
           END-IF.

      * ISSUE DATE AFTER 10 YEARS

           IF  RPOL-POL-INS-TYP-UL
               MOVE RPOL-POL-ISS-EFF-DT     TO L1680-INTERNAL-1
               MOVE 10                      TO L1680-NUMBER-OF-YEARS
               MOVE ZERO                    TO L1680-NUMBER-OF-MONTHS
               MOVE ZERO                    TO L1680-NUMBER-OF-DAYS
               PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
                   THRU 1680-3000-ADD-Y-M-D-TO-DATE
               MOVE L1680-INTERNAL-2        TO WS-PRCES-DATE
                                             WS-ISS-DT-AFTR-10Y

               STRING WS-PRCES-DT-YY, WS-PRCES-DT-MM, WS-PRCES-DT-DD
               DELIMITED BY SIZE          INTO WS-DTL-ISS-DT-AFTR-10Y

      * ISSUE DATE AFTER 20 YEARS

               MOVE RPOL-POL-ISS-EFF-DT     TO L1680-INTERNAL-1
               MOVE 20                      TO L1680-NUMBER-OF-YEARS
               MOVE ZERO                    TO L1680-NUMBER-OF-MONTHS
               MOVE ZERO                    TO L1680-NUMBER-OF-DAYS
               PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
                   THRU 1680-3000-ADD-Y-M-D-TO-DATE
               MOVE L1680-INTERNAL-2        TO WS-PRCES-DATE
                                               WS-ISS-DT-AFTR-20Y

               STRING WS-PRCES-DT-YY, WS-PRCES-DT-MM, WS-PRCES-DT-DD
               DELIMITED BY SIZE          INTO WS-DTL-ISS-DT-AFTR-20Y

           END-IF.


      * UPDATE/COMPLETION AVAILABILITY DURING GRACE PERIOD

           SET WS-RDR-UPDT-NO               TO TRUE.

           EVALUATE TRUE

               WHEN RPOL-POL-INS-TYP-TRAD
135503*                   IF  WS-BASE-POL-PMT-XPRY-DT <= WS-GRC-PRD-XPRY-DT
135503*                   OR  WS-RDR-UPDT-DT <= WS-GRC-PRD-XPRY-DT
135503             IF  WS-RDR-UPDT-DT <= WS-GRC-PRD-XPRY-DT
                       SET WS-RDR-UPDT-YES  TO TRUE
                   END-IF

               WHEN RPOL-POL-INS-TYP-UL
                   IF  WS-CVG-PREM-CHNG-DT <= WS-GRC-PRD-XPRY-DT
                   OR  WS-CVG-MAT-XPRY-DT <= WS-GRC-PRD-XPRY-DT
                   OR  WS-CVG-UL-PAID-UP-DT  <= WS-GRC-PRD-XPRY-DT
                   OR  (WS-ISS-DT-AFTR-10Y <= WS-GRC-PRD-XPRY-DT
                   AND WS-ISS-DT-AFTR-10Y >= RPOL-POL-PD-TO-DT-NUM)
                   OR  (WS-ISS-DT-AFTR-20Y <= WS-GRC-PRD-XPRY-DT
                   AND WS-ISS-DT-AFTR-20Y >= RPOL-POL-PD-TO-DT-NUM)
                       SET WS-RDR-UPDT-YES  TO TRUE
                   END-IF

           END-EVALUATE.

           IF  WS-RDR-UPDT-YES
               MOVE '00046'                 TO L2490-TXT-SRC-REF-ID
               MOVE 'ZSBMADVN'              TO L2490-TXT-SRC-ID
               MOVE WGLOB-USER-LANG         TO L2490-TXT-LANG-CD

               PERFORM  2490-1000-RETRIEVE-TEXT
                   THRU 2490-1000-RETRIEVE-TEXT-X

               MOVE L2490-TXT-STR-TXT 	    TO WS-DTL-UPDT-CMPLT-STAT
           ELSE
               MOVE '00047'                 TO L2490-TXT-SRC-REF-ID
               MOVE 'ZSBMADVN'              TO L2490-TXT-SRC-ID
               MOVE WGLOB-USER-LANG         TO L2490-TXT-LANG-CD

               PERFORM  2490-1000-RETRIEVE-TEXT
                   THRU 2490-1000-RETRIEVE-TEXT-X

               MOVE L2490-TXT-STR-TXT 	    TO WS-DTL-UPDT-CMPLT-STAT
           END-IF.
      * CC ERROR SUSPENSE AMOUNT

           MOVE RPOL-POL-CC-SUSP-AMT        TO WS-DTL-CC-ERR-SUSP-AMT.

      * BT ERROR SUSPENSE AMOUNT

           MOVE RPOL-POL-BT-SUSP-AMT        TO WS-DTL-BT-ERR-SUSP-AMT.

      * PD ERROR SUSPENSE AMOUNT

           MOVE RPOL-POL-PD-SUSP-AMT        TO WS-DTL-PD-ERR-SUSP-AMT.

      * MODAL PREMIUM

125787*    MOVE RPOL-POL-MPREM-AMT          TO WS-DTL-POL-MPREM-AMT.
125787     PERFORM  0290-1000-BUILD-PARM-INFO
125787         THRU 0290-1000-BUILD-PARM-INFO-X.
125787
125787     COMPUTE L0290-INPUT-NUMBER = RPOL-POL-MPREM-AMT.
125787     MOVE 0                           TO L0290-PRECISION.
125787
125787     IF  RPOL-PREM-CRCY-CD <> 'JP'
125787         COMPUTE L0290-INPUT-NUMBER = RPOL-POL-MPREM-AMT * 100
125787         MOVE 2                       TO L0290-PRECISION
125787     END-IF.
125787
125787     MOVE LENGTH OF WS-DTL-POL-MPREM-AMT
125787                                      TO L0290-MAX-OUT-LEN
125787     PERFORM  0290-1000-NUMERIC-FORMAT
125787         THRU 0290-1000-NUMERIC-FORMAT-X.
125787     MOVE L0290-OUTPUT-DATA           TO WS-DTL-POL-MPREM-AMT.

      * OVER/SHORT PREMIUM SUSPENSE AMOUNT

125787*  MOVE RPOL-OVR-SHRT-PREM-AMT      TO
125787*                                  WS-DTL-OVR-SHRT-PREM-SUSP-AMT.
125787     PERFORM  0290-1000-BUILD-PARM-INFO
125787         THRU 0290-1000-BUILD-PARM-INFO-X.
125787
125787     COMPUTE L0290-INPUT-NUMBER = RPOL-OVR-SHRT-PREM-AMT.
125787     MOVE 0                           TO L0290-PRECISION.
125787
125787     IF  RPOL-PREM-CRCY-CD <> 'JP'
125787         COMPUTE L0290-INPUT-NUMBER = RPOL-OVR-SHRT-PREM-AMT 
125787                                        * 100
125787         MOVE 2                       TO L0290-PRECISION
125787     END-IF.
125787
125787     MOVE LENGTH OF WS-DTL-OVR-SHRT-PREM-SUSP-AMT
125787                                      TO L0290-MAX-OUT-LEN
125787     PERFORM  0290-1000-NUMERIC-FORMAT
125787         THRU 0290-1000-NUMERIC-FORMAT-X.
125787     MOVE L0290-OUTPUT-DATA           TO 
125787                             WS-DTL-OVR-SHRT-PREM-SUSP-AMT.                                       

      * PREMIUM SUSPENSE

125787*    MOVE RPOL-POL-PREM-SUSP-AMT	    TO WS-DTL-PREM-SUSP-AMT.
125787     COMPUTE L0290-INPUT-NUMBER = RPOL-POL-PREM-SUSP-AMT.
125787     MOVE 0                           TO L0290-PRECISION.
125787
125787     IF  RPOL-PREM-CRCY-CD <> 'JP'
125787         COMPUTE L0290-INPUT-NUMBER = RPOL-POL-PREM-SUSP-AMT
125787                                          * 100
125787         MOVE 2                       TO L0290-PRECISION
125787     END-IF. 
125787
125787     MOVE LENGTH OF WS-DTL-PREM-SUSP-AMT
125787                                      TO L0290-MAX-OUT-LEN.
125787     PERFORM  0290-1000-NUMERIC-FORMAT
125787         THRU 0290-1000-NUMERIC-FORMAT-X.
125787     MOVE L0290-OUTPUT-DATA           TO WS-DTL-PREM-SUSP-AMT.
          

      * MISCELLANEOUS SUSPENSE

125787*    MOVE RPOL-POL-MISC-SUSP-AMT      TO WS-DTL-MISC-SUSP-AMT.
125787     COMPUTE L0290-INPUT-NUMBER = RPOL-POL-MISC-SUSP-AMT.
125787     MOVE 0                           TO L0290-PRECISION.
125787
125787     IF  RPOL-PREM-CRCY-CD <> 'JP'
125787         COMPUTE L0290-INPUT-NUMBER = RPOL-POL-MISC-SUSP-AMT
125787                                          * 100
125787         MOVE 2                       TO L0290-PRECISION
125787     END-IF. 
125787
125787     MOVE LENGTH OF WS-DTL-MISC-SUSP-AMT
125787                                      TO L0290-MAX-OUT-LEN.
125787     PERFORM  0290-1000-NUMERIC-FORMAT
125787         THRU 0290-1000-NUMERIC-FORMAT-X.
125787     MOVE L0290-OUTPUT-DATA           TO WS-DTL-MISC-SUSP-AMT.           

      * DISASTER CODE

           MOVE RPOL-DSASTR-CD              TO WS-DTL-DSASTR-CD.

      * SUNDRY PAYMENT AMOUNT FOR UL

           IF  RPOL-POL-INS-TYP-UL
               MOVE RPOL-POL-SNDRY-AMT      TO WS-DTL-UL-SUNDRY-AMT
           END-IF.    

      * CONTRACT CURRENCY

           MOVE RPOL-POL-CRCY-CD            TO WS-DTL-CNTRCT-CRCY-CD.

      * LAST RECEIPT DATE
      * FINAL RECEIPT AMOUNT
      
           IF  RPOL-POL-INS-TYP-TRAD
               PERFORM  3230-GET-DH-DTLS
                  THRU 3230-GET-DH-DTLS-X

               MOVE WS-RECPT-DT             TO WS-DTL-LST-RECPT-DT
125787*        MOVE WS-RECPT-AMT            TO WS-DTL-FNL-RECPT-AMT
125787     COMPUTE L0290-INPUT-NUMBER = WS-RECPT-AMT
125787     MOVE 0                           TO L0290-PRECISION
125787
125787         IF  RPOL-PREM-CRCY-CD <> 'JP'
125787             COMPUTE L0290-INPUT-NUMBER = WS-RECPT-AMT * 100
125787             MOVE 2                       TO L0290-PRECISION
125787         END-IF
125787
125787     MOVE LENGTH OF WS-DTL-FNL-RECPT-AMT
125787                                      TO L0290-MAX-OUT-LEN
125787     PERFORM  0290-1000-NUMERIC-FORMAT
125787         THRU 0290-1000-NUMERIC-FORMAT-X
125787     MOVE L0290-OUTPUT-DATA           TO WS-DTL-FNL-RECPT-AMT
           END-IF.  

      * GRACE PERIOD EXTENSION EXPIRY DATE

           MOVE WS-GRC-PRD-XPRY-DT          TO WS-PRCES-DATE.

           STRING WS-PRCES-DT-YY, WS-PRCES-DT-MM, WS-PRCES-DT-DD
           DELIMITED BY SIZE          INTO WS-DTL-GRC-PRD-XPRY-DT.



      * INITIALIZING THE PRODUCT SPECIFIC FIELDS
      * INITIAL VALUES ARE EXPLICITY SET HERE FOR BETTER CLARITY 
      *            
           IF  RPOL-POL-INS-TYP-TRAD
               MOVE SPACES                  TO WS-DTL-CVG-MAT-XPRY-DT
               				       WS-DTL-UL-PAID-UP-DT   
               				       WS-DTL-ISS-DT-AFTR-10Y
               				       WS-DTL-ISS-DT-AFTR-20Y 
               				       WS-DTL-GRC-STRT-DT   			       
               MOVE ZEROES                  TO WS-DTL-FND-BAL-AMT
               				       WS-DTL-COI-AMT   
               				       WS-DTL-UL-SUNDRY-AMT
           END-IF.
           
           IF  RPOL-POL-INS-TYP-UL
               MOVE SPACES                  TO WS-DTL-RT-BASE-DT
               				       WS-DTL-PMT-XPRY-DT  
               				       WS-DTL-RDR-UPDT-DT  
               				       WS-DTL-LST-RECPT-DT 
               MOVE ZEROES                  TO WS-DTL-RATE  
                                               WS-DTL-FNL-RECPT-AMT
           END-IF.    

           IF  WGLOB-PROCESS-DATE >
               WS-GRC-PRD-XPRY-DT
               INITIALIZE WS-DTL-SHRT-PREM-AMT
                    WS-DTL-UPDT-CMPLT-STAT
                    WS-DTL-CHNG-INFO-TXT
                    WS-DTL-AFTR-UPDT-COI-AMT
                    WS-DTL-UPDT-MODAL-PREM-AMT
                    WS-DTL-RDR-UPDT-DT
                    WS-DTL-PREM-CHNG-DT
                    WS-DTL-CVG-MAT-XPRY-DT
                    WS-DTL-UL-PAID-UP-DT  
                    WS-DTL-ISS-DT-AFTR-10Y
                    WS-DTL-ISS-DT-AFTR-20Y
                    WS-DTL-GRC-STRT-DT
           END-IF.
           
           MOVE WS-DTL-REC-INFO             TO RADVN-SEQ-REC-INFO.

           PERFORM  ADVN-1000-WRITE
               THRU ADVN-1000-WRITE-X.

       3100-GET-RECORD-DETAILS-X.
           EXIT.
      /
      *-----------------------
       3110-GET-POL-OWNR-DTLS.
      *-----------------------

           INITIALIZE I.

           PERFORM  2430-1000-BUILD-PARM-INFO
               THRU 2430-1000-BUILD-PARM-INFO-X.
      * GET POLICY HOLDER INFORMATION

           PERFORM  2430-2100-GET-OWNER
               THRU 2430-2100-GET-OWNER-X.


           MOVE '00045'                     TO L2490-TXT-SRC-REF-ID.
           MOVE 'ZSBMADVN'                  TO L2490-TXT-SRC-ID.
           MOVE WGLOB-USER-LANG             TO L2490-TXT-LANG-CD.

           PERFORM  2490-1000-RETRIEVE-TEXT
               THRU 2490-1000-RETRIEVE-TEXT-X.

           MOVE L2490-TXT-STR-TXT           TO WS-FIXD-VALU-TXT1.


           IF  L2430-RELATIONSHIP-FOUND
               MOVE L2430-CLI-ID            TO L2440-CLI-ID
               MOVE L2430-CLI-ADDR-TYP-CD   TO L2440-CLI-ADDR-TYP-CD

               STRING L2430-KJ-NM-COMPRESSED, '  ', 
               WS-FIXD-VALU-TXT1 DELIMITED BY WS-DB-SPACE-SPACE
               INTO WS-DTL-POL-OWNR-FULL-NM

125779         INSPECT WS-DTL-POL-OWNR-FULL-NM  REPLACING 
125779                   ALL WS-SB-SPACE-SPACE    BY WS-DB-SPACE
           END-IF.



           IF  L2440-CLI-ADDR-TYP-CD = 'PR'
               PERFORM  2440-1000-PRIMARY-ADDRESS
                   THRU 2440-1000-PRIMARY-ADDRESS-X
           END-IF.
           IF L2440-RETRN-OK
              MOVE L2440-CLI-PREFCT-TXT    TO WS-PREFECTURE
              MOVE L2440-CLI-CITY-NM-TXT   TO WS-CITY
              MOVE L2440-CLI-ADDR-LN-1-TXT TO WS-LRG-NGHBRHD
              MOVE L2440-CLI-ADDR-ADDL-TXT TO WS-ADDR-ADDL-TXT-START
              MOVE L2440-CLI-ADDL-TXT-MORE TO WS-ADDR-ADDL-TXT-MORE
              MOVE L2440-CLI-PSTL-CD       TO WS-POSTAL-CODE
           END-IF.

           MOVE SPACES                      TO WS-ADDR-FIELD.

           STRING WS-PREFECTURE, WS-CITY, WS-LRG-NGHBRHD
                  DELIMITED BY ' '  INTO WS-ADDR-FIELD.
           EVALUATE TRUE
               WHEN L2430-CLI-SEX-MALE
               WHEN L2430-CLI-SEX-FEMALE
                   MOVE '00043'         TO L2490-TXT-SRC-REF-ID
                   MOVE 'ZSBMADVN'      TO L2490-TXT-SRC-ID
                   MOVE WGLOB-USER-LANG TO L2490-TXT-LANG-CD

                   PERFORM  2490-1000-RETRIEVE-TEXT
                       THRU 2490-1000-RETRIEVE-TEXT-X

                   MOVE L2490-TXT-STR-TXT   TO WS-POL-ARNGMNT

               WHEN OTHER
                   MOVE '00044'         TO L2490-TXT-SRC-REF-ID
                   MOVE 'ZSBMADVN'      TO L2490-TXT-SRC-ID
                   MOVE WGLOB-USER-LANG TO L2490-TXT-LANG-CD

                   PERFORM  2490-1000-RETRIEVE-TEXT
                       THRU 2490-1000-RETRIEVE-TEXT-X

                   MOVE L2490-TXT-STR-TXT   TO WS-POL-ARNGMNT

           END-EVALUATE.
      * POSTAL CODE
      * OWNER ADDRESS INFORMATION
      * OWNER ADDRESS DEPARTMENT
      * OWNER ADDRESS DEPARTMENT 2
      * POLICY ARRANGEMENT

           MOVE WS-POSTAL-CODE              TO WS-DTL-POL-HLDR-PSTL-CD.

           MOVE WS-ADDR-FIELD		    TO WS-DTL-OWNR-ADDR-INFO.

           MOVE WS-ADDR-ADDL-TXT-START	    TO WS-DTL-OWNR-ADDR-DEPT1.

           MOVE WS-ADDR-ADDL-TXT-MORE 	    TO WS-DTL-OWNR-ADDR-DEPT2.

           MOVE WS-POL-ARNGMNT              TO WS-DTL-POL-ARNGMNT.

       3110-GET-POL-OWNR-DTLS-X.
           EXIT.
      /
      *-------------------
       3120-GET-CELL-DTLS.
      *-------------------
      *THE VALID MOBILE NUMER WILL HAVE '-','SPACES' AND FIRST
      * 3 CHARACTER CAN BE '090','080','070,'060' WHICH CAN BE
      * IN ANY CONTACT TYPE.
      *
          MOVE RCLIC-CLI-CNTCT-ID-TXT     TO WS-TEMP-VALID-TXT.
          INSPECT WS-TEMP-VALID-TXT REPLACING ALL '-' BY '0'.
          INSPECT WS-TEMP-VALID-TXT REPLACING ALL SPACES BY ZERO.

          IF  WS-TEMP-VALID-TXT IS NUMERIC
              CONTINUE
          ELSE
              PERFORM  CLIC-2000-READ-NEXT
                  THRU CLIC-2000-READ-NEXT-X
              GO TO 3120-GET-CELL-DTLS-X
          END-IF.

          IF  RCLIC-CLI-CNTCT-ID-TXT(1:3) = '090'
          OR  RCLIC-CLI-CNTCT-ID-TXT(1:3) = '080'
          OR  RCLIC-CLI-CNTCT-ID-TXT(1:3) = '070'
          OR  RCLIC-CLI-CNTCT-ID-TXT(1:3) = '060'
              PERFORM  3125-CHCK-CNTCT-DTLS
                  THRU 3125-CHCK-CNTCT-DTLS-X
          END-IF.

          PERFORM  CLIC-2000-READ-NEXT
              THRU CLIC-2000-READ-NEXT-X.

       3120-GET-CELL-DTLS-X.
           EXIT.
      /
      *--------------------
       3125-CHCK-CNTCT-DTLS.
      *--------------------
      *THE MOST RECENT UPDATE DATE CONTACT WILL BE CONSIDERED IN THE
      *CLIENT EXTRACT. THE PRIORTY ORDER WILL BE 'CP','HO','BU','EM','PG'
      * BASED ON THE CONTACT TYPE.
      *
           IF RCLIC-PREV-UPDT-DT < WS-CELL-UPDT-DT
              GO TO 3125-CHCK-CNTCT-DTLS-X
           END-IF.

           EVALUATE RCLIC-CLI-CNTCT-ID-CD
                WHEN  'CP'
                      MOVE '5'               TO WS-CELL-TEMP-CD
                WHEN  'HO'
                      MOVE '4'               TO WS-CELL-TEMP-CD
                WHEN  'BU'
                      MOVE '3'               TO WS-CELL-TEMP-CD
                WHEN  'EM'
                      MOVE '2'               TO WS-CELL-TEMP-CD
                WHEN  'PG'
                      MOVE '1'               TO WS-CELL-TEMP-CD
                WHEN OTHER
                      GO TO 3125-CHCK-CNTCT-DTLS-X
           END-EVALUATE.

           IF  RCLIC-PREV-UPDT-DT > WS-CELL-UPDT-DT
               MOVE RCLIC-PREV-UPDT-DT      TO WS-CELL-UPDT-DT
               MOVE WS-CELL-TEMP-CD         TO WS-CELL-CNTCT-ID-CD
               MOVE RCLIC-CLI-CNTCT-ID-TXT  TO WS-CELL-CNTCT-ID-TXT
               GO TO 3125-CHCK-CNTCT-DTLS-X
           END-IF.

           IF WS-CELL-TEMP-CD > WS-CELL-CNTCT-ID-CD
              MOVE RCLIC-CLI-CNTCT-ID-TXT  TO WS-CELL-CNTCT-ID-TXT
              MOVE WS-CELL-TEMP-CD         TO WS-CELL-CNTCT-ID-CD
           END-IF.

       3125-CHCK-CNTCT-DTLS-X.
           EXIT.
      /
      *----------------------
       3130-UL-SHRT-AMT-CALC.
      *----------------------
           MOVE ZEROS                       TO WS-FND-AMT.
           MOVE ZEROS                       TO WS-NO-OF-COI-DED.
           MOVE ZEROS                       TO WS-GRCE-PREM-SHRT-AMT.
           MOVE ZEROS                       TO WS-COI-AMT.

      * FUND AMOUNT
           IF  RPOL-UL-LAPS-STRT-DT <> WWKDT-ZERO-DT
               COMPUTE WS-FND-AMT = RPOL-POL-UL-SHRT-AMT * -1
           ELSE
               MOVE RPOL-REC-INFO           TO HPOL-REC-INFO


               SET RPOL-POL-STAT-PREM-PAYING
                                            TO TRUE

               PERFORM  0182-1000-BUILD-PARM-INFO
                   THRU 0182-1000-BUILD-PARM-INFO-X

               MOVE WGLOB-PROCESS-DATE      TO L0182-EFF-DT
               SET L0182-CALC-IF-TERMINATED TO TRUE

               PERFORM  0182-1000-CALC-CSV-POL
                   THRU 0182-1000-CALC-CSV-POL-X

               MOVE HPOL-REC-INFO           TO RPOL-REC-INFO


125847*        MOVE L0182-POL-ACUM-VALU-AMT TO WS-FND-AMT
125847         MOVE L0182-CVG-ACUM-VALU-AMT (RPOL-POL-BASE-CVG-NUM)
125847                                      TO WS-FND-AMT
           END-IF.


           MOVE RPOL-POL-PD-TO-DT-NUM       TO L1680-INTERNAL-1.
           MOVE WS-NXT-ME-GRC-PRD-DT        TO L1680-INTERNAL-2.

           PERFORM  1680-2000-COMP-DAYS-BETWEEN
               THRU 1680-2000-COMP-DAYS-BETWEEN-X.

           COMPUTE WS-NO-OF-COI-DED = ( L1680-NUMBER-OF-MONTHS ) +
                                   ( L1680-NUMBER-OF-YEARS * 12 ).

           COMPUTE WS-NO-OF-COI-DED = WS-NO-OF-COI-DED + 1.

           MOVE WS-NO-OF-COI-DED            TO WS-DTL-DEPO-MO-NUM.

           COMPUTE WS-COI-AMT = (RPOL-POL-MPREM-AMT /
                               RPOL-POL-BILL-MODE-CD-N).

      * CALCULATION OF GRACE PERIOD PREMIUM SHORTAGE AMOUNT
           COMPUTE WS-GRCE-PREM-SHRT-AMT =
               (WS-FND-AMT - (WS-COI-AMT * WS-NO-OF-COI-DED)+
                  (RPOL-POL-BT-SUSP-AMT + RPOL-POL-PD-SUSP-AMT +
                                RPOL-POL-CC-SUSP-AMT)).

      * TO CHECK AUTOMATIC RENEWAL OF UL RIDER

           SET WS-AUTO-RENW-NO           TO TRUE.

           IF  WS-CVG-PREM-CHNG-DT < WS-NXT-ME-GRC-PRD-DT
           AND WS-CVG-PREM-CHNG-DT <> SPACES
               SET WS-AUTO-RENW-YES         TO TRUE
               PERFORM  3165-POL-RENW-AMT
                   THRU 3165-POL-RENW-AMT-X
           END-IF.

           IF  WS-AUTO-RENW-YES
               MOVE RPOL-POL-PD-TO-DT-NUM   TO L1680-INTERNAL-1
               MOVE WS-CVG-PREM-CHNG-DT
                                            TO L1680-INTERNAL-2

               PERFORM  1680-2000-COMP-DAYS-BETWEEN
                   THRU 1680-2000-COMP-DAYS-BETWEEN-X

               COMPUTE WS-COI-BEFR-UPDT-MO = ( L1680-NUMBER-OF-MONTHS )
                                  + ( L1680-NUMBER-OF-YEARS * 12 )


125771*        MOVE WS-CVG-PREM-CHNG-DT     TO L1680-INTERNAL-1
125771*        MOVE ZERO                    TO L1680-NUMBER-OF-YEARS
125771*        MOVE 1                       TO L1680-NUMBER-OF-MONTHS
125771*        MOVE ZERO                    TO L1680-NUMBER-OF-DAYS
125771*
125771*        PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
125771*            THRU 1680-3000-ADD-Y-M-D-TO-DATE-X

125771*        MOVE WS-GRC-PRD-XPRY-DT      TO L1680-INTERNAL-1
125771         MOVE WS-NXT-ME-GRC-PRD-DT    TO L1680-INTERNAL-1
125771         MOVE WS-CVG-PREM-CHNG-DT     TO L1680-INTERNAL-2
125771
               PERFORM  1680-2000-COMP-DAYS-BETWEEN
                   THRU 1680-2000-COMP-DAYS-BETWEEN-X

               COMPUTE WS-COI-AFTR-UPDT-MO =
                                   ( L1680-NUMBER-OF-MONTHS ) +
                                   ( L1680-NUMBER-OF-YEARS * 12 )

               COMPUTE WS-COI-AFTR-UPDT-MO = WS-COI-AFTR-UPDT-MO + 1

125787*               MOVE WS-NEW-RENW-PREM-AMT    TO 
125787*                            WS-DTL-UPDT-MODAL-PREM-AMT

               
               COMPUTE WS-NEW-RENW-PREM-AMT = (WS-NEW-RENW-PREM-AMT /
                               RPOL-POL-BILL-MODE-CD-N)
               MOVE WS-NEW-RENW-PREM-AMT TO WS-DTL-AFTR-UPDT-COI-AMT

      * CALCULATION OF GRACE PERIOD PREMIUM SHORTAGE AMOUNT FOR UL
      * RENEWAL
               COMPUTE WS-GRCE-PREM-SHRT-AMT =
                  (WS-FND-AMT - ((WS-COI-AMT * WS-COI-BEFR-UPDT-MO)+
                  (WS-NEW-RENW-PREM-AMT * WS-COI-AFTR-UPDT-MO))+
                  (RPOL-POL-BT-SUSP-AMT + RPOL-POL-PD-SUSP-AMT +
                                RPOL-POL-CC-SUSP-AMT))
      	   END-IF.


           IF  WS-GRCE-PREM-SHRT-AMT > 0
               MOVE ZEROS                   TO WS-GRCE-PREM-SHRT-AMT
           END-IF.

           IF  WS-GRCE-PREM-SHRT-AMT < 0

               COMPUTE WS-GRCE-PREM-SHRT-AMT = (-1) *
                                        WS-GRCE-PREM-SHRT-AMT
           END-IF.

      * FOR TERMINATED POLICIES
           IF  RPOL-POL-STAT-TERMINATED
           AND NOT RPOL-POL-STAT-LAPSED
               MOVE ZEROS                   TO WS-GRCE-PREM-SHRT-AMT
           END-IF.

           MOVE WS-GRCE-PREM-SHRT-AMT       TO WS-DTL-SHRT-PREM-AMT.
      
      * GET PAYMENT DUE MONTH FOR UL
           PERFORM  3170-GET-PMT-DUE-MO
               THRU 3170-GET-PMT-DUE-MO-X.
               
      * FUND BALANCE
      * COI AMOUNT
      
           MOVE WS-FND-AMT                  TO WS-DTL-FND-BAL-AMT.

           MOVE WS-COI-AMT                  TO WS-DTL-COI-AMT.               

       3130-UL-SHRT-AMT-CALC-X.
           EXIT.
      /
      *---------------------------
       3140-JPY-PREM-SHRT-AMT-CALC.
      *---------------------------
           MOVE ZEROS                       TO WS-NO-OF-MNTHS.
           MOVE ZEROS                       TO WS-UNPAID-MODE.
           MOVE ZEROS                       TO WS-GRCE-PREM-SHRT-AMT.
           SET WS-CALC-SHRT-AMT-YES         TO TRUE.


           PERFORM  3160-MNTH-END-DT-CALC
               THRU 3160-MNTH-END-DT-CALC-X.
           
          IF  WS-CALC-SHRT-AMT-YES
               COMPUTE WS-GRCE-PREM-SHRT-AMT =
                (( RPOL-POL-MPREM-AMT * WS-UNPAID-MODE ) -
                (RPOL-POL-BT-SUSP-AMT + RPOL-POL-PD-SUSP-AMT +
125781          RPOL-POL-CC-SUSP-AMT) - RPOL-OVR-SHRT-PREM-AMT) 
125781*                 RPOL-POL-CC-SUSP-AMT) - RPOL-OVR-SHRT-PREM-AMT) -
125781*                 RPOL-POL-PREM-SUSP-AMT

          END-IF.
      * TO CHECK AUTOMATIC RENEWAL OF TRAD RIDER

           SET WS-AUTO-RENW-NO           TO TRUE.

           IF  WS-CVG-PREM-CHNG-DT < WS-GRC-PRD-XPRY-DT
           AND WS-CVG-PREM-CHNG-DT <> SPACES
               SET WS-AUTO-RENW-YES         TO TRUE
               PERFORM  3165-POL-RENW-AMT
                   THRU 3165-POL-RENW-AMT-X
           END-IF.
           
           
           IF  WS-AUTO-RENW-YES
125759*        MOVE RPOL-TRAD-PD-TO-DT-NUM  TO L1680-INTERNAL-1
125781*125759  MOVE RPOL-POL-PD-TO-DT-NUM   TO L1680-INTERNAL-1   
125781         MOVE RPOL-TRAD-PD-TO-DT-NUM  TO L1680-INTERNAL-1
               MOVE WS-CVG-PREM-CHNG-DT
                                            TO L1680-INTERNAL-2

               PERFORM  1680-2000-COMP-DAYS-BETWEEN
                   THRU 1680-2000-COMP-DAYS-BETWEEN-X

               COMPUTE WS-MPREM-BEFR-UPDT-MO =
                                   ( L1680-NUMBER-OF-MONTHS )
                                  + ( L1680-NUMBER-OF-YEARS * 12 )
                                  
               COMPUTE WS-MPREM-BEFR-UPDT-MO =
               WS-MPREM-BEFR-UPDT-MO /  RPOL-POL-BILL-MODE-CD-N

               MOVE WS-CVG-PREM-CHNG-DT     TO L1680-INTERNAL-1
               MOVE WS-GRC-PRD-XPRY-DT
                                           TO L1680-INTERNAL-2

               PERFORM  1680-2000-COMP-DAYS-BETWEEN
                   THRU 1680-2000-COMP-DAYS-BETWEEN-X

               COMPUTE WS-MPREM-AFTR-UPDT-MO =
                                   ( L1680-NUMBER-OF-MONTHS ) +
                                   ( L1680-NUMBER-OF-YEARS * 12 )

125787*              MOVE WS-NEW-RENW-PREM-AMT    TO 
125787*                            WS-DTL-UPDT-MODAL-PREM-AMT
                             
                               
               COMPUTE WS-MPREM-AFTR-UPDT-MO =
               WS-MPREM-AFTR-UPDT-MO /  RPOL-POL-BILL-MODE-CD-N

               COMPUTE WS-MPREM-AFTR-UPDT-MO =
                                     WS-MPREM-AFTR-UPDT-MO + 1
                                     
      * CALCULATION OF GRACE PERIOD PREMIUM SHORTAGE AMOUNT FOR TRAD
      * RENEWAL
               COMPUTE WS-GRCE-PREM-SHRT-AMT =
                ((( RPOL-POL-MPREM-AMT * WS-MPREM-BEFR-UPDT-MO ) +
                ( WS-NEW-RENW-PREM-AMT * WS-MPREM-AFTR-UPDT-MO ))
              - (RPOL-POL-BT-SUSP-AMT + RPOL-POL-PD-SUSP-AMT +
125781           RPOL-POL-CC-SUSP-AMT) - RPOL-OVR-SHRT-PREM-AMT)              
125781*                 RPOL-POL-CC-SUSP-AMT) - RPOL-OVR-SHRT-PREM-AMT) -
125781*                RPOL-POL-PREM-SUSP-AMT
      	   END-IF.



      * FOR TERMINATED POLICIES
           IF  RPOL-POL-STAT-TERMINATED
           AND NOT RPOL-POL-STAT-LAPSED
               MOVE ZEROS                   TO WS-GRCE-PREM-SHRT-AMT
           END-IF.


           IF  WS-GRCE-PREM-SHRT-AMT < 0
               MOVE ZEROS                   TO WS-GRCE-PREM-SHRT-AMT
           END-IF.
           
           MOVE WS-GRCE-PREM-SHRT-AMT       TO WS-DTL-SHRT-PREM-AMT.



           EVALUATE TRUE

               WHEN RPOL-POL-BILL-MODE-MONTHLY

                   PERFORM  3170-GET-PMT-DUE-MO
                       THRU 3170-GET-PMT-DUE-MO-X

               WHEN RPOL-POL-BILL-MODE-SEMI-ANN
               AND WS-DEPO-MO-NUM > 1

                   PERFORM  3173-GET-SEMI-ANN-DUE-MO
                       THRU 3173-GET-SEMI-ANN-DUE-MO-X

               WHEN (RPOL-POL-BILL-MODE-SEMI-ANN
               OR  RPOL-POL-BILL-MODE-ANNUALLY)
               AND WS-DEPO-MO-NUM = 1

                   PERFORM  3175-GET-SEMI-ANNL-DUE-MO
                       THRU 3175-GET-SEMI-ANNL-DUE-MO-X

           END-EVALUATE.

      * RATE
      * RATE BASE DATE

           MOVE ZEROES                      TO WS-DTL-RATE.           

           MOVE SPACES                      TO WS-PRCES-DATE.                  

       3140-JPY-PREM-SHRT-AMT-CALC-X.
           EXIT.
      /
      *----------------------------
       3150-FRGN-PREM-SHRT-AMT-CALC.
      *----------------------------

           MOVE WWKDT-ZERO-DT               TO WS-PREV-MNTH-END-DT.
           MOVE ZEROS                       TO WS-NO-OF-MNTHS.
           MOVE ZEROS                       TO WS-UNPAID-MODE.
           MOVE ZEROS                       TO WS-GRCE-PREM-SHRT-AMT.
           MOVE ZEROS                       TO WS-FRGN-XCHNG-4-RT.
      *CALCULATE FOREIGN CURRENCY PREMIUM AMOUNT
           PERFORM  CRCV-1000-BUILD-PARM
               THRU CRCV-1000-BUILD-PARM-X.

           MOVE WGLOB-PROCESS-DATE          TO L9215-INTERNAL-1.
           MOVE 01                          TO L9215-INT-DD-1.
           MOVE 01                          TO L9215-NUMBER-OF-DAYS.
           PERFORM  9215-1100-GET-PAST-BUS-DT
               THRU 9215-1100-GET-PAST-BUS-DT-X.

           IF  L9215-RETRN-OK
           MOVE L9215-INTERNAL-2            TO WS-PREV-MNTH-END-DT
           END-IF.

           MOVE RPOL-POL-MPREM-AMT          TO LCRCV-XCHNG-INPUT-AMT.
           MOVE WS-PREV-MNTH-END-DT         TO LCRCV-XCHNG-EFF-DT.
           MOVE RPOL-PREM-CRCY-CD           TO
                                 LCRCV-XCHNG-FROM-CRCY-CD.
           MOVE RPOL-PMT-CRCY-CD            TO LCRCV-XCHNG-TO-CRCY-CD.

           PERFORM  CRCV-2000-PAYOUT-CRCY-CNVR
               THRU CRCV-2000-PAYOUT-CRCY-CNVR-X.

           IF  LCRCV-RETRN-OK
           MOVE LCRCV-XCHNG-4-RT            TO WS-FRGN-XCHNG-4-RT
           END-IF.

           COMPUTE WS-GRCE-PREM-SHRT-AMT ROUNDED =
                      (RPOL-POL-MPREM-AMT * WS-FRGN-XCHNG-4-RT ).

           PERFORM  3160-MNTH-END-DT-CALC
               THRU 3160-MNTH-END-DT-CALC-X.

           COMPUTE WS-GRCE-PREM-SHRT-AMT =
                (WS-GRCE-PREM-SHRT-AMT * WS-UNPAID-MODE)

      * FOR TERMINATED POLICIES
           IF  RPOL-POL-STAT-TERMINATED
           AND NOT RPOL-POL-STAT-LAPSED
               MOVE ZEROS                   TO WS-GRCE-PREM-SHRT-AMT
           END-IF.

           MOVE WS-GRCE-PREM-SHRT-AMT       TO WS-DTL-SHRT-PREM-AMT.
 
           PERFORM  3170-GET-PMT-DUE-MO
               THRU 3170-GET-PMT-DUE-MO-X.              

      * RATE
      * RATE BASE DATE

           MOVE WS-FRGN-XCHNG-4-RT          TO WS-DTL-RATE.

           MOVE WS-PREV-MNTH-END-DT         TO WS-PRCES-DATE.
           
           STRING WS-PRCES-DT-YY, WS-PRCES-DT-MM, WS-PRCES-DT-DD
           DELIMITED BY SIZE              INTO WS-DTL-RT-BASE-DT.

       3150-FRGN-PREM-SHRT-AMT-CALC-X.
           EXIT.
      /
      *----------------------
       3160-MNTH-END-DT-CALC.
      *----------------------
      * CALCULATION FOR THE LAST DATE OF MONTH

           MOVE WS-GRC-PRD-XPRY-DT          TO WS-CURR-MNTH-END-DT.

           IF  WCVGS-CVG-UL-PU-DT
              (RPOL-POL-BASE-CVG-NUM) < WS-CURR-MNTH-END-DT
           AND WCVGS-CVG-UL-PU-DT(RPOL-POL-BASE-CVG-NUM)
                NOT= WWKDT-ZERO-DT

               MOVE WCVGS-CVG-UL-PU-DT
                (RPOL-POL-BASE-CVG-NUM)     TO L1680-INTERNAL-1
               MOVE 01                      TO L1680-INT-DD-1
               MOVE ZERO                    TO L1680-NUMBER-OF-YEARS
               MOVE ZERO                    TO L1680-NUMBER-OF-MONTHS
               MOVE 1                       TO L1680-NUMBER-OF-DAYS

               PERFORM  1680-4000-SUB-YMD-FROM-DATE
                   THRU 1680-4000-SUB-YMD-FROM-DATE-X

               MOVE L1680-INTERNAL-2        TO WS-CURR-MNTH-END-DT

           END-IF.

           IF  WCVGS-CVG-MAT-XPRY-DT(RPOL-POL-BASE-CVG-NUM)
                NOT= WWKDT-ZERO-DT
           AND WCVGS-CVG-MAT-XPRY-DT(RPOL-POL-BASE-CVG-NUM)
               < WS-CURR-MNTH-END-DT

               MOVE WCVGS-CVG-MAT-XPRY-DT
                (RPOL-POL-BASE-CVG-NUM)     TO L1680-INTERNAL-1
               MOVE ZERO                    TO L1680-NUMBER-OF-YEARS
               MOVE ZERO                    TO L1680-NUMBER-OF-MONTHS
               MOVE 1                       TO L1680-NUMBER-OF-DAYS

               PERFORM  1680-4000-SUB-YMD-FROM-DATE
                   THRU 1680-4000-SUB-YMD-FROM-DATE-X

               MOVE L1680-INTERNAL-2        TO WS-CURR-MNTH-END-DT

           END-IF.

125759*    IF  WS-CURR-MNTH-END-DT < RPOL-TRAD-PD-TO-DT-NUM
125781*125759     IF  WS-CURR-MNTH-END-DT < RPOL-POL-PD-TO-DT-NUM      
125781     IF  WS-CURR-MNTH-END-DT < RPOL-TRAD-PD-TO-DT-NUM
                SET WS-CALC-SHRT-AMT-NO     TO TRUE
           END-IF.

125759*    IF  WS-CURR-MNTH-END-DT >= RPOL-TRAD-PD-TO-DT-NUM
125781*125759     IF  WS-CURR-MNTH-END-DT >= RPOL-POL-PD-TO-DT-NUM
125781     IF  WS-CURR-MNTH-END-DT >= RPOL-TRAD-PD-TO-DT-NUM
               MOVE WS-CURR-MNTH-END-DT     TO L1680-INTERNAL-1
125759*        MOVE RPOL-TRAD-PD-TO-DT-NUM
125759*                                     TO L1680-INTERNAL-2
125781*125759         MOVE RPOL-POL-PD-TO-DT-NUM
125781*125759                                      TO L1680-INTERNAL-2
125781         MOVE RPOL-TRAD-PD-TO-DT-NUM
125781                                      TO L1680-INTERNAL-2
               MOVE 01                      TO L1680-INT-DD-2
               MOVE 01                      TO L1680-INT-DD-1

               PERFORM  1680-2000-COMP-DAYS-BETWEEN
                   THRU 1680-2000-COMP-DAYS-BETWEEN-X

               COMPUTE WS-NO-OF-MNTHS = ( L1680-NUMBER-OF-MONTHS ) +
                                   ( L1680-NUMBER-OF-YEARS * 12 )
               COMPUTE WS-UNPAID-MODE = (WS-NO-OF-MNTHS /
                                  RPOL-POL-BILL-MODE-CD-N)

               COMPUTE WS-UNPAID-MODE = WS-UNPAID-MODE + 1
               
125781*125759*        MOVE WS-UNPAID-MODE          TO WS-DEPO-MO-NUM

125781*125759*        MOVE WS-DEPO-MO-NUM          TO WS-DTL-DEPO-MO-NUM
125781         MOVE WS-UNPAID-MODE          TO WS-DEPO-MO-NUM
125781         MOVE WS-DEPO-MO-NUM          TO WS-DTL-DEPO-MO-NUM
           END-IF.               

125781*125759     IF  WS-CURR-MNTH-END-DT >= RPOL-TRAD-PD-TO-DT-NUM
125781*125759         MOVE WS-CURR-MNTH-END-DT     TO L1680-INTERNAL-1
125781*125759         MOVE RPOL-TRAD-PD-TO-DT-NUM
125781*125759                                      TO L1680-INTERNAL-2
125781*125759         MOVE 01                      TO L1680-INT-DD-2
125781*125759         MOVE 01                      TO L1680-INT-DD-1
125781*125759
125781*125759         PERFORM  1680-2000-COMP-DAYS-BETWEEN
125781*125759             THRU 1680-2000-COMP-DAYS-BETWEEN-X
125781*125759
125781*125759         COMPUTE WS-NO-OF-MNTHS = ( L1680-NUMBER-OF-MONTHS ) +
125781*125759                             ( L1680-NUMBER-OF-YEARS * 12 )
125781*125759         COMPUTE WS-NO-OF-MNTHS = (WS-NO-OF-MNTHS /
125781*125759                            RPOL-POL-BILL-MODE-CD-N)
125781*125759
125781*125759         COMPUTE WS-NO-OF-MNTHS = WS-NO-OF-MNTHS + 1
125781*125759
125781*125759         MOVE WS-NO-OF-MNTHS         TO WS-DEPO-MO-NUM
125781*125759         MOVE WS-DEPO-MO-NUM         TO WS-DTL-DEPO-MO-NUM
125781*125759     END-IF.               



       3160-MNTH-END-DT-CALC-X.
           EXIT.
      /
      *-----------------
       3165-POL-RENW-AMT.
      *-----------------
 
           MOVE ZEROES TO WS-NEW-RENW-PREM-AMT.
           PERFORM
           VARYING  WS-SUB FROM 1 BY 1
              UNTIL WS-SUB > RPOL-POL-CVG-REC-CTR-N
               COMPUTE WS-NEW-RENW-PREM-AMT = WS-NEW-RENW-PREM-AMT +
                           L9B65-RENW-MPREM-AMT-T(WS-SUB)
           END-PERFORM.
           
       3165-POL-RENW-AMT-X.
           EXIT.
      /
      *--------------------
       3170-GET-PMT-DUE-MO.
      *--------------------

           MOVE WS-UL-PD-TO-DT(6:2)         TO WS-PMT-DUE-MM-1-1.
         
           IF  RPOL-POL-INS-TYP-UL
               MOVE WS-NXT-ME-GRC-PRD-DT(6:2) TO WS-PMT-DUE-MM-1-2
               IF  WGLOB-PROCESS-DATE > WS-GRC-PRD-XPRY-DT
127510             MOVE WGLOB-PROCESS-DATE      TO L1680-INTERNAL-1
127510                                            
127510             MOVE ZERO                TO L1680-NUMBER-OF-YEARS             
127510             MOVE 01                  TO L1680-NUMBER-OF-MONTHS              
127510             MOVE ZERO                TO L1680-NUMBER-OF-DAYS              
127510            
127510             PERFORM  1680-3000-ADD-Y-M-D-TO-DATE              
127510                 THRU 1680-3000-ADD-Y-M-D-TO-DATE              
127510            
127510*                   MOVE WGLOB-PROCESS-DATE-MO TO WS-PMT-DUE-MM-1-2
127510             MOVE L1680-INT-MM-2      TO WS-PMT-DUE-MM-1-2                 
                    
               END-IF             
           END-IF.

           IF  RPOL-POL-INS-TYP-TRAD
               MOVE WS-CURR-MNTH-END-DT(6:2) TO WS-PMT-DUE-MM-1-2
           END-IF.
           
           MOVE WS-PMT-DUE-MM-1             TO WS-DTL-PMT-DUE-MO.

       3170-GET-PMT-DUE-MO-X.

           EXIT.
      /
      *------------------------
       3173-GET-SEMI-ANN-DUE-MO.
      *------------------------

           MOVE WS-UL-PD-TO-DT(6:2)         TO WS-PMT-DUE-MM-2-1.


           MOVE WS-UL-PD-TO-DT              TO L1680-INTERNAL-1.
           MOVE ZERO                        TO L1680-NUMBER-OF-YEARS.
           MOVE 6                           TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                        TO L1680-NUMBER-OF-DAYS.

           PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
               THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
               
           MOVE L1680-INT-MM-2              TO WS-PMT-DUE-MM-2-2
           
           MOVE WS-PMT-DUE-MM-2             TO WS-DTL-PMT-DUE-MO.

       3173-GET-SEMI-ANN-DUE-MO-X.

           EXIT.
      /
      *--------------------------
       3175-GET-SEMI-ANNL-DUE-MO.
      *--------------------------

           MOVE WS-UL-PD-TO-DT(6:2)         TO WS-PMT-DUE-MM-3-1.

           MOVE WS-PMT-DUE-MM-3             TO WS-DTL-PMT-DUE-MO.

       3175-GET-SEMI-ANNL-DUE-MO-X.
           EXIT.
      /
      *---------------------
       3190-CALC-LAPS-STRT-DT.
      *---------------------

           MOVE RPOL-REC-INFO           TO HPOL-REC-INFO.
           
           SET RPOL-POL-STAT-PREM-PAYING
                                            TO TRUE.
                                            
           IF  RPOL-POL-INS-TYP-TRAD
           
               PERFORM  9C70-1000-BUILD-PARM-INFO
                   THRU 9C70-1000-BUILD-PARM-INFO-X
	       
               MOVE RPOL-TRAD-PD-TO-DT-NUM  TO
                                              L9C70-PROJ-TRAD-PD-TO-DT
               PERFORM  9C70-4000-TD-LAPS-DT
                   THRU 9C70-4000-TD-LAPS-DT-X
	       
               IF NOT L9C70-RETRN-OK
                   GO TO 3190-CALC-LAPS-STRT-DT-X
               END-IF

               MOVE L9C70-TD-LAPS-DT        TO WS-TD-LAPS-DT
               
           END-IF.    

           IF  RPOL-POL-INS-TYP-UL              
               MOVE WCVGS-PLAN-ID (RPOL-POL-BASE-CVG-NUM)
                                        TO WPH-PLAN-ID      
               PERFORM  PH-1000-READ
                   THRU PH-1000-READ-X
                
                MOVE RPOL-POL-PD-TO-DT-NUM
                                        TO L1680-INTERNAL-1
                IF  RPOL-UL-LAPS-STRT-DT <> WWKDT-ZERO-DT
                    MOVE RPOL-UL-LAPS-STRT-DT
                                        TO L1680-INTERNAL-1
               ELSE
                   MOVE ZEROES          TO WS-BAL-AMT
                   MOVE WS-FND-AMT      TO WS-BAL-AMT
125792             MOVE 1               TO WS-SUB                  
                   PERFORM 
                     VARYING WS-SUB FROM 1 BY 1
                         UNTIL WS-SUB > 6
                         OR  WS-BAL-AMT < 0
125792                   OR  WS-BAL-AMT <  WS-COI-AMT

                          COMPUTE WS-BAL-AMT =
                                   WS-BAL-AMT
                                  - WS-COI-AMT
                   END-PERFORM
                   
                   MOVE RPOL-POL-PD-TO-DT-NUM 
                                         TO L1680-INTERNAL-1
                   MOVE ZERO             TO L1680-NUMBER-OF-YEARS
                   COMPUTE L1680-NUMBER-OF-MONTHS
                                         = WS-SUB - 1
                   MOVE ZERO             TO L1680-NUMBER-OF-DAYS
                  
                   PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
                       THRU 1680-3000-ADD-Y-M-D-TO-DATE-X
                  
                   MOVE L1680-INTERNAL-2        TO L1680-INTERNAL-1


                END-IF

      * GRACE START DATE

               MOVE L1680-INTERNAL-1           TO WS-PRCES-DATE

               STRING WS-PRCES-DT-YY, WS-PRCES-DT-MM, WS-PRCES-DT-DD
               DELIMITED BY SIZE          INTO WS-DTL-GRC-STRT-DT
               
                MOVE ZEROES             TO L1680-NUMBER-OF-YEARS
                MOVE RPH-NF-PRCES-MO-DUR
                                        TO L1680-NUMBER-OF-MONTHS
                MOVE ZEROES             TO L1680-NUMBER-OF-DAYS

                PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
                    THRU 1680-3000-ADD-Y-M-D-TO-DATE-X

                MOVE L1680-INTERNAL-2   TO WS-TD-LAPS-DT
           END-IF.

125792     MOVE  WS-TD-LAPS-DT              TO L1680-INTERNAL-1.
125792     MOVE ZEROES                      TO L1680-NUMBER-OF-YEARS.
125792     MOVE +1                          TO L1680-NUMBER-OF-DAYS.
125792     MOVE ZEROES                      TO L1680-NUMBER-OF-MONTHS.
125792
125792     PERFORM  1680-4000-SUB-YMD-FROM-DATE
125792         THRU 1680-4000-SUB-YMD-FROM-DATE-X.
125792
125792     MOVE  L1680-INTERNAL-2           TO WS-TD-LAPS-DT.

           EVALUATE TRUE

               WHEN  RPOL-POL-NFO-OTHER
               AND WS-TD-LAPS-DT <= WS-GRC-PRD-XPRY-DT
                   MOVE WS-LAPS-INFO-TXT-1  TO WS-DTL-CHNG-INFO-TXT

               WHEN RPOL-POL-NFO-APL
               AND WS-TD-LAPS-DT <= WS-GRC-PRD-XPRY-DT
                   MOVE WS-APL-INFO-TXT-2  TO WS-DTL-CHNG-INFO-TXT

               WHEN  RPOL-POL-NFO-APS
                   PERFORM  9697-1000-BUILD-PARM-INFO
                       THRU 9697-1000-BUILD-PARM-INFO-X
                   MOVE WGLOB-PROCESS-DATE          TO L9697-EFF-DT
                   PERFORM  9697-2000-CHK-APS-VALUE
                       THRU 9697-2000-CHK-APS-VALUE-X
                    IF   L9697-APS-ALLOW-YES
                         MOVE WS-APS-INFO-TXT-4     TO
                                            WS-DTL-CHNG-INFO-TXT

                    ELSE
                         MOVE WS-LAPS-INFO-TXT-1  TO 
                            WS-DTL-CHNG-INFO-TXT
                    END-IF

               WHEN RPOL-PROD-APP-TYP-FFF

                   MOVE WCVGS-PLAN-ID (RPOL-POL-BASE-CVG-NUM)
                                            TO WPH-PLAN-ID      
                   PERFORM  PH-1000-READ
                       THRU PH-1000-READ-X
                    MOVE RPOL-TRAD-PD-TO-DT-NUM
                                            TO L1680-INTERNAL-1
                    MOVE ZEROES             TO L1680-NUMBER-OF-YEARS
                    MOVE RPH-NF-PRCES-MO-DUR
                                            TO L1680-NUMBER-OF-MONTHS
                    MOVE ZEROES             TO L1680-NUMBER-OF-DAYS

                    PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
                        THRU 1680-3000-ADD-Y-M-D-TO-DATE-X

                    MOVE L1680-INTERNAL-2   TO WS-TD-RSC-DT
                    
                    MOVE '01'               TO WS-TD-RSC-DT-DD
125792             MOVE  WS-TD-RSC-DT       TO L1680-INTERNAL-1
125792             MOVE ZEROES              TO L1680-NUMBER-OF-YEARS
125792             MOVE +1                  TO L1680-NUMBER-OF-DAYS
125792             MOVE ZEROES              TO L1680-NUMBER-OF-MONTHS
125792	          
125792             PERFORM  1680-4000-SUB-YMD-FROM-DATE
125792                 THRU 1680-4000-SUB-YMD-FROM-DATE-X
125792	          
125792             MOVE  L1680-INTERNAL-2    TO WS-TD-RSC-DT

                    IF  WS-TD-RSC-DT <= WS-GRC-PRD-XPRY-DT
                    	MOVE WS-CANCL-INFO-TXT-3
                    	                    TO WS-DTL-CHNG-INFO-TXT
                    END-IF

           END-EVALUATE.

           MOVE HPOL-REC-INFO           TO RPOL-REC-INFO.
       
       3190-CALC-LAPS-STRT-DT-X.
           EXIT.
      *-------------------
       3200-CALC-UL-DATES.
      *-------------------
      * CALCULATE THE GRACE PERIOD FOR UL POLICIES.

           MOVE RPOL-POL-PD-TO-DT-NUM       TO L1680-INTERNAL-1.
           MOVE 2                           TO L1680-NUMBER-OF-MONTHS.
           MOVE ZERO                        TO L1680-NUMBER-OF-DAYS.
           MOVE ZERO                        TO L1680-NUMBER-OF-YEARS.
           PERFORM  1680-4000-SUB-YMD-FROM-DATE
               THRU 1680-4000-SUB-YMD-FROM-DATE-X.
           MOVE L1680-INTERNAL-2            TO WS-LAPS-GRACE-PER-DT.

       3200-CALC-UL-DATES-X.
           EXIT.
      /
      *------------------
       3230-GET-DH-DTLS.
      *------------------

           MOVE ZEROES                      TO WS-RECPT-AMT.
           MOVE ZEROES                      TO WS-RECPT-DT.

           MOVE HIGH-VALUES                 TO WDH-KEY.
           MOVE LOW-VALUES                  TO WDH-ENDBR-KEY.
           MOVE RADVI-POL-ID                TO WDH-POL-ID
                                               WDH-ENDBR-POL-ID.
           MOVE +999                        TO WDH-SEQ-NUM.
           MOVE WGLOB-PROCESS-DATE          TO WDH-TRAD-SO-JRNL-DT.
           MOVE WWKDT-LOW-DT                TO
                                         WDH-ENDBR-TRAD-SO-JRNL-DT.

            MOVE +000                       TO WDH-ENDBR-SEQ-NUM.

           PERFORM  DH-1000-BROWSE-PREV
               THRU DH-1000-BROWSE-PREV-X.

           IF NOT WDH-IO-OK
               GO TO 3230-GET-DH-DTLS-X
           END-IF.

           PERFORM  DH-2000-READ-PREV
               THRU DH-2000-READ-PREV-X.

           IF NOT WDH-IO-OK
               PERFORM  DH-3000-END-BROWSE-PREV
                   THRU DH-3000-END-BROWSE-PREV-X
               GO TO 3230-GET-DH-DTLS-X
           END-IF.

           PERFORM  3235-PRCES-DH
               THRU 3235-PRCES-DH-X
               UNTIL WDH-IO-EOF
               OR WS-DH-REC-YES

           PERFORM  DH-3000-END-BROWSE-PREV
               THRU DH-3000-END-BROWSE-PREV-X.

       3230-GET-DH-DTLS-X.
           EXIT.
      /
      *---------------
       3235-PRCES-DH.
      *---------------
           IF  RDH-COLCT-MTHD-DEP
           AND RDH-COLCT-CATG-CD-DEP
125754*        MOVE RDH-PREM-CRCY-TRXN-AMT  TO WS-RECPT-AMT
125754         MOVE RDH-TRXN-AMT            TO WS-RECPT-AMT
               MOVE RDH-TRAD-RECV-DT        TO WS-PRCES-DATE
               STRING WS-PRCES-DT-YY, WS-PRCES-DT-MM, WS-PRCES-DT-DD
               DELIMITED BY SIZE          INTO WS-RECPT-DT
               SET WS-DH-REC-YES            TO TRUE
           END-IF.

           PERFORM  DH-2000-READ-PREV
               THRU DH-2000-READ-PREV-X.

       3235-PRCES-DH-X.
           EXIT.
      /
      *--------------
       9900-FINALIZE.
      *--------------

           PERFORM  9999-CLOSE-FILES
               THRU 9999-CLOSE-FILES-X.

       9900-FINALIZE-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.

           PERFORM  ADVI-4000-CLOSE
               THRU ADVI-4000-CLOSE-X.

           PERFORM  ADVN-4000-CLOSE
               THRU ADVN-4000-CLOSE-X.

           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************
      * LINK COPYBOOKS                                                *
      *****************************************************************
       COPY CCPSPGA.
       COPY XCPL0040.
       COPY CCPPMIDT.
      /
       COPY XCPL0260.
       COPY XCPL0030.
      /
       COPY CCPS2430.
       COPY CCPL2430.
      /
       COPY XCPS2490.
       COPY XCPL2490.
      /
       COPY CCPL0951.
       COPY CCPL0010.
       COPY CCPS0010.
      /
       COPY XCPL1680.
UYS001 COPY XCPL1660.       
       COPY CCPS0950.
       COPY CCPL0950.
      /
       COPY CCPL2440.
       COPY CCPL0182.
       COPY CCPS0182.
       COPY CCPEPRSM.
      /
       COPY CCPLCRCV.
       COPY CCPSCRCV.
      /
       COPY XCPS0290.
       COPY XCPL0290.
       COPY CCPS9215.
       COPY CCPL9215.
       COPY XCPL0289.
       COPY CCPL9B65.
       COPY CCPS9B65.
       COPY CCPL9697.
       COPY CCPS9697.
       COPY CCPL9C70.
       COPY CCPS9C70.

      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
       COPY CCPPCCC.
      /
       COPY XCPPHDG.
       COPY XCPPTIME.
       COPY NCPPCVGS.
       COPY CCPNEDIT.
       COPY CCPBEDIT.
UYS001 COPY CCPBETAB.       
      /

      *****************************************************************
      *             SEQ FILE I/O PROCESS MODULE                       *
      *****************************************************************
       COPY CCPNMAST.
      /
       COPY CCPNPOL.
       COPY NCPNTTAB.
       COPY CCPNCVG.
       COPY CCPEPRLG.
       COPY CCPACLIC.
       COPY CCPCCLIC.
       COPY CCPNCLIC.
       COPY CCPUCLI.
       COPY CCPNCLI.
       COPY CCPBCWAR.
       COPY CCPBCWAA.
       COPY CCPACLIA.
       COPY CCPBCLIA.
       COPY CCPBCLIC.
       COPY CCPNCLIA.
       COPY CCPUCLIA.
       COPY CCPXCLIA.
       COPY CCPCCLIA.
       COPY CCPFCLIA.
       COPY XCPNDMAD.
       COPY CCPBPNFO.
       COPY CCPNPH.
       COPY CCPBDH.
       COPY CCPUDH.
       COPY CCPNDH.
       COPY CCPVDH.
       COPY CCPADH.
       COPY CCPCDH.
       COPY CCPFDH.
       COPY CCPNTRNS.
       COPY CCPUTRNS.
      /

       COPY XCSLFILE REPLACING ==:ID:==  BY OCF
                               ==':PGM:'== BY =='XSRQOCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY OCF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY OCF.

      /
       COPY XCSLFILE REPLACING ==:ID:==  BY BCF
                               ==':PGM:'== BY =='XSRQBCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY BCF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY BCF.
      /

       COPY XCSLFILE REPLACING ==:ID:==  BY ADVI
                               ==':PGM:'== BY =='ZSRQADVI'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY ADVI.
       COPY XCSASEQ  REPLACING ==:ID:==  BY ADVI.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY ADVI.

      /
       COPY XCSLFILE REPLACING ==:ID:==  BY ADVN
                              ==':PGM:'== BY =='ZSRQADVN'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY ADVN.
       COPY XCSASEQ  REPLACING ==:ID:==  BY ADVN.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY ADVN.
      /
      ****************************************************************
      *    ERROR HANDLING ROUTINES                                   *
      ****************************************************************


      *****************************************************************
      **                 END OF PROGRAM ZSBMADVN                     **
      *****************************************************************
