# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:02 PM EDT

#*******************************************************************************
#*  Component:   BF8000-O.s                                                    *
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
#*  B00325  PHASE1   Change label for MIR-AGT-UWG-FAIL-IND                     *
#*  B00333  VAN      ADD ACCT-HLDR-TYP-CD AND  COMB-BILL-IND                   *
#*  02GL57  DPK      CWA Suspense Account and Refund                           *
#*  M00025  MAW      ADD MIR-POL-SUB-STAT-CD                                   *
#*  PR006O  AC       Change  MIR-AGT-UWG-FAIL-IND to Drop-down box             *
#*  NWLPSC  CTS      Changes done to increase the length of policy fee and     *
#*  NWLPSC           modal factors                   	                       *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *    
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  TDM22E  CTS      NEW FIELD ADDITION OF ANNUITY REQUEST FORM                *
#*  UYS072  CTS	     NEW BUSINESS FULL KANJI ADDRESS CHANGES                   *
#*  FF2003  CTS      ADDED NEW FIELD POLICY PROVISION TYPE FOR FFF SMBC CHANGES*
#*  27624C  CTS      ADDED NEW FIELD FOR EPOL FLAG AND TRXN CONFIRMATION       *
#*  ON2132  CTS      CHANGES DONE AS PART OF ONTARIO-2132 JIRA                 *
#*******************************************************************************

S-STEP BF8000-O
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
        Label = "Writing Agent Number";
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

    IN MIR-BILL-RMND-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BILL-RMND-REASN-CD";
        SType = "Text";
        Label = "Billing Reminder Notice Type";
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
        CodeSource = "CTLC";
        CodeType = "LOCCAT";
        SType = "Text";
        Label = "Client's Current Location";
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

    IN MIR-ENHC-UWG-APROV-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ENHC-UWG-APROV-IND";
        SType = "Text";
        Label = "Underwriting Approved for Enhancement";
    }

    IN MIR-ENHC-UWG-REQIR-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ENHC-UWG-REQIR-IND";
        SType = "Text";
        Label = "Underwriting required for Enhancement";
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
        Label = "Annual Life Expectancy Factor Recalculation Code";
    }

    IN MIR-MODE-FCT-RESTR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Mode Factor Restrict Indicator";
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
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Policy Billing Mode";
    }

    IN MIR-POL-BILL-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Policy Billed to Date";
    }

    IN MIR-POL-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Policy Billing Method";
    }

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

    IN MIR-POL-INS-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        SType = "Text";
        Label = "Type of Insurance of the Base Coverage";
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
      #  CurrencyCode = "MIR-POL-CRCY-CD";
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
        Length = "2";
        SType = "Number";
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

    IN MIR-POL-PD-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Policy Paid to Date";
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

    IN MIR-POL-PREM-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-PREM-TYP-CD";
        SType = "Text";
        Label = "Type of Premium Payment";
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
        CurrencyCode = "MIR-POL-CRCY-CD";
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

    IN MIR-PREV-SERV-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Previous Servicing Agent";
    }

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
        Label = "Restrict Billing Code 1";
    }

    IN MIR-RBILL-MISC-2-CD
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Restrict Billing Code 2";
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

    IN MIR-UL-INIT-PREM-AMT
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE
     #  CurrencyCode = "MIR-POL-CRCY-CD";
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
     
    IN MIR-POL-CSH-RFND-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-CSH-RFND-CD";
        SType = "Text";
        Label = "Cash Refund:";
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


#M271O1 CHANGES START HERE  
     
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
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
   
# 27624C Changes start Here
    IN MIR-POL-ECERT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "ePolicy Flag";
    }

    IN MIR-TRXN-CNFRM-OS-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Transaction confirmation outstanding flag";
    }
# 27624C Changes end Here  
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

