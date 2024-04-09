<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>


<script type="text/javascript">
<!--
	function validateDelete(form)
	{
		var formElement=document.forms[0];		
		var found_it = false;
		for (var i=0; i < formElement.elements.length; ++i) {
			// Get the current field
			form_field = formElement.elements[i];			
			// Get the field's id			
			form_element_id = formElement.elements[i].id;			
			// Is it a check box field?
			if (form_element_id.indexOf("quoteDelCheckbox")!=-1) {	
				if (form_field.checked)
				{					
					found_it = true;
				    break;
				}
			}
		}			
		if(!found_it)
		{
			alert("Please select the quote to delete.");			
			return false;
		}	
		return true;
	}
//-->
</script>

<html:form action="/DeleteCLQuoteConfirmAction" onsubmit="return validateDelete(this)">
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:parameter id="agencyIdTemp" name="answer(Object::Agency::AgencyId)" />
<bean:parameter id="customerId" name="answer(Object::Customer::CustomerId)" />

<bean:define id="ownerId1" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
<tr><td colspan="2">
	<table WIDTH="120%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr><td>
		<jsp:include page="../common/CustomerAgencyLinkspage.jsp" /></td></tr>
	<tr><td>
	</table>
	<tr><td>
	<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<% 
	boolean deletePrivilege = false; 
	String submissionId = "";
	String submissionVerId = "";
	%>
	<dmshtml:dms_static_with_connector ruleName='privilage'  property='<%=new String[]{"DELETE_QUOTE"}%>' connector='or' negated="true">
		<% deletePrivilege = true; %>
	</dmshtml:dms_static_with_connector>
	
	<dmshtml:GetSubmissionDetailsByCustomerId nameInSession="submissionList" customerId='<%=Long.parseLong(customerId.toString())%>' ownerId='<%=Long.parseLong(ownerId1.toString())%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />


	<logic:present name='submissionList' scope='request'>
		<logic:iterate id='submissionList' name='submissionList'>
			<bean:define id="submissionIdTemp" name="submissionList" property="Object::Submission::SubmissionId" />
			<bean:define id="submissionVerIdTemp" name="submissionList" property="Object::Submission::SubmissionVerId" />
			
			<%
				submissionId = ""+submissionIdTemp; 
				submissionVerId = ""+submissionVerIdTemp; 
			%>
		
		</logic:iterate>
	</logic:present>

<tr><td height="5"></td></tr>
<tr>
	<td class="NewSectionHead" align="center" colspan="5">QUOTE HISTORY</td>
</tr>
<!-- <tr><td height="5"></td></tr> -->
<tr><td>&nbsp;</td></tr>

<logic:present name="staleDataSubmissionMsg" scope="request">
<tr>
		<td class="Error">Please avoid using the Back/Refresh button.</td>
	</tr>
</logic:present>

<tr><td>&nbsp;</td></tr>


	<tr><td align="left">
	 
	
			
		
	
		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
			
			<tr>
				<dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId1.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="RISK_AVAILABLE" />
		   		<logic:present name="paramValue">
		   		<logic:equal value="TRUE" name="paramValue">
				<td class="links" align="left" colspan="2" width="20%">
					<a href="/AddResProperty1.do?answer(TabPanelName)=Insured_Panel&answer(OwnerId)=<%=ownerId1.toString()%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId%>&answer(objectId)=0&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=""%>&answer(state)=<%=""%>&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(SelectedRiskType)=COMMERCIAL<%=" "%>AUTO" title="Click to go to add a New Risk"/>Add Risk</a>				
				</td>
				</logic:equal>
				</logic:present>
				
				<td align="left" class="links" >				
					<bean:define id="ObjectId" property="answer(Object::UserDetail::PrimaryObjectId)" name="LoginPage" scope="session"/>
					<bean:define id="ObjectType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session"/>
					<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 			

					<dmshtml:Get_Customer_HeaderDetail_ByCustomerId nameInSession="customerMap" customerId='<%=""+customerId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
						<bean:define id="customerDetailMap" name="customerMap" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
						<%String EmpGrpState=customerDetailMap.getString("Object::Customer::State");%>
						<html:hidden property="answer(Object::Risk::RiskId)" value="1"/>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_NAME_VIEW"}%>' connector='or' negated="true">  		
							<a href="../NewEILQuote.do?TabPanelName=Quote_Panel&answer(createQuoteEffectiveDate)=yes&answer(Object::Quote::primaryEntityId)=<%=ObjectId.toString()%>&answer(Object::Quote::SubmissionId)=<%=""+submissionId%>&answer(Object::Quote::SubmissionVerId)=<%=""+submissionVerId %>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Quote::QuoteStatus)=In Progress&answer(Object::Quote::OwnerId)=<%=ownerId.toString()%>&answer(Object::Quote::CreatedBy)=<%=userId.toString()%>&formName=form::GETCLQUOTEDETAILS&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::Quote::ProductStatus)=RELEASED&answer(State)=<%=EmpGrpState%>&answer(Object::Risk::RiskId)=11&answer(Object::Quote::NewQuote)=YES" title="Click to go to create a New Quote" id="Create_New_Quote"><html:button styleClass="linkButtonBig" property="answer(createNewQuote)" value="Create New Quote" onclick="window.location=document.getElementById('Create_New_Quote')"/></a>  </a>
						</dmshtml:dms_static_with_connector>
						
				</td>				
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td colspan="5">
				<table WIDTH="100%" ALIGN="center" cellspacing=1 cellpadding="1" border="0">
					
					
					<dmshtml:Get_QuoteDetails_ByCustomerId nameInSession="quoteDetails" objectId="<%=customerId.toString()%>" objectType="CUSTOMER" ownerId="<%=""+ownerId1%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
					
					<logic:present name="quoteDetails" scope="request">
					<TR >
						<td class="sectionhead" align="center">Quote No.</td>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_NAME_VIEW"}%>' connector='or' negated="true">  		
							<td class="sectionhead" align="center">Quote Name</td>
						</dmshtml:dms_static_with_connector>
						<td class="sectionhead" align="left" >Effective Date</td>
						<td class="sectionhead" align="center" >Status</td>		
						<td class="sectionhead" align="center" >Quote Type</td>
						<td class="sectionhead" align="left" >Created Date</td>
						<td class="sectionhead" align="left" >Last Saved Date</td>
						<td class="sectionhead" align="center" >Total Premium</td>		
						<td class="sectionhead" align="center" >&nbsp;</td>
						<% if(deletePrivilege){%>
						<td class="sectionhead" align="left" >Select</td>
						<%}%>
					</TR>
					<%int count=0;%>
					<logic:iterate id="aQuote" name="quoteDetails" scope="request">
					
						<%count++;%>
						<% 		
							String styleClass="";
							if(count%2==0){
								styleClass = "altdisply";
							}
							else{
								styleClass = "SearchResult";	
							}
						%>
					<bean:define id="parentQuoteVerId" name="aQuote" property="verId"/>
					<bean:define id="quoteId" name="aQuote" property="quoteId" />
					<bean:define id="quoteName" name="aQuote" property="quoteName" />
					<bean:define id="product" name="aQuote" property="quoteId" />
					<bean:define id="company" name="aQuote" property="companyName" />
					<bean:define id="planName" name="aQuote" property="healthInsPlanDetail" />
					<bean:define id="totalPremium" name="aQuote" property="totalPremium" />
					<bean:define id="fee1" name="aQuote" property="fee1" />
					<bean:define id="fee2" name="aQuote" property="fee2" />
					<%
					double grandTotal = 0;
					double dbTotalPremium = 0;
					double dbFee1 = 0;
					double dbFee2 = 0;
					try{
						dbTotalPremium = Double.parseDouble(""+totalPremium);
					}catch(Exception ex){}
					try{
						dbFee1 = Double.parseDouble(""+fee1);
					}catch(Exception ex){}
					try{
						dbFee2 = Double.parseDouble(""+fee2);
					}catch(Exception ex){}
					grandTotal = dbTotalPremium + dbFee1 + dbFee2;
					%>
						<TR height="25px">
						
						<TD class=<%= styleClass %>  align="center">
						<logic:present name="LoginPage" scope="session">
						
						<a href="../SyncQuoteWithEmployerGroupAndProductAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(QuoteId)=<%=""+quoteId%>&answer(parentQuoteId)=<bean:write name='aQuote' property='quoteId' />&answer(ownerId)=<%=ownerId1.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(userId)=<%=""+userId%>&answer(Object::Customer::State)=<bean:write name='aQuote' property='customerState' />">
<!-- Added to show subnumber along with quote number start -->
						
						<bean:define id="quoteSubNum" name="aQuote" property="quoteSubNumber"/>
						<bean:write name="aQuote" property="quoteNumber"/><%try{if(Integer.parseInt(""+quoteSubNum.toString())>=1){%>-<%=""+quoteSubNum%><%}
							}
							catch(NumberFormatException nfe)
							{}
						%>
<!-- Added to show subnumber along with quote number end -->
						<BR></a>
						</logic:present></TD>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_NAME_VIEW"}%>' connector='or' negated="true">  		
							<TD class=<%= styleClass %>  align="center"><bean:write name="aQuote" property="quoteName" /></TD>
						</dmshtml:dms_static_with_connector>
						<TD class=<%= styleClass %> align="left"><bean:write name="aQuote" property="quoteStartDate" /></TD>
						<TD class=<%= styleClass %> align="center"><bean:write name="aQuote" property="quoteStatus" /></TD>
						<td class=<%= styleClass %> ><bean:write name="aQuote" property="quoteType" /></td>	
						<TD class=<%= styleClass %> align="left"><bean:write name="aQuote" property="createdDate" /></TD>
						<TD class=<%= styleClass %> align="left"><bean:write name="aQuote" property="updatedDate" /></TD>
						<td class=<%= styleClass %> align="right"><dmshtml:CurrencyFormatTag digits="2" format='<%=""+grandTotal%>' /></td>	
						<td class=<%= styleClass %>>&nbsp;&nbsp;
						<%String copyQuoteID = "window.location=document.getElementById('Copy_Quote_"+count+"');"; %>
						<a href="../CopyQuoteCL.do?TabPanelName=Quote_Panel&quoteId=<%=""+quoteId%>&answer(Entity::Equals::OwnerId)=<%=ownerId1.toString()%>&parentQuoteVerId=<%=""+parentQuoteVerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::Customer::State)=<bean:write name='aQuote' property='customerState' />" id='<%="Copy_Quote_"+count %>' /><html:button styleClass="linkButton" property="answer(CopyQuote)" value="Copy Quote" onclick='<%=""+copyQuoteID %>'/><BR></a>					        	
							</td>
						</td>
						<% if(deletePrivilege){%>
							<td class="SearchResult">							
								<dmshtml:dms_multibox property="answer(Object::Quote::QuoteId)" value="<%=""+quoteId%>" styleId="<%="quoteDelCheckbox"+count%>" >
								</dmshtml:dms_multibox>
							</td>	
						<%}%>

					</TR>
					</logic:iterate>
					</logic:present>
					<logic:notPresent name="quoteDetails" scope="request">
					<tr>
						<td colspan="3">
						<span class="Error">Currently no Quotes are listed</span></td>
					</tr>
					</logic:notPresent>

						
				</table></td></tr>




				<tr><td>&nbsp;</td></tr>

				<logic:present name="AddParentQuote" >
					<%
					boolean errorOccured=false;
					%>
					<bean:define id="ansmap" name="AddParentQuote" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>
					<logic:iterate id="element" name="ansmap">
					<bean:define id="errorListkey" name="element" property="key" />
					<logic:equal name="errorListkey" value="Object::error::list">
					<bean:define id="errorListvalue" name="element" property="value" />
					<logic:iterate id="errmsg" name="errorListvalue">
					<tr>
						<td class="Error" >
						<bean:write name="errmsg" property="errorMessage" />
						<%
						errorOccured	=true;				
						%>
						</td>
					</tr>
					</logic:iterate>
					</logic:equal>
					</logic:iterate> 
					<%
					if(errorOccured)
					{((com.dms.ejb.data.QuestionHashMap)ansmap).remove(com.dms.util.Constants.RULE_EXECUTION_STAUS);
					((com.dms.ejb.data.QuestionHashMap)ansmap).remove("Object::error::list");
					}
					%>
					</logic:present>



			<tr>
				<% if(deletePrivilege){%>
				<td colspan="6">
				<%}else{%>
				<td colspan="5">
				<%}%>
				<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">


				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<% if(deletePrivilege){%>
					<td>&nbsp;</td>
					<%}%>
				</tr>
				<tr>
	
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>
				<td >&nbsp;</td>				
				<% if(deletePrivilege){%>
					<td align="right" >
						<html:submit value="Delete" styleClass="sbttn" />
					</td>
				<%}%>
				</tr>
				</table></td>
				
				</tr>
		</table></td></tr>
	</table></td></tr>
</table>
			<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=""+agencyIdTemp%>" />
			<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+customerId%>" />
			<html:hidden property="answer(Entity::Equals::OwnerId)" value="<%=""+ownerId%>" />
			<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId%>" />
			<html:hidden property="answer(Object::Customer::State)" value="<%=""+EmpGrpState%>" />
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>

