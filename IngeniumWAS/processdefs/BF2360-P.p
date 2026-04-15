# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:51 PM EDT

#*******************************************************************************
#*  Component:   BF2360-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016056  602J     New for requirement flow                                  *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  02GL57  DPK      CWA Suspense Account and Refund                           *
#*                                                                             *
#*  Chg#    Date     Auth.  Description                                        *
#*                                                                             *
#*  EN1327  27Feb07  CLB    Add new field for requirement category             *
#*  BU1581  02NOV07  CTS    MIR-CPREQ-EFF-DT is replaced by MIR-PREV-UPDT-DT   *
#*******************************************************************************

P-STEP BF2360-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2360";
        BusinessFunctionName = "Requirements Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM2360";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
     
    INOUT MIR-POL-CSH-RFND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-CSH-RFND-CD";
        SType = "Selection";
        Label = "Cash Refund";
    }

    OUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Name";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
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

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Policy Status";
    }

    OUT MIR-CPREQ-DESGNT-ID-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement Requested By";
        Index = "1";
    }

#BU1581 CHANGES START
#   OUT MIR-CPREQ-EFF-DT-T[50]
    OUT MIR-PREV-UPDT-DT-T[50]
#BU1581 CHANGES END    
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Status Date";
        Index = "1";
    }

    OUT MIR-CPREQ-FOLWUP-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Follow-up Date";
        Index = "1";
    }

    OUT MIR-CPREQ-FOLWUP-NUM-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Next Follow-up Notice Number";
        Index = "1";
    }

    OUT MIR-CPREQ-SEQ-NUM-T[50]
    {
        Length = "3";
        FieldGroup = "Table50";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-CPREQ-STAT-CD-T[50]
    {
        Length = "3";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CPREQ-STAT-CD";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement Status";
        Index = "1";
    }

    OUT MIR-CPREQ-TST-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Test Date";
        Index = "1";
    }

    OUT MIR-CPREQ-TST-RSLT-CD-T[50]
    {
        Length = "4";
        FieldGroup = "Table50";
        CodeSource = "EDIT";
        CodeType = "RESLT";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Test Results";
        Index = "1";
    }

    OUT MIR-CPREQ-VALID-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Validity Date";
        Index = "1";
    }

    OUT MIR-REQIR-CAT-CD-T[50]
    {
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "EDIT";
        CodeType = "RQCAT";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Category";
        Index = "1";
    }

    OUT MIR-REQIR-ID-T[50]
    {
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement";
        Index = "1";
    }

    OUT MIR-REQIR-TYP-CD-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "REQIR-TYP-CD";
        DBTableName = "TRTAB";
        SType = "Text";
        Label = "Requirement Needed For";
        Index = "1";
    }

    OUT MIR-USER-ID-T[50]
    {
        Length = "8";
        FieldGroup = "Table50";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Updated By";
        Index = "1";
    }

    OUT MIR-CPREQ-PD-IND-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        DBTableName = "TREQT";
        SType = "Indicator";
        Label = "Requirement fee paid";
        Index = "1";
    }

    OUT MIR-CPREQ-CREAT-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Creation Date";
        Index = "1";
    }

    OUT MIR-DV-REVW-REQIR-IND-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Resolve Indicator";
        Index = "1";
    }

    OUT MIR-CPREQ-NEW-RSLT-IND-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        DBTableName = "TREQT";
        SType = "Indicator";
        Label = "New Test Result Resolution";
        Index = "1";
    }

    OUT MIR-POL-ID-BASE-T[10]
    {
        Length = "9";
        FieldGroup = "Table10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    OUT MIR-POL-ID-SFX-T[10]
    {
        Length = "1";
        FieldGroup = "Table10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    OUT MIR-POL-CSTAT-CD-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Policy Status";
        Index = "1";
    }

    OUT MIR-CLI-ID-T[40]
    {
        Length = "1";
        FieldGroup = "Table40";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-DV-INSRD-CLI-NM-T[40]
    {
        Length = "75";
        FieldGroup = "Table40";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Name";
        Index = "1";
    }

    OUT MIR-CLI-UWGDECN-CD-T[40]
    {
        Length = "2";
        FieldGroup = "Table40";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Decision";
        Index = "1";
    }

    OUT MIR-DV-CLI-UWG-REQIR-IND-T[40]
    {
        Length = "1";
        FieldGroup = "Table40";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Requirement Indicator";
        Index = "1";
    }

}

