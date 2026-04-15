# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:35 PM EDT

#*******************************************************************************
#*  Component:   BF1191-I.s                                                    *
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
#*  R19946  CTS      CHANGES TO HANDLE COMMENT TEXT LENGTH                     *
#*******************************************************************************

S-STEP BF1191-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "ReqtType";
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

    INOUT MIR-CPREQ-CREAT-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Creation Dates";
    }

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-REQIR-CAT-CD
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "RQCAT";
        SType = "Selection";
        Label = "Category";
    }

    INOUT MIR-REQIR-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "NSOM9223";
        FilterFields = "1";
        FilterField1 = "MIR-REQIR-CAT-CD";
    #   CodeSource = "EDIT";
    #   CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement";
    }

    INOUT MIR-REQIR-COMNT-INFO-TXT
    {
#MP171G-CHANGES STARTS HERE    
#        Length = "400";
#C17785-CHANGES START HERE
#        Length = "100";
#R19946-CHANGES STARTS HERE
#        Length = "200";
        Length = "225";
#R19946-CHANGES ENDS HERE
#C17785-CHANGES END HERE         
#MP171G-CHANGES ENDS HERE          
        CodeSource = "NSOM9224";
        FilterFields = "1";
        FilterField1 = "MIR-REQIR-ID";
        DefaultConstant = "RC";
        SType = "TextArea";
        Label = "Comment:";
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
        DefaultSession = "LSIR-PRCES-DT";
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
        Mandatory;
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
        DefaultSession = "MIR-USER-ID";
        Label = "Updated By";
    }

    IN MIR-CPREQ-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

}

