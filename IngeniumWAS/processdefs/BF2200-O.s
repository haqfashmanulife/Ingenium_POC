# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF2200-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016103  6.1.1J   Added Search Language Group Code                          *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD05  BMB      Changes to the Japanese address fields                    *
#*                   - JP-CLI-ADDR-LOC-CD  deleted                             *
#*                   - new Address Code added                                  *
#*                                                                             *
#*******************************************************************************

S-STEP BF2200-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-CLI-ENTR-SUR-NM";
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

    INOUT MIR-CLI-BTH-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }


    INOUT MIR-CLI-ENTR-CO-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Company Name";
    }

    INOUT MIR-CLI-ENTR-GIV-NM
    {
        Length = "25";
        SType = "Text";
        Label = "First Name";
    }

    INOUT MIR-CLI-ENTR-SUR-NM
    {
        Length = "25";
        SType = "Text";
        Label = "Last Name";
    }

    INOUT MIR-CLI-MID-INIT-NM
    {
        Length = "1";
        SType = "Text";
        Label = "Middle Initial";
    }

    INOUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

    INOUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Selection";
        Label = "Province/State";
    }
 
    INOUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Selection";
        Label = "Sex";
    }

    INOUT MIR-CLI-TAX-ID
    {
        Length = "9";
        SType = "Text";
        Label = "SSN/Tax ID";
    }

    INOUT MIR-DV-CLI-NM-SRCH-IND
    {
        Length = "1";
        DefaultConstant = "Y";
        SType = "Indicator";
        Label = "First Name/Last Name switch";
    }

    INOUT MIR-DV-GIV-NM-SRCH-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-GIV-NM-SRCH-CD";
        DefaultConstant = "P";
        SType = "Selection";
        Label = "First Name Phonetic/Exact";
    }

    INOUT MIR-DV-SUR-NM-SRCH-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-SUR-NM-SRCH-CD";
        DefaultConstant = "P";
        SType = "Selection";
        Label = "Last Name/Company Name Phonetic/Exact";
    }

    IN MIR-CLI-ADDR-LOC-CD-T[50]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Address Code";
        Index = "1";
    }

    IN MIR-CLI-PREFCT-TXT-T[50]
    {
        DisplayOnly;
        Length = "11";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    #LOC014 increased length 25 to 30

    IN MIR-CLI-ADDR-LN-1-TXT-T[50]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Primary Address";
        Index = "1";
    }

    IN MIR-CLI-ADDR-STAT-CD-T[50]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        SType = "Text";
        Label = "Address Status";
        Index = "1";
    }

    IN MIR-CLI-BTH-DT-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table50";
        SType = "Date";
        Label = "Birthdate";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-LOC-CD
    {
        Length = "8";
        SType = "Text";
        Label = "Address Code";
    }

    IN MIR-CLI-ID-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Client ID";
        Index = "1";
    }

    IN MIR-CLI-PSTL-CD-T[50]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Postal/Zip Code";
        Index = "1";
    }

    IN MIR-CLI-SEX-CD-T[50]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    IN MIR-CLI-TAX-ID-T[50]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "SSN";
        Index = "1";
    }

    IN MIR-DV-CLI-PREV-NM-IND-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        SType = "Indicator";
        Label = "AKA";
        Index = "1";
    }

    IN MIR-DV-CLI-SRCH-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Clients returned";
    }

    IN MIR-DV-SRCH-CLI-NM-T[50]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table50";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Full Name";
        Action = "SelectItem";
        Index = "1";
    }


    # added for LOC006

    IN MIR-CLI-ADDR-CNTCT-TXT-T[50]
    {
        DisplayOnly;
        Length = "50";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Phone Number";
        Index = "1";
    }

    IN MIR-CLI-ADDR-ADDL-TXT-T[50]
    {
        DisplayOnly;
        Length = "72";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Samakata-bu";
        Index = "1";
    }

    IN MIR-CLI-CITY-NM-TXT-T[50]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "City Name";
        Index = "1";
    }

    INOUT MIR-DV-SRCH-GR-CD
    {
        SType = "YesNo";
        Label = "Search Language Group Code";
    }

    INOUT MIR-CLI-CITY-NM-TXT
    {
        Length = "30";
        SType = "Text";
        Label = "City Name";
    }

    INOUT MIR-CLI-ADDR-LN-1-TXT
    {
        Length = "30";
        SType = "Text";
        Label = "Neighborhood";
    }

}

