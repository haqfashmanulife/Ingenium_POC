# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9862-P.p                                                    *
#*  Description: Claim Requirements Table (CRTB) Update step                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL102  HIN/CL   CLAIM REQUIREMENTS                                        *
#*                                                                             *
#*******************************************************************************

P-STEP BF9862-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9862";
        BusinessFunctionName = "Claim Requirement Table Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9862";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
    
    INOUT MIR-CLM-REQIR-OPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLM-REQIR-OPT-CD";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "Claim Requirement Level";
    }

    INOUT MIR-FOLWUP-1-DOC-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TCRTB";
        SType = "Selection";
        Label = "1st Follow-up Reminder: Name of Document";
    }

    INOUT MIR-FOLWUP-1-DY-DUR
    {
        Length = "2";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "1st Follow-up Reminder: Number of Days";
    }

    INOUT MIR-FOLWUP-2-DOC-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TCRTB";
        SType = "Selection";
        Label = "2nd Follow-up Reminder: Name of Document";
    }

    INOUT MIR-FOLWUP-2-DY-DUR
    {
        Length = "2";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "2nd Follow-up Reminder: Number of Days";
    }

    INOUT MIR-FOLWUP-3-DOC-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TCRTB";
        SType = "Selection";
        Label = "3rd Follow-up Reminder: Name of Document";
    }

    INOUT MIR-FOLWUP-3-DY-DUR
    {
        Length = "2";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "3rd Follow-up Reminder: Number of Days";
    }

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

}
