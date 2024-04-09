<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<script type="text/JavaScript" SRC="../Scripts/JScripts/ImportLocationRisk.js" ></script>
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<style type="text/css">
.yui-skin-sam .yui-panel{position:relative;left:0;top:0;border-style:solid;border-width:10px 0;border-color:#808080;z-index:1;*border-width:1px;*zoom:1;_zoom:normal;}
.yui-hidden {display:none;}

</style>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>

<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.9.0/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.9.0/build/editor/assets/skins/sam/simpleeditor.css" />
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/element/element-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/editor/simpleeditor-min.js"></script>
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/container/assets/skins/sam/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/assets/skins/sam/menu.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/tabview/assets/skins/sam/tabview.css" />
<link rel="stylesheet" type="text/css"	href="../Scripts/YUI/2.7.0/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />  
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/utilities/utilities.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/paginator-min.js"></script> 
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/tabview/tabview-min.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/CauseListTable.js"></script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/Subjectivity.js" ></script>

<script type="text/JavaScript" SRC="../Scripts/JScripts/Common.js"></script>
<script type="text/JavaScript" SRC="../Scripts/YUI/2.7.0/build/menu/menu-min.js" ></script>
 <script type="text/javascript" src="../Scripts/YUI/2.7.0/build/yuiloader/yuiloader-min.js"></script>
<bean:define id="filepath" name="fileLocation"/>

<input type="hidden" name="answer(Object::Submission::Submissionid)" id="importsubmission">
<input type="hidden" name="answer(Object::Owner::OwnerId)" id="importownerid">
<input type="hidden" name="answer(Object::Attachment::AttachmentID)" id="importAttachmentID">
<input type="hidden" name="answer(Object::Customer::CustomerId)" id="importcustomerid">
<input type="hidden" name="answer(Object::File::FilePath)" id="importTemplate" value='<%=""+filepath%>'/>

<input type="hidden" name="answer(Object::Application::ApplicationType)" id="submissionapplicationtype" value="SUBMISSION_APPLICATION">
<input type="hidden" name="answer(TabPanelName)" id="tabpnel" value="Submission_Panel">
<input type="hidden" name="answer(customerId)" id="submissionCustomerid">
<input type="hidden" name="answer(requestForm)" id="requestForm" value="Submission">
<input type="hidden" name="answer(Object::Submission::InsuredId)" id="importSubmissionInsured">
<input type="hidden" name="answer(Object::Submission::SubmissionVerId)" id="importsubmissionverId">

<input type="hidden" name="answer(Object::Import::LocationSize)" id="importLocationSize">
<div id="locationsizeupdate"></div>


<div id="AttachFiles"></div>

<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
										<tr><td>&nbsp;<div id='frame'><iframe style="display:none;" onload="hideImportAttachPopup();" src="../common/MessageFromRule.jsp" id='upload_target_iFrame' name='upload_target_iFrame'   style='width:300px;height:300px;border:1px solid #ccc;'></iframe></div></td></tr>																		

	<tr><td>&nbsp;</td></tr>
	<tr><td></td><td>
	<a href='../DisplayImportAttachment.do?attachmentUrl=<%=filepath%>&attachmentType=XLS&fileName=LIU_Import_Template.xls&disposition=attachment' target='new' title="<bean:message key='ToolTip.ImportExport.DownloadTemplate'/>" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<IMG SRC="../Images/download.png" WIDTH="75" HEIGHT="75" BORDER="0" ALT="" >
</a> 
		</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>
			<a href="javascript:void(0)" onclick="AddAttachment('0','0','IMPORT','SUBMISSION');" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<IMG SRC="../Images/upload.png" WIDTH="75" HEIGHT="75" BORDER="0" ALT="" ></a>
   </td></tr>
   
   <tr><td></td></tr>
   
   
   <tr><td></td><td 
	align="left" >&nbsp;&nbsp;&nbsp;&nbsp;Download the xls Template to fill in&nbsp;<br>&nbsp;&nbsp;&nbsp; your Location/Tank Information&nbsp;&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td >&nbsp;&nbsp;&nbsp;&nbsp;Upload the spreadsheet with<br>&nbsp;&nbsp;&nbsp; your Location/Tank Information&nbsp;</td>
		<td>&nbsp;</td>
		

		
   </tr>
   <tr><td></td></tr>
   <tr><td></td></tr>
	<tr></tr>
	</table>



	<div id="SuccessMessage" style="Color:Blue;FONT-WEIGHT: bold;FONT-SIZE:14;"></div>


		
	
<div id="QUO_ATTACHMENT_LIST" style="word-wrap:break-word;COLOR: #ff0000;">

</div>

<div id="Override_Locations" style="word-wrap:break-word;COLOR: #ff0000;">

</div>




