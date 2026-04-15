# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:49 PM EDT

#*******************************************************************************
#*  Component:   BF2054-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  PF13    BMB      Resize MIR-LTST-ID-T[11] to MIR-LTST-ID-T[30]             *
#*                                                                             *
#*******************************************************************************

P-STEP BF2054-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2054";
        BusinessFunctionName = "Laboratory Requirement Test Table List";
        BusinessFunctionType = "List";
        MirName = "NCWM2050";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-LAB-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LABCD";
        DBTableName = "TLRTT";
        SType = "Selection";
        Label = "Laboratory";
    }

    INOUT MIR-LTST-ID
    {
        Key;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        DBTableName = "TLRTT";
        SType = "Selection";
        Label = "Test";
    }

    INOUT MIR-REQIR-ID
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TLRTT";
        SType = "Selection";
        Label = "Lab Requirement";
    }

    INOUT MIR-REQIR-LTST-RGN-CD
    {
        Key;
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TLRTT";
        SType = "Selection";
        Label = "Region";
    }

# array resized to 30 as per PF13 upgrade
    OUT MIR-LTST-ID-T[30]
    {
        Length = "40";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        DBTableName = "TLRTT";
        SType = "Text";
        Label = "Test";
        Index = "1";
    }

}

