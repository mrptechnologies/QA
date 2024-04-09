	//import com.lib.data.holder.map.HashMap;
	
	hideIndicatorImage();
	var employee_CensusXML:XML = new XML();
	var countTotalPolicyHolder:Number;
	var countTotalDearBorn:Number;
	var countTotalSpouseDetail:Number;
	var isPolicyHolder:Boolean;
	var isDearBorn:Boolean;
	var isSpouseDetail:Boolean;
	var isDependentElement:Boolean;
	var global_employee_XML:XML;
	var dearBornMap:HashMap = new HashMap();	
	var policyHolderMap:HashMap = new HashMap();
	var spouseDetailMap:HashMap = new HashMap();
	var OtherCoverageMap:HashMap = new HashMap();	
	var ContinuingCovMap:HashMap = new HashMap();
	var PriorEncodingMap:HashMap = new HashMap();
	var dependentMap:HashMap = new HashMap();
	var insWaiverMap:HashMap = new HashMap();	
	var waiveSubmissionQuestionMap:HashMap = new HashMap();	
	var actionRequestedMap:HashMap = new HashMap();
	var dependentKeys:Array = new Array();
	var countTotalActionRequested:Number;
	var isActionRequested:Boolean;
	var enableIndicator:Boolean;
	var enableIndicatorInsWaiver:Boolean;

	/**
	 * Variable declaration for Employee Submission Rule
	 * @author gnanaguru_g@solaris.net
	 */
	 
	 //--> Action Requested Block
	//  var errorMessage_HealthProductName:String = "Health Product Name is missing on the Action Requested page.";
	//  var errorMessage_DrugProductName:String ="Drug Product Name is missing on the Action Requested page.";
	//  var errorMessage_DentalProductName:String ="Dental Product Name is missing on the Action Requested page.";
	//  var errorMessage_VisionProductName:String ="Vision Product Name is missing on the Action Requested page.";
	 
	 //--> Policy Holder Block
	 var errorMessage_LName:String = "The Employee Last Name is missing on the Policyholder page.";
	 var errorMessage_FName:String = "The Employee First Name is missing on the Policyholder page.";
	 var errorMessage_Employee_SSN:String = "The Employee Social Security # is missing on the Policyholder page.";
	 var errorMessage_Employee_DOB:String = "The Employee Date of Birth is missing on the Policyholder page.";
	 var errorMessage_Employee_Gender:String ="The Employee Gender is missing on the Policyholder page.";
	 var errorMessage_Employee_Employment_Status:String = "The Employee Employment Status is missing on the Policyholder page.";
	 var errorMessage_ReHire_Date:String  = "The Date of (Re)Hire is missing on the Policyholder page.";
	 var errorMessage_COBRAExpiration_Date:String = "The Date of COBRA Expiration is missing on the Policyholder page.";
	 var errorMessage_Employee_HomeAddress = "The Employee Home Address is missing on the Policyholder page";
     var errorMessage_Employee_City = "The Employee Home City is missing on the Policyholder page.";
	 var errorMessage_Employee_State = "The Employee Home State is missing on the Policyholder page.";
	 var errorMessage_Employee_Zip = "The Employee ZIP Code is missing on the Policyholder page.";
	 
	 //--> Covred Dependent Block
	 var spouse_Question:String = "SPOUSE_QUESTION";
	 var errorMessage_Spouse_LName:String = "The Spouse Last Name is missing on the Covered Dependents page.";
	 var errorMessage_Spouse_FName:String = "The Spouse First Name is missing on the Covered Dependents page.";
	 var errorMessage_Spouse_SSN:String = "The Spouse Social Security # is missing on the Covered Dependents page.";
	 var errorMessage_Spouse_DOB:String = "The Spouse Date of Birth is missing on the Covered Dependents page.";
	 var errorMessage_Spouse_Gender:String = "The Spouse Gender is missing on the Covered Dependents page.";
	 var errorMessage_Dependent_LName:String = "A Dependent Last Name is missing on the Covered Dependents page.";
	 var errorMessage_Dependent_FName:String = "A Dependent First Name is missing on the Covered Dependents page.";	 
	 var errorMessage_Dependent_DOB:String = "A Dependent Date of Birth is missing on the Covered Dependents page.";
	 var errorMessage_Dependent_Gender:String = "A Dependent Gender is missing on the Covered Dependents page.";
	 
	  //--> Life Insurance Block
	 var errorMessage_OptionalLifeAmount:String = "The Optional Life Amount is missing on the Life Insurance page.";
	 var errorMessage_ShortTermDisability_PlanOption:String = "A Short Term Disability Plan Option Selection is missing on the Life Insurance page.";
	// var errorMessage_LongTermDisability_PlanOption:String = "The Long Term Disability Class Information is missing on the Life Insurance page.";
//	 var errorMessage_LongTermDisability_AnualSalaryInfo:String = "The Long Term Disability Annual Salary Information is missing on the Life Insurance page.";
     var errorMessage_BasicLifeADD:String = "";
	 var errorMessage_VoluntaryShortTerm:String = "";
	 
	 //-->Medical Health Questionnaire Block
	 var errorMessage_Questionnaire:String = "Not all the questions in Section A and B on the Medical Health Questionnaire page have been answered.";
	 var errorMessage_Height:String = "Height Information is missing on the Medical Health Questionnaire.";
	 var errorMessage_Weight:String = "Weight Information is missing on the Medical Health Questionnaire.";
	 var errorMessage_Smoker:String = "Smoker Information is missing on the Medical Health Questionnaire.";
	 
	 //--> About Your Needs Block
	 var errorMessage_PrimaryLanguage_Other:String = "Language Information is missing on the About Your Needs.";
	 var errorMessage_Cultural_Need:String = "Other cultural need/preference Information is missiong on the About Your Needs.";
	 
	 //--> Ins Waiver Block
/*	 var errorMessage_InsCompanyName:String = "Insurance Company Name Information is missing on the Section A of Insurance Waiver.";
	 var errorMessage_OtherCoverage:String = "Other Coverage Information is missing on the Section B of Insurance Waiver.";
	 var errorMessage_CompanyName:String = "Company Name Information is missing on the Section B of Insurance Waiver.";
*/	 

     var errorMessage_InsCompanyName:String = "";
	 var errorMessage_OtherCoverage:String = "";
	 var errorMessage_CompanyName:String = "";
	 var errorMessage_InsSectionA:String = "Section A. has not been completely answered on the Employee Waiver page.";
	 var errorMessage_InsSectionB:String = "Section B. has not been answered on the Employee Waiver page.";
	 var errorMessage_InsEmployeeName:String = "Employee Name has not been entered on Employee Waiver page.";
	 var errorMessage_InsSSN:String = "Employee Social Security Number has not been entered on the Employee Waiver page.";
	 var errorMessage_InsSectionACoverageReason:String =  "Reason for waiving coverage of Section A. has not been answered on the Employee Waiver page.";
	 
	 //--> Other Coverages Block
	  var errorMessage_OtherCoverage_MedicareInformation = "The Medicare Information question has not been answered on the Other Coverage page.";
	  var errorMessage_OtherCoverage_ContinuingCoverage = "The Continuing Coverage question has not been answered on the Other Coverage page.";
	  var errorMessage_OtherCoverage_PriorEndingCoverage = "The Prior or Ending Coverage question has not been answered on the Other Coverage page.";
	  var errorMessage_OtherCoverage_DataGrid:String = " Medicare Information is missing on the Other Coverage Page.";
	  var errorMessage_OtherCoverage_OtherPolicyHolderName:String = "PolicyHolderName is missing in Continuing Coverage Section of Other Coverage Page";
	  var errorMessage_OtherCoverage_InsCompanyName:String = "Name and Address of Insurance Company is missing in Continuing Coverage Section of Other Coverage Page";	
	  var errorMessage_OtherCoverage_PolicyNumber:String = "Policy Number is missing in Continuing Coverage Section of Other Coverage Page";
	  var errorMessage_OtherCoverage_PolEffectiveDate:String = "Policy Effective Date is missing in Continuing Coverage Section of Other Coverage Page";
	  var errorMessage_OtherCoverage_CoverageType:String = "Coverage Type is missing in Continuing Coverage Section of Other Coverage Page";
	  var errorMessage_OtherCoverage_WorkStatus:String = "Work Status is missing in Continuing Coverage Section of Other Coverage Page";
  	  var errorMessage_OtherCoverage_PolicyType:String = "Policy Type is missing in Continuing Coverage Section of Other Coverage Page";
	  var errorMessage_OtherCoverage_LastEffectiveDate:String = "Last Effective Date is missing in Prior or Ending Coverage Section of Other Coverage Page";
	//  var errorMessage_OtherCoverage_PolicyEndDate:String = "Policy End Date is missing in Prior or Ending Coverage Section of Other Coverage Page";
	  var errorMessage_OtherCoverage_InsuranceCarrierName:String = "Insurance Carrier Name is missing in Prior or Ending Coverage Section of Other Coverage Page";
	 	 
	 /**
	* API to execute the submission rule for employer.
	* @author gnanaguru_g@solartis.net
	*/
	executeSubmissionRule = function() {
		
		showIndicatorImage();
		ExternalInterface.call("showLegand()");
		checkCondition();
		checkConditionExtended();
		countTotalPolicyHolder = 0;						
		var alertmsg:String = "";
		var isRuleSucced:Boolean = true;				
		
		if(validateEmployee(global_employee_XML) && validateEmployee_Extended(global_employee_XML_Extended)) {			
			var errorS_NO:Number=0;
			/**
			 * To Construct Error Message
			 */
			//if(errorMessage_HealthProductName!="") {
				//alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_HealthProductName+"\n";
			//}
			//if(errorMessage_DrugProductName!="") {
				//alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_DrugProductName+"\n";
			//}
			//if(errorMessage_DentalProductName!="") {
				//alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_DentalProductName+"\n";
			//}
			//if(errorMessage_VisionProductName!="") {
				//alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_VisionProductName+"\n";
			//}
			if(errorMessage_LName!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_LName+"\n";
			}
			if(errorMessage_FName!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_FName+"\n";
			}
			if(errorMessage_Employee_SSN!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Employee_SSN+"\n";
			}
			if(errorMessage_Employee_DOB!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Employee_DOB+"\n";
			}
			if(errorMessage_Employee_Gender!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Employee_Gender+"\n";
			}			
			if(errorMessage_Employee_HomeAddress!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Employee_HomeAddress+"\n";
			}
			if(errorMessage_Employee_City!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Employee_City+"\n";
			}
			if(errorMessage_Employee_State!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Employee_State+"\n";
			}
			if(errorMessage_Employee_Zip!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Employee_Zip+"\n";
			}
			if(errorMessage_Employee_Employment_Status!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Employee_Employment_Status+"\n";
			}
			if(errorMessage_ReHire_Date!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_ReHire_Date+"\n";
			}
			if(errorMessage_COBRAExpiration_Date!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_COBRAExpiration_Date+"\n";
			}
			
			if(spouse_Question=="") {
				
				if(errorMessage_Spouse_LName!="") {
					alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Spouse_LName+"\n";
				}
				if(errorMessage_Spouse_FName!="") {
					alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Spouse_FName+"\n";
				}
				if(errorMessage_Spouse_SSN!="") {
					alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Spouse_SSN+"\n";
				}
				if(errorMessage_Spouse_DOB!="") {
					alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Spouse_DOB+"\n";
				}
				if(errorMessage_Spouse_Gender!="") {
					alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Spouse_Gender+"\n";
				}
			}
			if(errorMessage_Dependent_LName!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Dependent_LName+"\n";
			}
			if(errorMessage_Dependent_FName!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Dependent_FName+"\n";
			}
			if(errorMessage_Dependent_DOB!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Dependent_DOB+"\n";
			}
			if(errorMessage_Dependent_Gender!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Dependent_Gender+"\n";
			}
			if(errorMessage_OtherCoverage_MedicareInformation!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_OtherCoverage_MedicareInformation+"\n";
			}			
			if(errorMessage_OtherCoverage_DataGrid!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_OtherCoverage_DataGrid+"\n";
			}
			if(errorMessage_OtherCoverage_ContinuingCoverage!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_OtherCoverage_ContinuingCoverage+"\n";
			}			
			if(errorMessage_OtherCoverage_OtherPolicyHolderName!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_OtherCoverage_OtherPolicyHolderName+"\n";
			}
			if(errorMessage_OtherCoverage_InsCompanyName!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_OtherCoverage_InsCompanyName+"\n";
			}
			if(errorMessage_OtherCoverage_PolicyNumber!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_OtherCoverage_PolicyNumber+"\n";
			}
			if(errorMessage_OtherCoverage_PolEffectiveDate!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_OtherCoverage_PolEffectiveDate+"\n";
			}
			if(errorMessage_OtherCoverage_CoverageType!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_OtherCoverage_CoverageType+"\n";
			}
			if(errorMessage_OtherCoverage_WorkStatus!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_OtherCoverage_WorkStatus+"\n";
			}
			if(errorMessage_OtherCoverage_PolicyType!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_OtherCoverage_PolicyType+"\n";
			}
			if(errorMessage_OtherCoverage_PriorEndingCoverage!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_OtherCoverage_PriorEndingCoverage+"\n";
			}
			if(errorMessage_OtherCoverage_LastEffectiveDate!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_OtherCoverage_LastEffectiveDate+"\n";
			}
			//if(errorMessage_OtherCoverage_PolicyEndDate!=""){
				//alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_OtherCoverage_PolicyEndDate+"\n";
			//}
			if(errorMessage_OtherCoverage_InsuranceCarrierName!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_OtherCoverage_InsuranceCarrierName+"\n";
			}
			if(errorMessage_OptionalLifeAmount!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_OptionalLifeAmount+"\n";
			}
			if(errorMessage_ShortTermDisability_PlanOption!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_ShortTermDisability_PlanOption+"\n";
			}
			////if(errorMessage_LongTermDisability_PlanOption!="") {
				//alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_LongTermDisability_PlanOption+"\n";
			//}
			//if(errorMessage_LongTermDisability_AnualSalaryInfo!="") {
				//alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_LongTermDisability_AnualSalaryInfo+"\n";
			//}
			if(errorMessage_BasicLifeADD!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_BasicLifeADD+"\n";
			}
			if(!questionaireAandBFilled){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Questionnaire+"\n";
			}
			if(errorMessage_Height!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Height+"\n";
			}
			if(errorMessage_Weight!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Weight+"\n";
			}
			if(errorMessage_Smoker!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Smoker+"\n";
			}
			if(errorMessage_PrimaryLanguage_Other!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_PrimaryLanguage_Other+"\n";
			}
			if(errorMessage_Cultural_Need!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_Cultural_Need+"\n";
			}
			if(errorMessage_VoluntaryShortTerm!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_VoluntaryShortTerm+"\n";
			}
			
	/*		
			if(errorMessage_InsCompanyName!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_InsCompanyName+"\n";
			}
			if(errorMessage_OtherCoverage!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_OtherCoverage+"\n";
			}
			if(errorMessage_CompanyName!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_CompanyName+"\n";
			}
	*/	
						
		}
		
		/**
		 * To Disaply the constructed Error Message
		 */
		 if(alertmsg.length>0) {
			submit_TermsNCondition._visible = true;
			Submit_Complete._visible = false;
		
			_root.mMsg1._visible = true;
			_root.mMsg2._visible = true;
			_root.mMsg3._visible = false;
			var err_msg="Click on the yellow circles above to complete the missing information listed below."
			err_msg = err_msg+"\n\n"+alertmsg; 
			Error_Window._visible=true;
			Error_Window.Error_Container.text=err_msg;						
			ExternalInterface.call("scrollUp");
			isRuleSucced = false;
		 }else{
			submit_TermsNCondition._visible = false;
			Submit_Complete._visible = true;
		
				_root.mMsg1._visible = false;
				_root.mMsg2._visible = false;
				_root.mMsg3._visible = true;
		}
		 
		 return isRuleSucced;
	}
	
	/**
	  *	API to execute the submission rule for Insurance Waiver
	  */
	  
	executeInsSubmissionRule = function() {					
		
		showInsWaiverIndicatorImage();
		ExternalInterface.call("showLegand()");
		var Insalertmsg:String = "";
		var isInsRuleSucced:Boolean = true;				
		displayInsWaiverImage();

		if(validateWaiveEmployeeSubmission(global_employee_XML) && validateWaiveEmployeeExtendedSubmission(global_employee_XML_Extended)) {			
			var InserrorS_NO:Number=0;
			
			//if(errorMessage_HealthProductName!="") {				
				//Insalertmsg = Insalertmsg+(++InserrorS_NO)+". "+errorMessage_HealthProductName+"\n";
			//}
			//if(errorMessage_DrugProductName!="") {
				//Insalertmsg = Insalertmsg+(++InserrorS_NO)+". "+errorMessage_DrugProductName+"\n";
			//}
			//if(errorMessage_DentalProductName!="") {
				//Insalertmsg = Insalertmsg+(++InserrorS_NO)+". "+errorMessage_DentalProductName+"\n";
			//}
			//if(errorMessage_VisionProductName!="") {
				//Insalertmsg = Insalertmsg+(++InserrorS_NO)+". "+errorMessage_VisionProductName+"\n";
			//}
			if(errorMessage_InsCompanyName!=""){
				Insalertmsg = Insalertmsg+(++InserrorS_NO)+". "+errorMessage_InsCompanyName+"\n";
			}
			if(errorMessage_OtherCoverage!=""){
				Insalertmsg = Insalertmsg+(++InserrorS_NO)+". "+errorMessage_OtherCoverage+"\n";
			}
			if(errorMessage_CompanyName!=""){
				Insalertmsg = Insalertmsg+(++InserrorS_NO)+". "+errorMessage_CompanyName+"\n";
			}
			if(errorMessage_InsSectionA!=""){
				Insalertmsg = Insalertmsg+(++InserrorS_NO)+". "+errorMessage_InsSectionA+"\n";
			}		
			if(errorMessage_InsSectionB!=""){
				Insalertmsg = Insalertmsg+(++InserrorS_NO)+". "+errorMessage_InsSectionB+"\n";
			}		
			if(errorMessage_InsEmployeeName!=""){
				Insalertmsg = Insalertmsg+(++InserrorS_NO)+". "+errorMessage_InsEmployeeName+"\n";
			}		
			if(errorMessage_InsSSN!=""){
				Insalertmsg = Insalertmsg+(++InserrorS_NO)+". "+errorMessage_InsSSN+"\n";
			}				
			if(errorMessage_InsSectionACoverageReason!=""){
				Insalertmsg = Insalertmsg+(++InserrorS_NO)+". "+errorMessage_InsSectionACoverageReason+"\n";
			}
			
		}
	
	   /**
		 * To Display the constructed Error Message
		 */
		 if(Insalertmsg.length>0) {
			var err_msg="To submit this Insurance Waiver application complete the following information:"
			err_msg = err_msg+"\n\n"+Insalertmsg; 
			InsError_Window._visible=true;
			InsError_Window.Error_Container.text=err_msg;						
			ExternalInterface.call("scrollUp");
			isInsRuleSucced = false;
		 }
		 
		 return isInsRuleSucced;
	}
	
	
	
	checkMantatoryField = function(){
		employee_CensusXML.load("/GetApplicationXMLAction.do?answer(objectId)=0&answer(objectVerId)=0&CustomerHeaderNeeded=YES&answer(objectName)=EMPLOYEE&answer(applicationType)=EMPLOYEE&answer(applicationSubType)=&answer(state)=&answer(teritory)=");		
		//employee_CensusXML.load("1.xml");
		employee_CensusXML.ignoreWhite = true;
		employee_CensusXML.onLoad = function(success:Boolean){
			if(success){
				if(validateEmployee(employee_CensusXML)) {
					setEmployeeXML(employee_CensusXML);
					retreiveActionRequested();
					checkCondition();					
				}
			}
		}
	}
	
	validateEmployee = function(employeeXML:XML) {
		countTotalPolicyHolder = 0;
		countTotalDearBorn = 0;
		countTotalSpouseDetail = 0;
		countTotalActionRequested = 0;
		
		var attributeChildNode = employeeXML.firstChild.firstChild.firstChild.childNodes;
		var subApplChildNode = employeeXML.firstChild.firstChild.childNodes;		
		for(parentIndex = 0;parentIndex<employeeXML.firstChild.childNodes.length;parentIndex++){		
			var subApplicationName = employeeXML.firstChild.childNodes[parentIndex].attributes.Name;
			if(subApplicationName == "Policy") {
				if(employeeXML.firstChild.childNodes[parentIndex].childNodes.length <= 0){
					isPolicyHolder = true;
				}
				for(childIndex=0;childIndex<employeeXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){					
					var nameElement:String  = employeeXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					var valueElement:String = employeeXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;

					if(nameElement=="Object__Employee__PolicyHolder__LastName"){
						if(valueElement != "" and valueElement != undefined and valueElement != null){
							isPolicyHolder = true;
							errorMessage_LName="";
							countTotalPolicyHolder = countTotalPolicyHolder+1;
						}else{
							isPolicyHolder = false;
						}					
					}
					else if(nameElement=="Object__Employee__PolicyHolder__FirstName"){

						if(valueElement != "" and valueElement != undefined and valueElement != null){
							isPolicyHolder = true;
							errorMessage_FName="";
							countTotalPolicyHolder = countTotalPolicyHolder+1;
						}else{
							isPolicyHolder = false;
						}				
					}
					else if(nameElement=="Object__Employee__PolicyHolder__SSN"){

						if(valueElement != "" and valueElement != undefined and valueElement != null){
							isPolicyHolder = true;
							errorMessage_Employee_SSN="";
							countTotalPolicyHolder = countTotalPolicyHolder+1;
						}else{
							isPolicyHolder = false;
						}				
					}
					else if(nameElement=="Object__Employee__PolicyHolder__DateOfBirth"){

						if(valueElement != "" and valueElement != undefined and valueElement!="00-00-0000"){
							isPolicyHolder = true;
							errorMessage_Employee_DOB="";
							countTotalPolicyHolder = countTotalPolicyHolder+1;
						}else{
							isPolicyHolder = false;
						}				
					}
					else if(nameElement=="Object__Employee__PolicyHolder__Gender"){

						if(valueElement != "" and valueElement != undefined and valueElement != null){
							isPolicyHolder = true;
							errorMessage_Employee_Gender = "";
							countTotalPolicyHolder = countTotalPolicyHolder+1;
						}else{
							isPolicyHolder = false;
						}				
					}
					else if(nameElement=="Object__Employee__PolicyHolder__EmployementStatus" and valueElement == "Active" ){
						policyHolderMap.put(nameElement,valueElement);					
					}
					else if(nameElement=="Object__Employee__PolicyHolder__EmployementStatus" and valueElement == "Retired" ){
						policyHolderMap.put(nameElement,valueElement);					
					}
					else if(nameElement=="Object__Employee__PolicyHolder__EmployementStatus" and valueElement == "Cobra" ){
						policyHolderMap.put(nameElement,valueElement);					
					}
					else if(nameElement=="Object__Employee__PolicyHolder__DateOfHire"){
						if(valueElement != undefined and valueElement != null and valueElement != "undefined" and valueElement!="0000-00-00"){
							policyHolderMap.put(nameElement,valueElement);
						}
					}
					else if(nameElement=="Object__Employee__PolicyHolder__ExpirationDate"){
						if(valueElement != undefined and valueElement != null and valueElement != "undefined" and valueElement!="0000-00-00"){
							policyHolderMap.put(nameElement,valueElement);
						}
					}
					else if(nameElement=="Object__Employee__PolicyHolder__HomeAddress"){

						if(valueElement != "" and valueElement !=  "undefined" and valueElement != null){
							isPolicyHolder = true;
							errorMessage_Employee_HomeAddress = "";
							countTotalPolicyHolder = countTotalPolicyHolder+1;
						}else{
							isPolicyHolder = false;
						}				
					}
					else if(nameElement=="Object__Employee__PolicyHolder__City"){

						if(valueElement != "" and valueElement !=  "undefined" and valueElement != null){
							isPolicyHolder = true;
							errorMessage_Employee_City = "";
							countTotalPolicyHolder = countTotalPolicyHolder+1;
						}else{
							isPolicyHolder = false;
						}				
					}
					else if(nameElement=="Object__Employee__PolicyHolder__State"){

						if(valueElement != "" and valueElement !=  "undefined" and valueElement != null){
							isPolicyHolder = true;
							errorMessage_Employee_State = "";
							countTotalPolicyHolder = countTotalPolicyHolder+1;
						}else{
							isPolicyHolder = false;
						}				
					}
					else if(nameElement =="Object__Employee__PolicyHolder__Zipcode" ){

						if(valueElement != "" and valueElement !=  "undefined" and valueElement != null){
							isPolicyHolder = true;
							errorMessage_Employee_Zip = "";
							countTotalPolicyHolder = countTotalPolicyHolder+1;
						}else{
							isPolicyHolder = false;
						}				
					}
					else if(nameElement =="Object__Employee__PolicyHolder__EmailAddress"){

						if(valueElement != "" and valueElement !=  "undefined" and valueElement != null){
							isPolicyHolder = true;
							countTotalPolicyHolder = countTotalPolicyHolder+1;
						}else{
							isPolicyHolder = false;
						}				
					}
				}
			}
			if(subApplicationName == "Dependent"){
				var repeatNameElement:String;
				var repeatValueElement:String;
				var countTotalDependent:Number = 0;
				//isDependentElement = true;
				var pKeyIndxCovDep:Number=0;				
				if(employeeXML.firstChild.childNodes[parentIndex].childNodes.length <= 0){
					isDependentElement = true;
				}
				for(childIndex=0;childIndex < employeeXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
					repeatNameElement = employeeXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					repeatValueElement= employeeXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;				
					
					if(repeatNameElement.indexOf("Object__Employee__CoverageDept__Relationship")!=-1){																		
						dependentMap.put(repeatNameElement,repeatValueElement);
					}else if(repeatNameElement.indexOf("Object__Employee__CoverageDept__FirstName")!=-1){
						dependentMap.put(repeatNameElement,repeatValueElement);
					}
					else if(repeatNameElement.indexOf("Object__Employee__CoverageDept__LastName")!=-1){
						dependentMap.put(repeatNameElement,repeatValueElement);
					}
					else if(repeatNameElement.indexOf("Object__Employee__CoverageDept__DOB")!=-1){												
						dependentMap.put(repeatNameElement,repeatValueElement);
					}
					else if(repeatNameElement.indexOf("Object__Employee__CoverageDept__Gender")!= -1){							
						dependentMap.put(repeatNameElement,repeatValueElement);
					}
					countTotalDependent = countTotalDependent+1;
					if(countTotalDependent % 7 == 0 && countTotalDependent !=0){
						//isDependentElement = isDependentElement || DependentRowElement;
						dependentKeys[pKeyIndxCovDep++] = repeatNameElement.substr(repeatNameElement.indexOf("_____")+5,repeatNameElement.length);
					}				
				}
			}
			else if(subApplicationName == "Spouse Details"){
				if(employeeXML.firstChild.childNodes[parentIndex].childNodes.length <= 0){
					isSpouseDetail = true;
				}
				for(childIndex=0;childIndex<employeeXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){					
					var nameElement:String  = employeeXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					var valueElement:String = employeeXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;					
					if(nameElement=="Object__Employee__CoverageDept__Spouse__FName"){
						if(valueElement != "" && valueElement != "undefined"){
							isSpouseDetail = true;
							errorMessage_Spouse_FName="";
							countTotalSpouseDetail = countTotalSpouseDetail + 1;
						}else{
							isSpouseDetail = false;
						}		
					}
					else if(nameElement=="Object__Employee__CoverageDept__Spouse__Spouse" and valueElement =="Spouse"){
						spouseDetailMap.put(nameElement,valueElement);
						spouse_Question="";
					}
					else if(nameElement=="Object__Employee__CoverageDept__Spouse__LName"){
						if(valueElement != "" and valueElement != "undefined"){
							isSpouseDetail = true;
							errorMessage_Spouse_LName="";
							countTotalSpouseDetail = countTotalSpouseDetail+1;
						}else{
							isSpouseDetail = false;
						}		
					}
					else if(nameElement=="Object__Employee__CoverageDept__Spouse__SSN"){
						if(valueElement != "" and valueElement != "undefined"){
							isSpouseDetail = true;
							errorMessage_Spouse_SSN="";
							countTotalSpouseDetail = countTotalSpouseDetail+1;
						}else{
							isSpouseDetail = false;
						}		
					}
					else if(nameElement=="Object__Employee__CoverageDept__Spouse__DateOfBirth"){
						if(valueElement != "" and valueElement != "undefined" and valueElement != "0000-00-00"){
							isSpouseDetail = true;
							errorMessage_Spouse_DOB="";
							countTotalSpouseDetail = countTotalSpouseDetail+1;
						}else{
							isSpouseDetail = false;
						}		
					}else if(nameElement=="Object__Employee__CoverageDept__Spouse__Gender"){
						if(valueElement != "" and valueElement != "undefined"){
							
							errorMessage_Spouse_Gender="";
							
						}else{
							
						}
					}
				}
			}
			else if(subApplicationName == "Dearborn"){				
				
				for(childIndex=0;childIndex<employeeXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){					
					var nameElement:String  = employeeXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					var valueElement:String = employeeXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;

					if(nameElement=="Object__Employee__DearBorn__OptionalLife" and valueElement =="OptionalLife"){						
						dearBornMap.put(nameElement,valueElement);
					
					} else if(nameElement=="Object__Employee__DearBorn__OptionalLifeAmount"){
						if(valueElement != "" and valueElement != "undefined"){
							dearBornMap.put(nameElement,valueElement);
						}
					
					}else if(nameElement=="Object__Employee__DearBorn__BasicLifeADD"){
						if(valueElement != "" and valueElement != "undefined"){
							dearBornMap.put(nameElement,valueElement);
						}
					
					}else if(nameElement=="Object__Employee__DearBorn__ShortTermDisablity" and valueElement =="ShortTermDisability"){
						dearBornMap.put(nameElement,valueElement);
					
					}else if(nameElement=="Object__Employee__DearBorn__PlanOption"){
						if(valueElement != ""  and valueElement != "undefined"){
							dearBornMap.put(nameElement,valueElement);
						}
					
					} else if(nameElement =="Object__Employee__DearBorn__LongTermDisability" and valueElement =="LongTermDisability"){
						dearBornMap.put(nameElement,valueElement);					
					} 
					//else if(nameElement=="Object__Employee__DearBorn__Class"){
						//if(valueElement != "" and valueElement != "undefined" ){
							//dearBornMap.put(nameElement,valueElement);
						//}
					
					//}
					//else if(nameElement=="Object__Employee__DearBorn__AnnualSalary"){
						//if(valueElement != "" and valueElement != "undefined"){							
							//dearBornMap.put(nameElement,valueElement);
						//}
					//}
					else if(nameElement=="Object__Employee__DearBorn__PrimaryLastName"){
						if(valueElement != "" and valueElement != "undefined"){							
							dearBornMap.put(nameElement,valueElement);
						}
					}else if(nameElement=="Object__Employee__DearBorn__PrimaryFirstName"){
						if(valueElement != "" and valueElement != "undefined"){							
							dearBornMap.put(nameElement,valueElement);
						}
					}else if(nameElement=="Object__Employee__DearBorn__PrimaryDOB"){
						if(valueElement != "" and valueElement != "undefined"){							
							dearBornMap.put(nameElement,valueElement);
						}
					}else if(nameElement=="Object__Employee__DearBorn__PrimaryRelationship"){
						if(valueElement != "" and valueElement != "undefined"){							
							dearBornMap.put(nameElement,valueElement);
						}
					}else if(nameElement=="Object__Employee__DearBorn__PrimaryBenefitSplit"){
						if(valueElement != "" and valueElement != "undefined"){							
							dearBornMap.put(nameElement,valueElement);
						}
					}else if(nameElement=="Object__Employee__DearBorn__SecondaryLastName"){
						if(valueElement != "" and valueElement != "undefined"){							
							dearBornMap.put(nameElement,valueElement);
						}
					}else if(nameElement=="Object__Employee__DearBorn__SecondaryFirstName"){
						if(valueElement != "" and valueElement != "undefined"){							
							dearBornMap.put(nameElement,valueElement);
						}
					}else if(nameElement=="Object__Employee__DearBorn__SecondaryDOB"){
						if(valueElement != "" and valueElement != "undefined"){							
							dearBornMap.put(nameElement,valueElement);
						}
					}else if(nameElement=="Object__Employee__DearBorn__SecondaryRelationship"){
						if(valueElement != "" and valueElement != "undefined"){							
							dearBornMap.put(nameElement,valueElement);
						}
					}else if(nameElement=="Object__Employee__DearBorn__SecondaryBenefitSplit"){
						if(valueElement != "" and valueElement != "undefined"){							
							dearBornMap.put(nameElement,valueElement);
						}
					}
				}
			} else if(subApplicationName == "Coverage Cont."){
				if(employeeXML.firstChild.childNodes[parentIndex].childNodes.length <= 0){
					isOtherCoverageElement = false;
				}
				for(childIndex = 0;childIndex < employeeXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){			
				
					var nameElement:String  = employeeXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					var valueElement:String = employeeXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
					
					if(nameElement=="Object__Employee__OtherCoverage__OtherPolicyHolderName" &&  valueElement != "undefined" && valueElement != undefined){						
						ContinuingCovMap.put(nameElement,valueElement);
					
					}else if(nameElement=="Object__Employee__OtherCoverage__InsCompanyName" && valueElement !="" &&  valueElement != "undefined" && valueElement != " "){			
						ContinuingCovMap.put(nameElement,valueElement);
					}
					else if(nameElement=="Object__Employee__OtherCoverage__PolicyNumber" && valueElement !="" &&  valueElement != "undefined" && valueElement != " "){			
						ContinuingCovMap.put(nameElement,valueElement);
					}		
					else if(nameElement=="Object__Employee__OtherCoverage__MedicalCvg" && valueElement !="" &&  valueElement != "undefined" && valueElement != " "){			
						ContinuingCovMap.put(nameElement,valueElement);
					}
					else if(nameElement=="Object__Employee__OtherCoverage__PolEffectiveDate" && valueElement !="" &&  valueElement != "undefined" &&  valueElement != " " && valueElement != "0000-00-00"){			
						ContinuingCovMap.put(nameElement,valueElement);
					}
					else if(nameElement=="Object__Employee__OtherCoverage__DentalCvg" && valueElement !="" &&  valueElement != "undefined" &&  valueElement != " "){			
						ContinuingCovMap.put(nameElement,valueElement);
					}
					else if(nameElement=="Object__Employee__OtherCoverage__HospitalOnlyCvg" && valueElement !="" &&  valueElement != "undefined" &&  valueElement != " "){			
						ContinuingCovMap.put(nameElement,valueElement);
					}
					else if(nameElement=="Object__Employee__OtherCoverage__VisionCvg" && valueElement !="" &&  valueElement != "undefined" && valueElement != " "){			
						ContinuingCovMap.put(nameElement,valueElement);
					}
					else if(nameElement=="Object__Employee__OtherCoverage__PrescriptionDrugCvg" && valueElement !="" &&  valueElement != "undefined" && valueElement != " "){			
						ContinuingCovMap.put(nameElement,valueElement);
					}
					else if(nameElement=="Object__Employee__OtherCoverage__WorkStatus" && valueElement !="" &&  valueElement != "undefined" && valueElement != " "){			
						ContinuingCovMap.put(nameElement,valueElement);
					}
					else if(nameElement=="Object__Employee__OtherCoverage__PolicyType" && valueElement !="" &&  valueElement != "undefined" && valueElement != " "){			
						ContinuingCovMap.put(nameElement,valueElement);
					}
					else if(nameElement=="Object__Employee__OtherCoverage__LastEffectiveDate" && valueElement !="" &&  valueElement != "undefined" && valueElement != " " && valueElement != "0000-00-00"){						
						PriorEncodingMap.put(nameElement,valueElement);
					
					}else if(nameElement=="Object__Employee__OtherCoverage__PolicyEndDate" && valueElement !="" &&  valueElement != "undefined" && valueElement != " " && valueElement != "0000-00-00"){			
						PriorEncodingMap.put(nameElement,valueElement);
					}
					else if(nameElement=="Object__Employee__OtherCoverage__InsuranceCarrierName" && valueElement !="" &&  valueElement != "undefined" && valueElement != " "){			
						PriorEncodingMap.put(nameElement,valueElement);
					}
					else if(nameElement=="Object__Employee__OtherCoverage__IsCoveredByMedicare" &&  valueElement != "undefined" && valueElement != undefined ){
						PriorEncodingMap.put(nameElement,valueElement);
					
					}else if(nameElement=="Object__Employee__OtherCoverage__IsKeepingOtherHealthCoverage" &&  valueElement != "undefined" && valueElement != undefined ){			
						PriorEncodingMap.put(nameElement,valueElement);
					}
					else if(nameElement=="Object__Employee__OtherCoverage__IsHaveAnyPriorOrEndingCoverage" &&  valueElement != "undefined" && valueElement != undefined ){			
						PriorEncodingMap.put(nameElement,valueElement);
					}
					
				}
			} else if(subApplicationName == "Action"){							
				for(childIndex=0;childIndex<employeeXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){			
					var nameElement:String  = employeeXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					var valueElement:String = employeeXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
					
					if(nameElement=="Object__Employee__ActionRequested__HealthCvg" and valueElement =="HealthCoverage"){						
						actionRequestedMap.put(nameElement,valueElement);
					
					} else if(nameElement=="Object__Employee__ActionRequested__DrugCvg" and valueElement =="DrugCoverage"){
						actionRequestedMap.put(nameElement,valueElement);
					
					}else if(nameElement=="Object__Employee__ActionRequested__DentalCvg" and valueElement =="DentalCoverage"){
						actionRequestedMap.put(nameElement,valueElement);
					
					}else if(nameElement=="Object__Employee__ActionRequested__VisionCvg" and valueElement =="VisionCoverage"){
						actionRequestedMap.put(nameElement,valueElement);
					
					} else if(nameElement =="Object__Employee__ActionRequested__HealthPrdName" && valueElement != "undefined" && valueElement != undefined){
						actionRequestedMap.put(nameElement,valueElement);
					
					}else if(nameElement=="Object__Employee__ActionRequested__DrugPrdName" && valueElement != "undefined" && valueElement != undefined){
						actionRequestedMap.put(nameElement,valueElement);	
						
					} else if(nameElement=="Object__Employee__ActionRequested__DentalPrdName" && valueElement != "undefined" && valueElement != undefined){
						actionRequestedMap.put(nameElement,valueElement);	
						
					}else if(nameElement=="Object__Employee__ActionRequested__VisionPrdName" && valueElement != "undefined" && valueElement != undefined){
						actionRequestedMap.put(nameElement,valueElement);	
						
					}
				}
			} else if(subApplicationName == "Coverage"){
				if(employeeXML.firstChild.childNodes[parentIndex].childNodes.length <= 0){
					isOtherCoverageElement = false;
				}
				for(childIndex=0;childIndex < employeeXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
					repeatNameElement = employeeXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					repeatValueElement= employeeXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;				
					
					if(repeatNameElement.indexOf("Object__Employee__OtherCoverage__PolicyHolderName")!=-1){												
						if(repeatValueElement !=" " && repeatValueElement != undefined && repeatValueElement != ""){							
							OtherCoverageMap.put(repeatNameElement,repeatValueElement);
						}
					}else if(repeatNameElement.indexOf("Object__Employee__OtherCoverage__MedicareNumber")!=-1){								
						if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != ""){			
							OtherCoverageMap.put(repeatNameElement,repeatValueElement);
						}
					}else if(repeatNameElement.indexOf("Object__Employee__OtherCoverage__PartAEffDate")!=-1){
						if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != ""){			
							OtherCoverageMap.put(repeatNameElement,repeatValueElement);
						}
					}
					else if(repeatNameElement.indexOf("Object__Employee__OtherCoverage__PartBEffDate")!=-1){
						if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != ""){			
							OtherCoverageMap.put(repeatNameElement,repeatValueElement);
						}
					}
					else if(repeatNameElement.indexOf("Object__Employee__OtherCoverage__MedicareReason")!=-1){
						if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != ""){			
							OtherCoverageMap.put(repeatNameElement,repeatValueElement);
						}
					}
					else if(repeatNameElement.indexOf("Object__Employee__OtherCoverage__MedicareReasonOther")!=-1){
						if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != ""){			
							OtherCoverageMap.put(repeatNameElement,repeatValueElement);
						}
					}

				}
			}
		}
		validateActionRequested();
		validateDependent();
		validatePolicyHolder();
		validateDearBorn();
		validateSpouseDetail();
		validateOtherCoverageAttribute();
	//	checkRetrieveValueFromContinuingCoverageXML();
		return true;	
	}
	/**
	 *This function is used for Updating image according to submission rule
	 */	
	checkCondition = function(){		
	
		if(enableIndicator){
		//If condition is satisfied update images in Policy Holder Tab.
			if(isPolicyHolder && countTotalPolicyHolder == 10){
				policyHolder_wrong._visible = false;
				policyHolder._visible = false;
			}else{
				policyHolder_wrong._visible = true;
				policyHolder._visible = true;
			}
			
			//If condition is satisfied update images in DearBorn Tab.
			if(isDearBorn){			
				dearBorn_right._visible = true;
			}else{
				dearBorn_right._visible = false;
			}
			/*informationMessage = Alert.show("checkCondition"+isSpouseDetail+countTotalSpouseDetail+isDependentElement, "Information", Alert.OK , this, myclickHandler, "stockIcon", Alert.OK);		
			informationMessage.move(450,500);*/
	
			//If condition is satisfied update images in Covered Dependent Tab.
			if(isSpouseDetail && countTotalSpouseDetail == 4 && isDependentElement){			
				covered_wrong._visible = false;
				//covered_right._visible = true;
			}else{
				covered_wrong._visible = true;
				//covered_right._visible = false;
			}
			
			
			//If condition is satisfied update images in Other Coverage Tab.
			if(isOtherCoverageElement){
				otherCoverage_wrong._visible = false;
				other_wrong._visible = false;
			}else{
				otherCoverage_wrong._visible = true;
				other_wrong._visible = true;
			}
		}
      //informationMessage = Alert.show("Check img"+(enableIndicator || enableIndicatorInsWaiver), "Information", Alert.OK , this, myclickHandler, "stockIcon", Alert.OK);		
	  //informationMessage.move(450,500);	
			//If condition is satisfied update images in Action Requested Tab.
		if(enableIndicator || enableIndicatorInsWaiver){	
			if(isActionRequested){
				action_wrong._visible = false;
				action_wrong1._visible = false;
			}else{
				action_wrong._visible = true;
				action_wrong1._visible = true;
			}
		}
	}
	/**
	 *This function is used for loading xml on loading flash at first time
	 */	
	loadEmployeeXML = function() {
		
		if(isXMLLoaded) {
			checkCondition();
		} else {
			checkMantatoryField();
			isXMLLoaded=true;		
		}
	}
	
	/**
	 * Setter method of "global_employee_XML"
	 */
	setEmployeeXML = function(xml:XML) {		
		global_employee_XML = xml;		
	}
	
	/**
	 * Setter method of "global_employee_XML_Extended"
	 */
	setEmployeeXMLExtended = function(xml:XML) {		
		global_employee_XML_Extended = xml;		
	}	
	
	/**
	 * Reset the Error Message - Dependent in Covered Dependent Page
	 */
	setDependentErrorMessage = function() {
		var errorMessage_Dependent_LName:String = "A Dependent Last Name is missing on the Covered Dependents page.";
		var errorMessage_Dependent_FName:String = "A Dependent First Name is missing on the Covered Dependents page.";	 
		var errorMessage_Dependent_DOB:String = "A Dependent Date of Birth is missing on the Covered Dependents page.";
		var errorMessage_Dependent_Gender:String = "A Dependent Gender is missing on the Covered Dependents page.";
	}
	/**
	 *Validate required Submission Rule Fields are contained in HashMap for Policy Holder Tab.
	 */
	validatePolicyHolder = function(){
		
		if(policyHolderMap.containsKey("Object__Employee__PolicyHolder__EmployementStatus") && 
									   policyHolderMap.get("Object__Employee__PolicyHolder__EmployementStatus")=="Active"){			
			errorMessage_Employee_Employment_Status="";
			errorMessage_COBRAExpiration_Date="";
			if(policyHolderMap.containsKey("Object__Employee__PolicyHolder__DateOfHire")){				
				isPolicyHolder = true;				
				errorMessage_ReHire_Date="";				
			}else {
				isPolicyHolder = false;
			}
		
		} else if(policyHolderMap.containsKey("Object__Employee__PolicyHolder__EmployementStatus") &&
											  policyHolderMap.get("Object__Employee__PolicyHolder__EmployementStatus")=="Cobra"){
			errorMessage_Employee_Employment_Status="";
			errorMessage_ReHire_Date="";
			if(policyHolderMap.containsKey("Object__Employee__PolicyHolder__ExpirationDate")){				
				isPolicyHolder = true;								
				errorMessage_COBRAExpiration_Date="";
			}else {
				isPolicyHolder = false;
			}		
		} else if(policyHolderMap.containsKey("Object__Employee__PolicyHolder__EmployementStatus")){				
			if(policyHolderMap.get("Object__Employee__PolicyHolder__EmployementStatus")=="Retired"){				
				isPolicyHolder = true;					
				errorMessage_Employee_Employment_Status="";
				errorMessage_COBRAExpiration_Date="";
				errorMessage_ReHire_Date="";
			}else {
				isPolicyHolder = false;
			}
		} else {
			isPolicyHolder = false;				
		}

	}
	
	/**
	 *Validate required Submission Rule Fields are contained in HashMap for Covered Dependent Tab.
	 */
	validateSpouseDetail = function(){
		
		if(!spouseDetailMap.containsKey("Object__Employee__CoverageDept__Spouse__Spouse")){
			isSpouseDetail = true;
			countTotalSpouseDetail=4;
		} 			
		/*informationMessage = Alert.show("Validate isSpouseDetail::"+isSpouseDetail, "Information", Alert.OK , this, myclickHandler, "stockIcon", Alert.OK);		
		informationMessage.move(450,500);*/

	}
	
	
	/**
	 *Validate required Submission Rule Fields are contained in HashMap for Dearborn Tab.
	 */
	validateDearBorn = function() {
			
		if(dearBornMap.containsKey("Object__Employee__DearBorn__BasicLifeADD")){		
			if(//(dearBornMap.containsKey("Object__Employee__DearBorn__Class")) && 
				//(dearBornMap.containsKey("Object__Employee__DearBorn__AnnualSalary")) && 
				(dearBornMap.containsKey("Object__Employee__DearBorn__PrimaryLastName")) && 
				(dearBornMap.containsKey("Object__Employee__DearBorn__PrimaryFirstName")) && 
				(dearBornMap.containsKey("Object__Employee__DearBorn__PrimaryDOB")) && 
				(dearBornMap.containsKey("Object__Employee__DearBorn__PrimaryRelationship")) && 
				(dearBornMap.containsKey("Object__Employee__DearBorn__PrimaryBenefitSplit")) 
				 
				//&&(dearBornMap.containsKey("Object__Employee__DearBorn__SecondaryLastName")) && 
				//(dearBornMap.containsKey("Object__Employee__DearBorn__SecondaryFirstName")) && 
				//(dearBornMap.containsKey("Object__Employee__DearBorn__SecondaryDOB")) && 
				//(dearBornMap.containsKey("Object__Employee__DearBorn__SecondaryRelationship")) && 
				//(dearBornMap.containsKey("Object__Employee__DearBorn__SecondaryBenefitSplit"))
				){
				isDearBorn = true;				
				//errorMessage_BasicLifeADD="";
				
			}else {
				isDearBorn = false;
				//errorMessage_BasicLifeADD="Sections B (Class & annual salary) & C must be completed in Life Insurance page.";
				errorMessage_BasicLifeADD="Section C must be completed in Life Insurance page";
			}
		} else {
			isDearBorn = true;				
			errorMessage_BasicLifeADD="";
		}
		
		//newly added 
				
		if(dearBornMap.containsKey("Object__Employee__DearBorn__VoluntaryShortTermDisability")){		
		
			if(dearBornMap.containsKey("Object__Employee__DearBorn__PlanOption")){
				
				isDearBorn = true;
				errorMessage_VoluntaryShortTerm="";
				
			}else {
				isDearBorn = false;
				errorMessage_VoluntaryShortTerm="Section D must be completed in Life Insurance page";
			}
		} else {
			isDearBorn = (isDearBorn && true);			
			errorMessage_VoluntaryShortTerm="";
		}
		//newly added - end
		if(dearBornMap.containsKey("Object__Employee__DearBorn__OptionalLife")){		
		
			if(dearBornMap.containsKey("Object__Employee__DearBorn__OptionalLifeAmount")){
				
				isDearBorn = (isDearBorn && true);			
				errorMessage_OptionalLifeAmount="";
				
			}else {
				isDearBorn = (isDearBorn && false);
			}
		} else {
			isDearBorn = (isDearBorn && true);			
			errorMessage_OptionalLifeAmount="";
		}
		
		if(dearBornMap.containsKey("Object__Employee__DearBorn__ShortTermDisablity")) {
			
			if(dearBornMap.containsKey("Object__Employee__DearBorn__PlanOption")){
				
				isDearBorn = (isDearBorn && true);
				errorMessage_ShortTermDisability_PlanOption="";
				
			}else {
				isDearBorn = (isDearBorn && false);
			}
			
		}else {
			isDearBorn = (isDearBorn && true);
			errorMessage_ShortTermDisability_PlanOption="";
		}
		
		//if(dearBornMap.containsKey("Object__Employee__DearBorn__LongTermDisability")) {
			
			//if(dearBornMap.containsKey("Object__Employee__DearBorn__Class")){
				
				///isDearBorn = (isDearBorn && true);
				//errorMessage_LongTermDisability_PlanOption="";
				//
			//}else {
				//isDearBorn = (isDearBorn && false);
			//}
			//if(dearBornMap.containsKey("Object__Employee__DearBorn__AnnualSalary")){
				
				//if(dearBornMap.get("Object__Employee__DearBorn__AnnualSalary")!= "0.00"){
					
					//isDearBorn = (isDearBorn && true);
					//errorMessage_LongTermDisability_AnualSalaryInfo="";
					
				//}else{
					//isDearBorn = (isDearBorn && false);
				//}
			//}else {
				//isDearBorn = (isDearBorn && false);
			//}
		//}else {
			//isDearBorn = (isDearBorn && true);
			//errorMessage_LongTermDisability_PlanOption="";
			//errorMessage_LongTermDisability_AnualSalaryInfo="";
		//}
	}
	
	
	/**
	 *Validate required Submission Rule Fields are contained in HashMap for Other Coverage Tab.
	 */
	validateOtherCoverageAttribute = function(){
		
/*		
		if(ContinuingCovMap.size() > 0){
			isOtherCoverageElement = true;
		}else{
			isOtherCoverageElement = false;
		}
		
		if(PriorEncodingMap.size() > 0){
			isOtherCoverageElement = (isOtherCoverageElement && true);
		}else{
			isOtherCoverageElement = (isOtherCoverageElement && false);
		}
*/			
		validateMedicareInformationAttribute();
		validateContinuingCoverageAttribute();
		validateEndingCoverageAttribute();		
	}
	
	// FOR MEDICARE INFORMATION IN OTHER COVERAGES PAGE
	validateMedicareInformationAttribute = function(){
			
		if(PriorEncodingMap.containsKey("Object__Employee__OtherCoverage__IsCoveredByMedicare")){		
			errorMessage_OtherCoverage_MedicareInformation="";
			if(PriorEncodingMap.get("Object__Employee__OtherCoverage__IsCoveredByMedicare") == "N"){	
				errorMessage_OtherCoverage_DataGrid = "";
				isOtherCoverageElement = true;
			}		
			else if(PriorEncodingMap.get("Object__Employee__OtherCoverage__IsCoveredByMedicare") == "Y"){
				if(OtherCoverageMap.size() > 1){
					isOtherCoverageElement = true;
					errorMessage_OtherCoverage_DataGrid = "";
				}else{
					isOtherCoverageElement = false;
				}
			}
		} else{
			errorMessage_OtherCoverage_DataGrid="";
			isOtherCoverageElement = false;
		}
	}
	
	//FOR CONTINUING COVERAGE IN OTHER COVERAGES PAGE
	validateContinuingCoverageAttribute = function(){
				
		if(PriorEncodingMap.containsKey("Object__Employee__OtherCoverage__IsKeepingOtherHealthCoverage")){		
			errorMessage_OtherCoverage_ContinuingCoverage="";
			if(PriorEncodingMap.get("Object__Employee__OtherCoverage__IsKeepingOtherHealthCoverage") == "N"){
							
				errorMessage_OtherCoverage_OtherPolicyHolderName = "";
 				errorMessage_OtherCoverage_InsCompanyName = "";
				errorMessage_OtherCoverage_PolicyNumber = "";
				errorMessage_OtherCoverage_PolEffectiveDate = "";
				errorMessage_OtherCoverage_CoverageType = "";
				errorMessage_OtherCoverage_WorkStatus = "";
				errorMessage_OtherCoverage_PolicyType = "";
				isOtherCoverageElement = (isOtherCoverageElement && true);
						
			}			
		
			else if (PriorEncodingMap.get("Object__Employee__OtherCoverage__IsKeepingOtherHealthCoverage") == "Y"){
				if(ContinuingCovMap.containsKey("Object__Employee__OtherCoverage__OtherPolicyHolderName")){		
					if(ContinuingCovMap.get("Object__Employee__OtherCoverage__OtherPolicyHolderName") != undefined && ContinuingCovMap.get("Object__Employee__OtherCoverage__OtherPolicyHolderName").length!=0 ){
						errorMessage_OtherCoverage_OtherPolicyHolderName = "";		
						isOtherCoverageElement = (isOtherCoverageElement && true);
					}else{
						isOtherCoverageElement = (isOtherCoverageElement && false);
					}
				}else{
						isOtherCoverageElement = (isOtherCoverageElement && false);
				}
				if(ContinuingCovMap.containsKey("Object__Employee__OtherCoverage__InsCompanyName")){
					if(ContinuingCovMap.get("Object__Employee__OtherCoverage__InsCompanyName") != undefined && ContinuingCovMap.get("Object__Employee__OtherCoverage__InsCompanyName").length!=0 ){
						errorMessage_OtherCoverage_InsCompanyName = "";		
						isOtherCoverageElement = (isOtherCoverageElement && true);
					}else{
						isOtherCoverageElement = (isOtherCoverageElement && false);
					}
				}else{
						isOtherCoverageElement = (isOtherCoverageElement && false);
				}
				if(ContinuingCovMap.containsKey("Object__Employee__OtherCoverage__PolicyNumber")){		
					if(ContinuingCovMap.get("Object__Employee__OtherCoverage__PolicyNumber") != undefined && ContinuingCovMap.get("Object__Employee__OtherCoverage__PolicyNumber").length!=0 ){
						errorMessage_OtherCoverage_PolicyNumber = "";			
						isOtherCoverageElement = (isOtherCoverageElement && true);
					}else{
						isOtherCoverageElement = (isOtherCoverageElement && false);
					}
				}else{
						isOtherCoverageElement = (isOtherCoverageElement && false);
				}
				if(ContinuingCovMap.containsKey("Object__Employee__OtherCoverage__PolEffectiveDate")){		
					if(ContinuingCovMap.get("Object__Employee__OtherCoverage__PolEffectiveDate") != undefined && ContinuingCovMap.get("Object__Employee__OtherCoverage__PolEffectiveDate").length!=0 ){
						errorMessage_OtherCoverage_PolEffectiveDate = "";		
						isOtherCoverageElement = (isOtherCoverageElement && true);
					}else{
						isOtherCoverageElement = (isOtherCoverageElement && false);
					}
				}else{
						isOtherCoverageElement = (isOtherCoverageElement && false);
				}
				// FOR COVERAGE TYPES IN OTHER COVERAGES PAGE
				if(ContinuingCovMap.containsKey("Object__Employee__OtherCoverage__MedicalCvg")){	
					errorMessage_OtherCoverage_CoverageType = "";	
					isOtherCoverageElement = (isOtherCoverageElement && true);
				}
				else if(ContinuingCovMap.containsKey("Object__Employee__OtherCoverage__DentalCvg")){	
						errorMessage_OtherCoverage_CoverageType = "";	
						isOtherCoverageElement = (isOtherCoverageElement && true);
				}
				else if(ContinuingCovMap.containsKey("Object__Employee__OtherCoverage__HospitalOnlyCvg")){
						errorMessage_OtherCoverage_CoverageType = "";		
						isOtherCoverageElement = (isOtherCoverageElement && true);
				}
				else if(ContinuingCovMap.containsKey("Object__Employee__OtherCoverage__VisionCvg")){						
						errorMessage_OtherCoverage_CoverageType = "";
						isOtherCoverageElement = (isOtherCoverageElement && true);
				}
				else if(ContinuingCovMap.containsKey("Object__Employee__OtherCoverage__PrescriptionDrugCvg")){									
						errorMessage_OtherCoverage_CoverageType = "";	
						isOtherCoverageElement = (isOtherCoverageElement && true);
				}
				else{
					isOtherCoverageElement = (isOtherCoverageElement && false);
				}
				
				if(ContinuingCovMap.containsKey("Object__Employee__OtherCoverage__WorkStatus")){						
					if(ContinuingCovMap.get("Object__Employee__OtherCoverage__WorkStatus") != undefined && ContinuingCovMap.get("Object__Employee__OtherCoverage__OtherPolicyHolderName").length!=0 ){						
						errorMessage_OtherCoverage_WorkStatus = "";	
						isOtherCoverageElement = (isOtherCoverageElement && true);
					}else{
						isOtherCoverageElement = (isOtherCoverageElement && false);
					}
				}else{
						isOtherCoverageElement = (isOtherCoverageElement && false);
				}
				if(ContinuingCovMap.containsKey("Object__Employee__OtherCoverage__PolicyType")){		
					if(ContinuingCovMap.get("Object__Employee__OtherCoverage__PolicyType") != undefined && ContinuingCovMap.get("Object__Employee__OtherCoverage__PolicyType").length!=0 ){						
						errorMessage_OtherCoverage_PolicyType = "";			
						isOtherCoverageElement = (isOtherCoverageElement && true);
					}else{
						isOtherCoverageElement = (isOtherCoverageElement && false);
					}
				}else{
						isOtherCoverageElement = (isOtherCoverageElement && false);
				}
			}
		}else{
			errorMessage_OtherCoverage_OtherPolicyHolderName = "";
			errorMessage_OtherCoverage_InsCompanyName = "";
			errorMessage_OtherCoverage_PolicyNumber = "";
			errorMessage_OtherCoverage_PolEffectiveDate = "";
			errorMessage_OtherCoverage_CoverageType = "";
			errorMessage_OtherCoverage_WorkStatus = "";
			errorMessage_OtherCoverage_PolicyType = "";
			isOtherCoverageElement = (isOtherCoverageElement && false);
		}
	}
	
	//FOR PRIOR OR ENDING COVERAGE IN OTHER COVERAGES PAGE
	validateEndingCoverageAttribute = function(){

		if(PriorEncodingMap.containsKey("Object__Employee__OtherCoverage__IsHaveAnyPriorOrEndingCoverage")){		
			errorMessage_OtherCoverage_PriorEndingCoverage="";
			if(PriorEncodingMap.get("Object__Employee__OtherCoverage__IsHaveAnyPriorOrEndingCoverage") == "N"){
				errorMessage_OtherCoverage_LastEffectiveDate = "";
	 			//errorMessage_OtherCoverage_PolicyEndDate = "";
		 		errorMessage_OtherCoverage_InsuranceCarrierName = "";
				isOtherCoverageElement = (isOtherCoverageElement && true);
			}
			else if(PriorEncodingMap.get("Object__Employee__OtherCoverage__IsHaveAnyPriorOrEndingCoverage") == "Y"){	
				if(PriorEncodingMap.containsKey("Object__Employee__OtherCoverage__LastEffectiveDate")){		
					if(PriorEncodingMap.get("Object__Employee__OtherCoverage__LastEffectiveDate") != undefined && PriorEncodingMap.get("Object__Employee__OtherCoverage__LastEffectiveDate").length!=0 ){
						errorMessage_OtherCoverage_LastEffectiveDate = "";
						isOtherCoverageElement = (isOtherCoverageElement && true);
					}else{
						isOtherCoverageElement = (isOtherCoverageElement && false);
					}
				}else{
						isOtherCoverageElement = (isOtherCoverageElement && false);
				}		
				//if(PriorEncodingMap.containsKey("Object__Employee__OtherCoverage__PolicyEndDate")){		
					//if(PriorEncodingMap.get("Object__Employee__OtherCoverage__PolicyEndDate") != undefined && PriorEncodingMap.get("Object__Employee__OtherCoverage__PolicyEndDate").length!=0 ){
						///errorMessage_OtherCoverage_PolicyEndDate = "";		
						//isOtherCoverageElement = (isOtherCoverageElement && true);
					//}else{
						//isOtherCoverageElement = (isOtherCoverageElement && false);
					//}
				//}else{
						//isOtherCoverageElement = (isOtherCoverageElement && false);
				//}		
				if(PriorEncodingMap.containsKey("Object__Employee__OtherCoverage__InsuranceCarrierName")){		
					if(PriorEncodingMap.get("Object__Employee__OtherCoverage__InsuranceCarrierName") != undefined && PriorEncodingMap.get("Object__Employee__OtherCoverage__InsuranceCarrierName").length!=0 ){
						errorMessage_OtherCoverage_InsuranceCarrierName = "";	
						isOtherCoverageElement = (isOtherCoverageElement && true);
					}else{
						isOtherCoverageElement = (isOtherCoverageElement && false);
					}
				}else{
						isOtherCoverageElement = (isOtherCoverageElement && false);
				}		
			}
		} else{
			errorMessage_OtherCoverage_LastEffectiveDate = "";
			//errorMessage_OtherCoverage_PolicyEndDate = "";
			errorMessage_OtherCoverage_InsuranceCarrierName = "";
			isOtherCoverageElement = (isOtherCoverageElement && false);
		}
	}	
	
	checkRetrieveValueFromContinuingCoverageXML = function(){
		
		if(ContinuingCovMap.size() > 0){
			
			enableContinuingCovAttributes();
		}else{
			
			disableContinuingCovAttributes();
		}
		if(OtherCoverageMap.size() > 0){
			
			enableOtherCovAttributes();
			
		}else{
			disableOtherCovAttributes();
		}
		if(PriorEncodingMap.size() > 0){
			
			enablePriorEncodingAttributes();
		}else{
			
			disablePriorEncodingAttributes();
		}
	}
	
	/**
	 *Enabling OtherCoverage attributes in Other Coverage Tab
	 */
	
	enableOtherCovAttributes = function(){
	   if(employeeApplicationStatus=="IN_PROGRESS"){	
		otherCover_yes.selected = true;
		OtherCoverage_DataGrid.enabled = true;
	   }
	}
	/**
	 *Disabling OtherCoverage attributes in Other Coverage Tab
	 */
	
	disableOtherCovAttributes = function(){
		//otherCover_no.selected = true;
		OtherCoverage_DataGrid.enabled = false;
	}
	/**
	 *Enabling Continuing Coverage attributes in Other Coverage Tab
	 */
	
	enableContinuingCovAttributes = function(){
		 trace("Incide enable function :: "+employeeApplicationStatus);
	  if(employeeApplicationStatus=="IN_PROGRESS" || employeeApplicationStatus==undefined || employeeApplicationStatus ==""){
		  trace("Incide enable function");
		healthInsurance_yes.selected = true;
		Object__Employee__OtherCoverage__OtherPolicyHolderName___DMS_EMPLOYEE_OTHER_COVERAGE____OTHER_POLICYHOLDER_NAME.enabled = true;
		Object__Employee__OtherCoverage__InsCompanyName___DMS_EMPLOYEE_OTHER_COVERAGE____INSURANCE_COMPANY_NAME.enabled = true;
		Object__Employee__OtherCoverage__PolicyNumber___DMS_EMPLOYEE_OTHER_COVERAGE____POLICY_NUMBER.enabled = true;
		Object__Employee__OtherCoverage__PolEffectiveDate___DMS_EMPLOYEE_OTHER_COVERAGE____OTHER_EFFECTIVE_DATE.enabled = true;
		Object__Employee__OtherCoverage__MedicalCvg___DMS_EMPLOYEE_OTHER_COVERAGE____MEDICAL_COVERAGE.enabled = true;
		Object__Employee__OtherCoverage__HospitalOnlyCvg___DMS_EMPLOYEE_OTHER_COVERAGE____HOSPITAL_ONLY_COVERAGE.enabled = true;
		Object__Employee__OtherCoverage__DentalCvg___DMS_EMPLOYEE_OTHER_COVERAGE____DENTAL_COVERAGE.enabled = true;
		Object__Employee__OtherCoverage__PrescriptionDrugCvg___DMS_EMPLOYEE_OTHER_COVERAGE____PRESCRIPTION_DRUG_COVERAGE.enabled = true;
		Object__Employee__OtherCoverage__VisionCvg___DMS_EMPLOYEE_OTHER_COVERAGE____VISION_COVERAGE.enabled = true;
		Object__Employee__OtherCoverage__DentalCvg___DMS_EMPLOYEE_OTHER_COVERAGE____DENTAL_COVERAGE.enabled = true;
		Object__Employee__OtherCoverage__WorkStatus___DMS_EMPLOYEE_OTHER_COVERAGE____WORK_STATUS.enabled = true;
		Object__Employee__OtherCoverage__PolicyType___DMS_EMPLOYEE_OTHER_COVERAGE____POLICY_TYPE.enabled = true;
		
		Object__Employee__OtherCoverage__PolEffectiveDate__Month.enabled = true;
		Object__Employee__OtherCoverage__PolEffectiveDate__Date.enabled = true;
		Object__Employee__OtherCoverage__PolEffectiveDate__Year.enabled = true;		
		
		Object__Employee__OtherCoverage__LastEffectiveDate__Month.enabled = true;
			Object__Employee__OtherCoverage__LastEffectiveDate__Date.enabled = true;
			Object__Employee__OtherCoverage__LastEffectiveDate__Year.enabled = true;

			Object__Employee__OtherCoverage__PolicyEndDate__Month.enabled = true;
			Object__Employee__OtherCoverage__PolicyEndDate__Date.enabled = true;
			Object__Employee__OtherCoverage__PolicyEndDate__Year.enabled = true;
			Object__Employee__OtherCoverage__InsuranceCarrierName___DMS_EMPLOYEE_OTHER_COVERAGE____INSURANCE_CARRIER_NAME.enabled = true;
	  }

	}
	/**
	 *Disabling Continuing Coverage attributes in Other Coverage Tab
	 */
	
	disableContinuingCovAttributes = function(){
		//healthInsurance_no.selected = true;
		Object__Employee__OtherCoverage__OtherPolicyHolderName___DMS_EMPLOYEE_OTHER_COVERAGE____OTHER_POLICYHOLDER_NAME.enabled = false;
		Object__Employee__OtherCoverage__InsCompanyName___DMS_EMPLOYEE_OTHER_COVERAGE____INSURANCE_COMPANY_NAME.enabled = false;
		Object__Employee__OtherCoverage__PolicyNumber___DMS_EMPLOYEE_OTHER_COVERAGE____POLICY_NUMBER.enabled = false;
		Object__Employee__OtherCoverage__PolEffectiveDate___DMS_EMPLOYEE_OTHER_COVERAGE____OTHER_EFFECTIVE_DATE.enabled = false;
		Object__Employee__OtherCoverage__MedicalCvg___DMS_EMPLOYEE_OTHER_COVERAGE____MEDICAL_COVERAGE.enabled = false;
		Object__Employee__OtherCoverage__HospitalOnlyCvg___DMS_EMPLOYEE_OTHER_COVERAGE____HOSPITAL_ONLY_COVERAGE.enabled = false;
		Object__Employee__OtherCoverage__DentalCvg___DMS_EMPLOYEE_OTHER_COVERAGE____DENTAL_COVERAGE.enabled = false;
		Object__Employee__OtherCoverage__PrescriptionDrugCvg___DMS_EMPLOYEE_OTHER_COVERAGE____PRESCRIPTION_DRUG_COVERAGE.enabled = false;
		Object__Employee__OtherCoverage__VisionCvg___DMS_EMPLOYEE_OTHER_COVERAGE____VISION_COVERAGE.enabled = false;
		Object__Employee__OtherCoverage__DentalCvg___DMS_EMPLOYEE_OTHER_COVERAGE____DENTAL_COVERAGE.enabled = false;
		Object__Employee__OtherCoverage__WorkStatus___DMS_EMPLOYEE_OTHER_COVERAGE____WORK_STATUS.enabled = false;
		Object__Employee__OtherCoverage__PolicyType___DMS_EMPLOYEE_OTHER_COVERAGE____POLICY_TYPE.enabled = false;
		
		Object__Employee__OtherCoverage__PolEffectiveDate__Month.enabled = false;
		Object__Employee__OtherCoverage__PolEffectiveDate__Date.enabled = false;
		Object__Employee__OtherCoverage__PolEffectiveDate__Year.enabled = false;				

	}
	/**
	 *Enabling Prior Encoding attributes in Other Coverage Tab
	 */
	
	enablePriorEncodingAttributes = function(){
	  if(employeeApplicationStatus=="IN_PROGRESS"){	
		health_yes.selected = true;
		Object__Employee__OtherCoverage__LastEffectiveDate___DMS_EMPLOYEE_OTHER_COVERAGE____LAST_EFFECTIVE_DATE.enabled = true;
		Object__Employee__OtherCoverage__PolicyEndDate___DMS_EMPLOYEE_OTHER_COVERAGE____POLICY_END_DATE.enabled = true;
		Object__Employee__OtherCoverage__InsuranceCarrierName___DMS_EMPLOYEE_OTHER_COVERAGE____INSURANCE_CARRIER_NAME.enabled = true;
		
		Object__Employee__OtherCoverage__LastEffectiveDate__Month.enabled = true;
		Object__Employee__OtherCoverage__LastEffectiveDate__Date.enabled = true;
		Object__Employee__OtherCoverage__LastEffectiveDate__Year.enabled = true;		
		Object__Employee__OtherCoverage__PolicyEndDate__Month.enabled = true;
		Object__Employee__OtherCoverage__PolicyEndDate__Date.enabled = true;
		Object__Employee__OtherCoverage__PolicyEndDate__Year.enabled = true;
	  }
	}
	
	/**
	 *Disabling Prior Encoding attributes in Other Coverage Tab
	 */

	disablePriorEncodingAttributes = function(){
		//health_no.selected = true;
		Object__Employee__OtherCoverage__LastEffectiveDate___DMS_EMPLOYEE_OTHER_COVERAGE____LAST_EFFECTIVE_DATE.enabled = false;
		Object__Employee__OtherCoverage__PolicyEndDate___DMS_EMPLOYEE_OTHER_COVERAGE____POLICY_END_DATE.enabled = false;
		Object__Employee__OtherCoverage__InsuranceCarrierName___DMS_EMPLOYEE_OTHER_COVERAGE____INSURANCE_CARRIER_NAME.enabled = false;
		
		Object__Employee__OtherCoverage__LastEffectiveDate__Month.enabled = false;
		Object__Employee__OtherCoverage__LastEffectiveDate__Date.enabled = false;
		Object__Employee__OtherCoverage__LastEffectiveDate__Year.enabled = false;		
		Object__Employee__OtherCoverage__PolicyEndDate__Month.enabled = false;
		Object__Employee__OtherCoverage__PolicyEndDate__Date.enabled = false;
		Object__Employee__OtherCoverage__PolicyEndDate__Year.enabled = false;
	}
	
	validateDependent = function() {
		errorMessage_Dependent_LName = "";
		errorMessage_Dependent_FName= "";	 
		errorMessage_Dependent_DOB = "";
		errorMessage_Dependent_Gender = "";
		isDependentElement = true;
		for(index=0;index<dependentKeys.length;index++) {
			var relationShip = dependentMap.get("Object__Employee__CoverageDept__Relationship_____"+dependentKeys[index]);
			var fName = dependentMap.get("Object__Employee__CoverageDept__FirstName_____"+dependentKeys[index]);
			var lName = dependentMap.get("Object__Employee__CoverageDept__LastName_____"+dependentKeys[index]);
			var dob = dependentMap.get("Object__Employee__CoverageDept__DOB_____"+dependentKeys[index]);
			var gender = dependentMap.get("Object__Employee__CoverageDept__Gender_____"+dependentKeys[index]);
			
			if(relationShip!="Default" && relationShip!="undefined" && relationShip!=undefined) {
				
				if(fName==" " || fName=="undefined" || fName==undefined) {
					errorMessage_Dependent_LName = "A Dependent Last Name is missing on the Covered Dependents page.";
					isDependentElement=isDependentElement&&false;
				}
				if(lName==" " || lName=="undefined" || lName==undefined) {
					errorMessage_Dependent_FName = "A Dependent First Name is missing on the Covered Dependents page.";
					isDependentElement=isDependentElement&&false;							
				}
				if(dob==" " || dob=="undefined" || dob==undefined) {
					errorMessage_Dependent_DOB = "A Dependent Date of Birth is missing on the Covered Dependents page.";
					isDependentElement=isDependentElement&&false;
				}
				if(gender==" " || gender=="undefined" || gender==undefined) {
					errorMessage_Dependent_Gender = "A Dependent Gender is missing on the Covered Dependents page.";
					isDependentElement=isDependentElement&&false;
				}
				
			}
			
		}
	}
	
	/**
		 * To validate the Action Requested while submission
		 * @author gnanaguru_g@solartis.net
		 */
		function validateActionRequested() {					
			isActionRequested = true;
			/*if(actionRequestedMap.containsKey("Object__Employee__ActionRequested__HealthCvg" )){
				if(actionRequestedMap.get("Object__Employee__ActionRequested__HealthPrdName" ) != undefined){
					isActionRequested = true;
					errorMessage_HealthProductName="";
					countTotalActionRequested = countTotalActionRequested+1;												
				}else{
					isActionRequested = false;												
				}
			}else{
				isActionRequested = true;
				errorMessage_HealthProductName="";
											
			}
			
			if(actionRequestedMap.containsKey("Object__Employee__ActionRequested__DrugCvg" )){
				if(actionRequestedMap.get("Object__Employee__ActionRequested__DrugPrdName" ) != undefined){
					isActionRequested = (isActionRequested && true);
					errorMessage_DrugProductName="";
					countTotalActionRequested = countTotalActionRequested+1;
				}else{
					isActionRequested = (isActionRequested && false);
				}
			}else{
				isActionRequested = (isActionRequested && true);
				errorMessage_DrugProductName="";
			}
			
			if(actionRequestedMap.containsKey("Object__Employee__ActionRequested__DentalCvg" )){
				if(actionRequestedMap.get("Object__Employee__ActionRequested__DentalPrdName" ) != undefined){
					isActionRequested = (isActionRequested && true);
					errorMessage_DentalProductName="";
					countTotalActionRequested = countTotalActionRequested+1;
				}else{
					isActionRequested = (isActionRequested && false);
				}
			}else{
				isActionRequested = (isActionRequested && true);
				errorMessage_DentalProductName="";
			}
			
			if(actionRequestedMap.containsKey("Object__Employee__ActionRequested__VisionCvg" )){
				if(actionRequestedMap.get("Object__Employee__ActionRequested__VisionPrdName" ) != undefined){
					isActionRequested = (isActionRequested && true);
					errorMessage_VisionProductName="";
					countTotalActionRequested = countTotalActionRequested+1;
				}else{
					isActionRequested = (isActionRequested && false);
				}
			}else{
				isActionRequested = (isActionRequested && true);
				errorMessage_VisionProductName="";
			} */
			
		    }