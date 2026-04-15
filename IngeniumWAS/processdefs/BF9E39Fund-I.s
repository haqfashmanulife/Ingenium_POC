# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:38 PM EDT

#*******************************************************************************
#*  Component:   BF9E39Fund-I.s                                                *
#*  Description: Maturity Quote-Fund Allocation                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  23802D  13APR22  Intial Version                                            *
#*******************************************************************************

S-STEP BF9E39Fund-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Quotemat";
        Type = "Input";
        FocusField = "MIR-POL-ID-BASE";
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

    IN MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Policyholder Name";
    }

    IN MIR-POL-ID-BASE
    {
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-PRCES-DT
    {
        Mandatory;
        Length = "10";
        SType = "Date";
        Label = "Process Date";       
    }

    IN MIR-EVNT-ACTV-CD
    {
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "EVNT-ACTV-TYP-CD";
        SType = "Text";
        Label = "Activity Type";
    }

    IN MIR-POL-PERI-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PERI-CD";
        SType = "Text";
        Label = "Policy Period";
    }

    IN MIR-POL-BILL-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-MODE-CD";
        SType = "Text";
        Label = "Billing Mode";
    } 

    IN MIR-DV-POL-PAYO-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-POL-PAYO-TYP-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Allocation Type";
    }

    IN MIR-CVG-NUM-T[99]
    {
        Length = "2";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-PLAN-ID-T[99]
    {
        Length = "40";
        FieldGroup = "Table99";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    IN MIR-CVG-CSTAT-CD-T[99]
    {
        Length = "40";
        FieldGroup = "Table99";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    IN MIR-CDI-CVG-ALLOC-AMT-T[99]
    {
        Length = "15";
        FieldGroup = "Table99";
        SType = "Currency";
        Label = "Allocation Amount to Coverage";
        Index = "1";
    }

    IN MIR-DV-FND-DESC-TXT-T[99]
    {
        Length = "40";
        FieldGroup = "Table99";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFS";
        SType = "Text";
        Label = "Fund Name";
        Index = "1";
    }

    INOUT MIR-CDI-ALLOC-PCT-T[99]
    {
        Length = "7";
        Decimals = "0";
        FieldGroup = "Table99";
        SType = "Percent";
        Label = "Allocation Percentage to Fund";
        Index = "1";
    }

    IN MIR-CDI-ALLOC-AMT-T[99]
    {
        Length = "15";
        FieldGroup = "Table99";
        SType = "Currency";
        Label = "Amount Allocation to Fund";
        Index = "1";
    }

    IN MIR-CFN-STAT-CD-T[99]
    {
        Length = "40";
        FieldGroup = "Table99";
        CodeSource = "DataModel";
        CodeType = "CFN-STAT-CD";
        DBTableName = "TFS";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    IN MIR-DV-JS-LOAD-CD-T[99]
    {
        Length = "1";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Java Script Load Code";
        Index = "1";
    }

}
