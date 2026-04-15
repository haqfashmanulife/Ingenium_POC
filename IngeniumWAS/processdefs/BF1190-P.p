# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF1190-P.p                                                    *
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

P-STEP BF1190-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1190";
        BusinessFunctionName = "Client or Policy Requirements Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM0090";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CPREQ-CREAT-DT
    {
        Length = "10";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Creation Dates";
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

    IN MIR-CPREQ-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TREQT";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
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

    INOUT MIR-REQIR-CAT-CD
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "RQCAT";
        DBTableName = "TREQT";
        SType = "Selection";
        Label = "Category";
    }

    OUT MIR-REQIR-COMNT-INFO-TXT
    {
        Length = "400";
        DBTableName = "TREQT";
        SType = "TextArea";
        Label = "Comment:";
    }

    OUT MIR-CPREQ-DESGNT-ID
    {
        Length = "10";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement Requested By";
    }

#BU1581 CHANGES START
#   OUT MIR-CPREQ-EFF-DT
    OUT MIR-PREV-UPDT-DT   
#BU1581 CHANGES END    
    {
        Length = "10";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Status Date";
    }

    OUT MIR-CPREQ-FOLWUP-DT
    {
        Length = "10";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Follow-up Date";
    }

    OUT MIR-CPREQ-FOLWUP-NUM
    {
        Length = "1";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Next Follow-up Notice Number";
    }

    OUT MIR-CPREQ-NEW-RSLT-IND
    {
        Length = "1";
        DBTableName = "TREQT";
        SType = "Indicator";
        Label = "Only use new test results when trying to resolve requirements";
    }

    OUT MIR-CPREQ-PD-IND
    {
        Length = "1";
        DBTableName = "TREQT";
        SType = "Indicator";
        Label = "Requirement fee paid";
    }

    OUT MIR-CPREQ-STAT-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CPREQ-STAT-CD";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement Status";
    }

    OUT MIR-CPREQ-TST-DT
    {
        Length = "10";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Test Date";
    }

    OUT MIR-CPREQ-TST-RSLT-CD
    {
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "RESLT";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Test Results";
    }

#M328C2 CHANGES START
    OUT MIR-REQIR-POL-ID
    {
        Length = "10";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Policy Id";
    }
#M328C2 CHANGES END   
    OUT MIR-CPREQ-VALID-DT
    {
        Length = "10";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Validity Date";
    }

    OUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Name";
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

    OUT MIR-USER-ID
    {
        Length = "8";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Updated By";
    }

}

