# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0781-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0781-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0781";
        BusinessFunctionName = "Location Group Table Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM3010";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-LOC-GR-COLCT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "LOCPT";
        DBTableName = "TLGAS";
        SType = "Selection";
        Label = "Group Location Pointer";
    }

    IN MIR-LOC-GR-EFF-IDT-NUM
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TLGAS";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-LOC-GR-LOC-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        DBTableName = "TLGAS";
        SType = "Selection";
        Label = "Location";
    }

    IN MIR-LOC-GR-TYP-CD
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "LOC-GR-TYP-CD";
        DBTableName = "TLGAS";
        SType = "Selection";
        Label = "Type";
    }

}

