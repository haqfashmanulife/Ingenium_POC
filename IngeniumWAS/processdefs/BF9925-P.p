#*******************************************************************************
#*  Component:   BF9925-P.p                                                    *
#*  Description: AGENT INQUIRY                                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP0026  CTS      Initial version                                           *
#*******************************************************************************

P-STEP BF9925-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9925";
        BusinessFunctionName = "Agent Inquiry";
        BusinessFunctionType = "Inquiry";
        MirName = "CCWM9925";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-AGT-ID
    {
        Key;
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent Id";
    }

    OUT MIR-DV-RO-SO-CD
    {
        Length = "10";
        DBTableName = "TAG";
        SType = "Text";
        Label = "RO-SO Code";
    }

    OUT MIR-AGT-NM
    {
        Length = "50";
        DBTableName = "TCLNC";
        SType = "Text";
        Label = "PA Name";
    }
}
