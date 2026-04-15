# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*********************************************************************************
#*  Component:   BF9668-P.p                                                                                *
#*  Description: Delete payee for a claim                                                       * 
#*                                                                                                                                    *
#*                                                                                                                                     *
#**********************************************************************************
#*  Chg#    Release  Description                                                                           *
#*                                                                                                                                     *
#*  HCL103  HIN/CL   ADD A PAYEE              (HCL103C)            *
#**********************************************************************************

P-STEP BF9668-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9668";
        BusinessFunctionName = "Delete Payee";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9668";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


	IN MIR-CLM-ID 
	{
		Key;
		DisplayOnly;
		Length = "8";
		SType = "Text";
		Label = "Master Claim ID";
	}
    
    IN MIR-CLRL-TYP-CD
     {
         Key;
         Length = "1";
         DBTableName = "TCLRL";
         SType = "Text";
         Label = "Relationship Type";
     }

         IN  MIR-CLRL-SEQ-NUM
     	{
	  Key;     	
    	  Length = "3";
    	  DBTableName = "TCLRL";
    	   SType = "Text";
    	   Label = "Sequence Number";
    	    Index = "1";
       }     
    


}
