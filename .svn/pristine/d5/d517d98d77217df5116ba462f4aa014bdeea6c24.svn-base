<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="productVerId" name="AddProduct"
	property="answer(Object::ProductVer::ProductVerId)" />
<bean:define id="productId" name="AddProduct"
	property="answer(Object::Product::ProductId)" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)"
	name="LoginPage" scope="session" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)"
	name="LoginPage" scope="session" />
<script type="text/javascript">
	function submitConfirm(){
			
			var length = document.getElementsByName("answer(Object::ProductBillingCurrency::BillingCurrencyCode)").length;
			
			var check = false;
			if(length >0)
			{
				for(i=0;i<length;i++)
				{
					if(document.getElementsByName("answer(Object::ProductBillingCurrency::BillingCurrencyCode)")[i].checked){
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
			
				var ans = window.confirm("Are you sure you need to proceed");
			
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


<html:form action="/DeactiveBillingCurrencyAction.do"
	onsubmit="return submitConfirm()">
	

	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0"
		CELLPADDING="0">
		<tr>
			<td><jsp:include page="../common/ProductHeader.jsp">
				<jsp:param name="ProductId" value="<%=productId.toString()%>" />
				<jsp:param name="ProductVerId" value="<%=productVerId.toString()%>" />
			</jsp:include></td>
		</tr>
	</table>

	

	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0"
		CELLPADDING="0">

		<tr>
			<td class="NewSectionHead" align="center" colspan="9">PRODUCT BILLING
			CURRENCY</td>
		</tr>

		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="Error" colspan="9"><logic:present name="Defaultmessage">
				<%=""+request.getAttribute("Defaultmessage") %>
			</logic:present> <logic:present name="Deactivemessage">
				<%=""+request.getAttribute("Deactivemessage") %>
			</logic:present></td>

			&nbsp;&nbsp;
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>

		<tr>
			<td class="links" colspan="3"><a
				href='../ListBillingCurrencyAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::ProductVer::ProductVerId)=<%=""+productVerId%>&answer(Object::Product::ProductId)=<%=""+productId%>'>Associate
			Billing Currency </a></td>
			<td class="links" colspan="3"><a
				href="../billing/AddBillingCurrency.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::ProductVer::ProductVerId)=<%=""+productVerId%>&answer(Object::Product::ProductId)=<%=""+productId%>">Create
			New Billing Currency </a></td>
		</tr>



		<tr>
			<td>&nbsp;</td>
		</tr>

		<tr>
			<td class="sectionheadLink" align="center" width="3%">SNo</td>
			<td class="sectionheadLink" align="center" width="20%">Billing Currency Code</td>
			<td class="sectionheadLink" align="center" width="1%">Active</td>
			<td class="sectionheadLink" align="center" width="1%">Default</td>
			<td class="sectionheadLink" align="center" width="5%">Select</td>
		</tr>

		<tr>
			<td>&nbsp;</td>
		</tr>


		<%int count = 0; %>
		<logic:present name="BillingCurrencyList" scope="request">


			<logic:iterate id="BillingCurrencyList" name="BillingCurrencyList">
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
					<td width="3%" align="center" class=<%= styleClass %>><%=""+count%></td>
					<td width="20%" align="center" class=<%= styleClass %>><bean:write
						name="BillingCurrencyList"
						property="Object::ProductBillingCurrency::BillingCurrencyCode" /></td>
					<td width="1%" align="center" class=<%= styleClass %>><bean:write
						name="BillingCurrencyList"
						property="Object::ProductBillingCurrency::Active" /> <bean:define
						id="Active" name="BillingCurrencyList"
						property="Object::ProductBillingCurrency::Active" /></td>
					<td width="20%" align="center" class=<%= styleClass %>><bean:write
						name="BillingCurrencyList"
						property="Object::ProductBillingCurrency::Default" /></td>						
					<td width="5%" align="center" class=<%= styleClass %>><% String isActive = ""+Active; 
					 			   if(isActive.equals("Y")){%> <input type="radio"
						name="answer(Object::ProductBillingCurrency::BillingCurrencyCode)"
						value='<bean:write name="BillingCurrencyList" property="Object::ProductBillingCurrency::BillingCurrencyCode"/>' />
					<%}else{ %> <input type="radio"
						name="answer(Object::ProductBillingCurrency::BillingCurrencyCode)"
						value='<bean:write name="BillingCurrencyList" property="Object::ProductBillingCurrency::BillingCurrencyCode"/>'
						disabled="disabled" /> <%} %></td>
				</tr>
			</logic:iterate>

		</logic:present>


	</table>

	<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0"
		CELLPADDING="0">
		<tr>
			
		</tr>
		<tr>
			<td align="left"><html:submit property="answer(buttonName)"
				value="Default" styleId="sbttn" /></td>
			<td align="right"><html:submit property="answer(buttonName)"
				value="DeActivate" styleId="sbttn" /></td>
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


