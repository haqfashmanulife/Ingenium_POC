# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9A72-P.p                                                    *
#*  Description: Death Claim Note Update step                                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCACN  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9A72-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A72";
        BusinessFunctionName = "Death Claim Note Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9A70";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLM-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TFTXT";
        SType = "Text";
        Label = "Death Master Claim ID";
    }

    IN MIR-CLM-NOTE-SEQ-NUM
    {
        Key;
        Mandatory;  
        Length = "4";
        DBTableName = "TFTXT";        
        SType = "Number";
        Label = "Sequence Number";
    }

    INOUT MIR-INSRD-CLI-ID
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Insured Client ID";
    }

    INOUT MIR-INSRD-CLI-NM
    {
        Length = "51";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Insured Name";
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
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
    
    INOUT MIR-CLM-HO-ACPT-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Head Office Claim Form Acceptance Date";
    }
    
    INOUT MIR-CLM-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLM-STAT-CD";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Death Master Claim Status";
    }
    
    INOUT MIR-PREV-UPDT-DT
    {
        Length = "10";
        DBTableName = "TFTXT";
        SType = "Date";
        Label = "Previous Update Date";
    }
    
    INOUT MIR-PREV-UPDT-USER-ID
    {
        Length = "8";
        DBTableName = "TFTXT";
        SType = "Text";
        Label = "Previous Update User ID";
    } 
    
    INOUT MIR-CLM-NOTE-TXT
    {
        Length = "500";
        DBTableName = "TFTXT";        
        SType = "Text";
        Label = "Claim Note";
    }

   }
