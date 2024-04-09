<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%
String policyId="0";
if(request.getParameter("answer(PolicyId)")!=null){
	policyId = ""+request.getParameter("answer(PolicyId)");
}
String policyVerId="0";
if(request.getParameter("answer(PolicyVerId)")!=null){
	policyVerId = ""+request.getParameter("answer(PolicyVerId)");
}
String ownerId="0";
if(request.getParameter("answer(OwnerId)")!=null){
	ownerId = ""+request.getParameter("answer(OwnerId)");
}
String policyNumber="";
if(request.getParameter("answer(PolicyNumber)")!=null){
	policyNumber = ""+request.getParameter("answer(PolicyNumber)");
}
%>
<dmshtml:GetPolicyLocationList nameInSession="LocationList" policyId="<%=Long.parseLong(""+policyId)%>" policyVerId="<%=Long.parseLong(""+policyVerId)%>" policyNumber="<%=""+policyNumber%>" ownerId="<%=Long.parseLong(""+ownerId)%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
<Select class="txtbox" name="answer(Object::Policy::Subjectivity::LocationInfo)" id="locattionInfo" onchange="showPolicyRiskList(this.form,this)">
<logic:present name="LocationList">
	<logic:iterate id="LocationList" name="LocationList">	
		<option value="<bean:write name="LocationList" property="Object::Policy::Location::LocationId" />____<bean:write name="LocationList" property="Object::Policy::Location::LocationNumber" />____<bean:write name="LocationList" property="Object::Policy::Location::LocationName" />"><bean:write name="LocationList" property="Object::Policy::Location::LocationName" /></option>
	</logic:iterate>
</logic:present>
</Select>