<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%response.setHeader("Cache-Control", "no-store");%>
<%System.out.println("Entered"); %>
<logic:present name='locationListArray'>
<%System.out.println("Inside......."); %>
<logic:iterate id="locationListArray" name="locationListArray" >	 
<bean:write name="locationListArray" property="Object::Quote::Location::LocationNumber" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Quote::Location::LocationName" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Quote::Location::Address1" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Quote::Location::Address2" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Quote::Location::City" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Quote::Location::State" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Quote::Location::Zip" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Location::UST::TankCount" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Location::AST::TankCount" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Quote::Location::LocationId" /><%="____~____*"%><bean:write name="locationListArray" property="Object::Quote::Location::LocationName" /><%="____~____*"%><%=""%><%="\n" %>
</logic:iterate>
</logic:present>

	<% String locationListSize = "0";%>
	<%if(request.getAttribute("locationListArraySize") !=null){ 

		locationListSize = ""+request.getAttribute("locationListArraySize");
	
	}%>

