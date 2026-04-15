# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF9B60-P.p                                                    *
#*  Description: COVERAGE LIST BY INSURED SCREEN                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN5231  27MAR09  COVERAGE LIST BY INSURED SCREEN                           *
#*  EN6161  24APR09  LAYOUT CHANGE TO INCLUDE FOOTER                           *
#*  EN6928  03SEP09  ADDED THE CODE TO DISPLAY THE FIELDS POLICY ID AND        *
#*                   CLIENT NAME AND RIDER PREMIUM AND COMMENTED THE CODE FOR  *
#*                   DISPLAY OF BENEFIT TYPE CODE                              *   
#*******************************************************************************

P-STEP BF9B60-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9B60";
        BusinessFunctionName = "Coverage List by Insured";
        BusinessFunctionType = "List";
        MirName = "CCWM9B60";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client ID";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
     }

    IN MIR-POL-ID-SFX
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
    }

#EN6161 - Changes Begin
#    OUT MIR-DV-CLI-NM
#    { 
#        Length = "60";
#        SType = "Text";
#        DBTableName = "TCLNM";
#        DBTableName = "Derived";
#        Label = "Insured Name";
#    }
#
#    OUT MIR-DV-POL-ID
#    {
#        Length = "13";
#        SType = "Text";
#        DBTableName = "Derived";
#        Label = "Type-Policy Number";
#    }
#EN6161 - Changes End

#EN6928 - Changes Begin
    OUT MIR-DV-CLI-NM
    { 
        Length = "60";
        SType = "Text";
        DBTableName = "TCLNM";
        DBTableName = "Derived";
        Label = "Insured Name";
    }

    OUT MIR-DV-POL-ID
    {
        Length = "13";
        SType = "Text";
        DBTableName = "Derived";
        Label = "Type-Policy Number";
    }
#EN6928 - Changes End


    OUT MIR-CVG-NUM-T[99]
    {
        Length = "2";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-PLAN-ID-T[99]
    {
        Length = "60";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Rider Name";
    }

    OUT MIR-CVG-FACE-AMT-T[99]
    {
        Key;
        Length = "15";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Number";
        Signed;
        Label = "Face Amount/Daily Benefit Amount";
    }

    OUT MIR-CVG-ISS-EFF-DT-T[99]
    { 
        Key;
        Length = "10";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Rider Addition Date";
    }

    OUT MIR-CVG-STBL-1-CD-T[99]
    {
        Length = "02";
        FieldGroup = "Table99";
        CodeSource = "EDIT";
        CodeType = "STB1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Insurance Period";
    }

#EN6928 - Changes Begin    
#    OUT MIR-CVG-STBL-2-CD-T[99]
#    {
#        Length = "03";
#        FieldGroup = "Table99";
#        CodeSource = "EDIT";
#        CodeType = "STB2";
#        DBTableName = "TCVG";
#        SType = "Text";
#        Label = "Benefit Day Type";
#    }

    OUT MIR-CVG-MPREM-AMT-T[99]
    {
        Length = "13";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Number";
        Signed;
        Label = "Rider Premium";
    }

#EN6928 - Changes End

#EN6161 - Changes Begin
    OUT MIR-DV-FOOTER-TXT
    { 
        Length = "35";
        SType = "Text";
        DBTableName = "Derived";
        Label = "Date Time";
    }
#EN6161 - Changes End

}
