# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:54 PM EDT

#*******************************************************************************
#*  Component:   BF9986-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#     Release  Description                                              *
#*                                                                             *
#*  MFFPI    JE       NEW FOR PA - FUND ACTIVITY DETAILS SCREEN                *
#*******************************************************************************

S-STEP BF9986-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
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

    INOUT MIR-NEXT-CIA-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        SType = "Hidden";
        Label = "Activity Effective Date";
    }

    INOUT MIR-NEXT-CIA-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        SType = "Hidden";
        Label = "Coverage Number";
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

#*                                               Fund Activity Information
    IN MIR-CVG-NUM5-T[40]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table4";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-CIA-EFF-DT5-T[40]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table4";
        SType = "Date";
        Label = "Activity Effective Date";
        Index = "1";
    }

    IN MIR-PAI-CIA-REASN-CD5-T[40]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "PAI-CIA-REASN-CD";
        SType = "Text";
        Label = "Activity Reason";
        Index = "1";
    }

    IN MIR-CIA-FND-TRXN-AMT5-T[40]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table4";
        SType = "Currency";
        Label = "Gross Amount";
        Index = "1";
    }

    IN MIR-CIA-CLI-TRXN-AMT5-T[40]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table4";
        SType = "Currency";
        Label = "Net Amount";
        Index = "1";
    }

    IN MIR-CIA-LOAD-AMT5-T[40]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table4";
        SType = "Currency";
        Label = "Transfer Charges";
        Index = "1";
    }

    IN MIR-CIA-REVRS-PRCES-DT5-T[40]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table4";
        SType = "Date";
        Label = "Effective Date of Reversal";
        Index = "1";
    }

}