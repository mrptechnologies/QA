<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<%
String policyId="0";
if(request.getParameter("answer(PolicyId)")!=null){
	policyId = ""+request.getParameter("answer(PolicyId)");
}
String policyVerId="0";
if(request.getParameter("answer(PolicyVerId)")!=null){
	policyVerId = ""+request.getParameter("answer(PolicyVerId)");
}
String policyNumber="";
if(request.getParameter("answer(PolicyNumber)")!=null){
	policyNumber = ""+request.getParameter("answer(PolicyNumber)");
}
%>
<html:form action="/AddSubjectivity.do">
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
							<html:textarea styleId="subj_desc" cols="50" rows="3"  property="answer(Object::Policy::Subjectivity::SubjectivityDesc)"/>
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td align="right" class="FormLabels">
							Level:&nbsp;&nbsp;
						</td>												
						<td class="links">													
							<html:select styleClass="txtbox" property="answer(Object::Policy::Subjectivity::SubjectivityLevel)" styleId="Subj_Level" onchange="showPolicyLocationList(this.form,this)">
								<html:option value="Insured">Insured</html:option>
								<html:option value="Location">Location</html:option>
								<html:option value="Risk">Tank</html:option>
								<html:option value="Quote">Quote</html:option>
							</html:select>
						</td>
					</tr>
					<tr style="display:none" id="Location_Container_tr_space"><td>&nbsp;</td></tr>
					<tr style="display:none" id="Location_Container_tr">
						<td align="right" class="FormLabels">
							Location:&nbsp;&nbsp;
						</td>												
						<td id="Location_Container" class="links">													
							<html:select styleClass="txtbox" property="answer(Object::Policy::Subjectivity::LocationInfo)" styleId="locattionInfo"  onchange="showPolicyRiskList(this.form,this)">
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
							<html:select styleClass="txtbox" property="answer(Object::Policy::Subjectivity::RiskInfo)" styleId="riskInfo">
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
							<html:hidden property="answer(Object::Policy::Subjectivity::SubjectivityType)" value="MANUSCRIPT" />
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td align="right" class="FormLabels">
							Required Before:&nbsp;&nbsp;
						</td>		
						<td class="links">													
							<html:select styleClass="txtbox" property="answer(Object::Policy::Subjectivity::SubjectivityRequiredProcess)">
								<html:option value="Post Bind">Post Bind</html:option>								
							</html:select>	
						</td>																							
					</tr>
					<tr><td>&nbsp;</td></tr>	
					<tr>
						<td align="right" class="FormLabels" width="40%">
							Cause:&nbsp;&nbsp;
						</td>
						<td class="links">
							<html:textarea styleId="subj_cause" cols="50" rows="3" property="answer(Object::Policy::Subjectivity::Cause)" />
							<html:hidden property="answer(Object::Policy::Subjectivity::SubjectivityName)" />
						</td>	
					</tr>
					<tr><td>
					<html:hidden property="answer(Object::Policy::Subjectivity::PolicyId)" value="<%=""+policyId %>" styleId="policyId" />
					<html:hidden property="answer(Object::Policy::Subjectivity::PolicyVerId)" value="<%=""+policyVerId %>" styleId="policyVerId" />
					<html:hidden property="answer(Object::Policy::Subjectivity::OwnerId)" value="<%=""+ownerId %>" styleId="ownerId" />		
					<html:hidden property="answer(PolicyNumber)" value="<%=""+policyNumber %>" styleId="policyNumber" />
					<html:hidden property="answer(Object::Policy::Subjectivity::PolicySubjectivityId)" value="-1"/>
					<html:hidden property="answer(Object::Policy::Subjectivity::SubjectivityId)" value="0"/>	
					<html:hidden property="answer(Object::Policy::Subjectivity::SubjectivityVerId)" value="0"/>	
					<html:hidden property="answer(Object::Policy::Subjectivity::Status)" value="Open"/>
					<html:hidden property="answer(Object::Policy::Subjectivity::Active)" value="Y"/>
					<html:hidden property="answer(Object::Policy::Subjectivity::CreatedBy)" value="<%=""+usernameId %>"/>
					<html:hidden property="answer(Object::Policy::Subjectivity::UpdatedBy)" value="<%=""+usernameId %>"/>
					<html:hidden property="answer(Object::Policy::Subjectivity::BindOrReferal)" value="BIND"/>	
					<html:hidden property="answer(Object::Policy::Subjectivity::RuleId)" value="0"/>	
					<html:hidden property="answer(Object::Policy::Subjectivity::RuleDetailId)" value="0"/>
					<html:hidden property="answer(Object::Policy::Subjectivity::Cause::Active)" value="Y"/>
					<html:hidden property="answer(Object::Policy::Subjectivity::Cause::CreatedBy)" value="<%=""+usernameId %>"/>
					<html:hidden property="answer(Object::Policy::Subjectivity::Cause::UpdatedBy)" value="<%=""+usernameId %>"/>	
					<html:hidden property="answer(Object::Policy::Subjectivity::Cause::OwnerId)" value="<%=""+ownerId %>" />									
					</td></tr>																																										
			<tr><td align="right" ><html:button property="answer(Submit)" onclick="savePolicyManuScript(this.form)" value="Save" styleClass="subbutton" /></td><td><html:button property="answer(Cancel)" onclick="YAHOO.example.container.manuScript.hide();" value="Cancel" styleClass="subbutton" /></td></tr>
			</table>
		</div>
	</div>
</html:form>
<a class="container-close" href="javascript:void(0);" onclick="YAHOO.example.container.manuScript.hide();"></a>				