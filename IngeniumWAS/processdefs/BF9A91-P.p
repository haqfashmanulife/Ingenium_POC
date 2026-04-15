# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*********************************************************************************
#*  Component:   BF9A91-P.p                                                      *
#*  Description: Create Client Relationship record                               *
#*                                                                               *
#*********************************************************************************
#*  Chg#    Release  Description                                                 *
#*                                                                               *
#*  IPCAPM  CTS      Intial Version                                              *
#*********************************************************************************

P-STEP BF9A91-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A91";
        BusinessFunctionName = "Claim Relationship Table Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9A90";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;



    IN MIR-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Death Master Claim ID";
    }

    IN MIR-DCRL-TYP-CD
     {
         Key;
         Length = "1";
         DBTableName = "TDCRL";
         SType = "Text";
         Label = "Relationship Type";
     }

    INOUT MIR-DCRL-SEQ-NUM
   {
       Length = "3";
       DBTableName = "TDCRL";
       SType = "Text";
       Label = "Sequence Number";
       Index = "1";
    }
    


}
