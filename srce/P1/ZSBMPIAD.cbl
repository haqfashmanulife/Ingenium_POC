      *****************************************************************
      **  MEMBER :  ZSBMPIAD                                         **
      **  REMARKS:  PIRA ADHOC REPORT GENERATION FOR SALES CAMPAIGN  **
      **                                                             **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
PIRAAD**  01AUG06  CTS    PIRA ADHOC REPORT GENERATION               **
B00038**  01AUG06  CTS    ADD 43100 TO 88 LEVEL FOR ACCD. OUTPATIENT **
ACU001**  01AUG06  CTS    ADD 43700 TO 88 LEVEL FOR C-TYPE HOSPITAL  **
ACU001**                  REMOVE CHECK FOR CLAIMS HISTORY SINCE CUST.**
ACU001**                  IO MODULE WILL EXCLUDE THOSE INSUREDS      **
EN3734**  27JUN08  CTS    ADD 46800 AND 46900 TO 88 LEVEL FOR CANCER **
EN3734**                  DEATH COVERAGE                             **
EN3734**                  ADD 47000 TO 88 LEVEL FOR DREAD DISEASE.   **
EN3734**                  ADD CHECK FOR CLAIMS HISTORY PAID.	     **
EN3734**                  ADD CHECK FOR SUBSTANDARD CONDITION.	     **
EN3734**  31JUL08  CTS    REMOVE CHECK FOR EXCEPTION RECORDS.        **
EN3734**                  ADD CHECK FOR AMENDMENT EXCLUSION.         **
SCVIPN**  02JUL09  CTS   COMMENTED OUT THE HEADER AND CHANGED THE    **
SCVIPN**                  INSURED NAME FROM KANJI TO KANA            **
MP126C**  01JUN10  CTS   ADD COVERAGE MULTIPLE EXTRA PREMIUM AMOUNT  **
MP126C**                 CHECK IN 6900-CHECK-FOR-SSTD PARA           **
M142A2**  20JUL11  CTS    ADD NEW RENEWAL PLANS 41502 AND 41602      **
MP213I**  26FEB13  CTS    ADD NEW FIELDS FOR RUM RIDERS              **
Q30804**  27FEB13  CTS    MP213I FIX FOR PRIMARY RIDER FA            **
Q34441**  04JUN13  CTS    MP213I FIX FOR LIEN EXPIRY CHECK           **
      *****************************************************************
 
      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID. ZSBMPIAD.
 
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
 
       COPY XCWWPGWS REPLACING '$VAR1' BY 'ZSBMPIAD'.
 
       COPY SQLCA.
 
 
       01  WS-CONSTANTS.         
           05  WS-PLAN-CD-500                  PIC X(03) 
                                               VALUE '500'.
           05  WS-WRITE-LIMIT                  PIC S9(08) COMP
                                               VALUE 60001.
 
 
       01  WS-MSGS.         
           05  WS-MSG-AMEX-EXCLUSION.      
               10  WS-MSG-AMEX-EXCLUSION-1     PIC X(53) VALUE
          'ALL COVERAGES OMITTED FOR POLICY NUMBER @1 FOR CLIENT'.
               10  WS-MSG-AMEX-EXCLUSION-2     PIC X(37) VALUE
          ' ID @2 BECAUSE EXCLUSION RECORD FOUND'.

           05  WS-MSG-CLAIM-HISTORY.
               10  WS-MSG-CLAIM-HISTORY-1      PIC X(54) VALUE
          'COVERAGE @1 OMITTED FOR POLICY NUMBER @2 FOR CLIENT ID'.
               10  WS-MSG-CLAIM-HISTORY-2      PIC X(32) VALUE
          ' @3 BECAUSE CLAIMS HISTORY FOUND'.

           05  WS-MAX-MSG-LEN                  PIC S9(04) COMP
                                               VALUE 132.

 
      *TOTAL SIZE IS 673.
      *ADD FILLER OF  67 TO MAKE IT AS 740.     
       01  WS-RPT-HDR.                                                    
           05  WS-HDR-1                        PIC X(49) VALUE
          'RO,SO,PA (Servicing Agent ID & Name),Plan Code - '.
           05  WS-HDR-2                        PIC X(50) VALUE
          'Policy ID / Insured Name,Regular Premium,Insured''s'.
           05  WS-HDR-3                        PIC X(48) VALUE
          ' Date of Birth,Policy Issue date,Preferred Term,'.
           05  WS-HDR-4                        PIC X(52) VALUE
          'Nonsmoker Term,Term,Nonsmoker Whole Life,Whole Life,'.
EN3734*    05  WS-HDR-5                        PIC X(49) VALUE
EN3734*   'Living Needs,UL Accidental Death,UL Adult Injury,'.
EN3734*    05  WS-HDR-6                        PIC X(51) VALUE
EN3734*   'Short-Term Hospitalization,Hospitalization-Disease,'.
EN3734*    05  WS-HDR-7                        PIC X(51) VALUE
EN3734*   'Hospitalization-Accident,Long Term Hospitalization,'.
EN3734*    05  WS-HDR-8                        PIC X(47) VALUE
EN3734*   'C-Type Hospital,Outpatient,Discharge,Accidental'.
EN3734*    05  WS-HDR-9                        PIC X(50) VALUE
EN3734*   ' Outpatient,Fracture,Adult Disease,Female Disease,'.
EN3734*    05  WS-HDR-10                       PIC X(48) VALUE
EN3734*   'C-Type Adult Disease,C-Type Female Disease,Dread'.
EN3734*    05  WS-HDR-11                       PIC X(48) VALUE
EN3734*   ' Disease,Cancer Lump Sum,Cancer Hospitalization,'.
EN3734*    05  WS-HDR-12                       PIC X(48) VALUE
EN3734*   'Cancer Outpatient,Cancer Death Coverage,Terminal'.
EN3734*    05  WS-HDR-13                       PIC X(36) VALUE
EN3734*   ' Care Benefits,Variable Accumulation'.
EN3734*    05  FILLER                          PIC X(13)         
EN3734*                                        VALUE SPACES.
EN3734     05  WS-HDR-5                        PIC X(52) VALUE
EN3734    'FIP,NSFIP,Living Needs,UL Accidental Death,UL Adult '.
EN3734     05  WS-HDR-6                        PIC X(50) VALUE
EN3734    'Injury,Short-Term Hospitalization,Hospitalization-'.
EN3734     05  WS-HDR-7                        PIC X(43) VALUE
EN3734    'Disease,Hospitalization-Accident,Long Term '.
EN3734     05  WS-HDR-8                        PIC X(53) VALUE
EN3734    'Hospitalization,C-Type Hospital,Outpatient,Discharge,'.
EN3734     05  WS-HDR-9                        PIC X(52) VALUE
EN3734    'Accidental Outpatient,Fracture,Adult Disease,Female '.
EN3734     05  WS-HDR-10                       PIC X(51) VALUE
EN3734    'Disease,C-Type Adult Disease,C-Type Female Disease,'.
EN3734     05  WS-HDR-11                       PIC X(42) VALUE
EN3734    'Dread Disease,DDIP,Cancer Lump Sum,Cancer '.
EN3734     05  WS-HDR-12                       PIC X(47) VALUE
EN3734    'Hospitalization,Cancer Outpatient,Cancer Death '.
EN3734     05  WS-HDR-13                       PIC X(41) VALUE
EN3734    'Coverage,Terminal Care Benefits,Variable '.
EN3734     05  WS-HDR-14                       PIC X(43) VALUE
EN3734    'Accumulation,Claim Paid,Substandard Premium'.
EN3734     05  FILLER                          PIC X(67)
EN3734                                         VALUE SPACES.

       01  WS-SWITCHES-AND-INDICATORS.         
           05  WS-PLAN-ID                      PIC X(06).
               88  WS-PLAN-PREF-TERM           VALUE '41400','46300'.
               88  WS-PLAN-NON-SM-TERM         VALUE '41500','41501',
M142A2*                                              '46400'.
M142A2                                               '46400','41502'.
               88  WS-PLAN-TERM                VALUE '41600','41601',
M142A2*                                              '46500'.
M142A2                                               '46500','41602'.
               88  WS-PLAN-NON-SM-WL           VALUE '41700','41701',
                                                     '46600'.
               88  WS-PLAN-WL                  VALUE '41800','41801',
                                                     '46700'.
EN3734         88  WS-PLAN-FIP                 VALUE '46800'.
EN3734         88  WS-PLAN-NSFIP               VALUE '46900'.
               88  WS-PLAN-UL-ACC-DTH          VALUE '42700'.
               88  WS-PLAN-UL-ADLT-INJ         VALUE '42800'.
               88  WS-PLAN-HOSP-SHT            VALUE '43000','45100',
                                                     '45200'.
               88  WS-PLAN-HOSP-DIS            VALUE '42000','43400',
EN3734*                                              '43500'.
EN3734                                               '43500','70300',
EN3734                                               '70400'.
               88  WS-PLAN-HOSP-ACC            VALUE '41900','43200',
EN3734*                                              '43300'.
EN3734                                               '43300','70100',
EN3734                                               '70200'.
               88  WS-PLAN-HOSP-LT             VALUE '42100'.
ACU001*        88  WS-PLAN-CT-HOSP             VALUE '43600'.
EN3734*ACU001  88  WS-PLAN-CT-HOSP             VALUE '43600','43700'.
EN3734         88  WS-PLAN-CT-HOSP             VALUE '43600','43700',
EN3734                                               '70500','70600'.
               88  WS-PLAN-OUTP                VALUE '42300','44000',
EN3734*                                              '44100'.
EN3734                                               '44100','70900',
EN3734                                               '71000'.
               88  WS-PLAN-DISCH               VALUE '42200','43800',
EN3734*                                              '43900'.
EN3734                                               '43900','70700',
MP213I*EN3734                                               '70800'.
MP213I                                               '70800','74600',
MP213I                                               '74700'.
B00038         88  WS-PLAN-ACCD-OUT            VALUE '45300', '43100'.
EN3734*        88  WS-PLAN-FRACTURE            VALUE '45400'.
EN3734         88  WS-PLAN-FRACTURE            VALUE '45400','72000'.
               88  WS-PLAN-ADLT-DIS            VALUE '42400','44200',
EN3734*                                              '44300'.
EN3734                                               '44300','71100',
MP213I*EN3734                                               '71200'.
MP213I                                               '71200','74200',
MP213I                                               '74300'.
               88  WS-PLAN-FEM-DIS             VALUE '42500','44600',
EN3734*                                              '44700'.
EN3734                                               '44700','71500',
MP213I*EN3734                                               '71600'.
Q30804*MP213I                                               '71600','74000',
Q30804                                               '71600','74400',
MP213I                                               '74500'. 
EN3734*        88  WS-PLAN-CT-ADLT-DIS         VALUE '44400','44500'.
EN3734         88  WS-PLAN-CT-ADLT-DIS         VALUE '44400','44500',
EN3734                                               '71300','71400'.
EN3734*        88  WS-PLAN-CT-FEM-DIS          VALUE '44800','44900'.
EN3734         88  WS-PLAN-CT-FEM-DIS          VALUE '44800','44900',
EN3734                                               '71700','71800'.
EN3734*        88  WS-PLAN-DREAD-DIS           VALUE '42600','45000'.
EN3734         88  WS-PLAN-DREAD-DIS           VALUE '42600','45000',
EN3734                                               '71900'.
EN3734         88  WS-PLAN-DDIP                VALUE '47000'.
EN3734*        88  WS-PLAN-CNCR-LUMP-SUM       VALUE '45700','45800'.
EN3734         88  WS-PLAN-CNCR-LUMP-SUM       VALUE '45700','45800',
EN3734                                               '72300','72400'.
EN3734*        88  WS-PLAN-CNCR-HOSP           VALUE '45500','45600'.
EN3734         88  WS-PLAN-CNCR-HOSP           VALUE '45500','45600',
MP213I*EN3734                                        '72100','72200'.
MP213I                                               '72100','72200'
MP213I                                               '75000','75100'.
EN3734*        88  WS-PLAN-CNCR-OUTP           VALUE '45900','46000'.
EN3734         88  WS-PLAN-CNCR-OUTP           VALUE '45900','46000',
EN3734                                               '72500','72600'.
EN3734*        88  WS-PLAN-CNCR-DTH-CVG        VALUE '46100','46200'.
EN3734         88  WS-PLAN-CNCR-DTH-CVG        VALUE '46100','46200',
MP213I*EN3734                                        '72700','72800'.
MP213I                                               '72700','72800',
MP213I                                               '75400','75500'.
               88  WS-PLAN-VAR-ACC             VALUE '70000'.
MP213I         88  WS-PLAN-PRIM-MEDIC          VALUE '74000','74100'.
MP213I         88  WS-PLAN-CRIT-ILL            VALUE '74800'.
MP213I         88  WS-PLAN-CANCER-DIAGNS       VALUE '75200','75300'.              
MP213I         88  WS-PLAN-ADV-MEDIC           VALUE '74900'.
               
               
           05  WS-AMEX-EXCLUSION-IND           PIC X(01).
               88  WS-AMEX-EXCLUSION-YES       VALUE 'Y'.
               88  WS-AMEX-EXCLUSION-NO        VALUE 'N'.
ACU001*    05  WS-CLAIM-HIST-IND               PIC X(01).
ACU001*        88  WS-CLAIM-HIST-YES           VALUE 'Y'.
ACU001*        88  WS-CLAIM-HIST-NO            VALUE 'N'.
EN3734 01  WS-CVG-ME-FCT-1                     PIC S9V99 COMP-3
EN3734                                         VALUE +1.00.
 
 
       01  WS-COUNTERS.         
           05  WS-TOTAL-READ-CTR               PIC S9(08) COMP.
           05  WS-TOTAL-WRITTEN-CTR            PIC S9(08) COMP.
           05  WS-TOTAL-FAIL-CTR               PIC S9(08) COMP.
           05  WS-TOTAL-SKIP-CTR               PIC S9(08) COMP.
           05  WS-TOTAL-FILE-CTR               PIC S9(08) COMP.
           05  WS-TEMP-CTR                     PIC S9(08) COMP.
 

       01  WS-ERROR-CTR-LINE.
           05  WS-ERROR-CTR-LABEL              PIC X(40).
           05  FILLER                          PIC X(01).
           05  WS-ERROR-CTR-NUM                PIC ZZ,ZZZ,ZZ9..
           05  FILLER                          PIC X(83).
 

       01  WS-BCF-CARD-AREA.
           05  WS-PARM-DESCRIPTION             PIC X(20).
               88  WS-PROCESS-DATE             VALUE 'PROCESS DATE'.
           05  FILLER                          PIC X(01)  VALUE '='.
           05  WS-PARM-VALUE                   PIC X(59)  VALUE SPACES.


       01  WS-BCF-PROCESS-DATE                 PIC X(10) VALUE SPACES.

       01  WS-PGM-WORK-AREA.
           05  WS-PREV-INFO.                                
               10  WS-PREV-AGT-ID              PIC X(06) VALUE SPACES.          
               10  WS-PREV-POL-ID              PIC X(10) VALUE SPACES.          
               10  WS-PREV-CLI-ID              PIC X(10) VALUE SPACES.
           05  WS-CURR-INFO.                                
               10  WS-CURR-AGT-ID              PIC X(06) VALUE SPACES.          
               10  WS-CURR-POL-ID              PIC X(10) VALUE SPACES.          
               10  WS-CURR-CLI-ID              PIC X(10) VALUE SPACES.
           05  WS-EXCL-INFO.                                
               10  WS-PREV-EXCL-POL-ID         PIC X(10) VALUE SPACES.
               10  WS-PREV-EXCL-CLI-ID         PIC X(10) VALUE SPACES.
EN3734     05  WS-CLAIMS-HIST-IND              PIC X(01).
EN3734         88  WS-CLAIMS-HIST-YES          VALUE '*'.
EN3734         88  WS-CLAIMS-HIST-NO           VALUE ' '.
MP213I     05  WS-LIEN-XPRY-DT                 PIC X(10).


       01  WS-SEQ-REC-INFO.
      *RECORD LENGTH IS 521. HEADER SIZE IS 740      
      *HAVE SOME FILLER TO MAKE IT AS 219. SO FILLER SIZE IS 740.
      
           05  WS-PIAD-SERV-BR-ID              PIC X(05).
           05  FILLER                          PIC X(01)  VALUE ','. 
           05  WS-PIAD-SO-ID                   PIC X(06).
           05  FILLER                          PIC X(01)  VALUE ','.
           05  WS-PIAD-SERV-AGT-ID             PIC X(06).
           05  FILLER                          PIC X(01)  VALUE '-'.
           05  WS-PIAD-SERV-AGT-NAME           PIC X(64).
           05  FILLER                          PIC X(01)  VALUE ','.
           05  WS-PLAN-CD                      PIC X(03)  VALUE '500'.
           05  FILLER                          PIC X(01)  VALUE '-'.
           05  WS-PIAD-POL-ID                  PIC X(07).
           05  FILLER                          PIC X(01)  VALUE '/'.
           05  WS-PIAD-INSRD-NAME              PIC X(64).
           05  FILLER                          PIC X(01)  VALUE ','.
           05  WS-REG-PREM                     PIC 9(12).

           05  FILLER                          PIC X(01)  VALUE ','.
           05  WS-PIAD-INS-DOB.
               10   WS-PIAD-INS-DOB-YYYY       PIC X(04).
               10   WS-PIAD-INS-DOB-MM         PIC X(02).
               10   WS-PIAD-INS-DOB-DD         PIC X(02).
           05  FILLER                          PIC X(01)  VALUE ','.
           05  WS-PIAD-POL-ISS-EFF-DT.
               10   WS-PIAD-POL-ISS-EFF-DT-YYYY PIC X(04).
               10   WS-PIAD-POL-ISS-EFF-DT-MM   PIC X(02).
               10   WS-PIAD-POL-ISS-EFF-DT-DD   PIC X(02).
           05  FILLER                          PIC X(01)  VALUE ','.
          
           05  WS-PIAD-CVG-FACE-AMT.            .
               10   WS-PREF-TERM-FA            PIC 9(12).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-NON-SM-TERM-FA          PIC 9(12).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-TERM-FA                 PIC 9(12).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-NON-SM-WL-FA            PIC 9(12).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-WL-FA                   PIC 9(12).
               10   FILLER                     PIC X(01)  VALUE ','.
EN3734         10   WS-WL-FIP                  PIC 9(12).
EN3734         10   FILLER                     PIC X(01)  VALUE ','.
EN3734         10   WS-WL-NSFIP                PIC 9(12).
EN3734         10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-LNB-IND                 PIC X(01).                       
                    88  WS-LNB-YES             VALUE '*'.          
                    88  WS-LNB-NO              VALUE ' '.          
               10   FILLER                     PIC X(01)  VALUE ','.            
                         
               10   WS-UL-ACC-DTH-FA           PIC 9(12).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-UL-ADLT-INJ-FA          PIC 9(12).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-ST-HOSP-FA              PIC 9(09).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-HOSP-DIS-FA             PIC 9(09).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-HOSP-ACC-FA             PIC 9(09).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-LT-HOSP-FA              PIC 9(09).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-CT-HOSP-FA              PIC 9(09).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-OUTP-FA                 PIC 9(09).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-DISCH-FA                PIC 9(09).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-ACC-OUTP-FA             PIC 9(09).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-FRACTURE-FA             PIC 9(09).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-ADLT-DIS-FA             PIC 9(09).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-FEM-DIS-FA              PIC 9(09).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-CT-ADLT-DIS-FA          PIC 9(09).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-CT-FEM-DIS-FA           PIC 9(09).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-DREAD-DIS-FA            PIC 9(12).
               10   FILLER                     PIC X(01)  VALUE ','.
EN3734         10   WS-DDIP                    PIC 9(12).
EN3734         10   FILLER                     PIC X(01)  VALUE ','.               
               10   WS-CNCR-LUMP-SUM-FA        PIC 9(12).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-CNCR-HOSP-FA            PIC 9(09).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-CNCR-OUTP-FA            PIC 9(09).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-CNCR-DTH-CVG-FA         PIC 9(12).
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-TCB-IND                 PIC X(01).
                    88  WS-TCB-YES             VALUE '*'.
                    88  WS-TCB-NO              VALUE ' '.
               10   FILLER                     PIC X(01)  VALUE ','.
               10   WS-VAR-ACC-IND             PIC X(01).
                    88  WS-VAR-ACC-YES         VALUE '*'.
                    88  WS-VAR-ACC-NO          VALUE ' '.
EN3734         10   FILLER                     PIC X(01)  VALUE ','.
EN3734         10   WS-CLAIMS-HIST-CD          PIC X(01).
EN3734         10   FILLER                     PIC X(01)  VALUE ','.
EN3734         10   WS-SSTD-IND                PIC X(01).
EN3734              88  WS-SSTD-YES            VALUE '*'.
EN3734              88  WS-SSTD-NO             VALUE ' '.
EN3734
MP213I         10   FILLER                     PIC X(01)  VALUE ','.
MP213I         10   WS-PRIM-MEDIC-FA           PIC 9(09).
MP213I         10   FILLER                     PIC X(01)  VALUE ','.
MP213I         10   WS-CRIT-ILL-FA             PIC 9(12).
MP213I         10   FILLER                     PIC X(01)  VALUE ','.
MP213I         10   WS-CANCER-DIAGNS-FA        PIC 9(12).
MP213I         10   FILLER                     PIC X(01)  VALUE ','.
MP213I         10   WS-ADV-MEDIC-IND           PIC X(01).
MP213I              88  WS-ADV-MEDIC-YES       VALUE '*'.
MP213I              88  WS-ADV-MEDIC-NO        VALUE ' '. 
EN3734*         10   FILLER                     PIC X(162)
EN3734*                                         VALUE SPACES.
MP213I*EN3734         10   FILLER                     PIC X(219)
MP213I*EN3734                                         VALUE SPACES.
MP213I         10   FILLER                     PIC X(182) 
MP213I                                         VALUE SPACES.


      *****************************************************************         
      * COPYBOOKS                                                     *         
      *****************************************************************         
      /
       COPY XCWTFCMD.
       COPY CCWWINDX.
       COPY XCWLDTLK.
       COPY XCWWHDG.
      /
       COPY CCWWCCC.
       COPY CCWL0010.
       COPY CCWL0950.
       COPY XCWL0040.
       COPY XCWL1640.
       COPY CCWL0460.
       COPY XCWL0270.
      /
       COPY CCWL0083.
       COPY CCWL2435.
      /       
MP213I COPY XCWL1680.
MP213I COPY XCWL1670.
      /
      * SQL IO 
       COPY ZCFWPIAD.
       COPY ZCFRPIAD.
      /
       COPY NCFWAMEX.
       COPY NCFRAMEX.
      /
ACU001*COPY CCFWCLB5.
ACU001*COPY CCFRCLBN.
      /
EN3734 COPY CCFWCLB5.
EN3734 COPY CCFRCLBN.
      /      
       COPY NCFWCLUA.
       COPY NCFRCLIU.
      /
       COPY CCFWMAST.
       COPY CCFRMAST.
      /
      * SEQUENTIAL IO
       COPY XCSWPRT  REPLACING ==:ID:==  BY OCF 
                               ==':ID:'==  BY =='OCF'==.
       COPY XCSROCF.

       COPY XCSWSEQ  REPLACING ==:ID:==  BY BCF
                               ==':ID:'==  BY =='BCF'==.
       COPY XCSRBCF.

       COPY XCSWSEQ  REPLACING ==:ID:==  BY PIAD 
                               ==':ID:'==  BY =='PIAD'==.
       COPY ZCSRPIAD.
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
 
           PERFORM  2000-INITIALIZE
               THRU 2000-INITIALIZE-X.
 
      *PROCESS RECORDS FROM CUSTOM IO MODULE
           PERFORM  3000-PROCESS-RECORDS
               THRU 3000-PROCESS-RECORDS-X.
 
           PERFORM  9000-PRINT-TOTALS
               THRU 9000-PRINT-TOTALS-X.
 
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
 
           PERFORM  PIAD-3000-OPEN-OUTPUT
               THRU PIAD-3000-OPEN-OUTPUT-X.
 
       0100-OPEN-FILES-X.
           EXIT.
      /
      *----------------   
       2000-INITIALIZE.
      *----------------
 
           PERFORM  2100-INIT-OCF-TITLES
               THRU 2100-INIT-OCF-TITLES-X.
 
           PERFORM  2200-PROC-CNTRL-CARD
               THRU 2200-PROC-CNTRL-CARD-X 
         
      *INITIALIZE ALL THE WORKING STORAGE VARIABLES
           PERFORM  9900-INIT-WORKING-STORAGE
               THRU 9900-INIT-WORKING-STORAGE-X.
       
      *WRITE THE HEADER FOR THE FIRST TIME
SCVIPN*    PERFORM  8100-WRITE-RPT-HDR
SCVIPN*        THRU 8100-WRITE-RPT-HDR-X.
       
       2000-INITIALIZE-X.
           EXIT.
      /
      *---------------------
       2100-INIT-OCF-TITLES.
      *---------------------
 
      *GET PROGRAM ID AND COMPANY CODE FROM BCF
           PERFORM  CCC-1000-PRCES-CO-CTL-CARD
               THRU CCC-1000-PRCES-CO-CTL-CARD-X.

      *GET COMPANY NAME FROM PCOM
           PERFORM  0950-0000-INIT-PARM-INFO
               THRU 0950-0000-INIT-PARM-INFO-X.

           PERFORM  0950-1000-GET-COMPANY-NAME
               THRU 0950-1000-GET-COMPANY-NAME-X.

           MOVE L0950-COMPANY-NAME          TO L0040-COMPANY-NAME.
           MOVE ZERO                        TO L0040-ERROR-CNT.

      *GET THE SYSTEM ID - INGENIUM 6.1.2 J
           MOVE 'XS00000145'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-SYSTEM-ID.

      *GET THE PROGRAM DESCRIPTION - PIRA ADHOC REPORT FOR SALES CAMPAIGN
           MOVE 'PIRA ADHOC REPORT FOR SALES CAMPAIGN'
                                            TO L0040-PROGRAM-DESC.
      *GET THE TEXT "RUN MESSAGES"
           MOVE 'XS00000153'                TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-2000-GET-MESSAGE
               THRU 0260-2000-GET-MESSAGE-X.
           MOVE WGLOB-MSG-TXT               TO L0040-HDG-LINE-3.

      *WRITE THE DETAILS TO OCF FILE
           PERFORM  0040-1000-INIT-TITLE
               THRU 0040-1000-INIT-TITLE-X.
 
       2100-INIT-OCF-TITLES-X.
           EXIT.
      /
      *---------------------
       2200-PROC-CNTRL-CARD.
      *---------------------
 
      *READ PROCESS DATE FROM BCF
           PERFORM  BCF-1000-READ
               THRU BCF-1000-READ-X.

           PERFORM  2250-READ-CNTRL-CARD
               THRU 2250-READ-CNTRL-CARD-X
               UNTIL WBCF-SEQ-IO-EOF.
 
      *CHECK THE PROCESS DATE, IF NEEDED DEFAULT FROM TMAST 
           PERFORM  2275-EDIT-PROCESS-DATE
               THRU 2275-EDIT-PROCESS-DATE-X.

       2200-PROC-CNTRL-CARD-X.
           EXIT.
      /
      *---------------------
       2250-READ-CNTRL-CARD.
      *---------------------
 
           IF  WBCF-SEQ-IO-OK
      *WRITE THE CONTENT OF CONTROL CARD TO OCF 
               MOVE  RBCF-SEQ-REC-INFO      TO WS-BCF-CARD-AREA
               MOVE  RBCF-SEQ-REC-INFO      TO L0040-INPUT-LINE
               PERFORM  0040-3000-WRITE-OTHER
                   THRU 0040-3000-WRITE-OTHER-X
           END-IF.

           EVALUATE TRUE
               WHEN WS-PROCESS-DATE
      *CONTROL CARD CAN HAVE MORE THAN ONE PROCESS DATE                  
      *LAST ENTRY WILL BE CONSIDERED                                       
                    MOVE WS-PARM-VALUE      TO WS-BCF-PROCESS-DATE

               WHEN OTHER
      *MSG: 'INVALID CONTROL CARD ID : @1'
                    MOVE 'XS00009002'       TO WGLOB-MSG-REF-INFO
                    MOVE RBCF-SEQ-REC-INFO  TO WGLOB-MSG-PARM (1)         
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X

                    PERFORM  0030-4000-CTL-CARD-ERROR
                        THRU 0030-4000-CTL-CARD-ERROR-X
           END-EVALUATE.

           PERFORM  BCF-1000-READ
               THRU BCF-1000-READ-X.
 
       2250-READ-CNTRL-CARD-X.
           EXIT.
      /
      *-----------------------
       2275-EDIT-PROCESS-DATE.
      *-----------------------
                                                                                
           PERFORM  0460-0000-INIT-PARM-INFO                                    
               THRU 0460-0000-INIT-PARM-INFO-X.                                 
                                                                                
           PERFORM  0460-1000-READ-MAST-ONLY                                    
               THRU 0460-1000-READ-MAST-ONLY-X.                                 
                                                                                
           IF  WS-BCF-PROCESS-DATE = LOW-VALUES                              
           OR  WS-BCF-PROCESS-DATE = SPACES                                 
               MOVE RMAST-APPL-CTL-PRCES-DT TO WS-BCF-PROCESS-DATE          
      *MSG: PROCESS DATE DEFAULTED TO @1                                        
               MOVE 'XS00009003'            TO WGLOB-MSG-REF-INFO               
               MOVE WS-BCF-PROCESS-DATE     TO WGLOB-MSG-PARM (1)               
               PERFORM  0260-1000-GENERATE-MESSAGE                              
                   THRU 0260-1000-GENERATE-MESSAGE-X                            
           END-IF.                                                              
                                                                                
           MOVE WS-BCF-PROCESS-DATE         TO L1640-EXTERNAL-DATE.            
           PERFORM  1640-6000-CTL-CARD-TO-INT                                   
               THRU 1640-6000-CTL-CARD-TO-INT-X.                                
                                                                                
           IF  L1640-VALID                                                      
               MOVE L1640-INTERNAL-DATE TO WGLOB-PROCESS-DATE                   
           ELSE                                                                 
      *MSG: INVALID PROCESS DATE - FORMAT MUST BE VALID                         
               MOVE 'XS00000159'            TO WGLOB-MSG-REF-INFO              
               PERFORM  0260-1000-GENERATE-MESSAGE                              
                   THRU 0260-1000-GENERATE-MESSAGE-X                            
               PERFORM  0030-4000-CTL-CARD-ERROR                                
                   THRU 0030-4000-CTL-CARD-ERROR-X                              
           END-IF.                                                              

       2275-EDIT-PROCESS-DATE-X.
           EXIT.
      /
      *---------------------
       3000-PROCESS-RECORDS.
      *---------------------
 
      *BUILD KEYS FOR CUSTOMIZED IO MODULE
           MOVE LOW-VALUES                  TO WPIAD-KEY.
           MOVE HIGH-VALUES                 TO WPIAD-ENDBR-KEY.

           PERFORM  PIAD-1000-BROWSE
               THRU PIAD-1000-BROWSE-X.

      *GET THE FIRST "USEFUL" RECORD                
           PERFORM  7000-GET-NEXT-REC         
               THRU 7000-GET-NEXT-REC-X.

      *CORE BUSINESS LOGIC WILL BE IMPLEMENTED HERE
           PERFORM  3100-PROC-PIAD-RECORDS
               THRU 3100-PROC-PIAD-RECORDS-X
               UNTIL NOT WPIAD-IO-OK.

           PERFORM  PIAD-3000-END-BROWSE                                        
               THRU PIAD-3000-END-BROWSE-X.                                     

       3000-PROCESS-RECORDS-X.
           EXIT.
      /
      *-----------------------
       3100-PROC-PIAD-RECORDS.
      *-----------------------
 
      *------------------------------------------------------
      *  1. DO AGENT LEVEL ACTIVITIES
      *  2. DO POLICY LEVEL ACTIVITIES
      *  3. DO CLIENT LEVEL ACTIVITIES
      *  4. DO POLICY-CLIENT LEVEL ACTIVITIES
      *  5. DO COVERAGE LEVEL ACTIVITIES
      *  6. GET THE NEXT "USEFUL" RECORD (SKIP THE EXCLUSION
      *     /CLAIMS HIST RECORD) AND UPDATE CONTROL VARIABLES
      *  7. AFTER COMPARISON,IF NEEDED WRITE TO FILE
      *------------------------------------------------------
         
      *AGENT ID IS CHANGING; RECALCULATE AGENT LEVEL FIELDS
           IF  WS-PREV-AGT-ID NOT = RPIAD-SERV-AGT-ID
               PERFORM  4000-AGT-LVL-CALC         
                   THRU 4000-AGT-LVL-CALC-X
           END-IF.
              
      *POLICY ID IS CHANGING; RECALCULATE POLICY LEVEL FIELDS
           IF  WS-PREV-POL-ID NOT = RPIAD-POL-ID
               PERFORM  4500-POL-LVL-CALC         
                   THRU 4500-POL-LVL-CALC-X
           END-IF.
              
      *CLIENT ID IS CHANGING; RECALCULATE CLIENT LEVEL FIELDS
           IF  WS-PREV-CLI-ID NOT = RPIAD-CLI-ID
               PERFORM  5000-CLI-LVL-CALC         
                   THRU 5000-CLI-LVL-CALC-X
           END-IF.
              
      *POL - CLI LEVEL PROCESSING
      *GETTING LNB AND TCB RIDERS
           IF  WS-PREV-POL-ID NOT = RPIAD-POL-ID
           OR  WS-PREV-CLI-ID NOT = RPIAD-CLI-ID
               PERFORM  5500-POL-CLI-CALC         
                   THRU 5500-POL-CLI-CALC-X
           END-IF.
              
      *DO COVERAGE LEVEL CALCULATION FOR THE REST OF THE FIELDS
           PERFORM  6000-CVG-LVL-CALC         
               THRU 6000-CVG-LVL-CALC-X.
              
      *GET THE NEXT "USEFUL" RECORD AFTER SKIPPING EXCEPTION RECORDS 
      *AND UPDATE VARIABLES,COUNTERS AND 
           PERFORM  7000-GET-NEXT-REC         
               THRU 7000-GET-NEXT-REC-X.
              
      *IF THERE IS A NEED TO WRITE, WRITE TO THE REPORT AND 
      *WRITE THE HEADER WHEN IT REACHES 60001 RECORDS AND  
      *INITIALIZE VARIABLE AS NEEDED 
           IF  (WS-PREV-POL-ID NOT = RPIAD-POL-ID
           OR   WS-PREV-CLI-ID NOT = RPIAD-CLI-ID)
               PERFORM  8000-WRITE-RPT-REC
                   THRU 8000-WRITE-RPT-REC-X
           END-IF.
              
       3100-PROC-PIAD-RECORDS-X.
           EXIT.
      /
      *------------------
       4000-AGT-LVL-CALC.                                                
      *------------------

      *FIELDS CALCULATED AT AGENT LEVEL ARE
      * 1. RO
           MOVE RPIAD-SERV-BR-ID            TO WS-PIAD-SERV-BR-ID.

      * 2. SO
           MOVE RPIAD-SO-ID                 TO WS-PIAD-SO-ID.

      * 3. AGENT ID
           MOVE RPIAD-SERV-AGT-ID           TO WS-PIAD-SERV-AGT-ID.

      * 4. AGENT NAME
           PERFORM  0083-0000-INIT-PARM-INFO
               THRU 0083-0000-INIT-PARM-INFO-X

           SET  L0083-AGENT-NAME-REQD       TO TRUE
           MOVE RPIAD-SERV-AGT-ID           TO L0083-AGENT-ID

           PERFORM  0083-1000-RETRIEVE-AGT-INFO
               THRU 0083-1000-RETRIEVE-AGT-INFO-X

           IF  L0083-RETRN-OK
               MOVE L0083-AGT-NM-COMPRESSED TO WS-PIAD-SERV-AGT-NAME 
           ELSE
               MOVE SPACES                  TO WS-PIAD-SERV-AGT-NAME
           END-IF.

       4000-AGT-LVL-CALC-X.
            EXIT.
      /
      *------------------
       4500-POL-LVL-CALC.                                                
      *------------------

      *FIELDS CALCULATED AT POLICY LEVEL ARE
      * 1. POLICY ID
           MOVE RPIAD-POL-ID                TO WS-PIAD-POL-ID.

      * 2. POLICY ISSUE DATE
      *    YEAR                  
           MOVE RPIAD-POL-ISS-EFF-DT(1:4)   TO
                                         WS-PIAD-POL-ISS-EFF-DT-YYYY.

      *    MONTH                 
           MOVE RPIAD-POL-ISS-EFF-DT(6:2)   TO                           
                                         WS-PIAD-POL-ISS-EFF-DT-MM.

      *    DATE                  
           MOVE RPIAD-POL-ISS-EFF-DT(9:2)   TO                              
                                         WS-PIAD-POL-ISS-EFF-DT-DD.

       4500-POL-LVL-CALC-X.
            EXIT.
      /
      *------------------
       5000-CLI-LVL-CALC.                                                
      *------------------

      *FIELDS CALCULATED AT CLIENT LEVEL ARE
      * 1. INSURED NAME
           MOVE RPIAD-CLI-ID                TO L2435-CLI-ID.
            
           PERFORM  2435-1000-BUILD-PARM-INFO
               THRU 2435-1000-BUILD-PARM-INFO-X.
                
           PERFORM  2435-1000-OBTAIN-CLI-INFO
               THRU 2435-1000-OBTAIN-CLI-INFO-X.

           IF  L2435-RETRN-OK
SCVIPN*        MOVE L2435-CLI-KJ-NM-COMPRESSED                        
SCVIPN*                                     TO WS-PIAD-INSRD-NAME
SCVIPN         MOVE L2435-CLI-NM-COMPRESSED 
SCVIPN                                      TO WS-PIAD-INSRD-NAME                                             
           ELSE
               MOVE SPACES                  TO WS-PIAD-INSRD-NAME           
           END-IF.

      * 2. DATE OF BIRTH
      *    YEAR                  
           MOVE RPIAD-CLI-BTH-DT(1:4)       TO WS-PIAD-INS-DOB-YYYY.

      *    MONTH                 
           MOVE RPIAD-CLI-BTH-DT(6:2)       TO WS-PIAD-INS-DOB-MM.              

      *    DATE                  
           MOVE RPIAD-CLI-BTH-DT(9:2)       TO WS-PIAD-INS-DOB-DD.              

       5000-CLI-LVL-CALC-X.
            EXIT.
      /
      *------------------
       5500-POL-CLI-CALC.                                                
      *------------------

      *FIELDS CALCULATED AT POLICY AND CLIENT LEVEL ARE
      * 1. LNB
      * 2. TCB
           PERFORM  5600-PRCESS-LNB-TCB
               THRU 5600-PRCESS-LNB-TCB-X.

       5500-POL-CLI-CALC-X.
            EXIT.
      /
      *--------------------
       5600-PRCESS-LNB-TCB.                                                
      *--------------------

      *POPULATE KEY VALUES   
           MOVE LOW-VALUES                  TO WCLUA-KEY.
           MOVE RPIAD-POL-ID                TO WCLUA-POL-ID.
           MOVE RPIAD-CLI-ID                TO WCLUA-CLI-ID.

           MOVE HIGH-VALUES                 TO WCLUA-ENDBR-KEY.
           MOVE RPIAD-POL-ID                TO WCLUA-ENDBR-POL-ID.
           MOVE RPIAD-CLI-ID                TO WCLUA-ENDBR-CLI-ID.

           SET WS-LNB-NO                    TO TRUE.
           SET WS-TCB-NO                    TO TRUE.
           INITIALIZE RCLIU-REC-INFO.

      *CLUA IS ALTERNATE INDEX ON CLIU TABLE
           PERFORM  CLUA-1000-BROWSE
               THRU CLUA-1000-BROWSE-X.

           IF  NOT WCLUA-IO-OK
               GO TO 5600-PRCESS-LNB-TCB-X
           END-IF.

           PERFORM  CLUA-2000-READ-NEXT
               THRU CLUA-2000-READ-NEXT-X.

      *IF FOUND SET THE INDICATORS
           PERFORM  5650-MOVE-LNB-TCB-IND
               THRU 5650-MOVE-LNB-TCB-IND-X
               UNTIL NOT WCLUA-IO-OK
               OR  (WS-LNB-YES                          
               AND  WS-TCB-YES).    

           PERFORM  CLUA-3000-END-BROWSE
               THRU CLUA-3000-END-BROWSE-X.

       5600-PRCESS-LNB-TCB-X.
            EXIT.
      /
      *----------------------
       5650-MOVE-LNB-TCB-IND.
      *----------------------

           IF  RCLIU-CLI-LNB-YES
               SET WS-LNB-YES               TO TRUE
           END-IF.

           IF  RCLIU-CLI-TCB-YES
               SET WS-TCB-YES               TO TRUE
           END-IF.

           PERFORM  CLUA-2000-READ-NEXT
               THRU CLUA-2000-READ-NEXT-X.

        5650-MOVE-LNB-TCB-IND-X.
           EXIT.
      /
      *------------------
       6000-CVG-LVL-CALC.                                                
      *------------------

      *FIELDS CALCULATED AT COVERAGE LEVEL ARE
      * FACE AMOUNT FOR 25 PLAN TYPES AND UPDATE SKIP COUNTER
           PERFORM  6500-FACE-AMT-CALC
               THRU 6500-FACE-AMT-CALC-X.

      * REGULAR PREMIUM AND VAR ACC PLAN IND
           PERFORM  6800-MISC-CALC
               THRU 6800-MISC-CALC-X.
EN3734* SSTD IND
EN3734     PERFORM  6900-CHECK-FOR-SSTD
EN3734         THRU 6900-CHECK-FOR-SSTD-X.               
EN3734
EN3734* CLAIM HISTORY IND
EN3734     PERFORM  7800-CHECK-CLAIM-HIST
EN3734         THRU 7800-CHECK-CLAIM-HIST-X.
EN3734
EN3734* AMEX IND
EN3734     PERFORM  7900-CHECK-FOR-EXCLUSION
EN3734         THRU 7900-CHECK-FOR-EXCLUSION-X.               

       6000-CVG-LVL-CALC-X.
            EXIT.
      /
      *-------------------
       6500-FACE-AMT-CALC.                                                
      *-------------------

            MOVE RPIAD-PLAN-ID              TO WS-PLAN-ID
            EVALUATE TRUE

      * 1. PREFERRED TERM                (/10000)
      * PLAN: 41400/46300
                WHEN WS-PLAN-PREF-TERM
                     COMPUTE RPIAD-CVG-FACE-AMT ROUNDED =
                             RPIAD-CVG-FACE-AMT / 10000
                     ADD RPIAD-CVG-FACE-AMT TO WS-PREF-TERM-FA

      * 2. NONSMOKER TERM                (/10000)
      * PLAN: 41500/41501/46400
                WHEN WS-PLAN-NON-SM-TERM
                     COMPUTE RPIAD-CVG-FACE-AMT ROUNDED =
                             RPIAD-CVG-FACE-AMT / 10000
                     ADD RPIAD-CVG-FACE-AMT TO WS-NON-SM-TERM-FA

      * 3. TERM                          (/10000)
      * PLAN: 41600/41601/46500
                WHEN WS-PLAN-TERM
                     COMPUTE RPIAD-CVG-FACE-AMT ROUNDED =
                             RPIAD-CVG-FACE-AMT / 10000
                     ADD RPIAD-CVG-FACE-AMT TO WS-TERM-FA

      * 4. NONSMOKER WL                  (/10000)
      * PLAN: 41700/41701/46600
                WHEN WS-PLAN-NON-SM-WL
                     COMPUTE RPIAD-CVG-FACE-AMT ROUNDED =
                             RPIAD-CVG-FACE-AMT / 10000
                     ADD RPIAD-CVG-FACE-AMT TO WS-NON-SM-WL-FA

      * 5. WL                            (/10000)
      * PLAN: 41800/41801/46700
                WHEN WS-PLAN-WL
                     COMPUTE RPIAD-CVG-FACE-AMT ROUNDED =
                             RPIAD-CVG-FACE-AMT / 10000
                     ADD RPIAD-CVG-FACE-AMT TO WS-WL-FA
                     
EN3734* 6. FIP                          (/10000)
EN3734*  PLAN:46800
EN3734          WHEN WS-PLAN-FIP
EN3734               COMPUTE RPIAD-CVG-FACE-AMT ROUNDED =
EN3734                       RPIAD-CVG-FACE-AMT / 10000
EN3734               ADD RPIAD-CVG-FACE-AMT TO WS-WL-FIP
EN3734
EN3734* 7. NFIP                          (/10000)
EN3734*  PLAN:46900
EN3734          WHEN WS-PLAN-NSFIP
EN3734               COMPUTE RPIAD-CVG-FACE-AMT ROUNDED =
EN3734                       RPIAD-CVG-FACE-AMT / 10000
EN3734               ADD RPIAD-CVG-FACE-AMT TO WS-WL-NSFIP
EN3734
EN3734* 6. UL ACCIDENTAL DEATH           (/10000)
EN3734* 8. UL ACCIDENTAL DEATH           (/10000)
      * PLAN: 42700
                WHEN WS-PLAN-UL-ACC-DTH
                     COMPUTE RPIAD-CVG-FACE-AMT ROUNDED =
                             RPIAD-CVG-FACE-AMT / 10000
                     ADD RPIAD-CVG-FACE-AMT TO WS-UL-ACC-DTH-FA

EN3734* 7. UL ADULT INJURY               (/10000)
EN3734* 9. UL ADULT INJURY               (/10000)
      * PLAN: 42800
                WHEN WS-PLAN-UL-ADLT-INJ
                     COMPUTE RPIAD-CVG-FACE-AMT ROUNDED =
                             RPIAD-CVG-FACE-AMT / 10000
                     ADD RPIAD-CVG-FACE-AMT TO WS-UL-ADLT-INJ-FA

EN3734* 8. SHORT - TERM HOSPITALIZATION
EN3734*10. SHORT - TERM HOSPITALIZATION      
      * PLAN: 43000/45100/45200
                WHEN WS-PLAN-HOSP-SHT
                     ADD RPIAD-CVG-FACE-AMT TO WS-ST-HOSP-FA

EN3734* 9. HOSPITALIZATION - DISEASE
EN3734*11. HOSPITALIZATION - DISEASE
EN3734* PLAN: 42000/43400/43500
EN3734* PLAN: 42000/43400/43500/70300/70400
                WHEN WS-PLAN-HOSP-DIS
                     ADD RPIAD-CVG-FACE-AMT TO WS-HOSP-DIS-FA

EN3734*10. HOSPITALIZATION - ACCIDENT
EN3734*12. HOSPITALIZATION - ACCIDENT
EN3734* PLAN: 41900/43200/43300
EN3734* PLAN: 41900/43200/43300/70100/70200
                WHEN WS-PLAN-HOSP-ACC
                     ADD RPIAD-CVG-FACE-AMT TO WS-HOSP-ACC-FA

EN3734*11. LONG TERM HOSPITALIZATION
EN3734*13. LONG TERM HOSPITALIZATION
      * PLAN: 42100
                WHEN WS-PLAN-HOSP-LT
                     ADD RPIAD-CVG-FACE-AMT TO WS-LT-HOSP-FA

EN3734*12. C-TYPE HOSPITAL
EN3734*14. C-TYPE HOSPITAL
EN3734* PLAN: 43600
EN3734* PLAN: 43600/70500/70600
                WHEN WS-PLAN-CT-HOSP
                     ADD RPIAD-CVG-FACE-AMT TO WS-CT-HOSP-FA

EN3734*13. OUTPATIENT
EN3734*15. OUTPATIENT
EN3734* PLAN: 42300/44000/44100
EN3734* PLAN: 42300/44000/44100/70900/71000
                WHEN WS-PLAN-OUTP
                     ADD RPIAD-CVG-FACE-AMT TO WS-OUTP-FA

EN3734*14. DISCHARGE
EN3734*16. DISCHARGE
EN3734* PLAN: 42200/43800/43900
EN3734* PLAN: 42200/43800/43900/70700/70800
                WHEN WS-PLAN-DISCH
                     ADD RPIAD-CVG-FACE-AMT TO WS-DISCH-FA

EN3734*15. ACCIDENTAL OUTPATIENT
EN3734*17. ACCIDENTAL OUTPATIENT
      * PLAN: 45300
                WHEN WS-PLAN-ACCD-OUT
                     ADD RPIAD-CVG-FACE-AMT TO WS-ACC-OUTP-FA

EN3734*16. FRACTURE
EN3734*18. FRACTURE
EN3734* PLAN: 45400
EN3734* PLAN: 45400/72000
                WHEN WS-PLAN-FRACTURE
                     ADD RPIAD-CVG-FACE-AMT TO WS-FRACTURE-FA

EN3734*17. ADULT DISEASE
EN3734*19. ADULT DISEASE
EN3734* PLAN: 42400/44200/44300
MP213I*EN3734* PLAN: 42400/44200/44300/71100/71200
MP213I* PLAN: 42400/44200/44300/71100/71200/74200/74300
                WHEN WS-PLAN-ADLT-DIS
                     ADD RPIAD-CVG-FACE-AMT TO WS-ADLT-DIS-FA

EN3734*18. FEMALE DISEASE
EN3734*20. FEMALE DISEASE
EN3734* PLAN: 42500/44600/44700
MP213I*EN3734* PLAN: 42500/44600/44700/71500/71600
MP213I* PLAN: 42500/44600/44700/71500/71600/74400/74500 
                WHEN WS-PLAN-FEM-DIS
                     ADD RPIAD-CVG-FACE-AMT TO WS-FEM-DIS-FA

EN3734*19. C-TYPE ADULT DISEASE
EN3734*21. C-TYPE ADULT DISEASE
EN3734* PLAN: 44400/44500
EN3734* PLAN: 44400/44500/71300/71400
                WHEN WS-PLAN-CT-ADLT-DIS
                     ADD RPIAD-CVG-FACE-AMT TO WS-CT-ADLT-DIS-FA
            
EN3734*20. C-TYPE FEMALE DISEASE
EN3734*22. C-TYPE FEMALE DISEASE
EN3734* PLAN: 44800/44900
EN3734* PLAN: 44800/44900/71700/71800
                WHEN WS-PLAN-CT-FEM-DIS
                     ADD RPIAD-CVG-FACE-AMT TO WS-CT-FEM-DIS-FA

EN3734*21. DREAD DISEASE                 (/10000)
EN3734*23. DREAD DISEASE                 (/10000)
EN3734* PLAN: 42600/45000
EN3734* PLAN: 42600/45000/71900
                WHEN WS-PLAN-DREAD-DIS
                     COMPUTE RPIAD-CVG-FACE-AMT ROUNDED =
                             RPIAD-CVG-FACE-AMT / 10000
                     ADD RPIAD-CVG-FACE-AMT TO WS-DREAD-DIS-FA

EN3734*24. DDIP                          (/10000)
EN3734* PLAN: 47000
EN3734          WHEN WS-PLAN-DDIP
EN3734               COMPUTE RPIAD-CVG-FACE-AMT ROUNDED =
EN3734                       RPIAD-CVG-FACE-AMT / 10000
EN3734               ADD RPIAD-CVG-FACE-AMT TO WS-DDIP
EN3734
EN3734*22. CANCER LUMP SUM               (/10000)
EN3734*25. CANCER LUMP SUM               (/10000)
EN3734* PLAN: 45700/45800
EN3734* PLAN: 45700/45800/72300/72400
                WHEN WS-PLAN-CNCR-LUMP-SUM
                     COMPUTE RPIAD-CVG-FACE-AMT ROUNDED =
                             RPIAD-CVG-FACE-AMT / 10000
                     ADD RPIAD-CVG-FACE-AMT TO WS-CNCR-LUMP-SUM-FA

EN3734*23. CANCER HOSPITALIZATION
EN3734*26. CANCER HOSPITALIZATION
EN3734* PLAN: 45500/45600
EN3734* PLAN: 45500/45600/72100/72200
                WHEN WS-PLAN-CNCR-HOSP
                     ADD RPIAD-CVG-FACE-AMT TO WS-CNCR-HOSP-FA

EN3734*24. CANCER OUTPATIENT
EN3734*27. CANCER OUTPATIENT
EN3734* PLAN: 45900/46000
EN3734* PLAN: 45900/46000/72500/72600
                WHEN WS-PLAN-CNCR-OUTP
                     ADD RPIAD-CVG-FACE-AMT TO WS-CNCR-OUTP-FA

EN3734*25. CANCER DEATH COVERAGE         (/10000)
EN3734*28. CANCER DEATH COVERAGE         (/10000)
EN3734* PLAN: 46100/46200
MP213I*EN3734* PLAN: 46100/46200/72700/72800
MP213I* PLAN: 46100/46200/72700/72800

                WHEN WS-PLAN-CNCR-DTH-CVG
                     COMPUTE RPIAD-CVG-FACE-AMT ROUNDED =
                             RPIAD-CVG-FACE-AMT / 10000
                     ADD RPIAD-CVG-FACE-AMT TO WS-CNCR-DTH-CVG-FA

MP213I*29. PRIMARY MEDICAL                
MP213I* PLAN: 74000,74100
MP213I         WHEN WS-PLAN-PRIM-MEDIC
MP213I             ADD RPIAD-CVG-FACE-AMT   TO WS-PRIM-MEDIC-FA
MP213I
MP213I*30. CRITICAL ILLNESS              (/10000)    
MP213I* PLAN: 74800
MP213I         WHEN WS-PLAN-CRIT-ILL
MP213I             COMPUTE RPIAD-CVG-FACE-AMT ROUNDED =
MP213I                       RPIAD-CVG-FACE-AMT / 10000
MP213I             ADD RPIAD-CVG-FACE-AMT   TO WS-CRIT-ILL-FA
MP213I               
MP213I*31. CANCER DIAGONOSIS LUMPSUM     (/10000)
MP213I* PLAN: 75200,75300
MP213I         WHEN WS-PLAN-CANCER-DIAGNS
MP213I             COMPUTE RPIAD-CVG-FACE-AMT ROUNDED =
MP213I                       RPIAD-CVG-FACE-AMT / 10000                
MP213I             ADD RPIAD-CVG-FACE-AMT TO WS-CANCER-DIAGNS-FA       
                                                                                          
      *PLAN: OTHER PLAN IDS
                WHEN OTHER
      *UPDATE SKIP COUNTER
                     ADD  +1                TO WS-TOTAL-SKIP-CTR
            END-EVALUATE.

       6500-FACE-AMT-CALC-X.
            EXIT.
      /
      *---------------
       6800-MISC-CALC.                                                
      *---------------

      * 1. REGULAR PREMIUM               (/12)
           COMPUTE RPIAD-CVG-BASIC-PREM-AMT ROUNDED =
                   RPIAD-CVG-BASIC-PREM-AMT / 12
           ADD RPIAD-CVG-BASIC-PREM-AMT     TO WS-REG-PREM.

      * 2. VARIABLE ACCUMULATION  IND    (*)
           IF  WS-PLAN-VAR-ACC 
           AND WS-VAR-ACC-NO 
               SET WS-VAR-ACC-YES           TO TRUE
           END-IF.
           
MP213I* 3. ADVANCE MEDICAL IND    (*)
MP213I     IF  WS-PLAN-ADV-MEDIC 
MP213I     AND WS-ADV-MEDIC-NO 
MP213I         SET WS-ADV-MEDIC-YES         TO TRUE
MP213I     END-IF.
           

       6800-MISC-CALC-X.
            EXIT.
      /  
EN3734*--------------------
EN3734 6900-CHECK-FOR-SSTD.
EN3734*--------------------
EN3734
EN3734* SUBSTANDARD PREMIUM IND
MP126C* FOR RIDER TO BE IN SUBSTANDARD PERIOD THE SUBSTANDARD PREMIUM
MP126C* SHOULD BE GREATER THAN ZERO
MP126C
MP213I*    CALCULATE THE LIEN DURATION XPRY DATE 
MP213I     MOVE RPIAD-CVG-ISS-EFF-DT        TO L1680-INTERNAL-1.
MP213I     MOVE ZERO                        TO L1680-NUMBER-OF-DAYS.
MP213I     MOVE ZERO                        TO L1680-NUMBER-OF-MONTHS.
MP213I     MOVE RPIAD-CVG-LIEN-DUR          TO L1680-NUMBER-OF-YEARS.
MP213I
MP213I     PERFORM  1680-3000-ADD-Y-M-D-TO-DATE
MP213I         THRU 1680-3000-ADD-Y-M-D-TO-DATE-X.
MP213I
MP213I     MOVE L1680-INTERNAL-2            TO WS-LIEN-XPRY-DT.
MP213I*SUB-STANDARD INDICATOR WILL SET FOR POLICY HAVING LIEN DURATION
EN3734         PERFORM  
MP213I*EN3734             IF  RPIAD-CVG-ME-FCT > WS-CVG-ME-FCT-1 
MP213I*MP126C             AND RPIAD-CVG-ME-PREM-AMT NOT = ZEROES
MP213I             IF  ( RPIAD-CVG-ME-FCT > WS-CVG-ME-FCT-1 
MP213I             AND  RPIAD-CVG-ME-PREM-AMT NOT = ZEROES )
MP213I             OR  ( RPIAD-CVG-LIEN-DUR NOT = ZEROES
Q34441             AND  WGLOB-PROCESS-DATE < WS-LIEN-XPRY-DT ) 
Q34441*MP213I             AND  WS-LIEN-XPRY-DT < WGLOB-PROCESS-DATE ) 
EN3734             AND WS-SSTD-NO     
EN3734                 SET WS-SSTD-YES      TO TRUE
EN3734		   END-IF
EN3734         END-PERFORM.
EN3734
EN3734 6900-CHECK-FOR-SSTD-X.
EN3734      EXIT.
      /  
EN3734*--------------------
EN3734 6900-CHECK-FOR-AMEX.
EN3734*--------------------
EN3734
EN3734     IF  RAMEX-AMEX-REC-TYP-EXCLUSION
EN3734     
EN3734         SET WS-SSTD-YES              TO TRUE
EN3734
EN3734     END-IF.
EN3734
EN3734     PERFORM  AMEX-2000-READ-NEXT
EN3734         THRU AMEX-2000-READ-NEXT-X.
EN3734
EN3734 6900-CHECK-FOR-AMEX-X.
EN3734      EXIT.      
      /       
      *------------------
       7000-GET-NEXT-REC.                                                
      *------------------

      *1. READ THE NEXT RECORD
           PERFORM  PIAD-2000-READ-NEXT
               THRU PIAD-2000-READ-NEXT-X.

      *2. AT EOF INITIALIZE CURRENT VARIABLE SO THAT IT WILL 
      *   CREATE A TRIGGER TO WRITE THE LAST RECORD IN THE REPORT               
           IF  NOT WPIAD-IO-OK
               MOVE SPACES                  TO WS-CURR-AGT-ID
                                               WS-CURR-POL-ID
                                               WS-CURR-CLI-ID
               GO TO 7000-GET-NEXT-REC-X 
           END-IF.

      *3. CHECK FOR EXCEPTION RECORDS
      *   WHEN COMING OUT OF LOOP IT WILL EITHER HAVE THE "USEFUL" RECORD 
      *   OR AT EOF                                    
      
      *"WITH TEST AFTER" CLAUSE IS ADDED TO ENSURE THE CHECK IS DONE  
      *AFTER EXCUTING THE PARA ATLEAST ONCE  
      
EN3734*    PERFORM  7500-CHECK-FOR-EXCEPTION
EN3734*        THRU 7500-CHECK-FOR-EXCEPTION-X
EN3734*        WITH TEST AFTER
EN3734*        UNTIL NOT WPIAD-IO-OK
ACU001*           OR (WS-CLAIM-HIST-NO 
ACU001*           AND WS-AMEX-EXCLUSION-NO). 
EN3734*ACU001     OR WS-AMEX-EXCLUSION-NO.  

      *4. AT EOF INITIALIZE CURRENT VARIABLE SO THAT IT WILL 
      *   CREATE A TRIGGER TO WRITE THE LAST RECORD IN THE REPORT               
           IF  NOT WPIAD-IO-OK
               MOVE SPACES                  TO WS-CURR-AGT-ID
                                               WS-CURR-POL-ID
                                               WS-CURR-CLI-ID
               GO TO 7000-GET-NEXT-REC-X 
           END-IF.

      *5. UPDATE THE PREVIOUS VARIABLES
           MOVE WS-CURR-AGT-ID              TO WS-PREV-AGT-ID.      
           MOVE WS-CURR-POL-ID              TO WS-PREV-POL-ID.      
           MOVE WS-CURR-CLI-ID              TO WS-PREV-CLI-ID.      

      *6. UPDATE THE CURRENT VARIABLES
           MOVE RPIAD-SERV-AGT-ID           TO WS-CURR-AGT-ID.
           MOVE RPIAD-POL-ID                TO WS-CURR-POL-ID.
           MOVE RPIAD-CLI-ID                TO WS-CURR-CLI-ID.

      *7. UPDATE THE READ COUNTER
           ADD +1                           TO WS-TOTAL-READ-CTR.


      *8. INITIALIZE OTHER VARIABLES
           MOVE SPACES                      TO WS-PLAN-ID.      


       7000-GET-NEXT-REC-X.
            EXIT.
      /
              
      *-------------------------
EN3734*7500-CHECK-FOR-EXCEPTION.
      *-------------------------
      
      *INITIALIZE VARIABLES TO NO
ACU001*    SET WS-CLAIM-HIST-NO             TO TRUE.
EN3734*    SET WS-AMEX-EXCLUSION-NO         TO TRUE.

      *CHECK FOR EXCLUSION RECORD IN AMEX TABLE 
      *IF FOUND DO NOT PROCESS THE INSURED FOR THAT POLICY 
EN3734*    PERFORM  7600-CHECK-FOR-EXCLUSION                                  
EN3734*        THRU 7600-CHECK-FOR-EXCLUSION-X.                                
      
EN3734*    IF  WS-AMEX-EXCLUSION-YES            
      *SKIP THE SUCCESSIVE RECORDS FOR THAT INSURED UNDER THAT POLICY 
      *AND GET THE NEXT THE POLICY/CLIENT RECORD  
      
      *"WITH TEST AFTER" CLAUSE IS ADDED TO ENSURE THE CHECK IS DONE  
      *AFTER READING THE NEXT RECORD  
      
EN3734*        PERFORM  7900-SKIP-EXCLUSION-REC   
EN3734*            THRU 7900-SKIP-EXCLUSION-REC-X
EN3734*            WITH TEST AFTER
EN3734*            UNTIL NOT WPIAD-IO-OK
EN3734*            OR RPIAD-CLI-ID NOT = WS-PREV-EXCL-CLI-ID
EN3734*            OR RPIAD-POL-ID NOT = WS-PREV-EXCL-POL-ID
EN3734*        GO TO 7500-CHECK-FOR-EXCEPTION-X
EN3734*    END-IF.
      
      *CHECK FOR CLAIMS HISTORY RECORD IN CLBN TABLE 
      *IF FOUND DO NOT PROCESS THE COVERAGE 
ACU001*    PERFORM  7800-CHECK-CLAIM-HIST                                  
ACU001*        THRU 7800-CHECK-CLAIM-HIST-X.                                
      
ACU001*    IF  WS-CLAIM-HIST-YES            
      *SKIP THE COVERAGE AND GET NEXT RECORD 
ACU001*        PERFORM  7900-SKIP-EXCLUSION-REC   
ACU001*            THRU 7900-SKIP-EXCLUSION-REC-X
ACU001*    END-IF.
      
EN3734*7500-CHECK-FOR-EXCEPTION-X.
           EXIT.
      /
      *-------------------------
EN3734*7600-CHECK-FOR-EXCLUSION.
      *-------------------------

      *POPULATE KEY VALUES   
EN3734*    MOVE LOW-VALUES                  TO WAMEX-KEY.
EN3734*    MOVE RPIAD-POL-ID                TO WAMEX-POL-ID.
EN3734*    MOVE RPIAD-CLI-ID                TO WAMEX-INSRD-CLI-ID.

EN3734*    MOVE HIGH-VALUES                 TO WAMEX-ENDBR-KEY.
EN3734*    MOVE RPIAD-POL-ID                TO WAMEX-ENDBR-POL-ID.
EN3734*    MOVE RPIAD-CLI-ID                TO WAMEX-ENDBR-INSRD-CLI-ID.

EN3734*    SET WS-AMEX-EXCLUSION-NO         TO TRUE.  
EN3734*    INITIALIZE RAMEX-REC-INFO.

EN3734*    PERFORM  AMEX-1000-BROWSE
EN3734*        THRU AMEX-1000-BROWSE-X.

EN3734*    IF  NOT WAMEX-IO-OK
      *PROCESS AS IF IT HAS NO EXCLUSION   
EN3734*        GO TO 7600-CHECK-FOR-EXCLUSION-X
EN3734*    END-IF.

EN3734*    PERFORM  AMEX-2000-READ-NEXT
EN3734*        THRU AMEX-2000-READ-NEXT-X

      *CHECK FOR RECORD TYPE "EXCLUSION"   
EN3734*    PERFORM  7700-EXCLUDE-CLIENT
EN3734*        THRU 7700-EXCLUDE-CLIENT-X
EN3734*        UNTIL NOT WAMEX-IO-OK
EN3734*        OR  WS-AMEX-EXCLUSION-YES.

EN3734*    PERFORM  AMEX-3000-END-BROWSE
EN3734*        THRU AMEX-3000-END-BROWSE-X.

EN3734*7600-CHECK-FOR-EXCLUSION-X.
           EXIT.
      /
      *--------------------
EN3734*7700-EXCLUDE-CLIENT.
      *--------------------

EN3734*    IF  RAMEX-AMEX-REC-TYP-EXCLUSION

EN3734*        SET WS-AMEX-EXCLUSION-YES    TO TRUE

      *MSG: ALL COVERAGES OMITTED FOR POLICY NUMBER(@1) FOR CLIENT ID(@2)
      *     BECAUSE EXCLUSION RECORD FOUND
EN3734*        MOVE WS-MSG-AMEX-EXCLUSION   TO L0270-MSG-IN
EN3734*        MOVE RPIAD-POL-ID            TO L0270-MSG-PARM (1)
EN3734*        MOVE RPIAD-CLI-ID            TO L0270-MSG-PARM (2)
      *GIVE THE MSG LENGTH AS 132
EN3734*        MOVE WS-MAX-MSG-LEN          TO L0270-MSG-OUT-LEN            

      *REPLACE THE NUMERICAL TOKENS @1,@2 WITH ACTUAL VALUES
EN3734*        PERFORM  0270-1000-TOKEN-REPLACEMENT
EN3734*            THRU 0270-1000-TOKEN-REPLACEMENT-X

EN3734*        MOVE SPACES                  TO L0040-INPUT-LINE           
EN3734*        MOVE L0270-MSG-OUT           TO L0040-INPUT-LINE         

      *WRITE THE CONTENT TO OCF OUTPUT FILE                
EN3734*        PERFORM  0040-3000-WRITE-OTHER
EN3734*            THRU 0040-3000-WRITE-OTHER-X

EN3734*        GO TO 7700-EXCLUDE-CLIENT-X
EN3734*    END-IF.

EN3734*    PERFORM  AMEX-2000-READ-NEXT
EN3734*        THRU AMEX-2000-READ-NEXT-X.

EN3734*7700-EXCLUDE-CLIENT-X.
           EXIT.
      /
      *----------------------
ACU001*7800-CHECK-CLAIM-HIST.
      *----------------------

      *FOR EACH COVERAGE READ THE CLBN TABLE
      *IF CLAIM HISTORY EXISTS, EXCLUDE THE COVERAGE ALONE

      *POPULATE KEY VALUES   
ACU001*    MOVE LOW-VALUES                  TO WCLB5-KEY.
ACU001*    MOVE RPIAD-POL-ID                TO WCLB5-POL-ID.
ACU001*    MOVE RPIAD-CVG-NUM-N             TO WCLB5-CVG-NUM.
ACU001*
ACU001*    MOVE HIGH-VALUES                 TO WCLB5-ENDBR-KEY.
ACU001*    MOVE RPIAD-POL-ID                TO WCLB5-ENDBR-POL-ID.
ACU001*    MOVE RPIAD-CVG-NUM-N             TO WCLB5-ENDBR-CVG-NUM.
ACU001*
ACU001*    SET WS-CLAIM-HIST-NO             TO TRUE
ACU001*    INITIALIZE RCLBN-REC-INFO.
ACU001*
ACU001*    PERFORM  CLB5-1000-BROWSE
ACU001*        THRU CLB5-1000-BROWSE-X.
ACU001*
ACU001*    IF  NOT WCLB5-IO-OK
      *PROCESS AS IF IT HAS NO CLAIMS HISTORY
ACU001*        GO TO 7800-CHECK-CLAIM-HIST-X
ACU001*    END-IF.
ACU001*
ACU001*    PERFORM  CLB5-2000-READ-NEXT
ACU001*        THRU CLB5-2000-READ-NEXT-X
ACU001*
      *IF CLAIM HISTORY EXISTS, EXCLUDE THE COVERAGE ALONE
ACU001*    IF  WCLB5-IO-OK
ACU001*
ACU001*        SET WS-CLAIM-HIST-YES        TO TRUE
ACU001*
      *MSG:COVERAGE (@1) OMITTED FOR POLICY NUMBER (@2) FOR CLIENT ID (@3) 
      *    BECAUSE CLAIMS HISTORY FOUND
ACU001*        MOVE WS-MSG-CLAIM-HISTORY    TO L0270-MSG-IN
ACU001*        MOVE RPIAD-CVG-NUM           TO L0270-MSG-PARM (1)
ACU001*        MOVE RPIAD-POL-ID            TO L0270-MSG-PARM (2)
ACU001*        MOVE RPIAD-CLI-ID            TO L0270-MSG-PARM (3)
      *GIVE THE MSG LENGTH AS 132
ACU001*        MOVE WS-MAX-MSG-LEN          TO L0270-MSG-OUT-LEN            
ACU001*
      *REPLACE THE NUMERICAL TOKENS @1,@2,@3 WITH ACTUAL VALUES
ACU001*        PERFORM  0270-1000-TOKEN-REPLACEMENT
ACU001*            THRU 0270-1000-TOKEN-REPLACEMENT-X
ACU001*
ACU001*        MOVE SPACES                  TO L0040-INPUT-LINE           
ACU001*        MOVE L0270-MSG-OUT           TO L0040-INPUT-LINE         
ACU001*
      *WRITE THE CONTENT TO OCF OUTPUT FILE                
ACU001*        PERFORM  0040-3000-WRITE-OTHER
ACU001*            THRU 0040-3000-WRITE-OTHER-X
ACU001*
ACU001*    END-IF.
ACU001*
ACU001*    PERFORM  CLB5-3000-END-BROWSE
ACU001*        THRU CLB5-3000-END-BROWSE-X.
ACU001*
ACU001*7800-CHECK-CLAIM-HIST-X.
ACU001*     EXIT.
      /
      *----------------------
EN3734 7800-CHECK-CLAIM-HIST.
      *----------------------
EN3734
EN3734*FOR EACH COVERAGE READ THE CLBN TABLE
EN3734*IF CLAIM HISTORY EXISTS, SET INDICATOR AGAINST THE POLICY 
EN3734
EN3734     MOVE LOW-VALUES                  TO WCLB5-KEY.
EN3734     MOVE RPIAD-POL-ID                TO WCLB5-POL-ID.
EN3734     MOVE RPIAD-CVG-NUM-N             TO WCLB5-CVG-NUM.
EN3734
EN3734     MOVE HIGH-VALUES                 TO WCLB5-ENDBR-KEY.
EN3734     MOVE RPIAD-POL-ID                TO WCLB5-ENDBR-POL-ID.
EN3734     MOVE RPIAD-CVG-NUM-N             TO WCLB5-ENDBR-CVG-NUM.
EN3734
EN3734     SET WS-CLAIMS-HIST-NO            TO TRUE.
EN3734     MOVE SPACES                      TO RCLBN-REC-INFO.
EN3734
EN3734     PERFORM  CLB5-1000-BROWSE
EN3734         THRU CLB5-1000-BROWSE-X.
EN3734
EN3734     IF  WCLB5-IO-OK
EN3734*PROCESS AS IF IT HAS NO CLAIMS HISTORY
EN3734
EN3734         PERFORM  CLB5-2000-READ-NEXT
EN3734             THRU CLB5-2000-READ-NEXT-X
EN3734
EN3734*IF CLAIM HISTORY EXISTS, SET THE CLAIM HISTORY INDICATOR
EN3734         PERFORM  7850-MOVE-CLAIM-IND
EN3734             THRU 7850-MOVE-CLAIM-IND-X
EN3734             UNTIL  NOT WCLB5-IO-OK
EN3734 	           OR WS-CLAIMS-HIST-YES
EN3734
EN3734*WRITE THE CONTENT TO OCF OUTPUT FILE
EN3734         PERFORM  0040-3000-WRITE-OTHER
EN3734             THRU 0040-3000-WRITE-OTHER-X
EN3734
EN3734     ELSE
EN3734
EN3734        GO TO 7800-CHECK-CLAIM-HIST-X
EN3734
EN3734     END-IF.
EN3734
EN3734     PERFORM  CLB5-3000-END-BROWSE
EN3734         THRU CLB5-3000-END-BROWSE-X.
EN3734
EN3734 7800-CHECK-CLAIM-HIST-X.
EN3734      EXIT.
EN3734
EN3734
EN3734*----------------------
EN3734 7850-MOVE-CLAIM-IND.
EN3734*----------------------
EN3734
EN3734     IF  RCLBN-CLBN-BNFT-DECSN-PAID
EN3734     
EN3734         SET WS-CLAIMS-HIST-YES       TO TRUE
EN3734         MOVE WS-CLAIMS-HIST-IND      TO WS-CLAIMS-HIST-CD
EN3734
EN3734     END-IF.
EN3734
EN3734     PERFORM  CLB5-2000-READ-NEXT
EN3734         THRU CLB5-2000-READ-NEXT-X.
EN3734
EN3734  7850-MOVE-CLAIM-IND-X.
EN3734     EXIT.
EN3734/      
      *------------------------
EN3734*7900-SKIP-EXCLUSION-REC.
      *------------------------

      *1. UPDATE FAIL COUNTER
EN3734*    ADD +1                           TO WS-TOTAL-FAIL-CTR.
EN3734*
      *2. UPDATE EXCLUSION VARIABLES USED IN LOOPING
EN3734*    MOVE RPIAD-CLI-ID                TO WS-PREV-EXCL-CLI-ID.
EN3734*    MOVE RPIAD-POL-ID                TO WS-PREV-EXCL-POL-ID.
EN3734*
      *3. READ THE NEXT RECORD
EN3734*    PERFORM  PIAD-2000-READ-NEXT
EN3734*        THRU PIAD-2000-READ-NEXT-X.
EN3734*
EN3734*7900-SKIP-EXCLUSION-REC-X.
EN3734*    EXIT.
      /
      *-------------------------
EN3734 7900-CHECK-FOR-EXCLUSION.
      *-------------------------
EN3734
EN3734*POPULATE KEY VALUES   
EN3734     MOVE LOW-VALUES                  TO WAMEX-KEY.
EN3734     MOVE RPIAD-POL-ID                TO WAMEX-POL-ID.
EN3734     MOVE RPIAD-CLI-ID                TO WAMEX-INSRD-CLI-ID.
EN3734
EN3734     MOVE HIGH-VALUES                 TO WAMEX-ENDBR-KEY.
EN3734     MOVE RPIAD-POL-ID                TO WAMEX-ENDBR-POL-ID.
EN3734     MOVE RPIAD-CLI-ID                TO WAMEX-ENDBR-INSRD-CLI-ID.
EN3734
EN3734     SET WS-AMEX-EXCLUSION-NO         TO TRUE.  
EN3734     INITIALIZE RAMEX-REC-INFO.
EN3734
EN3734     PERFORM  AMEX-1000-BROWSE
EN3734         THRU AMEX-1000-BROWSE-X.
EN3734
EN3734     IF  WAMEX-IO-OK
EN3734
EN3734     PERFORM  AMEX-2000-READ-NEXT
EN3734         THRU AMEX-2000-READ-NEXT-X
EN3734
EN3734*IF CLAIM HISTORY EXISTS, SET THE CLAIM HISTORY INDICATOR
EN3734         PERFORM  6900-CHECK-FOR-AMEX
EN3734             THRU 6900-CHECK-FOR-AMEX-X
EN3734             UNTIL  NOT WAMEX-IO-OK
EN3734 	           OR WS-AMEX-EXCLUSION-YES
EN3734
EN3734     END-IF.              
EN3734
EN3734     PERFORM  AMEX-3000-END-BROWSE
EN3734         THRU AMEX-3000-END-BROWSE-X.
EN3734
EN3734 7900-CHECK-FOR-EXCLUSION-X.
EN3734     EXIT.
      /      
      *------------------
       8000-WRITE-RPT-REC.                                                
      *------------------

      *REMEMBER : THIS PARA IS CALLED ONLY WHEN POL-ID OR CLI-ID IS CHANGING

      *WRITE TO SEQ FILE
           INITIALIZE RPIAD-SEQ-REC-INFO.
           MOVE WS-SEQ-REC-INFO             TO RPIAD-SEQ-REC-INFO.

           PERFORM  PIAD-1000-WRITE
               THRU PIAD-1000-WRITE-X.

      *UPDATE THE WRITE COUNTER
           ADD +1                           TO WS-TOTAL-WRITTEN-CTR. 

      *CHECK TO SEE IF NEED TO WRITE THE HEADER
SCVIPN*     IF  WS-TOTAL-WRITTEN-CTR = WS-WRITE-LIMIT 
SCVIPN*        PERFORM  8100-WRITE-RPT-HDR
SCVIPN*            THRU 8100-WRITE-RPT-HDR-X
SCVIPN*    END-IF.

      *INITIALIZE COVERAGE LEVEL VARIABLES FOR EVERY INSURED 
           PERFORM  9910-INIT-CVG-VARS
               THRU 9910-INIT-CVG-VARS-X.


      *INITIALIZE POLICY-CLIENT LEVEL VARIABLES ONLY WHEN
      *EITHER POLICY OR/AND CLIENT IS/ARE CHANGING
           PERFORM  9920-INIT-POL-CLI-VARS
               THRU 9920-INIT-POL-CLI-VARS-X.

      *INITIALIZE CLIENT LEVEL VARIABLES ONLY WHEN CLIENT IS CHANGING
           IF  WS-PREV-CLI-ID NOT = WS-CURR-CLI-ID
               PERFORM  9930-INIT-CLI-VARS
                   THRU 9930-INIT-CLI-VARS-X
           END-IF.

      *INITIALIZE POLICY LEVEL VARIABLES ONLY WHEN POLICY IS CHANGING
           IF  WS-PREV-POL-ID NOT = WS-CURR-POL-ID
               PERFORM  9940-INIT-POL-VARS
                   THRU 9940-INIT-POL-VARS-X
           END-IF.

      *INITIALIZE AGENT LEVEL VARIABLES ONLY WHEN AGENT IS CHANGING 
           IF  WS-PREV-AGT-ID NOT = WS-CURR-AGT-ID
               PERFORM  9950-INIT-AGT-VARS         
                   THRU 9950-INIT-AGT-VARS-X
           END-IF.

       8000-WRITE-RPT-REC-X.
            EXIT.
      /
      *------------------
       8100-WRITE-RPT-HDR.                                                
      *------------------

           INITIALIZE RPIAD-SEQ-REC-INFO.
      *GET THE HEADER VALUE FROM WORKING STORAGE
           MOVE WS-RPT-HDR                  TO RPIAD-SEQ-REC-INFO.

           PERFORM  PIAD-1000-WRITE
               THRU PIAD-1000-WRITE-X.

      *UPDATE THE FILE COUNTER
           ADD  +1                          TO WS-TOTAL-FILE-CTR

      *RESET THE WRITE COUNTER TO 1
           MOVE +1                          TO WS-TOTAL-WRITTEN-CTR.

       8100-WRITE-RPT-HDR-X.
            EXIT.
      /
      *------------------
       9000-PRINT-TOTALS.
      *------------------

      *MSG : TOTAL COVERAGES READ---->
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.               

           MOVE 'TOTAL COVERAGES READ---->'
                                            TO WS-ERROR-CTR-LABEL.           
           MOVE WS-TOTAL-READ-CTR           TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.        
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.

      *MSG : TOTAL COVERAGES SKIPPED->
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.               

           MOVE 'TOTAL COVERAGES SKIPPED->'
                                            TO WS-ERROR-CTR-LABEL.           
           MOVE WS-TOTAL-SKIP-CTR           TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.        
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.

      *MSG : TOTAL COVERAGES FAILED-->@1  
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.               

           MOVE 'TOTAL COVERAGES FAILED-->'
                                            TO WS-ERROR-CTR-LABEL.           
           MOVE WS-TOTAL-FAIL-CTR           TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.        
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.

      *MSG : TOTAL RECORDS WRITTEN--->@1 
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.               

           COMPUTE WS-TOTAL-WRITTEN-CTR =
                   ((WS-TOTAL-FILE-CTR - 1) * WS-WRITE-LIMIT )
                    + WS-TOTAL-WRITTEN-CTR.

           MOVE 'TOTAL RECORDS WRITTEN--->'
                                            TO WS-ERROR-CTR-LABEL.           

           MOVE WS-TOTAL-WRITTEN-CTR        TO WS-ERROR-CTR-NUM.

           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.        
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.

      *MSG : POSSIBLE SPLIT FILES --->@1 
           MOVE SPACES                      TO WS-ERROR-CTR-LINE.               

           MOVE 'POSSIBLE SPLIT FILES --->'
                                            TO WS-ERROR-CTR-LABEL.           
           MOVE WS-TOTAL-FILE-CTR           TO WS-ERROR-CTR-NUM.
           MOVE WS-ERROR-CTR-LINE           TO L0040-INPUT-LINE.        
           PERFORM  0040-3000-WRITE-OTHER                                   
               THRU 0040-3000-WRITE-OTHER-X.

       9000-PRINT-TOTALS-X.
           EXIT.
      /
      *--------------------------
       9900-INIT-WORKING-STORAGE.
      *--------------------------

      *ALL THE WORKING STORAGE VARIABLE ARE BAPTIZED HERE
           INITIALIZE WS-SWITCHES-AND-INDICATORS.
           INITIALIZE WS-COUNTERS.
           INITIALIZE WS-PGM-WORK-AREA.

           PERFORM  9910-INIT-CVG-VARS
               THRU 9910-INIT-CVG-VARS-X.

           PERFORM  9920-INIT-POL-CLI-VARS
               THRU 9920-INIT-POL-CLI-VARS-X.

           PERFORM  9930-INIT-CLI-VARS
               THRU 9930-INIT-CLI-VARS-X.

           PERFORM  9940-INIT-POL-VARS
               THRU 9940-INIT-POL-VARS-X.

           PERFORM  9950-INIT-AGT-VARS
               THRU 9950-INIT-AGT-VARS-X.

       9900-INIT-WORKING-STORAGE-X.
           EXIT.
      /
      *-------------------
       9910-INIT-CVG-VARS.
      *-------------------
 
EN3734     SET WS-SSTD-NO                   TO  TRUE.
EN3734     SET WS-CLAIMS-HIST-NO            TO  TRUE.
EN3734
           SET WS-VAR-ACC-NO                TO  TRUE.
MP213I     SET WS-ADV-MEDIC-NO              TO  TRUE.
           MOVE ZEROES                      TO  WS-REG-PREM.
 
           MOVE ZEROES                      TO  WS-PREF-TERM-FA.
           MOVE ZEROES                      TO  WS-NON-SM-TERM-FA.
           MOVE ZEROES                      TO  WS-TERM-FA.
           MOVE ZEROES                      TO  WS-NON-SM-WL-FA.
           MOVE ZEROES                      TO  WS-WL-FA.
EN3734     MOVE ZEROES                      TO  WS-WL-FIP.
EN3734     MOVE ZEROES                      TO  WS-WL-NSFIP.
           MOVE ZEROES                      TO  WS-UL-ACC-DTH-FA.
           MOVE ZEROES                      TO  WS-UL-ADLT-INJ-FA.
           MOVE ZEROES                      TO  WS-ST-HOSP-FA.
           MOVE ZEROES                      TO  WS-HOSP-DIS-FA.
           MOVE ZEROES                      TO  WS-LT-HOSP-FA.
           MOVE ZEROES                      TO  WS-HOSP-ACC-FA.
           MOVE ZEROES                      TO  WS-CT-HOSP-FA.
           MOVE ZEROES                      TO  WS-OUTP-FA.
           MOVE ZEROES                      TO  WS-DISCH-FA.
           MOVE ZEROES                      TO  WS-ACC-OUTP-FA.
           MOVE ZEROES                      TO  WS-FRACTURE-FA.
           MOVE ZEROES                      TO  WS-ADLT-DIS-FA.
           MOVE ZEROES                      TO  WS-FEM-DIS-FA.
           MOVE ZEROES                      TO  WS-CT-ADLT-DIS-FA.
           MOVE ZEROES                      TO  WS-CT-FEM-DIS-FA.
           MOVE ZEROES                      TO  WS-DREAD-DIS-FA.
EN3734     MOVE ZEROES                      TO  WS-DDIP. 
           MOVE ZEROES                      TO  WS-CNCR-LUMP-SUM-FA.
           MOVE ZEROES                      TO  WS-CNCR-HOSP-FA.
           MOVE ZEROES                      TO  WS-CNCR-OUTP-FA.
           MOVE ZEROES                      TO  WS-CNCR-DTH-CVG-FA .
EN3734     MOVE SPACES                      TO  WS-CLAIMS-HIST-CD.   
MP213I     MOVE ZEROES                      TO  WS-PRIM-MEDIC-FA.
MP213I     MOVE ZEROES                      TO  WS-CRIT-ILL-FA. 
MP213I     MOVE ZEROES                      TO  WS-CANCER-DIAGNS-FA. 
 
       9910-INIT-CVG-VARS-X.
           EXIT.
      /
      *-----------------------
       9920-INIT-POL-CLI-VARS.
      *-----------------------
 
           SET WS-LNB-NO                    TO  TRUE.
           SET WS-TCB-NO                    TO  TRUE.
 
       9920-INIT-POL-CLI-VARS-X.
           EXIT.
      /
      *-------------------
       9930-INIT-CLI-VARS.
      *-------------------
 
           MOVE SPACES                      TO  WS-PIAD-INSRD-NAME.
           MOVE SPACES                      TO  WS-PIAD-INS-DOB.
 
       9930-INIT-CLI-VARS-X.
           EXIT.
      /
      *-------------------
       9940-INIT-POL-VARS.
      *-------------------
 
           MOVE SPACES                     TO  WS-PIAD-POL-ID.
           MOVE SPACES                     TO  WS-PIAD-POL-ISS-EFF-DT.
 
       9940-INIT-POL-VARS-X.
           EXIT.
      /
      *-------------------
       9950-INIT-AGT-VARS.
      *-------------------
 
           MOVE SPACES                     TO  WS-PIAD-SERV-BR-ID.
           MOVE SPACES                     TO  WS-PIAD-SO-ID.
           MOVE SPACES                     TO  WS-PIAD-SERV-AGT-ID.
           MOVE SPACES                     TO  WS-PIAD-SERV-AGT-NAME.
 
       9950-INIT-AGT-VARS-X.
           EXIT.
      /
      *-----------------
       9999-CLOSE-FILES.
      *-----------------
 
           PERFORM  BCF-4000-CLOSE
               THRU BCF-4000-CLOSE-X.
 
           PERFORM  PIAD-4000-CLOSE
               THRU PIAD-4000-CLOSE-X.
 
           PERFORM  OCF-4000-CLOSE
               THRU OCF-4000-CLOSE-X.
 
       9999-CLOSE-FILES-X.
           EXIT.
      /
      *****************************************************************         
      *  PROCESSING COPYBOOKS                                         *         
      *****************************************************************         
      /
       COPY CCPPCCC.
       COPY XCPPHDG.

      /
      *****************************************************************         
      *  LINKAGE PROCESSING COPYBOOKS                                 *         
      *****************************************************************         
      /
       COPY CCPS0010.
       COPY CCPL0010.
      /
       COPY CCPS0950.
       COPY CCPL0950.
      /
       COPY CCPS0460.
       COPY CCPL0460.
      /
       COPY CCPS0083.
       COPY CCPL0083.
      /
       COPY CCPS2435.
       COPY CCPL2435.
      /
       COPY XCPL0260.
       COPY XCPL0040.
       COPY XCPL1640.
       COPY XCPL0270.
      /
MP213I COPY XCPL1680.
      /
      *****************************************************************
      *  DATABASE I/O PROCESS MODULE                                  *
      *****************************************************************
      /
       COPY ZCPBPIAD.
       COPY NCPBAMEX.
ACU001*COPY CCPBCLB5.
EN3734 COPY CCPBCLB5.
       COPY NCPBCLUA.
      /
      *****************************************************************         
      *  SEQ FILE I/O PROCESS MODULE                                  *     
      *****************************************************************         
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY OCF 
                               ==':PGM:'== BY =='XSRQOCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY OCF.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY BCF  
                               ==':PGM:'== BY =='XSRQBCF'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY BCF.
       COPY XCSNSEQ  REPLACING ==:ID:==  BY BCF.
      /
       COPY XCSLFILE REPLACING ==:ID:==  BY PIAD  
                               ==':PGM:'== BY =='ZSRQPIAD'==.
       COPY XCSOFILE REPLACING ==:ID:==  BY PIAD.
       COPY XCSASEQ  REPLACING ==:ID:==  BY PIAD.
      /
      *****************************************************************         
      *  ERROR HANDLING ROUTINES                                      *         
      *****************************************************************         
       COPY XCPL0030.
 
      *****************************************************************
      **                 END OF PROGRAM CSBM0206                     **
      *****************************************************************
