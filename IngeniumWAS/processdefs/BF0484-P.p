# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF0484-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  C19402           Adding the fields PREV_UPDT_USER_ID and PREV_UPDT_DT      *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *                                                                          *
#*  M2025D           CHANGES DONE AS THE PART OF FRA-2025 PROJ                 *                                                                            *
#*******************************************************************************

P-STEP BF0484-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0484";
        BusinessFunctionName = "Policy/Coverage Change History List";
        BusinessFunctionType = "List";
        MirName = "CCWM0480";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CVG-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TPHST";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-PCHST-EFF-DT
    {
        Key;
        Length = "10";
        DBTableName = "TPHST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-PCHST-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TPHST";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-PCHST-STAT-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PCHST-STAT-CD";
        DBTableName = "TPHST";
        SType = "Selection";
        Label = "Current Status";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPHST";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPHST";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CVG-NUM-T[100]
    {
        Length = "2";
        FieldGroup = "Table100";
        DBTableName = "TPHST";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-MSG-TXT-T[100]
    {
# M2025D changes begin
#       Length = "68";   		
        Length = "74";
# M2025D changes end		
        FieldGroup = "Table100";
        DBTableName = "TMSGS";
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

    OUT MIR-PCHST-EFF-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TPHST";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-PCHST-PREV-STAT-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PCHST-STAT-CD";
        DBTableName = "TPHST";
        SType = "Text";
        Label = "Previous Status";
        Index = "1";
    }

    OUT MIR-PCHST-SEQ-NUM-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        DBTableName = "TPHST";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-PCHST-STAT-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PCHST-STAT-CD";
        DBTableName = "TPHST";
        SType = "Text";
        Label = "Current Status";
        Index = "1";
    }

# C19402 changes starts
    OUT MIR-PREV-UPDT-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TPHST";
        SType = "Date";
        Label = "Previous Update Date";
        Index = "1";
    }
    
    OUT MIR-PREV-UPDT-USER-ID-T[100]
    {
        Length = "8";
        FieldGroup = "Table100";
        DBTableName = "TPHST";
        SType = "Text";
        Label = "Previous update user ID";
        Index = "1";
    }    
# C19402 changes ends  

    OUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }
#UY3049 CHANGES STARTS    
    IN MIR-10-POL-ID
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Hidden";
        Label = "Policy Id";
    }

    IN MIR-STR3-PAYO-IND
    {
        Length = "1";
        SType = "Hidden";
    }
#UY3049 CHANGES ENDS
}

