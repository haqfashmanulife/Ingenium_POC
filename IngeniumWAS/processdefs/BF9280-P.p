# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF9280-P.p                                                    *
#*  Description: Address code search by postal code or address                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  P02506  FB       New for Address Code Search                               *
#*                                                                             *
#*******************************************************************************

P-STEP BF9280-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9280";
        BusinessFunctionName = "Address Code Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9280";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-PSTL-CD
    {
        Key;
        Length = "09";
        DBTableName = "TADCD";
        DefaultSession = " ";
        SType = "Text";
        Label = "Postal Code";
    }

    IN MIR-KJ-PREFCT-TXT
    {
        Key;
        Length = "11";
        DBTableName = "TADCD";
        DefaultSession = " ";
        SType = "Text";
        Label = "Prefecture";
    }

    IN MIR-KJ-CITY-TXT
    {
        Key;
        Length = "30";
        DBTableName = "TADCD";
        DefaultSession = " ";
        SType = "Text";
        Label = "City";
    }

    IN MIR-KJ-NGHBRHD-TXT
    {
        Key;
        Length = "30";
        DBTableName = "TADCD";
        DefaultSession = " ";
        SType = "Text";
        Label = "Town/Area";
    }

    INOUT MIR-LST-ADDR-LOC-CD
    {
        Length = "08";
        DBTableName = "TADCD";
        SType = "Text";
        Label = "Last Address code";
    }
     
    OUT MIR-ADDR-LOC-CD-T[50]
    {
        Length = "08";
        FieldGroup = "Table50"; 
        DBTableName = "TADCD";
        SType = "Text";
        Label = "Address code";
        Index = "1";
    }

    OUT MIR-PSTL-CD-T[50]
    {
        Length = "09";
        FieldGroup = "Table50";
        DBTableName = "TADCD";
        SType = "Text";
        Label = "Postal code";
        Index = "1";
    }

    OUT MIR-KJ-PREFCT-TXT-T[50]
    {
        Length = "11";
        FieldGroup = "Table50";
        DBTableName = "TADCD";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }
        
    OUT MIR-KJ-CITY-TXT-T[50]
    {
        Length = "30";
        FieldGroup = "Table50";
        DBTableName = "TADCD";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

        
    OUT MIR-KJ-NGHBRHD-TXT-T[50]
    {
        Length = "30";
        FieldGroup = "Table50";
        DBTableName = "TADCD";
        SType = "Text";
        Label = "Town/Area";
        Index = "1";
    }

}
