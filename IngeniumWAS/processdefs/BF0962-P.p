# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:32 PM EDT

#*******************************************************************************
#*  Component:   BF0962-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0962-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0962";
        BusinessFunctionName = "Undo/Redo Activity Table Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM4500";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ACTV-PRCES-CD-T[12]
    {
        Mandatory;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-ACTV-PRCES-CD";
        DBTableName = "TPTAB";
        SType = "Selection";
        Label = "Automatic Undo/Redo";
        Index = "1";
    }

    INOUT MIR-POL-ACTV-REDO-CD-T[12]
    {
        Length = "4";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-ACTV-REDO-CD";
        DBTableName = "TPTAB";
        SType = "Selection";
        Label = "Activity Instructions";
        Index = "1";
    }

    IN MIR-POL-ACTV-TYP-ID
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TPTAB";
        SType = "Text";
        Label = "Activity Number";
    }

}

