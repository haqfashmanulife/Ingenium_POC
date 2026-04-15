# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT

#*******************************************************************************
#*  Component:   BF9280-I.s                                                    *
#*  Description: Address code search by postal code or address                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  P02506  FB       New for Address Code Search                               *
#*                                                                             *
#*******************************************************************************

S-STEP BF9280-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Input";
        FocusField = "MIR-PSTL-CD";
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

    INOUT MIR-PSTL-CD
    {
        Key;
        Length = "09";
        SType = "Text";
        Label = "Postal Code";
    }


    INOUT MIR-KJ-PREFCT-TXT
    {
        Key;
        Length = "11";
        SType = "Text";
        Label = "Prefecture";
    }

    INOUT MIR-KJ-CITY-TXT
    {
        Key;
        Length = "30";
        SType = "Text";
        Label = "City";
    }

    INOUT MIR-KJ-NGHBRHD-TXT
    {
        Key;
        Length = "30";
        SType = "Text";
        Label = "Town/Area";
    }
      
    IN MIR-LST-ADDR-LOC-CD
    {
        Length = "08";
        SType = "Text";
        Label = "Last Address code";
    }

}

