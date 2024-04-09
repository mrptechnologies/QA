
<link rel="stylesheet" href="../styles/structure.css" type="text/css">
<script type="text/javascript" src="/Scripts/JScripts/Application.js"></script>	
<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">	
<tr><td><div id="manuScript"><div id='Manuscript_CONT'></div></div></td></tr>	
<tr><td><div id="subjDetail"><div id="SUB_CONT"></div><a class="container-close" href="javascript:void(0);" onclick="document.getElementById('SUB_CONT').innerHTML='';YAHOO.example.container.subjDetail.hide();"></a></div></td></tr>
<tr><td><div id="AttachFiles"></div></td></tr>
<tr><td><div id="AddNotespopup" style="display:none"></div></td></tr>
</table>

<script type="text/javascript">
   function doPost(){
     form1.submit();
   }
</script>

<%
	String str1="issuance";
	if(request.getParameter("status")!=null){
		str1=request.getParameter("status");
	}
	if(str1.equals("quote_summary")){
		session.setAttribute("QuoteProposal","Create Quote Proposal");
		session.setAttribute("quotestatus","In Progress");
	}
%>

<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr><td>	
	<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr><td align="left">
		<table WIDTH="100%"  ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		<tr><td  style ="font-style:bolditalic;font-size:14pt ; "align="left" width="12%">
				Quote 960<a href="javascript:;"> 
		</td></tr>
		<tr><td colspan="4">&nbsp;</td></tr>

		<tr>
			<td class="links" align="left" width="16%"><a href="../Servlet?dms_id=01bfbf77a31318ae65d9d52f7d05646f"  class="button2" style="width:190px">Go to Submission Summary</a></td>	
			<td class="links" align="left" width="16%"><a href="../Servlet?dms_id=5cb6edbda2b192addd5e72221ec2d792" title="Click to go to Master Insured Record" class="button2" style="width:190px" />Go to Insured Master Record</a></td>
			<td align="left" width="12%">
			
				<form name="form1" method="post" action="../cvstarr/CreateQuoteProposalEIL.jsp">
						<input type="hidden" value="<%=request.getParameter("PilotAircraft") %>" name="PilotAircraft" id="PilotAircraftQuoteSummary"/>
						<%if(session.getAttribute("QuoteProposal").toString()=="Create Quote Proposal"){%>
							<a href="javascript:doPost()" id="Create_Quote_Proposal" class="button2" style="margin:18px 0 0 0;width:130px"><%=session.getAttribute("QuoteProposal")%></a>
						<%}%>
				</form>
				<%if(session.getAttribute("QuoteProposal").toString()=="Issue Binder"){%>
					<a href="../cvstarr/IssueBinderEIL.jsp" id="Create_Quote_Proposal" class="button2" style="width:130px"><%=session.getAttribute("QuoteProposal")%></a>
				<%}%>						
			</td>

			<td  align="left" width="10%">
						<a href="../Servlet?dms_id=37dc15160b8ca7597680568cc02e08ad" id="Refer_Quote" class="button2" style="width:100px">Refer</a>
			</td>						
		
			<td  align="left" width="10%">
				<a href="../Servlet?dms_id=4d94e0fb249c5c262835761064951f28" id="Lapse_Quote" class="button2" style="width:100px">Lapse</a>
			</td>
			<td class="links"align="left" width="10%">
	 			<a href="../Servlet?dms_id=7ab4df4de15d297c982931fda6d269fa">Activity Log </a>
			</td>  	
		</tr>
		</table>
	</td></tr>

	<tr><td align="left">
		<table WIDTH="760px" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		<tr><td>
			<table width="100%" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0">	
				<tr></td></tr>
			</table>
		</td></tr>				
		</table>
	</td></tr>
	</table>
	
	<table width="97.5%">
	    <tr>
		<td class="NewSectionHead" colspan="5" align="center">QUOTE SUMMARY</td>
		</tr>
	</table>


<!--##########################NEW QUOTE HEADER START #########################################-->
	
 	<table border="0" width="100%" id="table1" cellspacing="0" cellpadding="0" align="left">
	<tr>
		<td align="left" valign="top">
			<div class="frame10border">
			<div class="formhead"><h2 class="left">Quote</h2></div>
				<div class="frlabel3 left">
					Status:<br />
					Effective Date:<br />
					Company Paper:<br />
					Last Updated:<br />
						&nbsp;
				</div>
				<div class="frinfo3 left" style="width:200px;">
					<%=session.getAttribute("quotestatus")%><br />
					April 20 2010 <br />
					Starr Indemnity & Liability Company<br />
					April 20 2010 <br />
						&nbsp;
				</div>
			</div>
		</td >
		<td align="left"  valign="top">
			<div class="frame11border">
			<div class="formhead"><h2 class="left">Insured</h2><div align=right style=" margin-top: 5px; margin-right: 5px;"><a href="../Servlet?dms_id=dde292f426dbd866144b31d983d4646c" >Insured Details</a></div></div>
				<div class="frlabel3 left">
					Name:<br />
					Address:<br />
					City:<br />
					State:<br />
					Zip:<br />&nbsp;
					Agency Name:<br />
					Agent Name:<br />
				</div>
				<div class="frinfo11">
					<a href="../Servlet?dms_id=dde292f426dbd866144b31d983d4646c" >test</a><br />
					<br />
					Marion<br />
					OH<br />
					43301<br />
					
					<a href="../Servlet?dms_id=c351192dfcb8c647035cbc99072474ad">Solartis Agency</a><br/>
					<a href="../Servlet?dms_id=0d392821e2ae3a92863f701f822e5804">Solartis Agent</a>
				</div>
			</div>
		</td>
	</tr>
</table>

<!--##########################NEW QUOTE HEADER END #########################################-->	
	</td>
	</tr>
</table>
<jsp:include page="QuoteSummary.jsp"/>
</div>
</html>



