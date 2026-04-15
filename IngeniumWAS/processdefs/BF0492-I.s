# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:23 PM EDT

#*******************************************************************************
#*  Component:   BF0492-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016110  6.0.2J   Postal Code Default Selection Box                         *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                   - Address Code is now the driver field                    *
#*                   - JP-ADDR has been replaced by PREFCT-TXT                 *
#*                   - Samakata-bu (ADDR-ADDL) changed to 72 bytes             *
#*                   - Prefecture, City and Neighborhood added for KA          *
#*                                                                             *
#*******************************************************************************

S-STEP BF0492-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-ADDR-EFF-DT-NUM";
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

    INOUT MIR-ADDR-EFF-DT-NUM
    {
        Length = "10";
        SType = "Text";
        Label = "Address Effective Date";
    }

    INOUT MIR-ADDR-END-DT-NUM
    {
        Length = "10";
        SType = "Text";
        Label = "End Date";
    }

    INOUT MIR-CLI-ADDR-CNTY-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "CTYPC";
        SType = "Selection";
        Label = "County/Parish";
    }


    INOUT MIR-CLI-ADDR-LN-2-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address Line 2";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-LN-3-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address Line 3";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-MUN-CD
    {
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "MCPCD";
        SType = "Selection";
        Label = "Municipality";
    }

    INOUT MIR-CLI-ADDR-STAT-CD-T[2]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        SType = "Selection";
        Label = "Address Status";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-YR-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Years at Address";
    }


    INOUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DefaultSession = "MIR-USER-SESN-CTRY-CD";
        SType = "Text";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        Label = "Province/State";
    }

    INOUT MIR-CLI-CTRY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Selection";
        Label = "Country";
    }

    #Added for 01AD05

    INOUT MIR-CLI-ADDR-LOC-CD
    {
        Length = "8";
        SType = "Text";
        Label = "Address Code";
    }

    #added for LOC014

    #Changed for 01AD05

    INOUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

    INOUT MIR-CLI-RES-NUM-T[2]
    {
        Length = "5";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Apt/Unit #";
        Index = "1";
    }

    INOUT MIR-CLI-RES-TYP-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RESD";
        SType = "Selection";
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

    IN MIR-DV-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Client Name";
    }


    # added for LOC006

    INOUT MIR-CLI-ADDR-CNTCT-TXT
    {
        Length = "50";
        SType = "Text";
        Label = "Phone Number";
    }


    # added for LOC014
    #Changed for 01AD05

    INOUT MIR-CLI-ADDR-ADDL-TXT-T[2]
    {
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

    #LOC014 increased length 25 to 30
    # changed to display only for 01AD05

    IN MIR-CLI-CITY-NM-TXT-T[2]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    #LOC014 increased length 25 to 30

    IN MIR-CLI-ADDR-LN-1-TXT-T[2]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address";
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

