# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   BF9960-I.s                                                    *
#*  Description: PA Inquiry                                                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  FT2001  01SEP04  INITIAL VERSION                                           *
#*                                                                             *
#*  P02945  CHANGE MIR-POL-ID TO BASE+SFX                                      *
#*******************************************************************************

S-STEP BF9960-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Retrieve";
    Type = "Input";
    FocusField = "MIR-INQ-TYP-CD";
    FocusFrame = "ContentFrame";
  }

  IN Title;

  IN TitleBar;
  IN TitleBarSize;

  IN ButtonBar;
  IN ButtonBarSize;

  IN MessageFrame;
  IN MessageFrameSize;

  OUT action
  {
    SType="Hidden";
  }

  INOUT MIR-INQ-TYP-CD;
   
  IN MIR-SEL-TYP-CD
    {
        SType = "Hidden";
    }

    IN MIR-AGT-ID
    {
        SType = "Hidden";
        DefaultSession = "MIR-AGT-ID";
    }

 
    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }
     
    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
    }
     
    INOUT MIR-DV-SRCH-GR-CD
    {
        Length = "2";
        DefaultConstant = "KA";
        SType = "YesNo";
        Label = "Client Name Search Type";
    }
     
    INOUT MIR-CLI-INDV-SUR-NM 
    {
        Key;
        Length = "25";
        SType = "Text";
        Label = "Last Name";
    }
     
    INOUT MIR-CLI-INDV-GIV-NM 
    {
        Key;
        Length = "25";
        SType = "Text";
        Label = "First Name";
    }

}
 
