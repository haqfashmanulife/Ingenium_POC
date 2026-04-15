# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8024-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016051  6.02J    Add MIR-CVG-JNT-LIFE-CD-T                                 *
#*                   Add MIR-CVG-LIVES-INSRD-CD-T                              *
#*                   Add MIR-PLAN-PKG-TYP-CD                                   *
#*                   Add MIR-DV-INSRD-CLI-NM-2-T                               *
#*                   Add MIR-INSRD-CLI-ID-2-T                                  *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  02PR62  DPK      Joint to Single Change                                    *
#*  PR006C  FB       Add MIR-CVG-STBL-2-CD-T[20] - benefit days select box     *
#*  PR006I  BMB      Change labels for connected coverages                     *
#*  MFPL1B  H.L      ADD MIR-CVG-ILLUS-CD-T[20]                                *
#*  MFFAN8  MC       ADD EXPECTED ANNUITY AGE                                  *
#*  MP143B  CTS      CHANGES TO ADD STBL-3 AND STBL-4                          *
#*  M213F1  CTS      CHANGES TO ADD NEW GROUP ID FIELD FOR RUM                 *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M271O1  CTS      CHANGES DONE AS PART OF FRA                               * 
#*******************************************************************************

P-STEP BF8024-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8024";
        BusinessFunctionName = "Multi-Coverage Retrieval";
        BusinessFunctionType = "List";
        MirName = "CCWM8024";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-ADDL-PLAN-MAND-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "ADDL-PLAN-MAND-IND";
        DBTableName = "TPACK";
        SType = "Text";
        Label = "Plan Type";
        Index = "1";
    }

    OUT MIR-CVG-AD-FACE-AMT-T[20]
    {
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "AD Face Amount";
        Index = "1";
    }

    OUT MIR-CVG-FACE-AMT-T[20]
    {
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-CVG-RT-AGE-T[20]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Age";
        Index = "1";
    }

    OUT MIR-CVG-SEX-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    OUT MIR-CVG-SMKR-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "SMOKE";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Smoker";
        Index = "1";
    }

    OUT MIR-CVG-WP-IND-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "WP Ind";
        Index = "1";
    }

    OUT MIR-DV-INSRD-CLI-NM-T[20]
    {
        Length = "75";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }

    OUT MIR-INSRD-CLI-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Insured's Client Number";
        Index = "1";
    }

    OUT MIR-DV-INSRD-CLI-NM-2-T[20]
    {
        Length = "75";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }

    OUT MIR-INSRD-CLI-ID-2-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Insured's Client Number";
        Index = "1";
    }

    OUT MIR-PLAN-ID-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Plan ID";
        Index = "1";
    }

    OUT MIR-DV-PLAN-DESC-TXT-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Plan Description";
        Index = "1";
    }

    OUT MIR-PLAN-PKG-ADB-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "PLAN-PKG-ADB-CD";
        DBTableName = "TPACK";
        SType = "Text";
        Label = "Embedded ADB";
        Index = "1";
    }

    OUT MIR-PLAN-PKG-WP-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "PLAN-PKG-WP-CD";
        DBTableName = "TPACK";
        SType = "Text";
        Label = "Embedded WP";
        Index = "1";
    }

    OUT MIR-PLAN-PKG-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PLAN-PKG-TYP-CD";
        DBTableName = "TPACK";
        SType = "Text";
        Label = "List Type";
    }

    OUT MIR-DV-CVG-PLAN-JNT-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Joint Plan Indicator";
        Index = "1";
    }

    OUT MIR-CVG-JNT-LIFE-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-JNT-LIFE-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Joint Life Type";
        Index = "1";
    }

    OUT MIR-CVG-LIVES-INSRD-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Number of Lives Insured";
        Index = "1";
    }

    OUT MIR-CVG-STBL-1-CD-T[20]
    {
        Length = "2";
        FieldGroup = "TABLE20";
#* M241A3 changes START here*
        CodeSource = "CSOM9D27";        
	FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID-T";
#       CodeSource = "EDIT";
#       CodeType = "STB1";
#* M241A3 changes END here*
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Sub-table 1";
        Index = "1";
    } 
     
    OUT MIR-CVG-STBL-2-CD-T[20]
    {
        Length = "3";
        FieldGroup = "TABLE20";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Sub-table 2";
        Index = "1";
    } 

#*  MP143B CHANGES START HERE *
    OUT MIR-CVG-STBL-3-CD-T[20]
    {
        Length = "3";
        FieldGroup = "TABLE20";
#* M241A3 changes START here*
        CodeSource = "CSOM9D28";        
        FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID-T"; 
#       CodeSource = "EDIT";
#       CodeType = "STB3";
#* M241A3 changes END here*
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Sub-table 3";
        Index = "1";
    } 
    OUT MIR-CVG-STBL-4-CD-T[20]
    {
        Length = "3";
        FieldGroup = "TABLE20";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Sub-table 4";
        Index = "1";
    } 
#*  MP143B CHANGES END HERE *
     
    OUT MIR-CONN-CVG-NUM-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Connected Coverage Number";
        Index = "1";
    }

    OUT MIR-CONN-POL-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Connected Policy Number";
        Index = "1";
    }

    OUT MIR-CVG-CONN-REASN-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CONN-REASN-CD";
        SType = "Selection";
        Label = "Connected Policy/Coverage Reason";
        Index = "1";
    }

    OUT MIR-CVG-ILLUS-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "ILLUS";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Coverage Illustration Type";
        Index = "1";
    }

#*  MFFAN8 START  *
    OUT MIR-CVG-XPCT-ANTY-AGE-T[20]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Expected Annuity Age";
        Index = "1";
    }
#*  MFFAN8 END *

#* M213F1 START *     
    OUT MIR-CVG-PRIM-GR-ID-T[20]
    {
       Length = "2";
       FieldGroup = "Table20";
       CodeSource = "DataModel";
       CodeType = "CVG-PRIM-GR-ID";
       DBTableName = "TCVG";
       SType = "Selection";
       Label = "Group ID";
       Index = "1";
    }
#* M213F1 END * 
#M245B2 CHANGES START HERE 
    INOUT MIR-POL-CRCY-CD
       {
            Length = "2";
            SType = "Hidden";
            Label = "Currency";
   }
#M245B2 CHANGES END HERE    
#M271O1 CHANGES START HERE   
    INOUT MIR-PREM-CRCY-CD
    {
                      
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }
#M271O1 CHANGES END HERE 
}

