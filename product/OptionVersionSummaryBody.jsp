<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<SCRIPT type="text/JavaScript">
<!--
function storeDateValues()
{
var formElement=document.forms[0];
formElement.optionVerName.value=formElement.OptionName.value;
var flag=null;
if(formElement.optionName.value==""){
alert("Please enter the Option Name ");
return false;
}
if(formElement.optionDesc.value==""){
alert("Please enter the Option Description ");
return false;
}
if(formElement.versionNumber.value==""){
alert("Please enter the Version Number ");
return false;
}

if((formElement.versionNumber.value!="") && (formElement.versionNumber.value <= formElement.prevVersionNum.value))
{
alert("Version Number has to be greater than "+formElement.prevVersionNum.value);
flag="old";
return false;
}else{
flag="new";
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

<body leftmargin="0" rightmargin="0" topmargin="0" onLoad="return popDateFields()">

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr>
		<td height="20">
		
		</td>
	</tr>
	<tr>
		<td class="NewSectionHead" align="center" colspan="10">
			OPTIONS VERSION SUMMARY
		</td>
	</tr>

	<tr>
		<td height="8px">
		
		</td>
	</tr>

	<tr>
		<td valign="top">
			<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			 	<tr>
				 	<td class="FormLabels" colspan="6">
				 
					 </td>
			 	</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td height="20px">
		
		</td>
	</tr>
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
	<bean:define id="OptionId" property="answer(Object::ProductOptions::OptionId)" name="UploadOptions" scope="request"/> 
	<bean:define id="OptionVerId" property="answer(Object::ProductOptions::OptionVerId)" name="UploadOptions" scope="request"/> 
	<bean:define id="optionName" property="answer(Object::ProductOptions::OptionName)" name="UploadOptions" scope="request"/>
		<%
			long lgOptionId=0;
			long lgOptionVerId=0;
			double dbOptionVerId=0.0;
			try {
			    lgOptionId=Long.parseLong(""+OptionId);
			    lgOptionVerId=Long.parseLong(""+OptionVerId);
					dbOptionVerId=Double.parseDouble(""+OptionVerId);
	
			} catch(Exception ex) {}
			
			if(lgOptionId>0 && lgOptionVerId>0 ) {
		%>
			<tr>
							
				<td class="SearchResult">
					<A HREF="../GetOptionValues.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::ProductOptions::OptionId)=<%=""+lgOptionId%>&answer(Object::ProductOptions::OptionVerId)=<%=""+lgOptionVerId%>">Show Option Values</A>
				</td>
				<td>&nbsp;</td>
				<td class="SearchResult">
					<A HREF="../GetOptionVersionDetails.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(actionCheck)=add&answer(ProductOptions::Equals::OptionId)=<%=""+lgOptionId%>&answer(ProductOptions::Equals::OptionVerId)=<%=""+lgOptionVerId%>&answer(createVersion)=yes">Create Version</A>
				</td>
			</tr>
		<%} %>
		<bean:define id="actionCheck" name="UploadOptions" property="answer(actionCheck)" />
		<bean:define id="createVersion" name="UploadOptions" property="answer(createVersion)" />
	
	<% boolean readOnly = false;%>
	<logic:present name="ProductOptionsDetail" scope="request">
		<% readOnly = true; %>
	</logic:present>
	<bean:define id="userName"
		property="answer(Object::UserDetail::userName)" name="LoginPage"
		scope="session" />

	
	<tr>
		<td align="center">
		<html:form action="/UpdateOptions.do" onsubmit="return storeDateValues()">


			<table border="0" width="10%" cellspacing="2" cellpadding="2"
				style="{border-width:1px; border-style:solid; border-color: #999999;}">
				<tr>
					<td class="sectionhead" colspan="2" align="center">
						OPTION VERSION DETAILS
					</td>
				</tr>
				<tr>
					<td colspan="2" height="5px">
					
					</td>
				</tr>

				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Option Name
					</td>
					<td class="SearchResult">
						<html:text styleId="optionName"
						property="answer(Object::ProductOptions::OptionName)"
						readonly="<%=readOnly%>" size="60" maxlength="60"
						styleClass="txtbox" />
					</td>
				</tr>				
				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Option Description
					</td>
					<td class="SearchResult">
						<html:textarea rows="4" styleId="optionDesc"
						property="answer(Object::ProductOptions::OptionDesc)"
						readonly="<%=readOnly%>" cols="37" styleClass="txtarea" />
					</td>
				
				</tr>
				
				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Rated
					</td>
					<td class="SearchResult">
						<html:select
							property="answer(Object::ProductOptions::Rated)"
							disabled="<%=readOnly%>" styleClass="TextField">
							<html:option value='Y'>Yes</html:option>
							<html:option value='N'>No</html:option>
						</html:select>
					</td>
				</tr>
				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Option Version No.
					</td>
					<td class="SearchResult">
						<html:text
						property="answer(Object::ProductOptions::OptionVerNum)"
						readonly="<%=readOnly%>" size="40" maxlength="10"
						styleClass="txtbox" styleId="versionNumber" />
					</td>
				</tr>
				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Display Name					
					</td>
					<td class="SearchResult">
						<html:text
						property="answer(Object::ProductOptions::OptionVerName)"
						readonly="<%=readOnly%>" size="60" maxlength="60"
						styleClass="txtbox" />
					</td>
				</tr>
				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Option Ver Description
					</td>
					<td class="SearchResult">
						<html:textarea rows="4"
						property="answer(Object::ProductOptions::OptionVerDesc)"
						readonly="<%=readOnly%>" cols="37" styleClass="txtarea" styleId="desc" />
					</td>
				</tr>
				
				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Default Option Value
					</td>
					<td class="SearchResult">
					<html:text
						property="answer(Object::ProductOptions::DefaultOptionValue)"
						readonly="<%=readOnly%>" size="60" maxlength="60"
						styleClass="txtbox" />
					</td>
				</tr>
				
				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Display Option Type
					</td>
					<td class="SearchResult">
						<html:select
							property="answer(Object::ProductOptions::OptionType)" name="UploadOptions"
							disabled="<%=readOnly%>" styleClass="TextField">
							<html:option value='TEXTBOX'>Textbox</html:option>
							<html:option value='Hidden'>Hidden</html:option>
							<html:option value='Select'>Dropdown</html:option>
							<html:option value='CHECKBOX'>Checkbox</html:option>
							<html:option value='Radio'>Radio Button</html:option>
							<html:option value='LISTBOX'>List Box</html:option>
							<html:option value='STATICTEXTBOX'>Static TextBox</html:option>
						</html:select>
					</td>
				</tr>
				
				
				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Option Data Type
					</td>
					<td class="SearchResult">
						<html:select
							property="answer(Object::ProductOptions::OptionDataType)" name="UploadOptions"
							disabled="<%=readOnly%>" styleClass="TextField">
							<html:option value=' '>Select</html:option>
							<html:option value='Numeric'>Numeric</html:option>
							<html:option value='String'>String</html:option>
							<html:option value='Date'>Date</html:option>
							<html:option value='USCurrencyDecimal'>USCurrencyDecimal</html:option>
							<html:option value='USCurrencyNonDecimal'>USCurrencyNonDecimal</html:option>
						</html:select>
					</td>
				</tr>
				
				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Min Value
					</td>
					<td class="SearchResult">
						<html:text
						property="answer(Object::ProductOptions::MinValue)"
						readonly="<%=readOnly%>" size="10" maxlength="10"
						styleClass="txtbox" styleId="minValue" />
					</td>
				</tr>
				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Max Value
					</td>
					<td class="SearchResult">
						<html:text
						property="answer(Object::ProductOptions::MaxValue)"
						readonly="<%=readOnly%>" size="10" maxlength="10"
						styleClass="txtbox" styleId="maxValue" />
					</td>
				</tr>
				
				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Allow Option Data to be null
					</td>
					<td class="SearchResult">
						<html:select
							property="answer(Object::ProductOptions::AllowNull)" name="UploadOptions"
							disabled="<%=readOnly%>" styleClass="TextField">
							<html:option value='Y'>Yes</html:option>
							<html:option value='N'>No</html:option>
						</html:select>
					</td>
				</tr>
				
				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Option Object Name
					</td>
					<td class="SearchResult">
					
				<dmshtml:get_type nameInSession="arStates"  dcdObjectType="OPTION" ownerId="<%=Long.parseLong(ownerId.toString())%>" 
				dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
					<html:select property="answer(Object::ProductOptions::OptionObjectName)" name="UploadOptions"
									disabled="<%=readOnly%>" styleClass="TextField">
					<html:option value ="">Select</html:option>
			        <logic:present name="arStates" scope="request">
			           <logic:iterate id="details" name="arStates" scope="request" >
					    <bean:define id='test' name="details"  property="typeDesc" />
					    <html:option value ='<%=test.toString()%>'>
					       <bean:write name="details" property="dmsType" />
					    </html:option>
					</logic:iterate>
					</logic:present>
					</html:select>
					</td>
				</tr>
				
				
				<dmshtml:dms_static_with_connector ruleName='privilage'
					property='<%=new String[]{"OBJECT-DELETE"}%>' connector='or'
					negated="true">
				<tr>
					<td class="sectionhead" width="15%" nowrap>
						Active
					</td>
					<td class="SearchResult">
						<html:select
							property="answer(Object::ProductOptions::Active)"
							disabled="<%=readOnly%>">
							<html:option value="Y">Active</html:option>
							<html:option value='D'>Deactive</html:option>
						</html:select>
					</td>
				</tr>
				</dmshtml:dms_static_with_connector>
				<%if(!readOnly){%>
				<tr>
					<td colspan="2" align="center">
						<html:submit value="Save"
						property="button" styleClass="sbttn" />
					</td>
				</tr>
				<%}%>
			

		<tr><td>
			
		
		<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">

		<% java.util.ArrayList OptionExcelList = new java.util.ArrayList();
				 OptionExcelList= com.dms.util.Constants.listFilesInsideADirectory("Factor_Option_Excel_Path","Options/"+ownerId.toString()+"/"+OptionId.toString()+"/"+OptionVerId.toString());
	%>

	<tr>
		<td class="Error" COLSPAN="2">

		
			<% 
			String dirPath=com.dms.util.Constants.getVersionedValueOf("Factor_Option_Excel_Relative_Path");
				for (int i=0; i<OptionExcelList.size(); i++)  {
				String fileName=(String) OptionExcelList.get(i);
			 %>
			<ol>
			<li>
			
				<a href="../doc.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&docName=<%=dirPath%>Options/<%=Long.parseLong(ownerId.toString())%>/<%=OptionId.toString()%>/<%=OptionVerId.toString()%>/<%=fileName.toString()%>&docType=excel" target="new">
											<%=fileName.toString()%>
											</a>
			
			</li>
        </ol>
			<%}%>
		
		</td>
	</tr>

			</table>
	
		
		<html:hidden property="answer(Object::ProductOptions::OptionId)" />
		<html:hidden property="answer(Object::ProductOptions::OptionVerId)" />
		<html:hidden property="answer(Object::ProductOptions::ProductId)" />
		<html:hidden property="answer(Object::ProductOptions::ProductVerId)" />

		<html:hidden property="answer(Object::ProductOptions::OptionState)" />
		<html:hidden
			property="answer(Object::ProductOptions::DefaultOptionValue)" />
		<html:hidden
			property="answer(Object::ProductOptions::OptionSequenceNumber)" />
		<html:hidden
			property="answer(Object::ProductOptions::OptionGroupNumber)" />
		<%if(actionCheck.equals("add")){ %>
		<html:hidden property="answer(actionCheck)" value="addVer" />
		<html:hidden property="answer(createVersion)" value='<%=""+createVersion%>' />
		<%}else{ %>
		<html:hidden property="answer(actionCheck)" value="update"/>
		<%} %>
		<html:hidden property="answer(Object::ProductOptions::CreatedBy)"
			value="<%=""+userName%>" />
		<html:hidden property="answer(Object::ProductOptions::UpdatedBy)"
			value="<%=""+userName%>" />
			<html:hidden property="answer(Object::ProductOptions::OptionVerNum)" styleId="prevVersionNum" />
			<html:hidden property="answer(Object::ProductOptions::OptionVerDesc)" styleId="prevVersionDesc" /></td></tr>
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
		</table>
	</html:form>
	</td>
	</tr>
	<tr>
		<td height="8px">
		</td>
	</tr>
	<!-- ####################################################################### -->

	<logic:present name="ProductOptionsDetail" scope="request">

		
	<tr>
		<td align="center">
		<html:form action="/UploadOptions" enctype="multipart/form-data">
			<table border="0" width="10%" cellspacing="2" cellpadding="2"
				style="{border-width:1px; border-style:solid; border-color: #999999;}">
				<tr><td><html:hidden property="answer(Object::ProductOptions::OptionName)" />
				<html:hidden
					property="answer(Object::ProductOptions::OptionVerNum)" />
				<html:hidden property="answer(Object::ProductOptions::OptionDesc)" />
				<html:hidden property="answer(Object::ProductOptions::Rated)" />
				<html:hidden property="answer(Object::ProductOptions::OptionType)" />
				<html:hidden
					property="answer(Object::ProductOptions::DefaultOptionValue)" />
				<html:hidden property="answer(Object::ProductOptions::Active)" />
					<html:hidden property="answer(Object::ProductOptions::OptionId)" />
				<html:hidden property="answer(Object::ProductOptions::OptionVerId)" />
				<html:hidden property="answer(objectId)" value="<%=OptionId.toString()%>" />
		<html:hidden property="answer(objectVerId)" value="<%=OptionVerId.toString()%>"/>
				<html:hidden property="answer(Object::ProductOptions::ProductId)" />
				<html:hidden
					property="answer(Object::ProductOptions::ProductVerId)" />
					<html:hidden property="answer(Object::ProductOptions::OptionState)" />
				<html:hidden
					property="answer(Object::ProductOptions::DefaultOptionValue)" />
				<html:hidden
					property="answer(Object::ProductOptions::OptionSequenceNumber)" />
				<html:hidden
					property="answer(Object::ProductOptions::OptionGroupNumber)" />
				<html:hidden property="answer(Object::ProductOptions::CreatedBy)"
					value="<%=""+userName%>" /></td></tr>
				<!--html:hidden property="answer(Object::ProductOptions::UpdatedBy)" value="<%=userName%>"/-->
				<tr>
					<td class="sectionhead" colspan="2" align="center">IMPORT
						OPTION VALUES
					</td>
				</tr>
				<tr>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="FormLabels" nowrap align="left">
						Select Options file (.xls) to import :
					</td>
					<td>
						<html:file property="myFile" styleClass="txtbox" />
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<html:submit value="Upload" styleClass="sbttn" />
					</td>
				</tr>
				<tr>
					<td colspan="3">
						&nbsp;
					</td>
				</tr>
					<tr><td><html:hidden property="answer(ImportType)" value="UPLOAD_FILE" />
					<html:hidden property="answer(propertyFileName)"
						value="/product/OptionImport" />
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" /></td></tr>
			</table>
			</html:form>
		</td>
	</tr>
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	
	</logic:present>





</table>
</body>