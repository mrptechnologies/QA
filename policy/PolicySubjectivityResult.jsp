<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.dms.ejb.policy.subjectivity.PolicySubjectivityCauseDetail"%>
<%
response.setHeader("Cache-Control", "no-store");
long causeCount=1;
long policyId=0;
if(request.getParameter("answer(PolicyId)")!=null){
	policyId = Long.parseLong(""+request.getParameter("answer(PolicyId)"));
}
long policyVerId=0;
if(request.getParameter("answer(PolicyVerId)")!=null){
	policyVerId = Long.parseLong(""+request.getParameter("answer(PolicyVerId)"));
}
long ownerId=0;
if(request.getParameter("answer(OwnerId)")!=null){
	ownerId = Long.parseLong(""+request.getParameter("answer(OwnerId)"));
}
String policyNumber="";
if(request.getParameter("answer(PolicyNumber)")!=null){
	policyNumber = (""+request.getParameter("answer(PolicyNumber)"));
}
String subjectivityReqProcess="PreBind";
if(request.getParameter("answer(SubReqProcess)")!=null){
	subjectivityReqProcess = (""+request.getParameter("answer(SubReqProcess)"));
}
String sort = ""+request.getParameter("sort");
String dir = ""+request.getParameter("dir");
String startIndex = ""+request.getParameter("startIndex");
String results = ""+request.getParameter("results");
long causeCountPre=Long.parseLong(startIndex)+1;
%>
<dmshtml:GetPolicySubjectivityList preBindSubjectivityListName="PreBindSubjectivityList" postBindSubjectivityListName="PostBindSubjectivityList" sortColumn="<%=""+sort%>" direction="<%=""+dir %>" startIndex="<%=""+startIndex %>"  resultsPerPage="<%=""+results %>" subjectivityCount="subjectivityCount" subjectivieRequiredProcess="<%=""+subjectivityReqProcess%>"  policyId="<%=policyId%>" policyVerId="<%=policyVerId%>" policyNumber="<%=""+policyNumber%>" ownerId="<%=ownerId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
<%if(subjectivityReqProcess.equalsIgnoreCase("Pre Bind")){ %>
<logic:present name="PreBindSubjectivityList">
<%ArrayList subList = (ArrayList)request.getAttribute("PreBindSubjectivityList");
long listSize =subList.size();%>
{"recordsReturned":<%=""+listSize %>,"totalRecords":<%=""+request.getAttribute("subjectivityCount")%>,"startIndex":<%=""+startIndex %>,"sort":"<%=""+sort %>","dir":"<%=""+dir %>","pageSize":<%=""+results %>,"records"
:[
<logic:iterate id="PreBindSubjectivityList" name="PreBindSubjectivityList">
<bean:define id="subjLevel" name="PreBindSubjectivityList" property="Object::Policy::Subjectivity::SubjectivityLevel" />
<bean:define id="subjType" name="PreBindSubjectivityList" property="Object::Policy::Subjectivity::SubjectivityType" />
<bean:define id="subjCauseList" name="PreBindSubjectivityList" property="Object::Policy::Subjectivity::CauseList" />
<bean:define id="subjPreDesc" name="PreBindSubjectivityList" property="Object::Policy::Subjectivity::SubjectivityDesc" />
<%
String riskName ="";
String locationName = "";
String preSubjDescription = "" + subjPreDesc;
preSubjDescription = preSubjDescription.replaceAll("\n", "<br>");
preSubjDescription = preSubjDescription.replaceAll("\r", "");
preSubjDescription = preSubjDescription.replaceAll("'", "\'");
preSubjDescription = preSubjDescription.replaceAll("\"", "&#34;");

if((""+subjLevel).equalsIgnoreCase("Location") || (""+subjLevel).equalsIgnoreCase("Risk")){
	ArrayList causeList = (ArrayList)subjCauseList;
	if(causeList.size()>0){
		PolicySubjectivityCauseDetail detail = (PolicySubjectivityCauseDetail)causeList.get(0);
		riskName = detail.getRiskName();
		locationName = detail.getLocationName();
	}
}
if((""+subjType).equalsIgnoreCase("TRIGGERED")){subjType="Triggered";}else if((""+subjType).equalsIgnoreCase("MANUSCRIPT")){subjType="Manuscript";}
%>
{"No":"<%=causeCountPre%>","Subjectivity":"<%=""+preSubjDescription%>","Type":"<%=""+subjType %>","Level":"<%=""+subjLevel %>","CauseList":"Cause List","RequiredBefore":"Pre Bind","Status":"<bean:write name="PreBindSubjectivityList" property="Object::Policy::Subjectivity::Status" />","Attach":"","Notes":"","Email":"","SubjectivityId":"<bean:write name="PreBindSubjectivityList" property="Object::Policy::Subjectivity::PolicySubjectivityId" />","Location_Name":"<%=(locationName).replaceAll("\"","&#34;").replaceAll("<","&lt;").replaceAll(">","&gt;")%>","Risk_Name":"<%=(riskName).replaceAll("\"","&#34;").replaceAll("<","&lt;").replaceAll(">","&gt;")%>",<%="\"<input onclick='checkAllPreBind(this)' type='checkbox'>\"" %>:"","Modified":"<bean:write name="PreBindSubjectivityList" property="Object::Policy::Subjectivity::UpdatedDate" />"}<%if(listSize!=causeCount){ %>,<%} %>
<%causeCount++;causeCountPre++; %>
</logic:iterate>
]}
</logic:present>
<logic:notPresent name="PreBindSubjectivityList">
{"recordsReturned":<%=""+0 %>,"totalRecords":<%=""+0%>,"startIndex":<%=""+0 %>,"sort":"<%=""+"" %>","dir":"<%=""+"" %>","pageSize":<%=""+0 %>,"records":[]}
</logic:notPresent>
<%} %>
<%if(subjectivityReqProcess.equalsIgnoreCase("Post Bind")){ %>
<logic:present name="PostBindSubjectivityList">
<%ArrayList subList = (ArrayList)request.getAttribute("PostBindSubjectivityList");
long listSize =subList.size();%>
{"recordsReturned":<%=""+listSize %>,"totalRecords":<%=""+request.getAttribute("subjectivityCount")%>,"startIndex":<%=""+startIndex %>,"sort":"<%=""+sort %>","dir":"<%=""+dir %>","pageSize":<%=""+results %>,"records"
:[
<logic:iterate id="PostBindSubjectivityList" name="PostBindSubjectivityList">
<bean:define id="subjLevel" name="PostBindSubjectivityList" property="Object::Policy::Subjectivity::SubjectivityLevel" />
<bean:define id="subjType" name="PostBindSubjectivityList" property="Object::Policy::Subjectivity::SubjectivityType" />
<bean:define id="subjCauseList" name="PostBindSubjectivityList" property="Object::Policy::Subjectivity::CauseList" />
<bean:define id="subjPostDesc" name="PostBindSubjectivityList" property="Object::Policy::Subjectivity::SubjectivityDesc" />
<%
String riskName ="";
String locationName = "";
String postSubjDescription = ""+subjPostDesc;
postSubjDescription = postSubjDescription.replaceAll("\n", "<br>");
postSubjDescription = postSubjDescription.replaceAll("\r", "");
postSubjDescription = postSubjDescription.replaceAll("'", "\'");
postSubjDescription = postSubjDescription.replaceAll("\"", "&#34;");

if((""+subjLevel).equalsIgnoreCase("Location") || (""+subjLevel).equalsIgnoreCase("Risk")){
	ArrayList causeList = (ArrayList)subjCauseList;
	if(causeList.size()>0){
		PolicySubjectivityCauseDetail detail = (PolicySubjectivityCauseDetail)causeList.get(0);
		riskName = detail.getRiskName();
		locationName = detail.getLocationName();
	}
}
if((""+subjType).equalsIgnoreCase("TRIGGERED")){subjType="Triggered";}else if((""+subjType).equalsIgnoreCase("MANUSCRIPT")){subjType="Manuscript";}
%>
{"No":"<%=causeCountPre%>","Subjectivity":"<%= ""+postSubjDescription%>","Type":"<%=""+subjType %>","Level":"<%=""+subjLevel %>","CauseList":"Cause List","RequiredBefore":"Pre Bind","Status":"<bean:write name="PostBindSubjectivityList" property="Object::Policy::Subjectivity::Status" />","Attach":"","Notes":"","Email":"","SubjectivityId":"<bean:write name="PostBindSubjectivityList" property="Object::Policy::Subjectivity::PolicySubjectivityId" />","Location_Name":"<%=(locationName).replaceAll("\"","&#34;")%>","Risk_Name":"<%=(riskName).replaceAll("\"","&#34;")%>",<%="\"<input onclick='checkAllPreBind(this)' type='checkbox'>\"" %>:"","Modified":"<bean:write name="PostBindSubjectivityList" property="Object::Policy::Subjectivity::UpdatedDate" />"}<%if(listSize!=causeCount){ %>,<%} %>
<%causeCount++;causeCountPre++; %>
</logic:iterate>
]}
</logic:present>
<logic:notPresent name="PostBindSubjectivityList">
{"recordsReturned":<%=""+0 %>,"totalRecords":<%=""+0%>,"startIndex":<%=""+0 %>,"sort":"<%=""+"" %>","dir":"<%=""+"" %>","pageSize":<%=""+0 %>,"records":[]}
</logic:notPresent>
<%} %>