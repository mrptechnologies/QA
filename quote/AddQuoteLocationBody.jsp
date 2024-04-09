<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>

<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/ValidateFieldEIL.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js">
</script>

<script type="text/javascript">
function conformRemoveAction(){
   
   var removeAction = window.confirm("Are you sure you want to continue?");
  if(removeAction){
   return true;
  }else {
   return false;
  }
   
}
</script>
</head>
<bean:parameter id="custId" name="answer(Object::Customer::CustomerId)" />
<bean:parameter id="locationId" name="answer(Object::Location::LocationId)" />

<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=custId+""%>' styleId="custId" />
<html:hidden property="answer(Object::Location::LocationId)" value='<%=locationId+""%>' styleId="locationId" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<html:hidden property="answer(Object::UserDetail::ownerId)" value='<%=ownerId+""%>' styleId="ownerId" />

<html:hidden property="answer(Object::UserDetail::ownerId)" value='<%=ownerId+""%>' styleId="ownerIdfrmjsp" />
<dmshtml:get_all_risk_types nameInSession="riskTypeList" ownerId='<%=ownerId+""%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
							
<bean:define id="riskTypeList" name="riskTypeList" type="java.util.ArrayList"/>
<% com.dms.ejb.customer.DMSCustomerDetail detail = new com.dms.ejb.customer.DMSCustomerDetail(); %>	
<dmshtml:Get_Customer_Detail_ByCustomerId nameInSession="customerDetail1" customerId="<%=custId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
<logic:present name="customerDetail1" scope="request">
	<%
		Object obj=request.getAttribute("customerDetail1");
	    detail = (com.dms.ejb.customer.DMSCustomerDetail)obj;
	%>
</logic:present>
<html:hidden property="answer(custState)" value='<%=detail.getCustomerState()%>' styleId="custState" />
<html:hidden property="answer(custCity)" value='<%=detail.getMCity()%>' styleId="custCity" />
<html:hidden property="answer(custCounty)" value='<%=detail.getMCounty()%>' styleId="custCounty" />
<html:hidden property="answer(custCounty)" value='<%=detail.getMZip()%>' styleId="custZip" />
<html:hidden property="answer(custStName)" value='<%=detail.getStreetName()%>' styleId="custStName" />
<html:hidden property="answer(custStNo)" value='<%=detail.getStreetNumber()%>' styleId="custStNo" />
<html:hidden property="answer(custAdd2)" value='<%=detail.getMAddress2()%>' styleId="custAdd2" />
<html:hidden property="answer(custAdd1)" value='<%=detail.getMAddress1()%>' styleId="custAdd1" />

<bean:define id="locId" property="answer(Object::Location::LocationId)" name="AddRisk" />		
<bean:define id="IsApplicationDisabled" property="answer(IsApplicationDisabled)" name="AddRisk" />	
<bean:define id="groupId" property="answer(prdGroupId)" name="AddRisk" />		
<bean:define id="groupVerId" property="answer(prdGroupVerId)" name="AddRisk" />		
<bean:define id="productStatus" property="answer(productStatus)" name="AddRisk" />		
<bean:define id="productId" property="answer(productId)" name="AddRisk" />		
<bean:define id="productVerId" property="answer(productVerId)" name="AddRisk" />		
<bean:define id="customerId" property="answer(CustomerId)" name="AddRisk" />		
<bean:define id="subQuoteId" property="answer(subQuoteId)" name="AddRisk" />
<bean:define id="parentQuoteId" property="answer(ParentQuoteId)" name="AddRisk" />	
<bean:define id="parentQuoteVerId" property="answer(ParentQuoteVerId)" name="AddRisk" />		
<bean:define id="agencyId" property="answer(Object::Agency::AgencyId)" name="AddRisk" />		
<bean:define id="FamilyId" property="answer(FamilyId)" name="AddRisk" />
<html:hidden property="answer(FamilyId)" value='<%=FamilyId+""%>' styleId="FamilyId" />
<html:hidden property="answer(parentQuoteId)" value='<%=parentQuoteId+""%>' styleId="parentQuoteId" />
<html:hidden property="answer(parentQuoteVerId)" value='<%=parentQuoteVerId+""%>' styleId="parentQuoteVerId" />		
<html:hidden property="answer(productVerId)" value='<%=productVerId+""%>' styleId="productVerId" />		
<html:hidden property="answer(subQuoteId)" value='<%=subQuoteId+""%>' styleId="subQuoteId" />		
<html:hidden property="answer(customerId)" value='<%=customerId+""%>' styleId="customerId" />		
<html:hidden property="answer(productId)" value='<%=productId+""%>' styleId="productId" />
<html:hidden property="answer(groupId)" value='<%=groupId+""%>' styleId="groupId" />
<html:hidden property="answer(groupVerId)" value='<%=groupVerId+""%>' styleId="groupVerId" />
<html:hidden property="answer(productStatus)" value='<%=productStatus+""%>' styleId="productStatus" />	
<html:hidden property="answer(subQuoteId)" value='<%=subQuoteId+""%>' styleId="subQuoteId" />	
<html:hidden property="answer(IsApplicationDisabled)" value='<%=IsApplicationDisabled+""%>' styleId="IsApplicationDisabled" />
<html:hidden property="answer(agencyId)" value='<%=agencyId+""%>' styleId="agencyId" />


<%
	
	String ApplicationStatus = ""+IsApplicationDisabled;
	String applicationEnabled = "N";
	if(IsApplicationDisabled.equals("N")){
		applicationEnabled = "Y";
		
	}

%>
<html:hidden property="answer(Object::Location::LocationId)" value='<%=locId+""%>' styleId="locId" />		


	<table width="100%">
	<tr>
		<td colspan="2">
			<table width="100%" align="center" border="0">
				<tr>
					<td>
						<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<table width="100%" align="center" border="0">
				<!-- tr>
				<td>
					<table width="60%" align="Left" border="0" -->
					
						<jsp:include page="../common/QuoteHeader.jsp" >
							<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
							<jsp:param name="productVerId" value="<%=""+productVerId%>" />
							<jsp:param name="heading" value="<%="QUOTE/LOCATION APPLICATION"%>" />	
						</jsp:include>
					
					<!-- /table>
				</td>
			</tr -->
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<table width="100%" align="center" border="0">		
				<jsp:include page="../common/QuotePlanInfoHeader.jsp" >
					<jsp:param name="subQuoteId" value="<%=""+subQuoteId%>" />	
					<jsp:param name="customerId" value="<%=""+customerId%>" />	
					<jsp:param name="productId" value="<%=""+productId%>" />	
					<jsp:param name="productVerId" value="<%=""+productVerId%>" />
					<jsp:param name="prdGroupId" value="<%=""+groupId%>" />	
					<jsp:param name="prdGroupVerId" value="<%=""+groupVerId%>" />
					<jsp:param name="productStatus" value="<%=""+productStatus%>" />
					<jsp:param name="stateCode" value="<%=""%>"/>
				</jsp:include>
			</table>
		</td>
	</tr>
		<tr>
			<td>
				<a  href="../GetQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>">Quote Summary</a>
			</td>
		</tr>
		<tr>
			<td>
			&nbsp;
			</td>
		</tr>
		
	
<!-- <table>
	<tr>
		
	</tr>
</table> -->

<!-- <table>
	<tr>
		<td class="error">
			<html:text style="display:none; border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" styleId="MultipleZipError" disabled="disabled" property="answer(temp)" value="Test Error Message Fro Zip Code" styleClass="txtbox" readonly="true" size="60" maxlength="60" />
		</td>
	</tr>
</table> -->
<tr>
<td>

</td>
 </tr>
								
</table>
	<dmshtml:DisplayApplication nameInSession="Application"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
	objectVerId="0" objectName='<%="LOCATION"%>' applicationType="LOCATION" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveQuoteEILRiskApplicationAction.go?" isApplicationEnabled='<%=""+applicationEnabled %>'  showOneTabAtTime="N"/>
<logic:present name="Application" scope="request">

	<bean:define id="htmlPage" name="Application"
		type="java.lang.StringBuffer" />
		<%out.println(htmlPage.toString());%>
</logic:present>
	<logic:notPresent name="Application" scope="request">
		<html:text style="border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" disabled="disabled" property="answer(Object::Risk::ErrorHandler)" value="Wrong Territory was associated with the Risk" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		

	</logic:notPresent>

<form name="form1" id="formid1">
<table>
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>

	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	
	<tr>
		<td>
	
 <p>	<span id="messageHoldernew" style="{z-index: 1000; background:red; color:white; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span></p>
		
		</td>
	</tr>
</table>
<script>
function showFormName(formname){
alert(formname.id)

}

</script>
</form>

<!-- Div for Pop-up -->
<script>
	
	isSpecificValidationNeeded = true;
	
	function doSpecificValidation(frm){
		 if(document.Location.Use_of_Facility.value==""){
  
  			alert("Please select Use Of Facility");
			return false;
  
  		}
	
		if(!document.Location.Owner_Type[0].checked && !document.Location.Owner_Type[1].checked){
			alert('Please select Owned or Leased');
			return false;
		}
		
		if(frm.name!="Location"){		
			if(doValidateTank(frm)){
				return true;
			}else{
				return false;
			}
		}
		return true;
	}

		
</script>



<!-- <SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/RiskApplication.js">
</script> -->