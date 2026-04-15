# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9274-P.p                                                    *
#*  Description: Claim Requirement Create                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL106  HIN/CL   Initial Version                                           *
#*  HCCL05  HIN/CL   Pick-up Facility                                          *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*******************************************************************************

P-STEP BF9274-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9274";
        BusinessFunctionName = "Claim Requirement Create";
        BusinessFunctionType = "Update";
        MirName = "CCWM9274";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Claim ID";
    }
    INOUT MIR-CLMA-CLM-STAT-CD
    {
        Key;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLMA-CLM-STAT-CD";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim Status";
    }
    INOUT MIR-POL-ID
    {
        Key;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }
    INOUT MIR-CVG-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
    }
    INOUT MIR-BNFT-NM-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Benefit Name";
    }
    INOUT MIR-PLAN-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Rider Name";
    }
    INOUT MIR-CLMA-ASSOC-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Associated Master Claim";
    }
    INOUT MIR-CLMA-HIST-CLM-IND  
    {
        Key;
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Historical Claim";
    }
#UYSDMC CHANGES STARTS HERE
    INOUT MIR-CLMA-USYS-CLM-IND  
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Unisys Claim";
    }
#UYSDMC CHANGES ENDS HERE
    INOUT MIR-CLM-REQIR-OPT-CD
    {
        Length = "1";
        DBTableName = "TCRTB";
        SType = "YesNoUnanswered";
        Label = "Claim Requirement Level";
    }
    INOUT MIR-CLM-REQIR-ID
    {
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CMRTC";
        DBTableName = "TCRTB";
        SType = "Selection";
        Label = "Requirement";
     }
     INOUT MIR-CRQT-STAT-CD
     {
        Mandatory;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CRQT-STAT-CD";
        DBTableName = "TCRQT";
        SType = "Selection";
        Label = "Requirement Status";
     }
     INOUT MIR-CRQT-ORDR-DT
     {
        Length = "10";
        DBTableName = "TCRQT";
        SType = "Date";
        Label = "Ordered Date";
     }
     INOUT MIR-CRQT-RECV-DT
     {
        Length = "10";
        DBTableName = "TCRQT";
        SType = "Date";
        Label = "Received Date";
     }
}
