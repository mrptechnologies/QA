<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/ZipCodeCommon.js"></<td class="Error" COLSPAN="2"></SCRIPT>

<html:form action="/UpdateUserInformation.do" name="ChangeUser" type ="com.dms.web.data.DataForm" scope="session" onsubmit="return ValidationFormLabelss();">
<div class="SubjectivityPage1">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>
<script type="text/javascript" src="../Scripts/prototype.js"></script>

	<link rel="stylesheet" type="text/css"  id="container.css"  href="../Scripts/YUI/2.4.1/build/container/assets/container.css" />
	<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
	<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container-min.js"></script>


<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr><td class="formhead"><h2 class="left">CHANGE PASSWORD</h2></td></tr>

	
	<tr><td class="details"><bean:message key="UserAccounts.ModDesc1"/></td></tr>
		<tr>
		<td><hr size="1" noshade></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<TR><TD class="Error"><ul>
	<html:errors/></ul></TD></TR>
	<tr>
			<td class="Error" COLSPAN="2">
			 
<bean:define id="ansmap" name="ChangeUser" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>
		<logic:iterate id="element" name="ansmap">
			<bean:define id="errorListkey" name="element" property="key" />
			<logic:equal name="errorListkey" value="Object::error::list">
			<bean:define id="errorListvalue" name="element" property="value" />
			<logic:iterate id="errmsg" name="errorListvalue">
			<ul><li>
			<bean:write name="errmsg" property="errorMessage" />
			</li></ul>
		</logic:iterate>
	</logic:equal>
</logic:iterate> 
</td>
			</tr>

<tr><td align="left">
<bean:define id="objectType" name="ChangeUser"  property="answer(Object::UserDetail::PrimaryObjectType)" />
<bean:define id="primaryObjectId" name="ChangeUser" property="answer(Object::UserDetail::PrimaryObjectId)" />
	<bean:define id="primaryObjectType" name="ChangeUser" property="answer(Object::UserDetail::PrimaryObjectType)" />
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	
	<tr>
		<td colspan="2" align="center" ><h3 class="left">User Information</h3></td>
	
	</tr>
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	<%if((""+objectType).equals("CUSTOMER")){ %>
	<tr>
		<td class="FormLabels" align="right" width="20%">Business Name</td>
		<td class="TextMatter">&nbsp;<html:text styleClass="txtbox"  property="answer(Object::Entity::FirstName)" size="30" maxlength="50"/>
		</td>	</tr>
	<tr>
	
	<%}else { %>
	<tr>
	<td class="FormLabels" align="right">Primary Role</td>
	
		<td>&nbsp;<bean:write  property="answer(Object::UserDetail::roleName)" name="ChangeUser" /></td>
	</tr>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_VIEW_SIGNATURE"}%>' connector='or' negated="false"> 
	<tr>
	  <td class="FormLabels" align="right">Agency Name</td>
	  <td>&nbsp;<bean:write  property="answer(Object::Entity::AgencyName)" name="ChangeUser" /></td>
	</tr>
	<tr>
	  <td class="FormLabels" align="right">Agent Name</td>
	  <td>&nbsp;<bean:write  property="answer(Object::Entity::FirstName)"  name="ChangeUser" /></td>
	</tr>
	
	</dmshtml:dms_static_with_connector>
	<tr>
		<td class="FormLabels" align="right" width="20%"><bean:message key="Appointment.FirstName"/>*</td>
		<td class="TextMatter">&nbsp;<html:text styleClass="txtbox"  property="answer(Object::Entity::FirstName)" styleId="firstName" size="30" maxlength="50"/>
		</td>	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="Appointment.LastName"/>*</td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::Entity::LastName)" styleId="lastName"  size="30" maxlength="50"/></td>
	</tr>
	<html:hidden property="answer(Object::Entity::middleName)"/>
	<tr>
		<td class="FormLabels" align="right">Name Code*</td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::Entity::EntityNum)" styleId="NameCode" size="8" maxlength="8"/></td>
	</tr>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_VIEW_SIGNATURE"}%>' connector='or' negated="true">
	<tr>
		<td class="FormLabels" align="right">License #</td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::EntityAdditional::LicenseNumber)" styleId="LicenseNumber" /></td>
	</tr>
	</dmshtml:dms_static_with_connector>
	<tr>
         <td class="FormLabels" align="right">Title
	 </td>
	 <td >
	 &nbsp;<html:text styleClass="txtbox"  property="answer(Object::Entity::Title)" size="30" maxlength="50"/>
	 </td>
	 </tr>
	<%} %>
	
		
		<tr><td>&nbsp;</td></tr>
		<!-- Business Address -->
				<tr>
					<td colspan="2" align="center"><h3 class="left">Address Information</h3></td>						
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;<bean:message key="Appointment.Address"/>1
					</td>
					<td>	
						&nbsp;<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Address1)" rows="2" cols="30"/>
					</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;Address 2
					</td>
					<td>
						&nbsp;<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Address2)" rows="2" cols="30"/>
					</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;<bean:message key="Appointment.City"/>
					</td>
					<td>
						&nbsp;<dmshtml:dms_text styleClass="txtbox" styleId="City" property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::City)" size="30" maxlength="30"/>
					</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;State
					</td>
					<td>
					<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
					  &nbsp;<dmshtml:get_type nameInSession="arStates"  dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
						<html:select property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::State)" styleClass="txtbox" styleId="State">
							<html:option value ="">Select</html:option>
							<logic:iterate id="details" name="arStates" scope="request" >
								<bean:define id='test' name="details"  property="typeDesc" />
								<html:option value ='<%=test.toString()%>'>
									<bean:write name="details" property="dmsType" />
								</html:option>
							</logic:iterate>
						</html:select>
					</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;Country
					</td>
					<td class="TextMatter">&nbsp;<dmshtml:dms_radio property = "answer(Object::Entity::Addresses::BUSINESS::Object::Address::Country)" value="USA"  />USA&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::Entity::Addresses::BUSINESS::Object::Address::Country)" value="Canada" />
						Canada
					</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;<bean:message key="Appointment.Zip"/>
					</td>
					<td>
						&nbsp;<dmshtml:dms_text styleClass="txtbox" styleId="Zip"  property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Zip)" size="10" maxlength="10"/>
						<!--Zipcode lookup start -->
						<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=ChangeUser&HomeFlag=Business&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>

					</td>
						<!--  end-->		
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;<bean:message key="Appointment.PhoneNo"/>
					</td>
					<td>
						&nbsp;<dmshtml:dms_text styleClass="txtbox" styleId="BusinessPhoneNum"  property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::WorkPhone)" size="40" maxlength="40"/>
					</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;Fax
					</td>
					<td>
						&nbsp;<dmshtml:dms_text styleClass="txtbox" styleId="BusinessFaxNum"  property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::Fax)" size="40" maxlength="40"/>
					</td>
				</tr>
		<tr>
					<td>&nbsp;</td>
				</tr>
		
		<tr>
					<td colspan="2" align="center"><h3 class="left">BRANCH INFORMATION 	</h3>					
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">&nbsp;&nbsp;Branch Name</td>
					<td class="links" style="Class:txtbox">&nbsp;
					
						<html:select property="answer(Object::Entity::BranchName)" styleClass="txtbox" styleId="DocType">
							<html:option value ="Toronto">Toronto</html:option>
							<html:option value ="Calgary">Calgary</html:option>							
							<html:option value ="Puerto Rico">Puerto Rico</html:option>
							<html:option value ="Boston">Boston</html:option>
							<html:option value ="Miami">Miami</html:option>
							<html:option value ="New York">New York</html:option>
							<html:option value ="San Francisco">San Francisco</html:option>
							<html:option value ="Denver">Denver</html:option>
                            <html:option value ="Los Angeles">Los Angeles</html:option>	
							<html:option value ="Houston">Houston</html:option>		
							<html:option value ="Chicago">Chicago</html:option>								
						</html:select>
					</td>
				</tr> 
		
	
		<tr><td>&nbsp;</td></tr>	
		 <tr> 
    <td></td>
       <td  align="left"   class="Links">&nbsp;&nbsp;<html:button value="Save Address Information" property="answer(SaveAddressInfo)" styleClass="buttonbig" onclick="SaveAddressInfo();"/></td>
   </tr>
   <tr><td>&nbsp;</td></tr>
   <tr>
		<td colspan="2" align="center"><h3 class="left">User EmailId</h3></td>
	
	</tr>	 
   <tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.EMail"/></td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::UserDetail::email)" styleId="email" size="30" maxlength="50" /></td>
	</tr>
	 <tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" align="center"><h3 class="left">User Security Information</h3></td>
	
	</tr>
	<tr><td>&nbsp;</td></tr>
	 <tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.UserName"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="ChangeUser"  property="answer(Object::UserDetail::userName)" /></td>
	</tr> 
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.OldPassword"/>*</td>
		<td>
			&nbsp;<input id="oldPassword" type="password" name="answer(Object::UserDetail::passWord)" maxlength="30" size="30" class="txtbox" autocomplete="off" value="">
		</td>
	</tr>  
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.NewPassword"/>*</td>
		<td class="menulinks">
			&nbsp;<input id="newPassword" type="password" name="answer(Object::UserDetailAdditional::NewPassword)" maxlength="30" size="30" class="txtbox" autocomplete="off" value="">&nbsp;<bean:message key="UserAccounts.pwvalidation"/>
		</td>
	</tr>  
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.ConfirmNewPassword"/>*</td>
		<td>
			&nbsp;<input id="confirmPassword" type="password" name="answer(Object::UserDetail::passWordConfirm)" maxlength="30" size="30" class="txtbox" autocomplete="off" value="">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.Question"/></td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::UserDetail::hintQuestion)" size="30" maxlength="50" styleId="hintQuestion"/></td>
	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.Answer"/></td>
		<td>
			&nbsp;<input id="hintAnswer" type="password" name="answer(Object::UserDetail::hintAnswer)" maxlength="50" size="30" class="txtbox" autocomplete="off" value="">
		</td>
	</tr>
	
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	

    <tr> 
    <td></td>
       <td  align="left"   class="Links">&nbsp;&nbsp;<html:submit value="Save User Information" styleClass="buttonbig" /></td>
   </tr>
   <tr><td>&nbsp;</td></tr>
   </table>
</table>
	
	
		
	

<html:hidden property="page" value="8" />
		
<html:hidden property="formName" value="MicaCare::ChangePassWord"/>
	<html:hidden name="ChangeUser" property="answer(entityId)" value='<%=request.getParameter("entityId")%>'/>
	
	

<html:hidden name="ChangeUser" property="answer(forwardNavigate)" value="failure"/>
<html:hidden name="ChangeUser" property="answer(Object::Entity::EntityVerId)" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<html:hidden name="ChangeUser" property="answer(Object::Address::User)" value="<%=""+userId %>" />
<html:hidden name="ChangeUser" property="answer(Object::Address::OwnerId)" value="<%=""+ownerId %>" />

<html:hidden name="ChangeUser" property="answer(Object::UserDetail::PrimaryObjectId)" value='<%=request.getParameter("entityId")%>'/>
<html:hidden name="ChangeUser" property="answer(Object::UserDetail::PrimaryObjectType)" value='<%=request.getParameter("objectType")%>'/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::County)" styleId="County"/>
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />

<html:hidden name="ChangeUser" property="entityId" value='<%=request.getParameter("entityId")%>'/>
<html:hidden name="ChangeUser" property="objectType" value='<%=request.getParameter("objectType")%>'/>

</html:form>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_VIEW_SIGNATURE"}%>' connector='or' negated="true"> 
<html:form action="/UpdateAttachmentDetails.do" enctype="multipart/form-data" target="upload_target_iFrame">

<div id="IMAGE_CONTAINER">
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
	<bean:define id="objectType" name="ChangeUser"  property="answer(Object::UserDetail::PrimaryObjectType)" />
<bean:define id="primaryObjectId" name="ChangeUser" property="answer(Object::UserDetail::PrimaryObjectId)" />
	<bean:define id="primaryObjectType" name="ChangeUser" property="answer(Object::UserDetail::PrimaryObjectType)" />
	<bean:define id="entityVerId" name="ChangeUser"  property="answer(Object::Entity::EntityVerId)" />
<%
		long entityId1 = 0;
        long objectId = 0;
        long objectVerId = 0;
		String attachmentType1 = "";	
		
		if(request.getParameter("entityId")!=null){
			entityId1 = Long.parseLong(""+request.getParameter("entityId"));			
		}else{
			entityId1 =Long.parseLong(""+primaryObjectId);
		}
		if(request.getParameter("objectType")!=null){
			attachmentType1 = ""+request.getParameter("objectType");			
		}else{		
			attachmentType1 = ""+primaryObjectType;
		}
		objectId = entityId1;
		objectVerId = Long.parseLong(""+entityVerId);
	%>	
	<%String path=""; %>
	<%String attachmentURL = "";%>
	<%String attachmentID = "-1";%>	
	<%String fileName = "";%>	
	<%String attachmentObjectType =""+primaryObjectType;%>
	<dmshtml:GetAttachedList DBName='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' nameInSession="arrOfFile" objectId='<%=Long.parseLong(""+entityId1) %>' objectType='<%=attachmentType1%>' ownerId='<%=Long.parseLong(""+ownerId) %>' />
		<logic:present name="arrOfFile">
			<%
			    java.util.ArrayList arrOfAttachement = (java.util.ArrayList)request.getAttribute("arrOfFile");
				com.dms.ejb.data.QuestionHashMap attachementMap = null ;
				if(arrOfAttachement.size()>0){
				attachementMap = (com.dms.ejb.data.QuestionHashMap)arrOfAttachement.get(0);
				attachmentURL = attachementMap.getString("Object::Attachment::AttachmentUrl");	
				attachmentID=attachementMap.getString("Object::Attachment::AttachmentId");
				fileName=attachementMap.getString("Object::Attachment::FileName");
				}
			    
			%>
		</logic:present>
		
	 <dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="DOC_ROOT_URL" />
           
           <logic:present name="paramValue">
               <logic:equal value="/Liberty" name="paramValue">
               <bean:define id="imgPath" name="paramValue" type="java.lang.String" />
               
             <% path=imgPath;%>
               </logic:equal>
           </logic:present>
   
	
	<div style="height:40px;" ><h3 class="left">User Signature</h3></div>
	    
		<div class="FormLabels"  style="width:200px;float:left; font-weight:bold; color:#000;text-align: right;">Current Signature&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
	    <div id="image" style="float:left; text-align:right;"><IMG SRC="<%=".."+path+attachmentURL+"" %>"  ALT="Signature not Available"  width="212px" height="66px" align="left"></div>
	<div style="height:80px;"></div>
	<div align="center" style="width:600px;"><html:button onclick="showAdd();" property="anser(this)" value="Update Signature Image" styleClass="buttonbig" /></div>
	
		<div align="center" style="width:600px;height:30px;">(GIF or JPG images only)
		</div>
	</div>
	
<div id="dialog2" style='display: none;'>

<div class="hd">Upload New Signature Here</div>
<div class="bd">
<table cellpadding="1" cellspacing="0">
  	 <tr>
  	   <td> 
  	     <h6>Name:</h6>  
  	     
  	     
  	   </td>
       <td> 
         <input type='text' name='answer(Object::Attachment::Name)' maxlength='47' size='40' value='' id='attachmentName'>
        
     </tr>
  	 <tr>
  	 <td>
  	   <h6>Description:</h6>
  	 </td>
  	<td>
  	<div id="text">
  	 <textarea name='answer(Object::Attachment::Description)' cols='50' rows='4' id='attachmentDesc'></textarea></div> 
  	</td>
  </tr>
<tr><td>
Select File:
</td>
<td>
<div id='uploader'>
<table><tr><td>&nbsp;&nbsp;&nbsp;</td></tr><tr><td><input type='file' name='myFile' maxlength='127' size='43' value='' id='myFile' onchange="signatureFileType('myFile')"></td></tr><tr><td><div id='frame'style='display: none; return: false;'><iframe id='upload_target_iFrame' name='upload_target_iFrame' src='../common/MessageFromRule.jsp'  style='width:300px;height:30px;border:1px solid #ccc;' onload = 'refreshImage()' ></iframe></div></td></tr><tr><td></td></tr></table>
</td>
</tr>
</div>
<tr>
  	<td>&nbsp;</td>
  	</tr>
  	<tr>
  	<td>&nbsp;</td>
  	<td align="center">
  		<html:button property="SaveAttachment" value="Save" styleClass="uibutton"  onclick="changeFormAction();" />
  		<html:button property="CancelAttachment" value="Cancel" onclick="closeContainer();" styleClass="uibutton" />
  	</td>
  	</tr>
  </tr>
</table>
</div>
</div>

<html:hidden  property="answer(Object::Attachment::AttachmentId)" value="<%=""+ attachmentID%>" />
<input type="hidden" name="answer(Object::AttachmentObjectLink::ObjectType)" value="<%=""+objectType%>" >
<input type="hidden" name="answer(Object::AttachmentObjectLink::ObjectId)" value="<%=""+entityId1%>"  >
<html:hidden  property="answer(Object::Attachment::ObjectType)" value="<%=""+ attachmentObjectType%>" />
<html:hidden  property="answer(Object::Attachment::ObjectId)" value="<%=""+ objectId%>" />
<html:hidden  property="answer(Object::Attachment::ObjectVerId)" value="<%=""+ objectVerId%>" />



</html:form>
</div>
</dmshtml:dms_static_with_connector>
<Script type="text/javascript">
 var imageRefresh="0";
function ValidationFormLabelss(){
	var oldPassword = document.getElementById("oldPassword").value;
	var newPassword = document.getElementById("newPassword").value;
	var confirmPassword = document.getElementById("confirmPassword").value;
	var hintQuestion = document.getElementById("hintQuestion").value;
	var hintAnswer = document.getElementById("hintAnswer").value;	
	
	if(oldPassword != "" && newPassword != ""){
		if(newPassword.length > 6){
			if(oldPassword == newPassword){
				alert("New Password must not be the same as previous Password");
				return false;
			}
			if(newPassword != confirmPassword){
				alert("Password and Confirm password should be same.");
				return false;
			}
		}else{
			alert("The Password should be at least 6 alphanumeric characters");
			return false;
		}	
	}else{
		alert("1. Old Password is required. \n2. New Password is required. \n3. Confirm Password is required.");
		return false;
	}	
	
	if(hintQuestion != ""){
		if(hintAnswer == ""){
			alert("Please Enter the Answer for the given Question.");
			document.getElementById("hintAnswer").style.background='#FFCC33';
			document.getElementById("hintAnswer").focus();
			return false;
		}
	}
	if(hintAnswer != ""){
		if(hintQuestion == ""){
			alert("Please Enter the Question for the given Answer.");
			document.getElementById("hintQuestion").style.background='#FFCC33';
			document.getElementById("hintQuestion").focus();
			return false;
		}
	}
	
	
}
 YAHOO.namespace("example.container");

    function showAdd(){
    document.getElementById("dialog2").style.display = "block";	
    document.getElementById("attachmentName").value = "";
    document.getElementById("attachmentDesc").value = "";
    document.getElementById("upload_target_iFrame").value = "";
      
   
  // Instantiate the Dialog
 YAHOO.example.container.dialog2 = new YAHOO.widget.Dialog("dialog2", 
       { width : "40em",
         fixedcenter : true,
         visible : false, underlay:"shadow",
         constraintoviewport : true
       });

 YAHOO.example.container.dialog2.render();
 YAHOO.example.container.dialog2.show();

 }
    function signatureFileType(fileElementId)
    {
    	var inputFile = document.getElementById(fileElementId);
    	var fileName = inputFile.value;
    	var supportedFileList = ["gif", "jpg", "GIF", "JPG"];

    	var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
    	
    	for (var loop=0 ; loop < supportedFileList.length ; loop++ ) {
			supportedExt = supportedFileList[loop];
    		if(supportedExt == ext)
    		{
    			return true;		
    		} 
        }
    	alert("The File type is Restricted to attach! Try a valid Document file");
		inputFile.focus();
		document.getElementById(fileElementId).parentNode.innerHTML = document.getElementById(fileElementId).parentNode.innerHTML;
		return false;
    }
 function closeContainer(){
YAHOO.example.container.dialog2.cancel();
document.getElementById("dialog2").style.display = "none";  
}
function changeFormAction(){
 document.forms[1].action="../UpdateAttachmentDetails.do";
 YAHOO.example.container.dialog2.cancel();	
 closeContainer(); 
 document.forms[1].submit();
 imageRefresh = 1;

 
 //window.location.reload();
 }
 
function SaveAddressInfo(){
document.forms[0].action="/UpdateAddressInformation.do";

var firstName = document.getElementById("firstName").value;
	
	if(document.getElementById("firstName").value.length==0){
	      alert("Please Enter First Name");
	      document.getElementById("firstName").focus();
	      return false;
	}
	if(document.getElementById("lastName").value.length==0){
	      alert("Please Enter LastName");
	      document.getElementById("lastName").focus();
	      return false;
	}
	if(document.getElementById("NameCode").value.length==0){
	      alert("Please Enter Name Code");
	      document.getElementById("NameCode").focus();
	      return false;
	}
	if(document.getElementById("email").value.length==0){
	      alert("Please Enter Email");
	      document.getElementById("email").focus();
	      return false;
	}

 document.forms[0].submit();
}
  
function refreshImage(){
 url="/user/SignatureResult.jsp";	
 panel="IMAGE_CONTAINER";
 if (imageRefresh ==1){
  new Ajax.Request(url, {method: 'post',parameters:$(document.forms[1]).serialize(this),onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess:
  function(transport){
	  	 document.getElementById('image').innerHTML = transport.responseText;
  }});
 }
}
</Script>
