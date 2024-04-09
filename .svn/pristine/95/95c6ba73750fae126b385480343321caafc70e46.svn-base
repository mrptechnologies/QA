	
	var employee_CensusExtendedXML:XML = new XML();
	var countTotalMedHealthQuestion:Number;
	var isMedHealthElement:Boolean;
	var isMedHealthQuest:Boolean;
	var waiveStatus:String;
	var isEmployeeExtendedXMLLoaded:Boolean;
	var global_employee_XML_Extended:XML;
	Error_Window._visible=false;
	InsError_Window._visible=false;
	var questionaireAandBFilled:Boolean;
	var medicalQuesionMap:HashMap = new HashMap();
	var aboutYourNeedsMap:HashMap = new HashMap();
	// For Insurance Waiver in Action Requested Page
	var waiveQuestionMap:HashMap = new HashMap();
	var isSpouseEntered:Boolean = false;
		
	executeMandatoryRule = function(){
		countTotalMedHealthQuestion = 0;
		employee_CensusExtendedXML.load("/GetApplicationXMLAction.do?answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=EMPLOYEE_EXTENDED&answer(applicationType)=EMPLOYEE&CustomerHeaderNeeded=YES&answer(applicationSubType)=&answer(state)=&answer(teritory)=");
		//employee_CensusExtendedXML.load("1.xml");
		employee_CensusExtendedXML.ignoreWhite=true;
		employee_CensusExtendedXML.onLoad = function(success:Boolean){
			if(success){
				if(validateEmployee_Extended(employee_CensusExtendedXML)) {					
					setEmployeeXMLExtended(employee_CensusExtendedXML);
					checkConditionExtended();	
					retrieveTermsNCondition();
					retreiveInsWaiver();
					freezeTabForWaiver("ActionRequested");
				}
			}
		}	
	}
	validateEmployee_Extended = function(employeeExtendedXML:XML){
		for(parentIndex = 0;parentIndex<employeeExtendedXML.firstChild.childNodes.length;parentIndex++){		
			var subApplicationName = employeeExtendedXML.firstChild.childNodes[parentIndex].attributes.Name;			
			if(subApplicationName == "Med.Con1"){
				for(childIndex=0;childIndex<employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){		
				
					var nameElement:String  = employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					var valueElement:String = employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
						
					if(nameElement=="Object__Employee__MedicalCondition__Cancer" && valueElement != "" && valueElement != undefined){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__CancerType" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Leukemia" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__LeukemiaType" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Lymphoma" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__LymphomaType" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Chemotherapy" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Radiation" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Allergies" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Shots" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Emphysema" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Oxygen" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__LungOther" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__LungOtherIsAny" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Asthma" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__CysticFibrosis" && valueElement != undefined && valueElement != ""){
						 medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__DegenerativeDiscDisease" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Fibromyalgia" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__HerniatedDisc" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__OsteoArthritis" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__RheumatoidArthritis" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__JointReplacement" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__MuscularOther" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__MuscularOtherIsAny" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Aneurysm" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__AneurysmType" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Angioplasty" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__AngioplastyDate" && valueElement != undefined && valueElement != "" && valueElement != "0000-00-00"){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__BypassSurgery" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__BypassSurgeryDate" && valueElement != undefined && valueElement != "" && valueElement != "0000-00-00"){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__HeartAttack" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__HeartAttackDate" && valueElement != undefined && valueElement != "" && valueElement != "0000-00-00"){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Stroke" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__StrokeDate" && valueElement != undefined && valueElement != "" && valueElement != "0000-00-00"){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Anemia" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__AnemiaType" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__OtherBloodDisorder" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__OtherBloodDisorderType" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Hypertension" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__BPReading1" && valueElement != undefined && valueElement != "0"){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__BPReading2" && valueElement != undefined && valueElement != "0"){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__BPReading3" && valueElement != undefined && valueElement != "0"){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__HeartOther" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__HeartOtherIsAny" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__CADAngina" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__CongestiveHeartFailure" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__PacemakerICD" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__BloodClot" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__IrregularHeartBeat" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__PeripheralVascular" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__HighCholesterol" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__HeartValveDisorder"&& valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__DiabetesDietExercise" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}					
					else if(nameElement=="Object__Employee__MedicalCondition__BSRdgsHGB1" && valueElement != undefined && valueElement != "0"){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__BSRdgsHGB2" && valueElement != undefined && valueElement != "0"){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__BSRdgsHGB3" && valueElement != undefined && valueElement != "0"){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__EndocrineOther" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__EndocrineOtherIsAny" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__DiabetesInsulin"&& valueElement != undefined && valueElement != ""){
					medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__DiabetesOral" && valueElement != undefined && valueElement != ""){
					medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__ThyroidDisorder" && valueElement != undefined && valueElement != ""){
					medicalQuesionMap.put(nameElement,valueElement);	
					}
				}
			}else if(subApplicationName == "Med.Con2"){
				for(childIndex=0;childIndex<employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){		
				
					var nameElement:String  = employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					var valueElement:String = employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
						
					if(nameElement=="Object__Employee__MedicalCondition__Epilepsy" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__NeurologicalMal" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__DateofLastSeizure" && valueElement != undefined && valueElement != "" && valueElement != "0000-00-00"){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__NeurologicalOther" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__NeurologicalOtherIsAny" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__CerebralPalsy" && valueElement != undefined && valueElement != ""){
					medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__MultipleSclerosis" && valueElement != undefined && valueElement != ""){
					medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__ParkinsonDisease" && valueElement != undefined && valueElement != ""){
					medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Hospitalized" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__HospitalizedDate" && valueElement != undefined && valueElement != "" && valueElement != "0000-00-00"){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__SuicideAttempt" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__SuicideAttemptDate" && valueElement != undefined && valueElement != "" && valueElement != "0000-00-00"){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__PsychologicalOther" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__PsychologicalIsAny" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__DepressionAnxiety" && valueElement != undefined && valueElement != ""){
					medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__BipolorSchizophrenia" && valueElement != undefined && valueElement != ""){
					medicalQuesionMap.put(nameElement,valueElement);	
					}
				}
			}else if(subApplicationName == "Med.Con3"){
				for(childIndex=0;childIndex<employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){		
				
					var nameElement:String  = employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					var valueElement:String = employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
						
					if(nameElement=="Object__Employee__MedicalCondition__AbnormalPap" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__AbnormalPapDate" && valueElement != undefined && valueElement != "" && valueElement != "0000-00-00"){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__NormalFollowupPap" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__NormalFollowupPapDate" && valueElement != undefined && valueElement != "" && valueElement != "0000-00-00"){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__UrinaryOther" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__UrinaryOtherIsAny" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__ColonPolypsDiverticulitis" && valueElement != undefined && valueElement != ""){
					medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__CrohnUlcerativeColitis" && valueElement != undefined && valueElement != ""){
					medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__GastricRefluxUlcer" && valueElement != undefined && valueElement != ""){
					medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__EnlargedProstate" && valueElement != undefined && valueElement != ""){
					medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__KidneyStones" && valueElement != undefined && valueElement != ""){
					medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__InfertilitityTreatments" && valueElement != undefined && valueElement != ""){
					medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__PolycysticOvarianSyndrome" && valueElement != undefined && valueElement != ""){
					medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Endometriosis" && valueElement != undefined && valueElement != ""){
					medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Transplant" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__TransplantType" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Lupus" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__LupusType" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Hepatitis" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__HepatitisType" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__MiscOther" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__MiscOtherIsany" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__EndStageRenalFailure" && valueElement != undefined && valueElement != ""){
					medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__HIV" && valueElement != undefined && valueElement != ""){
					medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalCondition__Hemophilia" && valueElement != undefined && valueElement != ""){
					medicalQuesionMap.put(nameElement,valueElement);	
					}
				}
			}else if(subApplicationName == "MedQ"){
				for(childIndex=0;childIndex<employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){		
				
					var nameElement:String  = employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					var valueElement:String = employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
						
					if(nameElement=="Object__Employee__MedicalQuestion__CurrentlyPregnant" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalQuestion__PregnantPersonName" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalQuestion__DelivaryDueDate" && valueElement != undefined && valueElement != "" && valueElement != "0000-00-00"){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalQuestion__HighRiskPregnancy" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalQuestion__WorkerCompensation" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalQuestion__CompensationCaseNumber" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalQuestion__DiseaseTreatedBefore" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalQuestion__OperatedHospitalizedBefore" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalQuestion__AdvisedFurtherTreatment" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalQuestion__AnyMedication" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalQuestion__SmokerSpouse" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalQuestion__SmokerSelf" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}	
					else if(nameElement=="Object__Employee__MedicalQuestion__WeightSpouse" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalQuestion__WeightSelf" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalQuestion__HeightSelf" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalQuestion__HeightSpouse" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__MedicalQuestion__NameSpouse" && valueElement != undefined && valueElement != ""){
						medicalQuesionMap.put(nameElement,valueElement);	
					}					
				}
			}			
			else if(subApplicationName == "Needs"){
				for(childIndex=0;childIndex<employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){		
				
					var nameElement:String  = employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					var valueElement:String = employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
						
					if(nameElement=="Object__Employee__AboutNeeds__IsOtherPrimaryLanguage" && valueElement == "Y"){
						aboutYourNeedsMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__AboutNeeds__OtherPrimaryLanguage" && valueElement != "undefined" && valueElement != undefined){
						aboutYourNeedsMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__AboutNeeds__IsOtherCulturalNeed" && valueElement == "Y"){
						aboutYourNeedsMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__AboutNeeds__OtherCulturalNeed" && valueElement != "undefined" && valueElement != undefined){
						aboutYourNeedsMap.put(nameElement,valueElement);	
					}					
				}
			}
			else if(subApplicationName == "Waiver1"){
	
				for(childIndex=0;childIndex<employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){		
					var nameElement:String  = employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					var valueElement:String = employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
		
//					if(nameElement=="Object__Employee__InsWaiver__CoverageReason" && valueElement == "Employee/dependent has coverage"){
					if(nameElement=="Object__Employee__InsWaiver__CoverageReason" && valueElement != "undefined" && valueElement != undefined){
						insWaiverMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__SelfInsCompanyName" && valueElement != "undefined" && valueElement != undefined){
						insWaiverMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__CurrentHealthCvgStatus" && valueElement != "undefined" && valueElement != undefined  ){
						insWaiverMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__OtherCoverageName" && valueElement != "undefined" && valueElement != undefined){
						insWaiverMap.put(nameElement,valueElement);	
					}					
					else if(nameElement=="Object__Employee__InsWaiver__SpouseEmpInsCompanyName" && valueElement != "undefined" && valueElement != undefined){
						insWaiverMap.put(nameElement,valueElement);	
					}	
					else if(nameElement=="Object__Employee__InsWaiver__EmployeeSSN" && valueElement != "undefined" && valueElement != undefined){
						insWaiverMap.put(nameElement,valueElement);	
					}				
				}
			}
			else if(subApplicationName == "HealthQ's"){

				var repeatNameElement:String;
				var repeatValueElement:String;
				var countTotalMedHealth:Number = 0;
				isMedHealthElement = true;
				var MedHealthRowElement = true;
				var updateHeight:Boolean=true;
				var updateWeight:Boolean=true;
				var updateSmoker:Boolean=true;
				if(employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes.length<=0){
					errorMessage_Height="";
					errorMessage_Weight="";
					errorMessage_Smoker="";
				}
				for(childIndex=0;childIndex < employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){
					
					repeatNameElement = employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					repeatValueElement= employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;				
					
					if(repeatNameElement.indexOf("Object__Employee__MedHealthQuestion__Height")!= -1){
						countTotalMedHealth = countTotalMedHealth + 1;
						
						if(repeatValueElement !="" and repeatValueElement != undefined and repeatValueElement != ""){
							MedHealthRowElement = (MedHealthRowElement && true);
							if(updateHeight){errorMessage_Height="";}
						}else{
							MedHealthRowElement = (MedHealthRowElement && false);
							errorMessage_Height = "Height Information is missing on the Medical Health Questionnaire.";
							updateHeight=false;
						}
					}
					else if(repeatNameElement.indexOf("Object__Employee__MedHealthQuestion__Weight")!= -1){
						countTotalMedHealth = countTotalMedHealth + 1;
						
						if(repeatValueElement !="" and repeatValueElement != undefined){
							MedHealthRowElement = (MedHealthRowElement && true);
							if(updateWeight){errorMessage_Weight="";}
						}else{
							MedHealthRowElement = (MedHealthRowElement && false);
							errorMessage_Weight = "Weight Information is missing on the Medical Health Questionnaire.";
							updateWeight=false;
						}
					}
					else if(repeatNameElement.indexOf("Object__Employee__MedHealthQuestion__Smoker")!= -1){
						countTotalMedHealth = countTotalMedHealth+1;
						
						if(repeatValueElement !="" and repeatValueElement != undefined){
							MedHealthRowElement = (MedHealthRowElement && true);
							if(updateSmoker){errorMessage_Smoker="";}
						}else{
							MedHealthRowElement = (MedHealthRowElement && false);
							errorMessage_Smoker = "Smoker Information is missing on the Medical Health Questionnaire.";
							updateSmoker=false;
						}
					}
					if(countTotalMedHealth % 3 == 0){		
						isMedHealthElement = isMedHealthElement && MedHealthRowElement;
					}				
				}
			}
		}
		//validateMedQuestionnaire();
		validateAboutYourNeeds();
		//validateInsuranceWaiverNeeds();
		return true;
	}

	/**
	 *This function is used for Updating image according to submission rule
	 */	
	checkConditionExtended = function(){	
	
		if(enableIndicator){
			if(isMedHealthQuest && isMedHealthElement){			
				medicalQues_wrong._visible = false;
			}else{
				medicalQues_wrong._visible = false;
			}						
			
			if(isAboutYourNeeds){			
				aboutYourNeeds_wrong._visible = false;
			}else{
				aboutYourNeeds_wrong._visible = true;
			}
		}			
		if(enableIndicator || enableIndicatorInsWaiver){			
			if(isInsWaiver){			
				insWaiver_wrong._visible = false;
				insWaiver_wrong1._visible = false;
			}else{
				insWaiver_wrong._visible = true;
				insWaiver_wrong1._visible = true;
			}
		}
	}
	/**
	 *This function is used for loading xml on loading flash at first time
	 */	
	loadEmployee_ExtendedXML = function() {
		if(isEmployeeExtendedXMLLoaded) {
			checkConditionExtended();
		} else {
			executeMandatoryRule();		
			isEmployeeExtendedXMLLoaded=true;		
		}
	}
	/**
	 * Setter method of "global_employee_XML_Extended"
	 */
	setEmployeeXMLExtended = function(xml:XML) {		
		global_employee_XML_Extended = xml;		
	}	

	validateMedQuestionnaire = function(){
		
		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Cancer")){		
		
				if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Cancer") == "Y"){
			
					if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__CancerType")){
						isMedHealthQuest = true;				
					}else{
						isMedHealthQuest = false;
					}
				}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Cancer") == "N"){
					isMedHealthQuest = true;		
				}else{
					isMedHealthQuest =  false;
				}
		}
		
		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Leukemia")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Leukemia") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__LeukemiaType")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Leukemia") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Lymphoma")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Lymphoma") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__LymphomaType")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Lymphoma") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Allergies")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Allergies") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Shots")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Allergies") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Emphysema")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Allergies") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Oxygen")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Emphysema") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}
		
		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__LungOther")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__LungOther") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__LungOtherIsAny")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__LungOther") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__MuscularOther")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__MuscularOther") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__MuscularOtherIsAny")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__MuscularOther") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}
		
		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Aneurysm")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Aneurysm") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__AneurysmType")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Aneurysm") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Angioplasty")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Angioplasty") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__AngioplastyDate")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Angioplasty") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__BypassSurgery")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__BypassSurgery") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__BypassSurgeryDate")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__BypassSurgery") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}
		
		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__HeartAttack")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__HeartAttack") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__HeartAttackDate")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__HeartAttack") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}
		
		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Stroke")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Stroke") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__StrokeDate")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Stroke") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Anemia")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Anemia") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__AnemiaType")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Anemia") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__OtherBloodDisorder")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__OtherBloodDisorder") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__OtherBloodDisorderType")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__OtherBloodDisorder") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Hypertension")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Hypertension") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__BPReading1") && medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__BPReading2") &&  medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__BPReading3")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Hypertension") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__HeartOther")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__HeartOther") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__HeartOtherIsAny")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__HeartOther") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}
		
		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__DiabetesDietExercise")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__DiabetesDietExercise") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__BSRdgsHGB1") && medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__BSRdgsHGB2") &&  medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__BSRdgsHGB3")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__DiabetesDietExercise") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__EndocrineOther")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__EndocrineOther") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__EndocrineOtherIsAny")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__EndocrineOther") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__EndocrineOther")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__EndocrineOther") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__EndocrineOtherIsAny")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__EndocrineOther") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}
		
		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Epilepsy")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Epilepsy") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__NeurologicalMal") && medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__DateofLastSeizure")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Epilepsy") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__NeurologicalOther")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__NeurologicalOther") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__NeurologicalOtherIsAny")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__NeurologicalOther") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}
		
		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Hospitalized")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Hospitalized") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__HospitalizedDate")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Hospitalized") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__SuicideAttempt")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__SuicideAttempt") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__SuicideAttemptDate")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__SuicideAttempt") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__PsychologicalOther")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__PsychologicalOther") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__PsychologicalIsAny")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__PsychologicalOther") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}
		
		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__AbnormalPap")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__AbnormalPap") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__AbnormalPapDate")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__AbnormalPap") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__NormalFollowupPap")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__NormalFollowupPap") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__NormalFollowupPapDate")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__NormalFollowupPap") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}
		
		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__UrinaryOther")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__UrinaryOther") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__UrinaryOtherIsAny")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__UrinaryOther") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Transplant")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Transplant") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__TransplantType")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Transplant") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}
		
		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Lupus")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Lupus") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__LupusType")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Lupus") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Hepatitis")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Hepatitis") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__HepatitisType")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__Hepatitis") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__MiscOther")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalCondition__MiscOther") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__MiscOtherIsany")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalCondition__MiscOther") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}
		
		if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__CurrentlyPregnant")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalQuestion__CurrentlyPregnant") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__PregnantPersonName") && medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__DelivaryDueDate") && medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__HighRiskPregnancy")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalQuestion__CurrentlyPregnant") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}

		if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__WorkerCompensation")){		
		
			if(medicalQuesionMap.get("Object__Employee__MedicalQuestion__WorkerCompensation") == "Y"){
		
				if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__CompensationCaseNumber")){
					isMedHealthQuest = (isMedHealthQuest && true);				
				}else{
					isMedHealthQuest = (isMedHealthQuest && false);
				}
			}else if(medicalQuesionMap.get("Object__Employee__MedicalQuestion__WorkerCompensation") == "N"){
				isMedHealthQuest = (isMedHealthQuest && true);	
			}else{
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}
	    if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Chemotherapy")){  
			isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
	    if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Radiation")){  
			isMedHealthQuest = (isMedHealthQuest && true);
						
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Asthma" )){ 
			 isMedHealthQuest = (isMedHealthQuest && true);
				
		}else{   
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__CysticFibrosis" )){  
		 	isMedHealthQuest = (isMedHealthQuest && true);
		 
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__DegenerativeDiscDisease" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Fibromyalgia" )){   
			 isMedHealthQuest = (isMedHealthQuest && true);
		
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__HerniatedDisc" )){   
			 isMedHealthQuest = (isMedHealthQuest && true);
		
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__OsteoArthritis" )){  
		 	isMedHealthQuest = (isMedHealthQuest && true);
		
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__RheumatoidArthritis" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{ 
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__JointReplacement" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{ 
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__CADAngina" )){   
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__CongestiveHeartFailure" )){  
		 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{ 
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__PacemakerICD" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__BloodClot" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__IrregularHeartBeat" )){ 
		 	isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__PeripheralVascular" )){ 
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{ 
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__HighCholesterol" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__HeartValveDisorder")){  
		 	isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{   
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__DiabetesInsulin")){  
		 	isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__DiabetesOral" )){ 
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__ThyroidDisorder" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__CerebralPalsy" )){   
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__MultipleSclerosis" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__ParkinsonDisease" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{ 
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__DepressionAnxiety" )){ 
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__BipolorSchizophrenia" )){   
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__ColonPolypsDiverticulitis" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__CrohnUlcerativeColitis" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__GastricRefluxUlcer" )){ 
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__EnlargedProstate" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__KidneyStones" )){  
		 	isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{   
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__InfertilitityTreatments" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{   
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__PolycysticOvarianSyndrome" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{   
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Endometriosis" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__EndStageRenalFailure" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{   
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__HIV" )){   
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalCondition__Hemophilia" )){ 
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
			}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__DiseaseTreatedBefore" )){  
		 	isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__OperatedHospitalizedBefore" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{   
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__AdvisedFurtherTreatment" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__AnyMedication" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		questionaireAandBFilled=isMedHealthQuest;
	/*	
		if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__SmokerSpouse" )){   
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{   
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__SmokerSelf" )){  
			 isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__WeightSpouse" )){  
		    isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{   
			isMedHealthQuest = (isMedHealthQuest && false);
		}				
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__WeightSelf" )){   
			isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__HeightSelf" )){  
		 	isMedHealthQuest = (isMedHealthQuest && true);						
		}else{  
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		 if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__HeightSpouse" )){   
		 	isMedHealthQuest = (isMedHealthQuest && true);
			
		}else{   
			isMedHealthQuest = (isMedHealthQuest && false);
		}
	*/	
		validateSelfSpouse();
	}
	
	validateSelfSpouse = function() {
		setSpouseVariable();
		if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__HeightSelf" )) {
			//errorMessage_Height="";
			isMedHealthQuest = (isMedHealthQuest && true);
		} else {		
			errorMessage_Height = "Height Information is missing on the Medical Health Questionnaire.";
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		
		if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__WeightSelf" )){
			//errorMessage_Weight="";
			isMedHealthQuest = (isMedHealthQuest && true);
		} else {
			errorMessage_Weight = "Weight Information is missing on the Medical Health Questionnaire.";
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		
		if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__SmokerSelf" )) {
			//errorMessage_Smoker="";
			isMedHealthQuest = (isMedHealthQuest && true);
		} else {
			errorMessage_Smoker = "Smoker Information is missing on the Medical Health Questionnaire.";
			isMedHealthQuest = (isMedHealthQuest && false);
		}
		
		if(isSpouseEntered){
			if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__HeightSpouse" )) {
				//errorMessage_Height="";
				isMedHealthQuest = (isMedHealthQuest && true);
			} else {		
				errorMessage_Height = "Height Information is missing on the Medical Health Questionnaire.";
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		
			if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__WeightSpouse" )){
				//errorMessage_Weight="";
				isMedHealthQuest = (isMedHealthQuest && true);
			} else {
				errorMessage_Weight = "Weight Information is missing on the Medical Health Questionnaire.";
				isMedHealthQuest = (isMedHealthQuest && false);
			}
			
			if(medicalQuesionMap.containsKey("Object__Employee__MedicalQuestion__SmokerSpouse" )) {
				//errorMessage_Smoker="";
				isMedHealthQuest = (isMedHealthQuest && true);
			} else {
				errorMessage_Smoker = "Smoker Information is missing on the Medical Health Questionnaire.";
				isMedHealthQuest = (isMedHealthQuest && false);
			}
		}
	}
	
	
	/**
	 * To validate the About Your Needs while submission
	 * @author gnanaguru_g@solartis.net
	 */
	function validateAboutYourNeeds() {
		if(aboutYourNeedsMap.containsKey("Object__Employee__AboutNeeds__IsOtherPrimaryLanguage" )){
			if(aboutYourNeedsMap.get("Object__Employee__AboutNeeds__OtherPrimaryLanguage" ) != undefined ){
				isAboutYourNeeds = true;
				errorMessage_PrimaryLanguage_Other="";
			}else{
				isAboutYourNeeds = false;
			}
		} else {
			isAboutYourNeeds = true;
			errorMessage_PrimaryLanguage_Other="";
		}
		if(aboutYourNeedsMap.containsKey("Object__Employee__AboutNeeds__IsOtherCulturalNeed" )){
			if(aboutYourNeedsMap.get("Object__Employee__AboutNeeds__OtherCulturalNeed" ) != undefined  ){
				isAboutYourNeeds = (isAboutYourNeeds && true);
				errorMessage_Cultural_Need="";
			}else{
				isAboutYourNeeds = (isAboutYourNeeds && false);
			}
		}else {
			isAboutYourNeeds = (isAboutYourNeeds && true);
			errorMessage_Cultural_Need="";
		}
	}
	
	
	
	/**
 * To Validate Ins Waiver in Action Requested Page
 *@author senthilkumar_n@solartis.net
 */
 
 validateInsurance_Waiver = function(){
  for(parentIndex = 0;parentIndex<global_employee_XML.firstChild.childNodes.length;parentIndex++){  
   var subApplicationName = global_employee_XML.firstChild.childNodes[parentIndex].attributes.Name;   
   if(subApplicationName == "Action"){
    for(childIndex=0;childIndex<global_employee_XML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){  
    
     var nameElement:String  = global_employee_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
     var valueElement:String = global_employee_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
      
     if(nameElement=="Object__Employee__ActionRequested__HealthCvg" && valueElement != "undefined" && valueElement != undefined){
      waiveQuestionMap.put(nameElement,valueElement); 
     }
     else if(nameElement=="Object__Employee__ActionRequested__DrugCvg" && valueElement != "undefined" && valueElement != undefined){
      waiveQuestionMap.put(nameElement,valueElement); 
     }
     else if(nameElement=="Object__Employee__ActionRequested__DentalCvg" && valueElement != "undefined" && valueElement != undefined){
      waiveQuestionMap.put(nameElement,valueElement); 
     }
     else if(nameElement=="Object__Employee__ActionRequested__VisionCvg" && valueElement != "undefined" && valueElement != undefined){
      waiveQuestionMap.put(nameElement,valueElement); 
     }
     else if(nameElement=="Object__Employee__ActionRequested__NoOrSomeCvg" && valueElement != "undefined" && valueElement != undefined){
      waiveQuestionMap.put(nameElement,valueElement); 
     }
     
    }
   }
  }
  waiveStatus = validateWaiveQuestionnaire();
  return waiveStatus;
 }
 
 validateWaiveQuestionnaire = function(){

  if(waiveQuestionMap.containsKey("Object__Employee__ActionRequested__NoOrSomeCvg")){  
  
    if(waiveQuestionMap.get("Object__Employee__ActionRequested__NoOrSomeCvg") == "NoOrSomeCoverage"){
       
      waiveStatus ="WAIVER_SUBMITTED";
    }
  }
  
  if(waiveQuestionMap.containsKey("Object__Employee__ActionRequested__HealthCvg")){  
    if(waiveQuestionMap.get("Object__Employee__ActionRequested__HealthCvg") == "HealthCoverage"){     
     if(waiveQuestionMap.get("Object__Employee__ActionRequested__NoOrSomeCvg") == "NoOrSomeCoverage"){        
      waiveStatus ="E_SUBMITTED";
     }
      
    }
  }
  
  if(waiveQuestionMap.containsKey("Object__Employee__ActionRequested__DrugCvg")){  
  
    if(waiveQuestionMap.get("Object__Employee__ActionRequested__DrugCvg") == "DrugCoverage"){
     
     if(waiveQuestionMap.get("Object__Employee__ActionRequested__NoOrSomeCvg") == "NoOrSomeCoverage"){
       
      waiveStatus ="E_SUBMITTED";
     }

    }
  }
  
  if(waiveQuestionMap.containsKey("Object__Employee__ActionRequested__DentalCvg")){  
  
    if(waiveQuestionMap.get("Object__Employee__ActionRequested__DentalCvg") == "DentalCoverage"){
       
     if(waiveQuestionMap.get("Object__Employee__ActionRequested__NoOrSomeCvg") == "NoOrSomeCoverage"){
       
      waiveStatus ="E_SUBMITTED";
     }
   
    }
  }
  
  if(waiveQuestionMap.containsKey("Object__Employee__ActionRequested__VisionCvg")){  
  
    if(waiveQuestionMap.get("Object__Employee__ActionRequested__VisionCvg") == "VisionCoverage"){

     if(waiveQuestionMap.get("Object__Employee__ActionRequested__NoOrSomeCvg") == "NoOrSomeCoverage"){
       
      waiveStatus ="E_SUBMITTED";
     }
    
    }
  }
  return waiveStatus;
 }
		
/**
	 * To validate the Ins Waiver while submission
	 * @author gnanaguru_g@solartis.net
	 */
	function validateInsuranceWaiverNeeds() {
		 	 
		
		if(insWaiverMap.containsKey("Object__Employee__InsWaiver__CoverageReason" )){
  			 if(insWaiverMap.get("Object__Employee__InsWaiver__CoverageReason") == "Employee/dependent has coverage") {
			    if(insWaiverMap.get("Object__Employee__InsWaiver__SelfInsCompanyName" ) != undefined){
				     isInsWaiver = true;
				     errorMessage_InsCompanyName="";
			    }else{
				     isInsWaiver = false;
			    }
		   }else if(insWaiverMap.get("Object__Employee__InsWaiver__CoverageReason") == "No Coverage") {
			    isInsWaiver = true;
			    errorMessage_InsCompanyName="";
		   }
	  } else {
	   isInsWaiver = false;
	   errorMessage_InsCompanyName="";
	  }
		if(insWaiverMap.containsKey("Object__Employee__InsWaiver__CurrentHealthCvgStatus" )){
			if(insWaiverMap.get("Object__Employee__InsWaiver__CurrentHealthCvgStatus") == "Other coverage") {
				if(insWaiverMap.get("Object__Employee__InsWaiver__OtherCoverageName") != undefined){
					isInsWaiver = (isInsWaiver && true);
					errorMessage_OtherCoverage="";			
					errorMessage_CompanyName="";
				}else{
					isInsWaiver = (isInsWaiver && false);
					errorMessage_CompanyName="";
				}
			} else if(insWaiverMap.get("Object__Employee__InsWaiver__CurrentHealthCvgStatus") == "Coverage through my spouse") { 
				if(insWaiverMap.get("Object__Employee__InsWaiver__SpouseEmpInsCompanyName" ) != undefined){	
					isInsWaiver = (isInsWaiver && true);
					errorMessage_CompanyName="";
					errorMessage_OtherCoverage="";
				}else{
					isInsWaiver = (isInsWaiver && false);
					errorMessage_OtherCoverage="";
				}
			}else{
				isInsWaiver = (isInsWaiver && true);
				errorMessage_CompanyName="";
				errorMessage_OtherCoverage="";	
			}
		}else{
			isInsWaiver = (isInsWaiver && false);
		}
		
		 if(insWaiverMap.containsKey("Object__Employee__InsWaiver__EmployeeSSN")){
			isInsWaiver = (isInsWaiver && true);
			errorMessage_InsSSN = ""; 
		 }else{
			 isInsWaiver = (isInsWaiver && false);
		 }
	}
	
	function setSpouseVariable()  {		 
		for(parentIndex = 0;parentIndex<global_employee_XML.firstChild.childNodes.length;parentIndex++){
			subApplicationName = global_employee_XML.firstChild.childNodes[parentIndex].attributes.Name;		
			if(subApplicationName=="Spouse Details") {
				for(childIndex=0;childIndex<global_employee_XML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){					
					var nameElement:String  = global_employee_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					var valueElement:String = global_employee_XML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;					
					if(nameElement=="Object__Employee__CoverageDept__Spouse__Spouse" and valueElement =="Spouse"){
						isSpouseEntered = true;
					}					
				}			
			}
		}				
	}
	
	/**
	  *	Function will call while we hit the InsWaiver Submit.	
	  */
	validateWaiveEmployeeExtendedSubmission = function(employeeExtendedXML:XML){
		
		for(parentIndex = 0;parentIndex<employeeExtendedXML.firstChild.childNodes.length;parentIndex++){		
			var subApplicationName = employeeExtendedXML.firstChild.childNodes[parentIndex].attributes.Name;	
			if(subApplicationName == "Waiver1"){
				for(childIndex=0;childIndex<employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes.length;childIndex++){		
					var nameElement:String  = employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes[childIndex].firstChild.firstChild.nodeValue;
					var valueElement:String = employeeExtendedXML.firstChild.childNodes[parentIndex].childNodes[childIndex].lastChild.lastChild.nodeValue;
					if(nameElement=="Object__Employee__InsWaiver__CoverageReason" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);								
					}
					else if(nameElement=="Object__Employee__InsWaiver__CurrentHealthCvgStatus" && valueElement != "undefined" && valueElement != undefined  ){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__EmployeeName" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}					
					else if(nameElement=="Object__Employee__InsWaiver__EmployeeSSN" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}				
					else if(nameElement=="Object__Employee__InsWaiver__SelfInsCompanyName" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__WaiverSelf" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__CvgSelfHealth" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__CvgSelfDrug" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__CvgSelfDental" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__CvgSelfVision" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__CvgSelfFDL" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__WaiverDependent" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__CvgDeptHealth" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__CvgDeptDrug" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__CvgDeptDental" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__CvgDeptVision" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__WaiverDeptName1" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__WaiverDeptName2" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__WaiverDeptName3" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__WaiverDeptName4" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__WaiverDeptName5" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}
					else if(nameElement=="Object__Employee__InsWaiver__OtherCoverageName" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}	
					else if(nameElement=="Object__Employee__InsWaiver__SpouseEmpInsCompanyName" && valueElement != "undefined" && valueElement != undefined){
						waiveSubmissionQuestionMap.put(nameElement,valueElement);	
					}
				}
			}
		}
		validateWaiveSubmission();
		return true;
	}
	
	validateWaiveEmployeeSubmission = function(employeeXML:XML){
		for(parentIndex = 0;parentIndex<employeeXML.firstChild.childNodes.length;parentIndex++){		
			var subApplicationName = employeeXML.firstChild.childNodes[parentIndex].attributes.Name;	
			if(subApplicationName == "Action"){
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
			}
		}
		validateActionRequested();
		return true;
	}
	
	
	validateWaiveSubmission = function(){		
  		if(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__WaiverSelf")){  
   			 if((waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__CvgSelfHealth")) ||
				(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__CvgSelfDrug"))   ||
				(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__CvgSelfDental")) ||
				(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__CvgSelfVision")) ||
				(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__CvgSelfFDL"))	){
				 	errorMessage_InsSectionA = "";    			  
   			 }
  		}else if(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__WaiverDependent")){  
			 if((waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__CvgDeptHealth"))   ||
				(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__CvgDeptDrug"))     ||
				(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__CvgDeptDental"))   ||
				(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__CvgDeptVision"))   ||
				(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__WaiverDeptName1")) ||
				(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__WaiverDeptName2")) ||
				(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__WaiverDeptName3")) ||
				(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__WaiverDeptName4")) ||
				(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__WaiverDeptName5")) ){
					errorMessage_InsSectionA = ""; 
			 }
		}
		
/*		if(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__CoverageReason")){
			errorMessage_InsSectionA = ""; 
		}
		
		if(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__CurrentHealthCvgStatus")){
			errorMessage_InsSectionB = ""; 
		}
*/		
		if(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__EmployeeName")){
			errorMessage_InsEmployeeName = ""; 
		}
/*		if((waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__EmployeeSSNOne")) &&
			(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__EmployeeSSNTwo")) &&
			(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__EmployeeSSNThree")) ){
				errorMessage_InsSSN = ""; 
		}
*/		
		if(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__EmployeeSSN")){
			errorMessage_InsSSN = ""; 
		}
		
		
		if(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__CoverageReason")){
			
			errorMessage_InsSectionACoverageReason = ""; 
  			 if(waiveSubmissionQuestionMap.get("Object__Employee__InsWaiver__CoverageReason") == "Employee/dependent has coverage") {
			    if(waiveSubmissionQuestionMap.get("Object__Employee__InsWaiver__SelfInsCompanyName" ) == undefined){
				      errorMessage_InsCompanyName = "Insurance Company Name Information is missing on the Section A of Insurance Waiver.";
			    }
		     }
		}
		if(waiveSubmissionQuestionMap.containsKey("Object__Employee__InsWaiver__CurrentHealthCvgStatus" )){
			errorMessage_InsSectionB = ""; 
			if(waiveSubmissionQuestionMap.get("Object__Employee__InsWaiver__CurrentHealthCvgStatus") == "Other coverage") {
				if(waiveSubmissionQuestionMap.get("Object__Employee__InsWaiver__OtherCoverageName") == undefined){
					errorMessage_OtherCoverage = "Other Coverage Information is missing on the Section B of Insurance Waiver.";
				}
			} else if(waiveSubmissionQuestionMap.get("Object__Employee__InsWaiver__CurrentHealthCvgStatus") == "Coverage through my spouse") { 
				if(waiveSubmissionQuestionMap.get("Object__Employee__InsWaiver__SpouseEmpInsCompanyName" ) == undefined){	
					errorMessage_CompanyName = "Company Name Information is missing on the Section B of Insurance Waiver.";
				}
			}else{
				errorMessage_CompanyName="";
				errorMessage_OtherCoverage="";	
			}
		}
 	 }
	


