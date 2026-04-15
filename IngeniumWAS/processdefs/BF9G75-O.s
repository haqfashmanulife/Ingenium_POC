# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF9G75-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYSDMI     CTS      INITIAL VERSION OF Do Not Process Movement Screen      *
#*                                                                             *
#*******************************************************************************

S-STEP BF9G75-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
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

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DBTableName = "TUSMV";
        SType = "Text";
        Label = "Policy ID";
    }


    IN MIR-LRG-TYP-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Large Type Code";
    }

   
    IN MIR-JRNL-DT-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table50";
        SType = "Date";
        Label = "Journal Date";
        Index = "1";
    }
    IN MIR-PRCES-DT-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table50";
        SType = "Date";
        Label = "Process Date";
        Index = "1";
    }   

    IN MIR-MVMT-TYP-DESC-T[50]
    {
        DisplayOnly;
        Length = "52";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Movement Type Description";
        Index = "1";
    }

    IN MIR-OLD-VAL-T[50]
    {
        DisplayOnly;
        Length = "270";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Old Value";
        Index = "1";       
    }

    IN MIR-NEW-VAL-T[50]
    {
        DisplayOnly;
        Length = "270";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "New Value";
        Index = "1";       
    }  
 

}