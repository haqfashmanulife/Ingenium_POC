# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF9F83-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP334C  CTS      POLICY OWNER CHANGE HISTORY                               *
#*                                                                             *
#*******************************************************************************

P-STEP BF9F83-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9F83";
        BusinessFunctionName = "Policy Client Change Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9F80";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

   IN MIR-POL-ID-BASE
       {
           Key;
           Mandatory;
           Length = "9";
           DefaultSession = "MIR-POL-ID-BASE";
           SType = "Text";
           Label = "Policy ID";
           }
       
           IN MIR-POL-ID-SFX
           {
               Key;
               Length = "1";
               DefaultSession = "MIR-POL-ID-SFX";
               SType = "Text";
               Label = "Suffix";
       }
       IN MIR-SEQ-NUM
       {
               Key;
               Length = "3";
               SType = "Text";
               Label = "Sequence Number";
    }
   INOUT MIR-TYP-OF-CHNG
      {
          Length = "2";
          CodeSource = "DataModel";
          CodeType = "TYP-OF-CHNG";
          SType = "Text";
          Label = "Type of Change";       
    }  
}

