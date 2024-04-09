<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/PolicyApplication.js"> </SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/PolicySummary.js">
</script>



<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<bean:define id="policyNumber" name="PolicySummary" property="answer(policyNumber)" />

<bean:define id="custId" name="PolicySummary" property="answer(customerId)" />
<bean:define id="parentQuoteId" name="PolicySummary" property="answer(parentQuoteId)" />
<bean:define id="productVerId" name="PolicySummary" property="answer(productVerId)" />
<bean:define id="productId" name="PolicySummary" property="answer(productId)" />

<bean:define id="QuoteStatus" name="PolicySummary" property="answer(quoteStatus)" />
<bean:define id="SubQuoteVerId" name="PolicySummary" property="answer(subQuoteVerId)" />
<bean:define id="QuoteType" name="PolicySummary" property="answer(Object::Quote::QuoteType)" />
<bean:define id="SubQuoteId" name="PolicySummary" property="answer(subQuoteId)" />
<bean:define id="parentQuoteVerId" name="PolicySummary" property="answer(parentQuoteVerId)" />

<bean:define id="policyId" name="PolicySummary" property="answer(policyId)" />
<bean:define id="policyVerId" name="PolicySummary" property="answer(policyVerId)"  />

<bean:define id="prdid" name="PolicySummary" property="answer(Object::Quote::ProductId1)"  />




<%String conditionFlag = "N"; %>
<%if(request.getAttribute("conditionFlag") != null){
	conditionFlag = "Y";
}
	
%>

<logic:empty name="PolicySummary" property="answer(policyId)">
	<% policyId = "" + request.getParameter("answer(policyId)"); %>
</logic:empty>

<logic:empty name="PolicySummary" property="answer(policyId)">
	<% policyVerId = "" + request.getParameter("answer(policyVerId)"); %>
</logic:empty>



<bean:define id="agencyId" name="PolicySummary" property="answer(Object::Agency::AgencyId)"  />

<bean:define id="applicationType" name="PolicySummary" property="answer(applicationType)" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />


<!-- <table width="100%"> -->
<% String DocumentType = "ISSUANCE"; %>
<% String policyStatus = ""; %>
<% String ratingTerritory = ""; %>
<% String ratingTerritoryName = ""; %>

<dmshtml:GetPolicyApplicationSummary nameInSession="PolicyApplication" policyId="<%=Long.parseLong(""+policyId) %>" policyVerId="<%=Long.parseLong(""+policyVerId) %>" applicationType="<%=""+applicationType %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
<% String riskState1 = ""; %>
<logic:present name="PolicyApplication">
	
	<%com.dms.ejb.insurance.policy.pl.PLPolicyDetail plpolicyDetail = (com.dms.ejb.insurance.policy.pl.PLPolicyDetail)request.getAttribute("PolicyApplication"); %>
	<% java.util.ArrayList arrPLPolicyDetail = plpolicyDetail.getPLResPropertyList();%>
	<% for(int index=0;index<arrPLPolicyDetail.size();index++){
		com.dms.ejb.insurance.policy.pl.PLResPropertyDetail polResPropertyDetail=(com.dms.ejb.insurance.policy.pl.PLResPropertyDetail)arrPLPolicyDetail.get(index);					 			
	%>
	<% riskState1 = polResPropertyDetail.getStateCode(); 
	}%>
	
</logic:present>

<table WIDTH="100%" ALIGN="justify" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr height="10"><td></td></tr>
		<tr>
			<td width="100%" bgcolor="#C6DEEA">
				<jsp:include page="../common/CustomerAgencyLinkspage.jsp">
					<jsp:param name="answer(Object::Customer::CustomerId)" value="<%=""+custId%>" />
				</jsp:include>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	
</table>

<table WIDTH="100%" ALIGN="justify" BORDER="0" CELLSPACING="0" CELLPADDING="0">
 	<tr>
		<td>

				<jsp:include page="../common/DynamicPolicyHeader.jsp">
					<jsp:param name="policyId" value="<%=policyId.toString()%>" />
					<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
					<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
					<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
				</jsp:include>
		 </td>
  	</tr>
</table> 

<%String isActivePolicy =(String) request.getAttribute("isActivePolicy");  
  String bgcolor ="#C6DEEA";
  String headerName ="dolphinnav";
  String bodyDiv = "dolphincontainer1";
  String applicationHeaderName ="dolphinsubnav";
  String policyDetailHeader = "NewSectionHead";
   if (!(isActivePolicy.equals("Y"))){
	   bgcolor ="#CCCCCC";
	   headerName ="priorpolicydolphinnav";
	   bodyDiv = "dolphincontainerActive1";
	   applicationHeaderName ="oldPolicydolphinsubnav";
	   policyDetailHeader ="NewSectionHead1";
   }

%>
	 
	
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
	<tr>
	<td colspan="20" class="links" width="400px">
		
		<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=custId.toString()%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>">Quote Summary</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<dmshtml:isActivePolicy policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
	      <%isActivePolicy =(String) request.getAttribute("isActivePolicy");  %>
	
	
	     <%if(isActivePolicy.equals("N")){ %>
	     <% String currentPolicyVerId = (String)request.getAttribute("currentVerId"); %>
	    
		<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+currentPolicyVerId%>&answer(policyId)=<%=""+policyId%>&answer("conditionFlag") = "N">Active Policy</a>
	  <%} %>
		
	</td>	
	</tr>
	<tr><td width="50%">&nbsp;</td>	</tr>
	<tr>
	
		<td>
			<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" >
				<tr>
					<td class="<%=policyDetailHeader%>" colspan="8" align="center">
						POLICY DETAILS						
					</td>
				</tr>	
					<tr height="2" >
							<td></td>
					</tr>
			
					
			</table>
		</td>
		
	</tr>
		     
	
	<tr>
		<td align="left" width="100%" >
			<div id="<%=bodyDiv%>">
				<div id="<%=headerName%>">
					<ul>
						<li><a rel="PolicySummary" onclick="showPolicySummary('<%=headerName%>');" ><span>Summary</span></a></li>
						<li><a rel="Insured" onclick="showInsured('<%=headerName%>');" ><span>Insured</span></a></li>
						<li><a rel="Application" onclick="showApplication('<%=headerName%>');" ><span>Application</span></a></li>
						<li><a rel="Document" onclick="showDocuments('<%=headerName%>');" > <span>Document</span></a></li>
						
						<li><a rel="PostBoundCheckList" onclick="showPostBoundCheckList('<%=headerName%>');"><span>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PREIVEW_ISSUANCE_DOCUMENT"}%>' connector='or' negated="true">
						Post Bound Check List
						</dmshtml:dms_static_with_connector>
						</span></a></li>
						
						<li><a rel="Endorsements" onclick="showEndorsements('<%=headerName%>');"><span>Endorsements</span></a></li>				
					</ul>
				</div>		
				 <div id="PolicySummary" class="innercontent">  
					<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">	
										
						
																		
					<!-- Policy summary tab contents STArt -->	
<dmshtml:GetDynamicPolicySummary nameInSession="policysummarycontent" policyId="<%=Long.parseLong(""+policyId)%>" policyVerId="<%=Long.parseLong(""+policyVerId)%>" parentQuoteId="<%=Long.parseLong(""+parentQuoteId)%>" productId="<%=Long.parseLong(""+productId)%>" productVerId="<%=Long.parseLong(""+productVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" riskState="<%=""+riskState1%>" queryString="POLICY_SUMMARY_TAB_ALGORITHM"  DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 							
						<logic:present name="policysummarycontent" scope="request">
						 	<bean:define id="htmlPage" name="policysummarycontent"	type="java.lang.StringBuffer" />
						 	<tr><td width="100%"><table width="60%" border="0">	
						 	<tr height="50">
							<td class="sectionhead1" width="30%">
								COVERAGES
							</td>
							<td class="sectionhead1" width="13%" align="center">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LIMIT
							</td>
							<td></td>
							<td class="sectionhead1" width="15%" align="right">
								PREMIUM
							</td>
						</tr>	
						<tr>
						<td width="30%"></td>
						<td width="13%"></td>
						<td></td>
		    			<td width="15%" align="right"></td>
						</tr>			 											
							<%out.println(htmlPage.toString());%>
							</table></td></tr>
						</logic:present>
					
													
					<!-- Policy summary tab contents end -->	
					</table>
			 	</div> 
<dmshtml:GetPolicyInsured nameInSession="policyinsured" parentPolicyId="<%=Long.parseLong(""+policyId)%>" parentPolicyVerId="<%=Long.parseLong(""+policyVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>			 	
			 	<div id="Insured" class="innercontent">
			 		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
			 			<tr><td td width="100%">
			 				<table width="99%" border="0">	
			 					<tr height="30">
			 						<td class="FormLabels" width="3%">			 						
			 							S.No
			 						</td>
			 						<td class="FormLabels" width="12%">
			 							Insured Type
			 						</td>
			 						<td class="FormLabels" width="18%">
			 							Insured Name
			 						</td>
			 						<td class="FormLabels" width="15%">
			 							Address 1
			 						</td>
			 						<td class="FormLabels" width="15%">
			 							Address 2
			 						</td>
			 						<td class="FormLabels" width="13%">
			 							City
			 						</td>
			 						<td class="FormLabels" width="5%">
			 							State
			 						</td>
			 						<td class="FormLabels" width="5%">
			 							Zip
			 						</td>
			 						<td class="FormLabels" width="14%">
			 							Phone Number
			 						</td>			 						
			 					</tr>
			 					<logic:present name="policyinsured" scope="request">			 								 					
			 						<%int indx=1; %>
			 						<logic:iterate id="policyinsured" name="policyinsured">
					 					<tr height="20">
					 						<td class="TextMatter1">
					 							<%=indx++ %>
					 						</td>
					 						<td class="TextMatter1">
					 							<bean:write name="policyinsured" property="Object::Policy::Insured::Polinsuredtype" />
					 						</td>
					 						<td class="TextMatter1">
					 							<bean:write name="policyinsured" property="Object::Policy::Insured::InsuredFullName" />
					 							<!-- bean:write name="policyinsured" property="Object::Policy::Insured::Insuredmname" / -->
					 							<!--  bean:write name="policyinsured" property="Object::Policy::Insured::Insuredfname" / -->
					 						</td>
					 						<td class="TextMatter1">
					 							<bean:write name="policyinsured" property="Object::Policy::Insured::Address1" />
					 						</td>
					 						<td class="TextMatter1">
					 							<bean:write name="policyinsured" property="Object::Policy::Insured::Address2" />
					 						</td>
					 						<td class="TextMatter1">
					 							<bean:write name="policyinsured" property="Object::Policy::Insured::City" />
					 						</td>
					 						<td class="TextMatter1" align="center">
					 							<bean:write name="policyinsured" property="Object::Policy::Insured::State" />
					 						</td>
					 						<td class="TextMatter1">
					 							<bean:write name="policyinsured" property="Object::Policy::Insured::Zip" />
					 						</td>
					 						<td class="TextMatter1">
					 							<bean:write name="policyinsured" property="Object::Policy::Insured::Workphoneareacode" />-
					 							<bean:write name="policyinsured" property="Object::Policy::Insured::Workphoneexchgcode" />-
					 							<bean:write name="policyinsured" property="Object::Policy::Insured::Workphone" />
					 						</td>					 						
					 					</tr>
				 					</logic:iterate>
			 					</logic:present>
			 				</table>
			 			</td></tr>
			 		</table>
			 	</div>
			 	

			 	
			 	<div id="Application" class="innercontent">
			 		<div id="dolphinsubcontainer">														
						<div id="<%=applicationHeaderName%>">							
							<ul>
								<li><a rel="PropertyDetails" onclick="showProperty(this.form,'<%=applicationHeaderName%>');"><span>Property Details</span></a></li>
								<li><a rel="LossHistory" onclick="showLossHistory('<%=applicationHeaderName%>');"><span>Loss History</span></a></li>
								<li><a rel="AdditionalInformation" onclick="showAddlInformation('<%=applicationHeaderName%>');"><span>Additional Information</span></a></li>
								<li><a rel="AdditionalInterests" onclick="showAddlInterests('<%=applicationHeaderName%>');"><span>Additional Interests</span></a></li>
							</ul>	
						</div>				
					
						
					
							
					<div id="PropertyDetails" class="innersubcontent">
					 	<logic:present name="PolicyApplication">
					 		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
					 		

					 		<%com.dms.ejb.insurance.policy.pl.PLPolicyDetail plpolicyDetail = (com.dms.ejb.insurance.policy.pl.PLPolicyDetail)request.getAttribute("PolicyApplication"); %>
					 		<% java.util.ArrayList arrPLPolicyDetail = plpolicyDetail.getPLResPropertyList();%>
					 		<% for(int index=0;index<arrPLPolicyDetail.size();index++){
					 			com.dms.ejb.insurance.policy.pl.PLResPropertyDetail polResPropertyDetail=(com.dms.ejb.insurance.policy.pl.PLResPropertyDetail)arrPLPolicyDetail.get(index);					 			
					 		%>
					 			<tr height="40">
					 				<td class='FormLabels' width='50%'> Year Built
									</td>
									<td class='TextMatter1'>
									<%= ""+polResPropertyDetail.getDateBuilt()%>
									</td>
					 			</tr>
					 			<tr height="20">
					 				<td class='FormLabels' width='50%'>Construction Type
									</td>
									<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getConstructionType() %>
									</td>
								</tr>
								
								<tr height="20">
					 				<td class='FormLabels' width='50%'>Protection Class
									</td>
									<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getProtectionClass() %>
									</td>
					 			</tr>
					 			<tr height="20">
					 				<td class='FormLabels' width='50%'>Sq. Ft.
									</td>
									<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getSquareFeet() %>
									</td>
					 			</tr>
					 			<tr height="20">
					 				<td class='FormLabels' width='50%'>Rating Territory
									</td>
									<td class='TextMatter1'>
									<%									 
									  if(polResPropertyDetail.getStateCode().equals("FL")){
									%>
										<%ratingTerritory=""+polResPropertyDetail.getRatingTerritory();%>
										<%=""+polResPropertyDetail.getMTerritoryName() %><%ratingTerritoryName=""+polResPropertyDetail.getMTerritoryName();%>
									<%}else{ %>	
										<%=""+polResPropertyDetail.getRatingTerritory() %><%ratingTerritory=""+polResPropertyDetail.getRatingTerritory();%>
										
										
									<%} %>	
									</td>
					 			</tr>
					 			<tr height="20">
					 				<td class='FormLabels' width='50%'>Market Value
									</td>
									<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getMarketValue() %>
									</td>
					 			</tr>
					 			<tr height="20">
					 				<td class='FormLabels' width='50%'>Distance to Fire Hydrant
									</td>
									<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getFireHydrantDistance() %>
									</td>
					 			</tr>
					 			<tr height="20">
					 				<td class='FormLabels' width='50%'>Distance to Fire Station
									</td>
									<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getFireStationDistance() %>
									</td>
					 			</tr>
					 			<tr height="20">
					 				<td class='FormLabels' width='50%'># of Families
									</td>
									<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getNumberOfFamilies() %>
									</td>
					 			</tr>
					 			<tr height="20">
					 				<td class='FormLabels' width='50%'>Primary Source of Heat
									</td>
									<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getHeatSource() %>
									</td>
					 			</tr>
					 			<tr height="20">
					 				<td class='FormLabels' width='50%'>Electric Service Type
									</td>
									<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getElectricServiceType() %>
									</td>
					 			</tr>
					 			<tr height="20">
					 				<td class='FormLabels' width='50%'>Occupancy
									</td>
									<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getOccupancy() %>
									</td>
					 			</tr>
					 			<tr height="20">
					 				<td class='FormLabels' width='50%'>Type of Residence
									</td>
									<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getResType() %>
									</td>
					 			</tr>
					 			<tr height="20">
					 				<td class='FormLabels' width='50%'>Central Station Fire Alarm
									</td>
									<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getFireAlarmCentral() %>
									</td>
					 			</tr>
					 			<tr height="20">
					 				<td class='FormLabels' width='50%'>Central Station Burglary Alarm
									</td>
									<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getBurglaryAlarmCentral() %>
									</td>
					 			</tr>
					 			<tr height="20">
					 				<td class='FormLabels' width='50%'>Eligible for Wind Pool*
									</td>
									<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getWindPoolEligibility() %>
									</td>
					 			</tr>
					 			<tr height="20">
					 				<td class='FormLabels' width='50%'>Hurricane Shutters
									</td>
									<td class='TextMatter1'>
									<%=""+polResPropertyDetail.getHurricaneShutter() %>
									</td>
					 			</tr>
					 			<tr height="40">
					 				<td class='sectionhead1' colspan="2">
										* Policy excludes wind & hail coverage if dwelling is eligible for Wind Pool
									</td>
									<td class='FormLabels'>
										
									</td>
									
					 			</tr>
					 			
					 			<tr height="20">
					 				<td class="FormLabels" width='50%'>
					 				Distance to Coastal Waters ( required information if wind and hail coverage is included and dwelling is within 5 miles )
					 				</td>	
					 				<td class='TextMatter1'>
					 					<!-- changes done for #2453 -->										
										<%
											String dispDist = "";
											String distance = ""+polResPropertyDetail.getCostalWaterDistance();
											
											if(distance.equals("4000")){
												dispDist = "1001 ft - 1 mile";	
											}
											else if(distance.equals("500")){
												dispDist = "Within 1000 feet";	
											}
											else if(distance.equals("20000")){
												dispDist = "> 1 mile - 5 miles";	
											}
											else if(distance.equals("30000")){
												dispDist = "5+ miles";	
											}
											else if(distance.equals("25000")){
												dispDist = "< 3 miles";	
											}
											else if(distance.equals("50000")){
												dispDist = "3-10 miles";	
											}
											else if(distance.equals("100000")){
												dispDist = "1st tier county >10 miles";	
											}
											else if(distance.equals("-1")){
												dispDist = "2nd tier county";	
											}
											else if(distance.equals("21000")){
												dispDist = "5+ miles";	
											}
											else if(distance.equals("5000")){
												if(polResPropertyDetail.getMZone().equals("1")){
													dispDist = "< 2 miles";
												}else if(polResPropertyDetail.getMZone().equals("2")){
													dispDist = "< 2 miles";
												}else {
													dispDist = "< 1 mile";
												}	
											}
											else if(distance.equals("55000")){
												if(polResPropertyDetail.getMZone().equals("1")){
													dispDist = "2+ miles";
												}else if(polResPropertyDetail.getMZone().equals("2")){
													dispDist = " 2-10 miles";
												}else {
													dispDist = "1-5 mile";
												}	
											}else if(distance.equals("26000")){
												if(polResPropertyDetail.getMZone().equals("2")){
													dispDist = "10-25 miles";
												}else {
													dispDist = "5-25 mile";
												}		
											}else if(distance.equals("15000")){
												dispDist = "25+ miles";
											}
											else if(distance.equals("60000")){
												dispDist = "Within 1000 feet";	
											}
											else if(distance.equals("6000")){
													
												dispDist = 	"<2,500 feet";
										   } 
										    else if(distance.equals("7000")){
										    	dispDist = 	"2,500+ feet";
										    }
										  %>
										<%=dispDist %>	
																		
									</td>				 				
					 			</tr>
					 			
					 			<tr height="40">
									<td class='sectionhead1' width='50%' colspan="2">
										If dwelling was built in 1950 or earlier, then answer the following two questions:									
									</td>	
									<td class='FormLabels'>
										
									</td>				 			
					 			</tr>
					 			
					 			<tr height="20">
					 				<td class="FormLabels" width='50%'>
					 					i) Has the wiring, heating, and plumbing been fully updated in the past 40 years?
					 				</td>
					 				<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getIsWiringUpdated()%>
									</td>
					 			</tr>
					 			
					 			<tr height="20">
					 				<td class='FormLabels' width='50%' >
										&nbsp;&nbsp;a) Wiring					 					
					 				</td>	
					 				<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getWiringUpdated() %>
									</td>
					 			</tr>
					 			<tr height="20">
									<td class='FormLabels' width='50%' >
										&nbsp;&nbsp;b) Heating
									</td>
									<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getHeatingUpdated() %>
									</td>
								</tr>
								<tr height="20">
									<td class='FormLabels' width='50%' >
										&nbsp;&nbsp;c) Plumbing
									</td>
									<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getPlumbingUpdated() %>
									</td>
								</tr>
								<tr height="20">
									<td class='FormLabels' width='50%' >
										ii) the roof been updated in the last 25 years?
									</td>	
									<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getIsRoofUpdated() %>
									</td>
								</tr>
								<tr>
									<td class='FormLabels' width='50%' >
										&nbsp;&nbsp;a) Roof
									</td>
									<td class='TextMatter1'>
										<%=""+polResPropertyDetail.getRoofUpdated() %>
									</td>
								</tr>								 								 						 			
					 		</table>
					 		<%}%>	
					 </logic:present>
					 		
					 	</div>					 	

					 	<div id="LossHistory" class="innersubcontent">					  		
					  							 				
					 		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">		
					 			<tr height="40">
						 			<td class="FormLabels" width='17%'>		
						 				Date (mm-dd-yyyy)		 				
						 			</td>
						 			<td class="FormLabels" width='15%'>		
						 				Type of Loss			 				
						 			</td>
						 			<td class="FormLabels" width='20%'>		
						 				Description			 				
						 			</td>
						 			<td class="FormLabels" width='30%'>		
						 				Insurance Company Name			 				
						 			</td>
						 			<td class="FormLabels" width='20%'>		
						 				Amt Paid/Reserved 			 				
						 			</td>
					 			</tr>
					 		
					 			<logic:present name="PolicyApplication">	
					 		 		
							 		<%com.dms.ejb.insurance.policy.pl.PLPolicyDetail plpolicyDetail = (com.dms.ejb.insurance.policy.pl.PLPolicyDetail)request.getAttribute("PolicyApplication"); %>
							 		<% java.util.ArrayList arrPLPolicyDetail = plpolicyDetail.getPLResPropertyList();%>
							 		<% for(int index=0;index<arrPLPolicyDetail.size();index++){%>
					 				
					 				<% com.dms.ejb.insurance.policy.pl.PLResPropertyDetail polResPropertyDetail=(com.dms.ejb.insurance.policy.pl.PLResPropertyDetail)arrPLPolicyDetail.get(index); %>
						 			<% java.util.ArrayList arrPLResDetail=polResPropertyDetail.getPLLossHistoryList();%>
						 			
							 		<% for(int index2=0;index2<arrPLResDetail.size();index2++){%>
							 		
					 				<% com.dms.ejb.insurance.policy.pl.PLResPropertyLossHistoryDetail plLossHistoryDetail=(com.dms.ejb.insurance.policy.pl.PLResPropertyLossHistoryDetail)arrPLResDetail.get(index2);%>	
													 						 								 			
					 			<tr height="20">
					 				<td class='TextMatter1' width="10%">							 					
					 					<%--<%=""+plLossHistoryDetail.getLossDate() %>--%>
					 					<%String lossDate = ""+plLossHistoryDetail.getLossDate(); 				 					
										    
	                                        String arrLossDate[] = lossDate.split("-");
	                                        
	                                        String YYYY = arrLossDate[0];
											String MM = arrLossDate[1];
											String DD = arrLossDate[2];
											
											lossDate = MM+"-"+DD+"-"+YYYY;
										%>
					 					<%=lossDate %>				 					
					 				</td>
					 				<td class='TextMatter1' width='20%'>
					 					<%=""+plLossHistoryDetail.getLossType() %>
					 				</td>
					 				<td class='TextMatter1' width='20%'>
					 					<%=""+plLossHistoryDetail.getLossCause() %>
					 				</td>
					 				<td class='TextMatter1' width='30%'>
					 					<%=""+plLossHistoryDetail.getInsCompanyName() %>
					 				</td>
					 				<td class='TextMatter1' width='20%'>
					 					<dmshtml:CurrencyFormatTag format="<%=""+plLossHistoryDetail.getAmtPaidReserved()%>"/>
					 					<%--<%=""+plLossHistoryDetail.getAmtPaidReserved() %>--%>
					 				</td>					 				
					 			</tr>
					 							 	
					 		<%}%>
					 <%}%>
					 </logic:present>
					 		
					 	</table>
					 	
					 	
					 	</div>
					 	
					 	<div id="AdditionalInformation" class="innersubcontent">	
					 	<logic:present name="PolicyApplication">
					 		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
					 		<%com.dms.ejb.insurance.policy.pl.PLPolicyDetail plpolicyDetail = (com.dms.ejb.insurance.policy.pl.PLPolicyDetail)request.getAttribute("PolicyApplication"); %>
					 		<% java.util.ArrayList arrPLPolicyDetail = plpolicyDetail.getPLResPropertyList();%>
					 		<% for(int index=0;index<arrPLPolicyDetail.size();index++){
					 			com.dms.ejb.insurance.policy.pl.PLResPropertyDetail polResPropertyDetail=(com.dms.ejb.insurance.policy.pl.PLResPropertyDetail)arrPLPolicyDetail.get(index);
					 		%>
					 		
					 			<tr height="40">
					 			<td>&nbsp;</td>
					 			</tr>
					 			<tr height="20">
					 				<td class='FormLabels' width='50%'>
					 					Is any child care business conducted on the premises?
					 				</td>
					 				<td class='TextMatter1'>
					 					<%=""+polResPropertyDetail.getChildCareBusinessConducted() %>
					 				</td>
					 			</tr>
					 			
					 			<tr height="20">
					 				<td class="FormLabels" width="50%">
					 					Is any other business conducted on the premises?
					 				</td>
					 				<td class="TextMatter1">
					 					<%=""+polResPropertyDetail.getOtherBusiness() %>
					 				</td>
					 			</tr>
					 			
					 			<tr height="20">
					 				<td class="FormLabels" width="50%">
					 					If yes, please explain the type of business conducted:
					 				</td>
					 				<td class="TextMatter1">
					 					<%=""+polResPropertyDetail.getBusinessType() %>
					 				</td>
					 			</tr>
					 			<tr height="20">
					 				<td class="FormLabels" width="50%">
					 					Does any part of the premises consist of a "mobile home"?
					 				</td>
					 				<td class="TextMatter1">
					 					<%=""+polResPropertyDetail.getMobileHome() %>
					 				</td>
					 			</tr>
					 			<tr height="20">
					 				<td class="FormLabels" width="50%">
					 					Is there a trampoline on the premises?
					 				</td>
					 				<td class="TextMatter1">
					 					<%=""+polResPropertyDetail.getTrampoline() %>
					 				</td>
					 			</tr>
					 			<tr height="20">
					 				<td class="FormLabels" width="50%">
					 					Are there any animals on the premises?
					 				</td>
					 				<td class="TextMatter1">
					 					<%=""+polResPropertyDetail.getAnimalsOnPremises() %>
					 				</td>
					 			</tr>
					 			<tr><td>&nbsp;</td></tr>
					 			<tr height="20">
					 				<td class="FormLabels" width="50%">
					 					Is any of the animals one of the following breeds of dog - <br>Chow, Pit Bull, Doberman, Rottweiler, Wolf Hybrid, Akita, Bull Mastiff
					 				</td>
					 				<td class="TextMatter1">
					 					<%=""+polResPropertyDetail.getBitingAnimals() %>
					 				</td>
					 			</tr>
					 			<tr><td>&nbsp;</td></tr>
					 			 <tr height="20">
                                <td class="FormLabels" width="50%">
                                   For all animals on premises describe their type, breed and bite history:
                                </td>
							        <td class="TextMatter1">
							         <%=""+polResPropertyDetail.getAnimalsBiteHistory() %>
							        </td>
						        </tr>
					 			<tr height="20">
					 				<td class="FormLabels" width="50%">
					 					Is there a swimming pool on the premises, and if so is it fenced? 
					 				</td>
					 				<td class="TextMatter1">
					 					<%=""+polResPropertyDetail.getSwimmingPoolAndFenceType() %>
					 				</td>
					 			</tr>
					 			<tr height="20">
					 				<td class="FormLabels" width="60%">
					 					In the last five years has the applicant been involved with a:
					 				</td>
					 				<td class="FormLabels">
					 					
					 				</td>
					 			</tr>
					 			<tr height="20">
					 				<td class="FormLabels" width="50%">
					 					Bankruptcy
					 				</td>
					 				<td class="TextMatter1">
					 					<%=""+polResPropertyDetail.getBankruptcy() %>
					 				</td>
					 			</tr>
					 			<tr height="20">
					 				<td class="FormLabels" width="50%">
					 					Repossession
					 				</td>
					 				<td class="TextMatter1">
					 					<%=""+polResPropertyDetail.getRepossession() %>
					 				</td>
					 			</tr>
					 			<tr height="20">
					 				<td class="FormLabels" width="50%">
					 					Foreclosure (open or closed)
					 				</td>
					 				<td class="TextMatter1">
					 					<%=""+polResPropertyDetail.getForeclosure() %>
					 				</td>
					 			</tr>
					 		</table>
					 	<%}%>
					 	</logic:present>
					 	</div>
					 
					 	<div id="AdditionalInterests" class="innersubcontent">	
					 	<logic:present name="PolicyApplication">		 	
					 		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
					 		<tr height="30">
					 				<td class="FormLabels">
					 					Additional Interests 
					 				</td>
					 				<td class="FormLabels">
					 					Name
					 				</td>
					 				<td class="FormLabels">
					 					Loan Number 
					 				</td>
					 				<td class="FormLabels">
					 					Address1
					 				</td>
					 				<td class="FormLabels">
					 					Address2
					 				</td>
					 				<td class="FormLabels">
					 					City
					 				</td>
					 				<td class="FormLabels">
					 					State 
					 				</td>
					 				<td class="FormLabels">
					 					Zip Code
					 				</td>
					 			</tr>
					 		<%com.dms.ejb.insurance.policy.pl.PLPolicyDetail plpolicyDetail = (com.dms.ejb.insurance.policy.pl.PLPolicyDetail)request.getAttribute("PolicyApplication"); %>
					 		<% java.util.ArrayList arrPLPolicyDetail = plpolicyDetail.getPLResPropertyList();%>
					 		<% for(int index=0;index<arrPLPolicyDetail.size();index++){
					 			com.dms.ejb.insurance.policy.pl.PLResPropertyDetail polResPropertyDetail=(com.dms.ejb.insurance.policy.pl.PLResPropertyDetail)arrPLPolicyDetail.get(index);
					 		%>
					 		
					 		<% java.util.ArrayList arr2PLResDetail=polResPropertyDetail.getPLAdditionalInterestList();%>
					 		<% for(int index3=0;index3<arr2PLResDetail.size();index3++){%>
			 				<% com.dms.ejb.insurance.policy.pl.PLResPropertyAdditionalInterestDetail plAddlInterestDetail=(com.dms.ejb.insurance.policy.pl.PLResPropertyAdditionalInterestDetail)arr2PLResDetail.get(index3);%>	
					 			
					 			
					 			<tr height="20">
					 				<td class='TextMatter1'>
					 					<%=""+plAddlInterestDetail.getAdditionalInterestType() %>
					 				</td>
					 				<td class='TextMatter1'>
					 					<%=""+plAddlInterestDetail.getAdditionalInterestCompanyName() %>
					 				</td>
					 				<td class='TextMatter1'>
					 					<%=""+plAddlInterestDetail.getLoanNumber() %>
					 				</td>
					 				<td class='TextMatter1'>
					 					<%=""+plAddlInterestDetail.getAddress1() %>
					 				</td>
					 				<td class='TextMatter1'>
					 					<%=""+plAddlInterestDetail.getAddress2() %>
					 				</td>
					 				<td class='TextMatter1'>
					 					<%=""+plAddlInterestDetail.getCity() %>
					 				</td>
					 				<td class='TextMatter1'>
					 					<%=""+plAddlInterestDetail.getState() %>
					 				</td>
					 				<td class='TextMatter1'>
					 					<%=""+plAddlInterestDetail.getZip() %>
					 				</td>
					 			</tr>
					 			
					 			<%} %>
					 		<%} %>
					 		</table>
					 	</logic:present>
					 	</div>
					</div>
						<dmshtml:Get_Policy_HeaderInfo nameInSession="policyHeaderInfo" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId %>" policyNumber="<%=""+policyNumber%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" documentType='<%=DocumentType%>' />
										
					<% String riskState="";%>
					<% String dmsRiskId = "";%>
					<% String polRiskId = "";%>					
					<logic:present name="policyHeaderInfo">
						<%com.dms.ejb.insurance.policy.pl.PLPolicyDetail plPolicyDetail = (com.dms.ejb.insurance.policy.pl.PLPolicyDetail)request.getAttribute("policyHeaderInfo"); %>
						
							<%if(plPolicyDetail.getPLResPropertyList().size()!=0){
									java.util.ArrayList arrPLResPropertyDetail = plPolicyDetail.getPLResPropertyList();							
							%>	
							<% for(int arrIndex=0;arrIndex<arrPLResPropertyDetail.size();arrIndex++){
								com.dms.ejb.insurance.policy.pl.PLResPropertyDetail polResPropertyDetail=(com.dms.ejb.insurance.policy.pl.PLResPropertyDetail)arrPLResPropertyDetail.get(arrIndex);
							%>
							<%riskState = polResPropertyDetail.getStateCode();%>
							<%polRiskId = "" + polResPropertyDetail.getPolRiskResPropertyId();%>							
							<%dmsRiskId = "" + polResPropertyDetail.getDmsRiskResPropertyId();%>
			 	</div>

			 		
			 		<%policyStatus =plPolicyDetail.getPolicyStatus();%>	
			 		
<dmshtml:GetPolicyDocumentSummary documentType='<%=DocumentType%>' nameInSession="PolicyDocument" ownerId='<%=""+ownerId %>'  policyId='<%=Long.parseLong(""+policyId) %>' policyVerId='<%=Long.parseLong(""+policyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>				


	
			 	<div id="Document" class="innercontent">   
			 	
			 	
			 		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
			 		
			 			<tr height="30">
			 				<td class="FormLabels" colspan="3">
			 					Generated Documents<% %>
			 				</td>
			 			</tr>
			 			<tr height="30">
			 				<td class="FormLabels" width="15%">
			 					S.No
			 				</td>
			 				<td class="FormLabels" width="25%">
			 					Documents
			 				</td>
			 				<td class="FormLabels" width="20%">
			 					Generated By 
			 				</td>
			 				<td class="FormLabels" width="40%">
			 					Generated Date 
			 				</td>
			 			</tr>
			 			<%int indx=0; %>
			 			<%if(!policyStatus.equalsIgnoreCase("ISSUED") && !policyStatus.equalsIgnoreCase("CANCELED")){%>
			 			<dmshtml:GetDocumentLocation documentType='<%=new String[]{"PROPOSAL","BINDER","Issuance"}%>' nameInSession="PolDocLoc1" ownerId='<%=""+ownerId %>' policyId='<%=Long.parseLong(""+policyId) %>' policyVerId='<%=Long.parseLong(""+policyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			 			<logic:present name="PolDocLoc1">			 				
			 				<%
			 					java.util.ArrayList arrPolDocDetail= (java.util.ArrayList)request.getAttribute("PolDocLoc1");
								for(int docIndex=0;docIndex<arrPolDocDetail.size();docIndex++){		
									com.dms.ejb.insurance.policy.PolicyDocumentDetail polDocDetail=(com.dms.ejb.insurance.policy.PolicyDocumentDetail)arrPolDocDetail.get(docIndex);							
								%>			 				
	 			
					 			<%indx++; %>
					 			<tr>
					 				<td class="TextMatter1" width="15%">
					 				<%=indx %>
					 				</td>
					 				<td class="TextMatter1" width="25%">					 				
					 				<a href="javascript:void(0);" onClick="javascript:window.open('<%=""+polDocDetail.getDocumentUrl()%>')">
		   							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
					 					<%=""+polDocDetail.getPolicyDocName() %>
					 					</a>
					 				</td>
					 				<td class="TextMatter1" width="20%" >
					 					<%=""+polDocDetail.getCreatedBy() %>
					 				</td>			 				
					 				<td class="TextMatter1" width="40%">
					 					<%=""+polDocDetail.getCreatedDate() %>
					 				</td>
					 			</tr>
					 			
					 			<%						
								}					 			
					 			%>
			 				
			 			</logic:present>
			 			
			 			
			 			
			 			<%}else{%>
			 				<dmshtml:GetDocumentLocation documentType='<%=new String[]{"PROPOSAL","BINDER","Issuance"}%>' nameInSession="PolDocLoc" ownerId='<%=""+ownerId %>' policyId='<%=Long.parseLong(""+policyId) %>' policyVerId='<%=Long.parseLong(""+policyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
							 			<logic:present name="PolDocLoc">			 				
							 				<%
							 					java.util.ArrayList arrPolDocDetail= (java.util.ArrayList)request.getAttribute("PolDocLoc");
												for(int docIndex=0;docIndex<arrPolDocDetail.size();docIndex++){		
													com.dms.ejb.insurance.policy.PolicyDocumentDetail polDocDetail=(com.dms.ejb.insurance.policy.PolicyDocumentDetail)arrPolDocDetail.get(docIndex);							
												%>			 				
					 			
									 			<%indx++; %>
									 			<tr>
									 				<td class="TextMatter1" width="15%">
									 				<%=indx %>
									 				</td>
									 				<td class="TextMatter1" width="25%">					 				
									 				<a href="javascript:void(0);" onClick="javascript:window.open('<%=""+polDocDetail.getDocumentUrl()%>')">
						   							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
									 					<%=""+polDocDetail.getPolicyDocName() %>
									 					</a>
									 				</td>
									 				<td class="TextMatter1" width="20%" >
									 					<%=""+polDocDetail.getCreatedBy() %>
									 				</td>			 				
									 				<td class="TextMatter1" width="40%" colspan="2">
									 					<%=""+polDocDetail.getCreatedDate() %>
									 				</td>
									 			</tr>
									 			
									 			<%						
												}					 			
									 			%>
							 				
							 			</logic:present>				
				 									 						
				 						
			 			<%} %>
			 			<tr height="30">
			 			<td>&nbsp;</td>
			 			</tr>
			 			</table>
			 			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
			 			<%if(!policyStatus.equalsIgnoreCase("Issued")) {%>
			 			<dmshtml:dms_isPresent property="<%=new String[]{"BOUND","CANCELED"}%>" value="<%=QuoteStatus.toString()%>" negated="true" >
			 			<tr height="30">
			 				<td class="FormLabels" colspan="3">Selected Policy Forms</td>
			 			</tr>
			 			<tr height="30">
			 				<td class="FormLabels" width="15%">S.No
			 				</td>
			 				<td class="FormLabels" width="25%">Document Identifier
			 				</td>
			 				<td class="FormLabels" width="60%" >Document Title
			 				</td>
			 			</tr>
			 			<%int index=0; %>
			 			<%int count=0; %>
			 		
			 			<logic:present name="PolicyDocument">
			 			<% java.util.ArrayList PolicyDocumentDet= (java.util.ArrayList)request.getAttribute("PolicyDocument"); %>
			 			<%if(PolicyDocumentDet.size()>0){%>
			 			<logic:iterate id="PolDocument" name="PolicyDocument">		 
			 			<%com.dms.ejb.insurance.policy.PolicyDocumentDetail policyDocDetail = (com.dms.ejb.insurance.policy.PolicyDocumentDetail)PolicyDocumentDet.get(index); %>			 			
			 			<%index++; %>
			 			<%if(policyDocDetail.getGenerateDocument()== null) {%>		
			 				<tr height="20">
					 				<td class="TextMatter1" width="5%">		
					 				<%count++; %>			 				
					 				<%=count%>
					 				</td>			 				
					 				<td class="TextMatter1" width="15%">
					 				<bean:write name="PolDocument" property="documentNum"/>
					 				<bean:write name="PolDocument" property="documentSubNum"/>
					 				</td>
					 				<td class="TextMatter1" width="80%">
					 				<bean:write name="PolDocument" property="policyDocName"/>
					 				</td>			 					
					 		</tr>	 						 			
			 			<%} else if(policyDocDetail.getGenerateDocument().equals("Y") || policyDocDetail.getGenerateDocument().equals("")) {%>
				 			<tr height="20">
					 				<td class="TextMatter1" width="5%">
					 				<%count++; %>
					 				<%=count%>
					 				</td>			 				
					 				<td class="TextMatter1" width="15%">
					 				<bean:write name="PolDocument" property="documentNum"/>
					 				<bean:write name="PolDocument" property="documentSubNum"/>
					 				</td>
					 				<td class="TextMatter1" width="80%">
					 				<bean:write name="PolDocument" property="policyDocName"/>
					 				</td>			 					
					 		</tr>
					 	<%} %>
			 			</logic:iterate>
			 			<%}%>
			 			</logic:present>
			 		</dmshtml:dms_isPresent> 
			 			
		 			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PREIVEW_ISSUANCE_DOCUMENT"}%>' connector='or' negated="true">
		 			
		 			<tr height="20">
		 			<td class="links" colspan="3">
		 				<a href="/PreviewIssuancePdf.go?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(DocumentListSource)=Policy&answer(policyId)=<%=""+policyId%>&answer(policyVerId)=<%=""+policyVerId%>&answer(DocumentType)=ISSUANCE&answer(QuoteId)=<%=""+parentQuoteId%>&answer(ownerId)=<%=""+ownerId%>&answer(ProductVerId)=<%=""+productVerId%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(customerId)=<%=""+custId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(isPreview)=<%=true%>"  target="_new">Preview Issuance Document </a>	 					
		 			</td>
		 			</tr>
		 			</dmshtml:dms_static_with_connector>
		 			<%} %>
			 		</table>
			 		
			 		
			 	</div>						
			 	
			 	<div id="PostBoundCheckList" class="innercontent">
			 		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
			 		<tr><td>
			 		<html:form action="/IssanceApplicationVerfication.do" scope="request" onsubmit="return newchecksubmitcount1();">
			 		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PREIVEW_ISSUANCE_DOCUMENT"}%>' connector='or' negated="true">
			 			 	
			 			
			 		<%if(!policyStatus.equalsIgnoreCase("Issued")&& !policyStatus.equalsIgnoreCase("Canceled")){%>
			 		
			 			<tr>
							<td class="Error">
								<logic:present name="MESSAGE_LIST"> 
				 					<ul>
				 						<logic:iterate id="message" name="MESSAGE_LIST">
						 					<li><bean:write name="message"/></li>
						 				</logic:iterate>
								 	</ul>		 			
					 			</logic:present>
							</td>
						</tr>
						
						 <%com.dms.ejb.insurance.policy.pl.PLPolicyDetail plpolicyDetail = (com.dms.ejb.insurance.policy.pl.PLPolicyDetail)request.getAttribute("policyHeaderInfo"); %>
					     <% java.util.ArrayList policyIssuanceApplicationList = plpolicyDetail.getPolicyIssuanceApplicationList();%>
					     <%  int policyIssuanceApplicationListSize = 0;
					     	try {
						        policyIssuanceApplicationListSize =  policyIssuanceApplicationList.size();
					        } catch(Exception exc){ }
						 %>
						<%
						        String signedValue = "N";
						        String proofValue = "N";
						        String applicatValue = "N";
					    %>
						<%if(policyIssuanceApplicationListSize > 0){ %>
						<% 
							for(int index=(policyIssuanceApplicationListSize-3); index < policyIssuanceApplicationListSize; index++){
								com.dms.ejb.insurance.policy.PolicyIssuanceDetail policyIssuanceDetail = (com.dms.ejb.insurance.policy.PolicyIssuanceDetail)policyIssuanceApplicationList.get(index);
								if(policyIssuanceDetail.getAttributeName().equals("Object::Policy::Issuance::Application::Signed")) {
									signedValue = policyIssuanceDetail.getValue();
								}
								if(policyIssuanceDetail.getAttributeName().equals("Object::Policy::Issuance::Application::Proof")) {
									proofValue = policyIssuanceDetail.getValue();
								}
								if(policyIssuanceDetail.getAttributeName().equals("Object::Policy::Issuance::Application::Applicat")) {
									applicatValue = policyIssuanceDetail.getValue();
								}
							}
						%>

						<%}%>
						       
						<tr height="30">
							<td class="TextMatter1" width="45%">Signed Application Received</td>
							<td width="45%" class="TextMatter1" >
								<%if(signedValue.equals("N")){ %>
									<input type="radio" value="Y" name="answer(Object::Policy::Issuance::Application::Signed)" >Yes
									<input type="radio" value="N" name="answer(Object::Policy::Issuance::Application::Signed)" checked="true">No
								<%} else { %>
									<input type="radio" value="Y" name="answer(Object::Policy::Issuance::Application::Signed)" checked="true">Yes								
									<input type="radio" value="N" name="answer(Object::Policy::Issuance::Application::Signed)" >No
								<%} %>
								<html:hidden property='answer(Object::Policy::Issuance::AttributeId)' value="281"/>
							</td> 
						</tr>
						<tr height="20">
							<td class="TextMatter1">Proof of Denial Received</td>     
							<td width="45%" class="TextMatter1" >
								<%if(proofValue.equals("N")){ %>
									<input type="radio" value="Y" name="answer(Object::Policy::Issuance::Application::Proof)" >Yes
									<input type="radio" value="N" name="answer(Object::Policy::Issuance::Application::Proof)" checked="true">No
								<%} else { %>
									<input type="radio" value="Y" name="answer(Object::Policy::Issuance::Application::Proof)" checked="true">Yes
									<input type="radio" value="N" name="answer(Object::Policy::Issuance::Application::Proof)" >No        
								<%} %>
								<html:hidden property='answer(Object::Policy::Issuance::AttributeId)' value="282"/>        
							</td> 
						</tr>
						<tr height="20">
							<td class="TextMatter1">Application Data Entry completed</td>
							<td width="45%" class="TextMatter1" >
								<%if(applicatValue.equals("N")){ %>
						 			<input type="radio" value="Y" name="answer(Object::Policy::Issuance::Application::Applicat)">Yes
									<input type="radio" value="N" name="answer(Object::Policy::Issuance::Application::Applicat)" checked="true">No
								<%} else { %>
						 			<input type="radio" value="Y" name="answer(Object::Policy::Issuance::Application::Applicat)" checked="true">Yes
									<input type="radio" value="N" name="answer(Object::Policy::Issuance::Application::Applicat)">No         
								<%} %>
						 		<html:hidden property='answer(Object::Policy::Issuance::AttributeId)' value="283"/>        
						 	</td>
						 	<td><html:hidden property='answer(numberOfRadioQuestion)' value="3"/></td>   
						</tr>
						<tr><td>&nbsp;</td></tr><!--

			 			<tr height="30">
				 			<td class="TextMatter1" width="45%">
				 				Signed Application Received
				 			</td>
				 			<td width="45%" class="TextMatter1" >
				 					<html:radio value="Y" property="answer(Object::Policy::Issuance::Application::Signed)" styleId="signedYes">Yes</html:radio>
									<html:radio value="N" property="answer(Object::Policy::Issuance::Application::Signed)" styleId="signedNo">No</html:radio>
				 			</td>	
			 			</tr>
			 			<tr height="20">
			 				<td class="TextMatter1">
			 					Proof of Denial Received
			 				</td>			 	
			 				<td width="45%" class="TextMatter1" >
			 					<html:radio value="Y" property="answer(Object::Policy::Issuance::Application::Proof)" styleId="proofYes">Yes</html:radio>
								<html:radio value="N" property="answer(Object::Policy::Issuance::Application::Proof)" styleId="proofNo">No</html:radio>
			 				</td>	
			 			</tr>
			 			<tr height="20">
			 				<td class="TextMatter1"> 
			 					Application Data Entry completed
			 				</td>
			 				<td width="45%" class="TextMatter1" >
			 					<html:radio value="Y" property="answer(Object::Policy::Issuance::Application::Applicat)" styleId="applicatYes">Yes</html:radio>
								<html:radio value="N" property="answer(Object::Policy::Issuance::Application::Applicat)" styleId="applicatNo">No</html:radio>
			 				</td>			
			 			</tr><tr><td>&nbsp;</td></tr>
			 			--><%if(riskState.equalsIgnoreCase("MD") || riskState.equalsIgnoreCase("DE")){ %>


				 		<%//com.dms.ejb.insurance.policy.pl.PLPolicyDetail plpolicyDetail = (com.dms.ejb.insurance.policy.pl.PLPolicyDetail)request.getAttribute("policyHeaderInfo"); %>
				 		<% java.util.ArrayList arrPolicyIssuanceDetailList = plpolicyDetail.getPolicyIssuanceDetail();%>
				 		
				 		<%  int issuancePolicySize = 0;
					 		com.dms.ejb.data.QuestionHashMap carrierDetailMap = new com.dms.ejb.data.QuestionHashMap();
				 			try {
				 				issuancePolicySize =  arrPolicyIssuanceDetailList.size();
				 			} catch(Exception exc){ }
				 		%>
				 		<%if(issuancePolicySize > 0){ %>
				 		
					 		<% 
					 			for(int index=0; index < issuancePolicySize; index++){
					 				com.dms.ejb.insurance.policy.PolicyIssuanceDetail policyIssuanceDetail = (com.dms.ejb.insurance.policy.PolicyIssuanceDetail)arrPolicyIssuanceDetailList.get(index);					 			
					 				carrierDetailMap.put("DecliningCarrierValue" + index, policyIssuanceDetail.getDecliningCarrier() );
					 				carrierDetailMap.put("CarrierRepresentativeValue" + index, policyIssuanceDetail.getCarrierRepresentative() );
					 				carrierDetailMap.put("DeclinedDateValue" + index, ""+policyIssuanceDetail.getDeclinedDate() );
					 				carrierDetailMap.put("DiligentSearcherNameValue", policyIssuanceDetail.getDiligentSearcherName() );
					 				carrierDetailMap.put("DiligentSearcherTitleValue", policyIssuanceDetail.getDiligentSearcherTitle() );					 				
					 			} 
					 		%>
						<%}%>												
				 			<tr><td colspan="2">
				 				<table WIDTH="100%" ALIGN="center" BORDER="0" style="{border-width:1px; border-style:solid; border-color: #999999;}">

				 					<tr><td class="sectionheadLink" align="center">Carrier/Detail</td>
				 						<td class="sectionheadLink" align="center">Declining Carrier</td>
				 						<td class="sectionheadLink" align="center">Carrier Representative</td>
				 						<%if(riskState.equalsIgnoreCase("VA") || riskState.equalsIgnoreCase("MD")){ %>
				 							<td class="sectionheadLink" align="center">Date Declined (MM/DD/YYYY)</td>
				 						<%}%>
				 					</tr>
				 					
				 					  <%boolean readOnly =true;  %>
				 					  <%if (isActivePolicy.equals("Y")){ 
				 						 readOnly =false;
				 					  }
				 					  %>
				 					  
 					
									<tr>
				 						<td align="center" class="sectionheadLink"> Carrier 1</td>
				 						<td align="center" class="sectionheadLink">
				 						 <html:text property="answer(Object::Policy::Issuance::DecliningCarrier1)" size="30" styleId="DecliningCarrier1" value='<%=carrierDetailMap.getString("DecliningCarrierValue0") %>' maxlength="30" styleClass="txtbox" readonly="<%=readOnly%>" />
										</td>
				 						<td align="center" class="sectionheadLink">
				 						 <html:text property="answer(Object::Policy::Issuance::CarrierRepresentative1)" size="30" styleId="CarrierRepresentative1"
											value='<%=carrierDetailMap.getString("CarrierRepresentativeValue0") %>' maxlength="30" styleClass="txtbox" readonly="<%=readOnly%>" />
										</td>
										<%if(riskState.equalsIgnoreCase("VA") || riskState.equalsIgnoreCase("MD")){ %>
										<%
											String DeclinedDateValue0 = carrierDetailMap.getString("DeclinedDateValue0");
										
											String []ddv = DeclinedDateValue0.split("-");
											String Year1 = "";
											String Month1 = "";
											String Date1 = "";
											
											if(ddv.length == 3 && ddv.length > 0 ){
												Year1 = ddv[0];
												Month1 = ddv[1];
												Date1 = ddv[2];
											}
										%>
											<td align="center" class="sectionheadLink">
												<html:text  property ="answer(Object::Policy::Issuance::DeclinedDate::Month1)" value="<%=Month1%>" size="2" maxlength="2" styleClass="txtbox" styleId="Carrier1DeclinedMonth" onkeyup="if(this.value.length==2) {document.forms[0].Carrier1DeclinedDate.focus()}" readonly="<%=readOnly%>" />&nbsp;
												<html:text  property ="answer(Object::Policy::Issuance::DeclinedDate::Date1)" value="<%=Date1%>" size="2" maxlength="2" styleClass="txtbox"  styleId="Carrier1DeclinedDate" onkeyup="if(this.value.length==2) {document.forms[0].Carrier1DeclinedYear.focus()}" readonly="<%=readOnly%>" />&nbsp;
												<html:text  property ="answer(Object::Policy::Issuance::DeclinedDate::Year1)" value="<%=Year1%>" size="4" maxlength="4" styleClass="txtbox" styleId="Carrier1DeclinedYear" onkeyup="if(this.value.length==4) {document.forms[0].ExpirationMonth.focus()}" readonly="<%=readOnly%>" />&nbsp;
											</td><td><html:hidden property='answer(Object::Policy::Issuance::DeclinedDate1)' styleId="DeclinedDate1" value=""/></td>
										<%}%>									
				 					</tr>				 					
				 					
				 					<tr>
				 						<td align="center" class="sectionheadLink"> Carrier 2</td>
				 						<td align="center" class="sectionheadLink"> <html:text property="answer(Object::Policy::Issuance::DecliningCarrier2)" size="30" styleId="DecliningCarrier2"
											value='<%=carrierDetailMap.getString("DecliningCarrierValue1") %>' maxlength="30" styleClass="txtbox" readonly="<%=readOnly%>" />
										</td>
				 						<td align="center" class="sectionheadLink"> <html:text property="answer(Object::Policy::Issuance::CarrierRepresentative2)" size="30" styleId="CarrierRepresentative2"
											value='<%=carrierDetailMap.getString("CarrierRepresentativeValue1") %>' maxlength="30" styleClass="txtbox" readonly="<%=readOnly%>" />
										</td>
										<%if(riskState.equalsIgnoreCase("VA") || riskState.equalsIgnoreCase("MD")){ %>

										<%
											String DeclinedDateValue1 = carrierDetailMap.getString("DeclinedDateValue1");
										
											String []ddv1 = DeclinedDateValue1.split("-");
											String Year2 = "";
											String Month2 = "";
											String Date2 = "";
											
											if(ddv1.length == 3 && ddv1.length > 0 ){
												Year2 = ddv1[0];
												Month2 = ddv1[1];
												Date2 = ddv1[2];
											}
										%>										
																			
											<td align="center" class="sectionheadLink">
												<html:text  property ="answer(Object::Policy::Issuance::DeclinedDate::Month2)" value="<%=Month2%>"  size="2" maxlength="2" styleClass="txtbox" styleId="Carrier2DeclinedMonth" onkeyup="if(this.value.length==2) {document.forms[0].Carrier2DeclinedDate.focus()}" readonly="<%=readOnly%>" />&nbsp;
												<html:text  property ="answer(Object::Policy::Issuance::DeclinedDate::Date2)" value="<%=Date2%>"  size="2" maxlength="2" styleClass="txtbox"  styleId="Carrier2DeclinedDate" onkeyup="if(this.value.length==2) {document.forms[0].Carrier2DeclinedYear.focus()}" readonly="<%=readOnly%>" />&nbsp;
												<html:text  property ="answer(Object::Policy::Issuance::DeclinedDate::Year2)" value="<%=Year2%>"  size="4" maxlength="4" styleClass="txtbox" styleId="Carrier2DeclinedYear" onkeyup="if(this.value.length==4) {document.forms[0].ExpirationMonth.focus()}" readonly="<%=readOnly%>" />&nbsp;
											</td><td><html:hidden property='answer(Object::Policy::Issuance::DeclinedDate2)' styleId="DeclinedDate2" value=""/></td>
										<%}%>										
				 					</tr>			 						
				 					<tr>
				 						<td align="center" class="sectionheadLink"> Carrier 3</td>
				 						<td align="center" class="sectionheadLink"> <html:text property="answer(Object::Policy::Issuance::DecliningCarrier3)" size="30" styleId="DecliningCarrier3"
											value='<%=carrierDetailMap.getString("DecliningCarrierValue2") %>' maxlength="30" styleClass="txtbox" readonly="<%=readOnly%>" />
										</td>
				 						<td align="center" class="sectionheadLink"> <html:text property="answer(Object::Policy::Issuance::CarrierRepresentative3)" size="30" styleId="CarrierRepresentative3"
											value='<%=carrierDetailMap.getString("CarrierRepresentativeValue2") %>' maxlength="30" styleClass="txtbox" readonly="<%=readOnly%>" />
										</td>
										<%if(riskState.equalsIgnoreCase("VA") || riskState.equalsIgnoreCase("MD")){ %>

										<%
											String DeclinedDateValue2 = carrierDetailMap.getString("DeclinedDateValue2");
										
											String []ddv2 = DeclinedDateValue2.split("-");
											String Year3 = "";
											String Month3 = "";
											String Date3 = "";
											
											if(ddv2.length == 3 && ddv2.length > 0 ){
												Year3 = ddv2[0];
												Month3 = ddv2[1];
												Date3 = ddv2[2];
											}
										%>										
										
											<td align="center" class="sectionheadLink">
												<html:text  property ="answer(Object::Policy::Issuance::DeclinedDate::Month3)" value="<%=Month3%>" size="2" maxlength="2" styleClass="txtbox" styleId="Carrier3DeclinedMonth" onkeyup="if(this.value.length==2) {document.forms[0].Carrier3DeclinedDate.focus()}" readonly="<%=readOnly%>" />&nbsp;
												<html:text  property ="answer(Object::Policy::Issuance::DeclinedDate::Date3)" value="<%=Date3%>" size="2" maxlength="2" styleClass="txtbox"  styleId="Carrier3DeclinedDate" onkeyup="if(this.value.length==2) {document.forms[0].Carrier3DeclinedYear.focus()}" readonly="<%=readOnly%>" />&nbsp;
												<html:text  property ="answer(Object::Policy::Issuance::DeclinedDate::Year3)" value="<%=Year3%>" size="4" maxlength="4" styleClass="txtbox" styleId="Carrier3DeclinedYear" onkeyup="if(this.value.length==4) {document.forms[0].ExpirationMonth.focus()}" readonly="<%=readOnly%>" />&nbsp;
											</td><td><html:hidden property='answer(Object::Policy::Issuance::DeclinedDate3)' styleId="DeclinedDate3" value=""/></td>
										<%}%>									
				 					</tr>
				 					<tr>
				 						<td><html:hidden property='answer(numberOfDecliningCarrier)' value="3"/></td>				 						
				 					</tr>
				 				</table>
				 			</td></tr>
				 			<%if(riskState.equalsIgnoreCase("MD")){ %>			 			
					 			<tr><td>&nbsp;</td></tr>
					 			<tr height="30">
					 				<td class="TextMatter1">Diligent Searcher Name</td>
					 				<td> <html:text property="answer(Object::Policy::Issuance::DiligentSearcherName)" value='<%=carrierDetailMap.getString("DiligentSearcherNameValue") %>' size="30" styleId="DiligentSearcherName" maxlength="30" styleClass="txtbox" readonly="<%=readOnly%>" /> </td>
					 			</tr>
					 			<tr height="30">
					 				<td class="TextMatter1">Diligent Searcher Title</td>
					 				<td> <html:text property="answer(Object::Policy::Issuance::DiligentSearcherTitle)" value='<%=carrierDetailMap.getString("DiligentSearcherTitleValue") %>' size="30" styleId="DiligentSearcherTitle" maxlength="30" styleClass="txtbox" readonly="<%=readOnly%>" /> </td>			 				
					 			</tr>
				 			<%}%>
				 		<%}%>
			 			
			 			
			 			
			 			<%if (isActivePolicy.equals("Y")){ %>
			 			<tr height="40">
			 				<td class="links" colspan="2">
			 					<html:submit property="answer(IssuePolicy)" value="Issue Policy" styleId="IssuePolicySubmit"/>
			 				</td>
			 			</tr>
			 			<%} %>
			 			
			 		<%}else if(policyStatus.equalsIgnoreCase("Issued")||policyStatus.equalsIgnoreCase("Canceled")){%>
			 		
			 		<tr>
			 			<td class="FormLabels" width="35%">
			 				Check List
			 			</td>
			 			<td class="FormLabels" width="10%" >
			 				Status
			 			</td>
			 			<td class="FormLabels" width="25%">
			 				Updated By
			 			</td>
			 			<td class="FormLabels" width="35%">
			 				Updated Date
			 			</td>
			 		</tr>
			 		
			 		
			 		
				 		<%com.dms.ejb.insurance.policy.pl.PLPolicyDetail plpolicyDetail = (com.dms.ejb.insurance.policy.pl.PLPolicyDetail)request.getAttribute("policyHeaderInfo"); %>
				 		<% java.util.ArrayList arrPolicyIssuanceApplicationList = plpolicyDetail.getPolicyIssuanceApplicationList();%>
				 		
				 		<%  int policyIssuanceApplicationListSize = 0;
					 		com.dms.ejb.data.QuestionHashMap carrierIssuanceDetailMap = new com.dms.ejb.data.QuestionHashMap();
				 			try {
				 				policyIssuanceApplicationListSize =  arrPolicyIssuanceApplicationList.size();
				 			} catch(Exception exc){ }
				 		%>
				 		<%if(policyIssuanceApplicationListSize > 0){ %>
				 		
					 		<% 
					 			for(int index=0; index < policyIssuanceApplicationListSize; index++){
					 				com.dms.ejb.insurance.policy.PolicyIssuanceDetail policyIssuanceDetail = (com.dms.ejb.insurance.policy.PolicyIssuanceDetail)arrPolicyIssuanceApplicationList.get(index);					 			
					 		%> 
					 			<%if(index==0) { %>
						 			<tr height="30"> 
							 			<td class="TextMatter1" width="35%">Signed Application Received</td>
										<td width="10%" class="TextMatter1" ><%=policyIssuanceDetail.getValue()%></td>
										<td class="TextMatter1" width="25%"><%=policyIssuanceDetail.getCreatedBy()%></td>	
										<td width="35%" class="TextMatter1" ><%=policyIssuanceDetail.getCreatedDate()%></td>
									</tr>
					 			<%} %>
					 			<%if(index==1) { %>
						 			<tr height="30">					 			
							 			<td class="TextMatter1" width="35%">Proof of Denial Received</td>
										<td width="10%" class="TextMatter1" ><%=policyIssuanceDetail.getValue()%></td>
										<td class="TextMatter1" width="25%"><%=policyIssuanceDetail.getCreatedBy()%></td>	
										<td width="35%" class="TextMatter1" ><%=policyIssuanceDetail.getCreatedDate()%></td>					 			
									</tr>
					 			<%} %>
					 			<%if(index==2) { %>
						 			<tr height="30">
							 			<td class="TextMatter1" width="35%">Application Data Entry completed</td>
										<td width="10%" class="TextMatter1" ><%=policyIssuanceDetail.getValue()%></td>
										<td class="TextMatter1" width="25%"><%=policyIssuanceDetail.getCreatedBy()%></td>	
										<td width="35%" class="TextMatter1" ><%=policyIssuanceDetail.getCreatedDate()%></td>					 			
									</tr>
					 			<%} %>
					 		<%}%>
						<%}%>
			 			<%if(riskState.equalsIgnoreCase("MD") || riskState.equalsIgnoreCase("DE")){ %>


				 		<% //com.dms.ejb.insurance.policy.pl.PLPolicyDetail plpolicyDetail = (com.dms.ejb.insurance.policy.pl.PLPolicyDetail)request.getAttribute("policyHeaderInfo"); %>
				 		<% java.util.ArrayList arrPolicyIssuanceDetailList = plpolicyDetail.getPolicyIssuanceDetail();%>
				 		
				 		<%  int issuancePolicySize = 0;
					 		com.dms.ejb.data.QuestionHashMap carrierDetailMap = new com.dms.ejb.data.QuestionHashMap();
				 			try {
				 				issuancePolicySize =  arrPolicyIssuanceDetailList.size();
				 			} catch(Exception exc){ }
				 		%>
				 		<%if(issuancePolicySize > 0){ %>
				 		
					 		<% 
					 			for(int index=0; index < issuancePolicySize; index++){
					 				com.dms.ejb.insurance.policy.PolicyIssuanceDetail policyIssuanceDetail = (com.dms.ejb.insurance.policy.PolicyIssuanceDetail)arrPolicyIssuanceDetailList.get(index);					 			
					 				carrierDetailMap.put("DecliningCarrierValue" + index, policyIssuanceDetail.getDecliningCarrier() );
					 				carrierDetailMap.put("CarrierRepresentativeValue" + index, policyIssuanceDetail.getCarrierRepresentative() );
					 				carrierDetailMap.put("DeclinedDateValue" + index, ""+policyIssuanceDetail.getDeclinedDate() );
					 				carrierDetailMap.put("DiligentSearcherNameValue", policyIssuanceDetail.getDiligentSearcherName() );
					 				carrierDetailMap.put("DiligentSearcherTitleValue", policyIssuanceDetail.getDiligentSearcherTitle() );					 				
					 			} 
					 		%>
						<%}%><tr><td>&nbsp;&nbsp;</td></tr>												
				 			<tr><td colspan="4">
				 				<table WIDTH="100%" ALIGN="center" BORDER="0" style="{border-width:1px; border-style:solid; border-color: #999999;}">

				 					<tr><td class="sectionheadLink" align="center">Carrier/Detail</td>
				 						<td class="sectionheadLink" align="center">Declining Carrier</td>
				 						<td class="sectionheadLink" align="center">Carrier Representative</td>
				 						<%if(riskState.equalsIgnoreCase("VA") || riskState.equalsIgnoreCase("MD")){ %>
				 							<td class="sectionheadLink" align="center">Date Declined (MM/DD/YYYY)</td>
				 						<%}%>
				 					</tr>
 					
									<tr>
				 						<td align="center" class="sectionheadLink"> Carrier 1</td>
				 						<td align="center" class="sectionheadLink"> <%=carrierDetailMap.getString("DecliningCarrierValue0") %>
										</td>
				 						<td align="center" class="sectionheadLink"> <%=carrierDetailMap.getString("CarrierRepresentativeValue0") %>
										</td>
										<%if(riskState.equalsIgnoreCase("VA") || riskState.equalsIgnoreCase("MD")){ %>
										<%
											String DeclinedDateValue0 = carrierDetailMap.getString("DeclinedDateValue0");
										
											String []ddv = DeclinedDateValue0.split("-");
											String Year1 = "";
											String Month1 = "";
											String Date1 = "";
											
											if(ddv.length == 3 && ddv.length > 0 ){
												Year1 = ddv[0];
												Month1 = ddv[1];
												Date1 = ddv[2];
											}
										%>
											<td align="center" class="sectionheadLink"> <%=Month1 + "/" + Date1 + "/" + Year1%></td>
										<%}%>									
				 					</tr>				 					
				 					
				 					<tr>
				 						<td align="center" class="sectionheadLink"> Carrier 2</td>
				 						<td align="center" class="sectionheadLink"> <%=carrierDetailMap.getString("DecliningCarrierValue1") %>
										</td>
				 						<td align="center" class="sectionheadLink"> <%=carrierDetailMap.getString("CarrierRepresentativeValue1") %>
										</td>
										<%if(riskState.equalsIgnoreCase("VA") || riskState.equalsIgnoreCase("MD")){ %>

										<%
											String DeclinedDateValue1 = carrierDetailMap.getString("DeclinedDateValue1");
										
											String []ddv1 = DeclinedDateValue1.split("-");
											String Year2 = "";
											String Month2 = "";
											String Date2 = "";
											
											if(ddv1.length == 3 && ddv1.length > 0 ){
												Year2 = ddv1[0];
												Month2 = ddv1[1];
												Date2 = ddv1[2];
											}
										%>										
																			
											<td align="center" class="sectionheadLink"> <%= Month2 + "/" + Date2 + "/" + Year2 %></td>
										<%}%>										
				 					</tr>			 						
				 					<tr>
				 						<td align="center" class="sectionheadLink"> Carrier 3</td>
				 						<td align="center" class="sectionheadLink"> <%=carrierDetailMap.getString("DecliningCarrierValue2")%>
										</td>
				 						<td align="center" class="sectionheadLink"> <%=carrierDetailMap.getString("CarrierRepresentativeValue2")%>
										</td>
										<%if(riskState.equalsIgnoreCase("VA") || riskState.equalsIgnoreCase("MD")){ %>

										<%
											String DeclinedDateValue2 = carrierDetailMap.getString("DeclinedDateValue2");
										
											String []ddv2 = DeclinedDateValue2.split("-");
											String Year3 = "";
											String Month3 = "";
											String Date3 = "";
											
											if(ddv2.length == 3 && ddv2.length > 0 ){
												Year3 = ddv2[0];
												Month3 = ddv2[1];
												Date3 = ddv2[2];
											}
										%>										
										
											<td align="center" class="sectionheadLink"> <%=Month3 + "/" + Date3 + "/" + Year3%></td>
										<%}%>									
				 					</tr>
				 					<tr>
				 						<td><html:hidden property='answer(numberOfDecliningCarrier)' value="3"/></td>				 						
				 					</tr>
				 				</table>
				 			</td></tr>
				 			<%if(riskState.equalsIgnoreCase("MD")){ %>			 			
					 			<tr><td colspan="4">&nbsp;</td></tr>
					 			<tr height="30">
					 				<td class="TextMatter1">Diligent Searcher Name</td>
					 				<td class="TextMatter1" colspan="4"> <%=carrierDetailMap.getString("DiligentSearcherNameValue") %> </td>
					 			</tr>
					 			<tr height="30">
					 				<td class="TextMatter1" >Diligent Searcher Title</td>
					 				<td class="TextMatter1" colspan="4"> <%=carrierDetailMap.getString("DiligentSearcherTitleValue") %> </td>			 				
					 			</tr>
				 			<%}%>
				 		<%}%>
						
						
						
			 		<%}%>
			 		</dmshtml:dms_static_with_connector>
			
			 	
			 		<dmshtml:GetQuoteDetailsByPolicyId nameInSession="QuoteList" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			 		 <% String renewalQuote =""+request.getAttribute("Object::Renewal::Quote::QuoteId");
			 		 	String renewalSubQuote  = ""+request.getAttribute("Object::Renewal::Quote::SubQuoteId");
			 		 	String isRenewal = ""+request.getAttribute("isRenewal");
			 		 %>
			 		  
			 		<!--  Values for Issue Policy -->
			 		<html:hidden property="answer(DocumentListSource)" value="Policy" />
			 		<html:hidden property="answer(policyId)"  value="<%= ""+policyId%>" />	
			 		
			 		
			 		<html:hidden property="answer(policyVerId)"  value="<%= ""+policyVerId%>" />				 		
			 		<html:hidden property="answer(DocumentType)" value="ISSUANCE" />
			 		
			 		<%if(isRenewal.equals("Y")){ %>
						<html:hidden property="answer(QuoteId)" value="<%=""+renewalQuote%>" /> 	
					<%}else{ %>	 	
						<html:hidden property="answer(QuoteId)" value='<%= ""+parentQuoteId%>' /> 
					<%} %>	
					
			 		<html:hidden property="answer(ownerId)" value='<%=""+ownerId%>' />
			 		<html:hidden property="answer(ProductVerId)" value="<%= ""+productVerId%>" />
			 		<html:hidden property="answer(Object::Customer::CustomerId)"  value="<%= ""+custId%>" />
			 		<html:hidden property="answer(customerId)" value="<%= ""+custId%>" />	
			 		<html:hidden property="answer(isPreview)" value="false" />
			 		<html:hidden property="answer(Object::Agency::AgencyId)"  value="<%= ""+agencyId%>" />	
			 		<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>"/>
			 		<html:hidden property="answer(Object::Policy::ResProperty::Statecode)" value="<%=""+riskState%>"/>
			 		
			 					 		
			 		<!-- Policy Summary -->
			 		
			 		<html:hidden property="answer(polParentQuoteId)" value='<%=""+parentQuoteId %>'/>
			 		<html:hidden property="answer(polProductVerId)" value='<%=""+productVerId%>' />
			 		<html:hidden property="answer(polProductId)" value='<%=""+productId%>' />
			 		<html:hidden property="answer(Object::Quote::QuoteStatus)" value='<%=""+QuoteStatus%>'/>
			 		<html:hidden property="answer(polSubVerQuoteId)" value='<%=""+SubQuoteVerId %>'/>
					<html:hidden property="answer(Object::Quote::QuoteType)" value='<%=""+QuoteType %>'/>
					<html:hidden property="answer(polSubQuoteId)" value='<%=""+SubQuoteId %>'/>
					<html:hidden property="answer(applicationType)" value='<%=""+applicationType %>'/>					
			 		<html:hidden property="answer(Object::UserDetail::userName)" value='<%=""+usernameId%>'/>
			 		
			 		<html:hidden property="answer(Quote::Page)" value="StatusChange" />
			 		<html:hidden property="answer(Object::Quote::QuoteStatus)" value="Issued" />

			 		
			 		
<html:hidden property="answer(parentQuoteId)" value="<%=""+parentQuoteId%>" />
<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
<html:hidden  property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
<html:hidden property="answer(dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
<html:hidden property="answer(Object::Quote::QuoteVerId)" value="<%=""+SubQuoteVerId%>" />
<html:hidden property="answer(subquoteVerId)" value="<%=""+SubQuoteVerId%>" />

<%if(isRenewal.equals("Y")){ %>
			<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+renewalQuote %>" />	
			<html:hidden property="answer(subQuoteId)" value="<%=""+renewalSubQuote %>" /> 			
			<html:hidden property="answer(QuoteId)" value="<%=""+renewalQuote %>" /> 
			<html:hidden property ="answer(isRenewalQuoteToIssue)" value ="Y" /> 	
	<%}else{ %>	 	
			<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+parentQuoteId%>" />	
			<html:hidden property="answer(subQuoteId)" value="<%=""+SubQuoteId%>" /> 			
			<html:hidden property="answer(QuoteId)" value='<%= ""+parentQuoteId%>' /> 	
	<%} %>

		
			
			
			




<html:hidden property="answer(userId)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+custId%>" />
<html:hidden property="answer(productId)" value="<%=""+productId%>" />
<html:hidden property="answer(productVerId)" value="<%=""+productVerId%>" />
<html:hidden property="answer(parentQuoteType)" value="<%=""+QuoteType%>" />
<html:hidden property="answer(UnderWriterWorkSheet)" value="No" />
<html:hidden property="answer(Object::Customer::CustomerId)" value='<%= ""+custId%>' />
<html:hidden property="answer(OwnerId)" value='<%= ""+ownerId%>' />
<html:hidden property="answer(ownerId)" value='<%= ""+ownerId%>' />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<%-- %>

<bean:define id="strParentQuoteType" name="parentQuoteDetail" property="quoteType" scope="request"/>

<html:hidden property="answer(Object::Quote::QuoteNumber)" value="<%=subQuoteNum.toString()%>" />
<html:hidden property="answer(Object::Quote::QuoteStartDate)" value="<%=quoteStartDate.toString()%>" />
<html:hidden property="answer(customerNumber)" value="<%=customerNumber.toString()%>" />

<html:hidden property="answer(parentQuoteVerId)" value="<%=strParetQuoteVerId.toString()%>" />

<html:hidden property="answer(Object::Quote::CompositeRate)" value="<%=CompositeRate.toString()%>" />

<html:hidden property="noOfEmployeesInPlan" name="UWWorkSheet" styleId="SIDnoOfEmployeesInPlan" value="<%=""+noOfEmployeesInPlan%>"/>
<html:hidden styleId="LockStatus" property="answer(Object::Quote::LockStatus)" value="<%=""+paretLockStatus%>" />
<html:hidden property="answer(modQuoteNumber)" value="<%=""+modQuoteNumber%>" />
--%>
			 		
			 		
			 		</html:form>

			 		</td></tr>
			 		</table>
			 	</div>	 		
			 	
						<%} 
					}
				%>
				</logic:present>	
			 	
			 	<div id="Endorsements" class="innercontent">
			 		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">	 
			 		<tr height="30">
			 				<td class="FormLabels" colspan="7" color="red">Policy History - Prior Policy Versions
			 					
			 				</td>
			 			</tr>
			 		
			 			<tr height="30">
								
								<td class="FormLabels" width="8%" align="left"> Policy Version
								</td>
								<td class="FormLabels" width="12%" align="left">  Policy Number
								</td>										
								<td class="FormLabels" width="25%" align="left">  Endorsement Type
								</td>
								<td class="FormLabels" width="15%" align="left">  Effective Date
								</td>
								
								<td class="FormLabels" width="15%" align="left"> Bound By
								</td>
								<td class="FormLabels" width="21%" align="left"> Date Bound
								</td>
								<td class="FormLabels" width="12%" align="left"> Status
								</td>
							
						</tr>	
						
						
						
						<dmshtml:GetPolicyVersionList nameInSession="PolicyVersionList" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
							<logic:present name="PolicyVersionList">
							<% int polVerNo = 0; %>
							 	<logic:iterate id="PolicyVersionListDetail" name="PolicyVersionList" scope="request" type="com.dms.ejb.insurance.policy.PolicyDetail"> 
							 	    <% polVerNo = polVerNo + 1; %>
							 		<tr height="30">
							 		
							 			<td class="FormLabels" width="4%" align="center">
							 				<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+PolicyVersionListDetail.getPolPolicyVerId()%>&answer(policyId)=<%=""+PolicyVersionListDetail.getPolPolicyId()%>&answer(conditionFlag)=Y "> <%= ""+polVerNo %></a>
							 					
							 			</td>
							 			
							 			<td class="FormLabels" width="18%" align="left">
							 			 <%if (Integer.parseInt(PolicyVersionListDetail.getPolicyVerSubNumber())>0){ %>
											<%=""+PolicyVersionListDetail.getPolicyNumber()%><%="-"+PolicyVersionListDetail.getPolicyVerSubNumber()%>
										<%} else { %>
											<%=""+PolicyVersionListDetail.getPolicyNumber()%>
										<%} %> 
										</td>
									
							 			<td class="FormLabels" width="25%" align="left">
							 			
							 			  
							 			  <%String isoriginalPolicy = "Y"; %>
							 			  <dmshtml:GetPolicyVersionEndorsementType nameInSession = "EndorsementType" policyId="<%=""+PolicyVersionListDetail.getPolPolicyId()%>" policyVerId = "<%=""+PolicyVersionListDetail.getPolPolicyVerId()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
							 			   	 <logic:present name="EndorsementType">
							 			   	  
							 			   	  <logic:iterate id="PolicyVerEndorsementType" name="EndorsementType" scope="request" type="com.dms.ejb.insurance.policy.PolicyDetail"> 
							 			   	  <dmshtml:getProductHeaderDetail nameInSession="EndorsementProductDetail" productId='<%=""+PolicyVerEndorsementType.getProductId()%>' productVerId='<%=""+PolicyVerEndorsementType.getProductVerId()%>' ownerId='<%=Long.parseLong(""+ownerId)%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
												<logic:present name="EndorsementProductDetail">
													<%String EndoProductName = ((com.dms.ejb.product.PRDProductDetail)request.getAttribute("EndorsementProductDetail")).getMProductVerName();%>
													<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+PolicyVersionListDetail.getPolPolicyVerId()%>&answer(policyId)=<%=""+PolicyVersionListDetail.getPolPolicyId()%>&answer(conditionFlag)=Y ">  <%=""+EndoProductName%></a>
												</logic:present>
							 				
							 				</logic:iterate>
							 			</logic:present>
							 			<logic:empty name="EndorsementType">
							 			   <a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+PolicyVersionListDetail.getPolPolicyVerId()%>&answer(policyId)=<%=""+PolicyVersionListDetail.getPolPolicyId()%>&answer(conditionFlag)=Y "> Original Policy </a>
							 			</logic:empty>
							 			
										</td>
											
										<td class="FormLabels" width="12%" align="center">
							 				<bean:write property="policyVerEffDate" name="PolicyVersionListDetail" />
							 				
							 			</td>
							 			
							 			<td class="FormLabels" width="15%" align="left">
							 				<bean:write property="createdBy" name="PolicyVersionListDetail" />
							 			</td>                                                                                                                                                                                    
							 			<td class="FormLabels" width="21%" align="left">
							 				<bean:write property="createdDate" name="PolicyVersionListDetail" />
							 			</td> 
							 			<td class="FormLabels" width="12%" align="left">
							 				<bean:write property="policyStatus" name="PolicyVersionListDetail" />
							 			</td>
							 		</tr>	
							 	</logic:iterate>
							 </logic:present>		
					</table>	
					<table>
					<tr><td height="3%">
					&nbsp;
					</td></tr>
					</table>
					
			 					
			 		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">	
			 		     <tr height="30">
			 				<td class="FormLabels" colspan="7">
			 					Endorsement Quotes 
			 					
			 					
			 				</td>
			 			 </tr> 			
			 			<html:form action="/BrowseEndorsement.do" styleId="issueEndo" scope="request">
				 			
				 			<tr height="30">
								<td class="FormLabels" width="4%" align="center"> S.NO 
								</td>											
								<td class="FormLabels" width="10%" align="left"> Quote No
								</td>
								<td class="FormLabels" width="22%" align="left"> Endorsement Type
								</td>
								<td class="FormLabels" width="20%" align="left"> Endorsement PDF
								</td>
								<td class="FormLabels" width="15%" align="left"> Effective Date
								</td>
								<td class="FormLabels" width="15%" align="left"> Last Saved By 
								</td>
								<td class="FormLabels" width="21%" align="left"> Last Saved Date 
								</td>
								<td class="FormLabels" width="12%" align="left"> Status 
								</td>
							</tr>
						
							<dmshtml:GetEndorsementQuoteListById nameInSession="EndorsementQuoteList" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" conditionFlag ="<%=conditionFlag%>"  objectType="POLICY" quoteType="ENDORSEMENT" ownerId="<%=""+ownerId %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />



							<logic:present name="EndorsementQuoteList">
							
							<%int slNo = 0; %>
										
								<logic:iterate id="EndorsementQuoteList" name="EndorsementQuoteList" scope="request" >
							
									<tr height="30">										
							
										<% slNo++; %>
										
										<td class="FormLabels" width="4%" align="center"> <%= ""+slNo%> </td>
										<logic:present name="policyHeaderInfo">
										<bean:define id="policyEffDate" name="policyHeaderInfo" property="policyEffDate" />	
									 	 <bean:define id="policyExpDate" name="policyHeaderInfo" property="policyExpDate" />	
							
										<td class="FormLabels" width="10%" align="left"><a href="/GetEndorsementQuoteDetail.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(parentPolicyStatus)=<%=""+policyStatus%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(QuoteId)=<bean:write property="Object::Endorsement::Quote::QuoteId" name="EndorsementQuoteList"/>&answer(parentQuoteId)=<bean:write property="Object::Endorsement::Quote::QuoteId" name="EndorsementQuoteList"/>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+policyId%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(policyEffDate)=<%=""+policyEffDate%>&answer(policyExpDate)=<%=""+policyExpDate%> "><bean:write property="Object::Endorsement::Quote::QuoteId" name="EndorsementQuoteList"/></a></td>
										</logic:present>
										<bean:define id="endoProductId" name="EndorsementQuoteList" property="Object::Endorsement::Quote::ProductId" />
										<bean:define id="endoProductVerId" name="EndorsementQuoteList" property="Object::Endorsement::Quote::ProductVerId" />										

										<td class="FormLabels" width="20%" align="left">
											<dmshtml:getProductHeaderDetail nameInSession="EndorsementProductDetail" productId='<%=""+endoProductId%>' productVerId='<%=""+endoProductVerId%>' ownerId='<%=Long.parseLong(""+ownerId)%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
												<logic:present name="EndorsementProductDetail">
													<%String EndoProductName = ((com.dms.ejb.product.PRDProductDetail)request.getAttribute("EndorsementProductDetail")).getMProductVerName();%>
													<%=""+EndoProductName%>
												</logic:present>
										</td>
										
										<bean:define id="QuoteID" name="EndorsementQuoteList" property="Object::Endorsement::Quote::QuoteId" />
										
										<td class="FormLabels" width="20%" align="left">
																				
										<dmshtml:GetEndorseDocumentLocation documentType="BINDER" nameInSession="EndorseDocLoc" ownerId='<%=""+ownerId %>' quoteId='<%=Long.parseLong(""+QuoteID)%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
											
										<logic:present name="EndorseDocLoc">	
																						 				
						 				<%
											Object objDocList = request.getAttribute("EndorseDocLoc");				 				
	
							 				if((objDocList != null) && (objDocList instanceof java.util.ArrayList)){
							 					
							 					java.util.ArrayList arrEndorseDocDetail = (java.util.ArrayList)objDocList;
												for(int docIndex=0; docIndex<arrEndorseDocDetail.size(); docIndex++){		
													com.dms.ejb.data.QuestionHashMap quoteDocLocMap=(com.dms.ejb.data.QuestionHashMap)arrEndorseDocDetail.get(docIndex);							
											
											
										%>			 				
		 									<a href="javascript:void(0);" onClick="javascript:window.open('<%=""+quoteDocLocMap.getString("Quote::Document::DocumentUrl")%>')">
			   									<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
						 						<%=""+quoteDocLocMap.getString("Quote::Document::DocumentName") %> 
						 					</a>
						 											 					
						 					<%} 
							 				}else{
												System.out.println("No Document Found");
											} %>
					 					
					 					</logic:present>			
										</td>
										<td class="FormLabels" width="10%" align="left">
										
										<bean:define id="EndorsementQuoteStartDate" name="EndorsementQuoteList" property="Object::Endorsement::Quote::QuoteStartDate" />	
										<%
										    
										   
										    String StartDate = ""+EndorsementQuoteStartDate;
	                                        String arrayStartDate[] = StartDate.split("-");
	                                        
	                                        String YYYY = arrayStartDate[0];
											String MM = arrayStartDate[1];
											String DD = arrayStartDate[2];
											
											StartDate = MM+"/"+DD+"/"+YYYY;
										%>
										<%=StartDate%>
										
										</td>
										<td class="FormLabels" width="15%" align="center"><bean:write property="Object::Endorsement::Quote::UpdatedBy" name="EndorsementQuoteList" /></td>
										
										<td class="FormLabels" width="21%" align="center">
										
										<bean:define id="EndorsementUpdatedDate" name="EndorsementQuoteList" property="Object::Endorsement::Quote::UpdatedDate" />	
										<%
										    
										   
										    String Updateddate = ""+EndorsementUpdatedDate;
	                                        String arrayUpdatedDate[] = Updateddate.split("-");
	                                        
	                                        String year = arrayUpdatedDate[0];
											String month = arrayUpdatedDate[1];
											String date = arrayUpdatedDate[2];
											
											Updateddate = month+"/"+date+"/"+year;
										%>
										<%=Updateddate%>
										
										
										</td>
										
										<td class="FormLabels" width="12%" align="left"><bean:write property="Object::Endorsement::Quote::QuoteStatus" name="EndorsementQuoteList" /></td>
										
									</tr>
							
								</logic:iterate>					
							
							</logic:present>
						 <%if (isActivePolicy.equals("Y")){ %>
							<tr height="30">
								<td class="links">
				 					<html:submit property="answer(ADD)" value="ADD" styleId="EndorseAddSubmit"/>
				 				</td>
							</tr>	
						<%} %>						
							<tr>
								<td>
									<html:hidden property="answer(Object::Quote::OwnerId)" value='<%=""+ownerId%>' />
									
									<logic:present name="AddQuote" scope="request">
										<html:hidden property="answer(displayVal)" name="AddQuote" styleId="dolTabDisplay"/>
									</logic:present>
									<logic:notPresent name="AddQuote" scope="request">
										<html:hidden property="answer(temp)" styleId="dolTabDisplay" value='N'/>
									</logic:notPresent>
									<html:hidden property="answer(Object::Customer::CustomerId)" value='<%= ""+custId%>' />
									<html:hidden property="answer(Object::Quote::ProductStatus)" value="RELEASED" />
									<html:hidden property="answer(Object::Product::RiskState)" value='<%=riskState%>'/>
									<html:hidden property="answer(Object::Product::ProductVerId)" value='<%=""+productVerId%>'/>
									<html:hidden property="answer(Object::Product::ProductId)" value='<%=""+productId%>' />
									<html:hidden property="answer(Object::Quote::QuoteType)" value='ENDORSEMENT'/>
									<html:hidden property="answer(Object::Product::UserRole)" value='<%=""+usernameId%>' />
									<html:hidden property="answer(Object::Quote::ParentPolicyId)" value='<%=""+policyId %>'/>
									<html:hidden property="answer(Object::Quote::ParentPolicyVerId)" value='<%=""+policyVerId%>'/>
									<html:hidden property="answer(policyNumber)" value='<%=""+policyNumber%>'/>
									<html:hidden property="answer(parentPolicyStatus)" value='<%=""+policyStatus%>'/>
									<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)" value='<%=""+dmsRiskId%>'/>
									<html:hidden property="answer(Object::Risk::Teritory)" value='<%=ratingTerritory%>'/>
									<html:hidden property="answer(Object::Risk::TeritoryName)" value='<%=ratingTerritoryName%>'/>
									<html:hidden property="answer(Object::Agency::AgencyId)" value='<%=""+agencyId%>'/>
									<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
									<logic:present name="policyHeaderInfo">
									<bean:define id="policyEffDate" name="policyHeaderInfo" property="policyEffDate" />	
									  <bean:define id="policyExpDate" name="policyHeaderInfo" property="policyExpDate" />	
										<%
										    com.dms.ejb.common.DMSDetail dmsDetail = new com.dms.ejb.common.DMSDetail();
										    java.sql.Date policyStartDate = (java.sql.Date)dmsDetail.stringToDate(""+policyEffDate);
										   
										    String strStartDate = ""+policyStartDate;
	                                        String arrStartDate[] = strStartDate.split("-");
	                                        
	                                        String YYYY = arrStartDate[0];
											String MM = arrStartDate[1];
											String DD = arrStartDate[2];
											
											strStartDate = MM+"/"+DD+"/"+YYYY;
										%>
										<html:hidden property="answer(Object::Quote::QuoteStartDate)" value='<%=""+strStartDate%>'/>
										<html:hidden property="policyEffDate" value='<%=""+policyEffDate%>'/>
        								<html:hidden property="policyExpDate" value='<%=""+policyExpDate%>'/>
									</logic:present>
									
								</td>
							</tr>				
						</html:form>													
			 		</table>	 	
			 	</div>	
			 </div>
		</td>
	</tr>
</table>

<script type="text/javascript">

if(issueEndo.dolTabDisplay.value=='N'){
	dolphintabs.init('<%=headerName%>',0);
}else if(issueEndo.dolTabDisplay.value=='Y'){
	dolphintabs.init('<%=headerName%>',5);
}else{
	dolphintabs.init('<%=headerName%>',0);
}

function disableEndorseAdd(){
document.getElementById("EndorseAddSubmit").disabled = true;	
}

</script>