<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>



<bean:define id="parentQuoteId" name="ReactivateQuote" property="answer(parentQuoteId)" scope="request" />
<bean:define id="modQuoteNumber" name="ReactivateQuote" property="answer(modQuoteNumber)" scope="request" />
<bean:define id="ProductId" name="ReactivateQuote" property="answer(productId)" scope="request" />
<bean:define id="productVerId" name="ReactivateQuote" property="answer(productVerId)" scope="request" />
<bean:define id="productStatus" name="ReactivateQuote" property="answer(Object::Quote::ProductStatus)" scope="request" />
<bean:define id="groupId" name="ReactivateQuote" property="answer(Object::Quote::ProductGroupId)" />
<bean:define id="groupVerId" name="ReactivateQuote" property="answer(Object::Quote::ProductGroupVerId)" />
<bean:define id="customerId" name="ReactivateQuote" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="agencyId" name="ReactivateQuote" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="prevSubQuoteVerId" name="ReactivateQuote" property="answer(prevSubQuoteVerId)" /> 

<html:form action="/SaveReactivateQuoteStatus.do" onsubmit="disableButton(this)">
<table WIDTH="95%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>
			<table WIDTH="95%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td>	
						<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
					</td>
				</tr>
				<tr>
					<td>
						<table WIDTH="95%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td >
									<table width="60%" align="Left" border="0">
	
										<jsp:include page="../common/QuoteHeader.jsp">
											<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
											<jsp:param name="productVerId" value="<%=""+productVerId%>" />
											<jsp:param name="heading" value="<%="REACTIVATE QUOTE"%>" />
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
								<td align="left">
									<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">
										<tr>
											<td>
												<table width="100%" border="0">
													<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
													<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
													<tr><td><html:hidden property="answer(ownerId)" value="<%=ownerId.toString()%>" />
													</td></tr>
													<tr>
														<td colspan="2" class="links">
															<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>">Quote Summary</a>
														</td>														
													</tr>
													<tr>													
														<td  colspan="6" align="center" class="sectionhead">
														
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
									<table WIDTH="75%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">	
										<tr>
											<td class="TextMatter1" align="right">		
												Reason for Reactivation
											</td>
											<td class="TextMatter1" align="left">		
											<input type = text name="answer(Object::QuoteAdditional::ReactivationReason)" id="notesDesc" size="50" maxlength="54" />
											</td>
										</tr>
										<tr>
											<td class="TextMatter1" align="right">		
												Reactivation Notes
											</td>
											<td class="TextMatter1" align="left">
												<dmshtml:dms_textarea styleClass="txtarea" name="ReactivateQuote"  property="answer(Object::QuoteAdditional::ReactivationNotes)" rows="6" cols="80"/>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							
							<tr>
								<td>
									<table WIDTH="75%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										
										<tr>
											<td align="center" class="links" colspan="4">												
													<INPUT TYPE="submit" value="Confirm Reactive" class="sbttn">												
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<html:hidden property="TabPanelName" value="Quote_Panel" />
<html:hidden property="answer(Object::Notes::Active)" value="Y" />
<html:hidden property="answer(Object::Notes::Private)" value="Y" />
<html:hidden property="answer(Object::Notes::UserName)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Notes::UserRole)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
<html:hidden property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=""+customerId%>' />
<html:hidden property="answer(Object::Quote::LockStatus)" value="Unlocked" />
<html:hidden property="answer(Object::Quote::QuoteStatus)" value="In Progress" />
<html:hidden property="answer(isUpdated)" value="Y" />
			<html:hidden property="answer(pagename)" value="Reactivate page"/>
			<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
			<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
			<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>"/>
			
<html:hidden name="ReactivateQuote" property="answer(parentQuoteId)" value='<%=""+parentQuoteId %>' />
<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value="<%=""+prevSubQuoteVerId %>" />
</html:form>