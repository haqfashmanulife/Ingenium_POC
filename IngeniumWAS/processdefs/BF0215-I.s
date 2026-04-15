# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:17 PM EDT

#*******************************************************************************
#*  Component:   BF0215-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00541  VAN      ADD PRINT CERTICATE CHECKBOX                              *
#*  P01249  AT       ADD AGENT ID                                              *
#*  C12395  CTS      ADDED NEW FIELD  POLICY CERTIFICATE ENDORSEMENT MESSAGE   *
#*  MP176C  CTS      ADDED NEW FIELD BULK APPLICATION ID                       *
#*******************************************************************************

S-STEP BF0215-I
{
    ATTRIBUTES
    {
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

    IN LSIR-USER-MSG-TEXT-T[10]
    {
        DisplayOnly;
        Message;
    }
     
    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-AGT-ID
    {
        Key;
        Length = "6";
        DefaultSession = "MIR-AGT-ID";
        SType = "Text";
        Label = "Agent Id";
    }
     
    INOUT MIR-DOC-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Selection";
        Label = "Document Name";
    }
    
# C12395 CHANGES STARTS HERE     
    INOUT MIR-PCERT-MSG
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "PCERT";
        SType = "Selection";
        Label = "Policy Certificate Endorsement Message";
    }
# C12395 CHANGES ENDS HERE 

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }
# MP176C CHANGES STARTS HERE       
    INOUT MIR-POL-BULK-APP-ID
    {
        Key;
        Length = "15";       
        SType = "Text";
        Label = "Bulk Application Id";
    }
# MP176C CHANGES ENDS HERE   
    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-TRNXT-DOC-CPY-QTY
    {
        Mandatory;
        Length = "2";
        SType = "Text";
        Label = "Number of Copies";
    }

    INOUT MIR-TRNXT-LANG-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Selection";
        Label = "Language";
    }

    INOUT MIR-TRNXT-RPT-DSTRB-CD
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "PRTID";
        SType = "Selection";
        Label = "Printer";
    }

    INOUT MIR-DV-CNTRCT-RQST-IND-T[17]
    {
        Length = "1";
        FieldGroup = "Table17";
        CodeSource = "DataModel";
        CodeType = "DV-CNTRCT-RQST-IND";
        SType = "Indicator";
        Label = "Contract Requests";
        Index = "1";
    }                                                                                
}

