<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested"%>
<!-- define the request attribute variables as page variables -->
<bean:define id="subQuoteDetail" name="SUB_QUOTE_DETAIL" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="parentQuoteDetail" name="PARENT_QUOTE_DETAIL" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"/>
<bean:define id="productId" name="parentQuoteDetail" property="productId" />
<bean:define id="productVerId" name="parentQuoteDetail" property="productVerId" />
<bean:define id="groupId" name="subQuoteDetail" property="productGroupId" />
<bean:define id="groupVerId" name="subQuoteDetail" property="productGroupVerId" />
<bean:define id="productStatus" name="parentQuoteDetail" property="productStatus" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />

<table width="760px" align="center" border="0" cellspacing="5" cellpadding="1">
<script type="text/javascript">

	function validateDate(){
		if(document.forms[0].ID449 !=null && document.forms[0].ID449 !=undefined){
			for(i=0;i<document.forms[0].ID449.length;i++){
				var vardate = document.forms[0].ID449[i].value;
				var elem = document.forms[0].ID449[i];
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
												
				if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
				{
					alert("Please enter date in 'MM/DD/YYYY' format");
					elem.focus();
					elem.style.background='#FFCC33';
					return false;
				}
			}		
			}
			
			if(document.forms[0].ID447 !=null && document.forms[0].ID447 !=undefined){
				for(i=0;i<document.forms[0].ID447.length;i++){
					var vardate = document.forms[0].ID447[i].value;
					var elem1 = document.forms[0].ID447[i];
					if (vardate=="")
					{
						alert("Please enter the Retro Date");
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
													
					if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
					{
						alert("Please enter date in 'MM/DD/YYYY' format");
						elem1.focus();
						elem1.style.background='#FFCC33';
						return false;
					}
				}		
			}
		return true;
	}

</script>
<!--  Variable Declarations BEGIN-->
	<%
		String customerId = request.getParameter("answer(Object::Customer::CustomerId)");
		String subQuoteId = request.getParameter("answer(QuoteId)");
		String parentQuoteId = request.getParameter("answer(parentQuoteId)");
		String agencyId = request.getParameter("answer(Object::Agency::AgencyId)");
		String subQuotePlanName = subQuoteDetail.getHealthInsPlanDetail().getPlanTypeName();
		String planName = request.getParameter("subQuotePlanName");
		String tempStr="";
		boolean planLifeAvailable = false;
		if(subQuoteDetail.getHealthInsPlanDetail().getLifeCovAmount()!=0)
			planLifeAvailable=true;
		boolean planWDIAvailable = false;
		if(subQuoteDetail.getHealthInsPlanDetail().getWdiCovAmount()!=0)
			planWDIAvailable=true;
	%>
<!--  Variable Declarations END-->


<!-- Customer-Agency Link BEGIN -->

 	<tr>
    	<td colspan="2" align="left">
			<table width="100%" border="0" align="left">
			<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
				<tr>
					<td align="left">
						<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
					</td>
				</tr>
			</logic:notEqual>
			</table>
		</td>
 	 </tr>

<!-- Customer-Agency Link END -->
	
<!-- Quote Header BEGIN -->


        <logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
			<tr>
				<td>
					<table width="100%" align="Left" border="0">
					<jsp:include page="../common/QuoteHeader.jsp">
					<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
					<jsp:param name="productVerId" value="<%=""+productVerId%>" />
					<jsp:param name="heading" value="<%="Rating Detail"%>" />
					</jsp:include>
					</table>
				</td>
			</tr>
		</logic:notEqual>
 <logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >		
	<tr>
		<td colspan="2">
			<table width="100%" align="left" border="0">
				<jsp:include page="../common/QuotePlanInfoHeader.jsp" >
					<jsp:param name="subQuoteId" value="<%=""+subQuoteId%>" />	
					<jsp:param name="customerId" value="<%=""+customerId%>" />	
					<jsp:param name="productId" value="<%=""+productId%>" />	
					<jsp:param name="productVerId" value="<%=""+productVerId%>" />
					<jsp:param name="prdGroupId" value="<%=""+groupId%>" />	
					<jsp:param name="prdGroupVerId" value="<%=""+groupVerId%>" />
					<jsp:param name="productStatus" value="<%=""+productStatus%>" />
					<jsp:param name="stateCode" value="<%="CO"%>"/>
				</jsp:include>
			</table>
		</td>
 	 </tr>
  </logic:notEqual>	 
<!-- Quote Header END -->
    <table width="100%" align="left" border="0">
	  <tr>
		<td  colspan="2"  align="left" class="links">
			<br/>
			<a href="../GetQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>">Quote Summary</a><br/>
		</td>
 	 </tr>
 	 <tr>
		<td ALIGN="center" class="sectionhead" colspan="2">
		Rating Details
		</td>
	</tr>
	
	
  
<!-- Common Quoting Info BEGIN -->
  
<!-- Common Quoting Info END -->
<!-- Employee Elections BEGIN -->

 	<tr>
		<td colspan="2">
			<!------------------------------------>
			<html:form action="/ModifyEmployeeElections.do" onsubmit="return validateDate()">
			<!-- Hidden fields for Going to Quote SummaryPage after submission BEGIN-->
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
			<table width="100%" align="left" cellspacing="4" cellpadding="4" border="0">
		
				<logic:present name="EMPLOYE_EELECTION_HTML" scope="request">
				<bean:define id="htmlPage" name="EMPLOYE_EELECTION_HTML"
					type="java.lang.StringBuffer" />
				<%out.println(htmlPage.toString());%>
				<%if(!htmlPage.toString().equals("")) {%>
				<dmshtml:dms_isPresent negated="true" property="<%=new String[]{"In Progress","Referred"}%>" value="<%=parentQuoteDetail.getQuoteStatus()%>" >
				
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
	</table>
	<!------------------------------------>
	</td>
  </tr>
<!-- Employee Elections END -->
</table>