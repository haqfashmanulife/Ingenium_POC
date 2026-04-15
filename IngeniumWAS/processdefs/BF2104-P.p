# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:50 PM EDT

#*******************************************************************************
#*  Component:   BF2104-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2104-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2104";
        BusinessFunctionName = "Rate Percentage Table List";
        BusinessFunctionType = "List";
        MirName = "CCWM0051";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-RTBL2-ID
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PCNT";
        DBTableName = "TCC";
        SType = "Selection";
        Label = "Percentage Table Pointer";
    }

    OUT MIR-RTBL2-1-RT-T[11]
    {
        Signed;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table11";
        DBTableName = "TCC";
        SType = "Percent";
        Label = "Percentage Rate";
        Index = "1";
    }

    OUT MIR-RTBL2-ID-T[11]
    {
        Length = "5";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "PCNT";
        DBTableName = "TCC";
        SType = "Text";
        Label = "Percentage Table Pointer";
        Index = "1";
    }

}

