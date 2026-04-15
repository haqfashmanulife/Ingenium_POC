# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:18 PM EDT

#*******************************************************************************
#*  Component:   BF0240-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*******************************************************************************

P-STEP BF0240-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0240";
        BusinessFunctionName = "Protected Coverage Details Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0153";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CVGD-DUR
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TCVGD";
        SType = "Text";
        Label = "Duration";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCVGD";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TCVGD";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TCVGD";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-COMM-ADV-1-AMT-T[3]
    {
        Length = "13";
        FieldGroup = "Table3";
        KeyColumn;
        DBTableName = "TCVGD";
        SType = "Currency";
        Label = "Commission Advance";
        Index = "1";
    }

    OUT MIR-COMM-EARN-1-AMT-T[3]
    {
        Length = "13";
        FieldGroup = "Table3";
        DBTableName = "TCVGD";
        SType = "Currency";
        Label = "Commission Earned";
        Index = "1";
    }

    OUT MIR-COMM-PD-1-AMT-T[3]
    {
        Length = "13";
        FieldGroup = "Table3";
        DBTableName = "TCVGD";
        SType = "Currency";
        Label = "Commission Paid";
        Index = "1";
    }

    OUT MIR-CVGD-PMT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVGD";
        SType = "Currency";
        Label = "Cumulative Payments for Duration";
    }

    OUT MIR-CVGD-PMT-LOAD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVGD";
        SType = "Currency";
        Label = "Cumulative Front-end Load";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Plan";
    }
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 

}

