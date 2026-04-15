# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9864-P.p                                                    *
#*  Description: Claim Requirements Table (CRTB) List step                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL102  HIN/CL   CLAIM REQUIREMENTS                                        *
#*                                                                             *
#*******************************************************************************

P-STEP BF9864-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9864";
        BusinessFunctionName = "Claim Requirement Table List";
        BusinessFunctionType = "List";
        MirName = "CCWM9864";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLM-REQIR-ID
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CMRTC";
        DBTableName = "TCRTB";
        SType = "Selection";
        Label = "Claim Requirement Code";
    }
    
    OUT MIR-CLM-REQIR-OPT-CD-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "CLM-REQIR-OPT-CD";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "Claim Requirement Level";
        Index = "1";        
    }
    
    OUT MIR-FOLWUP-1-DOC-ID-T[11]
    {
        Length = "5";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "1st Follow-up Reminder: Name of Document";
        Index = "1";
    }

    OUT MIR-FOLWUP-1-DY-DUR-T[11]
    {
        Length = "2";
        FieldGroup = "Table11";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "1st Follow-up Reminder: Number of Days";
        Index = "1";
    }

    OUT MIR-FOLWUP-2-DOC-ID-T[11]
    {
        Length = "5";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "2nd Follow-up Reminder: Name of Document";
        Index = "1";
    }

    OUT MIR-FOLWUP-2-DY-DUR-T[11]
    {
        Length = "2";
        FieldGroup = "Table11";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "2nd Follow-up Reminder: Number of Days";
        Index = "1";
    }

    OUT MIR-FOLWUP-3-DOC-ID-T[11]
    {
        Length = "5";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "3rd Follow-up Reminder: Name of Document";
        Index = "1";
    }

    OUT MIR-FOLWUP-3-DY-DUR-T[11]
    {
        Length = "2";
        FieldGroup = "Table11";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "3rd Follow-up Reminder: Number of Days";
        Index = "1";
    }

    OUT MIR-CLM-REQIR-ID-T[11]
    {
        Length = "5";
        FieldGroup = "Table11";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "CMRTC";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "Claim Requirement Code";
        Index = "1";
    }

}
