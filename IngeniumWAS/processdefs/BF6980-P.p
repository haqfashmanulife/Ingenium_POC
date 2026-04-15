# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:53 PM EDT

#*******************************************************************************
#*  Component:   BF6980-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016073  6.0      Fix unit value as a number                                *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01PR10  KJ       Surrneder value                                           *
#*  01PR24  KJ       Substandard unit value                                    *
#*  01AD25  BMB      Add a new field to control display of more than 20 cvgs   *
#*                                                                             *
#*  B00647  VAN      Add Multiple Extra rating factor                          *
#*  IPPRP4  CTS      ADD 2 FIELDS PRESENT CONVERTED FACE AMOUNT AND AVERAGE    *
#*                   CONVERTED FACE AMOUNT                                     *
#*  ABF001  CTS      ADD 2 FIELDS PRESENT CONVERTED FACE AMOUNT AND AVERAGE    *
#*                   CONVERTED FACE AMOUNT AT COVERAGE LEVEL                   *
#*  M245C1  CTS      SPWL_NEW BUSINESS CHANGES                                 *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*******************************************************************************

P-STEP BF6980-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6980";
        BusinessFunctionName = "Policy Inquiry - Coverage Values";
        BusinessFunctionType = "Valuecov";
        MirName = "CCWM6980";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Key;
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

#01AD25 - Add in the coverage number
    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
    }
 
    OUT MIR-CVG-NUM-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-CVG-ME-FCT-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Substandard Percentage";
        Index = "1";
    }

    OUT MIR-DV-ANN-BON-CSH-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Annual Bonus";
        Index = "1";
    }

    OUT MIR-DV-ANN-BON-PUA-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Annual Bonus Accumulated PUA";
        Index = "1";
    }

    OUT MIR-DV-ATD-ACUM-CV-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Accumulated Fund Value";
        Index = "1";
    }

    OUT MIR-DV-ATD-GUAR-CV-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Guaranteed Cash Value";
        Index = "1";
    }

    OUT MIR-DV-CVG-UNIT-QTY-T[20]
    {
        Length = "12";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Number of Units";
        Index = "1";
    }

    OUT MIR-DV-INTRM-CSH-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Interim Bonus";
        Index = "1";
    }

    OUT MIR-DV-INTRM-PUA-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Interim Bonus Accumulated PUA";
        Index = "1";
    }

    OUT MIR-DV-MCV-ACUM-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Minimum Contract Value";
        Index = "1";
    }
    
#M245C1 CHANGES BEGINS HERE 
    OUT MIR-DV-MAX-UW-LT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "Derived";        
        SType = "Currency";
        Label = "Maximum Underwriting Limit";
        Index = "1";
    }
    
    OUT MIR-DV-MAX-FA-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "Derived";        
        SType = "Currency";
        Label = "Maximum Face Amount for History";
        Index = "1";
    }
#M245C1 CHANGES ENDS HERE

#ABF001
    OUT MIR-DV-PCFA-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Coverage Present Converted Face Amount";
        Index = "1";
    }
          
#ABF001
    OUT MIR-DV-ACFA-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Coverage Average Converted Face Amount";
        Index = "1";
    }
                      
    OUT MIR-DV-MCV-TOT-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Minimum Contract Value";
    }

#  SPR24
    OUT MIR-DV-NXT-YR-SSTD-CV-RT-T[20]
    {
        Signed;
        Length = "14";
        Decimals = "5";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Next Substandard Unit Value";
        Index = "1";
    }

    OUT MIR-DV-NXT-ANNV-CV-RT-T[20]
    {
        Signed;
        Length = "14";
        Decimals = "5";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Next Unit Value";
        Index = "1";
    }
#
# 01PR10
#
#   OUT MIR-DV-NXT-ANNV-DY-QTY-T[20]
#   {
#       Length = "3";
#       FieldGroup = "Table20";
#       DBTableName = "Derived";
#       SType = "Text";
#       Label = "Next Number of Days";
#       Index = "1";
#   }

    OUT MIR-DV-NXT-ANNV-MT-QTY-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Next Number of Months";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

# SPR24
    OUT MIR-DV-PREV-YR-SSTD-CV-RT-T[20]
    {
        Signed;
        Length = "14";
        Decimals = "5";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Next Substandard Unit Value";
        Index = "1";
    }

    OUT MIR-DV-PREV-ANNV-CV-RT-T[20]
    {
        Signed;
        Length = "14";
        Decimals = "5";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Last Unit Value";
        Index = "1";
    }

    OUT MIR-DV-PREV-ANNV-QTY-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Previous Number of Days";
        Index = "1";
    }

    OUT MIR-DV-TOT-ACUM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Accumulated Fund Value";
    }

    OUT MIR-DV-TOT-GUAR-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Guaranteed Cash Value";
    }

#IPPRP4
    OUT MIR-DV-PRES-CNVR-FACE-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Present Converted Face Amount";
    }
#IPPRP4
    OUT MIR-DV-AVG-CNVR-FACE-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Average Converted Face Amount";
    }
        
    OUT MIR-DV-TRMNL-BON-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Terminal Bonus";
        Index = "1";
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

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }
    
#M245B2 CHANGES START HERE       
       INOUT MIR-POL-CRCY-CD
        {
           Length = "2";           
           SType = "Hidden";
           Label = "Currency";
    }
#M245B2 CHANGES END HERE     

}

