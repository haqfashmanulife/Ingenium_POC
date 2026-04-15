
#*******************************************************************************
#*  Component:   BF9405-P.p                                                    *
#*  Description: Bulk Application Inquiry Screen                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP176B  CTS      Intial Version                                            *
#*  M176B1  CTS      ADDED THREE NEW FILEDS                                    * 
#*******************************************************************************


P-STEP BF9405-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9405";
        BusinessFunctionName = "Bulk Application Policy Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9405";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

     INOUT MIR-POL-BULK-APP-ID
     {
            Key;
            Mandatory;
            Length = "15";
            DBTableName = "TPOL";
            SType = "Text";
            Label = "Bulk Application ID";
    }
 
    INOUT MIR-POL-ID
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }

    OUT MIR-POL-APP-FORM-ID-T[50]
    {
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Application Form ID";
        Index = "1";
    }

    OUT MIR-POL-ID-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }

    OUT MIR-DV-INSRD-CLI-NM-T[50]
    {
        Length = "75";
        FieldGroup = "Table50";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
    }

   OUT MIR-POL-CSTAT-CD-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "POL-STAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }
    
#M176B1 CHANGES STARTS HERE
    
    OUT MIR-LIAB-STRT-DT-T[50]
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label ="Liability Commencement date";
     }
 
    OUT MIR-POL-ISS-PRCES-DT-T[50]
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Processing Date";
    } 
    
    OUT MIR-POL-ISS-EFF-DT-T[50]
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Effective Date";
    }
#M176B1 CHANGES ENDS HERE   
}
