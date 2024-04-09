<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<script type="text/javascript">
<!--
function validateProductFamily(frm)
{
	if(frm.productIdChoose.value==""){
		 alert("Please select a product family");
		return false;
	}
	return true;
}
	
//-->
</script>



<%System.out.println("###Choose Plan");%>
<html:form action="/getEmployeeToQuoteAssociation.do"  onsubmit="return validateProductFamily(this);">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:parameter id="customerId" name="answer(Object::Customer::CustomerId)"/>
<bean:parameter id="agencyId" name="answer(Object::Agency::AgencyId)" />
<bean:parameter id="parentQuoteId" name="answer(parentQuoteId)" />
<bean:parameter id="QuoteId" name="answer(QuoteId)" />
<bean:parameter id="subQuotePlanName" name="subQuotePlanName" />
<bean:parameter id="requestType" name="requestType" />
<bean:parameter id="ProductVerId" name="answer(Object::Quote::ProductVerId)" />
<%
String compositeRate="";
if(request.getParameter("answer(Object::Plan::CompositeRateFlag)")!=null){
	compositeRate=request.getParameter("answer(Object::Plan::CompositeRateFlag)");
}
 %>
<html:hidden  property="subQuotePlanName" value="<%=""+subQuotePlanName%>"/>
<html:hidden  property="requestType" value="<%=""+requestType%>"/>
<html:hidden  property="answer(QuoteId)" value="<%=""+QuoteId%>"/>
<html:hidden  property="parentQuoteId" value="<%=""+parentQuoteId%>"/>
<html:hidden  property="answer(parentQuoteId)" value="<%=""+parentQuoteId%>"/>
<html:hidden  property="answer(Object::Customer::CustomerId)" value="<%=""+customerId%>"/>
<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyId.toString()%>"/>
<html:hidden property="answer(Object::Quote::ProductVerId)" value="<%=ProductVerId.toString()%>"/>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
 <html:hidden property="answer(ownerId)" value='<%=ownerId.toString()%>'/>
 <html:hidden property="answer(userId)" value='<%=userId.toString()%>'/>
 
 <html:hidden property="answer(Object::Plan::CompositeRateFlag)" value='<%=compositeRate.toString()%>'/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr>
		<td >
			<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td>
						<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
					</td>
				</tr>
	
	
				 <tr>
					<td >
						<table align="Left" border="0">
							<jsp:include page="../common/QuoteHeader.jsp">
								<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
								<jsp:param name="productVerId" value="<%=""+ProductVerId%>" />
								<jsp:param name="heading" value="<%="SELECT PRODUCT FAMILY"%>" />
							</jsp:include>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="links" align="left" width="25%">
						<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>">Quote Summary</a>
					</td>
				</tr>
				<tr>
					<td  colspan="6" align="center" class="sectionhead">&nbsp;</td>
				</tr>
				
				<tr>
					<td>
						<table width="750" align="center"  border="0">
							<tr>
								<td class="FormLabels" align="left" width="30%">
									Select Product Family	
								</td>
								<td class="links">	
									<bean:define id="arrProductFamilys" name="PRODUCT_FAMILYS" type="java.util.ArrayList"/>
									<html:select property="answer(Object::ProductFamily::ProductFamilyId)" >
	
										<%for(int i=0;i<arrProductFamilys.size();i++) {
										com.dms.ejb.data.QuestionHashMap productFamilyMap=(com.dms.ejb.data.QuestionHashMap)arrProductFamilys.get(i);	
										%>
	
										<html:option value ='<%=productFamilyMap.getString("Object::ProductFamily::ProductFamilyId")%>'>
										<%=productFamilyMap.getString("Object::ProductFamily::FamilyName")%></html:option>
										<%}%>
									</html:select>
		
								</td>
							</tr>
						</table>
					</td>
				</tr>
			 	<tr>
			 		<td colspan="2" >
			 			&nbsp;&nbsp;
			 		</td>
			 	</tr>
			</table>
		</td>
	</tr>
	<TR>
		<td colspan="2" align="Center">&nbsp;&nbsp;&nbsp;
			<input type="submit" value="Select" class="sbttn" />
			&nbsp;
		</td>
	</TR>

</table>


</html:form>
