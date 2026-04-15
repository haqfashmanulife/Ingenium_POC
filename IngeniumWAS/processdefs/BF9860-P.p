# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9860-P.p                                                    *
#*  Description: Claim Requirements Table (CRTB) Retrieve step                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL102  HIN/CL   CLAIM REQUIREMENTS                                        *
#*                                                                             *
#*******************************************************************************

P-STEP BF9860-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9860";
        BusinessFunctionName = "Claim Requirement Table Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9860";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLM-REQIR-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CMRTC";
        DBTableName = "TCRTB";
        SType = "Selection";
        Label = "Claim Requirement Code";
    }
    
    OUT MIR-CLM-REQIR-OPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLM-REQIR-OPT-CD";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "Claim Requirement Level";
    }

    OUT MIR-FOLWUP-1-DOC-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "1st Follow-up Reminder: Name of Document";
    }

    OUT MIR-FOLWUP-1-DY-DUR
    {
        Length = "2";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "1st Follow-up Reminder: Number of Days";
    }

    OUT MIR-FOLWUP-2-DOC-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "2nd Follow-up Reminder: Name of Document";
    }

    OUT MIR-FOLWUP-2-DY-DUR
    {
        Length = "2";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "2nd Follow-up Reminder: Number of Days";
    }

    OUT MIR-FOLWUP-3-DOC-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "3rd Follow-up Reminder: Name of Document";
    }

    OUT MIR-FOLWUP-3-DY-DUR
    {
        Length = "2";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "3rd Follow-up Reminder: Number of Days";
    }

}
