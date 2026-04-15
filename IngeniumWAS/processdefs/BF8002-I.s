# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:02 PM EDT

#*******************************************************************************
#*  Component:   BF8002-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01BL18  PHASE1   Rename LISTBILL FIELDS TO PAYROLL DEDUCTION               *
#*  01CP02  PHASE1   Add Servicing Agent Sales Office and Policy Agent Type    *
#*                   Modify Agent information occurrence from 3 to 2           *
#*  01NB01  PHASE1   Add new fields for Application Upload                     *
#*  B00189  DPK      Removed Owner's Relationship to Insured                   *
#*  B00325  PHASE1   Change label for MIR-AGT-UWG-FAIL-IND                     *
#*  B00269  PHASE1   Added field  MIR-POL-APP-CALC-DT                          *
#*  B00404  VAN      Add POL-APP-UPLD-DT                                       *
#*  B00333  VAN      ADD ACCT-HLDR-TYP-CD AND COMB-BILL-IND                    *
#*  02GL57  DPK      CWA Suspense Account and Refund                           *
#*  M00025  MAW      Added MIR-POL-SUB-STAT-CD                                 *
#*  PR006O  AC       Change  MIR-AGT-UWG-FAIL-IND to Drop-down box             *
#*  NWLPSC  CTS      Changes done to increase the length of policy fee and     *
#*  NWLPSC           modal factors                   	                       *
#*  M17628  CTS      ADDED FIELD FOR BULK APPLICATION ID                       *
#*  MP261B  CTS	     ADDED NEW FIELDS FOR ARM2 NON FACE TO FACE                *
#*  NV3N01  CTS      CHANGES DONE AS PART OF SULV3                             *
#*  27624C  CTS      ADDED NEW FIELD FOR EPOL FLAG AND TRXN CONFIRMATION       *
#*  ON2132  CTS      CHANGES DONE AS PART OF ONTARIO-2132 JIRA                 *
#*******************************************************************************

S-STEP BF8002-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-ACRU-CALC-TIME-CD";
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

    INOUT MIR-ACRU-CALC-TIME-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACRU-CALC-TIME-CD";
        SType = "Selection";
        Label = "Accrual Income CalculationTime Code";
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

    INOUT MIR-BILL-RMND-REASN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BILL-RMND-REASN-CD";
        SType = "Selection";
        Label = "Billing Reminder Notice Type";
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

    INOUT MIR-CLI-ID-T[5]
    {
        Length = "10";
        FieldGroup = "Table1";
        KeyColumn;
        SType = "Text";
        Label = "Client ID";
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

    INOUT MIR-ENHC-UWG-APROV-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ENHC-UWG-APROV-IND";
        SType = "Selection";
        Label = "Underwriting Approved for Enhancement Indicator";
    }

    INOUT MIR-ENHC-UWG-REQIR-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ENHC-UWG-REQIR-IND";
        SType = "Selection";
        Label = "Underwriting required for Enhancement Indicator";
    }

    INOUT MIR-GAIN-RPT-TIME-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "GAIN-RPT-TIME-CD";
        SType = "Selection";
        Label = "Gain on Disposition Reporting Time Code";
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

    INOUT MIR-LXPCT-CALC-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "LXPCT-CALC-CD";
        SType = "Selection";
        Label = "Basis of Life Expectancy Factor";
    }

    INOUT MIR-LXPCT-RECALC-IND
    {
        Length = "40";
        SType = "Indicator";
        Label = "Annual Life Expectancy Factor Recalculation Indicator";
    }

    INOUT MIR-MODE-FCT-RESTR-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Restrict Billing Mode Factor Indicator";
    }

    INOUT MIR-NXT-ACTV-TYP-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "NXT-ACTV-TYP-CD";
        SType = "Selection";
        Label = "Type of Next Automatic Activity";
    }

    INOUT MIR-PAC-REDRW-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PAC-REDRW-OPT-CD";
        SType = "Selection";
        Label = "PAC Redraw Option";
    }

    INOUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Product Name";
    }

    INOUT MIR-PLAN-PERI-PREM-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Planned Periodic Premium Amount";
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

    INOUT MIR-POL-ANPAYO-1-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Amount Payable to the First Annuitant";
    }

    INOUT MIR-POL-ANPAYO-2-AMT
    {
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

    INOUT MIR-POL-APPL-CTL-CD
    {
        Length = "2";
        SType = "Text";
        Label = "Application System Code";
    }

    INOUT MIR-POL-APP-RECV-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Application Received Date";
    }

 # MP261B XML changes begin
 
    INOUT MIR-SPCL-AGT-SIGN-DT
        {
            Length = "10";
            SType = "Date";
            Label = "Signature Date";
        }
 # MP261B XML changes end here
    INOUT MIR-POL-APP-SIGN-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Application Signed Date";
    }

    INOUT MIR-POL-APP-CALC-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Illustration Calculation Date";
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

    INOUT MIR-POL-BILL-TO-DT-NUM
    {
        Length = "10";
        SType = "Text";
        Label = "Policy Billed To Date";
    }

    INOUT MIR-POL-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Selection";
        Label = "Policy Billing Method";
    }

    INOUT MIR-POL-CEAS-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Policy Cease Date";
    }

    INOUT MIR-POL-CEAS-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CEASE";
        SType = "Selection";
        Label = "Reason for Policy Termination on Cease Date";
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

    INOUT MIR-POL-COMNT-TXT
    {
        Length = "50";
        SType = "Text";
        Label = "Comments/Remarks";
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

    INOUT MIR-POL-CTRY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Selection";
        Label = "Country of Issue Location";
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

    INOUT MIR-POL-ENHC-CHNG-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Date of Next Enhancement Option";
    }

    INOUT MIR-POL-ENHC-NELCT-QTY
    {
        Length = "2";
        SType = "Text";
        Label = "Number of Non-Elections for Enhancement Benefit";
    }

    INOUT MIR-POL-FINAL-DISP-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Final Disposition Date";
    }

    INOUT MIR-POL-FREE-LK-END-DT
    {
        Length = "10";
        SType = "Date";
        Label = "End of Free Look Date";
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

    INOUT MIR-POL-LOAN-REPAY-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Amount Billed for Repayment of Loans";
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

    INOUT MIR-POL-NFO-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-NFO-CD";
        SType = "Selection";
        Label = "Non-Forfeiture Option";
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

    INOUT MIR-POL-PAC-REDRW-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Date PAC will Re-draw for premiums";
    }

    INOUT MIR-POL-PAC-RETRN-1-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        SType = "Selection";
        Label = "Reason of Returned Cheque";
    }

    INOUT MIR-POL-PAC-RETRN-1-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Date of Returned Cheque";
    }

    INOUT MIR-POL-PAC-RETRN-2-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        SType = "Selection";
        Label = "Reason Most Recent Cheque Returned";
    }

    INOUT MIR-POL-PAC-RETRN-2-DT
    {
        Length = "9";
        SType = "Date";
        Label = "Date of Most Recently Returned Cheque";
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

    INOUT MIR-POL-RBILL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-RBILL-CD";
        SType = "Selection";
        Label = "Restrict NFO or Billing Activity Reason";
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

    INOUT MIR-PREV-SERV-AGT-ID
    {
        Length = "6";
        SType = "Text";
        Label = "Previous Servicing Agent";
    }

    INOUT MIR-RBILL-DEPT-ID
    {
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        SType = "Selection";
        Label = "Department That Initiated Restrict Billing";
    }

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

    INOUT MIR-REG-SAV-PORTN-AMT
    {
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

    INOUT MIR-SERV-AGT-ASIGN-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Servicing Agent Assignment Date";
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

    INOUT MIR-SERV-SO-ID
    {
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

    INOUT MIR-TAX-1035-ACB-AMT
    {
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

    INOUT MIR-UL-INIT-PREM-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Initial Premium Amount";
    }

    INOUT MIR-UL-LAPS-STRT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Lapse Start Date";
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
    
    INOUT MIR-POL-APP-UPLD-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Application Uploaded Date";
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

# M17628 Changes Begins Here

    INOUT MIR-POL-BULK-APP-ID
    {
        Length = "15";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Bulk Application ID";
    }

# M17628 Changes Ends Here
#NV3N01 CHANGES START
    INOUT MIR-PREM-CRCY-CD
    {
               
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }

    INOUT MIR-MTHLY-STD-PREM-AMT
    {
        CurrencyCode = "MIR-PREM-CRCY-CD";
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Monthly Standard Premium";
    }
#NV3N01 CHANGES END

# 27624C Changes Begins Here

    INOUT MIR-POL-ECERT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "epolicy Flag";
    }

    IN MIR-TRXN-CNFRM-OS-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Transaction confirmation outstanding flag";
    }

# 27624C Changes Ends Here
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
