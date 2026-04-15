# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:02 PM EDT

#*******************************************************************************
#*  Component:   BF9879-P.p                                                    *
#*  Description: Claim Payment Inquiry                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  CL104B  HIN/IH   PROTECTED PAYMENT UPDATE                                  *
#*                                                                             *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*******************************************************************************

P-STEP BF9879-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9879";
        BusinessFunctionName = "Protected Claim Payment Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9879";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLAP-KEY-T[50] 
    {
	Length = "14";
	FieldGroup = "Table1";
	SType = "Text";
	Label = "CLAP Record Key";
	Index = "1";
    }
    INOUT MIR-POL-ID-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";
        KeyColumn;
        DBTableName = "TFBNK";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
    INOUT MIR-PAYEE-NM-TXT-T[50]
    {
        Length = "50";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payee";
        Index = "1";
    }
    INOUT MIR-FINAL-APROV-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TFBNK";
        SType = "Date";
        Label = "Journal Date";
        Index = "1";
    }
    INOUT MIR-BNFT-PMT-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table1";
        DBTableName = "TFBNK";
        SType = "Currency";
        Label = "Payment Amount";
        Index = "1";
    }
    INOUT MIR-PREM-DED-AMT-T[50]
    {
        Signed;
        Length = "11";
        FieldGroup = "Table1";
        DBTableName = "TFBNK";
        SType = "Currency";
        Label = "Premium Deducted";
        Index = "1";
    }
    INOUT MIR-DLAY-INT-AMT-T[50]
    {
        Signed;
        Length = "11";
        FieldGroup = "Table1";
        DBTableName = "TFBNK";
        SType = "Currency";
        Label = "Interest Paid";
        Index = "1";
    }
    INOUT MIR-REMIT-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table1";
        DBTableName = "TFBNK";
        SType = "Currency";
        Label = "Adjusted Payment Amount";
        Index = "1";
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
