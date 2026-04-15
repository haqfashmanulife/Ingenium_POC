# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:14 PM EDT

#*******************************************************************************
#*  Component:   AppBF8002-P.p                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01NB01  MCL      New App Entry Flow - add field MIR-POL-AGT-TYP-CD-T       *
#*  B00189  DPK      Removed Owner's Relationship to Insured                   *
#*  B00238  PHASE1   Add new (TPOL)fields for Application Upload               *
#*  B00269  PHASE1   Add new field MIR-POL-APP-CALC-DT                         *
#*  B00404  VAN      Add POL-APP-UPLD-DT                                       *
#*  B00333  VAN      ADD ACCT-HLDR-TYP-CD AND COMB-BILL-IND                    *
#*  B00489  WBP      ADD POL-ASIGN-DT                                          *
#*  B00626  WBP      ADD POL-MISC-SUSP-AMT                                     *
#*  02BL63  KRW      ADD POL-BT-BILL-DLAY-IND                                  *
#*  02GL57  DPK      CWA Suspense Account and Refund                           *
#*  02PR62  DPK      Joint to Single Change                                    *
#*  1CNB02  EKM      Added MIR-POL-CNVR-TYP-CD, MIR-POL-CNVR-KEY-NUM           *
#*                   and MIR-POL-FINAL-DISP-DT                                 *
#*  M00025  MAW      ADD MIR-POL-SUB-STAT-CD                                   *
#*  PR006D  WBP      ADD MIR-PROD-APP-TYP-CD                                   *
#*  PR006O  AC       Change  MIR-AGT-UWG-FAIL-IND to Drop-down box             *
#*  PR006Q  FB       ADD OLD (MY KEMPO) POLICY INFORMATION SECTION             *
#*  NWLPSC  CTS      Changes done to increase the length of policy fee and     *
#*  NWLPSC           modal factors                   	                       *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *    
#*  EN9547  CTS      COMMENTED OUT THE VARIABLE MIR-POL-FINAL-DISP-DT IN ONE   *
#*                   PLACE DUE TO THE DUPLICATE DECLARATION                    *    
#*  M142S1  CTS      CHANGES TO HANDLE SPLIT POLICY                            *
#*  M161CA  CTS      ADDITION OF NEW FIELD INIT-PMT-TYP-CD                     *
#*  MP168A  CTS      ADDITION OF NEW FIELD PLAN-INIT-PMT-TYP-CD                *
#*  Q11521  CTS      ADDED SUB TYPE CODE FOR PLAN-INIT-PMT-TYP-CD              *
#*                                                                             *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  NV3N01  CTS      CHANGES DONE AS PART OF SULV3                             *
#*  29746F  CTS      CHANGES AS PART OF CERBERUS NEW BUSINESS                  *
#*  NVCN01  CTS      CHANGES DONE AS PART OF ONTARIO XML UPLOAD                *
#*  ON2132  CTS      CHANGES DONE AS PART OF ONTARIO-2132 JIRA                 *
#*******************************************************************************

P-STEP AppBF8002-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8002";
        BusinessFunctionName = "Policy Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM8002";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
    
    
    INOUT MIR-ACCT-HLDR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-HLDR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Bank Account Holder Type";
    }

    INOUT MIR-ACRU-CALC-TIME-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACRU-CALC-TIME-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Accrual Income CalculationTime Code";
    }

    INOUT MIR-AGT-ID-T[3]
    {
        Length = "6";
        FieldGroup = "Table3";
        KeyColumn;
        DBTableName = "TPOLW";
        SType = "Text";
        Label = "Writing Agent ID";
        Index = "1";
    }

    INOUT MIR-POL-AGT-TYP-CD-T[3]
    {
        Length = "1";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "CVG-AGT-TYP-CD";
        SType = "Selection";
        Label = "Agent Type";
        Index = "1";
    }
 
    INOUT MIR-ANPAYO-1-DEST-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-DEST-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Annuity 1 Destination Registered Code";
    }

    INOUT MIR-ANPAYO-1-MTHD-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-MTHD-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Method to Pay First Annuitant";
    }

    INOUT MIR-ANPAYO-2-DEST-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-DEST-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Annuity 2 Destination Registered Code";
    }

    INOUT MIR-ANPAYO-2-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-MTHD-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Method to Pay Second Annuitant";
    }

    INOUT MIR-APP-FORM-TYP-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "AFTT";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Application Form Type";
    }

    INOUT MIR-AUTO-PREM-PMT-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Automatic Premium Payment Indicator";
    }

    INOUT MIR-BILL-LEAD-TIME-DUR
    {
        Length = "3";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billing Lead Time";
    }

    INOUT MIR-BILL-RMND-REASN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BILL-RMND-REASN-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Billing Reminder Notice Type";
    }

    INOUT MIR-CLI-ADDR-TYP-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "TPOLC";
        SType = "Selection";
        Label = "Client's Address Type";
        Index = "1";
    }

    INOUT MIR-CLI-ID-T[5]
    {
        Length = "10";
        FieldGroup = "Table1";
        KeyColumn;
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Client ID";
        Index = "1";
    }

    INOUT MIR-CLM-PAYE-CVG-NUM
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Claim Payment Coverage Number";
    }

    INOUT MIR-CLM-PAYE-POL-ID-BASE
    {
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Claim Payment Policy ID";
    }

    INOUT MIR-CLM-PAYE-POL-ID-SFX
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Claim Payment Policy Suffix";
    }

    INOUT MIR-CLM-PAYE-REL-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLM-PAYE-REL-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Relationship of Recipient of Claim Payments";
    }

    INOUT MIR-CLM-PAYO-MTHD-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CLM-PAYO-MTHD-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Claim Payments Method";
    }

    INOUT MIR-COMB-BILL-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMB-BILL-IND";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Combine Billing Indicator";
    }
                                    
    INOUT MIR-CONN-OPTL-POL-ID-BASE
    {
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Connected Optional Policy ID";
    }

    INOUT MIR-CONN-OPTL-POL-ID-SFX
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Connected Optional Policy Suffix";
    }

    INOUT MIR-DV-ANUTNT-ADDR-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Annuitant Client Address Type";
        Index = "1";
    }

    INOUT MIR-DV-ANUTNT-CLI-ID-T[5]
    {
        Length = "10";
        FieldGroup = "Table2";
        KeyColumn;
        DBTableName = "Derived";
        SType = "Text";
        Label = "Annuitant Client ID";
        Index = "1";
    }

    INOUT MIR-DV-ANUTNT-SUB-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "DV-ANUTNT-SUB-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Annuitant Client Relationship Type";
        Index = "1";
    }

    INOUT MIR-DV-ASIGN-ADDR-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Assignee Client Address Type";
        Index = "1";
    }

    INOUT MIR-DV-ASIGN-CLI-ID-T[5]
    {
        Length = "10";
        FieldGroup = "Table4";
        KeyColumn;
        DBTableName = "Derived";
        SType = "Text";
        Label = "Assignee Client ID";
        Index = "1";
    }

    INOUT MIR-DV-ASIGN-SUB-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "DV-ASIGN-SUB-CD";
        DBTableName = "Derived";
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
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Interested Party Client Address Type";
        Index = "1";
    }

    INOUT MIR-DV-IPARTY-CLI-ID-T[5]
    {
        Length = "10";
        FieldGroup = "Table5";
        KeyColumn;
        DBTableName = "Derived";
        SType = "Text";
        Label = "Interested Party Client ID";
        Index = "1";
    }

    INOUT MIR-DV-LBILL-ADDR-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "List Bill Client Address Type";
    }

    INOUT MIR-DV-LBILL-CLI-ID
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "List Bill Client ID";
    }

    INOUT MIR-DV-OWN-SUB-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "DV-OWN-SUB-CD";
        DBTableName = "TPOLC";
        SType = "Selection";
        Label = "Owner Client Relationship Type";
        Index = "1";
    }

    INOUT MIR-DV-PAYR-ADDR-CD
    {
        Length = "51";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Payor Client Address Type";
    }

    INOUT MIR-DV-PAYR-CLI-ID
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payor Client ID";
    }

    INOUT MIR-DV-PAYR-SUB-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-PAYR-SUB-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Payor Client Relationship Type";
    }

    INOUT MIR-DV-SPOUS-ADDR-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Spouse Client Address Type";
    }

    INOUT MIR-DV-SPOUS-CLI-ID
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Spouse Client ID";
    }

    INOUT MIR-DV-TRST-ADDR-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Trustee Client Address Type";
        Index = "1";
    }

    INOUT MIR-DV-TRST-CLI-ID-T[5]
    {
        Length = "10";
        FieldGroup = "Table6";
        KeyColumn;
        DBTableName = "Derived";
        SType = "Text";
        Label = "Trustee Client ID";
        Index = "1";
    }

    INOUT MIR-ENHC-UWG-APROV-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ENHC-UWG-APROV-IND";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Underwriting Approved for Enhancement Indicator";
    }

    INOUT MIR-ENHC-UWG-REQIR-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ENHC-UWG-REQIR-IND";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Underwriting required for Enhancement Indicator";
    }

    INOUT MIR-GAIN-RPT-TIME-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "GAIN-RPT-TIME-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Gain on Disposition Reporting Time Code";
    }

    INOUT MIR-LINK-POL-ISS-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Policy Linked to Others Indicator";
    }

    INOUT MIR-LOAN-INT-DEDBL-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Include Loan Interest in ACB  Indicator";
    }

    INOUT MIR-LXPCT-CALC-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "LXPCT-CALC-CD";
        DBTableName = "TPOLT";
        SType = "Selection";
        Label = "Basis of Life Expectancy Factor";
    }

    INOUT MIR-LXPCT-RECALC-IND
    {
        Length = "40";
        DBTableName = "TPOLT";
        SType = "Indicator";
        Label = "Annual Life Expectancy Factor Recalculation Indicator";
    }

    INOUT MIR-MODE-FCT-RESTR-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Restrict Billing Mode Factor Indicator";
    }

    INOUT MIR-NXT-ACTV-TYP-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "NXT-ACTV-TYP-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Type of Next Automatic Activity";
    }

    INOUT MIR-PAC-REDRW-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PAC-REDRW-OPT-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "PAC Redraw Option";
    }

    INOUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Product Name";
    }

    INOUT MIR-PLAN-PERI-PREM-AMT
    {
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Planned Periodic Premium Amount";
    }

    INOUT MIR-POL-AGT-SHR-PCT-T[3]
    {
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table3";
        DBTableName = "TPOLW";
        SType = "Percent";
        Label = "Agent's Share Percentage";
        Index = "1";
    }

    INOUT MIR-POL-ANPAYO-1-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Amount Payable to the First Annuitant";
    }

    INOUT MIR-POL-ANPAYO-2-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Amount Payable to the Second Annuitant";
    }

    INOUT MIR-POL-ANPAYO-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Effective Date of the Annuity";
    }

    INOUT MIR-POL-ANPAYO-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-ANPAYO-MODE-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Frequency of Annuity Payments";
    }

    INOUT MIR-POL-ANPAYO-PMT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Date of Last Immediate Annuity Payment";
    }

    INOUT MIR-POL-APL-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "APL Separate Option for Nonforfieture";
    }

    INOUT MIR-POL-APP-CTR
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Application Counter";
    }

    INOUT MIR-POL-APP-FORM-ID
    {
        Length = "15";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Application Form ID";
    }

    INOUT MIR-POL-APPL-CTL-CD
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Application System Code";
    }

    INOUT MIR-POL-APP-RECV-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Application Received Date";
    }

    INOUT MIR-POL-APP-CALC-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Illustration Calculation Date";
    }

    INOUT MIR-POL-APP-SIGN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Application Signed Date";
    }

    INOUT MIR-POL-APP-SIGN-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-APP-SIGN-IND";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Application Signatures Reviewed and Accepted Indicator";
    }

    INOUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Policy Billing Frequency";
    }

    INOUT MIR-POL-BILL-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Billed To Date";
    }

    INOUT MIR-POL-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
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
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Payment Route (First Premium)";
    }
    #M161CA END
    #MP168A START
    INOUT MIR-PLAN-INIT-PMT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        #Q11521 START
        #CodeType = "PLAN-INIT-PMT-TYP-CD";
        CodeType = "INIT-PMT-TYP-CD";
        CodeSubType = "PLAN";
        #Q11521 STOP
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "First Premium Payment Route(Planned)";
    }
    #MP168A END
    INOUT MIR-POL-BT-BILL-DLAY-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Bank Transfer Billing Delay";
    }

    INOUT MIR-POL-CEAS-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Cease Date";
    }

    INOUT MIR-POL-CEAS-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CEASE";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Reason for Policy Termination on Cease Date";
    }

    INOUT MIR-POL-CLI-ASIGN-DT-T[5]
    {
        Length = "10";
        FieldGroup = "Table4";
        DBTableName = "TPOLC";
        SType = "Date";
        Label = "Effective Date of Assignment";
        Index = "1";
    }

    INOUT MIR-POL-CNFD-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Policy Confidential Indicator";
    }

    INOUT MIR-POL-COMNT-TXT
    {
        MixedCase;
        Length = "50";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Comments/Remarks";
    }

    INOUT MIR-POL-CRCY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Currency Used for Balances";
    }

    INOUT MIR-POL-CRNT-MODE-FCT
    {
        Signed;
        Length = "9";
        Decimals = "7";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Policy Mode Factor";
    }

    INOUT MIR-POL-CTRY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Country of Issue Location";
    }

    INOUT MIR-POL-DB-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DB-OPT-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Policy Death Benefit Option";
    }

    INOUT MIR-POL-DIV-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Policy Dividend Option";
    }

    INOUT MIR-POL-ENHC-CHNG-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Date of Next Enhancement Option";
    }

    INOUT MIR-POL-ENHC-NELCT-QTY
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Non-Elections for Enhancement Benefit";
    }
    
#EN9547 CHANGES START HERE
#    INOUT MIR-POL-FINAL-DISP-DT
#    {
#        Length = "10";
#        DBTableName = "TPOL";
#        SType = "Date";
#        Label = "Final Disposition Date";
#    }
#EN9547 CHANGES END HERE

    INOUT MIR-POL-FREE-LK-END-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "End of Free Look Date";
    }

    INOUT MIR-POL-INS-PURP-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "PURP";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Purpose of Insurance";
    }

    INOUT MIR-POL-ISS-DT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-ISS-DT-TYP-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Issue Date Rules";
    }

    INOUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Issue Date of Policy";
    }

    INOUT MIR-POL-ISS-LOC-CD
    {
        Length = "40";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Issue Location of Policy";
    }

    INOUT MIR-POL-LOAN-REPAY-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Amount Billed for Repayment of Loans";
    }

    INOUT MIR-POL-MAIL-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Date of Additional Policy Mailing";
    }

    INOUT MIR-POL-MAIL-REASN-CD
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Reason for Additional Policy Mailing";
    }

    INOUT MIR-POL-MEC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-MEC-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Modefied Endowment Contract (MEC) Reason";
    }

    INOUT MIR-POL-MIB-SIGN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-MIB-SIGN-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "MIB Signature Received";
    }

    INOUT MIR-POL-NFO-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-NFO-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Non-Forfeiture Option";
    }

    INOUT MIR-POL-OPTL-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-OPTL-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Key/Optional Status";
    }

    INOUT MIR-POL-PAC-DRW-DY
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Billing Draw Day";
    }

    INOUT MIR-POL-PAC-REDRW-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Date PAC will Re-draw for premiums";
    }

    INOUT MIR-POL-PAC-RETRN-1-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Reason of Returned Cheque";
    }

    INOUT MIR-POL-PAC-RETRN-1-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Date of Returned Cheque";
    }

    INOUT MIR-POL-PAC-RETRN-2-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Reason Most Recent Cheque Returned";
    }

    INOUT MIR-POL-PAC-RETRN-2-DT
    {
        Length = "9";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Date of Most Recently Returned Cheque";
    }

    INOUT MIR-POL-PDF-RFND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PDF-RFND-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Status of Policy Deposit Fund (PDF) Funds";
    }

    INOUT MIR-POL-PFEE-FCT
    {
        Signed;
        Length = "9";
        Decimals = "7";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Policy Fee Factor";
    }

    INOUT MIR-POL-PFEE-RESTR-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Restrict Billing of Policy Fee";
    }

    INOUT MIR-POL-PNSN-QUALF-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PNSN-QUALF-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Pension Qualification Description";
    }

    INOUT MIR-POL-PNSN-SRC-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PENSR";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Financial Institution which Transfered Funds for Payment";
    }

    INOUT MIR-POL-PREM-DSCNT-PCT
    {
        Signed;
        Length = "5";
        Decimals = "3";
        DBTableName = "TPOL";
        SType = "Percent";
        Label = "Policy Discount Percentage Applied to Premium";
    }

    INOUT MIR-POL-RBILL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-RBILL-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Restrict NFO or Billing Activity Reason";
    }

    INOUT MIR-POL-REG-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-REG-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Location Policy Registered";
    }

    INOUT MIR-POL-REG-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Date Policy Registered";
    }

    INOUT MIR-POL-REG-FND-SRC-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-FND-SRC-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Source of Funds for Payment";
    }

    INOUT MIR-POL-REINS-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REINS-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Reinsurance Indicator";
    }

    INOUT MIR-POL-RUSH-IND
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-RUSH-IND";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Policy High Priority Indicator";
    }

    INOUT MIR-POL-SFB-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-SFB-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Number of Special Frequency Bills produced Annually";
    }

    INOUT MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sundry Payment Amount";
    }

    INOUT MIR-POL-SNDRY-REASN-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUNRE";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Sundry Payment Reason";
    }

    INOUT MIR-POL-SUPRES-ISS-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Policy Suppress Issue Indicator";
    }

    INOUT MIR-POL-TAX-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-TAX-TYP-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Policy Taxation Type";
    }

    INOUT MIR-POL-TXEMP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-TXEMP-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Tax Exempt Status";
    }

    INOUT MIR-POL-VPO-PU-DUR
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Years Premium Should 'Vanish' By";
    }

    INOUT MIR-PREM-DSCNT-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PDTYP";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Premium Discount Type";
    }

    INOUT MIR-PREM-RECALC-OPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-RECALC-OPT-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Recalculated Premium Option";
    }

    INOUT MIR-PREV-SERV-AGT-ID
    {
        Length = "6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Previous Servicing Agent";
    }

    INOUT MIR-RBILL-DEPT-ID
    {
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        DBTableName = "TRSTB";
        SType = "Selection";
        Label = "Department That Initiated Restrict Billing";
    }

    INOUT MIR-RBILL-EFF-DT
    {
        Length = "10";
        DBTableName = "TRSTB";
        SType = "Date";
        Label = "Restrict Billing Effective Date";
    }

    INOUT MIR-RBILL-END-DT
    {
        Length = "10";
        DBTableName = "TRSTB";
        SType = "Date";
        Label = "Restrict Billing End Date";
    }

    INOUT MIR-RBILL-MISC-1-CD
    {
        Length = "40";
        DBTableName = "TRSTB";
        SType = "Text";
        Label = "Restrict Billing Code #1";
    }

    INOUT MIR-RBILL-MISC-2-CD
    {
        Length = "40";
        DBTableName = "TRSTB";
        SType = "Text";
        Label = "Restrict BIlling Code #2";
    }

    INOUT MIR-RBILL-USER-ID
    {
        Length = "8";
        DBTableName = "TRSTB";
        SType = "Text";
        Label = "User ID that Initiated Restrict Bill";
    }

    INOUT MIR-REG-SAV-PORTN-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Registered Saving Portion Amount";
    }

    INOUT MIR-REG-SAV-PORTN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-SAV-PORTN-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Registered Savings Portion Code";
    }

    INOUT MIR-REG-SPCL-HNDL-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REG-SPCL-HNDL-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Special Handling Code for Tax Receipts";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Subsidiary Company ID";
    }

    INOUT MIR-SERV-AGT-ASIGN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Servicing Agent Assignment Date";
    }

    INOUT MIR-SERV-AGT-ID
    {
        Length = "6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Servicing Agent ID";
    }

    INOUT MIR-SERV-BR-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Servicing Agent Branch";
    }

    INOUT MIR-SFB-END-DT
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Date";
        Label = "SFB End Date";
    }

    INOUT MIR-SFB-GP-END-DT-NUM
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Text";
        Label = "SFB Gap End Date";
    }

    INOUT MIR-SFB-GP-STRT-DT-NUM
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Text";
        Label = "SFB Gap Start Date";
    }

    INOUT MIR-SFB-SEMI-MTHLY-DY
    {
        Length = "3";
        DBTableName = "TSFBL";
        SType = "Day";
        Label = "SFB Semi Monthly Alternate Draw Day";
    }

    INOUT MIR-SFB-STRT-DT
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Date";
        Label = "SFB Start Date";
    }

    INOUT MIR-TAX-1035-ACB-AMT
    {
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "ACB on 1035 Exchange Amount";
    }

    INOUT MIR-TAX-RPT-FREQ-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "TAX-RPT-FREQ-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Tax Reporting Frequency";
    }

    INOUT MIR-UL-INIT-PREM-AMT
    {
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Initial Premium Amount";
    }

    INOUT MIR-UL-LAPS-STRT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Lapse Start Date";
    }

    INOUT MIR-UNMTCH-MAIL-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Unmatched Mail Indicator";
    }

    INOUT MIR-USER-ID
    {
        Length = "8";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "User ID";
    }

    INOUT MIR-POL-REFRL-ID
    {
        Length = "6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Referral Code";
    }

    INOUT MIR-ADDR-CORCT-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Address Correction Indicator";
    }

    INOUT MIR-CORCT-APP-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Correct Application Indicator";
    }

    INOUT MIR-CNSLT-HO-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Head Office Consultation Request Indicator";
    }

    INOUT MIR-RQST-CNFRM-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Pre-Issue Confirmation Indicator";
    }

    INOUT MIR-APP-PROB-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Problems with Application Indicator";
    }

    INOUT MIR-AGT-UWG-FAIL-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CNTRCT-REL-TYP";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Contract Relationship Type";
    }
    
    INOUT MIR-POL-ASIGN-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Policy Assigned Indicator";
    }
   
    INOUT MIR-POL-ASIGN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Assigned Date";
    }

    INOUT MIR-POL-APP-UPLD-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Application Uploaded Date";
    }    
    
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
        Label = "Client's Current Location Code";
    }

    INOUT MIR-CLI-TAX-ID-T[5]
    {
        Length = "9";
        FieldGroup = "Table1";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client's Tax ID";
        Index = "1";
    }


    # set agent client names to in/out to preserve data should server
    # produce a rollback severity message.

    INOUT MIR-DV-AGT-CLI-NM-T[3]
    {
        Length = "30";
        FieldGroup = "Table3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Agent Name";
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

    OUT MIR-DV-ASIGN-CLI-NM-T[5]
    {
        Length = "30";
        FieldGroup = "Table4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Assignee Name";
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

    OUT MIR-DV-LBILL-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "ListBill Name";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    INOUT MIR-DV-OWN-CLI-NM-T[5]
    {
        MixedCase;
        Length = "30";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }

    OUT MIR-DV-PAYR-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payor Name";
    }


    # send servicing agent name in/out to preserve
    # name should server produce a rollback severity message

    INOUT MIR-DV-SERV-AGT-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Servicing Agent Name";
    }

    OUT MIR-DV-SPOUS-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Spouse Name";
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

    OUT MIR-MPREM-DSCNT-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Mode Premium Discount Amount";
    }

    OUT MIR-POL-APP-CMPLT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Application Complete Date";
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

    OUT MIR-POL-CVG-REC-CTR
    {
        Length = "40";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages on This Policy";
    }

    OUT MIR-POL-GRS-APREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Amount of Gross Annual Premium";
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

    OUT MIR-POL-MPREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Modal Premium as of Paid To Date";
    }

    OUT MIR-POL-NXT-ACTV-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Date of Next Automatic Process";
    }

    OUT MIR-POL-PD-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Paid to Date";
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

    OUT MIR-SFB-NXT-BILL-AMT
    {
        Length = "15";
        DBTableName = "TSFBL";
        SType = "Currency";
        Label = "SFB Next Billing Amount";
    }

    OUT MIR-POL-CWA-SUSP-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Cash with App Balance";
    }
     
    INOUT MIR-POL-APP-REASN-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-APP-REASN-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Reason for Application";
    }
     
    INOUT MIR-POL-CNVR-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CNVR-TYP-CD";
        SType = "Selection";
        Label = "Conversion Policy Type Code";
    }    

    INOUT MIR-POL-CNVR-KEY-NUM
    {
        Length = "10";
        SType = "Text";
        Label = "Conversion Key Number";
    }

    INOUT MIR-POL-FINAL-DISP-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Conversion Expiry / Final Disposition Date";
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
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Product Application Type Code";
    }    

    INOUT MIR-SUB-CAT-CD
    {
        Length = "3";
        DBTableName = "TPOLK";
        SType = "Text";
        Label = "Sub Category";
    }
 
    INOUT MIR-ORIG-POL-ID
    {
        Length = "7";
        DBTableName = "TPOLK";
        SType = "Text";
        Label = "Original Policy Number";
    }
 
    INOUT MIR-MY-KEMPO-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MY-KEMPO-TYP-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "My Kempo Type Code";
    }
 
    INOUT MIR-ORIG-POL-ISS-DT
    {
        Length = "10";
        DBTableName = "TPOLK";
        SType = "Date";
        Label = "Original Policy Issue Effective Date";
    }
    
    INOUT MIR-ORIG-POL-DUR
    {
        Length = "2";
        DBTableName = "TPOLK";
        SType = "Text";
        Label = "Original Policy Term";
    }

#   ISLADM - Changes start here     
    INOUT MIR-SURR-FORM-ACPT-DT
    { 
        Length = "10";
        DBTableName = "TPOL";        
        SType = "Date";
        Label = "Surrender Request Form Acceptance Date";
    }
    
    INOUT MIR-ASIGN-SURR-EFF-DT
    { 
        Length = "10";
        DBTableName = "TPOL";                
        SType = "Date";
        Label = "Assigned Surrender Effective Date for Policy with Assignee";
    }
    
    INOUT MIR-POL-STEP-IN-RIGHT-IND
    { 
        Length = "1";
        DBTableName = "TPOL";                
        SType = "Indicator";
        Label = "Policy with Step-In Right";
    }    
#   ISLADM - Changes end here

# M142S1 CHANGES START

    INOUT MIR-POL-CONN-REL-CD
    {
        Length = "40";
        CodeType = "OWNR-REL-INSR-CD";
        SType = "Selection";
        Label = "Relationship of Pre-Split/Joint Policyholder to Post-Split/Single Policyholder";
    }

# M142S1 CHANGES END
#M271O1 CHANGES START HERE  
    INOUT MIR-PREM-CRCY-CD
    {
               
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }
#M271O1 CHANGES END HERE 
#UYS133 CHANGES START
    INOUT MIR-PD-GR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "PD group size";
    }
#UYS133 CHANGES END
#NV3N01 CHANGES START
    INOUT MIR-MTHLY-STD-PREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Monthly Standard Premium";
    }
#NV3N01 CHANGES END
#29746F CHANGES START
    INOUT MIR-CPN-PAYE-CLI-ID
    {
        Length = "10";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Client ID";
    }

    INOUT MIR-CPN-PAYO-JPY-BNFT-IND 
    {
        Length = "1";
        CodeSource = "DataModel";
        DBTableName = "TPOL";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Selection";
        Label = "JPY Benefit Rider";
    }  

    INOUT MIR-CPN-AUTO-PAYO-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Automatic payout rider";
    }

    INOUT MIR-CPN-PAYE-SUB-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-PAYR-SUB-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Account Type";
    }

#29746F CHANGES END
# NVCN01 CHANGES START
   INOUT MIR-MTHLY-STD-MSG-IND
    {
       Length = "1";
       DBTableName = "Derived";
       SType = "Hidden";
    }
# NVCN01 CHANGES ENDS 
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
