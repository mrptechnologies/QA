import mx.controls.Alert;
import mx.styles.CSSStyleDeclaration;
import mx.controls.DataGrid;
import mx.controls.gridclasses.DataGridColumn;
import mx.controls.ComboBox;
import mx.controls.CheckBox;
import mx.controls.TextInput;
import mx.controls.NumericStepper;
import mx.controls.RadioButtonGroup;
import mx.controls.RadioButton;

	
	var employeeApplicationStatus:String;
	var employeeInsWaiverStatus:String;
	/*Setting Style for ComboBox Component*/	
	var new_style:Object = new CSSStyleDeclaration();
	_global.styles.myStyle = new_style; 
	_global.styles.Alert.setStyle("themeColor", 0x99C9F7);
	_global.styles.Alert.setStyle("backgroundColor",0xEFF5FE);
	_global.styles.Alert.setStyle("borderStyle", outset);
	_global.styles.Alert.setStyle("skinTitleBackground", 0x99C9F7);
	/*Setting Style for ComboBox Component*/
	new_style.setStyle("textAlign", "left");
	new_style.setStyle("selectionColor", "0xF0F9FD");
	new_style.setStyle("useRollOver", false);
	Object__Employee__PolicyHolder__State___DMS_EMPLOYEE____STATE.setStyle("styleName", "myStyle");
	/*Setting Style for DataGrid Component*/
	var dataGrid_style:Object = new CSSStyleDeclaration();
	_global.styles.mydataGrid_style = dataGrid_style; 
	dataGrid_style.setStyle("textAlign", "left");
	dataGrid_style.setStyle("selectionColor", "0xF0F9FD");
	dataGrid_style.setStyle("useRollOver", false);
	dataGrid_style.setStyle("useRollOver", false);
	dataGrid_style.setStyle("vGridLines", true);
	dataGrid_style.setStyle("hGridLines", true);
	dataGrid_style.setStyle("headerColor", "0x99C9F7");
	dataGrid_style.setStyle("themeColor",0xF0F9FD);
	coveredDepend_dataGrid.setStyle("styleName", "mydataGrid_style");
	OtherCoverage_DataGrid.setStyle("styleName", "mydataGrid_style");
	dependent_DataGrid.setStyle("styleName", "mydataGrid_style");
	explanation_dataGrid.setStyle("styleName", "mydataGrid_style");
	/*Setting Style for DateField Component*/
	var dateField_style:Object = new CSSStyleDeclaration();
	_global.styles.mydateField_Style = dateField_style; 	
	dateField_style.setStyle("themeColor",0xF0F9FD);
	dateField_style.setStyle("backgroundColor",0xFFFFFF);
	dateField_style.setStyle("headerColor",0xF0F9FD);
	dateField_style.setStyle("todayColor",0x99CCFF);
	Object__Employee__MedicalCondition__AngioplastyDate___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____ANGIOPLASTY_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__MedicalCondition__BypassSurgeryDate___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____BYPASSSURGERY_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__MedicalCondition__HeartAttackDate___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____HEARTATTACK_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__MedicalCondition__StrokeDate___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____STROKE_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__MedicalCondition__DateofLastSeizure___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____LAST_SEIZURE_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__MedicalCondition__HospitalizedDate___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____HOSPITALIZED_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__MedicalCondition__SuicideAttemptDate___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____SUICIDE_ATTEMPT_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__MedicalCondition__AbnormalPapDate___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____ABNORMAL_PAP_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__MedicalCondition__NormalFollowupPapDate___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____NORMAL_FOLLOWUP_PAP_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__MedicalQuestion__DelivaryDueDate___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____DELIVARY_DUE_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__InsWaiver__SignedDate___DMS_EMPLOYEE_INS_WAIVER____WAIVER_SIGNED_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__ActionRequested__RequestedEffDate___DMS_EMPLOYEE_ACTIONREQUESTED____EFFECTIVE_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__ActionRequested__MarriedDate___DMS_EMPLOYEE_ACTIONREQUESTED____MARRIED_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__ActionRequested__RequestedChangeDate___DMS_EMPLOYEE_ACTIONREQUESTED____REQUESTED_CHANGE_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__PolicyHolder__DateOfBirth___DMS_EMPLOYEE____DOB.setStyle("styleName", "mydateField_Style");
	Object__Employee__PolicyHolder__DateOfHire___DMS_EMPLOYEE____HIRE_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__PolicyHolder__ExpirationDate___DMS_EMPLOYEE____TERMINATION_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__PolicyHolder__MarriedDate___DMS_EMPLOYEE____MARRIED_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__OtherCoverage__PolEffectiveDate___DMS_EMPLOYEE_OTHER_COVERAGE____OTHER_EFFECTIVE_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__OtherCoverage__LastEffectiveDate___DMS_EMPLOYEE_OTHER_COVERAGE____LAST_EFFECTIVE_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__OtherCoverage__PolicyEndDate___DMS_EMPLOYEE_OTHER_COVERAGE____POLICY_END_DATE.setStyle("styleName", "mydateField_Style");
	Object__Employee__DearBorn__PrimaryDOB___DMS_EMPLOYEE_DEARBORN____PRIMARY_DOB.setStyle("styleName", "mydateField_Style");
	Object__Employee__DearBorn__SecondaryDOB___DMS_EMPLOYEE_DEARBORN____SECONDARY_DOB.setStyle("styleName", "mydateField_Style");
	Object__Employee__CoverageDept__Spouse__DateOfBirth___DMS_EMPLOYEE_COVERED_SPOUSE____DATE_OF_BIRTH.setStyle("styleName", "mydateField_Style");
	
	
	
	/*Retreiving Sate Label for corresponding data*/
	retreiveSateLabel = function(valueElement:String,array:Array,combo:ComboBox){
		var Idx=0;
			for(inx=0;inx<array.length;inx++) {
				 if(array[inx].data == valueElement) {
				  Idx=inx;
				  inx=array.length+1;
				 }
			}
		combo.selectedIndex=Idx;
	}
	modifiedAttribute = function(){
		isModified = true;
	}
	validateField = function(instance:TextInput,errorText:Alert){	
		var isEmpty:Boolean = true;
		if(instance.length<1){
			var myclickHandler:Function = function (evt_obj:Object) {
				if (evt_obj.detail == Alert.OK) {
					isModified = false;
					Selection.setFocus(instance);
				}
			};
			// Show alert dialog box.
			informationMessage = Alert.show(errorText,"Information", Alert.OK , this, myclickHandler, "stockIcon", Alert.OK);		
			informationMessage.move(450,300);
			isEmpty =false;
		}
		return isEmpty;
	}
	validateSSN = function(instanceOne:TextInput,instanceTwo:TextInput,instanceThree:TextInput,errorText:Alert){
		 var isEmpty:Boolean = true;
		 if(instanceOne.length<1 or isNaN(instanceOne.text) or instanceTwo.length<1 or isNaN(instanceTwo.text) or instanceThree.length<1 or isNaN(instanceThree.text)){
			var myclickHandler:Function = function (evt_obj:Object) {
				if (evt_obj.detail == Alert.OK) {
					isModified = false;
					Selection.setFocus(instanceOne);
				}
			};
			// Show alert dialog box.
			informationMessage = Alert.show(errorText, "Information", Alert.OK , this, myclickHandler, "stockIcon", Alert.OK);		
			informationMessage.move(450,300);
			isEmpty =false; 
		 }
		 return isEmpty; 
	 }
	validateMantatoryRadiobuttonGroup = function(instance:RadioButtonGroup,errorText:Alert){	
		var isEmpty:Boolean = true;
		if(!(instance.selectedData)){
			var myclickHandler:Function = function (evt_obj:Object) {
				if (evt_obj.detail == Alert.OK) {
					isModified = false;
					Selection.setFocus(instance);
				}
			};
			// Show alert dialog box.
			informationMessage = Alert.show(errorText,"Information", Alert.OK , this, myclickHandler, "stockIcon", Alert.OK);		
			informationMessage.move(450,200);
			isEmpty =false;
		}
		return isEmpty;
	}



/*Retrieving method for retrieve attributes data in Action Requested Tab*/
retreiveActionRequested = function(){

	var subApplChildNode = global_employee_XML.firstChild.firstChild.childNodes;		
	for(parentIndex = 0;parentIndex < global_employee_XML.firstChild.childNodes.length;parentIndex++){
		for(childIndex=0;childIndex < global_employee_XML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
			
			var nameElement:String  = global_employee_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
			var valueElement:String = global_employee_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
			
			if(nameElement=="Object__Employee__ActionRequested__Action" and valueElement != null){
				Object__Employee__ActionRequested__Action___DMS_EMPLOYEE_ACTIONREQUESTED____REQUESTED_ACTION.setValue(valueElement);
			}
			else if(nameElement=="Object__Employee__ActionRequested__HealthCvg" and valueElement != null){

					Object__Employee__ActionRequested__HealthCvg___DMS_EMPLOYEE_ACTIONREQUESTED____HEALTH_COVERAGE.selected = true;
					Object__Employee__ActionRequested__HealthPrdName___DMS_EMPLOYEE_ACTIONREQUESTED____HEALTH_PRODUCT_NAME.enabled = true;
			}
			else if(nameElement=="Object__Employee__ActionRequested__HealthPrdName" and valueElement != null){
				Object__Employee__ActionRequested__HealthPrdName___DMS_EMPLOYEE_ACTIONREQUESTED____HEALTH_PRODUCT_NAME.text = valueElement;
			}
			else if(nameElement=="Object__Employee__ActionRequested__DrugCvg" and valueElement != null){
					Object__Employee__ActionRequested__DrugCvg___DMS_EMPLOYEE_ACTIONREQUESTED____DRUG_COVERAGE.selected = true;
					Object__Employee__ActionRequested__DrugPrdName___DMS_EMPLOYEE_ACTIONREQUESTED____DRUG_PRODUCT_NAME.enabled = true;
			}
			else if(nameElement=="Object__Employee__ActionRequested__DrugPrdName" and valueElement != null){
				Object__Employee__ActionRequested__DrugPrdName___DMS_EMPLOYEE_ACTIONREQUESTED____DRUG_PRODUCT_NAME.text = valueElement;
			}
			else if(nameElement=="Object__Employee__ActionRequested__DentalCvg" and valueElement != null){
					Object__Employee__ActionRequested__DentalCvg___DMS_EMPLOYEE_ACTIONREQUESTED____DENTAL_COVERAGE.selected = true;
					Object__Employee__ActionRequested__DentalPrdName___DMS_EMPLOYEE_ACTIONREQUESTED____DENTAL_PRODUCT_NAME.enabled = true;
			}
			else if(nameElement=="Object__Employee__ActionRequested__DentalPrdName" and valueElement != null){
				Object__Employee__ActionRequested__DentalPrdName___DMS_EMPLOYEE_ACTIONREQUESTED____DENTAL_PRODUCT_NAME.text = valueElement;
			}
			else if(nameElement=="Object__Employee__ActionRequested__VisionCvg" and valueElement != null){
					Object__Employee__ActionRequested__VisionCvg___DMS_EMPLOYEE_ACTIONREQUESTED____VISION_COVERAGE.selected = true;
					Object__Employee__ActionRequested__VisionPrdName___DMS_EMPLOYEE_ACTIONREQUESTED____VISION_PRODUCT_NAME.enabled = true;
			}
			else if(nameElement=="Object__Employee__ActionRequested__VisionPrdName" and valueElement != null){
				Object__Employee__ActionRequested__VisionPrdName___DMS_EMPLOYEE_ACTIONREQUESTED____VISION_PRODUCT_NAME.text = valueElement;
			}
			else if(nameElement=="Object__Employee__ActionRequested__NoOrSomeCvg" and valueElement != null){
					Object__Employee__ActionRequested__NoOrSomeCvg___DMS_EMPLOYEE_ACTIONREQUESTED____NOORSOME_COVERAGE.selected = true;
			}
		}
	}
};

 
 
 
 retreiveInsWaiver= function(){ 
 
	 Object__Employee__InsWaiver__EmployeeName___DMS_EMPLOYEE_INS_WAIVER____EMPLOYEE_NAME.enabled=false;	 
	 Object__Employee__InsWaiver__SpouseName___DMS_EMPLOYEE_INS_WAIVER____SPOUSE_NAME.enabled=false;
	 
	var subApplChildNode = global_employee_XML_Extended.firstChild.firstChild.childNodes;		
	for(parentIndex = 0;parentIndex<global_employee_XML_Extended.firstChild.childNodes.length;parentIndex++){
		for(childIndex=0;childIndex<global_employee_XML_Extended.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
			
			var nameElement:String  = global_employee_XML_Extended.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
			var valueElement:String = global_employee_XML_Extended.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
			
			if(nameElement=="Object__Employee__InsWaiver__CoverageReason" and valueElement != null){
				Object__Employee__InsWaiver__CoverageReason___DMS_EMPLOYEE_INS_WAIVER____WAIVING_COVERAGE_REASON.setValue(valueElement);
			}
			else if(nameElement=="Object__Employee__InsWaiver__SelfInsCompanyName" and valueElement != null){
				Object__Employee__InsWaiver__SelfInsCompanyName___DMS_EMPLOYEE_INS_WAIVER____SELF_INS_COMPANY_NAME.text= valueElement;
			}
			else if(nameElement=="Object__Employee__InsWaiver__CvgSelfHealth" and valueElement != null){
				Object__Employee__InsWaiver__CvgSelfHealth___DMS_EMPLOYEE_INS_WAIVER____HEALTH_SELF_COVERAGE.selected = true;
			}
			else if(nameElement=="Object__Employee__InsWaiver__WaiverDeptName1" and valueElement != null){
				Object__Employee__InsWaiver__WaiverDeptName1___DMS_EMPLOYEE_INS_WAIVER____WAIVER_DEPENDENT_NAME1.text= valueElement;
			}
			else if(nameElement=="Object__Employee__InsWaiver__WaiverDeptName2" and valueElement != null){
				Object__Employee__InsWaiver__WaiverDeptName2___DMS_EMPLOYEE_INS_WAIVER____WAIVER_DEPENDENT_NAME2.text= valueElement;
			}
			else if(nameElement=="Object__Employee__InsWaiver__WaiverDeptName3" and valueElement != null){
				Object__Employee__InsWaiver__WaiverDeptName3___DMS_EMPLOYEE_INS_WAIVER____WAIVER_DEPENDENT_NAME3.text= valueElement;
			}
			else if(nameElement=="Object__Employee__InsWaiver__WaiverDeptName4" and valueElement != null){
				Object__Employee__InsWaiver__WaiverDeptName4___DMS_EMPLOYEE_INS_WAIVER____WAIVER_DEPENDENT_NAME4.text= valueElement;
			}
			else if(nameElement=="Object__Employee__InsWaiver__WaiverDeptName5" and valueElement != null){
				Object__Employee__InsWaiver__WaiverDeptName5___DMS_EMPLOYEE_INS_WAIVER____WAIVER_DEPENDENT_NAME5.text= valueElement;
			}
			else if(nameElement=="Object__Employee__InsWaiver__WaiverSelf" and valueElement != null){
				Object__Employee__InsWaiver__WaiverSelf___DMS_EMPLOYEE_INS_WAIVER____WAIVERSELF.selected = true;
			}
			else if(nameElement=="Object__Employee__InsWaiver__WaiverDependent" and valueElement != null){
				Object__Employee__InsWaiver__WaiverDependent___DMS_EMPLOYEE_INS_WAIVER____WAIVERDEPENDENT.selected = true;
			}
			else if(nameElement=="Object__Employee__InsWaiver__CvgSelfDrug" and valueElement != null){
				Object__Employee__InsWaiver__CvgSelfDrug___DMS_EMPLOYEE_INS_WAIVER____DRUG_SELF_COVERAGE.selected = true;
			}
			else if(nameElement=="Object__Employee__InsWaiver__CvgSelfDental" and valueElement != null){
				Object__Employee__InsWaiver__CvgSelfDental___DMS_EMPLOYEE_INS_WAIVER____DENTAL_SELF_COVERAGE.selected = true;
			}
			else if(nameElement=="Object__Employee__InsWaiver__CvgSelfVision" and valueElement != null){
				Object__Employee__InsWaiver__CvgSelfVision___DMS_EMPLOYEE_INS_WAIVER____VISION_SELF_COVERAGE.selected = true;
			}
			else if(nameElement=="Object__Employee__InsWaiver__CvgSelfFDL" and valueElement != null){
				Object__Employee__InsWaiver__CvgSelfFDL___DMS_EMPLOYEE_INS_WAIVER____FDL_SELF_COVERAGE.selected = true;
			}
			else if(nameElement=="Object__Employee__InsWaiver__CvgDeptHealth" and valueElement != null){
				Object__Employee__InsWaiver__CvgDeptHealth___DMS_EMPLOYEE_INS_WAIVER____HEALTH_DEPT_COVERAGE.selected = true;
			}
			else if(nameElement=="Object__Employee__InsWaiver__CvgDeptDrug" and valueElement != null){
				Object__Employee__InsWaiver__CvgDeptDrug___DMS_EMPLOYEE_INS_WAIVER____DRUG_DEPT_COVERAGE.selected = true;
			}
			else if(nameElement=="Object__Employee__InsWaiver__CvgDeptDental" and valueElement != null){
				Object__Employee__InsWaiver__CvgDeptDental___DMS_EMPLOYEE_INS_WAIVER____DENTAL_DEPT_COVERAGE.selected = true;
			}
			else if(nameElement=="Object__Employee__InsWaiver__CvgDeptVision" and valueElement != null){
				Object__Employee__InsWaiver__CvgDeptVision___DMS_EMPLOYEE_INS_WAIVER____VISION_DEPT_COVERAGE.selected = true;
			}
			else if(nameElement=="Object__Employee__InsWaiver__CurrentHealthCvgStatus" and valueElement != null){
				Object__Employee__InsWaiver__CurrentHealthCvgStatus___DMS_EMPLOYEE_INS_WAIVER____CURRENT_HEALTH_CVG_STATUS.setValue(valueElement);
			}
			else if(nameElement=="Object__Employee__InsWaiver__OtherCoverageName" and valueElement != null){
				Object__Employee__InsWaiver__OtherCoverageName___DMS_EMPLOYEE_INS_WAIVER____OTHER_COVERAGE.text = valueElement;
			}
			else if(nameElement=="Object__Employee__InsWaiver__SpouseEmpInsCompanyName" and valueElement != null){
				Object__Employee__InsWaiver__SpouseEmpInsCompanyName___DMS_EMPLOYEE_INS_WAIVER____SPOUSE_INS_COMPANY_NAME.text = valueElement;
			}
			else if(nameElement=="Object__Employee__InsWaiver__CurrentEmployer" and valueElement != null){
				Object__Employee__InsWaiver__CurrentEmployer___DMS_EMPLOYEE_INS_WAIVER____CURRENT_EMPLOYER.text = valueElement;
			}
			else if(nameElement=="Object__Employee__InsWaiver__EmployeeName" and valueElement != null){
				Object__Employee__InsWaiver__EmployeeName___DMS_EMPLOYEE_INS_WAIVER____EMPLOYEE_NAME.text = valueElement;
			}
			else if(nameElement=="Object__Employee__InsWaiver__EmployeeSSN" and valueElement != null){
				var employeeSSNOne  = valueElement.substr(0,3);
				var employeeSSNTwo  = valueElement.substr(3,2);
				var employeeSSNThree = valueElement.substr(5,4);
				Object__Employee__InsWaiver__EmployeeSSNOne.text = employeeSSNOne;
				Object__Employee__InsWaiver__EmployeeSSNTwo.text = employeeSSNTwo;
				Object__Employee__InsWaiver__EmployeeSSNThree.text = employeeSSNThree;
			}
			else if(nameElement=="Object__Employee__InsWaiver__SpouseName" and valueElement != null){
				Object__Employee__InsWaiver__SpouseName___DMS_EMPLOYEE_INS_WAIVER____SPOUSE_NAME.text = valueElement;
			}
			else if(nameElement=="Object__Employee__InsWaiver__SpouseSSN" and valueElement != null){
				var spouseSSNOne  = valueElement.substr(0,3);
				var spouseSSNTwo  = valueElement.substr(3,2);
				var spouseSSNThree = valueElement.substr(5,4);
				Object__Employee__InsWaiver__SpouseSSNOne.text = spouseSSNOne;
				Object__Employee__InsWaiver__SpouseSSNTwo.text = spouseSSNTwo;
				Object__Employee__InsWaiver__SpouseSSNThree.text = spouseSSNThree;
			}
			else if(nameElement=="Object__Employee__InsWaiver__SignedDate" and valueElement != null){
				var valueEffectiveDate = valueElement;
				var index = valueEffectiveDate.split("-");
				Object__Employee__InsWaiver__month.text=index[1];
				Object__Employee__InsWaiver__date.text=index[2];
				Object__Employee__InsWaiver__year.text=index[0];
			}
			else if(nameElement == "Object__Customer__CustomerName" and valueElement != null){
				Object_Customer_ActionRequested_groupCompanyName.text = valueElement;				
			}
			else if(nameElement == "Object__Employee__InsWaiver__InsWaiverStatus" and valueElement!=undefined) {
				insWaiverStatus=valueElement;
				employeeInsWaiverStatus = valueElement;
			}
			else if(nameElement == "Object__Employee__InsWaiver__EmployeeSignature" and valueElement!=undefined) {
				Object__Employee__InsWaiver__EmployeeSignature___DMS_EMPLOYEE_INS_WAIVER____EMPLOYEE_SIGNATURE.text=valueElement;
				Object__Employee__InsWaiver__EmployeeSignatureEncrypted___DMS_EMPLOYEE_INS_WAIVER____EMPLOYEE_SIGNATURE_ENCRYPTED.text=valueElement;
			}
		}
	}		
	retrieveInsWaiverEmpDetail();
};

retrieveInsWaiverEmpDetail = function(){	
	var subApplicationName:String;
	var lNameSelf:String="";
	var fNameSelf:String="";
	var fullName:String="";
	var subApplChildNode = global_employee_XML.firstChild.firstChild.childNodes;		
	for(parentIndex = 0;parentIndex<global_employee_XML.firstChild.childNodes.length;parentIndex++){
		subApplicationName = global_employee_XML.firstChild.childNodes[parentIndex].attributes.Name;
		if(subApplicationName == "Policy")  {
			for(childIndex=0;childIndex<global_employee_XML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
				
				var nameElement:String  = global_employee_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				var valueElement:String = global_employee_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
				
				if(nameElement == "Object__Employee__PolicyHolder__LastName" and valueElement != null){
					lNameSelf = valueElement;
					if(fNameSelf!="" and fNameSelf!=undefined and fNameSelf!="undefined"){
						fullName = lNameSelf+" "+fNameSelf;
					}else{
						fullName = lNameSelf;
					}					
					Object__Employee__InsWaiver__EmployeeName___DMS_EMPLOYEE_INS_WAIVER____EMPLOYEE_NAME.text = fullName;
				}
				else if(nameElement == "Object__Employee__PolicyHolder__FirstName" and valueElement != null){
					fNameSelf = valueElement;
					if(lNameSelf!="" and lNameSelf!=undefined and lNameSelf!="undefined"){
						fullName = lNameSelf+" "+fNameSelf;	
					}else{
						fullName = fNameSelf;	
					}									
					Object__Employee__InsWaiver__EmployeeName___DMS_EMPLOYEE_INS_WAIVER____EMPLOYEE_NAME.text = fullName;											
				}
				if(nameElement=="Object__Employee__PolicyHolder__SSN" and valueElement != null){
					var employeeSSNOne  = valueElement.substr(0,3);
					var employeeSSNTwo  = valueElement.substr(3,2);
					var employeeSSNThree = valueElement.substr(5,4);
					if(Object__Employee__InsWaiver__EmployeeSSNOne.text.length==0 && Object__Employee__InsWaiver__EmployeeSSNTwo.text.length==0 && Object__Employee__InsWaiver__EmployeeSSNThree.text.length==0){
						Object__Employee__InsWaiver__EmployeeSSNOne.text = employeeSSNOne;
						Object__Employee__InsWaiver__EmployeeSSNTwo.text = employeeSSNTwo;
						Object__Employee__InsWaiver__EmployeeSSNThree.text = employeeSSNThree;
					}
				}
			}
		}
		if(subApplicationName == "Spouse Details")  {
			var lNameSpouse:String="";
			var fNameSpouse:String="";
			var fullNameSpouse:String="";
			for(childIndex=0;childIndex<global_employee_XML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){				
				var nameElement:String  = global_employee_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				var valueElement:String = global_employee_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;

				if(nameElement == "Object__Employee__CoverageDept__Spouse__FName" and valueElement != null){
					fNameSpouse = valueElement;
					if(lNameSpouse!="" and lNameSpouse!=undefined and lNameSpouse!="undefined"){
						fullNameSpouse = lNameSpouse+" "+fNameSpouse;
					}else{
						fullNameSpouse = fNameSpouse;
					}					
					Object__Employee__InsWaiver__SpouseName___DMS_EMPLOYEE_INS_WAIVER____SPOUSE_NAME.text =fullNameSpouse;					
				}
				else if(nameElement == "Object__Employee__CoverageDept__Spouse__LName" and valueElement != null){
					lNameSpouse = valueElement;
					if(fNameSpouse!="" and fNameSpouse!=undefined and fNameSpouse!="undefined"){
						fullNameSpouse = lNameSpouse+" "+fNameSpouse;
					}else{
						fullNameSpouse = lNameSpouse;
					}					
					Object__Employee__InsWaiver__SpouseName___DMS_EMPLOYEE_INS_WAIVER____SPOUSE_NAME.text =fullNameSpouse;										
				}
				else if(nameElement == "Object__Employee__CoverageDept__Spouse__SSN" and valueElement != null){
					var spouseSSNOne   = valueElement.substr(0,3);
					var spouseSSNTwo   = valueElement.substr(3,2);
					var spouseSSNThree = valueElement.substr(5,4);
					
					Object__Employee__InsWaiver__SpouseSSNOne.text = spouseSSNOne;
					Object__Employee__InsWaiver__SpouseSSNTwo.text = spouseSSNTwo;
					Object__Employee__InsWaiver__SpouseSSNThree.text = spouseSSNThree;					
				}
			}
		}
	}
}

var otherCvgPKeyArr:Array = new Array();
var getOtherCovg:Boolean = false;
var getContCovg:Boolean = false;
var getPriorCovg:Boolean = false;
retreiveOtherCoverage = function(){
	OtherCoverage_DataGrid.enabled = true;
	getCombinedFormDetails();
	var employee_OtherCovXML1:XML = new XML();
	var subApplicationName :String;
	nameElementArray = new Array();
	valuElementArray = new Array();
	var myDP_array:Array = new Array();	
	employee_OtherCovXML1.load("xmlTest.xml");
		
	employee_OtherCovXML1.ignoreWhite = true;
	employee_OtherCovXML1.onLoad = function(success:Boolean){
	if(true){
		getOtherCoverageValuefromXML(global_employee_XML,true);
	}	
};
};

getOtherCoverageValuefromXML = function(employee_OtherCovXML:XML,isNeedNormalFormRetrieve:Boolean){
	
	var subApplicationName :String;	
	var myDP_array:Array = new Array();
	var attributeChildNode = employee_OtherCovXML.firstChild.firstChild.firstChild.childNodes;
	var val;
	trace("attributeChildNode:"+attributeChildNode.nodeName);
	var subApplChildNode = employee_OtherCovXML.firstChild.firstChild.childNodes;		
	trace("XML length:"+employee_OtherCovXML.firstChild.childNodes.length);
	for(parentIndex = 0;parentIndex < employee_OtherCovXML.firstChild.childNodes.length;parentIndex++){
		nameElementArray = new Array();
		valuElementArray = new Array();
		subApplicationName = employee_OtherCovXML.firstChild.childNodes[parentIndex].attributes.Name;
	trace("subApplicationName::"+subApplicationName);
	trace("nameElement:"+nameElement);
		if(subApplicationName == "Coverage" ){
			
			/**
			 * Get other coverage detail if only "yes" is selelcted
			 */
			if(getOtherCovg) {
				var repeatNameElement:String;
				var repeatValueElement:String;
				var count:Number = 0;
				var noOfRows:Number = 0;
				for(childIndex=0;childIndex < employee_OtherCovXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
					trace(childIndex);
					repeatNameElement = employee_OtherCovXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					trace("repeatedEle:"+repeatNameElement);
					repeatValueElement= employee_OtherCovXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
					trace("repeatedValue:"+repeatValueElement);
					nameElementArray[childIndex] = repeatNameElement;
					valuElementArray[childIndex] = repeatValueElement;									
					count = count + 1;
					trace("Count:"+count);
				}
				// to iterate the attribute name index and retrieve the attribute name and order the values correctly based on the columns.
				// star
				var policyHolderAttr:String; var medNumberAttr:String; var partAEffDateAttr:String;
				var partBEffDateAttr:String; var indReasonAttr:String;
				trace("nameElementArray.length::"+nameElementArray.length);//ok
				var colCount:Number = 0;
					var polHolderValue:String = ""; var medNumberValue:String=""; var partAEffDateValue:String="";
					var partBEffDateValue:String=""; var indReasonOtherValue:String=""; var indReasonValue:String = "Age";
				var pKeyIndxOtherCvg:Number = 0;
				for(attArrIndx:Number = 0; attArrIndx < nameElementArray.length; attArrIndx++){
					
					trace("nameElementArray["+[attArrIndx]+"]==>"+nameElementArray[attArrIndx]);
					trace("ValuElementArray["+[attArrIndx]+"]==>"+valuElementArray[attArrIndx]);
					// check for the column name in the attribute, If avail then set the value in the variable.
					if(nameElementArray[attArrIndx].indexOf("Object__Employee__OtherCoverage__PolicyHolderName")!=-1){
						polHolderValue = valuElementArray[attArrIndx];						
						trace("polHolderValue::+"+polHolderValue);
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Employee__OtherCoverage__MedicareNumber")!=-1){
						trace("2 if");
						medNumberValue = valuElementArray[attArrIndx]; 
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Employee__OtherCoverage__PartAEffDate")!=-1){
						partAEffDateValue = valuElementArray[attArrIndx];
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Employee__OtherCoverage__PartBEffDate")!=-1){
						partBEffDateValue = valuElementArray[attArrIndx];
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Employee__OtherCoverage__MedicareReason_")!=-1){
						indReasonValue = valuElementArray[attArrIndx];
						if(indReasonValue==""|| indReasonValue == undefined || indReasonValue=="undefined") {						
							indReasonValue="Age";
						}
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Employee__OtherCoverage__MedicareReasonOther")!=-1){
						indReasonOtherValue = valuElementArray[attArrIndx];
					}
					colCount++;
					
					// if the colcount is the multiples of the number of columns, then push the array with values.
					trace("ColCount:"+colCount);
					if(colCount % 6 ==0){
						trace("befroe push");
						myDP_array.push({PolicyHolderName:polHolderValue, MedicareNumber:medNumberValue, PartAEffectiveDate:partAEffDateValue,PartBEffectiveDate:partBEffDateValue,medic:indReasonValue,MedicareReasonOther:indReasonOtherValue});
						var keyStrOtherCvg = nameElementArray[attArrIndx];
						trace("keyStrOtherCvg:<>"+keyStrOtherCvg);
						otherCvgPKeyArr[pKeyIndxOtherCvg++] = keyStrOtherCvg.substr(keyStrOtherCvg.indexOf("_____")+5,keyStrOtherCvg.length);
						trace("validAPKeyArr:"+otherCvgPKeyArr);
						getOtherCoveragePKey = function(){
						trace("getOtherCoveragePKey return entered");
						return otherCvgPKeyArr;
						}
					}
				}
				
				if(myDP_array.length==0 || myDP_array.length == undefined || myDP_array.length <0){
					myDP_array = new Array({Select:false,PolicyHolderName:" ", MedicareNumber:" ", PartAEffectiveDate:"",PartBEffectiveDate:"",medic:"Age",MedicareReasonOther:" "});
				}
				else{
					myDP_array.push({PolicyHolderName:" ", MedicareNumber:" ", PartAEffectiveDate:"",PartBEffectiveDate:"",medic:"Age",MedicareReasonOther:" "});
				}
				OtherCoverage_DataGrid.dataProvider = myDP_array;
			}			
		}else if(subApplicationName == "Coverage Cont." ){
			if(isNeedNormalFormRetrieve){
				for(childIndex=0;childIndex < employee_OtherCovXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
										
					var nameElement:String  = employee_OtherCovXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					var valueElement:String = employee_OtherCovXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
					
					if(getContCovg){
						if(nameElement=="Object__Employee__OtherCoverage__OtherPolicyHolderName" and valueElement != null){
							Object__Employee__OtherCoverage__OtherPolicyHolderName___DMS_EMPLOYEE_OTHER_COVERAGE____OTHER_POLICYHOLDER_NAME.text = valueElement;
						}
						else if(nameElement=="Object__Employee__OtherCoverage__InsCompanyName"  and valueElement != null){
							Object__Employee__OtherCoverage__InsCompanyName___DMS_EMPLOYEE_OTHER_COVERAGE____INSURANCE_COMPANY_NAME.text= valueElement;
						}
						else if(nameElement=="Object__Employee__OtherCoverage__PolicyNumber" and valueElement != null){
							Object__Employee__OtherCoverage__PolicyNumber___DMS_EMPLOYEE_OTHER_COVERAGE____POLICY_NUMBER.text = valueElement;
						}
						else if(nameElement=="Object__Employee__OtherCoverage__PolEffectiveDate" and valueElement!= "0000-00-00" and valueElement != null){
							var valueEff_DATE = valueElement;
							var index = valueEff_DATE.split("-");
							Object__Employee__OtherCoverage__PolEffectiveDate__Month.text = index[1];
							Object__Employee__OtherCoverage__PolEffectiveDate__Date.text = index[2];
							Object__Employee__OtherCoverage__PolEffectiveDate__Year.text = index[0];
							//Object__Employee__OtherCoverage__PolEffectiveDate___DMS_EMPLOYEE_OTHER_COVERAGE____OTHER_EFFECTIVE_DATE.text = valEffextiveDate;
						}
						else if(nameElement=="Object__Employee__OtherCoverage__MedicalCvg" and valueElement != null){
								Object__Employee__OtherCoverage__MedicalCvg___DMS_EMPLOYEE_OTHER_COVERAGE____MEDICAL_COVERAGE.selected = true;
						}
						else if(nameElement=="Object__Employee__OtherCoverage__DentalCvg" and valueElement != null){
								Object__Employee__OtherCoverage__DentalCvg___DMS_EMPLOYEE_OTHER_COVERAGE____DENTAL_COVERAGE.selected = true;
						}
						else if(nameElement=="Object__Employee__OtherCoverage__HospitalOnlyCvg" and valueElement != null){
								Object__Employee__OtherCoverage__HospitalOnlyCvg___DMS_EMPLOYEE_OTHER_COVERAGE____HOSPITAL_ONLY_COVERAGE.selected = true;
						}
						else if(nameElement=="Object__Employee__OtherCoverage__VisionCvg" and valueElement != null){
								Object__Employee__OtherCoverage__VisionCvg___DMS_EMPLOYEE_OTHER_COVERAGE____VISION_COVERAGE.selected = true;
						}
						else if(nameElement=="Object__Employee__OtherCoverage__PrescriptionDrugCvg" and valueElement != null){
								Object__Employee__OtherCoverage__PrescriptionDrugCvg___DMS_EMPLOYEE_OTHER_COVERAGE____PRESCRIPTION_DRUG_COVERAGE.selected = true;
						}				
						else if(nameElement=="Object__Employee__OtherCoverage__WorkStatus" and valueElement != null){
							Object__Employee__OtherCoverage__WorkStatus___DMS_EMPLOYEE_OTHER_COVERAGE____WORK_STATUS.setValue(valueElement);
						}
						else if(nameElement=="Object__Employee__OtherCoverage__PolicyType" and valueElement != null){
							Object__Employee__OtherCoverage__PolicyType___DMS_EMPLOYEE_OTHER_COVERAGE____POLICY_TYPE.setValue(valueElement);
						}
					}
					if(getPriorCovg){
						if(nameElement=="Object__Employee__OtherCoverage__LastEffectiveDate" and  valueElement!= "0000-00-00" and  valueElement != null){
							var valueLastEff_DATE = valueElement;
							var index = valueLastEff_DATE.split("-");
							Object__Employee__OtherCoverage__LastEffectiveDate__Month.text = index[1];
							Object__Employee__OtherCoverage__LastEffectiveDate__Date.text = index[2];
							Object__Employee__OtherCoverage__LastEffectiveDate__Year.text = index[0];
							
							/*var valueLAST_EFFECTIVE_DATE = valueElement;
							var index = valueLAST_EFFECTIVE_DATE.split("-");
							var valLAST_EFFECTIVE_DATE = index[1]+"/"+index[2]+"/"+index[0];
							Object__Employee__OtherCoverage__LastEffectiveDate___DMS_EMPLOYEE_OTHER_COVERAGE____LAST_EFFECTIVE_DATE.text = valLAST_EFFECTIVE_DATE;*/
						}
						else if(nameElement=="Object__Employee__OtherCoverage__PolicyEndDate" and  valueElement!= "0000-00-00" and  valueElement != null){

							var valuePolicyEnd_DATE = valueElement;
							var index = valuePolicyEnd_DATE.split("-");
							Object__Employee__OtherCoverage__PolicyEndDate__Month.text = index[1];
							Object__Employee__OtherCoverage__PolicyEndDate__Date.text = index[2];
							Object__Employee__OtherCoverage__PolicyEndDate__Year.text = index[0];
							
							/*var valuePOLICY_END_DATE = valueElement;
							var index = valuePOLICY_END_DATE.split("-");
							var valPOLICY_END_DATE = index[1]+"/"+index[2]+"/"+index[0];
							Object__Employee__OtherCoverage__PolicyEndDate___DMS_EMPLOYEE_OTHER_COVERAGE____POLICY_END_DATE.text = valPOLICY_END_DATE;*/
						}
						else if(nameElement=="Object__Employee__OtherCoverage__InsuranceCarrierName" and valueElement != null){
							Object__Employee__OtherCoverage__InsuranceCarrierName___DMS_EMPLOYEE_OTHER_COVERAGE____INSURANCE_CARRIER_NAME.text = valueElement;
						}
					}
				}
			}			
		}
	}	
}


/*Retrieving method for retrieve attributes data in Policy Holder Tab*/
 retrieveData = function(){
	 
	var subApplChildNode = global_employee_XML.firstChild.firstChild.childNodes;				
	for(j = 0;j<global_employee_XML.firstChild.childNodes.length;j++){
		for(i=0;i<global_employee_XML.firstChild.childNodes[j].childNodes.length;i++){
			var nameElement:String = global_employee_XML.firstChild.childNodes[j].childNodes[i].firstChild.firstChild.nodeValue;
			var valueElement:String = global_employee_XML.firstChild.childNodes[j].childNodes[i].lastChild.lastChild.nodeValue;
	
			if(nameElement == "Object__Employee__PolicyHolder__LastName" and valueElement != null){
				Object__Employee__PolicyHolder__LastName___DMS_EMPLOYEE____LNAME.text = String(valueElement);
			}
			else if(nameElement == "Object__Employee__PolicyHolder__FirstName" and valueElement != null){
				Object__Employee__PolicyHolder__FirstName___DMS_EMPLOYEE____FNAME.text = valueElement;
			}
			else if(nameElement =="Object__Employee__PolicyHolder__MI" and valueElement != null){
				Object__Employee__PolicyHolder__MI___DMS_EMPLOYEE____MNAME.text = valueElement;				
			}
			else if(nameElement =="Object__Employee__PolicyHolder__SSN" and valueElement != null){
				var spouseSSNOne   = valueElement.substr(0,3);
				var spouseSSNTwo   = valueElement.substr(3,2);
				var spouseSSNThree = valueElement.substr(5,4);
				Object__Employee__PolicyHolder__SSNOne.text = spouseSSNOne;
				Object__Employee__PolicyHolder__SSNTwo.text = spouseSSNTwo;
				Object__Employee__PolicyHolder__SSNThree.text = spouseSSNThree;
			}
			else if(nameElement =="Object__Employee__PolicyHolder__DateOfBirth" and valueElement != null and valueElement!="0000-00-00"){
				var valueEMPLOYEE_DOB = valueElement;
				var index = valueEMPLOYEE_DOB.split("-");
				Object__Employee__PolicyHolder__month.text = index[1];
				Object__Employee__PolicyHolder__date.text = index[2];
				Object__Employee__PolicyHolder__year.text = index[0];
//				var valEMPLOYEE_DOB = index[1]+"/"+index[2]+"/"+index[0];
				//Object__Employee__PolicyHolder__DateOfBirth___DMS_EMPLOYEE____DOB.text = valEMPLOYEE_DOB;			
			}
			else if(nameElement =="Object__Employee__PolicyHolder__Gender" and valueElement != null){
				Object__Employee__PolicyHolder__Gender___DMS_EMPLOYEE____GENDER.setValue(valueElement);			
			}
			else if(nameElement =="Object__Employee__PolicyHolder__EmployementStatus" and valueElement != null){
				Object__Employee__PolicyHolder__EmployementStatus___DMS_EMPLOYEE____EMPLOYMENT_STATUS.setValue(valueElement);			
			}
			else if(nameElement =="Object__Employee__PolicyHolder__DateOfHire" and valueElement != null and valueElement!="0000-00-00"){
				var valueEMPLOYEE_HIRE_DATE = valueElement;
				var index = valueEMPLOYEE_HIRE_DATE.split("-");
				Object__Employee__PolicyHolder__DateOfHireMonth.text=index[1];
				Object__Employee__PolicyHolder__DateOfHireDate.text=index[2];
				Object__Employee__PolicyHolder__DateOfHireYear.text=index[0];
				/*var valEMPLOYEE_HIRE_DATE = index[1]+"/"+index[2]+"/"+index[0];
				Object__Employee__PolicyHolder__DateOfHire___DMS_EMPLOYEE____HIRE_DATE.text = valEMPLOYEE_HIRE_DATE;*/			
			}
			else if(nameElement =="Object__Employee__PolicyHolder__ExpirationDate" and valueElement != null and valueElement!="0000-00-00"){
				var valueTERMINATION_DATE = valueElement;
				var index = valueTERMINATION_DATE.split("-");
				Object__Employee__PolicyHolder__ExpirationMonth.text=index[1];
				Object__Employee__PolicyHolder__ExpirationDate.text=index[2];
				Object__Employee__PolicyHolder__ExpirationYear.text=index[0];
				/*var valTERMINATION_DATE = index[1]+"/"+index[2]+"/"+index[0];
				Object__Employee__PolicyHolder__ExpirationDate___DMS_EMPLOYEE____TERMINATION_DATE.text = valTERMINATION_DATE;*/			
			}
			else if(nameElement =="Object__Employee__PolicyHolder__MaritalStatus" and valueElement != null){
				Object__Employee__PolicyHolder__MaritalStatus___DMS_EMPLOYEE____MARITAL_STATUS.setValue(valueElement);			
			}
			else if(nameElement =="Object__Employee__PolicyHolder__MarriedDate" and valueElement != null and valueElement!="0000-00-00"){
				var valueEffectiveDate = valueElement;
				var index = valueEffectiveDate.split("-");
				Object__Employee__PolicyHolder__MarriedMonth.text=index[1];
				Object__Employee__PolicyHolder__MarriedDate.text=index[2];
				Object__Employee__PolicyHolder__MarriedYear.text=index[0];
				/*var valEffextiveDate = index[1]+"/"+index[2]+"/"+index[0];
				Object__Employee__PolicyHolder__MarriedDate___DMS_EMPLOYEE____MARRIED_DATE.text = valEffextiveDate;	*/		
			}
			else if(nameElement =="Object__Employee__PolicyHolder__JobTitle" and valueElement != null){
				Object__Employee__PolicyHolder__JobTitle___DMS_EMPLOYEE____JOB_TITLE.text = valueElement;			
			}
			else if(nameElement =="Object__Employee__PolicyHolder__DepartmentNumber" and valueElement != null){
				Object__Employee__PolicyHolder__DepartmentNumber___DMS_EMPLOYEE____DEPT.text = valueElement;			
			}
			else if(nameElement =="Object__Employee__PolicyHolder__City" and valueElement != null){
				Object__Employee__PolicyHolder__City___DMS_EMPLOYEE____CITY.text = valueElement;			
			}
			else if(nameElement =="Object__Employee__PolicyHolder__State" and valueElement != null){
				retreiveSateLabel(valueElement,stateArray,"Object__Employee__PolicyHolder__State___DMS_EMPLOYEE____STATE");
			}
			else if(nameElement =="Object__Employee__PolicyHolder__Zipcode" and valueElement != null){
				Object__Employee__PolicyHolder__Zipcode___DMS_EMPLOYEE____ZIP.text = valueElement;			
			}
			else if(nameElement =="Object__Employee__PolicyHolder__EmailAddress" and valueElement != null){
				Object__Employee__PolicyHolder__EmailAddress___DMS_EMPLOYEE____EMAIL_ADDRESS1.text = valueElement;			
			}
			else if(nameElement =="Object__Employee__PolicyHolder__HomePhoneNumber" and valueElement != null){
				var phoneAreaCode = valueElement.substr(0,3);
				var addressCode   = valueElement.substr(3,2);
				var homePhoneNumber = valueElement.substr(5,4);
				Object__Employee__PolicyHolder__PhoneAreaCode.text = phoneAreaCode;
				Object__Employee__PolicyHolder__AddressCode.text = addressCode;
				Object__Employee__PolicyHolder__HomeNumber.text = homePhoneNumber;
			}
			else if(nameElement =="Object__Employee__PolicyHolder__PrimaryCarePhysicam" and valueElement != null){
				Object__Employee__PolicyHolder__PrimaryCarePhysicam___DMS_EMPLOYEE____PRIMARY_CARE_PHYSICAN.text = valueElement;			
			}
			else if(nameElement =="Object__Employee__PolicyHolder__HomeAddress" and valueElement != null){
				Object__Employee__PolicyHolder__HomeAddress___DMS_EMPLOYEE____HOME_ADDRESS.text = valueElement;			
			}
		}
	}
};

/*Retrieving method for retrieve attributes data in Fort Dearborn Tab*/
retrieveFortDearBornData = function(){
	for(j = 0;j<global_employee_XML.firstChild.childNodes.length;j++){
		var subApplicationName = global_employee_XML.firstChild.childNodes[j].attributes.Name;		
		if(subApplicationName=="Dearborn") {				
			for(i=0;i<global_employee_XML.firstChild.childNodes[j].childNodes.length;i++){
				var nameElement:String = global_employee_XML.firstChild.childNodes[j].childNodes[i].firstChild.firstChild.nodeValue;
				var valueElement:String = global_employee_XML.firstChild.childNodes[j].childNodes[i].lastChild.lastChild.nodeValue;
				//trace(nameElement +" :: "+valueElement);
				if(nameElement == "Object__Employee__DearBorn__OptionalLifeAmount" and valueElement != null){				
					Object__Employee__DearBorn__OptionalLifeAmount___DMS_EMPLOYEE_DEARBORN____OPTIONAL_LIFE_AMOUNT.text = valueElement;						
				}
				else if(nameElement == "Object__Employee__DearBorn__BasicLifeADD" and valueElement != null){
						Object__Employee__DearBorn__BasicLifeADD___DMS_EMPLOYEE_DEARBORN____BASIC_LIFE_ADD.selected = true;
				}
				else if(nameElement == "Object__Employee__DearBorn__OptionalLife" and valueElement != null){
						Object__Employee__DearBorn__OptionalLife___DMS_EMPLOYEE_DEARBORN____OPTIONAL_LIFE.selected = true;
						Object__Employee__DearBorn__OptionalLifeAmount___DMS_EMPLOYEE_DEARBORN____OPTIONAL_LIFE_AMOUNT.enabled = true;
				}
				else if(nameElement == "Object__Employee__DearBorn__DependentLife" and valueElement != null){
						Object__Employee__DearBorn__DependentLife___DMS_EMPLOYEE_DEARBORN____DEPENDENT_LIFE.selected = true;
				}
				else if(nameElement == "Object__Employee__DearBorn__LongTermDisability" and valueElement != null){
						Object__Employee__DearBorn__LongTermDisability___DMS_EMPLOYEE_DEARBORN____LONG_TERM_DISABLITY.selected = true;
				}
				else if(nameElement == "Object__Employee__DearBorn__ShortTermDisablity" and valueElement != null){
						Object__Employee__DearBorn__ShortTermDisablity___DMS_EMPLOYEE_DEARBORN____SHORT_TERM_DISABLITY.selected = true;
				}
				else if(nameElement == "Object__Employee__DearBorn__Class" and valueElement != null){
					Object__Employee__DearBorn__Class___DMS_EMPLOYEE_DEARBORN____CLASS.text = valueElement;
				}
				else if(nameElement == "Object__Employee__DearBorn__AnnualSalary" and valueElement != null){
					Object__Employee__DearBorn__AnnualSalary___DMS_EMPLOYEE_DEARBORN____ANNUAL_SALARY.text = valueElement;
				}
				else if(nameElement == "Object__Employee__DearBorn__PrimaryLastName" and valueElement != null){
					Object__Employee__DearBorn__PrimaryLastName___DMS_EMPLOYEE_DEARBORN____PRIMARY_LAST_NAME.text = valueElement;
				}
				else if(nameElement == "Object__Employee__DearBorn__PrimaryFirstName" and valueElement != null){
					Object__Employee__DearBorn__PrimaryFirstName___DMS_EMPLOYEE_DEARBORN____PRIMARY_FIRST_NAME.text = valueElement;
				}
				else if(nameElement == "Object__Employee__DearBorn__PrimaryDOB" and valueElement != null and valueElement!="0000-00-00"){
					var valuePRIMARY_DOB = valueElement;
					var index = valuePRIMARY_DOB.split("-");
					Object__Employee__DearBorn__PrimaryDOBMonth.text = index[1];
					Object__Employee__DearBorn__PrimaryDOBDate.text = index[2];
					Object__Employee__DearBorn__PrimaryDOBYear.text = index[0];					
					/*var valPRIMARY_DOB = index[1]+"/"+index[2]+"/"+index[0];
					Object__Employee__DearBorn__PrimaryDOB___DMS_EMPLOYEE_DEARBORN____PRIMARY_DOB.text = valPRIMARY_DOB;*/
				}
				else if(nameElement == "Object__Employee__DearBorn__PrimaryRelationship" and valueElement != null){
					Object__Employee__DearBorn__PrimaryRelationship___DMS_EMPLOYEE_DEARBORN____PRIMARY_RELATIONSHIP.text = valueElement;
				}
				else if(nameElement == "Object__Employee__DearBorn__PrimaryBenefitSplit" and valueElement != null){
					Object__Employee__DearBorn__PrimaryBenefitSplit___DMS_EMPLOYEE_DEARBORN____PRIMARY_BENEFIT_SPLIT.text = valueElement;
				}
				else if(nameElement == "Object__Employee__DearBorn__SecondaryLastName" and valueElement != null){
					Object__Employee__DearBorn__SecondaryLastName___DMS_EMPLOYEE_DEARBORN____SECONDARY_LAST_NAME.text = valueElement;
				}
				else if(nameElement == "Object__Employee__DearBorn__SecondaryFirstName" and valueElement != null){
					Object__Employee__DearBorn__SecondaryFirstName___DMS_EMPLOYEE_DEARBORN____SECONDARY_FIRST_NAME.text = valueElement;
				}
				else if(nameElement == "Object__Employee__DearBorn__SecondaryDOB" and valueElement != null and valueElement!="0000-00-00"){
					var valueSECONDARY_DOB = valueElement;
					var index = valueSECONDARY_DOB.split("-");
					Object__Employee__DearBorn__SecondaryDOBMonth.text = index[1];
					Object__Employee__DearBorn__SecondaryDOBDate.text = index[2];
					Object__Employee__DearBorn__SecondaryDOBYear.text = index[0];
					/*var valSECONDARY_DOB = index[1]+"/"+index[2]+"/"+index[0];
					Object__Employee__DearBorn__SecondaryDOB___DMS_EMPLOYEE_DEARBORN____SECONDARY_DOB.text = valSECONDARY_DOB;*/
				}
				else if(nameElement == "Object__Employee__DearBorn__SecondaryRelationship" and valueElement != null){
					Object__Employee__DearBorn__SecondaryRelationship___DMS_EMPLOYEE_DEARBORN____SECONDARY_RELATIONSHIP.text = valueElement;
				}
				
				else if(nameElement == "Object__Employee__DearBorn__SecondaryBenefitSplit" and valueElement != null){
					Object__Employee__DearBorn__SecondaryBenefitSplit___DMS_EMPLOYEE_DEARBORN____SECONDARY_BENEFIT_SPLIT.text = valueElement;
				}
				else if(nameElement == "Object__Employee__DearBorn__PlanOption" and valueElement != null){
					Object__Employee__DearBorn__PlanOption___DMS_EMPLOYEE_DEARBORN____PLAN_OPTION.setValue(valueElement);
				}
				else if(nameElement == "Object__Customer__CustomerName" and valueElement != null){
					Object_Customer_ActionRequested_groupCompanyName.text = valueElement;
				}
			}
		}
	}
};

retrieveAboutNeedsData = function(){
	for(j = 0;j<global_employee_XML_Extended.firstChild.childNodes.length;j++){
		for(i=0;i<global_employee_XML_Extended.firstChild.childNodes[j].childNodes.length;i++){
			var nameElement:String = global_employee_XML_Extended.firstChild.childNodes[j].childNodes[i].firstChild.firstChild.nodeValue;
			var valueElement:String = global_employee_XML_Extended.firstChild.childNodes[j].childNodes[i].lastChild.lastChild.nodeValue;
	
			if(nameElement == "Object__Employee__AboutNeeds__HearingImpaired" and valueElement != null){
				Object__Employee__AboutNeeds__HearingImpaired___DMS_EMPLOYEE_OTHER_NEEDS____HEARING_IMPAIRED.setValue(valueElement);
			}
			else if(nameElement == "Object__Employee__AboutNeeds__VisionImpaired" and valueElement != null){
				Object__Employee__AboutNeeds__VisionImpaired___DMS_EMPLOYEE_OTHER_NEEDS____VISION_IMPAIRED.setValue(valueElement);
			}
			else if(nameElement == "Object__Employee__AboutNeeds__IsOtherPrimaryLanguage" and valueElement != null){
				Object__Employee__AboutNeeds__IsOtherPrimaryLanguage___DMS_EMPLOYEE_OTHER_NEEDS____ISOTHER_PRIMARY_LANGUAGE.setValue(valueElement);
			}
			else if(nameElement == "Object__Employee__AboutNeeds__OtherPrimaryLanguage" and valueElement != null){
				Object__Employee__AboutNeeds__OtherPrimaryLanguage___DMS_EMPLOYEE_OTHER_NEEDS____OTHER_PRIMARY_LANGUAGE.text = valueElement;
			}
			else if(nameElement == "Object__Employee__AboutNeeds__IsOtherCulturalNeed" and valueElement != null){
				Object__Employee__AboutNeeds__IsOtherCulturalNeed___DMS_EMPLOYEE_OTHER_NEEDS____ISOTHER_CULTURAL_NEED.setValue(valueElement);
			}
			else if(nameElement == "Object__Employee__AboutNeeds__OtherCulturalNeed" and valueElement != null){
				Object__Employee__AboutNeeds__OtherCulturalNeed___DMS_EMPLOYEE_OTHER_NEEDS____OTHER_CULTURAL_NEED.text = valueElement;
			}
			else if(nameElement == "Object__Customer__CustomerName" and valueElement != null){
				Object_Customer_ActionRequested_groupCompanyName.text = valueElement;
			}
		}
	}
};

var covDepPKeyArr:Array = new Array();
retreiveCoveredDependents = function(){
	var employee_OtherCovXML1:XML = new XML();
	var subApplicationName :String;
	nameElementArray = new Array();
	valuElementArray = new Array();
	var myDP_array:Array = new Array({});
	
	employee_OtherCovXML1.load("xmlTest.xml");
	
	employee_OtherCovXML1.ignoreWhite = true;
	employee_OtherCovXML1.onLoad = function(success:Boolean){
		if(true){
			getCoveredDeptValuefromXML(global_employee_XML,true);			
		}
	};
};
getCoveredDeptValuefromXML = function(employee_OtherCovXML:XML,isNeedNormalFormRetrieve:Boolean){
	var subApplicationName :String;	
	var myDP_array:Array = new Array();
	var attributeChildNode = employee_OtherCovXML.firstChild.firstChild.firstChild.childNodes;
	var val;	
	var subApplChildNode = employee_OtherCovXML.firstChild.firstChild.childNodes;
	trace("XML length:"+employee_OtherCovXML.firstChild.childNodes.length);
	for(parentIndex = 0;parentIndex < employee_OtherCovXML.firstChild.childNodes.length;parentIndex++){
		nameElementArray = new Array();
		valuElementArray = new Array();
		subApplicationName = employee_OtherCovXML.firstChild.childNodes[parentIndex].attributes.Name;
		trace("subApplicationName::"+subApplicationName);
		trace("nameElement:"+nameElement);
		if(subApplicationName == "Dependent"){
			var repeatNameElement:String;
			var repeatValueElement:String;
			var count:Number = 0;
			var noOfRows:Number = 0;		
			for(childIndex=0;childIndex < employee_OtherCovXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
				trace(childIndex);
				repeatNameElement = employee_OtherCovXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				trace("repeatedEle:"+repeatNameElement);
				repeatValueElement= employee_OtherCovXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
				trace("repeatedValue:"+repeatValueElement);
				nameElementArray[childIndex] = repeatNameElement;
				valuElementArray[childIndex] = repeatValueElement;
				count = count + 1;
				trace("Count:"+count);
			}
			// to iterate the attribute name index and retrieve the attribute name and order the values correctly based on the columns.
			trace("nameElementArray.length::"+nameElementArray.length);//ok
			var colCount:Number = 0;
			var relationShip:String="Child";
			var firstNameValue:String = " "; var lastNameValue:String = " "; var ssnValue:String = " ";
			var dobValue:String; var genderValue:String="M"; var primaryCareValue:String = " ";
			var pKeyIndxCovDep = 0;
			for(attArrIndx:Number = 0; attArrIndx < nameElementArray.length; attArrIndx++){			
				trace("nameElementArray["+[attArrIndx]+"]==>"+nameElementArray[attArrIndx]);
				trace("ValuElementArray["+[attArrIndx]+"]==>"+valuElementArray[attArrIndx]);
				// check for the column name in the attribute, If avail then set the value in the variable.
				if(nameElementArray[attArrIndx].indexOf("Object__Employee__CoverageDept__Relationship")!=-1) {					
					relationShip = valuElementArray[attArrIndx];
					if(relationShip==""|| relationShip == undefined || relationShip=="undefined") {						
						relationShip="Child";
					}				
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Employee__CoverageDept__FirstName")!=-1 && valuElementArray[attArrIndx]!= undefined){
					firstNameValue = valuElementArray[attArrIndx];
					trace("firstNameValue::+"+firstNameValue);
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Employee__CoverageDept__LastName")!=-1 && valuElementArray[attArrIndx]!= undefined){
					trace("2 if");
					lastNameValue = valuElementArray[attArrIndx]; 
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Employee__CoverageDept__SSN")!=-1 && valuElementArray[attArrIndx]!= undefined){
 					ssnValue = valuElementArray[attArrIndx];
					if(ssnValue!=undefined){
						ssnValue1 = ssnValue.substr(0,3);
						ssnValue2 = ssnValue.substr(3,2);
						ssnValue3 = ssnValue.substr(5,4);
					}
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Employee__CoverageDept__DOB")!=-1 && valuElementArray[attArrIndx]!= undefined){
					dobValue = valuElementArray[attArrIndx];
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Employee__CoverageDept__Gender")!=-1 && valuElementArray[attArrIndx]!= undefined){
					genderValue = valuElementArray[attArrIndx];					
					if(genderValue==""|| genderValue == undefined || genderValue=="undefined") {						
						genderValue="M";
					}
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Employee__CoverageDept__PrimaryCarePhysican")!=-1 && valuElementArray[attArrIndx]!= undefined){
					primaryCareValue = valuElementArray[attArrIndx];
				}
				colCount++;
			
				// if the colcount is the multiples of the number of columns, then push the array with values.
				trace("ColCount:"+colCount);
				if(colCount % 7 ==0){
					trace("befroe push");
					myDP_array.push({Relationship:relationShip, FirstName:firstNameValue, LastName:lastNameValue,SocialSecurity:ssnValue,DateofBirth:dobValue,Gender:genderValue,Primarycare:primaryCareValue});
					
					var keyStrCovDep = nameElementArray[attArrIndx];
					trace("keyStrCovDep:<>"+keyStrCovDep);
					covDepPKeyArr[pKeyIndxCovDep++] = keyStrCovDep.substr(keyStrCovDep.indexOf("_____")+5,keyStrCovDep.length);
					trace("validAPKeyArr:"+covDepPKeyArr);
					getCoveredDependentPKey = function(){
						trace("getCoveredDependentPKey return entered");
						return covDepPKeyArr;
					}			
					firstNameValue=" ";lastNameValue=" ";ssnValue=" ";dobValue=" ";genderValue=" ";primaryCareValue=" ";
				 }				 
			}			
			if(myDP_array.length==0 || myDP_array.length == undefined || myDP_array.length <0){
				myDP_array = new Array({Relationship:"Default",FirstName:" ", LastName:" ",SocialSecurity:" ",DateofBirth:" ",Gender:"M",Primarycare:" "});
				
			}
			else{
				myDP_array.push({Relationship:"Default",FirstName:" ", LastName:" ",SocialSecurity:" ",DateofBirth:" ",Gender:"M",Primarycare:" "});
			}
			coveredDepend_dataGrid.dataProvider = myDP_array;				
			
		}
		if(subApplicationName == "Policy")  {
			for(childIndex=0;childIndex < employee_OtherCovXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
			    var nameElement = employee_OtherCovXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				var valueElement= employee_OtherCovXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
				
				if(nameElement == "Object__Employee__PolicyHolder__Gender" and valueElement != null){
					if(valueElement=="M") {
						Object__Employee__CoverageDept__Spouse__Gender___DMS_EMPLOYEE_COVERED_SPOUSE____GENDER.setValue("F");
					} else {
						Object__Employee__CoverageDept__Spouse__Gender___DMS_EMPLOYEE_COVERED_SPOUSE____GENDER.setValue("M");
					}
					
				}
				
			}
		}
		
		if(isNeedNormalFormRetrieve){
			if(subApplicationName == "Spouse Details"){
				for(childIndex=0;childIndex < employee_OtherCovXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
					var nameElement = employee_OtherCovXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					var valueElement= employee_OtherCovXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
					if(nameElement == "Object__Employee__CoverageDept__Spouse__Spouse" and valueElement != null){
						Object__Employee__CoverageDept__Spouse__Spouse___DMS_EMPLOYEE_COVERED_SPOUSE____SPOUSE.selected = true;
						if(employeeApplicationStatus !="E_SUBMITTED") {							
							Object__Employee__CoverageDept__Spouse__FName___DMS_EMPLOYEE_COVERED_SPOUSE____FIRST_NAME.enabled = true;
							Object__Employee__CoverageDept__Spouse__LName___DMS_EMPLOYEE_COVERED_SPOUSE____LAST_NAME.enabled = true;
							Object__Employee__CoverageDept__Spouse__SSNOne.enabled = true;
							Object__Employee__CoverageDept__Spouse__SSNTwo.enabled = true;
							Object__Employee__CoverageDept__Spouse__SSNThree.enabled = true;
							Object__Employee__CoverageDept__Spouse__PrimaryCarePhysican___DMS_EMPLOYEE_COVERED_SPOUSE____PRIMARY_CARE_PHYSICIAN.enabled = true;					
							Object__Employee__CoverageDept__Spouse__Month.enabled = true;
							Object__Employee__CoverageDept__Spouse__Date.enabled = true;
							Object__Employee__CoverageDept__Spouse__Year.enabled = true;
						}
					}
					else if(nameElement == "Object__Employee__CoverageDept__Spouse__FName" and valueElement != null){
						Object__Employee__CoverageDept__Spouse__FName___DMS_EMPLOYEE_COVERED_SPOUSE____FIRST_NAME.text = valueElement;
					}
					else if(nameElement == "Object__Employee__CoverageDept__Spouse__LName" and valueElement != null){
						Object__Employee__CoverageDept__Spouse__LName___DMS_EMPLOYEE_COVERED_SPOUSE____LAST_NAME.text = valueElement;
					}
					else if(nameElement == "Object__Employee__CoverageDept__Spouse__SSN" and valueElement != null){
						var spouseSSNOne   = valueElement.substr(0,3);
						var spouseSSNTwo   = valueElement.substr(3,2);
						var spouseSSNThree = valueElement.substr(5,4);
						Object__Employee__CoverageDept__Spouse__SSNOne.text = spouseSSNOne;
						Object__Employee__CoverageDept__Spouse__SSNTwo.text = spouseSSNTwo;
						Object__Employee__CoverageDept__Spouse__SSNThree.text = spouseSSNThree;
					}
					else if(nameElement == "Object__Employee__CoverageDept__Spouse__PrimaryCarePhysican" and valueElement != null){
						Object__Employee__CoverageDept__Spouse__PrimaryCarePhysican___DMS_EMPLOYEE_COVERED_SPOUSE____PRIMARY_CARE_PHYSICIAN.text = valueElement;
					}				
					else if(nameElement == "Object__Employee__CoverageDept__Spouse__DateOfBirth" and valueElement != null and valueElement!="0000-00-00"){
						var valueSpouse_DATE = valueElement;
						var index = valueSpouse_DATE.split("-");
						Object__Employee__CoverageDept__Spouse__Month.text = index[1];
						Object__Employee__CoverageDept__Spouse__Date.text = index[2];
						Object__Employee__CoverageDept__Spouse__Year.text = index[0];
						/*var valSpouse_DATE = index[1]+"/"+index[2]+"/"+index[0];
						Object__Employee__CoverageDept__Spouse__DateOfBirth___DMS_EMPLOYEE_COVERED_SPOUSE____DATE_OF_BIRTH.text = valSpouse_DATE;*/
					}
				}
			}
		}
	}	
	retreiveCoveredDependentsSpouseDetail();
}

retreiveCoveredDependentsSpouseDetail = function(){	
	var subApplicationName:String;
	var lNameSelf:String="";
	var fNameSelf:String="";
	var subApplChildNode = global_employee_XML_Extended.firstChild.firstChild.childNodes;		
	for(parentIndex = 0;parentIndex<global_employee_XML_Extended.firstChild.childNodes.length;parentIndex++){
		subApplicationName = global_employee_XML_Extended.firstChild.childNodes[parentIndex].attributes.Name;
		if(subApplicationName == "Waiver1")  {
			for(childIndex=0;childIndex<global_employee_XML_Extended.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){				
				var nameElement:String  = global_employee_XML_Extended.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				var valueElement:String = global_employee_XML_Extended.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;

				if(nameElement == "Object__Employee__InsWaiver__SpouseSSN" and valueElement != null){					
					if(Object__Employee__CoverageDept__Spouse__SSNOne.text.length==0 && Object__Employee__CoverageDept__Spouse__SSNTwo.text.length==0 && Object__Employee__CoverageDept__Spouse__SSNThree.text.length==0){						
						var spouseSSNOne   = valueElement.substr(0,3);
						var spouseSSNTwo   = valueElement.substr(3,2);
						var spouseSSNThree = valueElement.substr(5,4);
						Object__Employee__CoverageDept__Spouse__SSNOne.text = spouseSSNOne;
						Object__Employee__CoverageDept__Spouse__SSNTwo.text = spouseSSNTwo;
						Object__Employee__CoverageDept__Spouse__SSNThree.text = spouseSSNThree;
					}
				}	
			}
		}
	}
}

var lNameSelf:String;
var fNameSelf:String;
var lNameSpouse:String;
var fNameSpouse:String;
var medDepPKeyArr:Array = new Array();
var medExplPKeyArr:Array = new Array();
var dependentNameArray:Array = new Array();

var MedQTreatedBeforePKey:Number;
var MedQHospitalizedBeforePKey:Number;
var MedQOperationAdvisedPKey:Number;
var MedQCurrentMedicationPKey:Number;

retrieveMedicalQuestionnaireData = function(){
	var medHealthRelationXML:XML = new XML();
	var medHealthXML1:XML = new XML();
	var subApplicationName :String;
	nameElementArray = new Array();
	valuElementArray = new Array();
	var myDP_array:Array = new Array();
	var explDP_array:Array = new Array();

	medHealthRelationXML.load("TestXML.xml");
	medHealthXML1.load("TestXML.xml");
	medHealthRelationXML.ignoreWhite = true;
	medHealthRelationXML.onLoad = function(success:Boolean){
		if(true){
			getSelfValuefromXML(global_employee_XML);		
		}
	};

	medHealthXML1.ignoreWhite = true;
		medHealthXML1.onLoad = function(success:Boolean){
		if(true){
			getMedExplValuefromXML(global_employee_XML_Extended,true);		
		}
	};
};

var popupEnrollName:Array;
getSelfValuefromXML = function(relationXML:XML){
	popupEnrollName = new Array();
	var enrollCount:Number = 0;
	var subApplicationName :String;
	var NameElement:String;
	var ValueElement:String;
	var Nameelement:String;
	var Valueelement:String;
	var attributeChildNode = relationXML.firstChild.firstChild.firstChild.childNodes;
	var subApplChildNode = relationXML.firstChild.firstChild.childNodes;		
	for(parentIndex = 0;parentIndex<relationXML.firstChild.childNodes.length;parentIndex++){
		subApplicationName = relationXML.firstChild.childNodes[parentIndex].attributes.Name;
		if(subApplicationName == "Policy")  {
			var lNameSelf:String="";
			var fNameSelf:String="";
			var fullNameSelf:String="";
			for(childIndex=0;childIndex<relationXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
				NameElement  = relationXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				ValueElement = relationXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
				if(NameElement == "Object__Employee__PolicyHolder__LastName" and ValueElement != null){
					lNameSelf = ValueElement;
					if(fNameSelf!="" and fNameSelf!=undefined and fNameSelf!="undefined"){
						fullNameSelf = lNameSelf+" "+fNameSelf;
					}else{
						fullNameSelf = lNameSelf;
					}										
					Object__Employee__MedicalQuestion__NameSelf___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____SELF_NAME.text = fullNameSelf;
				}
				else if(NameElement == "Object__Employee__PolicyHolder__FirstName" and ValueElement != null){
					fNameSelf = ValueElement;
					if(lNameSelf!="" and lNameSelf!=undefined and lNameSelf!="undefined"){
						fullNameSelf = lNameSelf+" "+fNameSelf;	
					}else{
						fullNameSelf=fNameSelf;
					}									
					Object__Employee__MedicalQuestion__NameSelf___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____SELF_NAME.text = fullNameSelf;										
				}
			}
			popupEnrollName[enrollCount] = lNameSelf+fNameSelf;
		}
	}
	for(parentIndex = 0;parentIndex<relationXML.firstChild.childNodes.length;parentIndex++){
		subApplicationName = relationXML.firstChild.childNodes[parentIndex].attributes.Name;
		if(subApplicationName == "Spouse Details")  {
			var fNameSpouse:String="";
			var lNameSpouse:String="";
			var fullname:String="";
			for(childIndex=0;childIndex<relationXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
				Nameelement  = relationXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				Valueelement = relationXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
				if(Nameelement == "Object__Employee__CoverageDept__Spouse__FName"  and Valueelement != null){
					fNameSpouse = Valueelement;
					if(lNameSpouse!="" and lNameSpouse!="undefined" and lNameSpouse!=undefined){
						fullname=lNameSpouse+" "+fNameSpouse;	
					}else{
						fullname=fNameSpouse;	
					}					
					Object__Employee__MedicalQuestion__NameSpouse___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____SPOUSE_NAME.text = fullname;
				}else if(Nameelement == "Object__Employee__CoverageDept__Spouse__LName" and Valueelement != null){
					lNameSpouse = Valueelement;
					if(fNameSpouse!="" and fNameSpouse!="undefined" and fNameSpouse!=undefined){
						fullname = lNameSpouse+" "+fNameSpouse;
					}else{						
						fullname = lNameSpouse;
					}
					Object__Employee__MedicalQuestion__NameSpouse___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____SPOUSE_NAME.text = fullname;
				}
			}
			if(fullname!=""){
				popupEnrollName[++enrollCount] = fullname;
			}
		}
		// If condition to check the subAppl.name is 'Dependent' to populate the dependent name in the datagrid.
		if(subApplicationName == "Dependent"){
			trace("Inside Dependent If");
			//dependentNameArray = new Array();
			covDeptKeyElementArray = new Array();
			covDeptValuElementArray = new Array();
			fNameValueArray = new Array();
			dataprovider_MedHealthDependent = new Array();
			
			lNameValueArray = new Array();var keyIndx:Number = 0;var valIndx:Number=0;
			for(childIndex=0;childIndex < relationXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
				covDeptKeyElementArray[childIndex] = relationXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				covDeptValuElementArray[childIndex] = relationXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;									
			}
			for(attArrIndx:Number = 0; attArrIndx < covDeptKeyElementArray.length; attArrIndx++){				
				if(covDeptKeyElementArray[attArrIndx].indexOf("Object__Employee__CoverageDept__FirstName")!=-1){
					if(covDeptValuElementArray[attArrIndx]!=undefined){
						fNameValueArray[keyIndx++] = covDeptValuElementArray[attArrIndx];      
					}else{
					 	fNameValueArray[keyIndx++] = "";
					}					
				}
				if(covDeptKeyElementArray[attArrIndx].indexOf("Object__Employee__CoverageDept__LastName")!=-1){
					if(covDeptValuElementArray[attArrIndx]!=undefined){
					  	lNameValueArray[valIndx++] = covDeptValuElementArray[attArrIndx];
					}else{
					 	 lNameValueArray[valIndx++] = "";
					}					
				}				
			}
			for(namArrIndx=0;namArrIndx<fNameValueArray.length;namArrIndx++){
				dependentNameArray[namArrIndx] = lNameValueArray[namArrIndx]+" "+fNameValueArray[namArrIndx];
				if(dependentNameArray[namArrIndx]!=""){
					popupEnrollName[++enrollCount] = dependentNameArray[namArrIndx];
				}
			}
		}
	}
}

getMedExplValuefromXML = function(medHealthXML:XML,isNeedNormalFormRetrieve:Boolean){
	var subApplicationName :String;
	nameElementArray = new Array();
	valuElementArray = new Array();
	var myDP_array:Array = new Array();
	var explDP_array:Array = new Array();
	keyQuestionArr = new Array();
	var attributeChildNode = medHealthXML.firstChild.firstChild.firstChild.childNodes;
	var val;
	var subApplChildNode = medHealthXML.firstChild.firstChild.childNodes;
	for(j = 0;j<medHealthXML.firstChild.childNodes.length;j++){
		subApplicationName = medHealthXML.firstChild.childNodes[j].attributes.Name;
		if(subApplicationName == "HealthQ's"){
			var repeatNameElement:String;
			var repeatValueElement:String;
			var count:Number = 0;
			var noOfRows:Number = 0;
			for(childIndex=0;childIndex < medHealthXML.firstChild.childNodes[j].childNodes.length;childIndex++){
				repeatNameElement = medHealthXML.firstChild.childNodes[j].childNodes[childIndex].firstChild.firstChild.nodeValue;
				repeatValueElement= medHealthXML.firstChild.childNodes[j].childNodes[childIndex].lastChild.lastChild.nodeValue;
				nameElementArray[childIndex] = repeatNameElement;
				valuElementArray[childIndex] = repeatValueElement;									
				count = count + 1;
			}
			// to iterate the attribute name index and retrieve the attribute name and order the values correctly based on the columns.
			// star
			var colCount:Number = 0;
				var nameValue:String = ""; var heightValue:String; var weightValue:String;
				var smokerValue:String="Yes";
			var pKeyIndxMedicalQ:Number = 0;
			var nameCount:Number = 0;
			for(attArrIndx:Number = 0; attArrIndx < nameElementArray.length; attArrIndx++){
				
				// check for the column name in the attribute, If avail then set the value in the variable.
				if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedHealthQuestion__Name")!=-1){
					nameValue = valuElementArray[attArrIndx];//dependentNameArray[nameCount++];						
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedHealthQuestion__Height")!=-1){
					heightValue = valuElementArray[attArrIndx]; 
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedHealthQuestion__Weight")!=-1){
					weightValue = valuElementArray[attArrIndx];
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedHealthQuestion__Smoker")!=-1){
					smokerValue = valuElementArray[attArrIndx];					
					if(smokerValue==""|| smokerValue == undefined || smokerValue=="undefined") {						
						smokerValue="Yes";
					}
				}
				
				colCount++;
				
				// if the colcount is the multiples of the number of columns, then push the array with values.
				if(colCount % 5 ==0){
					myDP_array.push({RelationShip:"Dependent",Name:nameValue, Height:heightValue, Weight:weightValue,Smoker:smokerValue});
					var keyStrMedDep = nameElementArray[attArrIndx];
					medDepPKeyArr[pKeyIndxMedicalQ++] = keyStrMedDep.substr(keyStrMedDep.indexOf("_____")+5,keyStrMedDep.length);
				    getMedicalDependentPKey = function(){
				   		 return medDepPKeyArr;
				    }
				}
			}
			
			dependent_DataGrid.dataProvider = myDP_array;			
			nameColumn.editable = false;						
			
			if(dependent_DataGrid.length<=1 && myDP_array.length==0)
			{	
				for(tempIndx=0;tempIndx<dependentNameArray.length;tempIndx++){							
					dependent_DataGrid.dataProvider.addItem({RelationShip:"Dependent",Name:dependentNameArray[tempIndx], Height:"", Weight:"",Smoker:"No"});
				}
				nameColumn.editable = false;
			}
			else if(myDP_array.length!=0 && dependent_DataGrid.length<dependentNameArray.length){					
				for(var checkCnt=dependent_DataGrid.length;checkCnt<dependentNameArray.length;checkCnt++){
					dependent_DataGrid.dataProvider.addItem({RelationShip:"Dependent",Name:dependentNameArray[checkCnt], Height:"", Weight:"",Smoker:"No"});
				}
			}
			else if(dependentNameArray.length<dependent_DataGrid.length){
				var dgCount=0;
				for(var dgIndx=0;dgIndx<dependent_DataGrid.length;dgIndx++){
					if(myDP_array[dgIndx].Name == dependentNameArray[dgIndx]){
						newMyDP_array[dgCount] = myDP_array[dgCount];
						dgCount++;
					}
				}
				dependent_DataGrid.dataProvider = newMyDP_array;
			}
			if(myDP_array.length==0 || myDP_array.length == undefined || myDP_array.length <0){
				myDP_array = new Array({NameExpl:" ", Condition:" ", TreatmentDate:" ",TreatmentSummary:" ",Recovered:" "});
				
			}
			/*if(dependent_DataGrid.length<=1)
			{	dependent_DataGrid.dataProvider.removeItemAt(0);
				for(tempIndx=0;tempIndx<dependentNameArray.length;tempIndx++){
					dependent_DataGrid.dataProvider.addItem({RelationShip:"Dependent",Name:dependentNameArray[tempIndx], Height:"", Weight:"",Smoker:"No"});
				}
				nameColumn.editable = false;
			}
			
			if(myDP_array.length==0 || myDP_array.length == undefined || myDP_array.length <0){
				myDP_array = new Array({NameExpl:" ", Condition:" ", TreatmentDate:" ",TreatmentSummary:" ",Recovered:" "});
				
			}
			
			    dependent_DataGrid.dataProvider = myDP_array;			
				nameColumn.editable = false;*/
					
			
		}
		else if(subApplicationName == "Expl"){
			var repeatNameElement:String;
			var repeatValueElement:String;
			var count:Number = 0;
			var noOfRows:Number = 0;
			for(childIndex=0;childIndex < medHealthXML.firstChild.childNodes[j].childNodes.length;childIndex++){
				repeatNameElement = medHealthXML.firstChild.childNodes[j].childNodes[childIndex].firstChild.firstChild.nodeValue;
				repeatValueElement= medHealthXML.firstChild.childNodes[j].childNodes[childIndex].lastChild.lastChild.nodeValue;
				nameElementArray[childIndex] = repeatNameElement;
				valuElementArray[childIndex] = repeatValueElement;									
				count = count + 1;
			}
			var quesIndx:Number = 0;
			for(keyQIndx=0;keyQIndx<nameElementArray.length;keyQIndx++){
				if(nameElementArray[keyQIndx].indexOf("Object__Employee__MedExplanation__QuestionIdentifier")!=-1){
					keyQuestionArr[quesIndx] = valuElementArray[keyQIndx];
					applAttributeName = nameElementArray[keyQIndx];
					if(keyQuestionArr[quesIndx] == "TREATED_BEFORE"){
						MedQTreatedBeforePKey = applAttributeName.substr(applAttributeName.indexOf("_____")+5,applAttributeName.length);
						trace("MedQTreatedBeforePKey:>"+MedQTreatedBeforePKey);
					}
					else if(keyQuestionArr[quesIndx] == "HOSPITALIZED_BEFORE"){
						MedQHospitalizedBeforePKey = applAttributeName.substr(applAttributeName.indexOf("_____")+5,applAttributeName.length);
						trace("MedQHospitalizedBeforePKey:>"+MedQHospitalizedBeforePKey);
					}
					else if(keyQuestionArr[quesIndx] == "OPERATION_ADVISED"){
						MedQOperationAdvisedPKey = applAttributeName.substr(applAttributeName.indexOf("_____")+5,applAttributeName.length);
						trace("MedQOperationAdvisedPKey:>"+MedQOperationAdvisedPKey);
					}
					else if(keyQuestionArr[quesIndx] == "CURRENT_MEDICATION"){
						MedQCurrentMedicationPKey = applAttributeName.substr(applAttributeName.indexOf("_____")+5,applAttributeName.length);
						trace("MedQCurrentMedicationPKey:>"+MedQCurrentMedicationPKey);
					}
					++quesIndx;
				}
			}
			var QIndx:Number = 0;
			trace("~~~~~~~nameElementArray.length~~~"+nameElementArray.length);
			for(attArrIndx:Number = 0; attArrIndx < nameElementArray.length; attArrIndx++){
				if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__PatientName")!=-1){
					
					trace("nameElementArray["+attArrIndx+"]:"+nameElementArray[attArrIndx]);
					trace("valuElementArray["+attArrIndx+"]::"+valuElementArray[attArrIndx]);
					trace("keyQuestionArr["+QIndx+"]>"+keyQuestionArr[QIndx]);
					if(keyQuestionArr[QIndx]=="TREATED_BEFORE"){
						Treated_Before_Name.text = valuElementArray[attArrIndx];
						//++QIndx;
					}
					else if(keyQuestionArr[QIndx]=="HOSPITALIZED_BEFORE"){
						Hospitalized_Before_Name.text = valuElementArray[attArrIndx];
						//++QIndx;
					}
					else if(keyQuestionArr[QIndx]=="OPERATION_ADVISED"){
						Operation_Advised_Name.text = valuElementArray[attArrIndx];
						//++QIndx;
					}
					else if(keyQuestionArr[QIndx]=="CURRENT_MEDICATION"){
						Current_Medication_Name.text = valuElementArray[attArrIndx];
						//++QIndx;
					}
				}
				if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__PatientCondition")!=-1){
					trace("nameElementArray["+attArrIndx+"]:"+nameElementArray[attArrIndx]);
					trace("valuElementArray["+attArrIndx+"]::"+valuElementArray[attArrIndx]);
					trace("keyQuestionArr["+QIndx+"]>"+keyQuestionArr[QIndx]);
					if(keyQuestionArr[QIndx]=="TREATED_BEFORE"){
						Treated_Before_Condition.text = valuElementArray[attArrIndx];
						//++QIndx;
					}
					else if(keyQuestionArr[QIndx]=="HOSPITALIZED_BEFORE"){
						Hospitalized_Before_Condition.text = valuElementArray[attArrIndx];
						//++QIndx;
					}
					else if(keyQuestionArr[QIndx]=="OPERATION_ADVISED"){
						Operation_Advised_Condition.text = valuElementArray[attArrIndx];
						//++QIndx;
					}
					else if(keyQuestionArr[QIndx]=="CURRENT_MEDICATION"){
						Current_Medication_Condition.text = valuElementArray[attArrIndx];
						//++QIndx;
					}
				}
				if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__TreatmentStartDate")!=-1){
					trace("nameElementArray["+attArrIndx+"]:"+nameElementArray[attArrIndx]);
					trace("valuElementArray["+attArrIndx+"]::"+valuElementArray[attArrIndx]);
					trace("keyQuestionArr["+QIndx+"]>"+keyQuestionArr[QIndx]);	
					if(keyQuestionArr[QIndx]=="TREATED_BEFORE"){
						Treated_Before_Date.text = valuElementArray[attArrIndx];
						//++QIndx;
					}
					else if(keyQuestionArr[QIndx]=="HOSPITALIZED_BEFORE"){
						Hospitalized_Before_Date.text = valuElementArray[attArrIndx];
						//++QIndx;
					}
					else if(keyQuestionArr[QIndx]=="OPERATION_ADVISED"){trace("fool3"+valuElementArray[attArrIndx]);
						Operation_Advised_Date.text = valuElementArray[attArrIndx];
						//++QIndx;
					}
					else if(keyQuestionArr[QIndx]=="CURRENT_MEDICATION"){
						Current_Medication_Date.text = valuElementArray[attArrIndx];
						//++QIndx;
					}
				}
				if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__TreatmentSummary")!=-1){
					trace("nameElementArray["+attArrIndx+"]:"+nameElementArray[attArrIndx]);
					trace("valuElementArray["+attArrIndx+"]::"+valuElementArray[attArrIndx]);
					trace("keyQuestionArr["+QIndx+"]>"+keyQuestionArr[QIndx]);
					if(keyQuestionArr[QIndx]=="TREATED_BEFORE"){
						Treated_Before_Diagnosis.text = valuElementArray[attArrIndx];
						//++QIndx;
					}
					else if(keyQuestionArr[QIndx]=="HOSPITALIZED_BEFORE"){
						Hospitalized_Before_Diagnosis.text = valuElementArray[attArrIndx];
						//++QIndx;
					}
					else if(keyQuestionArr[QIndx]=="OPERATION_ADVISED"){
						Operation_Advised_Diagnosis.text = valuElementArray[attArrIndx];
						//++QIndx;
					}
					else if(keyQuestionArr[QIndx]=="CURRENT_MEDICATION"){
						Current_Medication_Diagnosis.text = valuElementArray[attArrIndx];
						//++QIndx;
					}
				}
				if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__IsRecovered")!=-1){
					trace("nameElementArray["+attArrIndx+"]:"+nameElementArray[attArrIndx]);
					trace("valuElementArray["+attArrIndx+"]::"+valuElementArray[attArrIndx]);
					trace("keyQuestionArr["+QIndx+"]>"+keyQuestionArr[QIndx]);
					if(keyQuestionArr[QIndx]=="TREATED_BEFORE"){
						TREATED_BEFORE_IS_RECOVERED.setValue(valuElementArray[attArrIndx]);
						//++QIndx;
					}
					else if(keyQuestionArr[QIndx]=="HOSPITALIZED_BEFORE"){
						HOSPITALIZED_BEFORE_IS_RECOVERED.setValue(valuElementArray[attArrIndx]);
						//++QIndx;
					}
					else if(keyQuestionArr[QIndx]=="OPERATION_ADVISED"){
						OPERATION_ADVISED_IS_RECOVERED.setValue(valuElementArray[attArrIndx]);
						//++QIndx;
					}
					else if(keyQuestionArr[QIndx]=="CURRENT_MEDICATION"){
						CURRENT_MEDICATION_IS_RECOVERED.setValue(valuElementArray[attArrIndx]);
						//++QIndx;
					}
				}
				if(attArrIndx==6 || attArrIndx==13 || attArrIndx==20 || attArrIndx==27 ){
					++QIndx;
				}
			}
			// to iterate the attribute name index and retrieve the attribute name and order the values correctly based on the columns.
			// star
			/*var colCount:Number = 0;
				var nameValue:String = ""; var conditionValue:String; var treatStartDateValue:String;
				var treatEndDateValue:String; var treatSummaryValue:String; var isRecoveredValue:String;
				var pKeyIndxMedicalExpl:Number = 0;
			for(attArrIndx:Number = 0; attArrIndx < nameElementArray.length; attArrIndx++){
				
				// check for the column name in the attribute, If avail then set the value in the variable.
				if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__PatientName")!=-1){
					nameValue = valuElementArray[attArrIndx];						
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__PatientCondition")!=-1){
					conditionValue = valuElementArray[attArrIndx]; 
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__TreatmentStartDate")!=-1){
					treatStartDateValue = valuElementArray[attArrIndx];
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__TreatmentEndDate")!=-1){
					treatEndDateValue = valuElementArray[attArrIndx];
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__TreatmentSummary")!=-1){
					treatSummaryValue = valuElementArray[attArrIndx];
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__IsRecovered")!=-1){
					isRecoveredValue = valuElementArray[attArrIndx];
				}
				
				colCount++;
				
				// if the colcount is the multiples of the number of columns, then push the array with values.
				if(colCount % 6 ==0){
					explDP_array.push({NameExpl:nameValue, Condition:conditionValue, TreatmentDate:treatStartDateValue+""+treatEndDateValue,TreatmentSummary:treatSummaryValue,Recovered:isRecoveredValue});
					var keyStrMedExpl = nameElementArray[attArrIndx];
					medExplPKeyArr[pKeyIndxMedicalExpl++] = keyStrMedExpl.substr(keyStrMedExpl.indexOf("_____")+5,keyStrMedExpl.length);
					getMedicalExplPKey = function(){
						return medExplPKeyArr;
					}
				}
			}
			if(explDP_array.length>0) {
				explanation_dataGrid.dataProvider = explDP_array;			
			}*/
		}
		else{	
			 if(isNeedNormalFormRetrieve){
					for(i=0;i<medHealthXML.firstChild.childNodes[j].childNodes.length;i++){
					var nameElement:String = medHealthXML.firstChild.childNodes[j].childNodes[i].firstChild.firstChild.nodeValue;
					var valueElement:String = medHealthXML.firstChild.childNodes[j].childNodes[i].lastChild.lastChild.nodeValue;
			
					if(nameElement == "Object__Employee__MedicalCondition__Cancer" and valueElement != null){
						Object__Employee__MedicalCondition__Cancer___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____CANCER.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__CancerType" and valueElement != null){
						Object__Employee__MedicalCondition__CancerType___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____CANCER_TYPE.text = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalQuestion__SmokerSpouse" and valueElement != null){
						Object__Employee__MedicalQuestion__SmokerSpouse___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____SPOUSE_SMOKER.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalQuestion__WeightSpouse" and valueElement != null){
						Object__Employee__MedicalQuestion__WeightSpouse___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____SPOUSE_WEIGHT.text = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalQuestion__HeightSpouse" and valueElement != null){
						Object__Employee__MedicalQuestion__HeightSpouse___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____SPOUSE_HEIGHT.text = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalQuestion__SmokerSelf" and valueElement != null){
						Object__Employee__MedicalQuestion__SmokerSelf___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____SELF_SMOKER.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalQuestion__WeightSelf" and valueElement != null){
						Object__Employee__MedicalQuestion__WeightSelf___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____SELF_WEIGHT.text = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalQuestion__HeightSelf" and valueElement != null){
						Object__Employee__MedicalQuestion__HeightSelf___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____SELF_HEIGHT.text = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Leukemia" and valueElement != null){
						Object__Employee__MedicalCondition__Leukemia___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____LEUKEMIA.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__LeukemiaType" and valueElement != null){
						Object__Employee__MedicalCondition__LeukemiaType___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____LEUKEMIA_TYPE.text = valueElement;	
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Lymphoma" and valueElement != null){
						Object__Employee__MedicalCondition__Lymphoma___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____LYMPHOMA.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__LymphomaType" and valueElement != null){
						Object__Employee__MedicalCondition__LymphomaType___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____LYMPHOMA_TYPE.text = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Chemotherapy" and valueElement != null){
						Object__Employee__MedicalCondition__Chemotherapy___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____CHEMOTHERAPY.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Radiation" and valueElement != null){
						Object__Employee__MedicalCondition__Radiation___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____RADIATION.setValue(valueElement);
					}
					
					
					else if(nameElement == "Object__Employee__MedicalCondition__Allergies" and valueElement != null){
						Object__Employee__MedicalCondition__Allergies___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____ALLERGIES.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Shots" and valueElement != null){
						Object__Employee__MedicalCondition__Shots___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____SHOTS.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Asthma" and valueElement != null){
						Object__Employee__MedicalCondition__Asthma___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____ASTHMA.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__CysticFibrosis" and valueElement != null){
						Object__Employee__MedicalCondition__CysticFibrosis___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____CYSTICFIBROSIS.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Emphysema" and valueElement != null){
						Object__Employee__MedicalCondition__Emphysema___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____EMPHYSEMA.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Oxygen" and valueElement != null){
						Object__Employee__MedicalCondition__Oxygen___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____OXYGEN.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__LungOther" and valueElement != null){
						Object__Employee__MedicalCondition__LungOther___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____LUNG_OTHER.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__LungOtherIsAny" and valueElement != null){
						Object__Employee__MedicalCondition__LungOtherIsAny___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____LUNG_OTHERISANY.text = valueElement;
					}
					
					
					else if(nameElement == "Object__Employee__MedicalCondition__DegenerativeDiscDisease" and valueElement != null){
						Object__Employee__MedicalCondition__DegenerativeDiscDisease___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____DEGENERATIVE_DISC_DISEASE.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Fibromyalgia" and valueElement != null){
						Object__Employee__MedicalCondition__Fibromyalgia___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____FIBROMYALGIA.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__HerniatedDisc" and valueElement != null){
						Object__Employee__MedicalCondition__HerniatedDisc___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____HERNIATED_DISC.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__OsteoArthritis" and valueElement != null){
						Object__Employee__MedicalCondition__OsteoArthritis___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____OSTEO_ARTHRITIS.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__RheumatoidArthritis" and valueElement != null){
						Object__Employee__MedicalCondition__RheumatoidArthritis___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____RHEUMATOIDARTHRITIS.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__JointReplacement" and valueElement != null){
						Object__Employee__MedicalCondition__JointReplacement___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____JOINT_REPLACEMENT.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__MuscularOther" and valueElement != null){
						Object__Employee__MedicalCondition__MuscularOther___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____MUSCULAR_OTHER.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__MuscularOtherIsAny" and valueElement != null){
						Object__Employee__MedicalCondition__MuscularOtherIsAny___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____MUSCULAR_OTHERISANY.text = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Aneurysm" and valueElement != null){
						Object__Employee__MedicalCondition__Aneurysm___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____ANEURYSM.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__AneurysmType" and valueElement != null){
						Object__Employee__MedicalCondition__AneurysmType___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____ANEURYSM_TYPE.text = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalCondition__CADAngina" and valueElement != null){
						Object__Employee__MedicalCondition__CADAngina___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____CADANGINA.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Angioplasty" and valueElement != null){
						Object__Employee__MedicalCondition__Angioplasty___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____ANGIOPLASTY.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__AngioplastyDate" and valueElement != null and valueElement!="0000-00-00"){
						var valueANGIOPLASTY_DATE = valueElement;
						var index = valueANGIOPLASTY_DATE.split("-");
						Object__Employee__MedicalCondition__AngioplastyDateMonth.text=index[1];
						Object__Employee__MedicalCondition__AngioplastyDateDate.text=index[2];
						Object__Employee__MedicalCondition__AngioplastyDateYear.text=index[0];
						/*var valANGIOPLASTY_DATE = index[1]+"/"+index[2]+"/"+index[0];
						Object__Employee__MedicalCondition__AngioplastyDate___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____ANGIOPLASTY_DATE.text = valANGIOPLASTY_DATE;*/
					}
					else if(nameElement == "Object__Employee__MedicalCondition__BypassSurgery" and valueElement != null){
						Object__Employee__MedicalCondition__BypassSurgery___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____BYPASS_SURGERY.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__BypassSurgeryDate" and valueElement != null and valueElement!="0000-00-00"){
						var valueBYPASSSURGERY_DATE = valueElement;
						var index = valueBYPASSSURGERY_DATE.split("-");
						Object__Employee__MedicalCondition__BypassSurgeryDateMonth.text=index[1];
						Object__Employee__MedicalCondition__BypassSurgeryDateDate.text=index[2];
						Object__Employee__MedicalCondition__BypassSurgeryDateYear.text=index[0];
						/*var valBYPASSSURGERY_DATE = index[1]+"/"+index[2]+"/"+index[0];
						Object__Employee__MedicalCondition__BypassSurgeryDate___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____BYPASSSURGERY_DATE.text = valBYPASSSURGERY_DATE;*/
					}
					else if(nameElement == "Object__Employee__MedicalCondition__CongestiveHeartFailure" and valueElement != null){
						Object__Employee__MedicalCondition__CongestiveHeartFailure___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____CONGESTIVE_HEART_FAILURE.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__HeartAttack" and valueElement != null){
						Object__Employee__MedicalCondition__HeartAttack___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____HEARTATTACK.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__HeartAttackDate" and valueElement != null and valueElement!="0000-00-00"){
						var valueHEARTATTACK_DATE = valueElement;
						var index = valueHEARTATTACK_DATE.split("-");
						Object__Employee__MedicalCondition__HeartAttackDateMonth.text=index[1];
						Object__Employee__MedicalCondition__HeartAttackDateDate.text=index[2];
						Object__Employee__MedicalCondition__HeartAttackDateYear.text=index[0];
						/*var valHEARTATTACK_DATE = index[1]+"/"+index[2]+"/"+index[0];
						Object__Employee__MedicalCondition__HeartAttackDate___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____HEARTATTACK_DATE.text = valHEARTATTACK_DATE;*/
					}
					else if(nameElement == "Object__Employee__MedicalCondition__PacemakerICD" and valueElement != null){
						Object__Employee__MedicalCondition__PacemakerICD___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____PACEMAKER_ICD.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Stroke" and valueElement != null){
						Object__Employee__MedicalCondition__Stroke___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____STROKE.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__StrokeDate" and valueElement != null and valueElement!="0000-00-00"){
						var valueSTROKE_DATE = valueElement;
						var index = valueSTROKE_DATE.split("-");
						Object__Employee__MedicalCondition__StrokeDateMonth.text=index[1];
						Object__Employee__MedicalCondition__StrokeDateDate.text=index[2];
						Object__Employee__MedicalCondition__StrokeDateYear.text=index[0];
						/*var valSTROKE_DATE = index[1]+"/"+index[2]+"/"+index[0];
						Object__Employee__MedicalCondition__StrokeDate___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____STROKE_DATE.text = valSTROKE_DATE;*/
					}
					else if(nameElement == "Object__Employee__MedicalCondition__BloodClot" and valueElement != null){
						Object__Employee__MedicalCondition__BloodClot___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____BLOODCLOT.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__IrregularHeartBeat" and valueElement != null){
						Object__Employee__MedicalCondition__IrregularHeartBeat___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____IRREGULAR_HEARTBEAT.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__PeripheralVascular" and valueElement != null){
						Object__Employee__MedicalCondition__PeripheralVascular___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____PERIPHERAL_VASCULAR.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Anemia" and valueElement != null){
						Object__Employee__MedicalCondition__Anemia___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____ANEMIA.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__AnemiaType" and valueElement != null){
						Object__Employee__MedicalCondition__AnemiaType___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____ANEMIA_TYPE.text = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalCondition__OtherBloodDisorder" and valueElement != null){
						Object__Employee__MedicalCondition__OtherBloodDisorder___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____OTHERBLOOD_DISORDER.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__OtherBloodDisorderType" and valueElement != null){
						Object__Employee__MedicalCondition__OtherBloodDisorderType___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____OTHERBLOOD_DISORDER_TYPE.text = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Hypertension" and valueElement != null){
						Object__Employee__MedicalCondition__Hypertension___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____HYPER_TENSION.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__BPReading1" and valueElement != null){
						Object__Employee__MedicalCondition__BPReading1___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____BPREADING1.value = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalCondition__BPReading2" and valueElement != null){
						Object__Employee__MedicalCondition__BPReading2___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____BPREADING2.value = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalCondition__BPReading3" and valueElement != null){
						Object__Employee__MedicalCondition__BPReading3___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____BPREADING3.value = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalCondition__HighCholesterol" and valueElement != null){
						Object__Employee__MedicalCondition__HighCholesterol___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____HIGHCHOLESTEROL.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__HeartValveDisorder" and valueElement != null){
						Object__Employee__MedicalCondition__HeartValveDisorder___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____HEART_VALVE_DISORDER.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__HeartOther" and valueElement != null){
						Object__Employee__MedicalCondition__HeartOther___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____HEART_OTHER.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__DiabetesInsulin" and valueElement != null){
						Object__Employee__MedicalCondition__DiabetesInsulin___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____DIABETES_INSULIN.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__DiabetesOral" and valueElement != null){
						Object__Employee__MedicalCondition__DiabetesOral___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____DIABETES_ORAL.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__DiabetesDietExercise" and valueElement != null){
						Object__Employee__MedicalCondition__DiabetesDietExercise___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____DIABETES_DIET_EXERCISE.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__BSRdgsHGB1" and valueElement != null){
						Object__Employee__MedicalCondition__BSRdgsHGB1___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____BS_RDGS_HGB1.value = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalCondition__BSRdgsHGB2" and valueElement != null){
						Object__Employee__MedicalCondition__BSRdgsHGB2___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____BS_RDGS_HGB2.value = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalCondition__BSRdgsHGB3" and valueElement != null){
						Object__Employee__MedicalCondition__BSRdgsHGB3___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____BS_RDGS_HGB3.value = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalCondition__ThyroidDisorder" and valueElement != null){
						Object__Employee__MedicalCondition__ThyroidDisorder___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____THYROID_DISORDER.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__EndocrineOther" and valueElement != null){
						Object__Employee__MedicalCondition__EndocrineOther___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____ENDOCRINE_OTHER.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__CerebralPalsy" and valueElement != null){
						Object__Employee__MedicalCondition__CerebralPalsy___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____CEREBRAL_PALSY.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Epilepsy" and valueElement != null){
						Object__Employee__MedicalCondition__Epilepsy___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____EPILEPSY.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__NeurologicalMal" and valueElement != null){
						Object__Employee__MedicalCondition__NeurologicalMal___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____NEUROLOGICAL_MAL.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__DateofLastSeizure" and valueElement != null and valueElement!="0000-00-00"){
						var valueLAST_SEIZURE_DATE= valueElement;
						var index = valueLAST_SEIZURE_DATE.split("-");
						Object__Employee__MedicalCondition__DateofLastSeizureMonth.text=index[1];
						Object__Employee__MedicalCondition__DateofLastSeizureDate.text=index[2];
						Object__Employee__MedicalCondition__DateofLastSeizureYear.text=index[0];
						/*var valLAST_SEIZURE_DATE = index[1]+"/"+index[2]+"/"+index[0];
						Object__Employee__MedicalCondition__DateofLastSeizure___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____LAST_SEIZURE_DATE.text = valLAST_SEIZURE_DATE;*/
					}
					else if(nameElement == "Object__Employee__MedicalCondition__MultipleSclerosis" and valueElement != null){
						Object__Employee__MedicalCondition__MultipleSclerosis___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____MULTIPLE_SCLEROSIS.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__ParkinsonDisease" and valueElement != null){
						Object__Employee__MedicalCondition__ParkinsonDisease___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____PARKINSON_DISEASE.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__NeurologicalOther" and valueElement != null){
						Object__Employee__MedicalCondition__NeurologicalOther___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____NEUROLOGICAL_OTHER.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__NeurologicalOtherIsAny" and valueElement != null){
						Object__Employee__MedicalCondition__NeurologicalOtherIsAny___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____NEUROLOGICAL_OTHER_ISANY.text = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalCondition__DepressionAnxiety" and valueElement != null){
						Object__Employee__MedicalCondition__DepressionAnxiety___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____DEPRESSION_ANXIETY.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__BipolorSchizophrenia" and valueElement != null){
						Object__Employee__MedicalCondition__BipolorSchizophrenia___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____BIPOLOR_SCHIZOPHRENIA.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Hospitalized" and valueElement != null){
						Object__Employee__MedicalCondition__Hospitalized___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____HOSPITALIZED.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__HospitalizedDate" and valueElement != null and valueElement!="0000-00-00"){
						var valueHOSPITALIZED_DATE = valueElement;
						var index = valueHOSPITALIZED_DATE .split("-");
						Object__Employee__MedicalCondition__HospitalizedDateMonth.text=index[1];
						Object__Employee__MedicalCondition__HospitalizedDateDate.text=index[2];
						Object__Employee__MedicalCondition__HospitalizedDateYear.text=index[0];
						/*var valHOSPITALIZED_DATE  = index[1]+"/"+index[2]+"/"+index[0];
						Object__Employee__MedicalCondition__HospitalizedDate___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____HOSPITALIZED_DATE.text = valHOSPITALIZED_DATE;*/
					}
					else if(nameElement == "Object__Employee__MedicalCondition__SuicideAttempt" and valueElement != null){
						Object__Employee__MedicalCondition__SuicideAttempt___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____SUICIDE_ATTEMPT.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__SuicideAttemptDate" and valueElement != null and valueElement!="0000-00-00"){
						var valueSUICIDE_ATTEMPT_DATE = valueElement;
						var index = valueSUICIDE_ATTEMPT_DATE.split("-");
						Object__Employee__MedicalCondition__SuicideAttemptMonth.text=index[1];
						Object__Employee__MedicalCondition__SuicideAttemptDate.text=index[2];
						Object__Employee__MedicalCondition__SuicideAttemptYear.text=index[0];
						/*var valSUICIDE_ATTEMPT_DATE  = index[1]+"/"+index[2]+"/"+index[0];
						Object__Employee__MedicalCondition__SuicideAttemptDate___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____SUICIDE_ATTEMPT_DATE.text = valSUICIDE_ATTEMPT_DATE;*/
					}
					else if(nameElement == "Object__Employee__MedicalCondition__PsychologicalOther" and valueElement != null){
						Object__Employee__MedicalCondition__PsychologicalOther___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____PSYCHOLOGICAL_OTHER.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__PsychologicalIsAny" and valueElement != null){
						Object__Employee__MedicalCondition__PsychologicalIsAny___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____PSYCHOLOGICAL_OTHER_ISANY.text = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalCondition__AbnormalPap" and valueElement != null){
						Object__Employee__MedicalCondition__AbnormalPap___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____ABNORMAL_PAP.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__AbnormalPapDate" and valueElement != null and valueElement!="0000-00-00"){
						var valueABNORMAL_PAP_DATE = valueElement;
						var index = valueABNORMAL_PAP_DATE.split("-");
						Object__Employee__MedicalCondition__AbnormalPapDateMonth.text=index[1];
						Object__Employee__MedicalCondition__AbnormalPapDateDate.text=index[2];
						Object__Employee__MedicalCondition__AbnormalPapDateYear.text=index[0];
						/*var valABNORMAL_PAP_DATE  = index[1]+"/"+index[2]+"/"+index[0];
						Object__Employee__MedicalCondition__AbnormalPapDate___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____ABNORMAL_PAP_DATE.text = valABNORMAL_PAP_DATE;*/
					}
					else if(nameElement == "Object__Employee__MedicalCondition__NormalFollowupPap" and valueElement != null){
						Object__Employee__MedicalCondition__NormalFollowupPap___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____NORMAL_FOLLOWUP_PAP.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__NormalFollowupPapDate" and valueElement != null and valueElement!="0000-00-00"){
						var valueNORMAL_FOLLOWUP_PAP_DATE = valueElement;
						var index = valueNORMAL_FOLLOWUP_PAP_DATE.split("-");
						Object__Employee__MedicalCondition__NormalFollowupPapDateMonth.text=index[1];
						Object__Employee__MedicalCondition__NormalFollowupPapDateDate.text=index[2];
						Object__Employee__MedicalCondition__NormalFollowupPapDateYear.text=index[0];
						/*var valNORMAL_FOLLOWUP_PAP_DATE  = index[1]+"/"+index[2]+"/"+index[0];
						Object__Employee__MedicalCondition__NormalFollowupPapDate___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____NORMAL_FOLLOWUP_PAP_DATE.text = valNORMAL_FOLLOWUP_PAP_DATE;*/
					}
					else if(nameElement == "Object__Employee__MedicalCondition__EndocrineOtherIsAny" and valueElement != null){
						Object__Employee__MedicalCondition__EndocrineOtherIsAny___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____ENDOCRINE_OTHER_IS_ANY.text = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalCondition__HeartOtherIsAny" and valueElement != null){
						Object__Employee__MedicalCondition__HeartOtherIsAny___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____HEART_OTHER_IS_ANY.text = valueElement;
					}
					
					else if(nameElement == "Object__Employee__MedicalCondition__ColonPolypsDiverticulitis" and valueElement != null){
						Object__Employee__MedicalCondition__ColonPolypsDiverticulitis___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____COLON_POLYPS_DIVERTICULITIS.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__CrohnUlcerativeColitis" and valueElement != null){
						Object__Employee__MedicalCondition__CrohnUlcerativeColitis___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____CROHN_ULCERATIVE_COLITIS.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__GastricRefluxUlcer" and valueElement != null){
						Object__Employee__MedicalCondition__GastricRefluxUlcer___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____GASTRIC_REFLUX_ULCER.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__EnlargedProstate" and valueElement != null){
						Object__Employee__MedicalCondition__EnlargedProstate___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____ENLARGED_PROSTATE.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__KidneyStones" and valueElement != null){
						Object__Employee__MedicalCondition__KidneyStones___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____KIDNEY_STONES.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__InfertilitityTreatments" and valueElement != null){	
						Object__Employee__MedicalCondition__InfertilitityTreatments___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____INFERTILITITY_TREATMENTS.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__PolycysticOvarianSyndrome" and valueElement != null){
						Object__Employee__MedicalCondition__PolycysticOvarianSyndrome___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____POLYCYSTIC_OVARIAN_SYNDROME.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Endometriosis" and valueElement != null){
						Object__Employee__MedicalCondition__Endometriosis___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____ENDOMETRIOSIS.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__UrinaryOther" and valueElement != null){
						Object__Employee__MedicalCondition__UrinaryOther___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____URINARY_OTHER.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__UrinaryOtherIsAny" and valueElement != null){
						Object__Employee__MedicalCondition__UrinaryOtherIsAny___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____URINARY_OTHER_ISANY.text = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalCondition__EndStageRenalFailure" and valueElement != null){
						Object__Employee__MedicalCondition__EndStageRenalFailure___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____ENDSTAGE_RENAL_FAILURE.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Transplant" and valueElement != null){
						Object__Employee__MedicalCondition__Transplant___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____TRANSPLANT.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__TransplantType" and valueElement != null){
						Object__Employee__MedicalCondition__TransplantType___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____TRANSPLANT_TYPE.text = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalCondition__HIV" and valueElement != null){
						Object__Employee__MedicalCondition__HIV___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____HIV.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Hemophilia" and valueElement != null){
						Object__Employee__MedicalCondition__Hemophilia___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____HEMOPHILIA.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Lupus" and valueElement != null){
						Object__Employee__MedicalCondition__Lupus___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____LUPUS.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__LupusType" and valueElement != null){
						Object__Employee__MedicalCondition__LupusType___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____LUPUS_TYPE.text = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalCondition__Hepatitis" and valueElement != null){
						Object__Employee__MedicalCondition__Hepatitis___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____HEPATITIS.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__HepatitisType" and valueElement != null){
						Object__Employee__MedicalCondition__HepatitisType___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____HEPATITIS_TYPE.text = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalCondition__MiscOther" and valueElement != null){
						Object__Employee__MedicalCondition__MiscOther___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____MISC_OTHER.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalCondition__MiscOtherIsany" and valueElement != null){
						Object__Employee__MedicalCondition__MiscOtherIsany___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____MISC_OTHER_ISANY.text = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalQuestion__DiseaseTreatedBefore" and valueElement != null){
						Object__Employee__MedicalQuestion__DiseaseTreatedBefore___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____DISEASE_TREATED_BEFORE.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalQuestion__OperatedHospitalizedBefore" and valueElement != null){
						Object__Employee__MedicalQuestion__OperatedHospitalizedBefore___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____OPERATED_HOSPITALIZED_BEFORE.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalQuestion__AdvisedFurtherTreatment" and valueElement != null){
						Object__Employee__MedicalQuestion__AdvisedFurtherTreatment___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____ADVISED_FURTHER_TREATMENT.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalQuestion__CurrentlyPregnant" and valueElement != null){
						Object__Employee__MedicalQuestion__CurrentlyPregnant___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____CURRENTLY_PREGNANT.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalQuestion__PregnantPersonName" and valueElement != null){
						Object__Employee__MedicalQuestion__PregnantPersonName___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____PREGNANT_PERSON_NAME.text = valueElement;
					}
					else if(nameElement == "Object__Employee__MedicalQuestion__DelivaryDueDate" and valueElement != null and valueElement!="0000-00-00"){
						var valueDELIVARY_DUE_DATE = valueElement;
						var index = valueDELIVARY_DUE_DATE.split("-");
						Object__Employee__MedicalQuestion__DelivaryDueDateMonth.text=index[1];
						Object__Employee__MedicalQuestion__DelivaryDueDateDate.text=index[2];
						Object__Employee__MedicalQuestion__DelivaryDueDateYear.text=index[0];
						/*var valDELIVARY_DUE_DATE  = index[1]+"/"+index[2]+"/"+index[0];
						Object__Employee__MedicalQuestion__DelivaryDueDate___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____DELIVARY_DUE_DATE.text = valDELIVARY_DUE_DATE;*/
					}
					else if(nameElement == "Object__Employee__MedicalQuestion__HighRiskPregnancy" and valueElement != null){
						Object__Employee__MedicalQuestion__HighRiskPregnancy___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____HIGH_RISK_PREGNANCY.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalQuestion__AnyMedication" and valueElement != null){
						Object__Employee__MedicalQuestion__AnyMedication___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____ANY_MEDICATION.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalQuestion__WorkerCompensation" and valueElement != null){
						Object__Employee__MedicalQuestion__WorkerCompensation___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____WORKER_COMPENSATION.setValue(valueElement);
					}
					else if(nameElement == "Object__Employee__MedicalQuestion__CompensationCaseNumber" and valueElement != null){
						Object__Employee__MedicalQuestion__CompensationCaseNumber___DMS_EMPLOYEE_MED_HEALTH_QUESTIONNAIRE____COMPENSATION_CASE_NUMBER.text = valueElement;
					}
				}
			}
		}
	}
}

retrieveTermsNCondition = function(){	
	for(j = 0;j<global_employee_XML_Extended.firstChild.childNodes.length;j++){
		for(i=0;i<global_employee_XML_Extended.firstChild.childNodes[j].childNodes.length;i++){
			var nameElement:String = global_employee_XML_Extended.firstChild.childNodes[j].childNodes[i].firstChild.firstChild.nodeValue;
			var valueElement:String = global_employee_XML_Extended.firstChild.childNodes[j].childNodes[i].lastChild.lastChild.nodeValue;
	
			if(nameElement == "Object__Employee__TermsAndCondition__EmployeeSignature" and valueElement != undefined){
				Object__Employee__TermsAndCondition__EmployeeSignature___DMS_EMPLOYEE____EMPLOYEE_SIGNATURE.text =  valueElement;
			}
			else if(nameElement == "Object__Employee__TermsAndCondition__SpouseSignature" and valueElement != undefined){
				Object__Employee__TermsAndCondition__SpouseSignature___DMS_EMPLOYEE____EMPLOYEE_SPOUSE_SIGNATURE.text =  valueElement;
			}
			else if(nameElement == "Object__Employee__TermsAndCondition__EmployeeSubmittedDate" and valueElement != undefined){
				Object__Employee__TermsAndCondition__EmployeeSubmittedDate___DMS_EMPLOYEE____EMPLOYEE_SUBMITTED_DATE.text =  valueElement;
			}
			else if(nameElement == "Object__Employee__TermsAndCondition__SpouseSubmittedDate" and valueElement != undefined){
				Object__Employee__TermsAndCondition__SpouseSubmittedDate___DMS_EMPLOYEE____EMPLOYEE_SPOUSE_SUBMITTED_DATE.text = valueElement;
			}
			else if(nameElement == "Object__Employee__TermsAndCondition__ApplicationStatus" and valueElement != null){
				employeeApplicationStatus = valueElement;
			}
		}
	}	
}

 	 /**
	  *To save date as MM/DD/YYYY format
	  */
	 dateFormatterToSave = function(month:TextInput,date:TextInput,year:TextInput){ 
	
	 
		var monthValue  = month.text;
		var dateValue = date.text;
		var yearValue = year.text;
		trace("monthValue:"+monthValue);
		trace("dateValue:"+dateValue);
		trace("yearValue:"+yearValue);
		if(isNaN(monthValue) || isNaN(dateValue) || isNaN(yearValue) || monthValue>12 || dateValue > 31 || yearValue.length<4 || yearValue.length>4 ){
	
			var mmddyyyyValue = "";
			/*informationMessage = Alert.show("Please enter the valid date as MM/DD/YYYY","Information", Alert.OK , this, myclickHandler, "stockIcon", Alert.OK);		
			informationMessage.move(450,280);*/
		}		
		else{
			
			mmddyyyyValue = (yearValue+monthValue+dateValue);		
			trace("mmddyyyyValue:>"+mmddyyyyValue);
		}
		return mmddyyyyValue;
	}
	
	/**
	 * To get the "yes or no" question detail from other coverage
	 * @author gnanaguru_g@solartis.net
	 */
	function getCombinedFormDetails()  {
		//var attributes:HashMap = new HashMap();
		var isEnableOtherCvg:Boolean = true;
		var isEnableContOtherCvg:Boolean = true;
		var isEnablePriorOtherCvg:Boolean = true;				 
		
		for(parentIndex = 0;parentIndex<global_employee_XML.firstChild.childNodes.length;parentIndex++){
			subApplicationName = global_employee_XML.firstChild.childNodes[parentIndex].attributes.Name;		
			if(subApplicationName=="Coverage Cont.") {
				for(childIndex=0;childIndex<global_employee_XML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
					
					var nameElement:String  = global_employee_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					var valueElement:String = global_employee_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
					
					if(nameElement=="Object__Employee__OtherCoverage__IsCoveredByMedicare" and valueElement != "undefined" and valueElement != undefined){
						Object__Employee__OtherCoverage__IsCoveredByMedicare___DMS_EMPLOYEE_OTHER_COVERAGE____COVERED_MEDICARE.setValue(valueElement);
						attributes.put(nameElement,valueElement);
						if(valueElement=="Y") {
							enableOtherCovAttributes();
							getOtherCovg=true;
							isEnableOtherCvg=false;
						}
					} else if(nameElement=="Object__Employee__OtherCoverage__IsKeepingOtherHealthCoverage" and valueElement!="undefined" and valueElement != undefined){
						Object__Employee__OtherCoverage__IsKeepingOtherHealthCoverage___DMS_EMPLOYEE_OTHER_COVERAGE____HEALTH_COVERAGE_OTHER.setValue(valueElement);
						attributes.put(nameElement,valueElement);
						if(valueElement=="Y") {
							enableContinuingCovAttributes();
							getContCovg=true;
							isEnableContOtherCvg =false;
						}
					} else if(nameElement=="Object__Employee__OtherCoverage__IsHaveAnyPriorOrEndingCoverage" and valueElement!="undefined" and valueElement != undefined){
						Object__Employee__OtherCoverage__IsHaveAnyPriorOrEndingCoverage___DMS_EMPLOYEE_OTHER_COVERAGE____PRIOR_ENDING_HEALTH_COVERAGE.setValue(valueElement);
						attributes.put(nameElement,valueElement);
						if(valueElement=="Y") {
							enablePriorEncodingAttributes();
							getPriorCovg=true;
							isEnablePriorOtherCvg = false;
						}
					} 
				}
			}
		}		
		if(isEnableOtherCvg) {
			disableOtherCovAttributes();
		}
		if(isEnableContOtherCvg) {
			disableContinuingCovAttributes();
		}
		if(isEnablePriorOtherCvg) {
			disablePriorEncodingAttributes();
		}
	}
	/**
* Method to skip the cursor to the next text box.
**/
skipToNextTextBox = function(sourceElement:TextInput,targetElement:TextInput,txtLength:Number,txtName:String){		
	if(sourceElement.text.length == txtLength){
		targetElement.setFocus();
	}	
}
	
validateDateField = function(monthValue,dateValue,yearValue){	
	if(isNaN(monthValue) || isNaN(dateValue) || isNaN(yearValue)){
		return true;
	}
	else{ 
		if(monthValue>12 || dateValue > 31 || yearValue.length<4 || yearValue.length>4 || yearValue<1900 || yearValue>2100 || yearValue==0000){
			return true;
		}
		else{
			return false;
		}
	}	
}	

/**
 *    Method to Validate Social Security Number
 */
 
 validateSocialSecurityNumberField = function(valueOne,valueTwo,valueThree){
	 	if(isNaN(valueOne) || isNaN(valueTwo) || isNaN(valueThree) || valueOne.length<3 || valueTwo.length<2|| valueThree.length<4){
			return true;
		}
		else{
			return false;
		}
 }
 

var popUpPKeyArr:Array;
retrieveEmployeeMedicalHealthDetail = function(medicalQuestionIdentifier:String){
	
	var subApplicationName :String;
	nameElementArray = new Array();
	valuElementArray = new Array();
	keyQuestionIdentifierArr = new Array();
	popUpPKeyArr = new Array();
	var myDP_array = new Array();
	var pKeyCheckArr = new Array();
	getSelfValuefromXML(global_employee_XML);
		
	for(j = 0;j<global_employee_XML_Extended.firstChild.childNodes.length;j++){
		subApplicationName = global_employee_XML_Extended.firstChild.childNodes[j].attributes.Name;
		trace("subApplicationName:>"+subApplicationName);
		if(subApplicationName == "Expl"){
			
			var repeatNameElement:String;
			var repeatValueElement:String;
			var count:Number = 0;
			var noOfRows:Number = 0;
			//Looop to extract the values from the XML.
			for(childIndex=0;childIndex < global_employee_XML_Extended.firstChild.childNodes[j].childNodes.length;childIndex++){
				repeatNameElement = global_employee_XML_Extended.firstChild.childNodes[j].childNodes[childIndex].firstChild.firstChild.nodeValue;
				repeatValueElement= global_employee_XML_Extended.firstChild.childNodes[j].childNodes[childIndex].lastChild.lastChild.nodeValue;
				nameElementArray[childIndex] = repeatNameElement;
				valuElementArray[childIndex] = repeatValueElement;									
				count = count + 1;
			}
			
			var quesIndx:Number = 0;
			//Loop to extract the Health Question Identifier from the Array built from XML.
			for(keyQIndx=0;keyQIndx<nameElementArray.length;keyQIndx++){
				if(nameElementArray[keyQIndx].indexOf("Object__Employee__MedExplanation__QuestionIdentifier")!=-1){
					if(valuElementArray[keyQIndx]==medicalQuestionIdentifier){
					keyQuestionIdentifierArr[quesIndx] = valuElementArray[keyQIndx];					
					pKeyCheckArr[quesIndx] = nameElementArray[keyQIndx].substr(nameElementArray[keyQIndx].indexOf("_____")+5,nameElementArray[keyQIndx].length);
					quesIndx++;
					}
				}
			}
			var colCount:Number = 0;
			var pKeyIndxpopup:Number=0;
			var keyIndex:Number=0;
			var isRightQIdentifier:Boolean = false;
			var patientName:String; var patientCondition:String; var treatmentStartDate:String;
			var treatmentEndDate:String; var treatmentSummary:String; var isRecovered:Boolean=false; var questionIdentifier:String;
			for(attArrIndx:Number = 0; attArrIndx < nameElementArray.length; attArrIndx++){
				if(pKeyCheckArr[keyIndex]==nameElementArray[attArrIndx].substr(nameElementArray[attArrIndx].indexOf("_____")+5,nameElementArray[attArrIndx].length)){
					if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__PatientName")!=-1){
						patientName = valuElementArray[attArrIndx];												
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__PatientCondition")!=-1){
						patientCondition = valuElementArray[attArrIndx];												
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__TreatmentStartDate")!=-1){
						treatmentStartDate = valuElementArray[attArrIndx];												
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__TreatmentEndDate")!=-1){
						treatmentEndDate = valuElementArray[attArrIndx];						
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__TreatmentSummary")!=-1){
						treatmentSummary = valuElementArray[attArrIndx];												
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__IsRecovered")!=-1){
						isRecovered = valuElementArray[attArrIndx];												
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__QuestionIdentifier")!=-1){						
						questionIdentifier = valuElementArray[attArrIndx];
						popUpPKeyArr[pKeyIndxpopup++] = nameElementArray[attArrIndx].substr(nameElementArray[attArrIndx].indexOf("_____")+5,nameElementArray[attArrIndx].length);						
					}
					colCount++;
					if(colCount % 7 ==0){				
						myDP_array.push({Name:patientName, Condition:patientCondition, StartDate:treatmentStartDate,EndDate:treatmentEndDate,Treatment:treatmentSummary,Recovered:isRecovered});
						keyIndex++;
						isRecovered=false;
					}
				}
			}
			//if no value is in the database .
			if(popupEnrollName.length >myDP_array.length && myDP_array.length==0){
				for(var popupCnt=0 ; popupCnt<popupEnrollName.length;popupCnt++){
					myDP_array.push({Name:popupEnrollName[popupCnt], Condition:"", StartDate:"",EndDate:"",Treatment:"",Recovered:false});					
				}
			}
			// if value available in the database for a right health question identifier.
			else if(popupEnrollName.length == myDP_array.length){
				for(var popupCnt=0;popupCnt<popupEnrollName.length;popupCnt++){
					myDP_array[popupCnt].Name = popupEnrollName[popupCnt];
					if(myDP_array[popupCnt].Recovered=="true"){
						myDP_array[popupCnt].Recovered=true;
					}else{
						myDP_array[popupCnt].Recovered=false;
					}					
				}
			}else if(popupEnrollName.length >myDP_array.length && myDP_array.length!=0){
				var myDP_array1:Array = new Array();
				var myDPCount:Number=0;
				for(var popupCnt=0;popupCnt<popupEnrollName.length;popupCnt++){					
					if(popupEnrollName[popupCnt]==myDP_array[myDPCount].Name){
						myDP_array1[popupCnt].Name = popupEnrollName[popupCnt];						
						var isRecoveredBoolean:Boolean=false;
						if(myDP_array[myDPCount].Recovered=="true"){
							isRecoveredBoolean=true;
						}else{
							isRecoveredBoolean=false;
						}
						myDP_array1.push({Name:popupEnrollName[popupCnt], Condition:myDP_array[myDPCount].Condition, StartDate:myDP_array[myDPCount].StartDate,EndDate:myDP_array[myDPCount].EndDate,Treatment:myDP_array[myDPCount].Treatment,Recovered:isRecoveredBoolean});
						myDPCount++;
						isRecoveredBoolean=false;
					}
					else{
						myDP_array1.push({Name:popupEnrollName[popupCnt], Condition:"", StartDate:"",EndDate:"",Treatment:"",Recovered:false});						
					}
				}
				myDP_array=myDP_array1;
			}
			explanationPopUpWindow.popupDG.dataProvider = myDP_array;
		}		
	}	
}

var medicalHealthQuestionPKey:Number;
retrieveEmployeeMedicalHealthDetail1 = function(medicalQuestionIdentifier:String){
	trace("medicalQuestionIdentifier::~"+medicalQuestionIdentifier);
	var subApplicationName :String;
	nameElementArray = new Array();
	valuElementArray = new Array();
	keyQuestionArr = new Array();
	medicalHealthQuestionPKey = 0;
	
	var attributeChildNode = global_employee_XML_Extended.firstChild.firstChild.firstChild.childNodes;		
	var subApplChildNode = global_employee_XML_Extended.firstChild.firstChild.childNodes;
	for(j = 0;j<global_employee_XML_Extended.firstChild.childNodes.length;j++){
		subApplicationName = global_employee_XML_Extended.firstChild.childNodes[j].attributes.Name;
		trace("subApplicationName:>"+subApplicationName);
		if(subApplicationName == "Expl"){
			var repeatNameElement:String;
			var repeatValueElement:String;
			var count:Number = 0;
			var noOfRows:Number = 0;//global_employee_XML_Extended
			for(childIndex=0;childIndex < global_employee_XML_Extended.firstChild.childNodes[j].childNodes.length;childIndex++){
				repeatNameElement = global_employee_XML_Extended.firstChild.childNodes[j].childNodes[childIndex].firstChild.firstChild.nodeValue;
				repeatValueElement= global_employee_XML_Extended.firstChild.childNodes[j].childNodes[childIndex].lastChild.lastChild.nodeValue;
				nameElementArray[childIndex] = repeatNameElement;
				valuElementArray[childIndex] = repeatValueElement;									
				count = count + 1;
			}
			var quesIndx:Number = 0;
			for(keyQIndx=0;keyQIndx<nameElementArray.length;keyQIndx++){
				if(nameElementArray[keyQIndx].indexOf("Object__Employee__MedExplanation__QuestionIdentifier")!=-1){
					keyQuestionArr[quesIndx] = valuElementArray[keyQIndx];					
					trace("keyQuestionArr["+quesIndx+"]::"+keyQuestionArr[quesIndx]);
					applAttributeName = nameElementArray[keyQIndx];
					if(keyQuestionArr[quesIndx] == medicalQuestionIdentifier){
						medicalHealthQuestionPKey = applAttributeName.substr(applAttributeName.indexOf("_____")+5,applAttributeName.length);						
					}
					++quesIndx;
				}
			}
			explanationPopUpWindow.MedicalHealthExplName.text ="";
			explanationPopUpWindow.MedicalHealthExplCondition.text ="";
			explanationPopUpWindow.MedicalHealthExplTreatmentDateMonth.text="";
			explanationPopUpWindow.MedicalHealthExplTreatmentDateDate.text="";
			explanationPopUpWindow.MedicalHealthExplTreatmentDateYear.text="";						
			explanationPopUpWindow.MedicalHealthExplTreatmentEndDateMonth.text="";
			explanationPopUpWindow.MedicalHealthExplTreatmentEndDateDate.text="";
			explanationPopUpWindow.MedicalHealthExplTreatmentEndDateYear.text="";						
			explanationPopUpWindow.MedicalHealthExplDiagnosis.text ="";
			explanationPopUpWindow.MedicalHealthExplIsRecovered.setValue();
			var QIndx:Number = 0;
			trace("~~~~~~~nameElementArray.length~~~"+nameElementArray.length);
			for(attArrIndx:Number = 0; attArrIndx < nameElementArray.length; attArrIndx++){
				trace("valuElementArray["+attArrIndx+"]:>"+valuElementArray[attArrIndx]);
				if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__PatientName")!=-1){														
					if(keyQuestionArr[QIndx]==medicalQuestionIdentifier && valuElementArray[attArrIndx]!=undefined){
						explanationPopUpWindow.MedicalHealthExplName.text = valuElementArray[attArrIndx];						
					}
				}
				if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__PatientCondition")!=-1){										
					if(keyQuestionArr[QIndx]==medicalQuestionIdentifier && valuElementArray[attArrIndx]!=undefined){
						explanationPopUpWindow.MedicalHealthExplCondition.text = valuElementArray[attArrIndx];						
					}
				}
				if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__TreatmentStartDate")!=-1){										
					if(keyQuestionArr[QIndx]==medicalQuestionIdentifier && valuElementArray[attArrIndx]!=undefined){
						var valueMedExplTreatmentStartDate = valuElementArray[attArrIndx];
						var index = valueMedExplTreatmentStartDate.split("-");
						explanationPopUpWindow.MedicalHealthExplTreatmentDateMonth.text=index[1];
						explanationPopUpWindow.MedicalHealthExplTreatmentDateDate.text=index[2];
						explanationPopUpWindow.MedicalHealthExplTreatmentDateYear.text=index[0];						
					}
				}
				if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__TreatmentEndDate")!=-1){										
					if(keyQuestionArr[QIndx]==medicalQuestionIdentifier && valuElementArray[attArrIndx]!=undefined){
						var valueMedExplTreatmentEndDate = valuElementArray[attArrIndx];
						var index = valueMedExplTreatmentEndDate.split("-");
						explanationPopUpWindow.MedicalHealthExplTreatmentEndDateMonth.text=index[1];
						explanationPopUpWindow.MedicalHealthExplTreatmentEndDateDate.text=index[2];
						explanationPopUpWindow.MedicalHealthExplTreatmentEndDateYear.text=index[0];						
					}
				}
				if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__TreatmentSummary")!=-1){										
					if(keyQuestionArr[QIndx]==medicalQuestionIdentifier && valuElementArray[attArrIndx]!=undefined){
						explanationPopUpWindow.MedicalHealthExplDiagnosis.text = valuElementArray[attArrIndx];						
					}
				}
				if(nameElementArray[attArrIndx].indexOf("Object__Employee__MedExplanation__IsRecovered")!=-1){										
					if(keyQuestionArr[QIndx]==medicalQuestionIdentifier && valuElementArray[attArrIndx]!=undefined){
						explanationPopUpWindow.MedicalHealthExplIsRecovered.setValue(valuElementArray[attArrIndx]);						
					}
				}
				if((attArrIndx+1)%7 == 0){
					++QIndx;
				}
			}
		}
	}	
}