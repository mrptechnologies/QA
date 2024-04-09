<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%response.setHeader("Cache-Control", "no-store");%>
<%System.out.println("Entered"); %>
<logic:present name='locationListArray'>
<%System.out.println("Inside......."); %>
<logic:iterate id="locationListArray" name="locationListArray" >	 
<bean:write name="locationListArray" property="Object::Location::LocationNumber" /><%="|"%><bean:write name="locationListArray" property="Object::Location::LocationName" /><%="|"%><bean:write name="locationListArray" property="Object::Location::LocationAddress1" /><%="|"%><bean:write name="locationListArray" property="Object::Location::LocationAddress2" /><%="|"%><bean:write name="locationListArray" property="Object::Location::LocationCity" /><%="|"%><bean:write name="locationListArray" property="Object::Location::LocationState" /><%="|"%><bean:write name="locationListArray" property="Object::Location::LocationZip" /><%="|"%><bean:write name="locationListArray" property="Object::Location::LocationId" /><%="|"%><bean:write name="locationListArray" property="Object::Location::LocationName" /><%="\n" %>
</logic:iterate>
</logic:present>