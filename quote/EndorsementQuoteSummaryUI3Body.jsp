<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Calendar" %>
<script type="text/javascript" src="../Scripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/CreateEndorsementQuote.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/SendEmail.js"></SCRIPT>
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/assets/skins/sam/menu.css">
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css"	href="../styles/yahoo/2.4.1/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/datatable1/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/build/assets/skins/sam/calendar.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/calendar/assets/skins/sam/calendar.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/editor/assets/skins/sam/simpleeditor.css" />
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/paginator-min.js"></script>  
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/editor/simpleeditor-min.js"></script>
<script language="JavaScript1.2" src="../Scripts/ui3.0/coolmenus4.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/CoveragesLimits.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js"></script>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/EndorsementQuoteSummaryUI3.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/EndorsementClassHazards.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/EndorsementClassBenefits.js"></script>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/WorkSheetBTA.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/calendar/calendar-min.js"></script>
<link rel="stylesheet" type="text/css" href="../Scripts/ext-3.2.1/resources/css/ext-all.css">
<script type="text/javascript" src="../Scripts/ext-3.2.1/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../Scripts/ext-3.2.1/ext-all.js"></script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/AttachmentTable.js" ></script>
<script type="text/javascript" src="../Scripts/JScripts/AddCustomer.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/AddOrEditAircraft.js"></script>
<%
String classBenefitsTab_ClassTab_req = ""+request.getAttribute("classBenefitsTab_ClassTab");
String hazardId_req = ""+request.getAttribute("hazardId");
String hazardsName_req = ""+request.getAttribute("hazardsName");
String classId_req = ""+request.getAttribute("classId");
String className_req = ""+request.getAttribute("className");
String deleteClass_req = ""+request.getAttribute("deleteClass");
String openTabName_req = ""+request.getAttribute("openTabName");
%>
<script type="text/javascript">
var renderPopup = true;
var renderPopup1 = true;
var openClassPopup = false;
var flag = 0;
var isSpecificValidationNeeded = false;
var url1 = "/SaveQuoteApplication.do";
var activeTabId = "";
var calendarDisplayed = false;
var recalculate = 0;
</Script>   
<style type="text/css">
/*margin and padding on body element
  can introduce errors in determining
  element position and are not recommended;
  we turn them off as a foundation for YUI
  CSS treatments. */
body {
	margin:0;
	padding:0;
}

</style>
 <style type="text/css">
TD.FormLabels{margin:3px 0 3px 10px;padding:0 0 0 50px;font-family: Arial;text-align:Left; font-size: 9pt; color: #595a5f; font-weight:bold;border-right:  0px solid;border-top:  0px solid;border-left: px solid;border-bottom:0px solid;width:800px;}
TD.FormLabels2{FONT-WEIGHT: bold;FONT-SIZE: 11px;COLOR: #000000;FONT-FAMILY: Verdana,Arial, Helvetica;}
</style>

<style type="text/css">
.yui-skin-sam .yui-panel{position:relative;left:0;top:0;border-style:solid;border-width:10px 0;border-color:#808080;z-index:1;*border-width:1px;*zoom:1;_zoom:normal;}
.yui-hidden {display:none;}
</style>
<bean:define id="parentQuoteId" name="QuoteDetail" property="answer(parentQuoteId)" scope="request"/>
<logic:empty name="parentQuoteId">
	<% parentQuoteId = (String)request.getAttribute("QuoteId"); %>
</logic:empty>
<bean:define id="ProductVerId" name="QuoteDetail" property="answer(Object::Quote::ProductVerId)" scope="request" />
<bean:define id="tabid" name="QuoteDetail" property="answer(openTabAPolicyInfo)"></bean:define>

<html:hidden property="answer(openTabAPolicyInfoCov)" value="<%=""+tabid%>" styleId="TabFocus"/>

<%String docSubQuoteId=""; 
String CustomerName="";%> 
<%boolean renewalEndorsement = false; %>
<%boolean isRenewal = false; %>
<%String endorsementExpDate =""; 
int policyPeriod =0; %>
<bean:define id="paretQuoteStatus" name="QuoteDetail" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="RejectReason" name="QuoteDetail" property="answer(Object::QuoteAdditional::RejectedNotes)" scope="request" />
<bean:define id="LostReason" name="QuoteDetail" property="answer(Object::QuoteAdditional::LostNotes)" scope="request" />
<bean:define id="QuoteStatus" name="QuoteDetail" property="answer(Object::Quote::QuoteStatus)" scope="request" />
<bean:define id="QuoteNumber" name="QuoteDetail" property="answer(Object::Quote::QuoteNumber)" scope="request" />
<bean:define id="QuoteSubNumber" name="QuoteDetail" property="answer(Object::Quote::QuoteSubNumber)" />
<bean:define id="EmpGrpNum" name="QuoteDetail" property="answer(Object:Customer:CustomerNumber)" scope="request" />

<bean:define id="customerId" name="QuoteDetail" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="agencyId" name="QuoteDetail" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="prodId" name="QuoteDetail" property="answer(Object::Quote::ProductId)" scope="request" />
<bean:define id="parentQuoteVerId" name="QuoteDetail" property="answer(Object::Quote::QuoteVerId)" scope="request" />
<bean:define id="QuoteType" name="QuoteDetail" property="answer(Object::Quote::QuoteType)" />
<bean:define id="FirstSubQuoteId" name="QuoteDetail" property="answer(Object::Quote::FirstSubQuoteId)" />
<bean:define id="QuoteId" name="QuoteDetail" property="answer(Object::Quote::Id)" />
<bean:define id="policyId" name="QuoteDetail" property="answer(Object::Quote::ParentPolicyId)" />
<bean:define id="policyVerId" name="QuoteDetail" property="answer(Object::Quote::ParentPolicyVerId)" />
<bean:define id="State" name="QuoteDetail" property="answer(Object::Quote::CustomerState)" />
<bean:define id="GroupVerId" name="QuoteDetail" property="answer(Object::Quote::ProductGroupVerId)" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />

<bean:define id="polProductId" name="QuoteDetail" property="answer(Object::Product::ProductId)"/>
<bean:define id="parentQuoteVerId" name="QuoteDetail" property="answer(Object::Quote::QuoteVerId)" scope="request" />
<bean:define id="ProductFamilyId" name="QuoteDetail" property="answer(Object::Quote::ProductFamilyId)"/>

<bean:define id="ownerId" name="QuoteDetail" property="answer(Object::Quote::OwnerId)" scope="request" />

<bean:define id="GroupId" name="QuoteDetail" property="answer(Object::Quote::ProductGroupId)" />
<bean:define id="productStatus" name="QuoteDetail" property="answer(Object::Quote::ProductStatus)" scope="request" />
<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
<bean:define id="quoteStartDate" name="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)" scope="request" />

<bean:define id="policyNumber" name="QuoteDetail" property="answer(policyNumber)" />

<bean:define id="endorsementPolicyNumber" name="QuoteDetail" property="answer(Object::Quote::PolicyNumber)" />

<bean:define id="parentPolicyId" name="QuoteDetail" property="answer(Object::Policy::ParentPolicyId)" />
<bean:define id="parentPolicyVerId" name="QuoteDetail" property="answer(Object::Policy::ParentPolicyVerId)" />
<bean:define id="email" property="answer(Object::UserDetail::email)" name="LoginPage" scope="session" />
<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session" />

<bean:define id="quoteName" name="QuoteDetail" property="answer(Object::Quote::QuoteName)" />
<bean:define id="quoteDesc" name="QuoteDetail" property="answer(Object::Quote::QuoteDesc)" />
<bean:define id="policyEffDate" name="QuoteDetail" property="answer(policyEffDate)" />
<bean:define id="policyExpDate" name="QuoteDetail" property="answer(policyExpDate)" />
<bean:define id="parentPolicyStatus" name="QuoteDetail" property="answer(parentPolicyStatus)" />
<bean:define id="paretLockStatus" name="QuoteDetail" property="answer(Object::Quote::LockStatus)" />
<% String exprDate = ""+policyExpDate; %>
<body class="yui-skin-sam">
</body>

<%if(request.getParameter("parentPolicyStatus")!=null) {%>
	<bean:parameter name="answer(parentPolicyStatus)" id="parentPolicyStatus"/>
<%} %>

<%
	boolean isSold = false;
	if(paretQuoteStatus.toString().equalsIgnoreCase("Sold")) {
		isSold = true;
	}
%>
<style type="text/css">
	.locformpages{border:1px #f0aa39 solid;width:900px;margin:0 auto;padding:9px;background:url(D:/jboss/jboss-4.0.5.GA/server/default/deploy/ins.war/styles/ui3.0/i/bodybg1.gif)repeat-x;}
  .tableData{line-height:17px;text-align:left;margin:0;padding:0;font-weight:bold;}
  .yui-skin-sam .yui-dt-mask{position:absolute;z-index:9500;}.yui-dt-tmp{position:absolute;left:-9000px;}.yui-dt-scrollable .yui-dt-bd{overflow:auto;}.yui-dt-scrollable .yui-dt-hd{overflow:hidden;position:relative;}.yui-dt-scrollable .yui-dt-bd thead tr,.yui-dt-scrollable .yui-dt-bd thead th{position:absolute;left:-1500px;}.yui-dt-scrollable tbody{-moz-outline:none;}.yui-dt-draggable{cursor:move;}.yui-dt-coltarget{position:absolute;z-index:999;}.yui-dt-hd{zoom:1;}th.yui-dt-resizeable .yui-dt-resizerliner{position:relative;}.yui-dt-resizer{position:absolute;right:0;bottom:0;height:100%;cursor:e-resize;cursor:col-resize;background-color:#CCC;opacity:0;filter:alpha(opacity=0);}.yui-dt-resizerproxy{visibility:hidden;position:absolute;z-index:9000;}th.yui-dt-hidden .yui-dt-liner,td.yui-dt-hidden .yui-dt-liner,th.yui-dt-hidden .yui-dt-resizer{display:none;}.yui-dt-editor{position:absolute;z-index:9000;}.yui-skin-sam .yui-dt table{margin:0;padding:0;font-family:arial;font-size:inherit;border-collapse:separate;*border-collapse:collapse;border-spacing:0;border:1px solid #7F7F7F;}.yui-skin-sam .yui-dt thead{border-spacing:0;}.yui-skin-sam .yui-dt caption{color:#000000;font-size:85%;font-weight:normal;font-style:italic;line-height:1;padding:1em 0pt;text-align:center;}.yui-skin-sam .yui-dt th{background:#D8D8DA url(sprite.png) repeat-x 0 0;}.yui-skin-sam .yui-dt th,.yui-skin-sam .yui-dt th a{font-weight:normal;text-decoration:none;color:#000;vertical-align:bottom;}.yui-skin-sam .yui-dt th{margin:0;padding:0;border:none;border-right:1px solid #CBCBCB;}.yui-skin-sam .yui-dt tr.yui-dt-first td{border-top:1px solid #7F7F7F;}.yui-skin-sam .yui-dt th .yui-dt-liner{white-space:nowrap;}.yui-skin-sam .yui-dt-liner{margin:0;padding:0;padding:4px 10px 4px 10px;}.yui-skin-sam .yui-dt-coltarget{width:5px;background-color:red;}.yui-skin-sam .yui-dt td{margin:0;padding:0;border:none;border-right:1px solid #CBCBCB;text-align:left;}.yui-skin-sam .yui-dt-list td{border-right:none;}.yui-skin-sam .yui-dt-resizer{width:6px;}.yui-skin-sam .yui-dt-mask{background-color:#000;opacity:.25;*filter:alpha(opacity=25);}.yui-skin-sam .yui-dt-message{background-color:#FFF;}.yui-skin-sam .yui-dt-scrollable table{border:none;}.yui-skin-sam .yui-dt-scrollable .yui-dt-hd{border-left:1px solid #7F7F7F;border-top:1px solid #7F7F7F;border-right:1px solid #7F7F7F;}.yui-skin-sam .yui-dt-scrollable .yui-dt-bd{border-left:1px solid #7F7F7F;border-bottom:1px solid #7F7F7F;border-right:1px solid #7F7F7F;background-color:#FFF;}.yui-skin-sam .yui-dt-scrollable .yui-dt-data tr.yui-dt-last td{border-bottom:1px solid #7F7F7F;}.yui-skin-sam thead .yui-dt-sortable{cursor:pointer;}.yui-skin-sam th.yui-dt-asc,.yui-skin-sam th.yui-dt-desc{background:url(sprite.png) repeat-x 0 -100px;}.yui-skin-sam th.yui-dt-sortable .yui-dt-label{margin-right:10px;}.yui-skin-sam th.yui-dt-asc .yui-dt-liner{background:url(dt-arrow-up.png) no-repeat right;}.yui-skin-sam th.yui-dt-desc .yui-dt-liner{background:url(dt-arrow-dn.png) no-repeat right;}tbody .yui-dt-editable{cursor:pointer;}.yui-dt-editor{text-align:left;background-color:#F2F2F2;border:1px solid #808080;padding:6px;}.yui-dt-editor label{padding-left:4px;padding-right:6px;}.yui-dt-editor .yui-dt-button{padding-top:6px;text-align:right;}.yui-dt-editor .yui-dt-button button{background:url(sprite.png) repeat-x 0 0;border:1px solid #999;width:4em;height:1.8em;margin-left:6px;}.yui-dt-editor .yui-dt-button button.yui-dt-default{background:url(sprite.png) repeat-x 0 -1400px;background-color:#5584E0;border:1px solid #304369;color:#FFF}.yui-dt-editor .yui-dt-button button:hover{background:url(sprite.png) repeat-x 0 -1300px;color:#000;}.yui-dt-editor .yui-dt-button button:active{background:url(sprite.png) repeat-x 0 -1700px;color:#000;}.yui-skin-sam tr.yui-dt-even{background-color:#FFF;}.yui-skin-sam tr.yui-dt-odd{background-color:#EDF5FF;}.yui-skin-sam tr.yui-dt-even td.yui-dt-asc,.yui-skin-sam tr.yui-dt-even td.yui-dt-desc{background-color:#EDF5FF;}.yui-skin-sam tr.yui-dt-odd td.yui-dt-asc,.yui-skin-sam tr.yui-dt-odd td.yui-dt-desc{background-color:#DBEAFF;}.yui-skin-sam .yui-dt-list tr.yui-dt-even{background-color:#FFF;}.yui-skin-sam .yui-dt-list tr.yui-dt-odd{background-color:#FFF;}.yui-skin-sam .yui-dt-list tr.yui-dt-even td.yui-dt-asc,.yui-skin-sam .yui-dt-list tr.yui-dt-even td.yui-dt-desc{background-color:#EDF5FF;}.yui-skin-sam .yui-dt-list tr.yui-dt-odd td.yui-dt-asc,.yui-skin-sam .yui-dt-list tr.yui-dt-odd td.yui-dt-desc{background-color:#EDF5FF;}.yui-skin-sam th.yui-dt-highlighted,.yui-skin-sam th.yui-dt-highlighted a{background-color:#B2D2FF;}.yui-skin-sam tr.yui-dt-highlighted,.yui-skin-sam tr.yui-dt-highlighted td.yui-dt-asc,.yui-skin-sam tr.yui-dt-highlighted td.yui-dt-desc,.yui-skin-sam tr.yui-dt-even td.yui-dt-highlighted,.yui-skin-sam tr.yui-dt-odd td.yui-dt-highlighted{cursor:pointer;background-color:#B2D2FF;}.yui-skin-sam .yui-dt-list th.yui-dt-highlighted,.yui-skin-sam .yui-dt-list th.yui-dt-highlighted a{background-color:#B2D2FF;}.yui-skin-sam .yui-dt-list tr.yui-dt-highlighted,.yui-skin-sam .yui-dt-list tr.yui-dt-highlighted td.yui-dt-asc,.yui-skin-sam .yui-dt-list tr.yui-dt-highlighted td.yui-dt-desc,.yui-skin-sam .yui-dt-list tr.yui-dt-even td.yui-dt-highlighted,.yui-skin-sam .yui-dt-list tr.yui-dt-odd td.yui-dt-highlighted{cursor:pointer;background-color:#B2D2FF;}.yui-skin-sam th.yui-dt-selected,.yui-skin-sam th.yui-dt-selected a{background-color:#446CD7;}.yui-skin-sam tr.yui-dt-selected td,.yui-skin-sam tr.yui-dt-selected td.yui-dt-asc,.yui-skin-sam tr.yui-dt-selected td.yui-dt-desc{background-color:#426FD9;color:#FFF;}.yui-skin-sam tr.yui-dt-even td.yui-dt-selected,.yui-skin-sam tr.yui-dt-odd td.yui-dt-selected{background-color:#446CD7;color:#FFF;}.yui-skin-sam .yui-dt-list th.yui-dt-selected,.yui-skin-sam .yui-dt-list th.yui-dt-selected a{background-color:#446CD7;}.yui-skin-sam .yui-dt-list tr.yui-dt-selected td,.yui-skin-sam .yui-dt-list tr.yui-dt-selected td.yui-dt-asc,.yui-skin-sam .yui-dt-list tr.yui-dt-selected td.yui-dt-desc{background-color:#426FD9;color:#FFF;}.yui-skin-sam .yui-dt-list tr.yui-dt-even td.yui-dt-selected,.yui-skin-sam .yui-dt-list tr.yui-dt-odd td.yui-dt-selected{background-color:#446CD7;color:#FFF;}.yui-skin-sam .yui-dt-paginator{display:block;margin:6px 0;white-space:nowrap;}.yui-skin-sam .yui-dt-paginator .yui-dt-first,.yui-skin-sam .yui-dt-paginator .yui-dt-last,.yui-skin-sam .yui-dt-paginator .yui-dt-selected{padding:2px 6px;}.yui-skin-sam .yui-dt-paginator a.yui-dt-first,.yui-skin-sam .yui-dt-paginator a.yui-dt-last{text-decoration:none;}.yui-skin-sam .yui-dt-paginator .yui-dt-previous,.yui-skin-sam .yui-dt-paginator .yui-dt-next{display:none;}.yui-skin-sam a.yui-dt-page{border:1px solid #CBCBCB;padding:2px 6px;text-decoration:none;background-color:#fff}.yui-skin-sam .yui-dt-selected{border:1px solid #fff;background-color:#fff;}
</style>
<style type="text/css">
    /* Clear calendar's float, using dialog inbuilt form element */
    #container .bd form {
        clear:left;
    }

    /* Have calendar squeeze upto bd bounding box */
    #container .bd {
        padding:0;
    }

    #container .hd {
        text-align:left;
    }

    /* Center buttons in the footer */
    #container .ft .button-group {
        text-align:center;
    }

    /* Prevent border-collapse:collapse from bleeding through in IE6, IE7 */
    #container_c.yui-overlay-hidden table {
        *display:none;
    }

    /* Remove calendar's border and set padding in ems instead of px, so we can specify an width in ems for the container */
    #cal {
        border:none;
        padding:1em;
    }

    /* Datefield look/feel */
    .datefield {
        position:relative;
        top:5px;
        left:1px;
        white-space:nowrap;
        border:0px;
        background-color:#eee;
        width:0;
        padding:0px;
    }

    .datefield input,
    .datefield button,
    .datefield label  {
        vertical-align:middle;
    }

    .datefield label  {
        font-weight:bold;
    }

    .datefield input  {
        width:15em;
    }

    .datefield button  {
        padding:0 5px 0 5px;
        margin-left:2px;
    }

    .datefield button img {
        padding:0;
        margin:0;
        vertical-align:middle;
    }

    /* Example box */
    .box {
        position:relative;
        height:3em;
    }
</style>
<script type="text/javascript">
        
var dialogSet = false;
var calendarSet = false;
        function showCaledarAppl() {
        var Event = YAHOO.util.Event,
            Dom = YAHOO.util.Dom,
            dialog,
            calendar;
       		var showBtn = Dom.get("CalendarButtonPremiumDueDate");		
            // Lazy Dialog Creation - Wait to create the Dialog, and setup document click listeners, until the first time the button is clicked.
          
            if (dialogSet==false) {

                // Hide Calendar if we click anywhere in the document other than the calendar
                Event.on(document, "click", function(e) {                
                    var el = Event.getTarget(e);
                    var dialogEl = dialog.element;		
                    if (el != dialogEl && !Dom.isAncestor(dialogEl, el)&& el != showBtn && !Dom.isAncestor(showBtn, el)) {
                   
                        dialog.hide();
                        
                    }                                   
                });

                function resetHandler() {
                    // Reset the current calendar page to the select date, or
                    // to today if nothing is selected.
                    var selDates = calendar.getSelectedDates();
                    var resetDate;

                    if (selDates.length > 0) {
                        resetDate = selDates[0];
                    } else {
                        resetDate = calendar.today;
                    }

                    calendar.cfg.setProperty("pagedate", resetDate);
                    calendar.render();
                }

                function closeHandler() {
                    dialog.hide();
                    calendarDisplayed = false;
                }
				
                dialog = new YAHOO.widget.Dialog("container", {
                    visible:false,
                    context:["CalendarButtonPremiumDueDate", "tl", "bl"],
                    buttons:[ {text:"Reset", handler: resetHandler, isDefault:true}, {text:"Close", handler: closeHandler}],
                    draggable:false,
                    close:true
                });
                if(document.getElementById("container") !=null){
                document.getElementById("container").innerHTML = "";
                }
                dialog.setHeader('Pick A Date');
            
                dialog.setBody('<div id="cal"></div>');
                
                dialog.render(document.body);
               
				
                dialog.showEvent.subscribe(function() {
                    if (YAHOO.env.ua.ie) {
                        // Since we're hiding the table using yui-overlay-hidden, we
                        // want to let the dialog know that the content size has changed, when
                        // shown
                        dialog.fireEvent("changeContent");
                    }
                });
                dialogSet = false;
            }

            // Lazy Calendar Creation - Wait to create the Calendar until the first time the button is clicked.
            if (!calendar) {
				
				var vardate1 = document.getElementById("PremiumDueDate").value;
			    var dmonth1 = vardate1.substring(0, 2);
				var dday1 = vardate1.substring(3, 5);
				var dyear1 =vardate1.substring(6, 10);	
				if(dmonth1<10){
				
					dmonth1 = dmonth1.substring(1,2);
				}
				
				if(dday1<10){
				
					dday1 = dday1.substring(1,2);
				}
				
				dmonth1 = parseInt(dmonth1,10);
				dday1 = parseInt(dday1,10);
				dyear1 =  parseInt(dyear1);
				if(!isNaN(dmonth1) && dmonth1<=12 && dmonth1>0 && !isNaN(dday1) && dday1<=31 && dday1>0 && !isNaN(dyear1)  && dyear1>1000){
                calendar = new YAHOO.widget.Calendar("cal", {
                    iframe:false,          // Turn iframe off, since container has iframe support.
                    hide_blank_weeks:true,  // Enable, to demonstrate how we handle changing height, using changeContent
                    selected: dmonth1+"/"+dday1+"/"+dyear1
                    
                });  
                }else{
                alert("else")
	                calendar = new YAHOO.widget.Calendar("cal", {
	                    iframe:false,          // Turn iframe off, since container has iframe support.
	                    hide_blank_weeks:true  // Enable, to demonstrate how we handle changing height, using changeContent
	                    
	                });  
                
                }
                          
			calendar.render();
                calendar.selectEvent.subscribe(function() {
                    if (calendar.getSelectedDates().length > 0) {

                        var selDate = calendar.getSelectedDates()[0];
						
                        // Pretty Date Output, using Calendar's Locale values: Friday, 8 February 2008
                        var wStr = calendar.cfg.getProperty("WEEKDAYS_LONG")[selDate.getDay()];
                        var dStr = selDate.getDate();
                        var mStr = selDate.getMonth()+1;
                        var yStr = selDate.getFullYear();
                        var stringdate = dStr;
                        if(dStr<10){
                        dStr = "0"+dStr;
                        }
						if(mStr<10){
                        mStr = "0"+mStr;
                        }
                        Dom.get("CaledarFeild_PremiumDueDate").value = mStr + "/" + dStr + "/" + yStr;
                        document.getElementById("PremiumDueDate").value = 	 mStr+ "/" + dStr + "/" + yStr;
                    } else {
                        Dom.get("CaledarFeild_PremiumDueDate").value = "";
                    }
                    dialog.hide();
                    calendarDisplayed = false;
                });

                calendar.renderEvent.subscribe(function() {
                    // Tell Dialog it's contents have changed, which allows
                    // container to redraw the underlay (for IE6/Safari2)
                    dialog.fireEvent("changeContent");
                });
                calendarSet = true;
            }

            var seldate = calendar.getSelectedDates();

            if (seldate.length > 0) {
                // Set the pagedate to show the selected date if it exists
                calendar.cfg.setProperty("pagedate", seldate[0]);
                calendar.render();
            }

            dialog.show();
            calendarDisplayed =true;
        }
    
</script>

<dmshtml:Get_Customer_Detail_ByCustomerId nameInSession="customerDetail1" customerId="<%=customerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
<logic:present name="customerDetail1" scope="request">
	
	<bean:define id="tempCustomerName" name="customerDetail1" property="customerName" scope="request" />
	<% CustomerName = ""+tempCustomerName; %>
</logic:present>
<%String IsApplicationDisabled="Y";%>
<%String IsOptionDisabled="Y";%>
		<%String isUI3 = "N"; %>
<% long subQuoteIdforChk = 0; %>
<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
								<%IsOptionDisabled="N";%>
								<%IsApplicationDisabled="N";%>
					</dmshtml:dms_isPresent>
					
					<dmshtml:dms_isPresent property="<%=new String[]{"Submitted"}%>" value="<%=paretQuoteStatus.toString()%>"  negated="true">
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SAVE_AFTER_SUBMIT_QUOTE"}%>' connector='or' negated="true">
								<%IsOptionDisabled="N";%>
								<%IsApplicationDisabled="N";%>
							</dmshtml:dms_static_with_connector>
					</dmshtml:dms_isPresent>
<%String pName = ""; %>

<table border="0" cellpadding="0" cellspacing="0" width="98%"    align="left">

  <tr>
     <td width="98%" colspan="2">&nbsp;</td>
   </tr>

<dmshtml:Get_All_Plan_HeaderDetails nameInSession="subQuotes" parentQuoteId='<%=""+parentQuoteId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  />
<% 
	String subQuoteVerIdParam = "0";
	String subQuoteIdParam = "0";
%>
<logic:present name="subQuotes" scope="request">
	<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"></logic:iterate>
	<bean:define id="subQuoteVerIdTemp" name="aSubQuote" property="quoteVerId" />
	<bean:define id="subQuoteIdTemp" name="aSubQuote" property="quoteId" />
	<% 
		subQuoteVerIdParam = "" + subQuoteVerIdTemp;
		subQuoteIdParam = "" + subQuoteIdTemp;
	%>
</logic:present>

<tr>
	<td>
		<jsp:include page="/common/PolicyQuoteHeaderCoverMin.jsp">
			<jsp:param name="answer(Object::Quote::ObjectId)" value="<%=""+parentQuoteId%>" />		
		</jsp:include>
	</td>
</tr>

<tr>
	<td><%System.out.println("parentPolicyId :: "+parentPolicyId) ;%></td>
</tr>

<tr>
	<td>				
		<jsp:include page="../common/DynamicPolicyHeaderUI3.jsp">
			<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
			<jsp:param name="policyVerId" value="<%=parentPolicyVerId.toString()%>" />
			<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
			<jsp:param name="prodId" value="<%=""+prodId%>" />
			<jsp:param name="ProductVerId" value="<%=""+ProductVerId%>" />								
			<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
		</jsp:include>
	 </td>
</tr>

<tr>
	<td>
		<jsp:include page="/common/EndorsementQuoteInformation.jsp">
			<jsp:param name="answer(Object::Quote::ObjectId)" value="<%=""+parentQuoteId%>" />
			<jsp:param name="subQuoteVerId" value="<%=""+subQuoteVerIdParam%>" />
			<jsp:param name="subQuoteId" value="<%=""+subQuoteIdParam%>" />
		</jsp:include>
	</td>
</tr>



<tr>
<td>
<html:form action="/SaveQuoteSummaryAction" styleId="frm" onsubmit="return validateRenewalQuoteDate(this);">
	<table WIDTH="99%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr height="15px">
			<td>&nbsp;
			</td>
		</tr>
		
				
		<!-- <tr>
			<td>
				<table WIDTH="100%" BORDER="0" align="left" CELLSPACING="0" CELLPADDING="0" class="frlabel5 left">
				 	<tr>
						<td align="left">	
							<jsp:include page="../common/EndorsementQuoteHeader.jsp">
								<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
							</jsp:include>	
						</td>
					</tr>		
				</table>	
			</td>
		</tr> -->
		<tr>
     <td>
  		
			
					<div id="SubjectivityDiv" style="display:none">
							<div id='LoaderIndicator' style="display:none">
							<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
							<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
							<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
							Loading....
							</div>
							</div>
							<html:hidden property="answer(Object::Quote::ProductId)" styleId="productId1" value="<%=""+prodId%>" />
							<html:hidden property="answer(Object::Quote::ProductVerId)" styleId="productVerId1" value="<%=""+ProductVerId%>" />
							<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+parentQuoteId%>" styleId="parentQuoteId1" />
							<html:hidden styleId="parentQuoteVerId" property="answer(parentQuoteVerId)" value="<%=""+parentQuoteVerId %>"/>
							<html:hidden property="answer(Object::Customer::CustomerId)" styleId="customerId1" value="<%=""+customerId%>" />
							<html:hidden styleId="ownerId" property="answer(ownerId)" value="<%=""+ownerId %>"/>
							<html:hidden property="answer(Object::Quote::QuoteStatus)" styleId="paretQuoteStatus1" value="<%=""+paretQuoteStatus%>" />
							<html:hidden property="answer(Object::Quote::parentPolicyStatus)" styleId="parentPolicyStatus1" value="<%=""+parentPolicyStatus%>" />
							
							<html:hidden property="answer(IsApplicationDisabled)" value="<%=""+IsApplicationDisabled %>" styleId="IsApplicationDisabled" />	
							<html:hidden property="answer(productStatus)" value="<%=""+productStatus %>" styleId="productStatus" />								
							<html:hidden property="answer(GroupId)" value="<%=""+GroupId %>" styleId="GroupId" />	
							<html:hidden property="answer(GroupVerId)" value="<%=""+GroupVerId %>" styleId="GroupVerId" />															
							<html:hidden property="answer(IsOptionDisabled)" value="<%=""+IsOptionDisabled %>" styleId="IsOptionDisabled" />									
							<html:hidden property="answer(parentPolicyId)" value="<%=""+parentPolicyId %>" styleId="parentPolicyId" />			
							<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber %>" styleId="policyNumber" />			
							<html:hidden property="answer(parentPolicyVerId)" value="<%=""+parentPolicyVerId %>" styleId="parentPolicyVerId" />			
							<html:hidden property="answer(parentQuoteId)" styleId="parentQuoteId" value="<%=""+parentQuoteId%>" />
							<html:hidden property="answer(parentQuoteVerId)" styleId="parentQuoteVerId" value="<%=""+parentQuoteVerId%>" />
					
							<html:hidden property="answer(ProductVerId)" styleId="ProductVerId" value="<%=""+ProductVerId%>" />
							<html:hidden property="answer(agencyId)" styleId="agencyId" value="<%=""+agencyId%>" />
					
							<html:hidden property="answer(ProductFamilyId)" styleId="ProductFamilyId" value="<%=""+ProductFamilyId%>" />
							<html:hidden property="answer(ownerId)" styleId="ownerId" value="<%=""+ownerId%>" />
							<html:hidden property="answer(customerId)" styleId="customerId" value="<%=""+customerId%>" />
							<html:hidden property="answer(pagename)" value="Endorsement summary" styleId="PageName"/>
							 <input type="hidden" name="answer(QuoteId)" value="<%=parentQuoteId.toString()%>"/>				
		              	     <html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>" styleId="Quote" />
		              	     <html:hidden property="answer(Object::Quote::QuoteNumber)" styleId="QuoteNumberHid" />
							<html:hidden property="answer(Object::Quote::QuoteSubNumber)" styleId="QuoteSubNumberHid" />							
			  				<html:hidden property="answer(Object::UserDetail::email)" value='<%=""+email%>' styleId="emailHid"/>
							<html:hidden property="answer(Object::UserDetail::roleName)" value='<%=""+roleName%>' styleId="roleNameHid"/>
							<html:hidden property="answer(Object::Notification::Email::ObjectType)" value="QUOTE" styleId="EmailType"/>
  							<html:hidden property="answer(EmailViewPrevilegeAvail)" value="false" styleId="EmailViewPrevilegeAvail"/>
  							<html:hidden property="answer(Object::Quote::QuoteStatus)" styleId="paretQuoteStatus" value="<%=""+paretQuoteStatus%>" />
  							<html:hidden property="answer(Object::Quote::isEndorsementQuote)" value="false" styleId="isEndorsementQuote" />
  							<html:hidden property="hazardId" styleId="hazardId" value='<%=""%>' />
							<html:hidden property="hazardsName" styleId="hazardsName" value='<%=""%>' />
							<html:hidden property="answer(Object::PlanFactor::CreatedBy)" value="<%=userId.toString()%>" />
							<html:hidden property="answer(Object::PlanFactor::UpdatedBy)" value="<%=userId.toString()%>" styleId="userId1"/>
							<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
							<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
							<html:hidden property="answer(Object::Quote::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
							<html:hidden property="answer(classBenefits)" styleId="classBenefitsSave" />
							<html:hidden property="answer(hazardId)" value="<%=""+hazardId_req%>" styleId = "hazardIdRecalc" />
							<html:hidden property="answer(hazardsName)" value="<%=""+hazardsName_req%>" styleId = "hazardsNameRecalc" />
							<html:hidden property="answer(classId)" value="<%=""+classId_req%>" styleId = "classIdRecalc" />
							<html:hidden property="answer(className)" value="<%=""+className_req%>" styleId = "classNameRecalc" />
							<html:hidden property="answer(openTabAPolicyInfo)" value="" styleId="recalculateHidden"/>
							<html:hidden property="answer(ParentQuoteVerId)" value="<%=parentQuoteVerId.toString()%>" />
							<html:hidden property="answer(classBenefits)" value="" styleId="classBenefitsTab_ClassTab" />
							<html:hidden property="answer(openTabName)" styleId="openTabNameHid" value=""/>
							<html:hidden property="answer(deleteClass)" value="" styleId="deleteClassTab" />
							<html:hidden property="answer(Object::Quote::Id)" value="<%=QuoteId.toString()%>" styleId="QuoteIdHid" />
							
  </div>				
 </td>
</tr>


<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DELETE_ATTACHMENT_NOTES"}%>' connector='or' negated="true">
			<html:hidden property="answer(deleteAttachment)" value="true" styleId="deleteAttachmentNotes"/>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DELETE_ATTACHMENT_NOTES"}%>' connector='or' negated="false">
			<html:hidden property="answer(deleteAttachment)" value="false" styleId="deleteAttachmentNotes"/>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_VIEW"}%>' connector='or' negated="true">
			<html:hidden property="answer(EmailViewPrevilegeAvail)" value="true" styleId="EmailViewPrevilegeAvail"/>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_VIEW"}%>' connector='or' negated="false">
			<html:hidden property="answer(EmailViewPrevilegeAvail)" value="false" styleId="EmailViewPrevilegeAvail"/>
</dmshtml:dms_static_with_connector>


		<dmshtml:dms_isPresent
			property='<%=new String[]{"Lost", "Rejected"}%>'
			value="<%=paretQuoteStatus.toString()%>" negated="true">
		<tr>
			<td class="Error">Reason : <%=RejectReason.toString()+" "+LostReason.toString()%>
			</td>
		</tr>
		<tr height="15px">
			<td>&nbsp;
			</td>
		</tr>
		</dmshtml:dms_isPresent>
		


		
		<logic:present name="subQuotes" scope="request">
	
		<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">
		</logic:iterate>
		<bean:define id="subQuoteId" name="aSubQuote" 	property="quoteId" />
		<bean:define id="subQuoteVerId" name="aSubQuote" 	property="quoteVerId" />
		<bean:define id="subQuoteProductId" name="aSubQuote" 	property="productId" />
		<bean:define id="subQuoteProductVerId" name="aSubQuote" 	property="productVerId" />
		<bean:define id="planNum" name="aSubQuote" 	property="quoteNumber" />
		<bean:define id="planDetails" name="aSubQuote" 	property="healthInsPlanDetail" type="com.dms.ejb.insurance.quote.common.plan.PlanDetail" />
		<%long riskId =planDetails.getPLResRiskPropertyId() ;
		String riskName =planDetails.getPLResRiskPropertyName() ;
		String riskNumber =planDetails.getPLResRiskPropertyRiskNumber() ;
		long riskTerritory =planDetails.getTerritory() ;
		String planState = planDetails.getStateCode();
		subQuoteIdforChk = Long.parseLong(""+subQuoteId);
		String riskZone = planDetails.getZone();
		%>
		<html:hidden property="answer(planState)" styleId="planStateId" value="<%=""+planState%>" />
				<html:hidden property="answer(subQuoteId)" styleId="subQuoteId" value="<%=""+subQuoteId%>" />
				<html:hidden property="answer(subQuoteId)" styleId="subQuoteId11" value="<%=""+subQuoteId%>" />
				
						<html:hidden property="answer(subQuoteVerId)" styleId="subQuoteVerId" value="<%=""+subQuoteVerId%>" />
		<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value='<%=""+subQuoteVerId%>'/>
		<logic:present name="QuoteTransactionStatus" scope="request">
			<tr>
				<td class="Error"><%= request.getAttribute("QuoteTransactionStatus") %>
				</td>
			</tr>
		</logic:present>
		<tr>
		 	<td class="Error">
		 	<%
				boolean errorOccured=false;
			%>
				<logic:present name="MESSAGE_LIST" scope="request">
					<ul>
						<logic:iterate id="message" name="MESSAGE_LIST">
							<li><bean:write name="message"/></li>
							<%errorOccured	=true;%>
						</logic:iterate>
					</ul>			
				</logic:present>
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
		</tr>
		<tr>
			<td>
			<table width="50%">
			    <dmshtml:Get_Policy_HeaderInfo nameInSession="policyHeaderInfo" policyId="<%=""+parentPolicyId%>" policyVerId="<%=""+parentPolicyVerId %>" policyNumber="<%=""+policyNumber%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" documentType='BINDER' />
				<bean:define id="policyEffectiveDate1" name= "policyHeaderInfo" property="policyEffDate" />	
				<bean:define id="policyExpirationDate1" name="policyHeaderInfo" property="policyExpDate" />	
				<bean:define id="parentpolicyStatus" name="policyHeaderInfo" property="policyStatus" scope="request"/>			
				<tr>
					<dmshtml:dms_isPresent property='<%=new String[]{"In Progress","Referred","Bind Request","Bound","Issued","Offered","Lapsed"}%>'value="<%=paretQuoteStatus.toString()%>" negated="true">	
						<td class="links" width="25%">
							<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>" id="POLICY_SUMMARY" class="button2" style="width:150px" title="Click to go to Policy Summary">Go to Policy Summary</a>							
						</td>
					</dmshtml:dms_isPresent>
					

					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="CREATE_RENEWAL_PDF" 
						property='<%=new String[]{"In Progress","Offered","Bind Request","Bind"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
					
					<% boolean isAvailableToDisplay = true; %>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="CREATE_RENEWAL_PDF" 
						property='<%=new String[]{"In Progress","Referred"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="links" width="25%">
							<a href="../endorsement/CreateQuoteProposalBTA.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(ProductId)=<%=""+prodId%>&answer(ProductFamilyId)=<%=ProductFamilyId.toString()%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId%>&answer(parentPolicyId)=<%=""+parentPolicyId%>&subQuoteId=<%=subQuoteId.toString()%>&answer(subQuoteVerId)=<%=""+subQuoteVerId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(suQuoteVerId)=<%=""+subQuoteVerId%>&answer(isRenewalEndorsement)=YES&answer(Object::Quote::QuoteType)=ENDORSEMENT&answer(subQuoteVerIdParam)=<%=""+subQuoteVerIdParam%>&answer(subQuoteIdParam)=<%=""+subQuoteIdParam%>" id="Create_Quote_Proposal" class="button2" style="width:150px">Create Renewal PDF</a>

						</td><% isAvailableToDisplay = false; %>						
					</dmshtml:isFeatureAvailableForProductRoleStatus>												
					
				
					<%if(isAvailableToDisplay){ %>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="BIND_REQUEST_AVAILABLE" 
						property='<%=new String[]{"In Progress","Offered"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="links" width="25%">
							<a href="../quote/BindRequest.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType %>&answer(DocumentType)=BINDER&answer(Object::Quote::QuoteStartDate)=<%=""+quoteStartDate %>&answer(parentPolicyId)=<%=""+parentPolicyId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Quote::QuoteName)=<%=""+quoteName%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>&answer(Object::Quote::QuoteStatus)=Offered&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=""+riskId%>&subQuoteId=<%=subQuoteId.toString()%>&answer(suQuoteVerId)=<%=""+subQuoteVerId%>&answer(subQuoteVerIdParam)=<%=""+subQuoteVerIdParam%>&answer(subQuoteIdParam)=<%=""+subQuoteIdParam%>"" id="Bind_Request"class="button2" style="width:150px">Bind Request</a>  
						</td>						
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<%}%>
				
					<%if(isAvailableToDisplay){ %>					
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="BIND_AVAILABLE" 
						property='<%=new String[]{"Bind Request"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<dmshtml:dms_isPresent property='<%=new String[]{"ENDORSEMENT"}%>' value="<%=QuoteType.toString()%>" negated="true">
						<td class="links" width="25%">
						
							<a href="../endorsement/IssueBinder.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Quote::QuoteName)=<%=""+quoteName %>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=riskId %>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(DocumentType)=ISSUANCE&answer(teritory)=<%=""%>&Navigation=&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&tabNo=0&answer(ParentQuoteId)=<%=parentQuoteId.toString()%>&answer(SubQuoteId)=<%=subQuoteId.toString()%>&ParentQuoteId=<%=parentQuoteId.toString()%>&SubQuoteId=<%=subQuoteId.toString()%>&answer(state)=<%=""+State%>&subQuoteId=<%=subQuoteId.toString()%>&answer(suQuoteVerId)=<%=""+subQuoteVerId%>&answer(parentPolicyStatus)=<%=""+parentpolicyStatus %>&answer(Object::Quote::PolicyExpDate)=<%=""+policyExpirationDate1%>" id="Bind_Quote" class="button2" style="width:150px">Bind</a>


						</td>
						</dmshtml:dms_isPresent>						
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="BIND_AVAILABLE_NO_DOCUMENT" 
						property='<%=new String[]{"Bind Request"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<dmshtml:dms_isPresent property='<%=new String[]{"ENDORSEMENT"}%>' value="<%=QuoteType.toString()%>" negated="true">
						<td class="links" width="25%">
						
							<a href="../endorsement/IssueBinderBTA.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Quote::QuoteName)=<%=""+quoteName %>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=riskId %>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(DocumentType)=ISSUANCE&answer(teritory)=<%=""%>&Navigation=&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&tabNo=0&answer(ParentQuoteId)=<%=parentQuoteId.toString()%>&answer(SubQuoteId)=<%=subQuoteId.toString()%>&ParentQuoteId=<%=parentQuoteId.toString()%>&SubQuoteId=<%=subQuoteId.toString()%>&answer(state)=<%=""+State%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(suQuoteVerId)=<%=""+subQuoteVerId%>&answer(parentPolicyStatus)=<%=""+parentpolicyStatus %>&answer(Object::Quote::PolicyExpDate)=<%=""+policyExpirationDate1%>" id="Bind_Quote" class="button2" style="width:150px">Bind</a>


						</td>
						</dmshtml:dms_isPresent>						
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SUBJECTIVITY_BIND_AVAILABLE" 
						property='<%=new String[]{"In Progress","Offered","Bind Request"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<dmshtml:dms_isPresent property='<%=new String[]{"ENDORSEMENT"}%>' value="<%=QuoteType.toString()%>" negated="true">
						<td class="links" width="25%">
						<a href="../AddRemoveTankIssueEndorsementEligibilityRuleAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Quote::QuoteName)=<%=""+quoteName %>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(subQuoteVerId)=<%=""+subQuoteVerId%>&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=riskId %>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(DocumentType)=ISSUANCE&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Quote::QuoteName)=<%=""+quoteName %>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=riskId %>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(DocumentType)=ISSUANCE&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::QuoteVerId)=<%=""+subQuoteVerId%>" id="Bind_Quote"  class="button2" style="width:150px">Bind</a>
							


						</td>
						</dmshtml:dms_isPresent>						
					</dmshtml:isFeatureAvailableForProductRoleStatus>					
					<%}%>
						
					<%renewalEndorsement = true; %>	
					</dmshtml:isFeatureAvailableForProductRoleStatus>	
					

				
					<%if(!renewalEndorsement){ %>
					
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="BIND_REQUEST_AVAILABLE" 
						property='<%=new String[]{ "In Progress","Offered"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="links" width="25%">
							<a href="../quote/BindRequest.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType %>&answer(DocumentType)=BINDER&answer(Object::Quote::QuoteStartDate)=<%=""+quoteStartDate %>&answer(parentPolicyId)=<%=""+parentPolicyId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Quote::QuoteName)=<%=""+quoteName%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>&answer(Object::Quote::QuoteStatus)=Offered&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=""+riskId%>&answer(subQuoteVerIdParam)=<%=""+subQuoteVerIdParam%>&answer(subQuoteIdParam)=<%=""+subQuoteIdParam%>"" id="Bind_Request"  class="button2" style="width:150px">Bind Request</a>
					</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
																	
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="BIND_AVAILABLE" 
						property='<%=new String[]{"In Progress","Offered","Bind Request"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<dmshtml:dms_isPresent property='<%=new String[]{"ENDORSEMENT"}%>' value="<%=QuoteType.toString()%>" negated="true">
						<td class="links" width="25%">
						
							<a href="../endorsement/IssueBinder.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Quote::QuoteName)=<%=""+quoteName %>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=riskId %>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(DocumentType)=ISSUANCE&answer(subQuoteVerId)=<%=""+subQuoteVerIdParam%>&answer(subQuoteId)=<%=""+subQuoteIdParam%>&answer(parentPolicyStatus)=<%=""+parentpolicyStatus %>&answer(Object::Quote::PolicyExpDate)=<%=""+policyExpirationDate1%>&answer(Object::Quote::PolicyEffDate)=<%=""+policyEffectiveDate1%>" id="Bind_Quote"  class="button2" style="width:150px">Bind</a>


						</td>
						</dmshtml:dms_isPresent>						
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SUBJECTIVITY_BIND_AVAILABLE" 
						property='<%=new String[]{"In Progress","Offered","Bind Request"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<dmshtml:dms_isPresent property='<%=new String[]{"ENDORSEMENT"}%>' value="<%=QuoteType.toString()%>" negated="true">
						<td class="links" width="25%">
						<a href="../AddRemoveTankIssueEndorsementEligibilityRuleAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Quote::QuoteName)=<%=""+quoteName %>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(subQuoteVerId)=<%=""+subQuoteVerId%>&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=riskId %>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(DocumentType)=ISSUANCE&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Quote::QuoteName)=<%=""+quoteName %>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=riskId %>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(DocumentType)=ISSUANCE&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::QuoteVerId)=<%=""+subQuoteVerId%>" id="Bind_Quote"  class="button2" style="width:150px">Bind</a>
							


						</td>
						</dmshtml:dms_isPresent>						
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="COV_LIM_ENDORSEMENT_BIND_AVAILABLE" 
						property='<%=new String[]{"In Progress","Offered","Bind Request"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<dmshtml:dms_isPresent property='<%=new String[]{"ENDORSEMENT"}%>' value="<%=QuoteType.toString()%>" negated="true">
						<td class="links" width="25%">						
								<a href="../IssueEndorsementEligibilityRuleAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Quote::QuoteName)=<%=""+quoteName %>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=riskId %>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(DocumentType)=ISSUANCE&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::QuoteVerId)=<%=""+subQuoteVerId%>" id="Bind"><html:button styleClass="linkButton" property="answer(bindQuote)" value="Bind" onclick="window.location=document.getElementById('Bind')"/></a>
						</td>
						</dmshtml:dms_isPresent>						
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					
					
					<%} %>
				<%if(renewalEndorsement){ %>
						<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="LAPSE_AVAILABLE" 
			                property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Submitted"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
							<td class="links" align="left" width="120px">
								<a href="../LostQuoteBTA.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(policyNumber)=<%=""+policyNumber %>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(GetadditionalInfo)=yes&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Policy::ParentPolicyVerId)=<%=parentPolicyVerId %>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Quote::QuoteType)=ENDORSEMENT&answer(Object::Quote::ProductId)=<%=""+prodId%>&isRenewal=<%=""+isRenewal %>&answer(subQuoteVerIdParam)=<%=""+subQuoteVerIdParam%>&answer(subQuoteIdParam)=<%=""+subQuoteIdParam%>""  class="button2" style="width:100px" title="<bean:message key='ToolTip.EndorsementQuoteSummary.Lapse'/>">Lapse</a>
							</td>
						</dmshtml:isFeatureAvailableForProductRoleStatus>									
				
				<%} %>
					<dmshtml:dms_static_with_connector 
		ruleName='privilage' 
		property='<%=new String[]{"PRIVILEGE_SEARCH_ACTIVITY_LOG"}%>' 			
		connector='or' negated="true">
						<td class="links"align="left" width="100px">
	<a href="../SearchActivityManagerAction9.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Activity::ObjectId)=<%=""+parentQuoteId%>&answer(Object::Activity::ObjectType)=<%="Quote"%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus%>&answer(Object::Activity::OwnerId)=<%=ownerId.toString()%>&answer(Object::Activity::PageNum)=0&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentPolicyStatus)=<%=""+parentPolicyStatus %>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(subQuoteVerId)=<%=""+subQuoteVerIdParam%>&answer(subQuoteId)=<%=""+subQuoteIdParam%>"  class="button2" style="width:150px" title="Click to go to Activity Log">Go to Activity Log</a>

			</td>			
	</dmshtml:dms_static_with_connector>  
			
								
				</tr>
			</table>
			</td>
		</tr>
		</logic:present>
		<tr height="10px">
			<td>&nbsp;
			</td>
		</tr>
		<logic:present name="ErrorMsg">
		<tr height="15px">
			<td class="Error">
				<%= ""+request.getAttribute("ErrorMsg") %>
			</td>
		</tr>
		<tr height="10px">
			<td>&nbsp;
			</td>
		</tr>		
		</logic:present>
		
		<tr>
			<td class="Error">
								
				<logic:present name="MESSAGE_LISTS" scope="request">	
<%int errCnt = 0; %>	
<tr>
	<td class="Error" style="font-weight: bold;font-size: 10pt;">		
		
	</td>
</tr>	
	<tr>
	
		<td colspan="2" class="links">
			<table width="900px">				
				<tr>
				<td>
					&nbsp;
				</td>
					<td class="Error">				
						<ol>
				        	<logic:iterate id="InnerMessageList" name="MESSAGE_LISTS">
				        	
					        	<%int flag=0; %>
					        	<logic:iterate id="message" name="InnerMessageList">
					                <%if(flag==0){ flag=1;%>
					                	
        									<tr><td class="Error"><li style="{COLOR: #ff0000;FONT-WEIGHT: bold}"><bean:write  name="message"/></li></td></tr>
       								<%} else{ %>
        									<tr><td class="Error"><li style="{COLOR: #ff0000;FONT-WEIGHT: bold}"><bean:write name="message"/></li></td></tr>
       								<%}%>
       							</logic:iterate>
      						</logic:iterate>
     					</ol>   
					</td>
				</tr>
			</table>
		</td>
	</tr>
</logic:present>	
										
		</td></tr>
		
		<tr>
			<td>
			<table>
				<tr>
					<dmshtml:GetEndorsementQuoteHeaderInfo dBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' nameInSession="endorse" ownerId='<%=""+ownerId%>' quoteId='<%=""+parentQuoteId%>' />
					<logic:present name="endorse">
						<td class="FormLabels" width="40%">
							<B>Endorsement Name</B>
						</td>
						<td class="TextMatter" width="60%">
							<bean:write name="EndorseQuoteHeader" property="Object::Endorse::Quote::ProductName" />
							<input type="hidden"  value ="<bean:write name="EndorseQuoteHeader" property="Object::Endorse::Quote::ProductName" />" id="productName" />
						<bean:define id="productName" name="EndorseQuoteHeader" property="Object::Endorse::Quote::ProductName" />
					<% pName = ""+productName; %></td>
					</logic:present>
				</tr>
				 <html:hidden  property="answer(Object::Quote::QuoteStartDate1)"  styleId="txtDate" />
				 <html:hidden  property="answer(Object::Quote::QuoteStartDateHidden)"  styleId="quoteStartDatehidden"  value="<%=""+quoteStartDate %>"/>
				 
				 <bean:define id="quoteStartDate" name="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)" scope="request" />
				<bean:define id="quoteEndDate" name="QuoteDetail" property="answer(Object::Quote::QuoteEndDate)" scope="request" />
				 <html:hidden  property="answer(Object::Quote::QuoteEndDateHidden)"  styleId="QuoteEndDatehidden"  value="<%=""+quoteEndDate %>"/>
				<dmshtml:Get_Policy_HeaderInfo nameInSession="policyHeaderInfo" policyId="<%=""+parentPolicyId%>" policyVerId="<%=""+policyVerId %>" policyNumber="<%=""+policyNumber%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" documentType='BINDER' />
				<bean:define id="policyEffDate1" name="policyHeaderInfo" property="policyEffDate" />	
				<bean:define id="policyExpDate1" name="policyHeaderInfo" property="policyExpDate" />	
				<bean:define id="parentPolicyStatus1" name="policyHeaderInfo" property="policyStatus" scope="request"/>	
				<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="true">
				<tr>
					<td class="FormLabels" width="40%"><B>Requested Effective Date</B></td>
						<html:hidden property="answer(parentPolicyStatus)" value="<%=parentPolicyStatus.toString()%>"/>
					<%if((""+parentPolicyStatus1).equalsIgnoreCase("canceled")){ %>
						<td class="TextMatter" width="60%">										
							<html:text name="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)" style="font-family:Verdana;font-size:12px;" styleClass="txtbox" styleId="txtDate" size="10" maxlength="30" disabled="true" />
						</td>
					<%} %>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="CREATE_RENEWAL_PDF" 
						property='<%=new String[]{"In Progress","Offered","Bind Request","Bind","Lapsed"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<%isRenewal=true; %>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<%if(!(""+parentPolicyStatus1).equalsIgnoreCase("canceled")){ 
						String minDate="";
						if(isRenewal){
							minDate=""+policyExpDate1;
						}else{
							minDate=""+policyEffDate1;
						}%>
						<td width="35%" id="EffectiveDatePanel"> 
				           <jsp:include page="../common/EndorsementEffectiveDateField.jsp">
					           <jsp:param name="inputDateField" value="txtDate1"/>
					           <jsp:param name="panelDiv" value="EffectiveDatePanel" />
					           <jsp:param name="minimumDate" value="<%=""+minDate%>" />
					           <jsp:param name="maximumDate" value="" />
					           <jsp:param name="allowBlank" value="false"/>
					           <jsp:param name="setDefaultToday" value=""/>			           
				           </jsp:include>
				          </td>										
							
							<html:hidden name="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)" style="font-family:Verdana;font-size:12px;" styleClass="txtbox" styleId="referenceStartDate"   />
							
					<%}%>
				</tr>
				<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="ENDORSEMENT_QUOTESUMMARY_UI3" 
				 property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Bound","Issued","Submitted","Lost"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true"> 	
				<tr>
					<td class="FormLabels" width="50%"><B>Requested Expiration Date</B></td>
					
					<td width="35%" id="ExpirationDatePanel"> 
					       <jsp:include page="../common/EndorsementEffectiveDateField.jsp">
					           <jsp:param name="inputDateField" value="expDate1"/>
					           <jsp:param name="panelDiv" value="ExpirationDatePanel" />
					           <jsp:param name="minimumDate" value="" />
					           <jsp:param name="maximumDate" value="" />
					           <jsp:param name="allowBlank" value="false"/>
					           <jsp:param name="setDefaultToday" value=""/>
				           </jsp:include>
				          </td>																	
							<html:hidden name="QuoteDetail" property="answer(Object::Quote::QuoteEndDate)" styleId="QuoteEndDate" />
				</tr>
				</dmshtml:isFeatureAvailableForProductRoleStatus>
				</dmshtml:dms_isPresent>
				<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="false">
					<tr>
					<td class="FormLabels" width="40%"><B>Requested Effective Date</B></td>
					<td width="35%" id="EffDatePanel1"> 
						<%=""+quoteStartDate%>
					
					</td>
					</tr>
					<tr>
					<td class="FormLabels" width="40%"><B>Requested Expiration Date</B></td>
					<td width="35%" id="ExpDatePanel1"> 
						<%=""+quoteEndDate%>
					
					</td>
					</tr>
				</dmshtml:dms_isPresent>
				<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="CREATE_RENEWAL_PDF" 
						property='<%=new String[]{"In Progress","Offered","Bind Request","Bind","Lapsed"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<%isRenewal=true; %>
				</dmshtml:isFeatureAvailableForProductRoleStatus>
				<% if (!isRenewal) {%>
				<dmshtml:dms_isPresent property='<%=new String[]{"Sold", "Lost", "Rejected"}%>' value="<%=paretQuoteStatus.toString()%>" negated="false">
				<tr>
					<td class="FormLabels"><B>Quote Type</B></td>
					<td class="links"> 
					<html:select property="answer(Object::Quote::QuoteType)" name="QuoteDetail" disabled="<%=isSold %>">
						<html:option value="ENDORSEMENT">Endorsement</html:option>
					</html:select>
					<%
						if(isSold) { %>
							<html:hidden name="QuoteDetail" property="answer(Object::Quote::QuoteType)" />
						<%}
					%>
					</td>
				</tr>
				</dmshtml:dms_isPresent>
				<%} else {%>
				<html:hidden name="QuoteDetail" property="answer(Object::Quote::QuoteType)" styleId="QuoteType" value="ENDORSEMENT"  />
				<%}%>
				
				<html:hidden property="answer(policyNumber)" value='<%=""+policyNumber%>'/>
				<html:hidden property="answer(Object::Quote::PolicyNumber)" value='<%=""+policyNumber%>'/>
				<html:hidden property="answer(Object::Policy::ParentPolicyId)" value='<%=""+parentPolicyId%>'/>
				<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=""+parentPolicyVerId %>"/>	
				<html:hidden property="answer(Object::Quote::PolicyEffDate)" value="<%=""+policyEffDate%>" styleId="policyEffDate"/>
				<html:hidden property="answer(Object::Quote::PolicyExpDate)" value="<%=""+policyExpDate%>" styleId="policyExpDate"/>			
				<input type="hidden" name="answer(Quote::Page)" value="QUOTE SUMMURY"/>
				<input type="hidden" name="answer(Object::PageType)" value="ISSUE_BINDER_CLC"/>
				
					<tr>
					<td>
					<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
					
						<html:submit value="Recalculate" styleClass="covsmallbutton" onclick="if(document.getElementById('productName').value == 'Miscellaneous' || document.getElementById('productName').value == 'Reinstate'){document.getElementById('recalculateHidden').value='openTabEndorsementDetailY';}else{document.getElementById('recalculateHidden').value='openTabCoverageLimitsY';}if(document.getElementById('productName').value == 'Modify Insured'){document.getElementById('recalculateHidden').value='Documentation_Row';}"/>
					</dmshtml:dms_isPresent>	
					</td></tr>
				
			</table>
			</td>
		</tr>
		<tr height="15px">
			<td>&nbsp;
			</td>
		</tr>
		
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="ENDORSEMENT_QUOTESUMMARY_UI3" 
						property='<%=new String[]{"In Progress","Offered","Bind Request","Bound","Issued"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						
				<% isUI3 = "Y"; 
				System.out.println("isUI3"+isUI3);%>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					
		</table>			
		<%String pilotIncluded= ""; %>
		
			<div align="center" id="Doc" style="display:block;float:left;">
<table border="0" cellpadding="0" cellspacing="0" width="94%"  align="left">
   <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>
   <tr>
     <td width="100%" valign="bottom" align="left" height="25">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
       <dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="PROPOSAL_AVAILBLE" 
		 property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Bound","Issued","Submitted","Lost","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true"> 
            <td align="center" valign=bottom>
    		 <table border="0" width="125" cellspacing="0" cellpadding="0" id="Documentation_Row" class="todotab_active" height=35>
    		 	<tr><td align="center" onClick="LoadDocumentationTab('Documentation_Row');"  Style="Cursor:hand">Documentation</td></tr>				
		 </table>
         </td>
         </dmshtml:isFeatureAvailableForProductRoleStatus>
         <dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="ENDORSEMENT_DETAIL_AVAILABLE" 
		 property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Bound","Issued","Submitted","Lost","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true"> 
          <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>   
          <td align="center" valign=bottom>
    		 <table border="0" width="125" cellspacing="0" cellpadding="0" id="EndorsementDetail_Row" class="todotab_inactive" height=35>
    		 	<tr><td align="center" onClick="LoadEndorsementDetailTab('EndorsementDetail_Row');"  Style="Cursor:hand">Endorsement Detail</td></tr>				
		 </table>
         </td>
		 </dmshtml:isFeatureAvailableForProductRoleStatus>
		  <dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="CANCEL_OPTION" 
		 property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Bound","Issued","Submitted","Lost","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true"> 
          <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>   
          <td align="center" valign=bottom>
    		 <table border="0" width="125" cellspacing="0" cellpadding="0" id="CoverageandLimits_Row" class="todotab_inactive" height=35>
    		 	<tr><td align="center" onClick="LoadNewQuoteCoverageandLimits('CoverageandLimits_Row');"  Style="Cursor:hand">Cancel Option</td></tr>				
		 </table>
         </td>
		 </dmshtml:isFeatureAvailableForProductRoleStatus>
         <dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="ENDORSEMENT_QUOTESUMMARY_UI3" 
		 property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Bound","Issued","Submitted","Lost","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true"> 
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>             
            <td align="center" valign=bottom>
    		 <table border="0" width="125" cellspacing="0" cellpadding="0" id="CoverageandLimits_Row" class="todotab_inactive" height=35>
    		 	<tr><td align="center" onClick="LoadNewQuoteCoverageandLimits('CoverageandLimits_Row');"  Style="Cursor:hand">Policy Coverage and Limits</td></tr>				
		 </table>
         </td>
		
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         
         <td align="center" valign=bottom>
    		 <table border="0" width="110" cellspacing="0" cellpadding="0" id="PolicyInformation_Row" class="todotab_inactive" height=35 >
    		 	<tr><td align="center" onClick="LoadNewQuotePolicyInformationTab('PolicyInformation_Row');"  Style="Cursor:hand">Policy Information</td></tr>				
		 </table>
         </td>
         
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         
         <td align="center" valign=bottom>
    		 <table border="0" width="90" cellspacing="0" cellpadding="0" id="PolicyExclusions_Row" class="todotab_inactive" height=35 >
    		 	<tr><td align="center" onClick="LoadNewQuotePolicyExclusions('PolicyExclusions_Row');"  Style="Cursor:hand">Policy Exclusions</td></tr>				
		 </table>
         </td>
		 <dmshtml:Get_Quote_Class_List_Details nameInSession="classDetail" quoteId='<%= ""+parentQuoteId%>' quoteVerId='<%=""+parentQuoteVerId%>' ownerId='<%=ownerId.toString()%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
		<% String classListSize = "0";%>
		<logic:present name="classDetail">
			<%classListSize = ""+request.getAttribute("classDetail");%>
		</logic:present>
		<html:hidden property="answer(ClassListSizeId)" styleId="ClassListSizeId" value='<%=classListSize%>' />
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         
         <td align="center" valign=bottom>
    		 <table border="0" width="90" cellspacing="0" cellpadding="0" id="ClassHazards_Row" class="todotab_inactive" height=35>
    		 	<tr><td align="center" onClick="LoadAllEndorsementClassList('ClassHazards_Row');"  Style="Cursor:hand" id="classListId">Class(<%=""+classListSize%>)</td></tr>				
		 </table>
         </td>

        <!-- <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="2" height="4"></td>         
         <td align="center" valign=bottom>
    		 <table border="0" width="90" cellspacing="0" cellpadding="0" id="ClassBenefits_Row" class="todotab_inactive" height=35>
			<tr><td align="center" onClick="LoadClassBenefitsList('ClassBenefits_Row');"  Style="Cursor:hand">Class Benefits</td></tr>
		 </table>
         </td>  --> 
         
               
         <dmshtml:Get_HealthIns_QuoteDetail nameInSession="QuoteInfo" quoteId="<%=""+subQuoteIdforChk%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" />

 
        <logic:present name="QuoteInfo" scope="request">
        <% String ownedAircrafts = "";
           String pilots = "";
        %>
        	<bean:define id="quoteDetails" name="QuoteInfo" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"/>
        	<%
        	java.util.ArrayList arrList=quoteDetails.getClasshazardsInformationList();
        	com.dms.ejb.data.QuestionHashMap hazardsmap=null;
        	boolean ownedAircraft=false;
   			for (int i=0; i<arrList.size(); i++){ 
				hazardsmap=(com.dms.ejb.data.QuestionHashMap)arrList.get(i);
	        	if(hazardsmap != null){
        	    ownedAircrafts = ""+hazardsmap.getString("Object::Quote::ClassHazards::OwnedAircraft");}
	        	if(ownedAircraft==false)
				{
					if(ownedAircrafts.equals("Y"))
					{
						ownedAircrafts = ""+hazardsmap.getString("Object::Quote::ClassHazards::OwnedAircraft");
						ownedAircraft=true;
						break;
					}
				}
	        	}
        	%>
        	<%
        	java.util.ArrayList arrListPilot=quoteDetails.getClasshazardsInformationList();
        	com.dms.ejb.data.QuestionHashMap hazardsmapPilot=null;
        	boolean Pilot=false;
   			for (int i=0; i<arrListPilot.size(); i++){ 
   				hazardsmapPilot=(com.dms.ejb.data.QuestionHashMap)arrListPilot.get(i);
	        	if(hazardsmapPilot != null){
	        		pilots = ""+hazardsmapPilot.getString("Object::Quote::ClassHazards::Pilot");}
	        	if(Pilot==false)
				{
					if(pilots.equals("Y"))
					{
						pilots = ""+hazardsmapPilot.getString("Object::Quote::ClassHazards::Pilot");
						Pilot=true;
						break;
					}
				}
	        	}
        	%>
        	
			<%if(ownedAircrafts.equals("Y") || pilots.equals("Y")){ %>          
          <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="2" height="4"></td>         
          <td id="AircraftScheduleTab"  align="center" valign=bottom>
	     	<table border="0" width="100" cellspacing="0" cellpadding="0" id="AircraftSchedule" class="todotab_inactive" height=35>
	 		<tr><td align="center"  onClick="LoadNewQuoteAircraftSchedule('AircraftSchedule')"  Style="Cursor:hand">Aircraft Schedule</td></tr>
	 	</table>
         </td>
         <%}%>
         </logic:present>
        </dmshtml:isFeatureAvailableForProductRoleStatus>
        				
         
         <dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS" property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Submitted","Lost","Lapsed"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">				
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="2" height="4"></td>         
          <td id="ScheduleofFormsTab"  align="center" valign=bottom>
	     	<table border="0" width="120" cellspacing="0" cellpadding="0" id="ScheduleOfForms_Row" class="todotab_inactive" height=35>
	 		<tr><td align="center"  onClick="LoadNewQuoteScheduleofForms('ScheduleOfForms_Row')"  Style="Cursor:hand">Schedule of forms</td></tr>
	 		</table>
         </td>
         </dmshtml:isFeatureAvailableForProductRoleStatus>
         	<dmshtml:CheckCancelType nameInSession="IS_PRORATA" parentQuoteId='<%= Long.parseLong(""+parentQuoteId) %>' subQuoteId='<%= subQuoteIdforChk %>' cancelType="PRORATA" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId='<%= ""+ownerId %>' negated="true" />
						<logic:present name="IS_PRORATA">
							<% String isProrata = "" + request.getAttribute("IS_PRORATA"); %>
								
							
									<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="WORKSHEET_AVAILABLE" 
										property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Submitted","Bound","Issued","Lost","Lapsed","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
								
								<td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="2" height="4"></td>         
          <td id="WorksheetTab"  align="center" valign=bottom>
	     	<table border="0" width="90" cellspacing="0" cellpadding="0" id="Worksheet" class="todotab_inactive" height=35>
	 		<tr><td align="center"  onClick="LoadNewQuoteWorksheet('Worksheet')"  Style="Cursor:hand">Worksheet</td></tr>
	 		</table>
         </td>
						</dmshtml:isFeatureAvailableForProductRoleStatus>
						
						</logic:present>
								
         <dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="WORKSHEET_AVAILABLE" 
		 property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Bound","Issued","Submitted","Lost","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true"> 
         
         </dmshtml:isFeatureAvailableForProductRoleStatus>
         
       </tr>
     </table>
     </td>
   </tr>
 	 
</table>
</div>
		
		</html:form>
		</td>
		</tr>
		
		<tr>
		<td>
		<table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox">
		<tr><td>			
		<table border="0" width="100%" cellspacing="0" cellpadding="0" class="" id="docTable">			
		<tr>
		<td>
		<div id="DocumentDiv" style="display:none">
		<tr>
			<td align="left" valign="top">
					<div align="left" >&nbsp; Core Documents</div>						
			</td>
		</tr>	
		
		<tr>
		<td>
		&nbsp;
		</td>
		</tr>
		
		<tr>
		<td>
		<table WIDTH="78%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">

<dmshtml:GetQuoteDetailByQuoteId nameInSession="parentQuoteDetail" quoteId="<%=""+parentQuoteId%>" ownerId="<%=ownerId.toString()%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" /> 
<%String parentQuoteNumber = ""; %>

<logic:present name="parentQuoteDetail" scope="request">
	<bean:define id="parentQuoteNumTemp" name="parentQuoteDetail" property="quoteNumber" />
	<% parentQuoteNumber = "" + parentQuoteNumTemp; %>
</logic:present>

<dmshtml:getPDFRelativePath nameInSession="pdfDestinationPath" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
	<logic:present name="pdfDestinationPath" scope="request">
		<bean:define id="PDFDestinationFilePath" name="pdfDestinationPath" scope="request" />
		
		<% String strQuoteSubNumber = QuoteSubNumber.toString(); %>
		<% String EmpGrpNum1 ="";  %>
		<%java.util.ArrayList pdfList = new java.util.ArrayList();%>
			 
			<%
				java.util.ArrayList empBasedPdfList = new java.util.ArrayList();
				//String pdfPath = "/AllRisks/Insured/QuotePDFs/"; //com.dms.util.Constants.getVersionedValueOf("QuotePDF_Path_Client");
				//String xmlPath = "/AllRisks/Insured/QuotePDFs/";
				String strQuoteNum = parentQuoteNumber;
				//String strQuoteNum = QuoteNumber.toString();
							    
				if(strQuoteSubNumber.length()>0) {
					strQuoteNum=strQuoteNum+"-"+strQuoteSubNumber;
				}
				{				
					pdfList=com.dms.util.Constants.listFilesInsideADirectory("QuotePDF_Path",PDFDestinationFilePath+strQuoteNum);
					if (EmpGrpNum1!=null && EmpGrpNum1.length() !=0)
					{
						empBasedPdfList = com.dms.util.Constants.listFilesInsideADirectory("QuotePDF_Path",PDFDestinationFilePath+EmpGrpNum.toString()+"/"+strQuoteNum);
					}
				}
				
				java.util.ArrayList xmlList = new java.util.ArrayList();
				xmlList=com.dms.util.Constants.listFilesInsideADirectory("QuotePDF_Path",strQuoteNum+"/SoldQuotes");
				
			%>
			<% if((pdfList !=null && pdfList.size()>0) || (empBasedPdfList !=null && empBasedPdfList.size()>0)){ %>
				
					<% if((pdfList !=null && pdfList.size()>0)){ 
						for (int i=0; i<pdfList.size(); i++)  {
							String fileName=(String) pdfList.get(i);
							if(fileName.equalsIgnoreCase("SoldQuotes")){
								continue;
							}
							%>
					<tr>
				       <td class="Error" COLSPAN="2">		
					 	<% if((fileName.indexOf("Proposal") !=-1) || (fileName.indexOf("PROPOSAL") !=-1) || (fileName.indexOf("ISSUANCE") !=-1) || (fileName.indexOf("Issuance") !=-1) || (fileName.indexOf("BINDER") !=-1) || (fileName.indexOf("Binder") !=-1)){%>
					   <a href="javascript:void(0);"
						onClick="javascript:window.open('../<%=PDFDestinationFilePath%><%=strQuoteNum%>/<%=fileName.toString()%>')">
							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""><%=fileName.toString()%> 
						</a>
					</td>
					</tr>
					<%} //end of for loop
					} //end of if((pdfList !=null && pdfList.size()>0))
					if((empBasedPdfList !=null && empBasedPdfList.size()>0)){ 
						for (int j=0; j<empBasedPdfList.size(); j++)  {
							String fileName2=(String) empBasedPdfList.get(j);
							if(fileName2.equalsIgnoreCase("SoldQuotes")){
								continue;
							}				
					%>
					<li><a href="javascript:void(0);"
						onClick="javascript:window.open('../<%=PDFDestinationFilePath%><%=EmpGrpNum.toString()%>/<%=strQuoteNum%>/<%=fileName2.toString()%>')">
					<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15"
						BORDER="0" ALT=""><%=fileName2.toString()%> </a></li>
						<%} //end of for loop
					} //end of if((empBasedPdfList !=null && empBasedPdfList.size()>0))
					%>
					<%}%>				
				<%} %>
			
		
			
		</logic:present>	
</table>
		</td>
		</tr>
			
			<tr>
				<td>&nbsp;
				<div id='frame' style="display:none"><iframe
					onload="hideAttachPopup()" src="../common/MessageFromRule.jsp"
					id='upload_target_iFrame' name='upload_target_iFrame'
					style='width:300px;height:30px;border:1px solid #ccc;'></iframe></div>
				</td>
			</tr>
			<tr>
				<td>Attached Files
				<div id="QUOTE_ATTACHMENT_LIST" style="word-wrap:break-word;"></div>


				<a href="javascript:void(0)"
					onclick="showAttach('<%=""+parentQuoteId %>','0','QUOTE');"
					class="button2" style="width:100px">Add File</a>

				<table>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td>
						<div id="AttachFiles"></div>
						</td>
					</tr>
					<tr>
						<td>
						<div id="AddNotespopup" style="display:none"></div>
						</td>
					</tr>
				</table>

				<dmshtml:dms_static_with_connector ruleName='privilage'
					property='<%=new String[]{"EMAIL_VIEW"}%>' connector='or'
					negated="true">
					<br />
			Email
			<br />
					<div id="QUOTE_EMAIL_LIST" style="word-wrap:break-word;"></div>
					<a href="javascript:void(0)" onclick="sendEmailDetails();"
						class="button2" style="width:100px">Compose Email</a>
	&nbsp;<br/>
				</dmshtml:dms_static_with_connector>
				<dmshtml:dms_static_with_connector
					ruleName='privilage' property='<%=new String[]{"EXPORT_XML"}%>'
					connector='or' negated="true">

				</dmshtml:dms_static_with_connector></td>
			</tr>
				</div>
			</td>
			</tr>
			</table>
			</td></tr>
			
			<tr>
					<td align="left">
					<div id="CoveragesDiv" style="display:none;border:0px;" class="todotab_yellowbox2"></div>
					<div id="CovLimitsDiv"></div>
					</td>
			</tr>
				
			<tr>
				<td align="left" valign="top">
				<div id="ScheduleDiv" style="display:none;border:0px;" class="todotab_yellowbox"></div>
				</td>
			</tr>

			<tr>
				<td align="left" valign="top">
					
					<div id="PolicyInformationDiv" class="todotab_yellowbox" style="display:none;border:0px;">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr><td align="center" valign=bottom>&nbsp;</td></tr>				
							<tr>
								<td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>
								<td align="center" valign=bottom>
								<table border="0" width="125" cellspacing="0" cellpadding="0" id="Pol_Definition_Row" class="todotab_active" height=35>
									<tr>
										<td align="center" onClick="LoadNewQuotePolicyInformationTab('Pol_Definition_Row');" Style="Cursor:hand">Policy Definition</td>
									</tr>
								</table>
								</td>
				
				
								<td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>
								<td align="center" valign=bottom>
								<table border="0" width="125" cellspacing="0" cellpadding="0" id="Pol_Hazards_Row" class="todotab_inactive" height=35>
									<tr>
										<td align="center" onClick="LoadNewQuotePolicyHazardsTab('Pol_Hazards_Row');" Style="Cursor:hand">Policy Hazards</td>
									</tr>
								</table>
								</td>
				
								<td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>
								<td align="center" valign=bottom>
								<table border="0" width="125" cellspacing="0" cellpadding="0" id="Pol_Benefits_Row" class="todotab_inactive" height=35>
									<tr>
										<td align="center" onClick="LoadNewQuotePolicyBenefitsTab('Pol_Benefits_Row');" Style="Cursor:hand">Policy Benefits</td>
									</tr>
								</table>
								</td>
				
							</tr>
						</table>

					</div>
					<div id="QuoteDiv"  style="display:none;border:0px;" class="todotab_yellowbox2">
					</div>
				</td>
		</tr>
		<tr>
				<td align="left" valign="top" style="border:0px;" class="todotab_yellowbox">
				<div id="EndorsementClass" style="display:none;border:0px;" >
				 <table>
    				 <tr><td>&nbsp;</td></tr>
     			 </table>
				 <dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
				     <a href="javascript:void(0);" onclick="appendAddClassToParent();" id="AddClass_link" class="button2" style="width:100px;height:17px;">Add a Class</a>
			  </dmshtml:dms_isPresent>
			  <table>
				<tr>
					<td>
						<div id='loadercontent1' style="display:none"><IMG
						SRC="../Images/loader1.gif" BORDER="0" align="top" id="loader"> <IMG
						SRC="../Images/loader1.gif" BORDER="0" align="top" id="loader"> <IMG
						SRC="../Images/loader1.gif" BORDER="0" align="top" id="loader">
						Loading....</div>
					</td>
				</tr>
			</table>			  
			<table>
				<tr>
					<td>
						<div id="saveSuccess1"
							style="display:none;color:red;font-weight:bold;">Saved Successfully</div>
						</td>
				</tr>
			  </table>
			  <table>
    	 			<tr><td>&nbsp;</td></tr>
      		  </table>
			  <input type="hidden" id="onAjaxCompleteActiveTabId" value='<%=""%>'/>
				<div id="EndorsementClassTabs">
					 <a href="javascript:void(0);" id="ClassList" onclick="LoadAllEndorsementClassList(this.id);" class="loctab_active left">
				 	 <div id="ClassList" >Class List</div></a>
				</div>
					<div id="ClassListDiv"  class="todotab_yellowbox" style="float:left;width:960px;">
					</div>
					<div id="ClassContentDiv"  style="display:none;float:left;width:960px;" class="todotab_yellowbox">
					</div>
					</div>
					
				</td>
		</tr>
		<tr><td>
		<div id="RiskPopUp" class="todotab_yellowbox4" style="display:none;">
			<div class="Applicationpage3">
				<div id="RiskPopUpBody" class="todotab_yellowbox"></div>
			</div>
		</div>
		</td></tr>
</table>
</td>
</tr>
<tr>
<td>

&nbsp;<br/>
</td>
</tr>
</table>

<script type="text/javascript">

var iframe = document.getElementById("upload_target_iFrame");
if (iframe.addEventListener) {
  iframe.addEventListener("load", hideAttachPopup, false);  // firefox
} else if (iframe.attachEvent) {
  iframe.attachEvent("onload", hideAttachPopup);  // IE
}
</script>

<script type="text/javascript">

var iframe = document.getElementById("upload_target_iFrame");
if (iframe.addEventListener) {
  iframe.addEventListener("load", hideAttachPopup, false);  // firefox
} else if (iframe.attachEvent) {
  iframe.attachEvent("onload", hideAttachPopup);  // IE
}
</script>

<script type="text/javascript">

var iframe = document.getElementById("upload_target_iFrame");
if (iframe.addEventListener) {
  iframe.addEventListener("load", hideAttachPopup, false);  // firefox
} else if (iframe.attachEvent) {
  iframe.attachEvent("onload", hideAttachPopup);  // IE
}
</script>

<script type="text/javascript">
<!--
	var formElements = document.forms[0];
	
	var Status = formElements.paretQuoteStatus1.value;
		
	if(Status=="In Progress") {
	 
	 formElements.txtDate.readOnly=false;
	 
 } else {
 
 	formElements.txtDate.readOnly=true;
 	formElements.txtDate.style.border = "0px solid #000000";
 	
 }
//-->
</script> 
<%  String openTab = "";

if(request.getParameter("answer(openTabAPolicyInfo)")!=null){
 openTab = ""+request.getParameter("answer(openTabAPolicyInfo)");
 }


if(openTab.equals("openTabPolicyInfoY")){%>

	<script type="text/javascript">
		LoadNewQuotePolicyInformationTab('PolicyInformation_Row');
	</script>
<%}else if(openTab.equals("openTabPolicyHazardY")){%>
	<script type="text/javascript">
		LoadNewQuotePolicyHazardsTab('Pol_Hazards_Row');	
	</script>
<%}else if(openTab.equals("openTabPolicyBenefitY")){%>
	<script type="text/javascript">
		LoadNewQuotePolicyBenefitsTab('Pol_Benefits_Row');	
	</script>
<%}else if(openTab.equals("openTabPolicyExclusionY")){%>
<script type="text/javascript">
		LoadNewQuotePolicyExclusions('PolicyExclusions_Row');
		
	</script>
<%}else if(openTab.equals("openTabClassHazardY")){%>
<script type="text/javascript">
		LoadClassList('ClassHazards_Row');
		
	</script>
<%}else if(openTab.equals("openTabClassBenefitsY")){%>
<script type="text/javascript">
		LoadClassBenefitsList('ClassBenefits_Row');
		
	</script>
<%}else if(openTab.equals("openTabWorksheetY")){%>
	<script type="text/javascript">
		LoadNewQuoteWorksheet('Worksheet');		
	</script>
<%}else if(openTab.equals("openTabCoverageLimitsY")){%>
	<script type="text/javascript">
		LoadNewQuoteCoverageandLimits('CoverageandLimits_Row');	
	</script>
<%}else if(openTab.equals("ScheduleOfForms_Row")){%>
	<script type="text/javascript">
		LoadNewQuoteScheduleofForms('ScheduleOfForms_Row');
	</script>
<%}else if(openTab.equals("openTabEndorsementDetailY")){%>
	<script type="text/javascript">
		LoadEndorsementDetailTab('EndorsementDetail_Row');
	</script>
	<%if(!pName.equals("Modify Insured")){ 
	if(pName.equals("Miscellaneous")){%>
		<script type="text/javascript">
			setTimeout("LoadMiscEndorsementDescriptionTab('EndorsementMiscDesc_Row')",900);
		</script>
	<%}else{%>
		<script type="text/javascript">
			setTimeout("LoadCancelEndorsementDescriptionTab('EndorsementCancelDesc_Row')",900);	
		</script>
	<%}
	}%>
<%}else if(openTab.equals("openTabAircraftScheduleY")){%>
	<script type="text/javascript">
		LoadNewQuoteAircraftSchedule('AircraftSchedule');		
	</script>
	
<%}else{%>
	<script type="text/javascript">
		LoadDocumentationTab('Documentation_Row');		
	</script>
<%}%>

<%if(openTabName_req.equals("openTabClassHazardY")){%>
	<script type="text/javascript">
		<%if(classBenefitsTab_ClassTab_req.equals("true")){%>
			LoadAllEndorsementClassList('ClassHazards_Row');
			getEndorsementClassList_recalculate(<%=""+classId_req%>,'<%=""+className_req%>',<%=""+hazardId_req%>,'<%=""+hazardsName_req%>');
		<%}%>		
	</script>
<%}%>
<%if(deleteClass_req.equals("true")){%>
	<script type="text/javascript">
		LoadAllEndorsementClassList('ClassHazards_Row');
	</script>
<%}%>

	<script type="text/javascript">
		if(document.getElementById("Documentation_Row") == null || document.getElementById("Documentation_Row") == undefined){
			LoadEndorsementDetailTab('EndorsementDetail_Row');
		}	
	</script>
<script type="text/javascript">
	var a = document.getElementById('priorpolicyheadernav');
	if((a != null) && (a != undefined))
		a.id = 'policyheadernav';
</script>
<script type="text/javascript">

		function maxLengthTextAreaDesc(type) {
			var field = document.getElementById('EndorsementDescription');
			if ( field.value.length > 128 )
		  	{  	
		    	field.value = field.value.substring( 0, 128 );
		    	alert( type+" value can only be 128 characters in length." );
		    	return false;
		  	}
		  	return true;  	
		}

	   function validateRenewalDate(){
			var frmElements =  document.forms[0];
			if(frmElements.endorsementType != null && frmElements.endorsementType != undefined){
		    var index=frmElements.endorsementType.selectedIndex
			var formElement = frmElements.endorsementType.options[index].text;
			}
			if((formElement == "Renewal-DP1") ||(formElement == "Renewal-DP3")||(formElement == "Renewal-HO3")|| (formElement == "Renewal-HO8")||(formElement == "Renewal-BR") || (formElement == "Renewal-Vacant-DP1")||(formElement == "Renewal-Vacant-DP3")||(formElement == "Renewal CUP")||(formElement == "Renewal-BR-DP3")){
	        	if(frmElements.parentPolicyStatus.value != "BOUND"){
					if(frmElements.referenceStartDate2.value == "" ){
					     frmElements.txtDate.value = '<%=exprDate%>';
					     frmElements.referenceStartDate2.value = frmElements.txtDate.value;	
					}
					myDatePanel.dateFieldRef.setMinValue(new Date('<%=exprDate%>'));
					myDatePanel.dateFieldRef.setMaxValue('');
					frmElements.txtDate.value =  frmElements.referenceStartDate2.value;
					frmElements.txtDate1.value = frmElements.referenceStartDate.value;
				}else{
				  alert("Policy is not issued.Please issue the policy to Create Renewal Endorsement");
				  if(frmElements.endorsementType != null && frmElements.endorsementType != undefined){
				  	frmElements.endorsementType.selectedIndex =0;
				  }
				}    
		   }else{
				if(frmElements.referenceStartDate.value!="") {
					frmElements.txtDate.value = frmElements.referenceStartDate.value;
					frmElements.txtDate1.value = frmElements.referenceStartDate.value;
					frmElements.EndorsementQuoteStartDate.value = frmElements.referenceStartDate.value;
				}
				myDatePanel.dateFieldRef.setMinValue(new Date('<%=policyEffDate%>'));	
				document.getElementById('expDate1').value=document.getElementById('QuoteEndDate').value;			  	
		   }
		   Ext.onReady(function(){
		if(document.forms[0].referenceStartDate.value == ""){
			document.forms[0].referenceStartDate.value =  document.forms[0].txtDate.value;
		}else{
			document.forms[0].txtDate.value =  document.forms[0].referenceStartDate.value;
			
		   	validateRenewalDate();
		}
		
	   });
		}
	</script>
	 <script type="text/javascript">
   			Ext.onReady(function(){
   	   			if(document.getElementById('QuoteEndDate')!=null && document.getElementById('QuoteEndDate') != undefined){
   					document.getElementById('expDate1').value=document.getElementById('QuoteEndDate').value;
   	   			}
   	   			if(document.getElementById('referenceStartDate')!=null && document.getElementById('referenceStartDate') != undefined){
   					document.getElementById('txtDate1').value=document.getElementById('referenceStartDate').value;
   	   			}
   			try{ 	   				      
   			var blurHandlerEffectiveDate = function() {  
  			var strDate = document.getElementById('txtDate1').value;  			
  			var dmonth = parseInt(strDate.substring(0, 2), 10);
			var dday = parseInt(strDate.substring(3, 5), 10);
			var dyear = parseInt(strDate.substring(6, 10), 10);
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
			{	
				alert("Please enter date in 'MM/DD/YYYY' format");
				document.forms[0].referenceStartDate.value = strDate;
				return false;
			}else{
				var effDate1 = Ext.getCmp('txtDate1').getValue(); 
				var MM1 = effDate1.getMonth()+1;
				var DD1 = effDate1.getDate();
				var YY1 = effDate1.getFullYear();
				var YY2 = effDate1.getFullYear() + 1;
				
				if(parseInt(MM1)<10){ MM1 = "0"+(MM1);}
				if(parseInt(DD1)<10){ DD1 = "0"+DD1;}
				Ext.getCmp('txtDate1').setValue(MM1+'/'+DD1+'/'+YY1);
				document.forms[0].referenceStartDate.value =MM1+'/'+DD1+'/'+YY1; 				
   			}
   			}; 
   			
   			var blurHandlerExpirationDate = function() {    			 
  			var strDate = document.getElementById('expDate1').value;
  			var dmonth = parseInt(strDate.substring(0, 2), 10);
			var dday = parseInt(strDate.substring(3, 5), 10);
			var dyear = parseInt(strDate.substring(6, 10), 10);
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
			{	
				alert("Please enter date in 'MM/DD/YYYY' format");				
				return false;
			}else{
				var effDate1 = document.getElementById('txtDate1').value;
  				var dmonth1 = parseInt(effDate1.substring(0, 2), 10);
				var dday1 = parseInt(effDate1.substring(3, 5), 10);
				var dyear1 = parseInt(effDate1.substring(6, 10), 10);
				var expDate1 = Ext.getCmp('expDate1').getValue(); 
				var MM2 = expDate1.getMonth()+1;
				var DD2 = expDate1.getDate();
				var YY2 = expDate1.getFullYear();
				if(parseInt(M2)<10){ MM2 = "0"+(MM2);}
				if(parseInt(DD2)<10){ DD2 = "0"+DD2;}
				Ext.getCmp('expDate1').setValue(MM2+'/'+DD2+'/'+YY2);
	   			document.forms[0].QuoteEndDate.value =MM2+'/'+DD2+'/'+YY2;
	   			var effDate2 = Ext.getCmp('txtDate1').getValue();
				if(YY2 < dyear1){
					alert("Please enter the valid Renewal Expiration date");							
				}
				if((MM2 < dmonth1) && (YY2==dyear1)){
					alert("Please enter the valid Renewal Expiration date");					
				}
				if((MM2 == dmonth1) && (DD2<=dday1) && (YY2==dyear1)){
					alert("Please enter the valid Renewal Expiration date");					
				}					
	   			}
	   			}; 
	   			
			Ext.EventManager.on('txtDate1', 'blur', blurHandlerEffectiveDate); 
			Ext.EventManager.on('expDate1', 'blur', blurHandlerExpirationDate); 
			
			}catch(error){}
 			});
 			
    function LoadNewQuoteScheduleofForms(TabId){
    activateTabs(TabId);
    tabLoad="ScheduleofForms";
    document.getElementById("ClassListDiv").style.display="none";
    document.getElementById("RiskPopUp").style.display = "none";
    document.getElementById("CoveragesDiv").style.display = 'none';				 	
	document.getElementById("DocumentDiv").style.display = 'none';				 	
	document.getElementById("PolicyInformationDiv").style.display="none";
	document.getElementById("EndorsementClass").style.display="none";
	document.getElementById("QuoteDiv").style.display="none";
    var subQuoteId    = document.getElementById("subQuoteId11").value;
    var productVerId  = document.getElementById("ProductVerId").value;
    var planState = document.getElementById("planStateId").value;
    var prodId = document.getElementById("productId1").value;
    var parentQuoteId = document.getElementById("parentQuoteId").value;
    var subQuoteVerId = document.getElementById("subQuoteVerId").value;    
    var ownerId = document.getElementById("ownerId").value;
    var custId = document.getElementById("customerId").value;
    var GroupId = document.getElementById("GroupId").value;
    var GroupVerId = document.getElementById("GroupVerId").value;
    var productStatus = document.getElementById("productStatus").value;
    var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
    var paretQuoteStatus = document.getElementById("paretQuoteStatus").value;
    var userId = document.getElementById("userId1").value;
    var Quote = document.getElementById("Quote").value;
    var QuoteManagement = "Quote Management";
    var QuoteId = document.getElementById("QuoteIdHid").value;
    var pars ='answer(activateTabId)='+TabId+'&requestType=&answer(DocumentType)=ISSUANCE&answer(Object::Quote::ProductId)='+prodId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(subQuoteId)='+subQuoteId+'&answer(subQuoteVerId)='+subQuoteVerId+'&answer(OwnerId)='+ownerId+'&answer(ProductVerId)='+productVerId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(customerId)='+custId+'&answer(ProductId)='+prodId+'&answer(prdGroupId)='+GroupId+'&answer(prdGroupVerId)='+GroupVerId+'&answer(productStatus)='+productStatus+'&answer(Object::Quote::QuoteVerId)='+parentQuoteVerId+'&answer(State)='+planState+'&answer(isUpdated)='+"Y"+'&answer(Object::Activity::ActivityType)='+QuoteManagement+'&answer(Object::Activity::ObjectType)='+Quote+'&answer(Object::Activity::CreatedBy)='+userId+'&answer(Object::Quote::QuoteStatus)='+paretQuoteStatus+'&answer(Object::Activity::OwnerId)='+ownerId+'&answer(QuoteId)='+QuoteId;
    	var url = '../GetDocumentListBTA_in_ScheduleofFormsTab.do?'+pars;	
    	var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab&answer(activateTabId)='+TabId;
     	autologout();
     	new Ajax.Request(url, {method: 'post',parameters:pars2,asynchronous:true,onFailure:function(){},onException:function(){},onComplete:function(transport){
		 		 enableTabs();
		 		 //enablePolicyTabs();
		 		 document.getElementById("ScheduleDiv").style.display = "block";
		 		 document.getElementById("PolicyInformationDiv").style.display="none";	
		 		 document.getElementById("docTable").style.display = 'none';	 		 
		 	},onSuccess: function(transport){	
				if(tabLoad=="ScheduleofForms"){
				 	document.getElementById("ScheduleDiv").innerHTML = "";		 	
				 	document.getElementById("ScheduleDiv").innerHTML= transport.responseText;
				 	document.getElementById("CoveragesDiv").style.display = 'none';				 	
				 	document.getElementById("DocumentDiv").style.display = 'none';				 	
				 	document.getElementById("PolicyInformationDiv").style.display="none";
				 	document.getElementById("EndorsementClass").style.display="none";
					document.getElementById("QuoteDiv").style.display="none";
					document.getElementById("AddOptionalForm").style.display="none";
					document.getElementById("AddOptionalForm1").style.display="none";			 				 	
					document.getElementById("RemoveOptionalForm").style.display="none";
			 	}
		 	}
		}
	);
	}
	</script>	  