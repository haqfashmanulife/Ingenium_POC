# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A61-P.p                                                    *
#*  Description: Requirement Create                                            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCAAD  CTS      Initial Version                                           *
#*                                                                             *
#*******************************************************************************

P-STEP BF9A61-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A61";
        BusinessFunctionName = "Requirement Create";
        BusinessFunctionType = "Update";
        MirName = "CCWM9A61";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Death Master Claim ID";
    }
    
    INOUT MIR-DTH-CLM-STAT-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLM-STAT-CD";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Death Master Claim Status";
    }
    
    INOUT MIR-POL-ID
    {
        
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }
    
    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TDCRQT";
        SType = "Text";
        Label = "Coverage Number";
    }
    
    INOUT MIR-DTH-CLM-REQIR-OPT-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "DCRQT";
        SType = "YesNoUnanswered";
        Label = "Policy Requirement";
    }
    
    INOUT MIR-DTH-CLM-REQIR-ID
    {
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DCRQT";
        SType = "Selection";
        Label = "Requirement";
     }
     
     INOUT MIR-DTH-CRQT-STAT-CD
     {
        Mandatory;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CRQT-STAT-CD";
        SType = "Selection";
        Label = "Requirement Status";
     }
     
     INOUT MIR-DTH-CRQT-ORDR-DT
     {
        Length = "10";
        SType = "Date";
        Label = "Ordered Date";
     }
     
     INOUT MIR-DTH-CRQT-RECV-DT
     {
        Length = "10";
        SType = "Date";
        Label = "Received Date";
     }
}
