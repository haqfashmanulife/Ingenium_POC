# Converted from PathFinder 2.0 to 2.2 on Jan 15, 2004 11:03:33 AM EST

#*******************************************************************************
#*  Component:   AppBF8025-P.p                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  02pr62  dpk      Joint to Single Change                                    *
#*  PR006C  FB       Add MIR-CVG-STBL-2-CD-T[20] - benefit days select box     *
#*  MFPL1B  H.L      ADD MIR-CVG-ILLUS-CD-T[20]                                *
#*  MFFAN8  MC       ADD EXPECTED ANNUITY AGE                                  *
#*  MP143B  CTS      CHANGES TO ADD STBL-3 AND STBL-4 DROPDOWNS                *
#*  M213F1  CTS      CHANGES TO ADD NEW GROUP ID FIELD FOR RUM                 *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M271O1  CTS      CHANGES DONE AS PART OF FRA                               *
#*******************************************************************************

P-STEP AppBF8025-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8025";
        BusinessFunctionName = "Multi-Coverage Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM8025";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    # Face amount fields (Life and AD) are being set to a value
    # of IN only to prevent the server from returning original
    # values.  This process driver uses sub-functions to call
    # modules used by other process drivers.  These modules
    # re-set the Face Amount fields back to their originating
    # values (which in the case of an application entry process
    # would be 0.00), to retain the values prior to the user's
    # attempt to change them.  On an application entry basis,
    # we want to preserve the entry made by the user, and hence
    # are only sending the value IN to the server.  A value of
    # INOUT would return 0.00 to the flow, and hence to the
    # page.
    # all other fields on this p-step, have been modified to INOUT
    # this has been done to preserve the values for custom
    # javascript to work correctly.  should the server fail for
    # any reason, only those variables marked as IN would be returned
    # back to the flow (since only those marked as IN would be sent
    # to the server in the first place).

    IN MIR-CVG-AD-FACE-AMT-T[20]
    {
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "AD Face Amount";
        Index = "1";
    }

    INOUT MIR-ADDL-PLAN-MAND-IND-T[20]
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

    INOUT MIR-DV-PLAN-DESC-TXT-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Plan Description";
        Index = "1";
    }

#* M213F1 START *     
    INOUT MIR-CVG-PRIM-GR-ID-T[20]
    {
       Length = "2";
       FieldGroup = "Table20";
       SType = "Text";
       Label = "Group ID";
       Index = "1";
    }
#* M213F1 END * 

    IN MIR-CVG-FACE-AMT-T[20]
    {
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

#*  MFFAN8 START *
     
    INOUT MIR-CVG-XPCT-ANTY-AGE-T[20]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Expected Annuity Age";
        Index = "1";
    }
#*  MFFAN8 END  *


    INOUT MIR-CVG-NUM-T[20]
    {
        Key;
        Length = "2";
        FieldGroup = "Table20";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    INOUT MIR-PLAN-PKG-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PLAN-PKG-TYP-CD";
        DBTableName = "TPACK";
        SType = "Text";
        Label = "List Type";
    }

    INOUT MIR-CVG-RT-AGE-T[20]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Age";
        Index = "1";
    }

    INOUT MIR-CVG-SEX-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Sex";
        Index = "1";
    }

    INOUT MIR-CVG-SMKR-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "SMOKE";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Smoker";
        Index = "1";
    }

    INOUT MIR-CVG-WP-IND-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "WP Ind";
        Index = "1";
    }

    INOUT MIR-DV-INSRD-CLI-NM-2-T[20]
    {
        Length = "75";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }

    INOUT MIR-DV-INSRD-CLI-NM-T[20]
    {
        Length = "75";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }

    INOUT MIR-INSRD-CLI-ID-2-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Insured's Client Number";
        Index = "1";
    }

    INOUT MIR-INSRD-CLI-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Insured's Client Number";
        Index = "1";
    }

    INOUT MIR-PLAN-ID-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Plan ID";
        Index = "1";
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

    INOUT MIR-PLAN-PKG-ADB-CD-T[20]
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

    INOUT MIR-PLAN-PKG-WP-CD-T[20]
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

    INOUT MIR-DV-CVG-PLAN-JNT-IND-T[20]
    {
        Length = "1";
        FieldGroup = "TABLE20";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Joint Plan Indicator";
        Index = "1";
    }

    INOUT MIR-CVG-JNT-LIFE-CD-T[20]
    {
        Length = "1";
        FieldGroup = "TABLE20";
        CodeSource = "DataModel";
        CodeType = "CVG-JNT-LIFE-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Joint Life Type";
        Index = "1";
    }

    INOUT MIR-CVG-LIVES-INSRD-CD-T[20]
    {
        Length = "1";
        FieldGroup = "TABLE20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Number of Lives Insured";
        Index = "1";
    }

    INOUT MIR-CVG-STBL-1-CD-T[20]
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
     
    INOUT MIR-CVG-STBL-2-CD-T[20]
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
    INOUT MIR-CVG-STBL-3-CD-T[20]
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

    INOUT MIR-CVG-STBL-4-CD-T[20]
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
    INOUT MIR-CONN-CVG-NUM-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Connected Coverage Number";
        Index = "1";
    }

    INOUT MIR-CONN-POL-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Connected Policy Number";
        Index = "1";
    }

    INOUT MIR-CVG-CONN-REASN-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CONN-REASN-CD";
        SType = "Selection";
        Label = "Connected Policy Reason";
        Index = "1";
    }

    INOUT MIR-CVG-ILLUS-CD-T[20]
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

