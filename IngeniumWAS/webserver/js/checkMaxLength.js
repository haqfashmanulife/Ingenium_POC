// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:16 PM EDT
function checkMaxLength (textarea, evt, maxLength) {
 if (textarea.selected && evt.shiftKey)
   // ignore shift click for select
   return true;
 var allowKey = false;
 if (textarea.selected && textarea.selectedLength > 0)
   allowKey = true;
 else {
   var keyCode =
     document.layers ? evt.which : evt.keyCode;
   if (keyCode < 32 && keyCode != 13)
     allowKey = true;
   else
     allowKey = textarea.value.length < maxLength;
 }
 textarea.selected = false;
 return allowKey;
}
