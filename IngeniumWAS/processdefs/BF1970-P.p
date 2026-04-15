# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:47 PM EDT

#*******************************************************************************
#*  Component:   BF1970-P.p                                                    *
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

#*  RMM260  CTS      Fix For Renewal Rider Refusal Webservice                  *
#*  UYS014  CTS      ADDITION OF NEW FIELD FOR INCREASING FACE AMOUNT          *
#*******************************************************************************

P-STEP BF1970-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1970";
        BusinessFunctionName = "Protected Coverage Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0152";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
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

#RMM260 CHANGES START HERE 

    IN  MIR-ERROR-BYPASS-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Error Bypass Ind";
    } 
    
#RMM260 CHANGES END HERE

    OUT MIR-AGT-ID-T[2]
    {
        Length = "6";
        FieldGroup = "Table2";
        KeyColumn;
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Commissionable Agent Number";
        Index = "1";
    }

    OUT MIR-CFN-UNIT-QTY-T[25]
    {
        Length = "19";
        FieldGroup = "Table25";
        DBTableName = "TFD";
        SType = "Text";
        Label = "Number of Units";
        Index = "1";
    }
 
    OUT MIR-CVG-ACCT-TYP-CD
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Account Type";
    }

    OUT MIR-CVG-APP-CMPLT-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Application Completion Date";
    }

    OUT MIR-CVG-CF-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-CF-TYP-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Cash Flow Type";
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

    OUT MIR-CVG-CLM-LTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Total Claims Paid";
    }

    OUT MIR-CVG-CLM-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Claims Paid Year to Date";
    }

    OUT MIR-CVG-CNVR-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Converted Indicator";
    }

    OUT MIR-CVG-COLFND-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Coverage is a loan collateral fund";
    }

    OUT MIR-CVG-CSTAT-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
    }

    OUT MIR-CVG-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
    }

    OUT MIR-CVG-FYR-COMM-AMT
    {
        Length = "13";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "First Year Commission";
    }

    OUT MIR-CVG-GDLN-APREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Guideline Annual Premium";
    }

    OUT MIR-CVG-GDLN-SPREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Guideline Single Premium";
    }

    OUT MIR-CVG-INS-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Insurance";
    }

    OUT MIR-CVG-MDRT-AMT
    {
        Signed;
        Length = "13";
#M245B2 CHANGES START HERE         
#        Decimals = "0";
#M245B2 CHANGES END HERE 
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "MDRT Amount";
    }

    OUT MIR-CVG-MTHV-STRT-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Earliest Transaction Date";
    }

    OUT MIR-CVG-UL-PU-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Coverage UL Paid-Up Date";
    }

    OUT MIR-PLAN-BNFT-TYP-CD
    {
#* M280A1 CHANGES START*    
#       Length = "1";
        Length = "2";
#* M280A1 CHANGES END*
        CodeSource = "DataModel";
        CodeType = "PLAN-BNFT-TYP-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Plan Benefit Type Code";
    }

    OUT MIR-CVG-NET-REISS-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Net Reissued Face Amount";
    }

    OUT MIR-CVG-NXT-UPREM-AMT
    {
        Length = "9";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Next Premium";
    }

    OUT MIR-CVG-ORIG-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Original Face Amount Applied For";
    }

    OUT MIR-CVG-PMT-LTD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Cumulative Payments Life to Date";
    }

    OUT MIR-CVG-PREV-CSTAT-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Previous Coverage Status";
    }

    OUT MIR-CVG-PREV-FACE-AMT
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Last Face Amount";
    }

    OUT MIR-CVG-PREV-UPREM-AMT
    {
        Length = "9";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Last Premium";
    }

    OUT MIR-CVG-SE-GDLN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "SEC Guideline Premium";
    }

    OUT MIR-CVG-STAT-PRCES-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Last Status Change Date";
    }

    OUT MIR-CVG-SUM-INS-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Sum Insured Amount";
    }

    OUT MIR-CVG-SURR-LTD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Surrender Charges Life to Date";
    }

    OUT MIR-CVG-SURR-TRG-AMT
    {
        Signed;
        Length = "11";
#M245B2 CHANGES START HERE         
#        Decimals = "0";
#M245B2 CHANGES END HERE
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Total Surrender Charge Targets";
    }

    OUT MIR-CVG-UNIT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-UNIT-TYP-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Unit Type";
    }

    OUT MIR-CVG-WP-LTD-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Total Premiums Waived";
    }

    OUT MIR-CVG-WP-YTD-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Waiver of Premium Amounts Paid Year to Date";
    }

    OUT MIR-CVG-XHBT-ISS-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Exhibit - Issue Date";
    }

    OUT MIR-CVG-XHBT-ISS-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Exhibit Issue";
    }

    OUT MIR-CVG-XHBT-REINST-DT
    {
        Length = "9";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Exhibit - Date Last Reinstated";
    }

    OUT MIR-CVG-XHBT-TRMN-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Exhibit - Date Last Terminated";
    }

    OUT MIR-CVG-XHBT-TRMN-QTY
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Number of Times Terminated";
    }

    OUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }

    OUT MIR-FND-ID-T[25]
    {
        Length = "5";
        FieldGroup = "Table25";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFD";
        SType = "Text";
        Label = "SA Information";
        Index = "1";
    }
 
    OUT MIR-LATST-CF-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Last Cash Flow Deposit Date";
    }

    OUT MIR-ORIG-PLAN-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Original Plan";
    }

    OUT MIR-PARTL-ADV-AMT-T[2]
    {
        Length = "13";
        FieldGroup = "Table2";
        DBTableName = "TCVGA";
        SType = "Currency";
        Label = "Partial Advance";
        Index = "1";
    }

    OUT MIR-PARTL-ADV-TYP-CD-T[2]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "PARTL-ADV-TYP-CD";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Partial Advance Type";
        Index = "1";
    }

    OUT MIR-CVG-AGT-SHR-PCT-T[2]
    {
        Length = "5";
  Decimals = "2";
        FieldGroup = "Table2";
        DBTableName = "TCVGA";
  SType = "Percent";
        Label = "Agent Share";
        Index = "1";
    }

    OUT MIR-CVG-AGT-TYP-CD-T[2]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CVG-AGT-TYP-CD";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Agent Type";
        Index = "1";
    }

    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Current Plan";
    }

    OUT MIR-PMT-LOAD-LTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Payment Loads Life to Date";
    }

    OUT MIR-PREV-ANNV-CVGD-DUR
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Commission Duration";
    }

    OUT MIR-SURR-LOAD-LTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Cumulative Surrender Life to Date";
    }

    OUT MIR-ULT-PREM-RT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ULT-PREM-RT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Ultimate Rate";
    }

    OUT MIR-XHBT-REINST-QTY
    {
        Length = "1";
        DBTableName = "TCVG";
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
      OUT MIR-INSRD-SEX-CD
      {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "SEX";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Sex code";
      }
      
      OUT MIR-INSRD-AGE
      {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Age";
      }
#M319A5 CHANGES END HERE    
#UYS014 CHANGES STARTS HERE
    OUT MIR-INCR-FACE-AMT
      {
          Signed;
          DisplayOnly;
          Length = "16";
          SType = "Currency";
          Label = "Increased Face amount";
      }
#UYS014 CHANGES ENDS HERE   
}

