# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF9F80-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP334C  CTS      POLICY OWNER CHANGE HISTORY                               *
#*                                                                             *
#*******************************************************************************

P-STEP BF9F80-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9F80";
        BusinessFunctionName = "Policy Client Change Inquiry";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9F80";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
        {
           Key;
           Mandatory;
           Length = "9";
           DBTableName = "TPCLH";
           DefaultSession = "MIR-POL-ID-BASE";
           SType = "Text";
           Label = "Policy Id";
        }
    
    IN MIR-POL-ID-SFX
       {
           Key;
           Length = "1";
           DBTableName = "TPCLH";
           DefaultSession = "MIR-POL-ID-SFX";
           SType = "Text";
           Label = "Suffix";
       }
   IN MIR-SEQ-NUM
     {
         Key;
         Length = "3";
         DBTableName = "TPCLH";
         SType = "Text";
         Label = "Sequence Number"; 
         }    

    OUT MIR-PERI-STRT-DT
       {
           Length = "10";
           DBTableName = "TPCLH";
           SType = "Date";
           Label = "Start Date";
       }
    OUT MIR-PERI-END-DT
       {
           Length = "10";
           DBTableName = "TPCLH";
           SType = "Date";
           Label = "End Date";
       } 
     OUT MIR-CLI-ID
        {
            Length = "10";
            DBTableName = "TPCLH";
            SType = "Text";
            Label = "Previous Owner client ID";
       }   
    OUT MIR-DV-CLI-NM
        {
            Length = "51";
            FieldGroup = "Table3";
            DBTableName = "TCLNM";
            SType = "Text";
            Label = "Previous Owner Client Name Kana";
            Index = "1";
    }
     OUT MIR-CLI-DTH-DT
           {
               Length = "10";
               FieldGroup = "Table3";
               DBTableName = "TPCLH";
               SType = "Date";
               Label = "Previous Owner Death Date";
               Index = "1";
       } 
    OUT MIR-TOT-PD-PREM-AMT
    {
        Length = "16";
        DBTableName = "TPCLH";
        SType = "Currency";
        Label = "Previous Owner Paid Premium";
       
    }
    OUT MIR-TYP-OF-CHNG
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "TYP-OF-CHNG";
        SType = "Text";
        Label = "Type of Change";       
    }           
}

