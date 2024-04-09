<script>
	function IssuePolicy(){
		document.getElementById('IssuePolicySubmit').style.display='none';
		document.getElementById('statusofpolicyBound').style.display='none';
		document.getElementById('statusofpolicyIssued').style.display='block';
		document.getElementById('Issue_Policy').value="Issued";
		ChangedBoundtoIssuePolicy();
	}
</script>
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr><td>	
	<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
	<tr><td colspan="4">&nbsp;</td></tr>
	<tr><td width="30%"><div  style ="font-style:bolditalic;font-size:14pt;">Policy&nbsp;TXEPRB10095110</div></td></tr>
    	<tr><td colspan="4">&nbsp;</td></tr>
	<tr><td  width="25%" class="links" >
		<a href="../Servlet?dms_id=74f5e8ad9411878e943b989b6306bb3a" class="button2" style="width:200px;height:18px;" > Go to Submission Summary </a>
	     </td>
	     <td width="25%" class="links"><a href="../Servlet?dms_id=f2ebbc351edfca4d8c3a13813d300de6" title="Click to go to Master Insured Record" class="button2" style="width:200px;height:18px;" />Go to Insured Master Record</a> </td>
	     <td  width="20%">
	         <input type="button" name="answer(IssuePolicys)" value="Issue Policy" onclick="IssuePolicy();" class="covbutton2" id="IssuePolicySubmit">
	         <input type="hidden" value="bound" name="Issue_Policy" id="Issue_Policy"/>
	     </td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    	<tr><td class="NewSectionHead" colspan="5" align="center">POLICY SUMMARY</td></tr>
	<tr><td colspan="4">&nbsp;</td></tr>
	</table>
	</td>
	</tr>
</table>

 <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
 	<tr><td>
 	<table border="0" width="100%" id="table1" cellspacing="0" cellpadding="0">
	<tr>
		<td align="left" valign="top">
		<div class="frame4border">
		<div class="formhead"><h2 class="left">Policy</h2></div>
		<div class="frlabel4 left">
			  Status:<br />
			  Plan:<br />
			  Term:<br />
			  Premium:<br />
			  Last Updated:<br />
			  &nbsp;
		</div>
		<div class="frinfo4 left">
			<div id="statusofpolicyBound" style="display:'block';">Bound</div>
			<div id="statusofpolicyIssued" style="display:none;">Issued</div>
			Class1<br />
			12 Months<br />
			$2000.00<br />
			April 22 2010<br />
			&nbsp;
		</div>
		<div class="frlabel4 left">
			  Effective:<br />
			  Expiration:<br />
			  Type:<br />
			  Quote:<br />
		</div>
	    	<div class="frinfo4 left">
	    		 April 22 2010<br />
			 April 22 2011<br />
			 POLICY<br />
			 973 <br />
			 &nbsp;
		</div>
		</div>
		</td >
		
		<td align="left"  valign="top">
		<div class="frame11border">
		<div class="formhead"><h2 class="left">Insured</h2><div align=right style=" margin-top: 5px; margin-right: 5px;"><a href="../Servlet?dms_id=9eade1d540f41ead1897033641d9f088" >Insured Details</a></div></div>
		<div class="frlabel5 left">
			Name:<br />
			Address:<br />
			City:<br />
			State:<br />
			Zip:<br />&nbsp;
			Agency Name:<br />
			Agent Name:<br />
		</div>
		<div class="frinfo5">
			test<br /><br />
			Marion<br />
			OH<br />
			43301<br />
			Solartis Agency<br/>
			Solartis Agent
		</div>
		</div>
		</td>
	</tr>
</table>
<jsp:include page="../cvstarr/PolicySummary/PolicySummaryContents.jsp"/>



