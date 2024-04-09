<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<form name="SubjectivityNotesForm">
<table cellpadding="1" cellspacing="0" border="1" bordercolor='#000000'>
<tr bordercolor='#ffffff'> <td>
<div class="AttachmentPage">									
					<div class="content">							
					<div class="AttachmentHead"><h2 class="left">Add Notes</h2></div>
<table cellpadding="1" cellspacing="0" style="background:url(i/bodybg.gif) repeat-x #fff;">

  	 <tr>
  	   <td> 
  	     <h6>Notes Description:</h6>
  	   </td>
       <td> 
         <input type = text name="answer(Object::Notes::Description)" id="notesDesc" size="50" maxlength="54" />
         <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_PRIVATE_NOTES"}%>' connector='or' negated="true">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Internal View Only 
        <input type = checkbox name="answer(Object::Notes::Private)" value="N"  id="mprivate" onclick="changevalue()"/> </td>
        </dmshtml:dms_static_with_connector>
     </tr>
  	 <tr>
  	 <td>
  	   <h6>Notes:</h6>
  	 </td>
  	<td>
  	<div id="text">
  	 <textarea  name="answer(Object::Notes::Notes)" id="editor_notes" rows="6" cols="80"> </textarea> 
  	</div> 
  	</td>
  </tr>
   <tr>
             <td width=50>&nbsp;</td>
             <td align=center>	<table><tr><td>
              <html:button property="Save" value=" Save " styleClass="subbutton" onclick="saveSubjectivityNotes()" styleId="save" onmouseover="" /></td>
             <td>
              <input type =hidden name="answer(Object::Notes::ObjectType)" id="objectType"/> 	
			  <input type =hidden name="answer(Object::Notes::ObjectId)" id="objectId"/>
			  <bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
			  <input type = hidden name="answer(Object::Notes::OwnerId)" value='<%= ""+ownerId%>'id="ownerId" />   
             <html:button property="Cancel" value="Cancel" styleClass="subbutton" onclick="hideSubjectivityNotes(document.getElementsByName('answer(Object::Notes::ObjectId)')[0].value,document.getElementById('ownerId').value, document.getElementById('objectType').value);" styleId="cancel" /></td></tr></table>
               </td>
              </tr>
             <tr><td>
             <bean:define id="roleId" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session"/>
			
			<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
             	
			<input type =hidden name="answer(Object::Notes::ObjectVerId)" id="objectVerId"/> 	
			<input type = hidden name="answer(Object::Notes::UserName)" value='<%= ""+userId%>'id="User" /> 	
			<input type =hidden name="answer(Object::Notes::Active)" value='Y' id="Active" /> 	
			<input type = hidden name="answer(Object::Notes::UserRole)" value='<%= ""+roleId%>'id="UserRole" />
             </td></tr>

</table>
         </div></div>
         </td></tr></table>
         </form>