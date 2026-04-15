# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*********************************************************************************
#*  Component:   BF9A93-P.p                                                      *
#*  Description: Delete payee for a claim                                        * 
#*                                                                               *
#*                                                                               *
#*********************************************************************************
#*  Chg#    Release  Description                                                 *
#*                                                                               *                                                      *
#*  IPCAPM  CTS      Intial Version                                              *
#*********************************************************************************

P-STEP BF9A93-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A93";
        BusinessFunctionName = "Delete Payee";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9A90";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


	IN MIR-CLM-ID 
	{
	     Key;
	     DisplayOnly;
             Length = "8";
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

       IN  MIR-DCRL-SEQ-NUM
     	{
	     Key;     	
    	     Length = "3";
    	     DBTableName = "TDCRL";
    	     SType = "Text";
    	     Label = "Sequence Number";
    	     Index = "1";
        }     
    


}
