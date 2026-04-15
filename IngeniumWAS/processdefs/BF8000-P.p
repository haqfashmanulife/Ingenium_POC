# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:54 PM EDT

#*******************************************************************************
#*  Component:   BF8000-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01BL18  PHASE1   Rename LISTBILL FIELDS TO PAYROLL DEDUCTION               *
#*  01CP02  PHASE1   Add Servicing Agent Sales Office and Policy Agent Type    *
#*  01PR21  PHASE1   Add Fund Survivorship Benefit Date                        *
#*  01PT02  PHASE1   Add Policy Certificate reprint date and number            *
#*  01NB01  PHASE1   Add new fields for Application Upload                     *
#*  B00189  DPK      Removed Owner's Relationship to Insured                   *
#*  B00333  VAN      Add ACCT-HLDR-TYP-CD AND COMB-BILL-IND                    *
#*  B00489  PHASE1   ADD POL-ASIGN-DT                                          *
#*  B00626  WBP      ADD POL-MISC-SUSP-AMT                                     *
#*  02BL63  PHASE1   ADD POL-BT-BILL-DLAY-IND & POL-BT-STRT-DT                 *
#*  02GL57  DPK      CWA Suspense Account and Refund                           *
#*  02PR62  DPK      JOINT TO SINGLE CHANGE                                    *
#*  1CNB02  EKM      ADD MIR-POL-CNVR-KEY-NUM & MIR-POL-CNVR-TYP-CD            *
#*  M00025  MAW      ADD MIR-POL-SUB-STAT-CD                                   *
#*  PR006D  WBP      ADD MIR-PROD-APP-TYP-CD                                   *
#*  PR006O  AC       Change  MIR-AGT-UWG-FAIL-IND to Drop-down box             *
#*  PR0001  ROC      20% MVA Free Withdrawal                                   *
#*  HCL106  HIN/CL   SUPPRESS SURRENDER               (HCL106B)                *
#*                   Add Suppress Surrender indicator MIR-POL-SUPRES-SURR-IND  *
#*  PR006Q  FB       ADD OLD (MY KEMPO) POLICY INFORMATION SECTION             *
#*  P00859  FB       Add MIR-CVG-REINS-IND and MIR-CVG-REINS-CO-ID             *
#*  UCPUPL  SC       UCP Upload, add MIR-POL-HNDL-CD                           *
#*  MFFCC2  SUG      ADD THREE NEW FIELDS FOR SEG FUND SUPPORT                 *
#*  MP5001           Add FIEL-INS-PURP-IND for fIEL changes                    *
#*  MPCR22  CTS      Add Two new fields MIR-CR-FORM-END-DT                     *
#*                   and MIR-ANUTNT-ASIGN-DT                                   *
#*  FEID01  CTS      ADD LIAB-STRT-DT for for LCD Issue Date Calculation       *
#*  FEID01           - Online Screen Changes                                   *
#*  FEID03  CTS      ADD ISSUE PROCESSING DATE                                 *
#*  BU6884  CTS      CHANGE THE LOOK-UP FOR MIR-CVG-REINS-CO-ID                *
#*  NWLXML  CTS      Add Designated Policy Issue Indicator and Bulk Remittance *
#*                   Registration Number                                       *
#*  NWLCWA  CTS      ADD POL-CHNL-CD for policy channel type, CWA-PRCES-DT     *
#*  NWLCWA               for initial CWA process date and POL-OS-ID-IND for    *
#*  NWLCWA               policy owner identity verification                    *
#*  NWLPSC  CTS      Changes done to increase the length of policy fee and     *
#*  NWLPSC           modal factors                                             *
#*  NWLIQS  CTS      Add New fields to Support Trad Whole Life                 *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *    
#*  NWLPNB  CTS      Added MIR-ADV-PMT-DUR for handling Advance payment        *
#*  NWLGLR  CTS      Add TD Lapse date MIR-DV-TD-LAPS-DT  for Trad Policies    *
#*  NWLPP5  CTS      Added MIR-DV-ADV-PMT-AMT for Advance Payment              *
#*  NWLGAR  CTS      Added MIR-ANN-STMT-NOT-REQ-IND for trad policies          *
#*  ATU688  CTS      CHANGES TO REMOVE THE ADVANCE PAYMENT CHANGES FOR         *
#*  ATU688           ADMIN POLICIES                                            *
#*  E11095  CTS      Changes done to add a new field Previous Agent Change     *
#*  E11095           Request Date in the online screen                         *
#*  M117PB CTS      CHANGES MADE TO DISPLAY FUTURE BILLING INFORMATION FOR THE *
#*                  POLICIES HAVING FUTURE ACTIVITY STATUS FOR BILL MODE/TYPE  *
#*                  CHANGE AS PENDING.                                         *
#*  C12653  CTS      Added new field Disaster Code                             *
#*  MP142G  CTS     Changes for Future dated sundry amount change              *
#*  MP143D  CTS     Added fields MIR-SRVBEN-NXT-PO-EFF-DT,                     *
#*                  MIR-ACT-BNFT-PAID-AMT, MIR-NET-SCHE-PO-AMT for             *
#*                  SURVIVAL BENEFIT SECTION                                   *
#*  MP142L  CTS      Added field Auto Premium Change Rider Indicator           *
#*  MP142Q  CTS      Changes to add a new field - Policy renewal process       *
#*  MP142Q  CTS      accept date                                               *
#*  M142S1  CTS      Added Connected Policy Information new section for        *
#*  M142S1  CTS      Split Policy                                              *
#*  M161CA  CTS      ADDITION OF NEW FIELD INIT-PMT-TYP-CD                     *
#*  MP168A  CTS      ADDED THE FIELD FIRST PREMIUM PAYMENT ROUTE               *
#*  C15454  CTS      ADDED DISASTER LAPSE DATE                                 *
#*  Q11521  CTS      ADDED SUB TYPE CODE FOR PLAN-INIT-PMT-TYP-CD              *
#*  MP173A   CTS     ADDED FIELD FOR TAX CERTIFICATE NOT REQUIRED POLICY       *
#*  MP176B  CTS      ADDED A NEW FIELD POL-BULK-APP-ID                         *
#*  MP176Q  CTS      ADDED A NEW FIELD AGE-LAST-IND FOR ARM                    *
#*  MP195A  CTS      ADDED FIELD FOR WIRE TRANSFER INDICATOR                   *
#*  MP226F  CTS      ADDED NEW FIELD FOR TAX CERTIFICATE IDENTIFICATION CODE   *
#*  C20733  CTS      PS-SD110092 ADDED A NEW FIELD POLICY                      *
#*                   PRESCRIPTION BIT INDICATOR                                *
#*  MP242F  CTS      ADDED NEW FIELD FOR CORPORATE BENEFICIARY INSURED IND     *
#*  MP245R  CTS     CHANGES FOR BILLING FIELDS & CALL CENTER - SPWL POLICIES   * 
#*  M228J1 02MAY14     POLICY OWNER CHANGES FOR WEBSERVICES                    * 
#*  MP261B  CTS	     ADDED NEW FIELDS FOR ARM2 NON FACE TO FACE                *
#*  MP261A  CTS      ARM2  NEW BUSINESS CHANGES                                * 
#*  M26106  CTS      ADDED NEW FIELD FOR ARMV2 - Early First Premium BT Flag   *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M271B2 CTS      ADDED NEW FIELD FOR FRA-SCHEDULED ADVANCED PREMIUM PAYMENT *
#*  M271B2 CTS      FREQUENCY                                                  *
#*  M271A8  CTS      Online Screen Changes done as part of FRA                 *
#*  MP281F  CTS      ADDED NEW FIELD FOR RC-CANCER RECOVERY PAYMENT DATE       *
#*  M319N2 CTS       ADDED NEW FIELD FOR FXWL-YEN BILL AMOUNT REPORT REQUIRED  *
#*  M319N2 CTS       INDICATOR                                                 *
#*  M319I3  CTS      CHANGES FOR FXWL CALL CENTER INQUIRY SCREEN               *
#*  MP334C  CTS      ADDED NEW FIELD FOR PREVIOUS POLICY OWNER DEATH DATE      *
#*  P1454A  CTS      CHANGES FOR DOUBLE TAXATION                               *
#*  R14127  CTS      CHANGES FOR DISASTER RECOVERY                             *
#*  TV2003  CTS      SULV2 NEW BUSINESS CHANGES                                *
#*  TV2011  CTS      CHANGES FOR SULV2 CALL CENTER INQUIRY                     *
#*  TV201A  CTS      CR CHANGES FOR SULV2 CALL CENTER INQUIRY                  *
#*  113120  CTS      FIX FOR SULV2 CALL CENTER INQUIRY                         *
#*  018396  CTS      CHANGES FOR PAPER LESS APP INDICATOR - EPOS               *
#*  TDMG07  CTS      NWL SCREEN CHANGES                                        *
#*  118579  CTS      CHANGES DONE TO CORRECT THE FIELD PREMIUM PAYMENT         *
#*  118579           DESCRIPTION                                               *
#*  TDM22E  CTS      ADDED A NEW FILED FOR NWL/NWL2 FOR ANNUITY                *  
#*  MP771B  CTS      CHANGES DONE TO POPULATE THE SHORTAGE AMOUNT FOR DISASTER *
#*  UYS092  CTS      ADMIN POLCERT ASSIGNMENT STATUS CHANGES                   *
#*  UYS072  CTS	     NEW BUSINESS FULL KANJI ADDRESS CHANGES                   *
#*  UY9307  CTS      UYS093 - CR07 CHANGES ADDITION OF NEW FIELD               *
#*  TDM21C  CTS      POLICY INQUIRY SCREEN CHANGES NWL DAY 4.0                 *
#*  FF2003  CTS      ADDED NEW FIELD POLICY PROVISION TYPE FOR FFF SMBC CHANGES*
#*  UYS033  CTS      ADDED NEW FIELD OVERLOAN REPAYMENT DUE DATE               *
#*  RPU014  CTS      CHANGESHAS BEEN MADE FOR RPU PROCESSING SCREEN            *
#*  132589  CTS      RPU014 - CONTRACT BEFORE RPU                              *
#*  RPUV2C  CTS      RPUV2C - CHANGES DONE ON PERIOD OF INSURANCE BEFORE CHANGE*
#*  TLB003  CTS      CHANGES FOR NEW BUSINESS                                  *
#*  TLB015  CTS      REINSURANCE TYPE                                          *
#*  TLB26C  CTS      ADDED NEW FIELDS FOR TLB PRODUCTS                         *
#*  23802I  CTS      CHANGES HAS BEEN MADE FOR SUL MATURITY PROCESSING SCREEN  *
#*  PM0279  CTS      CHANGES DONE FOR PROD APP TYP CODE                        *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  UYSD11  CTS      ADDIITION OF UNISYS MIGRATION TYPE CODE                   *
#*  UY3037  CTS      INGENIUM SURVIVAL BENEFIT                                 *
#*  UY3060  CTS      SYSTEM SPEC B INGENIUM-DIVIDEND PROCESSING                *
#*  UY3068  CTS      ADDITION OF FIELDS AS PART OF FA REDUCTION                *
#*  UY3048  CTS      INGENIUM STREAM 3 MATURITY PROCESSING                     *
#*  UY3064  CTS      WHOLE LIF PREMIUM PAYMENT COMPLETION CHANGES              *
#*  UY3098  CTS      INGENIUM SET POLICY PROCESSING			       *
#*  S25083  CTS      CHANGES DONE FOR  S25083- BILL MODE CHANGE                *
#*  28053A  CTS      CHANGES DONE AS PART OF RESTRICT NAME CHANGE              *
#*  UY3071  CTS      HEALTH CONGRATULATORY BENEFIT                             *
#*  UY3C46  CTS    CONVERSION BALANCE CR                                       *
#*  UY3047  CTS      ADDED NEW FIELDS AS PART OF ANNUITY STREAM 3              *
#*  UY3147  CTS     CONVERSION DHY TO UL                                       *
#*  UY3049  CTS      ANNUITY TRANSITION PROCESSING STREAM 3                    *
#*  UY3121  CTS      CR121 CHANGES                                             *
#*  UY304A  CTS      CALL CENTER SCREEN ENHANCEMENT                            *
#*  UY3153  CTS      CR148 DHY ANNUITY CSV  
#*  27624C  CTS      ADDED NEW FIELD FOR EPOL FLAG AND TRXN CONFIRMATION       *
#*  29746F  CTS      CHANGES AS PART OF CERBERUS NEW BUSINESS                  *
#*  29746K  CTS      CHANGES AS PART OF CERBERUS INQUIRY CALL CENTRE           *
#*  M2025D           CHANGES DONE AS THE PART OF FRA-2025 PROJ                 *
#*  M2025F  CTS      ADDITION OF JUDGEMENT RATE FIELD FOR FRA                  *
#*  ON2132  CTS      CHANGES DONE AS PART OF ONTARIO-2132 JIRA                 *
#*******************************************************************************


P-STEP BF8000-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8000";
        BusinessFunctionName = "Policy Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM8000";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-ACCT-HLDR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-HLDR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Bank Account Holder Type";
    }

    OUT MIR-ACRU-CALC-TIME-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACRU-CALC-TIME-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Accrual Income Calculation Time Code";
    }

    OUT MIR-AGT-ID-T[2]
    {
        Length = "6";
        FieldGroup = "Table2";
        KeyColumn;
        DBTableName = "TPOLW";
        SType = "Text";
        Label = "Writing Agent Number";
        Index = "1";
    }

    OUT MIR-ANPAYO-1-DEST-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-DEST-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Annuity 1 Destination Registered Code";
    }

    OUT MIR-ANPAYO-1-MTHD-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-MTHD-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Method to Pay First Annuitant";
    }

    OUT MIR-ANPAYO-2-DEST-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-DEST-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Annuity 2 Destination Registered Code";
    }

    OUT MIR-ANPAYO-2-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-MTHD-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Method to Pay Second Annuitant";
    }

    OUT MIR-APP-FORM-TYP-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "AFTT";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Application Form Type";
    }

    OUT MIR-AUTO-PREM-PMT-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Automatic Premium Payment Indicator";
    }

    OUT MIR-BILL-LEAD-TIME-DUR
    {
        Length = "3";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billing Lead Time";
    }

    OUT MIR-BILL-RMND-REASN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BILL-RMND-REASN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billing Reminder Notice Type";
    }

    OUT MIR-CLI-ADDR-TYP-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Client Address Type";
        Index = "1";
    }

    OUT MIR-CLI-BTH-DT-T[5]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Client's Date of Birth";
        Index = "1";
    }

    OUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Client's Current Location";
    }

    OUT MIR-CLI-ID-T[5]
    {
        Length = "10";
        FieldGroup = "Table1";
        KeyColumn;
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Client ID";
        Index = "1";
    }

    OUT MIR-CLI-TAX-ID-T[5]
    {
        Length = "9";
        FieldGroup = "Table1";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client's Tax ID";
        Index = "1";
    }

    OUT MIR-CLM-PAYE-CVG-NUM
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Coverage Number to which a Claim is Paid";
    }

    OUT MIR-CLM-PAYE-POL-ID-BASE
    {
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Claim Payment Policy ID";
    }

    OUT MIR-CLM-PAYE-POL-ID-SFX
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Claim Payment Policy Suffix";
    }

    OUT MIR-CLM-PAYE-REL-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLM-PAYE-REL-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Relationship of Recipient of Claim Payment";
    }

    OUT MIR-CLM-PAYO-MTHD-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CLM-PAYO-MTHD-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Claim Payment Method";
    }

    OUT MIR-COMB-BILL-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMB-BILL-IND";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Combine Billing Indicator";
    }

    OUT MIR-CONN-OPTL-POL-ID-BASE
    {
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Connected Optional Policy ID";
    }

    OUT MIR-CONN-OPTL-POL-ID-SFX
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Connected Optional Policy Suffix";
    }

    OUT MIR-DV-AGT-CLI-NM-T[2]
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Agent Name";
        Index = "1";
    }

    OUT MIR-DV-ANUTNT-ADDR-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Annuitant Client Address Type";
        Index = "1";
    }

    OUT MIR-DV-ANUTNT-CLI-ID-T[5]
    {
        Length = "10";
        FieldGroup = "Table2";
        KeyColumn;
        DBTableName = "Derived";
        SType = "Text";
        Label = "Annuitant Client ID";
        Index = "1";
    }

    OUT MIR-DV-ANUTNT-CLI-NM-T[5]
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Annuitant Name";
        Index = "1";
    }

    OUT MIR-DV-ANUTNT-SUB-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "DV-ANUTNT-SUB-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Annuitant Client Relationship Type";
        Index = "1";
    }
#MPCR22 changes starts
    OUT MIR-CR-FORM-CMPLT-DT-T[5]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TPOLC";
        SType = "Date";
        Label = "Change Request Form Completion Date";
        Index = "1";
    }

    OUT MIR-ANUTNT-ASIGN-DT-T[5]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TPOLC";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

#P1454A CHANGES START HERE
    OUT MIR-ANUTNT-CHNG-EVNT-CD-T[5]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "ANUTNT-CHNG-EVNT-CD";
        DBTableName = "TPOLC";
        SType = "Selection";
        Label = "Annuitant Change Event";
        Index = "1";
    }
#P1454A CHANGES END HERE
#MPCR22 changes Ends here

    OUT MIR-DV-ASIGN-ADDR-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Assignee Client Address Type";
        Index = "1";
    }

    OUT MIR-DV-ASIGN-CLI-ID-T[5]
    {
        Length = "10";
        FieldGroup = "Table4";
        KeyColumn;
        DBTableName = "Derived";
        SType = "Text";
        Label = "Assignee Client ID";
        Index = "1";
    }

    OUT MIR-DV-ASIGN-CLI-NM-T[5]
    {
        Length = "30";
        FieldGroup = "Table4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Assignee Name";
        Index = "1";
    }

    OUT MIR-DV-ASIGN-SUB-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "DV-ASIGN-SUB-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Assignee Client Relationship Type";
        Index = "1";
    }

    OUT MIR-DV-IPARTY-ADDR-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table5";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Interested Party Client Address Type";
        Index = "1";
    }

    OUT MIR-DV-IPARTY-CLI-ID-T[5]
    {
        Length = "10";
        FieldGroup = "Table5";
        KeyColumn;
        DBTableName = "Derived";
        SType = "Text";
        Label = "Interested Party Client ID";
        Index = "1";
    }

    OUT MIR-DV-IPARTY-CLI-NM-T[5]
    {
        Length = "30";
        FieldGroup = "Table5";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Interested Party Name";
        Index = "1";
    }

    OUT MIR-DV-LBILL-ADDR-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payroll Deduction Client Address";
    }

    OUT MIR-DV-LBILL-CLI-ID
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payroll Deduction Client ID";
    }

    OUT MIR-DV-LBILL-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payroll Deduction Name";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-OWN-CLI-NM-T[5]
    {
        Length = "30";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }
#MP334C CHANGES START HERE     
    OUT MIR-CLI-DTH-DT-T[5]
        {
            Length = "10";
            FieldGroup = "Table1";
            DBTableName = "TPOLC";
            SType = "Date";
            Label = "Previous policy holder death date";
            Index = "1";
    }
#MP334C CHANGES END HERE 
    OUT MIR-DV-OWN-SUB-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "DV-OWN-SUB-CD";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Owner Client Relationship Type";
        Index = "1";
    }

    OUT MIR-DV-PAYR-ADDR-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payor Client Address Type";
    }

    OUT MIR-DV-PAYR-CLI-ID
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payor Client ID";
    }

    OUT MIR-DV-PAYR-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payor Name";
    }

    OUT MIR-DV-PAYR-SUB-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-PAYR-SUB-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payor Client Relationship Type";
    }

    OUT MIR-DV-SERV-AGT-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Servicing Agent Name";
    }

    OUT MIR-DV-SPOUS-ADDR-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Spouse Client Address Type";
    }

    OUT MIR-DV-SPOUS-CLI-ID
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Spouse Client ID";
    }

    OUT MIR-DV-SPOUS-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Spouse Name";
    }

    OUT MIR-DV-TRST-ADDR-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Trustee Client Address Type";
        Index = "1";
    }

    OUT MIR-DV-TRST-CLI-ID-T[5]
    {
        Length = "10";
        FieldGroup = "Table6";
        KeyColumn;
        DBTableName = "Derived";
        SType = "Text";
        Label = "Trustee Client ID";
        Index = "1";
    }

    OUT MIR-DV-TRST-CLI-NM-T[5]
    {
        Length = "30";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Trustee Name";
        Index = "1";
    }

    OUT MIR-ENHC-UWG-APROV-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ENHC-UWG-APROV-IND";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Underwriting Approved for Enhancement";
    }

    OUT MIR-ENHC-UWG-REQIR-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ENHC-UWG-REQIR-IND";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Underwriting required for Enhancement";
    }

    OUT MIR-GAIN-RPT-TIME-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "GAIN-RPT-TIME-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Gain on Disposition Reporting Time Code";
    }

    OUT MIR-LINK-POL-ISS-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Policy Linked to Others Indicator";
    }

    OUT MIR-LOAN-INT-DEDBL-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Include Loan Interest in ACB Indicator";
    }

    OUT MIR-LXPCT-CALC-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "LXPCT-CALC-CD";
        DBTableName = "TPOLT";
        SType = "Text";
        Label = "Basis of Life Expectancy Factor";
    }

    OUT MIR-LXPCT-RECALC-IND
    {
        Length = "40";
        DBTableName = "TPOLT";
        SType = "Indicator";
        Label = "Annual Life Expectancy Factor Recalculation Code";
    }

    OUT MIR-MODE-FCT-RESTR-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Mode Factor Restrict Indicator";
    }

    OUT MIR-MPREM-DSCNT-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Mode Premium Discount Amount";
    }

    OUT MIR-NXT-ACTV-TYP-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "NXT-ACTV-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Type of Next Automatic Activity";
    }

    OUT MIR-PAC-REDRW-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PAC-REDRW-OPT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "PAC Redraw Option";
    }

    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Plan ID";
    }

    OUT MIR-PLAN-PERI-PREM-AMT
    {
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Planned Periodic Premium Amount";
    }

    OUT MIR-POL-AGT-SHR-PCT-T[2]
    {
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table2";
        DBTableName = "TPOLW";
        SType = "Percent";
        Label = "Agent's Share Percentage";
        Index = "1";
    }

    OUT MIR-POL-AGT-TYP-CD-T[2]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CVG-AGT-TYP-CD";
        DBTableName = "TPOLW";
        SType = "Text";
        Label = "Agent Type";
        Index = "1";
    }

    OUT MIR-POL-ANPAYO-1-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Amount Payable to First Annuitant";
    }

    OUT MIR-POL-ANPAYO-2-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Amount Payable to Second Annuitant";
    }

    OUT MIR-POL-ANPAYO-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Effective Date of Annuity";
    }

    OUT MIR-POL-ANPAYO-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-ANPAYO-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Frequency of Annuity Payments";
    }

    OUT MIR-POL-ANPAYO-PMT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Date of Last Immediate Annuity Payment";
    }

    OUT MIR-POL-APL-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "APL Separate Option for Nonforfeiture";
    }

    OUT MIR-POL-APP-CMPLT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Application Completion Date";
    }

    OUT MIR-POL-APP-CTR
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Application Counter";
    }

    OUT MIR-POL-APP-FORM-ID
    {
        Length = "15";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Application Form ID";
    }

    OUT MIR-POL-APPL-CTL-CD
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Application System Code";
    }

    OUT MIR-POL-APP-RECV-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Application Received Date";
    }

    OUT MIR-POL-APP-SIGN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Application Signed Date";
    }

    OUT MIR-POL-APP-SIGN-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-APP-SIGN-IND";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Application Signed Indicator";
    }

    OUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Billing Mode";
    }

    OUT MIR-POL-BILL-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Billed to Date";
    }

    OUT MIR-POL-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        #M161CA START
        #Label = "Policy Billing Method";
        Label = "Policy Billing Method(Subsequent Premium)";
        #M161CA END
    }

    #M161CA START
    OUT MIR-INIT-PMT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INIT-PMT-TYP-CD";
        SType = "Text";
        Label = "Payment Route (First Premium)";
    }
    #M161CA END
    OUT MIR-POL-BT-BILL-DLAY-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Bank Transfer Billing Delay";
    }

    OUT MIR-POL-BT-STRT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "BT Policy First Draw Date";
    }

    OUT MIR-POL-CEAS-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Cease Date";
    }

    OUT MIR-POL-CEAS-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CEASE";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Reason for Policy Termination on Cease Date";
    }

    OUT MIR-POL-CLI-ASIGN-DT-T[5]
    {
        Length = "10";
        FieldGroup = "Table4";
        DBTableName = "TPOLC";
        SType = "Date";
        Label = "Effective Date of Assignment";
        Index = "1";

    }

    OUT MIR-POL-CNFD-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Policy Confidential Indicator";
    }

    OUT MIR-POL-COMNT-TXT
    {
        Length = "50";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Comments/Remarks";
    }

    OUT MIR-POL-CRCY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Currency Used for Balances";
    }

    OUT MIR-POL-CRNT-MODE-FCT
    {
        Signed;
        Length = "9";
        Decimals = "7";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Policy Mode Factor";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Policy Status";
    }
    
    # TDMG07 changes begin
    
    OUT MIR-PREM-PMT-CMPLT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
# 118579 changes begin      
#       Label = "Premium Payment Completion";
	Label = "Base Policy Premium Payment Completion";
# 118579 changes end 
     }
    		    
   # TDMG07 changes end 

    OUT MIR-POL-CTRY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Country of Issue Location";
    }

    OUT MIR-POL-CVG-REC-CTR
    {
        Length = "40";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages on This Policy";
    }

    OUT MIR-POL-DB-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DB-OPT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Death Benefit Option";
    }

    OUT MIR-POL-DIV-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Dividend Option";
    }

    OUT MIR-POL-ENHC-CHNG-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Date of Next Enhancement Option";
    }

    OUT MIR-POL-ENHC-NELCT-QTY
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Non-Elections for Enhancement Benefit";
    }

    OUT MIR-POL-FINAL-DISP-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Final Disposition Date";
    }

    OUT MIR-POL-FREE-LK-END-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "End of Free Look Date";
    }

    OUT MIR-POL-GRS-APREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Amount of Gross Annual Premium";
    }

    OUT MIR-POL-INS-PURP-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "PURP";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Purpose of Insurance";
    }

    OUT MIR-POL-INS-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Type of Insurance of the Base Coverage";
    }

    OUT MIR-POL-ISS-DT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-ISS-DT-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Issue Date Rules";
    }

    OUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Issue Date of the Policy";
    }

    OUT MIR-POL-ISS-LOC-CD
    {
        Length = "40";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Issue Location of the Policy";
    }

    OUT MIR-POL-LOAN-REPAY-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Amount Billed for Repayment of Loans";
    }

    OUT MIR-POL-MAIL-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Date of Policy Mailing";
    }

    OUT MIR-POL-MAIL-REASN-CD
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Reason for Additional Policy Mailing";
    }

    OUT MIR-POL-MEC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-MEC-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Modified Endowement Contract (MEC) Reason";
    }

    OUT MIR-POL-MIB-SIGN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-MIB-SIGN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "MIB Signature Received";
    }

    OUT MIR-POL-MPREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Modal Premium as of Paid to Date";
    }

    OUT MIR-POL-NFO-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-NFO-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Non-Forfeiture Option";
    }

    OUT MIR-POL-NXT-ACTV-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Date of Next Automatic Process";
    }

    OUT MIR-POL-OPTL-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-OPTL-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Key/Optional Status";
    }

    OUT MIR-POL-PAC-DRW-DY
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Billing Draw Day";
    }

    OUT MIR-POL-PAC-REDRW-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Date PAC will Re-draw for premiums";
    }

    OUT MIR-POL-PAC-RETRN-1-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Reason of Returned Cheque";
    }

    OUT MIR-POL-PAC-RETRN-1-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Date of Returned Cheque";
    }

    OUT MIR-POL-PAC-RETRN-2-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Reason Most Recent Cheque Returned";
    }

    OUT MIR-POL-PAC-RETRN-2-DT
    {
        Length = "9";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Date of Most Recently Returned Cheque";
    }

    OUT MIR-POL-PDF-RFND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PDF-RFND-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Status of Policy Deposit Fund (PDF) Funds";
    }

    OUT MIR-POL-PD-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Paid to Date";
    }

    OUT MIR-POL-PFEE-FCT
    {
        Signed;
        Length = "9";
        Decimals = "7";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Policy Fee Factor";
    }

    OUT MIR-POL-PFEE-RESTR-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Restrict Billing of Policy Fee";
    }

    OUT MIR-POL-PNSN-QUALF-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PNSN-QUALF-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Pension Qualification Description";
    }

    OUT MIR-POL-PNSN-SRC-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PENSR";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Financial Institution which Transfered Funds for Payment";
    }

    OUT MIR-POL-PREM-DSCNT-PCT
    {
        Signed;
        Length = "5";
        Decimals = "3";
        DBTableName = "TPOL";
        SType = "Percent";
        Label = "Policy Discount Percentage Applied to Premium";
    }

    OUT MIR-POL-PREM-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-PREM-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Type of Premium Payment";
    }

    OUT MIR-POL-RBILL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-RBILL-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Restrict NFO or Billing Activity Reason";
    }

    OUT MIR-POL-REG-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-REG-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Location Policy Registered";
    }

    OUT MIR-POL-REG-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Date Policy Registered";
    }

    OUT MIR-POL-REG-FND-SRC-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-FND-SRC-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Source of Funds for Payment";
    }

    OUT MIR-POL-REINS-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REINS-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Reinsurance Indicator";
    }

    OUT MIR-POL-SUPRES-SURR-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Suppress Surrender Indicator";
    }


    OUT MIR-POL-RUSH-IND
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-RUSH-IND";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy High Priority Indicator";
    }

    OUT MIR-POL-SFB-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-SFB-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Special Frequency Bills produced Annually";
    }

    OUT MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sundry Payment Amount";
    }

    OUT MIR-POL-SNDRY-REASN-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUNRE";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sundry Payment Reason";
    }

    OUT MIR-POL-SUPRES-ISS-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Policy Suppress Issue Indicator";
    }

    OUT MIR-POL-TAX-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-TAX-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Tax Type";
    }

    OUT MIR-POL-TXEMP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-TXEMP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Tax Exempt Status";
    }

    OUT MIR-POL-VPO-PU-DUR
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Years Premium Should 'Vanish' By";
    }

    OUT MIR-PREM-DSCNT-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PDTYP";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Discount Type";
    }

    OUT MIR-PREM-RECALC-OPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-RECALC-OPT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Recalculated Premium Option";
    }

    OUT MIR-PREV-SERV-AGT-ID
    {
        Length = "6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Previous Servicing Agent";
    }

#* EN11095 CHANGES START
    OUT MIR-AGT-CHNG-RQST-DT
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Previous Agent Change Request Date";
    }
#* EN11095 CHANGES END

    OUT MIR-RBILL-DEPT-ID
    {
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        DBTableName = "TRSTB";
        SType = "Text";
        Label = "Department That Initiated Restrict Billing";
    }

    OUT MIR-RBILL-EFF-DT
    {
        Length = "10";
        DBTableName = "TRSTB";
        SType = "Date";
        Label = "Restrict Billing Effective Date";
    }

    OUT MIR-RBILL-END-DT
    {
        Length = "10";
        DBTableName = "TRSTB";
        SType = "Date";
        Label = "Restrict Billing End Date";
    }

    OUT MIR-RBILL-MISC-1-CD
    {
        Length = "40";
        DBTableName = "TRSTB";
        SType = "Text";
        Label = "Restrict Billing Code 1";
    }

    OUT MIR-RBILL-MISC-2-CD
    {
        Length = "40";
        DBTableName = "TRSTB";
        SType = "Text";
        Label = "Restrict Billing Code 2";
    }

    OUT MIR-RBILL-USER-ID
    {
        Length = "8";
        DBTableName = "TRSTB";
        SType = "Text";
        Label = "User ID that Initiated Restrict Bill";
    }

    OUT MIR-REG-SAV-PORTN-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Registered Savings Portion Amount";
    }

    OUT MIR-REG-SAV-PORTN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-SAV-PORTN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Registered Savings Portion Coder";
    }

    OUT MIR-REG-SPCL-HNDL-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-SPCL-HNDL-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Special Handling Type for Tax Receipts";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Subsidiary Company ID";
    }

    OUT MIR-SERV-AGT-ASIGN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Servicing Agent Assignment Date";
    }

    OUT MIR-SERV-AGT-ID
    {
        Length = "6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Servicing Agent ID";
    }

    OUT MIR-SERV-BR-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Servicing Agent's Branch";
    }

    OUT MIR-SERV-SO-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "SALE";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Servicing Agent's Sales Office";
    }

    OUT MIR-SFB-END-DT
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Date";
        Label = "SFB End Date";
    }

    OUT MIR-SFB-GP-END-DT-NUM
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Text";
        Label = "SFB Gap End Date";
    }

    OUT MIR-SFB-GP-STRT-DT-NUM
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Text";
        Label = "SFB Gap Start Date";
    }

    OUT MIR-SFB-NXT-BILL-AMT
    {
        Length = "15";
        DBTableName = "TSFBL";
        SType = "Currency";
        Label = "SFB Next Billing Amount";
    }

    OUT MIR-SFB-SEMI-MTHLY-DY
    {
        Length = "3";
        DBTableName = "TSFBL";
        SType = "Day";
        Label = "SFB Semi Monthly Billing Alternate Draw Day";
    }

    OUT MIR-SFB-STRT-DT
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Date";
        Label = "SFB Start Date";
    }

    OUT MIR-TAX-1035-ACB-AMT
    {
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "ACB on 1035 Exchange Amount";
    }

    OUT MIR-TAX-RPT-FREQ-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "TAX-RPT-FREQ-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Tax Reporting Frequency";
    }

    OUT MIR-UL-INIT-PREM-AMT
    {
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Initial Premium Amount";
    }

    OUT MIR-UL-LAPS-STRT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Lapse Start Date";
    }

    OUT MIR-UNMTCH-MAIL-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Unmatched Mail Indicator";
    }

    OUT MIR-USER-ID
    {
        Length = "8";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "User ID";
    }

    OUT MIR-NXT-FND-SRVBEN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Next Fund Survivorship Benefit Date";
    }

    OUT MIR-POL-REPRT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Certificate Reprint Date";
    }

    OUT MIR-POL-PRT-QTY
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of times Certificate Printed";
    }

    OUT MIR-POL-APP-UPLD-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Application Upload Date";
    }

    OUT MIR-POL-APP-CALC-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Illustration Calculation Date";
    }

    OUT MIR-POL-LUMP-SUM-AMT
    {
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Lump Sum Amount at Issue";
    }

    OUT MIR-POL-REFRL-ID
    {
        Length = "6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Referral Code";
    }

    OUT MIR-POL-ASIGN-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Policy Assigned Indicator";
    }

    OUT MIR-POL-ASIGN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Assigned Date";
    }

    OUT MIR-ADDR-CORCT-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Address Correction Indicator";
    }

    OUT MIR-CORCT-APP-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Correct Application Indicator";
    }

    OUT MIR-CNSLT-HO-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Head Office Consultation Request Indicator";
    }

    OUT MIR-RQST-CNFRM-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Pre-Issue Confirmation Indicator";
    }

    OUT MIR-APP-PROB-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Problems with Application Indicator";
    }

    OUT MIR-AGT-UWG-FAIL-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CNTRCT-REL-TYP";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Contract Relationship Type";
    }

    OUT MIR-FREE-WTHDR-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Last Free Withdrawal Date";
    }

    OUT MIR-POL-CWA-SUSP-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Cash with App Suspense Balance";
    }

    OUT MIR-POL-CSH-RFND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-CSH-RFND-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Cash Refund:";
    }

    OUT MIR-POL-APP-REASN-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-APP-REASN-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Reason for Application";
    }

    OUT MIR-POL-CNVR-KEY-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Conversion Key Number";
    }

    OUT MIR-POL-CNVR-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CNVR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Conversion Policy Type Code";
    }

    OUT MIR-POL-SUB-STAT-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Policy Sub Status";
    }

    OUT MIR-PROD-APP-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Product Application Type Code";
    }

    OUT MIR-SUB-CAT-CD
    {
        Length = "3";
        DBTableName = "TPOLK";
        SType = "Text";
        Label = "Sub Category";
    }

    OUT MIR-ORIG-POL-ID
    {
        Length = "7";
        DBTableName = "TPOLK";
        SType = "Text";
        Label = "Original Policy Number";
    }

    OUT MIR-MY-KEMPO-TYP-CD
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "My Kempo Type Code";
    }

    OUT MIR-ORIG-POL-ISS-DT
    {
        Length = "10";
        SType = "Date";
        DBTableName = "TPOLK";
        Label = "Original Policy Issue Effective Date";
    }

    OUT MIR-ORIG-POL-DUR
    {
        Length = "2";
        DBTableName = "TPOLK";
        SType = "Text";
        Label = "Original Policy Term";
    }

    OUT MIR-CVG-REINS-IND
    {
        Length = "3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Reinsured Coverages";
    }

#BU6884 changes start
    OUT MIR-CVG-REINS-CO-ID
    {
#        Length = "1";
        Length = "2";
#        CodeSource = "DataModel";
#        CodeType = "CVG-REINS-CO-ID";
        CodeSource = "EDIT";
        CodeType = "REINS";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Assigned Reinsurer";
        Index = "1";
    }

    OUT MIR-POL-HNDL-CD
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Handle Type";
    }

# MFFCC2 BEGIN - SUG
    OUT MIR-FREE-XFER-QTY
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Free Transfers - Number Remaining";
    }

    OUT MIR-DV-POL-FND-CVG-REC-CTR
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Number of SA Riders";
    }

    OUT MIR-DV-TOT-SA-PREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "SA Rider Premium";
    }

    OUT MIR-DV-FND-CVG-NUM
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "SA Coverage Number";
    }
    OUT MIR-FIEL-INS-PURP-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "FIEL(Insurance Purpose)";
    }
# MFFCC2 END- SUG
#* FEID01 Changes start

    OUT MIR-LIAB-STRT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label ="Liability Commencement date";
    }

    OUT MIR-SUPRES-LCD-CALC-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Suppress LCD Calc";
    }

#* FEID01 Changes end
# FEID03 Changes start
    OUT MIR-POL-ISS-PRCES-DT
    {
        Length = "10";
        SType = "Date";
        DBTableName = "TPOL";
        Label = "New Business Issue Processing Date";
    }
# FEID03 Changes end

# NWLXML Changes start
    OUT MIR-DESGNT-ISS-DT-IND
    {
        Length = "1";
        SType = "Indicator";
	DBTableName = "TPOL";
        Label = "Designated Policy Issue Date flag";
    }
    OUT MIR-BULK-REMIT-NUM
    {
        Length = "10";
        SType = "Text";
        DBTableName = "TPOL";
        Label = "Bulk Remittance Registration Number";
    }
# NWLXML Changes end

#* NWLCWA Changes start

    OUT MIR-POL-OS-ID-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Outstanding Identification";
    }

    OUT MIR-CWA-PRCES-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Initial CWA Process Date";
    }

    OUT MIR-POL-CHNL-CD
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Channel Type Code";
    }

#* NWLCWA Changes end
#* UY3098 Changes starts

    OUT MIR-SET-POL-ID
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Set Policy ID";
    }
#* UY3098 Changes ends

# NWLIQS Changes Starts here

    OUT MIR-UL-PD-TO-DT-NUM
    {
        Length = "10";
        SType = "Text";
        DBTableName = "TPOL";
        Label = "UL Paid to Date";
    }

    OUT MIR-TRAD-POL-MPREM-AMT
    {
        Signed;
        Length = "16";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Trad Modal Premium";
    }

# NWLIQS Changes Ends here
# ISLADM - Changes start here     
    OUT MIR-SURR-FORM-ACPT-DT
    { 
        Length = "10";
        DBTableName = "TPOL";        
        SType = "Date";
        Label = "Surrender Request Form Acceptance Date";
    }
    
    OUT MIR-ASIGN-SURR-EFF-DT
    { 
        Length = "10";
        DBTableName = "TPOL";                
        SType = "Date";
        Label = "Assigned Surrender Effective Date for Policy with Assignee";
    }
    
    OUT MIR-POL-STEP-IN-RIGHT-IND
    { 
        Length = "1";       
        DBTableName = "TPOL";                
        SType = "Indicator";
        Label = "Policy with Step-In Right";
    }    
# ISLADM - Changes end here  
# TDM22E - Changes start here     
    OUT MIR-ANTY-RQST-ACPT-DT
    { 
        Length = "10";
        DBTableName = "TPOL";         
        SType = "Date";
        Label = "Annuity Request Form Acceptance Date";
    }    
# TDM22E - Changes end here
# UYS092 - Changes start here
    OUT MIR-POL-ASIGN-STAT-CD
    { 
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-ASIGN-STAT-CD";
        SType = "Text";        
        Label = "Assignment Status";
    }
    OUT MIR-POL-ASIGN-DEL-DT
    {
        Length = "10";
        DBTableName = "TPOL";        
        SType = "Date";
        Label = "Assignment Deletion Date";
    }
# UYS092 - Changes ends here
# NWLPNB Changes start here

    OUT MIR-ADV-PMT-YR      
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "PPLSY";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Advance Payment Years and Months";
    }

    OUT MIR-ADV-PMT-MO      
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "PPLSM";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Advance Payment Years and Months";
    }
# ATU688 STARTS HERE
#    OUT MIR-ADV-PMT-AMT
#    {
#        Length = "19";
#        DBTableName = "TPOL";
#        SType = "Currency";
#        Label = "Advance Payment residuals";
#    }
# 
# ATU688 ENDS HERE
# NWLPNB Changes end here

# NWLPP5 Changes start here

    OUT MIR-DV-ADV-PMT-AMT
    {
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Premium received amount (including initial premium)";
    }
    
# NWLPP5 Changes end here

# NWLGLR Changes begin 

 OUT MIR-DV-TD-LAPS-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "TD Lapse Date";
    }

# NWLGLR Changes end    

# NWLGAR changes begin

    OUT MIR-ANN-STMT-NOT-REQ-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Annual Statement Not Required Policy";
    }

# NWLGAR changes end
# M117PB changes begin



    OUT MIR-POL-FUT-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-FUT-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Future Bill Mode";
    }


    OUT MIR-POL-FUT-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-FUT-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Future Bill Type";
    }
    
    OUT MIR-POL-FUT-MPREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "New Modal Premium";
    }

    OUT MIR-POL-FUT-PAC-DRW-DY
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Billing Draw Day";
    }
    
    OUT MIR-PBRQ-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy billing request Effective Date";
    }
# MP142G change starts.

    OUT MIR-NEW-SNDRY-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TFTRQ";
        SType = "Currency";
        Label = "New Sundry Amount";
    }
# M142G change ends. 
# M117PB changes ends.  
# C12653 changes begin

    OUT MIR-DSASTR-CD
    {
        DBTableName = "TPOL";
        CodeSource = "EDIT";
        CodeType = "DSAST";
        Length = "1";
        SType = "Text";
        Label = "Disaster Code";
    }    
# C12653 changes end
#MP143D changes begins
# TLB26C Changes begin.	

     OUT MIR-SRVBEN-NXT-PO-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";	
#       Label = "Survival Benefit Next Payout Effective Date";
        Label = "Survival Benefit Next Payout Effective Date(Health-Linked Survival Benefit)";
    }
# TLB26C Changes end.
	
   OUT MIR-DV-ACT-BNFT-PAID-AMT
   {
      Length="15";
      DBTableName = "Derived";
      SType = "Currency";
      Label = "Less: Benefits Actually paid out";
    }

   OUT MIR-DV-NET-SCHD-PO-AMT
   {
      Length="15";
      DBTableName = "Derived";
      SType = "Currency";
      Label = "Net Scheduled Payout Amount";
    }
    IN MIR-APPL-CTL-PRCES-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Process Date";
    }

#MP143D changes ends.
# MP142L changes begin

    OUT MIR-AUTO-PREM-CHNG-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Auto Premium Change Rider Indicator";
    }

# MP142L changes end 
#UY3068 CHANGES START HERE 
    OUT MIR-UNIS-CNVR-DSCNT-TYP
    {
        DisplayOnly;
        Length = "15";
        SType = "Text";
        Label = "Unisys Conversion Discount Type";
    }
    OUT MIR-UNIS-CNVR-DSCNT-PR
    {
        DisplayOnly;
        Length = "15";
        SType = "Number";
        Label = "Unisys Conversion Discount Period";
    }
    OUT MIR-UNIS-CNVR-DSCNT-AMT
    {
        CurrencyCode = "MIR-PREM-CRCY-CD";
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Unisys Conversion Discount Amount";
    }
    OUT MIR-UNIS-CNVR-BAL-AMT
    {
        CurrencyCode = "MIR-PREM-CRCY-CD";
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Unisys Conversion Balance";
    }
#UY3C46 CHANGES START HERE    
    OUT MIR-CNVR-HIST-BAL-AMT
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Conversion Balance in history";
    }
#UY3C46 CHANGES ENDS HERE 
    OUT MIR-EMP-DSCNT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Employee Discount Indicator";
    }
    OUT  MIR-EMP-DSCNT-AMT
    {
        CurrencyCode = "MIR-PREM-CRCY-CD";
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Employee Discount Amount";
    }
 #UY3068 CHANGES END HERE
# MP195A Changes start
    OUT MIR-WIRE-XFER-IND
    {       
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Wire Transfer Indicator";
    }    
# MP195A Changes end
# MP142Q changes begin

    OUT MIR-RENW-PRCES-ACPT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Renewal Process Acceptance Date";
    }

# MP142Q changes end
# MP261B XML changes begin

    OUT MIR-SPCL-AGT-SIGN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Signature Date";
    }
    OUT MIR-NON-FACE-TO-FACE-IND 
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Non Face to Face Flag";
    }
# MP261B XML changes end
# MP261A  changes begin

    OUT MIR-FP-BT-UW-STAT-CD
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "First Premium BT UW status";
    }
# MP261A  changes end
# M26106 CR CHANGES BEGIN
    OUT MIR-EARLY-FP-BT-IND 
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Early First Premium BT Flag";
    }
# M26106 CR CHANGES END
# M142S1 CHANGES START

    INOUT MIR-POL-CONN-REL-CD
    {
        Length = "40";
        CodeType = "OWNR-REL-INSR-CD";
        SType = "Selection";
        Label = "Relationship of Pre-Split/Joint Policyholder to Post-Split/Single Policyholder";
    }

# M142S1 CHANGES END
#M142S1 changes begins here
    OUT MIR-CONN-POL-ID
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Connected Policy Number";
    }
    OUT MIR-CVG-CONN-REASN-CD
    {
        Length = "01";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Connected Policy Reason";
    }
    OUT MIR-POL-SPLT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Connected Policy Split Date";
    }
#M142S1 changes ends.      
#MP168A changes begin

    OUT MIR-PLAN-INIT-PMT-TYP-CD
    {
        DisplayOnly; 
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INIT-PMT-TYP-CD";        
        #Q11521 START
        CodeSubType = "PLAN";
        #Q11521 STOP
        SType = "Text";
        Label = "First Premium payment route - Planned ";
    }

# MP168A changes end
# C15454 changes begin

    OUT MIR-DSASTR-LAPS-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Disaster Lapse Date";
    }    
# C15454 changes end
# MP173A changes begin

    OUT MIR-POL-TAX-RESTR-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Tax Certificate Not Required Policy";
    }    
# MP173A changes end
# MP176B changes begin

    OUT MIR-POL-BULK-APP-ID
    {
        Length = "15";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Bulk Application ID";
    }
# MP176B changes end
# MP176Q changes begin
  
    OUT MIR-AGE-LAST-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Age last indicator";
    }
# MP176Q changes end     
#MP226F Changes starts here
    OUT MIR-TAX-CERT-ID-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "TCICD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Tax Certificate Identification Code";
    }
#MP226F changes ends here
# C20733 changes begin
  
    OUT MIR-POL-PRESC-BIT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Prescription";
    }
# C20733 changes end
# MP242F changes begin
  
    OUT MIR-CORP-BNFY-INSRD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Corporate Beneficiary Insured Indicator";
    }
#MP242F changes end
#MP245R Changes begin

     OUT MIR-RECPT-AMT
     {
         Length="15";       
         DBTableName = "Derived";
         SType = "Currency";
         Label = "Actual Paid";             
     }
     OUT MIR-DV-JP-XCHNG-RT
     {
         Length = "7";
         Decimals = "2";
         DBTableName = "TCXRT";
         SType = "Text";
         Label = "Exchange rate from FC to JPY";               
     }
     OUT MIR-DV-POL-XCHNG-RT
     {
         Length = "4";
         Decimals = "4";
         DBTableName = "TCXRT";
         SType = "Text";
         Label = "Exchange Rate for Policy currency";               
     }
     OUT MIR-DV-JP-RECPT-AMT 
     {
         Length="15";
         DBTableName = "Derived";
         SType = "Currency";
         Label = "Actual Paid Amount in JPY";             
     }
     OUT MIR-POL-CRCY-RECPT-AMT 
     {
         Length="15";
         DBTableName = "Derived";
         SType = "Currency";
         Label = "Single premium in Policy currency";
     }
     OUT MIR-DV-TAX-EXMPT-AMT 
     {
         Length="15";
         DBTableName = "Derived";
         SType = "Currency";
         Label = "Remaining Tax Exempt Amount";
     }
     OUT MIR-INIT-DPOS-INT-PCT
     {
         Length = "6";
         Decimals = "2";
         DBTableName = "TIR";
         SType = "Percent";
         Label = "Crediting Interest Rate";
     }       
     INOUT MIR-PMT-CRCY-CD
     {
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     }
    INOUT MIR-OS-DISB-CRCY-CD
    {
       
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
    }     
#MP245R Changes END   

#M228J1 CHANGES START

    OUT MIR-WARN-MSG-CD
      {
        Length = "01";
        SType = "Text";
	Label = "Warning Message Indicator";        
      }
      
#M228J1 CHANGES END
#M271O1 CHANGES START HERE      
    INOUT MIR-PREM-CRCY-CD
    {
               
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }
#M271O1 CHANGES END HERE 
# M271B2 changes begin
 
    OUT MIR-SCHD-ADV-PMT-DUR
       {
           DisplayOnly;
           Length = "3";
           CodeSource = "DataModel";
           CodeType = "SCHD-ADV-PMT-DUR";
           SType = "Text";
           Label = "Scheduled Advanced Premium Payment Frequency";
       }
          
# M271B2 changes end

# M319N2 changes begin
 
    OUT MIR-YBA-RPT-REQIR-IND
       {
           Length = "1";
           DBTableName = "TPOL";
           SType = "Indicator";
           Label = "Yen Bill amount Report required indicator";
       }
          
# M319N2 changes end

#M271A8 CHANGES START

    OUT  MIR-TAX-QUALF-IND
    {
           DisplayOnly;
           Length = "1";
           SType = "Indicator";
           Label = "Tax Qualified Indicator";  
    }
#M271A8 CHANGES END

#MP281F CHANGES START HERE

OUT MIR-CANCER-RECOV-PMT-DT
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Planned payment date of Cancer Recovery Support Benefit";
    }

#MP281F CHANGES END HERE

#018396 CHANGES START HERE

OUT MIR-PAPR-LESS-APP-IND
    {
        Length = "1";
        SType = "Indicator";
	DBTableName = "TPOL";
        Label = "Paperless Application";
    }

#018396 CHANGES END HERE

#FF2003 CHANGES START HERE

OUT MIR-POL-PRVD-TYP-CD
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Provision type";
    }
#FF2003 CHANGES END HERE

#UY3028 CHANGES START HERE
OUT MIR-BASE-PREM-RENW-AMT
    {
        Length = "16";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Base Premium After Renewal"; 
    }
#UY3028 CHANGES END HERE


#M319I3 CHANGES START HERE

OUT MIR-BILL-YR-MO-T[1]
    {
        DisplayOnly;
        Length = "6";
        KeyColumn;
        SType = "Text";
        Label = "Billing year and month";
    }

OUT MIR-XCHNG-PREM-AMT-T[1]
  {
        CurrencyCode="MIR-PREM-CRCY-CD"; 
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Premium (contract currency)";
        Signed;
  }
  
OUT MIR-PREM-XCHNG-RT-T[1]
  {
        DisplayOnly;
        Length = "18";
        SType = "Number";
        Label = "Japanese Yen conversion rate";
  }
	
OUT MIR-XCHNG-RECV-AMT-T[1]
  {
        CurrencyCode="MIR-PMT-CRCY-CD"; 
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Premium (converted in Japanese Yen) ";
        Signed;
  }
OUT MIR-QTY-OF-BILL-T[1]
    {
        DisplayOnly;
        Length = "3";
        KeyColumn;
        SType = "Text";
        Label = "Count of billings";
    }

OUT MIR-BILL-AMT-T[1]
    {
        CurrencyCode="MIR-PMT-CRCY-CD"; 
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Billing amount";
        Signed;    
    }      
OUT MIR-XCHNG-EFF-DT-T[1]
  {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Exchange rate base date";
  }
  
OUT MIR-MPREM-2-AMT-T[1]
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Premium (contract currency)";
        CurrencyCode="MIR-PREM-CRCY-CD";
        Signed;
    }    
    
OUT MIR-MPREM-2-JPY-AMT-T[1]
    {
        DisplayOnly;
        Length = "16";
        KeyColumn;
        SType = "Currency";
        Label = "Premium (converted in Japanese Yen)";
        Signed;
    }

OUT MIR-MPREM-6-AMT-T[1]
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Premium (contract currency)";
        CurrencyCode="MIR-PREM-CRCY-CD";
        Signed;
    }    
    
OUT MIR-MPREM-6-JPY-AMT-T[1]
    {
        DisplayOnly;
        Length = "16";
        KeyColumn;
        SType = "Currency";
        Label = "Premium (converted in Japanese Yen)";
        Signed;
    }

OUT MIR-MPREM-12-AMT-T[1]
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Premium (contract currency)";
        CurrencyCode="MIR-PREM-CRCY-CD";
        Signed;
    } 
    
OUT MIR-MPREM-12-JPY-AMT-T[1]
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Premium (converted in Japanese Yen)";
        Signed;
    }        

#M319I3 CHANGES END HERE
# R14127 changes begin

    OUT MIR-DSASTR-SUB-CD
    {
        DBTableName = "TPOL";
        CodeSource = "EDIT";
        CodeType = "DSTSB";
        Length = "2";
        SType = "Text";
        Label = "Disaster Sub Code";
    }    
# R14127 changes end
# TV2003 changes begin

    OUT MIR-TRG-HIT-CNVR-RT
    {
        DBTableName = "TPOL";
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "TRG-HIT-CNVR-RT";
        SType = "Selection";
        Label = "Target Rate";
    }  
    
    OUT MIR-TRG-HIT-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "Target Amount";
    }      
# TV2003 changes end
# TDM21C changes begin

    OUT MIR-NXT-RENW-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Effective Date";
    } 
        
    OUT MIR-NXT-RENW-MPREM-AMT
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Next Mode Premium";
    }  
    
    OUT MIR-LAST-RENW-EFF-DT
    {
        DisplayOnly;    
        Length = "10";
        SType = "Date";
        Label = "Last Effective Date";
    }  
    
    OUT MIR-LAST-RENW-MPREM-AMT
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Last Mode Premium";
    }         
# TDM21C changes end

# UY3064 CHANGES START HERE
    OUT MIR-MEDIC-CVG-PMT-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CVG-PMT-TYP-CD";
        SType = "Text";
        Label = "Payment type for Medical Rider";
    }
# UY3064 CHANGES END HERE

# TV2011 changes begin

    OUT MIR-TRG-HIT-CSV-AMT
    {
        Length = "16";
# 113120 changes begin        
        CurrencyCode = "MIR-POL-CRCY-CD";
# 113120 changes ends
# TV201A changes begin        
#        SType = "Text";
        SType = "Currency";
# TV201A changes ends 
        Label = "Cash Surrender Value";
    }  
    OUT MIR-TRG-HIT-BNFT-ACHV-RT
    {
        Length = "3";
# TV201A changes begin        
#        SType = "Text";
        SType = "Percent";
        Decimals = "1";        
#TV201A changes ends 
        Label = "Basic Benefit Achievement Rate";
    }    
    OUT MIR-TRG-HIT-BASE-DT 
    {
        Length = "10";
        SType = "Text";
        Label = "Base Date";
    } 
    OUT MIR-DV-TRG-HIT-IND
    {
        Length = "1";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "DV-TRG-HIT-IND";
        Label = "Target-Hit Transfer to Fixed Whole Life with Accidental Death Rider";
    } 
# TV2011 changes end
#TLB003 changes starts
   OUT MIR-POL-BUNDLE-APP-ID
   {
       Length = "15";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "Bundle Application ID";
   }
   
   OUT MIR-ASSIGN-BUNDLE-APP-IND
   {
       Length = "1";
       SType = "Indicator";
       Label = "Assign Bundle Application ID Indicator";
   }
   
#27624C changes starts
   OUT MIR-POL-ECERT-IND
   {
       DisplayOnly;
       Length = "1";
       DBTableName = "TPOL";
       SType = "Indicator";
       Label = "ePolicy flag";
   }
   
   OUT MIR-TRXN-CNFRM-OS-IND
   {
       DisplayOnly;
       Length = "1";
       DBTableName = "TPOL";
       SType = "Indicator";
       Label = "Transaction confirmation outstanding flag";
   }    
#27624C changes end   
   OUT MIR-PD-GR-TYP-CD
   {
       Length      = "1";
       SType       = "Text";
       CodeSource  = "DataModel";
       CodeType    = "PD-GR-TYP-CD";
#UYS133 CHANGES START
#UYS133       Label       = "Product Group Type Code";
       Label       = "PD group size";
#UYS133 CHANGES END
   }
#TLB003 changes ends
#MP771B changes start here
    OUT MIR-DV-DSASTR-SHRT-AMT
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Shortage Amount";
    }
#MP771B changes end here

# UYS072 Changes Begins Here
    OUT MIR-OWN-KJ-OVRID-ADDR-TXT
    {
    	DBTableName = "TPOL";
        Length = "64";
        SType = "Text";
        Label = "New Business Kanji Samakata-bu:";
    }

    OUT MIR-CLI-ADDR-ADDL-TXT
    {
        DisplayOnly;
        DBTableName = "TCLIA";
        Length = "64";
        SType = "Text";
        Label = "Samakata-bu (client):";
    }
# UYS072 Changes Ends Here
# UY9307 CHANGES STARTS HERE 
    OUT MIR-PREV-POL-REPRT-DT
    {
        Length = "10";
        DisplayOnly;        
        SType = "Date";
        Label = "Previous Policy Reprint Date";
    }
# UY9307 CHANGES END HERE
#CHANGES FOR UYS033 STARTS HERE
    OUT  MIR-LOAN-REPAY-DUE-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Overloan Repayment Due Date";
    }
#CHANGES FOR UYS033 ENDS HERE

#CHANGES FOR UY3071 STARTS
    OUT  MIR-NXT-HLTH-BNFT-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Health Congratulatory Benefit Date";
    }

    OUT MIR-DEFR-HLTH-BNFT-AMT
    {
        DisplayOnly;
        Length = "15";                
        SType = "Currency";
        Label = "Deferral Health Congratulatory Benefit Amount";
    }
    
   OUT MIR-DEFR-HLTH-INT-AMT
    {
        DisplayOnly;
        Length = "15";                
        SType = "Currency";
        Label = "Deferral Health Congratulatory Benefit Interest";
    }
#CHANGES FOR UY3071 ENDS
#RPU014 CHANGES STARTS HERE

     OUT MIR-RPU-CVG-DUR
     {
         DisplayOnly;
         Length = "6";
         CodeSource = "EDIT";
         CodeType = "PUDUR";
         Label = "RPU Coverage Duration";
     }

    OUT MIR-RPU-REMIT-IND
    {
        Length = "1";              
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Remittacnce upon Paid-Up";
     }
     
    OUT MIR-POL-RPU-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Effective Date of Paid-Up";
    } 
    
    OUT MIR-RPU-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PUPLN";
        SType = "Text";
        Label = "Contract After Change";
     } 
        
          
     
     OUT MIR-RPU-FACE-AMT
     {
        DisplayOnly;
        Signed;
        Length = "16";
        DBTableName = "TCVG";     
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Face Amount after Change";
     }
       
    OUT MIR-PRE-RPU-PLAN-ID
    {
        DisplayOnly;
#132589 CHANGES START
#        Length = "40";
#        CodeSource = "EDIT";
#        CodeType = "PLAN";
#        DBTableName = "TPOL";
#        SType = "Text";        
#        Label = "Contract before Change";
        SType = "Hidden";
        Label = "PRE RPU PLAN ID";
#132589 CHANGES END
     }

#132589 CHANGES START
    OUT MIR-PRE-RPU-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";
        DBTableName = "TPOL";
        SType = "Text";        
        Label = "Contract before Change";
     }
#132589 CHANGES END     

     OUT MIR-PRE-RPU-FACE-AMT
     {
        DisplayOnly;
        Signed;
        Length = "16";               
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Face Amount before Change";
      }  
   
   

    OUT MIR-PRE-RPU-MPREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "16";        
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";
        Label = "Premium before Change";
    }
    
     OUT MIR-PRE-RPU-CVG-DUR
     {
#RPUV2C CHANGES START
#       Length = "10";
        Length = "40";     
        CodeSource = "CSOM9D31";
        FilterFields = "1";
        FilterField1 = "MIR-PRE-RPU-PLAN-ID";
        DBTableName = "TCVG";
#RPUV2C CHANGES END
        SType = "Text";               
        Label = "Period of Insurance before Change";
     }    
        
     
     OUT MIR-PRE-RPU-PREM-PMT-DUR     
     {
        DisplayOnly;
        Length = "40";        
        CodeSource = "CSOM9D39";        
        FilterFields = "1";
        FilterField1 = "MIR-PRE-RPU-PLAN-ID";
        DBTableName = "TCVG";
        SType = "Text";                
        Label = "Premium Payment Period before Change";
     }  
     
#RPU014 CHANGES ENDS HERE     
# TLB015 CHANGES STARTS HERE
    OUT MIR-REINS-TYP-CD
    {
        Length = "2";
        DisplayOnly;
        CodeSource = "EDIT";
        CodeType = "RETYP";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Reinsurance Type";
    }
# TLB015 CHANGES END HERE
#UYSD11 CHANGES START HERE

    OUT MIR-USYS-MIGR-POL-IND
    {    
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Migrated Policy";
    }
# UYSD11 CHANGES END HERE 
#TLB26C CHANGES START HERE   

     OUT MIR-SRV-BNFT-PO-EFF-DT
     {
        DisplayOnly; 
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Survival Benefit Next Payout Effective Date";
     }

     OUT MIR-DEFR-SRV-BNFT-AMT
     {
        DisplayOnly;
        Length="10";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Deferred Survival Benefit";
     }

     OUT MIR-SRV-BNFT-RT
     {
        DisplayOnly;
        Length = "2";
        DBTableName = "TRT";
        SType = "Percent";
        Label = "Survival Benefit Payout Rate";
     }

     OUT MIR-SRV-BNFT-AMT
     {
        DisplayOnly;
        Length="10";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Survival Benefit Payout Amount";
     }

     OUT MIR-SRV-BNFT-MAT-RT
     {
        DisplayOnly;
        Length = "2";
        DBTableName = "TRT";
        SType = "Percent";
        Label = "Survival Benefit Payout Rate at Maturity";
     }

     OUT MIR-SRV-BNFT-MAT-AMT
     {
        DisplayOnly;
        Length="10";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Survival Benefit Payout Amount at Maturity";
     }

#TLB26C CHANGES ENDS HERE
#UY3060 CHANGES START HERE
    OUT MIR-DV-ANNV-PYR-QTY
    {
        DisplayOnly;
        SType = "Text";
        Length = "4";
        DBTableName = "TPOL";
        Label = "Anniversary Processing Year";
    }
    OUT MIR-DV-PREV-DIV-YR-QTY
    {
        DisplayOnly;
        SType = "Text";
        Length ="4";
        DBTableName = "TPOL";        
        Label = "Year Last Declared";
    }
    OUT MIR-DIV-DCLR-LTD-AMT
    {
        DisplayOnly;
        SType = "Currency";
        Length ="15";
        DBTableName = "TPOL";        
        Label = "Total Dividends Declared";
    }
    OUT MIR-DIV-DCLR-YTD-AMT
    {
        DisplayOnly;
        SType = "Currency";
        Length = "15";
        DBTableName = "TPOL";        
        Label = "Dividends Declared Year To Date";
    }
    OUT MIR-POL-DIV-DT 
    {
        DisplayOnly;
        SType = "Date";
        Length = "10";
        DBTableName = "TPOL";          
        Label = "Dividend Last Paid Date";
    }
    OUT MIR-POL-OYT-AMT
    {
        DisplayOnly;
        SType = "Currency";
        Length = "15";
        DBTableName = "TPOL";          
        Label = "One Year Term Purchased with Dividend";
    }
    OUT MIR-SPCL-DIV-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "SPCL-DIV-OPT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Special Dividend Option";
    }
    OUT MIR-POL-DOD-ACUM-AMT
    {
        DisplayOnly;
        SType = "Currency";
        Length = "15";
        DBTableName = "TPOL";          
        Label = "Dividends On Deposit";
    }
    OUT MIR-POL-DOD-AVB-AMT
    {
        DisplayOnly;
        SType = "Currency";
        Length = "15";
        DBTableName = "TPOL";          
        Label = "Dividend Average Balance";
    }
    OUT MIR-DOD-CRNT-INT-AMT
    {
        DisplayOnly;
        SType = "Currency";
        Length = "15";
        DBTableName = "TPOL";          
        Label = "Dividends On Deposit Interest";
    }
    OUT MIR-POL-DOD-INT-RT
    {  
        DisplayOnly;
        SType = "Percent";
        Length = "7";
        Decimals = "5";
        DBTableName = "TPOL";          
        Label = "Current Dividend Interest Rate";
    }
    OUT MIR-SURR-DIV-ACUM-AMT
    {
        DisplayOnly;
        SType = "Currency";
        Length = "15";
        DBTableName = "TPOL";          
        Label = "Dividends Surrendered";
    }
    OUT MIR-PUA-LTD-FACE-AMT
    {
        DisplayOnly;
        SType = "Currency";
        Length = "15";
        DBTableName = "TPOL";          
        Label = "Total Paid Up Additions";
    }
    OUT MIR-PUA-YTD-FACE-AMT
    {
        DisplayOnly;
        SType = "Currency";
        Length = "15";
        DBTableName = "TPOL";          
        Label = "Current Paid Up Additions";
    }
    OUT MIR-PUA-CLR-FACE-AMT
    {
        DisplayOnly;
        SType = "Currency";
        Length = "15";
        DBTableName = "TPOL";          
        Label = "Amount Of Paid Up Additions Surrendered";
    }
    OUT MIR-PUA-VEST-FACE-AMT
    {
        DisplayOnly;
        SType = "Currency";
        Length = "15";
        DBTableName = "TPOL";          
        Label = "Total Vesting Paid Up Additiopns";
    }
    OUT MIR-DEFR-DIV-AMT
    {
        DisplayOnly;
        SType = "Currency";
        Length = "15";
        DBTableName = "TPOL";          
        Label = "Deferred Dividend Amount";
    } 
    OUT MIR-DEFR-DIV-INT-AMT
    {
        DisplayOnly;
        SType = "Currency";
        Length = "15";
        DBTableName = "TPOL";          
        Label = "Deferred Dividend Interest Amount";
    }
    OUT MIR-DEFR-DIV-DT
    {
        DisplayOnly;
        SType = "Date";
        Length = "10";
        DBTableName = "TPOL";          
        Label = "Deferred Dividend Date";
    }
    OUT MIR-DEFR-DIV-INT-CAP-DT
    {
        DisplayOnly;
        SType = "Date";
        Length = "10";
        DBTableName = "TPOL";          
        Label = "Deferred Interest Capitalization Date";
    }
    OUT MIR-DIV-CUSTOD-ACUM-AMT
        {
    	DisplayOnly;
    	Length = "15";
        DBTableName = "TPOL";      	
    	SType = "Currency";
    	Label = "Accumulated Dividend on Custody";
    }
    OUT MIR-DIV-CUSTOD-INT-AMT
        {
    	DisplayOnly;
    	Length = "15";
        DBTableName = "TPOL";      	
    	SType = "Currency";
    	Label = "Accumulated Interest on Custody";
    }    
    OUT MIR-CNVR-ADJ-TOT-DIV-AMT
    {
        DisplayOnly;
        Length = "15";
        DBTableName = "TPOL";          
        SType = "Currency";
        Label = "Total Conversion Adjusted Dividend Amount";
    }
    OUT MIR-SURV-DEFR-DIV-AMT
    {
        DisplayOnly;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Survival Insurance Deferred Amount";
    }
    OUT MIR-SURV-DEFR-INT-AMT
    {
        DisplayOnly;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Survival Insurance Deferred Interest  Amount";
    }        
    OUT MIR-SURV-DEFR-DIV-DT
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Survival Insurance Deferred Date";
    }   
    OUT MIR-SURV-DEFR-INT-DT
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Survival Insurance Deferred Interest Capitalization Date";
    }
#UY3060 CHANGES ENDS HERE

#23802I CHANGES START HERE
#PM0279 CHANGES START
#   OUT MIR-ORIG-PLAN-ID
#   {
#       DisplayOnly;
#       Length = "40";
#       CodeSource = "EDIT";
#       CodeType = "PLAN";
#       DBTableName = "TPOL";
#       SType = "Text";        
#       Label = "Contract before Change";
#    }
#PM0279 CHANGES ENDS      
    OUT MIR-ORIG-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue date before change ";
    }
    
     OUT MIR-ORIG-FACE-AMT
     {
        DisplayOnly;
        Signed;
        Length = "16";               
        SType = "Currency";
        Label = "Face Amount before Change";
      }  
      
    OUT MIR-ORIG-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "16";        
        SType = "Currency";
        Label = "Premium before Change";
    }
    
    OUT MIR-ORIG-CVG-DUR
    {
        Length = "40";
        CodeSource = "CSOM9D31";
        FilterFields = "1";
        FilterField1 = "MIR-PRE-RPU-PLAN-ID";
        DBTableName = "TCVG";
        SType = "Text";               
        Label = "Period of Insurance before Change";
     }    
     
     OUT MIR-ORIG-PREM-PMT-DUR
     {

        DisplayOnly;
        Length = "40";        
        CodeSource = "CSOM9D39";
        FilterFields = "1";
        FilterField1 = "MIR-PRE-RPU-PLAN-ID";
        DBTableName = "TCVG";
        SType = "Text";                
        Label = "Premium Payment Period before Change";
     }             
#PM0279 CHANGES START
    OUT MIR-ORIG-APP-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";
        DBTableName = "TPOL";
        SType = "Text";        
        Label = "Contract before Change";
     }
#PM0279 CHANGES END      
#23802I CHANGES ENDS HERE   
#S25083 changes begins
    OUT MIR-TRAD-PD-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "trad Paid to Date";
    }
#S25083 changes ends
#28053A changes begins
    OUT MIR-POL-HLDR-RESTR-TXT
    {
        Length = "120";
        DBTableName = "TTEXT";
        SType = "Text";
        Label = "Restriction on change of Policyholder's name";
    }
#28053A changes ends    
#UY3037 changes begins

   OUT MIR-SRVBEN-PAYO-AMT
    {
        Length = "15";                
        SType = "Currency";
        Label = "This time survival benefit";
    }
    OUT MIR-DEFR-SRVBEN-PAYO-AMT
    {
        Length = "15";                
        SType = "Currency";
        Label = "Deferred amount";
    }
   OUT MIR-DEFR-INT-AMT
    {
        Length = "15";                
        SType = "Currency";
        Label = "Deferred Interest";
    }    
   OUT MIR-CSH-LOAN-BAL-AMT
   {
        Length = "15";                
        SType = "Currency";
        Label = "Policy Loan Balance";
   }
    OUT MIR-CSH-LOAN-INT
    {
        DisplayOnly;
        Length = "15";                
        SType = "Currency";
        Label = "Policy Loan Interest";
    } 
    OUT MIR-APL-BALANCE-AMT
    {
        Length = "15";                
        SType = "Currency";
        Label = "APL Balance";
    }    
    OUT MIR-APL-INT-AMT
    {
        Length = "15";                
        SType = "Currency";
        Label = "APL Interest";
    }
    OUT MIR-EXPTD-NET-PAY-AMT
    {
        Length = "15";                
        SType = "Currency";
        Label = "Expected Net Payable amount";
    }
    OUT MIR-SRV-NEXT-PO-EFF-DT
    {
        Length = "10";                
        SType = "Currency";
        Label = "Survival Benefit Next Payout Effective Date";
    }       
#UY3037 changes ENDS.    
#UY3048 changes starts
    OUT MIR-POL-MAT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Maturity Amount";
    }   
    OUT MIR-POL-MAT-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Maturity Date";
    }
    OUT MIR-MAT-DEFR-INT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Deferment Interest";
    }  
    OUT MIR-MAT-NXT-DEFR-INT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Deferment Interest Capitalization date";
    }
    OUT MIR-MAT-DEFR-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Deferment maturity Date";
    }	
    OUT MIR-POL-MAT-SUB-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Policy Sub Status";
    }
    OUT MIR-TOT-DEFR-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Total Deferment Amount";
    }  
#UY3048 changes ends
#UY3047 changes starts
    OUT MIR-ANTY-CVG-IND
    {
        Length = "1";
        SType = "Selection";
        CodeSource = "DataModel";
        CodeType = "ANTY-RDR-CD";
        Label = "Annuity Rider";
    }
    OUT MIR-CNFRM-BUNDLE-IND
    {
        Length = "1";
        SType = "Text";       
        CodeSource = "DataModel";
        CodeType = "POL-CNFRM-BUND-IND";
        Label = "Caution Bit";
    } 
    OUT MIR-POL-ANTY-STAT-CD
    {
        Length = "1";
        SType = "Text";
        DBTableName = "TPOL";        
        CodeSource = "DataModel";
        CodeType = "POL-ANTY-STAT-CD";
        Label = "Annuity Status";   
    }
#UY3047 changes ends
#UY3147 changes starts
    OUT MIR-CNVR-APP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Conversion Application Date";
    }
    OUT MIR-CNVR-ELIG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Conversion Eligibile Date";
    }
    OUT MIR-CNVR-BASE-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Conversion Calculation Base Date";
    }
    OUT MIR-CNVR-BAL-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Conversion Balance";
    }  	
    OUT MIR-CRNT-CNVR-BAL-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Current Conversion Balance";
    }  	
#UY3147 changes ends

#UY3049 changes starts

    OUT MIR-ACUM-PAYO-ANTY-IND
    {
        Length = "1";
        SType = "Indicator";
        DBTableName = "TPOL";		
        Label = "Annuity In-Payment indicator";
    }
	
    OUT MIR-UNPAY-ANTY-PREM-AMT
    {
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Unpaid Annuity Premium Amount";
    }	
	
#UY3049 changes ends	
#UY3121 CHANGES STARTS
    OUT MIR-DIV-CRNT-PMT-CTRL
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payment Control";
    }
    OUT MIR-DV-CRNT-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividend Amount";
    }
    OUT MIR-DV-CRNT-DIV-YR
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Dividend Year";
    }
    OUT MIR-DIV-PREV-PMT-CTRL
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payment Control";
    }
    OUT MIR-DV-PREV-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividend Amount";
    }
    OUT MIR-DV-PREV-DIV-YR
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Dividend Year";
    }
    OUT MIR-VEST-DEFR-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Deferral Amount";
    }
    OUT MIR-VEST-DIV-INT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated Interest";
    }
    OUT MIR-DV-DT-OF-PMT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Date of Payment";
    }
    OUT MIR-DV-VEST-AMT-PD
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Vesting Amount Paid (including interest)";
    }
    OUT MIR-SPL-DEFR-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Deposit";
    }
    OUT MIR-SPL-DIV-INT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated Dividend)";
    }
    OUT MIR-SPL-DEFR-DIV-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Date of last deferred processing";
    }
    OUT MIR-SPL-DIV-INT-CAP-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Capitilization Date";
    }
    OUT MIR-DV-DT-OF-PRCHS
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Date of Purchase";
    }
    OUT MIR-DV-FNL-DEFR-PMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Final Deferral Payment";
    }
    OUT MIR-DV-FNL-INT-PMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Final Interest Payment";
    }
    OUT MIR-WL-DT-OF-PRCHS
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Date of Purchase";
    }
    OUT MIR-CUSTOD-DECL-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Declared Date";
    }
    OUT MIR-ACUM-DIV-PD
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulative Purchase benefit ";
    }
    OUT MIR-INCR-SURV-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated dividends paid";
    }
    OUT MIR-CNVR-DECL-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Declared Date";
    }
#UY3121 CHANGES ENDS HERE
#UY304A CHANGES START HERE    
    OUT MIR-ORIG-CNVR-BAL-AMT
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Original Conversion Balance (UO)";
    }
    OUT  MIR-DEFR-HLTH-CNGLR-BNFT-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Deferred Health Congratulation Benefit Date";
    }
    OUT MIR-RENW-DENIAL-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Renewal Denial Indicator";
    }
    OUT MIR-YRLY-APRT-PRM
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Yearly Appropriation Premium (Discount)";
    }
    OUT MIR-CNVR-BAL-DUR
    {
        DisplayOnly;
        Length = "4";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Conversion Residual Period (U)";
    }
    OUT MIR-CNVR-DSCNT-DUR
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Conversion Discount Duration (U0)";
    }
    OUT MIR-ANTY-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-TYP-CD";
        Label = "Annuity Type";
    } 
    OUT MIR-ANTY-STYLE-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-STL";
        Label = "Annuity Style";
    }
    OUT MIR-ANTY-GUAR-PERI
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Annuity Guarantee Period";
    }
      
    OUT MIR-ANTY-PMT-TRM
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "ANTY-PMT-TRM";
        SType = "Selection";
        Label = "Annuity Payment Term";
    }
    OUT MIR-DEFR-DUR
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Deferment Duration";
    }
    OUT MIR-POL-PRT-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Certification Creation Date";
    }
#UY304A CHANGES ENDS HERE
#UY3153 changes starts
    OUT MIR-ANTY-TAX-DEFR-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Total Annuity Change Tax Qualified Deferred Amount";
    } 
    OUT MIR-ANN-CNVR-BAL-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Annuity Conversion Balance Amount"; 
    } 		
#UY3153 changes ends
#29746F CHANGES START
    OUT MIR-CPN-PAYE-CLI-ID
    {
        Length = "10";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Client ID";
    }
    
    OUT MIR-DV-PAYE-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payee Name";
    }
    
    OUT MIR-CPN-PAYE-SUB-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-PAYR-SUB-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Account Type";
    }
    
    OUT MIR-CPN-PAYE-ADDR-TYP-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Address Type";
    }
    
    OUT MIR-CPN-PAYO-JPY-BNFT-IND 
    {
        Length = "1";
        CodeSource = "DataModel";
        DBTableName = "TPOL";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Selection";
        Label = "JPY Benefit Rider";
    }  

    OUT MIR-CPN-AUTO-PAYO-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Automatic payout rider";
    }

    OUT MIR-CPN-AUTO-PAYO-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Automatic payout rider added date";
    }

    OUT MIR-CPN-AUTO-PAYO-TRMN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Automatic payout rider removed date";
    }
#29746F CHANGES END	
#29746K CHANGES STARTS
     OUT MIR-ORIG-FA-AMT
     {
        DisplayOnly;
        Signed;
        Length = "16";               
        SType = "Currency";
        Label = "Original Face";
    }

     OUT MIR-CR-INT-RT
     {
         Length = "6";
         Decimals = "2";
         DBTableName = "TRT";
         SType = "Percent";
         Label = "Crediting Interest Rate (Base)";
     }       

     OUT MIR-3CI-CR-INT-RT
     {
         Length = "6";
         Decimals = "2";
         DBTableName = "TRT";
         SType = "Percent";
         Label = "Crediting Interest Rate (Specific Disease)";
     }       


     OUT MIR-ACCT-VAL-INT-RT
     {
         Length = "6";
         Decimals = "2";
         DBTableName = "TRT";
         SType = "Percent";
         Label = "Rider Interest rate";
     }       

     OUT MIR-COST-RT
     {
         Length = "6";
         Decimals = "2";
         DBTableName = "TRT";
         SType = "Percent";
         Label = "Necessary cost rate";
     }       


     OUT MIR-ACUM-VALU-AMT
     {
        DisplayOnly;
        Signed;
        Length = "16";               
        SType = "Currency";
        Label = "Next Installment";
    }

#29746K CHANGES END
#UY3049 changes starts
    IN MIR-10-POL-ID
    {
        Length = "10";
        SType = "Hidden";
        Label = "Policy Id";
    }     
    IN MIR-STR3-PAYO-IND
    {
        Length = "1";
        SType = "Hidden";
    }
    IN MIR-PAYO-CHK-IND
    {
        Length = "1";
        SType = "Hidden";
    }
#UY3049 changes ends

# M2025F changes begin

    OUT MIR-JUDG-PCT
    {
        DBTableName = "TPOL";
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "JUDG-PCT";
        SType = "Selection";
        Label = "Judgement Rate";
    }  
    
# M2025F changes end

# M2025D changes begin 
    
    OUT MIR-PREM-SUSP-CD
    { 
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "PSUCD";
        SType = "Text";
        Label = "FRA Premium Suspension";	
    }
	 
    OUT MIR-SUSP-START-YR-MO
    {
        DisplayOnly;
        Length = "07";
        SType = "Date";
        Label = "FRA Suspension Start Year and Month";
    }	
    OUT MIR-TOT-PREM-EXP-YEN-AMT
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "FRA Total Premium Expected Yen Amount";
    } 
    OUT MIR-SUSP-RESUM-START-YR-MO
    {
        DisplayOnly;
        Length = "07";
        SType = "Date";
        Label = "FRA Premium Suspension Resumption Year and Month";
    }	
# M2025D changes end
#ON2132 CHANGES START HERE
    INOUT MIR-POL-SPCL-IND
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "PSIND";
        SType = "Selection";
        DBTableName = "TPOL";
        Label = "Policy Special indicator";
    }
#ON2132 CHANGES END HERE

}