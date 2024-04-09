<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%response.setHeader("Cache-Control", "no-store");%>
<%System.out.println("Entered"); %>
<logic:present name='tankListArray'>
<%System.out.println("Inside......."); %>
<logic:iterate id="tankListArray" name="tankListArray" >	 
<bean:write name="tankListArray" property="Object::Location::Tanks::RiskNumber" /><%="|"%><bean:write name="tankListArray" property="Object::Location::Tanks::RiskName" /><%="|"%><bean:write name="tankListArray" property="Object::Location::Tanks::RiskType" /><%="|"%><bean:write name="tankListArray" property="Object::Location::Tanks::YearInstalled" /><%="|"%><bean:write name="tankListArray" property="Object::Location::Tanks::TankCapacity" /><%="|"%><bean:write name="tankListArray" property="Object::Location::Tank::TankConstructionCoatedOrBareSteel" /><%="|"%><bean:write name="tankListArray" property="Object::Location::Tank::SW" /><%="|"%><bean:write name="tankListArray" property="Object::Location::Tank::TankContentsNewOil" /><%="|"%><bean:write name="tankListArray" property="Object::Location::Tank::Retro" /><%="|"%><bean:write name="tankListArray" property="Object::Location::Tanks::StorageTankId" /><%="|"%><bean:write  name="tankListArray" property="Object::Location::Tanks::RiskType" /><%="\n" %>
</logic:iterate>
</logic:present>