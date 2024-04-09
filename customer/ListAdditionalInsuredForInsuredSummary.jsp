<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>

<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" scope="session"/> 
<bean:define id="CustomerName" name="AddCustomer" property="answer(Object::Customer::CustomerName)" scope="session"/> 
<bean:define id="cId" name="AddCustomer" property="answer(Object::Customer::CustomerId)" scope="session"/>
<bean:define id="additionalInsuredId" property="answer(Object::AdditionalInsured::AdditionalInsuredID)" name="AdditionalInsured" />

<html:form action="/DeleteAdditionalInsuredForInsuredSummary" styleId="DeleteInsuredForm" onsubmit="return deleteInsured()">
	<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr><td colspan="11">&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td colspan="10" align="left">
			  <a href="../GetAdditionalInsuredDetailAction.do?TabPanelName=Insured_Panel&answer(Object::AdditionalInsured::AdditionalyNamedInsured)=N" title="<bean:message key='ToolTip.InsuredSummary.AddAdditionalInsured'/>" class="button2" style="width:150px" />Add Additional Insured</a>
			</td>
		</tr>
		<tr><td colspan="12">&nbsp;</td></tr>
		<tr>
			<td class="sectionhead" align="center" colspan="12">Additional Insured List</td>
		</tr>
		<tr><td colspan="12">&nbsp;</td></tr>
		<tr>		
         	 <td class="sectionhead" width="4%" align="left">S.No</td>
             <td class="sectionhead" width="8%" align="left">Addl. Insured Type</td>  
             <td class="sectionhead" width="7%" align="left">Insured  Type</td>  
			 <td class="sectionhead" width="14%" align="left">Insured Name</td>
			 <td class="sectionhead" width="9%" align="left">DBA</td>
			 <td class="sectionhead" width="10%" align="left">Name Code</td>
			 <td class="sectionhead" width="11%" align="left" >Address1</td>
			 <td class="sectionhead" width="11%" align="left" >Address2</td>
			 <td class="sectionhead" width="8%" align="left" >City</td>
			 <td class="sectionhead" width="6%" align="left" >State</td>
			 <td class="sectionhead" width="7%" align="left" >ZipCode</td>
   			 <td class="sectionhead" width="5%" align="left" >Select</td>	
		</tr>
		<tr><td colspan="12">&nbsp;</td></tr>	
		<logic:present name="additionalInsuredList" scope="request">
			<% int i=0; %>
			<% int count=0; %>
		<logic:iterate id="additionalInsuredList" name="additionalInsuredList" scope="request">
				<% count++; %>
				<% 		
					String styleClass="";
					if(count%2==0){
						styleClass = "altdisply";
					}
					else{
						styleClass = "SearchResult";	
					}
				%>
		 <tr>
			<td class=<%= styleClass %> align="left"><%=++i%></td>
			<td class=<%=styleClass %>>
				<bean:define id="additionalyNamedInsured" name="additionalInsuredList" property="Object::AdditionalInsured::AdditionalyNamedInsured" />
				<%if(additionalyNamedInsured.toString().equals("N")) { %>Insured								   
				  <%}else{%>Named Insured<%}%> 
			</td>  
			<td class=<%=styleClass %> align="left"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::InsuranceType" />&nbsp;</td>
			<bean:define id="additionalInsuredID" name="additionalInsuredList" property="Object::AdditionalInsured::AdditionalInsuredID" /> 
			<td class=<%=styleClass %> align="left"><a href="../GetAdditionalInsuredDetailAction.do?TabPanelName=Insured_Panel&answer(Object::AdditionalInsured::OwnerId)=<%=ownerId.toString()%>&answer(Object::AdditionalInsured::CustomerID)=<%=Customerid.toString()%>&answer(Object::AdditionalInsured::AdditionalInsuredID)=<%=additionalInsuredID.toString()%>&answer(Object::AdditionalInsured::AdditionalyNamedInsured)=<%=additionalyNamedInsured.toString()%>" title="<bean:message key='ToolTip.InsuredSummary.AdditionalInsuredName'/>" /><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::InsuredName" /></a>&nbsp;</td>
			<td class=<%=styleClass %> align="left"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::DBA" />&nbsp;</td>
			<td class=<%=styleClass %> align="left"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::InsuredNumber" />&nbsp;</td>
			<td class=<%=styleClass %> align="left"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::Address1" />&nbsp;</td>
			<td class=<%=styleClass %> align="left"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::Address2" />&nbsp;</td>			
			<td class=<%=styleClass %> align="left"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::City" />&nbsp;</td>								
			<td class=<%=styleClass %> align="left"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::State" />&nbsp;</td>													
			<td class=<%=styleClass %> align="left"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::Zip" />&nbsp;</td>													
			<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" scope="session"/> 
			<td class=<%=styleClass %> align="center">
				<input type="checkbox" name="answer(Object::AdditionalInsured::SelectedAdditionalInsured)" value='<%=""+additionalInsuredID%>' id="additionalInsuredSelect" 	>
			</td>	
          </tr>
		</logic:iterate>			
		<tr><td colspan="11">&nbsp;</td></tr>
		<tr><td colspan="11">&nbsp;</td></tr>										
	</logic:present>
	</table>		
    <logic:present name="additionalInsuredList" scope="request">
			<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td width="75%" >&nbsp;</td>
   				 <td title="<bean:message key='ToolTip.InsuredSummary.DeleteInsured'/>"><html:submit property="answer(formName)" value="Delete" styleClass="sbttn" /></td>
				</tr>
			</table>	
	</logic:present>
   <html:hidden property="answer(Object::AdditionalInsured::AdditionalyNamedInsured)" value="N" />
   <html:hidden property="answer(Object::AdditionalInsured::CustomerID)" value="<%=Customerid.toString()%>" />
   <html:hidden property="answer(Object::AdditionalInsured::OwnerId)" value="<%=ownerId.toString()%>" />
   <html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
   <html:hidden property="answer(pageType)" value = "ADDITIONAL_INSURED"/>
   <html:hidden property="InsuredSummaryActiveTab" value="additionalInsuredTab" />
   <html:hidden property="answer(Object::AdditionalInsured::CreatedBy)" value="<%=usernameId.toString()%>" />
</html:form>		
		 
		 
		 