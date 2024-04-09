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
<bean:define id="classDescription" name="ClassListArray" property="Object::Risk::Class::ClassDescription"></bean:define> 
<%String classdesc1 = ""+classDescription; 
classdesc1 = classdesc1.replaceAll("\n","<br>");%>
<%=classNumber%><%="|"%><bean:write name="ClassListArray" property="Object::Risk::Class::ClassName" /><%="|"%><%= classdesc1%><%="|"%><img src="../Images/delete1.jpg"/><%="|"%><bean:write name="ClassListArray" property="Object::Risk::RiskId" /><%="|"%><bean:write name="ClassListArray" property="Object::Risk::Class::ClassName" /><%="\n" %>
<% classNumber = classNumber +1; %>
</logic:iterate>
</logic:present>

<% String classListSize = "0";%>
<logic:present name="ClassListSize">
<% 
if(request.getAttribute("ClassListSize")!=null){                
	classListSize = ""+request.getAttribute("ClassListSize");
}	
%>
<%=classListSize %>
<html:hidden property="answer(classSize)" value='<%=""+classListSize%>' styleId="classSizeUpdatedLoadClassList" />
</logic:present>