# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:02 PM EDT

#*******************************************************************************
#*  Component:   BF8000AD-O.s                                                  *
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
#*  01PR21  PHASE1   Add Fund Survivorship Benefit Date                        *
#*  01PT02  PHASE1   Add Policy Certificate reprint date and number            *
#*  01NB01  PHASE1   Add new fields for Application Upload                     *
#*  B00325  PHASE1   Change label for MIR-AGT-UWG-FAIL-IND                     *
#*  B00333  VAN      ADD ACCT-HLDR-TYP-CD AND COMB-BILL-IND                    *
#*  B00489  PHASE1   ADD POL-ASIGN-DT                                          *
#*  01BL63  PHASE1   ADD POL-BT-BILL-DLAY-IND                                  *
#*  1CNB02  EKM      ADD MIR-POL-CNVR-KEY-NUM & MIR-POL-CNVR-TYP-CD            *
#*  M00025  MAW      ADD MIR-POL-SUB-STAT-CD                                   *
#*  PR006D  WBP      ADD MIR-PROD-APP-TYP-CD                                   *
#*  PR006O  AC       Change  MIR-AGT-UWG-FAIL-IND to Drop-down box             *
#*  PR0001  ROC      20% MVA Free Withdrawal                                   *
#*  HCL106  HIN/CL   SUPPRESS SURRENDER               (HCL106B)                *
#*                   Add Suppress Surrender indicator MIR-POL-SUPRES-SURR-IND  *
#*  PR006Q  FB       ADD OLD (MY KEMPO) POLICY INFORMATION SECTION             *
#*  P00859  FB       Add MIR-CVG-REINS-IND and MIR-CVG-REINS-CO-ID             *
#*  UCPUPL  SC       UCP Upload, add POL-HNDL-CD                               *
#*  MP5001           Add FIEL-INS-PURP-IND for FIEL changes                    *
#*  MPCR22  CTS      Add Two new fields MIR-CR-FORM-END-DT                     *
#*                   and MIR-ANUTNT-ASIGN-DT                                   *
#*  FEID01  CTS      ADD LIAB-ISS-CUT-OFF-DT for for LCD Issue Date Calculation*
#*  FEID01           - Online Screen Changes                                   *
#*  FEID03  CTS      ADD  New Business Issue Effective Date                    *
#*  BU6884  CTS      CHANGE THE LOOK-UP FOR MIR-CVG-REINS-CO-ID                *
#*  NWLXML  CTS      Add Designated Policy Issue Indicator and Bulk Remittance *
#*                   Registration Number                                       *
#*  NWLCWA  CTS      ADD POL-CHNL-CD for policy channel type, CWA-PRCES-DT     *
#*  NWLCWA               for initial CWA process date and POL-OS-ID-IND for    *
#*  NWLCWA               policy owner identity verification                    *
#*  NWLPSC  CTS      Changes done to increase the length of policy fee and     *
#*  NWLPSC           modal factors                   	                       *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *
#*  NWLPNB  CTS      Added MIR-ADV-PMT-DUR for handling Advance payment        *
#*  NWLGLR  CTS      Add TD Lapse date MIR-DV-TD-LAPS-DT  for Trad Policies    *
#*  NWLGAR  CTS      Added MIR-ANN-STMT-NOT-REQ-IND for trad policies          *
#*  Q01405  CTS      NWLPNB-CHANGES TO REMOVE THE ADVANCE PAYMENT CHANGES FOR  *
#*  Q01405           ADMIN POLICIES                                            *
#*  E11095  CTS      Changes done to add a new field Previous Agent Change     *
#*  E11095           Request Date in the online screen                         *
#*  M117PB CTS       CHANGES TO DISPLAY FUTURE BILLING INFORMATION FOR NWL     *
#*                   POLICIES                                                  *
# *  MP142G  CTS     Changes for future dated sundry amount change             *
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
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  MP261B  CTS	     ADDED NEW FIELDS FOR ARM2 NON FACE TO FACE                *
#*  M26106  CTS	     ADDED NEW FIELD FOR ARM2 Early First Premium BT Flag            *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M319N2  CTS      ADDED NEW FIELD FOR FXWL-YEN BILL AMOUNT REPORT REQUIRED  *
#*  M319N2  CTS      INDICATOR                                                 *
#*  M319O1  CTS      FXWL CURRENCY CODE CHANGES                                * 
#*  MP334C  CTS      ADDED NEW FIELD FOR PREVIOUS POLICY OWNER DEATH DATE      *
#*  P1454A  CTS      CHANGES FOR DOUBLE TAXATION                               *
#*  TV2003  CTS      SULV2 NEW BUSINESS CHANGES                                *
#*  TDMG07  CTS      Screen Changes For NWL                                           *
#*  118579  CTS      CHANGES DONE TO CORRECT THE FIELD PREMIUM PAYMENT         *
#*  118579           DESCRIPTION                                               *
#*  TDM22E  CTS      NEW FIELD ADDITION OF ANNUITY REQUEST FORM                *
#*  TDM22E                ACCEPTANCE DATE                                      *
#*  UYS092  CTS      ADMIN POLCERT ASSIGNMENT STATUS CHANGES                   *
#*  UYS072  CTS	     NEW BUSINESS FULL KANJI ADDRESS CHANGES                   *
#*  UY9307  CTS      UYS093 - CR07 CHANGES ADDITION OF NEW FIELD               *
#*  TDM21C  CTS      POLICY INQUIRY SCREEN CHANGES NWL DAY 4.0                 *
#*  UYS033  CTS      ADDED NEW FIELD OVERLOAN REPAYMENT DUE DATE               *
#*  TLB003  CTS      CHANGES FOR NEW BUSINESS                                  *
#*  TLB015  CTS      RESINSURANCE CHANGES                                      *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  UYSD11  CTS      ADDIITION OF UNISYS MIGRATION TYPE CODE                   *
#*  UY3048  CTS      INGENIUM STREAM 3 MATURITY PROCESSING                     *
#*  UY3064  CTS      Whole Life Premium Payment Completion Changes             *
#*  UY3098  CTS      INGENIUM Set Policy Changes			       *
#*  UY3071  CTS      HEALTH CONGRATULATORY BENEFIT			       *
#*  UY3047  CTS      ADDED NEW FIELDS AS PART OF ANNUITY STREAM 3              *                           *
#*  UY3147  CTS     CONVERSION DHY TO UL                                       *
#*  UY3049  CTS      ANNUITY TRANSITION PROCESSING STREAM 3                    *
#*  UY304A  CTS      CALL CENTER SCREEN ENHANCEMENT                            *
#*  UY3153  CTS      CR148 DHY ANNUITY CSV                                     *
#*  27624C  CTS      ADDIITION OF EPOL,TRANSACTION CONFIRMATION Indicator      *
#*  29746F  CTS      CHANGES AS PART OF CERBERUS NEW BUSINESS                  *
#*  M2025D           CHANGES DONE AS THE PART OF FRA-2025 PROJ                 *
#*  M2025F  CTS      ADDITION OF JUDGEMENT RATE FIELD FOR FRA                  *
#*  NVCA05  CTS      CHANGES DONE AS PART OF ONTARIO
#*  ON2132  CTS      CHANGES DONE AS PART OF ONTARIO-2132 JIRA                 *
#*******************************************************************************

S-STEP BF8000AD-O
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

    IN MIR-ACCT-HLDR-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-HLDR-TYP-CD";
        SType = "Text";
        Label = "Bank Account Holder Type";
    }

    IN MIR-ACRU-CALC-TIME-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACRU-CALC-TIME-CD";
        SType = "Text";
        Label = "Accrual Income Calculation Time Code";
    }

    IN MIR-AGT-ID-T[2]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table2";
        KeyColumn;
        SType = "Text";
        Label = "Writing Agent ID";
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

    IN MIR-BILL-RMND-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BILL-RMND-REASN-CD";
        SType = "Text";
        Label = "Billing Reminder Notice Type";
    }

    IN MIR-POL-BT-BILL-DLAY-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Bank Transfer Billing Delay";
    }

    IN MIR-POL-BT-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "BT Policy First Draw Date";
    }

    IN MIR-CLI-ADDR-TYP-CD-T[5]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Client's Address Type";
        Index = "1";
    }

    IN MIR-CLI-ID-T[5]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table1";
        KeyColumn;
        SType = "Text";
        Label = "Client ID";
        Index = "1";
    }

    IN MIR-CLM-PAYE-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Claim Payment Coverage Number";
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
        Label = "Relationship of Recipient of Claim Payments";
    }

    IN MIR-CLM-PAYO-MTHD-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CLM-PAYO-MTHD-CD";
        SType = "Text";
        Label = "Claim Payments Method";
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

#MPCR22 changes starts
    IN MIR-CR-FORM-CMPLT-DT-T[5]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table2";
        SType = "Date";
        Label = "Change Request Form Completion Date";
        Index = "1";
    }

    IN MIR-ANUTNT-ASIGN-DT-T[5]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table2";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

#P1454A CHANGES START HERE
    IN MIR-ANUTNT-CHNG-EVNT-CD-T[5]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "ANUTNT-CHNG-EVNT-CD";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Annuitant Change Event";
        Index = "1";
    }
#P1454A CHANGES END HERE
#MPCR22 changes Ends here

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
        Length = "51";
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

    IN MIR-ENHC-UWG-APROV-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ENHC-UWG-APROV-IND";
        SType = "Text";
        Label = "Underwriting Approved for Enhancement Indicator";
    }

    IN MIR-ENHC-UWG-REQIR-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ENHC-UWG-REQIR-IND";
        SType = "Text";
        Label = "Underwriting required for Enhancement Indicator";
    }

    IN MIR-GAIN-RPT-TIME-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "GAIN-RPT-TIME-CD";
        SType = "Text";
        Label = "Gain on Disposition Reporting Time Code";
    }

    IN MIR-LOAN-INT-DEDBL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Include Loan Interest in ACB  Indicator";
    }

    IN MIR-LXPCT-CALC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "LXPCT-CALC-CD";
        SType = "Text";
        Label = "Basis of Life Expectancy Factor";
    }

    IN MIR-LXPCT-RECALC-IND
    {
        DisplayOnly;
        Length = "40";
        SType = "Indicator";
        Label = "Annual Life Expectancy Factor Recalculation Indicator";
    }

    IN MIR-MODE-FCT-RESTR-IND
    {
        DisplayOnly;
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

    IN MIR-PAC-REDRW-OPT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PAC-REDRW-OPT-CD";
        SType = "Text";
        Label = "PAC Redraw Option";
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

    IN MIR-POL-ANPAYO-1-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Amount Payable to the First Annuitant";
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
        Label = "Amount Payable to the Second Annuitant";
    }

    IN MIR-POL-ANPAYO-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Effective Date of the Annuity";
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
        Label = "APL Separate Option for Nonforfieture";
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

    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Policy Billing Frequency";
    }

    IN MIR-POL-BILL-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Policy Billed To Date";
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
    IN MIR-POL-CEAS-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Policy Cease Date";
    }

    IN MIR-POL-CEAS-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CEASE";
        SType = "Text";
        Label = "Reason for Policy Termination on Cease Date";
    }

    IN MIR-POL-COMNT-TXT
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Comments/Remarks";
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
        Length = "9";
        Decimals = "7";
        SType = "Number";
        Label = "Policy Mode Factor";
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

    IN MIR-POL-ENHC-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date of Next Enhancement Option";
    }

    IN MIR-POL-ENHC-NELCT-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Non-Elections for Enhancement Benefit";
    }

    IN MIR-POL-FREE-LK-END-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "End of Free Look Date";
    }

    IN MIR-POL-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Issue Date of Policy";
    }

    IN MIR-POL-ISS-LOC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ILOC";
        SType = "Text";
        Label = "Issue Location of Policy";
    }

    IN MIR-POL-LOAN-REPAY-AMT
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
        Label = "Amount Billed for Repayment of Loans";
    }

    IN MIR-POL-MEC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-MEC-CD";
        SType = "Text";
        Label = "Modefied Endowment Contract (MEC) Reason";
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
        Length = "2";
        SType = "Day";
        Label = "Billing Draw Day";
    }

    IN MIR-POL-PAC-REDRW-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date PAC will Re-draw for premiums";
    }

    IN MIR-POL-PAC-RETRN-1-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        SType = "Text";
        Label = "Reason of Returned Cheque";
    }

    IN MIR-POL-PAC-RETRN-1-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date of Returned Cheque";
    }

    IN MIR-POL-PAC-RETRN-2-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        SType = "Text";
        Label = "Reason Most Recent Cheque Returned";
    }

    IN MIR-POL-PAC-RETRN-2-DT
    {
        DisplayOnly;
        Length = "9";
        SType = "Date";
        Label = "Date of Most Recently Returned Cheque";
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
        Length = "9";
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

    IN MIR-POL-RBILL-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-RBILL-CD";
        SType = "Text";
        Label = "Restrict NFO or Billing Activity Reason";
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

    IN MIR-POL-SUPRES-SURR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress Surrender Indicator";
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

    IN MIR-POL-TAX-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-TAX-TYP-CD";
        SType = "Text";
        Label = "Policy Taxation Type";
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

    IN MIR-PREV-SERV-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Previous Servicing Agent";
    }

#* EN11095 CHANGES START
    IN MIR-AGT-CHNG-RQST-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Previous Agent Change Request Date";
    }
#* EN11095 CHANGES END
    IN MIR-RBILL-DEPT-ID
    {
        DisplayOnly;
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        SType = "Text";
        Label = "Department That Initiated Restrict Billing";
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

    IN MIR-RBILL-USER-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "User ID that Initiated Restrict Bill";
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
        Label = "Registered Saving Portion Amount";
    }

    IN MIR-REG-SAV-PORTN-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-SAV-PORTN-CD";
        SType = "Text";
        Label = "Registered Savings Portion Code";
    }

    IN MIR-REG-SPCL-HNDL-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-SPCL-HNDL-CD";
        SType = "Text";
        Label = "Special Handling Code for Tax Receipts";
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

    IN MIR-SERV-AGT-ASIGN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Servicing Agent Assignment Date";
    }

    IN MIR-SERV-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Servicing Agent ID";
    }

    IN MIR-DV-SERV-AGT-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Servicing Agent Name";
    }

    IN MIR-SERV-BR-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Servicing Agent Branch";
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

    IN MIR-SFB-SEMI-MTHLY-DY
    {
        DisplayOnly;
        Length = "3";
        SType = "Day";
        Label = "SFB Semi Monthly Alternate Draw Day";
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

    IN MIR-UL-INIT-PREM-AMT
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
        Label = "Initial Premium Amount";
    }

    IN MIR-UL-LAPS-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Lapse Start Date";
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

    IN MIR-POL-PREM-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-PREM-TYP-CD";
        SType = "Text";
        Label = "Type of Premium Payment";
    }

    IN MIR-SFB-NXT-BILL-AMT
    {
#M245B2 CHANGES START HERE    
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PMT-CRCY-CD";
#M319O1 CHANGES END HERE
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "SFB Next Billing Amount";
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
#MP334C CHANGES START HERE    
    IN MIR-CLI-DTH-DT-T[5]
    {
            DisplayOnly;
            Length = "10";
            FieldGroup = "Table1";
            SType = "Date";
            Label = "Previous policy holder death date";
            Index = "1";
    }
#MP334C CHANGES END HERE     

# TDMG07 changes begin

     IN MIR-PREM-PMT-CMPLT-IND
     {
            DisplayOnly;
            Length = "1";
            SType = "Indicator";
# 118579 changes begin      
#           Label = "Premium Payment Completion";
	    Label = "Base Policy Premium Payment Completion";
# 118579 changes end 
     }
		    
# TDMG07 changes end 

    IN MIR-POL-PD-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Policy Paid to Date";
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

    IN MIR-MPREM-DSCNT-AMT
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
        Label = "Mode Premium Discount Amount";
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

    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Number of Coverages on This Policy";
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

    IN MIR-CLI-CRNT-LOC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Client's Current Location Code";
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

    IN  MIR-POL-CNVR-KEY-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Conversion Key Number";
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

    IN MIR-ORIG-POL-ISS-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Original Policy Issue Effective Date";
    }

    IN MIR-ORIG-POL-DUR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Original Policy Term";
    }

    IN MIR-CVG-REINS-IND
    {
        Length = "3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Reinsured Coverages";
    }

#BU6884 changes start
    IN MIR-CVG-REINS-CO-ID
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

    IN MIR-POL-HNDL-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-HNDL-CD";
        SType = "Text";
        Label = "Policy Hanlde Type";
    }
    IN MIR-FIEL-INS-PURP-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "FIEL(Insurance Purpose)";
    }
#* FEID01 Changes begin

    IN MIR-LIAB-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Liability Commencement date";
    }

    IN MIR-SUPRES-LCD-CALC-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress LCD Calc";
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

#*  NWLXML  CTS      Add Designated Policy Issue Indicator and Bulk Remittance *
#*                   Registration Number                                       *
# NWLXML Changes start
    IN MIR-DESGNT-ISS-DT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Designated Policy Issue Date flag";
    }
    IN MIR-BULK-REMIT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Bulk Remittance Registration Number";
    }
# NWLXML Changes end

#* NWLCWA Changes begin

    IN MIR-POL-OS-ID-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Outstanding Identification";
    }

    IN MIR-CWA-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Initial CWA Process Date";
    }

    IN MIR-POL-CHNL-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-CHNL-CD";
        SType = "Text";
        Label = "Policy Channel Type Code";
    }

#* NWLCWA Changes end
#* UY3098 Changes starts

    IN MIR-SET-POL-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Set Policy ID";
    }
#* UY3098 Changes ends

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
# TDM22E - Changes start here     
    IN MIR-ANTY-RQST-ACPT-DT
    { 
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Annuity Request Form Acceptance Date";
    }    
# TDM22E - Changes end here
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
# Q01405 STARTS HERE
#    IN MIR-ADV-PMT-YR
#    {
#        DisplayOnly;
#        Length = "2";
#        CodeSource = "EDIT";
#        CodeType = "PPLSY";
#        SType = "Text";
#        Label = "Advance Payment Years and Months";
#    }
#
#    IN MIR-ADV-PMT-MO
#    {
#        DisplayOnly;
#        Length = "2";
#        CodeSource = "EDIT";
#        CodeType = "PPLSM";
#        SType = "Text";
#        Label = "Advance Payment Years and Months";
#    }
#
# NWLPNB changes end
# Q01405 ENDS HERE
#* NWLGLR Changes start

IN MIR-DV-TD-LAPS-DT
    {
        DisplayOnly;
        Length = "10";
	SType = "Date";
        Label = "TD Lapse Date";
    }

#* NWLGLR Changes end

# NWLGAR changes begin

    IN MIR-ANN-STMT-NOT-REQ-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Annual Statement Not Required Policy";
    }

# NWLGAR changes end

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
 # M117PB changes end

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
#MP142L changes begin

    IN MIR-AUTO-PREM-CHNG-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Auto Premium Change Rider Indicator";
    }

# MP142L changes end
#MP195A Changes begin
    IN MIR-WIRE-XFER-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Wire Transfer Indicator";
    }    
#MP195A Changes end
# M319N2 changes begin

    IN MIR-YBA-RPT-REQIR-IND
    {   
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Yen Bill amount Report required indicator";   
    }

# M319N2 changes end
# MP142Q changes begin

    IN MIR-RENW-PRCES-ACPT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Renewal Process Acceptance Date";
    }

# MP142Q changes end
# MP168A changes begin

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
        Label = "First Premium payment route - Planned";
    }

# MP168A changes end

# MP261B XML changes begin

    IN MIR-SPCL-AGT-SIGN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Signature Date";
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

#MP173A Changes begin	
    IN MIR-POL-TAX-RESTR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Tax Certificate Not Required Policy";
    }
#MP173A Changes End

# MP176B Changes begin

    IN MIR-POL-BULK-APP-ID
    {
        DisplayOnly;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Bulk Application ID";
    }
# MP176B Changes end
# MP176Q changes begin
       
    IN MIR-AGE-LAST-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Age Last Indicator";
    }
# MP176Q changes end
#MP226F Changes starts here
    IN MIR-TAX-CERT-ID-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "TCICD";
        SType = "Text";
        Label = "Tax Certificate Identification Code";
    }
#MP226F Changes ends here
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

#M271O1 CHANGES START HERE  
     
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE
#M319O1 CHANGES START HERE  
         
    INOUT MIR-PMT-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M319O1 CHANGES END HERE
# TV2003 changes begin

    IN MIR-TRG-HIT-CNVR-RT
    {
        DisplayOnly;    
        Length = "3";
        CodeSource = "DataModel";   
        CodeType = "TRG-HIT-CNVR-RT";   
        SType = "Text"; 
        Label = "Target Rate";
    }  
    
    IN MIR-TRG-HIT-AMT
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Target Amount";
    }     
# TV2003 changes end
#CHANGES FOR UYS033 STARTS
    IN  MIR-LOAN-REPAY-DUE-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Overloan Repayment Due Date";
    }
#CHANGES FOR UYS033 ENDS

#CHANGES FOR UY3071 STARTS
    IN  MIR-NXT-HLTH-BNFT-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Health Congratulatory Benefit Date";
    }
#CHANGES FOR UY3071 ENDS
# UYS072 Changes Begins Here
    IN MIR-OWN-KJ-OVRID-ADDR-TXT
    {
        DisplayOnly;
    	DBTableName = "TPOL";
        Length = "64";
        SType = "Text";
        Label = "New Business Kanji Samakata-bu:";
    }

    IN MIR-CLI-ADDR-ADDL-TXT
    {
        DisplayOnly;
        DBTableName = "TCLIA";
        Length = "64";
        SType = "Text";
        Label = "Samakata-bu (client):";
    }
# UYS072 Changes Ends Here
# UY9307 CHANGES STARTS HERE 
    IN MIR-PREV-POL-REPRT-DT
    {
        Length = "10";
        DisplayOnly;        
        SType = "Date";
        Label = "Previous Policy Reprint Date";
    }
# UY9307 CHANGES END HERE
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
# UY3064 CHANGES START HERE
    INOUT MIR-MEDIC-CVG-PMT-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CVG-PMT-TYP-CD";
        SType = "Text";
        Label = "Payment type for Medical Rider";
    }
# UY3064 CHANGES END HERE
#TLB003 changes starts
    IN MIR-POL-BUNDLE-APP-ID
    {
        DisplayOnly;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Bundle Application ID";
    }
    IN MIR-ASSIGN-BUNDLE-APP-IND
    {   
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Assign Bundle Application ID indicator";   
    }
#27624C changes starts
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
#27624C changes ends
    IN MIR-PD-GR-TYP-CD
    {
        DisplayOnly;
        Length      = "1";
        SType       = "Text";
        CodeSource  = "DataModel";
        CodeType    = "PD-GR-TYP-CD";
#UYS133 CHANGES STARTS HERE
#UYS133        Label       = "Product Group Type Code";
        Label       = "PD group size";
#UYS133 CHANGES ENDS HERE
    }
#TLB003 changes ends
#TLB015 CHANGES STARTS HERE
    IN MIR-REINS-TYP-CD
    {
        Length = "2";
        DisplayOnly;
        CodeSource = "EDIT";
        CodeType = "RETYP";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Reinsurance Type";
    }
#TLB015 CHANGES ENDS HERE
# UYSD11 CHANGES BEGINS HERE
    IN MIR-USYS-MIGR-POL-IND
    {    
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Migrated Policy";
    }
# UYSD11 CHANGES ENDS HERE
#29746F CHANGES START HERE
    IN MIR-CPN-PAYE-CLI-ID
    {
        DisplayOnly;
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

    IN MIR-CPN-PAYE-SUB-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-PAYR-SUB-CD";
        SType = "Text";
        Label = "Account Type";
    }

    IN MIR-CPN-PAYE-ADDR-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Address Type";
    }

    IN MIR-CPN-PAYO-JPY-BNFT-IND
    {    
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Text";
        Label = "JPY Benefit Rider";
    }

    IN MIR-CPN-AUTO-PAYO-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Automatic payout rider";
    }

    IN MIR-CPN-AUTO-PAYO-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Automatic payout rider added date";
    }

    IN MIR-CPN-AUTO-PAYO-TRMN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Automatic payout rider removed date";
    }
#29746F CHANGES END HERE

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
#UY3047 changes starts
    IN MIR-ANTY-CVG-IND
    {
        Length = "1";
        SType = "Selection";
        CodeSource = "DataModel";
        DefaultConstant = "0"; 
        CodeType = "ANTY-RDR-CD";
        Label = "Annuity Rider";
    }
    IN MIR-CNFRM-BUNDLE-IND
    {
        Length = "1";
        SType = "Text";       
        CodeSource = "DataModel";
        CodeType = "POL-CNFRM-BUND-IND";
        Label = "Caution Bit";
    } 
    IN MIR-POL-ANTY-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "POL-ANTY-STAT-CD";
        Label = "Annuity Status";
    } 
#UY3047 changes ends
#UY3147 changes starts
    IN MIR-CNVR-APP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Conversion Application Date";
    }
    IN MIR-CNVR-ELIG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Conversion Eligibile Date";
    }
    IN MIR-CNVR-BASE-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Conversion Calculation Base Date";
    }
    IN MIR-CNVR-BAL-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Conversion Balance";
    }  	
    IN MIR-CRNT-CNVR-BAL-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Current Conversion Balance";
    }  	
#UY3147 changes ends	

#UY3049 changes starts

    IN MIR-ACUM-PAYO-ANTY-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Annuity In-Payment indicator";
    }
	
    IN MIR-UNPAY-ANTY-PREM-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Unpaid Annuity Premium Amount";
    }		
		
#UY3049 changes ends	
#CHANGES FOR UY304A STARTS
    IN  MIR-DEFR-HLTH-CNGLR-BNFT-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Deferred Health Congratulation Benefit Date";
    }
    IN MIR-RENW-DENIAL-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Renewal Denial Indicator";
    }
    IN MIR-YRLY-APRT-PRM
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Yearly Appropriation Premium (Discount)";
    }
    IN MIR-CNVR-BAL-DUR
    {
        DisplayOnly;
        Length = "4";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Conversion Residual Period (U)";
    }
    IN MIR-CNVR-DSCNT-DUR
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Conversion Discount Duration (U0)";
    }
    IN MIR-DEFR-DUR
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Deferment Duration";
    }
    IN MIR-POL-PRT-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Certification Creation Date";
    }
#CHANGES FOR UY304A ENDS
#UY3153 changes starts
    IN MIR-ANN-CNVR-BAL-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Annuity Conversion Balance Amount";
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


# M2025F changes begin

    IN MIR-JUDG-PCT
    {
        DisplayOnly;    
        Length = "3";
        CodeSource = "DataModel";   
        CodeType = "JUDG-PCT";   
        SType = "Text"; 
        Label = "Judgement Rate";
    }     

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
# NVCA05 changes START
    IN MIR-ADV-PMT-YR
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "PPLSY";
        SType = "Text";
        Label = "Advance Payment Years and Months";
    }

    IN MIR-ADV-PMT-MO
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "PPLSM";
        SType = "Text";
        Label = "Advance Payment Years and Months";
    }


    IN MIR-DV-ADV-PMT-AMT
    {
      CurrencyCode = "MIR-PMT-CRCY-CD";
        DisplayOnly;
        Length = "19";
        SType = "Currency";
        Label = "Total Premium received amount (including initial premium)";
    }
# NVCA05 changes END
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
