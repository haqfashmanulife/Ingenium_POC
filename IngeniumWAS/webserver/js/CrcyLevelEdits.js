// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//**************************************************************************************
//*  Component:   CrcyLevelEdits.js                                                    *
//*  Description:                                                                      *
//*                                                                                    *
//**************************************************************************************
//*  Chg#    Release  Author  Description                                              *
//*                                                                                    *
//*  M245B2  MAR 20   CTS     TO FORMAT FOREIGN CURRENCIES                             *
//*  23774B  10APR22  CTS     Changes done for ie retirement project to make it        *
//*                           compatible for microsoft edge. Changes in html include   *
//*                           adding "id" attribute for all input fields and changes in*
//*                           java scripts to modify certain functions/commands which  *
//*                           are no longer compatilble with edge.                     *
//**************************************************************************************

//-----------------------------------------------------------------------------
//
//  Function:       ValidateCrcyCd()
//
//  Description:    ValidateCrcyCd function checks the CurrencyCode for a particular field
//   and based on the currency code set for that field the currency symbol is hardcoded.
//   This Currency Symbol is used in the NumberFormat() function defined in ClientLevelEdits.js
// 
//
//  Arguments:      theField
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------

function validateCrcyCd(theField)
{

         var currcd = theField.getAttribute("CurrencyCode");
         var crcycd = document.getElementById(currcd).value;
         var yencur = document.getElementById("MIR-CRCY-SYMBL-CD").innerText;
         if ((crcycd == "JP"))
         {
            m_currencySymbol = yencur;
         }
         if ((crcycd == "AU"))
         {
            m_currencySymbol = "AUD ";
         }
         if ((crcycd == "US"))
         {
            m_currencySymbol = "USD ";
         }
         if ((crcycd == "NZ"))
         {
            m_currencySymbol = "NZD ";
         }
         if ((crcycd == "EU"))
         {
            m_currencySymbol = "EUR ";
         }

        if (theField == null) {
                m_contentDocument.m_fieldToBeValidated = null;
                m_contentDocument.m_validationStage = VALIDATION.READY;
                return true;
        }

        if (m_contentDocument.m_validationStage == VALIDATION.READY) {
                // a field is losing focus, so remember what it is so the next onfocus
                // field can validate the field

                m_contentDocument.m_fieldToBeValidated = theField;
                m_contentDocument.m_validationStage = VALIDATION.VALIDATE;
                window.event.preventDefault();
                return true;
        } else if (m_contentDocument.m_validationStage == VALIDATION.VALIDATE) {
                // a field is receiving focus, but first validate the previous field
                // Note: usually when this method is called when the m_validationStage is VALIDATION.VALIDATE,
                // the argument passed in is m_fieldToBeValidated

                m_contentDocument.m_fieldToBeValidated = null;
        
                m_contentDocument.m_validationStage = VALIDATION.READY;
                
                // Here do validation based on the field type
                var field = new Field(theField);

                field.setValue(NumberFormat(field));
                if (m_contentDocument.m_validationStage == VALIDATION.FAILED) {
                        theField.focus();
                        theField.select();
                        return false;
                }
                
                return true;
        } else if (m_contentDocument.m_validationStage == VALIDATION.FAILED) {
                // When the validation fails a dialog box is displayed which causes onblur() to execute.
                // We're going to ignore the validation when this happens because the user has
                // been positioned back on the field that failed.

                m_contentDocument.m_validationStage = VALIDATION.READY;
                window.event.preventDefault();
                return true;
        }
}
//-----------------------------------------------------------------------------
//
//  Function:       ValidateCrcyDcml()
//
//  Description:    ValidateCrcyDcml function checks the CurrencyCode for a particular field and based 
//    on the currency code set for that field,the Decimal Precision is Hardcoded. 
//    For All currency Codes Except JP the Decimal Precision will be set to 2. For JP it will be set to 0.
// 
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------

function validateCrcyDcml()
{
         var x= document.getElementById("inputForm");
        
         for ( var i =0 ; i< x.length ; i++ )
        {
         if ( x.elements[i].getAttribute("stype") == "Currency")
         {       
         var y = x.elements[i].getAttribute("CurrencyCode");
         var val = document.getElementById(y).value;         
          if ((val == "JP"))
          {
          x.elements[i].setAttribute("decimals","0");
          }
          else
          {
          x.elements[i].setAttribute("decimals","2");          
          }
         } 
        }
        var yencur = document.getElementById("MIR-CRCY-SYMBL-CD").innerText;
        setCurrencyRegExpFormattingChars();
// Include all the currency Symbols in the Regular Expression which is 
//used during the formatting in the NumberFormat() function in 
//ClientLevelEdits.js 	        
        sRegExp = sRegExp + "|\\" + yencur + "|[A-Za-z\\s]";
        m_currencyRegExpFormattingChars = new RegExp(sRegExp, "g");
}
