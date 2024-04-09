function LoadClassBenefitsList(TabId){
		document.getElementById("policyDivTable").style.display="block";
		activateQuoteTabs(TabId);
 		var locationListArraySize = 0;	 	 	
 		var policyId    = document.getElementById("policyId").value;
		var policyVerId = document.getElementById("policyVerId").value;
	//	var subQuoteId    = document.getElementById("subQuoteId11").value;
		var productVerId  = document.getElementById("ProductVerId").value;
		var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
		var appEnabled = "";
		if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
	}else{
			appEnabled = "N";	
		}
		var agencyId = document.getElementById("agencyId").value;

	//	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
 		var ownerId = document.getElementById("ownerId").value;
		var custId = document.getElementById("custId").value;
		
 		var pars = 'answer(policyId)='+policyId+'&answer(policyVerId)='+policyVerId+'&answer(OwnerId)='+ownerId;
 				
 		var url = '../GetPolicyClassBenefitsList.do?'+pars;	
    
    	var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
    	 autologout();
		 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 		 enableTabs();
		 		 document.getElementById("PolicyDiv").style.display = "block";
		 	},onSuccess: function(transport){	
		 	document.getElementById("PolicyDiv").innerHTML = "";		 	
		 	document.getElementById("PolicyDiv").innerHTML= transport.responseText;
		 	}
		}
		);
		
	}
	function paymentTransactionSubmit(form){	
		var dmonthRemittanceDate = "";
		var ddayRemittanceDate = "";
		var dyearRemittanceDate = "";	
		if(form.Payment != null && form.Payment != undefined){
			if(form.Payment.checked == true){
				if(form.RemittanceDateHidden != null && form.RemittanceDateHidden != undefined){
					if(form.RemittanceDateHidden.value != ""){					
						var remittanceDate= form.RemittanceDateHidden.value
						if(!isDate(remittanceDate)){
							alert("Please enter a valid Remittance date (from 01/01/2010 onwards).")
							//form.RemittanceDateHidden.focus();
							return false;
						}					
						dmonthRemittanceDate = parseInt(remittanceDate.substring(0, 2), 10);
						ddayRemittanceDate = parseInt(remittanceDate.substring(3, 5), 10);
						dyearRemittanceDate = parseInt(remittanceDate.substring(6, 10), 10);					
						if (isNaN(dmonthRemittanceDate) || dmonthRemittanceDate < 1 || dmonthRemittanceDate > 12 || isNaN(ddayRemittanceDate) || ddayRemittanceDate < 1 || ddayRemittanceDate > 31 || remittanceDate.substring(2, 3)!="/" || remittanceDate.substring(5, 6)!="/"|| isNaN(dyearRemittanceDate) || dyearRemittanceDate < 2010)
						{
							alert("Please enter a valid Remittance date (from 01/01/2010 onwards).");
							//form.RemittanceDateHidden.select();
							return false;
						}
					}
				}
				if(form.PaymentDateHidden != null && form.PaymentDateHidden != undefined){
					if(form.PaymentDateHidden.value == ""){
						alert("Please enter a valid Payment date (from 01/01/2010 onwards) and on or after the remittance date (if provided).");
						//form.RemittanceDateHidden.focus();
						return false;
					}
					var paymentDate = form.PaymentDateHidden.value;
					if(!isDate(paymentDate)){
						alert("Please enter a valid Payment date (from 01/01/2010 onwards) and on or after the remittance date (if provided).")
						//form.PaymentDateHidden.focus();
						return false;
					}
					var dmonthPaymentDate = parseInt(paymentDate.substring(0, 2), 10);
					var ddayPaymentDate = parseInt(paymentDate.substring(3, 5), 10);
					var dyearPaymentDate = parseInt(paymentDate.substring(6, 10), 10);					
					if (isNaN(dmonthPaymentDate) || dmonthPaymentDate < 1 || dmonthPaymentDate > 12 || isNaN(ddayPaymentDate) || ddayPaymentDate < 1 || ddayPaymentDate > 31 || paymentDate.substring(2, 3)!="/" || paymentDate.substring(5, 6)!="/"|| isNaN(dyearPaymentDate) || dyearPaymentDate < 2010)
					{
						alert("Please enter a valid Payment date (from 01/01/2010 onwards) and on or after the remittance date (if provided).");
						
						return false;
					}
					if(form.PaymentDateHidden.value != ""){
						if(dyearPaymentDate < dyearRemittanceDate){
							alert("Please enter a valid Payment date (from 01/01/2010 onwards) and on or after the remittance date (if provided).");
							//form.PaymentDateHidden.select();
							return false;
						}
						if((dmonthPaymentDate < dmonthRemittanceDate) && (dyearPaymentDate==dyearRemittanceDate)){
							alert("Please enter a valid date (from 01/01/2010 onwards) and on or after the remittance date (if provided).");
							//form.PaymentDateHidden.select();
							return false;
						}
						/*if((dmonthPaymentDate == dmonthRemittanceDate) && (ddayPaymentDate<=ddayRemittanceDate) && (dyearPaymentDate==dyearRemittanceDate)){
							alert("Please enter a valid date (from 01012010 onwards) and on or after the remittance date (if provided).");
							form.Paymentdate.select();
							return false;
						}*/
					}			
				}
				if(form.RemittanceAmount != null && form.RemittanceAmount != undefined){
					var remittanceAmountNumericVal = form.RemittanceAmount.value;
					remittanceAmountNumericVal = remittanceAmountNumericVal.replace(/\$/g,"");
					remittanceAmountNumericVal = remittanceAmountNumericVal.replace(/\,/g,"");
					
					var isRemittanceAmountNumeric = IsDecimal(remittanceAmountNumericVal);
					
					
					if(remittanceAmountNumericVal == "" || remittanceAmountNumericVal <=0.0 || !isRemittanceAmountNumeric){
						alert("Please enter a value other than $0.");
						form.RemittanceAmount.focus();
						return false;
					}
					form.RemittanceAmount.value = remittanceAmountNumericVal;
				}
			}
		}
		if(form.Credit != null && form.Credit != undefined){
			if(form.Credit.checked == true){
				
				if(form.CreditAmount != null && form.CreditAmount != undefined){			
					var creditAmountVal = form.CreditAmount.value;
					creditAmountVal = creditAmountVal.replace(/\$/g,"");
					creditAmountVal = creditAmountVal.replace(/\,/g,"");
					
					var iscreditAmountValNumeric = IsDecimal(creditAmountVal);
					

					if(creditAmountVal == "" || creditAmountVal <=0.0 || !iscreditAmountValNumeric){
						alert("Please enter a value other than $0.");
						form.CreditAmount.focus();
						return false;
					}						
					form.CreditAmount.value = creditAmountVal;
					form.RemittanceAmount.value = creditAmountVal;	
					
				}
				if(form.CreditDateHidden != null && form.CreditDateHidden != undefined){
					if(form.CreditDateHidden.value == ""){
						alert("Please enter a valid Credit date (from 01/01/2010 onwards).");
						//form.CreditDate.focus();
						return false;
					}
					var creditDate = form.CreditDateHidden.value;
					if(!isDate(creditDate)){
						alert("Please enter a valid Credit date (from 01/01/2010 onwards).")
						
						return false;
					}
					var dmonthCreditDate = parseInt(creditDate.substring(0, 2), 10);
					var ddayCreditDate = parseInt(creditDate.substring(3, 5), 10);
					var dyearCreditDate = parseInt(creditDate.substring(6, 10), 10);
					if (isNaN(dmonthCreditDate) || dmonthCreditDate < 1 || dmonthCreditDate > 12 || isNaN(ddayCreditDate) || ddayCreditDate < 1 || ddayCreditDate > 31 || creditDate.substring(2, 3)!="/" || creditDate.substring(5, 6)!="/"|| isNaN(dyearCreditDate)|| dyearCreditDate < 2010)
					{
						alert("Please enter a valid Credit date (from 01/01/2010 onwards).");
						//form.CreditDate.focus();
						return false;
					}
					form.PaymentDateHidden.value = form.CreditDateHidden.value;					
				}	
			}
		}		
		return true;
	}
	function paymentEditTransactionSubmit(form){
		var dmonthRemittanceDate = "";
		var ddayRemittanceDate = "";
		var dyearRemittanceDate = "";	
		if(form.Payment1 != null && form.Payment1 != undefined){
			if(form.Payment1.checked == true){
				if(form.RemittanceDateEditHidden != null && form.RemittanceDateEditHidden != undefined){							
					if(form.RemittanceDateEditHidden.value != ""){
						var remittanceDate= form.RemittanceDateEditHidden.value
						if(!isDate(remittanceDate)){
							alert("Please enter a valid Remittance date (from 01/01/2010 onwards).")							
							return false;
						}
						dmonthRemittanceDate = parseInt(remittanceDate.substring(0, 2), 10);
						ddayRemittanceDate = parseInt(remittanceDate.substring(3, 5), 10);
						dyearRemittanceDate = parseInt(remittanceDate.substring(6, 10), 10);
						if (isNaN(dmonthRemittanceDate) || dmonthRemittanceDate < 1 || dmonthRemittanceDate > 12 || isNaN(ddayRemittanceDate) || ddayRemittanceDate < 1 || ddayRemittanceDate > 31 || remittanceDate.substring(2, 3)!="/" || remittanceDate.substring(5, 6)!="/"|| isNaN(dyearRemittanceDate) || dyearRemittanceDate < 2010)
						{
							alert("Please enter a valid Remittance date (from 01/01/2010 onwards).");							
							return false;
						}
					}
				}
				if(form.PaymentDateEditHidden != null && form.PaymentDateEditHidden != undefined){
					if(form.PaymentDateEditHidden.value == ""){
						alert("Please enter a valid Payment date (from 01/01/2010 onwards) and on or after the remittance date (if provided).");						
						return false;
					}
					var paymentDate = form.PaymentDateEditHidden.value;
					if(!isDate(paymentDate)){
						alert("Please enter a valid Payment date (from 01/01/2010 onwards) and on or after the remittance date (if provided).")						
						return false;
					}
					var dmonthPaymentDate = parseInt(paymentDate.substring(0, 2), 10);
					var ddayPaymentDate = parseInt(paymentDate.substring(3, 5), 10);
					var dyearPaymentDate = parseInt(paymentDate.substring(6, 10), 10);
					if (isNaN(dmonthPaymentDate) || dmonthPaymentDate < 1 || dmonthPaymentDate > 12 || isNaN(ddayPaymentDate) || ddayPaymentDate < 1 || ddayPaymentDate > 31 || paymentDate.substring(2, 3)!="/" || paymentDate.substring(5, 6)!="/"|| isNaN(dyearPaymentDate) || dyearPaymentDate < 2010)
					{
						alert("Please enter a valid Payment date (from 01/01/2010 onwards).");					
						return false;
					}
					if(form.RemittanceDateEditHidden.value != ""){
						if(dyearPaymentDate < dyearRemittanceDate){
							alert("Please enter a valid Remittance date (from 01/01/2010 onwards)");
							form.Paymentdate1.select();
							return false;
						}
						if((dmonthPaymentDate < dmonthRemittanceDate) && (dyearPaymentDate==dyearRemittanceDate)){
							alert("Please enter a valid Remittance date (from 01/01/2010 onwards).");
							//form.Paymentdate1.select();
							return false;
						}
						if((dmonthPaymentDate == dmonthRemittanceDate) && (ddayPaymentDate<ddayRemittanceDate) && (dyearPaymentDate==dyearRemittanceDate)){
							alert("Please enter a valid Remittance date (from 01/01/2010 onwards).");
							//form.Paymentdate1.select();
							return false;
						}	
					}				
				}
				if(form.RemittanceAmount1 != null && form.RemittanceAmount1 != undefined){		
					var remittanceAmount = form.RemittanceAmount1.value;
					remittanceAmount = remittanceAmount.replace(/\$/g,"");
					remittanceAmount = remittanceAmount.replace(/\,/g,"");
					
					var isRemittanceAmountValNumeric = IsDecimal(remittanceAmount);
					
					if(remittanceAmount == "" || remittanceAmount <=0.0 || !isRemittanceAmountValNumeric){
						alert("Please enter a value other than $0.");
						form.RemittanceAmount1.focus();
						return false;
					}
					form.RemittanceAmount1.value = remittanceAmount;
				}
			}
		}
		if(form.Credit1 != null && form.Credit1 != undefined){
			if(form.Credit1.checked == true){
				if(form.CreditDateEditHidden != null && form.CreditDateEditHidden != undefined){
					if(form.CreditDateEditHidden.value == ""){
						alert("Please enter a valid Credit date (from 01/01/2010 onwards).");
						
						return false;
					}
					var creditDate = form.CreditDateEditHidden.value;
					if(!isDate(creditDate)){
						alert("Please enter a valid Credit date (from 01/01/2010 onwards).")
					
						return false;
					}
					var dmonthCreditDate = parseInt(creditDate.substring(0, 2), 10);
					var ddayCreditDate = parseInt(creditDate.substring(3, 5), 10);
					var dyearCreditDate = parseInt(creditDate.substring(6, 10), 10);
					if (isNaN(dmonthCreditDate) || dmonthCreditDate < 1 || dmonthCreditDate > 12 || isNaN(ddayCreditDate) || ddayCreditDate < 1 || ddayCreditDate > 31 || creditDate.substring(2, 3)!="/" || creditDate.substring(5, 6)!="/"|| isNaN(dyearCreditDate)|| dyearCreditDate < 2010)
					{
						alert("Please enter a valid Credit date (from 01/01/2010 onwards).");
						
						return false;
					}
					form.PaymentDateEditHidden.value = form.CreditDateEditHidden.value;					
				}	
				if(form.CreditAmount1 != null && form.CreditAmount1 != undefined){		
					var creditAmountVal = form.CreditAmount1.value;
					creditAmountVal = creditAmountVal.replace(/\$/g,"");
					creditAmountVal = creditAmountVal.replace(/\,/g,"");
					
					var isCreditAmountNumeric = IsDecimal(creditAmountVal);
					if(creditAmountVal == "" || creditAmountVal <=0.0 || !isCreditAmountNumeric){
						alert("Please enter a value other than $0.");
						form.CreditAmount1.focus();
						return false;
					}					
					form.CreditAmount1.value = creditAmountVal;
					form.RemittanceAmount1.value = creditAmountVal;			
				}
			}
		}		
		form.action="/UpdateBillingPaymentTransactionActionNonBTA.go";
		return true;
	}
	function loadPolicyPaymentTab(id){
		activateQuoteTabs(id);
		if(document.getElementById('policyDivTable') != null && document.getElementById('policyDivTable') != undefined){
			document.getElementById('policyDivTable').style.display='block';
		}
		document.getElementById("PolicyDetaildiv").style.display = "none";
		document.getElementById('PolicyDiv').style.display='none';	
		document.getElementById("SavePolicydetaildiv").style.display = "none";	
		document.getElementById('Payment').style.display='block';
		activatePaymentSubTabs('PaymentLogTab');
		document.getElementById('EditPaymentDiv').style.display='none';	
		document.getElementById('paymenttrans').style.display='none';
		document.getElementById('paymentloginfo').style.display='block';	
		document.getElementById("PaymentPlanTrans").style.display="block";		
	}
	
	function LoadClassList(TabId){
		document.getElementById("policyDivTable").style.display="block";
			activateQuoteTabs(TabId);
	 		var locationListArraySize = 0;	 
	 		var policyId    = document.getElementById("policyId").value;
			var policyVerId = document.getElementById("policyVerId").value;		
			var agencyId = document.getElementById("agencyId").value;
	 		var ownerId = document.getElementById("ownerId").value;
			var custId = document.getElementById("custId").value;
			
	 		var pars = 'answer(PolicyId)='+policyId+'&answer(PolicyVerId)='+policyVerId+'&answer(OwnerId)='+ownerId;
	 				
	 		var url = '../GetPolicyClassList.do?'+pars;	
	    
	    	var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
	    	 autologout();
			 new Ajax.Request(url, 
		 	{method: 'post',parameters:pars2,
				asynchronous:true,
				onFailure:function(){},
				onException:function(){},
				onComplete:function(transport){
			 		 enableTabs();
			 		 document.getElementById("PolicyDiv").style.display = "block";
			 	},onSuccess: function(transport){	
			 	document.getElementById("PolicyDiv").innerHTML = "";		 	
			 	document.getElementById("PolicyDiv").innerHTML= transport.responseText;
			 	document.getElementById("PolicyInformationDiv").style.display="none";
			 	document.getElementById("PolicyInformationDivContent").style.display="none";
			 	document.getElementById("Payment").style.display="none";
			 	if(document.getElementById("paymentSuccess") != null && document.getElementById("paymentSuccess") !=undefined){
			 		document.getElementById("paymentSuccess").innerHTML="";
				}
				if(document.getElementById("paymentFailure") != null && document.getElementById("paymentFailure") !=undefined){
			 		document.getElementById("paymentFailure").innerHTML="";
				}
			 	openTabClassesId = "";
			 	}
			}
			);
	}

	function loadPolicyExclusionTab(TabId){
			document.getElementById("policyDivTable").style.display="block";
			activateQuoteTabs(TabId);
			var locationListArraySize = 0;	 
	 		var locationListArraySize = 0;	 	 	
		 	var policyId    = document.getElementById("policyId").value;
			var policyVerId = document.getElementById("policyVerId").value;
			var productVerId  = document.getElementById("productVerId").value;
			var agencyId = document.getElementById("agencyId").value;
		 	var ownerId = document.getElementById("ownerId").value;
			var custId = document.getElementById("custId").value; 	
			var subQuoteVerId = document.getElementById("subQuoteVerId").value;
		 	
		 	var pars = 'answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=POLICY_APPLICATION&answer(objectName)=POLICYEXCLUSION&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplicationQuoteSummary3.0.go?&answer(isApplicationEnabled)=N&answer(riskTerritory)=&answer(ObjectType)=POLICY&answer(objectType)=POLICY&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
		 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(PolicyId)='+policyId+'&answer(CustomerId)='+custId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(PolicyVerId)='+policyVerId+'&answer(SubQuoteVerId)='+subQuoteVerId;
		 				
		 	var url = '../DisplayApplication3.0.do?'+pars;	
		    
		    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
		    autologout();
			new Ajax.Request(url,{method: 'post',parameters:pars2,asynchronous:true,onFailure:function(){},onException:function(){},onComplete:function(transport){enableTabs(); document.getElementById("PolicyDiv").style.display = "block";},
			onSuccess: function(transport){
			document.getElementById("PolicyDiv").innerHTML = "";
			addNewLine = "<table><tr><td>&nbsp;</td></tr>"; // For Add a new line in the top of the application
			document.getElementById("PolicyDiv").innerHTML= addNewLine + transport.responseText;
			document.getElementById("Application").className="";
			document.getElementById("PolicyInformationDiv").style.display = "none";
			document.getElementById("Payment").style.display = "none";
			document.getElementById("PolicyInformationDivContent").style.display = "none";
			if(document.getElementById("paymentSuccess") != null && document.getElementById("paymentSuccess") !=undefined){
		 		document.getElementById("paymentSuccess").innerHTML="";
			}
			if(document.getElementById("paymentFailure") != null && document.getElementById("paymentFailure") !=undefined){
		 		document.getElementById("paymentFailure").innerHTML="";
			}
			document.getElementById("PolicyInformationDivContent").innerHTML = ""}});	
		}

		// Policy Information tab script
		
		function loadPolicyInformationTab(TabId){
			activateQuoteTabs(TabId);
			document.getElementById("PolicyDiv").style.display="none";
			document.getElementById("PolicyInformationDiv").style.display="block";
			document.getElementById("PolicyInformationDivContent").style.display="block";
			document.getElementById("PolicyDiv").innerHTML = document.getElementById("PolicyInformationDiv").innerHTML;
			//document.getElementById("ClassListDiv").style.display="none";
			//document.getElementById("DocumentDiv").style.display="none";
			document.getElementById("policyDivTable").style.display="none";
			document.getElementById("Payment").style.display = "none";
			if(document.getElementById("paymentSuccess") != null && document.getElementById("paymentSuccess") !=undefined){
		 		document.getElementById("paymentSuccess").innerHTML="";
			}
			if(document.getElementById("paymentFailure") != null && document.getElementById("paymentFailure") !=undefined){
		 		document.getElementById("paymentFailure").innerHTML="";
			}
			LoadPolicyDefinitionTab('Pol_Definition_Row');
		}
		
		var subjectivyEnable='';
		if(document.getElementById('SubjectivityError')!=null && document.getElementById('SubjectivityError')!=undefined){
			subjectivyEnable = document.getElementById('SubjectivityError').value;
		}
		if(subjectivyEnable == 'YES') {
			loadSubjectivityTab('SubjectivityTab');refreshPolicyPreBind();refreshPolicyPostBind();refereshMultiAttachmentList('<%=""+parentQuoteId %>','<%=""+ownerId %>','Subjectivity');refereshMultiNotesList('<%=""+parentQuoteId %>','<%=""+ownerId %>','Subjectivity');
		}

		/*
		var dfaultPolicyTab ='';
		if(document.getElementById("dfaultPolicyTab")!=null && document.getElementById("dfaultPolicyTab")!=undefined){
			dfaultPolicyTab=document.getElementById("dfaultPolicyTab").value;
		}
		if(subjectivyEnable == 'YES') {
			dolphintabs.init('<%=headerName%>',5);
		}else if(dfaultPolicyTab == "DOCUMENTS"){
			dolphintabs.init('<%=headerName%>',2);
		}else if(dfaultPolicyTab == "SUBJECTIVITY"){
			dolphintabs.init('<%=headerName%>',5);
		}else if(issueEndo.dolTabDisplay.value=='N'){
			dolphintabs.init('<%=headerName%>',0);
		}else if(issueEndo.dolTabDisplay.value=='Y'){
			dolphintabs.init('<%=headerName%>',6);
		}else{
			dolphintabs.init('<%=headerName%>',0);
		}*/
		function disableEndorseAdd(){
		document.getElementById("EndorseAddSubmit").disabled = true;	
		}


		 function activateQuoteTabs(activateId){		
		 activeTabName1 = "";
		  /*  if(document.getElementById("PoliciesTab") != undefined){
		    	document.getElementById("PoliciesTab").disabled = true;
		    }
		   
		 	if(document.getElementById("CoveragesLimitsTab") != undefined){
		 		document.getElementById("CoveragesLimitsTab").disabled = true;
		 	}
		 	if(document.getElementById("PolicyInformationTab") != undefined){
		 		document.getElementById("PolicyInformationTab").disabled = true;
		 	}
		 	if(document.getElementById("PolicyExclusionTab") != undefined){
		 		document.getElementById("PolicyExclusionTab").disabled = true;
		 	}
		 	if(document.getElementById("ClassHazardsTab") != undefined){
		 		document.getElementById("ClassHazardsTab").disabled = true;
		 	}
		 	if(document.getElementById("ClassBenefits_Row") != undefined){
		 		document.getElementById("ClassBenefits_Row").disabled = true;
		 	}*/
		 	
		 	if(document.getElementById("PoliciesTab") != undefined){
		 	document.getElementById("PoliciesTab").className = "todotab_inactive";
		 	}
		 	if(document.getElementById("CoveragesLimitsTab") != undefined){
		 	document.getElementById("CoveragesLimitsTab").className = "todotab_inactive";
		 	}
		 	if(document.getElementById("PolicyInformationTab") != undefined){
		 	document.getElementById("PolicyInformationTab").className = "todotab_inactive";
		 	}
		 	if(document.getElementById("PolicyExclusionTab") != undefined){
		 	document.getElementById("PolicyExclusionTab").className = "todotab_inactive";
		 	}
		 	if(document.getElementById("ClassHazardsTab") != undefined){
		 	document.getElementById("ClassHazardsTab").className = "todotab_inactive";
			}
		 	if(document.getElementById("ClassBenefits_Row") != undefined){
		 	document.getElementById("ClassBenefits_Row").className = "todotab_inactive";
		 	}
		 	if(document.getElementById("EndorsementTab") != undefined){
		 	document.getElementById("EndorsementTab").className = "todotab_inactive";
		 	}
		 	if(document.getElementById("PaymentTab") != undefined){
		 	 	document.getElementById("PaymentTab").className = "todotab_inactive";
	 	 	}
		 	document.getElementById(activateId).className = "todotab_active";		
		 }	
		 
		 function activatePaymentSubTabs(activateId){
			 if(document.getElementById("AddPaymentTab") != undefined){
				 	document.getElementById("AddPaymentTab").className = "todotab_inactive";
			}

			 if(document.getElementById("PaymentLogTab") != undefined){
				 	document.getElementById("PaymentLogTab").className = "todotab_inactive";
			}	
			 document.getElementById(activateId).className = "todotab_active";		
		 }
		
			
			function loadSubjectivityTab(subjectivityIdTab){
				activateQuoteTabs(subjectivityIdTab);		
				document.getElementById("PolicyDiv").innerHTML = document.getElementById("SubjectivityDiv").innerHTML;		
				enableTabs();
			}
			

			
			function loadPolicySummaryTab(policySummaryTab){
				document.getElementById("policyDivTable").style.display="block";
				activateQuoteTabs(policySummaryTab);
				var parentQuoteId    = document.getElementById("parentQuoteId").value;
				var policyId    = document.getElementById("policyId").value;
				var policyVerId = document.getElementById("policyVerId").value;
				var productVerId  = document.getElementById("productVerId").value;
				var productId  = document.getElementById("productId").value;
				
				var pars = 'answer(policyId)='+policyId+'&answer(policyVerId)='+policyVerId+'&answer(productId)='+productId+'&answer(productVerId)='+productVerId+
							'&answer(parentQuoteId)='+parentQuoteId+'&answer(riskState)=&answer(queryString)=POLICY_SUMMARY_TAB_ALGORITHM';
				
				var url = '../getDynamicPolicySummaryContentWithnoPremium.do?';
							
				new Ajax.Request(url, 
			 	{method: 'post',parameters:pars,
					asynchronous:true,
					onFailure:function(){},
					onException:function(){},
					onComplete:function(transport){
				 		enableTabs();
				 	},onSuccess: function(transport){	
				 	document.getElementById("PolicyDiv").style.display = "inline";
				 	document.getElementById("PolicyDiv").innerHTML= transport.responseText;
				 	document.getElementById("PolicyInformationDiv").style.display = "none";
				 	document.getElementById("PolicyInformationDivContent").style.display = "none";
				 	document.getElementById("Payment").style.display = "none";
				 	if(document.getElementById("paymentSuccess") != null && document.getElementById("paymentSuccess") !=undefined){
				 		document.getElementById("paymentSuccess").innerHTML="";
					}
					if(document.getElementById("paymentFailure") != null && document.getElementById("paymentFailure") !=undefined){
				 		document.getElementById("paymentFailure").innerHTML="";
					}
				 	}
				}
			);
			}
			var activeTabName1 = "";	
			function doSpecificSuccessAction(transport){
				if(YAHOO.example.container.dialog4 != 'undefined' && YAHOO.example.container.dialog4 != null){
					YAHOO.example.container.dialog4.cancel();
					YAHOO.example.container.dialog4.modal = false;
				}
			 }
			 function showFillInFormPopUp(appId,appVerId,polDocId,docId,docVerId,title,editionDate){
			    var customerId1 = document.getElementById("custId").value;
			    var agencyId1 = document.getElementById("agencyId").value;
			    var prodId1 = document.getElementById("productId").value;
			    var productVerId1 = document.getElementById("productVerId").value;
			    var ownerId1 = document.getElementById("ownerId").value;
			   	var policyId = document.getElementById("policyId").value;
			   	var policyVerId = document.getElementById("policyVerId").value;
			   	
			 	var clearnceStatus = "";
			 	if(document.getElementById("clearnceStatus1") != undefined){
			 		clearnceStatus = document.getElementById("clearnceStatus1").value;
			 	}
				var actionName =  escape("/saveQuoteEILRiskApplicationAction3.0.go?");
				editionDate = editionDate+" "+title
				
			 	var pars = 'answer(productId)='+prodId1+'&answer(productVerId)='+productVerId1+'&answer(applicationId)='+appId+'&answer(applicationVerId)='+appVerId+
			 				'&answer(Object::Customer::CustomerId)='+customerId1+'&answer(ownerId)='+ownerId1+'&answer(Object::Document::Manuscript::Endorsement::PolicyDocId)='+polDocId+
			 				'&answer(Object::Application::ApplicationType)=POLICY_APPLICATION&answer(Object::Agency::AgencyId)='+agencyId1+'&answer(policyId)='+policyId+'&answer(policyVerId)='+policyVerId+
			 				'&answer(actionName)='+actionName+'&answer(documentType)=QUOTE_DOCUMENT&answer(Object::Document::Manuscript::Endorsement::DocumentId)='+docId+'&answer(Object::Document::Manuscript::Endorsement::DocumentVerId)='+docVerId+
			 				'&answer(DisplayValue_Object::Document::DocumentHeading)='+editionDate+'&answer(DisplayValue_Object::Document::EditionDate)='+editionDate+'&answer(DisplayValue_Object::Document::Title)='+title;
			 	var url = "../GetDocumentApplication.do?";
			 				
			 	new Ajax.Request(url, 
				 	{method: 'post',
						asynchronous:true,parameters:pars,
						onFailure:function(){},
						onException:function(){},
						onComplete:function(transport){
					 	},onSuccess: function(transport){	
					 	YAHOO.example.container.dialog4.show();
						document.getElementById("Documentheading").innerHTML = ""+title;
						document.getElementById("DocumentPopUp").style.display = "block";	
						document.getElementById("DocumentPopUpBody").innerHTML = transport.responseText;
						YAHOO.util.Event.on('closeIcon3', 'click', function(e) {
				 
					 	YAHOO.example.container.dialog4.cancel();
					 	document.getElementById("DocumentPopUpBody").innerHTML = " ";
					 	document.getElementById("DocumentPopUp").style.display = "none";	
					 	
					 })
					 
					  YAHOO.util.Event.on('CancelRisk1', 'click', function(e) {
					 
					 	YAHOO.example.container.dialog4.cancel();
					 	document.getElementById("DocumentPopUpBody").innerHTML = " ";
					 	document.getElementById("DocumentPopUp").style.display = "none";	
					 	
					 })
					 
					 	}
					}
				);	
			 	
			 	}
			 function setPaymentFields(val){
					if(val == "3::Credit"){
						document.getElementById("CreditDateTr").style.display = "";
						document.getElementById("CreditAmountTr").style.display = "";
						document.getElementById("RemittanceDateTr").style.display = "none";
						document.getElementById("PaymentDateTr").style.display = "none";
						document.getElementById("RemittanceAmountTr").style.display = "none";
						document.getElementById("PartialFullTr").style.display = "none";

						document.getElementById("RemittanceDate").value = "";
						document.getElementById("PaymentDateHidden").value = "";
						document.getElementById("RemittanceAmount").value = "";
						document.getElementById("Partial_Y").checked = "false";
						document.getElementById("Partial_N").checked = "false";
						document.getElementById("Partial_N").value = "";
					}else{
						document.getElementById("RemittanceDateTr").style.display = "";
						document.getElementById("PaymentDateTr").style.display = "";
						document.getElementById("RemittanceAmountTr").style.display = "";
						document.getElementById("PartialFullTr").style.display = "";
						document.getElementById("CreditDateTr").style.display = "none";
						document.getElementById("CreditAmountTr").style.display = "none";
						document.getElementById("CreditDate").value = "";
						document.getElementById("CreditAmount").value = "";
						document.getElementById("Partial_Y").checked = "block";
						document.getElementById("Partial_N").value = "";
					}

				}
				function deletePayment(deleteType){
					var conf = "";
					if(deleteType == "delete"){
						conf = window.confirm('Do you really want to delete this transaction?');
						document.paymentTransactionFrm2.isVoid.value="";
					}else{
						conf = window.confirm('Do you really want to VOID this transaction?');
						document.paymentTransactionFrm2.isVoid.value="Y";
					}							
					  if(conf){
						  var remittanceAmount = document.paymentTransactionFrm2.RemittanceAmount1.value;
						  remittanceAmount = remittanceAmount.replace(/\$/g,"");
						  remittanceAmount = remittanceAmount.replace(/\,/g,"");
						  document.paymentTransactionFrm2.RemittanceAmount1.value =remittanceAmount;
						  
						  var creditAmountVal = document.paymentTransactionFrm2.CreditAmount1.value;
						  creditAmountVal = creditAmountVal.replace(/\$/g,"");
						  creditAmountVal = creditAmountVal.replace(/\,/g,"");
						  document.paymentTransactionFrm2.CreditAmount1.value =creditAmountVal; 
						  
						  document.paymentTransactionFrm2.action="/deletePaymentActionNonBTA.do";		 
						  document.paymentTransactionFrm2.submit(); 	
						  
					  }else {
						  return false;
					  }	
					
				}
				function confirmAddTransactionPayment(){
					 var conf = window.confirm('Do you want to save your changes?');
					  if(conf){		  
						  var result = paymentTransactionSubmit(document.paymentTransactionFrm1);
						  if(result == true){
						 	document.paymentTransactionFrm1.submit(); 
						 }
					  }else {
						  	activatePaymentSubTabs('PaymentLogTab');
							activateQuoteTabs('PaymentTab');
							document.getElementById('PolicyDiv').style.display='none';
							document.getElementById('paymentloginfo').style.display='block';
							document.getElementById("PaymentPlanTrans").style.display="block";
							document.getElementById('paymenttrans').style.display='none';
							document.getElementById('EditPaymentDiv').style.display='none';
							document.getElementById('Payment').style.display='block';
						 	return false;
					  }	
					
				}
				function setPaymentFields1(val){
					if(document.getElementById("Credit1").checked == true){
						
						document.getElementById("CreditDateTr1").style.display = "";
						document.getElementById("CreditAmountTr1").style.display = "";
						document.getElementById("RemittanceDateTr1").style.display = "none";
						document.getElementById("PaymentDateTr1").style.display = "none";
						document.getElementById("RemittanceAmountTr1").style.display = "none";
						document.getElementById("PartialFullTr1").style.display = "none";
						document.getElementById("RemittanceDate1").value = "";
						document.getElementById("PaymentDateEditHidden").value = "";
						document.getElementById("RemittanceAmount1").value = "";
						document.getElementById("Partial_Y1").checked = "false";
						document.getElementById("Partial_N1").checked = "false";
						document.getElementById("Partial_N1").value = "";
					}else{
					
						document.getElementById("RemittanceDateTr1").style.display = "";
						document.getElementById("PaymentDateTr1").style.display = "";
						document.getElementById("RemittanceAmountTr1").style.display = "";
						document.getElementById("PartialFullTr1").style.display = "";
						document.getElementById("CreditDateTr1").style.display = "none";
						document.getElementById("CreditAmountTr1").style.display = "none";
						document.getElementById("CreditDate1").value = "";
						document.getElementById("CreditAmount1").value = "";
						document.getElementById("Partial_N1").value = "Full";
					}

				}

				function confirmReturnPayment(){
				  var conf = window.confirm('are you sure?');
				  if(conf){	 	   
					   var result = paymentEditTransactionSubmit(document.paymentTransactionFrm2);
				 	   if(result==true){	
				 	   		document.paymentTransactionFrm2.action="/UpdateBillingPaymentTransactionActionNonBTA.go";
				 	   		document.paymentTransactionFrm2.submit();
				 	   }
				  }else {
					 	activatePaymentSubTabs('PaymentLogTab');
						activateQuoteTabs('PaymentTab');
						document.getElementById('PolicyDiv').style.display='none';
						document.getElementById('paymentloginfo').style.display='block';
						document.getElementById("PaymentPlanTrans").style.display="block";
						document.getElementById('paymenttrans').style.display='none';
						document.getElementById('EditPaymentDiv').style.display='none';
						document.getElementById('Payment').style.display='block';
					  	return false;
				  }	
				 
				}
				
				function sendEmailDetails(){
					var ownerId=document.getElementById('ownerIdfrmjsp').value;
					var objId=document.getElementById('parentQuoteId').value;
					var ObjectVerId=document.getElementById('parentQuoteVerId').value;
					//var objType=document.getElementById('ownerId').value;
					var SubQuoteVerId=document.getElementById('subQuoteVerId').value;
					var QuoteStatus=document.getElementById('paretQuoteStatus').value;
					var EmailType= "QUOTE";// document.getElementById('EmailType').value;
					var QuoteNumber=document.getElementById('quoteNum').value;
					var QuoteSubNumber=document.getElementById('quoteSubNum').value;
					var PolicyNumber=document.getElementById('policyNumber').value;
					var email=document.getElementById('email').value;
					var roleName=document.getElementById('roleName').value;
					var CustomerName=document.getElementById('custname').value;


						var insName1 = CustomerName;
						insName1 = insName1.replace(/___/g,'"');
						var insNamedecripted = escape(insName1);	
						EmailPopup('../PrefilledEmailAction.do?answer(pagename)=email&answer(Object::Activity::OwnerId)='+ownerId+
						'&answer(Object::Notification::Email::ObjectId)='+objId+'&answer(Object::Notification::Email::InsuredName)='+insNamedecripted+
						'&answer(Object::Notification::UserDetail::Email)='+email+'&answer(Object::Notification::UserDetail::RoleName)='+roleName+
						'&answer(Object::Notification::Email::ObjectVerId)='+ObjectVerId+
						'&answer(Object::Notification::Email::ObjectType)='+EmailType+
						'&answer(Object::Notification::Email::NotificationType)=EMAIL&answer(Object::UserDetail::ownerId)='+ownerId+
						'&answer(Object::Notification::Email::SubQuoteVerId)='+SubQuoteVerId+
						'&answer(Object::Notification::Email::ObjectStatus)='+QuoteStatus+
						'&answer(Object::Notification::Email::EmailType)=POLICY&answer(Object::Notification::Email::QuoteStatus)='+QuoteStatus+
						'&answer(Object::Notification::Email::QuoteNumber)='+QuoteNumber+
						'&answer(Object::Notification::Email::QuoteSubNumber)='+QuoteSubNumber+
						'&answer(Object::Notification::Email::PolicyNumber)='+PolicyNumber,"Email");
						
					}
var documentPopUp=true;					
function initDocumentDialog(){
 	
	YAHOO.example.container.dialog4 = new YAHOO.widget.Dialog("DocumentPopUp", 
							{ width : "50em",
							  fixedcenter : true,
							  visible : false,
							  close:true,
							  modal:true,
							  constraintoviewport : true,
							  buttons : []
							});
	// Render the Dialog
	if(documentPopUp==true){
		YAHOO.example.container.dialog4.render();
		documentPopUp=false;
	}	
}
function showFillInFormPopUp(appId,appVerId,polDocId,docId,docVerId,title,editionDate,docTdId){
 	initDocumentDialog();
 	//isSpecificValidationNeeded = true;
    var customerId1 = document.getElementById("custId").value;
    var agencyId1 = document.getElementById("agencyId").value;
    var prodId1 = document.getElementById("productId").value;
    var productVerId1 = document.getElementById("productVerId").value;
    var ownerId1 = document.getElementById("ownerId").value;
   	var policyId = document.getElementById("policyId").value;
   	var policyVerId = document.getElementById("policyVerId").value;
   	
 	var clearnceStatus = "";
 	if(document.getElementById("clearnceStatus1") != undefined){
 		clearnceStatus = document.getElementById("clearnceStatus1").value;
 	}
	var actionName =  escape("/saveQuoteDocumentApplicationAction3.0.go?");
	title = escape(title);
	editionDate = editionDate+" "+title

 	var pars = 'answer(productId)='+prodId1+'&answer(productVerId)='+productVerId1+'&answer(applicationId)='+appId+'&answer(applicationVerId)='+appVerId+
 				'&answer(Object::Customer::CustomerId)='+customerId1+'&answer(ownerId)='+ownerId1+'&answer(Object::Document::Manuscript::Endorsement::PolicyDocId)='+polDocId+
 				'&answer(Object::Application::ApplicationType)=POLICY_APPLICATION&answer(Object::Agency::AgencyId)='+agencyId1+'&answer(policyId)='+policyId+'&answer(policyVerId)='+policyVerId+
 				'&answer(actionName)='+actionName+'&answer(documentType)=QUOTE_DOCUMENT&answer(Object::Document::Manuscript::Endorsement::DocumentId)='+docId+'&answer(Object::Document::Manuscript::Endorsement::DocumentVerId)='+docVerId+
 				'&answer(DisplayValue_Object::Document::DocumentHeading)='+editionDate+'&answer(DisplayValue_Object::Document::EditionDate)='+editionDate+'&answer(DisplayValue_Object::Document::Title)='+title+'&answer(Object::Doc::NewDocNameId)='+docTdId;
 	var url = "../GetDocumentApplication.do?";
 				
 	new Ajax.Request(url, 
	 	{method: 'post',
			asynchronous:true,parameters:pars,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 	},onSuccess: function(transport){	
		 	YAHOO.example.container.dialog4.show();
			document.getElementById("Documentheading").innerHTML = ""+unescape(title);
			document.getElementById("DocumentPopUp").style.display = "block";	
			document.getElementById("DocumentPopUpBody").innerHTML = transport.responseText;
			if(document.getElementById("submitButtonNew")!=null && document.getElementById("submitButtonNew")!='undefined'){
			document.getElementById("submitButtonNew").className="covsmallbutton"; 
			}
			if(document.getElementById("CancelRisk1")!=null && document.getElementById("CancelRisk1")!='undefined'){
			document.getElementById("CancelRisk1").className="covsmallbutton"; 
			}
			YAHOO.example.container.dialog4.show();
			YAHOO.util.Event.on('closeIcon3', 'click', function(e) {
	 
		 	YAHOO.example.container.dialog4.cancel();
		 	document.getElementById("DocumentPopUpBody").innerHTML = " ";
		 	document.getElementById("DocumentPopUp").style.display = "none";
		 	
		 })
		 
		  YAHOO.util.Event.on('CancelRisk1', 'click', function(e) {
		 
		 	YAHOO.example.container.dialog4.cancel();
		 	document.getElementById("DocumentPopUpBody").innerHTML = " ";
		 	document.getElementById("DocumentPopUp").style.display = "none";	
		 	
		 })
		 
		 	}
		}
	);	
 	
 	}	
 	
 	function validateNonBTAPolicyDetails(form){
 	
		if(form.InsuredName!=null && form.InsuredName!='undefined'){
			if(form.InsuredName.value==""){
				alert("Please enter the Insured Name");
				form.InsuredName.focus();
				return false;
			}
		}
		if(form.InsuredAddress1!=null && form.InsuredAddress1!='undefined'){
			if(form.InsuredAddress1.value==""){
				alert("Please enter the Insured Address");
				form.InsuredAddress1.focus();
				return false;
			}
		}
		if(form.City!=null && form.City!='undefined'){
			if(form.City.value==""){
				alert("Please enter the Insured City");
				form.City.focus();
				return false;
			}
		}
		if(form.State!=null && form.State!='undefined'){
			if(form.State.value==""){
				alert("Please enter the Insured State");
				form.State.focus();
				return false;
			}
		}
		if(form.Zip!=null && form.Zip!='undefined'){
			if(form.Zip.value==""){
				alert("Please enter the Insured Zip");
				form.Zip.focus();
				return false;
			}
		}
		if(form.PolicyNumberPrefix!=null && form.PolicyNumberPrefix!='undefined'){
			if(form.PolicyNumberPrefix.value==""){
				alert("Please enter the Policy Number Prefix");		
				form.PolicyNumberPrefix.focus();			
				return false;
			}
		}
		if(form.PolicyNumber!=null && form.PolicyNumber!='undefined'){
			if(form.PolicyNumber.value==""){
				alert("Please enter the Policy Number");
				form.PolicyNumber.focus();
				return false;
			}
			var isPolicyNumberNumeric = IsNumeric(form.PolicyNumber.value);
			if(!isPolicyNumberNumeric){
				alert("Please Enter Numeric value for Policy Number");
				form.PolicyNumber.focus();
				return false;
			}	
		}
		if(form.MasterPolicyType!=null && form.MasterPolicyType!='undefined'){
			if(form.MasterPolicyType.value==""){
				alert("Please enter the Master Policy Type");	
				form.MasterPolicyType.focus();					
				return false;
			}
		}
		
		if(form.SalesforceNumber!=null && form.SalesforceNumber!='undefined'){
			if(form.SalesforceNumber.value==""){
				alert("Please enter the SalesforceNumber");
				form.SalesforceNumber.focus();
				return false;
			}
		}
		if(form.TransactionDate!=null && form.TransactionDate!='undefined'){
			if(form.TransactionDate.value==""){
				alert("Please enter the TransactionDate");
				form.TransactionDate.focus();
				return false;
			}
			var vardate = form.TransactionDate.value			
			if(!isDate(vardate)){
				alert("Invalid TransactionDate")
				form.TransactionDate.focus();		
				return false;
			}			
			var dmonth = parseInt(vardate.substring(0, 2), 10);
			var dday = parseInt(vardate.substring(3, 5), 10);
			var dyear = parseInt(vardate.substring(6, 10), 10);
		
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
			{
				alert("Please enter date in 'MM/DD/YYYY' format");	
				form.TransactionDate.focus();			
				return false;
			}
		}
		if(form.policyEffectiveDate!=null && form.policyEffectiveDate!='undefined'){
			if(form.policyEffectiveDate.value==""){
				alert("Please enter the PolicyEffectiveDate");
				form.policyEffectiveDate.focus();
				return false;
			}
			var vardate = form.policyEffectiveDate.value			
			if(!isDate(vardate)){
				alert("Invalid PolicyEffectiveDate")	
				form.policyEffectiveDate.focus();		
				return false;
			}			
			var dmonth = parseInt(vardate.substring(0, 2), 10);
			var dday = parseInt(vardate.substring(3, 5), 10);
			var dyear = parseInt(vardate.substring(6, 10), 10);
		
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
			{
				alert("Please enter date in 'MM/DD/YYYY' format");
				form.policyEffectiveDate.focus();	
				return false;
			}
		}
		if(form.policyExpirationDate!=null && form.policyExpirationDate!='undefined'){
			if(form.policyExpirationDate.value==""){
				alert("Please enter the policyExpirationDate");
				form.policyExpirationDate.focus();
				return false;
			}
			var vardate = form.policyExpirationDate.value			
			if(!isDate(vardate)){
				alert("Invalid PolicyExpirationDate")	
				form.policyExpirationDate.focus();		
				return false;
			}			
			var dmonth = parseInt(vardate.substring(0, 2), 10);
			var dday = parseInt(vardate.substring(3, 5), 10);
			var dyear = parseInt(vardate.substring(6, 10), 10);
		
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
			{
				alert("Please enter date in 'MM/DD/YYYY' format");	
				form.policyEffectiveDate.focus();				
				return false;
			}
		}
		
		
		
		var effectiveDate=new Date(form.policyEffectiveDate.value);
		var expirationDate = new Date(form.policyExpirationDate.value);
		
		if(expirationDate<=effectiveDate){
			alert("Please enter valid policyExpirationDate");
			form.policyExpirationDate.focus();
			return false;	
		}
		
		if(form.WrittenPremium!=null && form.WrittenPremium!='undefined'){
			var WrittenPremiumNumericVal = form.WrittenPremium.value;
			WrittenPremiumNumericVal = WrittenPremiumNumericVal.replace(/\$/g,"");
			WrittenPremiumNumericVal = WrittenPremiumNumericVal.replace(/\,/g,"");
			
			var isWrittenPremiumNumeric = IsDecimal(WrittenPremiumNumericVal);
			
			
			if(WrittenPremiumNumericVal == "" || WrittenPremiumNumericVal <=0.0 || !isWrittenPremiumNumeric){
			    alert("Please enter valid Written Premium");
				form.WrittenPremium.focus();
				return false;
			}	
			if(WrittenPremiumNumericVal.indexOf(".")!=-1){
				var WrittenPremiumNumeric = WrittenPremiumNumericVal.split(".");						
				if(WrittenPremiumNumeric[0].length>15 || WrittenPremiumNumeric[1].length>2){
					alert("Please enter a valid WrittenPremium value.");
					form.WrittenPremium.focus();
					return false;
				}
			}else{
				if(WrittenPremiumNumericVal.length>15){
					alert("Please enter a valid WrittenPremium value.");
					form.WrittenPremium.focus();
					return false;
				}
			}	
			form.WrittenPremium.value = WrittenPremiumNumericVal;						
		}
		if(form.Commission!=null && form.Commission!='undefined'){
			var CommissionNumericVal = form.Commission.value;
			CommissionNumericVal = CommissionNumericVal.replace(/\$/g,"");
			CommissionNumericVal = CommissionNumericVal.replace(/\,/g,"");
			
			var isCommissionNumeric = IsDecimal(CommissionNumericVal);
			
			
			if(CommissionNumericVal == "" || CommissionNumericVal <=0.0 || !isCommissionNumeric){
				alert("Please enter valid Commission");
				form.Commission.focus();
				return false;
			}
			if(CommissionNumericVal.indexOf(".")!=-1){
				var CommissionNumeric = CommissionNumericVal.split(".");						
				if(CommissionNumeric[0].length>15 || CommissionNumeric[1].length>2){
					alert("Please enter a valid Commission value.");
					form.Commission.focus();
					return false;
				}
			}else{
				if(CommissionNumericVal.length>15){
					alert("Please enter a valid Commission value.");
					form.Commission.focus();
					return false;
				}
			}
			form.Commission.value = CommissionNumericVal;						
		}
		if(form.AttachmentPoint!=null && form.AttachmentPoint!='undefined'){
			var AttachmentPointVal = form.AttachmentPoint.value;
			AttachmentPointVal = AttachmentPointVal.replace(/\$/g,"");
			AttachmentPointVal = AttachmentPointVal.replace(/\,/g,"");
			
			var isAttachmentPointNumeric = IsDecimal(AttachmentPointVal);
			
			
			if(AttachmentPointVal == "" || AttachmentPointVal <0.0 || !isAttachmentPointNumeric){
				alert("Please enter valid Attachment Point");
				form.AttachmentPoint.focus();
				return false;
			}
			form.AttachmentPoint.value = AttachmentPointVal;						
		}
		if(form.PolicyLimit!=null && form.PolicyLimit!='undefined'){
			var PolicyLimitVal = form.PolicyLimit.value;
			PolicyLimitVal = PolicyLimitVal.replace(/\$/g,"");
			PolicyLimitVal = PolicyLimitVal.replace(/\,/g,"");
			
			var isPolicyLimitNumeric = IsDecimal(PolicyLimitVal);
			
			
			if(PolicyLimitVal == "" || PolicyLimitVal <=0.0 || !isPolicyLimitNumeric){
				alert("Please enter valid Policy Limit");
				form.PolicyLimit.focus();
				return false;
			}
			if(PolicyLimitVal.length>15){
					alert("Please enter a valid PolicyLimit value.");
					form.PolicyLimit.focus();
					return false;
			}			
			form.PolicyLimit.value = PolicyLimitVal;						
		}
		
		if(form.TaxState!=null && form.TaxState!='undefined'){
			if(form.TaxState.value==""){
				alert("Please enter the TaxState");
				form.TaxState.focus();
				return false;
			}
		}		
			
			if(form.LineOfBusiness!=null && form.LineOfBusiness!='undefined'){
				if(form.LineOfBusiness.value==""){
					alert("Please enter the Line Of Business");		
					form.LineOfBusiness.focus();			
					return false;
				}
			}
			if(form.Occupancies!=null && form.Occupancies!='undefined'){
				if(form.Occupancies.value==""){
					alert("Please enter the Occupancies");	
					form.Occupancies.focus();		
					return false;
				}
			}
			if(form.ProductCoverageType!=null && form.ProductCoverageType!='undefined'){
				if(form.ProductCoverageType.value==""){
					alert("Please enter the Product Coverage Type");	
					form.ProductCoverageType.focus();					
					return false;
				}
			}
			
			if(form.Rider!=null && form.Rider!='undefined'){
				if(document.getElementById("riderTR").style.display==""){
					if(form.Rider.value==""){
						alert("Please enter the Rider under Riders Link");	
						form.Rider.focus();					
						return false;
					}
				}
			}
			
			if(form.criticalIllnessPremium!=null && form.criticalIllnessPremium!='undefined'){
				var criticalIllnessPremiumVal = form.criticalIllnessPremium.value;
				criticalIllnessPremiumVal = criticalIllnessPremiumVal.replace(/\$/g,"");
				criticalIllnessPremiumVal = criticalIllnessPremiumVal.replace(/\,/g,"");
				if(form.criticalIllness.value=="Y"){
					var isCriticalIllnessPremiumNumeric = IsDecimal(criticalIllnessPremiumVal);
					if(criticalIllnessPremiumVal == "" || criticalIllnessPremiumVal <=0.0 || !isCriticalIllnessPremiumNumeric){
						alert("Please enter valid Critical Rider Premium under Riders Link");	
						form.criticalIllnessPremium.focus();						
						return false;
					}
				}
				if(criticalIllnessPremiumVal.indexOf(".")!=-1){
				var criticalIllnessPremiumNumeric = criticalIllnessPremiumVal.split(".");						
				if(criticalIllnessPremiumNumeric[0].length>15 || criticalIllnessPremiumNumeric[1].length>2){
					alert("Please enter a valid Critical Illness Premium.");
					form.criticalIllnessPremium.focus();
					return false;
				}
				}else{
				if(criticalIllnessPremiumVal.length>15){
					alert("Please enter a valid Critical Illness Premium.");
					form.criticalIllnessPremium.focus();
					return false;
				}
			}
				form.criticalIllnessPremium.value = criticalIllnessPremiumVal;						
			}
			
			if(form.warRiskPremium!=null && form.warRiskPremium!='undefined'){
				var warRiskPremiumVal = form.warRiskPremium.value;
				warRiskPremiumVal = warRiskPremiumVal.replace(/\$/g,"");
				warRiskPremiumVal = warRiskPremiumVal.replace(/\,/g,"");
				if(form.warRisk.value=="Y"){
					var isWarRiskPremiumNumeric = IsDecimal(warRiskPremiumVal);
					if(warRiskPremiumVal == "" || warRiskPremiumVal <=0.0 || !isWarRiskPremiumNumeric){
						alert("Please enter valid War Risk Rider Premium under Riders Link");	
						form.warRiskPremium.focus();						
						return false;
					}
				}
				if(warRiskPremiumVal.indexOf(".")!=-1){
				var warRiskPremiumNumeric = warRiskPremiumVal.split(".");						
				if(warRiskPremiumNumeric[0].length>15 || warRiskPremiumNumeric[1].length>2){
					alert("Please enter valid War Risk Rider Premium.");
					form.warRiskPremium.focus();
					return false;
				}
				}else{
				if(warRiskPremiumVal.length>15){
					alert("Please enter valid War Risk Rider Premium.");
					form.warRiskPremium.focus();
					return false;
				}
			}
				form.warRiskPremium.value = warRiskPremiumVal;						
			}
			
			if(form.AMEPrimaryPremium!=null && form.AMEPrimaryPremium!='undefined'){
				var AMEPrimaryPremiumVal = form.AMEPrimaryPremium.value;
				AMEPrimaryPremiumVal = AMEPrimaryPremiumVal.replace(/\$/g,"");
				AMEPrimaryPremiumVal = AMEPrimaryPremiumVal.replace(/\,/g,"");
				if(form.AMEPrimary.value=="Y"){
					var isAMEPrimaryPremiumNumeric = IsDecimal(AMEPrimaryPremiumVal);
					if(AMEPrimaryPremiumVal == "" || AMEPrimaryPremiumVal <=0.0 || !isAMEPrimaryPremiumNumeric){
						alert("Please enter valid AME Primary Rider Premium under Riders Link");	
						form.AMEPrimaryPremium.focus();						
						return false;
					}
				}
				if(AMEPrimaryPremiumVal.indexOf(".")!=-1){
					var AMEPrimaryPremiumNumeric = AMEPrimaryPremiumVal.split(".");						
					if(AMEPrimaryPremiumNumeric[0].length>15 || AMEPrimaryPremiumNumeric[1].length>2){
						alert("Please enter valid AME Primary Rider Premium.");
						form.AMEPrimaryPremium.focus();
						return false;
					}
					}else{
					if(AMEPrimaryPremiumVal.length>15){
						alert("Please enter valid AME Primary Rider Premium.");
						form.AMEPrimaryPremium.focus();
						return false;
					}
				}
				form.AMEPrimaryPremium.value = AMEPrimaryPremiumVal;						
			}
			
			if(form.AMEExcessPremium!=null && form.AMEExcessPremium!='undefined'){
				var AMEExcessPremiumVal = form.AMEExcessPremium.value;
				AMEExcessPremiumVal = AMEExcessPremiumVal.replace(/\$/g,"");
				AMEExcessPremiumVal = AMEExcessPremiumVal.replace(/\,/g,"");
				if(form.AMEExcess.value=="Y"){
					var isAMEExcessPremiumNumeric = IsDecimal(AMEExcessPremiumVal);
					if(AMEExcessPremiumVal == "" || AMEExcessPremiumVal <=0.0 || !isAMEExcessPremiumNumeric){
						alert("Please enter valid AME Excess Rider Premium under Riders Link");	
						form.AMEExcessPremium.focus();						
						return false;
					}
				}
				if(AMEExcessPremiumVal.indexOf(".")!=-1){
					var AMEExcessPremiumNumeric = AMEExcessPremiumVal.split(".");						
					if(AMEExcessPremiumNumeric[0].length>15 || AMEExcessPremiumNumeric[1].length>2){
						alert("Please enter valid AME Excess Rider Premium.");
						form.AMEExcessPremium.focus();
						return false;
					}
					}else{
					if(AMEExcessPremiumVal.length>15){
						alert("Please enter valid AME Excess Rider Premium.");
						form.AMEExcessPremium.focus();
						return false;
					}
				}
				form.AMEExcessPremium.value = AMEExcessPremiumVal;						
			}
			
			if(form.AMECOBPremium!=null && form.AMECOBPremium!='undefined'){
				var AMECOBPremiumVal = form.AMECOBPremium.value;
				AMECOBPremiumVal = AMECOBPremiumVal.replace(/\$/g,"");
				AMECOBPremiumVal = AMECOBPremiumVal.replace(/\,/g,"");
				if(form.AMECOB.value=="Y"){
					var isAMECOBPremiumNumeric = IsDecimal(AMECOBPremiumVal);
					if(AMECOBPremiumVal == "" || AMECOBPremiumVal <=0.0 || !isAMECOBPremiumNumeric){
						alert("Please enter valid AME COB Rider Premium under Riders Link");	
						form.AMECOBPremium.focus();						
						return false;
					}
				}
				if(AMECOBPremiumVal.indexOf(".")!=-1){
					var AMECOBPremiumNumeric = AMECOBPremiumVal.split(".");						
					if(AMECOBPremiumNumeric[0].length>15 || AMECOBPremiumNumeric[1].length>2){
						alert("Please enter valid AME COB Rider Premium.");
						form.AMECOBPremium.focus();
						return false;
					}
					}else{
					if(AMECOBPremiumVal.length>15){
						alert("Please enter valid AME COB Rider Premium.");
						form.AMECOBPremium.focus();
						return false;
					}
				}
				form.AMECOBPremium.value = AMECOBPremiumVal;						
			}
			
			if(form.aviationPremium!=null && form.aviationPremium!='undefined'){
				var aviationPremiumVal = form.aviationPremium.value;
				aviationPremiumVal = aviationPremiumVal.replace(/\$/g,"");
				aviationPremiumVal = aviationPremiumVal.replace(/\,/g,"");				
					if(form.aviation.value=="Y"){
						var isAviationPremiumNumeric = IsDecimal(aviationPremiumVal);
						if(aviationPremiumVal == "" || aviationPremiumVal <=0.0 || !isAviationPremiumNumeric){
							alert("Please enter valid Aviation Rider Premium under Riders Link");	
							form.aviationPremium.focus();						
							return false;
						}
					}
					if(aviationPremiumVal.indexOf(".")!=-1){
					var aviationPremiumNumeric = aviationPremiumVal.split(".");						
					if(aviationPremiumNumeric[0].length>15 || aviationPremiumNumeric[1].length>2){
						alert("Please enter valid Aviation Rider Premium.");
						form.aviationPremium.focus();
						return false;
					}
					}else{
					if(aviationPremiumVal.length>15){
						alert("Please enter valid Aviation Rider Premium.");
						form.aviationPremium.focus();
						return false;
					}
				}
				form.aviationPremium.value = aviationPremiumVal;						
			}
	
		if(form.AgentCommission!=null && form.AgentCommission!='undefined'){
				var AgentCommissionVal = form.AgentCommission.value;
				AgentCommissionVal = AgentCommissionVal.replace(/\%/g,"");
				AgentCommissionVal = AgentCommissionVal.replace(/\,/g,"");
				
				var isAgentCommissionNumeric = IsDecimal(AgentCommissionVal);
				
				
				if(AgentCommissionVal == "" || AgentCommissionVal <=0.0 || !isAgentCommissionNumeric){
					alert("Please enter valid AgentCommissionPercent");
					form.AgentCommission.focus();
					return false;
				}
				if(AgentCommissionVal.indexOf(".")!=-1){
					var AgentCommissionNumeric = AgentCommissionVal.split(".");						
					if(AgentCommissionNumeric[0].length>3 || AgentCommissionNumeric[1].length>4){
						alert("Please enter a valid AgentCommission value.");
						form.AgentCommission.focus();
						return false;
					}
				}else{
					if(AgentCommissionVal.length>3){
						alert("Please enter a valid AgentCommission value.");
						form.AgentCommission.focus();
						return false;
					}
				}
				form.AgentCommission.value = AgentCommissionVal;						
		}
		var isCoveredLivesNumeric = IsNumeric(form.CoveredLives.value);
			if(!isCoveredLivesNumeric){
				alert("CoveredLives should be whole number without decimals");
				form.CoveredLives.focus();
				return false;
		}
		if(form.PremiumDueDate!=null && form.PremiumDueDate!='undefined'){
			if(form.PremiumDueDate.value==""){
				alert("Please enter the PremiumDueDate");
				form.PremiumDueDate.focus();
				return false;
			}
			var vardate = form.PremiumDueDate.value			
			if(!isDate(vardate)){
				alert("Invalid Date")			
				return false;
			}			
			var dmonth = parseInt(vardate.substring(0, 2), 10);
			var dday = parseInt(vardate.substring(3, 5), 10);
			var dyear = parseInt(vardate.substring(6, 10), 10);
		
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
			{
				alert("Please enter date in 'MM/DD/YYYY' format");				
				return false;
			}
		}
		
		if(form.underwriterName!=null && form.underwriterName!='undefined'){
			if(form.underwriterName.value==""){
				alert("Please enter the Underwriter Name");	
				form.underwriterName.focus();				
				return false;
			}
		}
		
		if(form.ClaimsPayor!=null && form.ClaimsPayor!='undefined'){
		  if(form.ClaimsPayor.value==""){
				alert("Please enter the Claims Payor");	
				form.ClaimsPayor.focus();			
				return false;
			}
		}
		return true;
	}
	
 		function validateNonBTAEndorsementDetails(form){
		 		if(form.TransactionDate!=null && form.TransactionDate!='undefined'){
					if(form.TransactionDate.value==""){
						alert("Please enter the TransactionDate");
						form.TransactionDate.focus();
						return false;
					}
					var vardate = form.TransactionDate.value;			
					if(!isDate(vardate)){
						alert("Invalid TransactionDate")	
						form.TransactionDate.focus();		
						return false;
					}			
					var dmonth = parseInt(vardate.substring(0, 2), 10);
					var dday = parseInt(vardate.substring(3, 5), 10);
					var dyear = parseInt(vardate.substring(6, 10), 10);
				
					if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
					{
						alert("Please enter date in 'MM/DD/YYYY' format");				
						return false;
					}
				}
				if(form.TransactionType!=null && form.TransactionType!='undefined'){
					if(form.TransactionType.value==""){
						alert("Please enter the TransactionType");
						form.TransactionType.focus();
						return false;
					}
				}
				if(form.TransactionEffectiveDate!=null && form.TransactionEffectiveDate!='undefined'){
					if(form.TransactionEffectiveDate.value==""){
						alert("Please enter the TransactionEffectiveDate");
						form.TransactionEffectiveDate.focus();
						return false;
					}
					var vardate = form.TransactionEffectiveDate.value			
					if(!isDate(vardate)){
						alert("Invalid TransactionEffectiveDate")	
						form.TransactionEffectiveDate.focus();		
						return false;
					}			
					var dmonth = parseInt(vardate.substring(0, 2), 10);
					var dday = parseInt(vardate.substring(3, 5), 10);
					var dyear = parseInt(vardate.substring(6, 10), 10);
				
					if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
					{
						alert("Please enter date in 'MM/DD/YYYY' format");	
						form.TransactionEffectiveDate.focus();			
						return false;
					}
				}
				if(form.TransactionExpirationDate!=null && form.TransactionExpirationDate!='undefined'){
					if(form.TransactionExpirationDate.value==""){
						alert("Please enter the TransactionExpirationDate");
						form.TransactionExpirationDate.focus();
						return false;
					}
					var vardate = form.TransactionExpirationDate.value			
					if(!isDate(vardate)){
						alert("Invalid TransactionExpirationDate")		
						form.TransactionExpirationDate.focus();	
						return false;
					}			
					var dmonth = parseInt(vardate.substring(0, 2), 10);
					var dday = parseInt(vardate.substring(3, 5), 10);
					var dyear = parseInt(vardate.substring(6, 10), 10);
				
					if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
					{
						alert("Please enter date in 'MM/DD/YYYY' format");		
						form.TransactionExpirationDate.focus();		
						return false;
					}
				}
				var effectiveDate=new Date(form.TransactionEffectiveDate.value);
				var expirationDate = new Date(form.TransactionExpirationDate.value);
				
				if(expirationDate<=effectiveDate){
					alert("Please enter valid TransactionExpirationDate");
					form.TransactionExpirationDate.focus();
					return false;	
				}
				if(form.WrittenPremium != null && form.WrittenPremium != undefined){
					var WrittenPremiumNumericVal = form.WrittenPremium.value;
					WrittenPremiumNumericVal = WrittenPremiumNumericVal.replace(/\$/g,"");					
					WrittenPremiumNumericVal = WrittenPremiumNumericVal.replace(/\,/g,"");					
					var isWrittenPremiumNumeric = IsDecimal(WrittenPremiumNumericVal);
					
					if(WrittenPremiumNumericVal == "" || !isWrittenPremiumNumeric){
						alert("Please enter a WrittenPremiumvalue other than $0.");
						form.WrittenPremium.focus();
						return false;
					}
					
					if(WrittenPremiumNumericVal.indexOf(".")!=-1){
						var WrittenPremiumNumeric = WrittenPremiumNumericVal.split(".");						
						if(WrittenPremiumNumeric[0].length>15 || WrittenPremiumNumeric[1].length>2){
							alert("Please enter a valid WrittenPremium value.");
							form.WrittenPremium.focus();
							return false;
						}
					}else{
						if(WrittenPremiumNumericVal.length>15){
							alert("Please enter a valid WrittenPremium value.");
							form.WrittenPremium.focus();
							return false;
						}
					}	
					
					form.WrittenPremium.value = WrittenPremiumNumericVal;
				}
				if(form.Commission != null && form.Commission != undefined){
					var CommissionNumericVal = form.Commission.value;
					CommissionNumericVal = CommissionNumericVal.replace(/\$/g,"");
					CommissionNumericVal = CommissionNumericVal.replace(/\,/g,"");
					
					var isCommissionNumeric = IsDecimal(CommissionNumericVal);
					
					
					if(CommissionNumericVal == "" || CommissionNumericVal <=0.0 || !isCommissionNumeric){
						alert("Please enter a Commissionvalue other than $0.");
						form.Commission.focus();
						return false;
					}
					if(CommissionNumericVal.indexOf(".")!=-1){
						var CommissionNumeric = CommissionNumericVal.split(".");						
						if(CommissionNumeric[0].length>15 || CommissionNumeric[1].length>2){
							alert("Please enter a valid Commission value.");
							form.Commission.focus();
							return false;
						}
					}else{
						if(CommissionNumericVal.length>15){
							alert("Please enter a valid Commission value.");
							form.Commission.focus();
							return false;
						}
					}
					
					form.Commission.value = CommissionNumericVal;
				}
				if(form.AgentCommission!= null && form.AgentCommission != undefined){
					var AgentCommissionNumericVal = form.AgentCommission.value;
					AgentCommissionNumericVal = AgentCommissionNumericVal.replace(/\%/g,"");					
					AgentCommissionNumericVal = AgentCommissionNumericVal.replace(/\,/g,"");					
					var isAgentCommissionNumeric = IsDecimal(AgentCommissionNumericVal);

					if(AgentCommissionNumericVal == "" || AgentCommissionNumericVal <=0.0 || !isAgentCommissionNumeric){
						alert("Please enter a AgentCommissionvalue other than 0%");
						form.AgentCommission.focus();
						return false;
					}
					if(AgentCommissionNumericVal.indexOf(".")!=-1){
						var AgentCommissionNumeric = AgentCommissionNumericVal.split(".");						
						if(AgentCommissionNumeric[0].length>3 || AgentCommissionNumeric[1].length>4){
							alert("Please enter a valid AgentCommission value.");
							form.AgentCommission.focus();
							return false;
						}
					}else{
						if(AgentCommissionNumericVal.length>3){
							alert("Please enter a valid AgentCommission value.");
							form.AgentCommission.focus();
							return false;
						}
					}
					form.AgentCommission.value = AgentCommissionNumericVal;
				}
				if(form.PremiumDueDate!=null && form.PremiumDueDate!='undefined'){
					if(form.PremiumDueDate.value==""){
						alert("Please enter the PremiumDueDate");
						form.PremiumDueDate.focus();
						return false;
					}
					var vardate = form.PremiumDueDate.value			
					if(!isDate(vardate)){
						alert("Invalid PremiumDueDate")		
						form.PremiumDueDate.focus();	
						return false;
					}			
					var dmonth = parseInt(vardate.substring(0, 2), 10);
					var dday = parseInt(vardate.substring(3, 5), 10);
					var dyear = parseInt(vardate.substring(6, 10), 10);
				
					if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
					{
						alert("Please enter date in 'MM/DD/YYYY' format");	
						form.PremiumDueDate.focus();			
						return false;
					}
				}
					
				if(form.Rider!=null && form.Rider!='undefined'){
					if(document.getElementById("riderTR").style.display==""){
						if(form.Rider.value==""){
							alert("Please enter the Rider under Riders Link");	
							form.Rider.focus();				
							return false;
						}
					}
				}
			
			if(form.criticalIllnessPremium!=null && form.criticalIllnessPremium!='undefined'){
				var criticalIllnessPremiumVal = form.criticalIllnessPremium.value;
				criticalIllnessPremiumVal = criticalIllnessPremiumVal.replace(/\$/g,"");
				criticalIllnessPremiumVal = criticalIllnessPremiumVal.replace(/\,/g,"");
				if(form.criticalIllness.value=="Y"){
					var isCriticalIllnessPremiumNumeric = IsDecimal(criticalIllnessPremiumVal);
					if(criticalIllnessPremiumVal == "" || criticalIllnessPremiumVal <=0.0 || !isCriticalIllnessPremiumNumeric){
						alert("Please enter valid Critical Rider Premium under Riders Link");	
						form.criticalIllnessPremium.focus();						
						return false;
					}
				}
				if(criticalIllnessPremiumVal.indexOf(".")!=-1){
					var criticalIllnessPremiumNumeric = criticalIllnessPremiumVal.split(".");						
					if(criticalIllnessPremiumNumeric[0].length>15 || criticalIllnessPremiumNumeric[1].length>2){
						alert("Please enter a valid Critical Illness Premium.");
						form.criticalIllnessPremium.focus();
						return false;
					}
					}else{
					if(criticalIllnessPremiumVal.length>15){
						alert("Please enter a valid Critical Illness Premium.");
						form.criticalIllnessPremium.focus();
						return false;
					}
				}
				form.criticalIllnessPremium.value = criticalIllnessPremiumVal;						
			}
			
			if(form.warRiskPremium!=null && form.warRiskPremium!='undefined'){
				var warRiskPremiumVal = form.warRiskPremium.value;
				warRiskPremiumVal = warRiskPremiumVal.replace(/\$/g,"");
				warRiskPremiumVal = warRiskPremiumVal.replace(/\,/g,"");
				if(form.warRisk.value=="Y"){
					var isWarRiskPremiumNumeric = IsDecimal(warRiskPremiumVal);
					if(warRiskPremiumVal == "" || warRiskPremiumVal <=0.0 || !isWarRiskPremiumNumeric){
						alert("Please enter valid War Risk Rider Premium under Riders Link");	
						form.warRiskPremium.focus();						
						return false;
					}
				}
				if(warRiskPremiumVal.indexOf(".")!=-1){
					var warRiskPremiumNumeric = warRiskPremiumVal.split(".");						
					if(warRiskPremiumNumeric[0].length>15 || warRiskPremiumNumeric[1].length>2){
						alert("Please enter valid War Risk Rider Premium.");
						form.warRiskPremium.focus();
						return false;
					}
					}else{
					if(warRiskPremiumVal.length>15){
						alert("Please enter valid War Risk Rider Premium.");
						form.warRiskPremium.focus();
						return false;
					}
				}
				form.warRiskPremium.value = warRiskPremiumVal;						
			}
			
			if(form.AMEPrimaryPremium!=null && form.AMEPrimaryPremium!='undefined'){
				var AMEPrimaryPremiumVal = form.AMEPrimaryPremium.value;
				AMEPrimaryPremiumVal = AMEPrimaryPremiumVal.replace(/\$/g,"");
				AMEPrimaryPremiumVal = AMEPrimaryPremiumVal.replace(/\,/g,"");
				if(form.AMEPrimary.value=="Y"){
					var isAMEPrimaryPremiumNumeric = IsDecimal(AMEPrimaryPremiumVal);
					if(AMEPrimaryPremiumVal == "" || AMEPrimaryPremiumVal <=0.0 || !isAMEPrimaryPremiumNumeric){
						alert("Please enter valid AME Primary Rider Premium under Riders Link");	
						form.AMEPrimaryPremium.focus();						
						return false;
					}
				}
				if(AMEPrimaryPremiumVal.indexOf(".")!=-1){
					var AMEPrimaryPremiumNumeric = AMEPrimaryPremiumVal.split(".");						
					if(AMEPrimaryPremiumNumeric[0].length>15 || AMEPrimaryPremiumNumeric[1].length>2){
						alert("Please enter valid AME Primary Rider Premium.");
						form.AMEPrimaryPremium.focus();
						return false;
					}
					}else{
					if(AMEPrimaryPremiumVal.length>15){
						alert("Please enter valid AME Primary Rider Premium.");
						form.AMEPrimaryPremium.focus();
						return false;
					}
				}
				form.AMEPrimaryPremium.value = AMEPrimaryPremiumVal;						
			}
			
			if(form.AMEExcessPremium!=null && form.AMEExcessPremium!='undefined'){
				var AMEExcessPremiumVal = form.AMEExcessPremium.value;
				AMEExcessPremiumVal = AMEExcessPremiumVal.replace(/\$/g,"");
				AMEExcessPremiumVal = AMEExcessPremiumVal.replace(/\,/g,"");
				if(form.AMEExcess.value=="Y"){
					var isAMEExcessPremiumNumeric = IsDecimal(AMEExcessPremiumVal);
					if(AMEExcessPremiumVal == "" || AMEExcessPremiumVal <=0.0 || !isAMEExcessPremiumNumeric){
						alert("Please enter valid AME Excess Rider Premium under Riders Link");	
						form.AMEExcessPremium.focus();						
						return false;
					}
				}
				if(AMEExcessPremiumVal.indexOf(".")!=-1){
					var AMEExcessPremiumNumeric = AMEExcessPremiumVal.split(".");						
					if(AMEExcessPremiumNumeric[0].length>15 || AMEExcessPremiumNumeric[1].length>2){
						alert("Please enter valid AME Excess Rider Premium.");
						form.AMEExcessPremium.focus();
						return false;
					}
					}else{
					if(AMEExcessPremiumVal.length>15){
						alert("Please enter valid AME Excess Rider Premium.");
						form.AMEExcessPremium.focus();
						return false;
					}
				}
				form.AMEExcessPremium.value = AMEExcessPremiumVal;						
			}
			
			if(form.AMECOBPremium!=null && form.AMECOBPremium!='undefined'){
				var AMECOBPremiumVal = form.AMECOBPremium.value;
				AMECOBPremiumVal = AMECOBPremiumVal.replace(/\$/g,"");
				AMECOBPremiumVal = AMECOBPremiumVal.replace(/\,/g,"");
				if(form.AMECOB.value=="Y"){
					var isAMECOBPremiumNumeric = IsDecimal(AMECOBPremiumVal);
					if(AMECOBPremiumVal == "" || AMECOBPremiumVal <=0.0 || !isAMECOBPremiumNumeric){
						alert("Please enter valid AME COB Rider Premium under Riders Link");	
						form.AMECOBPremium.focus();						
						return false;
					}
				}
				if(AMECOBPremiumVal.indexOf(".")!=-1){
					var AMECOBPremiumNumeric = AMECOBPremiumVal.split(".");						
					if(AMECOBPremiumNumeric[0].length>15 || AMECOBPremiumNumeric[1].length>2){
						alert("Please enter valid AME COB Rider Premium.");
						form.AMECOBPremium.focus();
						return false;
					}
					}else{
					if(AMECOBPremiumVal.length>15){
						alert("Please enter valid AME COB Rider Premium.");
						form.AMECOBPremium.focus();
						return false;
					}
				}
				form.AMECOBPremium.value = AMECOBPremiumVal;						
			}
			
			if(form.aviationPremium!=null && form.aviationPremium!='undefined'){
				var aviationPremiumVal = form.aviationPremium.value;
				aviationPremiumVal = aviationPremiumVal.replace(/\$/g,"");
				aviationPremiumVal = aviationPremiumVal.replace(/\,/g,"");
				if(form.aviation.value=="Y"){
					var isAviationPremiumNumeric = IsDecimal(aviationPremiumVal);
					if(aviationPremiumVal == "" || aviationPremiumVal <=0.0 || !isAviationPremiumNumeric){
						alert("Please enter valid Aviation Rider Premium under Riders Link");	
						form.aviationPremium.focus();						
						return false;
					}
				}
				if(aviationPremiumVal.indexOf(".")!=-1){
					var aviationPremiumNumeric = aviationPremiumVal.split(".");						
					if(aviationPremiumNumeric[0].length>15 || aviationPremiumNumeric[1].length>2){
						alert("Please enter valid Aviation Rider Premium.");
						form.aviationPremium.focus();
						return false;
					}
					}else{
					if(aviationPremiumVal.length>15){
						alert("Please enter valid Aviation Rider Premium.");
						form.aviationPremium.focus();
						return false;
					}
				}
				form.aviationPremium.value = aviationPremiumVal;						
			}
			    
				
		}
		
		
		function showRiderPremium(id){
				var temp = id;
				var prem;
				var rider = document.getElementById(id).checked;
				if(rider == true){
					document.getElementById(id).value = "Y";				
					id = id + "TD";
					document.getElementById(id).style.display = "block";				
				}else if(rider == false){	
					document.getElementById(temp).value = "N";
					prem = temp + "Premium";
					//document.getElementById(prem).value = "";
					temp = temp + "TD";				
					document.getElementById(temp).style.display = "none";								
				}			
		}
	   
	   
		
		
		function showOccupancies(value){
			var occupancies = document.getElementById('Occupancies');
			if(value == "Corporate"){
				occupancies.length = 6;
				
				//Setting display names
				occupancies[0].text = "Select";
				occupancies[1].text = "BTA";
				occupancies[2].text = "PAI";
				occupancies[3].text = "PAI(vol)";
				occupancies[4].text = "PAI Basic/Carve-out (mandatory)";
				occupancies[5].text = "International Travel";
				
				//Setting option values
				occupancies[0].value = "";
				occupancies[1].value = "BTA";
				occupancies[2].value = "PAI";
				occupancies[3].value = "PAI(vol)";
				occupancies[4].value = "PAI Basic/Carve-out (mandatory)";
				occupancies[5].value = "International Travel";
			}
			if(value == "Specialty"){
				occupancies.length = 8;
				
				//Setting display names
				occupancies[0].text = "Select";
				occupancies[1].text = "College A&S";
				occupancies[2].text = "Student International Inbound";
				occupancies[3].text = "Student International Outbound";
				occupancies[4].text = "Intercollegiate Sports";
				occupancies[5].text = "K-12";
				occupancies[6].text = "Volunteer Fire";
				occupancies[7].text = "Special Risk";
				
				//Setting option values
				occupancies[0].value = "";
				occupancies[1].value = "College A&S";
				occupancies[2].value = "Student International Inbound";
				occupancies[3].value = "Student International Outbound";
				occupancies[4].value = "Intercollegiate Sports";
				occupancies[5].value = "K-12";
				occupancies[6].value = "Volunteer Fire";
				occupancies[7].value = "Special Risk";				
			}
			if(value == "Consumer"){
				occupancies.length = 4;
				
				//Setting display names
				occupancies[0].text = "Select";
				occupancies[1].text = "Broad Market Association";
				occupancies[2].text = "Affinity Association";
				occupancies[3].text = "Financial Institutions";
				
				//Setting option values
				occupancies[0].value = "";
				occupancies[1].value = "Broad Market Association";
				occupancies[2].value = "Affinity Association";
				occupancies[3].value = "Financial Institutions";
			}			
		}
		
		 
	function editInsuredDetail(){
		activateQuoteTabs('PoliciesTab');	
		document.getElementById("PolicyDiv").style.display = "none";
		document.getElementById("PolicyDetaildiv").style.display = "none";
		document.getElementById("SavePolicydetaildiv").style.display = "block";
		enableTabs();
	}
		
	function showRider(){
		document.getElementById('ridersDiv').innerHTML = "<a href='javascript:hideRider();' style='color:black;'>- Riders</a>";
		document.getElementById('riderTR').style.display="";
	}
	
	function hideRider(){
		document.getElementById('ridersDiv').innerHTML = "<a href='javascript:showRider();' style='color:black;'>+Riders</a>";
		document.getElementById('riderTR').style.display="none";
	}	
		
	function editPaymentDateHandler(){   				
		var blurHandlerRemittanceDateEdit = function() {        				
			 var effDate1 = Ext.getCmp('RemittanceDateEdit').getValue(); 
			 
			var vardate = document.getElementById("RemittanceDateEdit").value;

			
			var ddate = new Date(vardate);	
			
			
			if(!isDate(vardate)){
				alert("Invalid Remmitance Date")
				document.getElementById("RemittanceDateEditHidden").value = vardate;
				
				return false;
			}
			var dmonth = parseInt(vardate.substring(0, 2), 10);
			var dday = parseInt(vardate.substring(3, 5), 10);
			var dyear = parseInt(vardate.substring(6, 10), 10);

			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
			{
				          if(document.getElementById('RemittanceDateEdit').value != ""){
					      alert("Please enter date in 'MM/DD/YYYY' format");				
						  return false;
						  }
			}

			var reqDate = new Date("01/01/2010");

			if (ddate < reqDate)
			{
			
				alert("Remmitance Date cannot be prior to Jan 1, 2010");
				document.getElementById("RemittanceDateEditHidden").value =vardate;
				return false;
			}			 
			 var MM1 = effDate1.getMonth()+1;
		 var DD1 = effDate1.getDate();
		 var YY1 = effDate1.getFullYear();
		 if(MM1<10){ MM1 = "0"+(MM1);}
		 if(DD1<10){ DD1 = "0"+DD1;}
		 	
		 document.getElementById("RemittanceDateEditHidden").value = MM1+'/'+DD1+'/'+YY1;
		 				 		 
		};      				
		
		var blurHandlerPaymentDateEdit = function() { 					 
			
			 var expDate1 = Ext.getCmp('PaymentDateEdit').getValue();  
			var vardate = document.getElementById("PaymentDateEdit").value;

			var ddate = new Date(vardate);	
			
			
			if(!isDate(vardate)){
				alert("Invalid Payment Date")
				document.getElementById("PaymentDateEditHidden").value =  "";
				
				return false;
			}
			
			
			
			/*if (vardate=="")
			{
				alert("Please enter the Valid Payment Date");
				document.getElementById("PaymentDateEditHidden").value =  "";
				//frm.txtDate.focus();
				return false;
			}*/
			
		
			
			var dmonth = parseInt(vardate.substring(0, 2), 10);
			var dday = parseInt(vardate.substring(3, 5), 10);
			var dyear = parseInt(vardate.substring(6, 10), 10);
			
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
			{
				         if(document.getElementById('PaymentDateEdit').value != ""){
					      alert("Please enter date in 'MM/DD/YYYY' format");				
						  return false;
						  }
			}
			
			
			var reqDate = new Date("01/01/2010");

			if (ddate < reqDate)
			{
			
				alert("Payment Date cannot be prior to Jan 1, 2010");
				document.getElementById("PaymentDateEditHidden").value =  "";
				//frm.txtDate.focus();
				return false;
			}


		var MM1 = expDate1.getMonth()+1;
		 var DD1 = expDate1.getDate();
		 var YY1 = expDate1.getFullYear();
	
		 if(MM1<10){ MM1 = "0"+(MM1);}
		 if(DD1<10){ DD1 = "0"+DD1;}
	
		 document.getElementById("PaymentDateEditHidden").value = MM1+'/'+DD1+'/'+YY1;					 
		
		}; 

		var blurHandlerCreditDateEdit = function() { 					 
			
			 var expDate1 = Ext.getCmp('CreditDateEdit').getValue();  
			var vardate = document.getElementById("CreditDateEdit").value;

			var ddate = new Date(vardate);	
			
			
			if(!isDate(vardate)){
				alert("Invalid Credit Date")
				document.getElementById("CreditDateEditHidden").value =  "";
				
				return false;
			}
			
			
			
			if (vardate=="")
			{
				alert("Please enter the Valid Credit Date");
				document.getElementById("CreditDateEditHidden").value =  "";
				//frm.txtDate.focus();
				return false;
			}
			
		
			
			var dmonth = parseInt(vardate.substring(0, 2), 10);
			var dday = parseInt(vardate.substring(3, 5), 10);
			var dyear = parseInt(vardate.substring(6, 10), 10);
			
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
			{
				          if(document.getElementById('CreditDateEdit').value != ""){
					      alert("Please enter date in 'MM/DD/YYYY' format");				
						  return false;
						  }
			}
			
			
			var reqDate = new Date("01/01/2010");

			if (ddate < reqDate)
			{
			
				alert("Payment Date cannot be prior to Jan 1, 2010");
				document.getElementById("CreditDateEditHidden").value =  "";
				//frm.txtDate.focus();
				return false;
			}


			 var MM1 = expDate1.getMonth()+1;
		 var DD1 = expDate1.getDate();
		 var YY1 = expDate1.getFullYear();
	
		 if(MM1<10){ MM1 = "0"+(MM1);}
		 if(DD1<10){ DD1 = "0"+DD1;}
	
		 document.getElementById("CreditDateEditHidden").value = MM1+'/'+DD1+'/'+YY1;					 
		 
		}; 
								   							
		Ext.EventManager.on('RemittanceDateEdit', 'blur', blurHandlerRemittanceDateEdit);   				  				
		Ext.EventManager.on('PaymentDateEdit', 'blur', blurHandlerPaymentDateEdit);
		Ext.EventManager.on('CreditDateEdit', 'blur', blurHandlerCreditDateEdit);
		
	}
	
	function initEditPaymentCal(){
	var myDatePanel = new Ext.Panel({
    applyTo:'RemittanceDate2',
    hideLabels:true,
    width:120,
    autoHeight:true,
	bodyBorder : false,
    border : false,
    frame:false,
    items:[{
      xtype:'datefield',
      name:'dob',
      id:'RemittanceDateEdit',
      width:100,
      allowBlank:false
    }]
  });


	var myDatePanel2 = new Ext.Panel({
	    applyTo:'PaymentDate2',
	    hideLabels:true,
	    width:120,
	    autoHeight:true,
		bodyBorder : false,
	    border : false,
	    frame:false,
	    items:[{
	      xtype:'datefield',
	      name:'dob1',
	      id:'PaymentDateEdit',
	      width:100,
	      allowBlank:false
	    }]
	  });

	var myDatePanel3 = new Ext.Panel({
	    applyTo:'CreditDate2',
	    hideLabels:true,
	    width:120,
	    autoHeight:true,
		bodyBorder : false,
	    border : false,
	    frame:false,
	    items:[{
	      xtype:'datefield',
	      name:'dob1',
	      id:'CreditDateEdit',
	      width:100,
	      allowBlank:false
	    }]
	  });	  	  

//Date Range Setting 
var minValue = "";

var maxValue = "";



//hitting on datefield text input, pops up the calendar dropdown
var clickHandler = function() {
	Ext.getCmp('RemittanceDateEdit').onTriggerClick();
};

Ext.EventManager.on('RemittanceDateEdit', 'click', clickHandler);

if(document.getElementById("RemittanceDateEditHidden").value !=""){
	var remittanceDateHidden = document.getElementById("RemittanceDateEditHidden").value;
	Ext.getCmp('RemittanceDateEdit').setValue(remittanceDateHidden);
}

if(document.getElementById("PaymentDateEditHidden").value != ""){
	var paymentDateHidden = document.getElementById("PaymentDateEditHidden").value;
	Ext.getCmp('PaymentDateEdit').setValue(paymentDateHidden);
}

if(document.getElementById("CreditDateEditHidden").value !=""){
var creditDateEditHidden = document.getElementById("CreditDateEditHidden").value;

Ext.getCmp('CreditDateEdit').setValue(creditDateEditHidden);
}
editPaymentDateHandler();

}


function enableTabs(){
   
   	 if(document.getElementById("PoliciesTab") != undefined){
    	document.getElementById("PoliciesTab").disabled = false;
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
 	if(document.getElementById("ClassBenefits_Row") != undefined){
 		document.getElementById("ClassBenefits_Row").disabled = false;
 	}
   }