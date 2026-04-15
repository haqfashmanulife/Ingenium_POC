// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//*  23774B  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
function storeSelection (field) {
   field.selected = true;
   field.selectedLength = field.createTextRange ?  window.selection.createRange().text.length : 1;
}
