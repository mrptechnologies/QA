<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/editor/assets/skins/sam/simpleeditor.css" />

<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/paginator-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/CauseListTable.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/utilities/utilities.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/Subjectivity.js" ></script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/AttachmentTable.js" ></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/editor/simpleeditor-min.js"></script>

		<%						
		
			String customerId="";
			if(request.getParameter("answer(Object::Customer::CustomerId)")!=null)
			{
				customerId=request.getParameter("answer(Object::Customer::CustomerId)");
			}
			
			String strParetQuoteStatus="";
			if(request.getParameter("answer(Object::Quote::QuoteStatus)")!=null)
			{
				strParetQuoteStatus=request.getParameter("answer(Object::Quote::QuoteStatus)");
			}

			String strParentQuoteId="";
			if(request.getParameter("answer(Object::Quote::ParentQuoteId)")!=null)
			{
				strParentQuoteId=request.getParameter("answer(Object::Quote::ParentQuoteId)");
			}

			String ProductVerId="";
			if(request.getParameter("answer(Object::Quote::ProductVerId)")!=null)
			{
				ProductVerId=request.getParameter("answer(Object::Quote::ProductVerId)");
			}			
			
			String parentQuoteVerId="";
			if(request.getParameter("answer(Object::Quote::ParentQuoteVerId)")!=null){
				parentQuoteVerId=request.getParameter("answer(Object::Quote::ParentQuoteVerId)");
			}
			String subQuoteId="";
			if(request.getParameter("answer(Object::Quote::SubQuoteId)")!=null){
				subQuoteId=request.getParameter("answer(Object::Quote::SubQuoteId)");
			}
			String subQuoteVerId="";
			if(request.getParameter("answer(Object::Quote::SuQuoteVerId)")!=null){
				subQuoteVerId=request.getParameter("answer(Object::Quote::SuQuoteVerId)");
			}
			String productId="";
			if(request.getParameter("answer(Object::Quote::ProductId)")!=null){
				productId=request.getParameter("answer(Object::Quote::ProductId)");
			}
		
		%>	
		<div id='LoaderIndicator' style="display:none">
							<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
							<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
							<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
							Loading....
							</div>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<html:hidden property="answer(Object::Quote::ProductId)" styleId="productId1" value="<%=""+productId%>" />
<html:hidden property="answer(Object::Quote::ProductVerId)" styleId="productVerId1" value="<%=""+ProductVerId%>" />
<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+strParentQuoteId%>" styleId="parentQuoteId1" />
<html:hidden styleId="parentQuoteVerId" property="answer(parentQuoteVerId)" value="<%=parentQuoteVerId %>"/>
<html:hidden property="answer(Object::Quote::SubQuoteId)" value="<%=""+subQuoteId%>" styleId="subQuoteId1" />
<html:hidden styleId="subQuoteVerId" property="answer(subQuoteVerId)" value="<%=subQuoteVerId %>"/>
<html:hidden property="answer(Object::Customer::CustomerId)" styleId="customerId1" value="<%=""+customerId%>" />
<html:hidden styleId="ownerId" property="answer(ownerId)" value="<%=""+ownerId %>"/>
<html:hidden property="answer(Object::Quote::QuoteStatus)" styleId="paretQuoteStatus1" value="<%=""+strParetQuoteStatus%>" />
			<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">																		
			<tr><td align="left">
				<div>&nbsp;</div>
				<div style="margin-left:10px">Pre-Bind Subjectivities</div>
				<div>&nbsp;</div>
			</td></tr>																	
			<tr>
				<td>
				<form id="prebindSubjectivityMap">
					<table WIDTH=100%" ALIGN="center" class="datadispborder"  border="0" CELLSPACING="0" CELLPADDING="0">
						<tr class="locformhead1">
			                 <td class="datadispcolhead" width="100%" >
								<table border="0" id="table5" cellspacing="0" cellpadding="0">
									<tr>
										<td >
											<div class="field" style="width:120px;">
											<select onchange="updateSubjectivityStatus(this.form,this,'PreBindSubjctivtyId')" name="answer(Object::Subjectivity::Status)">
											<option selected>Change Status</option>
											<option value="Open">Open</option>
											<option value="Not Required">Not Required </option>
											<option value="Satisfied" value="Satisfied">Satisfied </option>
											<option value="Rejected">Rejected</option>
											<option value="Overridden">Overridden</option>
											</select>
											</div>
										</td>
										<td>
											<table border="0" class="formcontent" align=right>
												<tr>
													<td><a href="#" class="button2" style="width:100px">Attach Document</a></td>
													<td><a href="#" class="button2" style="width:100px">Enter Diary Note</a></td>
													<td>&nbsp;&nbsp;&nbsp;</td>
												</tr>
											</table>							
										</td>
										<td >
											<table border="0" class="formcontent" align=right>
												<tr>
													<td><a href="javascript:void(0);" class="button2" onclick="showManuscriptSubjectivity('<%=""+productId%>','<%=""+ProductVerId%>','<%=subQuoteVerId %>','<%=""+subQuoteId%>','<%=parentQuoteVerId %>','<%=""+customerId%>','<%=""+strParetQuoteStatus%>','<%=""+strParentQuoteId%>');" style="width:125px">Create Manuscript</a></td>
												</tr>
											</table>							
										</td>
									</tr>
								</table>
								</td>														
			                 <td class="datadispcolhead" width="7%">&nbsp;</td>
			                 <td class="datadispcolhead" width="10%">&nbsp;</td>
			               </tr>
						<tr>
							<td><div id="PRE_BIND_LIST_TABLE"></div></td>
						</tr>																													
					</table>																																					
				</form>
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>																			
			</table>
		</td>
	</tr>
</table>
<script type="text/javascript">
refereshPreBindList();
</script>		
<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">																		
			<tr><td align="left">
				<div>&nbsp;</div>
				<div style="margin-left:10px">Post-Bind Subjectivities</div>
				<div>&nbsp;</div>
			</td></tr>																	
			<tr>
				<td>
				<form id="postbindSubjectivityMap">
					<table WIDTH=100%" ALIGN="center" class="datadispborder"  border="0" CELLSPACING="0" CELLPADDING="0">
						<tr class="locformhead1">
			                 <td class="datadispcolhead" width="100%" >
								<table border="0" id="table5" cellspacing="0" cellpadding="0">
									<tr>
										<td >
											<div class="field" style="width:120px;">
											<select name="answer(Object::Subjectivity::Status)">
											<option selected>Change Status</option>
											<option value="Open ">Open</option>
											<option value="Not Required ">Not Required </option>
											<option value="Open" value="Satisfied">Satisfied </option>
											<option value="Rejected">Rejected</option>
											<option value="Overridden">Overridden</option>
											</select>
											</div>
										</td>
										<td>
											<table border="0" class="formcontent" align=right>
												<tr>
													<td><a href="#" class="button2" style="width:100px">Attach Document</a></td>
													<td><a href="#" class="button2" style="width:100px">Enter Diary Note</a></td>
													<td>&nbsp;&nbsp;&nbsp;</td>
												</tr>
											</table>							
										</td>
										<td >
											<table border="0" class="formcontent" align=right>
												<tr>
													<td><a href="#" class="button2" style="width:125px">Create Manuscript</a></td>
												</tr>
											</table>							
										</td>
									</tr>
								</table>
								</td>														
			                 <td class="datadispcolhead" width="7%">&nbsp;</td>
			                 <td class="datadispcolhead" width="10%">&nbsp;</td>
			               </tr>
						<tr>
							<td><div id="POST_BIND_LIST_TABLE"></div></td>
						</tr>																
					</table>
					</form>																																					
				</td>
			</tr>
			<tr><td>&nbsp;<div id='frame' style="display:none"><iframe id='upload_target_iFrame' name='upload_target_iFrame' src='../common/MessageFromRule.jsp'  style='width:300px;height:30px;border:1px solid #ccc;'></iframe></div></td></tr>																			
			</table>
		</td>
	</tr>
</table>
<script type="text/javascript">
refereshPostBindList();
</script>
<tr>
<td><div id="manuScript"><div id='Manuscript_CONT'></div></div></td>
</tr>	
<tr><td><div id="subjDetail">
<div id="SUB_CONT"></div>
</div></td></tr>
<tr><td><div id="AttachFiles"></div></td></tr>
<tr><td><div id="AddNotespopup" style="display:none"></div></td></tr>
<script type="text/javascript">
var iframe = document.getElementById("upload_target_iFrame");
if (iframe.addEventListener) {
  iframe.addEventListener("load", hideAttachPopup, false);  // firefox
} else if (iframe.attachEvent) {
  iframe.attachEvent("onload", hideAttachPopup);  // IE
}
</script>