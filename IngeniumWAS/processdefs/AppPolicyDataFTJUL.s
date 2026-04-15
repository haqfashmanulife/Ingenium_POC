# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:12 PM EDT

#*******************************************************************************
#*  Component:   AppPolicyDataFTJUL                                            *
#*  Description: Clone of AppPolicyDataUL                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01NB01  GW       New App. entry FLow.                                      *
#*  PR006C  FB       Add MIR-CVG-STBL-2-CD-T[20] - benefit days select box     *
#*  MFPL1B  HL       Add MIR-CVG-ILLUS-CD-T[20] - Illustration type box        *
#*  MFFAN8  MC       ADD EXPECTED ANNUITY AGE                                  *
#*  MP143B  CTS      CHANGES TO ADD STBL-3 AND STBL-4 DROPDOWNS                *
#*  MP161A  CTS      CHANGES TO ADD WP INDICATOR DROPDOWN                      *
#*  M213F1  CTS      CHANGES TO ADD NEW GROUP ID FIELD FOR RUM                 *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

S-STEP AppPolicyDataFTJUL
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-CVG-FACE-AMT-T[1]";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    IN BannerBar;

    IN BannerBarSize;

    IN BannerProductID
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
    }

    IN BannerPolicyID;

    IN BannerPrimaryInsured;


    # input policy id values to this s step for the filtered
    # selection box, csom4902 to work.  Pageserver only looks
    # @ the s step to determine how to build the page.  Even though
    # the policy id information will be passed around implicitly,
    # it must be passed in explicitly for pageserver.

    IN MIR-POL-ID-BASE;

    IN MIR-POL-ID-SFX;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-POL-DB-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DB-OPT-CD";
        SType = "Selection";
        Label = "Policy Death Benefit Option";
    }

    INOUT MIR-PLAN-ID-T[25]
    {
        Length = "40";
        Mandatory;
        FieldGroup = "Table5";
        CodeSource = "CSOM4902";
        FilterFields = "2";
        FilterField1 = "MIR-POL-ID-BASE";
        FilterField2 = "MIR-POL-ID-SFX";
        SType = "Selection";
        Label = "Product";
        Index = "1";
    }
    
#* M213F1 START *    
    
    INOUT MIR-CVG-PRIM-GR-ID-T[25]
    {
            Length = "2";            
            SType = "Text";
            FieldGroup = "Table5";
            Label = "Group ID";
            Index = "1";
    }
    
#* M213F1 END * 
    

    INOUT MIR-CVG-FACE-AMT-T[25]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Length = "15";
        Mandatory;
        FieldGroup = "Table5";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

#*  MFFAN8 START  *
    INOUT MIR-CVG-XPCT-ANTY-AGE-T[25]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table5";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Expected Annuity Age";
        Index = "1";
    }
#*  MFFAN8 END   *

    
    INOUT MIR-CVG-AD-FACE-AMT-T[25]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE  
        Length = "15";
        Mandatory;
        FieldGroup = "Table5";
        SType = "Currency";
        Label = "AD Face Amount";
        Index = "1";
    }

    INOUT MIR-CVG-WP-IND-T[25]
    {
        Length = "40";
        Mandatory;
#*  MP161D CHANGES START HERE *
        CodeSource = "DataModel";
        CodeType = "CVG-WP-IND";
        SType = "Selection";
        FieldGroup = "Table5";
#*      SType = "Indicator"; *
#*  MP161D CHANGES END HERE *
        Label = "WP Ind";
        Index = "1";
    }

    INOUT MIR-DV-INSRD-CLI-NM-T[25]
    {
        ReadOnly;
        Length = "75";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Primary Insured";
        Index = "1";
    }

    INOUT MIR-INSRD-CLI-ID-T[25]
    {
        SType = "Hidden";
    }

    INOUT PrimaryInsuredSelectionBox-T[25]
    {
        Length = "10";
        CodeSource = "CSOM4904";
        FilterFields = "2";
        FilterField1 = "MIR-POL-ID-BASE";
        FilterField2 = "MIR-POL-ID-SFX";
        SType = "Selection";
        FieldGroup = "Table5";
        Label = "Select Application Clients";
        Index = "1";
    }

    INOUT MIR-DV-CVG-PLAN-JNT-IND-T[25]
    {
        Length = "1";
        FieldGroup = "Table5";
        SType = "Hidden";
        Label = "Joint Plan Indicator";
        Index = "1";
    }

    INOUT MIR-CVG-JNT-LIFE-CD-T[25]
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-JNT-LIFE-CD";
        FieldGroup = "Table5";
        SType = "Selection";
        Label = "Joint Life Type";
        Index = "1";
    }

    INOUT MIR-CVG-LIVES-INSRD-CD-T[25]
    {
        Length = "1";
        FieldGroup = "Table5";
        SType = "Hidden";
        Label = "Number of Lives Insured";
        Index = "1";
    }

    INOUT MIR-DV-INSRD-CLI-NM-2-T[25]
    {
        ReadOnly;
        Length = "75";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Joint Insured";
        Index = "1";
    }

    INOUT MIR-INSRD-CLI-ID-2-T[25]
    {
        SType = "Hidden";
    }

    INOUT JointInsuredSelectionBox-T[25]
    {
        Length = "10";
        CodeSource = "CSOM4904";
        FilterFields = "2";
        FilterField1 = "MIR-POL-ID-BASE";
        FilterField2 = "MIR-POL-ID-SFX";
        SType = "Selection";
        FieldGroup = "Table5";
        Label = "Select Application Clients";
        Index = "1";
    }

    INOUT MIR-CVG-STBL-1-CD-T[25]
    {
        Length = "2";
#* M241A3 changes START here* 
#        CodeSource = "EDIT";
#        CodeType = "STB1";
	CodeSource = "CSOM9D27";        
	FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID-T";
#* M241A3 changes END here* 
        SType = "Selection";
        FieldGroup = "Table5";
        Label = "Sub-table 1";
        Index = "1";
    }

    INOUT MIR-CVG-STBL-2-CD-T[25]
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Selection";
        FieldGroup = "Table5";
        Label = "Sub-table 2";
        Index = "1";
    }
#*  MP143B CHANGES START HERE *
    INOUT MIR-CVG-STBL-3-CD-T[25]
    {
        Length = "3";
#* M241A3 changes START here* 
#        CodeSource = "EDIT";
#        CodeType = "STB3";
        CodeSource = "CSOM9D28";        
	FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID-T";
#* M241A3 changes END here* 
        SType = "Selection";
        FieldGroup = "Table5";
        Label = "Sub-table 3";
        Index = "1";
    }

    INOUT MIR-CVG-STBL-4-CD-T[25]
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Selection";
        FieldGroup = "Table5";
        Label = "Sub-table 4";
        Index = "1";
    }
#*  MP143B CHANGES END HERE *
    OUT ChangeInsuredLink-T[25]
    {
        Label = "Search for other";
        FieldGroup = "Table5";
        Link;
        SType = "Text";
        Action = "GoToInsuredSearch";
        Index = "1";
    }

    OUT ChangeOtherLink-T[25]
    {
        Label = "Search for other";
        FieldGroup = "Table5";
        Link;
        SType = "Text";
        Action = "GoToOtherSearch";
        Index = "1";
    }

    INOUT ShowBlankRow
    {
        Label = "Add Optional Rider";
        SType = "Indicator";
    }

    INOUT MIR-CVG-NUM-T[25]
    {
        Length = "2";
        FieldGroup = "Table5";
        SType = "Hidden";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-PLAN-PKG-ADB-CD-T[25]
    {
        Length = "40";
        FieldGroup = "Table5";
        SType = "Hidden";
        Label = "Embedded ADB";
        Index = "1";
    }

    IN MIR-PLAN-PKG-WP-CD-T[25]
    {
        Length = "40";
        FieldGroup = "Table5";
        SType = "Hidden";
        Label = "Embedded WP";
        Index = "1";
    }

    IN MIR-PLAN-PKG-TYP-CD
    {
        Length = "40";
        SType = "Hidden";
        Label = "Embedded TYP";
    }

    IN MIR-ADDL-PLAN-MAND-IND-T[25]
    {
        Length = "1";
        FieldGroup = "Table5";
        SType = "Hidden";
        Label = "Plan Type";
        Index = "1";
    }

    IN MIR-DV-PLAN-DESC-TXT-T[25]
    {
        Length = "40";
        FieldGroup = "Table5";
        SType = "Hidden";
        Label = "DESC-TXT";
        Index = "1";
    }

    INOUT MIR-CVG-ILLUS-CD-T[25]
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ILLUS";
        SType = "Selection";
        FieldGroup = "Table5";
        Label = "Coverage Illustration Type";
        Index = "1";
    }
#M245B2 CHANGES START HERE  
     IN MIR-POL-CRCY-CD
           {
              Length = "2";           
              SType = "Hidden";
              Label = "Currency";
        }
#M245B2 CHANGES END HERE  
}

