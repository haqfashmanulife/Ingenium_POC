# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AddUpdtCvgBill.s                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02NB64  WBP      New                                                       *
#*                                                                             *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*******************************************************************************

S-STEP AddUpdtCvgBill
{
    ATTRIBUTES
    {
        FocusField = "MIR-POL-SNDRY-AMT";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    IN BannerBar;

    IN BannerBarSize;

    IN BannerProductID
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
    }

    IN BannerPolicyID;

    IN BannerPrimaryInsured;

    IN MIR-POL-ID-BASE;

    IN MIR-POL-ID-SFX;

    OUT action
    {
        SType = "Hidden";
    }

    INOUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-POL-SNDRY-AMT
    {
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
        Label = "Sundry Amount:";
        SType = "Currency";
        Length = "13";
    }
#M271O1 CHANGES START HERE  
   
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
}
