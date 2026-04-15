# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9332-P.p                                                    *
#*  Description: Claim Final Approval                                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL109  HIN/CL   CLAIM PAYMENT                                             *
#*  M159C2  04AUG11  ADD PRCES-STATE-CD TO ALLOW EDIT ONLY PROCESSING          *
#*  CSCR03  CTS      CHANGES FOR NOMURA FOREIGN HOLIDAY REMITTANCE DATE        *
#*  105762  CTS      CHANGES FOR NOMURA FOREIGN HOLIDAY REMITTANCE DATE        *
#*******************************************************************************

P-STEP BF9332-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9332";
        BusinessFunctionName = "Claim Final Approval";
        BusinessFunctionType = "Create";
        MirName = "CCWM9332";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLM-ID
    {
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim ID";
    }
# M159C2 Changes Start Here 

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }
# M159C2 Changes End Here 
# CSCR03 CHANGES START HERE
     OUT MIR-REMIT-DT-T[30]
     { 
         Length = "10";
# 105762 CHANGES STARTS         
         FieldGroup = "Table1";
# 105762 CHANGES ENDS         
         DBTableName = "TFBNK";
         SType = "Date";
         Label = "Remittance Date";
# 105762 CHANGES STARTS         
         Index = "1";    
# 105762 CHANGES ENDS         
     
     }
# CSCR03 CHANGES END HERE     
}
