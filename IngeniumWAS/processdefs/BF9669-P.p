# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*********************************************************************************
#*  Component:   BF9669-P.p                                                                                *
#*  Description: Policy's bank detail update screen.                                    *
#*               Simple client detail preceding current bank info.  Bank detail*
#*               revision section follows.                                                                       *
#*                                                                                                                                     *
#**********************************************************************************
#*  Chg#    Release  Description                                                                           *
#*                                                                                                                                     *
#*  HCL103  HIN/CL   ADD A PAYEE                                 (HCL103C)            *
#**********************************************************************************

P-STEP BF9669-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9669";
        BusinessFunctionName = "PayeeList";
        BusinessFunctionType = "Inquire";
        MirName = "CCWM9669";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
     }

    INOUT MIR-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim ID";
    }
    
        OUT MIR-CLMA-CLM-STAT-CD
        {
            Length = "40";
            CodeSource = "DataModel";
            CodeType = "CLMA-CLM-STAT-CD";
            DBTableName = "TCLMA";
            SType = "Text";
            Label = "Master Claim Status";
    }


       

    OUT MIR-PAYEE-NM-TXT-T[50]
    {
        Length = "50";
        FieldGroup = "Table50";
        KeyColumn;
        DBTableName = "Derived";
        SType = "Text";
        Label = "Kanji Payee Name";
        Index = "1";
    }
    
    
  
  OUT MIR-BNK-NM-T[50]
    {
        Length = "36";
        FieldGroup = "Table50";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Current Bank Name";
    }

  
          OUT MIR-BNK-BR-NM-T[50]
    {
        Length = "36";
        FieldGroup = "Table50";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Current Branch Name";
    }

 
 
     OUT MIR-CLRL-BNK-ACCT-ID-T[50]
    {
        Length = "7";
        FieldGroup = "Table50";
        DBTableName = "CLRL";
	Mandatory;
        SType = "Text";
        Label = "Account Number";
    }

 	
OUT MIR-CLRL-ACCT-HLDR-NM-T[50]
    {
        Length = "50";
        FieldGroup = "Table50";
        DBTableName = "TCLRL";
	Mandatory;
        SType = "Text";
        Label = "Account Holder Name";
    }
                           
    OUT MIR-CLRL-ADDR-LOC-CD-T[50]
    {
        Length = "8";
        FieldGroup = "Table50";
        DBTableName = "TCLRL";
        SType = "Text";
        Label = "Address Code";
        Index = "1";
    }
                           
     OUT MIR-CLRL-SEND-PMT-NOTI-IND-T[50]
    {
        Length = "1";
        FieldGroup = "Table1";
        DBTableName = "TCLRL";
        SType = "Indicator";
        Label = "Send Notice";
        Index = "1";
    }
                  
     OUT MIR-CLRL-INSRD-REL-CD-T[50]     
        {
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "CLMRL";
        DBTableName = "TCLRL";
        SType = "Selection";
        Label = "Relationship to Insured";
        Index = "1";
    }          
         
 	OUT MIR-PREV-UPDT-USER-ID-T[50] 

 	{
	  Length = "8";
	  FieldGroup = "Table50";
	  DBTableName = "TCLRL";
	   SType = "Text";
	   Label = "Previous Update User ID";
	    Index = "1";
       }
 
 	OUT MIR-PREV-UPDT-DT-T[50] 
     {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TCLRL";
        SType = "Date";
        Label = "Previous Update Date";
        Index = "1";
    }
             
              
 	OUT MIR-CLRL-PAYE-STAT-CD-T[50] 
    {
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CLRL-PAYE-STAT-CD";
        DBTableName = "TCLRL";
        SType = "Text";
        Label = "Payee Status";
        Index = "1";
    }

     OUT MIR-CLRL-SEQ-NUM-T[50]
 	{
	  Length = "3";
	  FieldGroup = "Table50";
	  DBTableName = "TCLRL";
	   SType = "Text";
	   Label = "Sequence Number";
	    Index = "1";
       }     

}
