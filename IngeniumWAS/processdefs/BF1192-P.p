# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF1192-P.p                                                    *
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

P-STEP BF1192-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1192";
        BusinessFunctionName = "Client or Policy Requirements Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM0090";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CPREQ-DESGNT-ID
    {
        Length = "10";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement Requested By";
    }

#BU1581 CHANGES START
#   INOUT MIR-CPREQ-EFF-DT
    INOUT MIR-PREV-UPDT-DT
#BU1581 CHANGES END    
    {
        Length = "10";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Status Date";
    }

    INOUT MIR-CPREQ-FOLWUP-DT
    {
        Length = "10";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Follow-up Date";
    }

    INOUT MIR-CPREQ-FOLWUP-NUM
    {
        Length = "1";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Next Follow-up Notice Number";
    }

    INOUT MIR-CPREQ-NEW-RSLT-IND
    {
        Length = "1";
        DBTableName = "TREQT";
        SType = "Indicator";
        Label = "Only use new test results when trying to resolve requirements";
    }

    INOUT MIR-CPREQ-PD-IND
    {
        Length = "1";
        DBTableName = "TREQT";
        SType = "Indicator";
        Label = "Requirement fee paid";
    }

    INOUT MIR-CPREQ-STAT-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CPREQ-STAT-CD";
        DBTableName = "TREQT";
        SType = "Selection";
        Label = "Requirement Status";
    }

    INOUT MIR-CPREQ-TST-DT
    {
        Length = "10";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Test Date";
    }

    INOUT MIR-CPREQ-TST-RSLT-CD
    {
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "RESLT";
        DBTableName = "TREQT";
        SType = "Selection";
        Label = "Test Results";
    }
#M328C2 CHANGES START
    INOUT MIR-REQIR-POL-ID
    {
        Length = "10";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Policy Id";
    }
#M328C2 CHANGES END   

    INOUT MIR-CPREQ-VALID-DT
    {
        Length = "10";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Validity Date";
    }

    INOUT MIR-USER-ID
    {
        Length = "8";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Updated By";
    }

    IN MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-DV-REVW-REQIR-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Resolve indicator";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-REQIR-CAT-CD
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "RQCAT";
        DBTableName = "TREQT";
        SType = "Selection";
        Label = "Category";
    }

    IN MIR-REQIR-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TREQT";
        SType = "Selection";
        Label = "Requirement";
    }

    INOUT MIR-REQIR-COMNT-INFO-TXT
    {
 #MP171G-CHANGES STARTS HERE    
 #      Length = "400";
 #C17785-CHANGES START HERE
 #        Length = "100";
#R19946-CHANGES STARTS HERE
#        Length = "200";
        Length = "225";
#R19946-CHANGES ENDS HERE
 #C17785-CHANGES END HERE 
 #MP171G-CHANGES ENDS HERE       
        DBTableName = "TREQT";
        SType = "TextArea";
        Label = "Comment:";
    }

    INOUT MIR-CPREQ-CREAT-DT
    {
        Length = "10";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Creation Dates";
    }

    OUT MIR-REQIR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "REQIR-TYP-CD";
        DBTableName = "TRTAB";
        SType = "Text";
        Label = "Requirement Needed For";
    }

    OUT MIR-SERV-BR-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Branch";
    }

    INOUT MIR-CPREQ-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DefaultSession = "MIR-CPREQ-SEQ-NUM";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Sequence Number";
    }

    OUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Name";
    }

}

