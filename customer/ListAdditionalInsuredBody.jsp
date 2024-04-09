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

<script type="text/javascript">
	function deleteInsured(){
	
			var frm = document.forms[0];
			var count = 0;
			for(var i=0; frm.elements[i]!=null; i++) {
			
				if(frm.elements[i].name == "answer(Object::AdditionalInsured::SelectedAdditionalInsured)" && frm.elements[i].checked == true) {
					count++;
					break;
				}
			}
			if(count>0) {
				var ans = window.confirm('Are you sure that you want to delete the selected records?');
				if (ans)
					return true;
				else
					return false;
			} else {
				alert("Please Select any Additional Insured to Delete.");
				return false;
			}			
	}
</script>

<html:form action="/DeleteAdditionalInsured"  onsubmit="return deleteInsured()">
	
		<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
			<tr><td>&nbsp;</td></tr>			
			<tr><td>
				<jsp:include page="../common/CustomerAgencyLinkspage.jsp" /></td></tr>
				</logic:notEqual>
			<tr><td>
			
			<tr><td>&nbsp;</td></tr>
<logic:equal name="Tab_UI_View" value="UI_3.0" scope="session" >
<tr>
  <td> 
    <div  style ="font-style:bolditalic;font-size:14pt;"><%=""+CustomerName %></div>
  </td>
</tr>
</logic:equal>
			<tr><td>&nbsp;</td></tr>
			<tr>			
			<td>
			<table width="40%"><tr><td>
			<a href="../GetAdditionalInsuredDetailAction.do?TabPanelName=Insured_Panel&answer(Object::AdditionalInsured::AdditionalyNamedInsured)=N" class="button2" style="width:150px" />Add Additional Insured</a></td>
			<td><a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=""+Customerid%>" class="button2" style="width:150px" >Go To Insured Summary</a></td>
			</tr>
			</table>
			</td></tr>
		</table>
		<br>
		<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				
			<tr><td class="sectionhead" align="center" colspan="11">Additional Insured List</td></tr>
			
			<tr>		
			            <td class="sectionhead" width="6%" align="left">S.No</td>
			            <td class="sectionhead" width="15%" align="left">Additional Insured Type</td>  
			             <td class="sectionhead" width="20%" align="left">Insured  Type</td>  
						<td class="sectionhead" width="15%" align="left">Insured Name</td>
						<td class="sectionhead" width="15%" align="left" >Address1</td>
						<td class="sectionhead" width="15%" align="left" >Address2</td>
						<td class="sectionhead" width="10%" align="left" >City</td>
						<td class="sectionhead" width="7%" align="left" >State</td>
      					<td class="sectionhead" width="5%" align="left" >Select</td>	
		 </tr>
		 
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
								<td class=<%= styleClass %> align="left" width="5%"><%=++i%></td>
								<td class=<%=styleClass %> width="15%" >
								<bean:define id="additionalyNamedInsured" name="additionalInsuredList" property="Object::AdditionalInsured::AdditionalyNamedInsured" />
								<%if(additionalyNamedInsured.toString().equals("N")) { %>Insured								   
								  <%}else{%>Named Insured<%}%> 
								
								</td>  
								<td class=<%=styleClass %> align="left" width="25%"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::InsuranceType" />&nbsp;</td>
								<bean:define id="additionalInsuredID" name="additionalInsuredList" property="Object::AdditionalInsured::AdditionalInsuredID" /> 
								<td class=<%=styleClass %> align="left" width="15%"><a href="../GetAdditionalInsuredDetailAction.do?TabPanelName=Insured_Panel&answer(Object::AdditionalInsured::OwnerId)=<%=ownerId.toString()%>&answer(Object::AdditionalInsured::CustomerID)=<%=Customerid.toString()%>&answer(Object::AdditionalInsured::AdditionalInsuredID)=<%=additionalInsuredID.toString()%>&answer(Object::AdditionalInsured::AdditionalyNamedInsured)=<%=additionalyNamedInsured.toString()%>" title="<bean:message key='ToolTip.AdditionalInsured.InsuredName'/>"/><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::InsuredName" /></a>&nbsp;</td>
								<td class=<%=styleClass %> align="left" width="15%"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::Address1" />&nbsp;</td>
								<td class=<%=styleClass %> align="left" width="15%"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::Address2" />&nbsp;</td>			
								<td class=<%=styleClass %> align="left" width="10%"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::City" />&nbsp;</td>								
								<td class=<%=styleClass %> align="left" width="7%"><bean:write name="additionalInsuredList" property="Object::AdditionalInsured::State" />&nbsp;</td>													
								

									<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" scope="session"/> 
									
								<td class=<%=styleClass %> align="center" width="5%">
									<input type="checkbox" name="answer(Object::AdditionalInsured::SelectedAdditionalInsured)" value='<%=""+additionalInsuredID%>' id="additionalInsuredSelect" 	>
								</td>	
														
							</logic:iterate>			
							<tr><td>&nbsp;</td></tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
							<td>&nbsp;</td>
							</tr>											
					</logic:present>
			</table>		
			<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td width="75%">&nbsp;</td>
				 <td title="<bean:message key='ToolTip.AdditionalInsured.Delete'/>"><html:submit property="answer(formName)" value="Delete" styleClass="sbttn" /></td>
				</tr>
			</table>	
			<html:hidden property="answer(Object::AdditionalInsured::AdditionalyNamedInsured)" value="N" />
			<html:hidden property="answer(Object::AdditionalInsured::CustomerID)" value="<%=Customerid.toString()%>" />
			  <html:hidden property="answer(Object::AdditionalInsured::OwnerId)" value="<%=ownerId.toString()%>" />
			        <html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
</html:form>		
		 
		 
		 