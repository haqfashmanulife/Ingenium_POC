# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:40 PM EDT


#*******************************************************************************
#*  Component:   BF1390-EPOS-I.s                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP270B  CTS      Created for EPOS Self Disclosure Form                     *
#*  MP270G  CTS      CHANGES FOR EPOS MGA                                      *
#*******************************************************************************

S-STEP BF1390-EPOS-I
{
    ATTRIBUTES
    {
       BusinessFunctionType = "Update";
       Type = "Input";
       FocusField = "MIR-DV-QSTN-RESP-TXT-001";
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

    OUT QuestionText
    {
        SType = "Hidden";
    }

    INOUT PageFocus
    {
        SType = "Hidden";
    }
  
    IN MIR-CLI-ID
    {
        DisplayOnly;
        Key;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

   IN MIR-CLI-SEX-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-CLI-BTH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Date of Birth";
    }

    IN MIR-STCKR-ID
    {
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Insured Sticker Number";
    }

    IN MIR-POL-ID-BASE
    {
        DisplayOnly;
        Key;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        DisplayOnly;
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
    
    INOUT MIR-DV-QSTN-RESP-TXT-002
        {
            Length = "20";
            DBTableName = "Derived";
            SType = "YesNoNotapplicable";
            Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-018
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoNotapplicable";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-014
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoNotapplicable";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-019
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoNotapplicable";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-015
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoNotapplicable";
        Label = "Response to Variable Questions";
    } 
    INOUT MIR-DV-QSTN-RESP-TXT-083
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoNotapplicable";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-107
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoNotapplicable";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-084
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoNotapplicable";
        Label = "Response to Variable Questions";
    } 
             
    INOUT MIR-DV-QSTN-RESP-TXT-003
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoNotapplicable";
        Label = "Response to Variable Questions";
    }   
        
    INOUT MIR-DV-QSTN-RESP-TXT-017
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoNotapplicable";
        Label = "Response to Variable Questions";
    } 

    INOUT MIR-DV-QSTN-RESP-TXT-016
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoNotapplicable";
        Label = "Response to Variable Questions";
    }
    
    INOUT MIR-DV-QSTN-RESP-TXT-001
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Response to Variable Questions";
    }
    
    INOUT MIR-DV-QSTN-RESP-TXT-109
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    
    INOUT MIR-DV-QSTN-RESP-TXT-024
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    

    INOUT MIR-DV-QSTN-RESP-TXT-025
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-026
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-027
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
#MP270G CHANGES STARTS HERE 
    INOUT MIR-DV-QSTN-RESP-TXT-126
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
#MP270G CHANGES ENDS HERE 
       
  }