function displayCoverageBlock(obj){
        var selectedCoverage=obj.options[obj.selectedIndex].value;
    	if(selectedCoverage=="Limited Primary"){
    		document.getElementById("limitedPrimaryHeading").style.display='inline';
    		document.getElementById("limitedPrimary1").style.display='inline';
    		document.getElementById("limitedPrimary2").style.display='inline';    		
    	}
    	else{
    		document.getElementById("limitedPrimaryHeading").style.display='none';
    		document.getElementById("limitedPrimary1").style.display='none';
    		document.getElementById("limitedPrimary2").style.display='none';    		
    	}
    	if(selectedCoverage=="Primary Excess"){
    		document.getElementById("primaryExcessHeading").style.display='inline';
    		document.getElementById("primaryExcess1").style.display='inline';
    	}
    	else{
    	    	document.getElementById("primaryExcessHeading").style.display='none';
    		document.getElementById("primaryExcess1").style.display='none';
    		
    	}
    	if(selectedCoverage=="Limited Primary Excess"){
    		document.getElementById("limitedPrimaryExcessHeading").style.display="inline";
    		document.getElementById("limitedPrimaryExcess1").style.display='inline';
    		document.getElementById("limitedPrimaryExcess2").style.display='inline';    		
    	}
    	else{
    		document.getElementById("limitedPrimaryExcessHeading").style.display="none";
    		document.getElementById("limitedPrimaryExcess1").style.display='none';
    		document.getElementById("limitedPrimaryExcess2").style.display='none';    		
    	}
}

    	function displayCountryOrMinPeriodWarRiskIncluded(obj){
    
    	if(obj.value=="Y"){
    		document.getElementById("countryWarRiskIncluded").style.display='inline';
    	}
    	else{
    		document.getElementById("countryWarRiskIncluded").style.display='none';
    	}
    	if(obj.value=="N"){
    		document.getElementById("minPeriodWarRiskIncluded").style.display='inline';
    	}
    	else{
    		document.getElementById("minPeriodWarRiskIncluded").style.display='none';
    	}
    
    }
    
    
    	function displayCountryOrMinPeriodWarRiskExcluded(obj){
    
    	if(obj.value=="Y"){
    		document.getElementById("countryWarRiskExcluded").style.display='inline';
    	}
    	else{
    		document.getElementById("countryWarRiskExcluded").style.display='none';
    	}
    	if(obj.value=="N"){
    		document.getElementById("minPeriodWarRiskExcluded").style.display='inline';
    	}
    	else{
    		document.getElementById("minPeriodWarRiskExcluded").style.display='none';
    	}
    
    }
    
    function displayChangeFrequencyLimitation(obj){
    	if(obj.value=="Y"){
    		document.getElementById("MaximumRateChangeFrequency").style.display="inline";
    	}else if(obj.value=="N"){
    		document.getElementById("MaximumRateChangeFrequency").style.display="none";
    	}
    }
    
    
    function displayCoverageBlockInCountry(obj){
        var selectedCoverage=obj.options[obj.selectedIndex].value;
    	if(selectedCoverage=="Limited Primary"){
    		document.getElementById("limitedPrimaryHeadingInCountry").style.display='inline';
    		document.getElementById("limitedPrimaryInCountry1").style.display='inline';
    		document.getElementById("limitedPrimaryInCountry2").style.display='inline';    		
    	}
    	else{
    		document.getElementById("limitedPrimaryHeadingInCountry").style.display='none';
    		document.getElementById("limitedPrimaryInCountry1").style.display='none';
    		document.getElementById("limitedPrimaryInCountry2").style.display='none';    		
    	}
    	if(selectedCoverage=="Primary Excess"){
    		document.getElementById("primaryExcessHeadingInCountry").style.display='inline';
    		document.getElementById("primaryExcess1InCountry").style.display='inline';
    	}
    	else{
    	    	document.getElementById("primaryExcessHeadingInCountry").style.display='none';
    		document.getElementById("primaryExcess1InCountry").style.display='none';
    		
    	}
    	if(selectedCoverage=="Limited Primary Excess"){
    		document.getElementById("limitedPrimaryExcessHeadingInCountry").style.display="inline";
    		document.getElementById("limitedPrimaryExcessInCountry1").style.display='inline';
    		document.getElementById("limitedPrimaryExcessInCountry2").style.display='inline';    		
    	}
    	else{
    		document.getElementById("limitedPrimaryExcessHeadingInCountry").style.display="none";
    		document.getElementById("limitedPrimaryExcessInCountry1").style.display='none';
    		document.getElementById("limitedPrimaryExcessInCountry2").style.display='none';    		
    	}
}