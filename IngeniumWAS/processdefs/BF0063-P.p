# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:15 PM EDT

#*******************************************************************************
#*  Component:   BF0063-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0063-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0063";
        BusinessFunctionName = "Application Sign-On Change Password";
        BusinessFunctionType = "Newpass";
        MirName = "XCWM0060";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-USER-PSWD-TXT
    {
        Mandatory;
        Length = "8";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Password";
    }

    IN MIR-USER-PSWD-TXT-2
    {
        Mandatory;
        Length = "8";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "New Password";
    }

    IN MIR-USER-PSWD-TXT-3
    {
        Mandatory;
        Length = "8";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Confirm New Password";
    }

}

