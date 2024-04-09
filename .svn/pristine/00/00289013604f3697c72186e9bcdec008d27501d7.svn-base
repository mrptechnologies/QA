<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="com.dms.common.ObjectDescriptor" %>

<!-- define the request attribute variables as page variables -->
<bean:define id="subQuoteDetail" name="SUB_QUOTE_DETAIL" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"/>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="productId" name="AddQuote" property="answer(Object::Quote::ProductId)" />
<bean:define id="productVerId" name="AddQuote" property="answer(Object::Quote::ProductVerId)" />
<bean:define id="groupId" name="AddQuote" property="answer(Object::Quote::ProductGroupId)" />
<bean:define id="groupVerId" name="AddQuote" property="answer(Object::Quote::ProductGroupVerId)" />
<bean:define id="productStatus" name="AddQuote" property="answer(Object::Quote::ProductStatus)" />
<bean:define id="parentQuoteVerId" name="AddQuote" property="answer(parentQuoteVerId)" />
<!-- we are retriving the value from the action class. -->



		<%
		String compositeRate="";
		if(request.getParameter("answer(Object::Plan::CompositeRateFlag)")!=null){
			compositeRate=request.getParameter("answer(Object::Plan::CompositeRateFlag)");
		}
		%>

<%
		String customerId = request.getParameter("answer(Object::Customer::CustomerId)");
		String subQuoteId = request.getParameter("answer(QuoteId)");
		String parentQuoteId = request.getParameter("answer(parentQuoteId)");
		String agencyId = request.getParameter("answer(Object::Agency::AgencyId)");
		String subQuotePlanName = subQuoteDetail.getHealthInsPlanDetail().getPlanTypeName();
		String planName = request.getParameter("subQuotePlanName");
	%>

<table width="760px" align="center" border="0" cellspacing="5" cellpadding="1">
<!-- Customer-Agency Link BEGIN -->
	<tr>
		<td colspan="2" align="left">
			<table width="100%" border="0" align="left">
				<tr>
					<td align="left">
						<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
					</td>
				</tr>
			</table>
	  	</td>
 	 </tr>


<!-- Customer-Agency Link END -->

<!-- Quote Header BEGIN -->
	

	<%--<tr>
		<td colspan="2">
			<table width="100%" align="Left" border="0">
				<jsp:include page="../common/QuoteHeader.jsp" >
					<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />	
					<jsp:param name="heading" value="<%="RATING DETAIL"%>" />	
				</jsp:include>
			</table>
		</td>
	</tr>--%>
			<tr>
				<td>
					<table width="60%" align="Left" border="0">
					<jsp:include page="../common/QuoteHeader.jsp" >
						<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
						<jsp:param name="productVerId" value="<%=""+productVerId%>" />					
						<jsp:param name="heading" value="<%="RATING DETAIL"%>" />
					</jsp:include>
					</table>
				</td>
			</tr>

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
				</jsp:include>
			</table>
		</td>
 	</tr>




<!-- Quote Header END -->
<!-- Additional Quote Info BEGIN -->
  
<!-- Additional Quote Info END -->

 	 <tr>
   		 <td colspan="2" class="links" align="left" height="20" valign="middle">
	
    		<a  href="../GetQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>">Quote Summary</a>
    	</td>
 	 </tr>

<!-- Rating Detail BEGIN -->

	<tr>
		<td>
			<table width="775px" border="0">
				<tr>
					<td ALIGN="center" class="sectionhead" colspan="2">
						RATING INDICATION
					</td>
				</tr>
		 	</table>
		</td>
	</tr>
<!-- Medical BEGIN -->

 	 <tr>
 	 	<td>

			<table border="0" width="760px">
				<tr>
					<td class="FormLabels" align="left" width="44%">
						<!--  Medical Rate Tables-->
					</td>
					<%--<td class="FormLabels" align="left" width="56%">
						<input type="button" onclick="window.location.reload()" value="Recalculate" class="sbttn">
					</td>--%>
				</tr>
			 </table>
  		</td>
  	</tr>
  <bean:define id="customerState" name="subQuoteDetail" property="customerState"/>
  
    <tr>
    <dmshtml:dms_HasFeature_Available_InProduct productId='<%=Long.parseLong(""+productId)%>' featureName="Member_Based_Rate" negated="true" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId %>" state="<%=""+customerState%>" >	
		<td class="links" align="left">
			<a href="../GetRateCalc.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&parentQuoteId=<%=parentQuoteId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&subQuotePlanName=<%=planName%>&rateType=member_rates">Member</a>
		</td>
		</dmshtml:dms_HasFeature_Available_InProduct>		
		<dmshtml:dms_HasFeature_Available_InProduct productId='<%=Long.parseLong(""+productId)%>' featureName="Employee_Based_Rate" negated="true" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId %>" state="<%=""+customerState%>" >	
		<td class="links" align="left">
			<a href="../GetRateCalc.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&parentQuoteId=<%=parentQuoteId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&subQuotePlanName=<%=planName%>&rateType=employee_rates">Employee</a>
		</td>
		</dmshtml:dms_HasFeature_Available_InProduct>		
	</tr>
	
<!-- Medical END -->
<!-- Common Quoting Info BEGIN -->
  
<!-- Common Quoting Info END -->
<!-- Quote Details BEGIN -->
  	<tr>
		<td colspan = "2">
	<!------------------------------------>
			<table width="100%" align="left" cellspacing="4" cellpadding="4" border="0">
				
				
						<logic:present name="RATING_DETAIL_HTML" scope="request">
							<bean:define id="htmlPage" name="RATING_DETAIL_HTML"
								type="java.lang.StringBuffer" />
							<%out.println(htmlPage.toString());%>
						</logic:present>
			</table>
		</td>
	</tr>
	
	<dmshtml:dms_isPresent property='<%=new String[]{"Y"}%>' value="<%=compositeRate.toString()%>" negated="true">
	<tr>
		<td>
		<dmshtml:GetCompositeRateDetail quoteId='<%=Long.parseLong(parentQuoteId.toString())%>' subQuoteId='<%=Long.parseLong(""+subQuoteId)%>' subQuoteVerId='<%=Long.parseLong(""+parentQuoteVerId) %>' ownerId='<%=Long.parseLong(""+ownerId) %>' dBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' nameInSession="compositeRate"/>
			<logic:present name="compositeRate" scope="request">
			<table align="center" width="70%">
				<tr>
					<td class="sectionhead" width="20%">Composite Rates</td>					
					<td class="sectionhead" width="10%">Enroll</td>					
					<td class="sectionhead" width="10%">Composite Rate</td>
					<td class="sectionhead" width="15%">Composite Premium</td>	
				</tr>
				<tr>
					<td class="TextMatter1">
						EE Only
					</td>
					<td class="TextMatter1">
						<bean:write name="compositeRate" property="numberOfEE" />
						<bean:define id="numberOfEE" name="compositeRate" property="numberOfEE" />
					</td>										
					<td class="TextMatter1">
						<%--<bean:write name="compositeRate" property="EMPLOYEE_ONLY_RATE" />--%>
						<bean:define id="empOnlyRate" name="compositeRate" property="EMPLOYEE_ONLY_RATE" />
						<dmshtml:CurrencyFormatTag format="<%=""+ empOnlyRate%>"/>
					</td>
					<td class="TextMatter1">						
						<%double numOfEe = Double.parseDouble(""+numberOfEE);
						  double empOnlyRat = Double.parseDouble(""+empOnlyRate); 
						  double rate =(numOfEe*empOnlyRat);%>						
						<dmshtml:CurrencyFormatTag format="<%=""+ rate%>"/>
					</td>
				</tr>
				<tr>
					<td class="TextMatter1">
						EE and SP
					</td>
					<td class="TextMatter1">
						<bean:write name="compositeRate" property="numberOfES" />
						<bean:define id="numberOfES" name="compositeRate" property="numberOfES" />
					</td>
									
					<td class="TextMatter1">
						<%--<bean:write name="compositeRate" property="EMPLOYEE_AND_SPOUSE_RATE" />--%>
						<bean:define id="empSpouseRate" name="compositeRate" property="EMPLOYEE_AND_SPOUSE_RATE" />
						<dmshtml:CurrencyFormatTag format="<%=""+empSpouseRate%>"/>
					</td>
					<td class="TextMatter1">
						<%double numOfEs = Double.parseDouble(""+numberOfES);
						  double empSpouseRat = Double.parseDouble(""+empSpouseRate); 
						  double spRate =(numOfEs*empSpouseRat);%>						
						<dmshtml:CurrencyFormatTag format="<%=""+ spRate%>"/>
					</td>
				</tr>
				<tr>
					<td class="TextMatter1">
						EE and Child
					</td>
					<td class="TextMatter1">
						<bean:write name="compositeRate" property="numberOfEC" />
						<bean:define id="numberOfEC" name="compositeRate" property="numberOfEC" />
					</td>
					
					<td class="TextMatter1">
						<%--<bean:write name="compositeRate" property="EMPLOYEE_AND_CHILD_RATE" />--%>
						<bean:define id="empChildRate" name="compositeRate" property="EMPLOYEE_AND_CHILD_RATE" />
						<dmshtml:CurrencyFormatTag format="<%=""+empChildRate%>"/>
					</td>
					<td class="TextMatter1">
						<%double numOfEc = Double.parseDouble(""+numberOfEC);
						  double empChildRat = Double.parseDouble(""+empChildRate); 
						  double chRate =(numOfEc*empChildRat);%>						
						<dmshtml:CurrencyFormatTag format="<%=""+ chRate%>"/>
					</td>
				</tr>
				<tr>
					<td class="TextMatter1">
						Family
					</td>
					<td class="TextMatter1">
						<bean:write name="compositeRate" property="numberOfEF" />
						<bean:define id="numberOfEF" name="compositeRate" property="numberOfEF" />
					</td>
					
					<td class="TextMatter1">
						<%--<bean:write name="compositeRate" property="FAMILY_RATE" />--%>
						<bean:define id="familyRate" name="compositeRate" property="FAMILY_RATE" />
						<dmshtml:CurrencyFormatTag format="<%=""+familyRate%>"/>
					</td>
					<td class="TextMatter1">
						<%double numOfEF = Double.parseDouble(""+numberOfEF);
						  double familyRat = Double.parseDouble(""+familyRate); 
						  double famRate =(numOfEF*familyRat);%>						
						<dmshtml:CurrencyFormatTag format="<%=""+ famRate%>"/>
					</td>
				</tr>
			</table>
			


			</logic:present>
		</td>	
	</tr>
	</dmshtml:dms_isPresent>
</table>
	