<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="java.util.ArrayList"%>

 
   <div class="content"> 
	<div class="formpage01">
	 <html:form action="/UpdateSubmissionSectionCoverageDetailAction.do" styleId="sectionCoverageForm">
		<div class="formheadnew"><h2 class="left"> Section Coverage Details</h2></div>
		  <div>&nbsp;</div>
			<table width= "100%">
				   <tr>
						<td class="field" width="30%" align = "right">Class Code 01 :</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
						   <html:text property="answer(Object::SectionCoverages::SectionDTLClassCode01)" name="FindOutBoundTransactions" />
						</td>
					</tr>	
					<tr>
						<td class="field" width="30%" align = "right">Class Code 04 :</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
						  <html:text property="answer(Object::SectionCoverages::SectionDTLClassCode04)" name="FindOutBoundTransactions" />
						</td>
					</tr>	

    	 			<html:hidden property="answer(Object::SectionCoverages::SectionDataUpdatableAction)" name="FindOutBoundTransactions"  />
    	 			<html:hidden property="answer(Object::SectionCoverages::SectionTypeCode)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::SubSectionTypeCode)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::coverageRatingBasisCode)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::coverageLimitAmount)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::coveargeDeductible01)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::coveargeDeductible02)" name="FindOutBoundTransactions"/>
					<html:hidden property="answer(Object::SectionCoverages::CoveragePremium)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::CoverageAnnualisedPremium)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::SectionCoverageDetailId)" name="FindOutBoundTransactions" />				 
					<html:hidden property="answer(Object::SectionCoverages::SectionDTLType)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::sectionDTLTitle)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::SectionDTLClassCode02)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::SectionDTLClassCode03)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::SectionDTLAreaCode)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::TradeCode01)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::TradeCode02)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::GeneralCode01)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::GeneralCode02)" name="FindOutBoundTransactions" />	
					<html:hidden property="answer(Object::SectionCoverages::SectionRiskGrade)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::Flag01)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::Flag02)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::Flag03)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::Flag04)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::Flag05)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::coverageCurrencyofAmount)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::coverageACCurrency)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::CoverageRatingBasisAmount)" name="FindOutBoundTransactions"/>
					<html:hidden property="answer(Object::SectionCoverages::Coverage01)" name="FindOutBoundTransactions" />	
					<html:hidden property="answer(Object::SectionCoverages::Coverage02)" name="FindOutBoundTransactions" />	
					<html:hidden property="answer(Object::SectionCoverages::MajorCoverageFlag)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::CoverageFlag01)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::CoverageFlag02)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::CoverageFlag03)" name="FindOutBoundTransactions"/>
					<html:hidden property="answer(Object::SectionCoverages::CoverageDeductibleGRPSequence)" name="FindOutBoundTransactions" />			
					<html:hidden property="answer(Object::SectionCoverages::coverageACPremium)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::coverageTypeCode)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::SectionCoverages::coverageCategory)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::Transaction::TransactionDetailId)" styleId="transactionDetailId"  />
					</table>  
				     <table width="100%">
				        <tr><td colspan="2">&nbsp;</td></tr>
				         <tr>
				         <td width="25%">
				          <td width="75%" align="left">
				           <html:button styleClass="covbutton" value="Save" property="save" onclick="submitSubmissionSectionCoverageDetails()" />
				            
				          </td>
				         </tr>
			         </table> 
       </html:form>
      </div>
     </div>

      
  