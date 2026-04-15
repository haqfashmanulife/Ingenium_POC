# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:31 PM EDT

#*******************************************************************************
#*  Component:   BF0864-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0864-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-AGT-ID";
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

    INOUT MIR-AGT-ID
    {
        Key;
        Length = "6";
        SType = "Text";
        Label = "Agent ID";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
    }

    IN MIR-AGT-ID-T[12]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    IN MIR-AGT-PAYBL-BAL-AMT-T[12]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Current Balance";
        Index = "1";
    }

    IN MIR-DV-COMM-AGT-NM-T[12]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Agent Name";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

