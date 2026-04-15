# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:39 PM EDT

#*******************************************************************************
#*  Component:   BF1390-CH-O.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB10  KC       Created for Corporate Health Report                       *
#*  B00367  BMB      Add Medical Report number: RPT-NUM-ID - MIR-FLD-ID-072    *
#*  B00533           Add Group Code - MIR-FLD-ID-028                           *
#*  B10308  VAN      USE SMOKE-CNUM (#76) INSTEAD OF SMOKE-CIG-QTY (#25)       *
#*  HNB002  HIN/AI   NEW FIELDS FOR UPLOAD                                     *
#*  HNB002  JSY      ADD HANDWRITTEN NOTES AND INCOMPLETE CHECKBOXES -         *
#*                   MIR-DV-QSTN-RESP-TXT-077 TO MIR-DV-QSTN-RESP-TXT-080      *
#*  NWLUWF  CTS      CHANGES DONE FOR NWL U/W FORMS REVISION                   *
#*  ATF008  CTS      CHANGES DONE FOR NWL U/W FORMS REVISION                   *
#*  MP253F  CTS      CHANGES DONE FOR ULE-2 U/W FORMS REVISION                 *
#*******************************************************************************

S-STEP BF1390-CH-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Output";
        DelEmptyRows;
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

    IN MIR-DV-QSTN-RESP-TXT-003
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-004
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-005
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-006
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-007
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-008
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-009
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-010
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-011
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-012
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-013
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-014
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

    IN MIR-DV-QSTN-RESP-TXT-016
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-017
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-018
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

    IN MIR-DV-QSTN-RESP-TXT-020
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-021
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-022
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-023
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-024
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-076
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
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-027
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-028
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-041
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-042
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-043
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-044
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-045
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-046
    {
        DisplayOnly;
        Length = "1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-047
    {
        DisplayOnly;
        Length = "1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-058
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-059
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-060
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-061
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-062
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-063
    {
         DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-064
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-065
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-066
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-067
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }   

    IN MIR-DV-QSTN-RESP-TXT-068
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-069
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-072
    {
        DisplayOnly;
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-075
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-077
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNo";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-078
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNo";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-079
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNo";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-080
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNo";
        Label = "Response to Variable Questions";
    }
    
    #NWLUWF CHANGES START.
    IN MIR-DV-QSTN-RESP-TXT-082
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-083
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    #NWLUWF CHANGES END.
    
    #ATF008- CHNAGES STARTS
    IN MIR-DV-QSTN-RESP-TXT-084
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    #ATF008- CHANGES ENDS    
    
    #MP253F- CHNAGES STARTS
    IN MIR-DV-QSTN-RESP-TXT-107
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    
    IN MIR-DV-QSTN-RESP-TXT-108
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }    
    #MP253F- CHANGES ENDS     

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
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

}

