# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:47 PM EDT

#*******************************************************************************
#*  Component:   BF1952-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1952-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1952";
        BusinessFunctionName = "Country Table Update";
        BusinessFunctionType = "Update";
        MirName = "XCWM0161";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CTRY-DT-FRMT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CTRY-DT-FRMT-CD";
        DBTableName = "TCTRY";
        SType = "Selection";
        Label = "Date Format";
    }

    INOUT MIR-CTRY-DT-SPRT-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "DSEPA";
        DBTableName = "TCTRY";
        SType = "Selection";
        Label = "Date Separator";
    }

    INOUT MIR-CTRY-LEAD-ZERO-IND
    {
        Length = "1";
        DBTableName = "TCTRY";
        SType = "Indicator";
        Label = "Suppress leading zeros";
    }

    IN MIR-CO-ID
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TCTRY";
        SType = "Selection";
        Label = "Company";
    }

    IN MIR-CTRY-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TCTRY";
        SType = "Selection";
        Label = "Country";
    }

}

