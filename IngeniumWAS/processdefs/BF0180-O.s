# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:16 PM EDT

#*******************************************************************************
#*  Component:   BF0180-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0180-O
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

    IN MIR-POL-NOTI-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Notices Produced";
    }

    IN MIR-POL-NOTI-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
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

    IN MIR-POL-NOTI-DEPT-ID-T[10]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        SType = "Text";
        Label = "Notify Information - Department";
        Index = "1";
    }

    IN MIR-POL-NOTI-MO-DUR-T[10]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Frequency of Notices - Months";
        Index = "1";
    }

    IN MIR-POL-NOTI-QTY-T[10]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Number of Notifications Produced";
        Index = "1";
    }

    IN MIR-POL-NOTI-REASN-CD-T[10]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table10";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "NOTRE";
        SType = "Text";
        Label = "Notification Reason";
        Index = "1";
    }

}

