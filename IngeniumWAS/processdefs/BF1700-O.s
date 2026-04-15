# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:48 PM EDT

#*******************************************************************************
#*  Component:   BF1700-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1700-O
{
    ATTRIBUTES
    {
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

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-MIB-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CLI-BTH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }

    IN MIR-CLI-BTH-LOC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BTLOC";
        SType = "Text";
        Label = "Birth Location";
    }

    IN MIR-CLI-GIV-NM
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "First Name";
    }

    IN MIR-CLI-MIB-ALIAS-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Search conducted using a previous name";
    }

    IN MIR-CLI-MIB-BTH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }

    IN MIR-CLI-MIB-BTH-LOC-CD
    {
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "BTLOC";
        SType = "Text";
        Label = "Birth Country";
    }

    IN MIR-CLI-MIB-FRST-NM
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "First Name";
    }

    IN MIR-CLI-MIB-IND-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-MIB-IND-CD";
        SType = "Text";
        Label = "Result of MIB Searchs";
    }

    IN MIR-CLI-MIB-MID-NM
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Initial";
    }

    IN MIR-CLI-MIB-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Result Received";
    }

    IN MIR-CLI-MIB-SUR-NM
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Last Name";
    }

    IN MIR-CLI-MID-INIT-NM
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Initial";
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

    IN MIR-CLI-SUR-NM
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Last Name";
    }

    IN MIR-DV-CLI-MIB-LBL-CD-T[16]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table16";
        CodeSource = "DataModel";
        CodeType = "DV-CLI-MIB-LBL-CD";
        SType = "Text";
        Label = "Identifier";
        Index = "1";
    }

    IN MIR-DV-CLI-MIB-TXT-T[16]
    {
        DisplayOnly;
        Length = "21";
        FieldGroup = "Table16";
        SType = "Text";
        Label = "Information";
        Index = "1";
    }

    IN MIR-OCCP-ID
    {
        DisplayOnly;
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        SType = "Text";
        Label = "Occupation";
    }

}

