# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:58 PM EDT

#*******************************************************************************
#*  Component:   BF9182-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02PR55  DPK      New Screen                                                *
#*  PR006I  BMB      Changes for ManuMed rider renewals                        *
#*  M00037  CLB      Add new face amount field to screen                       *
#*  RP2010  CTS      Add SubTable 4 value to the screen                        *
#*  RPL010  CTS      Add SubTable 3 value to the screen                        *
#*  M142U1  CTS      ADD TOTAL CSV VALUE TO THE SCREEN                         *
#*  Q16140  CTS      M142U2-CHANGES                                            *
#*  M213L1  CTS      CHANGES FOR RUM                                           *
#*******************************************************************************

P-STEP BF9182-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9182";
        BusinessFunctionName = "Rider Renewal Switch Details";
        BusinessFunctionType = "Update";
        MirName = "CCWM9182";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

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

    INOUT MIR-EFF-DT
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    INOUT MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sundry Amount";
    }

    INOUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Mode";
    }

#*  PR006I  start position for more...      *

    INOUT MIR-SCR-SUB
    {
        Length = "3";
        SType = "Numeric";
        Label = "CVG Start";
    }

    INOUT MIR-CVG-NUM-T[109]
    {
        Length = "2";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    INOUT MIR-INSRD-CLI-ID-T[109]
    {
        Length = "10";
        FieldGroup = "Table109";
        DBTableName = "TCVGC";
        Index = "1";
        SType = "Text";
        Label = "Insured Client Id";
    }

    INOUT MIR-PLAN-ID-T[109]
    {
        Length = "40";
        FieldGroup = "Table109";
#        CodeSource = "EDIT";
#        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Rider Name";
        Index = "1";
    }

    INOUT MIR-CVG-STBL-1-CD-T[109]
    {
        Length = "40";
        FieldGroup = "Table109";
        CodeSource = "EDIT";
        CodeType = "STB1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Duration";
        Index = "1";
    }

    INOUT MIR-DV-INSRD-CLI-NM-T[109]
    {
        Length = "75";
        FieldGroup = "Table109";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }

    INOUT MIR-CVG-FACE-AMT-T[109]
    {
        Length = "15";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Current Face Amount";
        Index = "1";
    }

    INOUT MIR-DV-CVG-FACE-AMT-T[109]
    {
        Length = "15";
        FieldGroup = "Table109";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "New Face Amount";
        Index = "1";
    }

    INOUT MIR-CVG-MPREM-AMT-T[109]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Current Modal Premium";
        Index = "1";
    }

    INOUT MIR-DV-CVG-RENEW-CD-T[109]
    {
        Length = "01";
        FieldGroup = "Table109";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Rider Renewal Code";
        Index = "1";
    }

#*  PR006I  changes for ManuMed rider renewals    *

    INOUT MIR-CVG-STBL-2-CD-T[109]
    {
        Length = "40";
        FieldGroup = "Table109";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Benefit Limit";
        Index = "1";
    }

    INOUT MIR-CVG-PREM-CHNG-DT-T[109]
    {
        Length = "10";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Next Renewal Date";
        Index = "1";
    }

    INOUT MIR-DV-CHNG-STATUS-T[109]
    {
        Length = "06";
        FieldGroup = "Table109";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Stat";
        Index = "1";
    }
#* Add a new field sub table 3*
    INOUT MIR-CVG-STBL-3-CD-T[109]
    {
        Length = "5";
        FieldGroup = "Table109";
        CodeSource = "EDIT";
        CodeType = "STB3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub Table 3";
        Index = "1";
    }
#*End of the field sub table 3*

    INOUT MIR-CVG-STBL-4-CD-T[109]
    {
        Length = "40";
        FieldGroup = "Table109";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub Table 4";
        Index = "1";
    }
#M213L1 CHANGES STARTS HERE 

    INOUT MIR-CVG-PRIM-GR-ID-T[109]
    {
        Length = "2";
        FieldGroup = "Table109";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Group ID";
        Index = "1";
    }
    
#M213L1 CHANGES ENDS HERE       

    OUT MIR-DISP-CVG-NUM-T[60]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table60";
        Index = "1";
        SType = "Text";
        Label = "Coverage Number";
    }

    OUT MIR-DISP-PLAN-ID-T[60]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table60";
        Index = "1";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Rider Name";
    }

    OUT MIR-DISP-CVG-STBL-1-CD-T[60]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table60";
        Index = "1";
        CodeSource = "EDIT";
        CodeType = "STB1";
        SType = "Text";
        Label = "Duration";
    }

    OUT MIR-DISP-DV-INSRD-CLI-NM-T[60]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table60";
        Index = "1";
        SType = "Text";
        Label = "Insured's Name";
    }

    OUT MIR-DISP-CVG-FACE-AMT-T[60]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table60";
        Index = "1";
        SType = "Currency";
        Label = "Face Amount";
    }

    OUT MIR-DISP-CVG-MPREM-AMT-T[60]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table60";
        Index = "1";
        SType = "Currency";
        Label = "Modal Premium";
    }

    OUT MIR-DISP-DV-CVG-RENEW-CD-T[60]
    {
        DisplayOnly;
        Length = "01";
        FieldGroup = "Table60";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Rider Renewal Code";
        Index = "1";
    }

    OUT MIR-DISP-CVG-STBL-2-CD-T[60]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table60";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Benefit Limit";
        Index = "1";
    }

    OUT MIR-DISP-CVG-PREM-CHNG-DT-T[60]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table60";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Next Renewal Date";
        Index = "1";
    }

    OUT MIR-DISP-DV-CHNG-STATUS-T[60]
    {
        DisplayOnly;
        Length = "06";
        FieldGroup = "Table60";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Stat";
        Index = "1";
    }

#*Add a new field SUB TABLE 3*
    OUT MIR-DISP-CVG-STBL-3-CD-T[60]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table60";
        CodeSource = "EDIT";
        CodeType = "STB3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub Table 3";
        Index = "1";
    }
#*End of the field SUB TABLE 3*

    OUT MIR-DISP-CVG-STBL-4-CD-T[60]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table60";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub Table 4";
        Index = "1";
    }
#*M142U1 CHANGES STARTS HERE*   
    OUT  MIR-DISP-CSV-RFND-AMT
    {									
       DisplayOnly;    							
       Signed;								
       Length = "16";
       SType = "Currency";						
       Label = "Total CSV";
    }
#*M142U1 CHANGES ENDS HERE*       
#Q16140 CHANGES STARTS    
    OUT MIR-FTRQ-REC-IND
    {
        SType = "Hidden";
    }
#Q16140 CHANGES END
}

