<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>

		<%
			
			String agencyIdTemp="";
			if(request.getParameter("answer(Object::Agency::AgencyId)")!=null)
			{
				agencyIdTemp=request.getParameter("answer(Object::Agency::AgencyId)");
			}
		
			String customerId="";
			if(request.getParameter("answer(Object::Customer::CustomerId)")!=null)
			{
				customerId=request.getParameter("answer(Object::Customer::CustomerId)");
			}
			
			String strParetQuoteStatus="";
			if(request.getParameter("answer(Object::Quote::QuoteStatus)")!=null)
			{
				strParetQuoteStatus=request.getParameter("answer(Object::Quote::QuoteStatus)");
			}

			String strParentQuoteId="";
			if(request.getParameter("answer(parentQuoteId)")!=null)
			{
				strParentQuoteId=request.getParameter("answer(parentQuoteId)");
			}
			
			String strParentQuoteVerId="";
			if(request.getParameter("answer(parentQuoteVerId)")!=null)
			{
				strParentQuoteVerId=request.getParameter("answer(parentQuoteVerId)");
			}

			String ProductVerId="";
			if(request.getParameter("answer(Object::Quote::ProductVerId)")!=null)
			{
				ProductVerId=request.getParameter("answer(Object::Quote::ProductVerId)");
			}
			String compositeRate="";
			if(request.getParameter("answer(Object::Plan::CompositeRateFlag)")!=null){
				compositeRate=request.getParameter("answer(Object::Plan::CompositeRateFlag)");
			}
			String isApplnAvailable="";
			if(request.getParameter("answer(isApplnAvailable)")!=null){
				isApplnAvailable=request.getParameter("answer(isApplnAvailable)");
			}
			String ProductId="";
			if(request.getParameter("answer(Object::Quote::ProductId)")!=null)
			{
				ProductId=request.getParameter("answer(Object::Quote::ProductId)");
			}else if(request.getParameter("answer(ProductId)")!=null){
				ProductId=request.getParameter("answer(ProductId)");				
			}
			
		%>		
	
<bean:define id="parentQuoteVerId" name="AddQuote" property="answer(Object::Quote::ParentQuoteVerId)" />

<bean:define id="parentPolicyId" name="AddQuote" property="answer(Object::Policy::ParentPolicyId)" />
<bean:define id="parentPolicyVerId" name="AddQuote" property="answer(Object::Policy::ParentPolicyVerId)" />		
<bean:define id="policyNumber" name="AddQuote" property="answer(policyNumber)" />		
<bean:define id="prevSubQuoteVerId" name="AddQuote" property="answer(Object::Quote::PrevSubQuoteVerId)" />

<script type="text/javascript">
function disableButton(frm){
document.getElementById("ConfirmSubmit").disabled = true;
}
</script>

<%

if((""+parentPolicyId).equalsIgnoreCase("") || parentPolicyId==null){
if(request.getParameter("answer(parentPolicyId)")!=null)
{
	parentPolicyId=request.getParameter("answer(parentPolicyId)");
	
}
}


if((""+parentPolicyVerId).equalsIgnoreCase("") || parentPolicyVerId==null){
if(request.getParameter("answer(Object::Policy::ParentPolicyVerId)")!=null)
{
	parentPolicyVerId=request.getParameter("answer(Object::Policy::ParentPolicyVerId)");
	
}	
}

%>		

		
<html:form action="/SaveReferralQuoteStatus.do" onsubmit="disableButton(this)">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden name="parentPolicyId" property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
<html:hidden name="parentPolicyVerId" property="answer(Object::Policy::ParentPolicyVerId)" value="<%=parentPolicyVerId.toString()%>" />
<html:hidden name="policyNumber" property="answer(policyNumber)" value="<%=""+policyNumber%>" />
<bean:define id="isRenewalEndorsement" name="AddQuote" property="answer(isRenewalEndorsement)" />
<% 
	boolean isRenewal = false;
	if((""+isRenewalEndorsement).equalsIgnoreCase("YES")){
		isRenewal = true;
	}else{
		isRenewal = false;
	}
%>

<bean:define id="paretQuoteStatus" name="AddQuote" property="answer(Object::Quote::QuoteStatus)"/>
<%
String memberAssociation="";
if(request.getParameter("answer(Object::Quote::MemberAssociation)")!=null){
	memberAssociation=request.getParameter("answer(Object::Quote::MemberAssociation)");
}
%>

<%
if(request.getParameter("quoteId")!=null)
			{
		%>
<html:hidden name="AddQuote" property="quoteId" value="<%=request.getParameter("quoteId")%>"/>
<%
			}			
%>
<table WIDTH="760px" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	<tr>
		<td>
			<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			  <logic:equal parameter="answer(Object::Quote::QuoteType)" value="ENDORSEMENT" scope="request" >
				<tr>
					<td >
						<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td>
							<div id="QuoteInsuerdAgencyAgentHeader">
								<jsp:include page="../common/QuoteInsuredAgencyLink.jsp">
								<jsp:param name="parentQuoteId" value="<%=""+strParentQuoteId%>" />
								<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus%>" />
								</jsp:include>
								</div>
								</td>
							</tr>
			   </logic:equal>
			   <logic:equal parameter="answer(Object::Quote::QuoteType)" value="ENDORSEMENT" scope="request" >
				<tr>
					<td align="left" colspan=2>
						<table width="950px" align="left" border="0" >
							<tr>
							<td class="NewSectionHead" align="center">REFER QUOTE</td>
							</tr>
						</table>
					</td>
				</tr>			   
				</logic:equal>
						
							<tr>
								<td>
									<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
									
		                               <logic:equal parameter="answer(Object::Quote::QuoteType)" value="ENDORSEMENT" scope="request" >
											<tr>
												<td>
													<table WIDTH="100%" BORDER="0" align="left" CELLSPACING="0" CELLPADDING="0">
													 	<tr>
															<td align="left">			
															<%if(isRenewal) { %>
																<jsp:include page="../common/DynamicPolicyHeader.jsp">
																	<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
																	<jsp:param name="policyVerId" value="<%=""+parentPolicyVerId.toString()%>" />
																	<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
																	<jsp:param name="quoteId" value="<%=""+strParentQuoteId%>" />
																	<jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
																	<jsp:param name="title" value="<%="EXPIRING POLICY SUMMARY"%>" />
																</jsp:include>	
															<%} else { %>
																<jsp:include page="../common/DynamicPolicyHeader.jsp">
																	<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
																	<jsp:param name="policyVerId" value="<%=""+parentPolicyVerId.toString()%>" />
																	<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
																	<jsp:param name="quoteId" value="<%=""+strParentQuoteId%>" />
																	<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
																</jsp:include>	
															<%} %>
															 </td>
													  	</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td>
													<table WIDTH="100%" BORDER="0" align="left" CELLSPACING="0" CELLPADDING="0">
													 	<tr>
															<td align="left">	
																<jsp:include page="../common/EndorsementQuoteHeader.jsp">
																	<jsp:param name="quoteId" value="<%=""+strParentQuoteId%>" />
																	<jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
																</jsp:include>	
															</td>
														</tr>		
													</table>	
												</td>
											</tr>											
										</logic:equal>
										<logic:notEqual parameter="answer(Object::Quote::QuoteType)" value="ENDORSEMENT" scope="request" >
										<tr>
											<td>
																						
												<jsp:include page="/common/QuoteHeaderCreateQuoteCoverMin.jsp">
									
													<jsp:param name="answer(Object::Quote::ObjectId)" value="<%=""+strParentQuoteId%>" />
													<jsp:param name="answer(policyNumber)" value="<%=""+policyNumber%>" />
													
												</jsp:include>
											
											</td>
										</tr>
										</logic:notEqual>
										<tr>
											<td align="left">
	
												<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">
													<tr>
														<td>

															<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
															<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
															<html:hidden property="answer(ownerId)" value="<%=ownerId.toString()%>" />
														</td>
													
		
		
		
														<bean:define id="parentQuoteId" name="AddQuote" property="answer(Object::Quote::Id)"/>
														
															<%
															if(request.getParameter("answer(Object::Customer::CustomerId)")!=null)
															{
												             
															%>
															<td>
															<html:hidden name="AddQuote" property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>"/>
															</td>
		

																<%
																	}
																%>
																</tr><tr>
														<td colspan="2" class="links">
															<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=strParentQuoteId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>&answer(Object::Policy::ParentPolicyVerId)=<%=parentPolicyVerId %>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>&answer(policyNumber)=<%=""+policyNumber%>" title="<bean:message key='ToolTip.ReferQuote.QuoteSummary'/>">Go to Quote Summary</a>
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"REFER_WORKSHEET_LINK"}%>' connector='or' negated="true">				
																<dmshtml:Get_All_Plan_HeaderDetails nameInSession="subQuotes" parentQuoteId='<%=""+strParentQuoteId%>'	dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  />
																<logic:present name="subQuotes" scope="request">
																	<bean:define id="subQuoteArr" name="subQuotes" scope="request" type="java.util.ArrayList" />
																	<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">
																		<bean:define id="subQuoteId" name="aSubQuote" 	property="quoteId" />
																		<% if((""+isRenewalEndorsement).equalsIgnoreCase("YES")){%>
																		<a href='../GetEndorsementUWWorkSheetAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(productId)=<%=""+ProductId %>&answer(productVerId)=<%=""+ProductVerId %>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(ownerId)=<%=ownerId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>&answer(parentQuoteVerId)=<%=strParentQuoteVerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(customerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(customerNumber)=<%=customerId.toString()%>&answer(modQuoteNumber)=<%=""+strParentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>&answer(prevSubQuoteVerId)=<%=""+prevSubQuoteVerId%>' title="<bean:message key='ToolTip.ReferQuote.Worksheet'/>">Go to Underwriter Worksheet</a>																		
																		<%}else{ %>
																	 	<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=strParentQuoteId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>&answer(Object::Policy::ParentPolicyVerId)=<%=parentPolicyVerId %>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(activeTabName)=UW_WORKSHEET_Tab" title="<bean:message key='ToolTip.ReferQuote.Worksheet'/>">Go to Underwriter Worksheet</a>
																	 	<%} %>
																	</logic:iterate>
																</logic:present>
															</dmshtml:dms_static_with_connector>
														</td>														
													</tr>
													<tr>
														<td  colspan="8" align="center" class="sectionhead"></td>
													</tr>
													<bean:parameter id="actionStatus" name="action" value="CreateQuoteProposal"/>
													<logic:notEqual name="actionStatus" value="submit">
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DISPLAY_RULES_MSG"}%>' connector='or' negated="true">
													<tr>
														<td class="Error">
																			
															<logic:present name="MESSAGE_LIST" scope="request">
															<ol>
																<logic:iterate id="message" name="MESSAGE_LIST">
																
																<li><bean:write name="message"/></li>
																</logic:iterate>
															</ol>			
															</logic:present>
																					
													</td></tr>
													
													</dmshtml:dms_static_with_connector>
													</logic:notEqual>
													<%int indx1 =0;  %>
													<logic:notEqual name="actionStatus" value="submit">
       													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DISPLAY_RULES_MSG"}%>' connector='or' negated="true">
														<%boolean isReferralRulesDisplay=false; %>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"LIBERTY_GENIUSADDRESS"}%>' connector='or' negated="true">
														<% isReferralRulesDisplay=true; %>
														</dmshtml:dms_static_with_connector>	
														<%if(isReferralRulesDisplay){%>
															<tr>
      															<td class="Error">
																<ol>															
	                  												<li style="{COLOR: #ff0000;FONT-WEIGHT: bold}">This submission requires referral to an Underwriter</li>	                 															
																</ol>   					
       															</td>
       														</tr>
															<tr style="display:none;">
      															<td class="Error">
       																<logic:present name="MESSAGE_LISTS" scope="request">       																	
              	 														<ol>
																		<%String MessagesList="<br/>";%>	
															                <logic:iterate id="InnerMessageList" name="MESSAGE_LISTS">
																				
															                   	<%int flag=0; %>
																                <logic:iterate id="message" name="InnerMessageList">
																				  
																                <%
																                if(flag==0){%>
																                <bean:define id="msg" name="message"></bean:define>
																                <%String strMsg =  ""+msg;%>
																              <%
																              if(!strMsg.equals("")){
																              if(!strMsg.trim().equals("")){%>
																			   <%MessagesList=MessagesList+strMsg+""+"<br/>";%>
	                  																<p style="{FONT-WEIGHT: bold;COLOR: #2437A0;FONT-FAMILY: Verdana, Arial, Helvetica}"><%=""+strMsg.replaceAll("<","&lt;") %></p>
	                 															<%}flag=1;}}else{ indx1 = indx1+1;%>
																				 <%MessagesList=MessagesList+message+""+"<br/>";%>
	                  																<li style="{COLOR: #ff0000;FONT-WEIGHT: bold}"><bean:write name="message"/></li>
	                 															<%} %>
	                 															</logic:iterate>
																				
                															</logic:iterate>
																			
																			<html:hidden property="answer(Object::Quote::Messagelist)" value='<%=""+"<font color='RED'>"+MessagesList+"</font>"%>' />
               															</ol>   
               														</logic:present>
       															</td>
       														</tr>
       														<% int indx2 = 0; %>
       														<tr style="display:none;">
       														<td class="Error">
       														<logic:present name="QUOTE_INSURED_MESSAGE_LISTS" scope="request">       															
       															<ol>
																<%String QuoteInsuredMessagesList="<br/>";%>		
       															<logic:iterate id="InnerMessageList" name="QUOTE_INSURED_MESSAGE_LISTS">       				
																									
													                   	<%int flag1=0; %>
														                <logic:iterate id="message" name="InnerMessageList">
														                
														                <%
														                if(flag1==0){%>
														                <bean:define id="msg" name="message"></bean:define>
														                <%String strMsg1 =  ""+msg;%>
														              <%
														              if(!strMsg1.equals("")){
														              if(!strMsg1.trim().equals("")){%>
																	  <%QuoteInsuredMessagesList=QuoteInsuredMessagesList+strMsg1+""+"<br/>";%>
          																<p style="{FONT-WEIGHT: bold;COLOR: #2437A0;FONT-FAMILY: Verdana, Arial, Helvetica}"><%=""+strMsg1 %></p>
         															<%}flag1=1;}}else{ indx2 = indx2+1;%>
																	<%QuoteInsuredMessagesList=QuoteInsuredMessagesList+message+""+"<br/>";%>
          																<li style="{COLOR: #ff0000;FONT-WEIGHT: bold}"><bean:write name="message"/></li>
         															<%} %>         															
         															</logic:iterate>	        														 
       															</logic:iterate>
																<html:hidden property="answer(Object::Quote::Messagelist)" value='<%=""+"<font color='RED'>"+QuoteInsuredMessagesList+"</font>"%>' />
       															</ol>  										
       														</logic:present>
       														</td>
       														</tr>
														<%}else{%>
       														<tr>
      															<td class="Error">
       																<logic:present name="MESSAGE_LISTS" scope="request">       																	
              	 														<ol>
															                <logic:iterate id="InnerMessageList" name="MESSAGE_LISTS">
															                   	<%int flag=0; %>
																                <logic:iterate id="message" name="InnerMessageList">
																                <%
																                if(flag==0){%>
																                <bean:define id="msg" name="message"></bean:define>
																                <%String strMsg =  ""+msg;%>
																              <%
																              if(!strMsg.equals("")){
																              if(!strMsg.trim().equals("")){%>
	                  																<p style="{FONT-WEIGHT: bold;COLOR: #2437A0;FONT-FAMILY: Verdana, Arial, Helvetica}"><%=""+strMsg.replaceAll("<","&lt;") %></p>
	                 															<%}flag=1;}}else{ indx1 = indx1+1;%>
	                  																<li style="{COLOR: #ff0000;FONT-WEIGHT: bold}"><bean:write name="message"/></li>
	                 															<%} %>
	                 															</logic:iterate>
                															</logic:iterate>
               															</ol>   
               														</logic:present>
       															</td>
       														</tr>
       														<% int indx2 = 0; %>
       														<tr>
       														<td class="Error">
       														<logic:present name="QUOTE_INSURED_MESSAGE_LISTS" scope="request">       															
       															<ol>
       															<logic:iterate id="InnerMessageList" name="QUOTE_INSURED_MESSAGE_LISTS">       															
													                   	<%int flag1=0; %>
														                <logic:iterate id="message" name="InnerMessageList">
														                
														                <%
														                if(flag1==0){%>
														                <bean:define id="msg" name="message"></bean:define>
														                <%String strMsg1 =  ""+msg;%>
														              <%
														              if(!strMsg1.equals("")){
														              if(!strMsg1.trim().equals("")){%>
          																<p style="{FONT-WEIGHT: bold;COLOR: #2437A0;FONT-FAMILY: Verdana, Arial, Helvetica}"><%=""+strMsg1 %></p>
         															<%}flag1=1;}}else{ indx2 = indx2+1;%>
          																<li style="{COLOR: #ff0000;FONT-WEIGHT: bold}"><bean:write name="message"/></li>
         															<%} %>         															
         															</logic:iterate>         														 
       															</logic:iterate>
       															</ol>  										
       														</logic:present>
       														</td>
       														</tr>
         															<%} %>         															
         															
       													</dmshtml:dms_static_with_connector>
       												</logic:notEqual>	
													<tr>
														<td>
															<table width="100%" border="0" align="left">
														
																<tr>
																	<td class="TextMatter1" align="right">		
																		Referral Notes
																	</td>
																	<td class="TextMatter1" align="left">																	
																	<bean:define id="referralNotes" name="AddQuote" property="answer(Object::QuoteAdditional::ReferralNotes)"/>
																	<%if(strParetQuoteStatus.equalsIgnoreCase("Referred")) { 
																	//if(!(""+referralNotes).equalsIgnoreCase("")) {%>
																		<dmshtml:dms_textarea styleClass="txtarea" name="AddQuote"  disabled="true" property="answer(Object::QuoteAdditional::ReferralNotes)" rows="6" cols="80" styleId="referralNotesTextArea"/>
																		<script type="text/javascript">
																			document.getElementById("referralNotesTextArea").disabled = true;
																		</script>
																	<%} else { %>
																		<dmshtml:dms_textarea styleClass="txtarea" name="AddQuote"  property="answer(Object::QuoteAdditional::ReferralNotes)" rows="6" cols="80"/>
																	<%} %>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td>
															<table width="100%" border="0" align="left">
																<tr>
																	<td>
																		&nbsp;
																	</td>
																</tr>
																<tr>
																	<td class="TextMatter" align="right">
																		Based on one or more of your answers to application questions we are unable to provide you with a quote proposal until your application has been referred to an underwriter for review. Referral Management can be used to track status and referred.
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<% int count=0; %>
													<dmshtml:Get_All_Plan_HeaderDetails nameInSession="subQuotes" parentQuoteId='<%=""+strParentQuoteId%>'	dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  />
													<logic:present name="subQuotes" scope="request">
														<bean:define id="subQuoteArr" name="subQuotes" scope="request" type="java.util.ArrayList" />
														<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">
															<bean:define id="subQuoteId" name="aSubQuote" 	property="quoteId" />
															<%count++; %>
															<% if(!isApplnAvailable.equals("No")){ %>
															<tr>
																<td colspan="2" class="links">
																	<a href='../CreateEILApplicationPdf.go?TabPanelName=Quote_Panel&answer(DocumentType)=APPLICATION&answer(QuoteId)=<%= strParentQuoteId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(OwnerId)=<%=ownerId.toString() %>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(QuoteStatus)=<%=paretQuoteStatus.toString()%>' target="_new"  title="<bean:message key='ToolTip.ReferQuote.ApplicationPDF'/>"><img src="../Images/pdficon.gif" width="15" border="0" alt="PDF">Plan <%= ""+count %> - Application PDF</a><br/>
																</td>
															</tr>
															<%} %>
														</logic:iterate>
													</logic:present>														

													<tr><td>
														<html:hidden property="answer(Object::Quote::QuoteStatus)" value="Referred" />
													</td></tr>
												</table>
											</td>
										</tr>
									</table>
									<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										<tr>
											<td align="center" class="links" colspan="4">
												<dmshtml:dms_isPresent property="<%=new String[]{"Sold", "Lost","Lapsed", "Rejected","Referred"}%>" value="<%=strParetQuoteStatus.toString()%>" >

													<INPUT TYPE="submit" style="width:120px" value="Confirm Referral" title="<bean:message key='ToolTip.ReferQuote.ConfirmReferral'/>" class="sbttn" id="ConfirmSubmit">
	
												</dmshtml:dms_isPresent>
											</td>

											<%-- <td title="<bean:message key='ToolTip.ReferQuote.Back'/>">
												<dmshtml:dms_button value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"/>
											</td>--%>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>

			<html:hidden name="AddQuote" property="formName" value="form::CREATEQUOTEVERSION"/>
			 <html:hidden name="AddQuote" property="answer(Object::Product::ProductState)" value="RELEASED"/>
			 <html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>"/>
			<html:hidden property="page" value="7" />
			
			
			<!-- New hidder variables -->
			<html:hidden property="answer(Object::Notes::Active)" value="Y" />
			<html:hidden property="answer(Object::Notes::UserName)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Notes::UserRole)" value="<%=userId.toString()%>" />
			
			<html:hidden name="UWWorkSheet" property="answer(Object::Product::ProductState)" value="RELEASED"/>
			<html:hidden property="answer(QuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(Object::Notification::Email::AttachmentCount)" value="0" />
			<html:hidden property="answer(parentQuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(Quote::Page)" value="StatusChange" />
			<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::LockStatus)" value="Unlocked" />
			<html:hidden property="answer(Object::Quote::MemberAssociation)" value='<%=""+memberAssociation%>' />
			<html:hidden property="answer(Object::Plan::CompositeRateFlag)" value='<%=""+compositeRate%>' />
			
			<html:hidden property="answer(Object::Quote::ParentQuoteVerId)" value='<%=""+strParentQuoteVerId%>' />	
			<html:hidden property="answer(Object::Alert::OwnerId)" value="<%=""+ownerId %>"/>			
			<html:hidden property ="answer(pagename)" value="Referral page" />
			<html:hidden property="answer(isUpdated)" value="Y" />
			<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
			<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
			<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>"/>
			<html:hidden property="answer(Object::Quote::ProductVerId)" value="<%=ProductVerId.toString()%>" />
			<html:hidden property="answer(Object::Quote::ProductId)" value="<%=ProductId.toString()%>" />
			<html:hidden property="answer(Object::Notes::Description)" value="Referral Notes"/>
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />			
			<input type="hidden" name="answer(Object::Quote::PrevSubQuoteVerId)" value="<%=prevSubQuoteVerId%>" />
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"REFERAL_HOME_FWD"}%>' connector='or' negated="true">
				<html:hidden property="answer(Object::Forward::PageForward)" value="REFERAL_BROKER" />
			</dmshtml:dms_static_with_connector>
			<bean:define id="isRenewalEndorsement" name="AddQuote" property="answer(isRenewalEndorsement)" />
			<html:hidden property="answer(isRenewalEndorsement)" value="<%=isRenewalEndorsement.toString()%>" />
			
		</td>
	</tr>

</table>    



</html:form>

<script type="text/javascript">
if((document.getElementById("quoteHeaderLink") != null) && (document.getElementById("quoteHeaderLink") != undefined)) {
	document.getElementById("quoteHeaderLink").onclick = function(){
	
		showHideHeader();
		var a = document.getElementById('Quote:TxtChange');
		var b = a.innerHTML;
		if(b == "Click here to hide detail") {
			document.getElementById('quoteheader_inner').style.height = "10em";
		}
		else {
			document.getElementById('quoteheader_inner').style.height = "1em";
		}
	}
}
</script>
