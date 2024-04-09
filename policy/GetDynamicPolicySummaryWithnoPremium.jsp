<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<logic:present name="policysummarycontent" scope="request">
						 	<bean:define id="htmlPage" name="policysummarycontent"	type="java.lang.StringBuffer" />
						 	<tr>
						 		<td width="100%">
						 			<table width="70%" border="0">	
						 				<tr height="50">
											<td class="sectionhead1" width="56%">
												COVERAGES
											</td>
											<td class="sectionhead1" width="25%" align="right">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LIMIT
											</td>
											<td width="4%">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</td>
											<td class="sectionhead1" width="15%" align="right">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</td>
										</tr>	
										<tr>
											<td width="40%"></td>
											<td width="25%"></td>
											
							    			<td width="25%"></td>
										</tr>			 											
											<%out.println(htmlPage.toString());%>
									</table>
								</td>
							</tr>
</logic:present>	