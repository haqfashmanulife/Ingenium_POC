# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:12 PM EDT

#*******************************************************************************
#*  Component:   AppSignatures.s                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  016824  611J     Move Effective date fields to Application Data page       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AppSignatures
{
    ATTRIBUTES
    {
        FocusField = "MIR-POL-MIB-SIGN-CD";
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

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }


    #*****************************************************
    #  Field Definitions
    #*****************************************************

    INOUT MIR-POL-MIB-SIGN-CD
    {
        Label = "Have the MIB signatures been received?";
        SType = "YesNo";
        DefaultConstant = "Y";
    }

    INOUT MIR-POL-APP-SIGN-IND
    {
        Label = "Have all the other signatures been received?";
        SType = "YesNo";
        DefaultConstant = "N";
    }

    INOUT MIR-POL-APP-SIGN-DT
    {
        Length = "10";
        Mandatory;
        SType = "Date";
        Label = "Application Signed Date";
    }

    IN MIR-POL-ISS-LOC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Issue Location of the Policy";
    }

    INOUT MIR-POL-INS-PURP-CD
    {
        Length = "1";
        DefaultConstant = "P";
        CodeSource = "EDIT";
        CodeType = "PURP";
        SType = "Selection";
        Label = "Purpose of Insurance";
    }

    INOUT AgentSplitCommission
    {
        Label = "Are there split commissions on this application?";
        SType = "YesNo";
        DefaultConstant = "N";
    }

    IN MIR-DV-AGT-CLI-NM-T[3]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Agent Name";
        Index = "1";
    }

    INOUT MIR-AGT-ID-T[3]
    {
        Length = "6";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Writing Agent ID";
        Index = "1";
    }

    INOUT MIR-POL-AGT-SHR-PCT-T[3]
    {
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table3";
        SType = "Percent";
        Label = "% Split";
        Index = "1";
    }

    OUT AgentSearchLink-T[3]
    {
        Label = "Search for Agent";
        Link;
        SType = "Text";
        Action = "GoToAgentSearch";
        FieldGroup = "Table3";
        Index = "1";
    }

    IN MIR-DV-SERV-AGT-NM
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Service Agent Name";
    }

    INOUT MIR-SERV-AGT-ID
    {
        Length = "6";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Service Agent ID";
    }

    INOUT MIR-SERV-BR-ID
    {
        Length = "5";
        FieldGroup = "Table4";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Selection";
        Label = "Branch";
    }

    OUT AgentSearchLink
    {
        Label = "Search for Agent";
        Link;
        SType = "Text";
        Action = "GoToAgentSearchService";
        FieldGroup = "Table4";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-AGT-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Hidden";
        Label = "Owner's preferred agent";
    }

    INOUT MIR-POL-COMNT-TXT
    {
        Length = "50";
        SType = "Text";
        Label = "Comments/Remarks";
    }

}

