	hideIndicatorImage();	
	
	var employer_GroupXML:XML = new XML();
	var employer_GroupValXML:XML = new XML();
	//var countTotalGroupInformation:Number;
	//var countTotalEnrollSection:Number;
	var countTotalmmoPlan:Number;
	var isGroupInform:Boolean;
	var isMMOPlan:Boolean;
	var isValidationC:Boolean;
	var isValidationD:Boolean;
	var isValidationA:Boolean;
	var isValidationB:Boolean;
	var isEnrollmentCriteria:Boolean;
	var isXMLLoaded:Boolean;
	var global_employer_XML:XML;
	var global_employer_XML_Extended:XML;
	var groupInfoMap:HashMap = new HashMap();
	var enrolmentMap:HashMap = new HashMap();
	var licMap:HashMap = new HashMap();
	var isLic:Boolean;
	var enableIndicator:Boolean;
	
	/**
	 * * Variable declaration for Employer Submission Rule
	 * @author gnanaguru_g@solaris.net
	 */
	 
	 //--> Group Company Information Block
	 var errorMessage_BusinessName:String ="The Business Name is missing on the Group/Company Information page.";
	 var errorMessage_BusinessContactEmail:String ="The Business contact email address is missing on the Group/Company Information page."; 
	 var errorMessage_BusinessAddress:String ="The Business address is missing on the Group/Company Information page.";
	// var errorMessage_SIC:String ="The Business SIC Code is missing on the Group/Company Information page.";
	 var errorMessage_TaxID:String ="The Business Tax ID is missing on the Group/Company Information page.";
	 var errorMessage_BusinessAnotherName ="The Business another Name is missing on the Group/Company Information page.";
	 var errorMessage_NoOfYears = "The Number of years in Business is missing on the Group/Company Information page.";
	 var errorMessage_BusinessStartDate = "";
	 var errorMessage_OtherAffiliations = "The description for affiliations with other companies is missing on the Group/Company Information page.";
	 
	 //--> Enrollment Criteria Block
	 var errorMessage_ProbationPeriod_ReHire:String ="The New Hire Probation Period is missing on the Enrollment Criteria page."
	 var errorMessage_NoOfCurrentEmployee_Active:String = "The number of current Active employees is missing on the Enrollment Criteria page";
	 var errorMessage_NoOfEligibleEmployee_Active:String ="The number of eligible Active employees is missing on the Enrollment Criteria page";
	 var errorMessage_NoOfEligibleEmployee_Active_COV:String ="The number of eligible Active employees applying for coverage is missing on the Enrollment Criteria page";
	 var errorMessage_DescribeOther:String = "Probation Period for Rehire is missing on the Enrollment Criteria page";
	 var errorMessage_IsEmployerContribute="The employer contribution at least 25% of each contract - must be Yes on the Medical Mutual Plans page";
	 
	 //--> LIC Block
	 var errorMessage_ADandD:String = "The Number of Employees Enrolling for Basic Life AD&D is missing on the Life page.";
	 var errorMessage_OptionLife:String = "The Number of Employees Enrolling for Optional Life is missing on the Life page.";
	 var errorMessage_DependentLife:String = "The Number of Employees Enrolling Dependent Life is missing on the Life page.";
	 var errorMessage_AllEmployees:String = "";
	 var errorMessage_MAX_Benifit:String = "";
	 var errorMessage_disabilityplan:String = "";
	 var errorMessage_ShortTerm_Emp_Contribution:String = "";
	 var errorMessage_ShortTerm_NoOfEmp:String = "";
	 var errorMessage_LongTermPlan:String = "";
	 var errorMessage_LongTerm_Emp_Contribution:String = "";
	 var errorMessage_LongTerm_NoOfEmp:String = "";
	 
	 
	 //--> Validation Block  
	 var errorMessage_ValidationA:String = "Question A. has not been answered on the Validations page.";
	 var errorMessage_ValidationB:String = "Question B. has not been answered on the Validations page.";
	 var errorMessage_ValidationC:String = "Question C. has not been answered on the Validations page.";
	 var errorMessage_ValidationD:String = "Question D. has not been answered on the Validations page";
	 
	 var isZipFilled:Boolean=false;
	 var isCityFilled:Boolean=false;
	 var isCountyFilled:Boolean=false;
	 var isStateFilled:Boolean=false;
	 Error_Window._visible=false;
	 
	 
	/**
	* API to execute the submission rule for employer.
	* @author gnanaguru_g@solartis.net
	*/
	executeSubmissionRule = function() {			
		//countTotalGroupInformation = 0;		
		//countTotalEnrollSection = 0;
		var isRuleSucceed:Boolean = true;
		if(validateEmployer(global_employer_XML) && validateEmployerExtended(global_employer_XML_Extended)) {			
			showIndicatorImage();
			ExternalInterface.call("showLegand()");
			var alertmsg:String = "";
			var errorS_NO:Number=0;
			displayImage();
			/**
			 * To Construct Error Message
			 */
			if(errorMessage_BusinessName!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_BusinessName+"\n";
			}
			if(errorMessage_BusinessContactEmail!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_BusinessContactEmail+"\n";
			}
			if(errorMessage_BusinessAddress!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_BusinessAddress+"\n";
			}
			//if(errorMessage_SIC!="") {
				//alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_SIC+"\n";
			//}
			if(errorMessage_TaxID!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_TaxID+"\n";
			}
			if(errorMessage_BusinessAnotherName!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_BusinessAnotherName+"\n";
			}
			if(errorMessage_NoOfYears!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_NoOfYears+"\n";
			}
			if(errorMessage_BusinessStartDate!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_BusinessStartDate+"\n";
			}
			if(errorMessage_ProbationPeriod_ReHire!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_ProbationPeriod_ReHire+"\n";
			}
			if(errorMessage_NoOfCurrentEmployee_Active!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_NoOfCurrentEmployee_Active+"\n";
			}
			if(errorMessage_NoOfEligibleEmployee_Active!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_NoOfEligibleEmployee_Active+"\n";
			}
			if(errorMessage_NoOfEligibleEmployee_Active_COV!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_NoOfEligibleEmployee_Active_COV+"\n";
			}
			if(errorMessage_DescribeOther!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_DescribeOther+"\n";
			}
			if(errorMessage_IsEmployerContribute!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_IsEmployerContribute+"\n";
			}
			if(errorMessage_ADandD!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_ADandD+"\n";
			}
			if(errorMessage_DependentLife!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_DependentLife+"\n";
			}
			if(errorMessage_OptionLife!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_OptionLife+"\n";
			}
			if(errorMessage_AllEmployees!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_AllEmployees+"\n";
			}
			if(errorMessage_MAX_Benifit!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_MAX_Benifit+"\n";
			}
			if(errorMessage_disabilityplan!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_disabilityplan+"\n";
			}
			if(errorMessage_ShortTerm_Emp_Contribution!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_ShortTerm_Emp_Contribution+"\n";
			}
			if(errorMessage_ShortTerm_NoOfEmp!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_ShortTerm_NoOfEmp+"\n";
			}
			if(errorMessage_LongTermPlan!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_LongTermPlan+"\n";
			}
			if(errorMessage_LongTerm_Emp_Contribution!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_LongTerm_Emp_Contribution+"\n";
			}
			if(errorMessage_LongTerm_NoOfEmp!="") {
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_LongTerm_NoOfEmp+"\n";
			}
			if(errorMessage_ValidationA!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_ValidationA+"\n";
			}
			if(errorMessage_ValidationB!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_ValidationB+"\n";
			}
			if(errorMessage_ValidationC!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_ValidationC+"\n";
			}
			if(errorMessage_ValidationD!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_ValidationD+"\n";
			}
			if(errorMessage_OtherAffiliations!=""){
				alertmsg = alertmsg+(++errorS_NO)+". "+errorMessage_OtherAffiliations+"\n";
			}			
		}				
		/**
		 * To Disaply the constructed Error Message
		 */
		if(alertmsg.length>0) {
			
			Submit_AuthorizedSign._visible = true;
			Submit_Complete._visible = false;
		
			_root.mMsg1._visible = true;
			_root.mMsg2._visible = true;
			_root.mMsg3._visible = false;
			
			var err_msg="Click on the yellow circles above to complete the missing information listed below."
			err_msg = err_msg+"\n\n"+alertmsg;
			Error_Window._visible=true;
			Error_Window.Error_Container.text=err_msg;
			isRuleSucceed = false;
		}else{
			Submit_AuthorizedSign._visible = false;
			Submit_Complete._visible = true;
		
				_root.mMsg1._visible = false;
				_root.mMsg2._visible = false;
				_root.mMsg3._visible = true;
		}
		return isRuleSucceed;
	}
	
	
	/**
	 *Loading XML from application
	 */
	
	savedMantatoryField = function(){				
		employer_GroupXML.load("/GetApplicationXMLAction.do?answer(objectId)=0&answer(objectVerId)=0&CustomerBeanInvocation=YES&answer(objectName)=EMPLOYER&answer(applicationType)=EMPLOYER&answer(applicationSubType)=&answer(state)=&answer(teritory)=");
		employer_GroupValXML.load("/GetApplicationXMLAction.do?answer(tab_name)=validation&answer(objectId)=0&answer(objectVerId)=0&answer(applicationType)=EMPLOYER&answer(objectName)=EMPLOYER_EXTENDED&answer(applicationSubType)=&answer(state)=&answer(teritory)=");
		//employer_GroupValXML.load("2.xml");
		//employer_GroupXML.load("2.xml");
		employer_GroupXML.ignoreWhite = true;
		employer_GroupValXML.ignoreWhite = true;
		employer_GroupXML.onLoad = function(success:Boolean){
			if(success){
				setEmployerXML(employer_GroupXML);
				retreiveGroupInformation();
				if(validateEmployer(employer_GroupXML)) {					
					displayImage();										
				}
			}
		}
		employer_GroupValXML.onLoad = function(success:Boolean){
			if(success){
				setEmployerXMLExtended(employer_GroupValXML); 
				if(validateEmployerExtended(employer_GroupValXML)) {
					displayImage();					
				}
			}
		}	
	}
	/**
	 *Validate all the Submission rule attributes are filled or not
	 */
	validateEmployer = function(employer_GroupXML:XML) {
		
	//countTotalGroupInformation = 0;		
	//countTotalEnrollSection = 0;
	var attributeChildNode = employer_GroupXML.firstChild.firstChild.firstChild.childNodes;
	var subApplChildNode = employer_GroupXML.firstChild.firstChild.childNodes;
	/**
	 *This for loop is used for iterate thru SubApplication in Application
	 */
	for(parentIndex = 0;parentIndex<employer_GroupXML.firstChild.childNodes.length;parentIndex++){		
		var subApplicationName = employer_GroupXML.firstChild.childNodes[parentIndex].attributes.Name;
		
		/* Sub Application name is ADD EDIT CUSTOMER */
		if(subApplicationName=="ADD EDIT CUSTOMER") {
			for(childIndex=0;childIndex<employer_GroupXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){					
				var nameElement:String  = employer_GroupXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				var valueElement:String = employer_GroupXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;

				if(nameElement=="Object__Customer__CustomerName" && valueElement!=undefined && valueElement!="undefined"){
					groupInfoMap.put(nameElement,valueElement);										
				} else if(nameElement=="Object__Customer__City" && valueElement!=undefined && valueElement!="undefined"){
					groupInfoMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__County" && valueElement!=undefined && valueElement!="undefined"){
					groupInfoMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__State" && valueElement!=undefined && valueElement!="undefined"){
					groupInfoMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__Zip" && valueElement!=undefined && valueElement!="undefined"){
					groupInfoMap.put(nameElement,valueElement);									
				} else if(nameElement == "Object__Customer__EMailAddress" && valueElement!=undefined && valueElement!="undefined"){
					groupInfoMap.put(nameElement,valueElement);					
				} //else if(nameElement == "Object__CustomerAdditional__SicCode" && valueElement!=undefined && valueElement!="undefined"){
					//groupInfoMap.put(nameElement,valueElement);					
				//}
				else if(nameElement=="Object__CustomerAdditional__NumberofYrsInBusiness" && valueElement!=undefined && valueElement!="undefined"){
					groupInfoMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__CustomerAdditional__BusinessStartDate" && valueElement!=undefined && valueElement!="undefined"){
					groupInfoMap.put(nameElement,valueElement);										
				} else if(nameElement == "Object__CustomerAdditional__FederalTaxId" && valueElement!=undefined && valueElement!="undefined"){
					groupInfoMap.put(nameElement,valueElement);					
				} else if(nameElement == "Object__CustomerAdditional__BusinessKnownByAnotherName" and valueElement != "undefined" and valueElement != undefined){	
					groupInfoMap.put(nameElement,valueElement);
				} else if(nameElement == "Object__CustomerAdditional__CutomerAnotherName" and valueElement != "undefined" and valueElement != undefined ){
					groupInfoMap.put(nameElement,valueElement);
				} else if(nameElement == "Object__CustomerAdditional__AnyAffiliationWithOtherCompanies" and valueElement != "undefined" and valueElement != undefined){	
					groupInfoMap.put(nameElement,valueElement);
				} else if(nameElement == "Object__CustomerAdditional__Affliations" and valueElement != "undefined" and valueElement != undefined ){
					groupInfoMap.put(nameElement,valueElement);
				}
			}
		}
		else if(subApplicationName=="EnrolmentCriteria"){
			for(childIndex=0;childIndex<employer_GroupXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){					
				var nameElement:String  = employer_GroupXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				var valueElement:String = employer_GroupXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
				
				if(nameElement=="Object__Customer__EntrollmentCriteria__ProbationPeriodforNewHire" && valueElement != undefined && valueElement != "undefined"){
					enrolmentMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__EntrollmentCriteria__NumberofCurrentEmployeesActive" && valueElement != undefined && valueElement != "undefined" && valueElement!="0"){ 
					enrolmentMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__EntrollmentCriteria__NumberofEligibleEmployeesActive" && valueElement != undefined && valueElement != "undefined" && valueElement!="0"){
					enrolmentMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__EntrollmentCriteria__NumberofApplyingEligibleEmployeesActive" && valueElement != undefined && valueElement != "undefined" && valueElement!="0"){
					enrolmentMap.put(nameElement,valueElement);					
				}else if(nameElement=="Object__Customer__EntrollmentCriteria__ProbationPeriodforReHire" && valueElement != undefined && valueElement != "undefined"){
					enrolmentMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__EntrollmentCriteria__ProbationPeriodforReHireOther" && valueElement != undefined && valueElement != "undefined"){
					enrolmentMap.put(nameElement,valueElement);					
				}
			}
		}
		else if(subApplicationName=="MMOPlans"){
			for(childIndex=0;childIndex<employer_GroupXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){					
				var nameElement:String  = employer_GroupXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				var valueElement:String = employer_GroupXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
	
				if(nameElement=="Object__Customer__MedicalMutualPlan__IsEmployerContribute"){
					if(valueElement =="Y"){
						isMMOPlan = true;
						errorMessage_IsEmployerContribute="";
						countTotalmmoPlan = 1;
					}else{
						isMMOPlan = false;
					}					
				}
			}
		}
		else if(subApplicationName=="LIC Plan"){
			for(childIndex=0;childIndex<employer_GroupXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){					
				var nameElement:String  = employer_GroupXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				var valueElement:String = employer_GroupXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
				
				if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__BasicLifeADandD" && valueElement != undefined && valueElement != "undefined"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployeesEntrolforBasicLifeandADandD" && valueElement != undefined && valueElement != "undefined" && valueElement!="0"){ 
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployerContributionforBasicLifeandADandD" && valueElement != undefined && valueElement != "undefined" && valueElement!="0"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__DependentLife" && valueElement != undefined && valueElement != "undefined"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployeesEntrolforDependentLife" && valueElement != undefined && valueElement != "undefined" && valueElement!="0"){ 
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployerContributionforDependentLife" && valueElement != undefined && valueElement != "undefined" && valueElement!="0"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__OptionalLife" && valueElement != undefined && valueElement != "undefined"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployeesEntrolforOptionalLife" && valueElement != undefined && valueElement != "undefined" && valueElement!="0"){ 
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployerContributionforOptionalLife" && valueElement != undefined && valueElement != "undefined" && valueElement!="0"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__AllEmployeesOption" && valueElement != undefined && valueElement != "undefined"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EachEmployeeMinsAmount" && valueElement != undefined && valueElement != "undefined"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__NumberOfEmployees" && valueElement != undefined && valueElement != "undefined"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EachEmployeesMaxAmount" && valueElement != undefined && valueElement != "undefined"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__JobTitleLevel1" && valueElement != undefined && valueElement != "undefined"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__BenefitAmountLevel1" && valueElement != undefined && valueElement != "undefined"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__JobTitleLevel2" && valueElement != undefined && valueElement != "undefined"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__BenefitAmountLevel2" && valueElement != undefined && valueElement != "undefined"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__JobTitleLevel3" && valueElement != undefined && valueElement != "undefined"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__BenefitAmountLevel3" && valueElement != undefined && valueElement != "undefined"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__GroupShortTermDisability" && valueElement != undefined && valueElement != "undefined"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__MaximumWeeklyBenefit" && valueElement != undefined && valueElement != "undefined"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__OptionalShortTermDisabilityPlan" && valueElement != undefined && valueElement != "undefined"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployerContributionforGroupOrOptionalShortTermDisablity" && valueElement != undefined && valueElement != "undefined" && valueElement!="0"){ 
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployeesEntrolforGropOrOptionalShortTimeDisability" && valueElement != undefined && valueElement != "undefined" && valueElement!="0"){ 
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__LongTermDisability" && valueElement != undefined && valueElement != "undefined"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__LongTermDisabilityPlan" && valueElement != undefined && valueElement != "undefined"){
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployerContributionforLongTernDisablity" && valueElement != undefined && valueElement != "undefined" && valueElement!="0"){ 
					licMap.put(nameElement,valueElement);					
				} else if(nameElement=="Object__Customer__FortDearbornLifeInsCmpPlan__EmployeesEntrolforLongTimeDisability" && valueElement != undefined && valueElement != "undefined" && valueElement!="0"){ 
					licMap.put(nameElement,valueElement);					
				}
			}
		}
	}
	if(isZipFilled && isCityFilled && isCountyFilled && isStateFilled){
		errorMessage_BusinessAddress="";
	}	
	validateGroupInformation();
	validateEnrolmentCriteria();
	validateLIC();
	return true;	
	}
	
	/**
	 *Validate all the Submission rule attributes are filled or not
	 */
	validateEmployerExtended = function(employer_GroupXML:XML) {
		
	var attributeChildNode = employer_GroupXML.firstChild.firstChild.firstChild.childNodes;
	var subApplChildNode = employer_GroupXML.firstChild.firstChild.childNodes;
	/**
	 *This for loop is used for iterate thru SubApplication in Application
	 */
	for(parentIndex = 0;parentIndex<employer_GroupXML.firstChild.childNodes.length;parentIndex++){		
		var subApplicationName = employer_GroupXML.firstChild.childNodes[parentIndex].attributes.Name;
		if(subApplicationName == "Validation C"){
			var repeatNameElement:String;
			var repeatValueElement:String;
			var countTotalValidation:Number = 0;
			var validateRowElememt = true;
			
			if(employer_GroupXML.firstChild.childNodes[parentIndex].childNodes.length <= 0){
				isValidationC = false;
			}
			
			for(childIndex=0;childIndex < employer_GroupXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
				repeatNameElement = employer_GroupXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				repeatValueElement= employer_GroupXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;				
				if(repeatNameElement.indexOf("Object__Customer__ValidationC__Name")!=-1){
					if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != ""){
						countTotalValidation = countTotalValidation+1;
						validateRowElememt = validateRowElememt && true;
					}else{
						validateRowElememt = validateRowElememt && false;
					}
				}
				else if(repeatNameElement.indexOf("Object__Customer__ValidationC__SocialSecurityNumber")!=-1){
					if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != null){
						countTotalValidation = countTotalValidation+1;
						validateRowElememt = validateRowElememt && true;
					}else{
						validateRowElememt = validateRowElememt && false;
					}
				}
				else if(repeatNameElement.indexOf("Object__Customer__ValidationC__BeginningDate")!=-1){
					if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != null){
						countTotalValidation = countTotalValidation+1;
						validateRowElememt = validateRowElememt && true;
					}else{
						validateRowElememt = validateRowElememt && false;
					}
				}
				else if(repeatNameElement.indexOf("Object__Customer__ValidationC__ExpirationDate")!=-1){
					if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != null){
						countTotalValidation = countTotalValidation+1;
						validateRowElememt = validateRowElememt && true;
					}else{
						validateRowElememt = validateRowElememt && false;
					}
				}
				else if(repeatNameElement.indexOf("Object__Customer__ValidationC__QualifyingEvent")!=-1){
					if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != null){
						countTotalValidation = countTotalValidation+1;
						validateRowElememt = validateRowElememt && true;
					}else{
						validateRowElememt = validateRowElememt && false;
					}
				}		
				if(countTotalValidation % 5 == 0){
					isValidationC = isValidationC || validateRowElememt;
				}				
			}
		}else if(subApplicationName == "Validation D"){
			var repeatNameElement:String;
			var repeatValueElement:String;
			var countTotalValidation:Number = 0;
			var validateRowElememt = true;
			
			if(employer_GroupXML.firstChild.childNodes[parentIndex].childNodes.length <= 0){
				isValidationD = false;
			}
			for(childIndex=0;childIndex < employer_GroupXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
				repeatNameElement = employer_GroupXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				repeatValueElement= employer_GroupXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;				
				if(repeatNameElement.indexOf("Object__Customer__ValidationD__Name")!=-1){
					if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != ""){
						countTotalValidation = countTotalValidation+1;
						validateRowElememt = validateRowElememt && true;
					}else{
						validateRowElememt = validateRowElememt && false;
					}
				}
				else if(repeatNameElement.indexOf("Object__Customer__ValidationD__SocialSecurityNumber")!=-1){
					if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != null){
						countTotalValidation = countTotalValidation+1;
						validateRowElememt = validateRowElememt && true;
					}else{
						validateRowElememt = validateRowElememt && false;
					}
				}
				else if(repeatNameElement.indexOf("Object__Customer__ValidationD__RetirementAge")!=-1){
					if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != null){
						countTotalValidation = countTotalValidation+1;
						validateRowElememt = validateRowElememt && true;
					}else{
						validateRowElememt = validateRowElememt && false;
					}
				}
				else if(repeatNameElement.indexOf("Object__Customer__ValidationD__RetirementDate")!=-1){
					if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != null){
						countTotalValidation = countTotalValidation+1;
						validateRowElememt = validateRowElememt && true;
					}else{
						validateRowElememt = validateRowElememt && false;
					}
				}
				else if(repeatNameElement.indexOf("Object__Customer__ValidationD__HireDate")!=-1){
					if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != null){
						countTotalValidation = countTotalValidation+1;
						validateRowElememt = validateRowElememt && true;
					}else{
						validateRowElememt = validateRowElememt && false;
					}
				}		
				else if(repeatNameElement.indexOf("Object__Customer__ValidationD__AvgHrsWorkedPerWeek")!=-1){
					if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != null){
						countTotalValidation = countTotalValidation+1;
						validateRowElememt = validateRowElememt && true;
					}else{
						validateRowElememt = validateRowElememt && false;
					}
				}		

				if(countTotalValidation % 6 == 0){
					isValidationD = isValidationD || validateRowElememt;
				}				
			}
		} else if(subApplicationName == "Validation A"){
			var repeatNameElement:String;
			var repeatValueElement:String;
			var countTotalValidation:Number = 0;
			var validateRowElememt = true;
			
			if(employer_GroupXML.firstChild.childNodes[parentIndex].childNodes.length <= 0){
				isValidationA = false;
			}
			for(childIndex=0;childIndex < employer_GroupXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){			
				repeatNameElement = employer_GroupXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				repeatValueElement= employer_GroupXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;				
				if(repeatNameElement.indexOf("Object__Customer__ValidationA__PatientName")!=-1){
					countTotalValidation = countTotalValidation+1;
					if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != ""){						
						validateRowElememt = validateRowElememt && true;
					}else{
						validateRowElememt = validateRowElememt && false;
					}
				}
				else if(repeatNameElement.indexOf("Object__Customer__ValidationA__AggregateAmountofClaims")!=-1){
					countTotalValidation = countTotalValidation+1;
					if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != null){						
						validateRowElememt = validateRowElememt && true;
					}else{
						validateRowElememt = validateRowElememt && false;
					}
				}
				else if(repeatNameElement.indexOf("Object__Customer__ValidationA__DatesofService")!=-1){
					countTotalValidation = countTotalValidation+1;
					if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != null){						
						validateRowElememt = validateRowElememt && true;
					}else{
						validateRowElememt = validateRowElememt && false;
					}
				}
				else if(repeatNameElement.indexOf("Object__Customer__ValidationA__DescribeILLNESSorCondition")!=-1){
					countTotalValidation = countTotalValidation+1;
					if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != null){						
						validateRowElememt = validateRowElememt && true;
					}else{
						validateRowElememt = validateRowElememt && false;
					}
				}				

				if(countTotalValidation % 4 == 0){
					isValidationA = isValidationA || validateRowElememt;
				}
			}
		} else if(subApplicationName == "Validation B"){
			var repeatNameElement:String;
			var repeatValueElement:String;
			var countTotalValidation:Number = 0;
			var validateRowElememt = true;
			
			if(employer_GroupXML.firstChild.childNodes[parentIndex].childNodes.length <= 0){
				isValidationB = false;
			}
			for(childIndex=0;childIndex < employer_GroupXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
				repeatNameElement = employer_GroupXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
				repeatValueElement= employer_GroupXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;				
				if(repeatNameElement.indexOf("Object__Customer__ValidationB__PatientName")!=-1){
					countTotalValidation = countTotalValidation+1;
					if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != ""){						
						validateRowElememt = validateRowElememt && true;
					}else{
						validateRowElememt = validateRowElememt && false;
					}
				}
				else if(repeatNameElement.indexOf("Object__Customer__ValidationB__DescribeILLNESSorCondition")!=-1){
					countTotalValidation = countTotalValidation+1;
					if(repeatValueElement !=" " and repeatValueElement != undefined and repeatValueElement != null){						
						validateRowElememt = validateRowElememt && true;
					}else{
						validateRowElememt = validateRowElememt && false;
					}
				}				

				if(countTotalValidation % 2 == 0){
					isValidationB = isValidationB || validateRowElememt;
				}				
			}
		}
	}	
	validateValidationTab();
	return true;			
	}
	
	
	
	/**
	 *This function is used for all mandatory field filled then "X" to green tick mark
	 */
	displayImage = function(){						
	//informationMessage = Alert.show("Check Display Img :"+enableIndicator, "Information", Alert.OK , this, myclickHandler, "stockIcon", Alert.OK);		
		//informationMessage.move(450,200);
		if(enableIndicator){
			if(isGroupInform){
				group1_wrong._visible = false;
			}else{
				group1_wrong._visible = true;
			}
			if(isEnrollmentCriteria){
				enrolmentCriteria_wrong._visible = false;
			}else{
				enrolmentCriteria_wrong._visible = true;
			}
			if(isMMOPlan && countTotalmmoPlan == 1){
				mmo_wrong._visible = false;
			}else{
				mmo_wrong._visible = true;
			}
			if(isValidationA && isValidationB && isValidationC && isValidationD){
				validation_wrong._visible = false;			
			}else{
				validation_wrong._visible = true;			
			}
			
			if(isLic){
				lic_wrong._visible = false;
			}else{
				lic_wrong._visible = true;
			}
		}
	}
	/**
	 *This function is used for loading xml on loading flash at first time
	 */
	loadEmployerXML = function() {
		if(isXMLLoaded) {
			displayImage();
		} else {
			savedMantatoryField();
			isXMLLoaded=true;
		}
	}
	
	/**
	 * Setter method of "global_employer_XML"
	 */
	setEmployerXML = function(xml:XML) {		
		global_employer_XML = xml;		
	}
	
	/**
	 * Setter method of "global_employer_XML_Extended"
	 */
	setEmployerXMLExtended = function(xml:XML) {		
		global_employer_XML_Extended = xml;		
	}	
	
	/**
	 * To validate yes or no question for the tab "GroupCompanyInformation".
	 */
	validateGroupInformation = function(){
		
		if(groupInfoMap.containsKey("Object__Customer__CustomerName")) {
			errorMessage_BusinessName="";
			isGroupInform = true;
		} else {
			isGroupInform = false;
		}
		
		if(groupInfoMap.containsKey("Object__Customer__City")&& 
					groupInfoMap.containsKey("Object__Customer__County") && 
					groupInfoMap.containsKey("Object__Customer__State") &&
					groupInfoMap.containsKey("Object__Customer__Zip")) {
			errorMessage_BusinessAddress="";
			isGroupInform = (isGroupInform && true);
		} else {
			isGroupInform = (isGroupInform && false);
		}
		
		if(groupInfoMap.containsKey("Object__Customer__EMailAddress")) {
			errorMessage_BusinessContactEmail="";
			isGroupInform = (isGroupInform && true);
		} else {
			isGroupInform = (isGroupInform && false);
		}
		
		//if(groupInfoMap.containsKey("Object__CustomerAdditional__SicCode")) {
			//errorMessage_SIC="";
			//isGroupInform = (isGroupInform && true);
		//} else {
			//isGroupInform = (isGroupInform && false);
		//}
		
		if(groupInfoMap.containsKey("Object__CustomerAdditional__NumberofYrsInBusiness")) {
			errorMessage_NoOfYears="";
			isGroupInform = (isGroupInform && true);
			if(groupInfoMap.get("Object__CustomerAdditional__NumberofYrsInBusiness")==0) {
				if(groupInfoMap.containsKey("Object__CustomerAdditional__BusinessStartDate")) {					
					isGroupInform = (isGroupInform && true);
				} else {
					errorMessage_BusinessStartDate="The Business Start Date is missing on the Group/Company Information page.";
					isGroupInform = (isGroupInform && false);
				}											
			}
		} else {
			isGroupInform = (isGroupInform && false);
		}
		
		if(groupInfoMap.containsKey("Object__CustomerAdditional__FederalTaxId")) {
			errorMessage_TaxID="";
			isGroupInform = (isGroupInform && true);
		} else {
			isGroupInform = (isGroupInform && false);
		}
		
		if(groupInfoMap.containsKey("Object__CustomerAdditional__BusinessKnownByAnotherName")) {
			if(groupInfoMap.get("Object__CustomerAdditional__BusinessKnownByAnotherName") == "Y") {
				if(groupInfoMap.containsKey("Object__CustomerAdditional__CutomerAnotherName")){
						isGroupInform = (isGroupInform && true);
						errorMessage_BusinessAnotherName="";								
					}else{
						isGroupInform = (isGroupInform && false);
					}
			} else if(groupInfoMap.get("Object__CustomerAdditional__BusinessKnownByAnotherName") == "N"){
				isGroupInform = (isGroupInform && true);
				errorMessage_BusinessAnotherName="";						
			}
		}
		
		if(groupInfoMap.containsKey("Object__CustomerAdditional__AnyAffiliationWithOtherCompanies")) {
			if(groupInfoMap.get("Object__CustomerAdditional__AnyAffiliationWithOtherCompanies") == "Y") {
				if(groupInfoMap.containsKey("Object__CustomerAdditional__Affliations")){
						isGroupInform = (isGroupInform && true);
						errorMessage_OtherAffiliations="";								
					}else{
						isGroupInform = (isGroupInform && false);
					}
			} else if(groupInfoMap.get("Object__CustomerAdditional__AnyAffiliationWithOtherCompanies") == "N"){
				isGroupInform = (isGroupInform && true);
				errorMessage_OtherAffiliations="";						
			}
		}
		else{
			isGroupInform = (isGroupInform && true);
			errorMessage_OtherAffiliations="";						
		}
	}	
	
	validateEnrolmentCriteria = function(){
		
		if(enrolmentMap.containsKey("Object__Customer__EntrollmentCriteria__ProbationPeriodforNewHire")) {
			errorMessage_ProbationPeriod_ReHire="";
			isEnrollmentCriteria = true;
		} else {
			isEnrollmentCriteria = false;
		}
		
		if(enrolmentMap.containsKey("Object__Customer__EntrollmentCriteria__NumberofCurrentEmployeesActive")) {
			errorMessage_NoOfCurrentEmployee_Active="";
			isEnrollmentCriteria = (isEnrollmentCriteria && true);
		} else {
			isEnrollmentCriteria = (isEnrollmentCriteria && false);
		}
		
		if(enrolmentMap.containsKey("Object__Customer__EntrollmentCriteria__NumberofEligibleEmployeesActive")) {
			errorMessage_NoOfEligibleEmployee_Active="";
			isEnrollmentCriteria = (isEnrollmentCriteria && true);
		} else {
			isEnrollmentCriteria = (isEnrollmentCriteria && false);
		}
		
		if(enrolmentMap.containsKey("Object__Customer__EntrollmentCriteria__NumberofApplyingEligibleEmployeesActive")) {
			errorMessage_NoOfEligibleEmployee_Active_COV="";
			isEnrollmentCriteria = (isEnrollmentCriteria && true);
		} else {
			isEnrollmentCriteria = (isEnrollmentCriteria && false);
		}
		
		if(enrolmentMap.containsKey("Object__Customer__EntrollmentCriteria__ProbationPeriodforReHire")) {
			if(enrolmentMap.get("Object__Customer__EntrollmentCriteria__ProbationPeriodforReHire") == "Other") {
				if(enrolmentMap.containsKey("Object__Customer__EntrollmentCriteria__ProbationPeriodforReHireOther")){
						isEnrollmentCriteria = (isEnrollmentCriteria && true);
						errorMessage_DescribeOther="";								
					}else{
						isEnrollmentCriteria = (isEnrollmentCriteria && false);
					}
			} else {
				isEnrollmentCriteria = (isEnrollmentCriteria && true);
				errorMessage_DescribeOther="";						
			}
		}else {
			isEnrollmentCriteria = (isEnrollmentCriteria && true);
			errorMessage_DescribeOther="";						
		}
	}	
	
	validateLIC = function(){					
	
	errorMessage_ADandD="";
	errorMessage_DependentLife="";								
	errorMessage_OptionLife="";								
	errorMessage_AllEmployees="";
	errorMessage_LongTerm_NoOfEmp="";
	errorMessage_LongTerm_Emp_Contribution="";
	errorMessage_LongTermPlan="";
	errorMessage_ShortTerm_NoOfEmp=""; 
	errorMessage_ShortTerm_Emp_Contribution="";
	errorMessage_disabilityplan=""; 
	errorMessage_MAX_Benifit="";
	isLic=true;
		
	}
	
	validateValidationTab = function() {		
		
		var attributes:HashMap = getCombinedFormDetails();
		var validationA = attributes.get("Object__Customer__ValidationA__HadTreatedForSeriousMedicalCondition");
		var validationB = attributes.get("Object__Customer__ValidationB__HadInjuryWithinPast24Month");
		var validationC = attributes.get("Object__Customer__ValidationC__IsCobreEligible");
		var validationD = attributes.get("Object__Customer__ValidationD__IsRetireesMeetEligibility");
		
		if(validationA == "Y"){
			if(isValidationA) {
				errorMessage_ValidationA="";
			}
		} else if(validationA == "N"){
			errorMessage_ValidationA="";
			isValidationA=true;
		} 
		
		if(validationB == "Y"){
			if(isValidationB) {
				errorMessage_ValidationB="";
			}
		} else if(validationB == "N"){
			errorMessage_ValidationB="";
			isValidationB=true;
		} 
		
		if(validationC == "Y"){
			if(isValidationC) {
				errorMessage_ValidationC="";
			}
		} else if(validationC == "N"){
			errorMessage_ValidationC="";
			isValidationC=true;
		} 
				
		if(validationD == "Y"){
			if(isValidationD) {
				errorMessage_ValidationD="";
			}
		} else if(validationD == "N"){
			errorMessage_ValidationD="";
			isValidationD=true;
		} 
		return true;
	}