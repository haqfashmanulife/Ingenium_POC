# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9278-P.p                                                    *
#*  Description: Adjudicator Decision- Update Exclusion/Adjustment             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HCL106  HIN/CL   ADJUDICATORS DECISION PART A & B (HCL106A)                 *
#*                                                                             *
#*******************************************************************************

P-STEP BF9278-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9278";
        BusinessFunctionName = "Update Adjustment";
        BusinessFunctionType = "Update";
        MirName = "CCWM9278";
    }

    OUT LSIR-RETURN-CD;

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
     }    
    

    OUT MIR-RETRN-CD;

    IN MIR-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TCLMA";
        DefaultSession = "MIR-CLM-ID";
        SType = "Text";
        Label = "Master Claim ID";
    }    

    IN MIR-BNFT-NM-ID        
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Benefit Name";
    }
    
    IN MIR-BNFT-STAT-CD
    {
        Key;
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "CLBN-BNFT-STAT-CD";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Benefit Claim Status";
    }     
        
    IN MIR-POL-ID
    {
        Key;
        Length = "10";
        Type = "Text";
        Label = "Policy ID";
    }
      
       IN  MIR-CVG-NUM
       {
        Key;
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
  	}
  
       IN MIR-EVNT-SEQ-NUM 
       {
        Key;
        Length = "3";
        SType = "Text";
      	Label = "Sequence Number";
      }
  
      INOUT MIR-DV-EXCL-ADJ-IND
      {
          DefaultConstant = "E";
          SType = "YesNo";
          Label = "Exclusion/Adjustment Indicator";
      }
  
  
      IN MIR-DTL-STRT-DT
      {
          Length = "10";
          SType = "Date";
          Label = "Start Date";
      }
  
      IN MIR-DTL-END-DT
      {
          Length = "10";
          SType = "Date";
          Label = "Start Date";
      }  
  
      
      INOUT MIR-EXCL-STRT-DT
      {
          Length = "10";
          SType = "Date";
          Label = "Start Date";
      }
  
      INOUT MIR-EXCL-END-DT
      {
          Length = "10";
          SType = "Date";
          Label = "Start Date";
      }
  
  
      INOUT MIR-ADJ-STRT-DT
      {
          Length = "10";
          SType = "Date";
          Label = "Start Date";
      }
  
      INOUT MIR-ADJ-END-DT
      {
          Length = "10";
          SType = "Date";
          Label = "Start Date";
      }
  
    INOUT MIR-EXCL-REASN-CD
    {
        Length = "40";
        SType = "Text";
        Label = "Exclusion Reason";
    }
  
    INOUT MIR-ADJ-REASN-CD
    {
        Length = "40";
        SType = "Text";
        Label = "Adjustment Reason";
    }

    IN MIR-DTL-REASN-CD
    {
        Length = "40";
        SType = "Text";
    }

}
