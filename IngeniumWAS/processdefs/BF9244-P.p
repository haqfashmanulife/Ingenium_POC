# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*********************************************************************************
#*  Component:   BF9244-P.p                                                                                *
#*  Description: Policy's bank detail update screen.                                    *
#*               Simple client detail preceding current bank info.  Bank detail*
#*               revision section follows.                                                                       *
#*                                                                                                                                     *
#**********************************************************************************
#*  Chg#    Release  Description                                                                           *
#*                                                                                                                                     *
#*  HCL103  HIN/CL   CLIENT CLAIM SEARCH              (HCL103B)            *
#**********************************************************************************

P-STEP BF9244-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9244";
        BusinessFunctionName = "Claim Entry List";
        BusinessFunctionType = "Inquire";
        MirName = "CCWM9244";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
     }

    INOUT MIR-DV-MORE-CLM-ID
    {
        Length = "08";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "more claim id";
     }

    INOUT MIR-DV-MORE-CLM-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "more claim ind";
     }


    INOUT MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }
    
    OUT MIR-DV-CLI-NM
    {
        Key;
        DisplayOnly;
        Length = "75";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-CLI-BTH-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
    }
       
    OUT MIR-CLI-SEX-CD
    {
          DisplayOnly;
          Length = "20";
          CodeSource = "DataModel";
          CodeType = "CLI-SEX-CD";
          SType = "Text";
          Label = "Sex";
      }     
       

OUT MIR-CLMA-CLM-ID-T[50]
      {
    DisplayOnly;
    Length = "10";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Client ID";
    FieldGroup = "Table50";
    Index = "1";
  }
  
  OUT MIR-CLMA-CLM-STAT-CD-T[50]
       {
    DisplayOnly;
    Length = "10";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Client ID";
    FieldGroup = "Table50";
    Index = "1";
  }
  
  OUT MIR-CLMA-HO-NOTI-DT-T[50]
         {
      DisplayOnly;
      Length = "10";
      DBTableName = "TCLIU";
      SType = "Text";
      Label = "Company Notification Date ";
      FieldGroup = "Table50";
      Index = "1";
  }
  
    OUT MIR-CLMA-HO-ACPT-DT-T[50]
           {
        DisplayOnly;
        Length = "10";
        DBTableName = "TCLIU";
        SType = "Text";
        Label = "Company Notification Date ";
        FieldGroup = "Table50";
        Index = "1";
  }
}
