
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<script type="text/javascript">
<!--
function storeDateValues()
{
	var formElement=document.forms[0];
	
	if((formElement.factorName.value==""))
	{
		alert("Please enter the Factor Name");
		return false;
	}
	if((formElement.factorDesc.value==""))
	{
		alert("Please enter the Factor Description");
		return false;
	}
	if((formElement.factorType.value==""))
	{
		alert("Please enter the Factor Type");
		return false;
	}
	if((formElement.factorObjType.value==""))
	{
		alert("Please enter the Factor Object Type");
		return false;
	}
	if((formElement.factorObjName.value==""))
	{
		alert("Please enter the Factor Object Name");
		return false;
	}
	if((formElement.versionNumber.value==""))
	{
		alert("Please enter the Factor Version Number");
		return false;
	}
	if((formElement.factorVerName.value==""))
	{
		alert("Please enter the Factor Version Name");
		return false;
	}
	if((formElement.desc.value==""))
	{
		alert("Please enter the Factor Version Description");
		return false;
	}
	if((formElement.versionNumber.value!="") && (formElement.versionNumber.value <= formElement.prevVersionNum.value))
	{
		alert("Version Number has to be greater than "+formElement.prevVersionNum.value);
		return false;
	}
	
	if((formElement.desc.value!="") && (formElement.desc.value == formElement.prevVersionDesc.value))
	{
		alert("Please enter another description ");
		return false;
	}
	return true;
}
//-->
</SCRIPT>

<html:form action="/AddFactor" onsubmit="return storeDateValues()">
 <bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
	<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0"
		CELLPADDING="0">
		<tr>
			<td >&nbsp;&nbsp;</td>
		</tr>
		
		
		
		<bean:define id="FactorId" property="answer(Object::ProductFactors::FactorId)" name="AddFactor" scope="request"/> 
		<bean:define id="FactorVerId" property="answer(Object::ProductFactors::FactorVerId)" name="AddFactor" scope="request"/> 
		<bean:define id="FactorObjectName" property="answer(Object::ProductFactors::FactorObjectName)" name="AddFactor" scope="request"/> 
		<%
		long lgfactorId=0;
		long lgfactorVerId=0;
		double dbFactorVerId=0.0;
		try {
		    lgfactorId=Long.parseLong(""+FactorId);
		    lgfactorVerId=Long.parseLong(""+FactorVerId);
			dbFactorVerId=Double.parseDouble(""+FactorVerId);
		} catch(Exception ex) {}
		
		if(lgfactorId>0 && lgfactorVerId>0 ) {
		    %>
		<tr>
					
					<td class="SearchResult"><A HREF="../GetFactorValues.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(factorId)=<%=""+lgfactorId%>
					&answer(factorVerId)=<%=""+lgfactorVerId%>&answer(factorObjectName)=<%=""+FactorObjectName%>">Show Factor Values</A></td>
		</tr>
		<%} %>
		
		<tr>
			<td height="5"></td>
		</tr>

		<tr>
			<td class="NewSectionHead" align="center" colspan="10">ADD FACTORS
			</td>
		</tr>

		<tr>
			<td height="8px"></td>
		</tr>


		<tr>
			<td valign="top">
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0"
				CELLPADDING="0">

				<tr>
					<td class="FormLabels" colspan="6">
			
						<tr>
							<td width="20%" class="FormLabels" align="left" height="25">Factor
							Name</td>
							<td class="links"><dmshtml:dms_text name="AddFactor"
								property="answer(Object::ProductFactors::FactorName)" size="60"
								maxlength="60" styleClass="txtbox" styleId="factorName" /></td>
						</tr>
						<tr>
							<td width="20%" class="FormLabels" align="left" height="25">Factor
							Description</td>
							<td class="links"><dmshtml:dms_text name="AddFactor"
								property="answer(Object::ProductFactors::FactorDesc)" size="60"
								maxlength="60" styleClass="txtbox" styleId="factorDesc" /></td>
						</tr>
												<tr>
							<td class="FormLabels" align="left" height="25" width="20%">Factor Type</td>
							<td class="links" align="left"><html:select
								property="answer(Object::ProductFactors::FactorType)" name="AddFactor"
								styleClass="txtbox" styleId="factorType">
								
								<html:option value="Rating">Rating</html:option>

							</html:select></td>
						</tr>
						
						<tr>
							<td class="FormLabels" align="left" height="25" width="20%">Factor Object Type
							</td>
							<td class="links" align="left"><html:select
								property="answer(Object::ProductFactors::FactorObjectType)" name="AddFactor"
								styleClass="txtbox" styleId="factorObjType">
								<html:option value="RDBMS Table">RDBMS Table</html:option>
								<html:option value="Class">Class</html:option>

							</html:select></td>
						</tr>
						
						<tr>
							<td class="FormLabels" align="left" height="25" width="20%">Factor Object Name</td>
							<td class="links" align="left">
								<dmshtml:get_type nameInSession="arStates"  dcdObjectType="FACTOR" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
						<html:select
								property="answer(Object::ProductFactors::FactorObjectName)" name="AddFactor"
								styleClass="txtbox" styleId="factorObjName">
		<html:option value ="" >Select</html:option>
        <logic:present name="arStates" scope="request">
           <logic:iterate id="details" name="arStates" scope="request" >
		    <bean:define id='test' name="details"  property="typeDesc" />
		    <html:option value ='<%=test.toString()%>'>
		       <bean:write name="details" property="dmsType" />
		    </html:option>
		</logic:iterate>
		</logic:present>
		</html:select>

							<!--/html:select--></td>
						</tr>
						
						<tr>
							<td width="20%" class="FormLabels" align="left" height="25">Factor
							Version Number</td>
							<td class="links"><dmshtml:dms_text name="AddFactor"
								property="answer(Object::ProductFactors::VersionNumber)" size="30"
								maxlength="30" styleClass="txtbox" styleId="versionNumber" /></td>
						</tr>
						<tr>
							<td width="20%" class="FormLabels" align="left" height="25">Factor version 
							Name</td>
							<td class="links"><dmshtml:dms_text name="AddFactor"
								property="answer(Object::ProductFactors::FactorVerName)" size="60"
								maxlength="60" styleClass="txtbox" styleId="factorVerName"/></td>
						</tr>
						<tr>
							<td width="20%" class="FormLabels" align="left" height="25">Factor version
							Description</td>
							<td class="links"><dmshtml:dms_text name="AddFactor"
								property="answer(Object::ProductFactors::FactorVerDesc)" size="60"
								maxlength="60" styleClass="txtbox" styleId="desc"/></td>
						</tr>
						<tr>

							<td>&nbsp;<html:submit value="Add" styleClass="sbttn"
								property="answer(submit)" /></td>
						</tr>

				
				
			</table>
			</td>
		</tr>
		<tr>
			<td height="10px"></td>
		</tr>





	</table>
  
	<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">

		<% java.util.ArrayList FactorExcelList = new java.util.ArrayList();
	
		{
			
					 
	FactorExcelList=com.dms.util.Constants.listFilesInsideADirectory("Factor_Option_Excel_Path","Factors/"+ownerId.toString()+"/"+FactorId.toString()+"/"+FactorVerId.toString());
		}
		
	%>

	<tr>
		<td class="Error" COLSPAN="2">

		
			<% 
			System.out.print("Size=="+FactorExcelList.size());
			String dirPath=com.dms.util.Constants.getVersionedValueOf("Factor_Option_Excel_Relative_Path");
				for (int i=0; i<FactorExcelList.size(); i++)  {
				String fileName=(String) FactorExcelList.get(i);
			 %>
			<ol>
			<li>
			
				<a href="../doc.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&docName=<%=dirPath%>Factors/<%=Long.parseLong(ownerId.toString())%>/<%=FactorId.toString()%>/<%=FactorVerId.toString()%>/<%=fileName.toString()%>&docType=excel" target="new">
											<%=fileName.toString()%>
											</a>
			
			</li>
			</ol>
			<%}%>
		
		</td>
	</tr>

						</table>
	
	
	
	<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
	<html:hidden property="answer(Object::ProductFactors::dbName)"
					value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<html:hidden property="answer(Object::ProductFactors::CreatedBy)" value="<%=""+userName %>" />					
	<html:hidden property="answer(Object::ProductFactors::UpdatedBy)" value="<%=""+userName %>" />		
	<html:hidden property="answer(Object::ProductFactors::OwnerId)" value="<%=""+ownerId %>" />		
	<%if(!FactorId.toString().equals("")) {%>
	<html:hidden property="answer(Object::ProductFactors::FactorId)" value="<%=""+FactorId %>" />					
	<%} %>
	<html:hidden property="answer(Object::ProductFactors::VersionNumber)" styleId="prevVersionNum" />
	<html:hidden property="answer(Object::ProductFactors::FactorVerDesc)" styleId="prevVersionDesc" />				
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>
