<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<html:form action="/DeleteQuoteAction">
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td >
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="MH">
			DELETE CONFIRMATION - Quote
		</td>
	</tr>
	<tr>
		<td>
			<hr size="1" noshade >
		</td>
	</tr>
	
	<tr>
		<td valign="top">
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td  align="left" class="TextMatter">
						<bean:define id="delAll" value="NO"/>
						<bean:parameter id="delAll" name="deleteAll" value="NO"/>
						<logic:equal name="delAll" value="YES">
							<span style="color:#ff0000">This will delete ALL the selected Quotes.</span><br/>
							Do you want to delete the Quotes?
						</logic:equal>
						<logic:notEqual name="delAll" value="YES">
							Do you wish to delete the selected Quotes?
						</logic:notEqual>
					</td>
				</tr>
				<tr>
					<td >
						&nbsp;
					</td>
				</tr>
		
				<tr>
			 		 <td align="center">
						<input type="hidden" name="deleteAll" value="<%=delAll%>"/>
						<html:submit value="Yes" styleClass="sbttn"/>&nbsp;&nbsp;
						<html:reset value="Cancel" onclick="javascript:history.go(-1);" styleClass="sbttn"/>
			 		</td>
				</tr>
			</table>
		</td>
	</tr>

</table>

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>


<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId%>" />

<bean:parameter id="agencyIdTemp" name="answer(Object::Agency::AgencyId)" />
<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=""+agencyIdTemp%>" />
<bean:parameter id="customerId" name="answer(Object::Customer::CustomerId)" />
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+customerId%>" />
<html:hidden property="answer(Entity::Equals::OwnerId)" value="<%=""+ownerId%>" />
<bean:parameter id="customerState" name="answer(Object::Customer::State)" />
<html:hidden property="answer(Object::Customer::State)" value="<%=""+customerState%>" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />


</html:form>