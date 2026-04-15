# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:19 PM EDT

#*******************************************************************************
#*  Component:   BF0281-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0281-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0281";
        BusinessFunctionName = "List Bill Header Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM0281";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-LBILL-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TGR";
        SType = "Text";
        Label = "Group";
    }

    INOUT MIR-LBILL-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TGR";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Billing Date";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TGR";
        SType = "Selection";
        Label = "Sub Company";
    }

}

