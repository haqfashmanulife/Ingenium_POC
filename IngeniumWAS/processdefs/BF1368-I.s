# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:39 PM EDT

#*******************************************************************************
#*  Component:   BF1368-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  RPU002  CTS      SCREEN ENHANCEMENT FOR RPU PROCESSING                     *
#*  RPUV2B  CTS      SCREEN ENHANCEMENT FOR SULV2-RPU PROCESSING               *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*******************************************************************************

S-STEP BF1368-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Prcesrpu";
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
#RPU002 changes begins        
#       Label = "Process Date";
        Label = "Company Received Date";
#RPU002 changes ends        
    }

#RPU002 CHANGES STARTS HERE
 #  INOUT MIR-CVG-FACE-AMT
 #  {
 #      Mandatory;
 #      Signed;
 #      Length = "15";
 #      SType = "Currency";
 #      Label = "Face Amount";
 #  }
 #
 #  INOUT MIR-CVG-NUM
 #  {
 #      Length = "2";
 #      DefaultConstant = "00";
 #      SType = "Text";
 #      Label = "Coverage Number";
 #  }
 #RPU002 CHANGES ENDS HERE 

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

#RPU002 CHANGES STARTS HERE
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
        Label = "JPY Benefit Rider";
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
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
        
     }  
            
    INOUT MIR-PRCES-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }
#RPU002 CHANGES ENDS HERE    
  
#RPUV2B CHANGES STARTS HERE   

    INOUT MIR-RPU-POL-TYP-CD
    {
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "RPU-POL-TYP-CD";
        SType = "Selection";
        Label = "RPU Policy Type";	
    }     
#RPUV2B CHANGES ENDS HERE  
#27549A - Changes Start here
    INOUT MIR-ATO-NOT-APPL-IND
     {
       Length = "1";
       SType = "Indicator";
       Label = "ATO not applicable";
     }
#27549A- Changes ends here
}

