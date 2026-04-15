# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT

#*******************************************************************************
#*  Component:   BF9280-O.s                                                    *
#*  Description: Address code search by postal code or address                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  P02506  FB       New for Address Code Search                               *
#*                                                                             *
#*******************************************************************************

S-STEP BF9280-O
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

    IN MIR-LST-ADDR-LOC-CD
    {
        Length = "08";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Address code";
    }
       
    IN MIR-ADDR-LOC-CD-T[50]
    {
        DisplayOnly;
        Length = "08";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Address code";
        Index = "1";
    }

    IN MIR-PSTL-CD-T[50]
    {
        DisplayOnly;
        Length = "09";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Postal Code";
        Index = "1";
    }

    IN MIR-KJ-PREFCT-TXT-T[50]
    {
        DisplayOnly;
        Length = "11";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    IN MIR-KJ-CITY-TXT-T[50]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    IN MIR-KJ-NGHBRHD-TXT-T[50]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Town/Area";
        Index = "1";
    }


}

