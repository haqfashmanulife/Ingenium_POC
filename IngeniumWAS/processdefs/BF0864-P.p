# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:30 PM EDT

#*******************************************************************************
#*  Component:   BF0864-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0864-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0864";
        BusinessFunctionName = "Agent Balance List";
        BusinessFunctionType = "List";
        MirName = "CCWM3350";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-AGT-ID
    {
        Key;
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent ID";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-AGT-ID-T[12]
    {
        Length = "6";
        FieldGroup = "Table12";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    OUT MIR-AGT-PAYBL-BAL-AMT-T[12]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table12";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Current Balance";
        Index = "1";
    }

    OUT MIR-DV-COMM-AGT-NM-T[12]
    {
        Length = "30";
        FieldGroup = "Table12";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Agent Name";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

