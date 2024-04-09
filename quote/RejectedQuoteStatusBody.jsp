<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>

<html:form action="/SaveRejectStatus.do" >
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
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
			
			String strParentQuoteId="";
			if(request.getParameter("answer(parentQuoteId)")!=null)
			{
				strParentQuoteId=request.getParameter("answer(parentQuoteId)");
			}
			
			String strParetQuoteStatus="";
			if(request.getParameter("answer(Object::Quote::QuoteStatus)")!=null)
			{
				strParetQuoteStatus=request.getParameter("answer(Object::Quote::QuoteStatus)");
			}
			
			String ProductVerId="";
			if(request.getParameter("answer(Object::Quote::ProductVerId)")!=null)
			{
				ProductVerId=request.getParameter("answer(Object::Quote::ProductVerId)");
			}

	if(request.getParameter("quoteId")!=null)
			{
		%>
	<html:hidden name="AddQuote" property="quoteId" value="<%=request.getParameter("quoteId")%>"/>
	<%
			}
	%>
	<tr>
		<td>	
			&nbsp;
		</td>
	</tr>
		<%
		String memberAssociation="";
		if(request.getParameter("answer(Object::Quote::MemberAssociation)")!=null){
			memberAssociation=request.getParameter("answer(Object::Quote::MemberAssociation)");
		}
		
		String compositeRate="";
		if(request.getParameter("answer(Object::Plan::CompositeRateFlag)")!=null){
			compositeRate=request.getParameter("answer(Object::Plan::CompositeRateFlag)");
		}
		%>
	
</table>
<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td >
			<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
		</td>
	</tr>
	<bean:define id="paretQuoteStatus" name="AddQuote" property="answer(Object::Quote::QuoteStatus)"/>
	<tr>
		<td>
			<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">

				<tr>
					<td >
						<table width="60%" align="Left" border="0">
								<jsp:include page="../common/QuoteHeader.jsp">
									<jsp:param name="parentQuoteId" value="<%=""+strParentQuoteId%>" />
									<jsp:param name="productVerId" value="<%=""+ProductVerId%>" />
									<jsp:param name="heading" value="<%="REJECT QUOTE"%>" />
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
									<table width="100%" BORDER="0">
										<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
										<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
										<tr><td><html:hidden property="answer(ownerId)" value="<%=ownerId.toString()%>" /></td></tr>
										<tr>
													
										<bean:define id="parentQuoteId" name="AddQuote" property="answer(Object::Quote::Id)"/>
												<%
												if(request.getParameter("answer(Object::Customer::CustomerId)")!=null)
												{
												 
												%>
												
												<td><html:hidden name="AddQuote" property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>"/>
												</td>
							

												<%
													}
												%>
											<td colspan="2" class="links"><a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=strParentQuoteId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>">
												Quote Summary</a>
											</td>

										</tr>

										<tr>
											<td  colspan="8" align="center" class="sectionhead">
											
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
							<tr>
								<td>
									<table width="100%" border="0" align="left">						
										<tr>
											<td class="TextMatter1" align="right">
												Reason for rejection
											</td>
											<td align="left">
												<dmshtml:dms_textarea styleClass="txtarea" name="AddQuote"  property="answer(Object::QuoteAdditional::RejectedNotes)" rows="3" cols="60"/>
											</td>
										</tr>			
									</table>
								</td>
							</tr>
							<tr><td><html:hidden property="answer(Object::Quote::QuoteStatus)" value="Rejected" /></td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td align="center" class="links" colspan="4">
									<dmshtml:dms_isPresent property='<%=new String[]{"Sold", "Lost", "Rejected"}%>' value="<%=strParetQuoteStatus.toString()%>" >	
										<INPUT TYPE="submit" value="Save" class="sbttn">
									</dmshtml:dms_isPresent>	
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td colspan="3">
									&nbsp;
								</td>
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
	<tr>
		<td>

			<html:hidden name="AddQuote" property="formName" value="form::CREATEQUOTEVERSION"/>
			<html:hidden property="page" value="7" />
			
			<!-- new changes for workflow -->
			<html:hidden property="answer(object::workflow::processdata::offered)" value="no" />
			<html:hidden property="answer(object::workflow::processdata::pName)" value="no" />
			<html:hidden property="answer(object::workflow::processdata::modify)" value="no" />
			<html:hidden property="answer(object::workflow::processdata::reapply)" value="no" />
			<html:hidden property="answer(object::workflow::processdata::changeType)" value="" />
			<html:hidden property="answer(object::workflow::processdata::rejected)" value="yes" />
			<html:hidden property="answer(object::workflow::processdata::lost)" value="no" />
			<input type="hidden" name="action" value="complete">
			<html:hidden name="AddQuote" property="answer(Object::Product::ProductState)" value="RELEASED"/>
			<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>"/>
			<!-- new changes for workflow -->
			
			<!-- New hidden variables -->
			
			<html:hidden name="UWWorkSheet" property="answer(Object::Product::ProductState)" value="RELEASED"/>
			<html:hidden property="answer(QuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(parentQuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(Quote::Page)" value="StatusChange" />
			<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::Notes)" value="TestNote"/>
			<html:hidden property="answer(Object::Quote::LockStatus)" value="Locked" />
			<html:hidden property="answer(Object::Quote::MemberAssociation)" value='<%=""+memberAssociation %>' />
			<html:hidden property="answer(Object::Plan::CompositeRateFlag)" value='<%=""+compositeRate %>' />
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
		</td>
	</tr>
</table>
</html:form>

