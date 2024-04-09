<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%response.setHeader("Cache-Control", "no-store");%>
<logic:present name='locationListArray'>
<logic:iterate id="locationListArray" name="locationListArray" >	 
<bean:write name="locationListArray" property="Object::Location::LocationNumber" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Location::LocationName" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Location::LocationAddress1" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Location::LocationAddress2" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Location::LocationCity" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Location::LocationState" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Location::LocationZip" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Location::UST::TankCount" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Location::AST::TankCount" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Location::LocationId" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Location::LocationName" /><%="\n" %>
</logic:iterate>
</logic:present>


<% String ImportLocationSize = "0";%>
<logic:present name="LocationListSize">
<%ImportLocationSize = ""+request.getAttribute("LocationListSize");%>
</logic:present>
<logic:present name="LocationListSize">
<table>
<tr><td><%=""+ImportLocationSize%></td></tr></table>
<input type="hidden" name="answer(Object::Import::LocationSize)" id="importLocationSizeHiddenvalue" value='<%=""+ImportLocationSize%>' >
</logic:present>
