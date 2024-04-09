<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<script type="text/javascript">

	function validateDate(){
	
var daysInMonth = DaysArray(12);
var x = document.getElementById("ratingtable").rows.length;
for(j=0;j<x-2;j++){
var retrodatekey = "Object::Plan::RequestedRetroDate::"+j;
var id449    = document.getElementById(retrodatekey);
		if(id449 !=null && id449 !=undefined){
			var retroDate = id449.value;
			for(i=0;i<retroDate.length;i++){
				var vardate = retroDate;
				if(retroDate!=""){
				var elem = id449;
				}
				if (vardate=="")
				{
					alert("Please enter the Retro Date");
					elem.focus();                                          
					elem.style.background='#FFCC33';
					return false;
				}
				if(vardate.length != 10){
					alert("Please enter date in 'MM/DD/YYYY' format");
					elem.focus();
					elem.style.background='#FFCC33';
					return false;
				}
				var dmonth = vardate.substring(0, 2);
				var dday = vardate.substring(3, 5);
				var dyear = vardate.substring(6, 10);

				if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || (dmonth==2 && dday>daysInFebruary(dyear)) || dday > daysInMonth[dmonth] || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
				{
					alert("Please enter date in 'MM/DD/YYYY' format");
					elem.focus();
					elem.style.background='#FFCC33';
					return false;
				}
				if(dyear <= 0) {
					alert("Please enter valid year");
					elem.focus();
					elem.style.background='#FFCC33';
					return false;
				}
			}

			if(retroDate.length == 0){
			var vardate = retroDate;
				var elem = id449;
				if (vardate=="")
				{
					alert("Please enter the Retro Date");
					elem.focus();
					elem.style.background='#FFCC33';
					return false;
				}
				if(vardate.length != 10){
					alert("Please enter date in 'MM/DD/YYYY' format");
					elem.focus();
					elem.style.background='#FFCC33';
					return false;
				}
				var dmonth = vardate.substring(0, 2);
				var dday = vardate.substring(3, 5);
				var dyear = vardate.substring(6, 10);

				if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || (dmonth==2 && dday>daysInFebruary(dyear)) || dday > daysInMonth[dmonth] || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
				{
					alert("Please enter date in 'MM/DD/YYYY' format");
					elem.focus();
					elem.style.background='#FFCC33';
					return false;
				}
				if(dyear <= 0) {
					alert("Please enter valid year");
					elem.focus();
					elem.style.background='#FFCC33';
					return false;
				}
			}
		}
	var expiryDateKey = "Object::Plan::ExpirationDate::"+j;
	var id447    = document.getElementById(expiryDateKey);
			if(id447 !=null && id447 !=undefined){
				var anniversaryDate = id447.value;
				for(i=0;i<anniversaryDate.length;i++){
					
					var vardate = anniversaryDate;
					var elem1 = id447;
					
					if (vardate=="")
					{
						alert("Please enter the Anniversary Date");
						elem1.focus();
						elem1.style.background='#FFCC33';
						return false;
					}
					if(vardate.length != 10){
						alert("Please enter date in 'MM/DD/YYYY' format");
						elem1.focus();
						elem1.style.background='#FFCC33';
						return false;
					}
					var dmonth = vardate.substring(0, 2);
					var dday = vardate.substring(3, 5);
					var dyear = vardate.substring(6, 10);

					if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || (dmonth==2 && dday>daysInFebruary(dyear)) || dday > daysInMonth[dmonth] || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
					{
						alert("Please enter date in 'MM/DD/YYYY' format");
						elem1.focus();
						elem1.style.background='#FFCC33';
						return false;
					}

					if(dyear <= 0) {
						alert("Please enter valid year");
						elem1.focus();
						elem1.style.background='#FFCC33';
						return false;
					}
				}
				if(anniversaryDate.length == 0){
					var vardate = anniversaryDate;
					var elem1 = id447;
					if (vardate=="")
						{
							alert("Please enter the Anniversary Date");
							elem1.focus();
							elem1.style.background='#FFCC33';
							return false;
						}
						if(vardate.length != 10){
							alert("Please enter date in 'MM/DD/YYYY' format");
							elem1.focus();
							elem1.style.background='#FFCC33';
							return false;
						}
						var dmonth = vardate.substring(0, 2);
						var dday = vardate.substring(3, 5);
						var dyear = vardate.substring(6, 10);

						if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || (dmonth==2 && dday>daysInFebruary(dyear)) || dday > daysInMonth[dmonth] || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
						{
							alert("Please enter date in 'MM/DD/YYYY' format");
							elem1.focus();
							elem1.style.background='#FFCC33';
							return false;
						}
						if(dyear <= 0) {
							alert("Please enter valid year");
							elem1.focus();
							elem1.style.background='#FFCC33';
							return false;
						}

					}
			}
			var premiumKey = "Object::Tank::OverridedPremium::"+j;
			var id809    = document.getElementById(premiumKey);
			if(id809 !=null && id809 !=undefined){
			var overridedPremium = id809.value;
			var dollar = overridedPremium;
			var premium = overridedPremium;
			var elem2 = id809;
			if(overridedPremium.length == 0){
				alert("Please enter the Overrided Premium");
				elem2.focus();
				elem2.style.background='#FFCC33';
				return false;
			}else if(overridedPremium.length==1){
				dollar = overridedPremium.substring(0, 1);
				if(dollar!='$'){
					if(isNaN(dollar) || dollar==" "){
						alert("Please enter valid Premium");
						elem2.focus();
						elem2.style.background='#FFCC33';
						return false;
					}
				}else if(dollar=='$'){
					alert("Please enter Premium Amount");
					elem2.focus();
					elem2.style.background='#FFCC33';
					return false;
				}		
			}else if(overridedPremium.length>1){
				dollar = overridedPremium.substring(0, 1);
				if(dollar!='$'){
					if(isNaN(dollar)){
						alert("Please enter valid Premium");
						elem2.focus();
						elem2.style.background='#FFCC33';
						return false;
					}
				}	
				premium = overridedPremium.substring(1, overridedPremium.length);
				if(isNaN(premium)){
				alert("Please enter valid Premium");
				elem2.focus();
				elem2.style.background='#FFCC33';
				return false;
				}			
			}
		}
			
	}
	}
	function daysInFebruary (year){
	    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}
function DaysArray(n) {
	for (var i = 1; i <= n; i++) {
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) {this[i] = 29}
   } 
   return this
}

</script>
<bean:define id="parentQuoteId" name="EndorsementDetail" property="answer(parentQuoteId)" scope="request"/>
<bean:define id="parentQuoteVerId" name="EndorsementDetail" property="answer(ParentQuoteVerId)" scope="request"/>
<bean:define id="subQuoteId" name="EndorsementDetail" property="answer(subQuoteId)" scope="request"/>

<bean:define id="productId" name="EndorsementDetail" property="answer(productId)" scope="request"/>
<bean:define id="productVerId" name="EndorsementDetail" property="answer(productVerId)" scope="request"/>
<bean:define id="customerId" name="EndorsementDetail" property="answer(customerId)" scope="request"/>
<bean:define id="agencyId" name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" scope="request"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="policyNumber" name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" />
<bean:define id="parentPolicyId" name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" scope="request"/>
<bean:define id="paretQuoteStatus" name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" />
<bean:parameter name="answer(Object::Policy::ParentPolicyVerId)" id="policyVerId" />

<%	String isRenewal = "";
	if(request.getParameter("isRenewal") != null) {
		isRenewal = request.getParameter("isRenewal"); 
	}
%>

<table width="98%">
	
	<tr>
		<td colspan="2">
			<table width="100%" align="left" border="0" bgcolor="#C6DEEA">
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
	<tr>
		<td align="left" colspan=2>
			<table width="100%" align="left" border="0" >
				<tr>
					<td class="NewSectionHead" align="center">RATING DETAIL</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
		<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0"
			CELLPADDING="0">
			<tr>
				<td>
				<%if(isRenewal.equals("true")){ %>
					<jsp:include page="../common/DynamicPolicyHeader.jsp">
						<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
						<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
						<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
						<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
						<jsp:param name="title" value="<%="EXPIRING POLICY SUMMARY"%>" />
					</jsp:include>
				<%} else {%>
					<jsp:include page="../common/DynamicPolicyHeader.jsp">
						<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
						<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
						<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
						<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
						<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
					</jsp:include>
				<%} %>
				</td>
			</tr>		
			<tr>
			<td align="left">
				<jsp:include page="../common/EndorsementQuoteHeader.jsp">
					<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
					<jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
				</jsp:include>
			</td>
		</tr>
		</table>
		</td>
	</tr>
	
	
</table>

<table width="90%">
  
   
   <tr>
   	<td>
   	
   		<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(QuoteId)=<%=""+parentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Quote Summary</a>			
   	
   	</td>
   </tr>
   <tr>
   <td>
   	&nbsp;
   </td>
   </tr>
   <tr>
		<td ALIGN="center" class="sectionhead" colspan="2">
		Rating Details
		</td>
	</tr>
	<tr>
   <td>
   	&nbsp;
   </td>
   </tr>
	<tr>
	<td align="center">
    	<html:form action="/ModifyEndorsementRatingDetail.do" onsubmit="return validateDate()">
			<!-- Hidden fields for Going to Quote SummaryPage after submission BEGIN-->
				
				<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=""+policyVerId%>"/>
				<html:hidden property="answer(Object::Policy::ParentPolicyId)" value="<%=""+parentPolicyId%>"/>
				<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>"/>
				<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=""+agencyId%>"/>
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
				<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>"/>
				<html:hidden property="answer(QuoteId)" value="<%=parentQuoteId.toString()%>"/>
				<html:hidden property="answer(subQuoteId)" value="<%=subQuoteId.toString()%>"/>
				<html:hidden property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>"/>
				<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyId.toString()%>"/>
				<html:hidden property="answer(Object::Quote::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
				<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>"/>
				<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>"/>
				<input type="hidden" name="requestType" value="<%=request.getParameter("requestType")%>"/>
				<html:hidden property ="answer(pagename)" value="Rating Detail" />
				<html:hidden property="answer(isUpdated)" value="Y" />
				<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
				<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
				<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>"/>
				<!-- For adding user modified documents -->
				<%if(request.getParameter("answer(Object::Quote::PrevSubQuoteVerId)") != null){%>	
					<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value='<%=""+request.getParameter("answer(Object::Quote::PrevSubQuoteVerId)")%>'/>
				<%}%>

			<!-- Hidden fields for Going to Quote SummaryPage after submission END-->
			<table width="100%" align="left" cellspacing="4" cellpadding="4" border="0" id="ratingtable">
		
				<logic:present name="EMPLOYE_EELECTION_HTML" scope="request">
				<bean:define id="htmlPage" name="EMPLOYE_EELECTION_HTML"
					type="java.lang.StringBuffer" />
				<%out.println(htmlPage.toString());%>
				<%if(!htmlPage.toString().equals("")) {%>
				<dmshtml:dms_isPresent negated="true" property="<%=new String[]{"In Progress","Referred"}%>" value="<%=""+paretQuoteStatus%>" >
				
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OVERRIDE_DEDUCTIBLE"}%>' connector='or' negated="true">
						<tr>
							<td colspan="10" align="center">
							<input type="submit" value="Save" class="sbttn">
							</td>
						</tr>
						</dmshtml:dms_static_with_connector>
					</dmshtml:dms_isPresent>
				


						<%}%>
		</logic:present>
		
		</table>
		
		
	</html:form>
	</td>
	</tr>
</table>

<script type="text/javascript">
	var a = document.getElementById('priorpolicyheadernav');
	if((a != null) && (a != undefined))
		a.id = 'policyheadernav';


function enableOverridePremium(obj){
    
	var index = obj.id + "";
	index = index.replace("Object::TankPremium::Override::", "");
	var textBoxID = "Object::Tank::OverridedPremium::" + index;
	if(obj.value == "N"){
		document.getElementById(textBoxID).setAttribute("readonly", "readonly");
    document.getElementById(textBoxID).className = "blackfont";
	}
	else if(obj.value == "Y"){
		document.getElementById(textBoxID).removeAttribute("readonly");
    document.getElementById(textBoxID).className = "redfont";
	}

}

</script>
