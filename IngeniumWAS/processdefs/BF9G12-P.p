# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF9G12-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  TLB404  CTS      NEW SCREEN FOR BULK BUNDLE APPLICATION                    * 
#*******************************************************************************

P-STEP BF9G12-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9G12";
        BusinessFunctionName = "Bulk Bundle Application Retrieve";
        BusinessFunctionType = "Update";
        MirName = "CCWM9G10";
    }

    INOUT LSIR-RETURN-CD;

    INOUT MIR-RETRN-CD;
    
    INOUT MIR-SPCL-APROV-IND-T[30]
    {
        Length = "01";
        FieldGroup = "Table30";
        SType = "Indicator";
        Label = "Special approval indicator";
        Index = "1";
    }
    
    INOUT MIR-POL-ID-T[30]
    {
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
        
}