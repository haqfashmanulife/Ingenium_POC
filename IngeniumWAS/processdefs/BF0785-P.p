# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0785-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0785-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0785";
        BusinessFunctionName = "Location Group Table Copy";
        BusinessFunctionType = "Copy";
        MirName = "CCWM3010";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-LOC-GR-COLCT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "LOCPT";
        DBTableName = "TLGAS";
        SType = "Selection";
        Label = "From Group Location Pointer";
    }

    INOUT MIR-LOC-GR-COLCT-ID-TO
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "LOCPT";
        DBTableName = "TLGAS";
        SType = "Selection";
        Label = "To Group Location Pointer";
    }

    INOUT MIR-LOC-GR-TYP-CD
    {
        Key;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "LOC-GR-TYP-CD";
        DBTableName = "TLGAS";
        SType = "Selection";
        Label = "From Type";
    }

    INOUT MIR-LOC-GR-TYP-CD-TO
    {
        Key;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "LOC-GR-TYP-CD";
        DBTableName = "TLGAS";
        SType = "Selection";
        Label = "To Type";
    }

}

