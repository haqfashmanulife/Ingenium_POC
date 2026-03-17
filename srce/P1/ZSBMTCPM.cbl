      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  ZSBMTCPM.

       COPY XCWWCRHT.
      *****************************************************************
      **  MEMBER :  ZSBMTCPM                                         **
      **  REMARKS:  THIS WILL CONVERT THE MOVEMENT FILE TO A NEW     **
      **            FORMAT.                                          **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
E10382**  17OCT10  CTS    CREATED FOR NWL-PROD RELEASE               **
MP143J**  20AUG11  CTS    ADDED NEW FIELDS FOR AMI                   **
TVI025**  02AUG12  CTS    ADDED NEW FIELDS FOR TVI VA1               **
MP176K**  02AUG12  CTS    ADDED NEW FIELDS FOR ARM                   **
Q23545**  28AUG12  CTS    MP176K - FIX TO CORRECT ORDER OF NEW FIELDS**
TVIC37**  02AUG12  CTS    ADDED NEW FIELDS FOR TVI VA1               **
MP211E**  14DEC12  CTS    ADDED NEW FIELDS FOR LIEN DURATION         **
C21500**  08NOV13  CTS    ADDED NEW FIELD FOR INSURED CLIENT ID AND  **
C21500**                  CHANGES DONE TO POPULATE THE VALUE FOR THE **
C21500**                  PREVIOUS FIELD                             **  
MP245W**  21JUL14  CTS    CHANGES MADE FOR THE NEW FIELDS IN CCSRTCPM**
M271V1**  27MAR15  CTS    CHANGES MADE FOR FRA TVA1 JGAAP VALUATION  **
MP281I**  16SEP15  CTS    CHANGES FOR RETAIL CANCER                  **
MP289A**  20MAY16  CTS    ADDED NEW FIELDS FOR VA1                   **
MP300C**  25MAY16  CTS    VALUATION CHANGES TO THE NEW FIELD ETC BIT **
MP302S**  08AUG16  CTS    VALUATION CHANGES TO THE NEW FIELDS FOR    **
MP302S**                  SURVIVAL BENEFIT PAYOUT                    **
M319V1**  24JUL17  CTS    CHANGES DONE AS PART OF XWL                **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT IMVT-DATA-FILE ASSIGN TO ZSIMVT
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WIMVT-SEQ-FILE-STATUS.

           SELECT TCPM-DATA-FILE ASSIGN TO ZSTCPM
                  ORGANIZATION   IS LINE SEQUENTIAL
                  ACCESS         IS SEQUENTIAL
                  FILE STATUS    IS WTCPM-SEQ-FILE-STATUS.
      /
       DATA DIVISION.
       FILE SECTION.

       FD  IMVT-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

            01  RIMVT-SEQ-REC-INFO.
               05  RIMVT-REC-TYP                       PIC X.
                   88 RIMVT-REC-TYP-HDR                VALUE '1'.
                   88 RIMVT-REC-TYP-DTL                VALUE '2'.
                   88 RIMVT-REC-TYP-TLR                VALUE '3'.
               05  RIMVT-POL-ID                        PIC X(07).
               05  RIMVT-POL-CSTAT-CD                  PIC X(02).
               05  RIMVT-MID-TYP-PLAN-CD               PIC X(03).
               05  RIMVT-SMALL-TYP-PLAN-CD             PIC X(03). 
               05  RIMVT-RDR-LARGE-PLAN-CD             PIC X(03).
               05  RIMVT-RDR-PLAN-CD                   PIC X(04).
               05  RIMVT-BIT-4-JUVE                    PIC 9(01).
               05  RIMVT-DVDND-C1                      PIC X(01).
               05  RIMVT-DVDND-C2                      PIC X(03).
               05  RIMVT-DVDND-C3                      PIC X(17).
               05  RIMVT-PREM-PYMT-MODE1               PIC X(02).
                   88 RIMVT-PREM-PYMT-MODE1-A          VALUE '10'.
                   88 RIMVT-PREM-PYMT-MODE1-B          VALUE '12'.
                   88 RIMVT-PREM-PYMT-MODE1-C          VALUE '16'.
                   88 RIMVT-PREM-PYMT-MODE1-D          VALUE '20'.
                   88 RIMVT-PREM-PYMT-MODE1-E          VALUE '22'.
                   88 RIMVT-PREM-PYMT-MODE1-F          VALUE '26'.
                   88 RIMVT-PREM-PYMT-MODE1-G          VALUE '47'.
                   88 RIMVT-PREM-PYMT-MODE1-H          VALUE '40'.
                   88 RIMVT-PREM-PYMT-MODE1-I          VALUE '46'.
               05  RIMVT-PREM-PYMT-MODE2               PIC X(02).
               05  RIMVT-SEX-CD                        PIC X(01).
               05  RIMVT-X1-ISS-AGE                    PIC 9(02).
               05  RIMVT-X2-4-JUVE                     PIC 9(02).
               05  RIMVT-BNFT-PERI                     PIC X(02).
               05  RIMVT-PREM-PYMT-PERI                PIC X(02).
               05  RIMVT-ISS-DT.                      
                    10 RIMVT-ISS-DT-YR                  PIC X(04).
                    10 RIMVT-ISS-DT-MO                  PIC X(02).
                    10 RIMVT-ISS-DT-DY                  PIC X(02).   
               05  RIMVT-FACE-AMT                      PIC X(10).
               05  RIMVT-MAT-AMT                       PIC X(10).
               05  RIMVT-AMT-IN-FORCE                  PIC X(10).
               05  RIMVT-AN-AMT                        PIC X(10).
               05  RIMVT-AFYC                          PIC X(10).
               05  RIMVT-BR-OFFCE-CD                   PIC X(03).
               05  RIMVT-LN-NUM                        PIC X(03).
                   88 RIMVT-LN-NUM-ISS                 VALUE '12'.
                   88 RIMVT-LN-NUM-SURR                VALUE '25'.
                   88 RIMVT-LN-NUM-DTH                 VALUE '21'.
               05  RIMVT-SUB-LN-NUM                    PIC X(03).
                   88 RIMVT-SUB-LN-NUM-ISS             VALUE '100'.
                   88 RIMVT-SUB-LN-NUM-ISS-REV         VALUE '303'.                
                   88 RIMVT-SUB-LN-NUM-SURR            VALUE '360'.
                   88 RIMVT-SUB-LN-NUM-RDR-SURR        VALUE '312'.
                   88 RIMVT-SUB-LN-NUM-DTH             VALUE '340'.
                   88 RIMVT-SUB-LN-NUM-REV-DTH         VALUE '840'.
               05  RIMVT-PRCES-DT.                      
                   10 RIMVT-PRCES-DT-YR                PIC X(04).
                   10 RIMVT-PRCES-DT-MO                PIC X(02).
                   10 RIMVT-PRCES-DT-DY                PIC X(02).
               05  RIMVT-DHY-MLJ-BIT                   PIC 9(01).
               05  RIMVT-PREM-PYMT-YR-MTH.
                   10 RIMVT-PREM-PYMT-YR               PIC X(02).
                   10 RIMVT-PREM-PYMT-MO               PIC X(02).
               05  RIMVT-P1-PREM                       PIC X(10).   
               05  RIMVT-P2-POL-FEE                    PIC X(10).
               05  RIMVT-CNVR-DSCNT-PREM               PIC X(10).
               05  RIMVT-SSTD-PREM                     PIC X(10).
               05  RIMVT-PRE-PD-PREM                   PIC X(10).
               05  RIMVT-LMPSM-PREM                    PIC X(10).
               05  RIMVT-ANN-PREM-AMT                  PIC X(10).
               05  RIMVT-ISS-YR-MO.
                   10 RIMVT-ISS-YY                     PIC X(04).
                   10 RIMVT-ISS-MO                     PIC X(02).
               05  RIMVT-POL-LOAN-AMT                  PIC X(10).
               05  RIMVT-POL-LOAN-PRCES-DT             PIC 9(08).
               05  RIMVT-PCT-CANCER-BNFT               PIC 9(04).
               05  RIMVT-FEED-CREATED-DT.               
                   10 RIMVT-FEED-CREATED-YR            PIC X(04).
                   10 RIMVT-FEED-CREATED-MO            PIC X(02).
                   10 RIMVT-FEED-CREATED-DY            PIC X(02).
               05  RIMVT-MVMT-TETSUZUKI-CHU            PIC 9(01).
               05  RIMVT-MVMT-CD-TETSUZUKI-CHU         PIC 9(03).
               05  RIMVT-POL-ID-VA2                    PIC 9(10).
               05  RIMVT-CVG-NUM                       PIC 9(02).
               05  RIMVT-APL-AMT                       PIC X(10).
               05  RIMVT-CVG-REDN-PER                  PIC 9(02).
               05  RIMVT-INCR-AGE                      PIC 9(02).
               05  RIMVT-EXTRA-PREM-RT                 PIC X(04).
               05  RIMVT-SUM-FACE-AMT                  PIC X(10).   
               05  RIMVT-RANK-FACE-AMT                 PIC 9(02).
               05  RIMVT-AN-SUM-AMT                    PIC X(10).
               05  RIMVT-RANK-AN-AMT                   PIC 9(02).
               05  RIMVT-LAPS-REINST-CTL               PIC 9(02).
               05  RIMVT-BASE-POL-ISS-DT               PIC 9(08).
               05  RIMVT-BASE-POL-MAT-DT               PIC 9(08).
               05  RIMVT-RDR-MAT-DT                    PIC 9(08).
               05  RIMVT-LAPS-POL-BIT                  PIC 9(01).
               05  RIMVT-REINST-POL-BIT                PIC 9(01).
               05  RIMVT-SPCL-REINST-BIT               PIC 9(01).
               05  RIMVT-RDR-RENW-PROG-BIT1            PIC 9(01).
               05  RIMVT-RDR-RENW-PROG-BIT2            PIC 9(01).
               05  RIMVT-RDR-RENW-EFF-DT               PIC X(08).
               05  RIMVT-CNTRCT-LAPS-EFF-DT            PIC X(08).
               05  RIMVT-CNTRCT-REINST-EFF-DT          PIC 9(08).
               05  RIMVT-TERM-NEW-OLD-CTL              PIC 9(01).
               05  RIMVT-UL-PROD-CHNG-BIT              PIC X(01).
               05  RIMVT-MLJ-SWTCH-BIT                 PIC X(01).
               05  RIMVT-INC-TERM-TYP                  PIC X(02).
               05  RIMVT-AUTO-FAC-RE-FLAG              PIC X(01).
               05  RIMVT-AGRE-DOC-NUM                  PIC X(05).   
               05  RIMVT-AMT-CED                       PIC X(10).
               05  RIMVT-INSRD-MORT-RATIO              PIC X(04).
               05  RIMVT-INC-TERM-FLAG                 PIC X(01).
               05  RIMVT-RPU-BIT                       PIC X(01).
               05  RIMVT-PROC-DT.
                   10  RIMVT-PROC-DT-YR                PIC X(04).
                   10  RIMVT-PROC-DT-MO                PIC X(02).
                   10  RIMVT-PROC-DT-DY                PIC X(02).
               05  RIMVT-UNISYS-UNIX-FLAG              PIC X(01).
               05  RIMVT-REINS-CALC-DT                 PIC 9(08).
               05  RIMVT-ISS-YR                        PIC X(04).
               05  RIMVT-PROC-YR                       PIC X(04).
               05  RIMVT-CHNL-CTL                      PIC X(01).
               05  RIMVT-CANCER-DTH-FLAG               PIC 9(01).
               05  RIMVT-ZI-FLAG                       PIC X(01).
               05  RIMVT-PREF-AUTO-CHNG-FLAG           PIC X(01).
               05  RIMVT-WRIT-AGT-ID                   PIC X(06).
               05  RIMVT-CSV-TYP-FLAG                  PIC X(01).
               05  RIMVT-PREF-POL-OWNR                 PIC X(03).
               05  RIMVT-INGM-CSTAT-CD                 PIC X(02).
               05  RIMVT-INGM-SUB-STAT-CD              PIC X(03).
               05  RIMVT-INGM-PREV-CSTAT-CD            PIC X(02).
               05  RIMVT-POL-CSTAT-LAST-CHG-DT         PIC X(11).
               05  RIMVT-ING-PLAN-CODE                 PIC X(07).
               05  RIMVT-SPCL-PREM-DUR                 PIC X(04).
               05  RIMVT-REINSR-CD.
                   10  RIMVT-REINSR-CD-VALUE           PIC X(02).
                   10  RIMVT-REINSR-CD-SPACER          PIC X(01).
               05  RIMVT-RATIO-OF-CED                  PIC 9(04).   
               05  RIMVT-SERV-AGT-CD                   PIC X(06).
               05  RIMVT-LCD.
                   10 RIMVT-LCD-YR                     PIC X(04).
                   10 RIMVT-LCD-MO                     PIC X(02).
                   10 RIMVT-LCD-DY                     PIC X(02).
               05  RIMVT-CSV                           PIC 9(15).
               05  RIMVT-MVMT-EFF-DT.
                   10 RIMVT-MVMT-EFF-DT-YR             PIC X(04).
                   10 RIMVT-MVMT-EFF-DT-MO             PIC X(02).
                   10 RIMVT-MVMT-EFF-DT-DY             PIC X(02).
MP143J         05  RIMVT-BR-ID                         PIC X(05).
MP143J         05  RIMVT-SO-ID                         PIC X(05).
MP143J         05  RIMVT-COI-REPRC-DT                  PIC X(10).
MP143J         05  RIMVT-VAL-REPRC-DT                  PIC X(10).
MP143J         05  RIMVT-COI-REPRC-IND                 PIC X(01).
MP143J         05  RIMVT-VAL-REPRC-IND                 PIC X(01).
TVI025         05  RIMVT-PMT-LMT-EVNT                  PIC X(01).
TVI025         05  RIMVT-TOT-AMT-PD-MEDIC-BNFT         PIC X(10).
TVI025         05  RIMVT-GUAR-CD                       PIC X(02).
TVI025         05  RIMVT-MAIN-CVG-FLG                  PIC X(01).
TVI025             88 RIMVT-MAIN-CVG-FLG-1             VALUE '1'.
TVI025             88 RIMVT-MAIN-CVG-FLG-0             VALUE '0'.
TVI025         05  RIMVT-DEFR-BNFT                     PIC X(10).
TVI025         05  RIMVT-INT-DEFR-BNFT                 PIC X(10).
TVI025         05  RIMVT-CILSM-PAID-IND                PIC X(01).
TVI025             88 RIMVT-CILSM-PAID-YES             VALUE '1'.
TVI025             88 RIMVT-CILSM-PAID-NO              VALUE '0'.
TVI025         05 RIMVT-MTHLY-BNFT-AMT                 PIC X(10).
TVI025         05  RIMVT-GUAR-PERI-CD                  PIC X(02).
TVI025         05  RIMVT-CRC-INIT-PREM-IND             PIC X(01).
TVI025             88 RIMVT-CRC-INIT-PREM-YES          VALUE '1'.
TVI025             88 RIMVT-CRC-INIT-PREM-NO           VALUE '0'.
TVI025         05  RIMVT-WP-IND                        PIC X(01).
TVI025             88 RIMVT-WP-YES                     VALUE '1'.
TVI025             88 RIMVT-WP-NO                      VALUE '0'.
TVI025         05  RIMVT-WP-PREM-AMT                   PIC X(10).
TVI025         05  RIMVT-BILL-TYP-CD                   PIC X(01).
TVI025         05  RIMVT-ADV-PMT-PREPAY-FLAG           PIC X(01).
TVI025             88  RIMVT-ADV-PMT-PREPAY-3          VALUE '3'.
TVI025             88  RIMVT-ADV-PMT-PREPAY-2          VALUE '2'.
TVI025             88  RIMVT-ADV-PMT-PREPAY-1          VALUE '1'.
TVI025             88  RIMVT-ADV-PMT-PREPAY-NONE       VALUE ' '.
TVI025             88  RIMVT-ADV-PMT-PREPAY-VALID
TVI025                                      VALUE '1','2','3'.
TVIC37         05  RIMVT-AGE-LAST-IND                  PIC X(01).
TVIC37             88 RIMVT-AGE-LAST-YES               VALUE '1'.
TVIC37             88 RIMVT-AGE-LAST-NO                VALUE '0'.
TVIC37         05  RIMVT-INS-ENTR-AGE                  PIC 9(03).
TVIC37         05  RIMVT-SA-PROD-FLAG                  PIC X(01).
TVIC37             88  RIMVT-SA-PROD-FLAG-YES          VALUE '1'.
TVIC37             88  RIMVT-SA-PROD-FLAG-NO           VALUE '0'.
MP211E         05  RIMVT-MKT-VAL-AMT                   PIC 9(17).
MP211E         05  RIMVT-GA-DPOS-AMT                   PIC 9(17).
MP211E         05  RIMVT-UNIT-VALU-AMT                 PIC X(17).
MP211E         05  RIMVT-CNT-NUM-UNIT                  PIC X(17).
C21500         05  RIMVT-CVG-LIEN-DUR                  PIC X(01).
MP245W         05  RIMVT-INSRD-CLI-ID                  PIC X(10).
M271V1         05  RIMVT-INT-CRED-RT                   PIC 9.9(05).
M271V1         05  RIMVT-POL-CRCY-CD                   PIC X(02).
M271V1         05  RIMVT-PMT-CRCY-CD                   PIC X(02).
M271V1         05  RIMVT-BNFT-CRCY-CD                  PIC X(02).
M271V1         05  RIMVT-LNB-IND                       PIC X(01).
M271V1         05  RIMVT-XCHNG-RT                      PIC 9(05).
M271V1         05  RIMVT-NON-FACE-TO-FACE-IND          PIC X(01).
M271V1         05  RIMVT-COINS-ALLOW-FLAG              PIC X(02).
MP281I         05  RIMVT-ANTY-PMT-STRT-DT              PIC X(10).
MP281I         05  RIMVT-ANTY-TYP-CD                   PIC X(01).
MP281I         05  RIMVT-ANTY-PMT-PERI                 PIC X(03).
MP281I         05  RIMVT-ANTY-CAP-RT                   PIC X(07).
MP281I         05  RIMVT-ANTY-CAP-AMT                  PIC X(10).
MP281I         05  RIMVT-ANTY-PMT-STRT-AGE             PIC X(03).
MP281I         05  RIMVT-MULT-PMT-ANN-AMT              PIC X(03).
MP281I         05  RIMVT-TAX-DED-CAT-IND               PIC X(01).
MP289A         05  RIMVT-JGAAP-AP-AMT                  PIC X(10).
MP289A         05  RIMVT-PROD-SECTOR-CD                PIC X(01).
MP300C         05  RIMVT-SUB-CHNL-CTL-CD               PIC X(01).
MP300C         05  RIMVT-SUB-AGT-CD                    PIC X(06).
MP302S         05  RIMVT-UW-FORM-RECV-CD               PIC X(01).
M319V1         05  RIMVT-SRVBEN-DEFR-AMT               PIC X(10).
M319V1         05  RIMVT-SRVBEN-DEFR-INT-AMT           PIC X(10).

       FD  TCPM-DATA-FILE
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.

            
           01  RTCPM-SEQ-REC-INFO.
               05  RTCPM-REC-TYP                       PIC X.
                   88 RTCPM-REC-TYP-HDR                VALUE '1'.
                   88 RTCPM-REC-TYP-DTL                VALUE '2'.
                   88 RTCPM-REC-TYP-TLR                VALUE '3'.
               05  RTCPM-POL-ID                        PIC X(07).
               05  RTCPM-POL-CSTAT-CD                  PIC X(02).
               05  RTCPM-MID-TYP-PLAN-CD               PIC X(03).
               05  RTCPM-SMALL-TYP-PLAN-CD             PIC X(03). 
               05  RTCPM-RDR-LARGE-PLAN-CD             PIC X(03).
               05  RTCPM-RDR-PLAN-CD                   PIC X(04).
               05  RTCPM-BIT-4-JUVE                    PIC 9(01).
               05  RTCPM-DVDND-C1                      PIC X(01).
               05  RTCPM-DVDND-C2                      PIC X(03).
               05  RTCPM-DVDND-C3                      PIC X(17).
               05  RTCPM-PREM-PYMT-MODE1               PIC X(02).
                   88 RTCPM-PREM-PYMT-MODE1-A          VALUE '10'.
                   88 RTCPM-PREM-PYMT-MODE1-B          VALUE '12'.
                   88 RTCPM-PREM-PYMT-MODE1-C          VALUE '16'.
                   88 RTCPM-PREM-PYMT-MODE1-D          VALUE '20'.
                   88 RTCPM-PREM-PYMT-MODE1-E          VALUE '22'.
                   88 RTCPM-PREM-PYMT-MODE1-F          VALUE '26'.
                   88 RTCPM-PREM-PYMT-MODE1-G          VALUE '47'.
                   88 RTCPM-PREM-PYMT-MODE1-H          VALUE '40'.
                   88 RTCPM-PREM-PYMT-MODE1-I          VALUE '46'.
               05  RTCPM-PREM-PYMT-MODE2               PIC X(02).
               05  RTCPM-SEX-CD                        PIC X(01).
               05  RTCPM-X1-ISS-AGE                    PIC 9(02).
               05  RTCPM-X2-4-JUVE                     PIC 9(02).
               05  RTCPM-BNFT-PERI                     PIC X(02).
               05  RTCPM-PREM-PYMT-PERI                PIC X(02).
               05  RTCPM-ISS-DT.                      
                    10 RTCPM-ISS-DT-YR                  PIC X(04).
                    10 RTCPM-ISS-DT-MO                  PIC X(02).
                    10 RTCPM-ISS-DT-DY                  PIC X(02).   
               05  RTCPM-FACE-AMT                      PIC X(10).
               05  RTCPM-MAT-AMT                       PIC X(10).
               05  RTCPM-AMT-IN-FORCE                  PIC X(10).
               05  RTCPM-AN-AMT                        PIC X(10).
               05  RTCPM-AFYC                          PIC X(10).
               05  RTCPM-BR-OFFCE-CD                   PIC X(03).
               05  RTCPM-LN-NUM                        PIC X(03).
                   88 RTCPM-LN-NUM-ISS                 VALUE '12'.
                   88 RTCPM-LN-NUM-SURR                VALUE '25'.
                   88 RTCPM-LN-NUM-DTH                 VALUE '21'.
               05  RTCPM-SUB-LN-NUM                    PIC X(03).
                   88 RTCPM-SUB-LN-NUM-ISS             VALUE '100'.
                   88 RTCPM-SUB-LN-NUM-ISS-REV         VALUE '303'.                
                   88 RTCPM-SUB-LN-NUM-SURR            VALUE '360'.
                   88 RTCPM-SUB-LN-NUM-RDR-SURR        VALUE '312'.
                   88 RTCPM-SUB-LN-NUM-DTH             VALUE '340'.
                   88 RTCPM-SUB-LN-NUM-REV-DTH         VALUE '840'.
               05  RTCPM-PRCES-DT.                      
                   10 RTCPM-PRCES-DT-YR                PIC X(04).
                   10 RTCPM-PRCES-DT-MO                PIC X(02).
                   10 RTCPM-PRCES-DT-DY                PIC X(02).
               05  RTCPM-DHY-MLJ-BIT                   PIC 9(01).
               05  RTCPM-PREM-PYMT-YR-MTH.
                   10 RTCPM-PREM-PYMT-YR               PIC X(02).
                   10 RTCPM-PREM-PYMT-MO               PIC X(02).
               05  RTCPM-P1-PREM                       PIC X(10).   
               05  RTCPM-P2-POL-FEE                    PIC X(10).
               05  RTCPM-CNVR-DSCNT-PREM               PIC X(10).
               05  RTCPM-SSTD-PREM                     PIC X(10).
               05  RTCPM-PRE-PD-PREM                   PIC X(10).
               05  RTCPM-LMPSM-PREM                    PIC X(10).
               05  RTCPM-ANN-PREM-AMT                  PIC X(10).
               05  RTCPM-ISS-YR-MO.
                   10 RTCPM-ISS-YY                     PIC X(04).
                   10 RTCPM-ISS-MO                     PIC X(02).
               05  RTCPM-POL-LOAN-AMT                  PIC X(10).
               05  RTCPM-POL-LOAN-PRCES-DT             PIC 9(08).
               05  RTCPM-PCT-CANCER-BNFT               PIC 9(04).
               05  RTCPM-FEED-CREATED-DT.               
                   10 RTCPM-FEED-CREATED-YR            PIC X(04).
                   10 RTCPM-FEED-CREATED-MO            PIC X(02).
                   10 RTCPM-FEED-CREATED-DY            PIC X(02).
               05  RTCPM-MVMT-TETSUZUKI-CHU            PIC 9(01).
               05  RTCPM-MVMT-CD-TETSUZUKI-CHU         PIC 9(03).
               05  RTCPM-POL-ID-VA2                    PIC 9(10).
               05  RTCPM-CVG-NUM                       PIC 9(02).
               05  RTCPM-APL-AMT                       PIC X(10).
               05  RTCPM-CVG-REDN-PER                  PIC 9(02).
               05  RTCPM-INCR-AGE                      PIC 9(02).
               05  RTCPM-EXTRA-PREM-RT                 PIC X(04).
               05  RTCPM-SUM-FACE-AMT                  PIC X(10).   
               05  RTCPM-RANK-FACE-AMT                 PIC 9(02).
               05  RTCPM-AN-SUM-AMT                    PIC X(10).
               05  RTCPM-RANK-AN-AMT                   PIC 9(02).
               05  RTCPM-LAPS-REINST-CTL               PIC 9(02).
               05  RTCPM-BASE-POL-ISS-DT               PIC 9(08).
               05  RTCPM-BASE-POL-MAT-DT               PIC 9(08).
               05  RTCPM-RDR-MAT-DT                    PIC 9(08).
               05  RTCPM-LAPS-POL-BIT                  PIC 9(01).
               05  RTCPM-REINST-POL-BIT                PIC 9(01).
               05  RTCPM-SPCL-REINST-BIT               PIC 9(01).
               05  RTCPM-RDR-RENW-PROG-BIT1            PIC 9(01).
               05  RTCPM-RDR-RENW-PROG-BIT2            PIC 9(01).
               05  RTCPM-RDR-RENW-EFF-DT               PIC X(08).
               05  RTCPM-CNTRCT-LAPS-EFF-DT            PIC X(08).
               05  RTCPM-CNTRCT-REINST-EFF-DT          PIC 9(08).
               05  RTCPM-TERM-NEW-OLD-CTL              PIC 9(01).
               05  RTCPM-UL-PROD-CHNG-BIT              PIC X(01).
               05  RTCPM-MLJ-SWTCH-BIT                 PIC X(01).
               05  RTCPM-INC-TERM-TYP                  PIC X(02).
               05  RTCPM-AUTO-FAC-RE-FLAG              PIC X(01).
               05  RTCPM-AGRE-DOC-NUM                  PIC X(05).   
               05  RTCPM-AMT-CED                       PIC X(10).
               05  RTCPM-INSRD-MORT-RATIO              PIC X(04).
               05  RTCPM-INC-TERM-FLAG                 PIC X(01).
               05  RTCPM-RPU-BIT                       PIC X(01).
               05  RTCPM-PROC-DT.
                   10  RTCPM-PROC-DT-YR                PIC X(04).
                   10  RTCPM-PROC-DT-MO                PIC X(02).
                   10  RTCPM-PROC-DT-DY                PIC X(02).
               05  RTCPM-UNISYS-UNIX-FLAG              PIC X(01).
               05  RTCPM-REINS-CALC-DT                 PIC 9(08).
               05  RTCPM-ISS-YR                        PIC X(04).
               05  RTCPM-PROC-YR                       PIC X(04).
               05  RTCPM-CHNL-CTL                      PIC X(01).
               05  RTCPM-CANCER-DTH-FLAG               PIC 9(01).
               05  RTCPM-ZI-FLAG                       PIC X(01).
               05  RTCPM-PREF-AUTO-CHNG-FLAG           PIC X(01).
               05  RTCPM-WRIT-AGT-ID                   PIC X(06).
               05  RTCPM-CSV-TYP-FLAG                  PIC X(01).
               05  RTCPM-PREF-POL-OWNR                 PIC X(03).
               05  RTCPM-INGM-CSTAT-CD                 PIC X(02).
               05  RTCPM-INGM-SUB-STAT-CD              PIC X(03).
               05  RTCPM-INGM-PREV-CSTAT-CD            PIC X(02).
               05  RTCPM-POL-CSTAT-LAST-CHG-DT         PIC X(11).
               05  RTCPM-ING-PLAN-CODE                 PIC X(07).
               05  RTCPM-SPCL-PREM-DUR                 PIC X(04).
               05  RTCPM-REINSR-CD.
                   10  RTCPM-REINSR-CD-VALUE           PIC X(02).
                   10  RTCPM-REINSR-CD-SPACER          PIC X(01).
               05  RTCPM-RATIO-OF-CED                  PIC 9(04).   
               05  RTCPM-SERV-AGT-CD                   PIC X(06).
               05  RTCPM-LCD.
                   10 RTCPM-LCD-YR                     PIC X(04).
                   10 RTCPM-LCD-MO                     PIC X(02).
                   10 RTCPM-LCD-DY                     PIC X(02).
               05  RTCPM-CSV                           PIC 9(15).
               05  RTCPM-MVMT-EFF-DT.
                   10 RTCPM-MVMT-EFF-DT-YR             PIC X(04).
                   10 RTCPM-MVMT-EFF-DT-MO             PIC X(02).
                   10 RTCPM-MVMT-EFF-DT-DY             PIC X(02).
               05  RTCPM-BR-ID                         PIC X(05).
               05  RTCPM-SO-ID                         PIC X(05).
MP143J         05  RTCPM-COI-REPRC-DT                  PIC X(10).
MP143J         05  RTCPM-VAL-REPRC-DT                  PIC X(10).
MP143J         05  RTCPM-COI-REPRC-IND                 PIC X(01).
MP143J         05  RTCPM-VAL-REPRC-IND                 PIC X(01).
MP143J         05  RTCPM-PMT-LMT-EVNT                  PIC X(01).
TVI025*MP143J         05  RTCPM-TOT-AMT-PD-MEDIC-BNFT         PIC 9(10).
TVI025         05  RTCPM-TOT-AMT-PD-MEDIC-BNFT         PIC X(10).
MP143J         05  RTCPM-GUAR-CD                       PIC X(02).
MP143J         05  RTCPM-MAIN-CVG-FLG                  PIC X(01).
MP143J         05  RTCPM-DEFR-BNFT                     PIC X(10).
MP143J         05  RTCPM-INT-DEFR-BNFT                 PIC X(10).
MP143J         05  RTCPM-CILSM-PAID-IND                PIC X(01).
TVI025             88 RTCPM-CILSM-PAID-YES             VALUE '1'.
TVI025             88 RTCPM-CILSM-PAID-NO              VALUE '0'.
TVI025         05  RTCPM-MTHLY-BNFT-AMT                PIC X(10).
TVI025         05  RTCPM-GUAR-PERI-CD                  PIC X(02).
TVI025         05  RTCPM-CRC-INIT-PREM-IND             PIC X(01).
TVI025             88 RTCPM-CRC-INIT-PREM-YES          VALUE '1'.
TVI025             88 RTCPM-CRC-INIT-PREM-NO           VALUE '0'.
TVI025         05  RTCPM-WP-IND                        PIC X(01).
TVI025             88 RTCPM-WP-YES                     VALUE '1'.
TVI025             88 RTCPM-WP-NO                      VALUE '0'.
TVI025         05  RTCPM-WP-PREM-AMT                   PIC X(10).
TVI025         05  RTCPM-BILL-TYP-CD                   PIC X(01).
TVI025         05  RTCPM-ADV-PMT-PREPAY-FLAG           PIC X(01).
TVI025             88  RTCPM-ADV-PMT-PREPAY-3          VALUE '3'.
TVI025             88  RTCPM-ADV-PMT-PREPAY-2          VALUE '2'.
TVI025             88  RTCPM-ADV-PMT-PREPAY-1          VALUE '1'.
TVI025             88  RTCPM-ADV-PMT-PREPAY-NONE       VALUE ' '.
TVI025             88  RTCPM-ADV-PMT-PREPAY-VALID
TVI025                                      VALUE '1','2','3'.
Q23545         05  RTCPM-AGE-LAST-IND                  PIC X(01).
Q23545             88 RTCPM-AGE-LAST-YES               VALUE '1'.
Q23545             88 RTCPM-AGE-LAST-NO                VALUE '0'.
Q23545         05  RTCPM-INS-ENTR-AGE                  PIC 9(03).
TVI025         05  RTCPM-SA-PROD-FLAG                  PIC X(01).
TVI025             88  RTCPM-SA-PROD-FLAG-YES          VALUE '1'.
TVI025             88  RTCPM-SA-PROD-FLAG-NO           VALUE '0'.
Q23545*MP176K         05  RTCPM-AGE-LAST-IND                  PIC X(01).
Q23545*MP176K             88 RTCPM-AGE-LAST-YES               VALUE '1'.
Q23545*MP176K             88 RTCPM-AGE-LAST-NO                VALUE '0'.
Q23545*MP176K         05  RTCPM-INS-ENTR-AGE                  PIC 9(03).
TVIC37         05  RTCPM-MKT-VAL-AMT                   PIC 9(17).
TVIC37         05  RTCPM-GA-DPOS-AMT                   PIC 9(17).
TVIC37         05  RTCPM-UNIT-VALU-AMT                 PIC X(17).
TVIC37         05  RTCPM-CNT-NUM-UNIT                  PIC X(17).
MP211E         05  RTCPM-CVG-LIEN-DUR                  PIC X(01).
C21500         05  RTCPM-INSRD-CLI-ID                  PIC X(10).
MP245W         05  RTCPM-INT-CRED-RT                   PIC X(07).
MP245W         05  RTCPM-POL-CRCY-CD                   PIC X(02).
MP245W         05  RTCPM-PMT-CRCY-CD                   PIC X(02).
MP245W         05  RTCPM-BNFT-CRCY-CD                  PIC X(02).
MP245W         05  RTCPM-LNB-IND                       PIC X(01).
MP245W             88 RTCPM-LNB-YES                    VALUE '1'.
MP245W             88 RTCPM-LNB-NO                     VALUE '0'.
MP245W         05  RTCPM-XCHNG-RT                      PIC 9(05).
M271V1         05  RTCPM-NON-FACE-TO-FACE-IND          PIC X(01).
M271V1         05  RTCPM-COINS-ALLOW-FLAG              PIC X(02).
M271V1         05  RTCPM-ANTY-PMT-STRT-DT              PIC X(10).
M271V1         05  RTCPM-ANTY-TYP-CD                   PIC X(01).
M271V1         05  RTCPM-ANTY-PMT-PERI                 PIC X(03).
M271V1         05  RTCPM-ANTY-CAP-RT                   PIC X(07).
M271V1         05  RTCPM-ANTY-CAP-AMT                  PIC X(10).
M271V1         05  RTCPM-ANTY-PMT-STRT-AGE             PIC X(03).
M271V1         05  RTCPM-MULT-PMT-ANN-AMT              PIC X(03).
M271V1         05  RTCPM-TAX-DED-CAT-IND               PIC X(01).
MP289A*MP281I         05  RTCPM-JGAAP-AP-AMT                  PIC 9(10).
MP289A         05  RTCPM-JGAAP-AP-AMT                  PIC X(10).
MP281I         05  RTCPM-PROD-SECTOR-CD                PIC X(01).
MP289A         05  RTCPM-SUB-CHNL-CTL-CD               PIC X(01).
MP289A         05  RTCPM-SUB-AGT-CD                    PIC X(06).
MP300C         05  RTCPM-UW-FORM-RECV-CD               PIC X(01).
MP302S         05  RTCPM-SRVBEN-DEFR-AMT               PIC X(10).
MP302S         05  RTCPM-SRVBEN-DEFR-INT-AMT           PIC X(10).
M319V1         05  RTCPM-AEE-PREM-NBE-AMT              PIC 9(11).9(02).
M319V1         05  RTCPM-AEE-FA-NBE-AMT                PIC 9(11).9(02).
M319V1         05  RTCPM-AEE-RSRV-NBE-AMT              PIC 9(11).9(02).
M319V1         05  RTCPM-AEE-NUM-CAS-NBE-AMT           PIC 9(11).9(02).
M319V1         05  RTCPM-AEE-PREM-ME-AMT               PIC 9(11).9(02).
M319V1         05  RTCPM-AEE-FA-ME-AMT                 PIC 9(11).9(02).
M319V1         05  RTCPM-AEE-RSRV-ME-AMT               PIC 9(11).9(02).
M319V1         05  RTCPM-AEE-NUM-CAS-ME-AMT            PIC 9(11).9(02).
M319V1         05  RTCPM-AEE-PREM-CE-AMT               PIC 9(11).9(02).
M319V1         05  RTCPM-AEE-FA-CE-AMT                 PIC 9(11).9(02).
M319V1         05  RTCPM-AEE-RSRV-CE-AMT               PIC 9(11).9(02).
M319V1         05  RTCPM-AEE-NUM-CAS-CE-AMT            PIC 9(11).9(02).
M319V1         05  RTCPM-AOE-PREM-AMT                  PIC 9(11).9(02).
M319V1         05  RTCPM-AOE-FACE-AMT                  PIC 9(11).9(02).
M319V1         05  RTCPM-AOE-RSRV-AMT                  PIC 9(11).9(02).
M319V1         05  RTCPM-AOE-NUM-CAS-AMT               PIC 9(11).9(02).
M319V1         05  RTCPM-ACUM-INT                      PIC 9(11).9(02).

      /
       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMTCPM'.

       COPY SQLCA.

       01  WS-PROGRAM-WORK-AREA.
           05  WS-ERROR-SW               PIC X(1).
               88  WS-NO-ERRORS                      VALUE 'N'.
               88  WS-ERRORS-FOUND                   VALUE 'Y'.
           05  WS-ANNIV-SW               PIC X(1).
               88  WS-ANNIV-NOT-FOUND                VALUE 'N'.
               88  WS-ANNIV-FOUND                    VALUE 'Y'.
MP302S     05 WS-TOT-AMT-PD-MEDIC-BNFT     PIC 9(10).

       COPY XCWWWKDT.
       01  SUBS-AND-THINGS.
           05  I                         PIC S9(8) COMP.

       01  WS-OUTPUT-LINE.
           05  WS-OUTPUT-POL-ID                 PIC X(10).
           05  FILLER                           PIC X(01).
           05  WS-OUTPUT-MESSAGE                PIC X(40).
           05  FILLER                           PIC X(81).

       01  WIMVT-SEQ-IO-WORK-AREA.
           05  WIMVT-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'IMVT'.
           05  WIMVT-SEQ-IO-COMMAND             PIC X(02).
           05  WIMVT-SEQ-FILE-STATUS            PIC X(02).
           05  WIMVT-SEQ-IO-STATUS              PIC 9(01).
               88  WIMVT-SEQ-IO-OK              VALUE 0.
               88  WIMVT-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WIMVT-SEQ-IO-EOF             VALUE 8.
               88  WIMVT-SEQ-IO-ERROR           VALUE 9.

       01  WTCPM-SEQ-IO-WORK-AREA.
           05  WTCPM-SEQ-FILE-NAME              PIC X(04)
                                                VALUE 'TCPM'.
           05  WTCPM-SEQ-IO-COMMAND             PIC X(02).
           05  WTCPM-SEQ-FILE-STATUS            PIC X(02).
           05  WTCPM-SEQ-IO-STATUS              PIC 9(01).
               88  WTCPM-SEQ-IO-OK              VALUE 0.
               88  WTCPM-SEQ-IO-NOT-FOUND       VALUE 7.
               88  WTCPM-SEQ-IO-EOF             VALUE 8.
               88  WTCPM-SEQ-IO-ERROR           VALUE 9.

       

       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWTFCMD.
       COPY CCWL0083.
       COPY CCWL0010.
       COPY XCWL0040.
       COPY XCWL1660.
       COPY XCWL1670.
       COPY XCWL1680.
       COPY XCWLDTLK.
       COPY XCSWOCF.
       COPY XCSROCF.
MP302S COPY XCWL0290.
MP302S COPY XCWL0280.
MP302S COPY CCWWCVGS.
MP302S COPY CCFWPOL.
MP302S COPY CCFRPOL.
MP302S COPY CCFWCVG.
MP302S COPY CCFRCVG.
      /
      ********************
       PROCEDURE DIVISION.
      ********************
      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM 0100-OPEN-FILES
              THRU 0100-OPEN-FILES-X.

           PERFORM 1000-INITIALIZATION
              THRU 1000-INITIALIZATION-X.

           PERFORM 2000-PROCESS-IN-RECS
              THRU 2000-PROCESS-IN-RECS-X
              UNTIL WIMVT-SEQ-IO-EOF
                 OR WS-ERRORS-FOUND.

           PERFORM 9999-CLOSE-FILES
              THRU 9999-CLOSE-FILES-X.

           STOP RUN.

       0000-MAINLINE-X.
           EXIT.

      *----------------
       0100-OPEN-FILES.
      *----------------

           PERFORM OCF-3000-OPEN-OUTPUT
              THRU OCF-3000-OPEN-OUTPUT-X.

           MOVE ZERO                   TO WIMVT-SEQ-IO-STATUS.

           OPEN INPUT IMVT-DATA-FILE.

           IF WIMVT-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR
                 THRU 9700-HANDLE-ERROR-X
           END-IF.

           MOVE ZERO                   TO WTCPM-SEQ-IO-STATUS.

           OPEN OUTPUT TCPM-DATA-FILE.

           IF WTCPM-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9800-HANDLE-ERROR
                 THRU 9800-HANDLE-ERROR-X
           END-IF.


       0100-OPEN-FILES-X.
           EXIT.

      *--------------------
       1000-INITIALIZATION.
      *--------------------

           MOVE 'N' TO WS-ERROR-SW.

           MOVE 'CP'                 TO WGLOB-COMPANY-CODE.

           MOVE 'ZSBMTCPM'           TO WGLOB-MAIN-PGM-ID
                                        WGLOB-CRNT-PGM-ID.

           PERFORM 0010-0000-INIT-PARM-INFO
              THRU 0010-0000-INIT-PARM-INFO-X.
              
           PERFORM 0010-1000-INIT-DEFAULT
              THRU 0010-1000-INIT-DEFAULT-X.
              
       1000-INITIALIZATION-X.
           EXIT.
      /
      *----------------------
       2000-PROCESS-IN-RECS.
      *----------------------

           PERFORM  9500-IMVT-READ
               THRU 9500-IMVT-READ-X.
           IF NOT WIMVT-SEQ-IO-OK
               MOVE 'Y' TO WS-ERROR-SW
               GO TO 2000-PROCESS-IN-RECS-X
           END-IF.
MP302S     MOVE ZEROES                      TO 
MP302S                                    WS-TOT-AMT-PD-MEDIC-BNFT.
MP302S     MOVE RIMVT-POL-ID                TO WPOL-POL-ID.
MP302S
MP302S     PERFORM  POL-1000-READ
MP302S         THRU POL-1000-READ-X.
MP302S
MP302S     PERFORM  CVGS-1000-LOAD-CVGS-ARRAY
MP302S         THRU CVGS-1000-LOAD-CVGS-ARRAY-X.
MP302S
MP302S     PERFORM  0290-1000-BUILD-PARM-INFO
MP302S         THRU 0290-1000-BUILD-PARM-INFO-X.

           MOVE SPACES                   TO RTCPM-SEQ-REC-INFO.
           MOVE RIMVT-REC-TYP            TO RTCPM-REC-TYP.
           MOVE RIMVT-POL-ID             TO RTCPM-POL-ID.
           MOVE RIMVT-POL-CSTAT-CD       TO RTCPM-POL-CSTAT-CD.
           MOVE RIMVT-MID-TYP-PLAN-CD    TO RTCPM-MID-TYP-PLAN-CD.
           MOVE RIMVT-SMALL-TYP-PLAN-CD  TO RTCPM-SMALL-TYP-PLAN-CD.
           MOVE RIMVT-RDR-LARGE-PLAN-CD  TO RTCPM-RDR-LARGE-PLAN-CD.
           MOVE RIMVT-RDR-PLAN-CD        TO RTCPM-RDR-PLAN-CD.
           MOVE RIMVT-BIT-4-JUVE         TO RTCPM-BIT-4-JUVE.
           MOVE RIMVT-DVDND-C1           TO RTCPM-DVDND-C1.
           MOVE RIMVT-DVDND-C2           TO RTCPM-DVDND-C2.
           MOVE RIMVT-DVDND-C3           TO RTCPM-DVDND-C3.
           MOVE RIMVT-PREM-PYMT-MODE1    TO RTCPM-PREM-PYMT-MODE1.
           MOVE RIMVT-PREM-PYMT-MODE2    TO RTCPM-PREM-PYMT-MODE2.
           MOVE RIMVT-SEX-CD             TO RTCPM-SEX-CD.
           MOVE RIMVT-X1-ISS-AGE         TO RTCPM-X1-ISS-AGE.
           MOVE RIMVT-X2-4-JUVE          TO RTCPM-X2-4-JUVE.
           MOVE RIMVT-BNFT-PERI          TO RTCPM-BNFT-PERI.
           MOVE RIMVT-PREM-PYMT-PERI     TO RTCPM-PREM-PYMT-PERI.
           MOVE RIMVT-ISS-DT             TO RTCPM-ISS-DT.
           MOVE RIMVT-FACE-AMT           TO RTCPM-FACE-AMT.
           MOVE RIMVT-MAT-AMT            TO RTCPM-MAT-AMT.
           MOVE RIMVT-AMT-IN-FORCE       TO RTCPM-AMT-IN-FORCE.
           MOVE RIMVT-AN-AMT             TO RTCPM-AN-AMT.
           MOVE RIMVT-AFYC               TO RTCPM-AFYC.
           MOVE RIMVT-BR-OFFCE-CD        TO RTCPM-BR-OFFCE-CD.
           MOVE RIMVT-LN-NUM             TO RTCPM-LN-NUM.
           MOVE RIMVT-SUB-LN-NUM         TO RTCPM-SUB-LN-NUM.
           MOVE RIMVT-PRCES-DT           TO RTCPM-PRCES-DT .
           MOVE RIMVT-DHY-MLJ-BIT        TO RTCPM-DHY-MLJ-BIT.
           MOVE RIMVT-PREM-PYMT-YR-MTH   TO RTCPM-PREM-PYMT-YR-MTH.
           MOVE RIMVT-P1-PREM            TO RTCPM-P1-PREM.
           MOVE RIMVT-P2-POL-FEE         TO RTCPM-P2-POL-FEE.
           MOVE RIMVT-CNVR-DSCNT-PREM    TO RTCPM-CNVR-DSCNT-PREM.
           MOVE RIMVT-SSTD-PREM          TO RTCPM-SSTD-PREM .
           MOVE RIMVT-PRE-PD-PREM        TO RTCPM-PRE-PD-PREM.
           MOVE RIMVT-LMPSM-PREM         TO RTCPM-LMPSM-PREM.
           MOVE RIMVT-ANN-PREM-AMT       TO RTCPM-ANN-PREM-AMT.
           MOVE RIMVT-ISS-YR-MO          TO RTCPM-ISS-YR-MO.
           MOVE RIMVT-POL-LOAN-AMT       TO RTCPM-POL-LOAN-AMT.
           MOVE RIMVT-POL-LOAN-PRCES-DT  TO RTCPM-POL-LOAN-PRCES-DT. 
           MOVE RIMVT-PCT-CANCER-BNFT    TO RTCPM-PCT-CANCER-BNFT.
           MOVE RIMVT-FEED-CREATED-DT    TO RTCPM-FEED-CREATED-DT.
           MOVE RIMVT-MVMT-TETSUZUKI-CHU TO RTCPM-MVMT-TETSUZUKI-CHU.
           MOVE RIMVT-MVMT-CD-TETSUZUKI-CHU  
                                    TO RTCPM-MVMT-CD-TETSUZUKI-CHU.
           MOVE RIMVT-POL-ID-VA2         TO RTCPM-POL-ID-VA2.
           MOVE RIMVT-CVG-NUM            TO RTCPM-CVG-NUM.
           MOVE RIMVT-APL-AMT            TO RTCPM-APL-AMT.
           MOVE RIMVT-CVG-REDN-PER       TO RTCPM-CVG-REDN-PER.
           MOVE RIMVT-INCR-AGE           TO RTCPM-INCR-AGE.
           MOVE RIMVT-EXTRA-PREM-RT      TO RTCPM-EXTRA-PREM-RT.
           MOVE RIMVT-SUM-FACE-AMT       TO RTCPM-SUM-FACE-AMT.
           MOVE RIMVT-RANK-FACE-AMT      TO RTCPM-RANK-FACE-AMT.
           MOVE RIMVT-AN-SUM-AMT         TO RTCPM-AN-SUM-AMT.
           MOVE RIMVT-RANK-AN-AMT        TO RTCPM-RANK-AN-AMT.
           MOVE RIMVT-LAPS-REINST-CTL    TO RTCPM-LAPS-REINST-CTL.
           MOVE RIMVT-BASE-POL-ISS-DT    TO RTCPM-BASE-POL-ISS-DT.
           MOVE RIMVT-BASE-POL-MAT-DT    TO RTCPM-BASE-POL-MAT-DT.
           MOVE RIMVT-RDR-MAT-DT         TO RTCPM-RDR-MAT-DT.
           MOVE RIMVT-LAPS-POL-BIT       TO RTCPM-LAPS-POL-BIT.
           MOVE RIMVT-REINST-POL-BIT     TO RTCPM-REINST-POL-BIT.
           MOVE RIMVT-SPCL-REINST-BIT    TO RTCPM-SPCL-REINST-BIT.
           MOVE RIMVT-RDR-RENW-PROG-BIT1 TO RTCPM-RDR-RENW-PROG-BIT1.
           MOVE RIMVT-RDR-RENW-PROG-BIT2 TO RTCPM-RDR-RENW-PROG-BIT2.
           MOVE RIMVT-RDR-RENW-EFF-DT    TO RTCPM-RDR-RENW-EFF-DT.
           MOVE RIMVT-CNTRCT-LAPS-EFF-DT TO RTCPM-CNTRCT-LAPS-EFF-DT.
           MOVE RIMVT-CNTRCT-REINST-EFF-DT  
                                     TO RTCPM-CNTRCT-REINST-EFF-DT.
           MOVE RIMVT-TERM-NEW-OLD-CTL  TO RTCPM-TERM-NEW-OLD-CTL.
           MOVE RIMVT-UL-PROD-CHNG-BIT  TO RTCPM-UL-PROD-CHNG-BIT.
           MOVE RIMVT-MLJ-SWTCH-BIT     TO RTCPM-MLJ-SWTCH-BIT.
           MOVE RIMVT-INC-TERM-TYP      TO RTCPM-INC-TERM-TYP.
           MOVE RIMVT-AUTO-FAC-RE-FLAG  TO RTCPM-AUTO-FAC-RE-FLAG.
           MOVE RIMVT-AGRE-DOC-NUM      TO RTCPM-AGRE-DOC-NUM.
           MOVE RIMVT-AMT-CED           TO RTCPM-AMT-CED.
           MOVE RIMVT-INSRD-MORT-RATIO  TO RTCPM-INSRD-MORT-RATIO.
           MOVE RIMVT-INC-TERM-FLAG     TO RTCPM-INC-TERM-FLAG.
           MOVE RIMVT-RPU-BIT           TO RTCPM-RPU-BIT.
           MOVE RIMVT-PROC-DT           TO RTCPM-PROC-DT.
           MOVE RIMVT-UNISYS-UNIX-FLAG  TO RTCPM-UNISYS-UNIX-FLAG.
           MOVE RIMVT-REINS-CALC-DT     TO RTCPM-REINS-CALC-DT.
           MOVE RIMVT-ISS-YR            TO RTCPM-ISS-YR.
           MOVE RIMVT-PROC-YR           TO RTCPM-PROC-YR.
           MOVE RIMVT-CHNL-CTL          TO RTCPM-CHNL-CTL.
           MOVE RIMVT-CANCER-DTH-FLAG   TO RTCPM-CANCER-DTH-FLAG.
           MOVE RIMVT-ZI-FLAG           TO RTCPM-ZI-FLAG.
           MOVE RIMVT-PREF-AUTO-CHNG-FLAG 
                                     TO RTCPM-PREF-AUTO-CHNG-FLAG.
           MOVE RIMVT-WRIT-AGT-ID       TO RTCPM-WRIT-AGT-ID.
           MOVE RIMVT-CSV-TYP-FLAG      TO RTCPM-CSV-TYP-FLAG.
           MOVE RIMVT-PREF-POL-OWNR     TO RTCPM-PREF-POL-OWNR .
           MOVE RIMVT-INGM-CSTAT-CD     TO RTCPM-INGM-CSTAT-CD.
           MOVE RIMVT-INGM-SUB-STAT-CD  TO RTCPM-INGM-SUB-STAT-CD.
           MOVE RIMVT-INGM-PREV-CSTAT-CD 
                                        TO RTCPM-INGM-PREV-CSTAT-CD.
           MOVE RIMVT-POL-CSTAT-LAST-CHG-DT 
                                    TO RTCPM-POL-CSTAT-LAST-CHG-DT.
           MOVE RIMVT-ING-PLAN-CODE     TO RTCPM-ING-PLAN-CODE.
           MOVE RIMVT-SPCL-PREM-DUR     TO RTCPM-SPCL-PREM-DUR.
           MOVE RIMVT-REINSR-CD         TO RTCPM-REINSR-CD.
           MOVE RIMVT-RATIO-OF-CED      TO RTCPM-RATIO-OF-CED.
           MOVE RIMVT-SERV-AGT-CD       TO RTCPM-SERV-AGT-CD.
           MOVE RIMVT-LCD               TO RTCPM-LCD.
           MOVE RIMVT-CSV               TO RTCPM-CSV.
           MOVE RIMVT-MVMT-EFF-DT       TO RTCPM-MVMT-EFF-DT.
MP143J     MOVE RIMVT-BR-ID             TO RTCPM-BR-ID.
MP143J     MOVE RIMVT-SO-ID             TO RTCPM-SO-ID.
MP143J     MOVE RIMVT-COI-REPRC-DT      TO RTCPM-COI-REPRC-DT.
MP143J     MOVE RIMVT-VAL-REPRC-DT      TO RTCPM-VAL-REPRC-DT.
MP143J     MOVE RIMVT-COI-REPRC-IND     TO RTCPM-COI-REPRC-IND.
MP143J     MOVE RIMVT-VAL-REPRC-IND     TO RTCPM-VAL-REPRC-IND.
TVI025*MP143J     MOVE SPACES                  TO RTCPM-PMT-LMT-EVNT.
TVI025*MP143J     MOVE ZEROES                  TO RTCPM-TOT-AMT-PD-MEDIC-BNFT.
TVI025*MP143J     MOVE SPACES                  TO RTCPM-GUAR-CD.
TVI025*MP143J     MOVE SPACES                  TO RTCPM-MAIN-CVG-FLG.
TVI025*MP143J     MOVE ZEROES                  TO RTCPM-DEFR-BNFT.
TVI025*MP143J     MOVE ZEROES                  TO RTCPM-INT-DEFR-BNFT.
TVI025*MP143J     MOVE SPACES                  TO RTCPM-CILSM-PAID-IND.
TVI025     MOVE RIMVT-PMT-LMT-EVNT          TO RTCPM-PMT-LMT-EVNT.
M319V1*MP302S
M319V1*MP302S     MOVE RIMVT-TOT-AMT-PD-MEDIC-BNFT TO L0280-INPUT-DATA.
M319V1*MP302S     SET L0280-SIGN-NOT-PERMITTED     TO TRUE.
M319V1*MP302S     MOVE LENGTH OF RIMVT-TOT-AMT-PD-MEDIC-BNFT   
M319V1*MP302S                                      TO L0280-LENGTH.
M319V1*MP302S     MOVE 0                           TO L0280-PRECISION.
M319V1*MP302S     MOVE LENGTH OF WS-TOT-AMT-PD-MEDIC-BNFT
M319V1*MP302S                                      TO L0280-INPUT-SIZE.
M319V1*MP302S     PERFORM  0280-1000-NUMERIC-EDIT
M319V1*MP302S         THRU 0280-1000-NUMERIC-EDIT-X.
M319V1*MP302S                                            
M319V1*MP302S     IF  L0280-OK
M319V1*MP302S         MOVE L0280-OUTPUT            TO WS-TOT-AMT-PD-MEDIC-BNFT
M319V1*MP302S     ELSE
M319V1*MP302S         MOVE ZEROES                  TO WS-TOT-AMT-PD-MEDIC-BNFT
M319V1*MP302S     END-IF.
M319V1*MP302S
M319V1*MP302S     IF  WCVGS-CVG-FACE-AMT(RPOL-POL-BASE-CVG-NUM) NOT = ZEROES
M319V1*MP302S         COMPUTE WS-TOT-AMT-PD-MEDIC-BNFT ROUNDED = 
M319V1*MP302S                      (WS-TOT-AMT-PD-MEDIC-BNFT
M319V1*MP302S                    / WCVGS-CVG-FACE-AMT(RPOL-POL-BASE-CVG-NUM))
M319V1*MP302S     ELSE
M319V1*MP302S         MOVE ZEROES                  TO 
M319V1*MP302S                                 WS-TOT-AMT-PD-MEDIC-BNFT
M319V1*MP302S     END-IF.
M319V1*MP302S     MOVE WS-TOT-AMT-PD-MEDIC-BNFT    TO L0290-INPUT-NUMBER.
M319V1*MP302S     MOVE WGLOB-CRCY-SCALE-QTY        TO L0290-PRECISION.
M319V1*MP302S     MOVE LENGTH OF WS-TOT-AMT-PD-MEDIC-BNFT
M319V1*MP302S                                      TO L0290-MAX-OUT-LEN.
M319V1*MP302S     PERFORM  0290-1000-NUMERIC-FORMAT
M319V1*MP302S         THRU 0290-1000-NUMERIC-FORMAT-X.
M319V1*MP302S     MOVE L0290-OUTPUT-DATA           TO
M319V1*MP302S                               RIMVT-TOT-AMT-PD-MEDIC-BNFT.
TVI025     MOVE RIMVT-TOT-AMT-PD-MEDIC-BNFT TO 
                                         RTCPM-TOT-AMT-PD-MEDIC-BNFT.
TVI025     MOVE RIMVT-GUAR-CD               TO RTCPM-GUAR-CD.
TVI025     MOVE RIMVT-MAIN-CVG-FLG          TO RTCPM-MAIN-CVG-FLG.
TVI025     MOVE RIMVT-DEFR-BNFT             TO RTCPM-DEFR-BNFT.
TVI025     MOVE RIMVT-INT-DEFR-BNFT         TO RTCPM-INT-DEFR-BNFT.
TVI025     MOVE RIMVT-CILSM-PAID-IND        TO RTCPM-CILSM-PAID-IND.
TVI025     MOVE RIMVT-MTHLY-BNFT-AMT        TO RTCPM-MTHLY-BNFT-AMT.                       
TVI025     MOVE RIMVT-GUAR-PERI-CD          TO RTCPM-GUAR-PERI-CD.                   
TVI025     MOVE RIMVT-CRC-INIT-PREM-IND     TO RTCPM-CRC-INIT-PREM-IND.                   
TVI025     MOVE RIMVT-WP-IND                TO RTCPM-WP-IND.                              
TVI025     MOVE RIMVT-WP-PREM-AMT           TO RTCPM-WP-PREM-AMT.                      
TVI025     MOVE RIMVT-BILL-TYP-CD           TO RTCPM-BILL-TYP-CD.                      
TVI025     MOVE RIMVT-ADV-PMT-PREPAY-FLAG   TO 
TVI025                                     RTCPM-ADV-PMT-PREPAY-FLAG.
TVIC37*TVI025     MOVE ZEROES                      TO RTCPM-SA-PROD-FLAG.
TVIC37*MP176K     MOVE ZEROES                      TO RTCPM-AGE-LAST-IND.
TVIC37*MP176K     MOVE ZEROES                      TO RTCPM-INS-ENTR-AGE.
TVIC37     MOVE RIMVT-SA-PROD-FLAG          TO RTCPM-SA-PROD-FLAG.
TVIC37     MOVE RIMVT-AGE-LAST-IND          TO RTCPM-AGE-LAST-IND.
TVIC37     MOVE RIMVT-INS-ENTR-AGE          TO RTCPM-INS-ENTR-AGE.
MP211E*TVIC37     MOVE ZEROES                      TO RTCPM-MKT-VAL-AMT.  
MP211E*TVIC37     MOVE ZEROES                      TO RTCPM-GA-DPOS-AMT.
MP211E*TVIC37     MOVE '+0000000.00000000'         TO RTCPM-UNIT-VALU-AMT.
MP211E*TVIC37     MOVE '+00000000000.0000'         TO RTCPM-CNT-NUM-UNIT.
MP211E     MOVE RIMVT-MKT-VAL-AMT           TO RTCPM-MKT-VAL-AMT.  
MP211E     MOVE RIMVT-GA-DPOS-AMT           TO RTCPM-GA-DPOS-AMT.
MP211E     MOVE RIMVT-UNIT-VALU-AMT         TO RTCPM-UNIT-VALU-AMT.
MP211E     MOVE RIMVT-CNT-NUM-UNIT          TO RTCPM-CNT-NUM-UNIT.
C21500*MP211E     MOVE ZEROES                      TO RTCPM-CVG-LIEN-DUR.
C21500     MOVE RIMVT-CVG-LIEN-DUR          TO RTCPM-CVG-LIEN-DUR.
MP245W*C21500     MOVE ZEROES                      TO RTCPM-INSRD-CLI-ID.
MP245W     MOVE RIMVT-INSRD-CLI-ID          TO RTCPM-INSRD-CLI-ID.
M271V1*MP245W     MOVE '0.00000'                   TO RTCPM-INT-CRED-RT.
M271V1*MP245W     MOVE 'JP'                        TO RTCPM-POL-CRCY-CD.
M271V1*MP245W     MOVE 'JP'                        TO RTCPM-PMT-CRCY-CD.
M271V1*MP245W     MOVE SPACES                      TO RTCPM-BNFT-CRCY-CD.
M271V1*MP245W     SET RTCPM-LNB-NO                 TO TRUE.
M271V1*MP245W     MOVE ZEROS                       TO RTCPM-XCHNG-RT.
MP245W
M271V1     MOVE RIMVT-INT-CRED-RT           TO RTCPM-INT-CRED-RT.
M271V1     MOVE RIMVT-POL-CRCY-CD           TO RTCPM-POL-CRCY-CD.
M271V1     MOVE RIMVT-PMT-CRCY-CD           TO RTCPM-PMT-CRCY-CD.
M271V1     MOVE RIMVT-BNFT-CRCY-CD          TO RTCPM-BNFT-CRCY-CD.
M271V1     MOVE RIMVT-LNB-IND               TO RTCPM-LNB-IND.
M271V1     MOVE RIMVT-XCHNG-RT              TO RTCPM-XCHNG-RT.
M271V1     MOVE RIMVT-NON-FACE-TO-FACE-IND  TO 
M271V1                                     RTCPM-NON-FACE-TO-FACE-IND.
M271V1     MOVE RIMVT-COINS-ALLOW-FLAG      TO RTCPM-COINS-ALLOW-FLAG.
MP281I*M271V1     MOVE '0000-00-00'                TO RTCPM-ANTY-PMT-STRT-DT.
MP281I*M271V1     MOVE ZERO                        TO RTCPM-ANTY-TYP-CD.
MP281I*M271V1     MOVE ZEROS                       TO RTCPM-ANTY-PMT-PERI.
MP281I*M271V1     MOVE '0.00000'                   TO RTCPM-ANTY-CAP-RT.
MP281I*M271V1     MOVE ZEROS                       TO RTCPM-ANTY-CAP-AMT.
MP281I*M271V1     MOVE ZEROS                       TO RTCPM-ANTY-PMT-STRT-AGE.
MP281I*M271V1     MOVE ZEROS                       TO RTCPM-MULT-PMT-ANN-AMT.
MP281I*M271V1     MOVE ZERO                        TO RTCPM-TAX-DED-CAT-IND.
MP281I     MOVE RIMVT-ANTY-PMT-STRT-DT      TO RTCPM-ANTY-PMT-STRT-DT.
MP281I     MOVE RIMVT-ANTY-TYP-CD           TO RTCPM-ANTY-TYP-CD.
MP281I     MOVE RIMVT-ANTY-PMT-PERI         TO RTCPM-ANTY-PMT-PERI.
MP281I     MOVE RIMVT-ANTY-CAP-RT           TO RTCPM-ANTY-CAP-RT.
MP281I     MOVE RIMVT-ANTY-CAP-AMT          TO RTCPM-ANTY-CAP-AMT.
MP281I     MOVE RIMVT-ANTY-PMT-STRT-AGE     TO RTCPM-ANTY-PMT-STRT-AGE.
MP281I     MOVE RIMVT-MULT-PMT-ANN-AMT      TO RTCPM-MULT-PMT-ANN-AMT.
MP281I     MOVE RIMVT-TAX-DED-CAT-IND       TO RTCPM-TAX-DED-CAT-IND.
MP289A*MP281I     MOVE ZEROES                      TO RTCPM-JGAAP-AP-AMT.
MP289A*MP281I     MOVE ZEROES                      TO RTCPM-PROD-SECTOR-CD.
MP289A     MOVE RIMVT-JGAAP-AP-AMT          TO RTCPM-JGAAP-AP-AMT.
MP289A     MOVE RIMVT-PROD-SECTOR-CD        TO RTCPM-PROD-SECTOR-CD.
MP300C*MP289A     MOVE SPACES                      TO RTCPM-SUB-CHNL-CTL-CD.
MP300C*MP289A     MOVE ZEROES                      TO RTCPM-SUB-AGT-CD.
MP300C     MOVE RIMVT-SUB-CHNL-CTL-CD       TO RTCPM-SUB-CHNL-CTL-CD.
MP300C     MOVE RIMVT-SUB-AGT-CD            TO RTCPM-SUB-AGT-CD.
MP302S*MP300C     MOVE ZERO                        TO RTCPM-UW-FORM-RECV-CD.
MP302S     MOVE RIMVT-UW-FORM-RECV-CD       TO RTCPM-UW-FORM-RECV-CD.
M319V1*MP302S     MOVE ZERO                        TO RTCPM-SRVBEN-DEFR-AMT.    
M319V1*MP302S     MOVE ZERO                        TO 
M319V1*MP302S                                     RTCPM-SRVBEN-DEFR-INT-AMT.
M319V1     MOVE RIMVT-SRVBEN-DEFR-AMT       TO RTCPM-SRVBEN-DEFR-AMT.    
M319V1     MOVE RIMVT-SRVBEN-DEFR-INT-AMT   TO 
M319V1                                      RTCPM-SRVBEN-DEFR-INT-AMT.
M319V1     MOVE ZERO                        TO RTCPM-AEE-PREM-NBE-AMT.
M319V1     MOVE ZERO                        TO RTCPM-AEE-FA-NBE-AMT.
M319V1     MOVE ZERO                       TO RTCPM-AEE-RSRV-NBE-AMT.
M319V1     MOVE ZERO                    TO RTCPM-AEE-NUM-CAS-NBE-AMT.
M319V1     MOVE ZERO                        TO RTCPM-AEE-PREM-ME-AMT.
M319V1     MOVE ZERO                        TO RTCPM-AEE-FA-ME-AMT.
M319V1     MOVE ZERO                        TO RTCPM-AEE-RSRV-ME-AMT.
M319V1     MOVE ZERO                     TO RTCPM-AEE-NUM-CAS-ME-AMT.
M319V1     MOVE ZERO                        TO RTCPM-AEE-PREM-CE-AMT.
M319V1     MOVE ZERO                        TO RTCPM-AEE-FA-CE-AMT.
M319V1     MOVE ZERO                        TO RTCPM-AEE-RSRV-CE-AMT.
M319V1     MOVE ZERO                     TO RTCPM-AEE-NUM-CAS-CE-AMT.
M319V1     MOVE ZERO                        TO RTCPM-AOE-PREM-AMT.
M319V1     MOVE ZERO                        TO RTCPM-AOE-FACE-AMT.
M319V1     MOVE ZERO                        TO RTCPM-AOE-RSRV-AMT.
M319V1     MOVE ZERO                        TO RTCPM-AOE-NUM-CAS-AMT.
M319V1     MOVE ZERO                        TO RTCPM-ACUM-INT.
MP143J*     PERFORM  0083-0000-INIT-PARM-INFO
MP143J*         THRU 0083-0000-INIT-PARM-INFO-X.
  
MP143J*     MOVE RIMVT-WRIT-AGT-ID      TO L0083-AGENT-ID.
  
MP143J*     PERFORM  0083-1000-RETRIEVE-AGT-INFO
MP143J*         THRU 0083-1000-RETRIEVE-AGT-INFO-X.
  
MP143J*     MOVE L0083-AGT-BR-ID            TO RTCPM-BR-ID.
MP143J*     MOVE L0083-AGT-SO-ID            TO RTCPM-SO-ID.

            PERFORM  9400-TCPM-WRITE
                THRU 9400-TCPM-WRITE-X.

       2000-PROCESS-IN-RECS-X.
           EXIT.

      *----------------
       9400-TCPM-WRITE.
      *----------------

           MOVE ZERO                   TO WTCPM-SEQ-IO-STATUS.

           WRITE RTCPM-SEQ-REC-INFO.

           IF WTCPM-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9800-HANDLE-ERROR
                 THRU 9800-HANDLE-ERROR-X
           END-IF.

       9400-TCPM-WRITE-X.
           EXIT.

      *---------------
       9500-IMVT-READ.
      *---------------

           MOVE ZERO                   TO WIMVT-SEQ-IO-STATUS.

           READ IMVT-DATA-FILE
                AT END
                  MOVE 8               TO WIMVT-SEQ-IO-STATUS
                  GO TO 9500-IMVT-READ-X.

           IF RIMVT-SEQ-REC-INFO EQUAL HIGH-VALUES
              MOVE 8                   TO WIMVT-SEQ-IO-STATUS
           END-IF.

           IF WIMVT-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR
                 THRU 9700-HANDLE-ERROR-X
           END-IF.

       9500-IMVT-READ-X.
           EXIT.

      *-----------------------
       9700-HANDLE-ERROR.
      *-----------------------

           MOVE WIMVT-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WIMVT-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WIMVT-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9700-HANDLE-ERROR-X.
           EXIT.

      *-----------------------
       9800-HANDLE-ERROR.
      *-----------------------

           MOVE WTCPM-SEQ-FILE-NAME    TO WGLOB-TABLE-NAME.
           MOVE WTCPM-SEQ-FILE-STATUS  TO WGLOB-SEQ-FILE-STATUS.
           MOVE WTCPM-SEQ-IO-COMMAND   TO WGLOB-IO-COMMAND.
           PERFORM 0030-3000-QSAM-ERROR
              THRU 0030-3000-QSAM-ERROR-X.

       9800-HANDLE-ERROR-X.
           EXIT.

      *-----------------
       9999-CLOSE-FILES.
      *-----------------

           MOVE ZERO                   TO WIMVT-SEQ-IO-STATUS.

           CLOSE IMVT-DATA-FILE.

           IF WIMVT-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9700-HANDLE-ERROR
                 THRU 9700-HANDLE-ERROR-X
           END-IF.

           MOVE ZERO                   TO WTCPM-SEQ-IO-STATUS.

           CLOSE TCPM-DATA-FILE.

           IF WTCPM-SEQ-FILE-STATUS  NOT = ZERO
              PERFORM 9800-HANDLE-ERROR
                 THRU 9800-HANDLE-ERROR-X
           END-IF.

           PERFORM OCF-4000-CLOSE
              THRU OCF-4000-CLOSE-X.

       9999-CLOSE-FILES-X.
           EXIT.

      *******  I/O ROUTINES

       COPY XCPOOCF.

      ******   LINKAGE ROUTINES

       COPY CCPL0010.
       COPY CCPS0010.

       COPY XCPL0030.
       COPY XCPL0040.
       COPY XCPL0260.
       COPY XCPL1660.
       COPY XCPL1680.
       COPY CCPL0083.
       COPY CCPS0083.
       COPY XCPLOCF.
MP302S COPY XCPS0290.
MP302S COPY XCPL0290.
MP302S COPY XCPL0280.
MP302S COPY NCPPCVGS.
MP302S COPY CCPNCVG.
MP302S COPY CCPNPOL.

      *****************************************************************
      **                 END OF PROGRAM ZSBMTCPM                     **
      *****************************************************************
