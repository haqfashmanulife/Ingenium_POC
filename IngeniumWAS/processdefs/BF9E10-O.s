# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:28 PM EDT

#*******************************************************************************
#*  Component:   BF9E10-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS026  6.0      Online Changes for UNISYS                                 *
#*  UYS26B  05APR22  ONLINE CHNAGES FOR PD GROUP SIZE                          *
#*                                                                             *
#*******************************************************************************

S-STEP BF9E10-O
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

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-DV-POL-HLDR-NM
    {
        DisplayOnly;
        Length = "51";
        SType = "Text";
        Label = "Policy Holder Name";
    }

    IN MIR-DV-INSRD-NM
    {
        DisplayOnly;
        Length = "51";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-SMALL-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "ETAB";
        CodeType = "PRSML";
        SType = "Text";
        Label = "Small Type Code";
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

    IN MIR-POL-BILL-TYP-CD  
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Payment Method";
    }

    IN MIR-POL-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Issue Date of the Policy";
    }

    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DV-BILL-MODE-CD";
        SType = "Text";
        Label = "Premium payment mode";
    }

    IN MIR-DV-PREM-PMT-PERI
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Premium Payment Period";
    }

    IN MIR-DV-FROM-DT-T[25]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table25";
        SType = "Date";
        Label = "From Date";
        Index = "1";
    }

    IN MIR-DV-TO-DT-T[25]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table25";
        SType = "Date";
        Label = "To Date";
        Index = "1";
    }

    IN MIR-POL-BILL-TYP-CD-T[25]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table25";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Payment Method";
        Index = "1";
    }
#UYS26B CHNAGES STARTS
    IN MIR-PD-GR-TYP-CD-T[25]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table25";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        SType = "Text";
        Label = "PD group size";
        Index = "1";
    }
#UYS26B CHNAGES ENDS
    IN MIR-DV-TOT-PREM-T[25]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table25";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";
        Label = "Total Premium";
        Index = "1";
    }

    IN MIR-ENDOW-T[25]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table25";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";
        Label = "Endowment";
        Index = "1";
    }

    IN MIR-TERM-PREM-T[25]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table25";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";
        Label = "Term";
        Index = "1";
    }

    IN MIR-RIDER-PREM-T[25]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table25";
        CurrencyCode = "MIR-PREM-CRCY-CD";
        SType = "Currency";
        Label = "Rider";
        Index = "1";
    }
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    } 
}
