# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:46 PM EDT

#*******************************************************************************
#*  Component:   BF1843-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1843-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1843";
        BusinessFunctionName = "Fund Income Allocation Record Delete";
        BusinessFunctionType = "Delete";
        MirName = "SCWM0140";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-FND-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFT";
        SType = "Selection";
        Label = "Fund ID";
    }

    IN MIR-FNDTAX-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TFT";
        SType = "Date";
        Label = "Effective Date";
    }

}

