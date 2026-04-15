# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:23 PM EDT

#*******************************************************************************
#*  Component:   BF0560-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0560-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0560";
        BusinessFunctionName = "Client Family Member History Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM0560";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    OUT MIR-CLI-REL-DTH-AGE-T[4]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table4";
        DBTableName = "TCLIF";
        SType = "Number";
        Label = "Age at Death";
        Index = "1";
    }

    OUT MIR-CLI-REL-DTH-QTY-T[4]
    {
        Length = "2";
        FieldGroup = "Table4";
        DBTableName = "TCLIF";
        SType = "Text";
        Label = "Number Dead";
        Index = "1";
    }

    OUT MIR-CLI-REL-LVNG-AGE-T[4]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table4";
        DBTableName = "TCLIF";
        SType = "Number";
        Label = "Age if Living";
        Index = "1";
    }

    OUT MIR-CLI-REL-LVNG-QTY-T[4]
    {
        Length = "2";
        FieldGroup = "Table4";
        DBTableName = "TCLIF";
        SType = "Text";
        Label = "Number Living";
        Index = "1";
    }

    OUT MIR-DISORD-1-DTL-IND-T[4]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "DISORD-DTL-IND";
        DBTableName = "TCLIF";
        SType = "Text";
        Label = "Details (1)";
        Index = "1";
    }

    OUT MIR-DISORD-2-DTL-IND-T[4]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "DISORD-DTL-IND";
        DBTableName = "TCLIF";
        SType = "Text";
        Label = "Details (2)";
        Index = "1";
    }

    OUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }

    OUT MIR-HERED-DISORD-1-CD-T[4]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "HDIS";
        DBTableName = "TCLIF";
        SType = "Text";
        Label = "Heredity Disorder (1)";
        Index = "1";
    }

    OUT MIR-HERED-DISORD-2-CD-T[4]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "HDIS";
        DBTableName = "TCLIF";
        SType = "Text";
        Label = "Heredity Disorder (2)";
        Index = "1";
    }

    OUT MIR-HERED-DISORD-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "HERED-DISORD-IND";
        DBTableName = "TAPPF";
        SType = "Text";
        Label = "Client has family history of hereditary disorders";
    }

    OUT MIR-HIST-UNKNWN-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "HIST-UNKNWN-IND";
        DBTableName = "TAPPF";
        SType = "Text";
        Label = "Client's family history is unknown";
    }

    OUT MIR-PREV-UPDT-DT
    {
        Length = "10";
        DBTableName = "TCLIF";
        SType = "Date";
        Label = "Date Last Changed";
    }

    OUT MIR-REL-HLTH-STATE-CD-T[4]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "HLTH";
        DBTableName = "TCLIF";
        SType = "Text";
        Label = "State of Health / Cause of Death";
        Index = "1";
    }

}

