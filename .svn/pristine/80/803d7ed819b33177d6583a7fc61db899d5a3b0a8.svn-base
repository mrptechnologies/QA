<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@page import="com.dms.common.ObjectDescriptor"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>

<logic:present name='quotehazardsList'>
<logic:iterate id="quotehazardsList" name="quotehazardsList" >
<table width="900px" >
	<tr>
        	 <td>&nbsp;</td>        	   		
        	   </tr> 
					 <tr>
        	   		<td>
        	   			  <bean:define id="HazardId"  property="Object::Risk::Hazard::HazardId" name="quotehazardsList" />
        	   			  <bean:define id="HazardName"  property="Object::Risk::Hazard::HazardName" name="quotehazardsList" />


        	   			  <bean:define id="ClassId"  property="Object::Risk::Hazard::ClassId" name="quotehazardsList" />
        	   			  <bean:define id="UWADJHazardPremium"  property="Object::Risk::Hazard::UWADJPremium" name="quotehazardsList" />
        	   			  
        	   		</td>        	   		
      </tr>   
      <tr>
        	    
        	   		
        	   		<td width="95%" style="color: black;font-size: 9pt;font-weight:bold ">
        	   		<a href="javascript:void(0);" style="color: black;font-size: 9pt;font-weight:bold ;" onclick="getWorkSheetClassBenefitsList('<%=HazardId.toString()%>','<%=""+ClassId.toString()%>',this.id,'<%=""+HazardName%>');" id='<%="worksheetHazard"+HazardId.toString()+""+ClassId.toString()%>'>	 <%="+ "+HazardName%> 
        	   		
        	   		</a>
        	   		</td>  
        	   		<td width="5%" align="right">
        	   			<dmshtml:CurrencyFormatTag digits="2" format="<%=""+UWADJHazardPremium%>" />
        	   		</td>
        	   		      	   		
      </tr> 
      </table>
      <table width="900px" >
      <tr>
        	    
        	   		<td width="95%">
        	    	<div id='<%="WorkSheetBenefitsDiv"+HazardId.toString()+""+ClassId.toString()%>' style="width:200px;display:none"></div>
        	    </td>
        	     <td width="5%">
        	    	&nbsp;&nbsp;  
        	    </td>
        	   		 
        	   		      	   		
      </tr> 
        
</table>
</logic:iterate>
</logic:present>        	   