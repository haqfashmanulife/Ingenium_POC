# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:27 PM EDT

#*******************************************************************************
#*  Component:   BF0675-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0675-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0675";
        BusinessFunctionName = "Unit Value Table Expand";
        BusinessFunctionType = "Expand";
        MirName = "CCWM0811";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-UVAL-AGE
    {
        Key;
        Length = "3";
        Decimals = "0";
        DBTableName = "TUV";
        SType = "Number";
        Label = "Age";
    }

    IN MIR-UVAL-HIGH-DUR
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TUV";
        DefaultConstant = "000";
        SType = "Text";
        Label = "High Duration Limit";
    }

    IN MIR-UVAL-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "UVAL";
        DBTableName = "TUV";
        SType = "Selection";
        Label = "Plan";
    }

    IN MIR-UVAL-LOW-DUR
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TUV";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Low Duration Limit";
    }

    IN MIR-UVAL-PAR-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UVAL-PAR-CD";
        DBTableName = "TUV";
        SType = "Selection";
        Label = "Dividend Option";
    }

    IN MIR-UVAL-SEX-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UVAL-SEX-CD";
        DBTableName = "TUV";
        SType = "Selection";
        Label = "Sex";
    }

    IN MIR-UVAL-SMKR-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UVAL-SMKR-CD";
        DBTableName = "TUV";
        SType = "Selection";
        Label = "Smoker";
    }

    IN MIR-UVAL-STBL-1-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB1";
        DBTableName = "TUV";
        SType = "Selection";
        Label = "Sub-table 1";
    }

    IN MIR-UVAL-STBL-2-CD
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TUV";
        SType = "Selection";
        Label = "Sub-table 2";
    }

    IN MIR-UVAL-STBL-3-CD
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "STB3";
        DBTableName = "TUV";
        SType = "Selection";
        Label = "Sub-table 3";
    }

    IN MIR-UVAL-STBL-4-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TUV";
        SType = "Selection";
        Label = "Sub-table 4";
    }

    IN MIR-UVAL-TYP-CD
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "UVREC";
        DBTableName = "TUV";
        SType = "Selection";
        Label = "Unit Value Type";
    }

}

