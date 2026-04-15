# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:03 PM EDT

#*******************************************************************************
#*  Component:   BF8002NB-I.s                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016168  602J     have more link show if > 5 messages                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01BL18  PHASE1   Rename LISTBILL FIELDS TO PAYROLL DEDUCTION               *
#*  01CP02  PHASE1   Add Servicing Agent Sales Office and Policy Agent Type    *
#*                   Modify Agent information occurrence from 3 to 2           *
#*  01NB01  PHASE1   Add new fields for Application Upload                     *
#*  B00189  DPK      Removed Owner's Relationship to Insured                   *
#*  B00325  PHASE1   Change label for MIR-AGT-UWG-FAIL-IND                     *
#*  B00269  PHASE1   Added MIR-POL-APP-CALC-DT                                 *
#*  B00404  VAN      Add POL-APP-UPLD-DT                                       *
#*  B00333  VAN      ADD ACCT-HLDR-TYP-CD AND COMB-BILL-IND                    *
#*  B00489  PHASE1   ADD POL-ASIGN-DT                                          *
#*  02BL63  PHASE1   ADD POL-BT-BILL-DLAY-IND                                  *
#*  02GL57  DPK      CWA Suspense Account and Refund                           *
#*  1CNB02  DEL      ADD  MIR-POL-CNVR-TYP-CD and MIR-POL-CNVR-KEY-NUM         *
#*  M00025  MAW      Added MIR-POL-SUB-STAT-CD                                 *
#*  PR006D  WBP      ADD MIR-PROD-APP-TYP-CD                                   *
#*  PR006O  AC       Change  MIR-AGT-UWG-FAIL-IND to Drop-down box             *
#*  PR006Q  FB       ADD OLD (MY KEMPO) POLICY INFORMATION SECTION             *
#*  UCPUPL  SC       UCP Upload, Add MIR-POL-HNDL-CD                           *
#*  MP5001           ADD FIEL-INS-PURP-IND for FIEL changes                    *
#*  MPCR22  CTS      Add Two new fields MIR-CR-FORM-END-DT                     *
#*                   and MIR-ANUTNT-ASIGN-DT                                   *
#*  FEID01  CTS      ADD LIAB-ISS-CUT-OFF-DT for for LCD Issue Date Calculation*
#*  FEID01           - Online Screen Changes                                   *
#*  NWLXML  CTS      Add Designated Policy Issue Indicator and Bulk Remittance *
#*                   Registration Number                                       *
#*  NWLCWA  CTS      ADD POL-OS-ID-IND for policy owner identity verification  *
#*  NWLPSC  CTS      Changes done to increase the length of policy fee and     *
#*  NWLPSC           modal factors                   	                       *
#*  NWLOP3  CTS      ADD NEW FIELD INTIAL CWA PROCESS DATE FOR                 *
#*  NWLOP3           NWL POLICIES PROCESSED THRU PA,WMD AND MGA                *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *    
#*  NWLPNB  CTS      Added MIR-ADV-PMT-DUR for handling Advance payment        *
#*  NWLGAR  CTS      Added MIR-ANN-STMT-NOT-REQ-IND for trad policies          *
#*  MP142L  CTS      Added field Auto Premium Change Rider Indicator           *
#*  MP142Q  CTS      Changes to add a new field - Policy renewal process       *
#*  MP142Q  CTS      accept date                                               *
#*  M142S1  CTS      Added Connected Policy Information new section for        *
#*  M142S1  CTS      Split Policy                                              *
#*  M161CA  CTS      ADDITION OF NEW FIELD INIT-PMT-TYP-CD                     *
#*  MP173A  CTS      ADDED FIELD FOR TAX CERTIFICATE NOT REQUIRED POLICY       *
#*  MP226F  CTS      ADDED NEW FIELD FOR TAX CERTIFICATE IDENTIFICATION CODE   *
#*  MP242F  CTS      ADDED NEW FIELD FOR CORPORATE BENEFICIARY INSURED IND     *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  MP261B  CTS	     ADDED NEW FIELDS FOR ARM2 NON FACE TO FACE                *
#*  MP261A  CTS      ARM2  NEW BUSINESS CHANGES                                * 
#*  M26106  CTS      ADDED NEW FIELD FOR ARMV2 - Early Early First Premium BT Flag         *
#*  M271B2 CTS      ADDED NEW FIELD FOR FRA-SCHEDULED ADVANCED PREMIUM PAYMENT *
#*  M271B2 CTS      FREQUENCY                                                  *
#*  M271O1  CTS      CHANGES DONE AS PART OF FRA                               * 
#*  Q60716  CTS      CHANGES FOR SUNDRY PAYMENT AMOUNT                         *
#*  M319N2 CTS      ADDED NEW FIELD FOR FXWL-YEN BILL AMOUNT REPORT REQUIRED   *
#*  M319N2 CTS      INDICATOR                                                  *
#*  TV2003  CTS      SULV2 NEW BUSINESS CHANGES                                *
#*  UYS092  CTS      ADMIN POLCERT ASSIGNMENT STATUS CHANGES                   *
#*  UYS072  CTS	     NEW BUSINESS FULL KANJI ADDRESS CHANGES                   *
#*  UYS093  CTS      UPDATE OF POLICY REPRINT DATE - ADDED NEW FIELD           *
#*  TLB003  CTS      CHANGES FOR NEW BUSINESS                                  *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  NV3N01  CTS      CHANGES DONE AS PART OF SULV3 
#*  27624C  CTS      ADDED NEW FIELD FOR EPOL FLAG AND TRXN CONFIRMATION       *                            *
#*  29746F  CTS      CHANGES AS PART OF CERBERUS NEW BUSINESS                  *
#*  UY3047  CTS      ADDED NEW FIELDS AS PART OF ANNUITY STREAM 3              *
#*  UY3049  CTS      ANNUITY TRANSITION PROCESSING STREAM 3                    *
#*  M2025F  CTS      ADDITION OF JUDGEMENT RATE FIELD FOR FRA                  *
#*  ON2132  CTS      CHANGES DONE AS PART OF ONTARIO-2132 JIRA                 *
#*******************************************************************************

S-STEP BF8002NB-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-POL-CTRY-CD";
        FocusFrame = "ContentFrame";
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

    INOUT MIR-ACCT-HLDR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-HLDR-TYP-CD";
        SType = "Selection";
        Label = "Bank Account Holder Type";
    }

    INOUT MIR-ANPAYO-1-DEST-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-DEST-CD";
        SType = "Selection";
        Label = "Annuity 1 Destination Registered Code";
    }

    INOUT MIR-ANPAYO-1-MTHD-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-MTHD-CD";
        SType = "Selection";
        Label = "Method to Pay First Annuitant";
    }

    INOUT MIR-ANPAYO-2-DEST-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-DEST-CD";
        SType = "Selection";
        Label = "Annuity 2 Destination Registered Code";
    }

    INOUT MIR-ANPAYO-2-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-MTHD-CD";
        SType = "Selection";
        Label = "Method to Pay Second Annuitant";
    }

    INOUT MIR-APP-FORM-TYP-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "AFTT";
        SType = "Selection";
        Label = "Application Form Type";
    }

    INOUT MIR-AUTO-PREM-PMT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Automatic Premium Payment Indicator";
    }

    INOUT MIR-BILL-LEAD-TIME-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Billing Lead Time";
    }

    INOUT MIR-CLI-ADDR-TYP-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Selection";
        Label = "Client's Address Type";
        Index = "1";
    }

    IN MIR-CLI-BTH-DT-T[5]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table1";
        SType = "Date";
        Label = "Client's Date of Birth";
        Index = "1";
    }

    IN MIR-CLI-CRNT-LOC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Client's Current Location Code";
    }

    INOUT MIR-CLI-ID-T[5]
    {
        Length = "10";
        FieldGroup = "Table1";
        KeyColumn;
        SType = "Text";
        Label = "Client ID";
        Index = "1";
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

    INOUT MIR-CLM-PAYE-CVG-NUM
    {
        Length = "2";
        SType = "Text";
        Label = "Claim Payment Coverage Number";
    }

    INOUT MIR-CLM-PAYE-POL-ID-BASE
    {
        Length = "9";
        SType = "Text";
        Label = "Claim Payment Policy ID";
    }

    INOUT MIR-CLM-PAYE-POL-ID-SFX
    {
        Length = "1";
        SType = "Text";
        Label = "Claim Payment Policy Suffix";
    }

    INOUT MIR-CLM-PAYE-REL-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLM-PAYE-REL-CD";
        SType = "Selection";
        Label = "Relationship of Recipient of Claim Payments";
    }

    INOUT MIR-CLM-PAYO-MTHD-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CLM-PAYO-MTHD-CD";
        SType = "Selection";
        Label = "Claim Payments Method";
    }

    INOUT MIR-COMB-BILL-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMB-BILL-IND";
        SType = "Selection";
        Label = "Combine Billing Indicator";
    }

    INOUT MIR-CONN-OPTL-POL-ID-BASE
    {
        Length = "9";
        SType = "Text";
        Label = "Connected Optional Policy ID";
    }

    INOUT MIR-CONN-OPTL-POL-ID-SFX
    {
        Length = "1";
        SType = "Text";
        Label = "Connected Optional Policy Suffix";
    }

    INOUT MIR-DV-ANUTNT-ADDR-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Selection";
        Label = "Annuitant Client Address Type";
        Index = "1";
    }

    INOUT MIR-DV-ANUTNT-CLI-ID-T[5]
    {
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

    INOUT MIR-DV-ANUTNT-SUB-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "DV-ANUTNT-SUB-CD";
        SType = "Selection";
        Label = "Annuitant Client Relationship Type";
        Index = "1";
    }
#MPCR22 changes starts
    INOUT MIR-CR-FORM-CMPLT-DT-T[5]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TPOLC";
        SType = "Date";
        Label = "Change Request Form Completion Date";
        Index = "1";
    }

    INOUT MIR-ANUTNT-ASIGN-DT-T[5]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TPOLC";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }
#MPCR22 changes Ends here

    INOUT MIR-DV-ASIGN-ADDR-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Selection";
        Label = "Assignee Client Address Type";
        Index = "1";
    }

    INOUT MIR-DV-ASIGN-CLI-ID-T[5]
    {
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

    INOUT MIR-DV-ASIGN-SUB-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "DV-ASIGN-SUB-CD";
        SType = "Selection";
        Label = "Assignee Client Relationship Type";
        Index = "1";
    }

    INOUT MIR-DV-IPARTY-ADDR-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table5";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Selection";
        Label = "Interested Party Client Address Type";
        Index = "1";
    }

    INOUT MIR-DV-IPARTY-CLI-ID-T[5]
    {
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

    INOUT MIR-DV-LBILL-ADDR-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Selection";
        Label = "Payroll Deduction Client Address Type";
    }

    INOUT MIR-DV-LBILL-CLI-ID
    {
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

    INOUT MIR-DV-OWN-SUB-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "DV-OWN-SUB-CD";
        SType = "Selection";
        Label = "Owner Client Relationship Type";
        Index = "1";
    }

    INOUT MIR-DV-PAYR-ADDR-CD
    {
        Length = "51";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Selection";
        Label = "Payor Client Address Type";
    }

    INOUT MIR-DV-PAYR-CLI-ID
    {
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

    INOUT MIR-DV-PAYR-SUB-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-PAYR-SUB-CD";
        SType = "Selection";
        Label = "Payor Client Relationship Type";
    }

    INOUT MIR-DV-SPOUS-ADDR-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Selection";
        Label = "Spouse Client Address Type";
    }

    INOUT MIR-DV-SPOUS-CLI-ID
    {
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

    INOUT MIR-DV-TRST-ADDR-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Selection";
        Label = "Trustee Client Address Type";
        Index = "1";
    }

    INOUT MIR-DV-TRST-CLI-ID-T[5]
    {
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

    INOUT MIR-LINK-POL-ISS-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Policy Linked to Others Indicator";
    }

    INOUT MIR-LOAN-INT-DEDBL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Include Loan Interest in ACB  Indicator";
    }

    INOUT MIR-MODE-FCT-RESTR-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Restrict Billing Mode Factor Indicator";
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
        Label = "Product Name";
    }

    INOUT MIR-PLAN-PERI-PREM-AMT
    {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        Length = "13";
        SType = "Currency";
        Label = "Planned Periodic Premium Amount";
    }

    INOUT MIR-POL-ANPAYO-1-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Amount Payable to the First Annuitant";
    }

    INOUT MIR-POL-ANPAYO-2-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Amount Payable to the Second Annuitant";
    }

    INOUT MIR-POL-ANPAYO-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Effective Date of the Annuity";
    }

    INOUT MIR-POL-ANPAYO-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-ANPAYO-MODE-CD";
        SType = "Selection";
        Label = "Frequency of Annuity Payments";
    }

    INOUT MIR-POL-ANPAYO-PMT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Date of Last Immediate Annuity Payment";
    }

    INOUT MIR-POL-APL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "APL Separate Option for Nonforfieture";
    }

    IN MIR-POL-APP-CMPLT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Application Complete Date";
    }

    INOUT MIR-POL-APP-CTR
    {
        Length = "1";
        SType = "Text";
        Label = "Application Counter";
    }

    INOUT MIR-POL-APP-FORM-ID
    {
        Length = "15";
        SType = "Text";
        Label = "Application Form ID";
    }

    IN MIR-POL-APPL-CTL-CD
    {
        DisplayOnly;
        Length = "2";
        SType = "Hidden";
        Label = "Application System Code";
    }

    INOUT MIR-POL-APP-RECV-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Application Received Date";
    }

    INOUT MIR-POL-APP-CALC-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Illustration Calculation Date";
    }

    INOUT MIR-POL-APP-SIGN-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Application Signed Date";
    }

    INOUT MIR-POL-APP-SIGN-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-APP-SIGN-IND";
        SType = "Selection";
        Label = "Application Signatures Reviewed and Accepted Indicator";
    }

    INOUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Selection";
        Label = "Policy Billing Frequency";
    }

    INOUT MIR-POL-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Selection";
        #M161CA START
        #Label = "Policy Billing Method";
        Label = "Policy Billing Method(Subsequent Premium)";
        #M161CA END
    }

    #M161CA START
    INOUT MIR-INIT-PMT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INIT-PMT-TYP-CD";
        SType = "Selection";
        Label = "Payment Route (First Premium)";
    }
    #M161CA END
    INOUT MIR-POL-BT-BILL-DLAY-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Bank Transfer Billing Delay";
    }

    INOUT MIR-POL-CLI-ASIGN-DT-T[5]
    {
        Length = "10";
        FieldGroup = "Table4";
        SType = "Date";
        Label = "Effective Date of Assignment";
        Index = "1";
    }

    INOUT MIR-POL-CNFD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Policy Confidential Indicator";
    }

    INOUT MIR-POL-CRCY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Selection";
        Label = "Currency Used for Balances";
    }

    INOUT MIR-POL-CRNT-MODE-FCT
    {
        Signed;
        Length = "9";
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

    INOUT MIR-POL-CTRY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Selection";
        Label = "Country of Issue Location";
    }

    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Number of Coverages on This Policy";
    }

    INOUT MIR-POL-DB-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DB-OPT-CD";
        SType = "Selection";
        Label = "Policy Death Benefit Option";
    }

    INOUT MIR-POL-DIV-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        SType = "Selection";
        Label = "Policy Dividend Option";
    }

    INOUT MIR-POL-FINAL-DISP-DT
    {
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

    INOUT MIR-POL-INS-PURP-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "PURP";
        SType = "Selection";
        Label = "Purpose of Insurance";
    }

    INOUT MIR-POL-ISS-DT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-ISS-DT-TYP-CD";
        SType = "Selection";
        Label = "Issue Date Rules";
    }

    INOUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Issue Date of Policy";
    }

    INOUT MIR-POL-ISS-LOC-CD
    {
        Length = "40";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        FilterFields = "1";
        FilterField1 = "MIR-POL-CTRY-CD";
        SType = "Selection";
        Label = "Issue Location of Policy";
    }

    INOUT MIR-POL-MAIL-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Date of Additional Policy Mailing";
    }

    INOUT MIR-POL-MAIL-REASN-CD
    {
        Length = "1";
        SType = "Text";
        Label = "Reason for Additional Policy Mailing";
    }

    INOUT MIR-POL-MEC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-MEC-CD";
        SType = "Selection";
        Label = "Modefied Endowment Contract (MEC) Reason";
    }

    INOUT MIR-POL-MIB-SIGN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-MIB-SIGN-CD";
        SType = "Selection";
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
        Label = "Modal Premium as of Paid To Date";
    }

    INOUT MIR-POL-NFO-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-NFO-CD";
        SType = "Selection";
        Label = "Non-Forfeiture Option";
    }

    IN MIR-POL-NXT-ACTV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date of Next Automatic Process";
    }

    INOUT MIR-POL-OPTL-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-OPTL-CD";
        SType = "Selection";
        Label = "Key/Optional Status";
    }

    INOUT MIR-POL-PAC-DRW-DY
    {
        Length = "2";
        SType = "Number";
        Label = "Billing Draw Day";
    }

    INOUT MIR-POL-PDF-RFND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PDF-RFND-CD";
        SType = "Selection";
        Label = "Status of Policy Deposit Fund (PDF) Funds";
    }

    INOUT MIR-POL-PFEE-FCT
    {
        Signed;
        Length = "9";
        Decimals = "7";
        SType = "Number";
        Label = "Policy Fee Factor";
    }

    INOUT MIR-POL-PFEE-RESTR-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Restrict Billing of Policy Fee";
    }

    INOUT MIR-POL-PNSN-QUALF-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PNSN-QUALF-CD";
        SType = "Selection";
        Label = "Pension Qualification Description";
    }

    INOUT MIR-POL-PNSN-SRC-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PENSR";
        SType = "Selection";
        Label = "Financial Institution which Transfered Funds for Payment";
    }

    INOUT MIR-POL-PREM-DSCNT-PCT
    {
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

    INOUT MIR-POL-REG-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-REG-CD";
        SType = "Selection";
        Label = "Location Policy Registered";
    }

    INOUT MIR-POL-REG-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Date Policy Registered";
    }

    INOUT MIR-POL-REG-FND-SRC-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-FND-SRC-CD";
        SType = "Selection";
        Label = "Source of Funds for Payment";
    }

    INOUT MIR-POL-REINS-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REINS-CD";
        SType = "Selection";
        Label = "Reinsurance Indicator";
    }

    INOUT MIR-POL-RUSH-IND
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-RUSH-IND";
        SType = "Selection";
        Label = "Policy High Priority Indicator";
    }

    INOUT MIR-POL-SFB-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-SFB-CD";
        SType = "Selection";
        Label = "Number of Special Frequency Bills produced Annually";
    }

    INOUT MIR-POL-SNDRY-AMT
    {
#M245B2 CHANGES START HERE    
#Q60716 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#Q60716 CHANGES END HERE
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Sundry Payment Amount";
    }

    INOUT MIR-POL-SNDRY-REASN-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUNRE";
        SType = "Selection";
        Label = "Sundry Payment Reason";
    }

    INOUT MIR-POL-SUPRES-ISS-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Policy Suppress Issue Indicator";
    }

    INOUT MIR-POL-TAX-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-TAX-TYP-CD";
        SType = "Selection";
        Label = "Policy Taxation Type";
    }

    INOUT MIR-POL-TXEMP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-TXEMP-CD";
        SType = "Selection";
        Label = "Tax Exempt Status";
    }

    INOUT MIR-POL-VPO-PU-DUR
    {
        Length = "2";
        SType = "Text";
        Label = "Number of Years Premium Should 'Vanish' By";
    }

    INOUT MIR-PREM-DSCNT-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PDTYP";
        SType = "Selection";
        Label = "Premium Discount Type";
    }

    INOUT MIR-PREM-RECALC-OPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-RECALC-OPT-CD";
        SType = "Selection";
        Label = "Recalculated Premium Option";
    }

    INOUT MIR-REG-SAV-PORTN-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Registered Saving Portion Amount";
    }

    INOUT MIR-REG-SAV-PORTN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-SAV-PORTN-CD";
        SType = "Selection";
        Label = "Registered Savings Portion Code";
    }

    INOUT MIR-REG-SPCL-HNDL-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-SPCL-HNDL-CD";
        SType = "Selection";
        Label = "Special Handling Code for Tax Receipts";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Subsidiary Company ID";
    }

    INOUT MIR-SERV-AGT-ID
    {
        Length = "6";
        SType = "Text";
        Label = "Servicing Agent ID";
    }

    INOUT MIR-SERV-BR-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Selection";
        Label = "Servicing Agent Branch";
    }

    IN MIR-SERV-SO-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "SALE";
        SType = "Text";
        Label = "Servicing Agent Sales Office";
    }

    INOUT MIR-SFB-END-DT
    {
        Length = "10";
        SType = "Date";
        Label = "SFB End Date";
    }

    INOUT MIR-SFB-GP-END-DT-NUM
    {
        Length = "10";
        SType = "Text";
        Label = "SFB Gap End Date";
    }

    INOUT MIR-SFB-GP-STRT-DT-NUM
    {
        Length = "10";
        SType = "Text";
        Label = "SFB Gap Start Date";
    }

    INOUT MIR-SFB-SEMI-MTHLY-DY
    {
        Length = "3";
        SType = "Day";
        Label = "SFB Semi Monthly Alternate Draw Day";
    }

    INOUT MIR-SFB-STRT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "SFB Start Date";
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

    INOUT MIR-TAX-1035-ACB-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Length = "15";
        SType = "Currency";
        Label = "ACB on 1035 Exchange Amount";
    }

    INOUT MIR-TAX-RPT-FREQ-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "TAX-RPT-FREQ-CD";
        SType = "Selection";
        Label = "Tax Reporting Frequency";
    }

    INOUT MIR-UNMTCH-MAIL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Unmatched Mail Indicator";
    }

    INOUT MIR-USER-ID
    {
        Length = "8";
        SType = "Text";
        Label = "User ID";
    }

    INOUT MIR-POL-REFRL-ID
    {
        Length = "6";
        SType = "Text";
        Label = "Referral Code";
    }

    INOUT MIR-ADDR-CORCT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Address Correction Indicator";
    }

    INOUT MIR-CORCT-APP-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Correct Application Indicator";
    }

    INOUT MIR-CNSLT-HO-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Head Office Consultation Request Indicator";
    }

    INOUT MIR-RQST-CNFRM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Pre-Issue Confirmation Indicator";
    }

    INOUT MIR-APP-PROB-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Problems with Application Indicator";
    }

    INOUT MIR-AGT-UWG-FAIL-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CNTRCT-REL-TYP";
        SType = "Selection";
        Label = "Contract Relationship Type";
    }

    INOUT MIR-POL-ASIGN-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Policy Assigned Indicator";
    }

    INOUT MIR-POL-ASIGN-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Policy Assigned Date";
    }

    INOUT MIR-POL-APP-UPLD-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Application Uploaded Date";
    }

    INOUT MIR-POL-CNVR-KEY-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Conversion Key Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
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

    IN MIR-POL-CNVR-TYP-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CNVR-TYP-CD";
        SType = "Text";
        Label = "Conversion Policy Type Code";
    }

    INOUT MIR-AGT-ID-T[2]
    {
        Length = "6";
        FieldGroup = "Table2";
        KeyColumn;
        SType = "Text";
        Label = "Writing Agent ID";
        Index = "1";
    }

    INOUT MIR-POL-AGT-SHR-PCT-T[2]
    {
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table2";
        SType = "Percent";
        Label = "Agent's Share Percentage";
        Index = "1";
    }

    INOUT MIR-POL-AGT-TYP-CD-T[2]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CVG-AGT-TYP-CD";
        SType = "Selection";
        Label = "Agent Type";
        Index = "1";
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

    IN MIR-DV-SERV-AGT-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Servicing Agent Name";
    }

    INOUT MIR-POL-CSH-RFND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-CSH-RFND-CD";
        SType = "Selection";
        Label = "Cash Refund";
    }

    INOUT MIR-POL-SUB-STAT-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        SType = "Selection";
        Label = "Policy Sub Status";
    }

    INOUT MIR-PROD-APP-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";
        SType = "Selection";
        Label = "Product Application Type Code";
    }

    INOUT MIR-SUB-CAT-CD
    {
        Length = "3";
        SType = "Text";
        Label = "Sub Category";
    }

    INOUT MIR-ORIG-POL-ID
    {
        Length = "7";
        SType = "Text";
        Label = "Original Policy Number";
    }

    INOUT MIR-MY-KEMPO-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MY-KEMPO-TYP-CD";
        SType = "Selection";
        Label = "My Kempo Type Code";
    }

    INOUT MIR-ORIG-POL-ISS-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Original Policy Issue Effective Date";
    }

    INOUT MIR-ORIG-POL-DUR
    {
        Length = "2";
        SType = "Text";
        Label = "Original Policy Term";
    }

    INOUT MIR-POL-HNDL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-HNDL-CD";
        SType = "Selection";
        Label = "Policy Handle Type";
    }
    INOUT MIR-FIEL-INS-PURP-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "FIEL(Insurance Purpose)";
    }

#* FEID01 Changes begin

    INOUT MIR-LIAB-STRT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Liability Commencement date";
    }

    INOUT MIR-SUPRES-LCD-CALC-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Suppress LCD Calc";
    }

#* FEID01 changes end

# NWLXML Changes start
    INOUT MIR-DESGNT-ISS-DT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Designated Policy Issue Date flag";
    }

# NWLOP3 Changes start
    INOUT MIR-CWA-PRCES-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Initial CWA Process Date";
    }
# NWLOP3 Changes end

    INOUT MIR-BULK-REMIT-NUM
    {
        Length = "10";
        SType = "Text";
        Label = "Bulk Remittance Registration Number";
    }
# NWLXML Changes end


#* NWLCWA Changes begin
    
    INOUT MIR-POL-OS-ID-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Outstanding Identification";
    }
   
#* NWLCWA changes end
# ISLADM - Changes start here     
    INOUT MIR-SURR-FORM-ACPT-DT
    { 
        Length = "10";
        SType = "Date";
        Label = "Surrender Request Form Acceptance Date";
    }
    
    INOUT MIR-ASIGN-SURR-EFF-DT
    { 
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Assigned Surrender Effective Date for Policy with Assignee";
    }
    
    INOUT MIR-POL-STEP-IN-RIGHT-IND
    { 
        Length = "1";       
        SType = "Indicator";
        Label = "Policy with Step-In Right";
    }    
# UYS092 Starts Ends
    INOUT MIR-POL-ASIGN-STAT-CD
    { 
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-ASIGN-STAT-CD";
        SType = "Selection";
        Label = "Assignment Status";
    }
    INOUT MIR-POL-ASIGN-DEL-DT
    { 
        Length = "10";
        DBTableName = "TPOL";        
        SType = "Date";
        Label = "Assignment Deletion Date";
    }
# UYS092 Changes Ends
# ISLADM - Changes end here

# NWLPNB changes begin

    INOUT MIR-ADV-PMT-YR
    {              
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "PPLSY";
        SType = "Selection";
        Label = "Advance Payment Years and Months";
    }

    INOUT MIR-ADV-PMT-MO
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "PPLSM";
        SType = "Selection";
        Label = "Advance Payment Years and Months";
    } 

# NWLPNB changes end

# NWLGAR changes begin

    INOUT MIR-ANN-STMT-NOT-REQ-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Annual Statement Not Required Policy";
    }

# NWLGAR changes end


# MP173A changes begin

    INOUT MIR-POL-TAX-RESTR-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Tax Certificate Not Required Policy";
    }

# MP173A changes end
# MP142L changes begin

    INOUT MIR-AUTO-PREM-CHNG-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Auto Premium Change Rider Indicator";
    }

# MP142L changes end

# MP142Q changes begin

    INOUT MIR-RENW-PRCES-ACPT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Renewal Process Acceptance Date";
    }

# MP142Q changes end
# MP261B XML changes begin
    INOUT MIR-SPCL-AGT-SIGN-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Signature Date";
    }
    INOUT MIR-NON-FACE-TO-FACE-IND 
    {
        Length = "1";
        SType = "Indicator";
        Label = "Non Face to Face Flag";
    }
# MP261B XML changes end

# MP261A XML changes begin
    IN MIR-FP-BT-UW-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "FP-BT-UW-STAT-CD";
        Label = "First Premium BT UW status";

    }
# MP261A XML changes end

# M26106 CR CHANGES STARTS

    INOUT MIR-EARLY-FP-BT-IND 
    {
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
    INOUT MIR-POL-SPLT-DT
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Connected Policy Split Date";
    }
      
#M142S1 changes ends 
#MP226F Changes starts here
    INOUT MIR-TAX-CERT-ID-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "TCICD";
        SType = "Selection";
        Label = "Tax Certificate Identification Code";
    }
#MP226F Changes ends here
# MP242F changes begin

    INOUT MIR-CORP-BNFY-INSRD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Corporate Beneficiary Insured Indicator";
    }

# MP242F changes end
# MP261A changes start

    INOUT MIR-RBILL-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Restrict Billing Effective Date";
    }

    INOUT MIR-RBILL-END-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Restrict Billing End Date";
    }

    INOUT MIR-RBILL-MISC-1-CD
    {
        Length = "40";
        SType = "Text";
        Label = "Restrict Billing Code #1";
    }

    INOUT MIR-RBILL-MISC-2-CD
    {
        Length = "40";
        SType = "Text";
        Label = "Restrict BIlling Code #2";
    }

    INOUT MIR-RBILL-USER-ID
    {
        Length = "8";
        SType = "Text";
        Label = "User ID that Initiated Restrict Bill";
    }
    INOUT MIR-POL-RBILL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-RBILL-CD";
        SType = "Selection";
        Label = "Restrict NFO or Billing Activity Reason";
    }   
    INOUT MIR-RBILL-DEPT-ID
    {
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        SType = "Selection";
        Label = "Department That Initiated Restrict Billing";
    }
    # MP261A changes end

   # M271B2 changes begin

    INOUT MIR-SCHD-ADV-PMT-DUR
    {
        Length = "3";
        DBTableName = "TPOL";
        CodeSource = "DataModel";
        CodeType = "SCHD-ADV-PMT-DUR";
        SType = "Selection";
        Label = "Scheduled Advanced Premium Payment Frequency";    
    }

# M271B2 changes end

# M319N2 changes begin

    INOUT MIR-YBA-RPT-REQIR-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Yen Bill amount Report required indicator";    
    }

# M319N2 changes end

#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
# TV2003 changes begin

    INOUT MIR-TRG-HIT-CNVR-RT
    {    
        DBTableName = "TPOL";
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "TRG-HIT-CNVR-RT";
        SType = "Selection";
        Label = "Target Rate";
    }
    INOUT MIR-TRG-HIT-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "Target Amount";
    }      
# TV2003 changes end
# UY3064 CHANGES START HERE
    INOUT MIR-MEDIC-CVG-PMT-TYP-CD
    {
        Length = "2";
        DBTableName = "TPOL";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CVG-PMT-TYP-CD";
        SType = "Selection";
        Label = "Payment type for Medical Rider";
    }
# UY3064 CHANGES END HERE
#TLB003 CHANGES START HERE 
    INOUT MIR-POL-BUNDLE-APP-ID
    {
        Length = "15";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Bundle Application ID";
    }

    INOUT MIR-ASSIGN-BUNDLE-APP-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Assign Bundle Application Indicator";    
    }
#27624C changes starts
    INOUT MIR-POL-ECERT-IND
    {
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
#27624C changes ends
    INOUT MIR-PD-GR-TYP-CD
    {
        Length      = "1";
        DBTableName = "TPOL";
        SType       = "Text";
        CodeSource  = "DataModel";
        CodeType    = "PD-GR-TYP-CD";
#UYS133 CHANGES START
#UYS133        Label       = "Product Group Type Code";
        Label       = "PD group size";
#UYS133 CHANGES END
    }
#TLB003 CHANGES END HERE
# UYS072 Changes Begins Here
    INOUT MIR-OWN-KJ-OVRID-ADDR-TXT
    {
    	DBTableName = "TPOL";
        Length = "64";
        SType = "Text";
        Label = "New Business Kanji Samakata-bu:";
    }
    INOUT MIR-CLI-ADDR-ADDL-TXT
    {
        DisplayOnly;
        DBTableName = "TCLIA";
        Length = "64";
        SType = "Text";
        Label = "Samakata-bu (client):";
    }
# UYS072 Changes Ends Here
# UYS093 CHANGES STARTS HERE 
    INOUT MIR-POL-REPRT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Policy Reprint Date";
    }
# UYS093 CHANGES END HERE 
#NV3N01 CHANGES START
    INOUT MIR-MTHLY-STD-PREM-AMT
    {
        CurrencyCode = "MIR-PREM-CRCY-CD";
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Monthly Standard Premium";
    }
#NV3N01 CHANGES END
#UY3047 changes starts
    INOUT MIR-ANTY-CVG-IND
    {
        Length = "1";
        SType = "Selection";
        CodeSource = "DataModel";
        DefaultConstant = "0"; 
        CodeType = "ANTY-RDR-CD";
        Label = "Annuity Rider";
    }
    INOUT MIR-CNFRM-BUNDLE-IND
    {
        Length = "1";
        SType = "Selection";
        DBTableName = "TPOL";
        DefaultConstant = "N"; 
        CodeSource = "DataModel";
        CodeType = "POL-CNFRM-BUND-IND";
        Label = "Caution Bit";
    } 
    INOUT MIR-POL-ANTY-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";        
        CodeSource = "DataModel";
        CodeType = "POL-ANTY-STAT-CD";
        Label = "Annuity Status";
    } 
#UY3047 changes ends

#UY3049 CHANGES START HERE
    INOUT MIR-UNPAY-ANTY-PREM-AMT
    {    
        CurrencyCode = "MIR-POL-CRCY-CD"; 
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Unpaid Annuity Premium Amount";
    }
    INOUT MIR-10-POL-ID
    {
        Length = "10";
        SType = "Hidden";
        Label = "Policy Id";
    }     
    INOUT MIR-STR3-PAYO-IND
    {
        Length = "1";
        SType = "Hidden";
    }
    INOUT MIR-PAYO-CHK-IND
    {
        Length = "1";
        SType = "Hidden";
    }
#UY3049 CHANGES END HERE
#29746F CHANGES START
    INOUT MIR-CPN-PAYE-CLI-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }

    IN MIR-DV-PAYE-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Payee Name";
    }

    INOUT MIR-CPN-PAYE-SUB-TYP-CD
    {
        Length = "1";
        SType = "Selection";
        CodeType = "DV-PAYR-SUB-CD";
        CodeSource = "DataModel";
        Label = "Account Type";
    }

    INOUT MIR-CPN-PAYE-ADDR-TYP-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Selection";
        Label = "Address Type";
    }

    INOUT MIR-CPN-PAYO-JPY-BNFT-IND 
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Selection";
        Label = "JPY Benefit Rider";
    }

    INOUT MIR-CPN-AUTO-PAYO-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Automatic Payout Rider";
    }

    INOUT MIR-CPN-AUTO-PAYO-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Automatic Payout Rider Added Date";
    }

    INOUT MIR-CPN-AUTO-PAYO-TRMN-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Automatic Payout Rider Removed Date";
    }
#29746F CHANGES END

#M2025F CHANGES START
    IN MIR-JUDG-PCT
    {    
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "JUDG-PCT";
        SType = "Text"; 
        Label = "Judgement Value";
    }
#M2025F CHANGES END
# ON2132 CHANGES START HERE
    INOUT MIR-POL-SPCL-IND
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "PSIND";
        SType = "Selection";
        Label = "Policy Special indicator";
    }
# ON2132 CHANGES END HERE

}
