# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A51-P.p                                                    *
#*  Description: Death Master Claim Create                                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC   CTS     INITIAL VERSION                                           *
#*                                                                             *
#*******************************************************************************

P-STEP BF9A51-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A51";
        BusinessFunctionName = "Death Master Claim Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9A51";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TDCLM";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client ID";
    }
    
    INOUT MIR-POL-ID
    {
        Key;
        Length = "10";
        DBTableName = "TDCLM";
        DefaultSession = "MIR-POL-ID";
        SType = "Text";
        Label = "Policy ID";

    }
    
    OUT MIR-CLM-ID
    {
        Length = "8";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Death Master Claim ID";
        
     }   
}