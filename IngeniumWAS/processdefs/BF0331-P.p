# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:19 PM EDT

#*******************************************************************************
#*  Component:   BF0331-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0331-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0331";
        BusinessFunctionName = "Age & Amount Table Create";
        BusinessFunctionType = "Create";
        MirName = "NCWM0330";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DFLT-REQIR-AGE
    {
        Key;
        Mandatory;
        Length = "3";
        Decimals = "0";
        DBTableName = "TATAB";
        SType = "Number";
        Label = "Maximum Age";
    }

    IN MIR-DFLT-REQIR-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "AATBL";
        DBTableName = "TATAB";
        SType = "Selection";
        Label = "Table Name";
    }

    IN MIR-DFLT-REQIR-TCR-AMT
    {
        Key;
        Mandatory;
        Length = "15";
        Decimals = "0";
        DBTableName = "TATAB";
        SType = "Currency";
        Label = "Maximum Coverage Amount";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TATAB";
        SType = "Selection";
        Label = "Location Group";
    }

    IN MIR-OCCP-CLAS-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        DBTableName = "TATAB";
        SType = "Selection";
        Label = "Occupation Class";
    }

}

