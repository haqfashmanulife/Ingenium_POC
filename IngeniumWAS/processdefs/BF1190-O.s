# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:35 PM EDT

#*******************************************************************************
#*  Component:   BF1190-O.s                                                    *
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
#*  M328C2  23FEB18  CTS    ADDITION OF A NEW FIELD MIR-REQIR-POL-ID FOR UW REQ*
#*******************************************************************************

S-STEP BF1190-O
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

    IN ReqtType;

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
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Creation Dates";
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

    IN MIR-CPREQ-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
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

    IN MIR-REQIR-CAT-CD
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "RQCAT";
        SType = "Text";
        Label = "Category";
    }

    IN MIR-REQIR-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement";
    }

    IN MIR-CPREQ-DESGNT-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Requirement Requested By";
    }

#BU1581 CHANGES START
#   IN MIR-CPREQ-EFF-DT
    IN MIR-PREV-UPDT-DT
#BU1581 CHANGES END    
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Status Date";
    }

    IN MIR-CPREQ-FOLWUP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Follow-up Date";
    }

    IN MIR-CPREQ-FOLWUP-NUM
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Next Follow-up Notice Number";
    }

    IN MIR-CPREQ-NEW-RSLT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Only use new test results when trying to resolve requirements";
    }

    IN MIR-CPREQ-PD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Requirement fee paid";
    }

    IN MIR-CPREQ-STAT-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CPREQ-STAT-CD";
        SType = "Text";
        Label = "Requirement Status";
    }

    IN MIR-CPREQ-TST-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Test Date";
    }

    IN MIR-CPREQ-TST-RSLT-CD
    {
        DisplayOnly;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "RESLT";
        SType = "Text";
        Label = "Test Results";
    }
    
#M328C2 CHANGES START
    IN MIR-REQIR-POL-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Policy Id";
    }
#M328C2 CHANGES END      

    IN MIR-CPREQ-VALID-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Validity Date";
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

    IN MIR-USER-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Updated By";
    }

    IN MIR-REQIR-COMNT-INFO-TXT
    {
        DisplayOnly;
        Length = "400";
        SType = "TextArea";
        Label = "Comment:";
    }

}

