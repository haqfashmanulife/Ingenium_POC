# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF9F84-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP334C  CTS      POLICY OWNER CHANGE HISTORY                               *
#*                                                                             *
#*******************************************************************************

P-STEP BF9F84-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9F84";
        BusinessFunctionName = "Policy Client Change List";
        BusinessFunctionType = "List";
        MirName = "CCWM9F80";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
        {
           Key;
           Mandatory;
           Length = "9";
           DBTableName = "TPCLH";
           DefaultSession = "MIR-POL-ID-BASE";
           SType = "Text";
           Label = "Policy Id";
        }
    
    INOUT MIR-POL-ID-SFX
       {
           Key;
           Length = "1";
           DBTableName = "TPCLH";
           DefaultSession = "MIR-POL-ID-SFX";
           SType = "Text";
           Label = "Suffix";
       }
    INOUT MIR-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TPCLH";
        SType = "Text";
        Label = "Sequence Number";    

    } 
    OUT MIR-CURR-CLI-NM
            {
                Length = "51";
                DBTableName = "TCLNM";
                SType = "Text";
                Label = "Current Owner Client Name Kana";
    }
    OUT MIR-CURR-CLI-ID
        {
            Length = "10";
            DBTableName = "TCLNM";
            SType = "Text";
            Label = "Current Owner client ID";
       }    

    OUT MIR-PERI-STRT-DT-T[20]
       {
           Length = "10";
           FieldGroup = "Table3";
           DBTableName = "TPCLH";
           SType = "Date";
           Label = "Start Date";
           Index = "1";
       }
    OUT MIR-PERI-END-DT-T[20]
       {
           Length = "10";
           FieldGroup = "Table3";
           DBTableName = "TPCLH";
           SType = "Date";
           Label = "End Date";
           Index = "1";
       } 
     OUT MIR-CLI-ID-T[20]
        {
            Length = "10";
            FieldGroup = "Table3";
            KeyColumn;
            DBTableName = "TPCLH";
            SType = "Text";
            Label = "Previous Owner client ID";
            Index = "1";
       }   
    OUT MIR-DV-CLI-NM-T[20]
        {
            Length = "51";
            FieldGroup = "Table3";
            DBTableName = "TCLNM";
            SType = "Text";
            Label = "Previous Owner Client Name Kana";
            Index = "1";
    }
     OUT MIR-CLI-DTH-DT-T[20]
           {
               Length = "10";
               FieldGroup = "Table3";
               DBTableName = "TPCLH";
               SType = "Date";
               Label = "Previous Owner Death Date";
               Index = "1";
       } 
    OUT MIR-TOT-PD-PREM-AMT-T[20]
    {
        Length = "16";
        DBTableName = "TPCLH";
        SType = "Currency";
        Label = "Previous Owner Paid Premium";
       
    }
     OUT MIR-SEQ-NUM-T[20]
        {
            Length = "3";
            FieldGroup = "Table3";
            DBTableName = "TPCLH";
            SType = "Hidden";
            Label = "Sequence Number";
            Index = "1";
       }
      OUT MIR-CLI-ID
        {
 	   DisplayOnly;
 	   Length = "10";
 	   FieldGroup = "Table3";
 	   SType = "Text";
 	   Label = "Previous Owner client ID";
 	   Index = "1";
         }  
    OUT MIR-TYP-OF-CHNG-T[20]
    {
        Length = "2";
        FieldGroup = "Table3";      
        DBTableName = "TPCLH";
        SType = "Text";
        Label = "Type of Change";       
    }                   
}

