# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1064-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MFFFU4  ACR      ADD MIR-CLI-FIN-ASSET-CD, remove CLI-NET-WRTH-AMT         *
#*                                                                             *
#*  26878B   CTS      CHANGES DONE FOR ADDITION OF NEW FIELD                   *
#*                    AS PART OF ELDERLY PHASE 2                               *
#*******************************************************************************

P-STEP BF1064-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1064";
        BusinessFunctionName = "Client Income Information List";
        BusinessFunctionType = "List";
        MirName = "CCWM6130";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-INCM-EFF-DT
    {
        Key;
        Length = "10";
        DBTableName = "TCLII";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Date";
    }

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    OUT MIR-CLI-EARN-INCM-AMT-T[12]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table12";
        DBTableName = "TCLII";
        SType = "Currency";
        Label = "Earned Income";
        Index = "1";
    }

    OUT MIR-CLI-INCM-EFF-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TCLII";
        SType = "Date";
        Label = "Date";
        Index = "1";
    }

#    OUT MIR-CLI-NET-WRTH-AMT-T[12]
#    {
#        Length = "15";
#        Decimals = "0";
#        FieldGroup = "Table12";
#        DBTableName = "TCLII";
#        SType = "Currency";
#        Label = "Net Worth";
#        Index = "1";
#    }

    OUT MIR-CLI-OTHR-INCM-AMT-T[12]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table12";
        DBTableName = "TCLII";
        SType = "Currency";
        Label = "Other Income";
        Index = "1";
    }

    OUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }

    OUT MIR-EARN-INCM-MODE-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "EARN-INCM-MODE-CD";
        DBTableName = "TCLII";
        SType = "Text";
        Label = "Earned Income Mode";
        Index = "1";
    }

    OUT MIR-OTHR-INCM-MODE-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "OTHR-INCM-MODE-CD";
        DBTableName = "TCLII";
        SType = "Text";
        Label = "Other Income Mode";
        Index = "1";
    }

    OUT MIR-CLI-FIN-ASSET-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "FASST";
        DBTableName = "TCLII";
        SType = "Text";
#26878B CHANGES START HERE
#       Label = "Total Financial Assets";
        Label = "Total Financial Assets Code";
#26878B CHANGES END HERE
        Index = "1";
    }
#26878B CHANGES START HERE
    OUT MIR-CLI-FIN-ASSET-AMT-T[12]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table12";
        DBTableName = "TCLII";
        SType = "Currency";
        Label = "Total Financial Assets Amount";
        Index = "1";
    }
#26878B CHANGES END HERE
}

