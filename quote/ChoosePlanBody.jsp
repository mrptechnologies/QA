<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>


<%!
	static final int beniRater = 0;
	static final int MicaRater = 1;
	static final int MicaIowa = 3;
%>
<%
	int productGroup = beniRater;
%>



<script type="text/javascript">
<!--
function validateProduct(frm)
{
	//if(frm.productIdChoose.value==""){
	//	 alert("Please select a product");
	//	return false;
	//}
	//return true;
}
	function getGroupsInStatus()
	{
		var formElement=document.forms[0];		
		formElement.action="../AddNewPlan.do";
		formElement.submit();
		return true;
	}
//-->
</script>



<%System.out.println("###Choose Plan");%>
<html:form action="/AddNewPlanAction.do"  onsubmit="return validateProduct(this);">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:parameter id="customerId" name="answer(Object::Customer::CustomerId)"/>
<bean:parameter id="agencyId" name="answer(Object::Agency::AgencyId)" />
<bean:parameter id="parentQuoteId" name="answer(parentQuoteId)" />
<bean:parameter id="PlanNumber" name="answer(Plan::PlanNumber)" />
<bean:parameter id="QuoteProductID" name="answer(Object::Quote::ProductId)" />

<html:hidden  property="answer(parentQuoteId)" value="<%=""+parentQuoteId%>"/>
<html:hidden  property="answer(Object::Quote::ProductId)" value="<%=""+QuoteProductID%>"/>
<html:hidden  property="answer(prodId)" name="AddParentQuote" value="<%=""+QuoteProductID%>"/>
<html:hidden  property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>"/>
<html:hidden  property="answer(Object::Quote::Id)" value="<%=parentQuoteId.toString()%>"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:define id="HelthHra" name="ChoosePlan" property="answer(Object::Quote::HelthHra)" />
<bean:define id="CompositeRate" name="ChoosePlan" property="answer(Object::Quote::CompositeRate)" />
<bean:define id="quoteStartDate" name="ChoosePlan" property="answer(quoteStartDate)" />
<bean:define id="noOfMedicalEmployees" name="ChoosePlan" property="answer(noOfMedicalEmployees)" />
<bean:define id="State" name="ChoosePlan" property="answer(State)" />
<html:hidden property="answer(Object::Quote::NoOfMedicalEmployees)" value='<%=noOfMedicalEmployees.toString()%>'/>
<html:hidden property="answer(Object::Quote::QuoteStartDate)" value='<%=quoteStartDate.toString()%>'/>
<html:hidden property="answer(Object::Quote::CustomerState)" value='<%=State.toString()%>'/>

 <html:hidden  property="answer(State)" value="<%=""+State%>"/>
 <html:hidden  property="answer(quoteStartDate)" value="<%=""+quoteStartDate%>"/>
 <html:hidden  property="answer(noOfMedicalEmployees)" value="<%=""+noOfMedicalEmployees%>"/>
 <html:hidden property="answer(Object::Quote::HelthHra)" value='<%=HelthHra.toString()%>'/>
 <html:hidden property="answer(Object::Quote::CompositeRate)" value='<%=CompositeRate.toString()%>'/>
 <html:hidden name="ChoosePlan" property="answer(Object::Quote::AreaNetWorkKey)" />
 <html:hidden name="ChoosePlan" property="answer(Object::Quote::AreaNetWorkKeyDesc)"/>
 <html:hidden property="answer(ownerId)" value='<%=ownerId.toString()%>'/>
 <html:hidden property="answer(userId)" value='<%=userId.toString()%>'/>

<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr>
		<td >
			<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr><td>
					<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
				</td></tr>
				<tr>
					<td >
						<table align="Left" border="0">
							<jsp:include page="../common/QuoteHeader.jsp">
								<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
								<jsp:param name="heading" value="<%="SELECT PLAN"%>" />
							</jsp:include>
						</table>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="links" align="left" width="25%">
						<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>">Quote Summary</a>
					</td>
				</tr>
				
				<tr>
					<td  colspan="6" align="center" class="sectionhead">&nbsp;</td>
				</tr>
	

					<%
						com.dms.ejb.data.QuestionHashMap qmapArea =   new com.dms.ejb.data.QuestionHashMap(10);				
						qmapArea.put("ownerId", ""+ownerId);
						qmapArea.put("dbname", ""+com.dms.web.util.DbUtils.getWriteDS(pageContext));
						qmapArea.put("Object::Customer::CustomerId", ""+customerId);			
					%>
				
				<tr>
					<td>
						<table width="750" align="center"  border="0">
	
							<dmshtml:dms_static_with_connector ruleName='privilage'
								property='<%=new String[]{"CREATE_QUOTE_ALLPRODUCTSTATUS"}%>' connector='or'
								negated="true">				
							<tr>
								<td width="30%" align="left" class="FormLabels">
									Select Product Status
									&nbsp;
								</td>
								<td class="sectionhead1">
									<html:select property="answer(Object::Quote::ProductStatus)" name="ChoosePlan" onchange="return getGroupsInStatus()">
										<html:option value ='RELEASED'>Released</html:option>
							    		<html:option value ='DEVELOPMENT'>Development</html:option>
										<html:option value ='QA'>QA</html:option>
									</html:select>
								</td>
							</tr>
							</dmshtml:dms_static_with_connector>
							<dmshtml:dms_static_with_connector ruleName='privilage'
								property='<%=new String[]{"CREATE_QUOTE_RESTRICTED_RELEAS"}%>' connector='or'
								negated="true">				
							<tr>
								<td width="30%" align="left" class="FormLabels">
									Select Product Status
									&nbsp;
								</td>
								<td class="sectionhead1">
									<html:select property="answer(Object::Quote::ProductStatus)" name="ChoosePlan" onchange="return getGroupsInStatus()">
										<html:option value ='RELEASED'>Released</html:option>
										<html:option value ='RESTRICTED'>Restricted</html:option>
									</html:select>
								</td>
							</tr>
							</dmshtml:dms_static_with_connector>
			
							<dmshtml:dms_static_with_connector ruleName='privilage'
								property='<%=new String[]{"CREATE_QUOTE_ALLPRODUCTSTATUS","CREATE_QUOTE_RESTRICTED_RELEAS"}%>' connector='or'
								negated="false">
								<html:hidden   property="answer(Object::Quote::ProductStatus)"  value="RELEASED" />
							</dmshtml:dms_static_with_connector>
			
							<tr>
								<td class="FormLabels" align="left" width="30%">
									Select Plan**
								</td>
								<td class="links">	
									<bean:define id="arrProductGroups" name="PRODUCT_GROUPS" type="java.util.ArrayList"/>
									<html:select property="answer(Object::Quote::ProductGroupVerId)" >
			
										<%for(int i=0;i<arrProductGroups.size();i++) {
										com.dms.ejb.data.QuestionHashMap productMap=(com.dms.ejb.data.QuestionHashMap)arrProductGroups.get(i);	
										%>
			
										<html:option value ='<%=productMap.getString("Object::ProductGroup::ProductGroupVerId")%>'>
										<%=productMap.getString("Object::ProductGroup::GroupName")%></html:option>
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
			<input type="submit" value="Select" class="sbttn"/>
			&nbsp;
		</td>
	</TR>


		
<!--html:hidden name="AddParentQuote" property="answer(Object::Product::ProductState)" value="RELEASED"/-->
<tr><td>
<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyId.toString()%>"/>


<html:hidden property="answer(Plan::PlanNumber)" value="<%=PlanNumber.toString()%>" />
<html:hidden property="answer(Plan::AddPlan)" value="YES" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</td></tr>
</table>
</html:form>
