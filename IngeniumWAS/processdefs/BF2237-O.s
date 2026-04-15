# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF2237-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016103  6.1.1J   Added Search Language Group Code                          *
#*  017098  6.1.1J   Removed CLI-ID field                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD05  BMB      Changes to the Japanese address fields                    *
#*                   - address line 2 removed                                  *
#*                   - Prefecture, and Samakata-bu (ADDR-ADDL) added for KJ    *
#*                   - Prefecture, City and Nieghborhood added for KA          *
#*                                                                             *
#*******************************************************************************

S-STEP BF2237-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Clinqlist";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-DV-SRCH-GR-CD";
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

    INOUT MIR-CLI-CO-NM
    {
        Key;
        Mandatory;
        Length = "50";
        SType = "Text";
        Label = "Company Name";
    }


    #LOC014 increased length 25 to 30
    #01AD05 label changed

    IN MIR-CLI-ADDR-LN-1-TXT-T[10]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Neighborhood";
        Index = "1";
    }

    #01AD05 new field added

    IN MIR-CLI-PREFCT-TXT-T[10]
    {
        DisplayOnly;
        Length = "11";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    #LOC014 increased length 25 to 30

    IN MIR-CLI-CITY-NM-TXT-T[10]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    #01AD05 new field added

    IN MIR-CLI-ADDR-ADDL-TXT-T[10]
    {
        DisplayOnly;
        Length = "72";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Samakata-bu";
        Index = "1";
    }

    #01AD05 new field added

    IN MIR-CLI-KA-PREFCT-TXT-T[10]
    {
        DisplayOnly;
        Length = "11";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    #01AD05 new field added

    IN MIR-CLI-KA-CITY-TXT-T[10]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    #01AD05 new field added

    IN MIR-CLI-KA-NGHBRHD-TXT-T[10]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Neighborhood";
        Index = "1";
    }
 
    IN MIR-CLI-CNFD-IND-T[10]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table4";
        SType = "Indicator";
        Label = "Confidential";
        Index = "1";
    }

    IN MIR-CLI-CO-NM-T[10]
    {
        DisplayOnly;
        Length = "50";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Company Name";
        Index = "1";
    }

    IN MIR-CLI-ID-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table4";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Client Number";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-CLI-PSTL-CD-T[10]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Postal/Zip Code";
        Index = "1";
    }

    IN MIR-UNMTCH-MAIL-IND-T[10]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table4";
        SType = "Indicator";
        Label = "Unmatched mail";
        Index = "1";
    }

    INOUT MIR-DV-SRCH-GR-CD
    {
        SType = "YesNo";
        Label = "Search Language Group Code";
    }

}

