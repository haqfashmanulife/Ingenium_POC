# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:12 PM EDT

#*******************************************************************************
#*  Component:   AppPolicyDataTrad                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AppPolicyDataTrad
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-CVG-FACE-AMT-T[1]";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    IN BannerBar;

    IN BannerBarSize;

    IN BannerProductID
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
    }

    IN BannerPolicyID;

    IN BannerPrimaryInsured;


    # input policy id values to this s step for the filtered
    # selection box, csom4902 to work.  Pageserver only looks
    # @ the s step to determine how to build the page.  Even though
    # the policy id information will be passed around implicitly,
    # it must be passed in explicitly for pageserver.

    IN MIR-POL-ID-BASE;

    IN MIR-POL-ID-SFX;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-POL-DIV-OPT-CD
    {
        Length = "40";
        CodeSource = "CSOM4911";
        CodeType = "POL-DIV-OPT-CD";
        SType = "Selection";
        Label = "Policy Dividend Option";
        FilterFields = "2";
        FilterField1 = "MIR-POL-ID-BASE";
        FilterField2 = "MIR-POL-ID-SFX";
    }

    INOUT MIR-POL-NFO-CD
    {
        Length = "1";
        CodeSource = "CSOM4912";
        CodeType = "POL-NFO-CD";
        SType = "Selection";
        Label = "Non-Forfeiture Option";
        FilterFields = "2";
        FilterField1 = "MIR-POL-ID-BASE";
        FilterField2 = "MIR-POL-ID-SFX";
    }

    INOUT MIR-PLAN-ID-T[5]
    {
        Length = "40";
        Mandatory;
        FieldGroup = "Table5";
        CodeSource = "CSOM4902";
        FilterFields = "2";
        FilterField1 = "MIR-POL-ID-BASE";
        FilterField2 = "MIR-POL-ID-SFX";
        SType = "Selection";
        Label = "Product";
        Index = "1";
    }

    INOUT MIR-CVG-FACE-AMT-T[5]
    {
        Length = "15";
        Mandatory;
        FieldGroup = "Table5";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    INOUT MIR-CVG-AD-FACE-AMT-T[5]
    {
        Length = "15";
        Mandatory;
        FieldGroup = "Table5";
        SType = "Currency";
        Label = "AD Face Amount";
        Index = "1";
    }

    INOUT MIR-CVG-WP-IND-T[5]
    {
        Length = "40";
        Mandatory;
        FieldGroup = "Table5";
        SType = "Indicator";
        Label = "WP Ind";
        Index = "1";
    }

    INOUT MIR-DV-INSRD-CLI-NM-T[5]
    {
        ReadOnly;
        Length = "75";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Primary Insured";
        Index = "1";
    }

    INOUT MIR-INSRD-CLI-ID-T[5]
    {
        SType = "Hidden";
    }

    INOUT PrimaryInsuredSelectionBox-T[5]
    {
        Length = "10";
        CodeSource = "CSOM4904";
        FilterFields = "2";
        FilterField1 = "MIR-POL-ID-BASE";
        FilterField2 = "MIR-POL-ID-SFX";
        SType = "Selection";
        FieldGroup = "Table5";
        Label = "Select Application Clients";
        Index = "1";
    }

    INOUT MIR-DV-CVG-PLAN-JNT-IND-T[5]
    {
        Length = "1";
        FieldGroup = "Table5";
        SType = "Hidden";
        Label = "Joint Plan Indicator";
        Index = "1";
    }

    INOUT MIR-CVG-JNT-LIFE-CD-T[5]
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-JNT-LIFE-CD";
        FieldGroup = "Table5";
        SType = "Selection";
        Label = "Joint Life Type";
        Index = "1";
    }

    INOUT MIR-CVG-LIVES-INSRD-CD-T[5]
    {
        Length = "1";
        FieldGroup = "Table5";
        SType = "Hidden";
        Label = "Number of Lives Insured";
        Index = "1";
    }

    INOUT MIR-DV-INSRD-CLI-NM-2-T[5]
    {
        ReadOnly;
        Length = "75";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Joint Insured";
        Index = "1";
    }

    INOUT MIR-INSRD-CLI-ID-2-T[5]
    {
        SType = "Hidden";
    }

    INOUT JointInsuredSelectionBox-T[5]
    {
        Length = "10";
        CodeSource = "CSOM4904";
        FilterFields = "2";
        FilterField1 = "MIR-POL-ID-BASE";
        FilterField2 = "MIR-POL-ID-SFX";
        SType = "Selection";
        FieldGroup = "Table5";
        Label = "Select Application Clients";
        Index = "1";
    }

    OUT ChangeInsuredLink-T[5]
    {
        Label = "Search for other";
        FieldGroup = "Table5";
        Link;
        SType = "Text";
        Action = "GoToInsuredSearch";
        Index = "1";
    }

    OUT ChangeOtherLink-T[5]
    {
        Label = "Search for other";
        FieldGroup = "Table5";
        Link;
        SType = "Text";
        Action = "GoToOtherSearch";
        Index = "1";
    }

    INOUT ShowBlankRow
    {
        Label = "Add Optional Rider";
        SType = "Indicator";
    }

    INOUT MIR-CVG-NUM-T[5]
    {
        Length = "2";
        FieldGroup = "Table5";
        SType = "Hidden";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-PLAN-PKG-ADB-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table5";
        SType = "Hidden";
        Label = "Embedded ADB";
        Index = "1";
    }

    IN MIR-PLAN-PKG-WP-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table5";
        SType = "Hidden";
        Label = "Embedded WP";
        Index = "1";
    }

    IN MIR-PLAN-PKG-TYP-CD
    {
        Length = "40";
        SType = "Hidden";
        Label = "Embedded TYP";
    }

    IN MIR-ADDL-PLAN-MAND-IND-T[5]
    {
        Length = "1";
        FieldGroup = "Table5";
        SType = "Hidden";
        Label = "Plan Type";
        Index = "1";
    }

    IN MIR-DV-PLAN-DESC-TXT-T[5]
    {
        Length = "40";
        FieldGroup = "Table5";
        SType = "Hidden";
        Label = "DESC-TXT";
        Index = "1";
    }

}

