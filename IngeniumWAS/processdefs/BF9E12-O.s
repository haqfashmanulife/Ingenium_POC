# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:33 PM EDT

#*******************************************************************************
#*  Component:   BF9E12-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS26B          CREATING NEW SCREEN FOR FACE AMOUNT PROJECTION             *
#*  28610J          CHANGES FOR INCREASING FA PROJECTION AS PART OF BEAVER     *
#*  B26503          FIX TO DISPLAY INCREMENTAL RATE                            *
#*******************************************************************************

S-STEP BF9E12-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-POL-ID-BASE";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }
    IN MIR-POL-ID-BASE
    {
        Key;
        Length = "10";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }
    IN MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Effective Date";
    }
# B26503 CHNAGES START
    IN MIR-INCR-RT
    {
        DisplayOnly;
        Length = "6";
        Decimals = "2";
        DBTableName = "TRT";
        SType = "Percent";
        Label = "Incremental Rate";
    }
# B26503 CHNAGES END
# 28610J CHANGES START
#    IN MIR-DV-FROM-DT-T[5]
    IN MIR-DV-FROM-DT-T[25]
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
#    IN MIR-DV-TO-DT-T[5]
    IN MIR-DV-TO-DT-T[25]
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
#    IN MIR-CVG-FACE-AMT-T[5]
    IN MIR-CVG-FACE-AMT-T[25]
# 28610J CHANGES END
    {
# 28610J CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
# 28610J CHANGES END HERE 
        Signed;
        Length = "17";
# 28610J CHANGES START HERE
#        FieldGroup = "Table5";
        FieldGroup = "Table25";
# 28610J CHANGES END HERE
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

}



