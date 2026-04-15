#*******************************************************************************
#*  Component:   BF9C91-I.s                                                    *
#*  Description: Input Edit Step for Future Billing Request Create Process     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M117PB  CTS      Intial Version                                            *
#*  FFF10P  CTS      FFF NOMURA ONLINE CHANGES                                 *
#*  130870  CTS      FIX FOR DB VALUE (SCH ADV PAYMENT)                        *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*                                                                             *
#*******************************************************************************
    S-STEP BF9C91-I
    {
    ATTRIBUTES
    {
    BusinessFunctionType = "Update";
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
    
    IN MIR-POL-ID-BASE
    {
    DefaultSession = "MIR-POL-ID-BASE";
    Key;
    Label = "Policy ID";
    Length = "9";
    Mandatory;
    SType = "Text";
    }
    
    IN MIR-POL-ID-SFX
    {
    DefaultSession = "MIR-POL-ID-SFX";
    Key;
    Label = "Suffix";
    Length = "1";
    SType = "Text";
    }

    IN MIR-PBRQ-EFF-DT
    {
    Key;
    Label = "Policy billing request Effective Date";
    Length = "10";
    Mandatory;
    SType = "Date";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process State";
    }

    IN MIR-DV-POL-FUT-ACTV-TYP-CD
    {
    CodeSource = "DataModel";
    CodeType = "DV-POL-FUT-ACTV-TYP-CD";
    Label = "Activity Type";
    Length = "2";
    Mandatory;
    SType = "Text";
    }
    
    INOUT MIR-POL-FUT-BILL-MODE-CD
    {
    CodeSource = "DataModel";
    CodeType = "POL-BILL-MODE-CD";
    Label = "Policy Future Bill Mode";
    Length = "2";
    SType = "Selection";
    }
    
    INOUT MIR-POL-FUT-BILL-TYP-CD
    {
    CodeSource = "DataModel";
    CodeType = "POL-BILL-TYP-CD";
    Label = "Policy Future Bill Type";
    Length = "1";
    SType = "Selection";
    }
 
#FFF10P CHANGES START HERE 
    INOUT MIR-FUT-SCHD-ADV-PMT-DUR
    {
     Length = "3";
     CodeSource = "DataModel";
     CodeType = "SCHD-ADV-PMT-DUR";
     SType = "Selection";
     Label = "Scheduled Advanced Premium Payment Frequency";
    } 
#FFF10P CHANGES ENDS HERE   
#130870 CHANGES STARTS HERE 
    INOUT MIR-SCHD-ADV-PMT-DUR
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "SCHD-ADV-PMT-DUR";
        SType = "Selection";
        Label = "Scheduled Advanced Premium Payment Frequency";
    } 
#130870 CHANGES ENDS HERE
    
    INOUT MIR-POL-FUT-PAC-DRW-DY
    {
        Length = "10";
        SType = "Day";
        Label = "Future Deposit Day";
    }
    
    INOUT MIR-POL-FUT-ACTV-STAT-CD
    {
    CodeSource = "DataModel";
    CodeType = "POL-FUT-ACTV-STAT-CD";
    Label = "Activity Staus";
    Length = "1";
    SType = "Text";
    }
    
    INOUT MIR-DV-FUT-PAYR-CLI-ID
    {
        Label = "Future Payor Client ID";
        Length = "10";
        SType = "Text";
    }
    
    INOUT MIR-DV-FUT-PAYR-ADDR-CD
    {
       CodeSource = "EDIT";
       CodeType = "ADTYP";
       Label = "Future Payor Client Address Type";
       Length = "51";
       SType = "Selection";
    }
    
    
    INOUT MIR-DV-FUT-PAYR-SUB-CD
    {
      CodeSource = "DataModel";
      CodeType = "DV-PAYR-SUB-CD";
      Label = "Future Payor Client Relationship Type";
      Length = "40";
      SType = "Selection";
    }
    
    INOUT MIR-DV-FUT-LBILL-ADDR-CD
    {
       CodeSource = "EDIT";
       CodeType = "ADTYP";
       Label = "Payroll Deduction Client Address Type";
       Length = "40";
       SType = "Selection";
    }
    
    INOUT MIR-DV-FUT-LBILL-CLI-ID
    {
        Label = "Payroll Deduction Client ID";
        Length = "10";
        SType = "Text";
     }
     INOUT MIR-DV-FUT-LBILL-CLI-NM
     {
      DisplayOnly;
      Length = "75";
      SType = "Text";
      Label = "Payroll Deduction Name";
      } 
#UYS133 CHANGES START
      INOUT MIR-PD-GR-TYP-CD
      {
      CodeSource = "DataModel";
      CodeType = "PD-GR-TYP-CD";
      Label = "PD group size";
      Length = "1";
      SType = "Text";
      }
#UYS133 CHANGES END
#27549A - CHANGES START HERE    
      INOUT  MIR-ATO-NOT-APPL-IND
      {
         Length = "1";
         SType = "Indicator";
         Label = "ATO not applicable";
      } 
#27549A- CHANGES ENDS HERE
    }
