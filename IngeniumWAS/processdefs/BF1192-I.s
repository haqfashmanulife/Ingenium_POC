# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT

#*******************************************************************************
#*  Component:   BF1192-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*  Chg#    Date     Auth.  Description                                        *
#*                                                                             *
#*  EN1327  27Feb07  CLB    Add new fields for category code and comment.      *
#*  BU1581  02NOV07  CTS    MIR-CPREQ-EFF-DT is replaced by MIR-PREV-UPDT-DT   *
#*  MP171G  26MAR12  CTS    CHANGES FOR MODIFICATION IN UNDERWRITING           *
#*  MP171G                  BUISNESS PROCESS                                   *
#*  C17785  08JUN12  CTS    CHANGES FOR REQUIREMENT COMMENT LENGTH             *
#*  M328C2  23FEB18  CTS    ADDITION OF A NEW FIELD MIR-REQIR-POL-ID FOR UW REQ*
#*******************************************************************************

S-STEP BF1192-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-CPREQ-STAT-CD";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    INOUT ReqtType;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    IN MIR-CPREQ-CREAT-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Creation Dates";
    }

    INOUT MIR-CPREQ-DESGNT-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Requirement Requested By";
    }

#BU1581 CHANGES START    
#   INOUT MIR-CPREQ-EFF-DT
    INOUT MIR-PREV-UPDT-DT
#BU1581 CHANGES END    
    {
        Length = "10";
        SType = "Date";
        Label = "Status Date";
    }

    INOUT MIR-CPREQ-FOLWUP-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Follow-up Date";
    }

    INOUT MIR-CPREQ-FOLWUP-NUM
    {
        Length = "1";
        SType = "Text";
        Label = "Next Follow-up Notice Number";
    }

    INOUT MIR-CPREQ-NEW-RSLT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Only use new test results when trying to resolve requirements";
    }

    INOUT MIR-CPREQ-PD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Requirement fee paid";
    }

    INOUT MIR-CPREQ-STAT-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CPREQ-STAT-CD";
        SType = "Selection";
        Label = "Requirement Status";
    }

    INOUT MIR-CPREQ-TST-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Test Date";
    }

    INOUT MIR-CPREQ-TST-RSLT-CD
    {
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "RESLT";
        SType = "Selection";
        Label = "Test Results";
    }
#M328C2 CHANGES START
    INOUT MIR-REQIR-POL-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Policy Id";
    }
#M328C2 CHANGES END       

    INOUT MIR-CPREQ-VALID-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Validity Date";
    }

    INOUT MIR-USER-ID
    {
        Length = "8";
        SType = "Text";
        Label = "Updated By";
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

    INOUT MIR-DV-REVW-REQIR-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Resolve indicator";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-REQIR-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "NSOM9223";
        FilterFields = "1";
        FilterField1 = "MIR-REQIR-CAT-CD";
    #   CodeSource = "EDIT";
    #   CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement";
    }

    IN MIR-REQIR-CAT-CD
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "RQCAT";
        SType = "Text";
        Label = "Category";
    }

    INOUT MIR-REQIR-COMNT-INFO-TXT
    {
#MP171G-CHANGES STARTS HERE    
#        Length = "400";
#C17785-CHANGES START HERE
#        Length = "100";
        Length = "200";
#C17785-CHANGES END HERE 
#MP171G-CHANGES ENDS HERE        
        SType = "TextArea";
        Label = "Comment:";
    }

    IN MIR-CPREQ-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Client Name";
    }

    IN MIR-REQIR-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "REQIR-TYP-CD";
        SType = "Text";
        Label = "Requirement Needed For";
    }

    IN MIR-SERV-BR-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Branch";
    }

}

