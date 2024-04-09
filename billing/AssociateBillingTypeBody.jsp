<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="productId"
	property="answer(Object::Product::ProductId)" name="ListBillingType" />
<bean:define id="productVerId"
	property="answer(Object::ProductVer::ProductVerId)"
	name="ListBillingType" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)"
	name="LoginPage" scope="session" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)"
	name="LoginPage" scope="session" />

<script type="text/javascript">
	function associateConfirm(){
			
			var length = document.getElementsByName("answer(Object::ProductBillingType::BillingType)").length;
			
			var check = false;
			if(length >0)
			{
				for(i=0;i<length;i++)
				{
					if(document.getElementsByName("answer(Object::ProductBillingType::BillingType)")[i].checked){
				    	check = false;
				    	i=length+1;
					}else{
				   	 	check = true; 
					}
				}
			
				if(check)
				{
				 alert("Please select any row");
			     return false;
				}
			
				var ans = window.confirm("Are you sure you need to Associate");
			
				if(ans){
			     	return true;
			 	}else{
			 	 	return false;
			 	}	 	    
			}	
			else
			{	 	    
				alert("No records found");
			    return false;
			}
	}
	
</script>

<html:form action="/AssociateBillingTypeAction.do"
	onsubmit="return associateConfirm()">

	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0"
		CELLPADDING="0">

		<tr>
			<td>&nbsp;</td>
		</tr>

		<tr>
			<td class="NewSectionHead" align="center" colspan="9">ASSOCIATE
			BILLING TYPE</td>
		</tr>

		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="Error" colspan="3">&nbsp; <logic:present name="message">
				<%=""+request.getAttribute("message") %>
			</logic:present> <logic:present name="AddedMessage">
				<%=""+request.getAttribute("AddedMessage") %>
			</logic:present></td>
		</tr>


		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="links" colspan="3"><a
				href="../billing/AddBillingType.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::ProductVer::ProductVerId)=<%=""+productVerId%>&answer(Object::Product::ProductId)=<%=""+productId%>">Create
			New Billing Type </a></td>
		</tr>

		<tr>
			<td>&nbsp;</td>
		</tr>

		<tr>
			<td class="sectionhead" width="3%" align="center">No.</td>
			<td class="sectionhead" width="15%" align="center">Billing Type</td>
			<td class="sectionhead" width="15%" align="center">Description</td>
			<td class="sectionhead" width="15%" align="center">Invoice Template</td>
			<td class="sectionhead" width="20%" align="center">Invoice Template
			Type</td>
			<td class="sectionheadLink" align="center" width="1%">Active</td>
			<td class="sectionheadLink" align="center" width="5%">Select</td>
		</tr>

		<tr>
			<td>&nbsp;</td>
		</tr>

		<%int count = 0; %>

		<logic:present name="BillingTypeDetailList" scope="request">

			<logic:iterate id="BillingTypeDetailList"
				name="BillingTypeDetailList">
				<%++count; %>

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
					<td width="3%" align="center" class=<%= styleClass %>><%=""+count%></td>
					<td width="15%" align="center" class=<%= styleClass %>><bean:write
						name="BillingTypeDetailList"
						property="Object::ProductBillingType::BillingType" /></td>
					<td width="15%" align="center" class=<%= styleClass %>><bean:write
						name="BillingTypeDetailList"
						property="Object::ProductBillingType::BillingDescription" /></td>
					<td width="15%" align="center" class=<%= styleClass %>><bean:write
						name="BillingTypeDetailList"
						property="Object::ProductBillingType::InvoiceTemplate" /></td>
					<td width="20%" align="center" class=<%= styleClass %>><bean:write
						name="BillingTypeDetailList"
						property="Object::ProductBillingType::InvoiceTemplateType" /></td>
					<td width="1%" align="center" class=<%= styleClass %>><bean:write
						name="BillingTypeDetailList"
						property="Object::ProductBillingType::Active" /> <bean:define
						id="billingTypeActive" name="BillingTypeDetailList"
						property="Object::ProductBillingType::Active" /></td>


					<td width="5%" align="center" class=<%= styleClass %>><% String isActive = ""+billingTypeActive; 
					    if(isActive.equals("Y")){%> <input type="radio" align="left"
						name="answer(Object::ProductBillingType::BillingType)"
						value='<bean:write name="BillingTypeDetailList" property="Object::ProductBillingType::BillingType"/>' />
					<%}else{ %> <input type="radio" align="left"
						name="answer(Object::ProductBillingType::BillingType)"
						value='<bean:write name="BillingTypeDetailList" property="Object::ProductBillingType::BillingType"/>'
						disabled="disabled" /> <%} %></td>
				</tr>
			</logic:iterate>

		</logic:present>
	</table>

	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0"
		CELLPADDING="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td align="right"><html:submit property="answer(buttonName)"
				value="Associate" styleId="sbttn" /></td>
		</tr>
	</table>

	<html:hidden property="answer(Object::Product::ProductId)"
		value="<%=""+productId %>" />
	<html:hidden property="answer(Object::ProductVer::ProductVerId)"
		value="<%=""+productVerId %>" />
	<html:hidden property="answer(Object::Product::userName)"
		value="<%=""+userId %>" />
	<html:hidden property="answer(Object::Product::ownerId)"
		value="<%=""+ownerId %>" />
	<html:hidden property="TabPanelName"
		value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>



