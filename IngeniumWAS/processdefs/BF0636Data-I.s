# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:26 PM EDT

#*******************************************************************************
#*  Component:   BF0636Data-I.s                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00495  DPK      Remove Key detail fields                                  *
#*  P00891  YC       Add Journal Date with no limitation   30MAY2003           *
#*  B01692  BP       Change List In Txn Reason Selection Box  29OCT2003        *
#*  MP4FB1  H.L      New fields  to support Firm Banking  05Aug2004            *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *    
#*  M142F2  CTS      ADDED FIELDS FOR SURVIVOR BENIFIT                         *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*******************************************************************************

S-STEP BF0636Data-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Psrcvg";
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

    INOUT MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DV-CF-CLI-TRXN-AMT
    {
        Key;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Gross Amount";
    }

    INOUT MIR-DV-CF-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-DV-CF-REASN-CD
    {
        Key;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "WTHDR-REASN-CD";
        SType = "Selection";
        Label = "Transaction Reason";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "process code";
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

#  P00891 YC      30MAY2003  Add 8 lines for Adding Journal Date
    INOUT MIR-DV-CF-REP-DT
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
#  INOUT MIR-HO-FORM-ACPT-DT
#  {
#    Length = "10";
#    DefaultSession = "LSIR-PRCES-DT";
#    SType = "Date";
#    Label = "Home Office Form Acceptance Date";
#  }
#
  INOUT MIR-CO-RECV-DT
    {
    Length = "10";
    DefaultSession = "LSIR-PRCES-DT";
    SType = "Date";
    Label = "Company Received Date";
    }
#  ISLADM Changes End here   
#  M142F2 Changes End here
    INOUT MIR-DV-WTHDR-TYP-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-WTHDR-TYP-CD";
        SType = "Selection";
        Label = "Withdrawal Reason";
    }
  
    INOUT MIR-DV-SRVBEN-TYP-CD
    {
        
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-SRVBEN-TYP-CD";
        SType = "Selection";
        Label = "Type of Survivorship Benefit Requested";
    }
#  M142F2 Changes End here

#  27549A - CHANGES START HERE
    INOUT MIR-ATO-NOT-APPL-IND
    {
    
        Length = "1";
        SType = "Indicator";
        Label = "ATO not applicable";
    }
#  27549A- CHANGES ENDS HERE    
}

