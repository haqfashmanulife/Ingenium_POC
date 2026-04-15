# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:35 PM EDT

#*******************************************************************************
#*  Component:   BF1172-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1172-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-CLI-MIB-IND-CD";
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

    INOUT MIR-CLI-MIB-IND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-MIB-IND-CD";
        SType = "Selection";
        Label = "MIB Indicator";
    }

    INOUT MIR-CNFD-COMNT-TXT
    {
        Length = "237";
        SType = "Text";
        Label = "Comments";
    }

    INOUT MIR-DV-CLI-MIB-DTL-CD-T[60]
    {
        Length = "15";
        FieldGroup = "Table60";
        SType = "Text";
        Label = "MIB Code";
        Index = "1";
    }

    INOUT MIR-DV-MIB-DTL-TYP-CD-T[60]
    {
        Length = "1";
        FieldGroup = "Table60";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "DV-MIB-DTL-TYP-CD";
        SType = "Selection";
        Label = "Type of MIB Code";
        Index = "1";
    }

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-DOC-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Selection";
        Label = "Document Name";
    }

    IN MIR-UWG-WRKSHT-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Worksheet Number";
    }

    IN MIR-DV-CLI-TOT-UWG-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Total Amount to be Underwritten";
    }

    IN MIR-CLI-UWGDECN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "UW Decision Changed Date";
    }

    IN MIR-CLI-UWGDECN-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        SType = "Text";
        Label = "Underwriting Decision";
    }

    IN MIR-CLI-UWGDECN-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        SType = "Text";
        Label = "Decision Type";
    }

    IN MIR-UW-USER-2-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "2nd Underwriter Initials";
    }

    IN MIR-POL-ID-SFX-T[6]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    IN MIR-UW-USER-1-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "1st Underwriter Initials";
    }

    IN MIR-DV-UWG-WP-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Waiver of premium applied for";
    }

    IN MIR-UWG-WRKSHT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Worksheet Created Date";
    }

    IN MIR-CLI-EARN-INCM-AMT
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Earned Income";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-CLI-TOT-ADB-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Total ADB Amount";
    }

    IN MIR-CLI-PREV-DCLN-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Client previously declined by company";
    }

    IN MIR-CLI-CNFD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Access to client information is confidential";
    }

    IN MIR-POL-CNFD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Policy has been designated as confidential";
    }

    IN MIR-POL-ID-BASE-T[6]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table6";
        KeyColumn;
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-POL-CSTAT-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

    IN MIR-POL-REINS-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REINS-CD";
        SType = "Text";
        Label = "Reinsurance";
    }

    IN MIR-POL-TIA-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Policies covered by Temporary Insurance Agreement";
    }

    IN MIR-DV-CLI-TOT-INS-AMT
    {
        DisplayOnly;
        Length = "15";
        Decimals = "0";
        SType = "Currency";
        Label = "Total Face Amount with All Companies";
    }

}

