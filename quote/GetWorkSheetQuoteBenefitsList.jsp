<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@page import="com.dms.common.ObjectDescriptor"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>

<logic:present name='benefitsList'>
<logic:iterate id="benefitsList" name="benefitsList" >
<table width="900px">
	<tr>
        	 <td>&nbsp;</td>        	   		
        	   </tr> 
					 <tr>
        	   		<td>
        	   			  <bean:define id="BenefitVerId"  property="Object::Quote::Class::Benefit::BenefitVerId" name="benefitsList" />
        	   			  <bean:define id="HazardVerId"  property="Object::Quote::Class::Benefit::HazardVerId" name="benefitsList" />
        	   			  <bean:define id="BenefitsName"  property="Object::Quote::Class::Benefit::BenefitName" name="benefitsList" />
        	   			   <bean:define id="ClassId"  property="Object::Quote::Class::Benefit::ClassId" name="benefitsList" />
        	   			   <bean:define id="UWPremium"  property="Object::Quote::Class::Benefit::UWADJPremium" name="benefitsList" />
        	   			  
        	   		</td>        	   		
      </tr>   
      <tr>
        	    
        	   		<td width="95%" style="color: black;font-size: 9pt;font-weight:bold; ">
        	   		<a href="javascript:void(0);" style="color: black;font-size: 9pt;font-weight:bold; " onclick="getWorkSheetClassBenefitsConstructed('<%=HazardVerId.toString()%>','<%=ClassId.toString()%>','<%=BenefitVerId.toString()%>',this.id,'<%=""+BenefitsName%>');" id='<%="WorksheetBenefits"+BenefitVerId+""+HazardVerId.toString()+""+ClassId.toString() %>' >	 <%="+ "+BenefitsName%> 
        	   		
        	   		</a>
        	   		</td>  
        	   		 <td width="5%" align="right">
        	   		 <dmshtml:CurrencyFormatTag digits="2" format="<%=""+UWPremium%>" />
        	    </td>
        	   		      	   		
      </tr> 
      
        
</table>

<table width="900px">


<tr>
        	    <td>
        	    	<div id='<%="WorkSheetBenefitsConstructDiv"+BenefitVerId.toString()+""+HazardVerId.toString()+""+ClassId.toString()%>' style="width:200px;display:none"></div>
        	    </td>
        	   		 
        	   		      	   		
      </tr> 

</table>
</logic:iterate>
</logic:present>        	   