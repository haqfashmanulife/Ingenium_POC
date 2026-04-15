# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:18 PM EDT

#*******************************************************************************
#*  Component:   BF0242-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0242-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-CVGD-PMT-AMT";
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

    INOUT MIR-COMM-ADV-1-AMT-T[3]
    {
        Length = "13";
        FieldGroup = "Table3";
        KeyColumn;
        SType = "Currency";
        Label = "Commission Advance";
        Index = "1";
    }

    INOUT MIR-COMM-EARN-1-AMT-T[3]
    {
        Length = "13";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Commission Earned";
        Index = "1";
    }

    INOUT MIR-COMM-PD-1-AMT-T[3]
    {
        Length = "13";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Commission Paid";
        Index = "1";
    }

    INOUT MIR-CVGD-PMT-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Cumulative Payments for Duration";
    }

    INOUT MIR-CVGD-PMT-LOAD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Cumulative Front-end Load";
    }

    IN MIR-CVGD-DUR
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Duration";
    }

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
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

}

