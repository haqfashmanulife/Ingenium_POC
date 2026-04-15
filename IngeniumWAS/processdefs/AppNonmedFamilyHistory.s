# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:12 PM EDT

#*******************************************************************************
#*  Component:   AppNonmedFamilyHistory.s                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AppNonmedFamilyHistory
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-HIST-UNKNWN-IND";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN BannerBar;

    IN BannerBarSize;

    IN BannerProductID
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
    }

    IN BannerPolicyID;

    IN BannerPrimaryInsured;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    INOUT MIR-CLI-REL-DTH-AGE-T[4]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table4";
        SType = "Number";
        Label = "Age at Death";
        Index = "1";
    }

    INOUT MIR-CLI-REL-LVNG-AGE-T[4]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table4";
        SType = "Number";
        Label = "Age if Living";
        Index = "1";
    }

    INOUT MIR-HERED-DISORD-1-CD-T[4]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "HDIS";
        SType = "Selection";
        Label = "Heredity Disorder (1)";
        Index = "1";
    }

    INOUT MIR-HERED-DISORD-2-CD-T[4]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "HDIS";
        SType = "Selection";
        Label = "Heredity Disorder (2)";
        Index = "1";
    }

    INOUT MIR-HIST-UNKNWN-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "HIST-UNKNWN-IND";
        SType = "YesNoUnanwered";
        Label = "Does the applicant know their Family History?";
    }

    INOUT MIR-REL-HLTH-STATE-CD-T[4]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "HLTH";
        SType = "Selection";
        Label = "State of Health / Cause of Death";
        Index = "1";
    }

    INOUT MIR-CLI-REL-LVNG-QTY-T[4]
    {
        Length = "2";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Number Living";
        Index = "1";
    }

    INOUT MIR-CLI-REL-DTH-QTY-T[4]
    {
        Length = "2";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Number Dead";
        Index = "1";
    }

}

