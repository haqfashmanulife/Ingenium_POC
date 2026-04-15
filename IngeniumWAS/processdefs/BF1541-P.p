# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:41 PM EDT

#*******************************************************************************
#*  Component:   BF1541-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1541-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1541";
        BusinessFunctionName = "Lab Test Standard Table Create";
        BusinessFunctionType = "Create";
        MirName = "NCWM1370";
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
        DBTableName = "TLABT";
        SType = "Selection";
        Label = "Laboratory";
    }

    IN MIR-LTST-ID
    {
        Key;
        Mandatory;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        DBTableName = "TLABT";
        SType = "Selection";
        Label = "Lab Test Number";
    }

    IN MIR-LTST-STD-AGE-QTY
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TLABT";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Highest Age for Test";
    }

    IN MIR-LTST-STD-SEX-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LTST-STD-SEX-CD";
        DBTableName = "TLABT";
        SType = "Selection";
        Label = "Sex";
    }

}

