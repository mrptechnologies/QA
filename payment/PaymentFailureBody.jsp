<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="TransactionMsg" property="answer(Object::Quote::Payment::TransactionMessage)" name="payment" scope="request"/>
<bean:define id="agencyId" property="answer(Object::Agency::AgencyId)" name="payment"/>
<bean:define id="parentQuoteId" property="answer(ParentQuoteId)" name="payment"/>
<bean:define id="IsApplicationDisabled" property="answer(IsApplicationDisabled)" name="payment"/>
<bean:define id="ProductVerId" property="answer(Object::Quote::ProductVerId)" name="payment"/>
<bean:define id="prodId" property="answer(Object::Quote::ProductId)" name="payment"/>
<bean:define id="parentQuoteVerId" property="answer(parentQuoteVerId)" name="payment"/>
<bean:define id="subQuoteId" property="answer(SubQuoteId)" name="payment"/>
<bean:define id="riskId" property="answer(riskId)" name="payment"/>
<bean:define id="ProductFamilyId" property="answer(familyId)" name="payment"/>
<bean:define id="State" property="answer(state)" name="payment"/>
<bean:define id="CustomerState" property="answer(custState)" name="payment"/>
<bean:define id="customerId" property="answer(Object::Customer::CustomerId)" name="payment"/>
<bean:define id="GroupId" property="answer(prdGroupId)" name="payment"/>
<bean:define id="GroupVerId" property="answer(prdGroupVerId)" name="payment"/>
<bean:define id="productStatus" property="answer(productstatus)" name="payment"/>
<bean:define id="riskTerritory" property="answer(riskterritory)" name="payment"/>
<bean:define id="riskZone" property="answer(riskzone)" name="payment"/>
<bean:define id="QuoteType" property="answer(Object::Quote::QuoteType)" name="payment"/>
<bean:define id="TotalParentQuotePremium" property="answer(TotalPremium)" name="payment"/>
<bean:define id="quoteStartDate" property="answer(Object::Quote::QuoteStartDate)" name="payment"/>
<bean:define id="subQuoteVerId" property="answer(subQuoteVerId1)" name="payment"/>



<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">

<tr>
		<td>&nbsp;</td>
</tr>
<tr>
		<td>&nbsp;</td>
		</tr>
<tr>
<%String resMessage = ""+TransactionMsg;
String resMessage1= "";
						   int index =  resMessage.indexOf(")")+1;
						 %>
						 <%if(index!=-1){
							 resMessage1  = resMessage.substring(index);%>
							
						<% }%>
		<td class="error" align="left" colspan ="10" ><%=""+resMessage1%>. </td>
</tr>
<tr>
<td>
&nbsp;
</td>
</tr>
<tr>
<td class="FormLabels" align="left" colspan ="10" >Pls click the link to enter the Payment Information Correctly </td>
</tr>
<tr>
<td>
&nbsp;
</td>
</tr>
<tr>
<td class="links" align="left" colspan ="10" >
<a href='../EnrollQuote.do?answer(TabPanelName)=Quote_Panel&answer(showOneTabAtTime)=N&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(IsSubApplicationCoveredByForm)=Yes&answer(IsApplicationDisabled)=<%=""+IsApplicationDisabled%>&answer(objectId)=<%=""+prodId%>&answer(objectVerId)=<%=""+ProductVerId%>&answer(ProductId)=<%=""+prodId%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(objectName)=ENROLLMENT&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(ParentQuoteId)=<%=parentQuoteId.toString()%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(SubQuoteId)=<%=subQuoteId.toString()%>&answer(subQuoteVerId)=<%=subQuoteVerId.toString()%>&answer(Object::Risk::ResProperty::ResPropertyId)=<%=""+riskId %>&answer(RiskId)=<%=""+riskId %>&ParentQuoteId=<%=parentQuoteId.toString()%>&ParentQuoteVerId=<%=""+parentQuoteVerId%>&SubQuoteId=<%=subQuoteId.toString()%>&RiskId=<%=""+riskId %>&answer(FamilyId)=<%=ProductFamilyId.toString()%>&answer(OwnerId)=<%=ownerId.toString()%>&OwnerId=<%=ownerId.toString()%>&answer(State)=<%=""+State%>&answer(Object::Customer::State1)=<%=""+CustomerState%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(customerId)=<%=""+customerId%>&answer(prdGroupId)=<%=""+GroupId%>&answer(prdGroupVerId)=<%=""+GroupVerId%>&answer(productStatus)=<%=""+productStatus%>&answer(riskTerritory)=<%=""+riskTerritory%>&answer(zone)=<%=""+riskZone%>&answer(RULE_OBJECT_ID)=<%=""+prodId%>&answer(RULE_OBJECT_VER_ID)=<%=""+ProductVerId%>&answer(RULE_OBJECT_TYPE)=ELIGIBILITY&answer(RULE_OBJECT_NAME)=ENROLL&answer(TotalPremium)=<%=""+TotalParentQuotePremium %>&answer(MERGE_BEFORE)=YES&answer(MERGE_AFTER)=NO&answer(ASSERT_MAP_ENTRIES)=YES&answer(MODIFIED_FACT_MAP)=YES&answer(Object::Quote::QuoteType)=<%=""+QuoteType%>&answer(Object::Quote::QuoteStartDate)=<%=""+quoteStartDate %>'>Enroll</a>

</td>
</tr>

</table>		
