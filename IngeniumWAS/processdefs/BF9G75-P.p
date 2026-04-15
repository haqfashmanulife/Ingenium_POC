# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF9G75-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYSDMI     CTS      INITIAL VERSION OF Do Not Process Movement Screen      *
#*  UYDM25     CTS      CHANGES FOR STREAM3                                    *
#*******************************************************************************

P-STEP BF9G75-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9G75";
        BusinessFunctionName = "Do Not Process Movement";
        BusinessFunctionType = "List";
        MirName = "CCWM9G75";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TUSMV";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }
    
    # UYDM25 CHANGES START
    
    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TUSMV";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }    
    
    # UYDM25 CHANGES END
    
    INOUT MIR-POL-MVMT-TYP-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "POL-MVMT-TYP-CD";
        SType = "Selection";
        Label = "Movement Type";
    }

    OUT MIR-LRG-TYP-CD
    {
        Length = "3";
        SType = "Text";
        Label = "Large Type Code";
    }

    OUT MIR-JRNL-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        SType = "Date";
        Label = "Journal Date";
        Index = "1";
    }

    OUT MIR-PRCES-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        SType = "Date";
        Label = "Process Date";
        Index = "1";
    }   
 
    OUT MIR-MVMT-TYP-DESC-T[50]
    {
        Length = "52";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Movement Type Description";
        Index = "1";                  
    }

    OUT MIR-OLD-VAL-T[50]
    {
        Length = "270";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Old Value";
        Index = "1";       
    }   
    OUT MIR-NEW-VAL-T[50]
    {
        Length = "270";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "New Value";
        Index = "1";       
    }

}

