<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="java.util.ArrayList"%>


<html:form action="/UpdateSectionCoverageDetailAction.do" styleId="sectionCoverageForm">
 <bean:define id="transactionDetailId" name="FindOutBoundTransactions" property="answer(Object::TakeUp::TransactionDetailId)"/>	
 <html:hidden property="answer(Object::TakeUp::TransactionDetailId)" value="<%=transactionDetailId+"" %>"/>
 <logic:present name="CoverageDetail" scope="request">
	
	 <div class="content"> 
	 <div class="formpage01">

		<div class="formheadnew"><h2 class="left"> Section Coverage Details</h2></div>
		  <div>&nbsp;</div>
			<table width= "100%">
 				 <tr>
					 <td class="field" width="30%" align="right">Class1Code :</td>
					 <td width="1%">&nbsp;</td>
					 <td width="69%' align="left">
					    <bean:define id="secDTLClassCode01" name="CoverageDetail" property="sectionDTLClassCode01"/>
						<html:text property="answer(Object::SectionCoverages::SectionDTLClassCode01)" name="CoverageDetail" value="<%=""+secDTLClassCode01 %>"/>
				 	 </td>
			 	 </tr>
 				 <tr>
					 <td class="field" width="30%" align="right">Class4Code :</td>
					 <td width="1%">&nbsp;</td>
					 <td width="69%' align="left">
					     <bean:define id="secDTLClassCode02" name="CoverageDetail" property="sectionDTLClassCode02"/>
						 <html:text property="answer(Object::SectionCoverages::SectionDTLClassCode02)" name="CoverageDetail" value="<%=""+secDTLClassCode02 %>"/>
				 	 </td>
			 	 </tr>
				 <tr>
					 <td class="field" width="30%" align="right">Coverage Type Code :</td>
					 <td width="1%">&nbsp;</td>
					 <td width="69%' align="left">
					     <bean:define id="covTypeCode" name="CoverageDetail" property="coverageTypeCode"/>
				  		 <html:text property="answer(Object::SectionCoverages::coverageTypeCode)" name="CoverageDetail" value="<%=""+covTypeCode %>"/>
				 	 </td>
			 	 </tr>
 				 <tr>
					 <td class="field" width="30%" align="right">Limit Amount :</td>
					 <td width="1%">&nbsp;</td>
					 <td width="69%' align="left">
					     <bean:define id="covLimitAmount" name="CoverageDetail" property="coverageLimitAmount"/>
				  		 <html:text property="answer(Object::SectionCoverages::coverageLimitAmount)" name="CoverageDetail" value="<%=""+covLimitAmount %>"/>
				 	 </td>
			 	 </tr>
			 	 
				 <tr>
					 <td class="field" width="30%" align="right">Deductible1  :</td>
					 <td width="1%">&nbsp;</td>
					 <td width="69%' align="left">
					     <bean:define id="covDeductible01" name="CoverageDetail" property="coveargeDeductible01"/>
				  		 <html:text property="answer(Object::SectionCoverages::coveargeDeductible01)" name="CoverageDetail" value="<%=""+covDeductible01 %>"/>
				 	 </td>
			 	 </tr>
			 	 
				 <tr>
					 <td class="field" width="30%" align="right">Deductible2  :</td>
					 <td width="1%">&nbsp;</td>
					 <td width="69%' align="left">
					     <bean:define id="covDeductible02" name="CoverageDetail" property="coveargeDeductible02"/>
				  		 <html:text property="answer(Object::SectionCoverages::coveargeDeductible02)" name="CoverageDetail" value="<%=""+covDeductible02 %>"/>
				 	 </td>
			 	 </tr>
			 	 
				 <tr>
					 <td class="field" width="30%" align="right">Premium :</td>
					 <td width="1%">&nbsp;</td>
					 <td width="69%' align="left">
					     <bean:define id="covPremium" name="CoverageDetail" property="coveragePremium"/>
				  		 <html:text property="answer(Object::SectionCoverages::CoveragePremium)" name="CoverageDetail" value="<%=""+covPremium %>"/>
				 	 </td>
			 	 </tr>
			 	 
				 <tr>
					 <td class="field" width="30%" align="right">Annualised Premium :</td>
					 <td width="1%">&nbsp;</td>
					 <td width="69%' align="left">
					     <bean:define id="covAnnualisedPremium" name="CoverageDetail" property="coverageAnnualisedPremium"/>
				  		 <html:text property="answer(Object::SectionCoverages::CoverageAnnualisedPremium)" name="CoverageDetail" value="<%=""+covAnnualisedPremium %>"/>
				 	 </td>
			 	 </tr>
			 	 <tr><td>&nbsp;</td></tr>
    <tr>		
      <td class="field"><html:button value="Save" styleClass="covbutton" property="Save" onclick="submitSectionCoverageDetails();"/></td>						
	</tr>
    </table>

<bean:define id="covCategory" name="CoverageDetail" property="coverageCategory"/>
<html:hidden property="answer(Object::SectionCoverages::coverageCategory)" name="CoverageDetail" value="<%=""+covCategory %>"/>			 

<bean:define id="secTypeCode" name="CoverageDetail" property="sectionTypeCode"/>
<html:hidden property="answer(Object::SectionCoverages::SectionTypeCode)" name="CoverageDetail" value="<%=""+secTypeCode %>"/>

<bean:define id="covRatingBasisCode" name="CoverageDetail" property="coverageRatingBasisCode"/>
<html:hidden property="answer(Object::SectionCoverages::coverageRatingBasisCode)" name="CoverageDetail" value="<%=""+covRatingBasisCode %>"/>
				  		 				  		 
<bean:define id="sectionCoverageDetailId" name="CoverageDetail" property="sectionCoverageDetailId"/>
<html:hidden property="answer(Object::SectionCoverages::SectionCoverageDetailId)" name="CoverageDetail" value="<%=""+sectionCoverageDetailId %>"/>				 

<logic:notEmpty name="CoverageDetail" property="subSectionTypeCode">
	<bean:define id="subSectionTypeCode" name="CoverageDetail" property="subSectionTypeCode"/>
	<html:hidden property="answer(Object::SectionCoverages::SubSectionTypeCode)" name="CoverageDetail" value="<%=""+subSectionTypeCode %>"/>
</logic:notEmpty>			  		 			 	

<logic:notEmpty name="CoverageDetail" property="sectionDataUpdatableAction">
	<bean:define id="secDataUpdatableAction" name="CoverageDetail" property="sectionDataUpdatableAction"/>
	<html:hidden property="answer(Object::SectionCoverages::SectionDataUpdatableAction)" name="CoverageDetail" value="<%=""+secDataUpdatableAction %>"/>
</logic:notEmpty>	

<logic:notEmpty name="CoverageDetail" property="sectionDTLType">
	<bean:define id="secDTLType" name="CoverageDetail" property="sectionDTLType"/>
	<html:hidden property="answer(Object::SectionCoverages::SectionDTLType)" name="CoverageDetail" value="<%=""+secDTLType %>"/>
</logic:notEmpty>

<logic:notEmpty name="CoverageDetail" property="sectionDTLTitle">
	<bean:define id="secDTLTitle" name="CoverageDetail" property="sectionDTLTitle"/>
	<html:hidden property="answer(Object::SectionCoverages::sectionDTLTitle)" name="CoverageDetail" value="<%=""+secDTLTitle %>"/>
</logic:notEmpty>


	
<logic:notEmpty name="CoverageDetail" property="sectionDTLClassCode03">	
	<bean:define id="secDTLClassCode03" name="CoverageDetail" property="sectionDTLClassCode03"/>
	<html:hidden property="answer(Object::SectionCoverages::SectionDTLClassCode03)" name="CoverageDetail" value="<%=""+secDTLClassCode03 %>"/>
</logic:notEmpty>	

<logic:notEmpty name="CoverageDetail" property="sectionDTLClassCode04">
	<bean:define id="secDTLClassCode04" name="CoverageDetail" property="sectionDTLClassCode04"/>
	<html:hidden property="answer(Object::SectionCoverages::SectionDTLClassCode04)" name="CoverageDetail" value="<%=""+secDTLClassCode04 %>"/>			
</logic:notEmpty>

<logic:notEmpty name="CoverageDetail" property="sectionDTLAreaCode">
	<bean:define id="secDTLAreaCode" name="CoverageDetail" property="sectionDTLAreaCode"/>
	<html:hidden property="answer(Object::SectionCoverages::SectionDTLAreaCode)" name="CoverageDetail" value="<%=""+secDTLAreaCode %>"/>
</logic:notEmpty>

<logic:notEmpty name="CoverageDetail" property="tradeCode01">
	<bean:define id="tradeCode01" name="CoverageDetail" property="tradeCode01"/>
	<html:hidden property="answer(Object::SectionCoverages::TradeCode01)" name="CoverageDetail" value="<%=""+tradeCode01 %>"/>
</logic:notEmpty>

<logic:notEmpty name="CoverageDetail" property="tradecode02">	
	<bean:define id="tradeCode02" name="CoverageDetail" property="tradecode02"/>
	<html:hidden property="answer(Object::SectionCoverages::TradeCode02)" name="CoverageDetail" value="<%=""+tradeCode02 %>"/>
</logic:notEmpty>

<logic:notEmpty name="CoverageDetail" property="generalCode01">
	<bean:define id="generalCode01" name="CoverageDetail" property="generalCode01"/>
	<html:hidden property="answer(Object::SectionCoverages::GeneralCode01)" name="CoverageDetail" value="<%=""+generalCode01 %>"/>
</logic:notEmpty>
	
<logic:notEmpty name="CoverageDetail" property="generalCode02">	
	<bean:define id="generalCode02" name="CoverageDetail" property="generalCode02"/>
	<html:hidden property="answer(Object::SectionCoverages::GeneralCode02)" name="CoverageDetail" value="<%=""+generalCode02 %>"/>	
</logic:notEmpty>

<logic:notEmpty name="CoverageDetail" property="sectionRiskGrade">
	<bean:define id="sectionRiskGrade" name="CoverageDetail" property="sectionRiskGrade"/>
	<html:hidden property="answer(Object::SectionCoverages::SectionRiskGrade)" name="CoverageDetail" value="<%=""+sectionRiskGrade %>"/>
</logic:notEmpty>

<logic:notEmpty name="CoverageDetail" property="flag01">
	<bean:define id="flag01" name="CoverageDetail" property="flag01"/>
	<html:hidden property="answer(Object::SectionCoverages::Flag01)" name="CoverageDetail" value="<%=""+flag01 %>"/>
</logic:notEmpty>
	
<logic:notEmpty name="CoverageDetail" property="flag02">
	<bean:define id="flag02" name="CoverageDetail" property="flag02"/>
	<html:hidden property="answer(Object::SectionCoverages::Flag02)" name="CoverageDetail" value="<%=""+flag02 %>"/>
</logic:notEmpty>
	
<logic:notEmpty name="CoverageDetail" property="flag02">
	<bean:define id="flag03" name="CoverageDetail" property="flag02"/>
	<html:hidden property="answer(Object::SectionCoverages::Flag03)" name="CoverageDetail" value="<%=""+flag03 %>"/>
</logic:notEmpty>
	
<logic:notEmpty name="CoverageDetail" property="flag04">	
	<bean:define id="flag04" name="CoverageDetail" property="flag04"/>
	<html:hidden property="answer(Object::SectionCoverages::Flag04)" name="CoverageDetail" value="<%=""+flag04 %>"/>
</logic:notEmpty>
	
<logic:notEmpty name="CoverageDetail" property="flag05">
	<bean:define id="flag05" name="CoverageDetail" property="flag05"/>
	<html:hidden property="answer(Object::SectionCoverages::Flag05)" name="CoverageDetail" value="<%=""+flag05 %>"/>
</logic:notEmpty>
<%--  	<bean:define id="sectionDTLDate01" name="CoverageDetail" property="sectionDTLDate01"/>
	<html:hidden property="answer(Object::SectionCoverages::sectionDTLDate01)" name="CoverageDetail" value="<%=""+sectionDTLDate01 %>"/> 
	
	<bean:define id="sectionDTLDate02" name="CoverageDetail" property="sectionDTLDate02"/>
	<html:hidden property="answer(Object::SectionCoverages::sectionDTLDate02)" name="CoverageDetail" value="<%=""+sectionDTLDate02 %>"/>
	
	<bean:define id="sectionDTLDate03" name="CoverageDetail" property="sectionDTLDate03"/>
	<html:hidden property="answer(Object::SectionCoverages::sectionDTLDate03)" name="CoverageDetail" value="<%=""+sectionDTLDate03 %>"/>	--%>

<logic:notEmpty name="CoverageDetail" property="coverageCurrencyofAmount">
	<bean:define id="coverageCurrencyofAmount" name="CoverageDetail" property="coverageCurrencyofAmount"/>
	<html:hidden property="answer(Object::SectionCoverages::coverageCurrencyofAmount)" name="CoverageDetail" value="<%=""+coverageCurrencyofAmount %>"/>
</logic:notEmpty>

<logic:notEmpty name="CoverageDetail" property="coverageACCurrency">
	<bean:define id="coverageACCurrency" name="CoverageDetail" property="coverageACCurrency"/>
	<html:hidden property="answer(Object::SectionCoverages::coverageACCurrency)" name="CoverageDetail" value="<%=""+coverageACCurrency %>"/>
</logic:notEmpty>

<%-- 	<bean:define id="CoveragePremiumRate" name="CoverageDetail" property="CoveragePremiumRate"/>
	<html:hidden property="answer(Object::SectionCoverages::CoveragePremiumRate)" name="CoverageDetail" value="<%=""+CoveragePremiumRate %>"/>--%>

<logic:notEmpty name="CoverageDetail" property="coverageRatingBasisAmount">
	<bean:define id="coverageRatingBasisAmount" name="CoverageDetail" property="coverageRatingBasisAmount"/>
	<html:hidden property="answer(Object::SectionCoverages::CoverageRatingBasisAmount)" name="CoverageDetail" value="<%=""+coverageRatingBasisAmount %>"/>
</logic:notEmpty>

<logic:notEmpty name="CoverageDetail" property="coverage01">
	<bean:define id="coverage01" name="CoverageDetail" property="coverage01"/>
	<html:hidden property="answer(Object::SectionCoverages::Coverage01)" name="CoverageDetail" value="<%=""+coverage01 %>"/>	
</logic:notEmpty>

<logic:notEmpty name="CoverageDetail" property="coverage02">	
	<bean:define id="coverage02" name="CoverageDetail" property="coverage02"/>
	<html:hidden property="answer(Object::SectionCoverages::Coverage02)" name="CoverageDetail" value="<%=""+coverage02 %>"/>	
</logic:notEmpty>

<logic:notEmpty name="CoverageDetail" property="majorCoverageFlag">
	<bean:define id="majorCoverageFlag" name="CoverageDetail" property="majorCoverageFlag"/>
	<html:hidden property="answer(Object::SectionCoverages::MajorCoverageFlag)" name="CoverageDetail" value="<%=""+majorCoverageFlag %>"/>
</logic:notEmpty>

<logic:notEmpty name="CoverageDetail" property="coverageFlag01">
	<bean:define id="coverageFlag01" name="CoverageDetail" property="coverageFlag01"/>
	<html:hidden property="answer(Object::SectionCoverages::CoverageFlag01)" name="CoverageDetail" value="<%=""+coverageFlag01 %>"/>
</logic:notEmpty>
	
<logic:notEmpty name="CoverageDetail" property="coverageFlag02">
	<bean:define id="coverageFlag02" name="CoverageDetail" property="coverageFlag02"/>
	<html:hidden property="answer(Object::SectionCoverages::CoverageFlag02)" name="CoverageDetail" value="<%=""+coverageFlag02 %>"/>
</logic:notEmpty>
	
<logic:notEmpty name="CoverageDetail" property="coverageFlag03">
	<bean:define id="coverageFlag03" name="CoverageDetail" property="coverageFlag03"/>
	<html:hidden property="answer(Object::SectionCoverages::CoverageFlag03)" name="CoverageDetail" value="<%=""+coverageFlag03 %>"/>
</logic:notEmpty>
	
<logic:notEmpty name="CoverageDetail" property="coverageDeductibleGRPSequence">	
	<bean:define id="coverageDeductibleGRPSequence" name="CoverageDetail" property="coverageDeductibleGRPSequence"/>
	<html:hidden property="answer(Object::SectionCoverages::CoverageDeductibleGRPSequence)" name="CoverageDetail" value="<%=""+coverageDeductibleGRPSequence %>"/>			
</logic:notEmpty>

<logic:notEmpty name="CoverageDetail" property="coverageACPremium">
	<bean:define id="coverageACPremium" name="CoverageDetail" property="coverageACPremium"/>
	<html:hidden property="answer(Object::SectionCoverages::coverageACPremium)" name="CoverageDetail" value="<%=""+coverageACPremium %>"/>
</logic:notEmpty>	
</div>
</div>
</logic:present>
</html:form> 	 	 