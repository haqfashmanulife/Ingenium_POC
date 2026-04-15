# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:30 PM EDT

#*******************************************************************************
#*  Component:   BF0834-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  EN0306  CTS      ADD NEW BUSINESS DAY INDICATOR                            *                                              
#*                                                                             *
#*******************************************************************************

S-STEP BF0834-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
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

    INOUT MIR-ACTN-COLCT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "ACTIV";
        SType = "Selection";
        Label = "Activity Pointer";
    }

    INOUT MIR-ACTN-TYP-CD
    {
        Key;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "ACTN-TYP-CD";
        SType = "Selection";
        Label = "Activity Type";
    }

    INOUT MIR-LOC-GR-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Selection";
        Label = "Location Group";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
    }

    IN MIR-ACTN-LEAD-DY-DUR-T[12]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Lead Time - Day";
        Index = "1";
    }

    IN MIR-ACTN-LEAD-MO-DUR-T[12]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Lead Time - Month";
        Index = "1";
    }

#EN0306
    IN MIR-ACTN-BUS-DY-DUR-IND-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        SType = "Indicator";
        Label = "Business Day Indicator";
        Index = "1";
    }
    
    IN MIR-ACTN-RECIP-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "ACTN-RECIP-CD";
        SType = "Text";
        Label = "Recipient";
        Index = "1";
    }

    IN MIR-ACTN-RECIP-RPT-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "ACTR";
        SType = "Text";
        Label = "Activity Register Code";
        Index = "1";
    }

    IN MIR-ACTN-TYP-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "ACTN-TYP-CD";
        SType = "Text";
        Label = "Activity Type";
        Index = "1";
    }

    IN MIR-DOC-ID-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Text";
        Label = "Document";
        Index = "1";
    }

    IN MIR-LOC-GR-ID-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Text";
        Label = "Location Group";
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

