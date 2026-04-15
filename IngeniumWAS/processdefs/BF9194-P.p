# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:58 PM EDT

#*******************************************************************************
#*  Component:   BF9194-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  1CNB02  DEL      New for conversion policies                               *
#*  B01160  AT       FINE TUNE BusinessFunctionName                            *
#*  B01104  AT       Conversion status - display description                   *
#*******************************************************************************
 
P-STEP BF9194-P
{
  
  ATTRIBUTES
  {
    BusinessFunctionId = "9194";
    BusinessFunctionName = "Pre-Conversion Policy Data List";
    BusinessFunctionType = "List";
    MirName = "CCWM9194";
  }
  

  
  OUT LSIR-RETURN-CD;
   
  OUT MIR-RETRN-CD;

  INOUT MIR-POL-ID-BASE
  {
    Key;
    Mandatory;
    Length = "9";
    DBTableName = "TPOL";
    DefaultSession = "MIR-POL-ID-BASE";
    SType = "Text";
    Label = "Policy Id";
  }

  INOUT MIR-POL-ID-SFX
  {
    Key;
    Length = "1";
    DBTableName = "TPOL";
    DefaultSession = "MIR-POL-ID-SFX";
    SType = "Text";
    Label = "Suffix";
  }
  
    OUT MIR-PLAN-ID
    {
        Length = "40";
        DisplayOnly;
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Product Name";
    }

  OUT MIR-OWN-CLI-NM
  {
    Length = "50";
    DisplayOnly;
    SType = "Text";
    Label = "Policy Owner";
  }
 
    OUT MIR-POL-ISS-EFF-DT
  {
    Length = "10";                         
    DBTableName = "TPOLX";
    SType = "Date";
    Label = "Policy Issue Effective Date";
  }
   OUT MIR-POL-FINAL-DISP-DT
  {
    Length = "10";                         
    DBTableName = "TPOLX";
    SType = "Date";
    Label = "Final Disposition Date";
  }

    OUT MIR-POL-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Policy Status";
    }

 OUT MIR-POL-CNVR-KEY-NUM
  {
    Length = "10";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Conversion Number";
  }
  
   

  OUT MIR-ORIG-POL-ID-T[05]
  {
    Length = "10";
    FieldGroup = "Table05";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Orig Pol ID";
  }


  OUT MIR-SEQ-NUM-T[05]
  {
    Length = "02";
    FieldGroup = "Table05";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Sequence Number";
  }


  OUT MIR-ORIG-SML-PROD-CD-T[05]
  {
    Length = "3";
    FieldGroup = "Table05";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Small Product Code";
  }




  OUT MIR-ORIG-POL-ISS-DT-T[05]
  {
    Length = "2";
    FieldGroup = "Table05";
    DBTableName = "TPOLX";
    SType = "Date";
    Label = "Polciy Issue Date";
  }
  
  OUT MIR-ORIG-POL-MAT-DT-T[05]
  {
    Length = "2";
    FieldGroup = "Table05";
    DBTableName = "TPOLX";
    SType = "Date";
    Label = "Policy Maturity Date";
  }
  

  OUT MIR-DV-OWN-CLI-KANA-NM-T[05]
  {
        Length = "75";
        FieldGroup = "Table05";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
  OUT MIR-CSTAT-CD-T[05]
  {
        Length = "20";
        CodeSource = "DataModel";
        CodeType = "CSTAT-CD";
        DBTableName = "TPOLX";
        FieldGroup = "Table05";
        SType = "Text";
        Label = "Complete Status";
    }
  



}
