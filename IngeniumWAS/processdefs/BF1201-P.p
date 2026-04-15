# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF1201-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1201-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1201";
        BusinessFunctionName = "Rate Header File Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM0131";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-RH-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TRH";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-RH-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "RHDR";
        DBTableName = "TRH";
        SType = "Selection";
        Label = "Rate Header ID";
    }

}

