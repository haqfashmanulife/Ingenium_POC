# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0790-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0790-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0790";
        BusinessFunctionName = "Policy Dividend Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM3020";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-LOC-GR-ID
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPDIV";
        SType = "Selection";
        Label = "Location Group";
    }

    IN MIR-PLAN-DIV-OPT-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-DIV-OPT-CD";
        DBTableName = "TPDIV";
        SType = "Selection";
        Label = "Dividend Option";
    }

    IN MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Plan";
    }

    OUT MIR-PLAN-DIV-ALLOC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-DIV-ALLOC-CD";
        DBTableName = "TPDIV";
        SType = "Selection";
        Label = "Dividend Reallocation";
    }

    OUT MIR-PLAN-DIV-DFLT-IND
    {
        Length = "1";
        DBTableName = "TPDIV";
        SType = "Indicator";
        Label = "Default Dividend Option";
    }

}

