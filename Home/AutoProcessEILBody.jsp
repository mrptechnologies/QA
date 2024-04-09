<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<div class="formpage01">
<div class="content">
<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr>
		<td colspan="4" align="center"><div class="formheadnew"><h2 class="left">Auto Processes</h2></div></td>			
	</tr>
		<tr>
			<td>
				&nbsp;
			</td>
		</tr>
	<tr>
		<td class="TextMatter">
			You have the following options to choose:
		</td>
	</tr>
	<tr>
		<td>
			<hr size="1" noshade >
		</td>
	</tr>
	<tr>
		<td>
		&nbsp;
		</td>
	</tr>
	<tr>
		<td class="links">
		
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_AUTO_PROCESS_EIL"}%>'
							connector='or' negated="true">
	
				<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
			  <a href="../AutoRenewalDisplayAction.do?TabPanelName=Manage_Panel">Renewal Process</a>			   
			</dmshtml:dms_static_with_connector>
			
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_AUTO_PROCESS"}%>'
							connector='or' negated="true">
	
				<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
			  <a class="yuimenuitemlabel"
								href="../AutoRenewalDisplayAction.do?TabPanelName=Manage_Panel">Renewal / Offer Process - PL </a> 
			</dmshtml:dms_static_with_connector>
			 
			<br>
	
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_AUTO_PROCESS_LAPSE"}%>'
							connector='or' negated="true">
	
				<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
			<a class="yuimenuitemlabel"
								href="/LapseProcessDisplayOption.do?TabPanelName=Manage_Panel&answer(PROCESSTYPE)=LAPSE">
							Lapse Process - PL </a>
			</dmshtml:dms_static_with_connector>
			<br>
           
          <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_AUTO_PROCESS_REMINDER"}%>'
							connector='or' negated="true">
	
				<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
			<a class="yuimenuitemlabel"
								href="/ReminderProcessDisplayOption.do?TabPanelName=Manage_Panel&answer(PROCESSTYPE)=NOTIFY">
							Reminder Process - PL</a>
			</dmshtml:dms_static_with_connector>
			<br>
			
  		 </td>
  	</tr>
</table>
</div>
</div>