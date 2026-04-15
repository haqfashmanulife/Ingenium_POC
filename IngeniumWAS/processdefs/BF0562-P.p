# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:23 PM EDT

#*******************************************************************************
#*  Component:   BF0562-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0562-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0562";
        BusinessFunctionName = "Client Family Member History Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM0560";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-REL-DTH-AGE-T[4]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table4";
        DBTableName = "TCLIF";
        SType = "Number";
        Label = "Age at Death";
        Index = "1";
    }

    INOUT MIR-CLI-REL-DTH-QTY-T[4]
    {
        Length = "2";
        FieldGroup = "Table4";
        DBTableName = "TCLIF";
        SType = "Text";
        Label = "Number Dead";
        Index = "1";
    }

    INOUT MIR-CLI-REL-LVNG-AGE-T[4]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table4";
        DBTableName = "TCLIF";
        SType = "Number";
        Label = "Age if Living";
        Index = "1";
    }

    INOUT MIR-CLI-REL-LVNG-QTY-T[4]
    {
        Length = "2";
        FieldGroup = "Table4";
        DBTableName = "TCLIF";
        SType = "Text";
        Label = "Number Living";
        Index = "1";
    }

    INOUT MIR-DISORD-1-DTL-IND-T[4]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "DISORD-DTL-IND";
        DBTableName = "TCLIF";
        SType = "Selection";
        Label = "Details (1)";
        Index = "1";
    }

    INOUT MIR-DISORD-2-DTL-IND-T[4]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "DISORD-DTL-IND";
        DBTableName = "TCLIF";
        SType = "Selection";
        Label = "Details (2)";
        Index = "1";
    }

    INOUT MIR-HERED-DISORD-1-CD-T[4]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "HDIS";
        DBTableName = "TCLIF";
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
        DBTableName = "TCLIF";
        SType = "Selection";
        Label = "Heredity Disorder (2)";
        Index = "1";
    }

    INOUT MIR-HERED-DISORD-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "HERED-DISORD-IND";
        DBTableName = "TAPPF";
        SType = "Selection";
        Label = "Client has family history of hereditary disorders";
    }

    INOUT MIR-HIST-UNKNWN-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "HIST-UNKNWN-IND";
        DBTableName = "TAPPF";
        SType = "Selection";
        Label = "Client's family history is unknown";
    }

    INOUT MIR-REL-HLTH-STATE-CD-T[4]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "HLTH";
        DBTableName = "TCLIF";
        SType = "Selection";
        Label = "State of Health / Cause of Death";
        Index = "1";
    }

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

}

