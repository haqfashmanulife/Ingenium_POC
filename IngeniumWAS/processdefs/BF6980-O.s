# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:01 PM EDT

#*******************************************************************************
#*  Component:   BF6980-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016073  6.0      Fix unit value as a number                                *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01PR24  KJ       Substandard unit value                                    *
#*  01AD25  BMB      Add a new field to control display of more than 20 cvgs   *
#*                   Focusfield is the more button...                          *
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

S-STEP BF6980-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Valuecov";
        Type = "Output";
        DelEmptyRows;
        FocusField = "moreButton";
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
        Key;
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

#01AD25 - Add in the coverage number
    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
    }
 
    IN MIR-CVG-NUM-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        KeyColumn;
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }
    
    IN MIR-CVG-ME-FCT-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Substandard Percentage";
        Index = "1";
    }    

    IN MIR-DV-ANN-BON-CSH-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Annual Bonus";
        Index = "1";
    }

    IN MIR-DV-ANN-BON-PUA-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Annual Bonus Accumulated PUA";
        Index = "1";
    }

    IN MIR-DV-ATD-ACUM-CV-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Accumulated Fund Value";
        Index = "1";
    }

    IN MIR-DV-ATD-GUAR-CV-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Guaranteed Cash Value";
        Index = "1";
    }

    IN MIR-DV-CVG-UNIT-QTY-T[20]
    {
        DisplayOnly;
        Length = "12";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Number of Units";
        Index = "1";
    }

    IN MIR-DV-INTRM-CSH-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Interim Bonus";
        Index = "1";
    }

    IN MIR-DV-INTRM-PUA-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Interim Bonus Accumulated PUA";
        Index = "1";
    }

    IN MIR-DV-MCV-ACUM-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Minimum Contract Value";
        Index = "1";
    }
    
#M245C1 CHANGES BEGINS HERE 
    IN MIR-DV-MAX-UW-LT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Maximum Underwriting Limit";
        Index = "1";
    }
    
    IN MIR-DV-MAX-FA-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Maximum Face Amount for History";
        Index = "1";
    }
#M245C1 CHANGES ENDS HERE

#ABF001
    IN MIR-DV-PCFA-T[20] 
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
	DisplayOnly;
	FieldGroup = "Table20";
	Index = "1";
	Label = "Coverage Present Converted Face Amount";
	Length = "17";
	SType = "Currency";
	Signed;
    }

#ABF001
    IN MIR-DV-ACFA-T[20] 
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
	DisplayOnly;
	FieldGroup = "Table20";
	Index = "1";
	Label = "Coverage Average Converted Face Amount";
	Length = "17";
	SType = "Currency";
	Signed;
    }

    IN MIR-DV-MCV-TOT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Minimum Contract Value";
    }

# SPR24
    IN MIR-DV-NXT-YR-SSTD-CV-RT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "14";
        Decimals = "5";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Next Substandard Unit Value";
        Index = "1";
    }

    IN MIR-DV-NXT-ANNV-CV-RT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "14";
        Decimals = "5";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Next Unit Value";
        Index = "1";
    }

#
# 01PR10
#
#   IN MIR-DV-NXT-ANNV-DY-QTY-T[20]
#   {
#       DisplayOnly;
#       Length = "3";
#       FieldGroup = "Table20";
#       SType = "Text";
#       Label = "Next Number of Days";
#       Index = "1";
#   }

    IN MIR-DV-NXT-ANNV-MT-QTY-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Next Number of Months";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

# SPR24
    IN MIR-DV-PREV-YR-SSTD-CV-RT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "14";
        Decimals = "5";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Last Substandard Unit Value";
        Index = "1";
    }

    IN MIR-DV-PREV-ANNV-CV-RT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "14";
        Decimals = "5";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Last Unit Value";
        Index = "1";
    }

    IN MIR-DV-PREV-ANNV-QTY-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Previous Number of Days";
        Index = "1";
    }

    IN MIR-DV-TOT-ACUM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Accumulated Fund Value";
    }

    IN MIR-DV-TOT-GUAR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Guaranteed Cash Value";
    }

#IPPRP4
    IN MIR-DV-PRES-CNVR-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Present Converted Face Amount";
    }

#IPPRP4
    IN MIR-DV-AVG-CNVR-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Average Converted Face Amount";
    }

    IN MIR-DV-TRMNL-BON-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Terminal Bonus";
        Index = "1";
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

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
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

