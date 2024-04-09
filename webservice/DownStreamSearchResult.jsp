<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%response.setHeader("Cache-Control", "no-store");%>
<logic:present name='downStreamArr'>
<%System.out.println("Inside......."); %>
<logic:iterate id="downStreamArr" name="downStreamArr" >

<bean:write name="downStreamArr" property="Object::Customer::CustomerName" /><%="|"%><bean:write name="downStreamArr" property="Object::Agency::BusinessName" /><%="|"%><bean:write name="downStreamArr" property="Object::Submission::SFSubmissionId" /><%="|"%><bean:write name="downStreamArr" property="Object::Submission::SubmissionName" /><%="\n"%>
</logic:iterate>
</logic:present>