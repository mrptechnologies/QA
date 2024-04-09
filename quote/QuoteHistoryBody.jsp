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

<html:form action="/DeleteQuoteConfirmAction" onsubmit="return validateDelete(this)">
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="roleId" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session"/>


<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
<tr><td colspan="2">
	<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr><td>
		<jsp:include page="../common/CustomerAgencyLinkspage.jsp" /></td></tr>
	<tr><td>
	</table>
	<tr><td>
	<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<% boolean deletePrivilege = false; %>
	<dmshtml:dms_static_with_connector ruleName='privilage'  property='<%=new String[]{"DELETE_QUOTE"}%>' connector='or' negated="true">
		<% deletePrivilege = true; %>
	</dmshtml:dms_static_with_connector>
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
	<bean:parameter id="agencyIdTemp" name="answer(Object::Agency::AgencyId)" />
	<bean:parameter id="customerId" name="answer(Object::Customer::CustomerId)" />
	<bean:define id="ownerId1" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
    
		<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">

			
			<tr><td colspan="5">
				<table WIDTH="760px" ALIGN="center" cellspacing=0 cellpadding="0" border="0">
					
					
					<dmshtml:Get_QuoteDetails_ByCustomerId nameInSession="quoteDetails" objectId="<%=customerId.toString()%>" objectType="CUSTOMER" ownerId='<%=""+ownerId1%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />

					
					
					<logic:present name="quoteDetails" scope="request">
					<TR>
						<td class="sectionhead" align="center">Quote No.</td>
						<td class="sectionhead" align="center" >Last Saved Date</td>
						<td class="sectionhead" align="center" >Status</td>		
						<td class="sectionhead" align="center" >Quote Type</td>		
						<td class="sectionhead" align="center" >Total Premium</td>		
						<!--  td class="sectionhead" align="center" >&nbsp;</td -->
						<% if(deletePrivilege){%>
						<td class="sectionhead" align="left" >Select</td>
						<%}%>
					</TR>
					<%int count=0;%>
					<logic:iterate id="aQuote" name="quoteDetails" scope="request">
						<%count++;%>
					<bean:define id="parentQuoteVerId" name="aQuote" property="verId"/>
					<bean:define id="quoteId" name="aQuote" property="quoteId" />

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
						<TR>
						<bean:define id="ownerId1" property="answer(Object::Quote::ownerId)" name="LoginPage" scope="session"/> 
						<TD class="SearchResult" align="right">
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
						<TD class="SearchResult" align="center"><bean:write name="aQuote" property="updatedDate" /></TD>
						<TD class="SearchResult" align="center"><bean:write name="aQuote" property="quoteStatus" /></TD>
						<td class="SearchResult" align="center"><bean:write name="aQuote" property="quoteType" /></td>	
						<td class="SearchResult" align="right"><dmshtml:CurrencyFormatTag digits="2" format='<%=""+grandTotal%>' /></td>	
						<!-- td class="TextMatter1">&nbsp;&nbsp; -->
							<!-- a href="../CopyQuote.do?TabPanelName=Quote_Panel&quoteId=<%=""+quoteId%>&answer(Entity::Equals::OwnerId)=<%=ownerId1.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::Customer::State)=<bean:write name='aQuote' property='customerState' />" / -->
								<!-- Copy<BR>
							<!--  /a >
						</td> -->
						<% if(deletePrivilege){%>
							<td class="SearchResult" align="center">							
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
				<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">


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
				<td align="left" class="links" >				
				<bean:define id="ObjectId" property="answer(Object::UserDetail::PrimaryObjectId)" name="LoginPage"
				scope="session"/>
				<bean:define id="ObjectType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage"
				scope="session"/>
				<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 			

				<dmshtml:Get_Customer_HeaderDetail_ByCustomerId nameInSession="customerMap" customerId='<%=""+customerId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' 
				/>
				<bean:define id="customerDetailMap" name="customerMap" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
				<%String EmpGrpState=customerDetailMap.getString("Object::Customer::State");%>
				
				<dmshtml:dms_isPresent property="<%=new String[]{"SYS-ADMIN","UNDERWRITER"}%>" value="<%=""+roleId%>" negated="true">
								
					
		
				</dmshtml:dms_isPresent>
				
				<% String roleType =""+roleId; 
				
					//if(roleType.equals("SYS-ADMIN") || roleType.equals("UNDERWRITER") ||roleType.equals("SALESMANAGER")||roleType.equals("ADMIN")||roleType.equals("USER")){%>				
						<a href="../NewHealthinsQuote.do?TabPanelName=Quote_Panel&answer(createQuoteEffectiveDate)=yes&answer(Object::Quote::primaryEntityId)=<%=ObjectId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&formName=form::ADDQUOTEDETAILS&answer(Object::Quote::QuoteStatus)=In Progress&answer(Object::Quote::OwnerId)=<%=ownerId.toString()%>&answer(Object::Quote::CreatedBy)=<%=userId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::Risk::RiskId)=5&answer(Object::Quote::ProductStatus)=RELEASED&answer(State)=<%=EmpGrpState%>">New Quote</a>
						</td>
					</tr>
					<%//}else{%>
					 <tr>
						<!--<td class="TextMatter1">New Quote</td>
					</tr>
					<tr><td >&nbsp;</td></tr>					
					
					<tr>
					<td align="left" class="ErrorSearchResult" >				
						Please be patient, new business quoting capability is temporarily under reconstruction; 
						in the meantime please redirect your new business quote requests to:
						<br><br>
						Healthcare Risk Consultants c/o jdoyle@hrc-llc.com (tel: 630.848.8070; fax: 866.312.2331)
						<br><br>or
						<br><br>
						McKee Benefit Service Corporation at www.mckee-enrollment.com</a>
						
					</td><%//}
				//}else {%>
					<td align="left" class="links" >
						<a href="../NewHealthinsQuote.do?TabPanelName=Quote_Panel&answer(createQuoteEffectiveDate)=yes&answer(Object::Quote::primaryEntityId)=<%=ObjectId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&formName=form::ADDQUOTEDETAILS&answer(Object::Quote::QuoteStatus)=In Progress&answer(Object::Quote::OwnerId)=<%=ownerId.toString()%>&answer(Object::Quote::CreatedBy)=<%=userId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::Quote::ProductStatus)=RELEASED&answer(State)=<%=EmpGrpState%>">New Quote</a>		
				 -->	
					<!-- </td> -->
								
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
			<html:hidden property="answer(Object::Risk::RiskId)" value="5"/>
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>

