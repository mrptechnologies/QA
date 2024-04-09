function covandLimits(){
	document.getElementById('covAndLimits').className='stage1 left';
	document.getElementById('caseInformation').className='stage4 left';
	document.getElementById('caseExclusion').className='stage5 left';
	document.getElementById('classHazards').className='stage5 left';
	document.getElementById('classBenefits').className='stage6 left';
}


function covandLimitsToCaseInformation(){
	document.getElementById('covAndLimits').className='stage1 left';
	document.getElementById('caseInformation').className='stage3 left';
	document.getElementById('caseExclusion').className='stage4 left';
	document.getElementById('classHazards').className='stage5 left';
	document.getElementById('classBenefits').className='stage6 left';
}

function caseInformationtoCaseExclusions(){
	document.getElementById('covAndLimits').className='stage1 left';
	document.getElementById('caseInformation').className='stage2 left';
	document.getElementById('caseExclusion').className='stage3 left';
	document.getElementById('classHazards').className='stage4 left';
	document.getElementById('classBenefits').className='stage6 left';
}

function caseExclusionsToClassHazards(){
	document.getElementById('covAndLimits').className='stage1 left';
	document.getElementById('caseInformation').className='stage2 left';
	document.getElementById('caseExclusion').className='stage2 left';
	document.getElementById('classHazards').className='stage3 left';
	document.getElementById('classBenefits').className='stage7 left';
}

function classHazardsToClassBenefits(){
	document.getElementById('covAndLimits').className='stage1 left';
	document.getElementById('caseInformation').className='stage2 left';
	document.getElementById('caseExclusion').className='stage2 left';
	document.getElementById('classHazards').className='stage2 left';
	document.getElementById('classBenefits').className='stage8 left';
}