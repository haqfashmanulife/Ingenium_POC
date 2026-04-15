

#*******************************************************************************
#*  Component:   BF9B78-P.p                                                    *
#*  Description: Rider Surrender/Rider FA Reduction List                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS043  CTS      INITIAL VERSION                                           *
#*  S25393  CTS      FIX FOR FA RED QUOTE SCREEN                               *
#*  S25428  CTS      FIX FOR FA RED VIRTUAL QUOTE                             **
#*  S25334  CTS      FIX FOR FA RED QUOTE SCREEN                               *
#*  S25437  CTS      FIX FOR FA RED VIRTUAL QUOTE                             **
#*  S25535  CTS      FIX FOR UDSD-5535                                        **
#*******************************************************************************

P-STEP BF9B78-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9B78";
        BusinessFunctionName = "Rider Surrender/Rider FA Reduction List";
        BusinessFunctionType = "List";
        MirName = "CCWM9B78";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN  MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN  MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN  MIR-APPL-CTL-PRCES-DT
    {
        Key;
        Length = "10";
        DBTableName = "TMAST";
        SType = "Date";
        Label = "Date Of Change";
    }
    
    INOUT MIR-VIR-TRAD-PD-TO-MO-NUM
    {
    
        Label = "Next Payment Date:";
        Length = "07";
        SType = "text";
    }  
    
    INOUT MIR-VIR-CI-FRST-ELAPS-YRS-DUR
    {
 
        Label = "Elapsed years:";
        Length = "07";
        SType = "text";
    } 
    
     INOUT MIR-VIR-ACTV-IND
     {
         Length = "1";
         SType = "Indicator";
         Label = "Active";
     }
     
     INOUT MIR-VIR-BILL-MODE-CD
     {
         Length = "40";
         CodeSource = "DataModel";
         CodeType = "MIR-BILL-MODE-CD";
         SType = "Selection";
         Label = "Payment frequency";
     } 
       
     
     INOUT MIR-VIR-LOAN-AMT
     {   
         Signed;
         Length = "13";
         DBTableName = "Derived";
         SType = "Currency";
         Label = "Policy loan balance:";
     }  
     
     INOUT MIR-VIR-INT-STR-DT
     {
 
         Length = "10";
         SType = "Date";
         Label = "Interest start date";
     }  
     
     INOUT MIR-VIR-APL-LOAN-AMT
     {   
         Signed;
         Length = "13";
         DBTableName = "Derived";
         SType = "Currency";
         Label = "APL balance:";
     }     
     
     INOUT MIR-VIR-POL-LOAN-EFF-DT
     {
 
         Length = "10";
         SType = "Date";
         Label = "APL date";
     }    
     
     INOUT MIR-VIR-PREPAY-MNG-IND
     {
         Length = "1";
         SType = "Indicator";
         Label = "Prepayment management";
     }
     
     OUT MIR-VIR-SEI-ASS-IND
     {
         Length = "1";
         SType = "Indicator";
         Label = "Seizure assignment";
     }    
     
     OUT MIR-VIR-CVG-NUM-T[99] 
     {
        
         FieldGroup = "Table99";
         DBTableName = "TCVG";
         Index = "1";
         KeyColumn;
         Label = "Coverage No";
         Length = "2";
         SType = "Text";
     }
 
     OUT MIR-VIR-PLAN-ID-T[99] 
     {
         CodeSource = "EDIT";
         CodeType = "PLAN";
         DBTableName = "TCVG";
         
         FieldGroup = "Table99";
         Index = "1";
         Label = "Plan";
         Length = "40";
         SType = "Text";
     }
 
     OUT MIR-VIR-CVG-FACE-AMT-T[99] 
     {   
         FieldGroup = "Table99";
         DBTableName = "TCVG";
         Index = "1";
         Label = "Face Amount";
         Length = "16";
         SType = "Currency";
         Signed;
    } 
    INOUT  MIR-CVG-CSV-AMT-T[99]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table99";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "New CSV";
        Index = "1";
    }
#S25393 CHANGES START    
#    OUT  MIR-CVG-CSV1-AMT-T[99]
    INOUT  MIR-CVG-CSV1-AMT-T[99]
#S25393 CHANGES END    
    {
        Signed;
        Length = "16";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "CSV";
        Index = "1";
    }

    INOUT MIR-APL-BAL-AMT
      {
          Signed;
          Length = "17";
          DBTableName = "TLHST";
          SType = "Currency";
          Label = "APL Balance";
      }
    INOUT MIR-DV-APL-LOAN-INT-AMT
      {
          Signed;
          Length = "17";
          DBTableName = "TLHST";
          SType = "Currency";
          Label = "APL Interest";
      }
    INOUT MIR-CSL-BAL-AMT
      {
          Signed;
          Length = "17";
          DBTableName = "TLHST";
          SType = "Currency";
          Label = "Policy Loan Balance ";
      }
    INOUT MIR-DV-LOAN-INT-AMT
      {
          Signed;
          Length = "17";
          DBTableName = "TLHST";
          SType = "Currency";
          Label = "Policy Loan Interest";
      }

    INOUT MIR-DV-NET-PAY-AMT
      {
          Signed;
          Length = "17";
          SType = "Currency";
          Label = "Net Payment Amount";
      }

    INOUT  MIR-TOT-CSV-AMT
    {
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Total CSV";
    }
    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }
#S25334 CHANGES START    
    INOUT  MIR-CVG-MPREM1-AMT-T[10]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Current Premium";
        Index = "1";
    }

    INOUT  MIR-CVG-MPREM2-AMT-T[10]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "New Premium";
        Index = "1";
    }
#S25334 CHANGES END   
#S25428 CHANGES START HERE
    INOUT MIR-CVG-CSTAT-CD-T[99]
    {
        Length = "40";
        FieldGroup = "Table99";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }
#S25428 CHANGES END HERE
#S25437 CHANGES START HERE
    INOUT MIR-VIR-SCREEN-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Check in case ofimplementing virtual quote";
    }
#S25437 CHANGES END HERE
#S25535 CHANGES START HERE
  INOUT  MIR-DV-EFF-DT
  {
    Length = "10";
    DBTableName = "Derived";
    SType = "Date";
    Label = "Effective Date";
  }
#S25535 CHANGES END HERE

}