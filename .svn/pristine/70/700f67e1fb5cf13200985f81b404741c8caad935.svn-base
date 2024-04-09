<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<table align="left" width="90%" >
	<%int i=0; %>
	<logic:notPresent name='quotehazardsList'>
	<tr>
       <td>No Hazards Listed.Please save the Hazards Application to get the Hazards list.</td>        	   		
    </tr>   
    <tr><td></td></tr> 
</logic:notPresent>  
</table>

<logic:present name='quotehazardsList'>
<logic:present name='ClassList'>
<logic:iterate id="ClassList" name="ClassList" >
			<table width="100%" >
			   <tr><td>&nbsp;</td></tr> 
		       <tr><td>
        	   			<bean:define id="Classname"  property="Object::Risk::Class::ClassName" name="ClassList" />
        	   			<bean:define id="ClassDecs"  property="Object::Risk::Class::ClassDescription" name="ClassList" />        	   			  
        	   </td></tr>   
        	   <tr>
        	    	<td width="20%">&nbsp;&nbsp;  Class Name :</td>
        	   		<td width="80%"><%=""+Classname%></td>	      	   		
        	   </tr> 
        	   
        	   <tr>
        	    	<td width="20%">&nbsp;&nbsp;  Class Description :</td>
        	   		<td width="80%"><%=""+ClassDecs%></td>  	   		      	   		
        	   </tr> 
        	   <tr>
        	  		 <table > 
        	  		 	<tr>
        	  			 	 <td width="100%">&nbsp;&nbsp; Click on a Hazard to select the associated Benefits.</td> 		      	   		
        	 		 	</tr> 
        	  		 </table>   
        	   </tr>
 		</table>       	   
</logic:iterate>        	   
</logic:present>  
</logic:present> 

<table  width="90%" >
	<logic:present name='quotehazardsList'>
	<tr><td>&nbsp;</td></tr> 	
    <logic:iterate id="quotehazardsList" name="quotehazardsList" >
        <%i=i+1; %>
        <bean:define id="hazardsId"  property="Object::Risk::Hazard::HazardId" name="quotehazardsList" />
        <bean:define id="hazardName" name="quotehazardsList" property="Object::Risk::Hazard::HazardName" />
        <bean:define id="classId" name="quotehazardsList" property="Object::Risk::Hazard::ClassId" />
        <tr>
       		<td  style="font-size: 8pt;text-indent: 10pt;" width="3%"><%=""+i%> </td><td><div><p class="tableData"><a href="javascript:void(0);" onclick="getBenefits('<%=hazardsId%>','<%=hazardName %>','<%=classId%>')"><%=""+hazardName%></a></p></div></td>        	   		
        </tr>         	      	   
    </logic:iterate>
    </logic:present>
</table>
       	
