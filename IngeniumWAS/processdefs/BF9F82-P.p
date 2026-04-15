# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF9F82-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP334C  CTS      POLICY OWNER CHANGE HISTORY                               *
#*                                                                             *
#*******************************************************************************

P-STEP BF9F82-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9F82";
        BusinessFunctionName = "Policy Client Change Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9F80";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
       {
            Key;
            Length = "9";
            SType = "Text";
            Label = "Policy ID";
        }
    
    INOUT MIR-POL-ID-SFX
       {
            Key;
            Length = "1";
            SType = "Text";
            Label = "Suffix";
       }
 
    INOUT MIR-SEQ-NUM
       {
          Key;
          Length = "3";
          DBTableName = "TPCLH";
          SType = "Text";
          Label = "Sequence Number"; 
        }
 
    INOUT MIR-PERI-STRT-DT
        {
 	   Length = "10";
 	   SType = "Date";
 	   Label = "Start Date";
 	   Index = "1";
        }
 
    INOUT MIR-PERI-END-DT
        {
     	   Length = "10";
     	   SType = "Date";
     	   Label = "End Date";
     	   Index = "1";
        }
    INOUT MIR-CLI-ID
        {
 	   Length = "10";
 	   SType = "Text";
 	   Label = "Previous Owner client ID";
 	   Index = "1";
         }      
    
 
    INOUT MIR-DV-CLI-NM
        {
           Length = "51";
           SType = "Text";
           Label = "Previous Owner Client Name Kana";
           Index = "1";
        }
    INOUT MIR-CLI-DTH-DT
         {
     	   Length = "10";
      	   SType = "Date";
     	   Label = "Previous Owner Death Date";
     	   Index = "1";
         }   
    OUT MIR-TOT-PD-PREM-AMT
         {
           Signed;
           Length = "16";
           SType = "Currency";
           Label = "Previous Owner Paid Premium";
        }
    INOUT MIR-TYP-OF-CHNG
        {
           Length = "2";
           SType = "Text";                    
           Label = "Type of Change";
           Index = "1";            
        }                      
}

