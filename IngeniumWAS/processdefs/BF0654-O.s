# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:27 PM EDT

#*******************************************************************************
#*  Component:   BF0654-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0654-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        FocusField = "MIR-CHQ-ID";
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

    INOUT MIR-CHQ-ID
    {
        Key;
        Length = "16";
        SType = "Text";
        Label = "Cheque Reference Number";
    }

    INOUT MIR-CHQ-PAYE-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Payee's Name";
    }

    IN MIR-CHQ-AMT-T[100]
    {
        DisplayOnly;
        Length = "17";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Cheque Amount";
        Index = "1";
    }

    IN MIR-CHQ-ID-T[100]
    {
        DisplayOnly;
        Length = "16";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Cheque Reference Number";
        Index = "1";
    }

    IN MIR-CHQ-PAYE-NM-T[100]
    {
        DisplayOnly;
        Length = "50";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Payee's Name";
        Index = "1";
    }

    IN MIR-CHQ-REF-ID-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Reference Number";
        Index = "1";
    }

    IN MIR-CHQ-STAT-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "CHQ-STAT-CD";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    IN MIR-CHQ-TYP-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "CHQ-TYP-CD";
        SType = "Text";
        Label = "Cheque Type";
        Index = "1";
    }

}

