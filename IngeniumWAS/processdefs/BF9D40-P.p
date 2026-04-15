#*******************************************************************************
#*  Component:   BF9D40-P.p                                                    *
#*  Description: TRAD DEPOSIT HISTORY MODIFICATION INQUIRY SCREEN              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP251B  CTS     TRAD DEPOSIT HISTORY MODIFICATION INQUIRY SCREEN           *
#*  Q50806  25JUN14 CHANGES FOR PREMIUM DUE MONTH                              *
#*******************************************************************************

P-STEP BF9D40-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9D40";
        BusinessFunctionName = "Trad Deposit Modification Inquiry";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9D40";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TDH";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TDH";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
    
    IN MIR-TRAD-SO-JRNL-DT
    {
        Length = "10";
        Mandatory;
        DBTableName = "TDH";
        DefaultSession = "MIR-TRAD-SO-JRNL-DT";
        SType = "Text";
        Label = "Trad SO Journal Date";
    }
            
    IN MIR-SEQ-NUM
     {
         Length = "3";
         Mandatory;
         DBTableName = "TDH";
        DefaultSession = "MIR-SEQ-NUM";
         SType = "Text";
         Label = "Sequence Number";
     }
     
     OUT MIR-DV-OWN-CLI-NM 
     {
             Label = "Owner Name";
             Length = "75";
             SType = "Text";
     }
     
     OUT MIR-PLAN-ID 
     {
             CodeSource = "EDIT";
             CodeType = "PLAN";
             Label = "Plan ID";
             Length = "40";
             SType = "Text";
     }
     
     OUT MIR-POL-ISS-EFF-DT 
     {
             Label = "Issue Date of the Policy";
             Length = "10";
             SType = "Date";
     }
     
     OUT MIR-POL-PD-TO-MO-NUM 
     {
             Label = "Policy Paid to Month";
             Length = "7";
             SType = "Text";
     }
     
     OUT MIR-POL-PD-TO-DT-NUM 
     {
             Label = "Policy Paid to Date";
             Length = "10";
             SType = "Text";
     }
     
     OUT MIR-POL-PD-DURATION-NUM 
     {
             Label = "Policy Paid Duration";
             Length = "7";
             SType = "Text";
     }
     
     OUT MIR-TRAD-PD-TO-MO-NUM 
     {
             Label = "Trad Paid to Month";
             Length = "7";
             SType = "Text";
     }
     
     OUT MIR-TRAD-PD-TO-DT-NUM 
     {
             Label = "Trad Paid to Date";
             Length = "10";
             SType = "Text";
     }
     
     OUT MIR-TRAD-PD-DURATION-NUM 
     {
              Label = "Trad Paid Duration";
             Length = "6";
             SType = "Text";
     }     
        
     OUT MIR-COLCT-MTHD-CD
     {
         Length = "3";
         DBTableName = "TDH";
         CodeSource = "DataModel";
         CodeType = "COLCT-MTHD-CD";
         SType = "Text";
         Label = "Collection Method";
#* Q50806 CHANGES STARTS
#        Index = "1";             
#* Q50806 CHANGES  ENDS         
        }
        
      OUT MIR-COLCT-CATG-CD
      {
          Length = "3";
          DBTableName = "TDH";
          CodeSource = "DataModel";
          CodeType = "COLCT-CATG-CD";
          SType = "Text";
          Label = "Collection Category";
#* Q50806 CHANGES STARTS
#         Index = "1";             
#* Q50806 CHANGES  ENDS     
      }
      
      OUT MIR-TRAD-JRNL-DT
       {
          Length = "10";
          DBTableName = "TDH";
          SType = "Text";
          Label = "Trad Journal Date";
#* Q50806 CHANGES STARTS
#         Index = "1";             
#* Q50806 CHANGES  ENDS     
       }
       
       
      OUT MIR-TRAD-RECV-DT
      {
          Length = "10";
          DBTableName = "TDH";
          SType = "Text";
          Label = "Trad Received Date";
#* Q50806 CHANGES STARTS
#         Index = "1";             
#* Q50806 CHANGES  ENDS     
      }
      
      OUT MIR-PREM-DUE-MO-NUM
      {
          Length = "7";
          DBTableName = "TDH";
          SType = "Text";
          Label = "Premium Due Month";
#* Q50806 CHANGES STARTS
#         Index = "1";             
#* Q50806 CHANGES  ENDS     
      }
      
      OUT MIR-DPOS-RFND-QTY
      {
          Length = "3";
          DBTableName = "TDH";
          SType = "Text";
          Label = "Number of Deposits/ Refunds";
#* Q50806 CHANGES STARTS
#         Index = "1";             
#* Q50806 CHANGES  ENDS     
      }
      
      OUT MIR-TRXN-AMT
      {
          
          Signed;
#* Q50806 CHANGES STARTS
#          Length = "15";
          Length = "17";
#* Q50806 CHANGES  ENDS
          DBTableName = "TDH";
          SType = "Currency";
          Label = "Transaction Amount";
#* Q50806 CHANGES STARTS
#         Index = "1";             
#* Q50806 CHANGES  ENDS     
      }
      
      OUT MIR-TRXN-PRCES-DT
      {
          Length = "10";
          DBTableName = "TDH";
          SType = "Text";
          Label = "Transaction Process Date";
#* Q50806 CHANGES STARTS
#         Index = "1";             
#* Q50806 CHANGES  ENDS          
      }
      
      OUT MIR-PREV-UPDT-DT
       {
          Length = "10";
          DBTableName = "TDH";
          SType = "Date";
          Label = "Previous Update Date";
#* Q50806 CHANGES STARTS
#         Index = "1";             
#* Q50806 CHANGES  ENDS     
       }
      OUT MIR-PREV-UPDT-USER-ID
       {
          Length = "8";
          DBTableName = "TDH";
          SType = "Text";
          Label = "Previous Update User ID";
#* Q50806 CHANGES STARTS
#         Index = "1";             
#* Q50806 CHANGES  ENDS         
        }
        
       OUT MIR-PMT-CRCY-CD
	{
	  Length = "2"; 
	  SType = "Hidden";
          Label = "Currency";
        }  
        
    }
