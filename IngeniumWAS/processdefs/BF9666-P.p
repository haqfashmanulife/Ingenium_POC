# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*********************************************************************************
#*  Component:   BF9666-P.p                                                                                *
#*  Description: Create Client Relationship record                                       *
#*                                                                                                                                     *
#**********************************************************************************
#*  Chg#    Release  Description                                                                           *
#*                                                                                                                                     *
#*  HCL103  HIN/CL   ADD A PAYEE                                 (HCL103C)            *
#**********************************************************************************

P-STEP BF9666-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9666";
        BusinessFunctionName = "Claim Relationship Table Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9666";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;



    IN MIR-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim ID";
    }
    
    IN MIR-CLRL-REL-TYP-CD
     {
         Key;
         Length = "1";
         DBTableName = "TCLRL";
         SType = "Text";
         Label = "Relationship Type";
     }
 
    
    
    OUT MIR-CLRL-SEQ-NUM
   {
       Length = "3";
       DBTableName = "TCLRL";
       SType = "Text";
       Label = "Sequence Number";
       Index = "1";
    }     


}
