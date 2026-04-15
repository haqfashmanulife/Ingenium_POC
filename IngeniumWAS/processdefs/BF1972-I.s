# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:54 PM EDT

#*******************************************************************************
#*  Component:   BF1972-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code Cleanup - fixed plan field and partial adv info      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01PR21  EKM      Add UL Paid-Up Date                                       *
#*  01CP02  EKM      Add Agent Share and Agent Type                            *
#*  01PR11  EKM      Add Plan Benefit Type Code                                *
#*  P01215  SUG      MIR-ORIG-PLAN-ID type to drop down list                   *
#*  MFFFU5  RNL      Add SA Information                                        *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M280A1  CTS      CHANGES DONE TO INCREASE THE LENGTH OF PLAN-BNFT-TYP-CD   *
#*  M280A1           FROM 1 BYTE TO 2 BYTES                                    *
#*  M319A5  CTS      CHANGES FOR FXWL                                          *
#*  UYS014  CTS      ADDITION OF NEW FIELD FOR INCREASING FACE AMOUNT          * 
#*  S23388  CTS      FIX TO DISPLAY CURRECNY CODE                              *
#*******************************************************************************

S-STEP BF1972-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-CVG-CSTAT-CD";
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

    INOUT MIR-AGT-ID-T[2]
    {
        Length = "6";
        FieldGroup = "Table2";
        KeyColumn;
        SType = "Text";
        Label = "Commissionable Agent Number";
        Index = "1";
    }

    INOUT MIR-CFN-UNIT-QTY-T[25]
    {
        Length = "19";
        FieldGroup = "Table25";
        SType = "Text";
        Label = "Number of Units";
        Index = "1";
    }
 
    INOUT MIR-CVG-ACCT-TYP-CD
    {
        Length = "1";
        SType = "Text";
        Label = "Account Type";
    }

    INOUT MIR-CVG-APP-CMPLT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Application Completion Date";
    }

    INOUT MIR-CVG-CF-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-CF-TYP-CD";
        SType = "Selection";
        Label = "Cash Flow Type";
    }

    INOUT MIR-CVG-CLM-LTD-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES ENDS HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Claims Paid";
    }

    INOUT MIR-CVG-CLM-YTD-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES ENDS HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Claims Paid Year to Date";
    }

    INOUT MIR-CVG-CNVR-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Converted Indicator";
    }

    INOUT MIR-CVG-COLFND-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Coverage is a loan collateral fund";
    }

    INOUT MIR-CVG-CSTAT-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Selection";
        Label = "Coverage Status";
    }

    INOUT MIR-CVG-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Face Amount";
    }

    INOUT MIR-CVG-FYR-COMM-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES ENDS HERE 
        Length = "13";
        SType = "Currency";
        Label = "First Year Commission";
    }

    INOUT MIR-CVG-GDLN-APREM-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES ENDS HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Guideline Annual Premium";
    }

    INOUT MIR-CVG-GDLN-SPREM-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES ENDS HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Guideline Single Premium";
    }

    INOUT MIR-CVG-INS-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        SType = "Selection";
        Label = "Type of Insurance";
    }

    INOUT MIR-CVG-MDRT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";        
#M245B2 CHANGES ENDS HERE 
        Signed;
        Length = "13";
 #M245B2 CHANGES START HERE          
 #        Decimals = "0";
#M245B2 CHANGES END HERE 
        SType = "Currency";
        Label = "MDRT Amount";
    }

    INOUT MIR-CVG-MTHV-STRT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Earliest Transaction Date";
    }

    INOUT MIR-CVG-UL-PU-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Coverage UL Paid-Up Date";
    }

    IN MIR-FND-ID-T[25]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table25";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "SA Information";
        Index = "1";
    }
 
    INOUT MIR-PLAN-BNFT-TYP-CD
    {
#* M280A1 CHANGES START*    
#       Length = "1";
        Length = "2";
#* M280A1 CHANGES END*
        CodeSource = "DataModel";
        CodeType = "PLAN-BNFT-TYP-CD";
        SType = "Selection";
        Label = "Plan Benefit Type Code";
    }

    INOUT MIR-CVG-NET-REISS-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Net Reissued Face Amount";
    }

    INOUT MIR-CVG-NXT-UPREM-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES ENDS HERE 
        Length = "9";
        SType = "Currency";
        Label = "Next Premium";
    }

    INOUT MIR-CVG-ORIG-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Original Face Amount Applied For";
    }

    INOUT MIR-CVG-PMT-LTD-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES ENDS HERE 
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Cumulative Payments Life to Date";
    }

    INOUT MIR-CVG-PREV-CSTAT-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Selection";
        Label = "Previous Coverage Status";
    }

    INOUT MIR-CVG-PREV-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Length = "15";
        SType = "Currency";
        Label = "Last Face Amount";
    }

    INOUT MIR-CVG-PREV-UPREM-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES ENDS HERE 
        Length = "9";
        SType = "Currency";
        Label = "Last Premium";
    }

    INOUT MIR-CVG-SE-GDLN-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES ENDS HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "SEC Guideline Premium";
    }

    INOUT MIR-CVG-STAT-PRCES-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Last Status Change Date";
    }

    INOUT MIR-CVG-SUM-INS-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES ENDS HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Sum Insured Amount";
    }

    INOUT MIR-CVG-SURR-LTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Surrender Charges Life to Date";
    }

    INOUT MIR-CVG-SURR-TRG-AMT
    {
    #	M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
    #M245B2 CHANGES ENDS HERE 
        Signed;
        Length = "11";
#M245B2 CHANGES START HERE          
#        Decimals = "0";
#M245B2 CHANGES END HERE 
        SType = "Currency";
        Label = "Total Surrender Charge Targets";
    }

    INOUT MIR-CVG-UNIT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-UNIT-TYP-CD";
        SType = "Selection";
        Label = "Unit Type";
    }

    INOUT MIR-CVG-WP-LTD-AMT
    {
    #	M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
    #M245B2 CHANGES ENDS HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Premiums Waived";
    }

    INOUT MIR-CVG-WP-YTD-AMT
    {
    #	M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES ENDS HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Waiver of Premium Amounts Paid Year to Date";
    }

    INOUT MIR-CVG-XHBT-ISS-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Exhibit - Issue Date";
    }

    INOUT MIR-CVG-XHBT-ISS-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Exhibit Issue";
    }

    INOUT MIR-CVG-XHBT-REINST-DT
    {
        Length = "9";
        SType = "Date";
        Label = "Exhibit - Date Last Reinstated";
    }

    INOUT MIR-CVG-XHBT-TRMN-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Exhibit - Date Last Terminated";
    }

    INOUT MIR-CVG-XHBT-TRMN-QTY
    {
        Length = "1";
        Decimals = "0";
        SType = "Number";
        Label = "Number of Times Terminated";
    }

    INOUT MIR-LATST-CF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Last Cash Flow Deposit Date";
    }

    INOUT MIR-ORIG-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Original Plan";
    }

    INOUT MIR-PARTL-ADV-AMT-T[2]
    {
    #	M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
    #M245B2 CHANGES ENDS HERE 
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Partial Advance";
        Index = "1";
    }

    INOUT MIR-PARTL-ADV-TYP-CD-T[2]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "PARTL-ADV-TYP-CD";
        SType = "Selection";
        Label = "Partial Advance Type";
        Index = "1";
    }

    INOUT MIR-CVG-AGT-SHR-PCT-T[2]
    {
        Length = "5";
  Decimals = "2";
        FieldGroup = "Table2";
  SType = "Percent";
        Label = "Agent Share";
        Index = "1";
    }

    INOUT MIR-CVG-AGT-TYP-CD-T[2]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CVG-AGT-TYP-CD";
        SType = "Selection";
        Label = "Agent Type";
        Index = "1";
    }

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Current Plan";
    }

    INOUT MIR-PMT-LOAD-LTD-AMT
    {
    #	M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
    #M245B2 CHANGES ENDS HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Payment Loads Life to Date";
    }

    INOUT MIR-PREV-ANNV-CVGD-DUR
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Commission Duration";
    }

    INOUT MIR-SURR-LOAD-LTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Cumulative Surrender Life to Date";
    }

    INOUT MIR-ULT-PREM-RT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ULT-PREM-RT-CD";
        SType = "Selection";
        Label = "Ultimate Rate";
    }

    INOUT MIR-XHBT-REINST-QTY
    {
        Length = "1";
        SType = "Text";
        Label = "Exhibit - Number of Times Reinstated";
    }

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
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

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
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
#M319A5 CHANGES START HERE  
INOUT MIR-INSRD-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        CodeSubType = "SPCL";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Sex code";    
    }
    
INOUT MIR-INSRD-AGE    
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Age";
    }

#M319A5 CHANGES END HERE 
#UYS014 CHANGES STARTS HERE
    IN MIR-INCR-FACE-AMT
      {
#S23388 CHANGES START HERE    
          CurrencyCode = "MIR-POL-CRCY-CD";
#S23388 CHANGES END HERE 
          Signed;
          DisplayOnly;
          Length = "16";
          SType = "Currency";
          Label = "Increased Face amount";
      }
#UYS014 CHANGES ENDS HERE
}

