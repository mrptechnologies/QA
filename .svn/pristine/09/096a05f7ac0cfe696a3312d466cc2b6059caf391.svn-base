<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>  
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<html:form action="/GetSFDownStream.do">

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<html:hidden property="answer(ownerId)" value="<%=""+ownerId %>"/>
<html:hidden property="answer(dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
<html:hidden property="answer(Object::Submission::CreatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Submission::UpdatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(formName)" value="Agency::AddAgency"/>
<div class="formpage01">
	<div class="content">
		<div class="formhead"><h2 class="left">Get DownStream</h2></div>
			<br>
			<div class="field" style="width:651px">Created Date:
				<span style="width:50px">From :</span>			
					<input type="text" name="answer(Month)" size="2" maxlength="2" style="width:25px" id="CreatedDate1" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate2.focus()}" />
				<span style="width:15px">/</span>
					<input type="text" name="answer(Date)" size="2" maxlength="2" style="width:25px" id="CreatedDate2" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate3.focus()}" />
				<span style="width:15px">/</span>
					<input type="text" name="answer(Year)" size="4" maxlength="4" style="width:40px" id="CreatedDate3" onkeyup="if(this.value.length==4) {document.forms[0].CreatedDate4.focus()}" />
					
					
				<span style="width:50px">To :</span>
					<input type="text" name="answer(Month)" size="2" maxlength="2" style="width:25px" id="CreatedDate4" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate5.focus()}" />
				<span style="width:15px">/</span>
					<input type="text" name="answer(Date)" size="2" maxlength="2" style="width:25px" id="CreatedDate5" onkeyup="if(this.value.length==2) {document.forms[0].CreatedDate6.focus()}" />
				<span style="width:15px">/</span>
					<input type="text" name="answer(Year)" size="4" maxlength="4" style="width:40px" id="CreatedDate6" />
				<span style="width:50px">(MM/DD/YYYY)</span>
			</div>
			
			<div class="field" style="width:651px">Updated Date:
				<span style="width:50px">From :</span>			
					<input type="text" name="answer(Month)" size="2" maxlength="2" style="width:25px" id="UpdatedDate1" onkeyup="if(this.value.length==2) {document.forms[0].UpdatedDate2.focus()}" />
				<span style="width:15px">/</span>
					<input type="text" name="answer(Date)" size="2" maxlength="2" style="width:25px" id="UpdatedDate2" onkeyup="if(this.value.length==2) {document.forms[0].UpdatedDate3.focus()}" />
				<span style="width:15px">/</span>
					<input type="text" name="answer(Year)" size="4" maxlength="4" style="width:40px" id="UpdatedDate3" onkeyup="if(this.value.length==4) {document.forms[0].UpdatedDate4.focus()}" />
					
					
				<span style="width:50px">To :</span>
					<input type="text" name="answer(Month)" size="2" maxlength="2" style="width:25px" id="UpdatedDate4" onkeyup="if(this.value.length==2) {document.forms[0].UpdatedDate5.focus()}" />
				<span style="width:15px">/</span>
					<input type="text" name="answer(Date)" size="2" maxlength="2" style="width:25px" id="UpdatedDate5" onkeyup="if(this.value.length==2) {document.forms[0].UpdatedDate6.focus()}" />
				<span style="width:15px">/</span>
					<input type="text" name="answer(Year)" size="4" maxlength="4" style="width:40px" id="UpdatedDate6" />
				<span style="width:50px">(MM/DD/YYYY)</span>
			</div>
			
			<div class="field" style="width:334px">
				Type :
				<select name="answer(Type)" class="txtbox" id="Type">
						<option value="">Select</option>
						<option value="New">New</option>
						<option value="Renewal">Renewal</option>
						<option value="Endorsement">Endorsement</option>
	             </select>
			</div>
			<div class="field" style="width:312px">
				Insurance Type :										
				<select name="answer(InsuranceType)" class="txtbox" id="InsuranceType">
						<option value="">Select</option>
						<option value="Direct">Direct</option>
						<option value="Assumed">Assumed</option>																																				
	             </select>
			</div>
			<div class="field" style="width:391px">
				Record Type :
				<select name="answer(RecordType)" class="txtbox" id="RecordType">
						<option value="">Select</option>
						<option value="SIS - Accident & Health">SIS - Accident & Health</option>
	             </select>
			</div>
			<div class="field" style="width:398px">
				Line of Business :
				<select name="answer(LineOfBusiness)" class="txtbox" id="LineOfBusiness">
						<option value="Business Travel Accident">Business Travel Accident</option>
	             </select>
			</div>
			<div class="field" style="width:385px">
				Production Office :
				<select name="answer(ProductionOffice)" class="txtbox" id="ProductionOffice">
						<option value="">Select</option>
						<option value="U.S.A. - Atlanta">U.S.A. - Atlanta</option>
						<option value="U.S.A. - Boston">U.S.A. - Boston</option>
						<option value="U.S.A. - Chicago">U.S.A. - Chicago</option>
						<option value="U.S.A. - Los Angeles">U.S.A. - Los Angeles</option>
						<option value="U.S.A. - New York">U.S.A. - New York</option>
						<option value="U.S.A. - San Francisco">U.S.A. - San Francisco</option>
						<option value="U.S.A. - Dallas">U.S.A. - Dallas</option>
						<option value="U.S.A. - Houston">U.S.A. - Houston</option>
						<option value="U.S.A. - Philadelphia">U.S.A. - Philadelphia</option>
	             </select>
			</div>
			<div class="formcontent" style="width:50%" align="center"  title="<bean:message key='ToolTip.FindPolicy.Find'/>">
				<center><input type="submit" value="Find >" class="covbutton" onclick="listPolicies()" style="width:90px;">	</center>
			</div>
			
	</div>
</div>
</html:form>