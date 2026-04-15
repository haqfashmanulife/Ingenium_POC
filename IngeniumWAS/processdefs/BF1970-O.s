# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:54 PM EDT

#*******************************************************************************
#*  Component:   BF1970-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01PR21  EKM      Add UL Paid-Up Date                                       *
#*  01CP02  EKM      Add Agent Share and Agent Type                            *
#*  01PR11  EKM      Add Plan Benefit Type Code                                *
#*  MFFFU5  RNL      Add SA Information                                        *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M280A1  CTS      CHANGES DONE TO INCREASE THE LENGTH OF PLAN-BNFT-TYP-CD   *
#*  M280A1           FROM 1 BYTE TO 2 BYTES                                    *
#*  M319A5  CTS      CHANGES FOR FXWL                                          *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*  UYS014  CTS      ADDITION OF NEW FIELD FOR INCREASING FACE AMOUNT          * 
#*  S23388  CTS      FIX TO DISPLAY CURRECNY CODE                              *
#*******************************************************************************

S-STEP BF1970-O
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

    IN MIR-AGT-ID-T[2]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table2";
        KeyColumn;
        SType = "Text";
        Label = "Commissionable Agent Number";
        Index = "1";
    }

    IN MIR-CFN-UNIT-QTY-T[25]
    {
        DisplayOnly;
        Length = "19";
        FieldGroup = "Table25";
        SType = "Text";
        Label = "Number of Units";
        Index = "1";
    }
 
    IN MIR-CVG-ACCT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Account Type";
    }

    IN MIR-CVG-APP-CMPLT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Application Completion Date";
    }

    IN MIR-CVG-CF-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-CF-TYP-CD";
        SType = "Text";
        Label = "Cash Flow Type";
    }

    IN MIR-CVG-CLM-LTD-AMT
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Claims Paid";
    }

    IN MIR-CVG-CLM-YTD-AMT
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
        Label = "Claims Paid Year to Date";
    }

    IN MIR-CVG-CNVR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Converted Indicator";
    }

    IN MIR-CVG-COLFND-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Coverage is a loan collateral fund";
    }

    IN MIR-CVG-CSTAT-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Coverage Status";
    }

    IN MIR-CVG-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Face Amount";
    }

    IN MIR-CVG-FYR-COMM-AMT
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
        Label = "First Year Commission";
    }

    IN MIR-CVG-GDLN-APREM-AMT
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
        Label = "Guideline Annual Premium";
    }

    IN MIR-CVG-GDLN-SPREM-AMT
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
        Label = "Guideline Single Premium";
    }

    IN MIR-CVG-INS-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        SType = "Text";
        Label = "Type of Insurance";
    }

    IN MIR-CVG-MDRT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
#M245B2 CHANGES START HERE         
#        Decimals = "0";
#M245B2 CHANGES END HERE 
        SType = "Currency";
        Label = "MDRT Amount";
    }

    IN MIR-CVG-MTHV-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Earliest Transaction Date";
    }

    IN MIR-CVG-UL-PU-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Coverage UL Paid-Up Date";
    }

    IN MIR-PLAN-BNFT-TYP-CD
    {
        DisplayOnly;
#* M280A1 CHANGES START*    
#       Length = "1";
        Length = "2";
#* M280A1 CHANGES END*
        CodeSource = "DataModel";
        CodeType = "PLAN-BNFT-TYP-CD";
        SType = "Text";
        Label = "Plan Benefit Type Code";
    }

    IN MIR-CVG-NET-REISS-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Net Reissued Face Amount";
    }

    IN MIR-CVG-NXT-UPREM-AMT
    {
#M245B2 CHANGES START HERE
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "9";
        SType = "Currency";
        Label = "Next Premium";
    }

    IN MIR-CVG-ORIG-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Original Face Amount Applied For";
    }

    IN MIR-CVG-PMT-LTD-AMT
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
        Label = "Cumulative Payments Life to Date";
    }

    IN MIR-CVG-PREV-CSTAT-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Previous Coverage Status";
    }

    IN MIR-CVG-PREV-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Last Face Amount";
    }

    IN MIR-CVG-PREV-UPREM-AMT
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "9";
        SType = "Currency";
        Label = "Last Premium";
    }

    IN MIR-CVG-SE-GDLN-AMT
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
        Label = "SEC Guideline Premium";
    }

    IN MIR-CVG-STAT-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Status Change Date";
    }

    IN MIR-CVG-SUM-INS-AMT
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
        Label = "Sum Insured Amount";
    }

    IN MIR-CVG-SURR-LTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Surrender Charges Life to Date";
    }

    IN MIR-CVG-SURR-TRG-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "11";
#M245B2 CHANGES START HERE         
#        Decimals = "0";
#M245B2 CHANGES END HERE 
        SType = "Currency";
        Label = "Total Surrender Charge Targets";
    }

    IN MIR-CVG-UNIT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-UNIT-TYP-CD";
        SType = "Text";
        Label = "Unit Type";
    }

    IN MIR-CVG-WP-LTD-AMT
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
        Label = "Total Premiums Waived";
    }

    IN MIR-CVG-WP-YTD-AMT
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
        Label = "Waiver of Premium Amounts Paid Year to Date";
    }

    IN MIR-CVG-XHBT-ISS-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Exhibit - Issue Date";
    }

    IN MIR-CVG-XHBT-ISS-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Exhibit Issue";
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

    IN MIR-CVG-XHBT-REINST-DT
    {
        DisplayOnly;
        Length = "9";
        SType = "Date";
        Label = "Exhibit - Date Last Reinstated";
    }

    IN MIR-CVG-XHBT-TRMN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Exhibit - Date Last Terminated";
    }

    IN MIR-CVG-XHBT-TRMN-QTY
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Number of Times Terminated";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
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

    IN MIR-LATST-CF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Cash Flow Deposit Date";
    }

    IN MIR-ORIG-PLAN-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Original Plan";
    }

    IN MIR-PARTL-ADV-AMT-T[2]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Partial Advance";
        Index = "1";
    }

    IN MIR-PARTL-ADV-TYP-CD-T[2]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "PARTL-ADV-TYP-CD";
        SType = "Text";
        Label = "Partial Advance Type";
        Index = "1";
    }

    IN MIR-CVG-AGT-SHR-PCT-T[2]
    {
        DisplayOnly;
        Length = "5";
  Decimals = "2";
        FieldGroup = "Table2";
  SType = "Percent";
        Label = "Agent Share";
        Index = "1";
    }

    IN MIR-CVG-AGT-TYP-CD-T[2]
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

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Current Plan";
    }

    IN MIR-PMT-LOAD-LTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Payment Loads Life to Date";
    }

    IN MIR-PREV-ANNV-CVGD-DUR
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Commission Duration";
    }

    IN MIR-SURR-LOAD-LTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Cumulative Surrender Life to Date";
    }

    IN MIR-ULT-PREM-RT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ULT-PREM-RT-CD";
        SType = "Text";
        Label = "Ultimate Rate";
    }

    IN MIR-XHBT-REINST-QTY
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Exhibit - Number of Times Reinstated";
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
IN MIR-INSRD-SEX-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "SEX";
        SType = "Text";
        Label = "Sex code";
    }
    
IN MIR-INSRD-AGE    
    {
        DisplayOnly;
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

