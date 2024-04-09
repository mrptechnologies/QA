<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>



<%int i=0; %>
<logic:notPresent name='submissionhazardsList'>
	<table align="left" width="90%" >
	 	<tr><td>
        	No Hazards Listed.Please save the Hazards Application to get the Hazards list.
       	</td></tr>   
        <tr><td></td></tr> 
	</table>
</logic:notPresent>  

<table width="100%" align="left" class="todotab_yellowbox2" style="border-top: 0px;background-color:#fff;">
	<logic:present name='submissionhazardsList'>
	<logic:present name='ClassList'>
	<logic:iterate id="ClassList" name="ClassList" >
		 <tr><td>&nbsp;</td></tr> 
		 <tr><td>
	        <bean:define id="Classname"  property="Object::Risk::Class::ClassName" name="ClassList" />
	        <bean:define id="ClassDecs"  property="Object::Risk::Class::ClassDescription" name="ClassList" />
	     </td></tr>   
	     
	     <tr>
	     	 <td width="50%">&nbsp;&nbsp;  Class Name :</td>
	    	 <td width="50%"><%=""+Classname%></td>  
	     </tr> 
	     <tr>
	         <td width="50%">&nbsp;&nbsp;  Class Description : </td>
	       	 <td width="50%"><%=""+ClassDecs%></td>  
	     </tr> 
	     
	     <tr><td>
	     	<table align="left"> 
	        	<tr><td width="100%">&nbsp;&nbsp; Click on a Hazard to select the associated Benefits.</td></tr> 
	        </table>
	     </td></tr>       	   
	</logic:iterate>        	   
	</logic:present>  
	</logic:present> 
	
	<tr><td>
	<table align="left" width="90%" >
		<logic:present name='submissionhazardsList'>
        	<logic:iterate id="submissionhazardsList" name="submissionhazardsList" >
	        	<%i=i+1; %>
	        	<bean:define id="hazardsId"  property="Object::Risk::Hazard::HazardId" name="submissionhazardsList" />
	        	<bean:define id="hazardName" name="submissionhazardsList" property="Object::Risk::Hazard::HazardName" />
	        	<bean:define id="classId" name="submissionhazardsList" property="Object::Risk::Hazard::ClassId" />
	        	<tr><td  style="font-size: 8pt;text-indent: 10pt;" width="3%"><%=""+i%> </td><td><div><p class="tableData"><a href="javascript:void(0);" onclick="getBenefits('<%=hazardsId%>','<%=hazardName %>','<%=classId%>')"><%=""+hazardName%></a></p></div></td>        	   		</tr>         	      	   
       		</logic:iterate>
        </logic:present>
	</table>
	</td></tr>       	
 </table>