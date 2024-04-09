<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<%
String productId="";
if(request.getParameter("answer(ProductId)")!=null){
	productId=request.getParameter("answer(ProductId)");
}
String ProductVerId="";
if(request.getParameter("answer(ProductVerId)")!=null)
{
	ProductVerId=request.getParameter("answer(ProductVerId)");
}
String subQuoteVerId="";
if(request.getParameter("answer(SuQuoteVerId)")!=null){
	subQuoteVerId=request.getParameter("answer(SuQuoteVerId)");
}

String isRenewalEndorsement="";
if(request.getParameter("answer(isRenewalEndorsement)")!=null){
	isRenewalEndorsement=request.getParameter("answer(isRenewalEndorsement)");
}
String subQuoteId="";
if(request.getParameter("answer(SubQuoteId)")!=null){
	subQuoteId=request.getParameter("answer(SubQuoteId)");
}
String parentQuoteVerId="";
if(request.getParameter("answer(ParentQuoteVerId)")!=null){
	parentQuoteVerId=request.getParameter("answer(ParentQuoteVerId)");
}
String customerId="";
if(request.getParameter("answer(CustomerId)")!=null)
{
	customerId=request.getParameter("answer(CustomerId)");
}

String strParetQuoteStatus="";
if(request.getParameter("answer(QuoteStatus)")!=null)
{
	strParetQuoteStatus=request.getParameter("answer(QuoteStatus)");
}

String strParentQuoteId="";
if(request.getParameter("answer(ParentQuoteId)")!=null)
{
	strParentQuoteId=request.getParameter("answer(ParentQuoteId)");
}
%>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<html:form styleId="MANUFORM" action="/AddSubjectivity.do">
		<div class="SubjectivityPage">									
			<div class="content">																					
			<h3>Subjectivity Details</h3>
					<table width="62%" align="left" border="0" cellspacing="" cellpadding="">
					<tr><td>&nbsp;</td></tr>																																			
					<tr>
						<td align="right" class="FormLabels">
							Subjectivity Description:&nbsp;&nbsp;
						</td>												
						<td class="links">													
						<html:textarea cols="50" rows="3" styleId="subj_desc"  property="answer(Object::Quote::Subjectivity::SubjectivityDesc)"/>
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td align="right" class="FormLabels">
							Level:&nbsp;&nbsp;
						</td>												
						<td class="links">													
							<html:select styleClass="txtbox" styleId="Subj_Level" property="answer(Object::Quote::Subjectivity::SubjectivityLevel)" onchange="showManuscriptLocationList(this.form,this)">								
								<html:option value="">Select</html:option>
								<html:option value="Location">Location</html:option>
								<html:option value="Risk">Tank</html:option>								
							</html:select>
						</td>
					</tr>
					<tr style="display:none" id="Location_Container_tr_space"><td>&nbsp;</td></tr>
					<tr style="display:none" id="Location_Container_tr">
						<td align="right" class="FormLabels">
							Location:&nbsp;&nbsp;
						</td>												
						<td id="Location_Container" class="links">													
							<html:select styleClass="txtbox" property="answer(Object::Quote::Subjectivity::LocationInfo)" styleId="locattionInfo"  onchange="showManuscriptRiskList(this.form,this)">
								<html:option value="">Select</html:option>															
							</html:select>
						</td>
					</tr>
					<tr style="display:none" id="Risk_Container_tr_space"><td>&nbsp;</td></tr>
					<tr style="display:none" id="Risk_Container_tr">
						<td align="right" class="FormLabels">
							Tank:&nbsp;&nbsp;
						</td>		
						<td id="Risk_Container" class="links">													
							<html:select styleClass="txtbox" property="answer(Object::Quote::Subjectivity::RiskInfo)" styleId="riskInfo">
								<html:option value="">Select</html:option>													
							</html:select>
						</td>																							
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td align="right" class="FormLabels">
							Type:&nbsp;&nbsp;
						</td>												
						<td class="TextMatter">	
							Manuscript											
							<html:hidden property="answer(Object::Quote::Subjectivity::SubjectivityType)" value="MANUSCRIPT" />
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td align="right" class="FormLabels">
							Required Before:&nbsp;&nbsp;
						</td>
						
						<td class="links">													
							<html:select styleClass="txtbox" property="answer(Object::Quote::Subjectivity::SubjectivityRequiredProcess)">
								<html:option value="Pre Bind">Pre Bind</html:option>
								<%if (isRenewalEndorsement.equalsIgnoreCase("YES")){ %>
								<html:option value="Post Bind">Post Bind</html:option>
								<%} %>
							</html:select>	
						</td>																							
					</tr>
					<tr><td>&nbsp;</td></tr>	
					<tr>
						<td align="right" class="FormLabels" width="40%">
							Cause:&nbsp;&nbsp;
						</td>
						<td class="links">
							<html:textarea styleId="subj_cause" cols="50" rows="3" property="answer(Object::Quote::Subjectivity::Cause)" />
							<html:hidden property="answer(Object::Quote::Subjectivity::SubjectivityName)" />
						</td>	
					</tr>
					<tr><td>&nbsp;</td></tr>													
					<tr>
						<td>														
							<html:hidden property="answer(Object::Quote::Subjectivity::QuoteSubjectivityId)" value="<%=""+-1%>" />													
				<html:hidden property="answer(Object::Quote::Subjectivity::QuoteId)" value="<%=""+strParentQuoteId%>" />
				<html:hidden property="answer(Object::Quote::Subjectivity::QuoteVerId)" value="<%=""+parentQuoteVerId%>" />
				<html:hidden property="answer(Object::Quote::Subjectivity::SubQuoteId)" value="<%=""+subQuoteId%>" />														
				<html:hidden property="answer(Object::Quote::Subjectivity::SubQuoteVerId)" value="<%=""+subQuoteVerId%>" />														
				<html:hidden property="answer(Object::Quote::Subjectivity::SubjectivityId)" value="<%=""+0%>" />													
				<html:hidden property="answer(Object::Quote::Subjectivity::SubjectivityVerId)" value="<%=""+0%>" />														
				<html:hidden property="answer(Object::Quote::Subjectivity::LocationId)" value="<%=""+0%>" />
				<html:hidden property="answer(Object::Quote::Subjectivity::RiskId)" value="<%=""+0%>" />														
				<html:hidden property="answer(Object::Quote::Subjectivity::Active)" value="<%="Y"%>" />
				<html:hidden property="answer(Object::Quote::Subjectivity::Status)" value="Open"/>
				<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
				<html:hidden property="answer(Object::Quote::Subjectivity::CreatedBy)" value="<%=""+usernameId%>" />
				<html:hidden property="answer(Object::Quote::Subjectivity::UpdatedBy)" value="<%=""+usernameId%>" />
				<html:hidden property="answer(TabPanelName)" value="Quote_Panel" />
				<html:hidden property="TabPanelName" value="Quote_Panel" />
				<html:hidden property="answer(Object::Quote::Subjectivity::OwnerId)" value="<%=""+ownerId%>" />
				<html:hidden property="answer(Object::Customer::CustomerId)" styleId="customerId" value="<%=""+customerId%>" />
				<html:hidden property="answer(Object::Quote::QuoteStatus)" styleId="paretQuoteStatus" value="<%=""+strParetQuoteStatus%>" />
				<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+strParentQuoteId%>" styleId="parentQuoteId" />
				<html:hidden property="answer(Object::Quote::ProductVerId)" styleId="productVerId" value="<%=""+ProductVerId%>" />
				<html:hidden property="answer(Object::Quote::ParentQuoteVerId)" value="<%=""+parentQuoteVerId%>" styleId="parentQuoteVerId" />
				<html:hidden property="answer(Object::Quote::SubQuoteId)" value="<%=""+subQuoteId%>" styleId="subQuoteId" />
				<html:hidden property="answer(Object::Quote::SuQuoteVerId)" styleId="subQuoteVerId1" value="<%=""+subQuoteVerId%>" />
				<html:hidden property="answer(Object::Quote::ProductId)" styleId="productId" value="<%=""+productId%>" />
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
			<tr><td align="right" >
			<%if (isRenewalEndorsement.equalsIgnoreCase("YES")){ %>
			<html:button property="answer(Submit)" onclick="saveRenewalEndorsementManuScript(this.form)" value="Save" styleClass="subbutton" />
			<%}else { %>
			<html:button property="answer(Submit)" onclick="saveEndorsementManuScript(this.form)" value="Save" styleClass="subbutton" />
			<%} %>
			</td><td><html:button property="answer(Cancel)" onclick="YAHOO.example.container.manuScript.hide();" value="Cancel" styleClass="subbutton" /></td></tr>
			</table>												
			</div></div>
			</html:form>	
			<a class="container-close" href="javascript:void(0);" onclick="YAHOO.example.container.manuScript.hide();"></a>