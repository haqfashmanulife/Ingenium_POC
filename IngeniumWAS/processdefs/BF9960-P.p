# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:03 PM EDT

#*******************************************************************************
#*  Component:   BF9960-P.p                                                    *
#*  Description: PA Inquiry                                                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  FT2001  01SEP04  INITIAL VERSION                                           *
#*  P02945  CHANGE MIR-POL-ID TO BASE+SFX                                      *
#*  MFFPI   JE       Will display the Fund Details button if the policy has    *
#*                   any SA rider regardless of coverage status                *
#*                                                                             *
#*******************************************************************************

P-STEP BF9960-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9960";
        BusinessFunctionName = "PA Inquiry";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9960";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-HAS-VAR-IND;
    
    INOUT MIR-INQ-TYP-CD
    {
        Length = "1";
        SType = "YesNoUnanswered";
        Label = "Inquiry Method";
    }
     
    IN MIR-AGT-ID
    {
        Length = "6";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Agent ID";
        DefaultSession = "MIR-AGT-ID";
    }
     
    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }
     
    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID SUFFIX";
    }
     
    INOUT MIR-DV-SRCH-GR-CD
    {
        Length = "2";
        SType = "YesNo";
        Label = "Client Name Search Type";
    }
     
    INOUT MIR-CLI-INDV-SUR-NM 
    {
        Key;
        MixedCase;
        Length = "25";
        SType = "Text";
        Label = "Last Name";
    }
     
    INOUT MIR-CLI-INDV-GIV-NM 
    {
        Key;
        MixedCase;
        Length = "25";
        SType = "Text";
        Label = "First Name";
    }
     
}
