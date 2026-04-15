# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:25 PM EDT

#*******************************************************************************
#*  Component:   BF0592-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0592-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Select";
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

    IN MIR-CLI-ID-T[11]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    IN MIR-DV-UW-PRCES-CD-T[11]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "DV-UW-PRCES-CD";
        SType = "Text";
        Label = "Proceed Type";
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

    IN MIR-CLI-BTH-DT-T[11]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table11";
        SType = "Date";
        Label = "Birth Date";
        Index = "1";
    }

    IN MIR-CLI-BTH-LOC-CD-T[11]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "BTLOC";
        SType = "Text";
        Label = "Birth Location";
        Index = "1";
    }

    IN MIR-CLI-CMPLT-CCAS-IND-T[11]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        SType = "Indicator";
        Label = "Clear case processing attempted";
        Index = "1";
    }

    IN MIR-CLI-CRNT-LOC-CD-T[11]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Residence Location";
        Index = "1";
    }

    IN MIR-CLI-SEX-CD-T[11]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    IN MIR-CLI-UWGDECN-CD-T[11]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        SType = "Text";
        Label = "Underwriting Decision";
        Index = "1";
    }

    IN MIR-CLI-UWGDECN-DT-T[11]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table11";
        SType = "Date";
        Label = "UW Decision Changed Date";
        Index = "1";
    }

    IN MIR-DV-INSRD-CLI-NM-T[11]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
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

    IN MIR-POL-MIB-SIGN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-MIB-SIGN-CD";
        SType = "Text";
        Label = "MIB Signature";
    }

}

