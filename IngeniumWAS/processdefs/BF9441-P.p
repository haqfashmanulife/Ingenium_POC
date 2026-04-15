# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9441-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01PR10  CSS      New for MCL                                               *
#*  P00891  YC       Add Journal Date with no limitation   06JUN2003           *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *    
#*******************************************************************************
 
P-STEP BF9441-P
{
 
 ATTRIBUTES
 {
  BusinessFunctionId = "9441";
  BusinessFunctionName = "Post Lapse Surrender Reversal";
  BusinessFunctionType = "RPlaps";
  MirName = "CCWM9441";
 }

 
 OUT LSIR-RETURN-CD;
    
 OUT MIR-RETRN-CD;

 INOUT MIR-APPL-CTL-PRCES-DT
 {
     Key;
     Length = "10";
     DBTableName = "TMAST";
     DefaultSession = "LSIR-PRCES-DT";
     SType = "Date";
     Label = "Process Date";
 }

 IN MIR-POL-ID-BASE
 {
     Key;
     Mandatory;
     Length = "9";
     DBTableName = "TPOL";
     DefaultSession = "MIR-POL-ID-BASE";
     SType = "Text";
     Label = "Policy Id";
 }

 IN MIR-POL-ID-SFX
 {
     Key;
     Length = "1";
     DBTableName = "TPOL";
     DefaultSession = "MIR-POL-ID-SFX";
     SType = "Text";
     Label = "Suffix";
 }

#  P00891 YC      06JUN2003  Add 8 lines for Adding Journal Date
    INOUT MIR-JRNL-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }

#   ISLADM - Changes start here     
    OUT MIR-SURR-FORM-ACPT-DT
    { 
        Length = "10";
        DBTableName = "TPOL";        
        SType = "Date";
        Label = "Surrender Request Form Acceptance Date";
    }
    
    OUT MIR-ASIGN-SURR-EFF-DT
    { 
        Length = "10";
        DBTableName = "TPOL";                
        SType = "Date";
        Label = "Assigned Surrender Effective Date for Policy with Assignee";
    }
    
    OUT MIR-POL-STEP-IN-RIGHT-IND
    { 
        Length = "1";
        DBTableName = "TPOL";                
        SType = "Indicator";
        Label = "Policy with Step-In Right";
    }    
#   ISLADM - Changes end here
}
