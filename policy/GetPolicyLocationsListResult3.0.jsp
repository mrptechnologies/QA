<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%response.setHeader("Cache-Control", "no-store");%>
<%System.out.println("Entered"); %>
<logic:present name='locationListArray'>
<%System.out.println("Inside......."); %>
<logic:iterate id="locationListArray" name="locationListArray" >	 
<bean:write name="locationListArray" property="Object::Policy::Location::LocationNumber" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Policy::Location::LocationName" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Policy::Location::LocationAddress1" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Policy::Location::LocationAddress2" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Policy::Location::LocationCity" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Policy::Location::LocationState" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Policy::Location::LocationZip" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Location::UST::TankCount" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Location::AST::TankCount" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Policy::Location::LocationId" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Policy::Location::LocationName" /><%="\n" %>
</logic:iterate>
</logic:present>

	<% String locationListSize = "0";%>
	<%if(request.getAttribute("locationListArraySize") !=null){ 

		locationListSize = ""+request.getAttribute("locationListSize");
	
	}%>

