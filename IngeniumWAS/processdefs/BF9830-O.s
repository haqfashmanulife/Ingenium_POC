# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:11 PM EDT

#*******************************************************************************
#*  Component:   BF9830-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02AD67  DEL     New screen for call centre inquiry                         *
#*  B01010  DEL     Add fields                                                 *
#*  B01040  DEL     modify fund fields                                         *
#*  B01036  DEL     modify fund fields                                         *
#*  B01033  DEL     Modify billing fields                                      *
#*  B01032  DEL     Change type to currecy on gross premium                    *
#*  B01037  DEL     Selection Method                                           *
#*  B10590  YUC     DISPLAY KANJI NAME   09AUG02                               *
#*  02AD67  YUC     Change control request   23AUG2002                         *
#*  P00581  YUC     Change field name        10SEP2002                         *
#*  1CPR03  YUC     CONVERSION PROCESSING - SURRENDER VALUES      23SEP2002    *
#*  M00025  MAW     Added MIR-POL-SUB-STAT-CD                                  *
#*  PR006D  BP      ADD MIR-PROD-APP-TYP-CD                                    *
#*  PR006O  AC      Change  MIR-AGT-UWG-FAIL-IND to Drop-down box              *
#*  PR0001  ROC     20% MVA Free Withdrawal                                    *
#*  M00011  ROC     OUTSTANDING DISBURSEMENTS, ADD FIELDS:                     *
#*                  OS-DISB-SURR-AMT, OS-DISB-MAT-AMT, OS-DISB-DTH-AMT         *
#*                  OS-DISB-CLM-AMT, OS-DISB-AD-AMT                            *
#*  PR006Q  FB      ADD OLD (MY KEMPO) POLICY INFORMATION SECTION              *
#*  MFPCC1  CECIL   ADD FIELD ILLUSTRATION TYPE                                *
#*  UCPUPL  SC      UCP Upload, Add pol-hndl-cd                                *
#*  MFFCC2  SUG     ADD FOUR NEW FIELDS FOR SEGFUND SUPPORT                    *
#*  5-0109  SUG     ADD BACK MIR-APPL-CTL-PRCES-DT1-T FIELD                    *
#*  IPPDRC  JE       ADDITIONAL ITEMS FOR IP/DD RIDER INQUIRY SUPPORT          *
#*  IPMPPR  CTS     ADDITION OF ANNUITANT INFORMATION SECTION                  *
#*  ABF180  CTS     Modifications to display Annuitant's Client ID             *
#*  MP5001          ADD FIEL-INS-PURP-IND for FIEL changes                     *
#*  RPL012  CTS     CHANGES TO SUB TABLE 3 CODE (MIR-CVG-STBL-3-CD) FOR MISC   *
#*                  SCREEN CHANGES AS PART OF LIMITED PAY                      *
#*  MP5002  CTS     ADD FLEX-FUND-SURR-CHARGE-TYP                              *
#*  FEID03  CTS     ADD ISSUE PROCESSING DATE                                  *
#*  FEGL05  CTS     ADD PREMIUM NECESSARY TO EXTEND GRACE                      *
#*  NWLIQS  CTS     Add New fields to Support Trad Whole Life                  *
#*  ATU446  CTS     CHANGED LABELS FOR FIELDS INTRODUCED AS PART OF NWLIQS     *
#*  ISLADM  CTS     CHANGES FOR INSURANCE LAW PROJECT                          *
#*  NWLPNB  CTS     Added New section for displaying "Advance Payment" info.   *
#*  EN9547  CTS     COMMENTED OUT THE VARIABLE MIR-CVG-NUM IN ONE PLACE        *
#*                  DUE TO THE DUPLICATE DECLARATION                           *
#*  NWLGAR  CTS      Added MIR-ANN-STMT-NOT-REQ-IND for trad policies          *
#*  ATU688  CTS      CHANGES DONE TO REMOVE THE ADVANCE PAYMENT CHANGES        *
#*  ATU688           FROM CALL CENTER INQUIRY SCREEN                           *
#*  M117PB CTS      CHANGES MADE TO DISPLAY FUTURE BILLING INFORMATION FOR THE *
#*                  POLICIES HAVING FUTURE ACTIVITY STATUS FOR BILL MODE/TYPE  *
#*                  CHANGE AS PENDING.                                         *
#*  NWLLCC  CTS      CHANGES DONE FOR CALL CENTER INQUIRY SCREEN               *
#*  C12653  CTS     Added new field Disaster Code                              *
#*  MP1544  CTS     CHANGES DONE FOR CALL CENTER INQUIRY SCREEN               *
#* MP143D CTS ADDED FIELDS FOR SURVIVAL BENEFIT INFORMATION   *
#*  MP142G  CTS     Changes for Future dated sundry amount change              *
#*  MP142L  CTS     Added field Auto Premium Change Rider Indicator            *
#*  MP142Q  CTS     Added a new field - Policy renewal process accept date     *
#*  M142S1  CTS      Added Connected Policy Information new section for        *
#*  M142S1  CTS      Split Policy                                              *
#*  MP161L  CTS      ADDED FIELD 3DD WAIVER OF PREMIUM INDICATOR               *
#*  M161CA  CTS      ADDITION OF NEW FIELD INIT-PMT-TYP-CD                     *
#*  MP168A  CTS     ADDED THE FIELD FIRST PREMIUM PAYMENT ROUTE                *
#*  C15454  CTS      ADDED DISASTER LAPSE DATE                                 *
#*  Q11521  CTS      ADDED SUB TYPE CODE FOR PLAN-INIT-PMT-TYP-CD              *
#*  MP173A  CTS      ADDED FIELD FOR TAX CERTIFICATE NOT REQUIRED POLICY       *
#*  MP185H CTS       ADDED TWO NEW FIELDS AS A PART OF LIMITED                 *
#*  MP185H           PAY UL WL RIDERS                                          *
#*  MP176Q  CTS	     ADDED THE FIELDS BULK APPLICATION NUMBER AND AGE LAST     * 
#*  MP176Q  CTS      INDICATOR FOR ARM	                                       *
#*  MP211B  CTS      ADD NEW FIELDS FOR LIEN DURATION.                         *
#*  MP213S  CTS      ADDED THE FIELD GROUP ID                                  *
#*  MP195A  CTS      ADDED FIELD FOR WIRE TRANSFER INDICATOR                   *
#*  MP226F  CTS      ADDED NEW FIELD FOR TAX CERTIFICATE IDENTIFICATION CODE   *
#*  C20733  CTS      PS-SD110092 ADDED A NEW FIELD POLICY                      *
#*                   PRESCRIPTION BIT INDICATOR                                *
#*  MP242F  CTS      ADDED NEW FIELD FOR CORPORATE BENEFICIARY INSURED IND     *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP245J  CTS      ADD NEW FIELD FOR SUBSTANDARD AGE DURATION AS PART OF SPWL*
#*  MP245R  CTS      NEW FIELDS ADDED & OS DISB CRCY HANDLING FOR SPWL POLICIES*
#*  Q50654  CTS      MP245R - FIX FOR CWA SUSPENSE AMOUNT TO DISP PAYMENT CRCY *
#*  MP261B  CTS	     ADDED NEW FIELDS FOR ARM2 NON FACE TO FACE                *
#*  M26106  CTS      ADDED NEW FIELD FOR ARMV2 - Early First Premium BT Flag         *
#*  R10423  CTS      ADDED NEW FIELDS FOR CALL CENTER INQUIRY SCREEN           *
#*  M271A8  CTS       Online Screen Changes done as part of FRA                *
#*  Q60877  CTS      FIX FOR FRA CURRENCY CODE CHANGES                         *
#*  M271A7  CTS      Online Screen Changes done as part of FRA                 *
#*  Q61551  CTS      FRA CURRENCY CODE CHANGES                                 *
#*  Q60885  CTS      FIX FOR FRA CURRENCY CODE CHANGES                         *
#*  R67482  CTS      FIX TO REMOVE PREMIUM CRCY CODE FOR MIR-DV-JP-RECPT-AMT   *
#*  MP281F  CTS      ADDED NEW FIELD FOR RC-CANCER RECOVERY PAYMENT DATE       *
#*  R11050  CTS      CHANGES TO ADD NEW FIELD - RECEIPT TYPE CD IN             *
#*                   CALL CENTER INQUIRY SCREEN                                *
#*  M319I3  CTS      CHANGES FOR FXWL PROJECT                                  *
#*  Q87624  CTS      FIX FOR PREMIUM RATE INFORMATION                          *
#*  Q87797  CTS      FXWL CURRENCY CODE CHANGES                                *
#*  M319O1  CTS      FXWL Currency Code Changes                                *  
#*  Q88344  CTS      FXWL Currency Code Changes FOR RECEIVABLE AMT             * 
#*  R14127  CTS      CHANGES FOR DISASTER RECOVERY                             * 
#*  TV2011  CTS      CHANGES FOR SULV2 CALL CENTER INQUIRY                     *
#*  TV201A  CTS      CR CHANGES FOR SULV2 CALL CENTER INQUIRY                  *
#*  113120  CTS      FIX FOR SULV2 CALL CENTER INQUIRY                         *
#*  018396  CTS      CHANGES FOR PAPER LESS APP INDICATOR - EPOS               *
#*  TDMG07  CTS      SCREEN CHANGES FOR NWL                                    *
#*  118579  CTS      CHANGES DONE TO CORRECT THE FIELD PREMIUM PAYMENT         *
#*  118579           DESCRIPTION                                               *
#*  MP771B  CTS      CHANGES DONE TO POPULATE THE SHORTAGE AMOUNT FOR DISASTER *
#*  UYS092  CTS      ADMIN POLCERT ASSIGNMENT STATUS CHANGES                   *
#*  TDM21C  CTS      POLICY INQUIRY SCREEN CHANGES NWL DAY 4.0                 *
#*  FF2003  CTS      ADDED NEW FIELD POLICY PROVISION TYP FOR FFF SMBC CHANGES *
#*  UYS033  CTS      ADDED NEW FIELD OVERLOAN REPAYMENT DUE DATE               *
#*  RPU014  CTS      CHANGESHAS BEEN MADE FOR RPU PROCESSING SCREEN            *
#*  132589  CTS      RPU014 - CONTRACT BEFORE RPU                              *
#*  RPUV2C  CTS      CHANGES DONE FOR SULV2 RPU PROJECT                        *
#*  UYS050  CTS     ADDITION OF Elapsed Duration of CSV FILED                  *
#*  UYS104  CTS      ADD OF FIELD PROPORTIONAL DISTRIBUTION PAID               *
#*                   PREMIUM CALC FLAG                                         *
#*  TLB26C  CTS      ADDED NEW FIELDS FOR TLB PRODUCTS                         *                                                                             *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  UYSD11  CTS      ADDIITION OF UNISYS MIGRATION TYPE CODE                   *
#*  TLB26C  CTS      ADDED NEW FIELDS FOR TLB PRODUCTS                         *
#*  TL0763  CTS      ADDITION OF Elapsed Duration of CSV FILED                 *
#*  23802I  CTS      CHANGES HAS BEEN MADE FOR SUL MATURITY PROCESSING SCREEN  *
#*  PM0279  CTS      CHANGES DONE FOR PROD APP TYP CODE                        *
#*  UY3037  CTS      INGENIUM SURVIVAL BENEFIT                                 *
#*  UY3060  CTS      SYSTEM SPEC B INGENIUM-DIVIDEND PROCESSING                *
#*  UY3068  CTS      ADDITION OF NEW FIELDS AS PART OF STREAM3 FA REDUCTION    *
#*  UY3048  CTS      INGENIUM MATURITY PROCESSING                              *
#*  28053A  CTS      CHANGES DONE AS PART OF RESTRICT NAME CHANGE              *
#*  UY3071  CTS      HEALTH CONGRATULATORY BENEFIT                             *
#*  NV3A06  CTS      CHANGES TO ADD NEW FIELDS AS PART OF SULV3                *
#*  UY3C46  CTS    CONVERSION BALANCE CR                                       *
#*  UY3049  CTS      STREAM 3 ANNUITY PAYOUT                                   *
#*  UY3121  CTS      CR121 CHANGES                                             *
#*  UY304A  CTS      CALL CENTER SCREEN ENHANCEMENT                            *
#*  UY3153  CTS      CR148 DHY ANNUITY CSV         
#*  27624C  CTS      ADDED NEW FIELD FOR EPOL FLAG AND TRXN CONFIRMATION       *
#*  29746F  CTS      CHANGES DONE AS PART OF CERBERUS NEW BUSINESS             *
#*  29746K  CTS      CHANGES AS PART OF CERBERUS INQUIRY CALL CENTRE           *
#*  M2025D  CTS      CHANGES DONE AS THE PART OF FRA-2025 PROJ                 *
#*  M2025F  CTS      ADDITION OF JUDGEMENT RATE FIELD FOR FRA                  *
#*  NVCN01  CTS      CHANGES DONE AS PART OF ONTARIO XML UPLOAD                *
#*  NVCA05  CTS      CHANGES DONE FOR ONTARIO AUTOMATIC PREMIUM SUSPENSION     *
#*******************************************************************************

S-STEP BF9830-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
#UY3049 changes starts
        Length = "9";
#        Length = "10";
#UY3049 changes ends
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-ACCT-HLDR-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-HLDR-TYP-CD";
        SType = "Text";
        Label = "Bank Account Holder Type";
    }

    IN MIR-ANPAYO-1-DEST-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-DEST-CD";
        SType = "Text";
        Label = "Annuity 1 Destination Registered Code";
    }

    IN MIR-ANPAYO-1-MTHD-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-MTHD-CD";
        SType = "Text";
        Label = "Method to Pay First Annuitant";
    }
    INOUT MIR-CVG-NUM
    {
       Length = "2";
        SType = "Text";
        Label = "Method to Pay First Annuitant";
    }


    IN MIR-ANPAYO-2-DEST-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-DEST-CD";
        SType = "Text";
        Label = "Annuity 2 Destination Registered Code";
    }

    IN MIR-ANPAYO-2-MTHD-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-MTHD-CD";
        SType = "Text";
        Label = "Method to Pay Second Annuitant";
    }

    IN MIR-APP-FORM-TYP-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "AFTT";
        SType = "Text";
        Label = "Application Form Type";
    }

    IN MIR-AUTO-PREM-PMT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Automatic Premium Payment Indicator";
    }

    IN MIR-BILL-LEAD-TIME-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Billing Lead Time";
    }

    IN MIR-CLI-ADDR-TYP-CD-T[5]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Client Address Type";
        Index = "1";
    }

    IN MIR-CLI-CRNT-LOC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Client's Current Location";
    }


    IN MIR-CLI-TAX-ID-T[5]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Client's Tax ID";
        Index = "1";
    }

    IN MIR-CLM-PAYE-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Coverage Number to which a Claim is Paid";
    }

    IN MIR-CLM-PAYE-POL-ID-BASE
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Claim Payment Policy ID";
    }

    IN MIR-CLM-PAYE-POL-ID-SFX
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Claim Payment Policy Suffix";
    }

    IN MIR-CLM-PAYE-REL-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLM-PAYE-REL-CD";
        SType = "Text";
        Label = "Relationship of Recipient of Claim Payment";
    }

    IN MIR-CLM-PAYO-MTHD-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CLM-PAYO-MTHD-CD";
        SType = "Text";
        Label = "Claim Payment Method";
    }

    IN MIR-COMB-BILL-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMB-BILL-IND";
        SType = "Text";
        Label = "Combine Billing Indicator";
    }

    IN MIR-CONN-OPTL-POL-ID-BASE
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Connected Optional Policy ID";
    }

    IN MIR-CONN-OPTL-POL-ID-SFX
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Connected Optional Policy Suffix";
    }

    IN MIR-DV-AGT-CLI-NM-T[2]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Agent Name";
        Index = "1";
    }

    IN MIR-DV-ANUTNT-ADDR-CD-T[5]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Annuitant Client Address Type";
        Index = "1";
    }

    IN MIR-DV-ANUTNT-CLI-ID-T[5]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table2";
        KeyColumn;
        SType = "Text";
        Label = "Annuitant Client ID";
        Index = "1";
    }

    IN MIR-DV-ANUTNT-CLI-NM-T[5]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Annuitant Name";
        Index = "1";
    }

    IN MIR-DV-ANUTNT-SUB-CD-T[5]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "DV-ANUTNT-SUB-CD";
        SType = "Text";
        Label = "Annuitant Client Relationship Type";
        Index = "1";
    }

    IN MIR-DV-ASIGN-ADDR-CD-T[5]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Assignee Client Address Type";
        Index = "1";
    }

    IN MIR-DV-ASIGN-CLI-ID-T[5]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table4";
        KeyColumn;
        SType = "Text";
        Label = "Assignee Client ID";
        Index = "1";
    }

    IN MIR-DV-ASIGN-CLI-NM-T[5]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Assignee Name";
        Index = "1";
    }

    IN MIR-DV-ASIGN-SUB-CD-T[5]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "DV-ASIGN-SUB-CD";
        SType = "Text";
        Label = "Assignee Client Relationship Type";
        Index = "1";
    }

    IN MIR-DV-IPARTY-ADDR-CD-T[5]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table5";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Interested Party Client Address Type";
        Index = "1";
    }

    IN MIR-DV-IPARTY-CLI-ID-T[5]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table5";
        KeyColumn;
        SType = "Text";
        Label = "Interested Party Client ID";
        Index = "1";
    }

    IN MIR-DV-IPARTY-CLI-NM-T[5]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Interested Party Name";
        Index = "1";
    }

    IN MIR-DV-LBILL-ADDR-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Payroll Deduction Client Address Type";
    }

    IN MIR-DV-LBILL-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payroll Deduction Client ID";
    }

    IN MIR-DV-LBILL-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Payroll Deduction Name";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-OWN-CLI-NM-T[5]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }

    IN MIR-DV-OWN-SUB-CD-T[5]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "DV-OWN-SUB-CD";
        SType = "Text";
        Label = "Owner Client Relationship Type";
        Index = "1";
    }

    IN MIR-DV-PAYR-ADDR-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Payor Client Address Type";
    }

    IN MIR-DV-PAYR-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payor Client ID";
    }

    IN MIR-DV-PAYR-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Payor Name";
    }

    IN MIR-DV-PAYR-SUB-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-PAYR-SUB-CD";
        SType = "Text";
        Label = "Payor Client Relationship Type";
    }

    IN MIR-DV-SERV-AGT-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Servicing Agent Name";
    }

    IN MIR-DV-SPOUS-ADDR-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Spouse Client Address Type";
    }

    IN MIR-DV-SPOUS-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Spouse Client ID";
    }

    IN MIR-DV-SPOUS-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Spouse Name";
    }

    IN MIR-DV-TRST-ADDR-CD-T[5]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Trustee Client Address Type";
        Index = "1";
    }

    IN MIR-DV-TRST-CLI-ID-T[5]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table6";
        KeyColumn;
        SType = "Text";
        Label = "Trustee Client ID";
        Index = "1";
    }

    IN MIR-DV-TRST-CLI-NM-T[5]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Trustee Name";
        Index = "1";
    }

    IN MIR-LINK-POL-ISS-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Policy Linked to Others Indicator";
    }

    IN MIR-LOAN-INT-DEDBL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Include Loan Interest in ACB Indicator";
    }

    IN MIR-MODE-FCT-RESTR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Mode Factor Restrict Indicator";
    }

    IN MIR-NXT-ACTV-TYP-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "NXT-ACTV-TYP-CD";
        SType = "Text";
        Label = "Type of Next Automatic Activity";
    }

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan ID";
    }

    IN MIR-PLAN-PERI-PREM-AMT
    {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Planned Periodic Premium Amount";
    }

    IN MIR-POL-UL-SHRT-AMT
    {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
       # CurrencyCode = "MIR-POL-CRCY-CD";
         CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE        
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Planned Periodic Premium Amount";
    }


    IN MIR-POL-ANPAYO-1-AMT
    {
#M245B2 CHANGES START HERE            
        CurrencyCode = "MIR-POL-CRCY-CD";      
#M245B2 CHANGES END HERE         
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Amount Payable to First Annuitant";
    }

    IN MIR-POL-ANPAYO-2-AMT
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";  
#M245B2 CHANGES END HERE         
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Amount Payable to Second Annuitant";
    }

    IN MIR-POL-ANPAYO-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Effective Date of Annuity";
    }

    IN MIR-POL-ANPAYO-MODE-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-ANPAYO-MODE-CD";
        SType = "Text";
        Label = "Frequency of Annuity Payments";
    }

    IN MIR-POL-ANPAYO-PMT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date of Last Immediate Annuity Payment";
    }

    IN MIR-POL-APL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "APL Separate Option for Nonforfeiture";
    }

    IN MIR-POL-APP-CMPLT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Application Completion Date";
    }

    IN MIR-POL-APP-CTR
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Application Counter";
    }

    IN MIR-POL-APP-FORM-ID
    {
        DisplayOnly;
        Length = "15";
        SType = "Text";
        Label = "Application Form ID";
    }

    IN MIR-POL-APPL-CTL-CD
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Application System Code";
    }

    IN MIR-POL-APP-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Application Received Date";
    }

    IN MIR-POL-APP-SIGN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Application Signed Date";
    }

    IN MIR-POL-APP-SIGN-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-APP-SIGN-IND";
        SType = "Text";
        Label = "Application Signed Indicator";
    }

    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
#MP245R CHANGES START
#CodeType = "POL-BILL-MODE-CD";
        CodeType = "POL-DV-BILL-MODE-CD";
#MP245R CHANGES ENDS
        SType = "Text";
        Label = "Policy Billing Mode";
    }

    IN MIR-POL-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        #M161CA START
        #Label = "Policy Billing Method";
        Label = "Policy Billing Method(Subsequent Premium)";
        #M161CA END
    }

    #M161CA START
    IN MIR-INIT-PMT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INIT-PMT-TYP-CD";
        SType = "Text";
        Label = "Payment Route (First Premium)";
    }
    #M161CA END
    #MP195A Changes start
    IN MIR-WIRE-XFER-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Wire Transfer Indicator";
    }    
    #MP195A Changes end
    IN MIR-POL-BT-BILL-DLAY-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Bank Transfer Billing Delay";
    }

    IN MIR-POL-CLI-ASIGN-DT-T[5]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table4";
        SType = "Date";
        Label = "Effective Date of Assignment";
        Index = "1";
    }

    IN MIR-POL-CNFD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Policy Confidential Indicator";
    }

    IN MIR-POL-CRCY-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency Used for Balances";
    }

    IN MIR-POL-CRNT-MODE-FCT
    {
        DisplayOnly;
        Signed;
        Length = "8";
        Decimals = "7";
        SType = "Number";
        Label = "Policy Mode Factor";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Current Policy Status";
    }

    IN MIR-POL-CTRY-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Text";
        Label = "Country of Issue Location";
    }

    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Number of Coverages on This Policy";
    }

    IN MIR-POL-DB-OPT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DB-OPT-CD";
        SType = "Text";
        Label = "Policy Death Benefit Option";
    }

    IN MIR-POL-DIV-OPT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        SType = "Text";
        Label = "Policy Dividend Option";
    }

    IN MIR-POL-FINAL-DISP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Final Disposition Date";
    }

    IN MIR-POL-FREE-LK-END-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "End of Free Look Date";
    }

    IN MIR-POL-GRS-APREM-AMT
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE         
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Amount of Gross Annual Premium";
    }

    IN MIR-POL-INS-PURP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "PURP";
        SType = "Text";
        Label = "Purpose of Insurance";
    }

    IN MIR-POL-ISS-DT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-ISS-DT-TYP-CD";
        SType = "Text";
        Label = "Issue Date Rules";
    }

    IN MIR-POL-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Issue Date of the Policy";
    }

    IN MIR-POL-ISS-LOC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        FilterFields = "1";
        FilterField1 = "MIR-POL-CTRY-CD";
        SType = "Text";
        Label = "Issue Location of the Policy";
    }

    IN MIR-POL-MAIL-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date of Policy Mailing";
    }

    IN MIR-POL-MAIL-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Reason for Additional Policy Mailing";
    }

    IN MIR-POL-MEC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-MEC-CD";
        SType = "Text";
        Label = "Modified Endowement Contract (MEC) Reason";
    }

    IN MIR-POL-MIB-SIGN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-MIB-SIGN-CD";
        SType = "Text";
        Label = "MIB Signature Received";
    }

    IN MIR-POL-MPREM-AMT
    {
#M245B2 CHANGES START HERE
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE         
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Modal Premium as of Paid to Date";
    }

    IN MIR-POL-NFO-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-NFO-CD";
        SType = "Text";
        Label = "Non-Forfeiture Option";
    }

    IN MIR-POL-NXT-ACTV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date of Next Automatic Process";
    }

    IN MIR-POL-OPTL-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-OPTL-CD";
        SType = "Text";
        Label = "Key/Optional Status";
    }

    IN MIR-POL-PAC-DRW-DY
    {
        DisplayOnly;
        Length = "10";
        SType = "Day";
        Label = "Billing Draw Day";
    }

    IN MIR-POL-PDF-RFND-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PDF-RFND-CD";
        SType = "Text";
        Label = "Status of Policy Deposit Fund (PDF) Funds";
    }

    IN MIR-POL-PFEE-FCT
    {
        DisplayOnly;
        Signed;
        Length = "8";
        Decimals = "7";
        SType = "Number";
        Label = "Policy Fee Factor";
    }

    IN MIR-POL-PFEE-RESTR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Restrict Billing of Policy Fee";
    }

    IN MIR-POL-PNSN-QUALF-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PNSN-QUALF-CD";
        SType = "Text";
        Label = "Pension Qualification Description";
    }

    IN MIR-POL-PNSN-SRC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PENSR";
        SType = "Text";
        Label = "Financial Institution which Transfered Funds for Payment";
    }

    IN MIR-POL-PREM-DSCNT-PCT
    {
        DisplayOnly;
        Signed;
        Length = "5";
        Decimals = "3";
        SType = "Percent";
        Label = "Policy Discount Percentage Applied to Premium";
    }

    IN MIR-POL-PREM-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-PREM-TYP-CD";
        SType = "Text";
        Label = "Type of Premium Payment";
    }

    IN MIR-POL-REG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-REG-CD";
        SType = "Text";
        Label = "Location Policy Registered";
    }

    IN MIR-POL-REG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Policy Registered";
    }

    IN MIR-POL-REG-FND-SRC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-FND-SRC-CD";
        SType = "Text";
        Label = "Source of Funds for Payment";
    }

    IN MIR-POL-REINS-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REINS-CD";
        SType = "Text";
        Label = "Reinsurance Indicator";
    }

    IN MIR-POL-RUSH-IND
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-RUSH-IND";
        SType = "Text";
        Label = "Policy High Priority Indicator";
    }

    IN MIR-POL-SFB-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-SFB-CD";
        SType = "Text";
        Label = "Number of Special Frequency Bills produced Annually";
    }

    IN MIR-POL-SNDRY-AMT
    {
#M245B2 CHANGES START HERE      
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
       # CurrencyCode = "MIR-POL-CRCY-CD";
         CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Sundry Payment Amount";
    }

    IN MIR-POL-SNDRY-REASN-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUNRE";
        SType = "Text";
        Label = "Sundry Payment Reason";
    }

    IN MIR-POL-SUPRES-ISS-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Policy Suppress Issue Indicator";
    }

    IN MIR-POL-TAX-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-TAX-TYP-CD";
        SType = "Text";
        Label = "Policy Tax Type";
    }

    IN MIR-POL-TXEMP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-TXEMP-CD";
        SType = "Text";
        Label = "Tax Exempt Status";
    }

    IN MIR-POL-VPO-PU-DUR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Years Premium Should 'Vanish' By";
    }

    IN MIR-PREM-DSCNT-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PDTYP";
        SType = "Text";
        Label = "Premium Discount Type";
    }

    IN MIR-PREM-RECALC-OPT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-RECALC-OPT-CD";
        SType = "Text";
        Label = "Recalculated Premium Option";
    }

    IN MIR-REG-SAV-PORTN-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE         
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Registered Savings Portion Amount";
    }

    IN MIR-REG-SAV-PORTN-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-SAV-PORTN-CD";
        SType = "Text";
        Label = "Registered Savings Portion Coder";
    }

    IN MIR-REG-SPCL-HNDL-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-SPCL-HNDL-CD";
        SType = "Text";
        Label = "Special Handling Type for Tax Receipts";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Subsidiary Company ID";
    }

    IN MIR-SERV-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Servicing Agent ID";
    }

    IN MIR-SERV-BR-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Servicing Agent's Branch";
    }

    IN MIR-SERV-SO-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "SALE";
        SType = "Text";
        Label = "Servicing Agent's Sales Office";
    }

    IN MIR-SFB-END-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "SFB End Date";
    }

    IN MIR-SFB-GP-END-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "SFB Gap End Date";
    }

    IN MIR-SFB-GP-STRT-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "SFB Gap Start Date";
    }

    IN MIR-SFB-NXT-BILL-AMT
    {
#M245B2 CHANGES START HERE            
        CurrencyCode = "MIR-POL-CRCY-CD";      
#M245B2 CHANGES END HERE         
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "SFB Next Billing Amount";
    }

    IN MIR-SFB-SEMI-MTHLY-DY
    {
        DisplayOnly;
        Length = "3";
        SType = "Day";
        Label = "SFB Semi Monthly Billing Alternate Draw Day";
    }

    IN MIR-SFB-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "SFB Start Date";
    }

    IN MIR-TAX-1035-ACB-AMT
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";  
#M245B2 CHANGES END HERE         
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "ACB on 1035 Exchange Amount";
    }

    IN MIR-TAX-RPT-FREQ-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "TAX-RPT-FREQ-CD";
        SType = "Text";
        Label = "Tax Reporting Frequency";
    }

    IN MIR-UNMTCH-MAIL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Unmatched Mail Indicator";
    }

    IN MIR-USER-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "User ID";
    }
    IN MIR-POL-PD-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Policy Paid to Date";
    }


    IN MIR-AGT-ID-T[2]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table2";
        KeyColumn;
        SType = "Text";
        Label = "Writing Agent Number";
        Index = "1";
    }

    IN MIR-POL-AGT-SHR-PCT-T[2]
    {
        DisplayOnly;
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table2";
        SType = "Percent";
        Label = "Agent's Share Percentage";
        Index = "1";
    }

    IN MIR-POL-AGT-TYP-CD-T[2]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CVG-AGT-TYP-CD";
        SType = "Text";
        Label = "Agent Type";
        Index = "1";
    }

    IN MIR-NXT-FND-SRVBEN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Fund Survivorship Benefit Date";
    }

    IN MIR-POL-REPRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Certificate Reprint Date";
    }

    IN MIR-POL-PRT-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of times Certificate Printed";
    }

    IN MIR-POL-APP-UPLD-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Application Upload Date";
    }

    IN MIR-POL-APP-CALC-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Illustration Calculation Date";
    }

    IN MIR-POL-LUMP-SUM-AMT
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";  
#M245B2 CHANGES END HERE         
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Lump Sum Amount at Issue";
    }

    IN MIR-POL-REFRL-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Referral Code";
    }

    IN MIR-POL-ASIGN-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Policy Assigned Indicator";
    }

    IN MIR-POL-ASIGN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Policy Assigned Date";
    }

    IN MIR-ADDR-CORCT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Address Correction Indicator";
    }

    IN MIR-CORCT-APP-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Correct Application Indicator";
    }

    IN MIR-CNSLT-HO-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Head Office Consultation Request Indicator";
    }

    IN MIR-RQST-CNFRM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Pre-Issue Confirmation Indicator";
    }

    IN MIR-APP-PROB-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Problems with Application Indicator";
    }

    IN MIR-AGT-UWG-FAIL-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CNTRCT-REL-TYP";
        SType = "Text";
        Label = "Contract Relationship Type";
    }

    IN MIR-FREE-WTHDR-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Free Withdrawal Date";
    }

    IN  MIR-FRST-PREM-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FRST-PREM-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "First Premium Type";
    }

    IN  MIR-POL-CNVR-KEY-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Conversion `Key Number";
    }

    IN  MIR-POL-CNVR-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CNVR-TYP-CD";
        SType = "Text";
        Label = "Conversion Policy Type Code";
    }
     IN MIR-AGE-RAT-REASN-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "ARST";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }

    IN MIR-CONN-CVG-NUM-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Connected Coverage Number";
        Index = "1";
    }

    IN MIR-CVG-ACCT-TYP-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Account Type";
        Index = "1";
    }

    IN MIR-CVG-AD-FACE-AMT-T[20]
    {
#M245B2 CHANGES START HERE            
        CurrencyCode = "MIR-POL-CRCY-CD";      
#M245B2 CHANGES END HERE         
        DisplayOnly;
        Signed;
        Length = "16";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "ADB Amount";
        Index = "1";
    }

    IN MIR-CVG-AD-MULT-FCT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "ADB Rating Multiplier";
        Index = "1";
    }

    IN MIR-CVG-APP-CMPLT-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Application Completion Date";
        Index = "1";
    }

    #  P00581   YUC     10SEP2002  Change field name from MIR-CVG-APP-RECV-DT-T to MIR-RECPT-DT-T
    IN MIR-RECPT-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Application Received Date";
        Index = "1";
    }

    IN MIR-CVG-COLA-SELCT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-COLA-SELCT-CD";
        SType = "Text";
        Label = "Cost of Living Adjustment Benefit (COLA)";
        Index = "1";
    }

    IN MIR-CVG-COLFND-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Coverage is a loan collateral fund";
        Index = "1";
    }

    IN MIR-CVG-CSN-REC-CTR-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Number of Reinsurance on Coverage";
        Index = "1";
    }

    IN MIR-CVG-CSTAT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    IN MIR-CVG-ENHC-TYP-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-ENHC-TYP-CD";
        SType = "Text";
        Label = "Coverage Enhancement";
        Index = "1";
    }

    IN MIR-CVG-FACE-AMT-T[20]
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";  
#M245B2 CHANGES END HERE         
        DisplayOnly;
        Signed;
        Length = "16";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    IN MIR-CVG-FE-DUR-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Flat Extra Premium - Duration";
        Index = "1";
    }

    IN MIR-CVG-FE-UPREM-AMT-T[20]
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";  
#M245B2 CHANGES END HERE         
        DisplayOnly;
        Signed;
        Length = "11";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Dollar Amount/Unit";
        Index = "1";
    }

    IN MIR-CVG-INS-TYP-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        SType = "Text";
        Label = "Type of Insurance";
        Index = "1";
    }

    IN MIR-CVG-INT-PAYO-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "PLAN-INT-PAYO-CD";
        SType = "Text";
        Label = "Interest Handling Indicator";
        Index = "1";
    }

    IN MIR-CVG-ISS-EFF-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }
    IN MIR-PLAN-ID-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Type of Plan";
        Index = "1";
    }
      IN MIR-INSRD-CLI-ID-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Client Number of Lives Insured";
        Index = "1";
    }



    IN MIR-CVG-LTA-SELCT-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Lifetime accident (benefit provided; result of accident)";
        Index = "1";
    }

    IN MIR-CVG-LTB-SELCT-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Lifetime benefits (result of either accident or sickness)";
        Index = "1";
    }

    IN MIR-CVG-MAT-XPRY-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Coverage Maturity / Expiry Date";
        Index = "1";
    }

    IN MIR-CVG-ME-DUR-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Multiple Rating Duration";
        Index = "1";
    }

    IN MIR-CVG-ME-FCT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Rating";
        Index = "1";
    }

    IN MIR-CVG-ME-RAT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "TRATE";
        SType = "Text";
        Label = "True Table Rating";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        KeyColumn;
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-CVG-NXT-RENW-RT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-NXT-RENW-RT-CD";
        SType = "Text";
        Label = "Next Renewal Rate";
        Index = "1";
    }

    IN MIR-CVG-ORIG-FACE-AMT-T[20]
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE             
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Original Face Amount Applied For";
        Index = "1";
    }

    IN MIR-CVG-PAR-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-PAR-CD";
        SType = "Text";
        Label = "Dividend Option";
        Index = "1";
    }

    IN MIR-CVG-PREM-CHNG-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Premium Change Date";
        Index = "1";
    }

    IN MIR-CVG-PREV-CSTAT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Previous Coverage Status";
        Index = "1";
    }

    IN MIR-CVG-RT-AGE-T[20]
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Rate Age";
        Index = "1";
    }

    IN MIR-CVG-SEX-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    IN MIR-CVG-SMKR-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "SMOKE";
        SType = "Text";
        Label = "Smoker";
        Index = "1";
    }

    IN MIR-CVG-SPND-CSTAT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Suspended Coverage Status";
        Index = "1";
    }

    IN MIR-CVG-STAT-PRCES-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Last Status Change Date";
        Index = "1";
    }

    IN MIR-CVG-STBL-1-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
#* M241A3 changes START here*  
        CodeSource = "CSOM9D29";        
	FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T"; 
        FilterField2 = "MIR-CVG-STBL-1-CD-T";
#       CodeSource = "EDIT";
#       CodeType = "STB1";
#* M241A3 changes END here*  
        SType = "Text";
        Label = "Sub-table 1";
        Index = "1";
    }

    IN MIR-CVG-STBL-2-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Text";
        Label = "Sub-table 2";
        Index = "1";
    }

    IN MIR-CVG-STBL-3-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
#* M241A3 changes START here*  
        CodeSource = "CSOM9D30";        
	FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T"; 
        FilterField2 = "MIR-CVG-STBL-3-CD-T";
#        CodeSource = "EDIT";
#        CodeType = "STB3";
#* M241A3 changes END here*  
        SType = "Text";
#*  RPL012- Misc Screen Changes start
#       Label = "Sub-table 3";
  Label = "Premium Payment Period";
#*  RPL012- Misc Screen Changes end
        Index = "1";
    }

    IN MIR-CVG-STBL-4-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Text";
        Label = "Sub-table 4";
        Index = "1";
    }
#*  MP161L- Screen Changes start
#* MP213S Changes Begin
   
   IN MIR-CVG-PRIM-GR-ID-T[20]
   {
        DisplayOnly;
        FieldGroup = "Table20";
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Group ID";
        Index = "1";
   }

   IN MIR-GR-ID-TYP-CD-T[20]
   {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Hidden";
        Label = "Group ID";
        Index = "1";
   }   


#* MP213S changes end 
    IN MIR-DV-3DD-WP-IND-T[20]
    {
            DisplayOnly;
            Length = "40";
            FieldGroup = "Table20";
            CodeSource = "EDIT";
            CodeType = "3DDW";
            SType = "Text";
            Label = "3DD Waiver of Premium";
            Index = "1";
    }
#*  MP161L- Screen Changes end
#NVCN01 changes end 
    IN MIR-CVG-WP-TYP-CD-T[20]
    {
            DisplayOnly;
            Length = "40";
            FieldGroup = "Table20";
            CodeSource = "DataModel";
            CodeType = "CVG-WP-TYP-CD";
            SType = "Text";
            Label = "Wop Type";
            Index = "1";
    }
#NVCN01Changes end
    IN MIR-CVG-SUM-INS-AMT-T[20]
    {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Sum Insured Amount";
        Index = "1";
    }

    IN MIR-CVG-UL-PU-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "UL Paid-up Date";
        Index = "1";
    }

    IN MIR-CVG-UNIT-TYP-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-UNIT-TYP-CD";
        SType = "Text";
        Label = "Unit Type";
        Index = "1";
    }

    IN MIR-CVG-UWG-AMT-T[20]
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Underwriting Amount";
        Index = "1";
    }

    IN MIR-CVG-WP-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "WP Ind";
        Index = "1";
    }

    IN MIR-CVG-WP-MULT-FCT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Waiver of Premium Multiplier";
        Index = "1";
    }

    IN MIR-CVG-WTHDR-ORDR-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-WTHDR-ORDR-CD";
        SType = "Text";
        Label = "Withdrawal Order";
        Index = "1";
    }

    IN MIR-DV-DPOS-TRM-DY-DUR-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Deposit Term Days";
        Index = "1";
    }

    IN MIR-DV-DPOS-TRM-MO-DUR-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Deposit Term Months";
        Index = "1";
    }

    IN MIR-DV-INSRD-CLI-NM-T[20]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }
     IN MIR-DV-INSRD-CLI-NM1-T[20]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }
    #  MFPCC1   CECIL   06MAY2004  Add field Illustration Type
    IN MIR-CVG-ILLUS-CD-T[20]
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ILLUS";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Illustration Type";
    }

    IN MIR-APPL-CTL-PRCES-DT1-T[6]
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Date";
    Label = "System Date";
    Index = "1";
  }

  IN MIR-BILL-TYP-CD1-T[6]
  {
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "BILL-TYP-CD";
    SType = "Text";
    Label = "Bill Method";
    Index = "1";
  }

  IN MIR-BILL-MODE-CD1-T[6]
  {
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "BILL-MODE-CD";
    SType = "Text";
    Label = "Bill Mode";
    Index = "1";
  }

  IN MIR-DRW-STAT-CD1-T[6]
  {
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "DRW-STAT-CD";
    SType = "Text";
    Label = "Status";
    Index = "1";
  }

  IN MIR-PREV-UPDT-DT1-T[6]
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Date";
    Label = "Status Date";
    Index = "1";
  }

  IN MIR-A-RECPT-XPRY-DT1-T[6]
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Date";
    Label = "A Receipt Expiry Date";
    Index = "1";
  }

  IN MIR-DRW-DT1-T[6]
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Date";
    Label = "Draw Date";
    Index = "1";
  }

# R11050 Changes starts here 
  IN MIR-RECPT-TYP-CD1-T[6]
  {
    DisplayOnly;
    Length = "01";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "RECPT-TYP-CD";
    DBTableName = "TBAC";
    SType = "Text";
    Label = "Receipt Type";
    Index = "1";
  }
# R11050 Changes ends here
  IN MIR-BNK-ID1-T[6]
  {
    DisplayOnly;
    Length = "04";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Bank";
    Index = "1";
  }

  IN MIR-BNK-BR-ID1-T[6]
  {
    DisplayOnly;
    Length = "05";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Branch";
    Index = "1";
  }

  IN MIR-BNK-ACCT-ID1-T[6]
  {
    DisplayOnly;
    Length = "17";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Account";
    Index = "1";
  }

  IN MIR-CLI-ID-T[20]
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Payor ID";
    Index = "1";
  }

  IN MIR-DV-SRCH-CLI-NM1-T[6]
  {
    DisplayOnly;
    Length = "30";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Name";
    Index = "1";
  }

  IN MIR-PREM-AMT1-T[6]
  {
#M245B2 CHANGES START HERE        
#Q61551 CHANGES START HERE
        #CurrencyCode = "MIR-POL-CRCY-CD";
#Q87797 CHANGES START HERE
         #CurrencyCode = "MIR-PREM-CRCY-CD";
         CurrencyCode = "MIR-PMT-CRCY-CD";
#Q87797 CHANGES END HERE
#Q61551 CHANGES END HERE         
#M245B2 CHANGES END HERE               
    DisplayOnly;
    Length = "13";
    FieldGroup = "Table1";
    SType = "Currency";
    Label = "Total Billed";
    Index = "1";
  }

  IN MIR-RECV-AMT1-T[6]
  {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-PMT-CRCY-CD";     
#M245B2 CHANGES END HERE               
    DisplayOnly;
    Length = "13";
    FieldGroup = "Table1";
    SType = "Currency";
    Label = "Total Received";
    Index = "1";
  }

  IN MIR-SEQ-NUM1-T[6]
  {
    DisplayOnly;
    Length = "03";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Seq. Number";
    Index = "1";
  }

  IN MIR-UNSUCS-REASN-CD1-T[6]
  {
    DisplayOnly;
    Length = "01";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "UNSUCS-REASN-CD";
    SType = "Text";
    Label = "Unsuccessful Reason Code";
    Index = "1";
  }

  IN MIR-FND-SRC-CD1-T[6]
  {
    DisplayOnly;
    Length = "01";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "FND-SRC-CD";
    SType = "Text";
    Label = "Source of Funds";
    Index = "1";
  }

  IN MIR-PREM-RQST-QTY1-T[6]
  {
    DisplayOnly;
    Length = "02";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Number of Payments Requested";
    Index = "1";
  }

  IN MIR-PREM-COLCT-QTY1-T[6]
  {
    DisplayOnly;
    Length = "02";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Number of Payments Collected";
    Index = "1";
  }

  IN MIR-PAYRL-SIZ-CD-T[6]
  {
    DisplayOnly;
    Length = "01";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "PAYRL-SIZ-CD";
    SType = "Text";
    Label = "Payroll Size";
    Index = "1";
  }

  IN MIR-RECV-DT1-T[6]
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Date";
    Label = "Payment Received Date";
    Index = "1";
  }

# NWLIQS Changes starts here
  IN MIR-TRAD-JRNL-DT-T[6]
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Date";
    Label = "Trad Journal Date";
  }

  IN MIR-TRAD-SO-JRNL-DT-T[6]
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Date";
    Label = "Trad SO Journal Date";
  }

  IN MIR-TRAD-RECV-DT-T[6]
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Date";
    Label = "Trad Receipt Date";
  }

  IN MIR-PREM-DUE-MO-NUM-T[6]
  {
    DisplayOnly;
    Length = "07";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Trad Premium Due Month";
  }

# NWLIQS Changes ends here

    IN MIR-BNK-ACCT-ID
    {
        DisplayOnly;
        Length = "17";
        SType = "Text";
        Label = "Account Number";
    }

    IN MIR-BNK-ACCT-MICR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Cheque from account is MICR-encoded";
    }

    IN MIR-BNK-ACCT-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        SType = "Text";
        Label = "Account Type";
    }

    IN MIR-BNK-BR-ID
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
    }

    IN MIR-BNK-ID
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }

    IN MIR-CLI-BNK-ACCT-NUM
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bank Account Number";
    }


    IN MIR-PAC-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client Number";
    }
    IN MIR-POL-PAC-RETRN-1-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Return PAC Cheque Reason (1)";
    }

    IN MIR-POL-PAC-RETRN-1-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Return PAC Cheque Date 1";
    }

    IN MIR-POL-PAC-RETRN-2-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Return PAC Cheque Reason (2)";
    }

    IN MIR-POL-PAC-RETRN-2-DT
    {
        Length = "9";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Return PAC Cheque Date 2";
    }

    IN MIR-ACUM-INT-LTD-AMT1-T[6]
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Accumulated Cash Flow Interest Paid Amount";
        Index = "1";
    }

    IN MIR-CF-CLI-TRXN-AMT1-T[6]
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Gross Amount";
        Index = "1";
    }

    IN MIR-CF-EFF-DT1-T[6]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table6";
        SType = "Date";
        Label = "Cash Flow Effective Date";
        Index = "1";
    }

    #  1CPR03   YUC     23SEP2002  Add 1 field (10 lines) for CONVERSION PROCESSING
    IN MIR-DV-FND-BAL-EX-ESC-AMT1-T[6]
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Base Cash Value Excluding ESC";
        Index = "1";
    }

    IN MIR-CF-FND-BAL-AMT1-T[6]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Current Amount";
        Index = "1";
    }

    IN MIR-CF-FND-TRXN-AMT1-T[6]
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Net Deposit Amount";
        Index = "1";
    }

    IN MIR-CF-INT-PCT1-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table6";
        SType = "Percent";
        Label = "Interest Rate";
        Index = "1";
    }

    IN MIR-CF-MCV-FND-AMT1-T[6]
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "MCV Current Fund Amount";
        Index = "1";
    }

    IN MIR-CF-MCV-INT-AMT1-T[6]
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "MCV Interest to Next Cash Flow Amount";
        Index = "1";
    }

    IN MIR-CF-MCV-INT-LTD-AMT1-T[6]
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Accumulated MCV Interest Amount";
        Index = "1";
    }

    IN MIR-CF-MCV-TRXN-AMT1-T[6]
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "MCV Net Amount";
        Index = "1";
    }

    IN MIR-CF-MKTVAL-ADJ-AMT
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Market Value Adjustment";
    }

    IN MIR-CF-REASN-CD1-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD";
        SType = "Text";
        Label = "Transaction Reason";
        Index = "1";
    }

    IN MIR-CF-SEQ-NUM-T[6]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Cash Flow Seq Number";
        Index = "1";
    }

    IN MIR-CF-STAT-CD1-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "CF-STAT-CD";
        SType = "Text";
        Label = "Cash Flow Status";
        Index = "1";
    }

    INOUT MIR-CF-TRXN-CD1-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "CF-TRXN-CD";
        SType = "Text";
        Label = "Transaction Type";
        Index = "1";
    }

    IN MIR-CF-UNIT-QTY-T[6]
    {
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Equity Products - Units Purchased";
        Index = "1";
    }

    IN MIR-CVG-CF-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Hidden";
        Label = "Coverage Cash Flow Type Code";
    }

    IN MIR-CVG-WTHDR-ORDR-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-WTHDR-ORDR-CD";
        SType = "Text";
        Label = "Withdrawal Order";
    }

    IN MIR-DV-CVG-UNIT-QTY
    {
        DisplayOnly;
        Signed;
        Length = "11";
        Decimals = "5";
        SType = "Number";
        Label = "Total Units";
    }

    IN MIR-DV-MCV-ACUM-AMT
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Minimum Contract Value Accumulated Amount";
    }

    IN MIR-DV-MTHV-ADJ-AMT
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Monthiversary Charge";
    }

    IN MIR-DV-OWN-CLI-NM-KJ
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    #  1CPR03   YUC     23SEP2002  Add 1 field (8 lines) for CONVERSION PROCESSING
    IN MIR-DV-POL-BASE-CV-EX-ESC-AMT
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Base Cash Value Excluding ESC";
    }

    IN MIR-DV-POL-BASE-CV-AMT
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Base Cash Value";
    }

    IN MIR-DV-POL-CSV-AMT
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Cash Surrender Value";
    }

    IN MIR-DV-SURR-CHRG-AMT
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Surrender Charge";
    }

    IN MIR-DV-UVAL-RT
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "4";
        SType = "Currency";
        Label = "Current Unit Value";
    }

    IN MIR-DV-UVAL-RT-T[6]
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Current Unit Value";
        Index = "1";
    }

    IN MIR-LOAN-AMT
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Policy Loan";
    }

    IN MIR-MCV-ACUM-INT-AMT-T[6]
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "MCV Accumulated Interest Amount";
        Index = "1";
    }

    IN MIR-MCV-GUAR-INT-PCT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "5";
        FieldGroup = "Table6";
        SType = "Percent";
        Label = "MCV Guaranteed Interest Rate";
        Index = "1";
    }

    IN MIR-NXT-CF-DT-T[6]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table6";
        SType = "Date";
        Label = "Next Cash Flow - Date";
        Index = "1";
    }
    IN MIR-RBILL-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Restrict Billing Effective Date";
    }

    IN MIR-RBILL-END-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Restrict Billing End Date";
    }

    IN MIR-RBILL-MISC-1-CD
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Restrict Billing Code #1";
    }

    IN MIR-RBILL-MISC-2-CD
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Restrict BIlling Code #2";
    }
    IN MIR-POL-CWA-SUSP-AMT
    {
 #M245B2 CHANGES START HERE        
 #Q50654 CHANGED CURRENCY CODE FROM POLICY TO PAYMENT CURRENCY FOR THIS FIELD
 #Q50654 CurrencyCode = "MIR-POL-CRCY-CD";     
         CurrencyCode = "MIR-PMT-CRCY-CD";     
#M245B2 CHANGES END HERE                
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Cash with App Suspense";
    }

     IN MIR-POL-OS-DISB-AMT
    {
#MP245R CHANGES START HERE        
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";     
#MP245R CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements";
    }

    IN MIR-OS-DISB-SURR-AMT
    {
#MP245R CHANGES START HERE        
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";     
#MP245R CHANGES END HERE               
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements - Surrender";
    }

    IN MIR-OS-DISB-MAT-AMT
    {
#MP245R CHANGES START HERE        
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";     
#MP245R CHANGES END HERE               
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements - Maturity";
    }

    IN MIR-OS-DISB-DTH-AMT
    {
#MP245R CHANGES START HERE        
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";     
#MP245R CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements - Death";
    }

    IN MIR-OS-DISB-CLM-AMT
    {
#MP245R CHANGES START HERE        
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";     
#MP245R CHANGES END HERE               
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements - Claims";
    }

    IN MIR-OS-DISB-AD-AMT
    {
#MP245R CHANGES START HERE        
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";     
#MP245R CHANGES END HERE             
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements - Accidental Death";
    }

    IN MIR-POL-MISC-SUSP-AMT
    {
#M245B2 CHANGES START HERE        
#Q60877 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#Q60877 CHANGES END HERE     
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }
    IN MIR-POST-LAPS-SURR-AMT
    {
#MP245R CHANGES START HERE        
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";     
#MP245R CHANGES END HERE                   
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Post Lapse Surrender Amount";
    }

    #  02AD67   YUC     23AUG2002  ADD 3 FIELD (27 LINES) FOR Change control request
    IN MIR-POL-PD-SUSP-AMT
    {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";
        CurrencyCode = "MIR-PMT-CRCY-CD";      
#M319O1 CHANGES END HERE
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Payroll Deduction Suspense";
    }

    IN MIR-POL-BT-SUSP-AMT
    {
#M245B2 CHANGES START HERE      
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";
        CurrencyCode = "MIR-PMT-CRCY-CD";        
#M319O1 CHANGES END HERE
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Bank Transfer Suspense";
    }

    IN MIR-POL-CC-SUSP-AMT
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";
        CurrencyCode = "MIR-PMT-CRCY-CD";      
#M319O1 CHANGES END HERE
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE                 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Cash Collection Suspense";
    }

     IN MIR-CLI-SEX-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-CLI-BTH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }
#28053A changes begins
    IN MIR-POL-HLDR-RESTR-TXT
    {
        DisplayOnly;
        Length = "120";
        SType = "Text";
        Label = "Restriction on change of Policyholder's name";
    }

#28053A changes ends 
     IN MIR-CLI-PREFCT-TXT
    {
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Prefecture";
    }

    #added for 01AD05

    IN MIR-CLI-KA-PREFCT-TXT
    {
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Prefecture";
    }

    #added for 01AD05

    IN MIR-CLI-KA-CITY-TXT
    {
        DisplayOnly;
        Length = "30";
        SType = "Text";
        Label = "City";
    }

    #added for 01AD05

    IN MIR-CLI-KA-NGHBRHD-TXT
    {
        DisplayOnly;
        Length = "30";
        SType = "Text";
        Label = "Neighborhood";
    }

    IN MIR-CLI-ADDR-LOC-CD
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Address Code";
    }

    IN MIR-CLI-PSTL-CD
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

    IN MIR-CLI-CTRY-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Text";
        Label = "Country";
    }
    INOUT MIR-CLI-ID
    {
        Length = "10";
        FieldGroup = "Table1";
        KeyColumn;
        SType = "Text";
        Label = "Client ID";
    }
     IN MIR-CLI-ADDR-LN-1-TXT-T[2]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }
    IN MIR-CLI-ADDR-ADDL-TXT-T[2]
    {
        DisplayOnly;
        Length = "72";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Samakata-bu";
        Index = "1";
    }
    IN MIR-CLI-CITY-NM-TXT-T[2]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    IN MIR-UL-LAPS-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Lapse Start Date";
    }

    IN MIR-POL-CEAS-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Policy Cease Date";
    }
    IN MIR-CLI-CNTCT-ID-CD-T[5]
    {
        Key;
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "EDIT";
        CodeType = "CNTID";
        SType = "Text";
        Label = "Contact Type";
        Index = "1";
    }

    IN MIR-CLI-CNTCT-ID-TXT-T[5]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Identification Code";
        Index = "1";
    }

    IN MIR-UW-TYP-CD-T[20]
    {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table20";
    Index = "1";
    CodeSource = "DataModel";
    CodeType = "UW-TYP-CD";
    SType = "Text";
    Label = "Level of Underwriting";
    }

    IN MIR-DV-SEL-CLI-ID-T[20]
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Payor ID";
    Index = "1";
  }
#EN9547 CHANGES START HERE  
#  INOUT MIR-CVG-NUM
#  {
#
#        Length = "2";
#        SType = "Text";
#        Label = "Coverage Number";
#  }
#EN9547 CHANGES END HERE  
   IN MIR-PREV-SERV-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Previous Servicing Agent";
    }
     IN MIR-CLI-ADDR-CNTCT-TXT
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Phone Number";
    }

      IN MIR-POL-BILL-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Policy Billed to Date";
    }

    IN MIR-POL-SUB-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        SType = "Text";
        Label = "Policy Sub Status";
    }

    IN MIR-PROD-APP-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";
        SType = "Text";
        Label = "Product Application Type Code";
    }

    IN MIR-SUB-CAT-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sub Category";
    }

    IN MIR-ORIG-POL-ID
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Original Policy Number";
    }

    IN MIR-MY-KEMPO-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "My Kempo Type Code";
    }

    IN MIR-POL-HNDL-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-HNDL-CD";
        SType = "Text";
        Label = "Policy Handling Type";
    }

# MFFCC2 BEGIN - SUG
    IN MIR-FREE-XFER-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Free Transfers - Number Remaining";
    }

    IN MIR-DV-POL-FND-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of SA Riders";
    }

    IN MIR-CVG-XPCT-ANTY-AGE-T[20]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Expected Annuity Age";
        Index = "1";
    }

    IN MIR-DV-TOT-SA-PREM-AMT
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "SA Rider Premium";
    }
# MFFCC2 END - SUG

# IPDDRC                                        Converted Face Amount
    IN MIR-CVG-NUM2-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-PLAN-ID2-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Plan";
        Index = "1";
    }

    IN MIR-CVG-PCFA-AMT-T[20]
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Present Converted Face Amount";
        Index = "1";
    }

    IN MIR-CVG-DV-PCFA-NXT2-AMT-T[20]
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Converted Face Amount at Next MV + 2 Years";
        Index = "1";
    }

    IN MIR-CVG-ACFA-AMT-T[20]
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Average Converted Face Amount";
        Index = "1";
    }

    IN MIR-CVG-DV-PCFA-GPD-AMT-T[20]
    {
#M245B2 CHANGES START HERE        
        CurrencyCode = "MIR-POL-CRCY-CD";     
#M245B2 CHANGES END HERE                 
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Converted Face Amount for Guaranteed Period";
        Index = "1";
    }

# IPMPPR BEGINS - CTS
    IN MIR-DV-ANUTNT-NM-KJ
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Annuitant Name";
    }

    IN MIR-ANUTNT-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }

    IN MIR-ANUTNT-BTH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }

    IN MIR-ANUTNT-SEX-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-ANUTNT-ADDR-LOC-CD
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Address Code";
    }

    IN MIR-ANUTNT-PSTL-CD
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

    IN MIR-ANUTNT-PREFCT-TXT
    {
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Prefecture";
    }

    IN MIR-ANUTNT-CITY-NM-TXT-T[2]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    IN MIR-ANUTNT-ADDR-LN-1-TXT-T[2]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    IN MIR-ANUTNT-ADDR-ADDL-TXT-T[2]
    {
        DisplayOnly;
        Length = "72";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Samakata-bu";
        Index = "1";
    }

    IN MIR-ANUTNT-ADDR-CNTCT-TXT
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Phone Number";
    }

    IN MIR-ANUTNT-KA-PREFCT-TXT
    {
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Prefecture";
    }

    IN MIR-ANUTNT-KA-CITY-TXT
    {
        DisplayOnly;
        Length = "30";
        SType = "Text";
        Label = "City";
    }

    IN MIR-ANUTNT-KA-NGHBRHD-TXT
    {
        DisplayOnly;
        Length = "30";
        SType = "Text";
        Label = "Neighborhood";
    }
# IPMPPR ENDS - CTS

    IN MIR-FIEL-INS-PURP-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "FIEL(Insurance Purpose)";
    }
# MP5002

    IN MIR-SURR-CHRG-TYP-CD
    {
            DisplayOnly;
            Length = "1";
            CodeSource = "EDIT";
            CodeType = "MVAL";
            DBTableName = "TPOL";
            SType = "Text";
            Label = "FlexFund Surrender Charge Type";
    }
#* FEID01 Changes start

    IN MIR-LIAB-STRT-DT
    {
            DisplayOnly;
            Length = "10";
            SType = "Date";
            Label = "Liability Commencement date";
     }

#* FEID01 Changes end
#* FEID03 CHANGES START
    IN MIR-POL-ISS-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "New Business Issue Processing Date";
    }
#* FEID03 CHANGES END

#*FEGL05 CHANGES STARTS

   IN MIR-GRACE-EXT-PREM-AMT
    {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE                 
           DisplayOnly;
           Signed;
           Length = "17";
           DBTableName = "Derived";
           SType = "Currency";
           Label = "Premium necessary to extend grace";
    }
#*FEGL05 CHANGES ENDS

#M271A8 CHANGES START HERE  

    IN MIR-TAX-QUALF-IND
    {
           DisplayOnly;
           Length = "1";
           SType = "Indicator";
           Label = "Tax Qualified Indicator";  
    }

    IN MIR-SCHD-ADV-PMT-DUR
    {
        Length = "3";
        DBTableName = "TPOL";
        CodeSource = "DataModel";   
        CodeType = "SCHD-ADV-PMT-DUR";           
        SType = "Text";
        Label = "No of Months Of Scheduled Advanced Payment";
    }
    
#M319I3 CHANGES START HERE  

IN MIR-YBA-RPT-REQIR-IND
    {
        DisplayOnly;
	Length = "1";
	SType = "Indicator";
        Label = "Yen Bill amount Report required indicator";  
    }
#UYS104 CHANGES START HERE
    IN MIR-PROPORTN-PREM-IND
	{
	     DisplayOnly;
	     Length = "1";
         SType = "Indicator";
         Label = "Proportional distribution type paid premium calculation flag";
	}
 #UYS104 CHANGES END HERE
 #UY3068 CHANGES START HERE 
    IN MIR-UNIS-CNVR-DSCNT-TYP
    {
         DisplayOnly;
         Length = "15";
         SType = "Text";
         Label = "Unisys Conversion Discount Type";
    }
    IN MIR-UNIS-CNVR-DSCNT-PR
    {
         DisplayOnly;
         Length = "15";
         SType = "Number";
         Label = "Unisys Conversion Discount Period";
    }
    IN MIR-UNIS-CNVR-DSCNT-AMT
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Unisys Conversion Discount Amount";
    }
#UY3C46 CHANGES START HERE    
    IN MIR-CNVR-HIST-BAL-AMT
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Conversion Balance in history";
    }
#UY3C46 CHANGES ENDS HERE 
    IN MIR-UNIS-CNVR-BAL-AMT
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Unisys Conversion Balance";
    }
    IN MIR-EMP-DSCNT-IND
    {
         DisplayOnly;
         Length = "1";
         SType = "Indicator";
         Label = "Employee Discount Indicator";
    }
    IN  MIR-EMP-DSCNT-AMT
    {
        CurrencyCode = "MIR-PREM-CRCY-CD";
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Employee Discount Amount";
    }
 #UY3068 CHANGES END HERE
    
# UYSD11-STARTS
    IN MIR-USYS-MIGR-POL-IND
    {    
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Migrated Policy";
    }
# UYSD11-ENDS

IN MIR-BILL-YR-MO-T[1]
    {
        DisplayOnly;
        FieldGroup = "Table6";        
        Length = "6";
        KeyColumn;
        SType = "Text";
        Label = "Billing year and month";
    }

IN MIR-XCHNG-PREM-AMT-T[1]
  {
        CurrencyCode="MIR-PREM-CRCY-CD"; 
        DisplayOnly;
        FieldGroup = "Table6";                
        Length = "16";
        SType = "Currency";
        Label = "Premium (contract currency)";
        Signed;
  }
  
  IN MIR-PREM-XCHNG-RT-T[1]
  {
        DisplayOnly;
        Length = "18";
        FieldGroup = "Table6";                
        SType = "Number";
        Label = "Japanese Yen conversion rate";
  }
	
  IN MIR-XCHNG-RECV-AMT-T[1]
  {
        CurrencyCode="MIR-PMT-CRCY-CD"; 
        DisplayOnly;
        Length = "16";
        FieldGroup = "Table6";                
        SType = "Currency";
        Label = "Premium (converted in Japanese Yen) ";
        Signed;
  }
IN MIR-QTY-OF-BILL-T[1]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table6";                
        KeyColumn;
        SType = "Text";
        Label = "Count of billings";
    }

IN MIR-BILL-AMT-T[1]
    {
        CurrencyCode="MIR-PMT-CRCY-CD"; 
        DisplayOnly;
        Length = "16";
        FieldGroup = "Table6";                
        SType = "Currency";
        Label = "Billing amount";
        Signed;
    }        
#Q87624 CHANGES START HERE	
IN MIR-XCHNG-EFF-DT-T[1]
  {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table6";                
        SType = "Date";
        Label = "Exchange rate base date";
  }

IN MIR-MPREM-2-AMT-T[1]
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        FieldGroup = "Table6";                
        Label = "Premium (contract currency)";
        CurrencyCode="MIR-PREM-CRCY-CD";
        Signed;
    }    
    
IN MIR-MPREM-2-JPY-AMT-T[1]
    {
        DisplayOnly;
        Length = "16";
        KeyColumn;
        SType = "Currency";
        Label = "Premium (converted in Japanese Yen)";
        Signed;
    }
    
IN MIR-MPREM-6-AMT-T[1]
    {
        DisplayOnly;
        Length = "16";
        FieldGroup = "Table6";                
        SType = "Currency";
        Label = "Premium (contract currency)";
        CurrencyCode="MIR-PREM-CRCY-CD";
        Signed;
    }    
    
IN MIR-MPREM-6-JPY-AMT-T[1]
    {
        DisplayOnly;
        Length = "16";
        KeyColumn;
        FieldGroup = "Table6";                
        SType = "Currency";
        Label = "Premium (converted in Japanese Yen)";
        Signed;
    }

IN MIR-MPREM-12-AMT-T[1]
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        FieldGroup = "Table6";                
        Label = "Premium (contract currency)";
        CurrencyCode="MIR-PREM-CRCY-CD";
        Signed;
    } 
    
IN MIR-MPREM-12-JPY-AMT-T[1]
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        FieldGroup = "Table6";                
        Label = "Premium (converted in Japanese Yen)";
        Signed;
    }        
    
#M319I3 CHANGES END HERE

    IN MIR-DTH-CVG-AMT
    {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "17";
         DBTableName = "TCFLW";
         SType = "Currency";
         Label = "Death Coverage Amount";  
    }
    
     IN MIR-DV-JP-DTH-CVG-AMT 
     {  
        DisplayOnly;  
        Signed;  
        Length = "17";  
        DBTableName = "TCFLW";  
        SType = "Currency";  
        Label = "Death Coverage Amount in JPY"; 
     }  
     
   
    IN MIR-CF-XCHNG-RT1-T[6]
    {
        Length = "18";
        FieldGroup = "Table6";
        Index = "1";
        DisplayOnly;
        Label = "Conversion Rate";
        Decimals = "2";      		     
        SType = "Number";  
    }
    IN MIR-FWD-GAIN-LOSS-AMT1-T[6]
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Length = "18";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Gain/Loss amount in Forward processing";
        Index = "1";
    } 
    
    IN MIR-REVRS-GAIN-LOSS-AMT1-T[6]
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Length = "18";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Gain/Loss amount in Reversal processing";
        Index = "1";
    }     
    
    IN MIR-DV-XCHNG-RT
    {
        Length = "18";
        DisplayOnly;
        Label = "Conversion Rate";
        Decimals = "2";      		     
        SType = "Number";  
    }
  
             
    IN MIR-INT-ACUM-PREM-AMT1-T[6]
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Length = "18";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Accmulated Paid Premium";
        Index = "1";
    }    

    IN MIR-CF-FEE-RT1-T[6]
    {
        Length = "18";
        FieldGroup = "Table6";
        Index = "1";
        DisplayOnly;
        Label = "Fee Rate";
        Decimals = "2";      		     
        SType = "Number";        
    }   
#M271A8 CHANGES END HERE  

# NWLIQS Changes Starts here

    IN MIR-TRAD-PD-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Trad Paid to Date";
    }


    IN MIR-TOT-PREM-ACCUM-TPID
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-PMT-CRCY-CD";
#M245B2 CHANGES END HERE     
      DisplayOnly;
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "Trad Total Premium Collected Amount - Accumulation";
    }

    IN MIR-UL-PD-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "UL Paid to Date";
    }

    IN MIR-PD-TO-MON
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Trad Paid to Month";
    }

    IN MIR-PD-DUR
    {
        DisplayOnly;
        Length = "06";
        SType = "Text";
        Label = "Trad Paid Duration";
    }

    IN MIR-ACT-PD-TO-MON
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Trad Actual Paid to Month";
    }

    IN MIR-ACT-PD-DUR
    {
        DisplayOnly;
        Length = "06";
        SType = "Text";
        Label = "Trad Actual Paid Duration";
    }

    IN MIR-OVR-SHRT-PREM-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";
        CurrencyCode = "MIR-PMT-CRCY-CD";      
#M319O1 CHANGES END HERE
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Over / Short Premium";
    }

    IN MIR-TRAD-POL-MPREM-AMT
    {
#M245B2 CHANGES START HERE
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Trad Modal Premium";
    }

# NWLIQS Changes Ends here

# ISLADM - Changes start here     
    IN MIR-SURR-FORM-ACPT-DT
    { 
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Surrender Request Form Acceptance Date";
    }
    
    IN MIR-ASIGN-SURR-EFF-DT
    { 
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Assigned Surrender Effective Date for Policy with Assignee";
    }
    
    IN MIR-POL-STEP-IN-RIGHT-IND
    { 
        DisplayOnly;
        Length = "1";       
        SType = "Indicator";
        Label = "Policy with Step-In Right";
    }    
# ISLADM - Changes end here
# UYS092 - Changes start here
    IN MIR-POL-ASIGN-STAT-CD
    { 
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-ASIGN-STAT-CD";
        SType = "Text";        
        Label = "Assignment Status";
    }
    IN MIR-POL-ASIGN-DEL-DT
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";        
        SType = "Date";
        Label = "Assignment Deletion Date";
    }
# UYS092 - Changes ends here
# ATU688 CHANGES BEGIN
# NWLPNB changes begin
# 
#     IN MIR-ADV-PMT-YR
#     {              
#         DisplayOnly;
#         Length = "2";
#         CodeSource = "EDIT";
#         CodeType = "PPLSY";        
#         SType = "Text";
#         Label = "Advance Payment Years and Months";
#     }
# 
#     IN MIR-ADV-PMT-MO
#     {
#         DisplayOnly;
#         Length = "2";
#         CodeSource = "EDIT";
#         CodeType = "PPLSM";
#         SType = "Text";
#         Label = "Advance Payment Years and Months";
#     }
#     
#     IN MIR-ADV-PMT-AMT
#     {
#         DisplayOnly;
#         Length = "19";
#         SType = "Currency";
#         Label = "Residuals of Advance Premium";
#     }
# 
# NWLPNB changes end
# ATU688 CHANGES END

# NWLGAR changes begin

    IN MIR-ANN-STMT-NOT-REQ-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Annual Statement Not Required Policy";
    }

# NWLGAR changes end
# M117PB changes begin

    IN MIR-POL-FUT-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Policy Future Bill Type";
    }
    
    IN MIR-POL-FUT-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Policy Future Bill Mode";
    }

    IN MIR-POL-FUT-PAC-DRW-DY
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Billing Draw Day";
    }

    IN MIR-POL-FUT-MPREM-AMT
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Current Modal Premium ";
    }

    IN MIR-PBRQ-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Policy billing request Effective Date";
    }

#MP142G change begins

    IN MIR-NEW-SNDRY-AMT
    {
#M245B2 CHANGES START HERE
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "New Sundry Amount";
    }
#MP142G change ends

 # M117PB changes end   
# NWLLCC changes begin

    IN MIR-LOAN-BAL-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Balance(Excluding Interest)";
    }    
    
    IN MIR-LOAN-INT-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Interest Start Date";
    }

# NWLLCC changes end

# NV3A06 changes begin

    IN MIR-SUSP-PREM-TOT-AMT
    {   
        CurrencyCode="MIR-POL-CRCY-CD";    
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Suspension Premium Total";
    }    
    

    IN MIR-MKT-VAL-AMT
    {   
        CurrencyCode="MIR-POL-CRCY-CD";    
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Market Value (Automatic/By-request premium suspension)";
    }

# NV3A06 changes end
# MP1544 changes begin

    IN MIR-APL-BAL-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Balance";
    }    
    
    IN MIR-APL-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "APL Date";
    }

# MP1544 changes end
# C12653 changes begin

    IN MIR-DSASTR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "DSAST";
        SType = "Text";
        Label = "Disaster Code";
    }    
# C12653 changes end

#MP143D changes begins
# TLB26C Changes begin.

  IN MIR-SRVBEN-NXT-PO-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
#       Label = "Survival Benefit Next Payout Effective Date";
        Label = "Survival Benefit Next Payout Effective Date(Health-Linked Survival Benefit)";
    }
# TLB26C Changes end.

  IN MIR-DV-ACT-BNFT-PAID-AMT
   {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
       DisplayOnly;
       Length="15";
       SType = "Currency";
       Label = "Less: Benefits Actually paid out";
    }

  IN  MIR-DV-NET-SCHD-PO-AMT
   {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
      DisplayOnly;
      Length="15";
      SType = "Currency";
      Label = "Net Scheduled Payout Amount";
    }

#MP143D changes ends.

# MP142L changes begin

   IN MIR-AUTO-PREM-CHNG-IND
    {
       DisplayOnly;
       Length = "1";
       SType = "Indicator";
       Label = "Auto Premium Change Rider Indicator";
    }

# MP142L changes end

# MP142Q changes begin

   IN MIR-RENW-PRCES-ACPT-DT
    {
       DisplayOnly;
       Length = "10";
       SType = "Date";
       Label = "Renewal Process Acceptance Date";
    }

# MP142Q changes end
# MP261B XML changes begin
    IN MIR-SPCL-AGT-SIGN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = " Signature Date ";
    }
    IN MIR-NON-FACE-TO-FACE-IND 
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Non Face to Face Flag";
    }
# MP261B XML changes end

# M26106 CR CHANGES STARTS

    
    IN MIR-EARLY-FP-BT-IND 
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Early First Premium BT Flag";
    }

# M26106 CR CHANGES ENDS

#M142S1 changes begins here

    IN MIR-CONN-POL-ID
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Connected Policy Number";
    }
    IN MIR-CVG-CONN-REASN-CD
    {
        DisplayOnly;
        Length = "01";
        DBTableName = "TCVG";
        CodeSource = "DataModel";
        CodeType = "CVG-CONN-REASN-CD";
        SType = "Text";
        Label = "Connected Policy Reason";
     }
    IN MIR-POL-SPLT-DT
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Connected Policy Split Date";
    }
      
#M142S1 changes ends 
#MP168A changes begin

   IN MIR-PLAN-INIT-PMT-TYP-CD
   {
      DisplayOnly;
      Length = "1";            
      CodeSource = "DataModel";
      CodeType = "INIT-PMT-TYP-CD";
      #Q11521 START
      CodeSubType = "PLAN";
      #Q11521 STOP
      SType = "Text";    
      Label = "First premium payment route - Actual";
    }

#MP168A changes end

# C15454 changes begin
     
    IN MIR-DSASTR-LAPS-DT
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Disaster Lapse Date";
    }    
# C15454 changes end
#CHANGES FOR UYS033 STARTS
    IN  MIR-LOAN-REPAY-DUE-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Overloan Repayment Due Date";
    }
#CHANGES FOR UYS033 ENDS
# MP173A Changes begin

    IN MIR-POL-TAX-RESTR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Tax Certificate Not Required Policy";
    }
# MP173A Changes end
#* MP185H Changes Begin

   IN MIR-DV-MAX-PREM-AMT
    {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE     
       DisplayOnly;
       Length = "17";
       SType = "Currency";
       Label = "Maximum Premium(except variable accumulation amount)";
    }
    
   IN MIR-DV-XPRY-DT
    {
       DisplayOnly;
       Length = "10";
       SType = "Date";
       Label = "Expiry Date";
    }
    
#* MP185H Changes End    
# MP176Q changes begin

    IN MIR-POL-BULK-APP-ID
    {
        DisplayOnly;
        Length = "15";
        SType = "Text";
        Label = "Bulk Application ID";
    }
    IN MIR-AGE-LAST-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Age Last Indicator";
    }

# MP176Q changes end
#MP211B changes starts

    IN MIR-CVG-LIEN-DUR-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        SType = "Selection";
        Label = "Lien Duration";
        Index = "1";            
    }
        
#MP211B changes ends

#MP245J CHANGES STARTS HERE

    IN MIR-SSTD-AGE-ADD-DUR-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "SSTD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Substandard Age Duration";
        Index = "1";
    }

#MP245J CHANGES ENDS HERE

#MP226F Changes strats here
    IN MIR-TAX-CERT-ID-CD
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Tax Certificate Identification code";
    }
#MP226F changes ends here

# TDMG07 changes begin
  
    IN MIR-PREM-PMT-CMPLT-IND
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

# C20733 changes begin
  
    IN MIR-POL-PRESC-BIT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Prescription";
    }

# C20733 changes end  
# MP242F changes begin
    IN MIR-CORP-BNFY-INSRD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Corporate Beneficiary Insured Indicator";
    }

# MP242F changes end
#MP245R Changes begin

    IN MIR-RECPT-AMT 
    {
        DisplayOnly;
        CurrencyCode = "MIR-PMT-CRCY-CD";     
        Length="17";
        Signed;
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Actual Paid";             
    }
    IN MIR-DV-JP-XCHNG-RT
    {
        DisplayOnly;
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate from FC to JPY";               
    }
    IN MIR-DV-POL-XCHNG-RT
    {
        DisplayOnly;
        Length = "9";
        Decimals = "4";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange Rate for Policy currency";               
    }
    IN MIR-DV-JP-RECPT-AMT
    {
    
#M271O1 CHANGES START HERE 
#R67482 CHANGE START HERE
#	CurrencyCode = "MIR-PREM-CRCY-CD";
#R67482 CHANGE END HERE
#M271O1 CHANGES END HERE       
        DisplayOnly;
        Length="15";
        Signed;
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Actual Paid Amount in JPY";             
    }
    IN MIR-POL-CRCY-RECPT-AMT 
    {
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";     
        Signed;
        Length="15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Single premium in Policy currency";
    }
    IN MIR-DV-TAX-EXMPT-AMT
    {
        DisplayOnly;
        Signed;
        Length="15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Remaining Tax Exempt Amount";
    }
    IN MIR-INIT-DPOS-INT-PCT
    {
        DisplayOnly;
        Length = "6";
        Decimals = "2";
        DBTableName = "TIR";
        SType = "Percent";
        Label = "Crediting Interest Rate";
    }    
#R10423 CHANGES START HERE  
    IN MIR-CRC-RECV-AMT
    {
#Q60885 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#Q88344 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";      
        CurrencyCode = "MIR-PMT-CRCY-CD";        
#Q88344 CHANGES END HERE
#Q60885 CHANGES END HERE
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Receivable Amount";
    }

    IN MIR-POL-PREM-SUSP-AMT
    {
#Q60877 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#Q60877 CHANGES END HERE
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Premium Suspense";
    }

    IN MIR-OS-DISB-LOAN-AMT
    {
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Outstanding Disbursements - Loan";
    }

    IN MIR-OS-DISB-SRVBEN-AMT
    {
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Outstanding Disbursements - Survival Benifit";
    }

    IN MIR-POL-PDF-SUSP-AMT
    {
        CurrencyCode = "MIR-PMT-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Premium Deposit Fund Suspense";
    }

    IN MIR-POL-DIV-SUSP-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Dividend Suspense";
    }
#M271A7 CHANGES START HERE 

    IN MIR-OS-DISB-RFND-AMT
    {
 
        DisplayOnly;
	Signed;
	Length = "15";
	SType = "Currency";
        Label = "OS Disb - JPY Premium";
    }   
    
#M271A7 CHANGES END HERE    
    
    IN MIR-LOAN-XCES-SHRT-AMT
    {
         CurrencyCode = "MIR-POL-CRCY-CD";
         Signed;
         Length = "13";
         DBTableName = "TPOL";
         SType = "Currency";
         Label = "Excess / Short Loan Interest";
     }

    IN MIR-CSH-RFND-SUSP-AMT
    {
        CurrencyCode = "MIR-PMT-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Cash Refund Suspense";
    }

    IN MIR-DHY-SPREM-SUSP-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Conversion Single Premium Suspense";
    }

   IN MIR-DHY-RSRV-SUSP-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Conversion Reserve Suspense";
    }

   IN MIR-DHY-OS-DISB-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Conversion Outstanding Disbursement Suspense";
    }

    IN MIR-INIT-PREM-SUSP-AMT
    {
#M319O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-PMT-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M319O1 CHANGES END HERE
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Accrual Initial Premium Suspense";
    }
#R10423 CHANGES END HERE  
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
#MP245R CHANGES ENDS HERE
#M271O1 CHANGES START HERE  

    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }
    
#M271O1 CHANGES END HERE   

#MP281F CHANGES START HERE
   
   IN MIR-CANCER-RECOV-PMT-DT
       {
           DisplayOnly;
           Length = "10";
           DBTableName = "TPOL";
           SType = "Date";
           Label = "Planned payment date of Cancer Recovery Support Benefit";
       }
   
#MP281F CHANGES END HERE

#018396 CHANGES START HERE
 
   IN MIR-PAPR-LESS-APP-IND
       {
         DisplayOnly;
         Length = "1";
         SType = "Indicator";
         DBTableName = "TPOL";
         Label = "Paperless Application";
       }
 
#018396 CHANGES END HERE   

# TDM21C changes begin

   IN MIR-NXT-RENW-EFF-DT
       {
         DisplayOnly;
         Length = "10";
         SType = "Date";
         Label = "Next Effective Date";
       } 
        
   IN MIR-NXT-RENW-MPREM-AMT
       {
         DisplayOnly;
         Length = "16";
         CurrencyCode = "MIR-POL-CRCY-CD";
         SType = "Currency";
         Label = "Next Mode Premium";
       }  
    
   IN MIR-LAST-RENW-EFF-DT
       {
         DisplayOnly;    
         Length = "10";
         SType = "Date";
         Label = "Last Effective Date";
       }  
    
   IN MIR-LAST-RENW-MPREM-AMT
       {
         DisplayOnly;
         Length = "16";
         CurrencyCode = "MIR-POL-CRCY-CD";
         SType = "Currency";
         Label = "Last Mode Premium";
       }         
# TDM21C changes end

#FF2003 CHANGES START HERE

    IN MIR-POL-PRVD-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PRVD-TYP-CD";        
        SType = "Text";
        Label = "Policy Provision Type";
    }
#FF2003 CHANGES END HERE

#UY3028 CHANGES START HERE
    IN MIR-BASE-PREM-RENW-AMT
    {
        DisplayOnly;     
        Length = "16";
        SType = "Currency";
        Label = "Base Premium After Renewal";        
    } 
#UY3028 CHANGES END HERE
#27624C CHANGES START HERE
    IN MIR-POL-ECERT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "ePolicy flag";
    }
    
    IN MIR-TRXN-CNFRM-OS-IND
    {   
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Transaction confirmation outstanding flag";   
    }
#27624C CHANGES END HERE


# R14127 changes begin

    IN MIR-DSASTR-SUB-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "DSTSB";
        SType = "Text";
        Label = "Disaster Sub Code";
    }    
# R14127 changes end
# TV2011 changes begin

    IN MIR-DV-TRG-HIT-IND
    {
        DisplayOnly;    
        Length = "1";      
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "DV-TRG-HIT-IND";
        Label = "Target-Hit Transfer to Fixed Whole Life with Accidental Death Rider";      
    }  
    IN MIR-TRG-HIT-CNVR-RT
    {
        DisplayOnly;    
        Length = "3";       
        CodeSource = "DataModel";
        CodeType = "TRG-HIT-CNVR-RT";
        SType = "Text";        
        Label = "Target Value";       
    }    
    IN MIR-TRG-HIT-AMT
    {
        DisplayOnly;     
        Length = "16";
        SType = "Currency";
        Label = "Target Amount";        
    }  
   
    IN MIR-TRG-HIT-CSV-AMT
    {
        DisplayOnly;     
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
    IN MIR-TRG-HIT-BNFT-ACHV-RT
    {
        DisplayOnly;    
        Length = "3";      
# TV201A changes begin        
#        SType = "Text";
        SType = "Percent";
        Decimals = "1";
#TV201A changes ends        
        Label = "Basic Benefit Achievement Rate";      
    }    
    IN MIR-TRG-HIT-BASE-DT 
    {
        DisplayOnly;     
        Length = "10";
        SType = "Text";
        Label = "Base Date";
    }  
# TV2011 changes end
#MP771B changes start here
    IN MIR-DV-DSASTR-SHRT-AMT
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Shortage Amount";
    }
#MP771B changes end here

#RPU014 CHANGES STARTS HERE

     IN MIR-RPU-CVG-DUR
     {
         DisplayOnly;
         Length = "6";
         CodeSource = "EDIT";
         CodeType = "PUDUR";
         Label = "RPU Coverage Duration";
     }

    IN MIR-RPU-REMIT-IND
    {
        DisplayOnly;
        Length = "1";              
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Remittacnce upon Paid-Up";
     }
     
    IN MIR-POL-RPU-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Effective Date of Paid-Up";
    } 
    
    IN MIR-RPU-PLAN-ID
    {
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PUPLN";
        SType = "Text";
        Label = "Contract After Change";
     }   
     
     IN MIR-RPU-FACE-AMT
     {
        DisplayOnly;
        Signed;
        Length = "16";
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Face Amount after Change";
     }
   
    IN MIR-PRE-RPU-PLAN-ID
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
    IN MIR-PRE-RPU-TYP-CD
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

     IN MIR-PRE-RPU-FACE-AMT
     {
        DisplayOnly;
        Signed;
        Length = "16";
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Face Amount before Change";
     }     
       
     
     
    IN MIR-PRE-RPU-MPREM-AMT
    {
        Signed;
        Length = "16";        
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";
        Label = "Premium before Change";
    } 
    
     IN MIR-PRE-RPU-CVG-DUR
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
     
     IN MIR-PRE-RPU-PREM-PMT-DUR
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
#TL0763 CHANGES START HERE
   IN MIR-CSV-ELPSD-DUR
    {
	DisplayOnly;
	SType = "Text";
	Length = "7";	
	Label = "Elapsed Duration of CSV";	
    }
#TL0763 CHANGES END HERE
#TLB26C CHANGES START HERE

    IN MIR-SRV-BNFT-PO-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Survival Benefit Next Payout Effective Date";
    }

    IN MIR-DEFR-SRV-BNFT-AMT
    {
        DisplayOnly;
		CurrencyCode = "MIR-POL-CRCY-CD";
        Signed;
        Length = "10";
        SType = "Currency";
        Label = "Deferred Survival Benefit";
    }

    IN MIR-SRV-BNFT-RT
    {
        DisplayOnly;
        Length = "2";
        SType = "Percent";
        Label = "Survival Benefit Payout Rate";
    } 

    IN MIR-SRV-BNFT-AMT
    {
	    DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        Signed;
        Length = "10";
        SType = "Currency";
        Label = "Survival Benefit Payout Amount";
    }

    IN MIR-SRV-BNFT-MAT-RT
    {
        DisplayOnly;
        Length = "2";
        SType = "Percent";
        Label = "Survival Benefit Payout Rate at Maturity";
    } 

    IN MIR-SRV-BNFT-MAT-AMT
    {
	    DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        Signed;
        Length = "10";
        SType = "Currency";
        Label = "Survival Benefit Payout Amount at Maturity";
    }

#TLB26C CHANGES END HERE

#UY3071 CHANGES START HERE

    IN MIR-DEFR-HLTH-BNFT-AMT
    {
        DisplayOnly;
	CurrencyCode = "MIR-POL-CRCY-CD";
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Deferral Health Congratulatory Benefit Amount";
    }
    IN MIR-DEFR-HLTH-INT-AMT
    {
        DisplayOnly;
	CurrencyCode = "MIR-POL-CRCY-CD";
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Deferral Health Congratulatory Benefit Interest";
    }
    IN MIR-NXT-HLTH-BNFT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Health Congratulatory Benefit Date";
    }    
    
#UY3071 CHANGES END HERE
#UY3060 CHANGES START HRE
    IN MIR-DV-ANNV-PYR-QTY
    {
        DisplayOnly;
        Signed;
        SType = "Text";
        Length = "4";
        Label = "Anniversary Processing Year";
    }
    IN MIR-DV-PREV-DIV-YR-QTY
    {
        DisplayOnly;
        Signed;
        SType = "Text";
        Length ="4";
        Label = "Year Last Declared";
    }
    IN MIR-DIV-DCLR-LTD-AMT
    {
        DisplayOnly;
        Signed;
        SType = "Currency";
        Length ="15";
        Label = "Total Dividends Declared";
    }
    IN MIR-DIV-DCLR-YTD-AMT
    {
        DisplayOnly;
        Signed;
        SType = "Currency";
        Length = "15";
        Label = "Dividends Declared Year To Date";
    }
    IN MIR-POL-DIV-DT 
    {
        DisplayOnly;
        Signed;
        SType = "Date";
        Length = "10";
        Label = "Dividend Last Paid Date";
    }
    IN MIR-POL-OYT-AMT
    {
        DisplayOnly;
        Signed;
        SType = "Currency";
        Length = "15";
        Label = "One Year Term Purchased with Dividend";
    }
    IN MIR-SPCL-DIV-OPT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "SPCL-DIV-OPT-CD";
        SType = "Text";
        Label = "Special Dividend Option";
    }

    IN MIR-POL-DOD-ACUM-AMT
    {
        DisplayOnly;
        Signed;
        SType = "Currency";
        Length = "15";
        Label = "Dividends On Deposit";
    }
    IN MIR-POL-DOD-AVB-AMT
    {
        DisplayOnly;
        Signed;
        SType = "Currency";
        Length = "15";
        Label = "Dividend Average Balance";
    }
    IN MIR-DOD-CRNT-INT-AMT
    {
        DisplayOnly;
        Signed;
        SType = "Currency";
        Length = "15";
        Label = "Dividends On Deposit Interest";
    }
    IN MIR-POL-DOD-INT-RT
    {  
        DisplayOnly;
        Signed;
        SType = "Percent";
        Length = "7";
        Decimals = "5";
        Label = "Current Dividend Interest Rate";
    }
    IN MIR-SURR-DIV-ACUM-AMT
    {
        DisplayOnly;
        Signed;
        SType = "Currency";
        Length = "15";
        Label = "Dividends Surrendered";
    }
    IN MIR-PUA-LTD-FACE-AMT
    {
        DisplayOnly;
        Signed;
        SType = "Currency";
        Length = "15";
        Label = "Total Paid Up Additions";
    }
    IN MIR-PUA-YTD-FACE-AMT
    {
        DisplayOnly;
        Signed;
        SType = "Currency";
        Length = "15";
        Label = "Current Paid Up Additions";
    }
    IN MIR-PUA-CLR-FACE-AMT
    {
        DisplayOnly;
        Signed;
        SType = "Currency";
        Length = "15";
        Label = "Amount Of Paid Up Additions Surrendered";
    }
    IN MIR-PUA-VEST-FACE-AMT
    {
        DisplayOnly;
        Signed;
        SType = "Currency";
        Length = "15";
        Label = "Total Vesting Paid Up Additiopns";
    }
    IN MIR-DEFR-DIV-AMT
    {
        DisplayOnly;
        Signed;
        SType = "Currency";
        Length = "15";
        Label = "Deferred Dividend Amount";
    } 
    IN MIR-DEFR-DIV-INT-AMT
    {
        DisplayOnly;
        Signed;
        SType = "Currency";
        Length = "15";
        Label = "Deferred Dividend Interest Amount";
    }
    IN MIR-DEFR-DIV-DT
    {
        DisplayOnly;
        Signed;
        SType = "Date";
        Length = "10";
        Label = "Deferred Dividend Date";
    }
    IN MIR-DEFR-DIV-INT-CAP-DT
    {
        DisplayOnly;
        Signed;
        SType = "Date";
        Length = "10";
        Label = "Deferred Interest Capitalization Date";
    }
    IN MIR-DIV-CUSTOD-ACUM-AMT
        {
    	DisplayOnly;
    	Signed;
    	Length = "15";
    	SType = "Currency";
    	Label = "Accumulated Dividend on Custody";
    }
    IN MIR-DIV-CUSTOD-INT-AMT
        {
    	DisplayOnly;
    	Signed;
    	Length = "15";
    	SType = "Currency";
    	Label = "Accumulated Interest on Custody";
    }    
    IN MIR-CNVR-ADJ-TOT-DIV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Conversion Adjusted Dividend Amount";
    }
    IN MIR-SURV-DEFR-DIV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Survival Insurance Deferred Amount";
    }  
    IN MIR-SURV-DEFR-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Survival Insurance Deferred Interest Amount";
    }        
    IN MIR-SURV-DEFR-DIV-DT
    {
        DisplayOnly;
        Signed;
        Length = "10";
        SType = "Date";
        Label = "Survival Insurance Deferred Date";
    }            
    IN MIR-SURV-DEFR-INT-DT
    {
        DisplayOnly;
        Signed;
        Length = "10";
        SType = "Date";
        Label = "Survival Insurance Deferred Interest Capitalization Date";
    } 
#UY3060 CHANGES END HERE	
	

#23802I CHANGES START HERE
#PM0279 CHANGES START
#   IN MIR-ORIG-PLAN-ID
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
    IN MIR-ORIG-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Policy Issue date before change ";
    }
    
    IN MIR-ORIG-FACE-AMT
    {
        DisplayOnly;
        Signed;
        Length = "16";               
        SType = "Currency";
        Label = "Face Amount before Change";
      }  
      
    IN MIR-ORIG-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "16";        
        SType = "Currency";
        Label = "Premium before Change";
    }
    
     IN MIR-ORIG-CVG-DUR
      {
        Length = "40";
        CodeSource = "CSOM9D31";
        FilterFields = "1";
        FilterField1 = "MIR-PRE-RPU-PLAN-ID";
        DBTableName = "TCVG";
        SType = "Text";               
        Label = "Period of Insurance before Change";
     }    
     
     IN MIR-ORIG-PREM-PMT-DUR
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
    
#23802I CHANGES ENDS HERE  
#PM0279 CHANGES START
    IN MIR-ORIG-APP-TYP-CD
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
#UYS133 CHANGES START
    IN MIR-PD-GR-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        SType = "Text";
        Label = "PD group size";
    }
#UYS133 CHANGES END
#29746F  CHANGES START
    IN MIR-JPY-PAYO-IND
    {
       DisplayOnly;
       Length = "1";
       SType = "Text";
       Label = "JPY Payout Rider";
     }
    IN MIR-PAYO-BNK-ID
    {
       DisplayOnly;
       Length = "4";
       SType = "Text";
       Label = "Payout Bank Name";
     }
    IN MIR-PAYO-BNK-BR-ID
    {
       DisplayOnly;
       Length = "5";
       SType = "Text";
       Label = "Payout Bank Branch";
     }
    IN MIR-PAYO-BNK-ACCT-TYP-CD
    {
       DisplayOnly;
       Length = "3";
       CodeSource = "EDIT";
       CodeType = "FBACC";
       SType = "Text";
       Label = "Deposit Type";
     }
    IN MIR-PAYO-BNK-ACCT-ID
    {
       DisplayOnly;
       Length = "17";
       SType = "Text";
       Label = "Account No";
     }
    IN MIR-PAYO-BNK-ACCT-HLDR-NM
    {
       DisplayOnly;
       Length = "50";
       SType = "Text";
       Label = "Account Holder Name";
     } 
#29746F CHANGES END

#29746K CHANGES STARTS
     IN MIR-ORIG-FA-AMT
     {
        DisplayOnly;
        Signed;
        Length = "16";               
        SType = "Currency";
        CurrencyCode = "MIR-POL-CRCY-CD";        
        Label = "Original Face";
    }

     IN MIR-CR-INT-RT
     {
         DisplayOnly;
         Length = "6";
         Decimals = "2";
         DBTableName = "TRT";
         SType = "Percent";
         Label = "Crediting Interest Rate (Base)";
     }       

     IN MIR-3CI-CR-INT-RT
     {
         DisplayOnly;
         Length = "6";
         Decimals = "2";
         DBTableName = "TRT";
         SType = "Percent";
         Label = "Crediting Interest Rate (Specific Disease)";
     }       


     IN MIR-ACCT-VAL-INT-RT
     {
         DisplayOnly;
         Length = "6";
         Decimals = "2";
         DBTableName = "TRT";
         SType = "Percent";
         Label = "Rider Interest rate";
     }       

     IN MIR-COST-RT
     {
         DisplayOnly;
         Length = "6";
         Decimals = "2";
         DBTableName = "TRT";
         SType = "Percent";
         Label = "Necessary cost rate";
     }       


     IN MIR-ACUM-VALU-AMT
     {
        DisplayOnly;
        Signed;
        Length = "16";               
        SType = "Currency";
        CurrencyCode = "MIR-POL-CRCY-CD";                
        Label = "Next Installment";
        
    }
    
    IN MIR-CPN-AUTO-PAYO-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
	Label = "Automatic payout rider";
    }
	 
    IN MIR-CPN-AUTO-PAYO-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Automatic payout rider added date";
    }
	
    IN MIR-CPN-AUTO-PAYO-TRMN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Automatic payout rider removed date";
    }
    
 

    IN MIR-PAYO-BNK-NM
    {
       DisplayOnly;
       Length = "75";
       SType = "Text";
       Label = "Bank Name";
    }
    IN MIR-PAYO-BNK-BR-NM
    {
       DisplayOnly;
       Length = "75";
       SType = "TEXT";
       Label = "Bank Branch";
    }
    IN MIR-PAYO-CLI-ID
    {
       DisplayOnly;
       Length = "10";
       SType = "TEXT";
       Label = "Client ID";
    }       
        
       
#29746K CHANGES END
#UY3037 changes begins
    IN MIR-SRVBEN-PAYO-AMT
    {
        DisplayOnly;
        Length = "15";                
        SType = "Currency";
        Label = "This time survival benefit";
    }
    IN MIR-DEFR-SRVBEN-PAYO-AMT
    {
        DisplayOnly;
        Length = "15";                
        SType = "Currency";
        Label = "Deferred amount";
    }
   IN MIR-DEFR-INT-AMT
    {
        DisplayOnly;
        Length = "15";                
        SType = "Currency";
        Label = "Deferred Interest";
    }    
   IN MIR-CSH-LOAN-BAL-AMT
   {
        DisplayOnly;
        Length = "15";                
        SType = "Currency";
        Label = "Policy Loan Balance";
   }
    IN MIR-CSH-LOAN-INT
    {
        DisplayOnly;
        Length = "15";                
        SType = "Currency";
        Label = "Policy Loan Interest";
    } 
    IN MIR-APL-BALANCE-AMT
    {
        DisplayOnly;
        Length = "15";                
        SType = "Currency";
        Label = "APL Balance";
    }    
    IN MIR-APL-INT-AMT
    {
        DisplayOnly;
        Length = "15";                
        SType = "Currency";
        Label = "APL Interest";
    }
    IN MIR-EXPTD-NET-PAY-AMT
    {
        DisplayOnly;
        Length = "15";                
        SType = "Currency";
        Label = "Expected Net Payable amount";
    }
    IN MIR-SRV-NEXT-PO-EFF-DT
    {
        DisplayOnly;
        Length = "10";                
        SType = "Currency";
        Label = "Survival Benefit Next Payout Effective Date";
    }       
#UY3037 changes ENDs
#UY3048 changes starts
    IN MIR-POL-MAT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Maturity Amount";
    }   
    IN MIR-POL-MAT-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Maturity Date";
    }
    IN MIR-MAT-DEFR-INT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Deferment Interest";
    }  
    IN MIR-MAT-NXT-DEFR-INT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Deferment Interest Capitalization date";
    }
    IN MIR-MAT-DEFR-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Deferment maturity Date";
    }	
    IN MIR-POL-MAT-SUB-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        SType = "Text";
        Label = "Policy Sub Status";
    }
    IN MIR-TOT-DEFR-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Total Deferment Amount";
    }  
#UY3048 changes ends
#UY3049 changes starts
    IN MIR-POL-ANTY-STAT-CD
    {
        Length = "1";
        SType = "Text";
        DBTableName = "TPOL";        
        CodeSource = "DataModel";
        CodeType = "POL-ANTY-STAT-CD";
        Label = "Annuity Status";   
    }
#UY3049 changes ends
#UY3121 CHANGES STARTS
    IN MIR-DIV-CRNT-PMT-CTRL
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payment Control";
    }
    IN MIR-DV-CRNT-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "DDividend Amount";
    }
    IN MIR-DV-CRNT-DIV-YR
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Dividend Year";
    }
    IN MIR-DIV-PREV-PMT-CTRL
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payment Control";
    }
    IN MIR-DV-PREV-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividend Amount";
    }
    IN MIR-DV-PREV-DIV-YR
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Dividend Year";
    }
    IN MIR-VEST-DEFR-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Deferral Amount";
    }
    IN MIR-VEST-DIV-INT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated Interest";
    }
    IN MIR-DV-DT-OF-PMT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Date of Payment";
    }
    IN MIR-DV-VEST-AMT-PD
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Vesting Amount Paid (including interest)";
    }
    IN MIR-SPL-DEFR-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Deposit";
    }
    IN MIR-SPL-DIV-INT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated Dividend)";
    }
    IN MIR-SPL-DEFR-DIV-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Date of last deferred processing";
    }
    IN MIR-SPL-DIV-INT-CAP-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Capitilization Date";
    }
    IN MIR-DV-DT-OF-PRCHS
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Date of Purchase";
    }
    IN MIR-DV-FNL-DEFR-PMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Final Deferral Payment";
    }
    IN MIR-DV-FNL-INT-PMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Final Interest Payment";
    }
    IN MIR-WL-DT-OF-PRCHS
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Date of Purchase";
    }
    IN MIR-CUSTOD-DECL-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Declared Date";
    }
    IN MIR-ACUM-DIV-PD
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated dividends paid";
    }
    IN MIR-CNVR-DECL-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Declared Date";
    }
    IN MIR-INCR-SURV-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated dividends paid";
    }
#UY3121 CHANGES ENDS HERE
#UY304A CHANGES START HERE    
    IN MIR-ORIG-CNVR-BAL-AMT
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Original Conversion Balance (UO)";
    }
    IN MIR-NO-ACCDNT-BNFT-AMT
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "No Accident Benefit Amount";
    }
    IN MIR-NO-ACCDNT-PMT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "No Accident Payment (Charge Back) Date";
    }
    IN MIR-ACCUM-OS-AMT
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Accumulated Outstanding Amount";
    }
    IN MIR-ANTY-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-TYP-CD";
        Label = "Annuity Type";
    } 
    IN MIR-ANTY-STYLE-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-STL";
        Label = "Annuity Style";
    }
    IN MIR-ANTY-GUAR-PERI
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Annuity Guarantee Period";
    }
      
    IN MIR-ANTY-PMT-TRM
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "ANTY-PMT-TRM";
        SType = "Selection";
        Label = "Annuity Payment Term";
    }
    IN MIR-ANTY-DEFR-AMT
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Tax Qualified Annuity Deferred amount";
    }
    IN MIR-ANTY-DEFR-INT-AMT
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Tax Qualified Annuity Deferred Interest Amount";
    }
    IN MIR-ANTY-DEFR-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = " Tax Qualified Annuity Deferred deposit date";
    }
    IN MIR-ANTY-DEFR-INT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Tax Qualified Annuity Deferred interest date";
    }
    IN MIR-ANTY-BNK-ID
    {
        Length = "4";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Bank Number";
    }

    IN MIR-ANTY-BNK-NM
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name";
    }

    IN MIR-ANTY-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Branch Number";
    }

    IN MIR-ANTY-BNK-BR-NM
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Name";
    }

    IN MIR-ANTY-BNK-ACCT-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Account Type";
    }

    IN MIR-ANTY-BNK-ACCT-ID
    {
        Length = "17";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Bank Account Number";
    }

    IN MIR-ANTY-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Account Holder Name";
    }
#UY304A CHANGES ENDS HERE
#UY3153 changes starts

    IN MIR-ANTY-TAX-DEFR-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Total Annuity Change Tax Qualified Deferred Amount";
    }	
		
#UY3153 changes ends	
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
#UY3049 changes ends

#M2025F CHANGES START
    IN MIR-JUDG-PCT
    {
        DisplayOnly;    
        Length = "3";       
        CodeSource = "DataModel";
        CodeType = "JUDG-PCT";
        SType = "Text";        
        Label = "Judgement Rate";       
    }
#M2025F CHANGES END

# M2025D changes begin 
    
    IN MIR-PREM-SUSP-CD
    { 
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "PSUCD";
        SType = "Text";
        Label = "FRA Premium Suspension";	
    }
	 
    IN MIR-SUSP-START-YR-MO
    {
        DisplayOnly;
        Length = "07";
        SType = "Date";
        Label = "FRA Suspension Start Year and Month";
    }	
    IN MIR-TOT-PREM-EXP-YEN-AMT
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "FRA Total Premium Expected Yen Amount";
    } 
    IN MIR-SUSP-RESUM-START-YR-MO
    {
        DisplayOnly;
        Length = "07";
        SType = "Date";
        Label = "FRA Premium Suspension Resumption Year and Month";
    }	
# M2025D changes end	
#NVCA05 CHANGES STARTS
    IN MIR-POL-MPREM6-AMT
    {
        CurrencyCode = "MIR-PREM-CRCY-CD"; 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "TRAD Monthly Premium*6";
    }

    IN MIR-POL-MPREM8-AMT    
    {
        CurrencyCode = "MIR-PREM-CRCY-CD"; 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "TRAD Monthly Premium*8";
    }
    
    IN MIR-POL-MPREM2-AMT    
    {
        CurrencyCode = "MIR-PREM-CRCY-CD"; 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "TRAD Semi-Annual/Annual Premium*2";
    }
#NVCA05 CHANGES END HERE


   }
   
