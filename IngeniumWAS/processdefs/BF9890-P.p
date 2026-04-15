# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:02 PM EDT

#*******************************************************************************
#*  Component:   BF9890-P.p                                                    *
#*  Description: Disease/Surgery Retrieve                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*  MP143R  CTS    5.2	ADDED  EFFECTIVE AND EXPIRY DATE                       *
#*                                            FOR THE DISEASE/SURGERIES        *

#*******************************************************************************

P-STEP BF9890-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9890";
        BusinessFunctionName = "Disease/Surgery Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9890";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-MEDIC-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CD";
        DBTableName = "TMEDC";
        SType = "Selection";
        Label = "Medical Type";
    }
    
    IN MIR-MEDC-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TMEDC";
        SType = "Text";
        Label = "Minor Code";
    }

    OUT MIR-MEDC-TYP-CD
    {
        Length = "1";
        DBTableName = "TMEDC";
        SType = "Hidden";
        Label = "Code Medical Type";
    }

    OUT MIR-MEDC-SUBTYP-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "SUBTY";
        DBTableName = "TMEDC";
        SType = "Selection";
        Label = "Subtype";
    }
    
    OUT MIR-LANG-DESC-1-TXT
    {
        Length = "60";
        DBTableName = "TLANG";
        SType = "Text";
        Label = "Katakana Name";
    }
    
    OUT MIR-LANG-DESC-2-TXT
    {
        Length = "60";
        DBTableName = "TLANG";
        SType = "Text";
        Label = "Kanji Name";
    }

    OUT MIR-GRP-MEDC-TYP-CD
    {
        Length = "1";
        DBTableName = "TMEDG";
        SType = "Hidden";
        Label = "Group Medical Type";
    }    

    OUT MIR-GRP-MEDC-ID
    {
        Length = "10";
        DBTableName = "TMEDG";
        SType = "Text";
        Label = "Major Code";
    }    

    OUT MIR-GRP-LANG-DESC-1-TXT
    {
        Length = "60";
        DBTableName = "TLANG";
        SType = "Text";
        Label = "Major Code Name";
    }    

    OUT MIR-T1-MEDIC-CAT-CD-T[20]
    {
        Length = "5";
        FieldGroup = "Table1";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "MEDIC-CAT-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Category Name";
        Index = "1";
    }    

    OUT MIR-T1-MCAT-TYP-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "MCAT-TYP-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Category Type";
        Index = "1";
    }    
    
    OUT MIR-T1-SELECT-T[20]
    {
        Length = "1";
        FieldGroup = "Table1";
        SType = "Indicator";
        Label = "Select";
        Index = "1";
    }        

    OUT MIR-T1-GRP-MEDC-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TMEDC";
        SType = "Text";
        Label = "Major Code";
        Index = "1";
    }        

    OUT MIR-T1-GRP-LANG-DESC-1-TXT-T[20]
    {
        Length = "60";
        FieldGroup = "Table1";
        DBTableName = "TLANG";
        SType = "Text";
        Label = "Major Code Name";
        Index = "1";
    }    

    OUT MIR-T1-MCAD-REF-CD-T[20]
    {
        Length = "5";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "MCAD-REF-CD";
        DBTableName = "TMCAD";
        SType = "Selection";
        Label = "Eligibility";
        Index = "1";
    }        

    OUT MIR-T1-ENTRIES;
    OUT MIR-T1-MAX-ENTRIES;
    
    OUT MIR-T2-MEDIC-CAT-CD-T[20]
    {
        Length = "5";
        FieldGroup = "Table2";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "MEDIC-CAT-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Category Name";
        Index = "1";
    }    

    OUT MIR-T2-MCAT-TYP-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "MCAT-TYP-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Category Type";
        Index = "1";
    }    
    
    OUT MIR-T2-SELECT-T[20]
    {
        Length = "1";
        FieldGroup = "Table2";
        SType = "Indicator";
        Label = "Select";
        Index = "1";
    }           
    
    OUT MIR-T2-ENTRIES;
    OUT MIR-T2-MAX-ENTRIES;   
    
 #MP143R CHANGES START HERE
     OUT  MIR-EFF-DT
     {
          Length = "10";
          DBTableName = "TMEDC";
          SType = "Text";
          Label = "Effective Date";
     }
        
     OUT  MIR-XPRY-DT
     {
          Length = "10";
          DBTableName = "TMEDC";
          SType = "Text";
          Label = "Expiry Date";
      }
 #MP143R CHANGES END HERE            
         
}
