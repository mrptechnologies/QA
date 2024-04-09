<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/AddDocument.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>

<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2"
	CELLPADDING="0">

	<tr>
		<td>&nbsp;</td>
	</tr>

	<tr>
		<td>
		<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0"
			CELLPADDING="0">
			<tr>
				<td class="NewSectionHead" colspan="4" align="center">ASSOCIATE ALERT </td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td><html:form action="/AssociateAlertAction.do"
					onsubmit="return validateFields()">

					<table WIDTH="90%" ALIGN="left" BORDER="0" CELLSPACING="0"
						CELLPADDING="2">
						
						<tr>
							<td width="35%" class="FormLabels" align="left">Select A Role :</td>
							<td>&nbsp; <dmshtml:dms_roles nameInSession="arrUserRolesAndDesc" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" ordinalValue="<%=(Long)session.getAttribute("ordinalValue")%>"/>	
							<html:select property="answer(Object::UserDetail::PrimaryRoleId)" name="AssociateAlert" styleId="roleId" onchange="testAj()">
								<html:option value ="">Select</html:option>

									<logic:present name ='arrUserRolesAndDesc' scope ='session'>

										<logic:iterate id="arrUserRolesAndDesc" name="arrUserRolesAndDesc" scope="session" >
											<bean:define id='roleId' name="arrUserRolesAndDesc"  property="id" />
											<bean:define id='desc' name="arrUserRolesAndDesc"  property="desc" />
											<html:option value ='<%=roleId.toString()%>'  >
											<bean:write name="arrUserRolesAndDesc" property="desc" />
								</html:option>
								
										</logic:iterate>
									</logic:present>
							</html:select>
						</tr>						
						
						<tr>
							<td>&nbsp;</td>
						</tr>
						
						<tr>
							<td width="35%" class="FormLabels" align="left">Select 1 OR MORE USERS :</td>							
							<td>&nbsp; 
							
							<div id="USER_CONTAINER"> </div>	
											
							</td>						
						</tr>
						
						<tr>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td>&nbsp;</td>
							<td align="left"><html:submit value="Associate"
								property="answer(button)" /> <html:reset value="Reset"
								property="answer(button)" /></td>
						</tr>
					</table>
					
										
					<html:hidden property="answer(Object::Alert::OwnerId)" value="<%=""+ownerId %>"/>
					<html:hidden property="answer(Object::Alert::CurrentUser)"  value='<%=""+usernameId%>'/>
					<html:hidden property="answer(Object::Alert::AlertId)" value="<%=""+request.getParameter("answer(Object::Alert::AlertId)")%>" />

				</html:form></td>
			</tr>

		</table>
		</td>
	</tr>
</table>

<script type="text/javascript">
function testAj() {
	url="../alert/MessageFromAssociateAlertBody.jsp";	
	 panel="USER_CONTAINER";
	  try {
	   new Ajax.Updater(
	     panel,
	     url,
	     {
	      synchronous:true, parameters:$(document.forms[0]).serialize(this), onComplete:function(){
	    	 if(document.getElementById(panel) != null && document.getElementById(panel) != undefined) {
	    			forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);
	    		}},
       onException:function(){}
	     }
	    );
	  }catch(err) {
	   txt="There was an error on this page.\n\n";
	   txt+="Error description: " + err.description + "\n\n";
	   txt+="Click OK to continue.\n\n";
	   alert(txt);
	  }	  
	 }
</script>