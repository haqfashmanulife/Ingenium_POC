# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   ClmEntrySearch.s                                                                *
#*  Description:    Supports the client claim search screen.  A client id 
#*                              or policy id may be entered or a search on name 
#*                              may be submited.
#*                                                                                                                                *
#*******************************************************************************
#*  Chg#    Release  Description                                                                      *
#*                                                                                                                                *
#*  HCL103  HIN/CL   CLIENT CLAIM SEARCH              (HCL103B)       *
#*                                                                                                                                *
#*******************************************************************************

S-STEP ClmEntrySearch
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
    
  #  IN RestoreScreenInd;
    

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-CLI-ID
    {
        DefaultSession = "MIR-CLI-ID";
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }

    INOUT MIR-POL-ID-BASE
    {
        DefaultSession = "MIR-POL-ID-BASE";
        Length = "9";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-POL-ID-SFX
    {
        DefaultSession = "MIR-POL-ID-SFX";
        Length = "1";
        SType = "Text";
        Label = "Policy ID Suffix";
    }

    INOUT MIR-CLI-ENTR-GIV-NM
    {
        Length = "25";
        SType = "Text";
        Label = "First Name";
    }

   INOUT  MIR-CLI-ENTR-SUR-NM
    {
        Length = "25";
        SType = "Text";
        Label = "Last Name";
    }




    INOUT EnhancedSearchIndicator
    {
        SType = "Indicator";
        Label = "To perform an enhanced search, check here:";
    }


    # location filtering based on session object for user
    # sign-on country.

    INOUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        SType = "Selection";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        Label = "State";
    }


    INOUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        SType = "Text";
        Label = "Zip Code";
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


    INOUT MIR-CLI-BTH-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }


    INOUT MIR-CLI-ADDR-LOC-CD
    {
	Length = "8";
	SType = "Text";
	Label = "Address Code";
    }

    IN MIR-CLI-ADDR-LN-1-TXT-T[50]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Primary Address";
        Index = "1";
    }

    IN MIR-CLI-ADDR-ADDL-TXT-T[50]
    {
        DisplayOnly;
        Length = "60";
        SType = "Text";
        Label = "Additional Information";
        Index = "1";
    }

    IN MIR-CLI-ADDR-STAT-CD-T[50]
    {
        Length = "40";
        FieldGroup = "Table5";
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

    IN MIR-CLI-CRNT-LOC-CD-T[50]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Postal/Zip Code";
        Index = "1";
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


    IN MIR-DV-CLI-PREV-NM-IND-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        SType = "Indicator";
        Label = "AKA";
        Index = "1";
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
        DefaultConstant = "KJ";
        SType = "YesNo";
        Label = "Search Language Group Code";
    }


}

