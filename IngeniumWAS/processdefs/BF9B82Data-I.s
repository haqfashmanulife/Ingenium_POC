# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:39 PM EDT

#*******************************************************************************
#*  Component:   BF9B82Data-I.s                                                *
#*  Description: Birth Date/ Sex Modification Process                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS91B  CTS      Initial Version                                           *
#*******************************************************************************

S-STEP BF9B82Data-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "BthSxChng";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-NEW-BTH-DT";
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

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }
    
    INOUT MIR-CO-RECV-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Company Received Date";
    }

    INOUT MIR-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }
    
    INOUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Date";
    }
    
    INOUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DV-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Mode";
    }
    
    INOUT MIR-POL-MPREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";        
        Label = "Modal Premium";
    }
    
    INOUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Plan";
    }

    INOUT MIR-INSRD-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Insured Client ID";
    }   
        
    INOUT MIR-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
    
    INOUT MIR-INSRD-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCVGC";
        SType = "Number";
        Label = "Issue Age";
    }    
    
    INOUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date"; 
    }    
    
    INOUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
    
    INOUT MIR-NEW-SEX-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "New Sex";
    }
             
    INOUT MIR-NEW-BTH-DT
    {
        Mandatory;
        Length = "10";
        SType = "Date";
        Label = "New Birth Date"; 
    } 

    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    } 

    IN MIR-POL-ID-BASE-T[10]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }
    
    IN MIR-POL-ID-SFX-T[10]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }
        
    IN MIR-PLAN-ID-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan Name";
        Index = "1";
    }
        
    IN MIR-POL-CSTAT-CD-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }


}

