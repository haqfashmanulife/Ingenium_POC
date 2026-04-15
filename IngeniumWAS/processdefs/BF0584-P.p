# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:23 PM EDT

#*******************************************************************************
#*  Component:   BF0584-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  EN1768  IM       Changed length to 120                                     *
#*  MP310B  CTS      CHANGES AS PART OF MP310B                                 * 
#*******************************************************************************

P-STEP BF0584-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0584";
        BusinessFunctionName = "CC Messages";
        BusinessFunctionType = "List";
        MirName = "NCWM0580";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CCAS-MSG-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TCCKO";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCCKO";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    OUT MIR-CCAS-MSG-RESP-TXT-T[50]
    {
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TCCKO";
        SType = "Text";
        Label = "Fail Response";
        Index = "1";
    }
#Adding new field as part of MP310B

    OUT MIR-CCKO-POL-ID-T[50]
        {
            Length = "10";
            FieldGroup = "Table50";
            DBTableName = "TCCKO";
            SType = "Text";
            Label = "Policy Id";
            Index = "1";
    }
    OUT MIR-CCAS-MSG-SEQ-NUM-T[50]
    {
        Length = "3";
        FieldGroup = "Table50";
        DBTableName = "TCCKO";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-CLI-SUR-NM
    {
        Length = "25";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Last Name";
    }

    OUT MIR-CPREQ-STAT-CD-T[11]
    {
        Length = "3";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "CPREQ-STAT-CD";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement Status";
        Index = "1";
    }

    OUT MIR-MISS-INFO-IND-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        DBTableName = "TCCKO";
        SType = "Indicator";
        Label = "Clear case failure due to missing information";
        Index = "1";
    }

    OUT MIR-MSG-TXT-T[50]
    {
#Length is changed as part EN001768    
#       Length = "68";
        Length = "120";
        FieldGroup = "Table50";
        DBTableName = "TMSGS";
        SType = "Text";
        Label = "Failure Message";
        Index = "1";
    }

    OUT MIR-POL-ID-BASE
    {
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
    }

    OUT MIR-POL-ID-SFX
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-PREV-UPDT-DT
    {
        Length = "10";
        DBTableName = "TCCKO";
        SType = "Date";
        Label = "Clear Case Kickout Date";
    }

    OUT MIR-REQIR-ID-T[11]
    {
        Length = "40";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement";
        Index = "1";
    }

}

