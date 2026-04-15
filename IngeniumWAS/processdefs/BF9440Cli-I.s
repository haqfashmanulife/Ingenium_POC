# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

#*  MP4FB1  H.L      NEW RELEASE FOR FIRM BANKING          12AUG2004           *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT     15DEC2009           *    
#*  M271AA  CTS      FRA CHANGES FOR POST LAPSE SURRENDER  01SEP2015          *
#*  MP334A  CTS      CHANGES DONE FOR THE ADDITION OF NEW FIELDS               *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP  PROJECT                     *
S-STEP BF9440Cli-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "TPlaps";
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

  INOUT MIR-APPL-CTL-PRCES-DT
  {
    Mandatory;
    Length = "10";
    DefaultSession = "LSIR-PRCES-DT";
    SType = "Date";
    Label = "Process Date";
  }

  INOUT MIR-DV-PRCES-STATE-CD
  {
    Length = "1";
    SType = "Hidden";
    Label = "Process State";
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
   
    INOUT MIR-JRNL-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }

  INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "DV-TRNXT-PAYO-MTHD-CD";
    SType = "Selection";
    Label = "Pay Out Method";
  }

#  ISLADM Changes Start here        
#    INOUT MIR-HO-FORM-ACPT-DT
#    {
#        Length = "10";
#        DefaultSession = "LSIR-PRCES-DT";
#        SType = "Date";
#        Label = "Home Office Form Acceptance Date";
#    }
#
    INOUT MIR-CO-RECV-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Company Received Date";
    }
#  ISLADM Changes End here      
# M271AA  CHANGES STARTS HERE
    INOUT MIR-DV-PAYO-JPY-BNFT-CD
    {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "PAYO-JPY-BNFT-CD";
    SType = "Selection";
    Label = "JPY BENEFIT RIDER INDICATOR";
    }      

    INOUT MIR-DV-HO-RECV-DT
    {
            Length = "10";
            DefaultSession = "LSIR-PRCES-DT";
            SType = "Date";
            Label = "Head Office Received Date";
    }
# M271AA  CHANGES END HERE 
# MP334A - CHANGES START HERE
  INOUT MIR-DT-OF-DTH
  {
    Length = "10";
    SType = "Date";
    Label = "Date of Death of the policyholder";
  }
  INOUT MIR-CLMT-CAT-CD
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "CLMT-CAT-CD";
    SType = "Selection";
    Label = "Claimant Category";
  }
  INOUT MIR-CLMT-CLI-ID
  {
    Length = "10";
    SType = "Text";
    Label = "Claimant Client Id";
  }
# MP334A - CHANGES ENDS HERE
#27549A - CHANGES START HERE
  INOUT MIR-ATO-NOT-APPL-IND
  {
    Length = "1";
    SType = "Indicator";
    Label = "ATO not applicable";
  }
#27549A- CHANGES ENDS HERE
}
