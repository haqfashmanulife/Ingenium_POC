# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:16 PM EDT

#*******************************************************************************
#*  Component:   BF0182-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0182-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-POL-NOTI-REASN-CD-T[1]";
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

    INOUT MIR-POL-NOTI-DEPT-ID-T[1]
    {
        Length = "6";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        SType = "Selection";
        Label = "Notify Information - Department";
        Index = "1";
    }

    INOUT MIR-POL-NOTI-MO-DUR-T[1]
    {
        Length = "2";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Frequency of Notices - Months";
        Index = "1";
    }

    INOUT MIR-POL-NOTI-QTY-T[1]
    {
        Length = "2";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Number of Notifications Produced";
        Index = "1";
    }

    INOUT MIR-POL-NOTI-REASN-CD-T[1]
    {
        Length = "2";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "NOTRE";
        SType = "Selection";
        Label = "Notification Reason";
        Index = "1";
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

}

