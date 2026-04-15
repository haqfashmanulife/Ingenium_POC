# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:50 PM EDT

#*******************************************************************************
#*  Component:   BF2102-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2102-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2102";
        BusinessFunctionName = "Rate Percentage Table Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0051";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-COMM-TYP-CD-T[11]
    {
        Mandatory;
        Length = "1";
        FieldGroup = "Table11";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "COMM-TYP-CD";
        DBTableName = "TCC";
        SType = "Selection";
        Label = "Commission Type";
        Index = "1";
    }

    INOUT MIR-RTBL2-1-RT-T[11]
    {
        Mandatory;
        Signed;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table11";
        DBTableName = "TCC";
        SType = "Percent";
        Label = "Percentage Rate";
        Index = "1";
    }

    IN MIR-RTBL2-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PCNT";
        DBTableName = "TCC";
        SType = "Selection";
        Label = "Percentage Table Pointer";
    }

}

