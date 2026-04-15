# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9272-P.p                                                    *
#*  Description: Adjudicator Decision Summary                                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL106  HIN/CL   Initial Version                                           *
#*  P034    CSE022   The value of existing code source and code type is        *
#*                   commented to refer to the new filter selection program    *
#*                   CSOM9997(as part of EN000292)                             *
#*  BU1316  CTS      Claim Status Code has been added                          *
#*  MP302M  CTS      Addition of new field for Survival Benefit Chargeback Amt *
#*  CS0008  CTS      CSA IMPROVEMENTS-MEDICAL CLAIM CHANGES                    *
#*  UY3070  CTS      STREAM 3 CANCER LUMPSUM CHANGES                           *
#*  UY323A  CTS      MEDICAL CLAIM PAYMENT                                     *
#*******************************************************************************

P-STEP BF9272-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9272";
        BusinessFunctionName = "Adjudicator Decision Summary";
        BusinessFunctionType = "List";
        MirName = "CCWM9272";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-FCN-UPDT-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Function Code";
    }
    INOUT MIR-CLM-ID
    {
        Length = "8";
        DefaultSession = "MIR-CLM-ID";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Claim ID";
    }
    INOUT MIR-POL-ID
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }
    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
    }
    INOUT MIR-BNFT-NM-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Benefit Name";
    }
    INOUT MIR-POL-ID-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
    INOUT MIR-CVG-NUM-T[100]
    {
        Length = "2";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }    
    
#UY3070 CHANGES STARTS HERE    
   INOUT MIR-PLAN-CD-T[100]
    {
        Length = "3";
        FieldGroup = "Table1";
        DBTableName = "TETAB";
        SType = "Text";
        Label = "Plan Code";
        Index = "1";
    }
#UY3070 CHANGES ENDS HERE
    INOUT MIR-BNFT-NM-ID-T[100]
    {
        KeyColumn;
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
    }
#** P034 Change: Commented the value of existing Code Source and code type to
#** refer to the filter selection program CSOM9997 
    INOUT MIR-BNFT-DECSN-CD-T[100]
    {
        Length = "2";
        FieldGroup = "Table1";
#*      CodeSource = "DataModel";
#*      CodeType = "CLBN-BNFT-DECSN-CD";
        DBTableName = "TCLBN";
        SType = "Selection";
        Label = "Decision";
        Index = "1";
    }
    INOUT MIR-BNFT-DECSN-REASN-CD-T[100]
    {
        Length = "2";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "BNFT-DECSN-REASN-CD";
        DBTableName = "TCLBN";
        SType = "Selection";
        Label = "Decline Reason";
        Index = "1";
    }
#*MP302M CHANGES STARTS
    INOUT MIR-SRVBEN-CHRGBCK-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
#*UY323A CHANGES STARTS
#        Label = "Survival Benefit Chargeback Amount";
        Label = "Benefit Chargeback Amount";
#*UY323A CHANGES ENDS
    }
#*MP302M CHANGES ENDS
    INOUT MIR-CLM-REQIR-ID-T[100]
    {
        Length = "5";
    FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "CMRTC";
        DBTableName = "TCRTB";
        SType = "Text";
        Label = "Requirement";
        Index = "1";
    }
    INOUT MIR-CLM-REQIR-OPT-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CLM-REQIR-OPT-CD";
        DBTableName = "TCRQT";
        SType = "Text";
        Label = "Requirement Level";
        Index = "1";
    }
    INOUT MIR-CRQT-SEQ-NUM-T[100]
    {
        Length = "3";
        FieldGroup = "Table2";
        DBTableName = "TCRQT";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }
    INOUT MIR-CRQT-STAT-CD-T[100]
    {
        Length = "3";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CRQT-STAT-CD";
        DBTableName = "TCRQT";
        SType = "Selection";
        Label = "Requirement Status";
        Index = "1";
     }
     INOUT MIR-CRQT-ORDR-DT-T[100]
     {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TCRQT";
        SType = "Date";
        Label = "Ordered Date";
        Index = "1";
     }
     INOUT MIR-CRQT-RECV-DT-T[100]
     {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TCRQT";
        SType = "Date";
        Label = "Received Date";
        Index = "1";
     }
#** BU1316 Change: Claim Status code has been added
     INOUT MIR-CLMA-CLM-STAT-CD
     {
        Length = "40";
    CodeSource = "DataModel";
    CodeType = "CLMA-CLM-STAT-CD";
    DBTableName = "TCLMA";
    SType = "Text";
        Label = "Master Claim Status";
     }
#*CS0008 CHANGES START HERE
    IN MIR-DTL-STRT-DT-T[100] 
    {
        Length = "10";
        FieldGroup = "Table2";
        Index = "1";
        SType = "Date";
        Label = "Start Date";
    }

    IN MIR-DTL-END-DT-T[100] 
    {
        Length = "10";
        FieldGroup = "Table2";
        Index = "1";
        SType = "Date";
        Label = "End Date";
    }

    IN MIR-DTL-SEQ-NUM-T[100] 
    {
        Length = "4";
                Decimals = "0";
        FieldGroup = "Table2";
        Index = "1";
        SType = "Number";
        Label = "Hosp No.";
    }
    IN MIR-DTL-EXCL-QTY-T[100] 
    {
        Length = "6";
                Decimals = "0";
        FieldGroup = "Table2";
        Index = "1";
        SType = "Number";
        Label = "Excluded Units";
    }
    IN MIR-DTL-SURG-CD-T[100] 
    {
        Length = "10";
        FieldGroup = "Table2";
        Index = "1";
        SType = "Text";
        Label = "Surgery Code";
    }
       INOUT MIR-NON-PMT-REASN-TXT-T[100] 
       {
        Length = "08";  
        CodeSource = "DataModel";
        FieldGroup = "Table2";
        CodeType = "NON-PMT-REASN-TXT";
        DBTableName = "TCLBD";
        SType = "selection";
        Label = "Non-payment reason code";
        Index = "1";
        }
        INOUT MIR-NON-PMT-SURGY-NM-T[100]
        {
        Length = "200";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Surgery Name";
        Index = "1";
        }    
#*CS0008 CHANGES END HERE

#UY323A CHANGES STARTS HERE
    INOUT MIR-HLTBEN-CHRGBCK-AMT
        {
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Health Congratulatory Benefit Chargeback Amount";
        }  
    
#UY323A CHANGES ENDS HERE	
}
