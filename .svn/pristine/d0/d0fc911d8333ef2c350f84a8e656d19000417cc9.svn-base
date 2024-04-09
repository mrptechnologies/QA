<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<Select class="txtbox" name="answer(Object::Policy::Subjectivity::RiskInfo)" id="riskInfo">
<logic:present name="tankListArray">
	<logic:iterate id="tankListArray" name="tankListArray">		
		<option value="<bean:write name="tankListArray" property="Object::Policy::Location::Tank::RiskId" />____<bean:write name="tankListArray" property="Object::Policy::Location::Tank::RiskNum" />____<bean:write name="tankListArray" property="Object::Policy::Location::Tank::RiskType" />____<bean:write name="tankListArray" property="Object::Policy::Location::Tank::RiskName" />"><bean:write name="tankListArray" property="Object::Policy::Location::Tank::RiskName" /></option>
	</logic:iterate>
</logic:present>
</Select>