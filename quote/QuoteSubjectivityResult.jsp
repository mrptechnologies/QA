<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.dms.ejb.quote.subjectivity.QuoteSubjectivityCauseDetail"%>
<%
response.setHeader("Cache-Control", "no-store");
long causeCount=1;
long parentQuoteVerId=0;
if(request.getParameter("answer(ParentQuoteVerId)")!=null){
	parentQuoteVerId = Long.parseLong(""+request.getParameter("answer(ParentQuoteVerId)"));
}
long subQuoteVerId=0;
if(request.getParameter("answer(SubQuoteVerId)")!=null){
	subQuoteVerId = Long.parseLong(""+request.getParameter("answer(SubQuoteVerId)"));
}
long ownerId = 0;
if(request.getParameter("answer(OwnerId)")!=null){
	ownerId = Long.parseLong(""+request.getParameter("answer(OwnerId)"));
}
String type ="";
if(request.getParameter("answer(Type)")!=null){
	type = ""+request.getParameter("answer(Type)");
}
String subjectivityReqProcess="Pre Bind";
if(request.getParameter("answer(SubReqProcess)")!=null){
	subjectivityReqProcess = (""+request.getParameter("answer(SubReqProcess)"));
}
String sort = ""+request.getParameter("sort");
String dir = ""+request.getParameter("dir");
String startIndex = ""+request.getParameter("startIndex");
String results = ""+request.getParameter("results");
long causeCountPre=Long.parseLong(startIndex)+1;
long causeCountPost = Long.parseLong(startIndex)+1;
%>
<dmshtml:GetQuoteSubjectivityList subjectivityCount="subjectivityCount" subjectivieRequiredProcess="<%=""+subjectivityReqProcess%>" sortColumn="<%=""+sort%>" direction="<%=""+dir %>" startIndex="<%=""+startIndex %>"  resultsPerPage="<%=""+results %>"  postBindSubjectivityList="postBindSubjectivityList" preBindSubjectivityList="preBindSubjectivityList" parentQuoteVerId="<%=parentQuoteVerId %>" subQuoteVerId="<%=subQuoteVerId %>" ownerId="<%=ownerId %>"  dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
<%if(subjectivityReqProcess.equalsIgnoreCase("Pre Bind")){ %>
<logic:present name="preBindSubjectivityList">
<%ArrayList subList = (ArrayList)request.getAttribute("preBindSubjectivityList");
long listSize =subList.size();%>
{"recordsReturned":<%=""+listSize %>,"totalRecords":<%=""+request.getAttribute("subjectivityCount")%>,"startIndex":<%=""+startIndex %>,"sort":"<%=""+sort %>","dir":"<%=""+dir %>","pageSize":<%=""+results %>,"records"
:[
<logic:iterate id="PreBindSubjectivityList" name="preBindSubjectivityList">
<bean:define id="subjLevel" name="PreBindSubjectivityList" property="Object::Quote::Subjectivity::SubjectivityLevel" />
<bean:define id="subjType" name="PreBindSubjectivityList" property="Object::Quote::Subjectivity::SubjectivityType" />
<bean:define id="subjCauseList" name="PreBindSubjectivityList" property="Object::Quote::Subjectivity::CauseList" />
<bean:define id="subjPreDesc" name="PreBindSubjectivityList" property="Object::Quote::Subjectivity::SubjectivityDesc" />
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
		QuoteSubjectivityCauseDetail detail = (QuoteSubjectivityCauseDetail)causeList.get(0);
		riskName = detail.getRiskName();
		locationName = detail.getLocationName();
	}
}
if((""+subjType).equalsIgnoreCase("TRIGGERED")){subjType="Triggered";}else if((""+subjType).equalsIgnoreCase("MANUSCRIPT")){subjType="Manuscript";}else if((""+subjType).equalsIgnoreCase("MANDATORY")){subjType="Mandatory";}
%>
{"No":"<%=causeCountPre%>","Subjectivity":"<%= preSubjDescription%>","Type":"<%=""+subjType %>","Level":"<bean:write name="PreBindSubjectivityList" property="Object::Quote::Subjectivity::SubjectivityLevel" />","CauseList":"Cause List","RequiredBefore":"Pre Bind","Status":"<bean:write name="PreBindSubjectivityList" property="Object::Quote::Subjectivity::Status" />","Attach":"","Notes":"","Email":"","SubjectivityId":"<bean:write name="PreBindSubjectivityList" property="Object::Quote::Subjectivity::QuoteSubjectivityId" />","Location_Name":"<%=(locationName).replaceAll("\"","&#34;").replaceAll("<","&lt;").replaceAll(">","&gt;")%>","Risk_Name":"<%=(riskName).replaceAll("\"","&#34;").replaceAll("<","&gt;").replaceAll(">","&gt;")%>",<%="\"<input onclick='checkAllPreBind(this)' type='checkbox'>\"" %>:"","Modified":"<bean:write name="PreBindSubjectivityList" property="Object::Quote::Subjectivity::UpdatedDate" />"}<%if(listSize!=causeCount){ %>,<%} %>
<%causeCount++;causeCountPre++; %>
</logic:iterate>
]}
</logic:present>
<logic:notPresent name="preBindSubjectivityList">
{"recordsReturned":<%=""+0 %>,"totalRecords":<%=""+0%>,"startIndex":<%=""+0 %>,"sort":"<%=""+"" %>","dir":"<%=""+"" %>","pageSize":<%=""+0 %>,"records":[]}
</logic:notPresent>
<%} %>
<%if(subjectivityReqProcess.equalsIgnoreCase("Post Bind")){ %>
<logic:present name="postBindSubjectivityList">
<%ArrayList subList = (ArrayList)request.getAttribute("postBindSubjectivityList");
long listSize =subList.size();%>
{"recordsReturned":<%=""+listSize %>,"totalRecords":<%=""+request.getAttribute("subjectivityCount")%>,"startIndex":<%=""+startIndex %>,"sort":"<%=""+sort %>","dir":"<%=""+dir %>","pageSize":<%=""+results %>,"records"
:[
<logic:iterate id="PostBindSubjectivityList" name="postBindSubjectivityList">
<bean:define id="subjLevel" name="PostBindSubjectivityList" property="Object::Quote::Subjectivity::SubjectivityLevel" />
<bean:define id="subjType" name="PostBindSubjectivityList" property="Object::Quote::Subjectivity::SubjectivityType" />
<bean:define id="subjCauseList" name="PostBindSubjectivityList" property="Object::Quote::Subjectivity::CauseList" />
<bean:define id="subjPostDesc" name="PostBindSubjectivityList" property="Object::Quote::Subjectivity::SubjectivityDesc" />
<%
String riskName1 ="";
String locationName1 = "";
String postSubjDescription = ""+subjPostDesc;
postSubjDescription = postSubjDescription.replaceAll("\n", "<br>");
postSubjDescription = postSubjDescription.replaceAll("\r", "");
postSubjDescription = postSubjDescription.replaceAll("'", "\'");
postSubjDescription = postSubjDescription.replaceAll("\"", "&#34;");

if((""+subjLevel).equalsIgnoreCase("Location") || (""+subjLevel).equalsIgnoreCase("Risk")){
	ArrayList causeList = (ArrayList)subjCauseList;
	if(causeList.size()>0){
		QuoteSubjectivityCauseDetail detail1 = (QuoteSubjectivityCauseDetail)causeList.get(0);
		riskName1 = detail1.getRiskName();
		locationName1 = detail1.getLocationName();
	}
}
if((""+subjType).equalsIgnoreCase("TRIGGERED")){subjType="Triggered";}else if((""+subjType).equalsIgnoreCase("MANUSCRIPT")){subjType="Manuscript";}else if((""+subjType).equalsIgnoreCase("MANDATORY")){subjType="Mandatory";}
%>
{"No":"<%=causeCountPost%>","Subjectivity":"<%= ""+postSubjDescription%>","Type":"<%=""+subjType %>","Level":"<bean:write name="PostBindSubjectivityList" property="Object::Quote::Subjectivity::SubjectivityLevel" />","CauseList":"Cause List","RequiredBefore":"Pre Bind","Status":"<bean:write name="PostBindSubjectivityList" property="Object::Quote::Subjectivity::Status" />","Attach":"","Notes":"","Email":"","SubjectivityId":"<bean:write name="PostBindSubjectivityList" property="Object::Quote::Subjectivity::QuoteSubjectivityId" />","Location_Name":"<%=(locationName1).replaceAll("\"","&#34;")%>","Risk_Name":"<%=(riskName1).replaceAll("\"","&#34;")%>",<%="\"<input onclick='checkAllPostBind(this)' type='checkbox'>\"" %>:"","Modified":"<bean:write name="PostBindSubjectivityList" property="Object::Quote::Subjectivity::UpdatedDate" />"}<%if(listSize!=causeCount){ %>,<%} %>
<%causeCount++;causeCountPost++; %>
</logic:iterate>
]}
</logic:present>
<logic:notPresent name="postBindSubjectivityList">
{"recordsReturned":<%=""+0 %>,"totalRecords":<%=""+0%>,"startIndex":<%=""+0 %>,"sort":"<%=""+"" %>","dir":"<%=""+"" %>","pageSize":<%=""+0 %>,"records":[]}
</logic:notPresent>
<%}%>