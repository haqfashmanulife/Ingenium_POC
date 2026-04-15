
#*******************************************************************************
#*  Component:   BF9G80-I.s                                                    *
#*  Description: Annuity Payout Transfer Quote Screen                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  TDM22A  02MAR20  Intial Version                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9G80-I
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
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-ANTY-STRT-DT
    {
        Key;
        Mandatory;
        Length = "10";
        SType = "Date";
        Label = "Annuity Commencement Date";
    }    
     
    INOUT MIR-PRCES-DT
    {
	DefaultSession = "LSIR-PRCES-DT";
        Label = "Process Date";
	Length = "10";
	SType = "Date";
    }
    
    INOUT MIR-ANTY-PAYO-PERI-CD
    {
        Key;
        Mandatory;
        Length = "2";
        DefaultConstant = " ";
        CodeSource = "DataModel";
        CodeType = "ANTY-PAYO-PERI-CD";
        SType = "Selection";
        Label = "Annuity Payout Period";
    }
    
    
    INOUT MIR-ANUTNT-TYP-CD
    {
        Key;
        Mandatory;
	Length = "2";
	DefaultConstant = " ";
        CodeSource = "DataModel";
        CodeType = "ANUTNT-TYP-CD";
        SType = "Selection";
        Label = "Annuitant Type";
    }    
    
    INOUT MIR-FINAL-DPOS-DED-CD
    {
        Key;
        Mandatory;
        Length = "2";
        DefaultConstant = "CD";
        CodeSource = "DataModel";
        CodeType = "FINAL-DPOS-DED-CD";
        SType = "Selection";
        Label = "Final deposit deduction Ind";
    }         
}

