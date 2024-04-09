<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%
response.setHeader("Cache-Control", "no-store");
String strQuoteSubjectivityId = "";
long causeCount=1;
long quoteSubjectivityId=0;
if(request.getParameter("answer(QuoteSubjectivityId)")!=null){
	strQuoteSubjectivityId = ""+request.getParameter("answer(QuoteSubjectivityId)");
}
if(strQuoteSubjectivityId.length()>0){
	quoteSubjectivityId = Long.parseLong(strQuoteSubjectivityId);
}
%>
<dmshtml:GetQuoteSubjectivityCauseList causeList="subjectivityCauseList" quoteSubjectivityId="<%=quoteSubjectivityId%>"  dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
<logic:present name="subjectivityCauseList">
<logic:iterate id="subjectivityDetial" name="subjectivityCauseList">
<%=causeCount+"|"%><bean:write name="subjectivityDetial" property="cause" /><%="|"%><bean:write name="subjectivityDetial" property="locationNumber" /><%="|"%><bean:write name="subjectivityDetial" property="locationName" /><%="|"%><bean:write name="subjectivityDetial" property="riskNumber" /><%="|"%><bean:write name="subjectivityDetial" property="riskName" /><%="\n"%>
<%causeCount++; %>
</logic:iterate>
</logic:present>