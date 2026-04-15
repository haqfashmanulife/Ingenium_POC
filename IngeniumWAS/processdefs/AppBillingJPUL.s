# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AppBillingJPUL.s                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  017797  612J     Correct POL-SNDRY-AMT LENGTH                              *
#*                                                                             *
#*******************************************************************************

S-STEP AppBillingJPUL
{
    ATTRIBUTES
    {
        FocusField = "MIR-POL-SNDRY-AMT";
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

    INOUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-POL-SNDRY-AMT
    {
        Label = "Planned Contribution Amount:";
        SType = "Currency";
        Length = "13";
    }

    INOUT MIR-DV-SBOX-CD-T
    {
        Label = "Billing Method/Frequency:";
        SType = "Selection";
        Length = "30";
        Mandatory;
        CodeSource = "CSOM4901";
        FilterFields = "2";
        FilterField1 = "MIR-POL-ID-BASE";
        FilterField2 = "MIR-POL-ID-SFX";
    }

    OUT MIR-POL-BILL-TYP-CD
    {
        SType = "Hidden";
    }

    OUT MIR-POL-BILL-MODE-CD
    {
        SType = "Hidden";
    }

    INOUT MIR-POL-PAC-DRW-DY
    {
        Label = "Draw Day:";
        SType = "Selection";
        Length = "30";
        Mandatory;
        CodeSource = "CSOM4910";
        FilterFields = "2";
        FilterField1 = "MIR-POL-ID-BASE";
        FilterField2 = "MIR-POL-ID-SFX";
    }

    IN PayorName
    {
        DisplayOnly;
        Label = " Payor Name";
        SType = "Text";
        Length = "50";
    }

    IN MIR-DV-PAYR-CLI-ID
    {
        DisplayOnly;
        Label = "Payor Client ID";
        SType = "Text";
        Length = "10";
    }

    OUT AddCompanyPayorLink
    {
        Label = "Add Company Payor";
        Link;
        SType = "Text";
        Action = "GoToCompanySearch";
    }

    INOUT MIR-BNK-ID-T[9]
    {
        Length = "4";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Bank Number";
        Index = "1";
    }

    INOUT MIR-BNK-BR-ID-T[9]
    {
        Length = "5";
        FieldGroup = "Table9";
        SType = "Text";
        Label = "Branch Number";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-ID-T[9]
    {
        Label = "Account";
        FieldGroup = "Table1";
        SType = "Text";
        Length = "15";
        Index = "1";
    }

    IN MIR-BNK-NM-T[9]
    {
        Label = "Bank Name";
        FieldGroup = "Table1";
        SType = "Text";
        DisplayOnly;
        Length = "20";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM-T[9]
    {
        Label = "Account Holder";
        FieldGroup = "Table1";
        SType = "Text";
        Length = "50";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-TYP-CD-T[9]
    {
        Label = "Account Type";
        FieldGroup = "Table1";
        SType = "Selection";
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-MICR-IND-T[9]
    {
        Label = "MICR Indicator";
        FieldGroup = "Table1";
        SType = "Indicator";
        Index = "1";
    }


    # RADIO BUTTON TO TRACK SPECIAL FREQUENCY
    # REQUESTED.

    INOUT SFYesNo
    {
        SType = "YesNo";
        Label = "Special Frequency Requested?";
        DefaultConstant = "N";
    }

    INOUT MIR-DV-LBILL-CLI-ID
    {
        Length = "10";
        SType = "Text";
        Label = "List Bill Client ID";
    }

    IN MIR-DV-LBILL-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "ListBill Name";
    }

    INOUT MIR-POL-LBILL-DRW-DY
    {
        Label = "Listbill Draw Day:";
        SType = "Selection";
        Length = "30";
        Mandatory;
        CodeSource = "CSOM4910";
        FilterFields = "2";
        FilterField1 = "MIR-POL-ID-BASE";
        FilterField2 = "MIR-POL-ID-SFX";
    }

    INOUT MIR-POL-SFB-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-SFB-CD";
        SType = "Selection";
        Label = "Number of Special Frequency Bills produced Annually";
    }

    INOUT MIR-SFB-END-DT
    {
        Length = "10";
        SType = "Date";
        Label = "SFB End Date";
    }

    INOUT MIR-SFB-GP-END-DT-NUM
    {
        Length = "10";
        SType = "Text";
        Label = "SFB Gap End Date";
    }

    INOUT MIR-SFB-GP-STRT-DT-NUM
    {
        Length = "10";
        SType = "Text";
        Label = "SFB Gap Start Date";
    }

    INOUT MIR-SFB-SEMI-MTHLY-DY
    {
        Label = "Alternate Listbill Draw Day:";
        SType = "Selection";
        Length = "30";
        Mandatory;
        CodeSource = "CSOM4910";
        FilterFields = "2";
        FilterField1 = "MIR-POL-ID-BASE";
        FilterField2 = "MIR-POL-ID-SFX";
    }

    INOUT MIR-SFB-STRT-DT
    {
        Length = "10";
        Mandatory;
        SType = "Date";
        Label = "SFB Start Date";
    }

}


