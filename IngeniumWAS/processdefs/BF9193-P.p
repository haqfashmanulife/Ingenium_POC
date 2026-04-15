# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:58 PM EDT

#*******************************************************************************
#*  Component:   BF9193-PI                                                      *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  1CNB02  DEL      NEW FOR CONVERSION POLICIES                               *
#*  B01160  AT       FINE TUNE BusinessFunctionName                            *
#*******************************************************************************
 
P-STEP BF9193-P
{
  
  ATTRIBUTES
  {
    BusinessFunctionId = "9193";
    BusinessFunctionName = "Pre-Conversion Information Data Delete";
    BusinessFunctionType = "Delete";
    MirName = "CCWM9193";
  }
  

  
  OUT LSIR-RETURN-CD;

  OUT MIR-RETRN-CD;

  INOUT MIR-POL-ID-BASE
  {
    Key;
    Mandatory;
    Length = "9";
    DBTableName = "TPOLX";
    DefaultSession = "MIR-POL-ID-BASE";
    SType = "Text";
    Label = "Policy Id";
  }

  INOUT MIR-POL-ID-SFX
  {
    Key;
    Length = "1";
    DBTableName = "TPOLX";
    DefaultSession = "MIR-POL-ID-SFX";
    SType = "Text";
    Label = "Suffix";
  }
    
  INOUT MIR-SEQ-NUM
  {
    Key;
    Mandatory;
    Length = "3";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Conversion Sequence Number";
  }

}

