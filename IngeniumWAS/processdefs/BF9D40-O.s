#*******************************************************************************
#*  Component:   BF9D40-O.s                                                    *
#*  Description: RAD DEPOSIT HISTORY MODIFICATION INQUIRY SCREEN               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  MP251B  CTS     TRAD DEPOSIT HISTORY MODIFICATION INQUIRY SCREEN           *
#*  Q50806  25JUN14 CHANGES FOR PREMIUM DUE MONTH                              *
#*******************************************************************************

S-STEP BF9D40-O
{
        ATTRIBUTES
        {
                BusinessFunctionType = "Retrieve";
                DelEmptyRows;
                FocusField = "OKButton";
                FocusFrame = "ButtonFrame";
                Type = "Output";
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
               SType="Hidden";
        }
         
        IN MIR-POL-ID-BASE 
        {
                DefaultSession = "MIR-POL-ID-BASE";
                DisplayOnly;
                Key;
                Label = "Policy Id";
                Length = "9";
                SType = "Text";
        }
   
        IN MIR-POL-ID-SFX 
        {
                DefaultSession = "MIR-POL-ID-SFX";
                DisplayOnly;
                Key;
                Label = "Suffix";
                Length = "1";
                SType = "Text";
        }
   
        IN MIR-APPL-CTL-PRCES-DT 
        {
                DefaultSession = "LSIR-PRCES-DT";
                DisplayOnly;
                Key;
                Label = "Process Date";
                Length = "10";
                SType = "Date";
        }
   
        IN MIR-DV-OWN-CLI-NM 
         {
                DisplayOnly;
                Label = "Owner Name";
                Length = "75";
                SType = "Text";
         }
     
        IN MIR-PLAN-ID 
         {
                CodeSource = "EDIT";
                CodeType = "PLAN";
                DisplayOnly;
                Label = "Plan ID";
                Length = "40";
                SType = "Text";
         }
          
         IN MIR-POL-ISS-EFF-DT 
         {
                DisplayOnly;
                Label = "Issue Date of the Policy";
                Length = "10";
                SType = "Date";
         }
             
         IN MIR-POL-PD-TO-MO-NUM 
         {
                DisplayOnly;
                Label = "Policy Paid to Month";
                Length = "7";
                SType = "Text";
         }
         
         IN MIR-POL-PD-TO-DT-NUM 
         {
                DisplayOnly;
                Label = "Policy Paid to Date";
                Length = "10";
                SType = "Text";
         }
                  
         IN MIR-POL-PD-DURATION-NUM 
         {
                DisplayOnly;
                Label = "Policy Paid Duration";
                Length = "7";
                SType = "Text";
          }
           
         IN MIR-TRAD-PD-TO-MO-NUM 
         {
                DisplayOnly;
                Label = "Trad Paid to Month";
                Length = "7";
                SType = "Text";
         }
         IN MIR-TRAD-PD-TO-DT-NUM 
         {
                DisplayOnly;
                Label = "Trad Paid to Date";
                Length = "10";
                SType = "Text";
         }
         
         IN MIR-TRAD-PD-DURATION-NUM 
         { 
            DisplayOnly;
            Label = "Trad Paid Duration";
            Length = "6";
            SType = "Text";
         }
         
        IN MIR-COLCT-MTHD-CD
         {
             DisplayOnly;
             Length = "3";
             DBTableName = "TDH";
             CodeSource = "DataModel";
             CodeType = "COLCT-MTHD-CD";
             SType = "Text";
             Label = "Collection Method";
             
#* Q50806 CHANGES STARTS
#            Index = "1";             
#* Q50806 CHANGES  ENDS
          }
          
        IN MIR-COLCT-CATG-CD
        {
                    DisplayOnly;
            Length = "3";
            DBTableName = "TDH";
            CodeSource = "DataModel";
            CodeType = "COLCT-CATG-CD";
            SType = "Text";
            Label = "Collection Category";
#* Q50806 CHANGES STARTS
#             Index = "1";
#* Q50806 CHANGES  ENDS
        }
        
        IN  MIR-TRAD-JRNL-DT
        {
        DisplayOnly;
          Length = "10";
          DBTableName = "TDH";
          SType = "Text";
          Label = "Trad Journal Date";
#* Q50806 CHANGES STARTS
#             Index = "1";
#* Q50806 CHANGES  ENDS
         }        
           
                
        IN MIR-TRAD-SO-JRNL-DT
        {
            DisplayOnly;
            Length = "10";
            DBTableName = "TDH";
            SType = "Text";
            Label = "Trad SO Journal Date";
#* Q50806 CHANGES STARTS
#              Index = "1";
#* Q50806 CHANGES  ENDS
        }
        
        IN MIR-TRAD-RECV-DT
        {
                    DisplayOnly;
            Length = "10";
            DBTableName = "TDH";
            SType = "Text";
            Label = "Trad Received Date";
#* Q50806 CHANGES STARTS
#            Index = "1";
#* Q50806 CHANGES  ENDS
        }
        
        IN MIR-PREM-DUE-MO-NUM
        {
            Length = "7";
            DBTableName = "TDH";
            SType = "Text";
            Label = "Premium Due Month";
#* Q50806 CHANGES STARTS
#             Index = "1";
#* Q50806 CHANGES  ENDS
        }
        
        IN MIR-DPOS-RFND-QTY
        {
            Length = "3";
            DBTableName = "TDH";
            SType = "Text";
            Label = "Number of Deposits/ Refunds";
#* Q50806 CHANGES STARTS
#            Index = "1";
#* Q50806 CHANGES  ENDS
        }
        
        IN MIR-TRXN-AMT
        {
            
            CurrencyCode="MIR-PMT-CRCY-CD";
            Signed;
#* Q50806 CHANGES STARTS
#           Length = "15";
            Length = "17";
#* Q50806 CHANGES  ENDS
            DBTableName = "TDH";
            SType = "Currency";
            Label = "Transaction Amount";
#* Q50806 CHANGES STARTS
#             Index = "1";
#* Q50806 CHANGES  ENDS
        }
        
        IN MIR-TRXN-PRCES-DT
        {
            Length = "10";
            DBTableName = "TDH";
            SType = "Text";
            Label = "Transaction Process Date";
#* Q50806 CHANGES STARTS
#             Index = "1";
#* Q50806 CHANGES  ENDS
        }
        
        IN MIR-SEQ-NUM
        {
            Length = "3";
            DBTableName = "TDH";
            SType = "Text";
            Label = "Sequence Number";
#* Q50806 CHANGES STARTS
#            Index = "1";
#* Q50806 CHANGES  ENDS
        }
        
        IN MIR-PREV-UPDT-DT
        {
            Length = "10";
            DBTableName = "TDH";
            SType = "Date";
            Label = "Previous Update Date";
#* Q50806 CHANGES STARTS
#             Index = "1";
#* Q50806 CHANGES  ENDS
        }
        
        IN MIR-PREV-UPDT-USER-ID
        {
             Length = "8";
             DBTableName = "TDH";
             SType = "Text";
             Label = "Previous Update User ID";
#* Q50806 CHANGES STARTS
#             Index = "1";
#* Q50806 CHANGES  ENDS
        } 

	 IN MIR-PMT-CRCY-CD
	    {
	        Length = "2"; 
	        SType = "Hidden";
	        Label = "Currency";
   }

}
