# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:23 PM EDT

#*******************************************************************************
#*  Component:   BF0494-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD05  BMB      Changes to the Japanese address fields                    *
#*                   - Address Code is now the driver field                    *
#*                   - JP-ADDR has been replaced by PREFCT-TXT                 *
#*                   - Samakata-bu (ADDR-ADDL) changed to 72 bytes             *
#*                   - Prefecture, City and Neighborhood added for KA          *
#*                                                                             *
#*******************************************************************************

S-STEP BF0494-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-CLI-ID";
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

    INOUT MIR-CLI-ADDR-SEQ-NUM
    {
        Key;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-CLI-ADDR-TYP-CD
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Selection";
        Label = "Address Type";
    }

    INOUT MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-ADDR-EFF-DT-NUM-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Address Effective Date";
        Index = "1";
    }

    IN MIR-ADDR-END-DT-NUM-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "End Date";
        Index = "1";
    }

    IN MIR-CLI-ADDR-LN-1-TXT-T[12]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    IN MIR-CLI-ADDR-SEQ-NUM-T[12]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-CLI-ADDR-STAT-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        SType = "Text";
        Label = "Address Status";
        Index = "1";
    }

    IN MIR-CLI-ADDR-TYP-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        Link;
        SType = "Text";
        Label = "Address Type";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-CLI-CITY-NM-TXT-T[12]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "City";
        Index = "1";
    }


    # added to table for func LOC006

    IN MIR-CLI-ADDR-CNTCT-TXT-T[12]
    {
        DisplayOnly;
        Length = "50";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Phone Number";
        Index = "1";
    }

    IN MIR-DV-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Client Name";
    }

    #Added for 01AD05

    IN MIR-CLI-PSTL-CD-T[12]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Postal/Zip Code";
        Index = "1";
    }

    #Added for 01AD05

    IN MIR-CLI-ADDR-ADDL-TXT-T[12]
    {
        DisplayOnly;
        Length = "72";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Samakata-bu";
        Index = "1";
    }

    # added for 01AD05

    IN MIR-CLI-PREFCT-TXT-T[12]
    {
        DisplayOnly;
        Length = "11";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    # added for 01AD05

    IN MIR-CLI-KA-PREFCT-TXT-T[12]
    {
        DisplayOnly;
        Length = "11";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    # added for 01AD05

    IN MIR-CLI-KA-CITY-TXT-T[12]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    # added for 01AD05

    IN MIR-CLI-KA-NGHBRHD-TXT-T[12]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Neighborhood";
        Index = "1";
    }
 
}

