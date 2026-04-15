# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:59 PM EDT

#*******************************************************************************
#*  Component:   BF6915-O.s                                                    *
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

S-STEP BF6915-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Billing";
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

    IN MIR-APPL-CTL-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
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
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "BILL-RMND-REASN-CD";
        SType = "Text";
        Label = "Notice Type";
    }

    IN MIR-POL-LOW-AFV-LTR-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Low Accumulated Fund Value Letter Date";
    }

    IN MIR-CLI-ADDR-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Address Changed Date";
    }

    IN MIR-CLI-ADDR-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        SType = "Text";
        Label = "Address Status";
    }

    IN MIR-CLI-ADDR-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Address Type";
    }

    IN MIR-CVG-FE-PREM-AMT
    {
#M271O1 CHANGES START HERE  
#M245B2 CHANGES START HERE    
#        CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M245B2 CHANGES END HERE 
#M271O1 CHANGES ENDS HERE  
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Flat Extra Premium";
    }

    IN MIR-CVG-PFEE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Flat Policy Fee";
    }


    #added LOC014

    IN MIR-DV-CLI-ADDR-LN-TXT-2-T[6]
    {
        DisplayOnly;
        Length = "35";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }


    #added LOC014

    IN MIR-DV-CLI-ADDR-LN-TXT-T[6]
    {
        DisplayOnly;
        Length = "35";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    IN MIR-DV-LBILL-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Billing Name";
    }

    IN MIR-DV-LBILL-CLI-NM-2
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Billing Name";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
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
        Label = "Premium Mode";
    }

    IN MIR-POL-BILL-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Billed to Date";
    }

    IN MIR-POL-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        #M161CA START
        #Label = "Billing Type";
        Label = "Billing Type(Subsequent Premium)";
        #M161CA END
    }

    #M161CA START
    IN MIR-INIT-PMT-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "INIT-PMT-TYP-CD";
        SType = "Text";
        Label = "Payment Route (First Premium)";
    }    
    #M161CA END
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

    IN MIR-POL-CRNT-MODE-FCT
    {
        DisplayOnly;
        Signed;
        Length = "11";
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
        Label = "Policy Status";
    }
    
    #TDMG24 CHANGES START HERE
            IN MIR-PREM-PMT-CMPLT-IND
            {
                DisplayOnly;
                Length = "1";
                SType = "Indicator";
                Label = "Base Policy Premium Payment Completion";
        
            }    
    #TDMG24 CHANGES END HERE    


    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-POL-LOAN-REPAY-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Loan Repayment Amount";
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
        Length = "17";
        SType = "Currency";
        Label = "Mode Premium Amount";
    }

    IN MIR-POL-PD-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Paid to Date";
    }

    IN MIR-POL-PFEE-FCT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        Decimals = "7";
        SType = "Number";
        Label = "Policy Fee Factor";
    }

    IN MIR-POL-PREM-DSCNT-PCT
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "3";
        SType = "Percent";
        Label = "Policy Discount Percentage";
    }

    IN MIR-POL-PREV-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-PREV-MODE-CD";
        SType = "Text";
        Label = "Last Premium Mode";
    }

    IN MIR-POL-PREV-MODE-FCT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        Decimals = "7";
        SType = "Number";
        Label = "Last Mode Factor";
    }

    IN MIR-POL-PREV-MPREM-AMT
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
        Label = "Last Mode Premium";
    }

    IN MIR-POL-PREV-PFEE-FCT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        Decimals = "7";
        SType = "Number";
        Label = "Last Policy Fee Factor";
    }

    IN MIR-POL-PREV-SNDRY-AMT
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
        Label = "Last Sundry Amount";
    }

    IN MIR-POL-RBILL-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-RBILL-CD";
        SType = "Text";
        Label = "Restrict Billing";
    }

    IN MIR-POL-SFB-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-SFB-CD";
        SType = "Text";
        Label = "Billing Mode";
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
        Length = "15";
        SType = "Currency";
        Label = "Sundry Amount";
    }

    IN MIR-PREV-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Last Billing Type";
    }

    IN MIR-PREV-PD-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Last Paid to Date";
    }

    IN MIR-RBILL-DEPT-ID
    {
        DisplayOnly;
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        SType = "Text";
        Label = "Department Responsible";
    }

    IN MIR-RBILL-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-RBILL-END-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "End Date";
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
        Label = "User Responsible";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-SFB-END-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "End Date";
    }

    IN MIR-SFB-GP-END-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Gap End Date";
    }

    IN MIR-SFB-GP-STRT-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Gap Start Date";
    }

    IN MIR-SFB-NEG-SUSP-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Special Frequency Billing Allows Negative Suspense";
    }

    IN MIR-SFB-NEG-SUSP-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Special Frequency Billing Limit (Months)";
    }

    IN MIR-SFB-NXT-BILL-AMT
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
        Label = "Current Billing Amount";
    }

    IN MIR-SFB-PREV-BILL-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Previous Billing Amount";
    }

    IN MIR-SFB-SEMI-MTHLY-DY
    {
        DisplayOnly;
        Length = "2";
        SType = "Day";
        Label = "Semi-Monthly Billing Day";
    }

    IN MIR-SFB-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Start Date";
    }


    # added for LOC006

    IN MIR-CLI-ADDR-CNTCT-TXT
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Phone Number";
    }


    #added LOC014
    #fixed B00222

    IN MIR-CLI-ADDR-ADDL-TXT
    {
        DisplayOnly;
        Length = "72";
        SType = "Text";
        Label = "Samakata-bu";
    }

    IN MIR-CLI-GR-PICK-DY
    {
       Length = "2";
       DBTableName = "TCLIG";
       SType = "Text";
       Label = "Pick Day";
    }

    #EN6306 changes start
    IN MIR-POL-PAC-DRW-DY
    {
        DisplayOnly;
        Length = "2";
        SType = " Number";
        Label = "Billing Draw Day";
    }
        #EN6306 changes end
     
    IN MIR-PREV-BILL-NOTI-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Billing Notice Date";
    }
#M245B2 CHANGES START HERE     
    INOUT MIR-POL-CRCY-CD
        {
            
            Length = "2";
            SType = "Hidden";
            Label = "Currency ";
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
}

