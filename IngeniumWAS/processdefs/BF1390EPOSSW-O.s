# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:40 PM EDT


#*******************************************************************************
#*  Component:   BF1390EPOSSW-O.s                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  28425B  CTS      Created for SPWL EPOS Self Disclosure Form                *
#*  CD200A  CTS      CHANGES FOR CERBREUS SPWL SELF DISCLOSURE FORM EPOS       *
#*******************************************************************************

S-STEP BF1390EPOSSW-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Output";
        FocusField = "OKButton";
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
        Label = "Client ID";
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
        SType = "Date";
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

    IN MIR-DV-QSTN-RESP-TXT-001
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-002
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-019
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-015
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
#CD200A CHANGES STARTS HERE
    IN MIR-DV-QSTN-RESP-TXT-083
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-107
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

#CD200A CHANGES ENDS HERE
    IN MIR-DV-QSTN-RESP-TXT-024
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-025
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }    
    IN MIR-DV-QSTN-RESP-TXT-026
    {
        DisplayOnly;
        Length = "20";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-027
    {
        DisplayOnly;
        Length = "20";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-070
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-106
    {
            Length = "20";
            DBTableName = "Derived";
            SType = "YesNoUnanswered";
            Label = "Response to Variable Questions";
    }

}