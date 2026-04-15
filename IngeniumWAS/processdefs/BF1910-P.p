# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:46 PM EDT

#*******************************************************************************
#*  Component:   BF1910-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  02MI01a YUC      Add Name, Employee Code and PIT ID   10SEP2002            *
#*                                                                             *
#*  MP310B  CTS      ADDED UW CLASS CODE TO THE USEC SECURITY RELATED SCREENS  *
#*  UYS100  CTS      ADDED POL ADMIN CLASS CODE TO THE USER SECURITY RELATED   *
#*                   SCREENS                                                   *
#*******************************************************************************

P-STEP BF1910-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1910";
        BusinessFunctionName = "User Security Record Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "XCWM0100";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-USER-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TUSEC";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

    OUT MIR-BR-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Branch ID";
    }

    OUT MIR-DEPT-ID
    {
        Length = "6";
        CodeSource = "XTAB";
        CodeType = "DEPT";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Department ID";
    }

    OUT MIR-PRTR-ID
    {
        Length = "8";
        CodeSource = "XTAB";
        CodeType = "PRTID";
        DBTableName = "TUSEC";
        SType = "Selection";
        Label = "Printer ID";
    }

    OUT MIR-SECUR-CLAS-ID
    {
        Length = "10";
        DBTableName = "TUSCL";
        SType = "Text";
        Label = "Security Class";
    }

    OUT MIR-USER-LANG-CD
    {
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "LANG";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Language";
    }

    OUT MIR-USER-PSWD-TXT
    {
        Length = "8";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Password";
    }

    OUT MIR-USER-PSWD-XPRY-DUR
    {
        Length = "4";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Password Expiry";
    }

    OUT MIR-USER-RPT-DSTRB-CD
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "DIST";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Distribution Code";
    }

# 02MI01a YUC    10SEP2002  Add 48 lines to add Name, Employee Code and PIT ID
    OUT MIR-KJ-SUR-NM
    {
        Length = "25";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Kanji Last Name";
    }

    OUT MIR-KJ-GIV-NM
    {
        Length = "25";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Kanji First Name";
    }

    OUT MIR-KA-SUR-NM
    {
        Length = "25";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Kana Last Name";
    }

    OUT MIR-KA-GIV-NM
    {
        Length = "25";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Kana First Name";
    }

    OUT MIR-MLJ-EMPLE-ID
    {
        Length = "6";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "MLJ Employee Code";
    }

    OUT MIR-PIT-ID
    {
        Length = "10";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "PIT ID";
    }

# MP310B CHANGES STARTS
    OUT MIR-UW-CLAS-CD
    {
        Length = "1";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "UW CLASS CODE";
    }
# MP310B CHANGES ENDS    
# UYS100 CHANGES STARTS
    OUT MIR-POL-ADMIN-CLAS-CD
    {
        Length = "2";
        CodeSource = "XTAB"; 
        CodeType = "PADCL";                
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "POLICY ADMINISTRATION CLASS CODE";
    }
# UYS100 CHANGES ENDS    
}

