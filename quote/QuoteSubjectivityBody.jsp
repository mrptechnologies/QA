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
			if(request.getParameter("answer(Object::Quote::ParentQuoteId)")!=null)
			{
				strParentQuoteId=request.getParameter("answer(Object::Quote::ParentQuoteId)");
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
			
			String parentQuoteVerId="";
			if(request.getParameter("answer(Object::Quote::ParentQuoteVerId)")!=null){
				parentQuoteVerId=request.getParameter("answer(Object::Quote::ParentQuoteVerId)");
			}
			String subQuoteId="";
			if(request.getParameter("answer(Object::Quote::SubQuoteId)")!=null){
				subQuoteId=request.getParameter("answer(Object::Quote::SubQuoteId)");
			}
			String subQuoteVerId="";
			if(request.getParameter("answer(Object::Quote::SuQuoteVerId)")!=null){
				subQuoteVerId=request.getParameter("answer(Object::Quote::SuQuoteVerId)");
			}
			String productId="";
			if(request.getParameter("answer(Object::Quote::ProductId)")!=null){
				productId=request.getParameter("answer(Object::Quote::ProductId)");
			}
		
		%>	
		
<div class="formpage" style="width:100% ;">	
<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	<tr>
		<td>
			<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td >
						<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
						<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
							<tr>
								<td>
									<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
								</td>
							</tr>
							</logic:notEqual>
							<tr>
								<td>
									<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
		                               <logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
										<tr>
											<td >
												<table width="100%" align="Left" border="0">
													<jsp:include page="../common/QuoteHeader.jsp">
														<jsp:param name="parentQuoteId" value="<%=""+strParentQuoteId%>" />
														<jsp:param name="productVerId" value="<%=""+ProductVerId%>" />
														<jsp:param name="heading" value="" />
													</jsp:include>
												</table>
											</td>
										</tr>
										</logic:notEqual>
											<td>
												<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=strParentQuoteId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>">Return to Quote Summary</a>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<!-- <a href="../quote/AddQuoteSubjectivity.jsp?TabPanelName=Quote_Panel&answer(Object::Quote::Subjectivity::QuoteSubjectivityId)=-1&answer(Object::Quote::ParentQuoteId)=<%=""+strParentQuoteId %>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ParentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(Object::Quote::SubQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Quote::SuQuoteVerId)=<%=""+subQuoteVerId%>&answer(Object::Quote::ProductId)=<%=""+productId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=strParetQuoteStatus.toString()%>">Add Manuscript Subjectivity</a> -->
											</td>
										<tr>
										
										</tr>
										<tr><td>&nbsp;</td></tr>
										<tr>
											<td class="NewSectionHeadNew" align="center">Subjectivity List</td>
										</tr>	
										<tr><td>&nbsp;</td></tr>	
										<tr><td align="left">
											<table width="18%">
											<tr><td class="SectionHead">&nbsp;&nbsp;&nbsp;&nbsp;Pre-bind Subjectivities</td><td></td></tr>	
											</table>
										</td></tr>
										<tr><td>&nbsp;</td></tr>							
										<tr>
											<td>
												<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
												<logic:present name="PreBindSubjectivityList">
													<tr>
														<td class="new_sectionhead"  width="5%">																														
															S.No																													
														</td>
														<td class="new_sectionhead"  width="45%">																														
															Subjectivity																													
														</td>
														<td class="new_sectionhead"  width="10%">																														
															Type																													
														</td>
														<td class="new_sectionhead"  width="8%">																														
															Level																													
														</td>
														<td class="new_sectionhead" width="13%">
															Location Name
														</td>
														<td class="new_sectionhead" width="13%">
															Tank Name
														</td>
														<td class="new_sectionhead"  width="100%">																														
															Status																													
														</td>
													</tr>
													
													<%int index=1; %>
												<logic:iterate id="PreBindSubjectivityList" name="PreBindSubjectivityList">
													<tr height="22">
														<td class="SearchResult"  background="">
															<a href="/EditSubjectivity.go?TabPanelName=Quote_Panel&answer(Object::Quote::Subjectivity::QuoteSubjectivityId)=<bean:write name="PreBindSubjectivityList" property="Object::Quote::Subjectivity::QuoteSubjectivityId" />&answer(Object::Quote::ParentQuoteId)=<%=""+strParentQuoteId %>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ParentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(Object::Quote::SubQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Quote::SuQuoteVerId)=<%=""+subQuoteVerId%>&answer(Object::Quote::ProductId)=<%=""+productId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=strParetQuoteStatus.toString()%>"><%=""+index%></a>
														</td>
														<td class="SearchResult"  background="">
															<a href="/EditSubjectivity.go?TabPanelName=Quote_Panel&answer(Object::Quote::Subjectivity::QuoteSubjectivityId)=<bean:write name="PreBindSubjectivityList" property="Object::Quote::Subjectivity::QuoteSubjectivityId" />&answer(Object::Quote::ParentQuoteId)=<%=""+strParentQuoteId %>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ParentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(Object::Quote::SubQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Quote::SuQuoteVerId)=<%=""+subQuoteVerId%>&answer(Object::Quote::ProductId)=<%=""+productId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=strParetQuoteStatus.toString()%>"><bean:write name="PreBindSubjectivityList" property="Object::Quote::Subjectivity::SubjectivityDesc" /></a>
														</td>
														<td class="SearchResult"  background="">
															<bean:write name="PreBindSubjectivityList" property="Object::Quote::Subjectivity::SubjectivityType" />
														</td>		
														<td class="SearchResult"  background="">
															<bean:define id="subjectivityLevel" name="PreBindSubjectivityList" property="Object::Quote::Subjectivity::SubjectivityLevel" />
															<%
																String level="";
																if((""+subjectivityLevel).equalsIgnoreCase("Risk")){
																	level = "Tank";
																}else{
																	level = ""+subjectivityLevel;
																}
															%>
															<%=""+level %>
														</td>
														<td class="SearchResult"  background="">
															<bean:write name="PreBindSubjectivityList" property="Object::Quote::Subjectivity::LocationName" />
														</td>
														<td class="SearchResult"  background="">
															<bean:write name="PreBindSubjectivityList" property="Object::Quote::Subjectivity::RiskName" />
														</td>
														<td class="SearchResult"  background="">
															<bean:write name="PreBindSubjectivityList" property="Object::Quote::Subjectivity::Status" />
														</td>										
													</tr>			
													<%index++;%>																																				
												</logic:iterate>													
												</logic:present>
													
												</table>																																					
											</td>
										</tr>
										<tr><td>&nbsp;</td></tr>
										<tr><td>&nbsp;</td></tr>
										<tr><td align="left">
											<table width="18%">
											<tr><td class="SectionHead">&nbsp;&nbsp;&nbsp;&nbsp;Post-bind Subjectivities</td><td></td></tr>	
											</table>
										</td></tr>							
										<tr><td>&nbsp;</td></tr>
										<tr>
											<td>
												<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
												<logic:present name="PostBindSubjectivityList">
													<tr>
														<td class="new_sectionhead"  width="5%">																														
															S.No																													
														</td>
														<td class="new_sectionhead"  width="45%">																														
															Subjectivity																													
														</td>
														<td class="new_sectionhead"  width="10%">																														
															Type																													
														</td>
														<td class="new_sectionhead"  width="8%">																														
															Level																													
														</td>
														<td class="new_sectionhead" width="13%">
															Location Name
														</td>
														<td class="new_sectionhead" width="13%">
															Tank Name
														</td>
														<td class="new_sectionhead"  width="100%">																														
															Status																													
														</td>
													</tr>
													
													<%int index1=1; %>
												<logic:iterate id="PostBindSubjectivityList" name="PostBindSubjectivityList">
													<tr height="22">
														<td class="SearchResult"  background="">
															<a href="/EditSubjectivity.go?TabPanelName=Quote_Panel&answer(Object::Quote::Subjectivity::QuoteSubjectivityId)=<bean:write name="PostBindSubjectivityList" property="Object::Quote::Subjectivity::QuoteSubjectivityId" />&answer(Object::Quote::ParentQuoteId)=<%=""+strParentQuoteId %>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ParentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(Object::Quote::SubQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Quote::SuQuoteVerId)=<%=""+subQuoteVerId%>&answer(Object::Quote::ProductId)=<%=""+productId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=strParetQuoteStatus.toString()%>"><%=""+index1%></a>
														</td>
														<td class="SearchResult"  background="">
															<a href="/EditSubjectivity.go?TabPanelName=Quote_Panel&answer(Object::Quote::Subjectivity::QuoteSubjectivityId)=<bean:write name="PostBindSubjectivityList" property="Object::Quote::Subjectivity::QuoteSubjectivityId" />&answer(Object::Quote::ParentQuoteId)=<%=""+strParentQuoteId %>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ParentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(Object::Quote::SubQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Quote::SuQuoteVerId)=<%=""+subQuoteVerId%>&answer(Object::Quote::ProductId)=<%=""+productId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=strParetQuoteStatus.toString()%>"><bean:write name="PostBindSubjectivityList" property="Object::Quote::Subjectivity::SubjectivityDesc" /></a>
														</td>
														<td class="SearchResult"  background="">
															<bean:write name="PostBindSubjectivityList" property="Object::Quote::Subjectivity::SubjectivityType" />
														</td>		
														<td class="SearchResult"  background="">
															<bean:write name="PostBindSubjectivityList" property="Object::Quote::Subjectivity::SubjectivityLevel" />
														</td>
														</td>
														<td class="SearchResult"  background="">
															<bean:write name="PostBindSubjectivityList" property="Object::Quote::Subjectivity::LocationName" />
														</td>
														<td class="SearchResult"  background="">
															<bean:write name="PostBindSubjectivityList" property="Object::Quote::Subjectivity::RiskName" />
														</td>
														<td class="SearchResult"  background="">
															<bean:write name="PostBindSubjectivityList" property="Object::Quote::Subjectivity::Status" />
														</td>										
													</tr>			
													<%index1++;%>																																				
												</logic:iterate>													
												</logic:present>
													
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
			</td>
		</tr>
	</table>
</div>
						