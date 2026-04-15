# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9A54-P.p                                                    *
#*  Description:Supports the Death Claim Search - Death Claim List Screen      *
#*              The Death Claim records  for the selected client are listed    *
#*                                                                             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Who      Description                                               *
#*                                                                             *
#*  IPCACS  CTS      DEATH CLAIM SEARCH - DEATH CLAIM LIST SCREEN              *
#*                                                                             *
#*******************************************************************************

P-STEP BF9A54-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A54";
        BusinessFunctionName = "Death Claim Search - Death Claim List";
        BusinessFunctionType = "List";
        MirName = "CCWM9A54";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CLI-ID
    {
        Length = "10";
        KeyColumn;
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Client ID";
        Index = "1";
    }

    INOUT MIR-DV-CLI-NM
    {
        Length = "60";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Name";
        Index = "1";
    }

    INOUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "BirthDate";
        Index = "1";
    }

    INOUT MIR-CLI-SEX-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    OUT MIR-CLM-ID-T[20]
    {
        Length = "08";
        KeyColumn;
        FieldGroup = "Table20";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Death Master Claim ID";
        Index = "1";
    }

    OUT MIR-CLM-STAT-CD-T[20]
    {
        Length = "01";
        DisplayOnly;
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CLM-STAT-CD";
        SType = "Text";
        Label = "Death Master Claim Status";
        Index = "1";
    }

    OUT MIR-CLM-HO-NOTI-DT-T[20]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table20";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Head Office Notification Date";
        Index = "1";
    }

    OUT MIR-CLM-HO-ACPT-DT-T[20]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table20";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Head Office Claim Form Acceptance Date";
        Index = "1";
    }

}

