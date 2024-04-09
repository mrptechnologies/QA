<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>
<script type="text/JavaScript" SRC="../Scripts/JScripts/Subjectivity.js" ></script>
<script type="text/javascript" src="../Scripts/prototype.js" ></script>

		<%
			
			String agencyIdTemp="";
			if(request.getParameter("answer(Object::Agency::AgencyId)")!=null)
			{
				agencyIdTemp=request.getParameter("answer(Object::Agency::AgencyId)");
			}else if(request.getAttribute("answer(Object::Agency::AgencyId)")!=null){
				agencyIdTemp = ""+request.getAttribute("answer(Object::Agency::AgencyId)");
			}
			String quoteSubjId="";
			String customerId="";
			if(request.getParameter("answer(Object::Customer::CustomerId)")!=null)
			{
				customerId=request.getParameter("answer(Object::Customer::CustomerId)");
				
			}else if(request.getAttribute("answer(Object::Customer::CustomerId)")!=null){
				customerId = ""+request.getAttribute("answer(Object::Customer::CustomerId)");
			}
			
			String strParetQuoteStatus="";
			if(request.getParameter("answer(Object::Quote::QuoteStatus)")!=null)
			{
				strParetQuoteStatus=request.getParameter("answer(Object::Quote::QuoteStatus)");
			}else if(request.getAttribute("answer(Object::Quote::QuoteStatus)")!=null){
				strParetQuoteStatus = ""+request.getAttribute("answer(Object::Quote::QuoteStatus)");
			}

			String strParentQuoteId="";
			if(request.getParameter("answer(Object::Quote::ParentQuoteId)")!=null)
			{
				strParentQuoteId=request.getParameter("answer(Object::Quote::ParentQuoteId)");
			}else if(request.getAttribute("answer(Object::Quote::ParentQuoteId)")!=null){
				strParentQuoteId = ""+request.getAttribute("answer(Object::Quote::ParentQuoteId)");
			}

			String ProductVerId="";
			if(request.getParameter("answer(Object::Quote::ProductVerId)")!=null)
			{
				ProductVerId=request.getParameter("answer(Object::Quote::ProductVerId)");
			}else if(request.getAttribute("answer(Object::Quote::ProductVerId)")!=null){
				ProductVerId = ""+request.getAttribute("answer(Object::Quote::ProductVerId)");
			}			
			
			String compositeRate="";
			if(request.getParameter("answer(Object::Plan::CompositeRateFlag)")!=null){
				compositeRate=request.getParameter("answer(Object::Plan::CompositeRateFlag)");
			}else if(request.getAttribute("answer(Object::Plan::CompositeRateFlag)")!=null){
				compositeRate = ""+request.getAttribute("answer(Object::Plan::CompositeRateFlag)");
			}
			
			String isApplnAvailable="";
			if(request.getParameter("answer(isApplnAvailable)")!=null){
				isApplnAvailable=request.getParameter("answer(isApplnAvailable)");
			}else if(request.getAttribute("answer(isApplnAvailable)")!=null){
				isApplnAvailable = ""+request.getAttribute("answer(isApplnAvailable)");
			}
			
			String parentQuoteVerId="";
			if(request.getParameter("answer(Object::Quote::ParentQuoteVerId)")!=null){
				parentQuoteVerId=request.getParameter("answer(Object::Quote::ParentQuoteVerId)");
			}else if(request.getAttribute("answer(Object::Quote::ParentQuoteVerId)")!=null){
				parentQuoteVerId = ""+request.getAttribute("answer(Object::Quote::ParentQuoteVerId)");
			}
			
			String subQuoteId1="";
			if(request.getParameter("answer(Object::Quote::SubQuoteId)")!=null){
				subQuoteId1=request.getParameter("answer(Object::Quote::SubQuoteId)");
			}else if(request.getAttribute("answer(Object::Quote::SubQuoteId)")!=null){
				subQuoteId1 = ""+request.getAttribute("answer(Object::Quote::SubQuoteId)");
			}
			
			
			String subQuoteVerId1="";
			if(request.getParameter("answer(Object::Quote::SuQuoteVerId)")!=null){
				subQuoteVerId1=request.getParameter("answer(Object::Quote::SuQuoteVerId)");
			}else if(request.getAttribute("answer(Object::Quote::SuQuoteVerId)")!=null){
				subQuoteVerId1 = ""+request.getAttribute("answer(Object::Quote::SuQuoteVerId)");
			}
			
			String productId="";
			if(request.getParameter("answer(Object::Quote::ProductId)")!=null){
				productId=request.getParameter("answer(Object::Quote::ProductId)");
			}else if(request.getAttribute("answer(Object::Quote::ProductId)")!=null){
				productId = ""+request.getAttribute("answer(Object::Quote::ProductId)");
			}
		
		%>		
		<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
		<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
		<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
		<table>
<tr><td>
<div id="dialog1" style='display: none;'>

<div class="hd">Enter Your Notes Here</div>
<div class="bd">
<table cellpadding="1" cellspacing="0">
  	 <tr>
  	   <td> 
  	     <h6>Notes Description:</h6>
  	   </td>
       <td> 
         <input type = text name="answer(Object::Notes::Description)" id="notesDesc" size="50" maxlength="54" />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Internal View Only 
        <input type = checkbox name="answer(Object::Notes::Private)" value="N"  id="mprivate" onclick="changevalue()"/> </td>
     </tr>
  	 <tr>
  	 <td>
  	   <h6>Notes:</h6>
  	 </td>
  	<td>
  	<div id="text">
  	 <textarea  name="answer(Object::Notes::Notes)" id="editor" rows="6" cols="80"> </textarea> 
  	</div> 
  	</td>
  </tr>
   <tr>
             <td width=50>&nbsp;</td>
             <td align=center>
              <html:button property="Save" value=" Save " styleClass="uibutton"  styleId="save" onmouseover="" />
              <html:button property="Cancel" value="Cancel" styleClass="uibutton" styleId="cancel" />
               </td>
              </tr>
</table>
</div>
</div>

</td>
</tr>


</table>
<table WIDTH="760px" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	<tr>
		<td>
			<table WIDTH="760px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td >
						<table WIDTH="760px" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td>
									<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
								</td>
							</tr>
							<tr>
								<td>
									<table WIDTH="760px" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
		
										<tr>
											<td >
												<table width="60%" align="Left" border="0">
													<jsp:include page="../common/QuoteHeader.jsp">
														<jsp:param name="parentQuoteId" value="<%=""+strParentQuoteId%>" />
														<jsp:param name="productVerId" value="<%=""+ProductVerId%>" />
														<jsp:param name="heading" value="" />
													</jsp:include>
												</table>
											</td>
										</tr>
										<td>
											<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=strParentQuoteId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>">Quote Summary</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<a href="/getSubjectivity.go?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Quote::ParentQuoteId)=<%=strParentQuoteId.toString()%>&answer(Object::Quote::ParentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(Object::Quote::SubQuoteId)=<%=subQuoteId1.toString()%>&answer(Object::Quote::SuQuoteVerId)=<%=""+subQuoteVerId1%>&answer(Object::Quote::ProductId)=<%=""+productId%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(ownerId)=<%=ownerId.toString()%>">Subjectivity</a>
										</td>
										</tr>
										<tr><td>&nbsp;</td></tr>
										<tr>
											<td class="NewSectionHeadNew" align="center">ADD SUBJECTIVITY</td>
										</tr>	
										<tr><td>&nbsp;</td></tr>
										<tr>										
										<tr>
											<td>
											<html:form action="/AddSubjectivity.do">
												<table width="92%" align="right" border="0" cellspacing="" cellpadding="">																																			
												<tr>
													<td class="FormLabels">
														Subjectivity Description
													</td>												
													<td class="links">													
													<html:textarea cols="30" rows="3"  property="answer(Object::Quote::Subjectivity::SubjectivityDesc)"/>
													</td>
												</tr>
												<tr><td>&nbsp;</td></tr>
												<tr>
													<td class="FormLabels">
														Level
													</td>												
													<td class="links">													
														<html:select styleClass="txtbox" property="answer(Object::Quote::Subjectivity::SubjectivityLevel)" onchange="showLocationList(this.form,this)">
															<html:option value="Insured">Insured</html:option>
															<html:option value="Location">Location</html:option>
															<html:option value="Risk">Tank</html:option>
															<html:option value="Quote">Quote</html:option>
														</html:select>
													</td>
												</tr>
												<tr><td>&nbsp;</td></tr>
												<tr style="display:none" id="Location_Container_tr">
													<td class="FormLabels">
														Location
													</td>												
													<td id="Location_Container" class="links">													
														<html:select styleClass="txtbox" property="answer(Object::Quote::Subjectivity::LocationInfo)" styleId="locattionInfo"  onchange="showRiskList(this.form,this)">
															<html:option value="">Select</html:option>															
														</html:select>
													</td>
												</tr>
												<tr><td>&nbsp;</td></tr>
												<tr style="display:none" id="Risk_Container_tr">
													<td class="FormLabels">
														Tank
													</td>		
													<td id="Risk_Container" class="links">													
														<html:select styleClass="txtbox" property="answer(Object::Quote::Subjectivity::RiskInfo)" styleId="riskInfo">
															<html:option value="">Select</html:option>													
														</html:select>
													</td>																							
												</tr>
												<tr><td>&nbsp;</td></tr>
												<tr>
													<td class="FormLabels">
														Type
													</td>												
													<td class="TextMatter">	
														ManuScript											
														<html:hidden property="answer(Object::Quote::Subjectivity::SubjectivityType)" value="ManuScript" />
													</td>
												</tr>
												<tr><td>&nbsp;</td></tr>
												<tr>
													<td class="FormLabels">
														Required Before
													</td>		
													<td class="links">													
														<html:select styleClass="txtbox" property="answer(Object::Quote::Subjectivity::SubjectivityRequiredProcess)">
															<html:option value="Post Bind">Post Bind</html:option>
															<html:option value="Pre Bind">Pre Bind</html:option>
														</html:select>	
													</td>																							
												</tr>
												<tr><td>&nbsp;</td></tr>	
												<tr>
													<td class="FormLabels" width="40%">
														Cause
													</td>
													<td class="links">
														<html:textarea cols="30" rows="3" property="answer(Object::Quote::Subjectivity::Cause)" />
														<html:hidden property="answer(Object::Quote::Subjectivity::SubjectivityName)" />
													</td>	
												</tr>
												<tr><td>&nbsp;</td></tr>													
												<tr>
													<td>														
														<html:hidden property="answer(Object::Quote::Subjectivity::QuoteSubjectivityId)" value="<%=""+-1%>" />													
														<html:hidden property="answer(Object::Quote::Subjectivity::QuoteId)" value="<%=""+strParentQuoteId%>" />
														<html:hidden property="answer(Object::Quote::Subjectivity::QuoteVerId)" value="<%=""+parentQuoteVerId%>" />
														<html:hidden property="answer(Object::Quote::Subjectivity::SubQuoteId)" value="<%=""+subQuoteId1%>" />														
														<html:hidden property="answer(Object::Quote::Subjectivity::SubQuoteVerId)" value="<%=""+subQuoteVerId1%>" />														
														<html:hidden property="answer(Object::Quote::Subjectivity::SubjectivityId)" value="<%=""+0%>" />													
														<html:hidden property="answer(Object::Quote::Subjectivity::SubjectivityVerId)" value="<%=""+0%>" />														
														<html:hidden property="answer(Object::Quote::Subjectivity::LocationId)" value="<%=""+0%>" />
														<html:hidden property="answer(Object::Quote::Subjectivity::RiskId)" value="<%=""+0%>" />														
														<html:hidden property="answer(Object::Quote::Subjectivity::Active)" value="<%="Y"%>" />																													
														<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
														<html:hidden property="answer(Object::Quote::Subjectivity::CreatedBy)" value="<%=""+usernameId%>" />
														<html:hidden property="answer(Object::Quote::Subjectivity::UpdatedBy)" value="<%=""+usernameId%>" />
														<html:hidden property="answer(TabPanelName)" value="Quote_Panel" />
														<html:hidden property="TabPanelName" value="Quote_Panel" />
														<html:hidden property="answer(Object::Quote::Subjectivity::OwnerId)" value="<%=""+ownerId%>" />
														<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+customerId%>" />
														<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=""+strParetQuoteStatus%>" />
														<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+strParentQuoteId%>" styleId="parentQuoteId" />
														<html:hidden property="answer(Object::Quote::ProductVerId)" value="<%=""+ProductVerId%>" />
														<html:hidden property="answer(Object::Quote::ParentQuoteVerId)" value="<%=""+parentQuoteVerId%>" styleId="parentQuoteVerId" />
														<html:hidden property="answer(Object::Quote::SubQuoteId)" value="<%=""+subQuoteId1%>" styleId="subQuoteId" />
														<html:hidden property="answer(Object::Quote::SuQuoteVerId)" value="<%=""+subQuoteVerId1%>" />
														<html:hidden property="answer(Object::Quote::ProductId)" value="<%=""+productId%>" />
														<html:hidden property="answer(Object::Activity::OwnerId)"  value="<%=""+ownerId%>" />
														<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>" />
														<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=""+usernameId%>" />
														<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Policy"%>" />
														<html:hidden property="answer(pagename)" value="<%="Quote Subjectivity"%>" />
														<html:hidden property="answer(Object::Quote::Subjectivity::Cause::Active)" value="<%="Y"%>" />
														<html:hidden property="answer(Object::Quote::Subjectivity::Cause::OwnerId)"  value="<%=""+ownerId%>" />
														<html:hidden property="answer(Object::Quote::Subjectivity::Cause::CreatedBy)" value="<%=""+usernameId%>" />
														<html:hidden property="answer(Object::Quote::Subjectivity::Cause::UpdatedBy)" value="<%=""+usernameId%>" />
														
							
													</td>
												</tr>
												<tr><td>&nbsp;</td></tr>			
												<tr>
													<td align="center">	
													
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<html:submit property="answer(Submit)" value="Save" styleClass="sbttn" />
															
													</td>													
												</tr>																																																			
												</table>
												</html:form>
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