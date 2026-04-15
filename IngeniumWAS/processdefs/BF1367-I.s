# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:39 PM EDT

#*******************************************************************************
#*  Component:   BF1367-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  RPU001           ADDED FEW CHANGES FOR RPU QUOTE INQUIRY SCREEN            *
#*  RPUV2A           CHANGES FOR SULV2-RPU PROJECT                             * 
#*  UYS043  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*******************************************************************************

S-STEP BF1367-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Quoterpu";
        Type = "Input";
        FocusField = "MIR-POL-ID-BASE";
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
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
#RPU001 changes begins
# Label = "Process Date";
        Label = "Company Received Date";
        Mandatory;
#RPU001 changes ends

    }
#RPU001 changes Starts Here
#INOUT MIR-CVG-NUM
      #{
      #    Length = "2";
      #    DefaultConstant = "00";
      #    SType = "Text";
      #    Label = "Coverage Number";
      #}
#RPU001 Changes Ends here

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }
    
#RPU001 changes Starts Here
  INOUT MIR-POL-ID-SFX
  {
      Key;
      Length = "1";
      DefaultSession = "MIR-POL-ID-SFX";
      SType = "Text";
      Label = "Suffix";
  }
   
    INOUT MIR-DV-PAYO-JPY-BNFT-CD
      {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Selection";
        Label = "JPY Benefit Rider";
      }   
#RPU001 CHANGES ENDS HERE

#RPUV2A CHANGES STARTS HERE

   INOUT MIR-RPU-POL-TYP-CD
      {
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "RPU-POL-TYP-CD";
        SType = "Selection";
        Label = "RPU Policy Type";
      }     

#RPUV2A CHANGES ENDS HERE
#UYS043- Changes Start here
   INOUT MIR-VIR-SCREEN-IND
      {
        Length = "1";
        SType = "Indicator";
        Label = "Check when doing virtual quote";
      }
#UYS043- Changes End here 
}

