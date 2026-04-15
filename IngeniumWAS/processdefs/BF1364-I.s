# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:39 PM EDT

#*******************************************************************************
#*  Component:   BF1364-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00288  PH1      Change label of MIR-APPL-CTL-PRCES-DT                     *
#*  M319A3  CTS      FXWL 3DD WAIVER CHANGES                                   *
#*  Q91588  CTS      FIX FOR FXWL WAIVER CHANGES                               *
#*  Q91714  CTS      FIX FOR FXWL WAIVER VIRTUAL UNDO CHANGES                  *
#*  MPC115  CTS      DELAY INTEREST CALCULATION FOR FXWL WAIVER CHANGES        *
#*******************************************************************************

S-STEP BF1364-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Waiver";
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
        Label = "Effective Date";
    }

    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DefaultConstant = "00";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DV-WP-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-WP-TYP-CD";
        SType = "Selection";
        Label = "Waiver Type";
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

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }

#M319A3 CHANGES START HERE

    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
#Q91588 CHANGES START HERE
        #CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        CodeType = "DV-PAYO-MTHD-CD";
#Q91588 CHANGES END HERE
        SType = "Selection";
        Label = "Pay Out Method";	
    } 
    
    INOUT MIR-DV-HO-RECV-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Head Office Received Date";		
    }
    
    INOUT MIR-DV-PAYO-JPY-BNFT-CD 
    {
        Length = "1";
	CodeSource = "DataModel";
	CodeType = "PAYO-JPY-BNFT-CD";
	SType = "Selection";
        Label = "JPY BENEFIT RIDER INDICATOR";
    }  

#M319A3 CHANGES END HERE
#Q91714 CHANGES START HERE
      INOUT MIR-DV-UNDO-VALID-CD
      {
            Length = "1";
            SType="Hidden";
      }
 #Q91714 CHANGES END HERE
 
 #MPC115 CHANGES START HERE
      INOUT MIR-DLAY-INT-STRT-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Delay Interest Calc. Start Date";
    }
 #MPC115 CHANGES END HERE   
}

