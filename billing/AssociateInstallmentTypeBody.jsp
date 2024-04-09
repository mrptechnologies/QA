<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="productId"
	property="answer(Object::Product::ProductId)" name="ListInstallmentType" />
<bean:define id="productVerId"
	property="answer(Object::ProductVer::ProductVerId)"
	name="ListInstallmentType" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)"
	name="LoginPage" scope="session" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)"
	name="LoginPage" scope="session" />

<script type="text/javascript">
	function associateConfirm(){
			
			var length = document.getElementsByName("answer(Object::ProductInstallmentType::InstallmentType)").length;
			
			var check = false;
			if(length > 0)
			{
				for(i=0;i<length;i++)
				{
					if(document.getElementsByName("answer(Object::ProductInstallmentType::InstallmentType)")[i].checked ){
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

<html:form action="/AssociateInstallmentTypeAction.do"
	onsubmit="return associateConfirm()">

	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0"
		CELLPADDING="0">



		<tr>
			<td>&nbsp;</td>
		</tr>

		<tr>
			<td class="NewSectionHead" align="center" colspan="9">ASSOCIATE
			INSTALLMENT TYPE</td>
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
				href="../billing/AddInstallmentType.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::ProductVer::ProductVerId)=<%=""+productVerId%>&answer(Object::Product::ProductId)=<%=""+productId%>">Create
			New Installment Type </a></td>
		</tr>

		<tr>
			<td>&nbsp;</td>
		</tr>

		<tr>
			<td class="sectionhead" width="3%" align="center">No.</td>
			<td class="sectionhead" width="15%" align="center">Installment Type</td>
			<td class="sectionhead" width="15%" align="center">Number Of
			Installments</td>
			<td class="sectionhead" width="15%" align="center">Initial Payment
			Percentage</td>
			<td class="sectionhead" width="15%" align="center">Installment Fee</td>
			<td class="sectionhead" width="15%" align="center">Installment Fee
			Method</td>
			<td class="sectionhead" width="15%" align="center">Installment Fee
			Type</td>
			<td class="sectionheadLink" align="center" width="1%">Active</td>
			<td class="sectionheadLink" align="center" width="5%">Select</td>
		</tr>

		<tr>
			<td>&nbsp;</td>
		</tr>

		<%int count = 0; %>

		<logic:present name="InstallmentTypeDetailList" scope="request">

			<logic:iterate id="InstallmentTypeDetailList"
				name="InstallmentTypeDetailList">
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
						name="InstallmentTypeDetailList"
						property="Object::ProductInstallmentType::InstallmentType" /></td>
					<td width="15%" align="center" class=<%= styleClass %>><bean:write
						name="InstallmentTypeDetailList"
						property="Object::ProductInstallmentType::NumberOfInstallments" /></td>
					<td width="15%" align="center" class=<%= styleClass %>><bean:write
						name="InstallmentTypeDetailList"
						property="Object::ProductInstallmentType::InitialPaymentPercentage" /></td>
					<td width="20%" align="center" class=<%= styleClass %>><bean:write
						name="InstallmentTypeDetailList"
						property="Object::ProductInstallmentType::InstallmentFee" /></td>
					<td width="20%" align="center" class=<%= styleClass %>><bean:write
						name="InstallmentTypeDetailList"
						property="Object::ProductInstallmentType::InstallmentFeeMethod" /></td>
					<td width="20%" align="center" class=<%= styleClass %>><bean:write
						name="InstallmentTypeDetailList"
						property="Object::ProductInstallmentType::InstallmentFeeType" /></td>
					<td width="1%" align="center" class=<%= styleClass %>><bean:write
						name="InstallmentTypeDetailList"
						property="Object::ProductInstallmentType::Active" /> <bean:define
						id="installmentTypeActive" name="InstallmentTypeDetailList"
						property="Object::ProductInstallmentType::Active" /></td>


					<td width="5%" align="center" class=<%= styleClass %>><% String isActive = ""+installmentTypeActive; 
					    if(isActive.equals("Y")){%> <input type="radio" align="left"
						name="answer(Object::ProductInstallmentType::InstallmentType)"
						value='<bean:write name="InstallmentTypeDetailList" property="Object::ProductInstallmentType::InstallmentType"/>' />
					<%}else{ %> <input type="radio" align="left"
						name="answer(Object::ProductInstallmentType::InstallmentType)"
						value='<bean:write name="InstallmentTypeDetailList" property="Object::ProductInstallmentType::InstallmentType"/>'
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



