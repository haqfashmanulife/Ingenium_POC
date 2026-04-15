# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:52 PM EDT

#*******************************************************************************
#*  Component:   BF1914-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  02MI01a YUC      Add Kana Name   10SEP2002                                 *
#*                                                                             *
#*  MP310B  CTS      ADDED UW CLASS CODE TO THE USEC SECURITY RELATED SCREENS  *
#*  UYS100  CTS      ADDED POL ADMIN CLASS CODE TO THE USER SECURITY RELATED   *
#*                   SCREENS                                                   *
#*******************************************************************************

S-STEP BF1914-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-USER-ID";
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

    INOUT MIR-USER-ID
    {
        Key;
        Length = "8";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

    IN MIR-BR-ID-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Branch ID";
        Index = "1";
    }

    IN MIR-DEPT-ID-T[10]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "DEPT";
        SType = "Text";
        Label = "Department ID";
        Index = "1";
    }

    IN MIR-PRTR-ID-T[10]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "PRTID";
        SType = "Text";
        Label = "Printer ID";
        Index = "1";
    }

    IN MIR-SECUR-CLAS-ID-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Security Class";
        Index = "1";
    }

    IN MIR-USER-ID-T[10]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table10";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "User ID";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-USER-LANG-CD-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "LANG";
        SType = "Text";
        Label = "Language";
        Index = "1";
    }

    IN MIR-USER-PSWD-TXT-T[10]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Password";
        Index = "1";
    }

    IN MIR-USER-PSWD-XPRY-DUR-T[10]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Password Expiry";
        Index = "1";
    }

# 02MI01a YUC    10SEP2002  Add 20 lines to add Name
    IN MIR-KA-SUR-NM-T[10]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Kana Last Name";
        Index = "1";
    }

    IN MIR-KA-GIV-NM-T[10]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Kana First Name";
        Index = "1";
    }

# MP310B CHANGES STARTS
    IN MIR-UW-CLAS-CD-T[10]
    {
        DisplayOnly;    
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "UWCCD";
        FieldGroup = "Table10";        
        SType = "Text";
        Label = "UW CLASS CODE";
        Index = "1";        
    }
# MP310B CHANGES ENDS  
# UYS100 CHANGES STARTS
    IN MIR-POL-ADMIN-CLAS-CD-T[10]
    {
        DisplayOnly;    
        Length = "2";
        FieldGroup = "Table10";        
        CodeSource = "XTAB";
        CodeType = "PADCL";       
        SType = "Text";
        Label = "POLICY ADMINISTRATION CLASS CODE";
        Index = "1";        
    }
# UYS100 CHANGES ENDS  
}

