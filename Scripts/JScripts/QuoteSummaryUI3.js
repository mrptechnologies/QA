/* Commented because, UI 3.0 dosen't have following filed. So to avoid the unwanted browser error, I have commented the line
 * @author Guru
 */
 /*var formElement = document.forms[0];
 var status = formElement.quoteStatustemp.value;
 if(status=="In Progress" || status=="Reffered") {
	 formElement.reqeffdate.readOnly=false;

 } else {
 	formElement.reqeffdate.readOnly=true;
 	formElement.reqeffdate.style.border = "0px solid #000000";

 }*/
  var myEditor;
  function renderEditor() {
      var Dom = YAHOO.util.Dom,
          Event = YAHOO.util.Event;

      YAHOO.log('Create the Editor..', 'info', 'example');
      myEditor = new YAHOO.widget.SimpleEditor('Content', {
          height: '150px',
          width: '875px',
          dompath: true,
          filterWord: true,
          focusAtStart: true,
          animate: true,
          toolbar: {
              titlebar: 'Enter Content',
              buttons: [
                        { group: 'fontstyle', label: 'Font Name and Size',
                            buttons: [
                                { type: 'select', label: 'Arial', value: 'fontname', disabled: false,
                                    menu: [
                                        { text: 'Arial', checked: true },
                                        { text: 'Arial Black' },
                                        { text: 'Comic Sans MS' },
                                        { text: 'Courier New' },
                                        { text: 'Garamond' },
                                        { text: 'Lucida Console' },
                                        { text: 'Tahoma' },
                                        { text: 'Times New Roman' },
                                        { text: 'Trebuchet MS' },
                                        { text: 'Verdana' }
                                    ]
                                },
                                { type: 'spin', label: '10', value: 'fontsize', range: [ 9, 75 ], disabled: false }
                            ]
                        },
                        { type: 'separator' },
                        { group: 'textstyle', label: 'Font Style',
                            buttons: [
                                { type: 'push', label: 'Bold CTRL + SHIFT + B', value: 'bold' },
                                { type: 'push', label: 'Italic CTRL + SHIFT + I', value: 'italic' },
                                { type: 'push', label: 'Underline CTRL + SHIFT + U', value: 'underline' },
                                { type: 'push', label: 'Strike Through', value: 'strikethrough' },
                                { type: 'separator' },
                                { type: 'color', label: 'Font Color', value: 'forecolor', disabled: false },
                                { type: 'color', label: 'Background Color', value: 'backcolor', disabled: false }
                            ]
                        },
                        { type: 'separator' },
                        { group: 'indentlist', label: 'Lists',
                            buttons: [
                                { type: 'push', label: 'Create an Unordered List', value: 'insertunorderedlist' },
                                { type: 'push', label: 'Create an Ordered List', value: 'insertorderedlist' }
                            ]
                        }
                    ]
          }
      });
      myEditor._defaultToolbar.buttonType = 'advanced';
      myEditor.render();

  }


 function activateQuoteTabs(activateId){
	document.body.style.cursor = "wait"	;
	activeTabName = "";
 	//To prevent from clicking tabs untill Ajax is complete
 	if(document.getElementById("DocumentationTab") != undefined){
 		document.getElementById("DocumentationTab").disabled = true;
 	}
 	if(document.getElementById("CoveragesLimitsTab") != undefined){
 		document.getElementById("CoveragesLimitsTab").disabled = true;
 	}
 	if(document.getElementById("GeneralQuestionTab") != undefined){
 		document.getElementById("GeneralQuestionTab").disabled = true;
 	}
 	if(document.getElementById("LocationTankTab") != undefined){
 		document.getElementById("LocationTankTab").disabled = true;
 	}
 	if(document.getElementById("SubjectivityTab") != undefined){
 		document.getElementById("SubjectivityTab").disabled = true;
 	}
 	if(document.getElementById("RatingDetailTab") != undefined){
 		document.getElementById("RatingDetailTab").disabled = true;
 	}
 	if(document.getElementById("ScheduleofFormsTab") != undefined){
 		document.getElementById("ScheduleofFormsTab").disabled = true;
	}
	if(document.getElementById("UWWorkSheetTab") != undefined){
		document.getElementById("UWWorkSheetTab").disabled = true;
	}
	if(document.getElementById("StalePageErrorMsg") != undefined && isStalePageErrorPresent==false){
	document.getElementById("StalePageErrorMsg").style.display = "none";

	}

	isStalePageErrorPresent=false;
	//To cahnge the style of the tabs
	if(document.getElementById("DocumentationTab") != undefined){
 		document.getElementById("DocumentationTab").className = "todotab_inactive";
 	}
 	if(document.getElementById("CoveragesLimitsTab") != undefined){
 		document.getElementById("CoveragesLimitsTab").className = "todotab_inactive";
 	}
 	if(document.getElementById("GeneralQuestionTab") != undefined){
 		document.getElementById("GeneralQuestionTab").className = "todotab_inactive";
 	}
 	if(document.getElementById("LocationTankTab") != undefined){
 		document.getElementById("LocationTankTab").className = "todotab_inactive";
 	}
 	if(document.getElementById("SubjectivityTab") != undefined){
 		document.getElementById("SubjectivityTab").className = "todotab_inactive";
 	}
 	if(document.getElementById("RatingDetailTab") != undefined){
 		document.getElementById("RatingDetailTab").className = "todotab_inactive";
 	}
 	if(document.getElementById("ScheduleofFormsTab") != undefined){
 		document.getElementById("ScheduleofFormsTab").className = "todotab_inactive";
 	}
 	if(document.getElementById("UWWorkSheetTab") != undefined){
		document.getElementById("UWWorkSheetTab").className = "todotab_inactive";
	}
 	document.getElementById(activateId).className = "todotab_active";



 }

 function enableTabs(){

 	document.body.style.cursor = "default"	;
 	//To prevent from clicking tabs untill Ajax is complete
 	if(document.getElementById("DocumentationTab") != undefined){
 		document.getElementById("DocumentationTab").disabled = false;
 	}
 	if(document.getElementById("CoveragesLimitsTab") != undefined){
 		document.getElementById("CoveragesLimitsTab").disabled = false;
 	}
 	if(document.getElementById("GeneralQuestionTab") != undefined){
 		document.getElementById("GeneralQuestionTab").disabled = false;
 	}
 	if(document.getElementById("LocationTankTab") != undefined){
 		document.getElementById("LocationTankTab").disabled = false;
 	}
 	if(document.getElementById("SubjectivityTab") != undefined){
 		document.getElementById("SubjectivityTab").disabled = false;
 	}
 	if(document.getElementById("RatingDetailTab") != undefined){
 		document.getElementById("RatingDetailTab").disabled = false;
 	}
 	if(document.getElementById("ScheduleofFormsTab") != undefined){
 		document.getElementById("ScheduleofFormsTab").disabled = false;
	}
	if(document.getElementById("UWWorkSheetTab") != undefined){
		document.getElementById("UWWorkSheetTab").disabled = false;
	}



 }

 function loadQuoteLocationList(LocationTabId){

 		activateQuoteTabs(LocationTabId);
 		var subQuoteId1 = document.getElementById("subQuoteId11").value;
       	var subQuoteVerId1 = document.getElementById("subQuoteVerId").value;
      	var riskTerritory1 = document.getElementById("riskTerritory1").value;
      	var customerId1 = document.getElementById("customerId").value;
      	var agencyId1 = document.getElementById("agencyId").value;
      	var prodId1 = document.getElementById("prodId").value;
      	var productVerId1 = document.getElementById("ProductVerId").value;
      	var GroupId1 = document.getElementById("GroupId").value
      	var ownerId1 = document.getElementById("ownerId").value;
      	var GroupVerId1 = document.getElementById("GroupVerId").value;
      	var parentQuoteId1 = document.getElementById("parentQuoteId").value;
      	var productStatus1 = document.getElementById("productStatus").value;
      	var CustomerState1 = document.getElementById("CustomerState").value;
      	var ProductFamilyId1 = document.getElementById("ProductFamilyId").value;
      	var parentQuoteVerId1 = document.getElementById("parentQuoteVerId").value;
 		var paretQuoteStatus = document.getElementById("paretQuoteStatus").value;
 	 	var pars2 = "answer(IsApplicationDisabled)=Y&customerId="+customerId1+
        "&answer(Object::UserDetail::ownerId)="+ownerId1+
        "&answer(Object::Customer::CustomerId)="+customerId1+
        "&answer(Object::Agency::AgencyId)="+agencyId1+
        "&answer(objectId)="+prodId1+
        "&answer(objectVerId)="+productVerId1+
        "&answer(objectName)=PRODUCT&answer(prdGroupId)="+GroupId1+
        "&answer(prdGroupVerId)="+GroupVerId1+
        "&answer(productStatus)="+productStatus1+
        "&answer(Object::Quote::QuoteStatus)="+paretQuoteStatus+
        "&answer(teritory)=&answer(riskTerritory)="+riskTerritory1+
        "&answer(territoryName)=&answer(zone)=&answer(state)=&answer(showOnetTab)=Y&tabNo=0&answer(Object::Customer::State)="+CustomerState1+
        "&answer(Object::Risk::ComProperty::CustomerId)="+customerId1+
        "&answer(parentQuoteId)="+parentQuoteId1+
        "&parentQuoteId="+parentQuoteId1+
        "&answer(subQuoteId)="+subQuoteId1+
        "&answer(QuoteId)="+subQuoteId1+
        "&answer(Object::Customer::CustomerId)="+customerId1+"&answer(Object::Agency::AgencyId)="+agencyId1+
        "&answer(FamilyId)="+ProductFamilyId1+"&answer(parentQuoteVerId)="+parentQuoteVerId1+
        "&answer(Object::Quote::PrevSubQuoteVerId)="+subQuoteVerId1;
     autologout();
	 new Ajax.Request("../getquoteSchduleOfTanks.do",
	 	{method: 'post',
			asynchronous:true,parameters:pars2,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				forwardToLoginPageIfInvalidSession(transport.responseText);
				enableTabs();
		 		loadQuoteLocationList1();
		 	},onSuccess: function(transport){
		 	document.getElementById("QuoteDiv").style.display = "block";
		 	document.getElementById("QuoteDiv").innerHTML= transport.responseText;
		 	}
		}
	);



 }

 function loadCoverageAndLimitsTab(loadCoverageAndLimitsTabId){
 	ajaxCounter = 0;//to set counter value to default since counter value may be replaced by other tab ajax actions
 	activateQuoteTabs(loadCoverageAndLimitsTabId);

 	var parentQuoteId = document.getElementById("parentQuoteId").value;
 	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
 	var subQuoteId = document.getElementById("subQuoteId11").value;
 	var customerId = document.getElementById("customerId").value;
 	var agencyId = document.getElementById("agencyId").value;
 	var ownerId = document.getElementById("ownerId").value;
 	var userId = document.getElementById("userId").value;
 	var subQuoteProductId = document.getElementById("subQuoteProductId1").value;
 	var prodId = document.getElementById("prodId").value;
 	var ProductVerId = document.getElementById("ProductVerId").value;
 	var GroupId = document.getElementById("GroupId").value;
 	var GroupVerId = document.getElementById("GroupVerId").value;
 	var productStatus = document.getElementById("productStatus").value;
 	var subQuoteVerId = document.getElementById("subQuoteVerId").value;
 	var isOptionsDisabled = document.getElementById("IsOptionDisabled").value;

 	var pars = 'changePlan=yes&answer(Object::Risk::Teritory)=0&answer(parentQuoteId)='+parentQuoteId+'&answer(Object::Quote::ProductId)='+prodId+'&answer(Object::Quote::ProductVerId)='+ProductVerId+
 	'&answer(parentQuoteVerId)='+parentQuoteVerId+'&answer(Object::Agency::AgencyId)='+agencyId+
 	'&answer(IsOptionDisabled)='+isOptionsDisabled+'&answer(QuoteId)='+subQuoteId+'&answer(subQuoteId)='+subQuoteId+
 	'&answer(Object::Customer::CustomerId)='+customerId+'&answer(Object::Agency::AgencyId)='+agencyId+
 	'&answer(ownerId)='+ownerId+'&answer(userId)='+userId+'&answer(Plan::PlanNumber)='+subQuoteId+
 	'&answer(Object::Quote::ProductId)='+subQuoteProductId+'&answer(Option::DefaultValue)=No&answer(ProductId)='+prodId+
 	'&answer(ProductVerId)='+ProductVerId+'&answer(prdGroupId)='+GroupId+'&answer(prdGroupVerId)='+GroupVerId+
 	'&answer(productStatus)='+productStatus+'&answer(subQuoteVerId)='+subQuoteVerId+'&answer(customerId)='+customerId+
 	'&answer(Object::Plan::StateCode)=CO&answer(isUpdated)=Y&answer(Object::Quote::PrevSubQuoteVerId)='+subQuoteVerId;

 	var url = '../PlanChangeV2.do?'+pars;
 	autologout();
 	new Ajax.Request(url,
	 	{method: 'post',
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
			 forwardToLoginPageIfInvalidSession(transport.responseText);
			 enableTabs();
		 	},onSuccess: function(transport){
		 	document.getElementById("QuoteDiv").style.display = "block";
		 	document.getElementById("QuoteDiv").innerHTML= transport.responseText;
		 	}
		}
	);

 }
 //for avoiding multiple hits.
 var activeTabName = "";
 function loadGeneralQuestionsTab(GeneralQuestionId){


 	if(activeTabName != "generalQuestionsTab"){
 	activateQuoteTabs(GeneralQuestionId);
 	var locationListArraySize = 0;

 	var parentQuoteId    = document.getElementById("parentQuoteId").value;

	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

	var subQuoteId    = document.getElementById("subQuoteId11").value;

	var productVerId  = document.getElementById("ProductVerId").value;

	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
	}else{
		appEnabled = "N";
	}
	var agencyId = document.getElementById("agencyId").value;

	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	var FamilyId = document.getElementById("ProductFamilyId").value;
 	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("customerId").value;


 	var pars = 'answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=GENERAL QUESTION&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveGeneralQuestionApp3.0.go?&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(riskTerritory)=0&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QuoteAdditionalInsured&answer(objectType)=QuoteAdditionalInsured&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+
 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId;

 				var url = '../DisplayGeneralQuestionApplication3.0.do?'+pars;

    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
     autologout();
     initGeneralQuestionsTab();
	 new Ajax.Request(url,
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 		 forwardToLoginPageIfInvalidSession(transport.responseText);
		 		 enableTabs();
		 		 document.getElementById("QuoteDiv").style.display = "block";
		 	},onSuccess: function(transport){
		 	document.getElementById("QuoteDiv").innerHTML = "";


		 	document.getElementById("QuoteDiv").innerHTML= transport.responseText;
		 	}
		}
	);
}
 	activeTabName = "generalQuestionsTab";

 }

 function loadRatingDetailTab(ratingDetailId){
 activateQuoteTabs(ratingDetailId);
 	var locationListArraySize = 0;

 	var parentQuoteId    = document.getElementById("parentQuoteId").value;

	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

	var subQuoteId    = document.getElementById("subQuoteId11").value;

	var productVerId  = document.getElementById("ProductVerId").value;

	var agencyId = document.getElementById("agencyId").value;

	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	var FamilyId = document.getElementById("ProductFamilyId").value;
 	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("customerId").value;
 	var paretQuoteStatus = document.getElementById("paretQuoteStatus").value;
	

 	var pars = 'requestType=EmployeeElection&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=GENERAL QUESTION&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveGeneralQuestionApp3.0.go?&answer(riskTerritory)=0&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+subQuoteId+
 				'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId;

 	var url = '../GetRatingDetailForm3.1.do?'+pars;
 	var pars2 = 'answer(activeTabName)=Rating_Detail_Tab';
 	 autologout();
	 new Ajax.Request(url,
	 	{method: 'post',
			asynchronous:true,parameters:pars2,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 		 forwardToLoginPageIfInvalidSession(transport.responseText);
		 		 enableTabs();
		 	},onSuccess: function(transport){
		 	if(paretQuoteStatus == 'In Progress' || paretQuoteStatus == 'Referred' ){
		 		var data1 = '<form action="/ModifyEmployeeElections3.0.do" method="post" onsubmit="return validateRetroDate();"><table id ="rating" width="100%" align="left" cellspacing="4" cellpadding="4" border="0"><tr><td>'+transport.responseText+'</td></tr><tr><td align="center" colspan="8"> <input type="submit" value="save" name="answer(submit)"  style="sbttn"/> </td></tr> <input type="hidden" name="answer(QuoteId)" value='+subQuoteId+' />  <input type="hidden" name="answer(parentQuoteId)" value='+parentQuoteId+' />  <input type="hidden" name="answer(Object::Customer::CustomerId)" value='+custId+' /> <input type="hidden" name="answer(subQuoteId)" value='+subQuoteId+' /> <input type="hidden" name="requestType" value="EmployeeElection" /> <input type="hidden" name="answer(activeTabName)" value="Rating_Detail_Tab" />   </table></form>'
			}else{
				var data1 = '<form action="/ModifyEmployeeElections3.0.do" method="post" onsubmit="return validateRetroDate();"><table id ="rating"  width="100%" align="left" cellspacing="4" cellpadding="4" border="0"><tr><td>'+transport.responseText+'</td></tr> <input type="hidden" name="answer(QuoteId)" value='+subQuoteId+' />  <input type="hidden" name="answer(parentQuoteId)" value='+parentQuoteId+' />  <input type="hidden" name="answer(Object::Customer::CustomerId)" value='+custId+' /> <input type="hidden" name="answer(subQuoteId)" value='+subQuoteId+' /> <input type="hidden" name="requestType" value="EmployeeElection" /> <input type="hidden" name="answer(activeTabName)" value="Rating_Detail_Tab" />   </table></form>'
			}
			document.getElementById("QuoteDiv").style.display = "block";
		 	document.getElementById("QuoteDiv").innerHTML= data1;
		 	}
		}
	);

 }

 function loadScheduleofFormsTab(scheduleofFormsId){
    activateQuoteTabs(scheduleofFormsId);

    var subQuoteId    = document.getElementById("subQuoteId11").value;
    var productVerId  = document.getElementById("ProductVerId").value;
    var planState = document.getElementById("planState").value;
    var prodId = document.getElementById("prodId").value;
    var parentQuoteId = document.getElementById("parentQuoteId").value;
    var subQuoteVerId = document.getElementById("subQuoteVerId").value;

    var ownerId = document.getElementById("ownerId").value;
    var custId = document.getElementById("customerId").value;
    var GroupId = document.getElementById("GroupId").value;
    var GroupVerId = document.getElementById("GroupVerId").value;
    var productStatus = document.getElementById("productStatus").value;
    var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
    var paretQuoteStatus = document.getElementById("paretQuoteStatus").value;
    var userId = document.getElementById("userId").value;
    var Quote = document.getElementById("Quote").value;
    var QuoteManagement = document.getElementById("QuoteManagement").value;
    var QuoteId = document.getElementById("QuoteId").value;

   var pars ='requestType=&answer(DocumentType)=ISSUANCE&answer(Object::Quote::ProductId)='+prodId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(subQuoteId)='+subQuoteId+'&answer(subQuoteVerId)='+subQuoteVerId+'&answer(OwnerId)='+ownerId+'&answer(ProductVerId)='+productVerId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(customerId)='+custId+'&answer(ProductId)='+prodId+'&answer(prdGroupId)='+GroupId+'&answer(prdGroupVerId)='+GroupVerId+'&answer(productStatus)='+productStatus+'&answer(Object::Quote::QuoteVerId)='+parentQuoteVerId+'&answer(State)='+planState+'&answer(isUpdated)='+"Y"+'&answer(Object::Activity::ActivityType)='+QuoteManagement+'&answer(Object::Activity::ObjectType)='+Quote+'&answer(Object::Activity::CreatedBy)='+userId+'&answer(Object::Quote::QuoteStatus)='+paretQuoteStatus+'&answer(Object::Activity::OwnerId)='+ownerId+'&answer(QuoteId)='+QuoteId;
   var url = '../GetDocumentListCL_in_ScheduleofFormsTab.do?'+pars;
 	var pars2 = 'answer(activeTabName)=Schedule_of_Forms_Tab';
 	 autologout();
	 new Ajax.Request(url,
	 	{method: 'post',
			asynchronous:true,parameters:pars2,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 		forwardToLoginPageIfInvalidSession(transport.responseText);
		 		 enableTabs();
		 	},onSuccess: function(transport){

			document.getElementById("QuoteDiv").style.display = "block";
		 	document.getElementById("QuoteDiv").innerHTML= transport.responseText;
		 	}
		}
	);

 }


 function loadDocumentTab(DocumentTabId,attachementDataSourceURL,notesDataSourceURL,emailDataSourceURL){

var quoteId=document.getElementById("parentQuoteId").value;
var ownerId = document.getElementById("ownerId").value;
var quoteVerId=document.getElementById("parentQuoteVerId").value;

 activateQuoteTabs(DocumentTabId);

 var doumentDivInnerHTML=document.getElementById("DocumentDiv").innerHTML;
 document.getElementById("QuoteDiv").innerHTML = doumentDivInnerHTML;
 refereshQuoteAttachmentList(quoteId,quoteVerId,ownerId,"QUOTE",attachementDataSourceURL);
 refereshQuoteNotesList(quoteId,ownerId,"QUOTE",notesDataSourceURL);
 refereshQuoteEmailList(quoteId,ownerId,"QUOTE",emailDataSourceURL);
  document.getElementById("QuoteDiv").style.display = "block";
    enableTabs();

 }

 function updatePostIssuanceStatus(initialType,updatedType) {
		var hiddsubjReqProcess = document.getElementById(initialType).value;
		var subjectivityRequiredProcess = document.getElementById(updatedType).value;

		if(hiddsubjReqProcess =='Post Bind'){
				document.getElementById('PostBindPostIssuance').style.display='block';
				if(subjectivityRequiredProcess =='Pre Bind'){
					document.getElementById('PostBindPostIssuance').style.display='none';
				}
			}
		if(hiddsubjReqProcess =='Pre Bind'){
			document.getElementById('PreBindPostIssuance').style.display='none';
			if(subjectivityRequiredProcess =='Post Bind'){
				document.getElementById('PreBindPostIssuance').style.display='block';
				}
			}

 }


 function loadSubjectivityTab(subjectivityTab){

 activateQuoteTabs(subjectivityTab);
 document.getElementById("QuoteDiv").innerHTML = document.getElementById("SubjectivityDiv").innerHTML;

 }

 function loadUWWorkSheetTab(UWWorkSheetTabId){
 	activateQuoteTabs(UWWorkSheetTabId);
 	var subQuoteId1 = document.getElementById("subQuoteId11").value;
    var subQuoteVerId1 = document.getElementById("subQuoteVerId").value;
    var riskTerritory1 = document.getElementById("riskTerritory1").value;
    var customerId1 = document.getElementById("customerId").value;
    var agencyId1 = document.getElementById("agencyId").value;
    var prodId1 = document.getElementById("prodId").value;
    var productVerId1 = document.getElementById("ProductVerId").value;
    var GroupId1 = document.getElementById("GroupId").value
    var ownerId1 = document.getElementById("ownerId").value;
    var GroupVerId1 = document.getElementById("GroupVerId").value;
    var parentQuoteId1 = document.getElementById("parentQuoteId").value;
    var productStatus1 = document.getElementById("productStatus").value;
    var CustomerState1 = document.getElementById("CustomerState").value;
    var ProductFamilyId1 = document.getElementById("ProductFamilyId").value;
    var parentQuoteVerId1 = document.getElementById("parentQuoteVerId").value;
 	var quoteType = document.getElementById("QuoteType1").value;
 	var quoteNumber = document.getElementById("QuoteNumber1").value;
 	var state = document.getElementById("State1").value;

 	var clearnceStatus = "";
 	if(document.getElementById("clearnceStatus1") != undefined){
 		clearnceStatus = document.getElementById("clearnceStatus1").value;
 	}

 	var pars = 'answer(productId)='+prodId1+'&answer(productVerId)='+productVerId1+'&answer(Object::Quote::QuoteType)='+quoteType+
 				'&answer(Object::Customer::CustomerId)='+customerId1+'&answer(QuoteId)='+subQuoteId1+'&answer(ownerId)='+ownerId1+
 				'&answer(parentQuoteId)='+parentQuoteId1+'&answer(subQuoteId)='+subQuoteId1+'&answer(Object::Agency::AgencyId)='+agencyId1+
 				'&answer(prevSubQuoteVerId)='+subQuoteVerId1+'&answer(modQuoteNumber)='+quoteNumber+'&answer(State)='+state+'&answer(Object::Clearance::NoRecords)='+clearnceStatus;
 	var url = "../GetUWWorkSheetActionEIL.do?";
 	autologout();
 	new Ajax.Request(url,
	 	{method: 'post',
			asynchronous:true,parameters:pars,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 		 forwardToLoginPageIfInvalidSession(transport.responseText);
		 		 enableTabs();
		 	},onSuccess: function(transport){
			document.getElementById("QuoteDiv").style.display = "block";
		 	document.getElementById("QuoteDiv").innerHTML= transport.responseText;
		 	}
		}
	);


 }
 var deletebuttonSet = false;
 function loadQuoteLocationList1(){

 	    YAHOO.example.XHR_Text = function() {

	 var formatUrl = function(elCell, oRecord, oColumn, sData) {
	 			var locName = "'"+oRecord.getData("LocationName")+"'";
	 			var locString = new String(locName);
	 			locString = locString.replace(/ /g,"%20");
	 			locString = locString.replace(/&#39;/g,"___");
	 			var onclickscript = "getQuoteTanksWithLocation("+oRecord.getData("LocationId")+","+locString+")";
             	elCell.innerHTML = "<a id='' onclick="+onclickscript+" rel='' target=''  href ='javascript:void(0);'>"+sData+"</a>";

        };
         var formatCheck = function(elCell, oRecord, oColumn, sData) {
	   		var ustCount = oRecord.getData("UST");
	   		var astCount = oRecord.getData("AST");
	   		var locId = ""+oRecord.getData("LocationId");
	   		var deleteButtonNeed = false;

	   		if(ustCount == "0" && astCount =="0"){
	   			deleteButtonNeed = true;
	   			deletebuttonSet = true;
		   		var html = "<input name='answer(Object::Quote::Location::RiskId)' value='"+locId+"'  type='checkbox'>"
		   		elCell.innerHTML = html;

	   		}else{
	   		var html1 = "<div style='display:none'> <input name='answer(Object::Quote::Location::RiskId)' value='"+locId+"'  type='checkbox'></div>"
	   			elCell.innerHTML =html1;
	   		}
	   		if(deleteButtonNeed == true){
	   			if(document.getElementById("deleteLocButton") != "undefined" && document.getElementById("deleteLocButton") != null){
		   		document.getElementById("deleteLocButton").style.display = "block";
		   		}
	   		}else{
	   			if(deletebuttonSet == false){
	   				if(document.getElementById("deleteLocButton") != "undefined" && document.getElementById("deleteLocButton") != null){
		   				document.getElementById("deleteLocButton").style.display = "none";
		   			}
		   		}
	   		}
	   }
	   var moreColumnDefs = [

            {key:"Number", resizable:"true",width:40,sortable:true},
            {key:"Location Name", resizable:"true", formatter:formatUrl,width:100,sortable:true},
            {key:"Address Line 1",  resizable:"true",width:80},
            {key:"Address Line 2", resizable:"true",width:80},
            {key:"City", resizable:"true",width:90},
            {key:"State",  resizable:"true",width:70},
            {key:"Zip",  resizable:"true",width:70},
            {key:"UST",  resizable:"true",width:40,sortable:true},
            {key:"AST",  resizable:"true",width:40,sortable:true},
            {key:"Delete",formatter:formatCheck,resizable:"true",width:40,sortable:true}
        ];

       	var subQuoteId1 = document.getElementById("subQuoteId11").value;
       	var subQuoteVerId1 = document.getElementById("subQuoteVerId").value;
       	var riskTerritory1 = "";
       	if((document.getElementById("riskTerritory1") != null) && (document.getElementById("riskTerritory1") != undefined))
	      	riskTerritory1 = document.getElementById("riskTerritory1").value;
      	var customerId1 = document.getElementById("customerId").value;
      	var agencyId1 = document.getElementById("agencyId").value;
      	var prodId1 = document.getElementById("prodId").value;
      	var productVerId1 = document.getElementById("ProductVerId").value;
      	var GroupId1 = document.getElementById("GroupId").value
      	var ownerId1 = document.getElementById("ownerId").value;
      	var GroupVerId1 = "";
      	if((document.getElementById("GroupVerId") != null) && (document.getElementById("GroupVerId") != undefined))
      		GroupVerId1 = document.getElementById("GroupVerId").value;
      	var parentQuoteId1 = document.getElementById("parentQuoteId").value;
      	var productStatus1 = document.getElementById("productStatus").value;
      	var CustomerState1 = document.getElementById("CustomerState").value;
      	var ProductFamilyId1 = "";
      	if((document.getElementById("ProductFamilyId") != null) && (document.getElementById("ProductFamilyId") != undefined))
			ProductFamilyId1 = document.getElementById("ProductFamilyId").value;
      	var parentQuoteVerId1 = document.getElementById("parentQuoteVerId").value;
      	var parameters="answer(IsApplicationDisabled)=Y&customerId="+customerId1+
        "&answer(Object::UserDetail::ownerId)="+ownerId1+
        "&answer(Object::Customer::CustomerId)="+customerId1+
        "&answer(Object::Agency::AgencyId)="+agencyId1+
        "&answer(objectId)="+prodId1+
        "&answer(objectVerId)="+productVerId1+
        "&answer(objectName)=PRODUCT&answer(prdGroupId)="+GroupId1+
        "&answer(prdGroupVerId)="+GroupVerId1+
        "&answer(productStatus)="+productStatus1+
        "&answer(teritory)=&answer(riskTerritory)="+riskTerritory1+
        "&answer(territoryName)=&answer(zone)=&answer(state)=&answer(showOnetTab)=Y&tabNo=0&answer(Object::Customer::State)="+CustomerState1+
        "&answer(Object::Risk::ComProperty::CustomerId)="+customerId1+
        "&answer(parentQuoteId)="+parentQuoteId1+
        "&parentQuoteId="+parentQuoteId1+
        "&answer(subQuoteId)="+subQuoteId1+
        "&answer(QuoteId)="+subQuoteId1+
        "&answer(Object::Customer::CustomerId)="+customerId1+"&answer(Object::Agency::AgencyId)="+agencyId1+
        "&answer(FamilyId)="+ProductFamilyId1+"&answer(parentQuoteVerId)="+parentQuoteVerId1+
        "&answer(Object::Quote::PrevSubQuoteVerId)="+subQuoteVerId1;
      autologout();
       var anotherDataSource = new YAHOO.util.DataSource("../getQuoteLocationListUI3.do");
       anotherDataSource.connMethodPost =true;
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Number","Location Name","Address Line 1","Address Line 2","City","State","Zip","UST","AST","LocationId","LocationName","Delete"]
        };


        anotherDataSource.subscribe( 'responseEvent',  function(oArgs) {
            // the remote response is in oArgs.response,
            // the raw text is oArgs.response.responseText
            var rawResponse = oArgs.response.responseText;
            forwardToLoginPageIfInvalidSession(rawResponse);

        });

        // Configuration for Pagination
        var myConfigs = {
        		initialRequest:parameters,
        		generateRequest:parameters,
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


var isSpecificValidationNeeded = true;

	function doSpecificValidation(frm){
	if(frm.name == "Location"){
		if(frm.Use_of_Facility.value==""){

  			alert("Please select Use Of Facility");
			return false;

  		}

		if(!frm.Owner_Type[0].checked && !frm.Owner_Type[1].checked){
			alert('Please select Owned or Leased');
			return false;
		}

	}
	if(frm.name == "ManuscriptEndorsementSubApplication") {

		if((document.getElementById('Description') != null) && (document.getElementById('Description') != undefined)) {
			if(document.getElementById('Description').value == '') {
				alert('Enter the Description');
				return false;
			}
		}
		if((document.getElementById('Content') != null) && (document.getElementById('Content') != undefined)) {
			if(document.getElementById('Content').value == '') {
				alert('Enter the Content');
				return false;
			}
		}
	}
			if(frm.name!="Location"){
			if(doValidateTank(frm)){

				return true;
			}else{

				return false;
			}
		}


		return true;
	}

	function conformRemoveAction(frm,thisBttn,actionName){
   var removeAction = window.confirm("Are you sure you want to continue?");
  if(removeAction){
  	if(removeObject!=null && removeObject!=undefined){
  		removeObject=true;
  		//alert(removeObject);
  		Ajaxsubmit(frm,'Remove',actionName);

  		//YAHOO.example.container.dialog2.cancel();
  	}

  }

}

	function initGeneralQuestionsTab(){
		var SubTabApplication2 = new YAHOO.widget.TabView('SubTabApplication2');
		var tabView = new YAHOO.widget.TabView('Application');
	}



 	function showFillInFormPopUp(appId,appVerId,quoteDocId,docId,docVerId,title,editionDate,docDivId){
 	initDocumentDialog();//to init Documenty pop-up
 	var subQuoteId1 = document.getElementById("subQuoteId11").value;
    var subQuoteVerId1 = document.getElementById("subQuoteVerId").value;
   // var riskTerritory1 = document.getElementById("riskTerritory1").value;
    var customerId1 = document.getElementById("customerId").value;
    var agencyId1 = document.getElementById("agencyId").value;
    var prodId1 = document.getElementById("prodId").value;
    var productVerId1 = document.getElementById("ProductVerId").value;
   // var GroupId1 = document.getElementById("GroupId").value
    var ownerId1 = document.getElementById("ownerId").value;
    // var GroupVerId1 = document.getElementById("GroupVerId").value;
    var parentQuoteId1 = document.getElementById("parentQuoteId").value;
   // var productStatus1 = document.getElementById("productStatus").value;
   // var CustomerState1 = document.getElementById("CustomerState").value;
   // var ProductFamilyId1 = document.getElementById("ProductFamilyId").value;
   // var parentQuoteVerId1 = document.getElementById("parentQuoteVerId").value;
 	var quoteType = document.getElementById("QuoteType1").value;
 	var quoteNumber = document.getElementById("QuoteNumber1").value;
 	var state = document.getElementById("State1").value;

 	var actionName = escape("/manuscriptAction.go?");
 	//var actionName = escape("/saveQuoteDocumentApplicationAction3.0.go?");
 	var clearnceStatus = "";
 	if(document.getElementById("clearnceStatus1") != undefined){
 		clearnceStatus = document.getElementById("clearnceStatus1").value;
 	}


 	title = encodeURIComponent(title);
	editionDate = editionDate+" "+title
 	var pars = 'answer(productId)='+prodId1+'&answer(productVerId)='+productVerId1+'&answer(Object::Quote::QuoteType)='+quoteType+'&answer(applicationId)='+appId+'&answer(applicationVerId)='+appVerId+
 				'&answer(Object::Customer::CustomerId)='+customerId1+'&answer(QuoteId)='+subQuoteId1+'&answer(ownerId)='+ownerId1+'&answer(Object::Document::Manuscript::Endorsement::QuoteDocId)='+quoteDocId+
 				'&answer(Object::Application::ApplicationType)=DOCUMENT_APPLICATION&answer(parentQuoteId)='+parentQuoteId1+'&answer(subQuoteId)='+subQuoteId1+
 				'&answer(actionName)='+actionName+'&answer(Object::Agency::AgencyId)='+agencyId1+'&answer(Object::Document::Manuscript::Endorsement::SubQuoteVerId)='+subQuoteVerId1+
 				'&answer(documentType)=QUOTE_DOCUMENT&answer(Object::Document::Manuscript::Endorsement::DocumentId)='+docId+'&answer(Object::Document::Manuscript::Endorsement::DocumentVerId)='+docVerId+
 				'&answer(DisplayValue_Object::Document::DocumentHeading)='+editionDate+'&answer(DisplayValue_Object::Document::EditionDate)='+editionDate+'&answer(DisplayValue_Object::Document::Title)='+title+'&answer(prevSubQuoteVerId)='+subQuoteVerId1+'&answer(modQuoteNumber)='+quoteNumber+'&answer(State)='+state+'&answer(Object::Clearance::NoRecords)='+clearnceStatus+title+'&answer(Object::Doc::NewDocNameId)='+docDivId;
 	var url = "../GetDocumentApplication.do?";
 	autologout();
 	new Ajax.Request(url,
	 	{method: 'post',
			asynchronous:true,parameters:pars,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				forwardToLoginPageIfInvalidSession(transport.responseText);
				renderEditor();
		 	},onSuccess: function(transport){
			document.getElementById("DocumentPopUpHeading").innerHTML = ""+decodeURIComponent(title);
			document.getElementById("DocumentPopUp").style.display = "block";
			document.getElementById("DocumentPopUpBody").innerHTML = transport.responseText;
			if(document.getElementById("submitButtonNew")!=null && document.getElementById("submitButtonNew")!='undefined'){
			document.getElementById("submitButtonNew").className="covsmallbutton";
			}
			if(document.getElementById("CancelRisk1")!=null && document.getElementById("CancelRisk1")!='undefined'){
			document.getElementById("CancelRisk1").className="covsmallbutton";
			}
			YAHOO.example.container.documentDialog.show();
			YAHOO.util.Event.on('closeIcon2', 'click', function(e) {
			 	YAHOO.example.container.documentDialog.cancel();
			 	document.getElementById("DocumentPopUp").style.display = "none";
		    })

		  YAHOO.util.Event.on('CancelRisk1', 'click', function(e) {

		 	YAHOO.example.container.documentDialog.cancel();
		 	document.getElementById("DocumentPopUp").style.display = "none";

		 })
		  YAHOO.util.Event.on('submitButtonNew', 'click', function(e) {

			  var validatedToSubmit =  "Y";


			  if((document.getElementById('Title') != null) && (document.getElementById('Title') != undefined)) {
					if(document.getElementById('Title').value == '') {
						validatedToSubmit =  "N";
					}
			  }
			  if((document.getElementById('Description') != null) && (document.getElementById('Description') != undefined)) {
					if(document.getElementById('Description').value == '') {
						validatedToSubmit =  "N";
					}
			  }
			  if((document.getElementById('Content') != null) && (document.getElementById('Content') != undefined)) {
					if(document.getElementById('Content').value == '') {
						validatedToSubmit =  "N";
					}
			  }
			  if(validatedToSubmit == "Y") {
				  YAHOO.example.container.documentDialog.cancel();
				  document.getElementById("DocumentPopUp").style.display = "none";
			  }

		 })

		 	}
		}
	);

 	}
	
	function showFillinWithoutRichEditor(appId,appVerId,quoteDocId,docId,docVerId,title,editionDate,docDivId){
 	initDocumentDialog();//to init Documenty pop-up
 	var subQuoteId1 = document.getElementById("subQuoteId11").value;
    var subQuoteVerId1 = document.getElementById("subQuoteVerId").value;
   // var riskTerritory1 = document.getElementById("riskTerritory1").value;
    var customerId1 = document.getElementById("customerId").value;
    var agencyId1 = document.getElementById("agencyId").value;
    var prodId1 = document.getElementById("prodId").value;
    var productVerId1 = document.getElementById("ProductVerId").value;
   // var GroupId1 = document.getElementById("GroupId").value
    var ownerId1 = document.getElementById("ownerId").value;
    // var GroupVerId1 = document.getElementById("GroupVerId").value;
    var parentQuoteId1 = document.getElementById("parentQuoteId").value;
   // var productStatus1 = document.getElementById("productStatus").value;
   // var CustomerState1 = document.getElementById("CustomerState").value;
   // var ProductFamilyId1 = document.getElementById("ProductFamilyId").value;
   // var parentQuoteVerId1 = document.getElementById("parentQuoteVerId").value;
 	var quoteType = document.getElementById("QuoteType1").value;
 	var quoteNumber = document.getElementById("QuoteNumber1").value;
 	var state = document.getElementById("State1").value;

 	var actionName = escape("/manuscriptActionV2.go?");
 	//var actionName = escape("/saveQuoteDocumentApplicationAction3.0.go?");
 	var clearnceStatus = "";
 	if(document.getElementById("clearnceStatus1") != undefined){
 		clearnceStatus = document.getElementById("clearnceStatus1").value;
 	}

 	title = encodeURIComponent(title);
	editionDate = editionDate+" "+title
 	var pars = 'answer(productId)='+prodId1+'&answer(productVerId)='+productVerId1+'&answer(Object::Quote::QuoteType)='+quoteType+'&answer(applicationId)='+appId+'&answer(applicationVerId)='+appVerId+
 				'&answer(Object::Customer::CustomerId)='+customerId1+'&answer(QuoteId)='+subQuoteId1+'&answer(ownerId)='+ownerId1+'&answer(Object::Document::Manuscript::Endorsement::QuoteDocId)='+quoteDocId+
 				'&answer(Object::Application::ApplicationType)=DOCUMENT_APPLICATION&answer(parentQuoteId)='+parentQuoteId1+'&answer(subQuoteId)='+subQuoteId1+
 				'&answer(actionName)='+actionName+'&answer(Object::Agency::AgencyId)='+agencyId1+'&answer(Object::Document::Manuscript::Endorsement::SubQuoteVerId)='+subQuoteVerId1+
 				'&answer(documentType)=QUOTE_DOCUMENT&answer(Object::Document::Manuscript::Endorsement::DocumentId)='+docId+'&answer(Object::Document::Manuscript::Endorsement::DocumentVerId)='+docVerId+
 				'&answer(DisplayValue_Object::Document::DocumentHeading)='+editionDate+'&answer(DisplayValue_Object::Document::EditionDate)='+editionDate+'&answer(DisplayValue_Object::Document::Title)='+title+'&answer(prevSubQuoteVerId)='+subQuoteVerId1+'&answer(modQuoteNumber)='+quoteNumber+'&answer(State)='+state+'&answer(Object::Clearance::NoRecords)='+clearnceStatus+title+'&answer(Object::Doc::NewDocNameId)='+docDivId;
 	var url = "../GetDocumentApplication.do?";
 	autologout();
	 	new Ajax.Request(url,
		 	{method: 'post',
				asynchronous:true,parameters:pars,
				onFailure:function(){},
				onException:function(){},
				onComplete:function(transport){
					forwardToLoginPageIfInvalidSession(transport.responseText);
			 	},onSuccess: function(transport){
				document.getElementById("DocumentPopUpHeading").innerHTML = ""+decodeURIComponent(title);
				document.getElementById("DocumentPopUp").style.display = "block";
				document.getElementById("DocumentPopUpBody").innerHTML = transport.responseText;
				if(document.getElementById("submitButtonNew")!=null && document.getElementById("submitButtonNew")!='undefined'){
				document.getElementById("submitButtonNew").className="covsmallbutton";
				}
				if(document.getElementById("CancelRisk1")!=null && document.getElementById("CancelRisk1")!='undefined'){
				document.getElementById("CancelRisk1").className="covsmallbutton";
				}
				YAHOO.example.container.documentDialog.show();
				YAHOO.util.Event.on('closeIcon2', 'click', function(e) {
				 	YAHOO.example.container.documentDialog.cancel();
				 	document.getElementById("DocumentPopUp").style.display = "none";
			    })
	
			  YAHOO.util.Event.on('CancelRisk1', 'click', function(e) {
	
			 	YAHOO.example.container.documentDialog.cancel();
			 	document.getElementById("DocumentPopUp").style.display = "none"; 
	
			 })
			  YAHOO.util.Event.on('submitButtonNew', 'click', function(e) {
	
				  var validatedToSubmit =  "Y";
	
	
				  if((document.getElementById('Title') != null) && (document.getElementById('Title') != undefined)) {
						if(document.getElementById('Title').value == '') {
							validatedToSubmit =  "N";
						}
				  }
				  if((document.getElementById('Description') != null) && (document.getElementById('Description') != undefined)) {
						if(document.getElementById('Description').value == '') {
							validatedToSubmit =  "N";
						}
				  }
				  if((document.getElementById('Content') != null) && (document.getElementById('Content') != undefined)) {
						if(document.getElementById('Content').value == '') {
							validatedToSubmit =  "N";
						}
				  }
				  if(validatedToSubmit == "Y") {
					  YAHOO.example.container.documentDialog.cancel();
					  document.getElementById("DocumentPopUp").style.display = "none";
				  }
	
			 })
	
			 	}
			}
		);

 	}



 	function showFillInFormPopUpProposal(){
 		var frm=document.ProposalAddionalWording;

 		var url=escape("../saveQuoteDocumentApplicationAction3.0.do");



 		new Ajax.Request(url, {method: 'post',parameters:$(frm).serialize(this),
 	onLoading: function() {

	},onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);
 	},onSuccess: function(transport){
 	}});

 	}

 	var documentDialog =true;
 	function initDocumentDialog(){
	YAHOO.example.container.documentDialog = new YAHOO.widget.Dialog("DocumentPopUp",
							{ width : "100em",
							  fixedcenter : true,
							  visible : false,
							  close:false,
							  modal:true,
							  constraintoviewport : true,
							  buttons : []
							});
	// Render the Dialog
	//if(documentDialog==true){
		YAHOO.example.container.documentDialog.render();
		documentDialog =false;
	//}
}

function validateRetroDate(){
var daysInMonth = DaysArray(12);
var rowsCount = document.getElementById("rating").rows.length;
for(j=0;j<rowsCount-3;j++){
var retrodatekey = "Object::Plan::RequestedRetroDate::"+j;
var id449    = document.getElementById(retrodatekey);
		if(id449 !=null && id449 !=undefined){
			var retroDate = id449.value;
			for(i=0;i<retroDate.length;i++){
				var vardate = retroDate;
				if(retroDate!=""){
				var elem = id449;
				}
				if (vardate=="")
				{
					alert("Please enter the Retro Date");
					elem.focus();                                          
					elem.style.background='#FFCC33';
					return false;
				}
				if(vardate.length != 10){
					alert("Please enter date in 'MM/DD/YYYY' format");
					elem.focus();
					elem.style.background='#FFCC33';
					return false;
				}
				var dmonth = vardate.substring(0, 2);
				var dday = vardate.substring(3, 5);
				var dyear = vardate.substring(6, 10);

				if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || (dmonth==2 && dday>daysInFebruary(dyear)) || dday > daysInMonth[dmonth] || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
				{
					alert("Please enter date in 'MM/DD/YYYY' format");
					elem.focus();
					elem.style.background='#FFCC33';
					return false;
				}
				if(dyear <= 0) {
					alert("Please enter valid year");
					elem.focus();
					elem.style.background='#FFCC33';
					return false;
				}
			}

			if(retroDate.length == 0){
			var vardate = retroDate;
				var elem = id449;
				if (vardate=="")
				{
					alert("Please enter the Retro Date");
					elem.focus();
					elem.style.background='#FFCC33';
					return false;
				}
				if(vardate.length != 10){
					alert("Please enter date in 'MM/DD/YYYY' format");
					elem.focus();
					elem.style.background='#FFCC33';
					return false;
				}
				var dmonth = vardate.substring(0, 2);
				var dday = vardate.substring(3, 5);
				var dyear = vardate.substring(6, 10);

				if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || (dmonth==2 && dday>daysInFebruary(dyear)) || dday > daysInMonth[dmonth] || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
				{
					alert("Please enter date in 'MM/DD/YYYY' format");
					elem.focus();
					elem.style.background='#FFCC33';
					return false;
				}
				if(dyear <= 0) {
					alert("Please enter valid year");
					elem.focus();
					elem.style.background='#FFCC33';
					return false;
				}
			}
		}
	var expiryDateKey = "Object::Plan::ExpirationDate::"+j;
	var id447    = document.getElementById(expiryDateKey);
			if(id447 !=null && id447 !=undefined){
				var anniversaryDate = id447.value;
				for(i=0;i<anniversaryDate.length;i++){
					
					var vardate = anniversaryDate;
					var elem1 = id447;
					
					if (vardate=="")
					{
						alert("Please enter the Anniversary Date");
						elem1.focus();
						elem1.style.background='#FFCC33';
						return false;
					}
					if(vardate.length != 10){
						alert("Please enter date in 'MM/DD/YYYY' format");
						elem1.focus();
						elem1.style.background='#FFCC33';
						return false;
					}
					var dmonth = vardate.substring(0, 2);
					var dday = vardate.substring(3, 5);
					var dyear = vardate.substring(6, 10);

					if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || (dmonth==2 && dday>daysInFebruary(dyear)) || dday > daysInMonth[dmonth] || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
					{
						alert("Please enter date in 'MM/DD/YYYY' format");
						elem1.focus();
						elem1.style.background='#FFCC33';
						return false;
					}

					if(dyear <= 0) {
						alert("Please enter valid year");
						elem1.focus();
						elem1.style.background='#FFCC33';
						return false;
					}
				}
				if(anniversaryDate.length == 0){
					var vardate = anniversaryDate;
					var elem1 =id447;
					if (vardate=="")
						{
							alert("Please enter the Anniversary Date");
							elem1.focus();
							elem1.style.background='#FFCC33';
							return false;
						}
						if(vardate.length != 10){
							alert("Please enter date in 'MM/DD/YYYY' format");
							elem1.focus();
							elem1.style.background='#FFCC33';
							return false;
						}
						var dmonth = vardate.substring(0, 2);
						var dday = vardate.substring(3, 5);
						var dyear = vardate.substring(6, 10);

						if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || (dmonth==2 && dday>daysInFebruary(dyear)) || dday > daysInMonth[dmonth] || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
						{
							alert("Please enter date in 'MM/DD/YYYY' format");
							elem1.focus();
							elem1.style.background='#FFCC33';
							return false;
						}
						if(dyear <= 0) {
							alert("Please enter valid year");
							elem1.focus();
							elem1.style.background='#FFCC33';
							return false;
						}

					}
			}
			var premiumKey = "Object::Tank::OverridedPremium::"+j;
			var id809    = document.getElementById(premiumKey);
			if(id809 !=null && id809 !=undefined){
			var overridedPremium = id809.value;
			var dollar = overridedPremium;
			var premium = overridedPremium;
			var elem2 = id809;
			if(overridedPremium.length == 0){
				alert("Please enter the Overrided Premium");
				elem2.focus();
				elem2.style.background='#FFCC33';
				return false;
			}else if(overridedPremium.length==1){
				dollar = overridedPremium.substring(0, 1);
				if(dollar!='$'){
					if(isNaN(dollar) || dollar==" "){
						alert("Please enter valid Premium");
						elem2.focus();
						elem2.style.background='#FFCC33';
						return false;
					}
				}else if(dollar=='$'){
					alert("Please enter Premium Amount");
					elem2.focus();
					elem2.style.background='#FFCC33';
					return false;
				}		
			}else if(overridedPremium.length>1){
				dollar = overridedPremium.substring(0, 1);
				if(dollar!='$'){
					if(isNaN(dollar)){
						alert("Please enter valid Premium");
						elem2.focus();
						elem2.style.background='#FFCC33';
						return false;
					}
				}
				premium = overridedPremium.substring(1, overridedPremium.length);
				if(isNaN(premium)){
				alert("Please enter valid Premium");
				elem2.focus();
				elem2.style.background='#FFCC33';
				return false;
				}			
			}
		}
	}
}
		function daysInFebruary (year){
	    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}
function DaysArray(n) {
	for (var i = 1; i <= n; i++) {
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) {this[i] = 29}
   }
   return this
}

	// Added for Email



YAHOO.namespace("example.container");
//Wrap our initialization code in an anonymous function
//to keep out of the global namespace:
var myEditor;
var flag=0;

(function(){
var init = function() {
  //create the TreeView instance:
  var tree = new YAHOO.widget.TreeView("Emailtreediv");
  //get a reusable reference to the root node:
  var root = tree.getRoot();
  //First, create a parent node
  var SentEmails = new YAHOO.widget.HTMLNode('<html><head></head><body><table><tr><td>&nbsp;&nbsp;</td><td><a href="javascript:void(0);" onclick=showSentEmailSubNodes("sentEmailSuccess"); ><img src="/Images/emailIcon.jpg" border="0" height="18" width="18"> <font color="blue"> Emails Sent</font></a></td><td><div id="sentEmailCount"> </div></td></tr></table>', root, false);
  //EmailList.labelStyle = "icon-prv";
  var composeEmail = new YAHOO.widget.HTMLNode('<div id="composeEmail" style="display: none; return: false;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:void(0);" onclick="sendEmailDetails();" title="Email" > Compose Email</a></div>', root , false);
  var ViewSentEmail = new YAHOO.widget.HTMLNode('<div id="sentEmailSuccess" style="display: none; return: false;"> </div>', root , false);
  tree.draw();
  var ObjectId = document.getElementById("objId").value;
	 var OwnerId = document.getElementById("ownerId").value;
	 var pars1='ObjectId='+ObjectId+'&OwnerId='+OwnerId;
	 var ajax = new Ajax.Updater({success: 'sentEmailCount'},'../email/GetSentEmailCount.jsp',{method: 'post', parameters:pars1, onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("sentEmailCount").innerHTML);}});

  }
 //Add an onDOMReady handler to build the tree when the document is ready
    YAHOO.util.Event.onDOMReady(init);

})();



function sendEmailDetails(){

var ownerId=document.getElementById('ownerId').value;
var objId=document.getElementById('parentQuoteId1').value;
var ObjectVerId=document.getElementById('parentQuoteVerId').value;
var objType=document.getElementById('ownerId').value;
var SubQuoteVerId=document.getElementById('subQuoteVerId').value;
var QuoteStatus=document.getElementById('paretQuoteStatus').value;
var EmailType=document.getElementById('EmailType').value;
var QuoteNumber=document.getElementById('QuoteNumber1').value;
var QuoteSubNumber=document.getElementById('QuoteSubNumber').value;
var PolicyNumber=document.getElementById('policyNumber').value;
var email=document.getElementById('email').value;
var roleName=document.getElementById('roleName').value;
var CustomerName=document.getElementById('CustomerName').value;


	var insName1 = CustomerName;
	insName1 = insName1.replace(/___/g,'"');
	var insNamedecripted = encodeURIComponent(insName1);

	EmailPopup('../PrefilledEmailAction.do?answer(pagename)=email&answer(Object::Activity::OwnerId)='+ownerId+
	'&answer(Object::Notification::Email::ObjectId)='+objId+'&answer(Object::Notification::Email::InsuredName)='+insNamedecripted+
	'&answer(Object::Notification::UserDetail::Email)='+email+'&answer(Object::Notification::UserDetail::RoleName)='+roleName+
	'&answer(Object::Notification::Email::ObjectVerId)='+ObjectVerId+
	'&answer(Object::Notification::Email::ObjectType)='+EmailType+
	'&answer(Object::Notification::Email::NotificationType)=EMAIL&answer(Object::UserDetail::ownerId)='+ownerId+
	'&answer(Object::Notification::Email::SubQuoteVerId)='+SubQuoteVerId+
	'&answer(Object::Notification::Email::ObjectStatus)='+QuoteStatus+
	'&answer(Object::Notification::Email::EmailType)=QUOTE&answer(Object::Notification::Email::QuoteStatus)='+QuoteStatus+
	'&answer(Object::Notification::Email::QuoteNumber)='+QuoteNumber+
	'&answer(Object::Notification::Email::QuoteSubNumber)='+QuoteSubNumber+
	'&answer(Object::Notification::Email::PolicyNumber)='+PolicyNumber,"Email");


	}

/**
 * validateLossHistoryDate function is used to validate the loss history date.
 * Fixed Bug# 12218.
 * Created by Rajeshkumar P on 09-November-2010
 */
var counter = 0;
var counter1 = 0;
var returnValue = true;
var k = 0;
var incrementor = 0;
var idArray = new Array();			//Array to store the index of Date textbox(es).
var idArrayOfAmount = new Array();	//Array to store the index of Amount textbox(es).
function validateLossHistory(type) {

	var j = 0;
	var idArrayofAmountCounter = 0;
	/**
	 * This block stores the index of the Date textbox(es) and Amount textbox(es) in the form in an array.
	 * It is executed only once, since it is repeated application.
	 */
	if(counter == 0 ) {

		for(var i = 0 ; i < document.LossHistory.elements.length ; i++ ) {

			var name =  document.LossHistory.elements[i].name;
			var id = document.LossHistory.elements[i].id;
			if(id == "Date") {

				idArray[j++] = i ;
			}
			if(id == "AMTPaidReserved") {

				idArrayOfAmount[idArrayofAmountCounter++] = i;
			}
		}
	}
	var valuesArray = new Array();
	var tempCounter = 0;
	var tempId = 0;
	/**
	 * This block is used to store the values of the loss history fields that is to be inserted.
	 */
	for(i = 0 ; i < document.LossHistory.elements.length ; i++ ) {

		var tempName = document.LossHistory.elements[i].name;
		//Name of the Checkbox used to delete the loss history.
		if(tempName != 'answer(ACTIVE__DMS_QUOTE_STORAGE_TANK_LOSS_HISTORY~ACTIVE@-1)') {
			if(tempName.match("@")) {
				var tempIdArray = tempName.split("@");
				if((tempIdArray[1] != null) && (tempIdArray[1] != undefined)) {
					tempId = tempIdArray[1].replace(")","");
				}
				if(tempId == -1) {
					valuesArray[tempCounter++] = document.getElementsByName(tempName)[0].value;
				}
			}
		}
	}
	//This if block is for Date validation.
	if(type == 'Date') {
		i = idArray[k++];
		var lossHistoryName = document.LossHistory.elements[i].name;
		var lossHistoryDateValue = document.getElementsByName(lossHistoryName)[0].value;
		var lossHistoryIdArray = lossHistoryName.split("@");
		var lossHistoryId = lossHistoryIdArray[1].replace(")","");

		//Validate the loss history data which is already inserted.
		if(lossHistoryId != -1 ) {
			returnValue = validatePrimaryData(lossHistoryDateValue,'yyyy-mm-dd','','','N','');
			if(returnValue == false) {
				k = 0;
				incrementor = 0;
				return false;
			}
		}
		//Validate the loss history data which is newly inserted.
		else {
			var flag = 0;
			/*
			 * Checks whether the new row is going to be inserted or not.
			 * If yes, it is validated.
			 */
			for(i = 0 ; i <  valuesArray.length ; i++ ) {
				if(valuesArray[i] != '') {
					flag = 1;
					break;
				}
			}
			if(flag) {
	 			flag = 0;
			 	returnValue = validatePrimaryData(lossHistoryDateValue,'yyyy-mm-dd','','','N','');
				if(returnValue == false) {
					k = 0;
					incrementor = 0;
					return false;
				}
			}
		}
		counter++;
		return true;
	}
	//This else if part is for Amount validation
	else if (type == 'Amount') {

		i = idArrayOfAmount[incrementor++];
		var lossHistoryName1 = document.LossHistory.elements[i].name;
		var lossHistoryAmountValue = document.getElementsByName(lossHistoryName1)[0].value;
		var lossHistoryIdArray1 = lossHistoryName1.split("@");
		var lossHistoryId1 = lossHistoryIdArray1[1].replace(")","");

		//Validate the loss history amount which is already inserted.
		if(lossHistoryId1 != -1 ) {
			returnValue = validatePrimaryData(lossHistoryAmountValue,'USCurrencyDecimal','','','N','');
			if(returnValue == false) {
				incrementor = 0;
				k =0;
				return false;
			}
		}
		//Validate the loss history data which is newly inserted.
		else {
			var flag = 0;
			/*
			 * Checks whether the new row is going to be inserted or not.
			 * If yes, it is validated.
			 */
			for(i = 0 ; i <  valuesArray.length ; i++ ) {
				if(valuesArray[i] != '') {
					flag = 1;
					break;
				}
			}
			if(flag) {
	 			flag = 0;
			 	returnValue = validatePrimaryData(lossHistoryDateValue,'USCurrencyDecimal','','','N','');
				if(returnValue == false) {
					incrementor = 0;
					k = 0;
					return false;
				}
			}
		}
		counter1++;
		return true;
	}
}
function recalculateQuote(){


		var vardate = document.getElementById("txtDate").value;

		var expiryDate = document.getElementById("ExpDate").value;

		var ddate = new Date(vardate);

		var expiryDate1 = new Date(expiryDate);

		if(!isDate(vardate)){
			alert("Invalid Effective Date")
			document.getElementById("txtDate").select();
			return false;
		}


		if(!isDate(expiryDate)){
			alert("Invalid Expiration Date")
			document.getElementById("ExpDate").select();
			return false;
		}
		if (vardate=="")
		{
			alert("Please enter the Effective Date");
			//frm.txtDate.focus();
			return false;
		}


		if (expiryDate=="")
		{
			alert("Please enter the Policy Expiration Date");
			//frm.ExpDate.focus();
			return false;
		}


		var dmonth = parseInt(vardate.substring(0, 2), 10);
		var dday = parseInt(vardate.substring(3, 5), 10);
		var dyear = parseInt(vardate.substring(6, 10), 10);

		var dmonthExpiryDate = parseInt(expiryDate.substring(0, 2), 10);
		var ddayExpiryDate = parseInt(expiryDate.substring(3, 5), 10);
		var dyearExpiryDate = parseInt(expiryDate.substring(6, 10), 10);

		if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
		{
			alert("Please enter Effective date in 'MM/DD/YYYY' format");
			document.getElementById("txtDate").select();
			return false;
		}


		if (isNaN(dmonthExpiryDate) || dmonthExpiryDate < 1 || dmonthExpiryDate > 12 || isNaN(ddayExpiryDate) || ddayExpiryDate < 1 || ddayExpiryDate > 31 || isNaN(dyearExpiryDate) || expiryDate.substring(2, 3)!="/" || expiryDate.substring(5, 6)!="/")
		{
			alert("Please enter Expiration date in 'MM/DD/YYYY' format");
			//frm.AnniversaryDate.select();
			return false;
		}

		var reqDate = new Date("01/01/2005");

		if (ddate < reqDate)
		{

			alert("Effective Date cannot be prior to Jan 1, 2005");
			document.getElementById("txtDate").select();
			//frm.txtDate.focus();
			return false;
		}


		if(expiryDate1 < ddate  ){
			alert("Expiration Date is less than Effective date");
			document.getElementById("txtDate").select();
			//frm.txtDate.focus();
			return false;

		}

		var vardate = document.getElementById("policyAnniversaryDate").value;

			var expiryDate = document.getElementById("policyExpirationDate").value;

			var ddate = new Date(vardate);

			var expiryDate1 = new Date(expiryDate);

			if(!isDate(vardate)){
				alert("Invalid Effective Date")
				document.getElementById("txtDate").select();
				return false;
			}


			if(!isDate(expiryDate)){
				alert("Invalid Expiration Date")
				document.getElementById("ExpDate").select();
				return false;
			}
			if (vardate=="")
			{
				alert("Please enter the Effective Date");
				//frm.txtDate.focus();
				return false;
			}


			if (expiryDate=="")
			{
				alert("Please enter the Policy Expiration Date");
				//frm.ExpDate.focus();
				return false;
			}


			var dmonth = parseInt(vardate.substring(0, 2), 10);
			var dday = parseInt(vardate.substring(3, 5), 10);
			var dyear = parseInt(vardate.substring(6, 10), 10);

			var dmonthExpiryDate = parseInt(expiryDate.substring(0, 2), 10);
			var ddayExpiryDate = parseInt(expiryDate.substring(3, 5), 10);
			var dyearExpiryDate = parseInt(expiryDate.substring(6, 10), 10);

			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
			{
				alert("Please enter Effective date in 'MM/DD/YYYY' format");
				document.getElementById("txtDate").select();
				return false;
			}


			if (isNaN(dmonthExpiryDate) || dmonthExpiryDate < 1 || dmonthExpiryDate > 12 || isNaN(ddayExpiryDate) || ddayExpiryDate < 1 || ddayExpiryDate > 31 || isNaN(dyearExpiryDate) || expiryDate.substring(2, 3)!="/" || expiryDate.substring(5, 6)!="/")
			{
				alert("Please enter Expiration date in 'MM/DD/YYYY' format");
				//frm.AnniversaryDate.select();
				return false;
			}

			var reqDate = new Date("01/01/2005");

			if (ddate < reqDate)
			{

				alert("Effective Date cannot be prior to Jan 1, 2005");
				document.getElementById("txtDate").select();
				//frm.txtDate.focus();
				return false;
			}


			if(expiryDate1 < ddate  ){
				alert("Expiration Date is less than Effective date");
				document.getElementById("txtDate").select();
				//frm.txtDate.focus();
				return false;

			}

		window.location=document.getElementById('Recalculate_Quote_link') + '&answer(Object::Quote::QuoteStartDate)=' + document.getElementById('txtDate').value + '&answer(Object::Quote::QuoteEndDate)=' + document.getElementById('ExpDate').value;
	}


function LoadClassList(TabId){
	activateTabs(TabId);
	disblePolicyTabs(TabId);
	var locationListArraySize = 0;
	var parentQuoteId    = document.getElementById("parentQuoteId").value;
	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
	var subQuoteId    = document.getElementById("subQuoteId11").value;
	var productVerId  = document.getElementById("ProductVerId").value;
	var groupVerId = document.getElementById("GroupVerId").value;
	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
	}else{
		appEnabled = "N";
	}
	var agencyId = document.getElementById("agencyId").value;
	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	var FamilyId = document.getElementById("ProductFamilyId").value;
	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("customerId").value;

	var pars = 'answer(QuoteId)='+parentQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(OwnerId)='+ownerId;

	var url = '../GetQuoteClassList.do?'+pars;

	var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
	 autologout();
	 new Ajax.Request(url,
	{method: 'post',parameters:pars2,
		asynchronous:true,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
	 		 forwardToLoginPageIfInvalidSession(transport.responseText);
	 		 enableTabs();
	 		 enablePolicyTabs();
	 		 document.getElementById("CovLimitsDiv").style.display = "block";
	 	},onSuccess: function(transport){
	 	document.getElementById("CovLimitsDiv").innerHTML = "";
	 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
	 	}
	}
	);

}

function LoadNewQuoteClassHazards(TabId){
activateTabs(TabId);
var locationListArraySize = 0;

var parentQuoteId    = document.getElementById("parentQuoteId").value;

var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

var subQuoteId    = document.getElementById("subQuoteId11").value;

var productVerId  = document.getElementById("ProductVerId").value;

var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
var appEnabled = "";
if(IsApplicationDisabled == 'N'){
	appEnabled = 'Y';
}else{
	appEnabled = "N";
}
var agencyId = document.getElementById("agencyId").value;

var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
var FamilyId = document.getElementById("ProductFamilyId").value;
var ownerId = document.getElementById("ownerId").value;
var custId = document.getElementById("customerId").value;


var pars = 'answer(ApplicationName)=Class hazards&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=CLASSHAZARDS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplicationQuoteSummary3.0.go?&answer(isApplicationEnabled)='+appEnabled+
			'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+
			'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId;

			var url = '../DisplayApplication3.0.do?'+pars;

var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
autologout();
new Ajax.Request(url,
	{method: 'post',parameters:pars2,
		asynchronous:true,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
	 		 forwardToLoginPageIfInvalidSession(transport.responseText);
	 		 enableTabs();
	 		 enablePolicyTabs();
	 		 document.getElementById("CovLimitsDiv").style.display = "block";
	 	},onSuccess: function(transport){
	 	document.getElementById("CovLimitsDiv").innerHTML = "";


	 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
	 	}
	}
);
}

function LoadDocumentationTab(TabId){

	activateTabs(TabId);
	tabLoad="POlicyDocumentation";
	document.getElementById("AddNotespopup").style.display = 'block';
	document.getElementById("CovLimitsDiv").style.display="none";
	document.getElementById("CovLimitsDiv").innerHTML = "";
	document.getElementById("DocumentDiv").style.display = 'block';
	document.getElementById("ClassListDiv").style.display="none";
	document.getElementById("PolicyInformationDiv").style.display="none";
	document.getElementById("RiskPopUp").style.display = "none";
	var parentQuoteId    = document.getElementById("parentQuoteId").value;
	var ownerId = document.getElementById("ownerId").value;
	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
	refereshQuoteNotesList(parentQuoteId,ownerId,'QUOTE');
	refereshQuoteAttachmentList(parentQuoteId,parentQuoteVerId,ownerId,'QUOTE');
	refereshQuoteEmailList(parentQuoteId,ownerId,'QUOTE');
	enablePolicyTabs();
}

/* To get a List of Classes For the Corresponding Quote ID and Quote Ver Id*/
function LoadClassBenefitsList(TabId){
	activateTabs(TabId);
	var locationListArraySize = 0;
	var parentQuoteId    = document.getElementById("parentQuoteId").value;
	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
	var subQuoteId    = document.getElementById("subQuoteId11").value;
	var productVerId  = document.getElementById("ProductVerId").value;
	var groupVerId = document.getElementById("GroupVerId").value;
	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
	}else{
		appEnabled = "N";
	}
	var agencyId = document.getElementById("agencyId").value;

	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	var FamilyId = document.getElementById("ProductFamilyId").value;
	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("customerId").value;

	var pars = 'answer(QuoteId)='+parentQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(OwnerId)='+ownerId;

	var url = '../GetQuoteClassBenefitsList.do?'+pars;

	var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
	 autologout();
	 new Ajax.Request(url,
	{method: 'post',parameters:pars2,
		asynchronous:true,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
	 		 forwardToLoginPageIfInvalidSession(transport.responseText);
	 		 enableTabs();
	 		 enablePolicyTabs();
	 		 document.getElementById("CovLimitsDiv").style.display = "block";
	 	},onSuccess: function(transport){
	 	document.getElementById("CovLimitsDiv").innerHTML = "";
	 	document.getElementById("DocumentDiv").style.display = 'none';
	 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
	 	}
	}
	);

}

function LoadClassBenefitsList(TabId){
	activateTabs(TabId);
	var locationListArraySize = 0;
	var parentQuoteId    = document.getElementById("parentQuoteId").value;
	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
	var subQuoteId    = document.getElementById("subQuoteId11").value;
	var productVerId  = document.getElementById("ProductVerId").value;
	var groupVerId = document.getElementById("GroupVerId").value;
	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
	}else{
		appEnabled = "N";
	}
	var agencyId = document.getElementById("agencyId").value;

	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	var FamilyId = document.getElementById("ProductFamilyId").value;
	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("customerId").value;

	var pars = 'answer(QuoteId)='+parentQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(OwnerId)='+ownerId;

	var url = '../GetQuoteClassBenefitsList.do?'+pars;

	var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
	 autologout();
	 new Ajax.Request(url,
	{method: 'post',parameters:pars2,
		asynchronous:true,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
	 		 forwardToLoginPageIfInvalidSession(transport.responseText);
	 		 enableTabs();
	 		 enablePolicyTabs();
	 		 document.getElementById("CovLimitsDiv").style.display = "block";
	 	},onSuccess: function(transport){
	 	document.getElementById("CovLimitsDiv").innerHTML = "";
	 	document.getElementById("DocumentDiv").style.display = 'none';
	 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
	 	}
	}
	);

}

function LoadNewQuotePolicyExclusions(TabId){
tabLoad="PolicyExclusion";
activateTabs(TabId);
disblePolicyTabs(TabId);
document.body.style.cursor = "wait" ;
var locationListArraySize = 0;
document.getElementById("ClassListDiv").style.display="none";
document.getElementById("RiskPopUp").style.display = "none";
document.getElementById("PolicyInformationDiv").style.display="none";
document.getElementById("CovLimitsDiv").innerHTML = "";
document.getElementById("DocumentDiv").style.display = 'none';
var parentQuoteId    = document.getElementById("parentQuoteId").value;

var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

var subQuoteId    = document.getElementById("subQuoteId11").value;

var productVerId  = document.getElementById("ProductVerId").value;

var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
var appEnabled = "";
if(IsApplicationDisabled == 'N'){
	appEnabled = 'Y';
}else{
	appEnabled = "N";
}
var agencyId = document.getElementById("agencyId").value;

var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
var FamilyId = document.getElementById("ProductFamilyId").value;
var ownerId = document.getElementById("ownerId").value;
var custId = document.getElementById("customerId").value;


var pars = 'answer(ApplicationName)=policy Exclusion&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=POLICYEXCLUSION&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplicationQuoteSummary3.0.go?&answer(activateTabId)='+TabId+'&answer(isApplicationEnabled)='+appEnabled+
			'&answer(SubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ApplicationId__DMS_PROP_QUOTE_VER_ADD_POLICY_EXCLUSION~APPLICATION_ID)=212&answer(Object::Quote::ApplicationVerId__DMS_PROP_QUOTE_VER_ADD_POLICY_EXCLUSION~APPLICATION_VER_ID)=238&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=PolicyExclusion&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+
			'&answer(riskType)=Policy Exclusion&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId;

			var url = '../DisplayApplication3.0.do?'+pars;

var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
autologout();
new Ajax.Request(url,
	{method: 'post',parameters:pars2,
		asynchronous:true,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
	 		 forwardToLoginPageIfInvalidSession(transport.responseText);
	 		 enableTabs();
	 		 enablePolicyTabs();
	 		 document.getElementById("CovLimitsDiv").style.display = "block";
	 		 document.getElementById("PolicyInformationDiv").style.display="none";
	 		 document.getElementById("DocumentDiv").style.display = 'none';
	 	},onSuccess: function(transport){
		 	if(tabLoad=="PolicyExclusion"){
		 		document.getElementById("CovLimitsDiv").innerHTML = "";
		 		var addNewLine 	= "<br/>"
		 		document.getElementById("CovLimitsDiv").innerHTML= addNewLine + transport.responseText;
		 		document.getElementById("PolicyInformationDiv").style.display="none";
		 	}
	 	}
	}
);
document.body.style.cursor = "default" ;
}
function LoadNewQuoteAircraftSchedule(TabId)
{

activateTabs(TabId);
disblePolicyTabs(TabId);
tabLoad="AircraftSchedule";
var locationListArraySize = 0;

var parentQuoteId    = document.getElementById("parentQuoteId").value;

var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

var subQuoteId    = document.getElementById("subQuoteId11").value;

var productVerId  = document.getElementById("ProductVerId").value;

var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
var appEnabled = "";
if(IsApplicationDisabled == 'N'){
	appEnabled = 'Y';
}else{
	appEnabled = "N";
}
var agencyId = document.getElementById("agencyId").value;

var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;

var FamilyId = document.getElementById("ProductFamilyId").value;

var ownerId = document.getElementById("ownerId").value;
var custId = document.getElementById("customerId").value;
var quoteVerId = document.getElementById("parentQuoteVerId").value;
var quoteStatus = document.getElementById("paretQuoteStatus").value;

var pars = 'answer(ApplicationName)=Aircraft Schedule&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=AIRCRAFT&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplication3.0.go?&answer(isApplicationEnabled)='+appEnabled+
			'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+'&answer(Object::Quote::QuoteStatus)='+quoteStatus+'&answer(activateTabId)='+TabId+
			'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(quoteVerId)='+quoteVerId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId;

			var url = '../CVGetAircraftList2.do?'+pars;
var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
autologout();
new Ajax.Request(url,
	{method: 'post',parameters:pars2,
		asynchronous:true,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
	 		 forwardToLoginPageIfInvalidSession(transport.responseText);
	 		 enableTabs();
	 		 enablePolicyTabs();
	 		 document.getElementById("CovLimitsDiv").style.display = "block";
	 		 document.getElementById("ClassListDiv").style.display="none";
			 document.getElementById("DocumentDiv").style.display="none";
			 document.getElementById("PolicyInformationDiv").style.display="none";
	 	},onSuccess: function(transport){
	 		if(tabLoad=="AircraftSchedule"){
			 	document.getElementById("CovLimitsDiv").innerHTML = "";
			 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
			 	document.getElementById("DocumentDiv").style.display = 'none';
			 	document.getElementById("RiskPopUp").style.display = "none";
			}
	 	}
	}
);

}
function LoadNewQuoteAddEditAircraft(TabId){
var locationListArraySize = 0;

var parentQuoteId    	= document.getElementById("parentQuoteId").value;

var parentQuoteVerId 	= document.getElementById("parentQuoteVerId").value;

var subQuoteId    		= document.getElementById("subQuoteId11").value;

var productVerId  		= document.getElementById("ProductVerId").value;

var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
var appEnabled = "";
if(IsApplicationDisabled == 'N'){
	appEnabled = 'Y';
}else{
	appEnabled = "N";
}
var agencyId = document.getElementById("agencyId").value;

var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
var FamilyId = document.getElementById("ProductFamilyId").value;
var ownerId = document.getElementById("ownerId").value;
var custId = document.getElementById("customerId").value;


var pars =  'answer(ApplicationName)=Aircraft Schedule&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION'+
			'&answer(objectName)=AIRCRAFT&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes'+
			'&answer(actionName)=/saveApplication3.0.go?&answer(isApplicationEnabled)='+appEnabled+'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+
			'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE'+
			'&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+'&answer(recalculateneeded)=recalculate'+
			'&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+
			'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+
			'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(Object::Quote::AircraftRiskId)=-1'+
			'&answer(activateTabId)='+TabId;

			var url = '../DisplayApplication3.0.do?'+pars;

var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
autologout();
new Ajax.Request(url,
	{method: 'post',parameters:pars2,
		asynchronous:true,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
	 		 forwardToLoginPageIfInvalidSession(transport.responseText);
	 		 enableTabs();
	 		 document.getElementById("CovLimitsDiv").style.display = "block";
	 	},onSuccess: function(transport){
	 	document.getElementById("CovLimitsDiv").innerHTML = "";
	 	document.getElementById("CovLimitsDiv").innerHTML= "<br>"+transport.responseText;
	 	document.getElementById("DocumentDiv").style.display = 'none';
	 	}
	}
);
}
function checkproposalDocuments(id){
	var proposalId=id+"PROPOSAL";
	if(document.getElementById(id).checked == true){
		document.getElementById(proposalId).checked=true;
	}else{
		document.getElementById(proposalId).checked=false;
	}
}

function setQuoteSubjectivityDetails(quoteSubjId) {

	var isRenewal = "false";
	if(document.getElementById('isRenewal') != null && document.getElementById('isRenewal') != undefined) {
		isRenewal = document.getElementById('isRenewal').value;
	}
	if(isRenewal == "false") {
		document.getElementById('subjectivityAlertObjectType').value='Subjectivity';
	} else if(isRenewal == "true") {
		document.getElementById('subjectivityAlertObjectType').value='RenewalSubjectivity';
	}
	showAttach(quoteSubjId,'0','Subjectivity');
}


function enableOverridePremium(obj){

	var index = obj.id + "";
	index = index.replace("Object::TankPremium::Override::", "");
	var textBoxID = "Object::Tank::OverridedPremium::" + index;
	if(obj.value == "N"){
		document.getElementById(textBoxID).setAttribute("readonly", "readonly");
    document.getElementById(textBoxID).className = "blackfont";
	}
	else if(obj.value == "Y"){
		document.getElementById(textBoxID).removeAttribute("readonly");
    document.getElementById(textBoxID).className = "redfont";
	}

}


 function loadScheduleofFormsTabV2(scheduleofFormsId){
    activateQuoteTabs(scheduleofFormsId);

    var subQuoteId    = document.getElementById("subQuoteId11").value;
    var productVerId  = document.getElementById("ProductVerId").value;
    var planState = document.getElementById("planState").value;
    var prodId = document.getElementById("prodId").value;
    var parentQuoteId = document.getElementById("parentQuoteId").value;
    var subQuoteVerId = document.getElementById("subQuoteVerId").value;

    var ownerId = document.getElementById("ownerId").value;
    var custId = document.getElementById("customerId").value;
    var GroupId = document.getElementById("GroupId").value;
    var GroupVerId = document.getElementById("GroupVerId").value;
    var productStatus = document.getElementById("productStatus").value;
    var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
    var paretQuoteStatus = document.getElementById("paretQuoteStatus").value;
    var userId = document.getElementById("userId").value;
    var Quote = document.getElementById("Quote").value;
    var QuoteManagement = document.getElementById("QuoteManagement").value;
    var QuoteId = document.getElementById("QuoteId").value;
	var roleId = document.getElementById("roleName").value;
	var isRolebasedForms = 'Y';
   var pars ='requestType=&answer(DocumentType)=ISSUANCE&answer(Object::Quote::ProductId)='+prodId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(subQuoteId)='+subQuoteId+'&answer(subQuoteVerId)='+subQuoteVerId+'&answer(OwnerId)='+ownerId+'&answer(ProductVerId)='+productVerId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(customerId)='+custId+'&answer(ProductId)='+prodId+'&answer(prdGroupId)='+GroupId+'&answer(prdGroupVerId)='+GroupVerId+'&answer(productStatus)='+productStatus+'&answer(Object::Quote::QuoteVerId)='+parentQuoteVerId+'&answer(State)='+planState+'&answer(isUpdated)='+"Y"+'&answer(Object::Activity::ActivityType)='+QuoteManagement+'&answer(Object::Activity::ObjectType)='+Quote+'&answer(Object::Activity::CreatedBy)='+userId+'&answer(Object::Quote::QuoteStatus)='+paretQuoteStatus+'&answer(Object::Activity::OwnerId)='+ownerId+'&answer(QuoteId)='+QuoteId+'&answer(Object::UserDetail::roleName)='+roleId+'&answer(Object::OptionalForm::RoleBased)='+isRolebasedForms;
   var url = '../GetDocumentListCL_RoleBased_in_ScheduleofFormsTab.do?'+pars;
 	var pars2 = 'answer(activeTabName)=Schedule_of_Forms_Tab';
 	 autologout();
	 new Ajax.Request(url,
	 	{method: 'post',
			asynchronous:true,parameters:pars2,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 		forwardToLoginPageIfInvalidSession(transport.responseText);
		 		 enableTabs();
		 	},onSuccess: function(transport){

			document.getElementById("QuoteDiv").style.display = "block";
		 	document.getElementById("QuoteDiv").innerHTML= transport.responseText;
		 	}
		}
	);

 }