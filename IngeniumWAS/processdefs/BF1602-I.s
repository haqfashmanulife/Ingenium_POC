# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:46 PM EDT

#*******************************************************************************
#*  Component:   BF1602-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1602-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-NTAXBL-NUIC-AMT-T[1]";
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

    INOUT MIR-NTAXBL-NUIC-AMT-T[10]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Non-taxable Benefits - Non-UIC - Any EP";
        Index = "1";
    }

    INOUT MIR-NTAXBL-UIC-EP1-AMT-T[10]
    {
        Length = "5";
        Decimals = "0";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Non-taxable Benefits - UIC - EP <120";
        Index = "1";
    }

    INOUT MIR-NTAXBL-UIC-EP2-AMT-T[10]
    {
        Length = "5";
        Decimals = "0";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Non-taxable Benefits - UIC - EP =120+";
        Index = "1";
    }

    INOUT MIR-TAXBL-NUIC-AMT-T[10]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Taxable Benefits - Non-UIC - Any EP";
        Index = "1";
    }

    INOUT MIR-TAXBL-UIC-EP1-AMT-T[10]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table10";
        KeyColumn;
        SType = "Currency";
        Label = "Taxable Benefits - UIC - EP <120";
        Index = "1";
    }

    INOUT MIR-TAXBL-UIC-EP2-AMT-T[10]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Taxable Benefits - UIC - EP =120+";
        Index = "1";
    }

    IN MIR-CLI-ANN-INCM-AMT
    {
        Key;
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Annual Income";
    }

    IN MIR-CLI-INSRD-AGE
    {
        Key;
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Age";
    }

    IN MIR-OCCP-CLAS-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        SType = "Text";
        Label = "Occupation Class";
    }

}

