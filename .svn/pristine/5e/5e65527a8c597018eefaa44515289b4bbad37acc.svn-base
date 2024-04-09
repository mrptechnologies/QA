
import com.lib.data.holder.map.HashMap;
import mx.controls.Alert;
import mx.styles.CSSStyleDeclaration;
import mx.controls.DataGrid;
import mx.controls.gridclasses.DataGridColumn;
import mx.controls.ComboBox;
import mx.controls.TextInput;
import mx.controls.NumericStepper;
import mx.controls.RadioButtonGroup;
import mx.controls.RadioButton;
	var new_style:Object = new CSSStyleDeclaration();
	_global.styles.myStyle = new_style; 
	_global.styles.TextInput = new CSSStyleDeclaration();
	_global.styles.TextArea = new CSSStyleDeclaration();
	_global.styles.Alert.setStyle("themeColor", 0xF6F6F6);
	_global.styles.Alert.setStyle("backgroundColor",0xF6F6F6);
	_global.styles.Alert.setStyle("borderStyle", outset);
	_global.styles.Alert.setStyle("skinTitleBackground", 0xF6F6F6);
	var titleStyles = new CSSStyleDeclaration();
	_global.styles.title_style = titleStyles; 
	titleStyles.setStyle("PanelBackgroundColor", 0x99C9F7);
	titleStyles.setStyle("textColor", 0xFFFFFF);
	titleStyles.setStyle("color", 0xFFFFFF);
	titleStyles.setStyle("fontWeight", "bold");
	Alert.titleStyleDeclaration = titleStyles;
	saveMessage.setStyle("styleName", "title_style");
	_global.styles.TextInput.setStyle("borderColor", 0xF0EEEC);	
	/*Setting Style for ComboBox Component*/
	new_style.setStyle("textAlign", "left");
	new_style.setStyle("selectionColor", 0xF0F9FD);
	new_style.setStyle("useRollOver", false);
	
	Object__Customer__State.setStyle("styleName", "myStyle");
	/*Setting Style for DataGrid Component*/
	var dataGrid_style:Object = new CSSStyleDeclaration();
	_global.styles.mydataGrid_style = dataGrid_style; 
	dataGrid_style.setStyle("textAlign", "left");
	dataGrid_style.setStyle("useRollOver", false);
	dataGrid_style.setStyle("vGridLines", true);
	dataGrid_style.setStyle("hGridLines", true);
	dataGrid_style.setStyle("headerColor", 0x99C9F7);
	dataGrid_style.setStyle("themeColor",0xF0F9FD);
	currentPrior_dataGrid.setStyle("styleName", "mydataGrid_style");
	validation_DataGridA.setStyle("styleName", "mydataGrid_style");
	validation_DataGridB.setStyle("styleName", "mydataGrid_style");
	validation_DataGridC.setStyle("styleName", "mydataGrid_style");
	validation_DataGridD.setStyle("styleName", "mydataGrid_style");
	/*Setting Style for DateField Component*/
	var dateField_style:Object = new CSSStyleDeclaration();
	_global.styles.mydateField_Style = dateField_style; 
	dateField_style.setStyle("themeColor",0xF0F9FD);
	dateField_style.setStyle("backgroundColor",0xFFFFFF);
	dateField_style.setStyle("headerColor",0xF0F9FD);
	dateField_style.setStyle("todayColor",0x99CCFF);
	date.setStyle("styleName", "mydateField_Style");
		
	//Object__Customer__MedicalMutualPlan__ProposedEffectiveDate___DMS_CUSTOMER_PLAN____MEDICAL_MUTUAL_PLAN_EFFECTIVE_DATE.setStyle("styleName", "mydateField_Style");
	//Object__Customer__SuperDentalPlan__ProposedEffectiveDate___DMS_CUSTOMER_PLAN____DENTAL_PLAN_EFFECTIVE_DATE.setStyle("styleName", "mydateField_Style");
	//Object__Customer__VsionServicePlan__ProposedEffectiveDate___DMS_CUSTOMER_PLAN____VISION_SERVICE_PLAN_EFFECTIVE_DATE.setStyle("styleName", "mydateField_Style");
	//Object__Customer__LifeInsurance__ProposedEffectiveDate___DMS_CUSTOMER_PLAN____LIFE_INS_PROPOSED_EFFECTIVE_DATE.setStyle("styleName", "mydateField_Style");
	
	
	//Object__CustomerAdditional__BusinessStartDate.setStyle("styleName", "mydateField_Style");
	
	var rehire:Array;
	rehire= [{label:"---Select----", data:""},
			{label:"Date of Hire", data:"Date of Hire"},
			{label:"30 days following Date of Hire", data:"30 days following Date of Hire"},
			{label:"60 days following Date of Hire", data:"60 days following Date of Hire"},
			{label:"90 days following Date of Hire", data:"90 days following Date of Hire"},
			{label:"First of month following Date of Hire", data:"First of month following Date of Hire"},
			{label:"First of month following 30 days", data:"First of month following 30 days"},
			{label:"First of month following 60 days", data:"First of month following 60 days"}
			];
				
	var major_Ver_Number:String = "1";
	var minor_Ver_Number:String = ".04";
	
	var informationMessage;
	var validationAMap:HashMap = new HashMap();
	var validationBMap:HashMap = new HashMap();
	var validationCMap:HashMap = new HashMap();
	var validationDMap:HashMap = new HashMap();	
	var employerApplicationStatus:String;
	
	function isInteger(data:String ,errorMessage:String,focusAttribute:String){   
		var index;
		for (index = 0; index < data.length; index++)
		{   
			// Check that current character is number.
			var c = data.charAt(index);
			if (((c < "0") or (c > "9"))) {
				// Define action after alert confirmation.
				var myclickHandler:Function = function (evt_obj:Object) {
					if (evt_obj.detail == Alert.OK) {
						isModified = false;
						Selection.setFocus(focusAttribute);
					}
				};
				// Show alert dialog box.
				Alert.show(errorMessage, "Information", Alert.OK , this, myclickHandler, "stockIcon", Alert.OK);	
				return false;
			}
		}
		// All characters are numbers.
		return true;
	}
	formatDate = function(date:String){
		var dateArray = date.split("/");
		var formattedDate = date;
		if(dateArray.length == 3){
			formattedDate = dateArray[2]+"/"+dateArray[0]+"/"+dateArray[1];
		}
		return formattedDate;
	}
	reformateDate = function(date:String){
		var formattedDate = date;
		var index = date.split("-");
		if(index.length == 3){
			formattedDate = index[1]+"/"+index[2]+"/"+index[0];
		}
		return formattedDate;
	}
	validateField = function(instance:TextInput,errorText:Alert){	
		var isEmpty:Boolean = true;
		if(instance.length<1){
			var myclickHandler:Function = function (evt_obj:Object) {
				if (evt_obj.detail == Alert.OK) {
					//isModified = false;
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
	validateMantatoryStepperComponent = function(instance:NumericStepper,errorText:Alert){	
		var isEmpty:Boolean = true;
		if(instance.value == 0){
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
	validateRadioButton = function(instance:RadioButton,errorText:Alert){
		var isEmpty:Boolean = true;
		if(!(instance.selected)){
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

	// Method to check whether data is in currency format or not. Will work like isNaN();
	function isNotCurrencyFormat(data1:String){
		var index;		
		for (index = 0; index < data1.length; index++){
			var char = data1.charAt(index);			
			if(!((char=="$") or (char==",") or (char==".") or (char=="0") or (char=="1") or (char=="2") or (char=="3") or (char=="4") or (char=="5") or (char=="6") or (char=="7") or (char=="8") or (char=="9"))){
				return true;
			}
		}
		return false;
	}


/*Retrieving method for retrieve attributes data in Group Information Tab*/
retreiveGroupInformation = function(){
	var subApplicationName:String="";
	verNum_GrpCmpy.text = major_Ver_Number+minor_Ver_Number;
	for(parentIndex = 0;parentIndex<global_employer_XML.firstChild.childNodes.length;parentIndex++){
		subApplicationName = global_employer_XML.firstChild.childNodes[parentIndex].attributes.Name;		
		if(subApplicationName == "ADD EDIT CUSTOMER"){
			for(childIndex=0;childIndex<global_employer_XML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
				
				var nameElement:String  = global_employer_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				var valueElement:String = global_employer_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
				
				if(nameElement=="Object__CustomerAdditional__EnrollmentType" and valueElement != null){
					Object__CustomerAdditional__EnrollmentType.setValue(valueElement);
				}
				else if(nameElement=="Object__Customer__CustomerName" and valueElement != null){
					Object__Customer__CustomerName.text = valueElement;
				}
				else if(nameElement=="Object__CustomerAdditional__BusinessKnownByAnotherName" and valueElement != null){
					Object__CustomerAdditional__BusinessKnownByAnotherName.setValue(valueElement);
					if(Object__CustomerAdditional__BusinessKnownByAnotherName.getValue() == "N"){
						Object__CustomerAdditional__CutomerAnotherName.enabled = false;
					}else if(Object__CustomerAdditional__BusinessKnownByAnotherName.getValue() == "Y"){
						Object__CustomerAdditional__CutomerAnotherName.enabled = true;
					}
				}
				
				else if(nameElement=="Object__CustomerAdditional__GroupAppliedwithMMO" and valueElement != null){
					Object__CustomerAdditional__GroupAppliedwithMMO.setValue(valueElement);
				}
				
				else if(nameElement=="Object__CustomerAdditional__EmployerContributionAtLeast25Percentage" and valueElement != null){
					Object__CustomerAdditional__EmployerContributionAtLeast25Percentage.setValue(valueElement);
				}				
				else if(nameElement=="Object__CustomerAdditional__CutomerAnotherName" and valueElement != null){
					Object__CustomerAdditional__CutomerAnotherName.text = valueElement;
				}
				else if(nameElement=="Object__Customer__CustomerNumber" and valueElement != null){
					Object__Customer__CustomerNumber.text = valueElement;
				}
				else if(nameElement=="Object__CustomerAdditional__BillingContact" and valueElement != null){
					Object__CustomerAdditional__BillingContact.text = valueElement;
				}
				else if(nameElement=="Object__CustomerAdditional__BusinessAddress" and valueElement != null){
					if(valueElement.indexOf("\n")!=-1){
						var orgText = valueElement.split("\n");
						var txt="";
						for(var i=0;i<orgText.length;i++){
							var nm=orgText[i];
							for(var k=0;k<nm.length;k++){
								var txt1 = nm.charAt(k);
								if(txt1!="\r"){
									txt+=txt1;
								}
							}
							txt=txt+"\r";
						}
						Object__CustomerAdditional__BusinessAddress.text = txt;
					}else{
						Object__CustomerAdditional__BusinessAddress.text = valueElement;
					}
				}
				else if(nameElement=="Object__CustomerAdditional__BillingAddress" and valueElement != null){
					if(valueElement.indexOf("\n")!=-1){
						var orgText = valueElement.split("\n");
						var txt="";
						for(var i=0;i<orgText.length;i++){
							var newText=orgText[i];
							for(var k=0;k<newText.length;k++){
								var txt1 = newText.charAt(k);
								if(txt1!="\r"){
									txt+=txt1;
								}
							}
							txt=txt+"\r";
						}
						Object__CustomerAdditional__BillingAddress.text = txt;
					}else{
						Object__CustomerAdditional__BillingAddress.text = valueElement;
					}
				}
				else if(nameElement=="Object__Customer__City" and valueElement != null){
					Object__Customer__City.text = valueElement;
				}
				else if(nameElement=="Object__Customer__County" and valueElement != null){
					Object__Customer__County.text = valueElement;
				}
				else if(nameElement=="Object__Customer__State" and valueElement != null){
					retreiveSateLabel(valueElement,stateArray,"Object__Customer__State");
					}
				else if(nameElement=="Object__Customer__Zip" and valueElement != null){
					Object__Customer__Zip.text = valueElement;
				}
				else if(nameElement=="Object__CustomerAdditional__ExecutiveOfficer" and valueElement != null){
					Object__CustomerAdditional__ExecutiveOfficer.text = valueElement;
				}
				else if(nameElement =="Object__Customer__WorkPhoneAreaCode" and valueElement != null){
					Object__Customer__WorkPhoneAreaCode.text = valueElement;
				}
				else if(nameElement =="Object__Customer__WorkPhoneExchangeCode" and valueElement != null){
					Object__Customer__WorkPhoneExchangeCode.text = valueElement;
				}
				else if(nameElement == "Object__Customer__WorkPhone" and valueElement != null ){
					Object__Customer__WorkPhone.text = valueElement;
				}
				else if(nameElement == "Object__Customer__FaxAreaCode" and valueElement != null){
					Object__Customer__FaxAreaCode.text = valueElement;
				}
				else if(nameElement =="Object__Customer__FaxExchangeCode" and valueElement != null){
					Object__Customer__FaxExchangeCode.text = valueElement;
				}
				else if(nameElement == "Object__Customer__Fax" and valueElement != null){
					Object__Customer__Fax.text = valueElement;
				}
				else if(nameElement == "Object__Customer__EMailAddress" and valueElement != null ){
					Object__Customer__EMailAddress.text = valueElement;
				}
				else if(nameElement == "Object__CustomerAdditional__NumberofYrsInBusiness" and valueElement != null){
					Object__CustomerAdditional__NumberofYrsInBusiness.value = valueElement;
				}
				else if(nameElement =="Object__CustomerAdditional__BusinessStartDate" and  valueElement != null){
					if(valueElement == ""){
						Object__CustomerAdditional__BusinessStartDate.text = "";
					}
					var valueEffectiveDate = valueElement;
					var index = valueEffectiveDate.split("/");
					var valEffextiveDate = index[1]+"/"+index[2]+"/"+index[0];
					Object__CustomerAdditional__BusinessStartDate.text = valEffextiveDate;
				}
				/*else if(nameElement == "Object__CustomerAdditional__BusinessType" and valueElement != null){
					Object__CustomerAdditional__BusinessType.text = valueElement;
				}*/
				else if(nameElement == "Object__CustomerAdditional__BusinessType" and valueElement != null){
					if(valueElement.indexOf("\n")!=-1){
						var orgText = valueElement.split("\n");
						var txt="";
						for(var i=0;i<orgText.length;i++){
							var newText=orgText[i];
							for(var k=0;k<newText.length;k++){
								var txt1 = newText.charAt(k);
								if(txt1!="\r"){
									txt+=txt1;
								}
							}
							txt=txt+"\r";
						}
						Object__CustomerAdditional__BusinessType.text = txt;
					}else{
						Object__CustomerAdditional__BusinessType.text = valueElement;
					}
				}
				else if(nameElement == "Object__CustomerAdditional__SicCode" and valueElement != null){
					Object__CustomerAdditional__SicCode.text = valueElement;
				}
				else if(nameElement == "Object__CustomerAdditional__FederalTaxId" and valueElement != null){
					Object__CustomerAdditional__FederalTaxId.text = valueElement;
				}
				else if(nameElement == "Object__CustomerAdditional__AnyAffiliationWithOtherCompanies" and valueElement != null){
					Object__CustomerAdditional__AnyAffiliationWithOtherCompanies.setValue(valueElement);
					if(valueElement == "N"){
						Object__CustomerAdditional__Affliations.text = "";
						Object__CustomerAdditional__AffliationsQualified.text = "";
						Object__CustomerAdditional__Affliations.enabled = false;
						Object__CustomerAdditional__AffliationsQualified.enabled = false;
					}else{
						Object__CustomerAdditional__Affliations.enabled = true;
						Object__CustomerAdditional__AffliationsQualified.enabled = true;
					}
				}
				else if(nameElement == "Object__CustomerAdditional__Affliations" and valueElement != null){
					if(valueElement.indexOf("\n")!=-1){
						var orgText = valueElement.split("\n");
						var txt="";
						for(var i=0;i<orgText.length;i++){
							var newText=orgText[i];
							for(var k=0;k<newText.length;k++){
								var txt1 = newText.charAt(k);
								if(txt1!="\r"){
									txt+=txt1;
								}
							}
							txt=txt+"\r";
						}
						Object__CustomerAdditional__Affliations.text = txt;
					}else{
						Object__CustomerAdditional__Affliations.text = valueElement;
					}
				}
				else if(nameElement == "Object__CustomerAdditional__AffliationsQualified" and valueElement != null){
					Object__CustomerAdditional__AffliationsQualified.text = valueElement;
				}
				else if(nameElement == "Object__CustomerAdditional__DunBradstreet" and valueElement != null){
					Object__CustomerAdditional__DunBradstreet.text = valueElement;
				}
				else if(nameElement == "Object__CustomerAdditional__GroupMMO" and valueElement != null){
					Object__CustomerAdditional__GroupMMO.text = valueElement;
				}
				else if(nameElement == "GeneralAgency__AgencyId" and valueElement != null){
					generalAgencyId = valueElement;
				}
				else if(nameElement == "Agency__AgencyId" and valueElement != null){
					agencyId = valueElement;
				}
				else if(nameElement == "AgentId" and valueElement != null){
					agentId = valueElement;
				}
				else if(nameElement == "Object__Customer__Status" and valueElement != null){
					employerApplicationStatus = valueElement;
				}			
			}
		}
	}	
	freezeTab("GroupCompanyInformation");
};

/*Retrieving method for retrieve attributes data in Enrollment Criteria Tab*/
reteieveData = function(){
	var subApplicationName:String="";
	verNum_EnrCrt.text = major_Ver_Number+minor_Ver_Number;
	for(j = 0;j<global_employer_XML.firstChild.childNodes.length;j++){
		subApplicationName = global_employer_XML.firstChild.childNodes[j].attributes.Name;		
		if(subApplicationName == "EnrolmentCriteria"){
			for(i=0;i<global_employer_XML.firstChild.childNodes[j].childNodes.length;i++){			
				var nameElement:String  = global_employer_XML.firstChild.childNodes[j].childNodes[i].firstChild.firstChild.nodeValue;
				var valueElement:String = global_employer_XML.firstChild.childNodes[j].childNodes[i].lastChild.lastChild.nodeValue;
				if(nameElement=="Object__Customer__EntrollmentCriteria__NumberofCurrentEmployeesActive" and valueElement != null){
					ns2.value = String(valueElement);
				}
				else if(nameElement=="Object__Customer__EntrollmentCriteria__NumberofCurrentEmployeesCOBRA" and valueElement != null){
					ns3.value = valueElement;
				}
				else if(nameElement=="Object__Customer__EntrollmentCriteria__NumberofCurrentEmployeesRetired" and valueElement != null){
					ns4.value = valueElement;
				}
				else if(nameElement=="Object__Customer__EntrollmentCriteria__NumberofEligibleEmployeesActive" and valueElement != null){
					ns5.value = valueElement;
				}
				else if(nameElement=="Object__Customer__EntrollmentCriteria__NumberofEligibleEmployeesCOBRA" and valueElement != null){
					ns6.value = valueElement;
				}
				else if(nameElement=="Object__Customer__EntrollmentCriteria__NumberofEligibleEmployeesRetired" and valueElement != null){
					ns7.value = valueElement;
				}
				else if(nameElement=="Object__Customer__EntrollmentCriteria__NumberofApplyingEligibleEmployeesActive" and valueElement != null){
					ns8.value = valueElement;
				}
				else if(nameElement=="Object__Customer__EntrollmentCriteria__NumberofApplyingEligibleEmployeesCOBRA" and valueElement != null){
					ns9.value = valueElement;
				}
				else if(nameElement=="Object__Customer__EntrollmentCriteria__NumberofApplyingEligibleEmployeesRetired" and valueElement != null){
					ns10.value = valueElement;
				}
				else if(nameElement=="Object__Customer__EntrollmentCriteria__NumberofCurrentEmployeesActive" and valueElement != null){
					ns2.value = valueElement;
				}
				else if(nameElement=="Object__Customer__EntrollmentCriteria__NumberofIneligibleEmployeesActive" and valueElement != null){
					ns11.value= valueElement;
				}
				else if(nameElement =="Object__Customer__EntrollmentCriteria__NumberofIneligibleEmployeesCOBRA" and valueElement != null){
					ns12.value= valueElement;
				}
				else if(nameElement =="Object__Customer__EntrollmentCriteria__NumberofIneligibleEmployeesRetired" and valueElement != null){
					ns13.value = valueElement;
				}
				else if(nameElement == "Object__Customer__EntrollmentCriteria__MinHoursWorkedPerWeek" and valueElement != null ){
					ns1.value = valueElement;
				}
				else if(nameElement =="Object__Customer__EntrollmentCriteria__ProbationPeriodforNewHire" and valueElement != null){
					Object__Customer__EntrollmentCriteria__ProbationPeriodforNewHire___DMS_CUSTOMER_ENROLLMENT_CRITERIA____PROBATION_PERIOD_NEW_HIRE.setValue(valueElement);
				}
				else if(nameElement == "Object__Customer__EntrollmentCriteria__ProbationPeriodforReHire" and valueElement != null){
					Object__Customer__EntrollmentCriteria__ProbationPeriodforReHire___DMS_CUSTOMER_ENROLLMENT_CRITERIA____PROBATION_PERIOD_REHIRE.setValue(valueElement);
					if( valueElement == "Sameasabove")
					{
						t1.selectedIndex=0;
						t1.enabled = false;						
					}
				}
				
				else if(nameElement =="Object__Customer__EntrollmentCriteria__ProbationPeriodforReHireOther" and valueElement != null){				
				    trace(valueElement);
					retreiveRehire(valueElement,rehire,t1);												
				}
				else if(nameElement == "Object__Customer__EntrollmentCriteria__ProbationPeriodforReHireOther" and valueElement != null){
					t1.value = valueElement;
				}				
				else if(nameElement == "Object__Customer__EntrollmentCriteria__ProbationaryForInitial" and valueElement != null){
					Object__Customer__EntrollmentCriteria__ProbationaryForInitial___DMS_CUSTOMER_ENROLLMENT_CRITERIA____PROBATION_PERIOD_INITIAL.setValue(valueElement);
				}
			}
		}
	}
};

	retreiveRehire = function(valueElement:String,array:Array,combo:ComboBox){
				var Idx=0;				
				for(inx=0;inx<array.length;inx++) {
					 if(array[inx].data == valueElement) {					
					  Idx=inx;
			  		inx=array.length+1;
				 }
				}				
				combo.selectedIndex=Idx;
			}

/*Retrieving method for retrieve attributes data in Medical Mutual Tab*/
retreiveMedicalMutual = function(){
	var subApplicationName:String="";	
	verNum_MMP.text = major_Ver_Number+minor_Ver_Number;
	checkBoxValue=0;	
	for(parentIndex = 0;parentIndex<global_employer_XML.firstChild.childNodes.length;parentIndex++){
		subApplicationName = global_employer_XML.firstChild.childNodes[parentIndex].attributes.Name;		
		if(subApplicationName == "MMOPlans"){
			for(childIndex=0;childIndex<global_employer_XML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
				
				var nameElement:String  = global_employer_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				var valueElement:String = global_employer_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
				
				if(nameElement=="Object__Customer__MedicalMutualPlan__IsEmployerContribute" and valueElement != null){
					Object__Customer__MedicalMutualPlan__IsEmployerContribute___DMS_CUSTOMER_PLAN____IS_EMPLOYER_CONTRIBUTE.setValue(valueElement);
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlusMultipleOption__100Plan" and valueElement != null){
					Object__Customer__MMO__SupermedPlusMultipleOption__100Plan___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_MULTIPLE_OPTION_100PLAN.selected = true;
					checkBoxValue=checkBoxValue+1;
					
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlusMultipleOption__90Plan" and valueElement != null){
					Object__Customer__MMO__SupermedPlusMultipleOption__90Plan___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_MULTIPLE_OPTION_90PLAN.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlusMultipleOption__80Plan" and valueElement != null){
					Object__Customer__MMO__SupermedPlusMultipleOption__80Plan___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_MULTIPLE_OPTION_80PLAN.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlusClassicGold__250_500" and valueElement != null){
					Object__Customer__MMO__SupermedPlusClassicGold__250_500___DMS_CUSTOMER_PLAN____SUPERMED_CLASSIC_GOLD_250_500.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlusClassicGold__750_1500" and valueElement != null){
					Object__Customer__MMO__SupermedPlusClassicGold__750_1500___DMS_CUSTOMER_PLAN____SUPERMED_CLASSIC_GOLD_750_1500.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlusClassicGold__500_1000" and valueElement != null){
					Object__Customer__MMO__SupermedPlusClassicGold__500_1000___DMS_CUSTOMER_PLAN____SUPERMED_CLASSIC_GOLD_500_1000.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlusClassicGold__1000_2000" and valueElement != null){
					Object__Customer__MMO__SupermedPlusClassicGold__1000_2000___DMS_CUSTOMER_PLAN____SUPERMED_CLASSIC_GOLD_1000_2000.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlus__250__500" and valueElement != null){
					Object__Customer__MMO__SupermedPlus__250__500___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_250_500.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlus__750__1500" and valueElement != null){
					Object__Customer__MMO__SupermedPlus__750__1500___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_750_1500.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlus__500__1000" and valueElement != null){
					Object__Customer__MMO__SupermedPlus__500__1000___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_500_1000.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlus__1000__2000" and valueElement != null){
					Object__Customer__MMO__SupermedPlus__1000__2000___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_1000_2000.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlus__1000__3000" and valueElement != null){
					Object__Customer__MMO__SupermedPlus__1000__3000___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_1000_3000.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlus__2080__250" and valueElement != null){
					Object__Customer__MMO__SupermedPlus__2080__250___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_2080_250.selected = true;
					checkBoxValue=checkBoxValue+1;
				}//
				else if(nameElement=="Object__Customer__MMO__SupermedPlus__2080__750" and valueElement != null){
					Object__Customer__MMO__SupermedPlus__2080__750___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_2080_750.selected = true;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlus__2080__1000" and valueElement != null){
					Object__Customer__MMO__SupermedPlus__2080__1000___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_2080_1000.selected = true;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlus__2000__4000" and valueElement != null){
					Object__Customer__MMO__SupermedPlus__2000__4000___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_2000_4000.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlus__2000__6000" and valueElement != null){
					Object__Customer__MMO__SupermedPlus__2000__6000___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_2000_6000.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlus__2080__500" and valueElement != null){
					Object__Customer__MMO__SupermedPlus__2080__500___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_2080_500.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlus__3000__9000" and valueElement != null){
					Object__Customer__MMO__SupermedPlus__3000__9000___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_3000_9000.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlusHSA__2500_500" and valueElement != null){
					Object__Customer__MMO__SupermedPlusHSA__2500_500___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_HSA_2500_500.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlusHSA__1500_100" and valueElement != null){
					Object__Customer__MMO__SupermedPlusHSA__1500_100___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_HSA_1500_100.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlusHSA__3000_100" and valueElement != null){
					Object__Customer__MMO__SupermedPlusHSA__3000_100___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_HSA_3000_100.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlusHSA__4000_100" and valueElement != null){
					Object__Customer__MMO__SupermedPlusHSA__4000_100___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_HSA_4000_100.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MMO__SupermedPlusHSA__5000_100" and valueElement != null){
					Object__Customer__MMO__SupermedPlusHSA__5000_100___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_HSA_5000_100.selected = true;
					checkBoxValue=checkBoxValue+1;
				}
				else if(nameElement=="Object__Customer__MedicalMutualPlan__HMOHealthOhio" and valueElement != null){
					Object__Customer__MedicalMutualPlan__HMOHealthOhio___DMS_CUSTOMER_PLAN____HMO_HEALTH_OHIO.selected = true;
					checkBoxValue=checkBoxValue+1;
					Object__Customer__MedicalMutualPlan__PrtscriptionDrugCard___DMS_CUSTOMER_PLAN____PRESCRIPTION_DRUG_CARD.selected = true;
				}
				else if(nameElement=="Object__Customer__MedicalMutualPlan__PrtscriptionDrugCard" and valueElement != null){
					if(!(Object__Customer__MMO__SupermedPlusHSA__2500_500___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_HSA_2500_500.selected or
					   Object__Customer__MMO__SupermedPlusHSA__3000_100___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_HSA_3000_100.selected or
					   Object__Customer__MMO__SupermedPlusHSA__4000_100___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_HSA_4000_100.selected or 
					   Object__Customer__MMO__SupermedPlusHSA__5000_100___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_HSA_5000_100.selected or 
					   Object__Customer__MMO__SupermedPlusClassicGold__1000_2000___DMS_CUSTOMER_PLAN____SUPERMED_CLASSIC_GOLD_1000_2000.selected or
					   Object__Customer__MMO__SupermedPlus__1000__2000___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_1000_2000.selected or 
					   Object__Customer__MMO__SupermedPlus__2000__4000___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_2000_4000.selected or 
					   Object__Customer__MedicalMutualPlan__Medfil___DMS_CUSTOMER_PLAN____MEDIPLAN.selected or 
					   Object__Customer__MedicalMutualPlan__MedfilwithoutDrug___DMS_CUSTOMER_PLAN____MEDIPLAN_WITHOUT_DRUG.selected or
					   Object__Customer__MedicalMutualPlan__MedfilCarveOut___DMS_CUSTOMER_PLAN____MEDIPLAN_CARVE_OUT.selected)){
						
						Object__Customer__MedicalMutualPlan__PrtscriptionDrugCard___DMS_CUSTOMER_PLAN____PRESCRIPTION_DRUG_CARD.selected = true;
					}
					else{
						Object__Customer__MedicalMutualPlan__PrtscriptionDrugCard___DMS_CUSTOMER_PLAN____PRESCRIPTION_DRUG_CARD.selected = false;
						Object__Customer__MedicalMutualPlan__PrtscriptionDrugCard___DMS_CUSTOMER_PLAN____PRESCRIPTION_DRUG_CARD.enabled = false;
					}
				}
				else if(nameElement=="Object__Customer__MedicalMutualPlan__Medfil" and valueElement != null){
					Object__Customer__MedicalMutualPlan__Medfil___DMS_CUSTOMER_PLAN____MEDIPLAN.selected = true;
				}
				else if(nameElement=="Object__Customer__MedicalMutualPlan__MedfilwithoutDrug" and valueElement != null){
					Object__Customer__MedicalMutualPlan__MedfilwithoutDrug___DMS_CUSTOMER_PLAN____MEDIPLAN_WITHOUT_DRUG.selected = true;
				}
				else if(nameElement=="Object__Customer__MedicalMutualPlan__MedfilCarveOut" and valueElement != null){
					Object__Customer__MedicalMutualPlan__MedfilCarveOut___DMS_CUSTOMER_PLAN____MEDIPLAN_CARVE_OUT.selected = true;
				}
				//
				/*else if(nameElement=="Object__Customer__MedicalMutualPlan__PrescriptionDrugCardoption1" and valueElement != null){
					Object__Customer__MedicalMutualPlan__PrescriptionDrugCardoption1___DMS_CUSTOMER_PLAN____PRESCRIPTION_DRUG_CARD_OP1.selected = true;
				}
				else if(nameElement=="Object__Customer__MedicalMutualPlan__PrescriptionDrugCardoption2" and valueElement != null){
					Object__Customer__MedicalMutualPlan__PrescriptionDrugCardoption2___DMS_CUSTOMER_PLAN____PRESCRIPTION_DRUG_CARD_OP2.selected = true;
				}
				else if(nameElement=="Object__Customer__MedicalMutualPlan__PrescriptionDrugCardoption3" and valueElement != null){
					Object__Customer__MedicalMutualPlan__PrescriptionDrugCardoption3___DMS_CUSTOMER_PLAN____PRESCRIPTION_DRUG_CARD_OP3.selected = true;
				}
				else if(nameElement=="Object__Customer__MedicalMutualPlan__PrescriptionDrugCardoption4" and valueElement != null){
					Object__Customer__MedicalMutualPlan__PrescriptionDrugCardoption4___DMS_CUSTOMER_PLAN____PRESCRIPTION_DRUG_CARD_OP4.selected = true;
				}*/
				else if(nameElement =="Object__Customer__MedicalMutualPlan__PrescriptionDrugCardoption1" and valueElement != null){
					Object__Customer__MedicalMutualPlan__PrescriptionDrugCardoption1___DMS_CUSTOMER_PLAN____PRESCRIPTION_DRUG_CARD_OP1.setValue(valueElement);
				}
				else if(nameElement=="Object__Customer__MedicalMutualPlan__SupermedPlusHRA" and valueElement != null){
					Object__Customer__MedicalMutualPlan__SupermedPlusHRA___DMS_CUSTOMER_PLAN____SUPERMED_PLUS_HRA.selected = true;
				}
				else if(nameElement=="Object__Customer__MedicalMutualPlan__ProposedEffectiveDate" and valueElement != null and valueElement!="0000-00-00"){
					var valueEffectiveDate = valueElement;
					var index = valueEffectiveDate.split("-");
					var valEffextiveDate = index[1]+"/"+index[2]+"/"+index[0];
					Object__Customer__MedicalMutualPlan__ProposedEffectiveDate___DMS_CUSTOMER_PLAN____MEDICAL_MUTUAL_PLAN_EFFECTIVE_DATE.text = valEffextiveDate;
				}
			}
		}
	}	
};

/*Retrieving method for retrieve attributes data in Super Dental Tab*/
retreiveSuperDental = function(){
	var dateFromMed ="";
	var orignalDate = "";
	var date = "";	
	var subApplicationName:String="";
	verNum_Dental.text = major_Ver_Number+minor_Ver_Number;
	for(parentIndex = 0;parentIndex<global_employer_XML.firstChild.childNodes.length;parentIndex++){
		subApplicationName = global_employer_XML.firstChild.childNodes[parentIndex].attributes.Name;		
		if(subApplicationName == "DentalPlans"){
			for(childIndex=0;childIndex<global_employer_XML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
				
				var nameElement:String  = global_employer_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				var valueElement:String = global_employer_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
				
				if(nameElement=="Object__Customer__SuperDentalPlan__BasicPPO" and valueElement != null){
						Object__Customer__SuperDentalPlan__BasicPPO___DMS_CUSTOMER_PLAN____DENTAL_PLAN_BASIC_PPO.selected = true;
				}
				else if(nameElement=="Object__Customer__SuperDentalPlan__IntermediatePPO" and valueElement != null){
						Object__Customer__SuperDentalPlan__IntermediatePPO___DMS_CUSTOMER_PLAN____DENTAL_PLAN_INTERMEDIATE_PPO.selected = true;
				}
				else if(nameElement=="Object__Customer__SuperDentalPlan__AdvancePPO" and valueElement != null){
						Object__Customer__SuperDentalPlan__AdvancePPO___DMS_CUSTOMER_PLAN____DENTAL_PLAN_ADVANCED_PPO.selected = true;
				}
				else if(nameElement=="Object__Customer__SuperDentalPlan__AlternativeAdvancedPPO" and valueElement != null){
						Object__Customer__SuperDentalPlan__AlternativeAdvancedPPO___DMS_CUSTOMER_PLAN____DENTAL_PLAN_ALTERNATIVEADVANCED_PPO.selected = true;
				}
				else if(nameElement=="Object__Customer__SuperDentalPlan__AlternativeBasicPPO" and valueElement != null){
						Object__Customer__SuperDentalPlan__AlternativeBasicPPO___DMS_CUSTOMER_PLAN____DENTAL_PLAN_ALTERNATIVEBASIC_PPO.selected = true;
				}
				else if(nameElement=="Object__Customer__MedicalMutualPlan__ProposedEffectiveDate" and valueElement != null and valueElement!="0000-00-00"){
					dateFromMed = valueElement;
				}
				else if(nameElement=="Object__Customer__SuperDentalPlan__ProposedEffectiveDate" and valueElement != null and valueElement!="0000-00-00"){
					orignalDate = valueElement;
				}
			}
		}
		if(subApplicationName == "MMOPlans"){
			for(childIndex=0;childIndex<global_employer_XML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
				var nameElement:String  = global_employer_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				var valueElement:String = global_employer_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;

				if(nameElement=="Object__Customer__MedicalMutualPlan__ProposedEffectiveDate" and valueElement != null and valueElement!="0000-00-00"){
					dateFromMed = valueElement;				
				}
			}			
		}
	}
	if(orignalDate != "" and orignalDate!="0000-00-00"){
		date = orignalDate;
	}
	else if(dateFromMed != ""){
		date = dateFromMed;
	}
	if(date != ""){
		var valueEffectiveDate = date;
		var index = valueEffectiveDate.split("-");
		var valEffextiveDate = index[1]+"/"+index[2]+"/"+index[0];
		Object__Customer__SuperDentalPlan__ProposedEffectiveDate___DMS_CUSTOMER_PLAN____DENTAL_PLAN_EFFECTIVE_DATE.text = valEffextiveDate;
	}
	
};


/*Retrieving method for retrieve attributes data in Vision Service Tab*/
retreiveVisionService = function(){
	
	var dateFromMed ="";
	var orignalDate = "";
	var date = "";
	var subApplicationName:String="";
	verNum_Vision.text = major_Ver_Number+minor_Ver_Number;
	for(parentIndex = 0;parentIndex<global_employer_XML.firstChild.childNodes.length;parentIndex++){
		subApplicationName = global_employer_XML.firstChild.childNodes[parentIndex].attributes.Name;		
		if(subApplicationName == "VisionServicePlans"){
			for(childIndex=0;childIndex<global_employer_XML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
				
				var nameElement:String  = global_employer_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				var valueElement:String = global_employer_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
				
				if(nameElement=="Object__Customer__VsionServicePlan__VisionServicePlans" and valueElement != null ){
					Object__Customer__VsionServicePlan__VisionServicePlans___DMS_CUSTOMER_PLAN____VISION_SERVICE_PLAN.setValue(valueElement);
				}
				else if(nameElement=="Object__Customer__MedicalMutualPlan__ProposedEffectiveDate" and valueElement != null and valueElement!="0000-00-00"){
					dateFromMed = valueElement;
				}
				else if(nameElement=="Object__Customer__VsionServicePlan__ProposedEffectiveDate" and valueElement != null and valueElement!="0000-00-00"){
					orignalDate = valueElement;
				}
			}
		}
		if(subApplicationName == "MMOPlans"){
			for(childIndex=0;childIndex<global_employer_XML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
				var nameElement:String  = global_employer_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				var valueElement:String = global_employer_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;

				if(nameElement=="Object__Customer__MedicalMutualPlan__ProposedEffectiveDate" and valueElement != null and valueElement!="0000-00-00"){
					dateFromMed = valueElement;				
				}
			}			
		}
	}
	if(orignalDate != "" and orignalDate!="0000-00-00"){
		date = orignalDate;
	}
	else if(dateFromMed != ""){
		date = dateFromMed;
	}
	if(date != ""){
		var valueEffectiveDate = date;
		var index = valueEffectiveDate.split("-");
		var valEffextiveDate = index[1]+"/"+index[2]+"/"+index[0];
		Object__Customer__VsionServicePlan__ProposedEffectiveDate___DMS_CUSTOMER_PLAN____VISION_SERVICE_PLAN_EFFECTIVE_DATE.text = valEffextiveDate;
	}	
};


/*Retrieving method for retrieve attributes data in Fort Dearborn Life Insurance Tab*/
retrieveFortDearBorn = function(){
	 
	var dateFromMed ="";
	var orignalDate = "";
	var date = "";
	var subApplicationName:String="";
	verNum_Life.text = major_Ver_Number+minor_Ver_Number;
	for(parentIndex = 0;parentIndex<global_employer_XML.firstChild.childNodes.length;parentIndex++){
		subApplicationName = global_employer_XML.firstChild.childNodes[parentIndex].attributes.Name;		
		if(subApplicationName == "LIC Plan"){
			ns5.enabled = false;
			ns6.enabled = false;
			ns3.enabled = false;
			ns4.enabled = false;
			ns1.enabled = false;
			ns2.enabled = false;
			for(childIndex=0;childIndex<global_employer_XML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
				
				
				var nameElement:String  = global_employer_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				var valueElement:String = global_employer_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
				
				/*if(nameElement =="Object__Customer__LifeInsurance__Contributions__LifeADnD100" and valueElement != null){
					Object__Customer__LifeInsurance__Contributions__LifeADnD100___DMS_CUSTOMER_PLAN____LIFE_AD_N_D_100.selected = true;
				}
				else if(nameElement == "Object__Customer__LifeInsurance__Contributions__LifeADnDOther" and valueElement != null){
					
					Object__Customer__LifeInsurance__Contributions__LifeADnDOther___DMS_CUSTOMER_PLAN____LIFE_AD_N_D_OTHER.selected = true;
				}*/
				if(nameElement == "Object__Customer__LifeInsurance__Contributions__LifeADnD" and valueElement != null){
					
					Object__Customer__LifeInsurance__Contributions__LifeADnD___DMS_CUSTOMER_PLAN____LIFE_AD_N_D.text = valueElement;
				}
				/*else if(nameElement == "Object__Customer__LifeInsurance__Contributions__VoluntaryLife100" and valueElement != null){
					
					Object__Customer__LifeInsurance__Contributions__VoluntaryLife100___DMS_CUSTOMER_PLAN____VOLUNTARY_LIFE_100.selected = true;
				}
				else if(nameElement == "Object__Customer__LifeInsurance__Contributions__VoluntaryLifeOther" and valueElement != null){
						Object__Customer__LifeInsurance__Contributions__VoluntaryLifeOther___DMS_CUSTOMER_PLAN____VOLUNTARY_LIFE_OTHER.selected = true;
					
				}*/
				else if(nameElement == "Object__Customer__LifeInsurance__Contributions__VoluntaryLife" and valueElement != null){
					Object__Customer__LifeInsurance__Contributions__VoluntaryLife___DMS_CUSTOMER_PLAN____VOLUNTARY_LIFE.text = valueElement;
				}
				/*else if(nameElement == "Object__Customer__LifeInsurance__Contributions__STD100" and valueElement != null){
					Object__Customer__LifeInsurance__Contributions__STD100___DMS_CUSTOMER_PLAN____STD_100.selected = true;
				}
				else if(nameElement == "Object__Customer__LifeInsurance__Contributions__STDOther" and valueElement != null){
					Object__Customer__LifeInsurance__Contributions__STDOther___DMS_CUSTOMER_PLAN____STD_OTHER.selected = true;
				}*/
				else if(nameElement == "Object__Customer__LifeInsurance__Contributions__STD" and valueElement != null){
					Object__Customer__LifeInsurance__Contributions__STD___DMS_CUSTOMER_PLAN____STD.text = valueElement;
				}
				/*else if(nameElement =="Object__Customer__LifeInsurance__Contributions__VoluntarySTD100" and valueElement != null){
					Object__Customer__LifeInsurance__Contributions__VoluntarySTD100___DMS_CUSTOMER_PLAN____VOLUNTARY_STD_100.selected = true;
				}
				else if(nameElement == "Object__Customer__LifeInsurance__Contributions__VoluntarySTDOther" and valueElement != null){
					Object__Customer__LifeInsurance__Contributions__VoluntarySTDOther___DMS_CUSTOMER_PLAN____VOLUNTARY_STD_OTHER.selected = true;
					
				}*/
				else if(nameElement == "Object__Customer__LifeInsurance__Contributions__VoluntarySTD" and valueElement != null){
					Object__Customer__LifeInsurance__Contributions__VoluntarySTD___DMS_CUSTOMER_PLAN____VOLUNTARY_STD.text = valueElement;
				}
				
				/*else if(nameElement == "Object__Customer__LifeInsurance__Contributions__DependentLife100" and valueElement != null){
					Object__Customer__LifeInsurance__Contributions__DependentLife100___DMS_CUSTOMER_PLAN____DEPENDENT_LIFE_100.selected = true;
				}
				else if(nameElement == "Object__Customer__LifeInsurance__Contributions__DependentLifeOther" and valueElement != null){
					Object__Customer__LifeInsurance__Contributions__DependentLifeOther___DMS_CUSTOMER_PLAN____DEPENDENT_LIFE_OTHER.selected = true;
					
				}*/
				else if(nameElement == "Object__Customer__LifeInsurance__Contributions__DependentLife" and valueElement != null){
					Object__Customer__LifeInsurance__Contributions__DependentLife___DMS_CUSTOMER_PLAN____DEPENDENT_LIFE.text = valueElement;
				}
				
				/*else if(nameElement =="Object__Customer__LifeInsurance__Contributions__LongTermDisability100" and valueElement != null){
					
					Object__Customer__LifeInsurance__Contributions__LongTermDisability100___DMS_CUSTOMER_PLAN____LONG_TERM_DISABILITY_100.selected = true;
				}
				else if(nameElement =="Object__Customer__LifeInsurance__Contributions__LongTermDisabilityOther" and valueElement != null){
					Object__Customer__LifeInsurance__Contributions__LongTermDisabilityOther___DMS_CUSTOMER_PLAN____LONG_TERM_DISABILITY_OTHER.selected = true;
				}
				else if(nameElement == "Object__Customer__LifeInsurance__WaitingPeriod__None" and valueElement != null){
					Object__Customer__LifeInsurance__WaitingPeriod__None___DMS_CUSTOMER_PLAN____WAITING_PERIOD_NONE.selected = true;

				}*/
				else if(nameElement =="Object__Customer__LifeInsurance__Contributions__LongTermDisabilityPercent" and valueElement != null){
					Object__Customer__LifeInsurance__Contributions__LongTermDisabilityPercent___DMS_CUSTOMER_PLAN____LONG_TERM_DISABILITY_PERCENT.text = valueElement;
				}
				else if(nameElement == "Object__Customer__LifeInsurance__WaitingPeriod__FirstMonthDays" and valueElement != null){
					Object__Customer__LifeInsurance__WaitingPeriod__FirstMonthDays___DMS_CUSTOMER_PLAN____WAITING_PERIOD_FIRSTMONTH_DAYS.text = valueElement;
				}
				/*else if(nameElement == "Object__Customer__LifeInsurance__WaitingPeriod__FirstMonth" and valueElement != null){
					Object__Customer__LifeInsurance__WaitingPeriod__FirstMonth___DMS_CUSTOMER_PLAN____WAITING_PERIOD_FIRSTMONTH.selected = true;
				}
				else if(nameElement == "Object__Customer__LifeInsurance__WaitingPeriod__Other" and valueElement != null){
					Object__Customer__LifeInsurance__WaitingPeriod__Other___DMS_CUSTOMER_PLAN____WAITING_PERIOD_OTHER.selected = true;
				}*/
				else if(nameElement == "Object__Customer__LifeInsurance__WaitingPeriod__OtherBox" and valueElement !=null ){
					Object__Customer__LifeInsurance__WaitingPeriod__OtherBox___DMS_CUSTOMER_PLAN____WAITING_PERIOD_OTHER_BOX.text  = valueElement;
				}
				/*else if(nameElement == "Object__Customer__LifeInsurance__WaitingPeriodValid__AllEmployees" and valueElement != null){
					Object__Customer__LifeInsurance__WaitingPeriodValid__AllEmployees___DMS_CUSTOMER_PLAN____WAITING_PERIOD_ALL_EMPLOYEES.selected = true;
				}
				else if(nameElement == "Object__Customer__LifeInsurance__WaitingPeriodValid__OnlyNewEmployees" and valueElement != null){
					Object__Customer__LifeInsurance__WaitingPeriodValid__OnlyNewEmployees___DMS_CUSTOMER_PLAN____WAITING_PERIOD_NEW_EMPLOYEES.selected = true;
				}*/
				
				else if(nameElement == "Object__Customer__LifeInsurance__ProposedEffectiveDate___DMS_CUSTOMER_PLAN____LIFE_INS_PROPOSED_EFFECTIVE_DATE" and valueElement != null  ){
					Object__Customer__LifeInsurance__ProposedEffectiveDate___DMS_CUSTOMER_PLAN____LIFE_INS_PROPOSED_EFFECTIVE_DATE.text = valueElement;
				}
				else if(nameElement == "Object__Customer__LifeInsurance__EligibleEmployees" and valueElement != null ){
					Object__Customer__LifeInsurance__EligibleEmployees___DMS_CUSTOMER_PLAN____ELIGIBLE_EMPLOYEES.text = valueElement;
				}
				else if(nameElement == "Object__Customer__LifeInsurance__EnrollingEmployees" and valueElement != null){
					Object__Customer__LifeInsurance__EnrollingEmployees___DMS_CUSTOMER_PLAN____ENROLLED_EMPLOYEES.text = valueElement;
				}
				else if(nameElement == "Object__Customer__LifeInsurance__Guarantee" and valueElement != null){
					Object__Customer__LifeInsurance__Guarantee___DMS_CUSTOMER_PLAN____GUARANTEE_MONTHS.text = valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__BasicLifeADandD" and valueElement != null ){
						Object__Customer__FortDearbornLifeInsCmpPlan__BasicLifeADandD___DMS_CUSTOMER_PLAN____BASIC_LIFE_AD_AND_D.selected = true;
						ns1.enabled = true;
						ns2.enabled = true;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__DependentLife" and valueElement != null){
						Object__Customer__FortDearbornLifeInsCmpPlan__DependentLife___DMS_CUSTOMER_PLAN____DEPENDENT_LIFE.selected = true;
						ns3.enabled = true;
						ns4.enabled = true;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__OptionalLife" and valueElement != null){
						Object__Customer__FortDearbornLifeInsCmpPlan__OptionalLife___DMS_CUSTOMER_PLAN____OPTIONAL_LIFE.selected = true;
						ns5.enabled = true;
						ns6.enabled = true;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployeesEntrolforBasicLifeandADandD" and valueElement != null){
					ns1.value =valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployerContributionforBasicLifeandADandD" and valueElement != null){
					ns2.value =valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployeesEntrolforDependentLife" and valueElement != null){
					ns3.value =valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployerContributionforDependentLife" and valueElement != null){
					ns4.value =valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployeesEntrolforOptionalLife" and valueElement != null){
					ns5.value =valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployerContributionforOptionalLife" and valueElement != null){
					ns6.value =valueElement;
				}
				else if(nameElement=="Object__Customer__MedicalMutualPlan__ProposedEffectiveDate" and valueElement != null and valueElement!="0000-00-00"){
					dateFromMed = valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__ProposedEffectiveDate" and valueElement != null and valueElement!="0000-00-00"){
					orignalDate = valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__AllEmployeesOption" and valueElement != null){
					Object__Customer__FortDearbornLifeInsCmpPlan__AllEmployeesOption___DMS_CUSTOMER_PLAN____ALL_EMPLOYEE_OPTION.setValue(valueElement);
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EachEmployeeMinsAmount" and valueElement != null){
					Object__Customer__FortDearbornLifeInsCmpPlan__EachEmployeeMinsAmount___DMS_CUSTOMER_PLAN____EACH_EMPLOYEE_MIN_CONTRIBUTION.text =valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__NumberOfEmployees" and valueElement != null){
					Object__Customer__FortDearbornLifeInsCmpPlan__NumberOfEmployees___DMS_CUSTOMER_PLAN____NUMBER_OF_EMPLOYEES.text =valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EachEmployeesMaxAmount" and valueElement != null){
					Object__Customer__FortDearbornLifeInsCmpPlan__EachEmployeesMaxAmount___DMS_CUSTOMER_PLAN____EACH_EMPLOYEE_MAX_CONTRIBUTION.text =valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__JobTitleLevel1" and valueElement != null){
					Object__Customer__FortDearbornLifeInsCmpPlan__JobTitleLevel1___DMS_CUSTOMER_PLAN____JOB_TITLES_SALARY_LEVELS1.text =valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__BenefitAmountLevel1" and valueElement != null and valueElement!="0.00"){
					Object__Customer__FortDearbornLifeInsCmpPlan__BenefitAmountLevel1___DMS_CUSTOMER_PLAN____BENEFIT_AMOUNT_LEVEL1.text =valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__JobTitleLevel2" and valueElement != null){
					Object__Customer__FortDearbornLifeInsCmpPlan__JobTitleLevel2___DMS_CUSTOMER_PLAN____JOB_TITLES_SALARY_LEVELS2.text =valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__BenefitAmountLevel2" and valueElement != null and valueElement!="0.00"){
					Object__Customer__FortDearbornLifeInsCmpPlan__BenefitAmountLevel2___DMS_CUSTOMER_PLAN____BENEFIT_AMOUNT_LEVEL2.text =valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__JobTitleLevel3" and valueElement != null){
					Object__Customer__FortDearbornLifeInsCmpPlan__JobTitleLevel3___DMS_CUSTOMER_PLAN____JOB_TITLES_SALARY_LEVELS3.text =valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__BenefitAmountLevel3" and valueElement != null and valueElement!="0.00"){
					Object__Customer__FortDearbornLifeInsCmpPlan__BenefitAmountLevel3___DMS_CUSTOMER_PLAN____BENEFIT_AMOUNT_LEVEL3.text =valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__GroupShortTermDisability" and valueElement != null){
					Object__Customer__FortDearbornLifeInsCmpPlan__GroupShortTermDisability___DMS_CUSTOMER_PLAN____GROPU_SHORT_TERM_DISABILITY.setValue(valueElement);
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__MaximumWeeklyBenefit" and valueElement != null){
					Object__Customer__FortDearbornLifeInsCmpPlan__MaximumWeeklyBenefit___DMS_CUSTOMER_PLAN____MAX_WEEKLY_BENEFIT.text =valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__OptionalShortTermDisabilityPlan" and valueElement != null){
					Object__Customer__FortDearbornLifeInsCmpPlan__OptionalShortTermDisabilityPlan___DMS_CUSTOMER_PLAN____OPTIONAL_SHORT_TERM_DISABILITY_PLAN.setValue(valueElement);
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployerContributionforGroupOrOptionalShortTermDisablity" and valueElement != null){
					ns7.value =valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployeesEntrolforGropOrOptionalShortTimeDisability" and valueElement != null){
					ns8.value =valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__LongTermDisability" and valueElement != null){
						Object__Customer__FortDearbornLifeInsCmpPlan__LongTermDisability___DMS_CUSTOMER_PLAN____LONG_TERM_DISABILITY.selected = true;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__LongTermDisabilityPlan" and valueElement != null){
					Object__Customer__FortDearbornLifeInsCmpPlan__LongTermDisabilityPlan___DMS_CUSTOMER_PLAN____LONG_TERM_DISABILITY_PLAN.setValue(valueElement);
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployerContributionforLongTernDisablity" and valueElement != null){
					ns9.value =valueElement;
				}
				else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployeesEntrolforLongTimeDisability" and valueElement != null){
					ns10.value =valueElement;
				}
				// new block start
				else if(nameElement == "Object__Customer__LifeInsurance__ClassDef__Class1" and valueElement != null){
					
					Object__Customer__LifeInsurance__ClassDef__Class1___DMS_CUSTOMER_PLAN____CLASS1.text = valueElement;
				}
				else if(nameElement == "Object__Customer__LifeInsurance__ClassDef__Class2" and valueElement != null){
					
					Object__Customer__LifeInsurance__ClassDef__Class2___DMS_CUSTOMER_PLAN____CLASS2.text = valueElement;
				}
				else if(nameElement == "Object__Customer__LifeInsurance__ClassDef__Class3" and valueElement != null){
					
					Object__Customer__LifeInsurance__ClassDef__Class3___DMS_CUSTOMER_PLAN____CLASS3.text = valueElement;
				}
				else if(nameElement == "Object__Customer__LifeInsurance__ClassDef__Class4" and valueElement != null){
					
					Object__Customer__LifeInsurance__ClassDef__Class4___DMS_CUSTOMER_PLAN____CLASS4.text = valueElement;
				}
				else if(nameElement == "Object__Customer__LifeInsurance__ClassDef__Class4" and valueElement != null){
					
					Object__Customer__LifeInsurance__ClassDef__Class4___DMS_CUSTOMER_PLAN____CLASS4.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__ClassDef__EligibleHours" and valueElement != null){
					Object__Customer__LifeInsurance__ClassDef__EligibleHours___DMS_CUSTOMER_PLAN____INELIGIBLE_HOURS.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__Amount1" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__Amount1___DMS_CUSTOMER_PLAN____BASICAMOUNT1.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__Amount2" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__Amount2___DMS_CUSTOMER_PLAN____BASICAMOUNT2.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__Amount3" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__Amount3___DMS_CUSTOMER_PLAN____BASICAMOUNT3.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__Amount4" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__Amount4___DMS_CUSTOMER_PLAN____BASICAMOUNT4.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__BasicADSum1" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__BasicADSum1___DMS_CUSTOMER_PLAN____BASICADSUM1.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__BasicADSum2" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__BasicADSum2___DMS_CUSTOMER_PLAN____BASICADSUM2.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__BasicADSum3" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__BasicADSum3___DMS_CUSTOMER_PLAN____BASICADSUM3.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__BasicADSum4" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__BasicADSum4___DMS_CUSTOMER_PLAN____BASICADSUM4.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__Disability1" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__Disability1___DMS_CUSTOMER_PLAN____DISABILITY1.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__Disability2" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__Disability2___DMS_CUSTOMER_PLAN____DISABILITY2.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__Disability3" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__Disability3___DMS_CUSTOMER_PLAN____DISABILITY3.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__Disability4" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__Disability4___DMS_CUSTOMER_PLAN____DISABILITY4.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__MaxSTDBenefit" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__MaxSTDBenefit___DMS_CUSTOMER_PLAN____MAXSTDBENEFIT.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__AccidentDay" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__AccidentDay___DMS_CUSTOMER_PLAN____ACCIDENTDAY.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__SicknessDay" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__SicknessDay___DMS_CUSTOMER_PLAN____SICKNESSDAY.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__SicknessBenefit" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__SicknessBenefit___DMS_CUSTOMER_PLAN____SICKNESSBENEFIT.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__MultipleSalaryOtherValue" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__MultipleSalaryOtherValue___DMS_CUSTOMER_PLAN____MULTIPLESALARYOTHERVALUE.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__BasicVariableBenefitPercent1" and valueElement != null){
					BENEFIT_REDUCTION1.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__BasicVariableBenefitPercent2" and valueElement != null){
					BENEFIT_REDUCTION2.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__BasicVariableBenefitPercent3" and valueElement != null){
					BENEFIT_REDUCTION3.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__BasicVariableBenefitAge1" and valueElement != null){
					BENEFIT_AGE1.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__BasicVariableBenefitAge2" and valueElement != null){
					BENEFIT_AGE2.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__BasicVariableBenefitAge3" and valueElement != null){
					BENEFIT_AGE3.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__GroupLongTermDisabilityOtherText" and valueElement != null){
					DISABILITY_OTHER_TEXT.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__Spouse" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__Spouse___DMS_CUSTOMER_PLAN____SPOUSE_INS_AMT.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__Children1" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__Children1___DMS_CUSTOMER_PLAN____CHILD_INS_AMT1.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__Children2" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__Children2___DMS_CUSTOMER_PLAN____CHILD_INS_AMT2.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__Children3" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__Children3___DMS_CUSTOMER_PLAN____CHILD_INS_AMT3.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__Children4" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__Children4___DMS_CUSTOMER_PLAN____CHILD_INS_AMT4.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__ChildrenYear1" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__ChildrenYear1___DMS_CUSTOMER_PLAN____CHILD_INS_YEAR1.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__ChildrenYear2" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__ChildrenYear2___DMS_CUSTOMER_PLAN____CHILD_INS_YEAR2.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Coverage__ChildrenYear3" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__ChildrenYear3___DMS_CUSTOMER_PLAN____CHILD_INS_YEAR3.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__NonMedical" and valueElement != null){
					Object__Customer__LifeInsurance__NonMedical__Basic___DMS_CUSTOMER_PLAN____NONMEDICALBASIC.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__NonMedical__Voluntary" and valueElement != null){
					Object__Customer__LifeInsurance__NonMedical__Voluntary___DMS_CUSTOMER_PLAN____NONMEDICALVOLUNTARY.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__NonMedical__Basic" and valueElement != null){
					Object__Customer__LifeInsurance__NonMedical__Basic___DMS_CUSTOMER_PLAN____NONMEDICALBASIC.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__NonMedical__Voluntary" and valueElement != null){
					Object__Customer__LifeInsurance__NonMedical__Voluntary___DMS_CUSTOMER_PLAN____NONMEDICALVOLUNTARY.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__NonMedical__Combined" and valueElement != null){
					Object__Customer__LifeInsurance__NonMedical__Combined___DMS_CUSTOMER_PLAN____NONMEDICALCOMBINED.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__NonMedical__STDBasic" and valueElement != null){
					Object__Customer__LifeInsurance__NonMedical__STDBasic___DMS_CUSTOMER_PLAN____NONMEDICAL_STD.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Activeworker_Name1" and valueElement != null){
					Object__Customer__LifeInsurance__EmployerNameA__No___DMS_CUSTOMER_PLAN____ACTIVEWORKER_NAME1.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Activeworker_Name2" and valueElement != null){
					Object__Customer__LifeInsurance__EmployerNameB__No___DMS_CUSTOMER_PLAN____ACTIVEWORKER_NAME2.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Activeworker_Reason_Othertext1" and valueElement != null){
					Object__Customer__LifeInsurance__Activeworker_Reason_Othertext1___DMS_CUSTOMER_PLAN____ACTIVEWORKER_REASON_OTHERTEXT1.text = valueElement;
				}
				
				else if(nameElement == "Object__Customer__LifeInsurance__Activeworker_Reason_Othertext2" and valueElement != null){
					Object__Customer__LifeInsurance__Activeworker_Reason_Othertext2___DMS_CUSTOMER_PLAN____ACTIVEWORKER_REASON_OTHERTEXT2.text = valueElement;
				}
				
				else if(nameElement =="Object__Customer__LifeInsurance__Coverage__BasicLife" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__BasicLife___DMS_CUSTOMER_PLAN____BASICLIFE.selected = true;
				}
				
				else if(nameElement =="Object__Customer__LifeInsurance__Coverage__BasicLifeADD" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__BasicLifeADD___DMS_CUSTOMER_PLAN____BASICLIFEAD.selected = true;
				}
				
				else if(nameElement =="Object__Customer__LifeInsurance__Coverage__ShortTermDisability" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__ShortTermDisability___DMS_CUSTOMER_PLAN____SHORTTERMDISABILITY.selected = true;
				}
				
				else if(nameElement =="Object__Customer__LifeInsurance__Coverage__GroupLongTermDisablity" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__GroupLongTermDisablity___DMS_CUSTOMER_PLAN____GROUP_LONG_TERM_DISABILITY.selected = true;
				}
				
				else if(nameElement =="Object__Customer__LifeInsurance__Coverage__VolLifeIns" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__VolLifeIns___DMS_CUSTOMER_PLAN____VOL_LIFE_INS.selected = true;
				}
				
				else if(nameElement =="Object__Customer__LifeInsurance__Coverage__VolDisability" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__VolDisability___DMS_CUSTOMER_PLAN____VOL_LIFE_DISABILITY.selected = true;
				}
				
				else if(nameElement =="Object__Customer__LifeInsurance__Coverage__MultipleSalary1" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__MultipleSalary1___DMS_CUSTOMER_PLAN____MULTIPLESALARY.setValue(valueElement);
					if(Object__Customer__LifeInsurance__Coverage__MultipleSalary1___DMS_CUSTOMER_PLAN____MULTIPLESALARY.getValue()=="Higher Multiple")
					{
						Object__Customer__LifeInsurance__Coverage__MultipleSalaryOtherValue___DMS_CUSTOMER_PLAN____MULTIPLESALARYOTHERVALUE.enabled=false;
					}
					else if(Object__Customer__LifeInsurance__Coverage__MultipleSalary1___DMS_CUSTOMER_PLAN____MULTIPLESALARY.getValue()=="the nearest multiple")
					{
						Object__Customer__LifeInsurance__Coverage__MultipleSalaryOtherValue___DMS_CUSTOMER_PLAN____MULTIPLESALARYOTHERVALUE.enabled=false;
					}
					else if(Object__Customer__LifeInsurance__Coverage__MultipleSalary1___DMS_CUSTOMER_PLAN____MULTIPLESALARY.getValue()=="Other ")
					{
						Object__Customer__LifeInsurance__Coverage__MultipleSalaryOtherValue___DMS_CUSTOMER_PLAN____MULTIPLESALARYOTHERVALUE.enabled=true;
					}
				}
				
				else if(nameElement =="Object__Customer__LifeInsurance__Coverage__Basic50Age70" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__Basic50Age70___DMS_CUSTOMER_PLAN____BASIC_BENEFIT.setValue(valueElement);
					if(Object__Customer__LifeInsurance__Coverage__Basic50Age70___DMS_CUSTOMER_PLAN____BASIC_BENEFIT.getValue()=="Basic Benefit 1")
					{
						BENEFIT_REDUCTION1.enabled=false;
						BENEFIT_AGE1.enabled=false;
						BENEFIT_REDUCTION2.enabled=false;
						BENEFIT_AGE2.enabled=false;
						BENEFIT_REDUCTION3.enabled=false;
						BENEFIT_AGE3.enabled=false;
					}
				}
				
				else if(nameElement =="Object__Customer__LifeInsurance__Coverage__GroupLongTermDisability1" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__GroupLongTermDisability1___DMS_CUSTOMER_PLAN____GROUP_LONG_TERM_DISABILITY_PLAN.setValue(valueElement);
					if(Object__Customer__LifeInsurance__Coverage__GroupLongTermDisability1___DMS_CUSTOMER_PLAN____GROUP_LONG_TERM_DISABILITY_PLAN.getValue()=="90 day elimination" || Object__Customer__LifeInsurance__Coverage__GroupLongTermDisability1___DMS_CUSTOMER_PLAN____GROUP_LONG_TERM_DISABILITY_PLAN.getValue()=="180 day elimination")
					{
						DISABILITY_OTHER_TEXT.enabled=false;
					}
					else if(Object__Customer__LifeInsurance__Coverage__GroupLongTermDisability1___DMS_CUSTOMER_PLAN____GROUP_LONG_TERM_DISABILITY_PLAN.getValue()=="Other")
					{
						DISABILITY_OTHER_TEXT.enabled=true;
					}
				}
				
				else if(nameElement =="Object__Customer__LifeInsurance__Coverage__DependentLifeInsurance" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__DependentLifeInsurance___DMS_CUSTOMER_PLAN____STANDARD_OPTION.setValue(valueElement);
					if(Object__Customer__LifeInsurance__Coverage__DependentLifeInsurance___DMS_CUSTOMER_PLAN____STANDARD_OPTION.getValue()=="Standard Option")
					{
						Object__Customer__LifeInsurance__Coverage__Spouse___DMS_CUSTOMER_PLAN____SPOUSE_INS_AMT.enabled=false;
						Object__Customer__LifeInsurance__Coverage__Children1___DMS_CUSTOMER_PLAN____CHILD_INS_AMT1.enabled=false;
						Object__Customer__LifeInsurance__Coverage__Children2___DMS_CUSTOMER_PLAN____CHILD_INS_AMT2.enabled=false;
						Object__Customer__LifeInsurance__Coverage__Children3___DMS_CUSTOMER_PLAN____CHILD_INS_AMT3.enabled=false;
						Object__Customer__LifeInsurance__Coverage__ChildrenYear1___DMS_CUSTOMER_PLAN____CHILD_INS_YEAR1.enabled=false;
						Object__Customer__LifeInsurance__Coverage__Children4___DMS_CUSTOMER_PLAN____CHILD_INS_AMT4.enabled=false;
						Object__Customer__LifeInsurance__Coverage__ChildrenYear2___DMS_CUSTOMER_PLAN____CHILD_INS_YEAR2.enabled=false;
						Object__Customer__LifeInsurance__Coverage__ChildrenYear3___DMS_CUSTOMER_PLAN____CHILD_INS_YEAR3.enabled=false;
					}
				}
				
				else if(nameElement =="Object__Customer__LifeInsurance__Coverage__VolSTD" and valueElement != null){
					Object__Customer__LifeInsurance__Coverage__VolSTD___DMS_CUSTOMER_PLAN____VOL_STD.setValue(valueElement);
				}
				
				else if(nameElement =="Object__Customer__LifeInsurance__ActiveWork" and valueElement != null){
					Object__Customer__LifeInsurance__ActiveWork___DMS_CUSTOMER_PLAN____ACTIVEWORK.setValue(valueElement);
					if(Object__Customer__LifeInsurance__ActiveWork___DMS_CUSTOMER_PLAN____ACTIVEWORK.getValue()=="N")
					{
						Object__Customer__LifeInsurance__EmployerNameA__No___DMS_CUSTOMER_PLAN____ACTIVEWORKER_NAME1.enabled=false;
						Object__Customer__LifeInsurance__EmployerNameA__No___DMS_CUSTOMER_PLAN____ACTIVEWORKER_SEX_F1.enabled=false;
						Object__Customer__LifeInsurance__EmployerNameA__No___DMS_CUSTOMER_PLAN____ACTIVEWORKER_SEX_M1.enabled=false;
						Object__Customer__LifeInsurance__Activeworker_Dob1___DMS_CUSTOMER_PLAN____ACTIVEWORKER_DOB1.enabled=false;
						Object__Customer__LifeInsurance__Activeworker_Dateworked1___DMS_CUSTOMER_PLAN____ACTIVEWORKER_DATEWORKED1.enabled=false;
						Object__Customer__LifeInsurance__EmployerNameA__No___DMS_CUSTOMER_PLAN____ACTIVEWORKER_REASON_DISABILITY1.enabled=false;
						Object__Customer__LifeInsurance__EmployerNameA__No___DMS_CUSTOMER_PLAN____ACTIVEWORKER_REASON_FAMILY1.enabled=false;
						Object__Customer__LifeInsurance__EmployerNameA__No___DMS_CUSTOMER_PLAN____ACTIVEWORKER_REASON_OTHER1.enabled=false;
						Object__Customer__LifeInsurance__Activeworker_Reason_Othertext1___DMS_CUSTOMER_PLAN____ACTIVEWORKER_REASON_OTHERTEXT1.enabled=false;
						Object__Customer__LifeInsurance__EmployerNameB__No___DMS_CUSTOMER_PLAN____ACTIVEWORKER_NAME2.enabled=false;
						Object__Customer__LifeInsurance__EmployerNameB__No___DMS_CUSTOMER_PLAN____ACTIVEWORKER_SEX_F2.enabled=false;
						Object__Customer__LifeInsurance__EmployerNameB__No___DMS_CUSTOMER_PLAN____ACTIVEWORKER_SEX_M2.enabled=false;
						Object__Customer__LifeInsurance__Activeworker_Dob2___DMS_CUSTOMER_PLAN____ACTIVEWORKER_DOB2.enabled=false;
						Object__Customer__LifeInsurance__Activeworker_Dateworked2___DMS_CUSTOMER_PLAN____ACTIVEWORKER_DATEWORKED2.enabled=false;
						Object__Customer__LifeInsurance__EmployerNameB__No___DMS_CUSTOMER_PLAN____ACTIVEWORKER_REASON_DISABILITY2.enabled=false;
						Object__Customer__LifeInsurance__EmployerNameB__No___DMS_CUSTOMER_PLAN____ACTIVEWORKER_REASON_FAMILY2.enabled=false;
						Object__Customer__LifeInsurance__EmployerNameB__No___DMS_CUSTOMER_PLAN____ACTIVEWORKER_REASON_OTHER2.enabled=false;
						Object__Customer__LifeInsurance__Activeworker_Reason_Othertext2___DMS_CUSTOMER_PLAN____ACTIVEWORKER_REASON_OTHERTEXT2.enabled=false;
					}
				}
				
				else if(nameElement =="Object__Customer__LifeInsurance__Activeworker_Sex1" and valueElement != null){
					Object__Customer__LifeInsurance__Activeworker_Sex1___DMS_CUSTOMER_PLAN____ACTIVEWORKER_SEX1.setValue(valueElement);
				}
				
				else if(nameElement =="Object__Customer__LifeInsurance__Activeworker_Sex2" and valueElement != null){
					Object__Customer__LifeInsurance__Activeworker_Sex2___DMS_CUSTOMER_PLAN____ACTIVEWORKER_SEX2.setValue(valueElement);
				}
				
				else if(nameElement =="Object__Customer__LifeInsurance__Activeworker_Reason1" and valueElement != null){
					Object__Customer__LifeInsurance__Activeworker_Reason1___DMS_CUSTOMER_PLAN____ACTIVEWORKER_REASON1.setValue(valueElement);
				}
				
				else if(nameElement =="Object__Customer__LifeInsurance__Activeworker_Reason2" and valueElement != null){
					Object__Customer__LifeInsurance__Activeworker_Reason2___DMS_CUSTOMER_PLAN____ACTIVEWORKER_REASON2.setValue(valueElement);
				}
				
				else if(nameElement =="Object__Customer__LifeInsurance__WaitingPeriodValid__AllEmployees" and valueElement != null){
					Object__Customer__LifeInsurance__WaitingPeriodValid__AllEmployees___DMS_CUSTOMER_PLAN____WAITING_PERIOD_ALL_EMPLOYEES.setValue(valueElement);
				}
				
				else if(nameElement =="Object__Customer__LifeInsurance__WaitingPeriod__None" and valueElement != null){
					Object__Customer__LifeInsurance__WaitingPeriod__None___DMS_CUSTOMER_PLAN____WAITING_PERIOD_NONE.setValue(valueElement);
					if(Object__Customer__LifeInsurance__WaitingPeriod__None___DMS_CUSTOMER_PLAN____WAITING_PERIOD_NONE.getValue()=="None")
					{
						Object__Customer__LifeInsurance__WaitingPeriod__FirstMonthDays___DMS_CUSTOMER_PLAN____WAITING_PERIOD_FIRSTMONTH_DAYS.enabled=false;
						Object__Customer__LifeInsurance__WaitingPeriod__OtherBox___DMS_CUSTOMER_PLAN____WAITING_PERIOD_OTHER_BOX.enabled=false;
					}
					else if(Object__Customer__LifeInsurance__WaitingPeriod__None___DMS_CUSTOMER_PLAN____WAITING_PERIOD_NONE.getValue()=="First Month")
					{
						Object__Customer__LifeInsurance__WaitingPeriod__FirstMonthDays___DMS_CUSTOMER_PLAN____WAITING_PERIOD_FIRSTMONTH_DAYS.enabled=true;
						Object__Customer__LifeInsurance__WaitingPeriod__OtherBox___DMS_CUSTOMER_PLAN____WAITING_PERIOD_OTHER_BOX.enabled=false;
					}
					else if(Object__Customer__LifeInsurance__WaitingPeriod__None___DMS_CUSTOMER_PLAN____WAITING_PERIOD_NONE.getValue()=="Other Wait Non Med")
					{
						Object__Customer__LifeInsurance__WaitingPeriod__FirstMonthDays___DMS_CUSTOMER_PLAN____WAITING_PERIOD_FIRSTMONTH_DAYS.enabled=false;
						Object__Customer__LifeInsurance__WaitingPeriod__OtherBox___DMS_CUSTOMER_PLAN____WAITING_PERIOD_OTHER_BOX.enabled=true;
					}
				}
				else if(nameElement =="Object__Customer__LifeInsurance__Contributions__LifeADnD100" and valueElement != null){
					Object__Customer__LifeInsurance__Contributions__LifeADnD100___DMS_CUSTOMER_PLAN____LIFE_AD_N_D_100.setValue(valueElement);
					if(Object__Customer__LifeInsurance__Contributions__LifeADnD100___DMS_CUSTOMER_PLAN____LIFE_AD_N_D_100.getValue() == "100"){
						Object__Customer__LifeInsurance__Contributions__LifeADnD___DMS_CUSTOMER_PLAN____LIFE_AD_N_D.enabObject__CustomerAdditional__CutomerAnotherNameled = false;
					}
				}
				else if(nameElement =="Object__Customer__LifeInsurance__Contributions__VoluntaryLife100" and valueElement != null){
					Object__Customer__LifeInsurance__Contributions__VoluntaryLife100___DMS_CUSTOMER_PLAN____VOLUNTARY_LIFE_100.setValue(valueElement);
					if(Object__Customer__LifeInsurance__Contributions__VoluntaryLife100___DMS_CUSTOMER_PLAN____VOLUNTARY_LIFE_100.getValue() == "100"){
						Object__Customer__LifeInsurance__Contributions__VoluntaryLife___DMS_CUSTOMER_PLAN____VOLUNTARY_LIFE.enabled = false;
					}
				}
				else if(nameElement =="Object__Customer__LifeInsurance__Contributions__STD100" and valueElement != null){
					Object__Customer__LifeInsurance__Contributions__STD100___DMS_CUSTOMER_PLAN____STD_100.setValue(valueElement);
					if(Object__Customer__LifeInsurance__Contributions__STD100___DMS_CUSTOMER_PLAN____STD_100.getValue() == "100"){
						Object__Customer__LifeInsurance__Contributions__STD___DMS_CUSTOMER_PLAN____STD.enabled = false;
					}		
				}
				else if(nameElement =="Object__Customer__LifeInsurance__Contributions__VoluntarySTD100" and valueElement != null){
					Object__Customer__LifeInsurance__Contributions__VoluntarySTD100___DMS_CUSTOMER_PLAN____VOLUNTARY_STD_100.setValue(valueElement);
					if(Object__Customer__LifeInsurance__Contributions__VoluntarySTD100___DMS_CUSTOMER_PLAN____VOLUNTARY_STD_100.getValue() == "100"){
						Object__Customer__LifeInsurance__Contributions__VoluntarySTD___DMS_CUSTOMER_PLAN____VOLUNTARY_STD.enabled = false;
					}		
				}
				else if(nameElement =="Object__Customer__LifeInsurance__Contributions__DependentLife100" and valueElement != null){
					Object__Customer__LifeInsurance__Contributions__DependentLife100___DMS_CUSTOMER_PLAN____DEPENDENT_LIFE_100.setValue(valueElement);
					if(Object__Customer__LifeInsurance__Contributions__DependentLife100___DMS_CUSTOMER_PLAN____DEPENDENT_LIFE_100.getValue() == "100"){
						Object__Customer__LifeInsurance__Contributions__DependentLife___DMS_CUSTOMER_PLAN____DEPENDENT_LIFE.enabled = false;
					}		
				}
				else if(nameElement =="Object__Customer__LifeInsurance__Contributions__LongTermDisability100" and valueElement != null){
					Object__Customer__LifeInsurance__Contributions__LongTermDisability100___DMS_CUSTOMER_PLAN____LONG_TERM_DISABILITY_100.setValue(valueElement);
					if(Object__Customer__LifeInsurance__Contributions__LongTermDisability100___DMS_CUSTOMER_PLAN____LONG_TERM_DISABILITY_100.getValue() == "100"){
						Object__Customer__LifeInsurance__Contributions__LongTermDisabilityPercent___DMS_CUSTOMER_PLAN____LONG_TERM_DISABILITY_PERCENT.enabled = false;
					}		
				}
				
				else if(nameElement=="Object__Customer__LifeInsurance__Activeworker_Dob1" and valueElement != null and valueElement!="0000-00-00"){
					var valueEffectiveDate = valueElement;
					var index = valueEffectiveDate.split("-");
					var valEffextiveDate = index[1]+"/"+index[2]+"/"+index[0];
					Object__Customer__LifeInsurance__Activeworker_Dob1___DMS_CUSTOMER_PLAN____ACTIVEWORKER_DOB1.text = valEffextiveDate;
				}
				
				else if(nameElement=="Object__Customer__LifeInsurance__Activeworker_Dateworked1" and valueElement != null and valueElement!="0000-00-00"){
					var valueEffectiveDate = valueElement;
					var index = valueEffectiveDate.split("-");
					var valEffextiveDate = index[1]+"/"+index[2]+"/"+index[0];
					Object__Customer__LifeInsurance__Activeworker_Dateworked1___DMS_CUSTOMER_PLAN____ACTIVEWORKER_DATEWORKED1.text = valEffextiveDate;
				}
				
				else if(nameElement=="Object__Customer__LifeInsurance__Activeworker_Dateworked2" and valueElement != null and valueElement!="0000-00-00"){
					var valueEffectiveDate = valueElement;
					var index = valueEffectiveDate.split("-");
					var valEffextiveDate = index[1]+"/"+index[2]+"/"+index[0];
					Object__Customer__LifeInsurance__Activeworker_Dateworked2___DMS_CUSTOMER_PLAN____ACTIVEWORKER_DATEWORKED2.text = valEffextiveDate;
				}
				
				else if(nameElement=="Object__Customer__LifeInsurance__Activeworker_Dob2" and valueElement != null and valueElement!="0000-00-00"){
					var valueEffectiveDate = valueElement;
					var index = valueEffectiveDate.split("-");
					var valEffextiveDate = index[1]+"/"+index[2]+"/"+index[0];
					Object__Customer__LifeInsurance__Activeworker_Dob2___DMS_CUSTOMER_PLAN____ACTIVEWORKER_DOB2.text = valEffextiveDate;
				}
							
				// new block end
				
			}
		}
		if(subApplicationName == "MMOPlans"){
			for(childIndex=0;childIndex<global_employer_XML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
				var nameElement:String  = global_employer_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				var valueElement:String = global_employer_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;

				if(nameElement=="Object__Customer__MedicalMutualPlan__ProposedEffectiveDate" and valueElement != null and valueElement!="0000-00-00"){
					dateFromMed = valueElement;				
				}
			}			
		}
	}
	if(orignalDate != ""  and orignalDate!="0000-00-00"){
		date = orignalDate;
	}
	else if(dateFromMed != ""){
		date = dateFromMed;
	}
	if(date != ""){	
		var valueEffectiveDate = date;
		var index = valueEffectiveDate.split("-");
		var valEffextiveDate = index[1]+"/"+index[2]+"/"+index[0];
		Object__Customer__LifeInsurance__ProposedEffectiveDate___DMS_CUSTOMER_PLAN____LIFE_INS_PROPOSED_EFFECTIVE_DATE.text = valEffextiveDate;
	}	
};

var validAPKeyArr:Array = new Array();
var validBPKeyArr:Array = new Array();
var validCPKeyArr:Array = new Array();
var validDPKeyArr:Array = new Array();
var getValidationA:Boolean = false;
var getValidationB:Boolean = false;
var getValidationC:Boolean = false;
var getValidationD:Boolean = false;

/*Retrieving method for retrieve attributes data in Validation Tab*/
retrieveValidation = function(){
	getCombinedFormDetails();
	var employer_ValidateXML1:XML = new XML();
	var subApplicationName :String;
	verNum_Validation.text = major_Ver_Number+minor_Ver_Number;
	nameElementArray = new Array();
	valuElementArray = new Array();
	var myDP_array:Array = new Array();
	var valBDP_array:Array = new Array();
	var valCDP_array:Array = new Array();
	var valDDP_array:Array = new Array();

	employer_ValidateXML1.load("testxml.xml");
	//employer_ValidateXML.load("validA_alonewithValue.xml");	
	employer_ValidateXML1.ignoreWhite = true;
	employer_ValidateXML1.onLoad = function(success:Boolean){
		if(true){
			getValidationValuefromXML(global_employer_XML_Extended);			
		}		
	};
};

getValidationValuefromXML = function(employer_ValidateXML:XML){
	var subApplicationName :String;	
	var myDP_array:Array = new Array();
	var valBDP_array:Array = new Array();
	var valCDP_array:Array = new Array();
	var valDDP_array:Array = new Array();
	var attributeChildNode = employer_ValidateXML.firstChild.firstChild.firstChild.childNodes;
	var subApplChildNode = employer_ValidateXML.firstChild.firstChild.childNodes;		
	for(parentIndex = 0;parentIndex < employer_ValidateXML.firstChild.childNodes.length;parentIndex++){
		nameElementArray = new Array();
		valuElementArray = new Array();
		subApplicationName = employer_ValidateXML.firstChild.childNodes[parentIndex].attributes.Name;		
		if(subApplicationName == "Validation A"){
			if(getValidationA){
				var repeatNameElement:String;
				var repeatValueElement:String;
				var count:Number = 0;
				var noOfRows:Number = 0;
				
				for(childIndex=0;childIndex < employer_ValidateXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
					repeatNameElement = employer_ValidateXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					repeatValueElement= employer_ValidateXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
					nameElementArray[childIndex] = repeatNameElement;
					valuElementArray[childIndex] = repeatValueElement;									
					count = count + 1;
				}
				// to iterate the attribute name index and retrieve the attribute name and order the values correctly based on the columns.
				//ok
				var colCount:Number = 0;
				var patientNameValue:String = ""; var aggrAmtValue:String; var DoSValue:String;
				var illnessValue:String;
				var pKeyIndxA=0;
				for(attArrIndx:Number = 0; attArrIndx < nameElementArray.length; attArrIndx++){
					
					// check for the column name in the attribute, If avail then set the value in the variable.
					if(nameElementArray[attArrIndx].indexOf("Object__Customer__ValidationA__PatientName")!=-1){							
						patientNameValue = valuElementArray[attArrIndx]; 
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Customer__ValidationA__AggregateAmountofClaims")!=-1){
						aggrAmtValue = valuElementArray[attArrIndx];
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Customer__ValidationA__DatesofService")!=-1){
						DoSValue = valuElementArray[attArrIndx];
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Customer__ValidationA__DescribeILLNESSorCondition")!=-1){
						illnessValue = valuElementArray[attArrIndx];
					}
					colCount++;
					
					// if the colcount is the multiples of the number of columns, then push the array with values.
					if(colCount % 4 ==0){
						myDP_array.push({PatientName:patientNameValue, AggregateAmount:aggrAmtValue, DatesofService:DoSValue,IllnessCondition:illnessValue});
						// populate a array for primay key								
						var keyStrA = nameElementArray[attArrIndx];
						validAPKeyArr[pKeyIndxA++] = keyStrA.substr(keyStrA.indexOf("_____")+5,keyStrA.length);						
						getPKey = function(){
							return validAPKeyArr;
						}
					}
				}					
				if(myDP_array.length==0 || myDP_array.length == undefined || myDP_array.length <0){
				myDP_array = new Array({PatientName:" ",AggregateAmount:" ", DatesofService:" ", IllnessCondition:" "});
				}else{
					myDP_array.push({PatientName:" ",AggregateAmount:" ", DatesofService:" ", IllnessCondition:" "});
				}
				validation_DataGridA.dataProvider = myDP_array;			
			}
		}
		else if(subApplicationName == "Validation B"){
			if(getValidationB){
				var repeatNameElement:String;
				var repeatValueElement:String;
				var count:Number = 0;
				var noOfRows:Number = 0;
				
				for(childIndex=0;childIndex < employer_ValidateXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
					repeatNameElement = employer_ValidateXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					repeatValueElement= employer_ValidateXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
					nameElementArray[childIndex] = repeatNameElement;
					valuElementArray[childIndex] = repeatValueElement;									
					count = count + 1;
				}
				// to iterate the attribute name index and retrieve the attribute name and order the values correctly based on the columns.
				var colBCount:Number = 0;
				var patientNamValue:String = ""; 
				var illnessCondValue:String;
				var pKeyIndxB = 0;
				for(attArrIndx:Number = 0; attArrIndx < nameElementArray.length; attArrIndx++){
					
					// check for the column name in the attribute, If avail then set the value in the variable.
					if(nameElementArray[attArrIndx].indexOf("Object__Customer__ValidationB__PatientName")!=-1){							
						patientNamValue = valuElementArray[attArrIndx]; 
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Customer__ValidationB__DescribeILLNESSorCondition")!=-1){
						illnessCondValue = valuElementArray[attArrIndx];
					}
					colBCount++;
					
					// if the colcount is the multiples of the number of columns, then push the array with values.
					if(colBCount % 2 ==0){
						valBDP_array.push({PatientName:patientNamValue, IllnessCondition:illnessCondValue});
						var keyStrB = nameElementArray[attArrIndx];								
						validBPKeyArr[pKeyIndxB++] = keyStrB.substr(keyStrB.indexOf("_____")+5,keyStrB.length);
						getValidBPKey = function(){
							return validBPKeyArr;
						}
					}
				}
				if(valBDP_array.length==0 || valBDP_array.length == undefined || valBDP_array.length <0){
					valBDP_array = new Array({PatientName:" ",DescribeIllnessOrCondition:" "});
				}else{
					valBDP_array.push({PatientName:" ",DescribeIllnessOrCondition:" "});
				}
				validation_DataGridB.dataProvider = valBDP_array;			
			}
		}
		else if(subApplicationName == "Validation C"){
			if(getValidationC){
				var repeatNameElement:String;
				var repeatValueElement:String;
				var count:Number = 0;
				var noOfRows:Number = 0;
				
				for(childIndex=0;childIndex < employer_ValidateXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
					repeatNameElement = employer_ValidateXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					repeatValueElement= employer_ValidateXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
					nameElementArray[childIndex] = repeatNameElement;
					valuElementArray[childIndex] = repeatValueElement;									
					count = count + 1;
				}
				// to iterate the attribute name index and retrieve the attribute name and order the values correctly based on the columns.
				var colCCount:Number = 0;
				var namValue:String = ""; var ssnValue:String = ""; var beginDateValue:String = "";
				var expDateValue:String = ""; var qualifyingEventValue:String="";
				var pKeyIndxC = 0;
				for(attArrIndx:Number = 0; attArrIndx < nameElementArray.length; attArrIndx++){
					
					// check for the column name in the attribute, If avail then set the value in the variable.
					if(nameElementArray[attArrIndx].indexOf("Object__Customer__ValidationC__Name")!=-1){							
						namValue = valuElementArray[attArrIndx]; 
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Customer__ValidationC__SocialSecurityNumber")!=-1){
						ssnValue = valuElementArray[attArrIndx];
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Customer__ValidationC__BeginningDate")!=-1){
						beginDateValue = valuElementArray[attArrIndx];
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Customer__ValidationC__ExpirationDate")!=-1){
						expDateValue = valuElementArray[attArrIndx];
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Customer__ValidationC__QualifyingEvent")!=-1){
						qualifyingEventValue = valuElementArray[attArrIndx];
					}
					colCCount++;
					
					// if the colcount is the multiples of the number of columns, then push the array with values.
					if(colCCount % 5 ==0){
						valCDP_array.push({Name:namValue, SocialSecurity:ssnValue,BeginingDate:beginDateValue,ExpairationDate:expDateValue,QualifyingEvent:qualifyingEventValue});
						var keyStrC = nameElementArray[attArrIndx];
						validCPKeyArr[pKeyIndxC++] = keyStrC.substr(keyStrC.indexOf("_____")+5,keyStrC.length);
						getValidCPKey = function(){
							return validCPKeyArr;
						}
					}
				}
				if(valCDP_array.length==0 || valCDP_array.length == undefined || valCDP_array.length <0){
					valCDP_array = new Array({Name:" ",SocialSecurity:" ",BeginingDate:" ",ExpairationDate:" ",QualifyingEvent:" "});
				}else{
					valCDP_array.push({Name:" ",SocialSecurity:" ",BeginingDate:" ",ExpairationDate:" ",QualifyingEvent:" "});
				}
				validation_DataGridC.dataProvider = valCDP_array;
			}
		}
		else if(subApplicationName == "Validation D"){
			if(getValidationD){
				var repeatNameElement:String;
				var repeatValueElement:String;
				var count:Number = 0;
				var noOfRows:Number = 0;
				
				for(childIndex=0;childIndex < employer_ValidateXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
					repeatNameElement = employer_ValidateXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					repeatValueElement= employer_ValidateXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
					nameElementArray[childIndex] = repeatNameElement;
					valuElementArray[childIndex] = repeatValueElement;									
					count = count + 1;
				}
				// to iterate the attribute name index and retrieve the attribute name and order the values correctly based on the columns.
				var colDCount:Number = 0;
				var namValue:String = ""; var ssnValue:String = ""; var ageRetirementValue:String = "";
				var dateRetirmentValue:String = ""; var hireDateValue:String=""; var workedperWeekValue:String = "";
				var pKeyIndxD = 0;
				for(attArrIndx:Number = 0; attArrIndx < nameElementArray.length; attArrIndx++){
					
					// check for the column name in the attribute, If avail then set the value in the variable.
					if(nameElementArray[attArrIndx].indexOf("Object__Customer__ValidationD__Name")!=-1){							
						namValue = valuElementArray[attArrIndx]; 
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Customer__ValidationD__SocialSecurityNumber")!=-1){
						ssnValue = valuElementArray[attArrIndx];
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Customer__ValidationD__RetirementAge")!=-1){
						ageRetirementValue = valuElementArray[attArrIndx];
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Customer__ValidationD__RetirementDate")!=-1){
						dateRetirmentValue = valuElementArray[attArrIndx];
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Customer__ValidationD__HireDate")!=-1){
						hireDateValue = valuElementArray[attArrIndx];
					}
					else if(nameElementArray[attArrIndx].indexOf("Object__Customer__ValidationD__AvgHrsWorkedPerWeek")!=-1){
						workedperWeekValue = valuElementArray[attArrIndx];
					}
					colDCount++;
					
					// if the colcount is the multiples of the number of columns, then push the array with values.
					if(colDCount % 6 ==0){
						valDDP_array.push({Name:namValue, SocialSecurity:ssnValue,AgeRetirement:ageRetirementValue,DateRetirement:dateRetirmentValue,DateHire:hireDateValue,WorkedPerWeek:workedperWeekValue});
						var keyStrD = nameElementArray[attArrIndx];
						validDPKeyArr[pKeyIndxD++] = keyStrD.substr(keyStrD.indexOf("_____")+5,keyStrD.length);
						getValidDPKey = function(){
							return validDPKeyArr;
						}
					}
				}
				
				if(valDDP_array.length==0 || valDDP_array.length == undefined || valDDP_array.length <0){
					valDDP_array = new Array({Name:" ",SocialSecurity:" ",AgeRetirement:" ",DateRetirement:" ",DateHire:" ",WorkedPerWeek:" "});
				}else{
					valDDP_array.push({Name:" ",SocialSecurity:" ",AgeRetirement:" ",DateRetirement:" ",DateHire:" ",WorkedPerWeek:" "});
				}
				validation_DataGridD.dataProvider = valDDP_array;			
			}
		}
	}	
}

var carrierPKeyArr:Array = new Array();
/*Retrieving method for retrieve attributes data in Carrier History Tab*/
retrieveCarrierHistory = function(){
	var save_none:String = (getCombinedFormDetails()).get("Object__Customer__CarrierHistory__SaveNone");
	verNum_Carrier.text = major_Ver_Number+minor_Ver_Number;
	if(save_none=="SAVE") {
		currentPrior_dataGrid.enabled = true;
		var employer_CarrierHistoryXML1:XML = new XML();
		employer_CarrierHistoryXML1.load("testxml.xml");
		employer_CarrierHistoryXML1.ignoreWhite = true;
		employer_CarrierHistoryXML1.onLoad = function(success:Boolean){
			if(true){
				getCarrierValuefromXML(global_employer_XML);
			}
		}	
	} else if(save_none=="SAVE_NONE") {
		currentPrior_dataGrid.enabled = false;
	}
};

getCarrierValuefromXML = function(employer_CarrierHistoryXML:XML){
	
	var myDP_Carrier_array:Array = new Array();
	var subApplicationName :String;
	nameElementArray = new Array();
	valuElementArray = new Array();
	
	var attributeChildNode = employer_CarrierHistoryXML.firstChild.firstChild.firstChild.childNodes;
	var subApplChildNode = employer_CarrierHistoryXML.firstChild.firstChild.childNodes;		
	for(parentIndex = 0;parentIndex < employer_CarrierHistoryXML.firstChild.childNodes.length;parentIndex++){
		subApplicationName = employer_CarrierHistoryXML.firstChild.childNodes[parentIndex].attributes.Name;
		if(subApplicationName == "CarrierHistory"){
			
			var repeatNameElement:String;
			var repeatValueElement:String;
			var count:Number = 0;
			var noOfRows:Number = 0;
			
			for(childIndex=0;childIndex < employer_CarrierHistoryXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
				repeatNameElement = employer_CarrierHistoryXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				repeatValueElement= employer_CarrierHistoryXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
				nameElementArray[childIndex] = repeatNameElement;
				valuElementArray[childIndex] = repeatValueElement;									
				count = count + 1;
			}
			// to iterate the attribute name index and retrieve the attribute name and order the values correctly based on the columns.
			var colCount:Number = 0;
			var isContinuingCoverageValue:String = "N"; var carrierNameValue="";
			var benefitsValue = ""; var employeeValue="";
			var fromValue=""; var employeeSpouseCurrentValue="";
			var toValue = ""; var employeeChildCurrentValue="";
			var employeeRenewalValue = "";
			var familyCurrentValue = "";
			var pKeyIndxA=0;
			for(attArrIndx:Number = 0; attArrIndx < nameElementArray.length; attArrIndx++){
				
				// check for the column name in the attribute, If avail then set the value in the variable.
				
				if(nameElementArray[attArrIndx].indexOf("Object__Customer__CarrierHistory__CarrierName")!=-1){							
					carrierNameValue = valuElementArray[attArrIndx]; 
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Customer__CarrierHistory__ContinuingCoverage")!=-1){
					isContinuingCoverageValue = valuElementArray[attArrIndx];
					if(isContinuingCoverageValue==""|| isContinuingCoverageValue == undefined || isContinuingCoverageValue=="undefined") {						
						isContinuingCoverageValue="N";
					}
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Customer__CarrierHistory__CarrierBenifits")!=-1){
					benefitsValue = valuElementArray[attArrIndx];
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Customer__CarrierHistory__CarrierDateFrom")!=-1){
					fromValue = valuElementArray[attArrIndx];
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Customer__CarrierHistory__CarrierDateTo")!=-1){
					toValue = valuElementArray[attArrIndx];
				}						
				else if(nameElementArray[attArrIndx].indexOf("Object__Customer__CarrierHistory__EmployeeCurrentRates")!=-1){
					employeeValue = valuElementArray[attArrIndx];
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Customer__CarrierHistory__EmployeeAndSpouseCurrentRates")!=-1){
					employeeSpouseCurrentValue = valuElementArray[attArrIndx];
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Customer__CarrierHistory__EmployeeAndChildCurrentRates")!=-1){
					employeeChildCurrentValue = valuElementArray[attArrIndx];
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Customer__CarrierHistory__FamilyCurrentRates")!=-1){
					familyCurrentValue = valuElementArray[attArrIndx];
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Customer__CarrierHistory__EmployeeRenewalRates")!=-1){
					employeeRenewalValue = valuElementArray[attArrIndx];
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Customer__CarrierHistory__EmployeeAndSpouseRenewalRates")!=-1){
					employeeSpouseRenewalValue = valuElementArray[attArrIndx];
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Customer__CarrierHistory__EmployeeAndChildRenewalRates")!=-1){
					employeeChildRenewalValue = valuElementArray[attArrIndx];
				}
				else if(nameElementArray[attArrIndx].indexOf("Object__Customer__CarrierHistory__FamilyRenewalRates")!=-1){
					familyRenewalValue = valuElementArray[attArrIndx];
				}
				
				colCount++;																									
				// if the colcount is the multiples of the number of columns, then push the array with values.
				if(colCount % 13 ==0){
					myDP_Carrier_array.push({CarrierName:carrierNameValue, ContinuingCoverage:isContinuingCoverageValue, Benefits:benefitsValue, From:fromValue,To:toValue,Employee:employeeValue ,EmployeeSpouseCurrent:employeeSpouseCurrentValue ,EmployeeChildCurrent:employeeChildCurrentValue ,FamilyCurrent:familyCurrentValue ,EmployeeRenewal:employeeRenewalValue ,EmployeeSpouseRenewal:employeeSpouseRenewalValue ,EmployeeChildRenewal:employeeChildRenewalValue ,FamilyRenewal:familyRenewalValue});
					// populate a array for primay key								
					var keyStrA = nameElementArray[attArrIndx];
					carrierPKeyArr[pKeyIndxA++] = keyStrA.substr(keyStrA.indexOf("_____")+5,keyStrA.length);
					getCarrierHistoryPKey = function(){
						return carrierPKeyArr;
					}
				}
			}			
			if(myDP_Carrier_array.length==0 || myDP_Carrier_array.length == undefined || myDP_Carrier_array.length <0){
				myDP_Carrier_array = new Array({CarrierName:" ",ContinuingCoverage:"N", Benefits:" ",From:" ",To:" ",Employee:" ",EmployeeSpouseCurrent:" ",EmployeeChildCurrent:" ",FamilyCurrent:" ",EmployeeRenewal:" ",EmployeeSpouseRenewal:" ",EmployeeChildRenewal:" ",FamilyRenewal:" "});
			}else{
				myDP_Carrier_array.push({CarrierName:" ",ContinuingCoverage:"N", Benefits:" ",From:" ",To:" ",Employee:" ",EmployeeSpouseCurrent:" ",EmployeeChildCurrent:" ",FamilyCurrent:" ",EmployeeRenewal:" ",EmployeeSpouseRenewal:" ",EmployeeChildRenewal:" ",FamilyRenewal:" "});
			}
			currentPrior_dataGrid.dataProvider = myDP_Carrier_array;
		}
	}
}

/*Retrieving method for retrieve attributes data in Authourized Signature Tab*/
retreiveAuthorizedSignature = function(){
	verNum_AuthorSign.text = major_Ver_Number+minor_Ver_Number;	
	for(parentIndex = 0;parentIndex<global_employer_XML.firstChild.childNodes.length;parentIndex++){
		for(childIndex=0;childIndex<global_employer_XML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
			var subApplicationName = global_employer_XML.firstChild.childNodes[parentIndex].attributes.Name;
			var nameElement:String  = global_employer_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
			var valueElement:String = global_employer_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
			if(subApplicationName == "ADD EDIT CUSTOMER") {
				if(nameElement == "Object__Customer__CustomerName" and valueElement != null){
						Object_Customer_ActionRequested_groupCompanyName.text = valueElement;
				} else if(nameElement == "Object__Customer__AuthorizedSignature" and valueElement != undefined) {
						Object__Customer__AuthorizedSignature.text = valueElement;
				
				} else if(nameElement == "Object__Customer__SubmittedDate" and valueElement != undefined) {
						Object__Customer__SubmittedDate.text = reformateDate(valueElement);
				} else if(nameElement == "Object__CustomerAdditional__AuthorizedSignatureName" and valueElement != undefined) {
					Object__CustomerAdditional__AuthorizedSignatureName.text = valueElement;
					
				} else if(nameElement == "Object__CustomerAdditional__AuthorizedSignatureTitle" and valueElement != undefined) {
					Object__CustomerAdditional__AuthorizedSignatureTitle.text = valueElement;
				} else if(nameElement == "GeneralAgency__AgencyId" and valueElement != null){
					generalAgencyId = valueElement;
					
				} else if(nameElement == "Agency__AgencyId" and valueElement != null){
					agencyId = valueElement;
					
				} else if(nameElement == "AgentId" and valueElement != null){
					agentId = valueElement;
				}
			}
		}
	}	
};


enableValidationA_Attributes = function (){
	
	validationA_yes.selected = true;
	validation_DataGridA.enabled = true;
	AddRow.enabled = true;
	DeleteRow.enabled = true;

}

disableValidationA_Attributes = function (){
	
	validationA_no.selected = true;
	validation_DataGridA.enabled = false;
	AddRow.enabled = false;
	DeleteRow.enabled = false;
}

enableValidationB_Attributes = function (){
	
	validationB_yes.selected = true;
	validation_DataGridB.enabled = true;
	AddRow1.enabled = true;
	DeleteRow1.enabled = true;

}


disableValidationB_Attributes = function (){
	
	validationB_no.selected = true;
	validation_DataGridB.enabled = false;
	AddRow1.enabled = false;
	DeleteRow1.enabled = false;
	
}


enableValidationC_Attributes = function (){

	validationC_yes.selected = true;
	validation_DataGridC.enabled = true;
	AddRow2.enabled = true;
	DeleteRow2.enabled = true;
	
}


disableValidationC_Attributes = function (){

	validationC_no.selected = true;
	validation_DataGridC.enabled = false;
	AddRow2.enabled = false;
	DeleteRow2.enabled = false;
	
}


enableValidationD_Attributes = function (){

	validationD_yes.selected = true;
	validation_DataGridD.enabled = true;
	AddRow3.enabled = true;
	DeleteRow3.enabled = true;
	
}


disableValidationD_Attributes = function (){

	validationD_no.selected = true;
	validation_DataGridD.enabled = false;
	AddRow3.enabled = false;
	DeleteRow3.enabled = false;
	
}

/**
 * To get the detail of Combined Form -[to get the information other than the datagrid from Carrier History and Validation tab ]
 * @author gnanaguru_g@solartis.net
 */
getCombinedFormDetails = function() {	
	var attributes:HashMap = new HashMap();
	var subApplicationName ="";
	validation_DataGridA.enabled = false;
	AddRow.enabled = false;
	DeleteRow.enabled = false;
	//validationA_no.selected = true;
	validation_DataGridB.enabled = false;
	AddRow1.enabled = false;
	DeleteRow1.enabled = false;
	//validationB_no.selected = true;
	validation_DataGridC.enabled = false;
	AddRow2.enabled = false;
	DeleteRow2.enabled = false;
	//validationC_no.selected = true;
	validation_DataGridD.enabled = false;
	AddRow3.enabled = false;
	DeleteRow3.enabled = false;
	//validationD_no.selected = true;		
	attributes.put("Object__Customer__CarrierHistory__SaveNone","SAVE");
	for(parentIndex = 0;parentIndex<global_employer_XML_Extended.firstChild.childNodes.length;parentIndex++){
		subApplicationName = global_employer_XML_Extended.firstChild.childNodes[parentIndex].attributes.Name;		
		if(subApplicationName=="Employer Combined Application") {
			for(childIndex=0;childIndex<global_employer_XML_Extended.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
				
				var nameElement:String  = global_employer_XML_Extended.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				var valueElement:String = global_employer_XML_Extended.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
				
				if(nameElement=="Object__Customer__CarrierHistory__SaveNone" and valueElement != "undefined"){
					if(valueElement=="SAVE_NONE"){
						Object__Customer__CarrierHistory__SaveNone___DMS_CUSTOMER_COMBINED_APPLICATIONS____CARRIER_HISTORY_SAVE_NONE.selected = true;
						attributes.put(nameElement,valueElement);
					} else {
						attributes.put(nameElement,"SAVE");
					}
				} else if(nameElement=="Object__Customer__ValidationA__HadTreatedForSeriousMedicalCondition" and valueElement!="undefined"){
					Object__Customer__ValidationA__HadTreatedForSeriousMedicalCondition___DMS_CUSTOMER_COMBINED_APPLICATIONS____VALIDATIONA_TREATED_BEFORE.setValue(valueElement);
					attributes.put(nameElement,valueElement);
					if(valueElement=="Y") {
						getValidationA = true;
						validation_DataGridA.enabled = true;
						AddRow.enabled = true;
						DeleteRow.enabled = true;
					}
				} else if(nameElement=="Object__Customer__ValidationB__HadInjuryWithinPast24Month" and valueElement!="undefined"){
					Object__Customer__ValidationB__HadInjuryWithinPast24Month___DMS_CUSTOMER_COMBINED_APPLICATIONS____VALIDATIONB_HAD_INJURY.setValue(valueElement);
					attributes.put(nameElement,valueElement);
					if(valueElement=="Y") {
						getValidationB = true;
						validation_DataGridB.enabled = true;
						AddRow1.enabled = true;
						DeleteRow1.enabled = true;
					}
				} else if(nameElement=="Object__Customer__ValidationC__IsCobreEligible" and valueElement!="undefined"){
					Object__Customer__ValidationC__IsCobreEligible___DMS_CUSTOMER_COMBINED_APPLICATIONS____VALIDATIONC_COBRA_ELIGIBLE.setValue(valueElement);
					attributes.put(nameElement,valueElement);
					if(valueElement=="Y") {
						getValidationC = true;
						validation_DataGridC.enabled = true;
						AddRow2.enabled = true;
						DeleteRow2.enabled = true;
					}
				} else if(nameElement=="Object__Customer__ValidationD__IsRetireesMeetEligibility" and valueElement!="undefined"){
					Object__Customer__ValidationD__IsRetireesMeetEligibility___DMS_CUSTOMER_COMBINED_APPLICATIONS____VALIDATIOND_RETIREES_MEET_ELIGIBILITY.setValue(valueElement);
					attributes.put(nameElement,valueElement);
					if(valueElement=="Y") {
						getValidationD = true;
						validation_DataGridD.enabled = true;
						AddRow3.enabled = true;
						DeleteRow3.enabled = true;
					}
				}
			}
		}
	}	
	return attributes;
}
