function display(obj)
{
	if(obj.value=="N"){document.getElementById("benefitMaximum").style.display='none';}
	else{document.getElementById("benefitMaximum").style.display='block';}
}

function displayaudit(obj){
	if(obj.value=="N"){document.getElementById("audit_period").style.display='none';}
	else{document.getElementById("audit_period").style.display='block';}
}

function displayIfOthersPeriod(obj){
	var selectedPeriod=obj.options[obj.selectedIndex].value;
	if (selectedPeriod=="Other"){
		document.getElementById("IfOthersPeriod").style.display="inline";
	}else{
		document.getElementById("IfOthersPeriod").style.display="none";
	}
}

function displayIfOthersUnit(obj){
	var selectedInit=obj.options[obj.selectedIndex].value;
	if (selectedInit=="Other"){
		document.getElementById("IfOthersUnit").style.display="block";
	}else{
		document.getElementById("IfOthersUnit").style.display="none";
	}
}


function displayMedical(obj)
{
	if(obj.value=="N"){document.getElementById("outtaCountry").style.display='none';
	document.getElementById("inCountry").style.display='none';}
	else{document.getElementById("outtaCountry").style.display='block';
	document.getElementById("inCountry").style.display='block';}
}

function displaySickness(obj)
{
	if(obj.value=="N"){document.getElementById("outtaSicknessCountry").style.display='none';
	document.getElementById("inSicknessCountry").style.display='none';}
	else{document.getElementById("outtaSicknessCountry").style.display='block';
	document.getElementById("inSicknessCountry").style.display='block';}
}

function displayWarRisk(obj)
{
	if(obj.value=="Y"){document.getElementById("warExplicitlyCovered").style.display='none';}
	else{document.getElementById("warExplicitlyCovered").style.display='block';}
}