#*******************************************************************************
#*  Component:   BF9C95-I.s                                                    *
#*  Description: Input Step for Future Billing Request Quote Process           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M117PB  CTS      Intial Version                                            *
#*  UYS043  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*                                                                             *
#*******************************************************************************
S-STEP BF9C95-I
{
        ATTRIBUTES
        {
           BusinessFunctionType = "Retrieve";
           FocusField = "MIR-POL-ID-BASE";
           FocusFrame = "ContentFrame";
           Type = "Input";
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
        
        INOUT MIR-POL-ID-BASE
        {
               DefaultSession = "MIR-POL-ID-BASE";
                Key;
               Label = "Policy ID";
               Length = "9";
               Mandatory;
               SType = "Text";
        }
        
        INOUT MIR-POL-ID-SFX
        {
               DefaultSession = "MIR-POL-ID-SFX";
               Key;
               Label = "Suffix";
               Length = "1";
               SType = "Text";
        }
        
        INOUT MIR-PBRQ-EFF-DT
        {
          Key;
          Label = "Policy billing request Effective Date";
          Length = "10";
          Mandatory;
          SType = "Date";
        }
        
        INOUT MIR-POL-FUT-BILL-TYP-CD
        {
          CodeSource = "DataModel";
          CodeType = "POL-BILL-TYP-CD";
#S44450- Changes Start here
          CodeSubType = "FBIL";
#S44450- Changes End here
          Label = "Policy Future Bill Type";
          Length = "1";
          SType = "Selection";
        }
        
        INOUT MIR-POL-FUT-BILL-MODE-CD
        {
          CodeSource = "DataModel";
          CodeType = "POL-BILL-MODE-CD";
          Label = "Policy Future Bill Mode";
          Length = "2";
          SType = "Selection";
         }
#UYS043- Changes Start here
        INOUT MIR-VIR-LAPS-CNCL-IND
        {
         Length = "1";
         SType = "Indicator";
         Label = "Lapse cancellation";
        }
#UYS043- Changes End here          
}
