# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:13 PM EDT


#*******************************************************************************
#*  Component:   AppUWDecide.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB10  KC       Created for Interviewer's Report                          *
#*  01NB10  BMB      Correct numeric fields                                    *
#*  B00172  BMB      Add parent or guardian question to forms - MIR-FLD-ID-070 *
#*  B00192  BMB      Field 059 added - M-EXAM-DT                               *
#*******************************************************************************

S-STEP AppUWDecide
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-UW-QSTN-RESP-TXT-001";
        FocusFrame = "ContentFrame";
    }

    IN FocusField
    {
        SType = "Hidden";
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

    #OUT index
    #{
    #    SType = "Hidden";
    #}

    OUT QuestionText
    {
        SType = "Hidden";
    }

    INOUT PageFocus
    {
        SType = "Hidden";
    }

    INOUT MIR-UW-QSTN-RESP-TXT-001
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }


    IN MIR-CLI-ID
    {
        DisplayOnly;
    #    Key;
        Length = "10";
    #    DefaultSession = "MIR-CLI-ID";
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

}

