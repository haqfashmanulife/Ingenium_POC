# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AppIndivUpdateJP.s                                            *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AppIndivUpdateJP
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-CLI-ENTR-SUR-NM-T[1]";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    IN MIR-DV-RQST-PSTL-ADDR-GR-KJ;

    IN MIR-DV-RQST-PSTL-ADDR-GR-KA;

    IN MIR-DV-RQST-PSTL-ADDR-LN-1-TXT;

    IN MIR-DV-RQST-PSTL-ADDR-LN-2-TXT;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-CLI-MAIL-TITL-TXT
    {
        Length = "15";
        CodeSource = "EDIT";
        CodeType = "TITLE";
        SType = "Selection";
        Label = "Title";
    }

    INOUT MIR-CLI-ENTR-GIV-NM-T[2]
    {
        Length = "25";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    INOUT MIR-CLI-ENTR-SUR-NM-T[2]
    {
        Length = "25";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    INOUT MIR-DV-UPDT-NM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Update previous name";
    }

    IN MIR-CLI-PREV-TITL-TXT-T[6]
    {
        Length = "15";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "TITLE";
        SType = "Text";
        Label = "Title";
        Index = "1";
    }

    IN MIR-CLI-ENTR-PREV-GIV-NM-T[6]
    {
        Length = "25";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    IN MIR-CLI-ENTR-PREV-SUR-NM-T[6]
    {
        Length = "25";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    INOUT MIR-CLI-BTH-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }

    INOUT MIR-CLI-BTH-LOC-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BTLOC";
        SType = "Selection";
        Label = "Birth Location";
    }

    INOUT MIR-CLI-LANG-CD
    {
        Length = "1";
        DefaultConstant = "J";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Selection";
        Label = "Correspondence Language";
    }

    INOUT MIR-CLI-MARIT-STAT-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "MARST";
        SType = "Selection";
        Label = "Marital Status";
    }

    INOUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        CodeSubType = "INDV";
        SType = "Selection";
        Label = "Sex";
    }

    INOUT MIR-CLI-SMKR-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SMKR-CD";
        SType = "Selection";
        Label = "Smoker";
    }

    INOUT MIR-CLI-TAX-ID
    {
        Length = "9";
        SType = "Text";
        Label = "Social Security Number";
    }

    INOUT MIR-CLI-ADDR-LN-1-TXT-T[1]
    {
        Length = "25";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-LN-2-TXT-T[1]
    {
        Length = "25";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-LN-3-TXT-T[1]
    {
        Length = "25";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-YR-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Years at Address";
    }

    INOUT MIR-CLI-CITY-NM-TXT-T[1]
    {
        Length = "25";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    INOUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "2";
        DefaultConstant = "JP";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        SType = "Selection";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        Label = "State";
    }

    INOUT MIR-CLI-CTRY-CD
    {
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DefaultSession = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Country";
    }

    INOUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Zip Code";
        Index = "1";
    }

    INOUT MIR-CLI-RES-NUM-T[1]
    {
        Length = "5";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Apt/Unit #";
        Index = "1";
    }

    INOUT MIR-CLI-RES-TYP-CD
    {
        Length = "40";
        DefaultConstant = "H";
        CodeSource = "EDIT";
        CodeType = "RESD";
        SType = "Selection";
        Label = "Residence Type";
    }

    INOUT MIR-CLI-JP-ADDR-CD-T[1]
    {
        Length = "11";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Japanese Address Code";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-ADDL-TXT-T[1]
    {
        Length = "60";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Additional Information";
        Index = "1";
    }

    IN MIR-PSTL-ADDR-LN-1-TXT
    {
        Label = "Line 1 Options";
        SType = "Selection";
        Length = "30";
        CodeSource = "CSOM4915";
        CodeType = "PSTL-ADDR-LN-1-TXT";
        FilterFields = "4";
        FilterField1 = "MIR-CLI-PSTL-CD";
        FilterField2 = "MIR-CLI-CTRY-CD";
        FilterField3 = "MIR-DV-RQST-PSTL-ADDR-GR-KJ";
        FilterField4 = "MIR-DV-RQST-PSTL-ADDR-LN-1-TXT";
    }

    IN MIR-PSTL-ADDR-LN-2-TXT
    {
        Label = "Line 2 Options";
        SType = "Selection";
        Length = "30";
        CodeSource = "CSOM4915";
        FilterFields = "4";
        FilterField1 = "MIR-CLI-PSTL-CD";
        FilterField2 = "MIR-CLI-CTRY-CD";
        FilterField3 = "MIR-DV-RQST-PSTL-ADDR-GR-KJ";
        FilterField4 = "MIR-DV-RQST-PSTL-ADDR-LN-2-TXT";
    }

    INOUT MIR-DV-UPDT-ADDR-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Update previous address";
    }

    IN MIR-CLI-PREV-ADDR-LN-1-TXT-T[4]
    {
        Length = "25";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    IN MIR-CLI-PREV-ADDR-LN-2-TXT-T[4]
    {
        Length = "25";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    IN MIR-CLI-PREV-ADDR-YR-DUR-T[4]
    {
        Length = "3";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Years at Address";
        Index = "1";
    }

    IN MIR-CLI-PREV-CITY-NM-TXT-T[4]
    {
        Length = "25";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    IN MIR-CLI-PREV-CRNT-LOC-CD-T[4]
    {
        Length = "2";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "State";
        Index = "1";
    }

    IN MIR-CLI-PREV-CTRY-CD-T[4]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Text";
        Label = "Country";
        Index = "1";
    }

    IN MIR-CLI-PREV-PSTL-CD-T[4]
    {
        Length = "9";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Postal/Zip Code";
        Index = "1";
    }

    IN MIR-CLI-PREV-RES-NUM-T[4]
    {
        Length = "5";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Apt/Unit #";
        Index = "1";
    }

    IN MIR-CLI-PREV-JP-ADDR-CD-T[4]
    {
        Length = "11";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "JP Address Code";
        Index = "1";
    }

    INOUT MIR-CLI-CNTCT-ID-CD-T[5]
    {
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "EDIT";
        CodeType = "CNTID";
        SType = "Selection";
        Label = "Contact Type";
        Index = "1";
    }

    INOUT MIR-CLI-CNTCT-ID-TXT-T[5]
    {
        Length = "50";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Identification Code";
        Index = "1";
    }

    IN MIR-DV-CLI-PREV-NM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Client has a previous name(s)";
    }

    IN MIR-CLI-NM-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Client Name Change Date";
    }

    IN MIR-CLI-ADDR-CHNG-DT-T[1]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table5";
        SType = "Date";
        Label = "Address Changed Date";
        Index = "1";
    }

    IN MIR-DV-PREV-ADDR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Previous Address";
    }


    # the following 2 fields are used to trigger the
    # addition of previous info in a separate entry
    # area.

    INOUT prevNameEntry
    {
        Length = "1";
        SType = "Indicator";
        Label = "Enter an additional Previous Name:";
    }

    INOUT prevAddrEntry
    {
        Length = "1";
        SType = "Indicator";
        Label = "Enter an additional Previous Address:";
    }


    # the following 5 fields are used to capture data entered
    # for an additional previous name.  Different MIR names
    # for the process driver are already in place.  These fields
    # are only used to add new data - once committed to the
    # server, they will be re-set to blanks.

    INOUT MIR-CLI-INDV-TITL-TXT-T[1]
    {
        Length = "15";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "TITLE";
        SType = "Selection";
        Label = "Title";
        Index = "1";
    }

    INOUT MIR-ENTR-GIV-NM-T[2]
    {
        Length = "25";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    INOUT MIR-ENTR-SUR-NM-T[2]
    {
        Length = "25";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }


    # the following fields are used to capture data entered
    # for an additional previous address.  Because these MIR
    # field names already exist on this S-Step, they have
    # been appended with "-ADDITIONAL".  Once committed to the
    # server, they will be re-set to blanks.

    INOUT MIR-CLI-ADDR-LN-1-TXT-T-1-ADDITIONAL
    {
        Length = "25";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-LN-2-TXT-T-1-ADDITIONAL
    {
        Length = "25";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-LN-3-TXT-T-1-ADDITIONAL
    {
        Length = "25";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-YR-DUR-ADDITIONAL
    {
        Length = "3";
        SType = "Text";
        Label = "Years at Address";
    }

    INOUT MIR-CLI-CITY-NM-TXT-T-1-ADDITIONAL
    {
        Length = "25";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    INOUT MIR-CLI-CRNT-LOC-CD-ADDITIONAL
    {
        Length = "2";
        DefaultConstant = "JP";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        SType = "Selection";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        Label = "State";
    }

    INOUT MIR-CLI-CTRY-CD-ADDITIONAL
    {
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DefaultSession = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Country";
    }

    INOUT MIR-CLI-PSTL-CD-ADDITIONAL
    {
        Length = "9";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Zip Code";
        Index = "1";
    }

    INOUT MIR-CLI-RES-NUM-T-1-ADDITIONAL
    {
        Length = "5";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Apt/Unit #";
        Index = "1";
    }

    INOUT MIR-CLI-RES-TYP-CD-ADDITIONAL
    {
        Length = "40";
        DefaultConstant = "H";
        CodeSource = "EDIT";
        CodeType = "RESD";
        SType = "Selection";
        Label = "Residence Type";
    }

    INOUT MIR-CLI-JP-ADDR-CD-T-1-ADDITIONAL
    {
        Length = "11";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Japanese Address Code";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-ADDL-TXT-T-1-ADDITIONAL
    {
        Length = "60";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Additional Information";
        Index = "1";
    }

    IN MIR-PSTL-ADDR-LN-1-TXT-ADDITIONAL
    {
        Label = "Line 1 Options";
        SType = "Selection";
        Length = "30";
        CodeSource = "CSOM4915";
        CodeType = "PSTL-ADDR-LN-1-TXT";
        FilterFields = "4";
        FilterField1 = "MIR-CLI-PSTL-CD-ADDITIONAL";
        FilterField2 = "MIR-CLI-CTRY-CD-ADDITIONAL";
        FilterField3 = "MIR-DV-RQST-PSTL-ADDR-GR-KJ";
        FilterField4 = "MIR-DV-RQST-PSTL-ADDR-LN-1-TXT";
    }

    IN MIR-PSTL-ADDR-LN-2-TXT-ADDITIONAL
    {
        Label = "Line 2 Options";
        SType = "Selection";
        Length = "30";
        CodeSource = "CSOM4915";
        FilterFields = "4";
        FilterField1 = "MIR-CLI-PSTL-CD-ADDITIONAL";
        FilterField2 = "MIR-CLI-CTRY-CD-ADDITIONAL";
        FilterField3 = "MIR-DV-RQST-PSTL-ADDR-GR-KJ";
        FilterField4 = "MIR-DV-RQST-PSTL-ADDR-LN-2-TXT";
    }

}

