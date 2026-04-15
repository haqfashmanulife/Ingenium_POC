#*******************************************************************************
#*  Component:   BF9D12-I.s                                                    *
#*  Description: Survival Benefit Payout Process                               *
#*                                                                             *
#*******************************************************************************
#*                                                                             *
#*  MP302A  CTS      INITIAL VERSION                                           *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*  CD3001  CTS      CHANGES DONE AS PART OF CERBERUS DAY 3.0                  *
#*******************************************************************************

S-STEP BF9D12-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "TDSrvb";
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
        SType="Hidden";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }
    
    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
     }

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-CO-RECV-DT
    {
      Length = "10";
      DefaultSession = "LSIR-PRCES-DT";
      SType = "Date";
      Label = "Company Received Date";
    }

    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
       Length = "1";
       CodeSource = "DataModel";
       CodeType = "DV-TRNXT-PAYO-MTHD-CD";
       SType = "Selection";
       Label = "Pay Out Method";
    }

    INOUT MIR-JRNL-DT
    {
      Length = "10";
      DefaultSession = "LSIR-PRCES-DT";
      SType = "Date";
      Label = "Journal Date";
    }
#27549A - Changes Start here    
     INOUT MIR-ATO-NOT-APPL-IND
      {
        Length = "1";
        SType = "Indicator";
        Label = "ATO not applicable";
  }
#27549A- Changes ends here

#CD3001 - CHANGES STARTS HERE
     INOUT MIR-HO-RECV-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Head Office Received Date";
    }

     INOUT MIR-VWD-SPEC-AMT
    {
        Length = "15";
        DefaultConstant = "0";
        SType = "Number";
        Label = "Specified Amount";
    }

     INOUT MIR-POL-CRCY-SP
    {   
        Length = "2";
        SType = "Hidden";             
    } 

     INOUT MIR-PAYO-JPY-BNFT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Selection";
        Label = "JPY Benefit Rider";
    }
	
     INOUT MIR-POL-CRCY-CD
    {   
        Length = "2";
        SType = "Hidden";            
    } 

     INOUT MIR-SPWL-PLAN-IND
    {
        Length = "1"; 
        SType = "Hidden";
    }
#CD3001 - CHANGES ENDS HERE
}
