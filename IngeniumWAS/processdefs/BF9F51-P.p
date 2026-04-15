# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF9F51-P.p                                                    *
#*  Description: For creating  requirements                                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  R19946  CTS      FIX FOR UW SUMMARY UPDATE REQ COMMENT TEXT BOX ISSUE      *
#*******************************************************************************

P-STEP BF9F51-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9F51";
        BusinessFunctionName = "UW Summary Update";
        BusinessFunctionType = "Create";
        MirName = "NCWM9F51";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Id";
    }
    INOUT MIR-POL-ID
    {
        Length = "10";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }
	
    INOUT MIR-ISS-POL-ID-T [20]
    {
       Length = "10";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "Policy ID";
        Index = "1";
    }
	
   INOUT MIR-NEW-UW-REQIR-ID-T[15]
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TREQT";
        SType = "Selection";
        Label = "Requirement";
        Index = "1";
    }

    INOUT MIR-NEW-UW-REQIR-CAT-CD-T[15]
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "URCAT";
        DBTableName = "TREQT";
        SType = "Selection";
        Label = "Category";
    }

    INOUT MIR-NEW-UW-REQIR-COMNT-TXT-T[15]
    {
        Length = "200";
        DBTableName = "TREQT";
        SType = "TextArea";
        Label = "Comment:";
    }
    INOUT MIR-NEW-ISS-POL-ID-T [5]
    {
       Length = "10";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "Policy ID";
        Index = "1";
    }
   INOUT MIR-NEW-ISS-REQIR-ID-T[5]
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TREQT";
        SType = "Selection";
        Label = "Requirement";
        Index = "1";
    }

    INOUT MIR-NEW-ISS-REQIR-CAT-CD-T[5]
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "IRCAT";
        DBTableName = "TREQT";
        SType = "Selection";
        Label = "Category";
        Index = "1";
    }

    INOUT MIR-NEW-ISS-REQIR-COMNT-TXT-T[5]
    {
        Length = "200";
        DBTableName = "TREQT";
        SType = "TextArea";
        Label = "Comment";
        Index = "1";
    }
    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }
    INOUT MIR-REQIR-ID-T[20]
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TREQT";
        SType = "Selection";
        Label = "Requirement";
        Index = "1";
    }
    INOUT MIR-CPREQ-STAT-CD-T[20]
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CPREQ-STAT-CD";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement Status";
        Index = "1";
    }
    INOUT MIR-CPREQ-SEQ-NUM-T[20]
    {
        Length = "3";
        DBTableName = "TREQT";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }
    INOUT MIR-ISS-CPREQ-STAT-CD-T[20]
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CPREQ-STAT-CD";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement Status";
        Index = "1";
    }    
    INOUT MIR-ISS-CPREQ-SEQ-NUM-T[20]
    {
        Length = "3";
        DBTableName = "TREQT";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }    
    INOUT MIR-ISS-REQIR-ID-T[20]
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TREQT";
        SType = "Selection";
        Label = "Requirement";
        Index = "1";
    }   
}