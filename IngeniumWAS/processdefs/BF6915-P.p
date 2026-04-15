# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF6915-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00222  BMB      Fix label for Samakata-bu                                 *
#*                   removed MIR-CLI-ADDR-ADDL-TXT-2,                          *
#*                           MIR-CLI-ADDR-CHNG-DT-2,                           *
#*                           MIR-CLI-ADDR-STAT-CD-2                            *
#*  B00550  EKM      ADDED MIR-POL-LOW-AFV-LTR-DT                              *
#*  02BL13  DPK      Last Billing Notice Date                                  *
#*  02BL63  KRW      ADD POL-BT-BILL-DLAY-IND & POL-BT-STRT-DT                 *
#*  EN6306  CTS      NEW FIELD TO DISPLAY BILL DRAW DAY                        *
#*  M161CA  CTS      ADDITION OF NEW FIELD INIT-PMT-TYP-CD                     *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  MP245R  CTS      CHANGES OF BILL MODE CODE FOR SPWL POLICIES               *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*  UYS133  CTS      Addition of PD group size field                           *
#*******************************************************************************

P-STEP BF6915-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6915";
        BusinessFunctionName = "Policy Inquiry - Billing";
        BusinessFunctionType = "Billing";
        MirName = "CCWM6915";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Mandatory;
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
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

    OUT MIR-BILL-LEAD-TIME-DUR
    {
        Length = "3";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billing Lead Time";
    }

    OUT MIR-BILL-RMND-REASN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "BILL-RMND-REASN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Notice Type";
    }

    OUT MIR-POL-LOW-AFV-LTR-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Low Accumulated Fund Value Letter Date";
    }

    OUT MIR-CLI-ADDR-CHNG-DT
    {
        Length = "10";
        DBTableName = "TCLIA";
        SType = "Date";
        Label = "Address Changed Date";
    }

    OUT MIR-CLI-ADDR-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Status";
    }

    OUT MIR-CLI-ADDR-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Address Type";
    }

    OUT MIR-CLI-ADDR-CNTCT-TXT
    {
        Length = "50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Phone Number";
    }

    OUT MIR-CVG-FE-PREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Flat Extra Premium";
    }

    OUT MIR-CVG-PFEE-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Flat Policy Fee";
    }

    OUT MIR-DV-CLI-ADDR-LN-TXT-2-T[6]
    {
        Length = "35";
        FieldGroup = "Table5";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    OUT MIR-DV-CLI-ADDR-LN-TXT-T[6]
    {
        Length = "35";
        FieldGroup = "Table5";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    OUT MIR-DV-LBILL-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Billing Name";
    }

    OUT MIR-DV-LBILL-CLI-NM-2
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Billing Name";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
#MP245R CHANGES START
#CodeType = "POL-BILL-MODE-CD";
      CodeType = "POL-DV-BILL-MODE-CD";
#MP245R CHANGES ENDS
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Mode";
    }

    OUT MIR-POL-BILL-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billed to Date";
    }

    OUT MIR-POL-BILL-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        #M161CA START
        #Label = "Billing Type";
        Label = "Billing Type(Subsequent Premium)";
        #M161CA END
    }

    #M161CA START
    OUT MIR-INIT-PMT-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "INIT-PMT-TYP-CD";
        DBTableName = "TPOL";
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

    OUT MIR-POL-CRNT-MODE-FCT
    {
        Signed;
        Length = "11";
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
        Label = "Policy Status";
    }
    
#TDMG24 CHANGES START HERE
    OUT MIR-PREM-PMT-CMPLT-IND
     {
     
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Base Policy Premium Payment Completion";
     
     }    
#TDMG24 CHANGES END HERE    

    OUT MIR-POL-CVG-REC-CTR
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages";
    }

    OUT MIR-POL-LOAN-REPAY-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Loan Repayment Amount";
    }

    OUT MIR-POL-MPREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Mode Premium Amount";
    }

    OUT MIR-POL-PD-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Paid to Date";
    }

    OUT MIR-POL-PFEE-FCT
    {
        Signed;
        Length = "11";
        Decimals = "7";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Policy Fee Factor";
    }

    OUT MIR-POL-PREM-DSCNT-PCT
    {
        Signed;
        Length = "7";
        Decimals = "3";
        DBTableName = "TPOL";
        SType = "Percent";
        Label = "Policy Discount Percentage";
    }

    OUT MIR-POL-PREV-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-PREV-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Last Premium Mode";
    }

    OUT MIR-POL-PREV-MODE-FCT
    {
        Signed;
        Length = "11";
        Decimals = "7";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Last Mode Factor";
    }

    OUT MIR-POL-PREV-MPREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Last Mode Premium";
    }

    OUT MIR-POL-PREV-PFEE-FCT
    {
        Signed;
        Length = "11";
        Decimals = "7";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Last Policy Fee Factor";
    }

    OUT MIR-POL-PREV-SNDRY-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Last Sundry Amount";
    }

    OUT MIR-POL-RBILL-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-RBILL-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Restrict Billing";
    }

    OUT MIR-POL-SFB-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-SFB-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billing Mode";
    }

    OUT MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sundry Amount";
    }

    OUT MIR-PREV-BILL-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Last Billing Type";
    }

    OUT MIR-PREV-PD-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Last Paid to Date";
    }

    OUT MIR-RBILL-DEPT-ID
    {
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        DBTableName = "TRSTB";
        SType = "Text";
        Label = "Department Responsible";
    }

    OUT MIR-RBILL-EFF-DT
    {
        Length = "10";
        DBTableName = "TRSTB";
        SType = "Date";
        Label = "Effective Date";
    }

    OUT MIR-RBILL-END-DT
    {
        Length = "10";
        DBTableName = "TRSTB";
        SType = "Date";
        Label = "End Date";
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
        Label = "User Responsible";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }

    OUT MIR-SFB-END-DT
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Date";
        Label = "End Date";
    }

    OUT MIR-SFB-GP-END-DT-NUM
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Text";
        Label = "Gap End Date";
    }

    OUT MIR-SFB-GP-STRT-DT-NUM
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Text";
        Label = "Gap Start Date";
    }

    OUT MIR-SFB-NEG-SUSP-IND
    {
        Length = "1";
        DBTableName = "TSFBL";
        SType = "Indicator";
        Label = "Special Frequency Billing Allows Negative Suspense";
    }

    OUT MIR-SFB-NEG-SUSP-QTY
    {
        Length = "2";
        DBTableName = "TSFBL";
        SType = "Text";
        Label = "Special Frequency Billing Limit (Months)";
    }

    OUT MIR-SFB-NXT-BILL-AMT
    {
        Signed;
        Length = "16";
        DBTableName = "TSFBL";
        SType = "Currency";
        Label = "Current Billing Amount";
    }

    OUT MIR-SFB-PREV-BILL-AMT
    {
        Length = "16";
        DBTableName = "TSFBL";
        SType = "Currency";
        Label = "Previous Billing Amount";
    }

    OUT MIR-SFB-SEMI-MTHLY-DY
    {
        Length = "2";
        DBTableName = "TSFBL";
        SType = "Day";
        Label = "Semi-Monthly Billing Day";
    }

    OUT MIR-SFB-STRT-DT
    {
        Length = "10";
        DBTableName = "TSFBL";
        SType = "Date";
        Label = "Start Date";
    }

    OUT MIR-CLI-ADDR-ADDL-TXT
    {
        Length = "72";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Samakata-bu";
    }


    OUT MIR-CLI-GR-PICK-DY
    {
        Length = "2";
        DBTableName = "TCLIG";
        SType = "Text";
        Label = "Pick Day";
    }

    #EN6306 changes start
    OUT MIR-POL-PAC-DRW-DY
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Billing Draw Day";
    }
    #EN6306 changes end

     
    OUT MIR-PREV-BILL-NOTI-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Last Billing Notice Date";
    }
#M245B2 CHANGES START HERE     
    INOUT MIR-POL-CRCY-CD
        {
            
            Length = "2";
            SType = "Hidden";
            Label = "Currency";
  }
#M245B2 CHANGES END HERE 
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
#UYS133 CHANGES START
    OUT MIR-PD-GR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "PD group size";
    }
#UYS133 CHANGES END
}

