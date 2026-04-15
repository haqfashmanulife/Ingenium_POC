# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF9H20PolLst-I.s                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYDM29  CTS      Unisys Benefit History Inquiry Screen                     *
#*                                                                             *
#*******************************************************************************

S-STEP BF9H20PolLst-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
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

    IN MIR-POL-ID-T[5]
    {
        DisplayOnly;
        Length = "7";
        FieldGroup = "Table05";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }
    
    IN MIR-LARG-TYP-CD-T[5]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table05";
        SType = "Text";
        Label = "Large type CD";
        Index = "1";
    }
     
    IN MIR-SMAL-TYP-CD-T[5]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table05";
        SType = "Text";
        Label = "Small type code";
        Index = "1";
    }
}