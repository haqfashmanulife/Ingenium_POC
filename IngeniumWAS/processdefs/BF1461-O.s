# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:44 PM EDT

#*******************************************************************************
#*  Component:   BF1461-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  P00891  YC       Add Journal Date with no limitation   05JUN2003           *
#*  MFFLAP  GW       Add SA Reinstatement effective date   01OCT2005           *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *    
#*                                                                             *
#*******************************************************************************

S-STEP BF1461-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Rsurr";
        Type = "Output";
        DelEmptyRows;
        FocusField = "confirmButton";
        FocusFrame = "ButtonFrame";
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

    IN MIR-APPL-CTL-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    IN MIR-SUPRES-CNFRM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "00";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

#  P00891 YC      06JUN2003  Add 8 lines for Adding Journal Date
    IN MIR-JRNL-DT
    {
      DisplayOnly;
      Length = "10";
      SType = "Date";
      Label = "Journal Date";
    }

#  MFFLAP   GW   01OCT2005  Add SA Reinst. eff. date
    IN MIR-SA-REINST-EFF-DT
    {
      DisplayOnly;
      Length = "10";
      SType = "Date";
      Label = "SA Reinstatement Effective Date";
    }

#   ISLADM - Changes start here     
    IN MIR-SURR-FORM-ACPT-DT
    { 
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Surrender Request Form Acceptance Date";
    }
    
    IN MIR-ASIGN-SURR-EFF-DT
    { 
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Assigned Surrender Effective Date for Policy with Assignee";
    }
    
    IN MIR-POL-STEP-IN-RIGHT-IND
    { 
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Policy with Step-In Right";
    }    
#   ISLADM - Changes end here
}

