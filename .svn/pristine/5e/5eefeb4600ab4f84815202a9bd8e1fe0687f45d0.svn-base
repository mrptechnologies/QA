<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:parameter id="quoteId" name="quoteId" />
<%	String isRenewal = "";
	if(request.getParameter("isRenewal") != null) {
		isRenewal = request.getParameter("isRenewal"); 
	}
%>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<script type="text/javascript" src="../Scripts/JScripts/EndorseQuoteHeader.js">
</script>
<table width="100%">
<dmshtml:GetEndorsementQuoteHeaderInfo dBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' nameInSession="EndorseQuoteHeader" ownerId='<%=""+ownerId%>' quoteId='<%=""+quoteId%>' />
<bean:define id="endorsementType" name="EndorseQuoteHeader" property="Object::Endorse::Quote::ProductName" />
<tr>
<td>
<div id="endorseheadercontainer">
	<div id="endorseheadernav">	
		<table align="center" border="0" width="100%">
			<tr>
				<td align="left" width="39%">						
					<a rel="endorseheader" onclick="showHideEndorseHeader();"><img src="../Images/plus.gif" name="endorseHeaderImg" height="12" width="12" align="left"></img>&nbsp;<span id="endorse:TxtChange">Click here to show detail</span></a>						
				</td>	
				
					<%if((endorsementType).equals("Storage Tank - Renewal")) { %>
				
					<td align="left" ><b class="title">RENEWAL QUOTE INFORMATION</b></td>												
				<%} else { %>
					<td align="left"><b class="title">ENDORSEMENT QUOTE INFORMATION</b></td>												
				<%} %>
			</tr>
		</table>
	</div>

<div id="endorseheader" class="innercontent4">
<table width="100%" align="Left" border="0" bgcolor="#C6DEEA">
	<tr>
		<td>			
			
			<logic:present name="EndorseQuoteHeader" scope="request">
			
			<table  border="0" width="100%" >							
							<tr>
								<td align="left" class="FormLabels"  colspan="0" width="21%">
									Endorsement Type									
								</td>
								<td align="left" class="sectionhead1"  colspan="0" >
									
									<%=""+endorsementType %>
								</td>
							
							    <td align="left" class="FormLabels"  colspan="1"  width="20%">
									Quote Version #									
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="39%" >
									<bean:write name="EndorseQuoteHeader" property="Object::Endorse::Quote::MajorVerNum" />.<bean:write name="EndorseQuoteHeader" property="Object::Endorse::Quote::MinorVerNum" />
								</td>
							</tr>
							
							<tr>
								<td align="left" class="FormLabels"  colspan="0" >
									Quote Type									
								</td>
								<td align="left" class="sectionhead1"  colspan="0" >
								<%if((endorsementType).equals("Storage Tank - Renewal")) { %>
									RENEWAL
									<%} else { %>
										<bean:write name="EndorseQuoteHeader" property="Object::Endorse::Quote::QuoteType" />
									<%} %>
								</td>
								<td align="left" class="FormLabels"  colspan="1" >
									Created By									
								</td>
								<td align="left" class="sectionhead1"  colspan="1" >
									<bean:write name="EndorseQuoteHeader" property="Object::Endorse::Quote::CreatedBy" />
								</td>				
							</tr>
							
							
							
							
							<tr>
								<td align="left" class="FormLabels"  colspan="0" >
									Quote Number									
								</td>
								<td align="left" class="sectionhead1"  colspan="0" >
									<bean:define id="quoteNum" name="EndorseQuoteHeader" property="Object::Endorse::Quote::QuoteNumber" />
									<bean:define id="quoteSubNum" name="EndorseQuoteHeader" property="Object::Endorse::Quote::QuoteSubNumber" />
									<%	String quoteNumber = "" + quoteNum;
										try{
											if(!(""+quoteSubNum).equals("")) {
											  if(Integer.parseInt(""+quoteSubNum)>=1){
												  quoteNumber = quoteNumber + "-" + quoteSubNum;			   			  
											  }
											}
									  	}catch(NumberFormatException nfe){}
									%>
									<%=quoteNumber %>
									
								</td>
								<td align="left" class="FormLabels"  colspan="1" >
									Created Date									
								</td>
								<td align="left" class="sectionhead1"  colspan="1" >
									<bean:define id="createdDate" name="EndorseQuoteHeader" property="Object::Endorse::Quote::CreatedDate" />
									<% String createDate = ""+createdDate;
										String dispCreatDate ="";
										if(!createDate.equals("")){
			            			   String arrCreatDate[] = createDate.split(" ");                       
			                    	   String creatDate1 = arrCreatDate[0];	
			                    	   
			                    	   String corCreatDate[] = creatDate1.split("-");
			                    	   String yyyy = corCreatDate[0];
			                    	   String mm = corCreatDate[1];
			                    	   String dd = corCreatDate[2];
			                    	   dispCreatDate = mm+"/"+dd+"/"+yyyy;
										}
									%>
									<%=dispCreatDate %>									
								</td>
								
								
								
								
							</tr>
							
							
							
							
							<tr>
								<td align="left" class="FormLabels"  colspan="0" >
									Quote Status									
								</td>
								<td align="left" class="sectionhead1"  colspan="0" >
									<bean:write name="EndorseQuoteHeader" property="Object::Endorse::Quote::QuoteStatus" />
								</td>
								<td align="left" class="FormLabels"  colspan="1" >
									Last Saved By								
								</td>
								<td align="left" class="sectionhead1"  colspan="1" >
									<bean:write name="EndorseQuoteHeader" property="Object::Endorse::Quote::UpdatedBy" />
								</td>
								
								
								
							</tr>
							
							
							<tr>
								<td align="left" class="FormLabels"  colspan="0" >
									Effective Date									
								</td>
								<td align="left" class="sectionhead1"  colspan="0" >
									<bean:define id="effectDate" name="EndorseQuoteHeader" property="Object::Endorse::Quote::QuoteStartDate" />
									<% String effDate = ""+effectDate;
										String dispEffDate ="";
										if(!effDate.equals("")){
			            			   String arrEffDate[] = effDate.split(" ");                       
			                    	   String effDate1 = arrEffDate[0];	
			                    	   
			                    	   String corEffDate[] = effDate1.split("-");
			                    	   String yyyy = corEffDate[0];
			                    	   String mm = corEffDate[1];
			                    	   String dd = corEffDate[2];
			                    	   dispEffDate = mm+"/"+dd+"/"+yyyy;
										}
									%>
									<%=dispEffDate %>									

								</td>
								<td align="left" class="FormLabels"  colspan="1" >
									Last Saved Date								
								</td>
								<td align="left" class="sectionhead1"  colspan="1" >
									<bean:define id="updatedDate" name="EndorseQuoteHeader" property="Object::Endorse::Quote::UpdatedDate" />
									<% String updateDate = ""+updatedDate;
										String dispUpdatDate ="";
										if(!updateDate.equals("")){
			            			   String arrUpdatDate[] = updateDate.split(" ");                       
			                    	   String updateDate1 = arrUpdatDate[0];	
			                    	   
			                    	   String corUpdatDate[] = updateDate1.split("-");
			                    	   String yyyy = corUpdatDate[0];
			                    	   String mm = corUpdatDate[1];
			                    	   String dd = corUpdatDate[2];
			                    	   dispUpdatDate = mm+"/"+dd+"/"+yyyy;
										}
									%>
									<%=dispUpdatDate %>									
								</td>
								
									
								
								
							</tr>
							<tr>
								<td align="left" class="FormLabels"  colspan="0"  >
									Expiry Date									
								</td>
								<td align="left" class="sectionhead1"  colspan="0" >
									<bean:define id="exprDate" name="EndorseQuoteHeader" property="Object::Endorse::Quote::QuoteEndDate" />
									
									
									<%if((endorsementType).equals("Cancel")) { %>
									  <%=dispEffDate %>
									
									
									<%} else { %>
										
										<% String expDate = ""+exprDate;
										
									 	String dispExpDate ="";
										if(!expDate.equals("")){
			            			   String arrExpDate[] = expDate.split(" ");                       
			                    	   String expDate1 = arrExpDate[0];
			                                	   
			                    	   String corExpDate[] = expDate1.split("-");
			                    	   String yyyy = corExpDate[0];
			                    	   String mm = corExpDate[1];
			                    	   String dd = corExpDate[2];
			                    	   dispExpDate = mm+"/"+dd+"/"+yyyy;
			                    	  
			                    	   
										}
									%>
									<%=dispExpDate %>	
									
									<%} %>
									
									
									
									
									
									
									
									
								     
																	

								</td>
								<td align="left" class="FormLabels Error"  colspan="1" >
								<%if((endorsementType).equals("Storage Tank - Renewal")) { %>
									Renewal Premium					
								<%} else { %>
									Endorsement Premium
								<%} %>				
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="25%" style="color:#FF0000 !important">
									<bean:define id="endorsePremium" name="EndorseQuoteHeader" property="Object::Endorse::Quote::TotalPremium" />
									
									<bean:define id="prorataTotalPremiumDiference" name="EndorseQuoteHeader" property="Object::QuoteProrata::ProrataTotalPremiumDiference" />
									
									<bean:define id="endorseCancelPremium" name="EndorseQuoteHeader" property="Object::Endorse::Quote::CancelPremium" />
									
									<%if(endorseCancelPremium != null){
										if(!endorseCancelPremium.equals("")){%>
											<dmshtml:CurrencyFormatTag format="<%=""+endorseCancelPremium%>"/>
										<%} else { %>
												<%if((""+isRenewal).equals("true")) { %>
													<dmshtml:CurrencyFormatTag format="<%=""+endorsePremium%>"/>
												<%} else { %>
													<dmshtml:CurrencyFormatTag format="<%=""+prorataTotalPremiumDiference%>"/>
												<%} 
											}%>
									<%} else { %>
											<%if((""+isRenewal).equals("true")) { %>
												<dmshtml:CurrencyFormatTag format="<%=""+endorsePremium%>"/>
												
											<%} else { %>
												<dmshtml:CurrencyFormatTag format="<%=""+prorataTotalPremiumDiference%>"/>
											<%} %>
									<%}%>
								</td>

							</tr>
							
							<tr>
								<td align="left" class="FormLabels"  colspan="0" >
									Bound Date									
								</td>
								<td align="left" class="sectionhead1"  colspan="0" width="30%">
									<bean:define id="boundedDate" name="EndorseQuoteHeader" property="Object::Endorse::Quote::BoundDate" />
									<% String boundDate = ""+boundedDate;
										String dispBoundDate ="";
										if(!boundDate.equals("")){
			            			   String arrboundDate[] = boundDate.split(" ");                       
			                    	   String boundDate1 = arrboundDate[0];	
			                    	   
			                    	   String corBoundDate[] = boundDate1.split("-");
			                    	   String yyyy = corBoundDate[0];
			                    	   String mm = corBoundDate[1];
			                    	   String dd = corBoundDate[2];
			                    	   dispBoundDate = mm+"/"+dd+"/"+yyyy;
										}
									%>
									<%=dispBoundDate %>
								</td>
								
							</tr>
											
					
					
					
						
						
								
										
						</table>					
					</td>
				</tr>
			</table>
			</logic:present>
		</td>
	</tr>
</table>
</div>
</div>
</td>
</tr>
</table>
