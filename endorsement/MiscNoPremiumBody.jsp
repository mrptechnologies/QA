<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>

<bean:define id="customerId" name="EndorsementDetail" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="parentQuoteId" name="EndorsementDetail" property="answer(parentQuoteId)" scope="request"/>
<bean:define id="productId" name="EndorsementDetail" property="answer(productId)" scope="request"/>
<bean:define id="productVerId" name="EndorsementDetail" property="answer(productVerId)" scope="request"/>
<bean:define id="customerId" name="EndorsementDetail" property="answer(customerId)" scope="request"/>
<bean:define id="CustomerState" name="EndorsementDetail" property="answer(State)" scope="request"/>
<bean:define id="agencyId" name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" scope="request"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="paretQuoteStatus" name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="paretQuoteStatus" name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="policyNumber" name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" />
<logic:empty name="policyNumber">
	<bean:define id="policyNumber" name="EndorsementDetail" property="answer(policyNumber)" />
</logic:empty>
<bean:define id="parentPolicyId" name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" scope="request"/>
<bean:parameter name="answer(Object::Policy::ParentPolicyVerId)" id="policyVerId" />

<table width="98%">
	
	<tr>
		<td  colspan="2"><jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
		</td>
	</tr>
	<tr>
		<td height="15px" colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2">
		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0"
			CELLPADDING="0">
			<tr>
				<td>
					<jsp:include page="../common/DynamicPolicyHeader.jsp">
						<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
						<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
						<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
						<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
					</jsp:include>
				</td>
			</tr>		
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
				<table width="60%" align="Left" border="0">
					<jsp:include page="../common/QuoteHeader.jsp">
						<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
						<jsp:param name="productVerId" value="<%=""+productVerId%>" />
						<jsp:param name="heading" value="<%="ENDORSEMENT DETAIL"%>" />
					</jsp:include>
				</table>
				</td>
			</tr>
			
		</table>
		</td>
	</tr>
	<tr>
		<td class="links">
			<a href="../GetEndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(QuoteId)=<%=""+parentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>">Quote Summary</a>
		</td>
		<%--<td class="links">
			<a href="../GetList.do?answer(TabPanelName)=Insured_Panel&customerId=<%=customerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=CustomerState.toString()%>" title="Click to go to Show All Risks" />Risks</a>
		</td>--%>
	</tr>

	<tr>
	<td colspan="2">
	
	<%-- Endorsement Detail START --%>
	<div id="dolphincontainer">
		<div id="dolphinnav">
			<ul>
				<li>
					<a class="" rel="Endorsement Descrption">
					<span>Endorsement Descrption</span></a></li>
			</ul>
		</div>

		<div style="display:block;" id="Endorsement Descrption" class="innercontent">

			<html:form action="/SaveEndorsementDetailAction.go" styleId="Application1">
				<table class="FormLabelsApplication" border="0" cellpadding="2" cellspacing="2" >
					<tr>
						<td class="FormLabels" width="40%" valign="middle">Endorsement Description </td>
						<td class="FormLabels" width="40%" valign="top">
							<html:textarea property="answer(Object::QuoteAdditional::EndorsementDescription)" styleClass="txtarea" cols="40" rows="8"/></td></tr>

					<dmshtml:dms_isPresent property="<%=new String[]{"In Progress", "Submitted"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true" >				
						<tr>
							<td colspan="2" align="center">
								<input name="answer(SubmitType)" value="Save" class="sbttn" type="submit">
							</td>
						</tr>
					</dmshtml:dms_isPresent>

						<html:hidden name="EndorsementDetail" property="answer(userName)" value="<%=userId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(productId)" value="<%=productId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(productVerId)" value="<%=productVerId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(customerId)" value="<%=customerId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(State)" value="<%=CustomerState.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" value="<%=policyNumber.toString()%>"/>
						<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
						<html:hidden name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>"/>
						<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />						
						<html:hidden name="EndorsementDetail" property="answer(Object::Quote::EndorsementModified)" value="Y" />						
						<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
				</table>
			</html:form>
		</div>
	</div>
	<%-- Endorsement Detail END --%>
	</td></tr>
	<tr>
		<td colspan="2" height="15px"></td></tr>
</table>

<script type="text/javascript">dolphintabs.init('dolphinnav', 0)</script>
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
