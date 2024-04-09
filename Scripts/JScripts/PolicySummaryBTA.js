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
		return true;
	}
	function loadPolicyPaymentTab(id){
		activateQuoteTabs(id);
		if(document.getElementById('policyDivTable') != null && document.getElementById('policyDivTable') != undefined){
			document.getElementById('policyDivTable').style.display='block';
		}
		document.getElementById('PolicyInformationDiv').style.display='none';
		document.getElementById('PolicyInformationDivContent').style.display='none';
		document.getElementById('PolicyDiv').style.display='none';		
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
		  /*  if(document.getElementById("DocumentationTab") != undefined){
		    	document.getElementById("DocumentationTab").disabled = true;
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
		 	
		 	if(document.getElementById("DocumentationTab") != undefined){
		 	document.getElementById("DocumentationTab").className = "todotab_inactive";
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

					if(val == "1::Credit"){
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
						  
						  document.paymentTransactionFrm2.action="/deletePaymentAction.do";		 
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
 	
 	var documentPopUp=true;					
function initDocumentDialog(){
 	
	YAHOO.example.container.dialog4 = new YAHOO.widget.Dialog("DocumentPopUp", 
							{ 
							  width:"78em",
							  visible : false,
							  zindex:1000,
							  close:true,
							  modal:true,
							  constraintoviewport : true,
							  buttons : []
							});
	// Render the Dialog
	//if(documentPopUp==true){
		YAHOO.example.container.dialog4.render();
		//documentPopUp=false;
	//}
}