# Converted from PathFinder 2.2 to 3.0 Aug 16, 2015 3:12:40 PM EDT

#*******************************************************************************
#*  Component:   BF1390-CH2016-O.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M280Q1  CTS      CHANGES DONE AS PART OF ARM III NEW CORPORATE REPORT      *
#*******************************************************************************

S-STEP BF1390-CH2016-O
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

    IN MIR-DV-QSTN-RESP-TXT-015
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

    IN MIR-DV-QSTN-RESP-TXT-057
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
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

    IN MIR-DV-QSTN-RESP-TXT-076
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNo";
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
    
    IN MIR-DV-QSTN-RESP-TXT-083
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-QSTN-RESP-TXT-084
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    
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
    
    IN MIR-DV-QSTN-RESP-TXT-109    
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    } 
    
    IN MIR-DV-QSTN-RESP-TXT-110        
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    
    IN MIR-DV-QSTN-RESP-TXT-111        
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    } 
    
    IN MIR-DV-QSTN-RESP-TXT-112        
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    } 
    
    IN MIR-DV-QSTN-RESP-TXT-113        
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    } 
    
    IN MIR-DV-QSTN-RESP-TXT-114        
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    } 

    IN MIR-DV-QSTN-RESP-TXT-115        
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    } 
    
    IN MIR-DV-QSTN-RESP-TXT-116        
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    
    IN MIR-DV-QSTN-RESP-TXT-117        
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    
    IN MIR-DV-QSTN-RESP-TXT-118        
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }
    
    IN MIR-DV-QSTN-RESP-TXT-120        
    {
        DisplayOnly;
        Length = "20";
        DBTableName = "Derived";
        SType = "YesNoUnanswered";
        Label = "Response to Variable Questions";
    }    
}    