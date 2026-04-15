# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:27 PM EDT

#*******************************************************************************
#*  Component:   BF0650-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0650-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Change";
        Type = "Output";
        DelEmptyRows;
        FocusField = "confirmButton";
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

    IN MIR-CHQ-ID
    {
        Key;
        DisplayOnly;
        Length = "16";
        SType = "Text";
        Label = "Cheque Reference Number";
    }

    IN MIR-CHQ-PAYE-NM
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Payee's Name";
    }

    IN MIR-CHQ-AMT-T[12]
    {
        DisplayOnly;
        Length = "17";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Cheque Amount";
        Index = "1";
    }

    IN MIR-CHQ-REF-ID-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Reference Number";
        Index = "1";
    }

    IN MIR-CHQ-STAT-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CHQ-STAT-CD";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    IN MIR-CHQ-TYP-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CHQ-TYP-CD";
        SType = "Text";
        Label = "Cheque Type";
        Index = "1";
    }

}

