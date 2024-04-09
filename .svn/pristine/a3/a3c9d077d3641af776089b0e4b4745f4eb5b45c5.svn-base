<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<bean:parameter id="custId" name="answer(Object::Customer::CustomerId)" />
<bean:parameter id="policyId" name="answer(policyId)" />
<bean:parameter id="policyVerId" name="answer(policyVerId)" />
<bean:parameter id="policyNumber" name="answer(policyNumber)" />
<bean:parameter id="productId" name="answer(Object::Quote::ProductId)"/>




<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr height="10">
		<td>
		</td>
	</tr>
	<tr>
		<td width="95%" bgcolor="#C6DEEA">
			<jsp:include page="../common/CustomerAgencyLinkspage.jsp">
				<jsp:param name="answer(Object::Customer::CustomerId)" value="<%=""+custId%>" />
			</jsp:include>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
 	<tr>
		<td>

			<jsp:include page="../common/DynamicPolicyHeader.jsp">
				<jsp:param name="policyId" value="<%=policyId.toString()%>" />
				<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
				<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
				<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
			</jsp:include>
		 </td>
  	</tr>
</table> 
<table WIDTH="95%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td width="100%">	
			<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">	
				<tr>
					<td  class="FormLabels" align="left" colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td class="NewSectionHead" colspan="5" align="center">REQUEST FOR CANCELLATION</td>
				</tr>
				<tr>
					<td  class="FormLabels" align="left" colspan="4">&nbsp; </td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<html:form action="/SaveRequestCancellation.do" >

<table WIDTH="75%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">	
	<tr>	
		<td class="links" align="left" >
			<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyId)=<%= ""+policyId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Application::ApplicationType)=<%="POLICY_APPLICATION"%>">Return to Policy Summary</a>			
		</td>
		<td class="links" align="left" >
			<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyId)=<%= ""+policyId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Application::ApplicationType)=<%="POLICY_APPLICATION"%>">Previous Cancellation Requests</a>						
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>												
	<tr>
		<td class="FormLabels" align="left" >					
			Cancellation Option 
		</td>
		<td class="TextMatter1" align="left">
			<dmshtml:get_DropDown_Values dbname='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'  lookupType="Cancel_Reason" nameInSession="dropDownValues" ownerId='<%=""+ownerId %>' />							
				<logic:present name="dropDownValues" scope="request">									
					<bean:define id="dropDownValueList" name="dropDownValues" type="java.util.ArrayList"/>			
						<html:select property="answer(Object::Policy::Cancel::CancelOption)" styleClass='txtbox' styleId="Cancel_Option" >
							<%for(int i=0;i<dropDownValueList.size();i++) {
								com.dms.ejb.data.QuestionHashMap dropDownMap=(com.dms.ejb.data.QuestionHashMap)dropDownValueList.get(i);	
							%>											
							<html:option value ='<%=dropDownMap.getString("DropDownValue")%>'>
								<%=dropDownMap.getString("DropDownDescription")%>
							</html:option>										
							<%}%>
								</html:select>
						</logic:present>
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>		
			<tr>
				<td class="FormLabels" align="left">					
					Cancellation Reason 
				</td>
				<td class="TextMatter1" align="left">
						<dmshtml:dms_textarea styleClass="textarea" styleId="Cancel_Reason" property="answer(Object::Policy::Cancel::Reason)" cols="80" rows="5" />
				</td>
			</tr>	
			<tr>
				<td>
					&nbsp;	
				</td>
			</tr>	
			<tr>
				<td class="FormLabels" align="left">					
					Cancellation Effective Date 
				</td>
				<td align="left">
						<html:text property="answer(Object::Policy::Cancel::EffectiveDate)" name="PolicySummary" styleClass="textbox" styleId="effectiveDate" />

				</td>
			</tr>	
						
			<tr>
				<td align="left" class="links" >
					<html:submit value="Request for Cancellation" />				

				</td>	
			</tr>
			<tr>
				<td>
					&nbsp;	
				</td>
			</tr>											
		
</table>
<html:hidden property="answer(Object::Policy::Cancel::NoticeType)" name="PolicySummary" value="<%="CANCEL"%>"/>
<html:hidden property="answer(Object::Policy::Cancel::OwnerId)" value="<%=""+ownerId%>" />	
<html:hidden property="answer(Object::Policy::Cancel::UpdatedBy)" value="<%=""+usernameId%>" />	
<html:hidden property="answer(Object::Policy::Cancel::CreatedBy)" value='<%=""+usernameId%>'/>	
<html:hidden property="answer(policyNumber)" value='<%=""+policyNumber %>' name="PolicySummary"/>
<html:hidden property="answer(Object::Policy::Cancel::PolicyId)" value='<%=""+policyId%>'/>	
<html:hidden property="answer(Object::Policy::Cancel::PolicyVerId)" value='<%=""+policyVerId%>'/>	
<html:hidden property="answer(Object::Policy::Cancel::Status)" value='<%="Requested"%>'/>
<html:hidden property="answer(TabPanelName)" value='<%="Policy_Panel"%>'/>
<html:hidden property="answer(Object::Customer::CustomerId)" value='<%= ""+custId%>' />
<html:hidden property="answer(Object::Quote::ProductId)" value='<%=""+productId %>' name="PolicySummary"/>
</html:form>


