#***********************************************************************
#                                                                      *
# Converted from PathFinder 2.0 to 2.2 on Jan 15, 2004 11:08:15 AM EST *
# Project   Date     By  Description                                   *
# -------   ----     --  -----------                                   *
# MP4FB1  12DEC2004  SC  FIRM BANKING REMITTANCE - ADD 2 NEW FIELDS    *
# EN4631  01OCT2008  CTS ACCOUNT NUMBER ADDED                          *
# EN4995  27NOV2008  CTS CHANGES FOR NEW SEARCH CRITERIA WITH ACCT ID  *
# EN4995                 AND REMITTANCE DATE                           *
#***********************************************************************
 
S-STEP BF9324-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "List";
    Type = "Input";
    FocusField = "MIR-FBNK-REMIT-DT";
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

#**********************************************
#* Table search keys    
#**********************************************

  INOUT MIR-FBNK-REMIT-DT
  {
    Key;
    Length = "10";
    SType = "Date";
    Label = "Remittance Date";
  }

  INOUT MIR-FBNK-REF-ID
  {
    Key;
    Length = "10";
    DefaultSession = "MIR-CLM-ID";
    SType = "Text";
    Label = "Master Claim ID";
  }

  INOUT MIR-POL-ID
  {
    Key;
    Length = "10";
    SType = "Text";
    Label = "Policy ID";
  }

  INOUT MIR-FB-CLI-ID
  {
    Key;
    Length = "10";
    SType = "Text";
    Label = "Insured Client ID";
  }

#********               
# MP4FB1                
#********               

  INOUT MIR-FBNK-CAT-CD
  {
    Length = "5";
    CodeSource="DataModel";
    CodeType="FBNK-CAT-CD"; 
    SType = "Selection";        
    Label = "Transaction Type:";
  }

#*******
# MP4BF1
#*******
# INOUT MIR-FBNK-CAT-CD
# {
#   SType = "Hidden";
# }
#*****
     
# EN4631
# EN4995 CHANGES BEGIN
#INOUT MIR-FBNK-ACCT-ID
INOUT MIR-BNK-ACCT-ID
# EN4995 CHANGES END
    {
        Key;
        Length = "17";
        SType = "Text";
        Label = "Account Number";
    }
# EN4631     
     
#**********************************************
#* Table search keys - previous
#**********************************************

  INOUT MIR-PREV-FBNK-REMIT-DT
  {
    SType = "Hidden";
  }

  INOUT MIR-PREV-FBNK-REF-ID
  {
    SType = "Hidden";
  }

  INOUT MIR-PREV-POL-ID
  {
    SType = "Hidden";
  }

  INOUT MIR-PREV-CLI-ID
  {
    SType = "Hidden";
  }

#**MP4FB1
#**           
  INOUT MIR-PREV-FBNK-CAT-CD 
  {
    SType = "Hidden";
  }

# EN4631
# EN4995 CHANGES BEGIN
#  INOUT MIR-PREV-FBNK-ACCT-ID
  INOUT MIR-PREV-BNK-ACCT-ID
# EN4995 CHANGES END
  {
    SType = "Hidden";
  }
# EN4631  

#**********************************************
#* Table search keys - more     
#**********************************************

  INOUT MIR-MORE-FBNK-IDT-NUM
  {
    SType = "Hidden";
  }

  INOUT MIR-MORE-FBNK-REF-ID
  {
    SType = "Hidden";
  }

  INOUT MIR-MORE-POL-ID
  {
    SType = "Hidden";
  }

  INOUT MIR-MORE-CLI-ID
  {
    SType = "Hidden";
  }

  INOUT MIR-MORE-FBNK-SEQ-NUM
  {
    SType = "Hidden";
  }

#**MP4FB1
#**           
  INOUT MIR-MORE-FBNK-CAT-CD
  {
    SType = "Hidden";
  }

# EN4631
# EN4995 CHANGES BEGIN
#  INOUT MIR-MORE-FBNK-ACCT-ID
  INOUT MIR-MORE-BNK-ACCT-ID
# EN4995 CHANGES END
  {
    SType = "Hidden";
  }
# EN4631

}
