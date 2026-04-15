# Created 01Jun2005 for funds project

#*******************************************************************************
#*  Component:   AppOwnerUW-I.s                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MFFFU4  ACR      New for funds project UW changes                          *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

S-STEP AppOwnerUW-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-OWN-INV-XPER-IND";
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

#  *************************************************
#  screen key fields passed from prior process
#  *************************************************

    IN MIR-STCKR-ID
    {
        Key;
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Sticker Number";
    }

  IN MIR-POL-ID-BASE
  {
    Key;
    DisplayOnly;
    Length = "9";
    SType = "Text";
    Label = "Policy ID";
  }

  IN MIR-POL-ID-SFX
  {
    Key;
    DisplayOnly;
    Length = "1";
    SType = "Text";
    Label = "Suffix";
  }

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-INCM-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Policyholder Name";
    }


# *****************************************************************
# data fields for update
# ****************************************************************

    INOUT MIR-OWN-INV-XPER-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "OWN-INV-XPER-CD";
        DBTableName = "TCLIU";
        SType = "Selection";
        Label = "Previous Investment Experience";
    }

    INOUT MIR-AGT-XPER-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGT-XPER-CD";
        DBTableName = "TCLIU";
        SType = "Selection";
        Label = "Sales Rep Experience";
    }

    INOUT MIR-VERIF-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VERIF-MTHD-CD";
        DBTableName = "TCLIU";
        SType = "Selection";
        Label = "Verification Method";
    }

    INOUT MIR-CLI-FIN-ASSET-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "FASST";
        DBTableName = "TCLII";
        SType = "Selection";
        Label = "Financial Assets";
    }

    INOUT MIR-CLI-EARN-INCM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Length = "13";
#M245B2 CHANGES START HERE        
#        Decimals = "0";
#M245B2 CHANGES END HERE
        DBTableName = "TCLII";
        SType = "Currency";
        Label = "Earned Income";
    }

    IN MIR-EARN-INCM-MODE-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "EARN-INCM-MODE-CD";
        DBTableName = "TCLII";
        SType = "Text";
        Label = "Earned Income Mode";
    }
    
#M245B2 CHANGES START HERE     
      INOUT MIR-POL-CRCY-CD
        {
     
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
        }
#M245B2 CHANGES END HERE    

}

