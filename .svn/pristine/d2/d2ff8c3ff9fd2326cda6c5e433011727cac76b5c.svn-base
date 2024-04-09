<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<bean:define id="ClearanceForwardPage" name="CheckClearance" property="answer(Object::Submission::ClearanceForwardPage)" scope="request"/>
<logic:equal name="CheckClearance" property="answer(Object::Submission::ClearanceForwardPage)" value="insured_rule_failure">
INSURED_VALIDATION_FAILURE$HTMLSPLITTER$
<div class="formhead"><h2 class="left">WARNING</h2></div>
<div class="FormLabels" align="center">
<br>
<logic:present name="MESSAGE_LIST" scope="request">
<ol>
<logic:iterate id="message" name="MESSAGE_LIST">
<b><font color ="red"><bean:write name="message"/></font></b>
</logic:iterate>
</ol>			
</logic:present>
</div>

<br>
</logic:equal>
<logic:equal name="CheckClearance" property="answer(Object::Submission::ClearanceForwardPage)" value="insured_rule_success">
INSURED_VALIDATION_SUCCESS$HTMLSPLITTER$
<br>
<br>
<br>
<br>
</logic:equal>

