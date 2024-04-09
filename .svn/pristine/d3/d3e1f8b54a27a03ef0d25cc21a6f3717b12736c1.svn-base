<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<Select class="txtbox" name="answer(Object::Quote::Subjectivity::RiskInfo)" id="riskInfo">
<logic:present name="QuoteRiskListDetail">
	<logic:iterate id="QuoteRiskListDetail" name="QuoteRiskListDetail">		
		<option value="<bean:write name="QuoteRiskListDetail" property="Object::Plan::PLResRiskPropertyId" />____<bean:write name="QuoteRiskListDetail" property="Object::Plan::RiskNumber" />____<bean:write name="QuoteRiskListDetail" property="Object::Plan::RiskType" />____<bean:write name="QuoteRiskListDetail" property="Object::Plan::RiskName" />"><bean:write name="QuoteRiskListDetail" property="Object::Plan::RiskName" /></option>
	</logic:iterate>
</logic:present>
</Select>