# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:46 PM EDT

#*******************************************************************************
#*  Component:   BF1604-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1604-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-CLI-INSRD-AGE";
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

    INOUT MIR-CLI-ANN-INCM-AMT
    {
        Key;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Annual Income";
    }

    INOUT MIR-CLI-INSRD-AGE
    {
        Key;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Age";
    }

    INOUT MIR-OCCP-CLAS-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        SType = "Selection";
        Label = "Occupation Class";
    }

    IN MIR-CLI-ANN-INCM-AMT-T[10]
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table10";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Annual Income";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-NTAXBL-NUIC-AMT-T[10]
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Non-taxable Benefits - Non-UIC - Any EP";
        Index = "1";
    }

    IN MIR-NTAXBL-UIC-EP1-AMT-T[10]
    {
        DisplayOnly;
        Length = "5";
        Decimals = "0";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Non-taxable Benefits - UIC - EP <120";
        Index = "1";
    }

    IN MIR-NTAXBL-UIC-EP2-AMT-T[10]
    {
        DisplayOnly;
        Length = "5";
        Decimals = "0";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Non-taxable Benefits - UIC - EP =120+";
        Index = "1";
    }

    IN MIR-TAXBL-NUIC-AMT-T[10]
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Taxable Benefits - Non-UIC - Any EP";
        Index = "1";
    }

    IN MIR-TAXBL-UIC-EP1-AMT-T[10]
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Taxable Benefits - UIC - EP <120";
        Index = "1";
    }

    IN MIR-TAXBL-UIC-EP2-AMT-T[10]
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Taxable Benefits - UIC - EP =120+";
        Index = "1";
    }

}

