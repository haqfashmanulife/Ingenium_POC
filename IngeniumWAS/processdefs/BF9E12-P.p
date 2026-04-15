# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:32 PM EDT

#*******************************************************************************
#*  Component:   BF9E12-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS26B          CREATING NEW SCREEN FOR FACE AMOUNT PROJECTION             *
#*  28610J          CHANGES FOR INCREASING FA PROJECTION AS PART OF BEAVER     *
#*  B26503          FIX TO DISPLAY INCREMENTAL RATE                            *
#*******************************************************************************

P-STEP BF9E12-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9E12";
        BusinessFunctionName = "Increasing Face Amount Projection";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9E12";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
    
    IN MIR-POL-ID-BASE
    {
        Key;
        Length = "10";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }
    OUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Effective Date";
    }
# B26503 CHANGES START
    OUT MIR-INCR-RT
    {
        Length = "6";
        Decimals = "2";
        DBTableName = "TRT";
        SType = "Percent";
        Label = "Incremental Rate";
    }
# B26503 CHANGES END
# 28610J CHANGES START 
#    OUT MIR-DV-FROM-DT-T[5]
    OUT MIR-DV-FROM-DT-T[25]
# 28610J CHANGES END
    {
        Length = "10";
# 28610J CHANGES START
#        FieldGroup = "Table5";
        FieldGroup = "Table25";
# 28610J CHANGES END
        DBTableName = "Derived";
        SType = "Date";
        Label = "From Date";
        Index = "1";
    }

# 28610J CHANGES START
#    OUT MIR-DV-TO-DT-T[5]
    OUT MIR-DV-TO-DT-T[25]
# 28610J CHANGES END
    {
        Length = "10";
# 28610J CHANGES START
#        FieldGroup = "Table5";
        FieldGroup = "Table25";
# 28610J CHANGES END
        DBTableName = "Derived";
        SType = "Date";
        Label = "To Date";
        Index = "1";
    }
# 28610J CHANGES START
   INOUT MIR-POL-CRCY-CD
           {
            
                Length = "2";
                SType = "Hidden";
                Label = "Currency";
        }
# 28610J CHANGES END

# 28610J CHANGES START
#    OUT MIR-CVG-FACE-AMT-T[5]
    OUT MIR-CVG-FACE-AMT-T[25]
# 28610J CHANGES END
    {
        Signed;
        Length = "17";
# 28610J CHANGES START
#        FieldGroup = "Table5";
        FieldGroup = "Table25";
# 28610J CHANGES END
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

}

