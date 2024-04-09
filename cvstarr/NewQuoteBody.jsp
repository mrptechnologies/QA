<link rel="stylesheet" type="text/css" href="../ui3.0/i/style.css" />

<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />
<SCRIPT type="text/javascript" SRC="scripts/classhazardsclass1.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="scripts/classhazardsclass2.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="scripts/classhazardsclass3.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="scripts/classbenefits1.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="scripts/classbenefits2.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="scripts/classbenefits3.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="scripts/CoverageAndLimits.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="scripts/CaseInformation.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="scripts/ClassExclusion.js"> </SCRIPT>

<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>

<script type="text/javascript" src="../Scripts/JScripts/Common.js">
</script>

<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js"  type="text/javascript"> </SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/ValidateFieldEIL.js"></script>
<script type="text/javascript" src="scripts/CreateQuoteProgressBarChagaeStage.js"></script>
<script type="text/javascript" id="prototype" src="../Scripts/JScripts/prototype.js"></script>
<SCRIPT type="text/javascript" SRC="scripts/ClassHazards.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="scripts/policyExclusions.js"> </SCRIPT>
<Script type="text/javascript">
var check='Y';

function covandLimits(){
	document.getElementById('covAndLimits').className='stage1 left';
	document.getElementById('caseInformation').className='stage4 left';
	document.getElementById('caseExclusion').className='stage5 left';
	document.getElementById('classHazards').className='stage5 left';
	document.getElementById('classBenefits').className='stage5 left';
	document.getElementById('quotesummary').className='stage6 left';
}

function covandLimitsToCaseInformation(){
	document.getElementById('covAndLimits').className='stage1 left';
	document.getElementById('caseInformation').className='stage3 left';
	document.getElementById('caseExclusion').className='stage4 left';
	document.getElementById('classHazards').className='stage5 left';
	document.getElementById('classBenefits').className='stage5 left';
	document.getElementById('quotesummary').className='stage6 left';
}

function caseInformationtoCaseExclusions(){
	document.getElementById('covAndLimits').className='stage1 left';
	document.getElementById('caseInformation').className='stage2 left';
	document.getElementById('caseExclusion').className='stage3 left';
	document.getElementById('classHazards').className='stage4 left';
	document.getElementById('classBenefits').className='stage5 left';
	document.getElementById('quotesummary').className='stage6 left';
}

function caseExclusionsToClassHazards(){
	document.getElementById('covAndLimits').className='stage1 left';
	document.getElementById('caseInformation').className='stage2 left';
	document.getElementById('caseExclusion').className='stage2 left';
	document.getElementById('classHazards').className='stage3 left';
	document.getElementById('classBenefits').className='stage4 left';
	document.getElementById('quotesummary').className='stage6 left';
}

function classHazardsToClassBenefits(){
	document.getElementById('covAndLimits').className='stage1 left';
	document.getElementById('caseInformation').className='stage2 left';
	document.getElementById('caseExclusion').className='stage2 left';
	document.getElementById('classHazards').className='stage2 left';
	document.getElementById('classBenefits').className='stage3 left';
	document.getElementById('quotesummary').className='stage7 left';
}
</Script>

<form method="post" action="../cvstarr/QuoteSummaryEIL.jsp">

<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
	<tr><td colspan="20" class="links" width="400px">&nbsp;</td></tr>
</table>

<div class="formpagenew1">
<div align="center" id="NewQuote">
<jsp:include page="../cvstarr/CreateQuote/NewQuoteCoverageandLimitsParent.jsp"/>
</div>
</div>


