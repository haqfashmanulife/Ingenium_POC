# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:43 PM EDT

#*******************************************************************************
#*  Component:   BF1643-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1643-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1643";
        BusinessFunctionName = "Event Requirment Table Delete";
        BusinessFunctionType = "Delete";
        MirName = "NCWM3110";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-BUS-CLAS-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        DBTableName = "TEVRQ";
        SType = "Selection";
        Label = "Class of Business";
    }

    IN MIR-EVNT-REQIR-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TEVRQ";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-EVNT-REQIR-TYP-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "EVNT-REQIR-TYP-CD";
        DBTableName = "TEVRQ";
        SType = "Selection";
        Label = "Requirement";
    }

    IN MIR-LOC-GRP-ID
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TEVRQ";
        SType = "Selection";
        Label = "Location Group";
    }

}

