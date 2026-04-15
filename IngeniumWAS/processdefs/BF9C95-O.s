#*******************************************************************************
#*  Component:   BF9C95-O.s                                                    *
#*  Description: Output Step for Future Billing Request Quote Process          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M117PB  CTS      Intial Version                                            *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  UYS043  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*                                                                             *
#*******************************************************************************
S-STEP BF9C95-O
{
        ATTRIBUTES
        {
          BusinessFunctionType = "Retrieve";
          DelEmptyRows;
          FocusField = "OKButton";
          FocusFrame = "ButtonFrame";
          Type = "Output";
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
        
        IN MIR-POL-ID-BASE 
        {
                DefaultSession = "MIR-POL-ID-BASE";
                DisplayOnly;
                Key;
                Label = "Policy ID";
                Length = "9";
                SType = "Text";
        }
        
        IN MIR-POL-ID-SFX 
        {
                DefaultSession = "MIR-POL-ID-SFX";
                DisplayOnly;
                Key;
                Label = "Suffix";
                Length = "1";
                SType = "Text";
        }
        
        IN MIR-PBRQ-EFF-DT 
        {
                DisplayOnly;
                Key;
                Label = "Policy billing request Effective Date";
                Length = "10";
                SType = "Date";
        }
        
        IN MIR-DV-POL-FUT-ACTV-TYP-CD 
        {
                CodeSource = "DataModel";
                CodeType = "DV-POL-FUT-ACTV-TYP-CD";
                DisplayOnly;
                Label = "Activity Type";
                Length = "2";
                SType = "Text";
        }
        
        IN MIR-TRAD-PD-TO-DT 
        {
                DisplayOnly;
                Label = "Traditional paid to date";
                Length = "10";
                SType = "Date";
        }
        
        IN MIR-POL-FUT-BILL-TYP-CD 
        {
                CodeSource = "DataModel";
                CodeType = "POL-BILL-TYP-CD";
                DisplayOnly;
                Label = "Policy Future Bill Type";
                Length = "1";
                SType = "Text";
        }
        
        IN MIR-POL-FUT-BILL-MODE-CD 
        {
                CodeSource = "DataModel";
                CodeType = "POL-BILL-MODE-CD";
                DisplayOnly;
                Label = "Policy Future Bill Mode";
                Length = "2";
                SType = "Text";
        }
        
        IN MIR-POL-FUT-MPREM-AMT 
        {
                DisplayOnly;
                Label = "New Modal Premium";
                Length = "15";
                SType = "Currency";
                Signed;
        }
        
        IN MIR-POL-BILL-MODE-CD 
        {
                CodeSource = "DataModel";
                CodeType = "POL-BILL-MODE-CD";
                DisplayOnly;
                Label = "Current Bill Mode";
                Length = "40";
                SType = "Text";
        }
        
        IN MIR-POL-BILL-TYP-CD 
        {
                CodeSource = "DataModel";
                CodeType = "POL-BILL-TYP-CD";
                DisplayOnly;
                Label = "Current Bill Type";
                Length = "1";
                SType = "Text";
        }
        
        IN MIR-POL-MPREM-AMT 
        {
                DisplayOnly;
                Label = "Current Modal Premium";
                Length = "15";
                SType = "Currency";
                Signed;
       }
#UYS043- CHANGES START HERE
        IN  MIR-VIR-LAPS-CNCL-IND
        {
               DisplayOnly;
               Length = "1";
               SType = "Indicator";
               Label = "Lapse cancellation";
        }
#UYS043- CHANGES END HERE
#UYS133 CHANGES START
        IN MIR-PD-GR-TYP-CD
        {
                Length = "1";
                CodeSource = "DataModel";
                CodeType = "PD-GR-TYP-CD";
                DisplayOnly;
                SType = "Text";
                Label = "PD group size";
        }
#UYS133 CHANGES END
}
