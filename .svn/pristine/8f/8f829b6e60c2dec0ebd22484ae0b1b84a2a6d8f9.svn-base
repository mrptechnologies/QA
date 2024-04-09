<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<Select class="txtbox" name="answer(Object::Quote::Subjectivity::LocationInfo)" id="locattionInfo" onchange="showManuscriptRiskList(this.form,this)">
<logic:present name="QuoteLocationListDetail">
	<logic:iterate id="QuoteLocationListDetail" name="QuoteLocationListDetail">		
		<option value="<bean:write name="QuoteLocationListDetail" property="Object::Quote::Location::LocationId" />____<bean:write name="QuoteLocationListDetail" property="Object::Quote::Location::LocationNumber" />____<bean:write name="QuoteLocationListDetail" property="Object::Quote::Location::LocationName" />"><bean:write name="QuoteLocationListDetail" property="Object::Quote::Location::LocationName" /></option>
	</logic:iterate>
</logic:present>
</Select>