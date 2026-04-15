# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:23 PM EDT

#*******************************************************************************
#*  Component:   BF0492-O.s                                                    *
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

S-STEP BF0492-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
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

    IN MIR-ADDR-EFF-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Address Effective Date";
    }

    IN MIR-ADDR-END-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "End Date";
    }

    IN MIR-CLI-ADDR-CNTY-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "CTYPC";
        SType = "Text";
        Label = "County/Parish";
    }

    IN MIR-CLI-ADDR-LN-1-TXT-T[2]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    IN MIR-CLI-ADDR-LN-2-TXT-T[2]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address Line 2";
        Index = "1";
    }

    IN MIR-CLI-ADDR-LN-3-TXT-T[2]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address Line 3";
        Index = "1";
    }

    IN MIR-CLI-ADDR-MUN-CD
    {
        DisplayOnly;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "MCPCD";
        SType = "Text";
        Label = "Municipality";
    }

    IN MIR-CLI-ADDR-STAT-CD-T[2]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        SType = "Text";
        Label = "Address Status";
        Index = "1";
    }

    IN MIR-CLI-ADDR-YR-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Years at Address";
    }

    IN MIR-CLI-CITY-NM-TXT-T[2]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    IN MIR-CLI-CRNT-LOC-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        SType = "Text";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        Label = "Province/State";
    }

    IN MIR-CLI-CTRY-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Selection";
        Label = "Country";
    }


    #Added for 01AD05

    IN MIR-CLI-ADDR-LOC-CD
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Address Code";
    }

    #added for LOC014
    #changed for 01AD05

    IN MIR-CLI-PSTL-CD
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

    IN MIR-CLI-RES-NUM-T[2]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Apt/Unit #";
        Index = "1";
    }

    IN MIR-CLI-RES-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RESD";
        SType = "Text";
        Label = "Residence Type";
    }

    IN MIR-CLI-ADDR-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CLI-ADDR-TYP-CD
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Address Type";
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

    IN MIR-ADDR-STAT-CHNG-DT-T[2]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table2";
        SType = "Date";
        Label = "Address Status Changed Date";
        Index = "1";
    }

    IN MIR-CLI-ADDR-CHNG-DT-T[2]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table2";
        SType = "Date";
        Label = "Address Changed Date";
        Index = "1";
    }

    IN MIR-DV-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Client Name";
    }
     
    # added for 01AD05

    IN MIR-CLI-ADDR-ADDL-TXT-T[2]
    {
        DisplayOnly;
        Length = "72";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Samakata-bu";
        Index = "1";
    }

    # added for 01AD05

    IN MIR-CLI-PREFCT-TXT-T[2]
    {
        DisplayOnly;
        Length = "11";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    # added for 01AD05

    IN MIR-CLI-KA-PREFCT-TXT-T[2]
    {
        DisplayOnly;
        Length = "11";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    # added for 01AD05

    IN MIR-CLI-KA-CITY-TXT-T[2]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    # added for 01AD05

    IN MIR-CLI-KA-NGHBRHD-TXT-T[2]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Neighborhood";
        Index = "1";
    }

}

