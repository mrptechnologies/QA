
<script>
function QuoteProposalDisable(formElement){
	document.getElementById("QuoteProposalSubmit").disabled = true;		
}

function QuoteProposalEnable(formElement){
	document.getElementById("QuoteProposalSubmit").disabled = false;		
}
</script>

<!--##########################NEW QUOTE HEADER START #########################################-->



<form action="../cvstarr/QuoteSummaryEIL.jsp">
<table border="0" width="100%" id="table1" cellspacing="0" cellpadding="0">
<tr><td>
 	<table border="0" width="100%" id="table1" cellspacing="0" cellpadding="0">
	<tr>
		<td align="left" valign="top">
			<div class="frame3border">
			<div class="formhead"><h2 class="left">Quote</h2></div>
				<div class="frlabel3 left">
					Status:<br />
					Effective Date:<br />
					Company Paper:<br />
					Last Updated:<br />
						&nbsp;



				</div>
				<div class="frinfo3 left" style="width:200px;">
					In Progress<br />
					April 22 2010 <br />
					Starr Indemnity & Liability Company<br />
					April 22 2010 <br />
						&nbsp;
				</div>
			</div>
		</td >
		<td align="left"  valign="top">
			<div class="frame11border">
			<div class="formhead"><h2 class="left">Insured</h2><div align=right style=" margin-top: 5px; margin-right: 5px;"><a href="../Servlet?dms_id=9eade1d540f41ead1897033641d9f088" >Insured Details</a></div></div>
				<div class="frlabel3 left">
					Name:<br />
					Address:<br />
					City:<br />
					State:<br />
					Zip:<br />&nbsp;
					Agency Name:<br />
					Agent Name:<br />
				</div>
				<div class="frinfo11 left" >
					<a href="../Servlet?dms_id=9eade1d540f41ead1897033641d9f088" >test</a><br />
					<br />
					Marion<br />
					OH<br />
					43301<br />

					<a href="../Servlet?dms_id=8714bb2de3ee4df93c66a29eba584809">Solartis Agency</a><br/>
					<a href="../Servlet?dms_id=a4b12468d1fc912a49e404a3b261b073">Solartis Agent</a>
				</div>
			</div>
		</td>
	</tr>
</table

</td></tr>

<!--##########################NEW QUOTE HEADER END #########################################-->
<tr><td>
		<table WIDTH="760px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td >
						<table WIDTH="760px" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
							<tr><td>
								<table WIDTH="760px" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
								<tr><td>&nbsp;</td></tr>
								<tr>
									<td align="left">
									<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">
									<tr>
										<td colspan="2" class="links">
										<table>
										<tr>
										<td colspan="2" class="links" width="150px">
										<a href="../cvstarr/QuoteSummaryEIL.jsp?status=quote_summary&PilotAircraft=<%=request.getParameter("PilotAircraft") %>">Quote Summary</a>
										</td>

									</tr>
									</table>
									</td>
								</tr>

								<tr>
								<td  colspan="8" align="center" class="sectionhead"></td>
								</tr>
								<tr><td>&nbsp;</td></tr>
								<tr>
									<td>
									<table width="100%" border="0" align="center">
									<tr>

									<td class="TextMatter" align="right">
											Are you sure you want to create a quote proposal?
								
											<input type="radio" name="answer(Object::QuoteAdditional::Praposal)" value="Yes" id="proposalYES" onclick="QuoteProposalEnable(this.form,this.document)">&nbsp;Yes
											<input type="radio" name="answer(Object::QuoteAdditional::Praposal)" value="No" checked="checked" id="proposalNO" onclick="QuoteProposalDisable(this.form,this.document)">&nbsp;No
									</td>
								</tr>
								</table>
							</td></tr>
						</table>
					</td>
				</tr>
		</table>
		
		<table WIDTH="75%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr><td>&nbsp;</td></tr>
		
		<tr>
		<td align="center" class="links">
		<% 
			session.setAttribute("QuoteProposal","Issue Binder");
			session.setAttribute("quotestatus","Offered");
		%>
		<input type="hidden" value="<%=request.getParameter("PilotAircraft") %>" name="PilotAircraft" />
		<INPUT TYPE="Submit" value="Create Quote Proposal" class="covbutton" style="width:180px;" disabled="disabled" id="QuoteProposalSubmit">
		</td>
		</tr>
		</table>
		</td></tr></table>
</form>

<br class="clear" />





