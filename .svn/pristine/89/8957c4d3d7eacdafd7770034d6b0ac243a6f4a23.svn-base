<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%response.setHeader("Cache-Control", "no-store");%>

<%System.out.println("Entered"); %>

<logic:present name='ClassListArray'>

<% int classNumber = 1; %>
<%System.out.println("Inside......."); %>
<logic:iterate id="ClassListArray" name="ClassListArray" >	 
<%=classNumber%><%="|"%><bean:write name="ClassListArray" property="Object::Risk::Class::ClassName" /><%="|"%><bean:write name="ClassListArray" property="Object::Risk::Class::ClassDescription" /><%="|"%><img src="../Images/delete1.jpg"/><%="|"%><bean:write name="ClassListArray" property="Object::Risk::RiskId" /><%="|"%><bean:write name="ClassListArray" property="Object::Risk::Class::ClassName" /><%="__~" %>
<% classNumber = classNumber +1; %>
</logic:iterate>
</logic:present>

<% String classListSize = "0";%>
<logic:present name="ClassListSize">
<% 	classListSize = ""+request.getAttribute("ClassListSize");%>
<%=classListSize %>
</logic:present>