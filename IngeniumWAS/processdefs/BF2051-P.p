# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:49 PM EDT

#*******************************************************************************
#*  Component:   BF2051-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2051-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2051";
        BusinessFunctionName = "Laboratory Requirement Test Table Create";
        BusinessFunctionType = "Create";
        MirName = "NCWM2050";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-LAB-ID
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LABCD";
        DBTableName = "TLRTT";
        SType = "Selection";
        Label = "Laboratory";
    }

    IN MIR-LTST-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        DBTableName = "TLRTT";
        SType = "Selection";
        Label = "Test";
    }

    IN MIR-REQIR-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TLRTT";
        SType = "Selection";
        Label = "Lab Requirement";
    }

    IN MIR-REQIR-LTST-RGN-CD
    {
        Key;
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TLRTT";
        SType = "Selection";
        Label = "Region";
    }

    OUT MIR-LTST-ID-T[11]
    {
        Length = "40";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        DBTableName = "TLRTT";
        SType = "Text";
        Label = "Test Description";
        Index = "1";
    }

}

