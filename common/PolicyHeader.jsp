<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<bean:parameter id="policyId" name="policyId" />
<bean:parameter id="policyVerId" name="policyVerId" />
<bean:parameter id="policyNumber" name="policyNumber" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<%String documentType ="ISSUANCE";%>

<dmshtml:isActivePolicy policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
<%String isActivePolicy =(String) request.getAttribute("isActivePolicy");  
  String bcolor ="#C6DEEA";
  String header ="policyheadernav";
   if (!(isActivePolicy.equals("Y"))){
	   bcolor ="#CCCCCC";
	   header ="priorpolicyheadernav";
	   
   }

%>

<script type="text/javascript" src="../Scripts/JScripts/PolicyHeader.js">
</script>
<table align="center" border="0" width="100%">
<tr>


<td>
<div id="policyheadercontainer">
	<div id="<%=header%>">	
		<table align="center" border="0" width="100%">
			<tr>
				<td align="left" width="45%">						
					<a rel="policyheader" onclick="showHidePolicyHeader('<%=header%>');"><img src="../Images/minus.gif" name="policyHeaderImg" height="12" width="12" align="left"></img>&nbsp;<span id="Policy:TxtChange">Click to hide the detail</span></a>						
				</td>	
				<td align="justify"><b class="title">POLICY SUMMARY</b></td>												
			</tr>
		</table>
	</div>


  <div id="policyheader" class="innercontent3">
  
    <table width="100%" align="center" border="0" bgcolor="<%=bcolor%>">
 
	<tr>
		<td align="Left">
			
    			<table width="100%" align="center" border="0" bgcolor="<%=bcolor%>">
  		
				<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
					<dmshtml:Get_Policy_HeaderInfo nameInSession="policyHeaderInfo" policyId='<%=""+policyId%>' policyVerId='<%=""+policyVerId %>' policyNumber="<%=""+policyNumber%>" documentType='<%=documentType%>' ownerId='<%=""+ownerId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
					<logic:present name="policyHeaderInfo">
							<%
							com.dms.ejb.insurance.policy.pl.PLPolicyDetail plPolicyDetail = (com.dms.ejb.insurance.policy.pl.PLPolicyDetail)request.getAttribute("policyHeaderInfo");
							%>
							
							<%
							if(plPolicyDetail.getPLPolicyPlanList().size()!=0){
									java.util.ArrayList arrPLPlanDetail = plPolicyDetail.getPLPolicyPlanList();							
							%>	
							<% 
							java.util.ArrayList arrPLRateDetail=null;
							com.dms.ejb.insurance.policy.pl.PLPolicyPlanDetail polPlanDetail=null;
							for(int index=0;index<arrPLPlanDetail.size();index++){
								%>								
								<%
								polPlanDetail=(com.dms.ejb.insurance.policy.pl.PLPolicyPlanDetail)arrPLPlanDetail.get(index);								
								arrPLRateDetail  = polPlanDetail.getPLPolicyRateList();
							}						
							%>
							<% for(int index1=0;index1<arrPLRateDetail.size();index1++){
								com.dms.ejb.insurance.policy.pl.PLPolicyRateDetail polRateDetail=(com.dms.ejb.insurance.policy.pl.PLPolicyRateDetail)arrPLRateDetail.get(index1); 
							%>		
					 		 
					 		<% com.dms.ejb.insurance.policy.PolicyProductDetail prdDetail  = plPolicyDetail.getPolicyProductDetail();%> 
					 		<%if(plPolicyDetail.getPLResPropertyList().size()!=0){
									java.util.ArrayList arrPLResPropertyDetail = plPolicyDetail.getPLResPropertyList();							
							%>	
							<% for(int index=0;index<arrPLResPropertyDetail.size();index++){
								com.dms.ejb.insurance.policy.pl.PLResPropertyDetail polResPropertyDetail=(com.dms.ejb.insurance.policy.pl.PLResPropertyDetail)arrPLResPropertyDetail.get(index);
							%>
							
							<tr>
								<td align="left" class="FormLabels"  colspan="1" width="25%">
									Policy Number					
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="35%">
								
								<%if (Integer.parseInt(plPolicyDetail.getPolicySubNumber())>0){ %>
										<%=""+plPolicyDetail.getPolicyNumber()%><%="-"+plPolicyDetail.getPolicySubNumber()%>
									<%} else { %>
										<%=""+plPolicyDetail.getPolicyNumber()%>
									<%} %> 
									
									
								</td>
								<td  class="FormLabels" align="left"  colspan="1" width="20%">
									Risk Name
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="25%">
									<%=""+ polResPropertyDetail.getRiskName() %>
								</td>
								
							</tr>
							<tr>
								<td  class="FormLabels" align="left"  colspan="1" width="25%">
									Policy Status
								</td>
								<td  class="sectionhead1" align="left"  colspan="1" width="35%">
								<%=""+plPolicyDetail.getPolicyStatus()%>
								</td>
								<td  class="FormLabels" align="left"  colspan="1" width="20%">
									Risk Address1
								</td>
								<td  class="sectionhead1" align="left"  colspan="1" width="25%">
								<%=""+polResPropertyDetail.getAddress1()%>
								</td>
							</tr>
							<tr>
								<td  class="FormLabels" align="left"  colspan="1" width="25%">
									Plan
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="35%">
									<%=""+ prdDetail.getPrdProgramNumber()+"/"+polPlanDetail.getPlanNameDisplay()%>
								</td>	
								<td  class="FormLabels" align="left"  colspan="1" width="20%">
									Risk Address2
								</td>
								<td  class="sectionhead1" align="left"  colspan="1" width="25%">								
								<%=""+polResPropertyDetail.getAddress2()%>
								</td>	
																
							</tr>							
							<tr>
								<td align="left" class="FormLabels"  colspan="1" width="25%">
									Company Name					
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="35%">
									<%=""+prdDetail.getPrdCompayName() %>
								</td>
								<td  class="FormLabels" align="left"  colspan="1" width="20%">
									Risk City/Zip
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="25%">
									<%=""+ polResPropertyDetail.getCity()%>/<%=""+ polResPropertyDetail.getZip()  %>
								</td>							
																										
							</tr>							
							<tr>
								<td align="left" class="FormLabels"  colspan="1" width="25%">
									Insurance Type					
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="35%">
									<%=""+prdDetail.getPrdInsuranceTypeName() %>
								</td>
								<td  class="FormLabels" align="left"  colspan="1" width="20%">
									Risk County
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="25%">
									<%=""+ polResPropertyDetail.getCountyName()%>
								</td>
																	
							</tr>								
							<tr>	
								<td align="left" class="FormLabels"  colspan="1" width="25%">
									Policy Premium					
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="35%">
									$<%=""+plPolicyDetail.getMTotalPremium()%>
								</td>
								<td  class="FormLabels" align="left"  colspan="1" width="20%">
         								Risk State
      						    </td>
						        <td align="left" class="sectionhead1"  colspan="1" width="25%">
						        	 <%=""+ polResPropertyDetail.getStateCode() %>
						        </td>
									
																																
							</tr>
							<tr>
								<td align="left" class="FormLabels"  colspan="1" width="25%">
									Policy Effective Date					
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="35%">
									<%=""+plPolicyDetail.getPolicyEffDate()%>
								</td>	
								<td align="left" class="FormLabels"  colspan="1" width="20%">
									  Quote Number
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="25%">
									<%--<%=""+plPolicyDetail.getMParentQuoteId()%>--%>
									
									<%  
										String quoteNum = ""+plPolicyDetail.getQuoteNumber();									
										int intQuoteNum = Integer.parseInt(quoteNum);
										String quoteSubNum = "";
										String displyQNum = "";
										quoteSubNum = ""+plPolicyDetail.getQuoteSubNumber();
										int intSubQuoteNum = Integer.parseInt(quoteSubNum);
										if(intSubQuoteNum != -1 && intSubQuoteNum != 0 ){											
											displyQNum = quoteNum +"-"+intSubQuoteNum;
										}
										else{										
											displyQNum = quoteNum+"";
										}
									%>
									<%=displyQNum %>
								</td>	
															
							</tr>
							<tr>
								<td  class="FormLabels" align="left"  colspan="1" width="25%">
						            Policy Expiry Date
						        </td>
						        <td align="left" class="sectionhead1"  colspan="1" width="35%">
						         <%=""+plPolicyDetail.getPolicyExpDate()%>
						        </td>	
						         <td  class="FormLabels" align="left"  colspan="1" width="25%">
								  	 Policy Type
								  </td>
								  <td align="left" class="sectionhead1"  colspan="1" width="25%">
							      	  	<%=""+plPolicyDetail.getPolicyType()%>
     			        		  </td>
						        																
																
							</tr>
							<tr>
								<td  class="FormLabels" align="left"  colspan="1" width="25%">
									Policy Issued Date
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="35%">
									<%=""+plPolicyDetail.getPolIssuedDate()%>
								</td>	
							
								 
							
								<td align="left" class="FormLabels"  colspan="1" width="20%">Policy Term</td>
						       	 <td align="left" class="sectionhead1"  colspan="1" width="25%">
						      	  	<%=""+plPolicyDetail.getPolicyDuration()%>
						        	<%=""+plPolicyDetail.getPolicyDurationType()%>
		        				</td>			
									
							</tr>
							
							<%	}
								 
							}%>	
							<%}
							}
							%>
				</logic:present>
												
			</table>
		</td>
	</tr>
</table>
</div>
</div>

</td>
</tr>
</table>

<script type="text/javascript">

dolphintab.init('<%=header%>', 0)
</script>