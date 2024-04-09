<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/LinkProductToObject.js"></SCRIPT>


<dmshtml:Get_users_byRoleId nameInSession="arrAgents" roleId="<%= ""+request.getParameter("answer(Object::UserDetail::PrimaryRoleId)") %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" ownerId="12" />
<select name="answer(Object::Alert::Users)" styleId="possible" multiple="true" size="4" id="userName" onchange="return submitSelectUserType()">														

	
		<logic:present name="arrAgents" scope="session">
		 <logic:iterate id="arrAgents" name="arrAgents" scope="session" >
			
		  <bean:define id='userId' name="arrAgents"  property="id" />
		   <option value ='<%=userId.toString()%>'  >
		   <bean:write name="arrAgents" property="id" />
		   </option>
	 </logic:iterate>
	</logic:present>		
</select>	
