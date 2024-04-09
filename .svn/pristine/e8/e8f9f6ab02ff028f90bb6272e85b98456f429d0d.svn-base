var ImportLocationAvailable = false;

var showImportLocationsTanksDiv = true;
var ImportLocationDivActive = false;
var index = 0;
function importExportLocation(submissionid,ownerid,customerid,submissionverId)
{
	document.getElementById("AddLocationDiv").innerHTML = '<table border="0" width="99%" id="table2" cellspacing="0" cellpadding="0"><table border="0" width="99%" id="table2" cellspacing="0" cellpadding="0"><tr><td><div class="formpageForSubmissionPage"><div class="content"><div class="formhead"><h2 class="left">Import Location/Tank Information</h2></div><div id="AddLocationDiv1" ></div></div></div></td></tr></table>';
	if(ImportLocationAvailable == false) {
		index++;
		ImportLocationAvailable = true;

		var parent = document.getElementById("divide1");
		var anc = document.createElement("a");
		anc.setAttribute("href","javascript:void(0);");
		anc.className = "loctab_active left";
		var id = "importLocation"+index;

		anc.setAttribute("id",id);
		var span = document.createElement("span");
		span.className = "close right";
		span.onclick=function(){removeChild2(id);}
		anc.onclick = function() {ShowImportLocationDiv1(this.id);}
		anc.appendChild(span);

		parent.appendChild(anc);

		anc.appendChild(document.createTextNode("Import Location"));
	}
	var url = '../GetImportExportTemplate.do';

	new Ajax.Request(url, {method: 'post',onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){showTab(transport);initAttach();document.getElementById('importsubmission').value=submissionid;document.getElementById('importownerid').value=ownerid;document.getElementById('importcustomerid').value=customerid;document.getElementById('importsubmissionverId').value=submissionverId;document.getElementById('submissionCustomerid').value=customerid;document.getElementById('importSubmissionInsured').value=customerid;}});

	}

function ShowImportLocationDiv1(id){
	if(ImportLocationAvailable){//Checked for tab close operation
	 	document.getElementById("Loc3TableData").style.display = "none";
		document.getElementById("LocationAndTanksList").style.display = "none";
		updateDivForImportLocation();
		ImportLocationDivActive = true;
		activateTabs(id);
	}

}

function updateDivForImportLocation(){
	var ownerId = document.getElementById("ownerId1").value;
	var custId = document.getElementById("customerId1").value;
	var submissionStatus = document.getElementById("SubmissionStatus1").value;
	var submissionverID = document.getElementById("SubmissionVerId1").value;
	var	submissionId = document.getElementById("SubmissionId1").value;
	var submissionType = document.getElementById("submissionType").value;
	importExportLocation(submissionId,ownerId,custId,submissionverID);

}

function AddAttachment(objectId,objectVerId,ObjectTypeAttachment,objectType){
var pars="";
var submissionid = document.getElementById('importsubmission').value;
objectId = document.getElementById('importsubmission').value;
var url = "../attachment/ImportExportAttachmentDetail.jsp";
new Ajax.Updater('AttachFiles',url,{method: 'post',synchronous:true, parameters:pars, onComplete:function(){
forwardToLoginPageIfInvalidSession(document.getElementById("AttachFiles").innerHTML);document.getElementById('AttachFiles').style.display='inline';YAHOO.example.container.AttachFiles.show();setObjDetailV1(objectId,objectVerId,ObjectTypeAttachment,objectType);document.getElementById('attachmentName').focus();},onException:function(){}});

}
function SubmitAttachment(){
var Ownerid = document.getElementById('importownerid').value;
var customerID = document.getElementById('importcustomerid').value;
var submissionId = document.getElementById('importsubmission').value;
var submissionVerId = document.getElementById('importsubmissionverId').value;
var importTemplate = document.getElementById('importTemplate').value;
var ifrm = document.getElementById('upload_target_iFrame');
var doc = ifrm.contentDocument? ifrm.contentDocument: ifrm.contentWindow.document;
var uploadSuccessForm = doc.getElementById('SuccessFormID');

if(!uploadSuccessForm){
alert("Please Upload the Attachment First!!!!");
}
//var attachmentID = document.getElementById("importAttachmentID").value
var attachmentID = uploadSuccessForm.elements["answer(Object::Attachment::ImportAttachmentID)"].value;
var importId = uploadSuccessForm.elements["answer(Object::Import::ImportID)"].value;
var OverrideNeeded = uploadSuccessForm.elements["answer(Object::Import::OverrideNeeded)"].value;
if(attachmentID!=null){
var parms = "answer(Object::Attachment::AttachmentID)="+attachmentID+"&answer(Object::Customer::CustomerId)="+customerID+"&answer(Object::Import::FilePath)="+importTemplate+"&answer(Object::Import::OverrideNeeded)="+OverrideNeeded+"&answer(Object::Import::ImportID)="+importId+"&answer(Object::Submission::InsuredId)="+customerID+"&answer(Object::Submission::Submissionid)="+submissionId+"&answer(Object::Submission::SubmissionVerId)="+submissionVerId;
new Ajax.Updater('','../ImportLocationTank.do?'+parms,{method: 'post',synchronous:true, parameters:parms,onSuccess:function(transport)
{loadImportLocationListTable();var id = "importLocation"+index;removeChild2(id);

},onException:function(){}});
}else
alert("Please Upload the Attachment First!!!!");
}

function setObjDetailV1(objectId,objectVerId,ObjectTypeAttachment,objectType) {
document.AttachmentList.objectTypeLink.value=objectType;
document.AttachmentList.objectId.value=objectId;
document.AttachmentList.objectId1.value=objectId;
document.AttachmentList.objectVerId.value=objectVerId;
document.AttachmentList.objectVerId1.value=objectVerId;
document.AttachmentList.objectType.value=ObjectTypeAttachment;
}

function hideImportAttachPopup() {

if(document.AttachmentList!=null){
document.getElementById('AttachFiles').style.display='none';
YAHOO.example.container.AttachFiles.hide();
var ifrm = document.getElementById('upload_target_iFrame');
var doc = ifrm.contentDocument? ifrm.contentDocument: ifrm.contentWindow.document;
var uploadSuccessForm = doc.getElementById('SuccessFormID');
var attachmentID = uploadSuccessForm.elements["answer(Object::Attachment::ImportAttachmentID)"].value;
var validationMap = uploadSuccessForm.elements["answer(Object::Attachment::Validation)"];
var failureReason = uploadSuccessForm.elements["answer(Object::Import::FailureReason)"].value;
var validationStatus = uploadSuccessForm.elements["answer(Object::Import::ValidationStatus)"].value;
var OverrideNeeded = uploadSuccessForm.elements["answer(Object::Import::OverrideNeeded)"].value;
var importId = uploadSuccessForm.elements["answer(Object::Import::ImportID)"].value;
var overrideLocationList = uploadSuccessForm.elements["answer(Object::Import::OverrideLocation)"];

if(attachmentID!=null){
document.getElementById("importAttachmentID").value = attachmentID;
}
if(validationMap!=null){
	var validationmessages = validationMap.value;
	document.getElementById("QUO_ATTACHMENT_LIST").innerHTML = validationmessages;
	var isValidationPresent = uploadSuccessForm.elements["answer(Object::Import::IsValidationPresent)"].value;
	if(isValidationPresent=="false"){
		if(validationStatus=="SUCCESS"){
			if(OverrideNeeded=="Y"){
				document.getElementById("SuccessMessage").innerHTML = '<table WIDTH="101%"><tr><td></td><td></td><td></td><td></td><td></td><td><p  color="red">The following Location Information(Location Number) already entered into this submission will get over-written with the data given in the latest Import file. Please confirm to over-write the new entries below:</td><td><input type="button" value="Yes" id= "SubmitOverride" Class="subbutton" style="align:right;color:white;" onclick="DisableOverrideButton();SubmitAttachment();"></td><td><input type="button" value="No" Class="subbutton" style="color:white;" onclick="OverrideMessage();"></td></tr></table>';
			}else{
			document.getElementById("SuccessMessage").innerHTML = '<table WIDTH="111%"><tr><td></td><td></td><td></td><td></td><td></td><td><p align="right" color="red">File Uploaded Successfully.Please Click Submit to proceed Import Process</p></td><td><input type="button" value="Submit" id= "SubmitImport" Class="subbutton" style="align:right;color:white;" onclick="DisableSubmitButton();SubmitAttachment();"></td></tr></table>';
			}
		}else{
			document.getElementById("SuccessMessage").innerHTML="";
			alert("No Records in the Attached template / Attached file mismatch with the given Template!! Please Change and Proceed");
		}
	}else if(isValidationPresent=="true"){
		document.getElementById("SuccessMessage").innerHTML="";
	}
}
if(overrideLocationList!=null){
	var overrideLocations = overrideLocationList.value;
	document.getElementById("Override_Locations").innerHTML = overrideLocations;
}
}
}

 function DisableOverrideButton()
 {
	document.getElementById("SubmitOverride").disabled = true;
 }

function importAttachmentStatus(attachmentID,validationList,AttachStatus,ExtensionStatus) {
if(ExtensionStatus == "false" && AttachStatus == "null")
alert("The File type is Restricted to attach! Try a valid Document file");
}
function ImportSaveAttachment() {
if(validateImportAttachment()){

document.AttachmentList.submit();
}
}

function validateImportAttachment(){

if (document.AttachmentList.attachmentName.value ==""){
alert("Attachment Name is empty");
return false;
    }
    //if (document.AttachmentList.attachmentDesc.value ==""){
// alert("Attachment Description is empty");
// return false;
    //}
    if (document.AttachmentList.myFile.value ==""){
alert("File has not been Attached Yet !!!");
return false;
    }

return true;
}

function validateImportDocument(fileElementId)
      {

      	var inputFile = document.getElementById(fileElementId);
      	var fileName = inputFile.value;
      	var supportedFileList = ["xls"];
		var isValidFile = false;
      	var ext = fileName.substring(fileName.lastIndexOf('.') + 1);

      	for (var loop=0 ; loop < supportedFileList.length ; loop++ ) {
			supportedExt = supportedFileList[loop];

      		if(supportedExt == ext)
      		{

				isValidFile = true;
			}

      	}if(!isValidFile){
				alert("The File type is Restricted to attach! Try a valid Document file.");
				inputFile.focus();
				document.getElementById(fileElementId).parentNode.innerHTML = document.getElementById(fileElementId).parentNode.innerHTML;
      			return false;
			} else {
				return true;
			}
          }

function removeChild2(elem){

		ImportLocationAvailable = false;
		var parent = document.getElementById("divide1");
		var childId = document.getElementById(elem);
		childId.style.display = "none";

		document.getElementById("Loc3TableData").style.display = "block";
		document.getElementById("AddLocationDiv").style.display = "none";
		document.getElementById("AddLocationDiv").innerHTML = "";
		document.getElementById("LocationAndTanksList").style.display = "none";
		document.getElementById("LocationAndTanksList").innerHTML = "";
		activateImportTabs('LocationSchedule');

	}

function activateImportTabs(id){

	var parent = document.getElementById("divide1");

	arrChildren = parent.childNodes;

//loop thru all child nodes
for(i = 0; i < arrChildren.length; i++)
{

	objChild = arrChildren[i];
	if(objChild.id != undefined && objChild.id != null){
		objChild.className = "loctab_inactive left";
	}
}

if(id != null && id!=undefined){
 document.getElementById(id).className = 'loctab_active left';
 }
	//To check that active tab Name
	activeTabId = id;
}


	 function loadImportLocationListTable(){

 	    YAHOO.example.XHR_Text = function() {

	 var formatUrl = function(elCell, oRecord, oColumn, sData) {
	 			var locName = "'"+oRecord.getData("LocationName")+"'";
	 			var locString = new String(locName);
	 			locString = locString.replace(/ /g,"%20");
	 			locString = locString.replace(/&#39;/g,"___");
	 			 var onclickscript = "getTanksWithLocation("+oRecord.getData("LocationId")+","+locString+")";
             	elCell.innerHTML = "<a id='' onclick="+onclickscript+" rel='' target=''  href ='javascript:void(0);'>"+sData+"</a>";

        };

	   var moreColumnDefs = [
            {key:"Number", resizable:"true",width:40},
            {key:"Location Name", resizable:"true", formatter:formatUrl,width:135},
            {key:"Address Line 1",  resizable:"true",width:100},
            {key:"Address Line 2", resizable:"true",width:100},
            {key:"City", resizable:"true",width:120},
            {key:"State",  resizable:"true",width:90},
            {key:"Zip",  resizable:"true",width:80},
            {key:"UST",  resizable:"true",width:40},
            {key:"AST",  resizable:"true",width:40}
        ];
        var submissionId = document.getElementById("SubmissionId1").value;
        var submissionStatus="";
        var submissionVerId = document.getElementById("SubmissionVerId1").value;
       // alert(submissionVerId);
        var custId = document.getElementById("customerId1").value;
        var ownerId = document.getElementById("ownerId1").value;
        var agencyId = document.getElementById("AgencyId1").value;
  		//alert("entered")
  		var parameters ="answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionId)="+submissionId+"&answer(Object::Submission::SubmissionStatus)="+submissionStatus+"&answer(Object::Submission::SubmissionVerId)="+submissionVerId+"&answer(Object::Submission::InsuredId)="+custId+"&answer(requestForm)=Submission&customerId="+custId+"&answer(Object::UserDetail::ownerId)="+ownerId+"&answer(OwnerId)"+ownerId+"&SearchObjectId="+custId+"&answer(Object::Customer::CustomerId)="+custId+"&answer(Object::Agency::AgencyId)="+agencyId;
        var anotherDataSource = new YAHOO.util.DataSource("../ImportGetSubmissionLocationList.do");
        anotherDataSource.connMethodPost = true;
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Number","Location Name","Address Line 1","Address Line 2","City","State","Zip","UST","AST","LocationId","LocationName"]
        };

        anotherDataSource.subscribe( 'responseEvent',  function(oArgs) {
            // the remote response is in oArgs.response,
            // the raw text is oArgs.response.responseText
            var rawResponse = oArgs.response.responseText;
            forwardToLoginPageIfInvalidSession(rawResponse);
			var parseResponse = document.createElement( 'html' );
			parseResponse.innerHTML = rawResponse;
			var locationSize = parseResponse.getElementsByTagName("td")[0].innerHTML;
			document.getElementById("LocationListSize").innerHTML ="Location Schedule("+ locationSize+")";
        });

        // Configuration for Pagination
        var myConfigs = {
                initialRequest: parameters,
                generateRequest: parameters,
     	paginator : new YAHOO.widget.Paginator({
         rowsPerPage    : 10, // REQUIRED

         // use a custom layout for pagination controls
          template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",

         // use these in the rows-per-page dropdown
         rowsPerPageOptions : [10,15,20],

         // use custom page link labels
         pageLabelBuilder : function (page,paginator) {
             var recs = paginator.getPageRecords(page);
             return (recs[0] + 1) + ' - ' + (recs[1] + 1);
         }
     		})
 		};

        var myDataTableY = new YAHOO.widget.DataTable("LocationList1", moreColumnDefs,anotherDataSource,myConfigs);

	   return {
            oDS2: anotherDataSource,
          oDT2: myDataTableY

        };
    }();


 }
 function OverrideMessage()
 {
	document.getElementById("SuccessMessage").innerHTML = "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style='color: red;'>Please change/remove the existing Location numbers and upload the spreadsheet again to import the file.</span>";
 }

 function DisableSubmitButton()
 {
	document.getElementById("SubmitImport").disabled = true;
 }