# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:57 PM EDT

#*******************************************************************************
#*  Component:   BF9063-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB01  TMC      New for MCL                                               *
#*                                                                             *
#*******************************************************************************
 
P-STEP BF9063-P
{
  
  ATTRIBUTES
  {
    BusinessFunctionId = "9063";
    BusinessFunctionName = "Client Application Details Delete";
    BusinessFunctionType = "Delete";
    MirName = "NCWM9063";
  }
  


  
  OUT LSIR-RETURN-CD;
  
  OUT MIR-RETRN-CD;

  INOUT MIR-CLI-ID
  {
    Key;
    Mandatory;
    Length = "10";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Client ID";
  }

  INOUT MIR-STCKR-ID
  {
    Key;
    Mandatory;
    Length = "11";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Sticker Number";
  }

  INOUT MIR-POL-ID-BASE
  {
    Key;
    Mandatory;
    Length = "9";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Policy ID";
  }

  INOUT MIR-POL-ID-SFX
  {
    Key;
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Suffix";
  }

}
