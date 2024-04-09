function validateTankConstruction(obj) {

}

function validateTankWallType(obj){

	
}

function validatePipeConstruction(obj) {

	
}

function validatePipeWallType(obj){

	
}

function doValidateTank(frm){
	
	if(frm.RiskType !=null && frm.RiskType !='undefined' && frm.RiskType.value=="UST"){
	
		if(frm.RegulatoryCompliance[0].checked == false && frm.RegulatoryCompliance[1].checked == false){
		
			alert("Please answer Regulatory Compliance");
			return false;
		}
		
		if(frm.CoatedOrBareSteelHIDDEN.value  == "" && frm.FRPCladSteelHIDDEN.value  == "" && frm.SteelTankInstituteHIDDEN.value  == "" && frm.SWFiberReinforcedHIDDEN.value  == ""
		    && frm.CathodicallyProtectedHIDDEN.value  == "" && frm.Other_TankConstructionHIDDEN.value  == ""){
			
			alert("Please identify type of Tank Construction ");
			return false;
		
		}
		
		if(frm.NewOilHIDDEN.value  == "" && frm.WasteOilHIDDEN.value  == "" && frm.HeatingOilHIDDEN.value  == "" && frm.GasolineHIDDEN.value  == "" && frm.DeiselHIDDEN.value  == ""
		   && frm.KeroseneHIDDEN.value  == "" && frm.PropeneHIDDEN.value  == "" && frm.JetFuelHIDDEN.value  == "" && frm.AntiFreezeHIDDEN.value  == "" && frm.Others_TankContentsHIDDEN.value  == ""){
		   
			alert("Please identify type of Tank Contents ");
			return false;
		
		}
		
		if(frm.None_LeakDetectionHIDDEN.value  == "" && frm.AutoTankMonitoringHIDDEN.value  == "" && frm.MonthlyGroundWaterMonitoringHIDDEN.value  == "" && frm.StatisticalInventoryAnalysisHIDDEN.value  == ""
		   && frm.MonthlyInterstitialHIDDEN.value  == "" && frm.AnnualTightnessTests_LeakDetectionHIDDEN.value  == "" && frm.MonthlyVaporMonitoring_LeakDetectionHIDDEN.value  == ""){
		   
		   	alert("Please identify type of Leak Detection ");	
		   	return false;
		}
		   
		if(frm.SameastanksHIDDEN.value  == "" && frm.CoatedorBareSteelHIDDEN.value  == "" && frm.FiberglassHIDDEN.value  == "" && frm.SteelPipeInstituteHIDDEN.value  == ""
		   && frm.SWFiberReinforcedPlasticHIDDEN.value  == "" && frm.CathodicallyProtectedSteelHIDDEN.value  == "" && frm.Other_PipingConstructionHIDDEN.value==""){
		   	alert("Please identify type of Pipe Construction ");
		   	return false;
		}
		
		if(frm.None_PipeLeakDetectionHIDDEN.value=="" && frm.SameleakdetectionHIDDEN.value=="" && frm.AutomaticDetectorsHIDDEN.value=="" && frm.MonthlygroundwaterMonitoringHIDDEN.value==""
		   && frm.MonthlyStatisticalAnalysisHIDDEN.value=="" && frm.MonthlyInterstitialMonitoringHIDDEN.value=="" && frm.MonthlyVaporMonitoring_PipeDetectionHIDDEN.value=="" && frm.AnnualTightnessTests_PipeDetectionHIDDEN.value==""
		   && frm.Others_PipeDetectionHIDDEN.value==""){
		   
		   alert("Please identify type of Piping Leak Detection ");
		   	return false;
		   
		}   			   
		
		return true;
	}else if(frm.RiskType !=null && frm.RiskType !='undefined' && frm.RiskType.value=="AST"){
	
		if(frm.FiberGlass_TankConstructionHIDDEN.value == "" && frm.CoatedOrBareSteel_TankConstructionHIDDEN.value=="" && frm.FRPCladSteelHIDDEN.value=="" && frm.SWReinforcedPlastic_TankConstructionHIDDEN.value==""
		   && frm.CathodicallyProtectedHIDDEN.value=="" && frm.WeldedSteelHIDDEN.value=="" && frm.PlasticHIDDEN.value=="" && frm.Others_TankConstructionHIDDEN.value=="" && frm.VaultedHIDDEN.value==""){
		   
		      alert("Please identify type of tank construction");
		      return false;
		   }
		   
		if(frm.RegularGasolineHIDDEN.value=="" && frm.UnleadedGasHIDDEN.value=="" && frm.DeiselHIDDEN.value=="" && frm.KeroseneHIDDEN.value=="" && frm.NewOilHIDDEN.value==""
		   && frm.WasteOilHIDDEN.value=="" && frm.HeatingOilHIDDEN.value=="" && frm.PropeneHIDDEN.value=="" & frm.JetFuelHIDDEN.value=="" && frm.AntiFreezeHIDDEN.value=="" &&
		      frm.OthersHIDDEN.value == ""){
		      
		        alert("Please identify type of Tank contents ");
		        return false;
		      
		} 
				
		if(frm.AddCoverageForAST[0].checked == true && frm.SameAsTankHIDDEN.value == "" && frm.FiberGlass_PipeConstructionHIDDEN.value=="" && frm.CoatedOrBareSteel_PipeConstructionHIDDEN.value=="" && frm.STIP3SteelPipeInstitute_PipeConstructionHIDDEN.value==""
		    && frm.SWReinforcedPlastic_PipeConstructionHIDDEN.value=="" && frm.CathodicallyProtectedSteelHIDDEN.value=="" && frm.OtherHIDDEN.value==""){
		    
		    alert("Please identify type of Pipe construction ");
		    return false;
		    
		}   
		
		
	//	if(frm.AddCoverageForAST[0].checked == true && frm.NoneHIDDEN.value=="" && frm.SameAstankHIDDEN.value=="" && frm.AutomaticDetectorsHIDDEN.value == "" &&  frm.GroundwaterMonitoringHIDDEN.value=="" 
		//   && frm.StatisticalAnalysisHIDDEN.value == "" && frm.InterstitialMonitoringHIDDEN.value == "" && frm.VapourMonitoringHIDDEN.value == "" && frm.AnnualTightnessTestsHIDDEN.value == ""){
		   
		  //   alert("Please select any of the Pipe Leak Detection Field");
		    // return false;
		   
		   //}
		  
		return true;
	}

	//To do Validation of UST Specific Questions
	else if(frm.name=='USTSpecificQuestions'){
		return(doValidateUSTSpecificQuestions(frm));     
		
	}	
	//To do Validation of AST Specific Questions 
	else if(frm.name == 'ASTSpecificQuestions'){
		return(doValidateASTSpecificQuestions(frm)); 
	}
	
	return true;	   
	
}

function doValidateUSTSpecificQuestions(frm){

	if(frm.IsTankRemoved[0].checked == false && frm.IsTankRemoved[1].checked == false){
	
		alert("Please answer all the mandatory fields");
		return false;
	}
	
	if(frm.Is_Plan_For_Remove_Risk[0].checked == false && frm.Is_Plan_For_Remove_Risk[1].checked == false){
	
		alert("Please answer all the mandatory fields");
		return false;
	}
	
	
	if(frm.IsSiteInvestigation[0].checked == false && frm.IsSiteInvestigation[1].checked == false){
	
		alert("Please answer all the mandatory fields");
		return false;
	}
	
	return true;
}
  
 
function doValidateASTSpecificQuestions(frm){


   if(frm.BottomsRelined[0].checked == false && frm.BottomsRelined[1].checked == false){
   
       alert("Please answer all the mandatory fields");
       return false;
   
   }
   
   if(frm.SpccPlan_InPlace[0].checked == false && frm.SpccPlan_InPlace[1].checked == false){
   
       alert("Please answer all the mandatory fields");
       return false;
   
   }
   
   
   

   return true;
}

function validateAstTankConstruction(obj){
	
}

function validateAstTankWallType(obj){

}

function validateAstPipeConstruction(obj) {

	
}

function validateAstPipeWallType(obj){

	
}

 function validateGeneralQuestions(frm){
 
   if(frm.IsProsecuted != null && frm.IsProsecuted[0].checked == false && frm.IsProsecuted[1].checked ==false ){
 	
 		alert("Please answer all the mandatory questions")
 		return false;
 	}
 	
 	if(frm.AnyClaims != null && frm.AnyClaims[0].checked == false && frm.AnyClaims[1].checked ==false ){
 	
 		alert("Please answer all the mandatory questions")
 		return false;
 	}
 	
 	if(frm.AnyClaimsAtSigning != null && frm.AnyClaimsAtSigning[0].checked == false && frm.AnyClaimsAtSigning[1].checked == false ){
 	
 		alert("Please answer all the mandatory questions")
 		return false;
 	}
 	
 	if(frm.DescribeProsecuted != undefined && frm.DescribeProsecuted != null && frm.DescribeProsecuted.value == "" && frm.DescribeProsecuted.type=="textarea"){
 		var ele1 = frm.DescribeProsecuted;
			ele1.style.background='#FFCC33';
			ele1.focus();
 		alert("Please provide details")
 		return false;
 	}
 	
 	if(frm.AnyClaimsDescribe != undefined && frm.AnyClaimsDescribe != null && frm.AnyClaimsDescribe.value == "" && frm.AnyClaimsDescribe.type=="textarea"){
 		var ele1 = frm.AnyClaimsDescribe;
			ele1.style.background='#FFCC33';
			ele1.focus();
 		alert("Please provide details")
 		return false;
 	}
 	
 	if(frm.AnyClaimsAtSigningDescribe != undefined && frm.AnyClaimsAtSigningDescribe != null && frm.AnyClaimsAtSigningDescribe.value == "" && frm.AnyClaimsAtSigningDescribe.type=="textarea" ){
 		var ele1 = frm.AnyClaimsAtSigningDescribe;
			ele1.style.background='#FFCC33';
			ele1.focus();
 		alert("Please provide details")
 		return false;
 	}
 	
 	
 	return true;
 
 }
 
 
