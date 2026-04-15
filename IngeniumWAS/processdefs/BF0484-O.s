# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:23 PM EDT

#*******************************************************************************
#*  Component:   BF0484-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  C19402           Adding the fields PREV_UPDT_USER_ID and PREV_UPDT_DT      *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*  M2025D           CHANGES DONE AS THE PART OF FRA-2025 PROJ                 * 
#*******************************************************************************

S-STEP BF0484-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-POL-ID-BASE";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

#UY3004 CHANGES START
    INOUT Dispolval
    {
        SType = "Hidden";
    }

    INOUT Dissfxval
    {
        SType = "Hidden";
    }
#UY3004 CHANGES END

    INOUT MIR-CVG-NUM
    {
        Key;
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-PCHST-EFF-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-PCHST-SEQ-NUM
    {
        Key;
        Length = "3";
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
        SType = "Selection";
        Label = "Current Status";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
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

    IN MIR-CVG-NUM-T[100]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-MSG-TXT-T[100]
    {
        DisplayOnly;
# M2025D changes begin
#       Length = "68";   		
        Length = "74";
# M2025D changes end		
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

    IN MIR-PCHST-EFF-DT-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-PCHST-PREV-STAT-CD-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PCHST-STAT-CD";
        SType = "Text";
        Label = "Previous Status";
        Index = "1";
    }

    IN MIR-PCHST-SEQ-NUM-T[100]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-PCHST-STAT-CD-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PCHST-STAT-CD";
        SType = "Text";
        Label = "Current Status";
        Index = "1";
    }

# C19402 changes starts
    IN MIR-PREV-UPDT-DT-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Date";
        Label = "Previous Update Date";
        Index = "1";
    }
    
    IN MIR-PREV-UPDT-USER-ID-T[100]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Previous update user ID";
        Index = "1";
    }    
# C19402 changes ends   
    
    IN MIR-POL-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }
#UY3049 CHANGES STARTS
    INOUT MIR-10-POL-ID
    {
        Length = "10";
        SType = "Hidden";
        Label = "Policy Id";
    }     
    INOUT MIR-STR3-PAYO-IND
    {
        Length = "1";
        SType = "Hidden";
    }
#UY3049 CHANGES ENDS
}

