# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:30 PM EDT

#*******************************************************************************
#*  Component:   BF0830-O.s                                                    *
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

S-STEP BF0830-O
{
    ATTRIBUTES
    {
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

    IN MIR-ACTN-COLCT-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "ACTIV";
        SType = "Text";
        Label = "Activity Pointer";
    }

    IN MIR-ACTN-TYP-CD
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "ACTN-TYP-CD";
        SType = "Text";
        Label = "Activity Type";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Text";
        Label = "Location Group";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-ACTN-LEAD-DY-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Lead Time - Day";
    }

    IN MIR-ACTN-LEAD-MO-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Lead Time - Month";
    }

#EN0306
    IN MIR-ACTN-BUS-DY-DUR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Business Day Indicator";
    }
     
    IN MIR-ACTN-RECIP-CD-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "ACTN-RECIP-CD";
        SType = "Text";
        Label = "Recipient";
        Index = "1";
    }

    IN MIR-ACTN-RECIP-RPT-CD-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "ACTR";
        SType = "Text";
        Label = "Activity Register Code";
        Index = "1";
    }

    IN MIR-DOC-ID-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Text";
        Label = "Document";
        Index = "1";
    }

}

