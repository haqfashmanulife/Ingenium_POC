# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:57 PM EDT

#*******************************************************************************
#*  Component:   BF9061-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB01  TMC      New for MCL                                               *
#*                                                                             *
#*******************************************************************************
 
P-STEP BF9061-P
{
  
  ATTRIBUTES
  {
    BusinessFunctionId = "9061";
    BusinessFunctionName = "Client Application Details Create";
    BusinessFunctionType = "Create";
    MirName = "NCWM9061";
  }
  


  
  OUT LSIR-RETURN-CD;
  
  OUT MIR-RETRN-CD;

  IN MIR-CLI-ID
  {
    Key;
    Mandatory;
    Length = "10";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Client ID";
  }

  IN MIR-STCKR-ID
  {
    Key;
    Mandatory;
    Length = "11";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Sticker Number";
  }

  IN MIR-POL-ID-BASE
  {
    Key;
    Mandatory;
    Length = "9";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Policy ID";
  }

  IN MIR-POL-ID-SFX
  {
    Key;
    Length = "1";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Suffix";
  }

}

