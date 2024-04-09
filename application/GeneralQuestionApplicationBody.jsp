<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<script type="text/javascript" src="../Scripts/JScripts/Common.js">
</script>

<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js">
</script>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>


<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/QuoteSummaryUI3.js"></script>


<script type="text/javascript">
function setDefault(frm){

	/**
     * To set the Address1
     */
    
	 if(frm.StreetName!=null && frm.StreetName!= undefined && frm.StreetNumber!=null && frm.StreetNumber!= undefined ) {
	        frm.Address1.value=frm.StreetNumber.value+" "+frm.StreetName.value;
	        
	        
	 }

	return true;
	
}
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

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<bean:define id="parentQuoteId" name="Application" property="answer(ParentQuoteId)" scope="request" />
<bean:define id="ProductId" name="Application" property="answer(productId)" scope="request" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />

<bean:define id="isApplicationEnabled" name="Application" property="answer(isApplicationEnabled)" scope="request" />
<bean:define id="productVerId" name="Application" property="answer(productVerId)" scope="request" />
<bean:define id="SubQuoteId" name="Application" property="answer(SubQuoteId)" scope="request" />
<bean:define id="customerId" name="Application" property="answer(customerId)" scope="request" />
<bean:define id="prdGroupId" name="Application" property="answer(prdGroupId)" scope="request" />
<bean:define id="prdGroupVerId" name="Application" property="answer(prdGroupVerId)" scope="request" />
<bean:define id="productStatus" name="Application" property="answer(productStatus)" scope="request" />
<bean:define id="CustomerState" name="Application" property="answer(State)" scope="request" />
<bean:define id="agencyId" name="Application" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="parentquoteverd" property="answer(Object::Quote::QuoteVerId)" name="Application" scope="request" />
<bean:define id="policyVerId" name="Application" property="answer(Object::Policy::ParentPolicyVerId)"  />
<bean:define id="policyId" name="Application" property="answer(Object::Policy::ParentPolicyId)" />
<bean:define id="policyNumber" name="Application" property="answer(policyNumber)" />
<bean:define id="IsApplicationDisabled" name="Application" property="answer(IsApplicationDisabled)" />
<bean:define id="stateCode" name="Application" property="answer(State)" />
<bean:define id="paretQuoteStatus" name="Application" property="answer(Object::Quote::QuoteStatus)" />

<html:hidden name="Application" property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" styleId="parentQuoteId"/>
<html:hidden name="Application" property="answer(ProductId)" value="<%=ProductId.toString()%>" />
<html:hidden name="Application" property="answer(productVerId)" value="<%=productVerId.toString()%>" />
<html:hidden name="Application" property="answer(SubQuoteId)" value="<%=SubQuoteId.toString()%>" />
<html:hidden name="Application" property="answer(customerId)" value="<%=customerId.toString()%>" />
<html:hidden name="Application" property="answer(prdGroupId)" value="<%=prdGroupId.toString()%>" />
<html:hidden name="Application" property="answer(prdGroupVerId)" value="<%=prdGroupVerId.toString()%>" />
<html:hidden name="Application" property="answer(productStatus)" value="<%=productStatus.toString()%>" />
<html:hidden name="Application" property="answer(CustomerState)" value="<%=CustomerState.toString()%>" />
<%
String isApplicationEnabled1 = "N";
if(isApplicationEnabled.equals("N")){
	
	isApplicationEnabled1 = "Y";
}

String isRenewal="";
if(request.getParameter("isRenewal")!=null)
{
	isRenewal=request.getParameter("isRenewal");
}			

%>
<table width="100%">
<logic:notEqual name="Tab_UI_View" value="" scope="session" >
<tr>
		<td colspan="2">
			<table width="100%" align="center" border="0">
				<tr>
					<td>
						<div id="QuoteInsuerdAgencyAgentHeader">
							<jsp:include page="../common/QuoteInsuredAgencyLink.jsp">
							<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
							<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus%>" />
							</jsp:include>
						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</logic:notEqual>
<dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="RISK_AVAILABLE" />

<tr>
		<td colspan="2">
			<table width="100%" align="center" border="0">
				<!-- tr>
				<td>
					<table width="60%" align="Left" border="0" -->
					<tr>
						<td align="left" colspan=2>
							<table width="950px" align="left" border="0" >
								<tr>
								<td class="NewSectionHead" align="center">QUOTE APPLICATION</td>
								</tr>
							</table>
						</td>
					</tr>
					<logic:notEqual name="Tab_UI_View" value="" scope="session" >							
					 	<tr>
							<td align="left">	
								<jsp:include page="../common/EndorsementQuoteHeader.jsp">
									<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
									<jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
								</jsp:include>	
							</td>
						</tr>
					  </logic:notEqual>					
				</table>
		</td>
	</tr>


	<tr>
		<td colspan="2">
			<table width="100%" align="left" border="0">
				<jsp:include page="../common/QuotePlanInfoHeader.jsp" >
					<jsp:param name="subQuoteId" value="<%=""+SubQuoteId%>" />	
					<jsp:param name="customerId" value="<%=""+customerId%>" />	
					<jsp:param name="productId" value="<%=""+ProductId%>" />	
					<jsp:param name="productVerId" value="<%=""+productVerId%>" />
					<jsp:param name="prdGroupId" value="<%=""+prdGroupId%>" />	
					<jsp:param name="prdGroupVerId" value="<%=""+prdGroupVerId%>" />
					<jsp:param name="productStatus" value="<%=""+productStatus%>" />
					<jsp:param name="stateCode" value="<%=""%>" />
				</jsp:include>
			</table>
		</td>
 	</tr>

<tr>
								 	<td class="Error">
										<logic:present name="MESSAGE_LIST" scope="request">
											<ul>
												<logic:iterate id="message" name="MESSAGE_LIST">
													<li><bean:write name="message"/></li>
												</logic:iterate>
											</ul>			
										</logic:present>
									</td>
								</tr>
	<tr>
		<td class="links" width="110px" align="left">
			<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(QuoteId)=<%=""+parentQuoteId%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>&answer(Object::Policy::ParentPolicyId)=<%=""+policyId%>&answer(policyNumber)=<%=""+policyNumber%>">Quote Summary</a>			
		</td>
		
<bean:define id="parentPolicyId" name="Application" property="answer(Object::Policy::ParentPolicyId)" />
<bean:define id="parentPolicyVerId" name="Application" property="answer(Object::Policy::ParentPolicyVerId)" />		
<bean:define id="policyNumber" name="Application" property="answer(policyNumber)" />
	
		
			<td align="left">
		 			</td>
	</tr>
	<tr>
		
	</tr>
	<tr>
		<td align="left">
				<!-- <input type="button" onclick="showTab()" name="Add Additional Insured" value="Add Additional Insured" />  -->
			</td>
	</tr>
	<html:hidden property="answer(ownerId)" value="<%=""+ownerId %>" styleId="ownerIdfrmjsp"/>
	
	<tr>
		<td width="100%"> 
		



<dmshtml:DisplayApplication nameInSession="Application"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
objectVerId="0" objectName='<%="GENERAL QUESTION"%>' applicationType="QUOTE" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveGeneralQuestionApp.go?" isApplicationEnabled='<%=""+isApplicationEnabled1 %>'  showOneTabAtTime="N"/>
<logic:present name="Application" scope="request">

<bean:define id="htmlPage" name="Application"
		type="java.lang.StringBuffer" />
		<%out.println(htmlPage.toString());%>
</logic:present>
<logic:notPresent name="Application" scope="request">
<html:text style="border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" disabled="disabled" property="answer(Object::Risk::ErrorHandler)" value="Wrong Territory was associated with the Risk" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		

</logic:notPresent>
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>

		</td>
	</tr>
		</table>



<script type="text/javascript">
isSpecificValidationNeeded = false;
if (document.forms[0].Zip != null && document.forms[0].Zip != undefined){
var zipFromUI = document.forms[0].Zip.value;
}
</script>

<script type="text/javascript">
if(document.getElementById("quoteHeaderLink") != null && document.getElementById("quoteHeaderLink") != undefined) {
	document.getElementById("quoteHeaderLink").onclick = function(){
	
		showHideHeader();
		var a = document.getElementById('Quote:TxtChange');
		var b = a.innerHTML;
		if(b == "Click here to hide detail") {
			document.getElementById('quoteheader_inner').style.height = "10em";
		}
		else {
			document.getElementById('quoteheader_inner').style.height = "1em";
		}
	}
}
if(document.getElementById("planHeaderLink") != null && document.getElementById("planHeaderLink") != undefined) {
	document.getElementById("planHeaderLink").onclick = function(){
	
		showHidePlanHeader();
		var a = document.getElementById('Plan:TxtChange');
		var b = a.innerHTML;
		if(b == "Click here to hide detail") {
			document.getElementById('planheader_inner').style.height = "19em";
		}
		else {
			document.getElementById('planheader_inner').style.height = "1em";
		}
	}
}
</script>