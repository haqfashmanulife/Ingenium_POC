# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9331-P.p                                                    *
#*  Description: Claim Payment                                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL109  HIN/CL   HIN/EC CLAIM PAYMENT                                      *
#*  CCL05   HIN/CL   HIN/EC PICK-UP FACILITY                                   *
#*  ISLCLM  CTS      ADDED NEW DROPDOWN FIELD FOR NUMBER OF DAYS TO CLAIM      *
#*  ISLCLM           PAYMENT DUE                                               *
#*  MP143H  CTS      ADDED NEW FIELDS 'TRAD PAID TO DATE','MODAL PREMIUM',     *
#*  MP143H           'BILLING MODE' AND 'TRAD UNPAID PREMIUM'                  *
#*                                                                             *
#*  M280P2  CTS      ARM III MEDICAL CLAIM CHANGES                             *
#*  MP300C  CTS      CHANGES TO ADD NEW FIELD PRE-LCD CHECK INDICATOR FOR ETC  *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*  UY3070  CTS      STREAM 3 CANCER LUMP SUM                                  *
#*  UY3023  CTS      STREAM 3 MEDICAL STREAM				       *
#*******************************************************************************

P-STEP BF9331-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9331";
        BusinessFunctionName = "Claim Payment Create";
        BusinessFunctionType = "Update";
        MirName = "CCWM9331";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TCLMA";
        DefaultSession = "MIR-CLM-ID";
        SType = "Text";
        Label = "Master Claim ID";
    }

    INOUT MIR-DV-INS-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
    INOUT MIR-CLMA-CLM-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLMA-CLM-STAT-CD";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim Status";
    }
    INOUT MIR-CLMA-INSRD-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Insured Client ID";
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
    INOUT MIR-CLMA-HO-ACPT-DT
    {
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Head Office Claim Form Acceptance Date";
    }
    INOUT MIR-LIFE-INS-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Life Insurance Claim In Progress";
    }
    INOUT MIR-CLMA-HIST-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Historical Claim:";
    }
#UYSDMC CHANGES STARTS HERE
    INOUT MIR-CLMA-USYS-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Unisys Claim:";
    }
#UYSDMC CHANGES ENDS HERE
    INOUT MIR-POL-ID-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";
        KeyColumn;
        DBTableName = "TFBNK";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
    INOUT MIR-PAYEE-NM-TXT-T[50]
    {
        Length = "50";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payee";
        Index = "1";
    }
    INOUT MIR-FINAL-APROV-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TFBNK";
        SType = "Date";
        Label = "Journal Date";
        Index = "1";
    }
    INOUT MIR-BNFT-PMT-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table1";
        DBTableName = "TFBNK";
        SType = "Currency";
        Label = "Payment Amount";
        Index = "1";
    }
    INOUT MIR-PREM-DED-AMT-T[50]
    {
        Signed;
        Length = "11";
        FieldGroup = "Table1";
        DBTableName = "TFBNK";
        SType = "Currency";
        Label = "Premium Deducted";
        Index = "1";
    }
    INOUT MIR-DLAY-INT-AMT-T[50]
    {
        Signed;
        Length = "11";
        FieldGroup = "Table1";
        DBTableName = "TFBNK";
        SType = "Currency";
        Label = "Interest Paid";
        Index = "1";
    }
    INOUT MIR-REMIT-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table1";
        DBTableName = "TFBNK";
        SType = "Currency";
        Label = "Adjusted Payment Amount";
        Index = "1";
    }   
#MP143H CHANGES START
#    INOUT MIR-POL-ID-3-T[100]
     INOUT MIR-POL-ID-3-T[50]
    {
        Length = "10";
        FieldGroup = "Table3";
        KeyColumn;
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
#UY3023 CHANGES STARTS HERE
    INOUT MIR-RIDER-CD-T[50]
    {
        FieldGroup = "Table3";
        Length = "3";
        DBTableName = "TETAB";
        SType = "Text";
        Label = "Rider Code";
        Index = "1";
    }  
#UY3023 CHANGES ENDS HERE

#   INOUT MIR-PLAN-ID-T[100]
    INOUT MIR-PLAN-ID-T[50]
    {
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Rider Name";
        Index = "1";
    }
#   INOUT MIR-BNFT-NM-ID-T[100]
    INOUT MIR-BNFT-NM-ID-T[50]
    {
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TBENS";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
    }
#   INOUT MIR-BNFT-DECSN-CD-T[100]
    INOUT MIR-BNFT-DECSN-CD-T[50]
    {
        Length = "2";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "CLBN-BNFT-DECSN-CD";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Decision";
        Index = "1";
    }
#   INOUT MIR-CLBN-ACRU-AMT-2-T[100]
    INOUT MIR-CLBN-ACRU-AMT-2-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table3";
        DBTableName = "TCLBN";
        SType = "Currency";
        Label = "Payment Amount";
        Index = "1";
    }
#   INOUT MIR-FINAL-APROV-DT-2-T[100]
    INOUT MIR-FINAL-APROV-DT-2-T[50]
    {
        Length = "10";
        FieldGroup = "Table3";
        DBTableName = "TFBNK";
        SType = "Date";
        Label = "Final Approval Date";
        Index = "1";
    }
#   INOUT MIR-CLRL-SEQ-NUM-2-T[100]
    INOUT MIR-CLRL-SEQ-NUM-2-T[50]
    {
        Length = "50";
        FieldGroup = "Table3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payee";
        Index = "1";
    }
#*MP143H CHANGES END
# M280P2 CHANGES STARTS HERE  
#   INOUT MIR-POL-ID-4-T[10]
    INOUT MIR-POL-ID-4-T[30]
# M280P2 CHANGES ENDS HERE     
    {
        Length = "10";
        FieldGroup = "Table4";
        KeyColumn;
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
# M280P2 CHANGES STARTS HERE     
#    INOUT MIR-INT-STRT-DT-2-T[10]
     INOUT MIR-INT-STRT-DT-2-T[30]
# M280P2 CHANGES ENDS HERE      
    {
        Length = "10";
        FieldGroup = "Table4";
        DBTableName = "TCLBN";
        SType = "Date";
        Label = "Interest Period Start Date";
        Index = "1";
    }
    
#ISLCLM CHANGES START 
# M280P2 CHANGES STARTS HERE
#    INOUT MIR-CLMA-DYS-BFR-PMT-DUE-2-T[10]
     INOUT MIR-CLMA-DYS-BFR-PMT-DUE-2-T[30]
# M280P2 CHANGES ENDS HERE     
    {
        Length = "03";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "DYS-BFR-PMT-DUE";
        DBTableName = "TCLBN";
        SType = "Selection";
        Label = "Days Before Claim Payment Due";
        Index = "1";
    }
    
#ISLCLM CHANGES END  
# M280P2 CHANGES STARTS HERE
#    INOUT MIR-POL-ID-5-T[10]
     INOUT MIR-POL-ID-5-T[30]
# M280P2 CHANGES ENDS HERE     
    {
        Length = "10";
        FieldGroup = "Table5";
        KeyColumn;
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
# M280P2 CHANGES STARTS HERE    
#    INOUT MIR-POL-UL-SHRT-AMT-T[10]
     INOUT MIR-POL-UL-SHRT-AMT-T[30]
# M280P2 CHANGES ENDS HERE     
    {
        Signed;
        Length = "15";
        FieldGroup = "Table5";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Shortage Amount";
        Index = "1";
    }
# M280P2 CHANGES STARTS HERE    
#    INOUT MIR-UL-LAPS-STRT-DT-T[10]
     INOUT MIR-UL-LAPS-STRT-DT-T[30]
# M280P2 CHANGES ENDS HERE     
    {
        Length = "10";
        FieldGroup = "Table5";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Lapse Start Date";
        Index = "1";
    }
# M280P2 CHANGES STARTS HERE     
#    INOUT MIR-LTST-PD-END-DT-T[10]
     INOUT MIR-LTST-PD-END-DT-T[30]
# M280P2 CHANGES ENDS HERE      
    {
        Length = "10";
        FieldGroup = "Table5";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Latest Paid Claim End Date";
        Index = "1";
    }
    
#MP143H CHANGES START
# M280P2 CHANGES STARTS HERE 
#    INOUT MIR-TRAD-PD-TO-DT-NUM-T[10]
     INOUT MIR-TRAD-PD-TO-DT-NUM-T[30]
# M280P2 CHANGES ENDS HERE     
    {
        Length = "10";
        FieldGroup = "Table5";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Trad Paid to Date";
        Index = "1";
    }
# M280P2 CHANGES STARTS HERE    
#    INOUT MIR-POL-MPREM-AMT-T[10]
     INOUT MIR-POL-MPREM-AMT-T[30]
# M280P2 CHANGES ENDS HERE     
    {
        Signed;
        Length = "15";
        FieldGroup = "Table5";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Modal Premium";
        Index = "1";
    }
# M280P2 CHANGES STARTS HERE    
#    INOUT MIR-POL-BILL-MODE-CD-T[10]
     INOUT MIR-POL-BILL-MODE-CD-T[30]
# M280P2 CHANGES ENDS HERE      
    {
        Length = "40";
        FieldGroup = "Table5";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billing Mode";
        Index = "1";
    }  
# M280P2 CHANGES STARTS HERE    
#    INOUT MIR-TRAD-UNPD-PREM-AMT-T[10]
     INOUT MIR-TRAD-UNPD-PREM-AMT-T[30]
# M280P2 CHANGES ENDS HERE     
    {
        Signed;
        Length = "15";
        FieldGroup = "Table5";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Trad Unpaid Premium";
        Index = "1";
    }    
    
#*MP143H CHANGES END
    INOUT MIR-PREM-DED-AMT-3-T[50]
    {
        Signed;
        Length = "11";
        FieldGroup = "Table5";
        DBTableName = "TFBNK";
        SType = "Currency";
        Label = "Premium Amount to Deduct";
        Index = "1";
    }
# M280P2 CHANGES STARTS HERE    
#    INOUT MIR-CLRL-SEQ-NUM-3-T[10]
     INOUT MIR-CLRL-SEQ-NUM-3-T[30]
# M280P2 CHANGES ENDS HERE          
    {
        Length = "50";
        FieldGroup = "Table5";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payee";
        Index = "1";
    }
    IN MIR-BNFT-DECSN-CD-2-T[100]
    {
        Length = "2";
        FieldGroup = "Table6";
        KeyColumn;
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Decision Code Itself";
        Index = "1";
    }
# MP300C CHANGES STARTS HERE    
     INOUT MIR-PRE-LCD-CHK-IND-T[30]
    {
        Length = "01";
        FieldGroup = "Table8";
        CodeSource = "DataModel";
        CodeType = "PRE-LCD-CHK-IND";
        DBTableName = "TCLBN";
        SType = "Selection";
        Label = "Pre-LCD Check";
        Index = "1";
    }
# MP300C CHANGES ENDS HERE    
#*UY3070 CHANGES STARTS
     INOUT MIR-CSH-LOAN-BAL
    { 
        Length = "15";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Policy loan Balance";
    } 
    
     INOUT MIR-OVR-SHRT-PREM-AMT
    {
	Length = "15";
        SType = "Currency";
	Label = "excess or shortage of interest";
    } 
    	
     INOUT MIR-UNEARN-LOAN-INT-AMT
    {
    	Signed;
    	Length = "15";
    	SType = "Currency";
	Label = "Unearned Interest";
    }
    
    INOUT MIR-OUT-INT-AMT	
    {
	Signed;
	Length = "15";
	SType = "Currency";
	Label = "Outstanding Interest";
    }
            
     INOUT MIR-APL-BAL-AMT
    { 
        Length = "20";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "APL Balance";
    }        
    
     INOUT MIR-DV-APL-INT-AMT
    { 
        Length = "20";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "APL Interest";
    }    
#* UY3070 CHANGES ENDS 
}
