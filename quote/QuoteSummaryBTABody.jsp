<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>
<%@page import="com.dms.common.ObjectDescriptor"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Calendar" %>

<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/assets/skins/sam/menu.css">
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css"	href="../styles/yahoo/2.4.1/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/datatable1/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/editor/assets/skins/sam/simpleeditor.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/ext-3.2.1/resources/css/ext-all.css">

<script type="text/javascript" src="../Scripts/prototype.js"></script>

<script type="text/javascript" src="../Scripts/JScripts/AddOrEditAircraft.js"></script>
<style type="text/css">

TD.UWFormLabels
{
    FONT-WEIGHT: bold;
    FONT-SIZE: 11px;
    COLOR: #000000;
    FONT-FAMILY: Verdana,Arial, Helvetica
	
}
</style>
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


<script type="text/javascript">
var renderPopup = true;
var renderPopup1 = true;
var openClassPopup = false;
var flag = 0;
var isSpecificValidationNeeded = true;
var url1 = "/SaveQuoteApplication.do";
var activeTabId = "";
var calendarDisplayed = false;
var recalculate = 0;
</Script>    
 <style type="text/css">
TD.FormLabels{margin:3px 0 3px 10px;padding:0 0 0 50px;font-family: Arial;text-align:Left; font-size: 9pt; color: #595a5f; font-weight:bold;border-right:  0px solid;border-top:  0px solid;border-left: px solid;border-bottom:0px solid;width:800px;}
</style>

<style type="text/css">
.yui-skin-sam .yui-panel{position:relative;left:0;top:0;border-style:solid;border-width:10px 0;border-color:#808080;z-index:1;*border-width:1px;*zoom:1;_zoom:normal;}
.yui-hidden {display:none;}
</style>
<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js"> 
</script>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgencySummary.js"></SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgentSummary.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/editor/simpleeditor-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/paginator-min.js"></script>  
<script type="text/javascript" src="../Scripts/ext-3.2.1/adapter/ext/ext-base.js"></script>

<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/calendar/assets/skins/sam/calendar.css" />

<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/dragdrop/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/element/element-min.js"></script>

<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/calendar/calendar-min.js"></script>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/SendEmail.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/ext-3.2.1/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../Scripts/ext-3.2.1/ext-all.js"></script>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/WorkSheetBTA.js"></SCRIPT>
<script type="text/JavaScript" SRC="../Scripts/JScripts/AttachmentTable.js" ></script>

<script language="JavaScript1.2" src="../Scripts/ui3.0/coolmenus4.js"></script>
<script language="JavaScript1.2" src="../common/BuildMenu1.0.jsp"></script>

<script type="text/javascript" src="../Scripts/JScripts/Common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js">
</script>
<script type="text/javascript" src="../Scripts/JScripts/QuoteSummaryUI3.js"></script>

<script type="text/javascript" src="../Scripts/JScripts/QuoteClassRisk.js"></script>
<body1 >


</body1>
<body class="yui-skin-sam">


</body>
<script>
function executeDynamicCheckBoxRule(elem,elemId,id1){

alert(elem+"::"+elemId+"::"+id1);
var val = "";
if((elemId.length)>1){
for(var i=0; elemId[i]!=null; i++){
 alert( elemId[i].value);
 if(elemId[i].checked == true) {    
  val = val+elemId[i].value+"_";
 }
}
}else{
	val = val + elemId.value;
}
if(document.getElementById(id1) != 'undefined' || document.getElementById(id1) !=null){}
document.getElementById(id1).value = val;
alert(document.getElementById(id1).value)
}
</script>
<script>
var CovLimitsform="";
var CovLimitsformSubjToAuditVal = "";
function setAuditPeriod(frm,val)
{
CovLimitsform = frm;
CovLimitsformSubjToAuditVal = val;
setTimeout("setAuditPeriod1();",400);

}


function setAuditPeriod1(){

if(CovLimitsformSubjToAuditVal=='N'){

     CovLimitsform.AuditPeriod.value='';
    
}
}
</script>

<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/CoveragesLimits.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/ClassHazards.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/ClassBenefits.js"></script>
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
		//	alert("dmonth1::"+dmonth1+"::dday1::"+dday1+"::dyear1::"+dyear1)
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
<bean:define id="parentQuoteId" name="QuoteDetail" property="answer(parentQuoteId)" scope="request" />
<html:hidden styleId="ParentQuoteId" property="answer(Object::Quote::ParentQuoteId)" value='<%=""+parentQuoteId%>' />


<bean:define id="prodId" name="QuoteDetail" property="answer(Object::Quote::ProductId)" scope="request" />
<bean:define id="ProductVerId" name="QuoteDetail" property="answer(Object::Quote::ProductVerId)" scope="request" />

<bean:define id="customerId" name="QuoteDetail" property="answer(Object::Customer::CustomerId)" scope="request" />
<html:hidden styleId="CustomerId" property="answer(Object::Customer::CustomerId)" value='<%=""+customerId%>' />

<bean:define id="agencyId" name="QuoteDetail" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<html:hidden property="answer(ownerIdfrmjsp)" value='<%=ownerId+"" %>' styleId="ownerIdfrmjsp" />

<bean:define id="quoteStartDate" name="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)" scope="request" />
<bean:define id="quoteEndDate" name="QuoteDetail" property="answer(Object::Quote::QuoteEndDate)" scope="request" />

<bean:define id="email" property="answer(Object::UserDetail::email)" name="LoginPage" scope="session" />
<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session" />
<bean:define id="noOfMedicalEmployees" name="QuoteDetail" property="answer(Object::Quote::NoOfMedicalEmployees)"/> 
<bean:define id="paretQuoteStatus" name="QuoteDetail" property="answer(Object::Quote::QuoteStatus)" />
<html:hidden styleId="paretQuoteStatus" property="answer(Object::Quote::QuoteStatus)" value='<%=""+paretQuoteStatus%>' />
<bean:define id="paretLockStatus" name="QuoteDetail" property="answer(Object::Quote::LockStatus)" />
<bean:define id="QuoteNumber" name="QuoteDetail" property="answer(Object::Quote::QuoteNumber)" />
<bean:define id="QuoteSubNumber" name="QuoteDetail" property="answer(Object::Quote::QuoteSubNumber)" />
<bean:define id="MedicalUWFactor" name="QuoteDetail" property="answer(Object::PlanFactor::MedicalUWFactor)" />
<bean:define id="agentId" name="QuoteDetail" property="answer(Object::QuoteCommission::AgentId)" scope="request" />
<bean:define id="paymentPlan" property="answer(Object::Quote::PaymentPlan)" name="QuoteDetail"  />


<bean:define id="stateCode" property="answer(Object::Quote::PaymentPlan)" name="QuoteDetail"  />
<bean:define id="MedicalUWFactorPrefer" name="QuoteDetail" property="answer(Object::PlanFactor::MedicalUWFactorPrefer)" />
<bean:define id="MedicalUWFactorStand" name="QuoteDetail" property="answer(Object::PlanFactor::MedicalUWFactorStand)" />
<bean:define id="MedicalUWFactorMax" name="QuoteDetail" property="answer(Object::PlanFactor::MedicalUWFactorMax)" />
<bean:define id="DrugUWFactor" name="QuoteDetail" property="answer(Object::PlanFactor::DrugUWFactor)" />

<bean:define id="DrugUWFactorPrefer" name="QuoteDetail" property="answer(Object::PlanFactor::DrugUWFactorPrefer)" />
<bean:define id="DrugUWFactorStand" name="QuoteDetail" property="answer(Object::PlanFactor::DrugUWFactorStand)" />
<bean:define id="DrugUWFactorMax" name="QuoteDetail" property="answer(Object::PlanFactor::DrugUWFactorMax)" />
<bean:define id="HelthHra" name="QuoteDetail" property="answer(Object::Quote::HelthHra)" />
<bean:define id="CompositeRate" name="QuoteDetail" property="answer(Object::Quote::CompositeRate)" />
<bean:define id="AreaNetWorkKey" name="QuoteDetail" property="answer(Object::Quote::AreaNetWorkKey)" />
<bean:define id="AreaNetWorkKeyDesc" name="QuoteDetail" property="answer(Object::Quote::AreaNetWorkKeyDesc)" />
<bean:define id="State" name="QuoteDetail" property="answer(Object::Quote::CustomerState)" />

<bean:define id="TotalParentQuotePremium" name="QuoteDetail" property="answer(Object::Quote::TotalPremium)" />
<bean:define id="parentQuoteFee1" name="QuoteDetail" property="answer(Object::Quote::Fee1)" />
<bean:define id="parentQuoteFee2" name="QuoteDetail" property="answer(Object::Quote::Fee2)" />
<% String fullName =""; %>
<bean:define id="fname" property="answer(Object::UserDetail::UserFirstName)" name="LoginPage" scope="session"/>
<bean:define id="lname" property="answer(Object::UserDetail::UserLastName)" name="LoginPage" scope="session"/>

<bean:define id="GroupId" name="QuoteDetail" property="answer(Object::Quote::ProductGroupId)" />
<bean:define id="GroupVerId" name="QuoteDetail" property="answer(Object::Quote::ProductGroupVerId)" />
<bean:define id="productStatus" name="QuoteDetail" property="answer(Object::Quote::ProductStatus)" scope="request" />
<bean:define id="QuoteType" name="QuoteDetail" property="answer(Object::Quote::QuoteType)" />
<bean:define id="ProductFamilyId" name="QuoteDetail" property="answer(Object::Quote::ProductFamilyId)" />

<bean:define id="FirstSubQuoteId" name="QuoteDetail" property="answer(Object::Quote::FirstSubQuoteId)" />
<bean:define id="QuoteId" name="QuoteDetail" property="answer(Object::Quote::Id)" />
<html:hidden styleId="QuoteId" property="answer(Object::Quote::Id)" value='<%=""+QuoteId%>' />
<bean:define id="policyNumber" name="QuoteDetail" property="answer(Object::Quote::PolicyNumber)" />
<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
<bean:define id="ObjectId" name="QuoteDetail" property="answer(Object::Quote::Id)" />

<bean:define id="quoteName" name="QuoteDetail" property="answer(Object::Quote::QuoteName)" />
<bean:define id="quoteDesc" name="QuoteDetail" property="answer(Object::Quote::QuoteDesc)" />

<bean:define id="submissionId" name="QuoteDetail" property="answer(Object::Quote::SubmissionId)"  /> 
<bean:define id="submissionVerId" name="QuoteDetail" property="answer(Object::Quote::SubmissionVerId)" /> 

<html:hidden styleId="SubmissionId1" property="answer(Object::Submission::SubmissionId)" value='<%=""+submissionId%>' />
<html:hidden styleId="SubmissionVerId1" property="answer(Object::Submission::SubmissionVerId)" value='<%=""+submissionVerId%>' />

<bean:define id="RenewalPolicyNo" name="QuoteDetail" property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" />
<bean:define id="RenewalPolicyCompany" name="QuoteDetail" property="answer(Object::QuoteAdditional::RenewalPolicyCompany)" />
<bean:define id="RenewalSubmissionNumber" name="QuoteDetail" property="answer(Object::QuoteAdditional::RenewalPolicySubmission)" />
<bean:define id="companyPaperCode"  name="QuoteDetail" property="answer(Object::Company::Paper::CompanyPaperCode)" />
<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+parentQuoteId%>" styleId="parentQuoteId1" />
<html:hidden property="onAjaxCompleteActiveTabId1" styleId="onAjaxCompleteActiveTabId" value='<%=""%>'/>
<html:hidden property="hazardId" styleId="hazardId" value='<%=""%>' />
<html:hidden property="hazardsName" styleId="hazardsName" value='<%=""%>' />


<%
String classBenefitsTab_ClassTab_req = ""+request.getAttribute("classBenefitsTab_ClassTab");
String hazardId_req = ""+request.getAttribute("hazardId");
String hazardsName_req = ""+request.getAttribute("hazardsName");
String classId_req = ""+request.getAttribute("classId");
String className_req = ""+request.getAttribute("className");
String deleteClass_req = ""+request.getAttribute("deleteClass");
%>
<%String parentQuoteVerId = ""; 
String quoteNum1 = "";
String pilotIncluded = "N";%>
<dmshtml:Get_HealthIns_QuoteHeaderDetail nameInSession="parentQuoteDetail" quoteId="<%=""+parentQuoteId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" />
	<logic:present name="parentQuoteDetail" scope="request">
			<bean:define id="paretQuoteVerId" name="parentQuoteDetail" property="quoteVerId"/>
			<bean:define id="quoteNumber1" name="parentQuoteDetail" property="quoteNumber"/>
			<bean:define id="quoteSubNumber" name="parentQuoteDetail" property="quoteSubNumber" />
			<%
				parentQuoteVerId = "" + paretQuoteVerId; 
				quoteNum1 = "" + quoteNumber1;
				QuoteSubNumber = "" + quoteSubNumber; 
			%>
	</logic:present>
<%String docSubQuoteVerId=""; 
String CustomerState = ""; 
String CustomerName = "";
String subQuoteProductId1 = "";
%>


<%!		
String strSubQuoteId1 = ""; 
String strSubQuoteVerId1="";
static final int beniRater = 0;
static final int MicaRater = 1;
static final int MicaIowa = 3;
%>
<%
int productGroup = beniRater;

if(State.toString().length()>0 ){
	if(State.toString().equals("IL")){
		productGroup = MicaRater;
	}else 	if(State.toString().equals("IA")){
		productGroup = MicaIowa;
	}
}	

			%>	



<%String strReason="";%>
<bean:define id="RejectReason" name="QuoteDetail" property="answer(Object::QuoteAdditional::RejectedNotes)" scope="request" />
<bean:define id="LostReason" name="QuoteDetail" property="answer(Object::QuoteAdditional::LostNotes)" scope="request" />
<bean:define id="LapseReason" name="QuoteDetail" property="answer(Object::QuoteAdditional::LapseReason)" scope="request" />
<bean:define id="LapseNotes" name="QuoteDetail" property="answer(Object::QuoteAdditional::LapseNotes)" scope="request" />



<dmshtml:Get_Customer_Detail_ByCustomerId nameInSession="customerDetail1" customerId="<%=customerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>

<%if(fname.toString()=="" && lname.toString()==""){
	fullName = userId.toString();
} else {
	fullName = fname+ " "+ lname;
}%>
<%double lgTotalParentQuotePremium=Double.parseDouble(TotalParentQuotePremium.toString()); %>

<%long numberOfSubQuotes=0;%>
<%String EmpGrpNum="";%>
<%long lgNoOfMedicalEmployees = Long.parseLong(""+noOfMedicalEmployees);%>
<logic:present name="customerDetail1" scope="request">
	<bean:define id="tempCustomerState" name="customerDetail1" property="customerState" scope="request" />	
	<bean:define id="tempCustomerName" name="customerDetail1" property="customerName" scope="request" />
	<%CustomerState = ""+tempCustomerState;
	CustomerName = ""+tempCustomerName;
	%>
</logic:present>
<% com.dms.ejb.customer.DMSCustomerDetail detail = new com.dms.ejb.customer.DMSCustomerDetail(); %>	
<logic:present name="customerDetail1" scope="request">
	<%
		Object obj=request.getAttribute("customerDetail1");
	    detail = (com.dms.ejb.customer.DMSCustomerDetail)obj;
	%>
	<html:hidden property="answer(CustomerName)" value='<%=CustomerName+""%>' styleId="CustomerName" />
<html:hidden property="answer(custState)" value='<%=detail.getCustomerState()%>' styleId="custState" />
<html:hidden property="answer(custCity)" value='<%=detail.getMCity()%>' styleId="custCity" />
<html:hidden property="answer(custCounty)" value='<%=detail.getMCounty()%>' styleId="custCounty" />
<html:hidden property="answer(custCounty)" value='<%=detail.getMZip()%>' styleId="custZip" />
<html:hidden property="answer(custStName)" value='<%=detail.getStreetName()%>' styleId="custStName" />
<html:hidden property="answer(custStNo)" value='<%=detail.getStreetNumber()%>' styleId="custStNo" />
<html:hidden property="answer(custAdd2)" value='<%=detail.getMAddress2()%>' styleId="custAdd2" />
<html:hidden property="answer(custAdd1)" value='<%=detail.getMAddress1()%>' styleId="custAdd1" />
	
</logic:present>

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

<%String docSubQuoteId=""; %>
<%String subQuoteId1 = ""; %>
	
<dmshtml:Get_All_Plan_HeaderDetails nameInSession="subQuotes" parentQuoteId='<%=""+parentQuoteId%>'dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  />
<logic:present name="subQuotes" scope="request">
<bean:define id="subQuoteArr" name="subQuotes" scope="request" type="java.util.ArrayList" />
<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">
		<bean:define id="subQuoteId" name="aSubQuote" 	property="quoteId" />
		<%docSubQuoteId=""+subQuoteId;%>
<%numberOfSubQuotes=subQuoteArr.size();%>	

<%subQuoteId1 = ""+subQuoteId;%>
</logic:iterate>											
</logic:present>
<html:hidden property="answer(Object::Quote::subQuoteId1)" value='<%=""+subQuoteId1 %>' styleId="subQuoteId11"/>
<dmshtml:Get_Customer_HeaderDetail_ByCustomerId 
nameInSession="customerMap" 
customerId='<%=""+customerId%>' 
dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' 
/>
<bean:define id="customerDetailMap" name="customerMap" scope="request"
												type="com.dms.ejb.data.QuestionHashMap" />
<%EmpGrpNum=customerDetailMap.getString("Object::Customer::Number");%>

<% if(numberOfSubQuotes < 1){ %>
	<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="true">
    <tr>
    	<td class="Error" COLSPAN="2">
    		There is no plan associated to the Quote. Please add a plan to the Quote.
    	</td>
    </tr>
    
	</dmshtml:dms_isPresent>
	
<%} if(numberOfSubQuotes > 0){ %>
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
		String riskZone = planDetails.getZone();
		subQuoteProductId1 = ""+subQuoteProductId;
		%>
			<%docSubQuoteVerId=""+subQuoteVerId;%>	
			<html:hidden property="answer(Object::Quote::PlanState)" value='<%=""+planState%>' styleId="planState"/>
			<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value='<%=""+subQuoteVerId%>'/>
			<html:hidden value='<%=""+riskTerritory%>' styleId="riskTerritory1" property="answer(Object::Quote::RiskTerritory1)"/>
			<html:hidden property="answer(Object::Quote::subQuoteVerId1)" value='<%=""+subQuoteVerId %>' styleId="subQuoteVerId"/>
<table>			
<tr>
	<td align="left">
		<table WIDTH="100%"  ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
			<tr>
				<td colspan="5" style ="font-style:bolditalic;font-size:14pt ; "align="left" width="12%">
				<% String strQuoteSubNumber=QuoteSubNumber.toString(); 
					if(strQuoteSubNumber.length()>0) {
						quoteNum1=quoteNum1+"-"+strQuoteSubNumber;
						}%>
								
						Quote <%=""+quoteNum1%><a href="javascript:;"> 
				</td>
			</tr>
		<tr><td colspan="5">&nbsp;</td></tr>
		<tr>
		<!--<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="false"> 

		--><dmshtml:dms_isPresent property="<%=new String[]{"Bound","Issued","Offered","Bind Request","Lapsed"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
		    <td class="links" align="left" width="7%">
		    <a href="../ModifyQuoteConfirmAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(modQuoteId)=<%=""+parentQuoteId%>&answer(modQuoteNumber)=<%=""+QuoteNumber%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>" class="button2" style="width:100px" title="Click to Modify the Quote"  onclick="submit_form()">Modify Quote</a> 
	        </td>
		</dmshtml:dms_isPresent>
	<!--</dmshtml:dms_isPresent>
		--><dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="true">
	<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="ADD_PLAN_AVAILABLE" 
			property='<%=new String[]{"In Progress"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">

	</dmshtml:isFeatureAvailableForProductRoleStatus>
	</dmshtml:dms_isPresent>
	
	<dmshtml:GetSubmissionDetailByQuoteId nameInSession="submissionDetailByQuoteId" quoteId="<%=Long.parseLong(parentQuoteId.toString())%>" ownerId='<%=Long.parseLong(ownerId.toString())%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
	<logic:present name="submissionDetailByQuoteId" scope="request">
		<bean:define id="subDetailMap" name="submissionDetailByQuoteId" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
		<bean:define id="subId" name="subDetailMap" property="Object::Submission::SubmissionId" />
		<bean:define id="subVerId" name="subDetailMap" property="Object::Submission::SubmissionVerId" />
		<bean:define id="custId" name="subDetailMap" property="Object::Submission::CustomerId" />
			<logic:greaterThan name="subId" value="0">
				<logic:greaterThan name="subVerId" value="0">
					<logic:greaterThan name="custId" value="0">		
						<td class="links" align="left" width="16%">				
							<a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=Long.parseLong(subVerId.toString())%>&answer(Object::Submission::SubmissionId)=<%=Long.parseLong(subId.toString())%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=Long.parseLong(custId.toString())%>&customerId=<%=Long.parseLong(""+custId)%>&answer(Object::Customer::CustomerId)=<%=Long.parseLong(""+custId)%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=Long.parseLong(""+custId)%>"  class="button2" title="Click to go to Submission Summary" style="width:190px">
								Go to Submission Summary
							</a>			
						</td>	
					</logic:greaterThan>
				</logic:greaterThan>
			</logic:greaterThan>
	</logic:present>	
<bean:define id="custId" name="subDetailMap" property="Object::Submission::CustomerId" />
<td class="links" align="left" width="16%"><a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=""+custId%>&answer(Object::Customer::CustomerId)=<%=""+custId%>" title="Click to go to Master Insured Record" class="button2" style="width:190px" />Go to Insured Master Record</a> </td>

	<logic:present name="subQuotes" scope="request">
		
		<!-- <td  align="left" width="10%">
			 	<a  href="../CopyQuoteCL.do?TabPanelName=Quote_Panel&forwardKey=COPY_QUOTE3.0&PageType=COPY_QUOTE_SUMMARY&quoteId=<%=""+parentQuoteId%>&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&parentQuoteVerId=<%=""+parentQuoteVerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Customer::State)=<%=""+State %>"  class="button2" style="width:100px"/> Copy Quote</a>
			</td>-->
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRIVILEGE_SEARCH_ACTIVITY_LOG"}%>' connector='or' negated="true">
			<td class="links"align="left" width="10%">
				<a href="../SearchActivityManagerAction5.do?TabPanelName=Quote_Panel&policyNumber=<%=""+policyNumber %>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Activity::ObjectId)=<%=""+parentQuoteId%>&answer(Object::Activity::ObjectType)=<%="Quote"%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus%>&answer(Object::Activity::OwnerId)=<%=ownerId.toString()%>&answer(Object::Activity::PageNum)=0&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>" class="button2" title="Click to go to Activity Log" style="width:100px">Activity Log </a>
			</td>			
		</dmshtml:dms_static_with_connector>
		
			<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="PROPOSAL_AVAILBLE" 
			property='<%=new String[]{"In Progress", "Referred"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
			<td class="links" align="left" width="12%">
			<a href="../quote/CreateQuoteProposalEIL.jsp?TabPanelName=Quote_Panel&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(ProductId)=<%=""+prodId%>&answer(ProductFamilyId)=<%=ProductFamilyId.toString()%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::QuoteAdditional::RenewalPolicyNumber)=<%=RenewalPolicyNo.toString()%>&answer(Object::QuoteAdditional::RenewalPolicyCompany)=<%=RenewalPolicyCompany.toString()%>&answer(Object::QuoteAdditional::RenewalPolicySubmission)=<%=RenewalSubmissionNumber.toString()%>&subQuoteId=<%=subQuoteId.toString()%>&answer(suQuoteVerId)=<%=""+subQuoteVerId%>&answer(Object::Rules::ActionForward)=Y" id="Create_Quote_Proposal" title="Click to Create Quote Proposal" class="button2" style="width:150px">Create Quote Proposal</a>
		</td>
		</dmshtml:isFeatureAvailableForProductRoleStatus>

		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="BIND_REQUEST_AVAILABLE" property='<%=new String[]{"Offered"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
			<td class="links" align="left" width="10%">
				<a href="/quote/BindRequestEIL.jsp?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(suQuoteVerId)=<%=""+subQuoteVerId%>&answer(parentPolicyId)=<%=""%>&answer(Object::Policy::ParentPolicyVerId)=<%=""%>" id="Bind_Request" class="button2" title="Click to Bind Quote" style="width:100px">Bind Quote</a>
			</td>
		</dmshtml:isFeatureAvailableForProductRoleStatus>
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="ISSUE_AVAILABLE" property='<%=new String[]{"Bind Request"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
			<td  align="left" width="10%">
				<a href="../VerifyIssueBinderEIL.do?TabPanelName=Quote_Panel&answer(policyNumber)=<%=""+policyNumber%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Quote::ParentQuoteId)=<%=""+parentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(parentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+docSubQuoteId%>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(DocumentType)=ISSUANCE&answer(state)=<%=""+planState%>&answer(subQuoteId)=<%= subQuoteId.toString()%>&answer(Object::Quote::SubQuoteId)=<%= subQuoteId.toString()%>&answer(numberOfSubQuotes)=<%=""+numberOfSubQuotes %>&answer(teritory)=<%=""%>&Navigation=&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&tabNo=0&answer(ParentQuoteId)=<%=parentQuoteId.toString()%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(SubQuoteId)=<%=subQuoteId.toString()%>&ParentQuoteId=<%=parentQuoteId.toString()%>&ParentQuoteVerId=<%=""+parentQuoteVerId%>&SubQuoteId=<%=subQuoteId.toString()%>&subQuoteVerId=<%=subQuoteVerId.toString()%>&answer(Object::Quote::SuQuoteVerId)=<%=subQuoteVerId.toString()%>&answer(subQuoteVerId)=<%=subQuoteVerId.toString()%>" id="Issue_Binder" class="button2" style="width:100px">Issue Binder</a>
			</td>
		</dmshtml:isFeatureAvailableForProductRoleStatus>
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="ISSUE_AVAILABLE_NO_BINDER" 
			property='<%=new String[]{"Bind Request"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
			<td class="links"  align="left" width="10%">
				<a href="../GetIssueBinderBTA.do?TabPanelName=Quote_Panel&answer(policyNumber)=<%=""+policyNumber%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Quote::ParentQuoteId)=<%=""+parentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::ProductVer::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Product::ProductId)=<%=""+prodId%>&answer(parentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+docSubQuoteId%>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(Object::Quote::QuoteEndDate)=<%=quoteEndDate.toString()%>&answer(DocumentType)=ISSUANCE&answer(state)=<%=""+planState%>&answer(subQuoteId)=<%= subQuoteId.toString()%>&answer(Object::Quote::SubQuoteId)=<%= subQuoteId.toString()%>&answer(numberOfSubQuotes)=<%=""+numberOfSubQuotes %>&answer(teritory)=<%=""%>&Navigation=&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&tabNo=0&answer(ParentQuoteId)=<%=parentQuoteId.toString()%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(SubQuoteId)=<%=subQuoteId.toString()%>&ParentQuoteId=<%=parentQuoteId.toString()%>&ParentQuoteVerId=<%=""+parentQuoteVerId%>&SubQuoteId=<%=subQuoteId.toString()%>&subQuoteVerId=<%=subQuoteVerId.toString()%>&answer(Object::Quote::SuQuoteVerId)=<%=subQuoteVerId.toString()%>&answer(subQuoteVerId)=<%=subQuoteVerId.toString()%>&answer(Object::QuoteAdditional::RenewalPolicyNumber)=<%=""+RenewalPolicyNo%>" id="Issue_Binder" class="button2" title="Click to Issue Binder" style="width:100px">Issue Binder</a>
			</td>
		</dmshtml:isFeatureAvailableForProductRoleStatus>
		
		<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="true">
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="REFERRAL_AVAILABLE" 
			property='<%=new String[]{"In Progress"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
			
			<td  align="left" width="10%">
					<a href="../SubmitQuoteEIL.do?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(policyNumber)=<%=""+policyNumber%>&answer(ParentQuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(GetadditionalInfo)=yes&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(ProductId)=<%=""+prodId%>&answer(ParentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(ProductFamilyId)=<%=ProductFamilyId.toString()%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(RULE_OBJECT_ID)=<%=""+prodId%>&answer(RULE_OBJECT_VER_ID)=<%=""+ProductVerId%>&answer(Object::Quote::PrevSubQuoteVerId)=<%=""+subQuoteVerId%>&answer(RULE_OBJECT_TYPE)=PRODUCT&answer(RULE_OBJECT_NAME)=APPLICATION&answer(MERGE_BEFORE)=YES&answer(MERGE_AFTER)=NO&answer(ASSERT_MAP_ENTRIES)=YES&answer(MODIFIED_FACT_MAP)=YES" id="Refer_Quote" class="button2" style="width:100px">Refer</a>
			</td>
		
			</dmshtml:isFeatureAvailableForProductRoleStatus>
			
	</dmshtml:dms_isPresent>						
	
		
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="LAPSE_AVAILABLE" 
			property='<%=new String[]{"In Progress","Offered","Bind Request","Referred","Submitted"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
		<td  align="left" width="10%">
			<a href="../LostQuote.do?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(GetadditionalInfo)=yes&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::QuoteAdditional::RenewalPolicyNumber)=<%=RenewalPolicyNo.toString()%>&answer(Object::QuoteAdditional::RenewalPolicyCompany)=<%=RenewalPolicyCompany.toString()%>&answer(Object::QuoteAdditional::RenewalPolicySubmission)=<%=RenewalSubmissionNumber.toString()%>" id="Lapse_Quote" class="button2" title="Click here to Lapse this quote"  style="width:100px">Lapse</a>
		</td>
		</dmshtml:isFeatureAvailableForProductRoleStatus>
		
	<dmshtml:GetQuoteDetailByQuoteId nameInSession="GetQuoteDetailByQuoteId" quoteId='<%=""+QuoteId%>' ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
	<logic:present name="GetQuoteDetailByQuoteId" scope="request">
		<bean:define id="quoteName" name="GetQuoteDetailByQuoteId" property="quoteName" />
		<bean:define id="quoteDesc" name="GetQuoteDetailByQuoteId" property="quoteDesc" />
	</logic:present>
		
		
		
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EXPORT_XML"}%>' connector='or' negated="true">
			<dmshtml:dms_isPresent property='<%=new String[]{"Sold"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
				<td class="links" align="left" width="10%">
					<a href="../XMLGeneratorForCustomer.do?TabPanelName=Quote_Panel&customerId=<%=customerId.toString()%>&xmlFileName=<%=QuoteNumber.toString()%>&quoteId=<%=parentQuoteId%>" target="_new">Export XML</a>
				</td>
			</dmshtml:dms_isPresent>
		</dmshtml:dms_static_with_connector>
		
		
	</logic:present>
		</tr>

		</table>
		</td>
	</tr>
	<tr>
	 	<td>
			<logic:present name="QuoteTransactionStatus" scope="request">
					<tr>
						<td class="Error"><%= request.getAttribute("QuoteTransactionStatus") %>
						</td>
					</tr>
			</logic:present>
		</td>
	</tr>
	</table>
</logic:present>
<%} %>
<%java.util.ArrayList pdfList = new java.util.ArrayList();%>
	<%
			boolean editableQuoteHeader =false;
			boolean uwFactorDropDown =false;
			boolean modifyQuoteType = false;
	
	%>
<bean:define id="custId" name="subDetailMap" property="Object::Submission::CustomerId" />
<!--  <td class="links" align="left" width="16%"><a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=""+custId%>&answer(Object::Customer::CustomerId)=<%=""+custId%>" title="Click to go to Master Insured Record" class="button2" style="width:190px" />Go to Insured Master Record</a> </td>-->

	<logic:present name="subQuotes" scope="request">
		
		<!-- <td  align="left" width="10%">
			 	<a  href="../CopyQuoteCL.do?TabPanelName=Quote_Panel&forwardKey=COPY_QUOTE3.0&PageType=COPY_QUOTE_SUMMARY&quoteId=<%=""+parentQuoteId%>&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&parentQuoteVerId=<%=""+parentQuoteVerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Customer::State)=<%=""+State %>"  class="button2" style="width:100px"/> Copy Quote</a>
			</td>-->
		
			
	</logic:present>

<%
		double totalParentQuotePremium=Double.parseDouble(TotalParentQuotePremium.toString());
		double lgparentQuoteFee1 = Double.parseDouble(parentQuoteFee1.toString());
		double lgparentQuoteFee2 = Double.parseDouble(parentQuoteFee2.toString());
		
	%>
	<logic:present name="subQuotes" scope="request">
	
		<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">
		<bean:define id="subQuoteId" name="aSubQuote" 	property="quoteId" />
		<bean:define id="subQuoteVerId" name="aSubQuote" 	property="quoteVerId" />
		<bean:define id="subQuoteProductId" name="aSubQuote" 	property="productId" />
		<bean:define id="subQuoteProductVerId" name="aSubQuote" 	property="productVerId" />
		<bean:define id="planNum" name="aSubQuote" 	property="quoteNumber" />
		<bean:define id="planDetails" name="aSubQuote" 	property="healthInsPlanDetail" type="com.dms.ejb.insurance.quote.common.plan.PlanDetail" />
		<bean:define id="subQuoteStatus" name="aSubQuote" 	property="quoteStatus" />
		<%strSubQuoteId1 = ""+subQuoteId;
		strSubQuoteVerId1 = ""+subQuoteVerId;
		long riskId =planDetails.getPLResRiskPropertyId() ;
		String riskName =planDetails.getPLResRiskPropertyName() ;
		String riskNumber =planDetails.getPLResRiskPropertyRiskNumber() ;
		long riskTerritory =planDetails.getTerritory() ;
		String planState = planDetails.getStateCode();
		String riskZone = planDetails.getZone();		
		%>
	
		
		<tr>		
		<% if(paretQuoteStatus.equals("Bound") || paretQuoteStatus.equals("BOUND") || paretQuoteStatus.equals("Issued") || paretQuoteStatus.equals("ISSUED")){ %>	
		
		<dmshtml:GetPolicyNumber  nameInSession="PolicyNumber" ownerId='<%=""+ownerId %>' parentQuoteId='<%=Long.parseLong(""+parentQuoteId) %>' subQuoteId ='<%=Long.parseLong(""+subQuoteId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
		<logic:present name="PolicyNumber" scope="request">
			
					<% com.dms.ejb.data.QuestionHashMap policyNum = (com.dms.ejb.data.QuestionHashMap)request.getAttribute("PolicyNumber"); 
					     String policyNo = policyNum.getString("policyNumber");
					     String PolicyStatus = policyNum.getString("PolicyStatus");
					%>
			        <%if(!policyNum.equals("")) {%>							
					<%} %>	
		
        </logic:present>
		<% } %>


		<%String IsApplicationDisabled="Y";%>
		<%String IsOptionDisabled="Y";%>
		<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
					<%IsOptionDisabled="N";%>
					<%IsApplicationDisabled="N";%>
		</dmshtml:dms_isPresent>
		<dmshtml:dms_isPresent property="<%=new String[]{"Referred","Submitted"}%>" value="<%=paretQuoteStatus.toString()%>"  negated="true">
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SAVE_AFTER_SUBMIT_QUOTE"}%>' connector='or' negated="true">
					<%IsOptionDisabled="N";%>
					<%IsApplicationDisabled="N";%>
				</dmshtml:dms_static_with_connector>
		</dmshtml:dms_isPresent>
		<html:hidden styleId="IsOptionDisabled" property="answer(IsOptionDisabled)" value="<%=""+IsOptionDisabled %>"/>
		<html:hidden property="Object::Application::ISApplicationDisabled" value='<%=""+IsApplicationDisabled %>' styleId="IsApplicationDisabled"/>
		<bean:define id="totalPremium" name="aSubQuote" 	property="totalPremium" />
		<bean:define id="fee1" name="aSubQuote" 	property="fee1" />
		<bean:define id="fee2" name="aSubQuote" 	property="fee2" />
		<%
		double lgtotalPremium=0.0;
		double lgfee1=0.0;
		double lgfee2=0.0;
		
		try  {lgtotalPremium=  Double.parseDouble(totalPremium.toString()) ;} catch (Exception ex) {}
		try  {lgfee1=  Double.parseDouble(fee1.toString()) ;} catch (Exception ex) {}
		try  {lgfee2=  Double.parseDouble(fee2.toString()) ;} catch (Exception ex) {}
		%>
		</logic:iterate>
</logic:present>
<html:hidden property="answer(Object::UserDetail::email)" value='<%=""+email%>' styleId="email"/>
	<html:hidden property="answer(Object::UserDetail::roleName)" value='<%=""+roleName%>' styleId="roleName"/>
	<html:hidden property="answer(Object::Notification::Email::ObjectType)" value="QUOTE" styleId="EmailType"/>
	<html:hidden property="answer(Object::Quote::QuoteSubNumber)" value='<%=""+QuoteSubNumber%>' styleId="QuoteSubNumber"/>
	<html:hidden property="page1" value='<%"7" %>' />
	<html:hidden property="answer(Quote::Page)" value="QUOTE SUMMURY" />
	<html:hidden property="answer(QuoteId)" value='<%=""+parentQuoteId%>' />
	<html:hidden property="answer(parentQuoteId)" value='<%=""+parentQuoteId%>' />	
	<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=""+customerId%>' />
	<html:hidden property="answer(Object::Agency::AgencyId)" styleId="AgencyId_hidden" value='<%=""+agencyId%>' />
	<html:hidden property="answer(ownerId)" value="<%=""+ownerId%>" />
	<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<html:hidden property="answer(Object::Quote::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" styleId="userId1"/>
	<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::PlanFactor::UpdatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::PlanFactor::CreatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=""+agencyId%>" />
	<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>" styleId="quoteStatustemp" />
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
	<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=""+paretQuoteStatus%>" />
	<html:hidden property="answer(parentQuoteId)" value="<%=""+parentQuoteId%>" />
	<html:hidden property="answer(Object::Quote::ProductVerId)" value="<%= ""+ProductVerId%>" />
	<html:hidden property="answer(isUpdated)" value="Y" />
	<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>" styleId="Quote"/>
	<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>" styleId="QuoteManagement"/>
	<html:hidden property="answer(pagename)" value="Quote summary" />
	<html:hidden property="answer(Object::Quote::PaymentPlan)" value='<%=""+paymentPlan%>' />
	<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+customerId %>" />
	<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" >
	<html:hidden property="answer(Object::PlanFactor::MedicalUWFactor)" value="<%=""+MedicalUWFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::DrugUWFactor)" value="<%=""+DrugUWFactor%>" />
	
	</dmshtml:dms_isPresent>
	<%if(!editableQuoteHeader) {%>
		<html:hidden property="answer(Object::Quote::HelthHra)" value="<%=""+HelthHra%>" />
		<html:hidden property="answer(Object::Quote::CompositeRate)" value="<%=""+CompositeRate%>" />
		<html:hidden property="answer(Object::Quote::AreaNetWorkKey)" value="<%=""+AreaNetWorkKey%>" />
		<html:hidden property="answer(Object::PlanFactor::MedicalUWFactor)" value="<%=""+MedicalUWFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::DrugUWFactor)" value="<%=""+DrugUWFactor%>" />
	<%}%>
	<%if(!modifyQuoteType) {%>		
		<html:hidden property="answer(Object::Quote::QuoteType)" value="<%=""+QuoteType%>" />
	<%}%>
	<html:hidden property="answer(Object::Quote::QuoteType)" value="<%=""+QuoteType%>" />
	
	<html:hidden property="answer(activateTabId)" value='<%=""+request.getParameter("answer(activateTabId)")%>' styleId="activateTabId"/>
	<html:hidden property="answer(Object::Quote::PolicyNumber)" value="<%=""+policyNumber%>" styleId="policyNumber"/>
	<html:hidden property="answer(SubjectivityParentObjectType)" value="QUOTE" styleId="SubjectivityParentObjectType" />
	<html:hidden property="answer(AgentId)" value="<%=""+policyNumber%>" />
	<html:hidden property="answer(Object::Quote::CustomerId1)" value='<%=""+customerId%>' styleId="customerId" />
	<html:hidden property="answer(Object::Quote::agencyId1)" value='<%=""+agencyId%>' styleId="agencyId" />
	<html:hidden property="answer(Object::Quote::prodId1)" value='<%=""+prodId%>' styleId="prodId" />
	<html:hidden property="answer(Object::Quote::ProductVerId1)" value='<%=""+ProductVerId%>' styleId="ProductVerId" />
	<html:hidden property="answer(Object::Quote::GroupId1)" value='<%=""+GroupId%>' styleId="GroupId" />
	<html:hidden property="answer(Object::Quote::ownerId1)" value='<%=""+ownerId%>' styleId="ownerId" />
	<html:hidden property="answer(Object::Quote::GroupVerId1)" value='<%=""+GroupVerId%>' styleId="GroupVerId" />
	<html:hidden property="answer(Object::Quote::parentQuoteId1)" value='<%=""+parentQuoteId%>' styleId="parentQuoteId" />
	<html:hidden property="answer(Object::Quote::productStatus1)" value='<%=""+productStatus%>' styleId="productStatus" />
	<html:hidden property="answer(Object::Quote::CustomerState1)" value='<%=""+CustomerState%>' styleId="CustomerState" />
	<html:hidden property="answer(Object::Quote::ProductFamilyId1)" value='<%=""+ProductFamilyId%>' styleId="ProductFamilyId" />
	<html:hidden property="answer(Object::Quote::parentQuoteVerId1)" value='<%=""+parentQuoteVerId%>' styleId="parentQuoteVerId" />
	<html:hidden property="answer(Object::Quote::UserId1)" value='<%=""+userId%>' styleId="userId" />
	<html:hidden property="answer(Object::Quote::subQuoteProductId1)" value='<%=""+subQuoteProductId1%>' styleId="subQuoteProductId1" />
	<html:hidden property="answer(Object::Quote::QuoteType)" value='<%=""+QuoteType%>' styleId="QuoteType1" />
	<html:hidden property="answer(Object::Quote::QuoteNumber)" value='<%=""+QuoteNumber%>' styleId="QuoteNumber1" />
	<html:hidden property="answer(Object::Quote::State)" value='<%=""+State%>' styleId="State1" />
	<html:hidden property="answer(Object::Quote::QuoteStatus)" value='<%=""+paretQuoteStatus%>' styleId="paretQuoteStatus" />
	<html:hidden property="answer(Object::Quote::isEndorsementQuote)" value="false" styleId="isEndorsementQuote" />
	<html:hidden property="answer(PageName)" value="QuoteSummary" styleId="PageName" />
		<html:hidden styleId="subQuoteVerId" property="answer(subQuoteVerId)" value="<%=strSubQuoteVerId1 %>"/>
	<%if(request.getAttribute("Object::Clearance::NoRecords") != null){
		String clearnceStatus = ""+request.getAttribute("Object::Clearance::NoRecords");%>
		<html:hidden property="answer(Object::Clearance::NoRecords)" value='<%=""+clearnceStatus%>' styleId="clearnceStatus1" />
	<%} %>
<dmshtml:get_all_risk_types nameInSession="riskTypeList" ownerId='<%=ownerId+""%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
							
		<bean:define id="riskTypeList" name="riskTypeList" type="java.util.ArrayList"/>

<table border="0" cellpadding="0" cellspacing="0" width="98%"    align="left">

  <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>

<tr>
	<td>
		<jsp:include page="/common/QuoteHeaderCoverMin.jsp">

<jsp:param name="answer(Object::Quote::ObjectId)" value="<%=""+parentQuoteId%>" />

</jsp:include>
	
	</td>

</tr>
<logic:present name="MESSAGE_LIST" scope="request">
	<tr>
		<td colspan="2" class="links">
			<table width="900px">
				<tr>
					<td class="Error">
						
							<logic:iterate id="message" name="MESSAGE_LIST">
								<li><bean:write name="message"/></li>
							</logic:iterate>
								
					</td>
				</tr>
			</table>
		</td>
	</tr>
</logic:present>	
				
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
<bean:define id="RenewalPolicyNumber" name="QuoteDetail" property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" scope="request"></bean:define>
<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="true">
<tr> <td align="right">&nbsp;</td> </tr>
				
	  <tr>
		<td>
			<table border="0" cellpadding="0" cellspacing="0" width="98%"    align="left">
				<tr>
					<td align="left" class="TextMatter">Policy Effective Date: &nbsp;</td>
					<td class="sectionhead1" align="left">
						<div id="policyAnniversaryDate1"></div>
						<jsp:include page="../common/ExtDateField.jsp">
							<jsp:param name="inputDateField" value="policyAnniversaryDate" />
							<jsp:param name="panelDiv" value="policyAnniversaryDate1" />
							<jsp:param name="minimumDate" value="" />
							<jsp:param name="maximumDate" value="" />
							<jsp:param name="allowBlank" value="false" />
							<jsp:param name="setDefaultToday" value="false" />
							<jsp:param name="TodayDate" value="" />
						</jsp:include>
						
					</td>															
				</tr>														
				
				<tr>
					<td align="left" class="TextMatter">Policy Expiration Date: &nbsp;</td>
					<td class="sectionhead1" align="left">
						<div id="policyExpirationDate1"></div>
						<jsp:include page="../common/ExtDateField.jsp">
							<jsp:param name="inputDateField" value="policyExpirationDate" />
							<jsp:param name="panelDiv" value="policyExpirationDate1" />
							<jsp:param name="minimumDate" value="" />
							<jsp:param name="maximumDate" value="" />
							<jsp:param name="allowBlank" value="false" />
							<jsp:param name="setDefaultToday" value="false" />
							<jsp:param name="TodayDate" value="" />
						</jsp:include>
					<html:hidden property="answer(Object::Quote::QuoteEndDate)" styleId="ExpDate" value='<%=""+quoteEndDate%>' />
					</td>
				</tr>
				<dmshtml:dms_isPresent property='<%=new String[]{"RENEWAL"}%>' value="<%=QuoteType.toString()%>" negated="true" >
					<tr id="RenewalPolicyNo" >
						<td class="TextMatter" align="left">Renewing Policy Number:</td>
						<td  align="left">
						
						<%=""+RenewalPolicyNumber %>
						</td>
					</tr>
				</dmshtml:dms_isPresent>
				<tr> <td align="right">&nbsp;</td> </tr>
				<tr>
					<td class="links" align="right" width="16%"> 
						<html:hidden property="answer(Object::Quote::QuoteStartDate)" value="<%=""+quoteStartDate%>" styleId="txtDate"/>
						<html:hidden property="answer(Object::Quote::QuoteEndDate)" value='<%=""+quoteEndDate%>' styleId="ExpDate" />
						<a href="../SaveQuoteSummuryAction.do?answer(QuoteId)=<%=""+parentQuoteId%>&answer(Quote::Page)=QUOTE SUMMURY&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus%>&answer(Object::PlanFactor::CreatedBy)=<%=""+userId%>&answer(Object::PlanFactor::UpdatedBy)=<%=""+userId%>&answer(Object::Plan::CreatedBy)=<%=""+userId%>&answer(Object::Plan::UpdatedBy)=<%=""+userId%>&answer(Object::Quote::dbName)=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>&answer(Object::Quote::QuoteType)=<%=""+QuoteType%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(activateTabId)=CoverageandLimits_Row&answer(Object::PageType)=ISSUE_BINDER_CLC" id="Recalculate_Quote_link" >
							<html:button styleClass="covbigbutton1" style="font-size:13px;" property="answer(RecalculateQuote)" value="Recalculate Quote" 
							onclick="recalculateQuote();" title="Click here to recalcualte the quote"/>
						</a>
					</td>
					
					<td class="links" align="right" style="width:16%;display:none;"> 
						<html:hidden property="answer(Object::Quote::QuoteStartDate)" value="<%=""+quoteStartDate%>" styleId="txtDate"/>
						<html:hidden property="answer(Object::Quote::QuoteEndDate)" value='<%=""+quoteEndDate%>' styleId="ExpDate" />
						<a href="../SaveQuoteSummaryAction.do?answer(QuoteId)=<%=""+parentQuoteId%>&answer(Quote::Page)=QUOTE SUMMURY&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus%>&answer(Object::PlanFactor::CreatedBy)=<%=""+userId%>&answer(Object::PlanFactor::UpdatedBy)=<%=""+userId%>&answer(Object::Plan::CreatedBy)=<%=""+userId%>&answer(Object::Plan::UpdatedBy)=<%=""+userId%>&answer(Object::Quote::dbName)=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>&answer(Object::Quote::QuoteType)=<%=""+QuoteType%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(activateTabId)=ClassHazards_Row&answer(Object::PageType)=ISSUE_BINDER_CLC" id="Recalculate_Quote_link_save_benefits" >
							<html:button styleClass="covbigbutton1" style="font-size:13px;" property="answer(RecalculateQuote)" value="Recalculate Quote" 
							onclick="window.location=document.getElementById('Recalculate_Quote_link_save_benefits') + '&answer(Object::Quote::QuoteStartDate)=' + document.getElementById('txtDate').value + '&answer(Object::Quote::QuoteEndDate)=' + document.getElementById('ExpDate').value" />
						</a>
					</td>
					
					<td class="links" align="right" style="width:16%;display:none;"> 
						<html:hidden property="answer(Object::Quote::QuoteStartDate)" value="<%=""+quoteStartDate%>" styleId="txtDate"/>
						<html:hidden property="answer(Object::Quote::QuoteEndDate)" value='<%=""+quoteEndDate%>' styleId="ExpDate" />
						<a href="../SaveQuoteSummaryAction.do?answer(QuoteId)=<%=""+parentQuoteId%>&answer(Quote::Page)=QUOTE SUMMURY&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus%>&answer(Object::PlanFactor::CreatedBy)=<%=""+userId%>&answer(Object::PlanFactor::UpdatedBy)=<%=""+userId%>&answer(Object::Plan::CreatedBy)=<%=""+userId%>&answer(Object::Plan::UpdatedBy)=<%=""+userId%>&answer(Object::Quote::dbName)=<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>&answer(Object::Quote::QuoteType)=<%=""+QuoteType%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(activateTabId)=ClassHazards_Row&answer(Object::PageType)=ISSUE_BINDER_CLC" id="Recalculate_Quote_link_delete_class" >
							<html:button styleClass="covbigbutton1" style="font-size:13px;" property="answer(RecalculateQuote)" value="Recalculate Quote" 
							onclick="window.location=document.getElementById('Recalculate_Quote_link_delete_class') + '&answer(Object::Quote::QuoteStartDate)=' + document.getElementById('txtDate').value + '&answer(Object::Quote::QuoteEndDate)=' + document.getElementById('ExpDate').value" />
						</a>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</dmshtml:dms_isPresent>



<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="false">
<tr> <td align="right">&nbsp;</td> </tr>
				
	  <tr>
		<td>
			<table border="0" cellpadding="0" cellspacing="0" width="38%"    align="left">
				<tr>
					<td align="left" class="TextMatter">Policy Effective Date: &nbsp;</td>
					<td  align="left">
						
						
						<%=""+quoteStartDate%>
					</td>															
				</tr>														
				
				<tr>
					<td align="left" class="TextMatter">Policy Expiration Date: &nbsp;</td>
					<td  align="left">
						
					<%=""+quoteEndDate%>
					</td>
				</tr>
				<dmshtml:dms_isPresent property='<%=new String[]{"RENEWAL"}%>' value="<%=QuoteType.toString()%>" negated="true" >
					<tr id="RenewalPolicyNo" >
						<td class="TextMatter" align="left">Renewing Policy Number:</td>
						<td  align="left">
						<%=""+RenewalPolicyNumber %>
						</td>
					</tr>
				</dmshtml:dms_isPresent>
				
				
			</table>
		</td>
	</tr>
</dmshtml:dms_isPresent>

<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="false">
	<html:hidden property="answer(Object::Quote::QuoteStartDate)" value="<%=""+quoteStartDate%>" styleId="txtDate"/>	
</dmshtml:dms_isPresent>

	<tr> <td align="right">&nbsp;</td> </tr>
    <tr>
     <td width="100%" valign="bottom" align="left" height="25">
     <table border="0" cellpadding="0" cellspacing="0" id="PolicySummaryContent">
       <tr>
            <td align="center" valign=bottom>
    		 <table border="0" width="100" cellspacing="0" cellpadding="0" id="Documentation_Row" class="todotab_active" height=35>
    		 	<tr><td align="center" onClick="LoadDocumentationTab('Documentation_Row');"  Style="Cursor:hand">Documentation</td></tr>				
		 </table>
         </td>
         
         
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>             
            <td align="center" valign=bottom>
    		 <table border="0" width="160" cellspacing="0" cellpadding="0" id="CoverageandLimits_Row" class="todotab_inactive" height=35>
    		 	<tr><td align="center" onClick="LoadNewQuoteCoverageandLimits('CoverageandLimits_Row');"  Style="Cursor:hand">Policy Coverage and Limits</td></tr>				
		 </table>
         </td>

         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         
         <td align="center" valign=bottom>
    		 <table border="0" width="120" cellspacing="0" cellpadding="0" id="PolicyInformation_Row" class="todotab_inactive" height=35 >
    		 	<tr><td align="center" onClick="LoadNewQuotePolicyInformationTab('PolicyInformation_Row');"  Style="Cursor:hand">Policy Information</td></tr>				
		 </table>
         </td>
         
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         
         <td align="center" valign=bottom>
    		 <table border="0" width="120" cellspacing="0" cellpadding="0" id="PolicyExclusions_Row" class="todotab_inactive" height=35 >
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
    		 	<tr><td align="center" onClick="loadAllClassList('ClassHazards_Row');"  Style="Cursor:hand" id="classListId">Class(<%=classListSize %>)</td></tr>				
		 </table>
         </td>

		 <dmshtml:Get_HealthIns_QuoteDetail nameInSession="QuoteInfo" quoteId="<%=""+subQuoteId1%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" />

 
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
	     			<table border="0" width="120" cellspacing="0" cellpadding="0" id="AircraftSchedule" class="todotab_inactive" height=35>
	 					<tr><td align="center"  onClick="LoadNewQuoteAircraftSchedule('AircraftSchedule')"  Style="Cursor:hand">Aircraft Schedule</td></tr>
	 				</table>
        		 </td>
        	<%}%>					
		</logic:present>
		
        <!--<logic:present name="subQuotes" scope="request">
			<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"></logic:iterate>
			<bean:define id="planDetails" name="aSubQuote" 	property="healthInsPlanDetail" type="com.dms.ejb.insurance.quote.common.plan.PlanDetail" />
			pilotIncluded =planDetails.getPilotIncluded() ;
		</logic:present>-->
		
         <dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS" property='<%=new String[]{"In Progress","Offered","Bind Request","Referred","Submitted","Declined","Lapsed"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">				
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="2" height="4"></td>         
          <td id="ScheduleofFormsTab"  align="center" valign=bottom>
	     	<table border="0" width="120" cellspacing="0" cellpadding="0" id="ScheduleOfForms_Row" class="todotab_inactive" height=35>
	 		<tr><td align="center"  onClick="LoadNewQuoteScheduleofForms('ScheduleOfForms_Row')"  Style="Cursor:hand">Schedule of forms</td></tr>
	 	</table>
         </td>
         </dmshtml:isFeatureAvailableForProductRoleStatus>
		 
		 <dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="WORKSHEET_AVAILABLE" property='<%=new String[]{"In Progress","Offered","Bind Request","Referred","Submitted","Declined","Lapsed","Issued","Bound"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">				          
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="2" height="4"></td>         
          <td id="WorksheetTab"  align="center" valign=bottom>
	     	<table border="0" width="100" cellspacing="0" cellpadding="0" id="Worksheet" class="todotab_inactive" height=35>
	 		<tr><td align="center"  onClick="LoadNewQuoteWorksheet('Worksheet');"  Style="Cursor:hand">Worksheet</td></tr>
	 		</table>
         </td>
         </dmshtml:isFeatureAvailableForProductRoleStatus>
         
       </tr>
     </table>
     </td>

    
   </tr>
   <tr>
    <td class="todotab_yellowbox2">
    	<div id="PolicyInformationDiv" style="display:none;">
		<table border="0" cellpadding="0" cellspacing="0">
			<tr><td align="center" valign=bottom>&nbsp;</td></tr>				
			<tr>
				<!--  <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>-->
				<td align="center" valign=bottom>
				<table border="0" width="125" cellspacing="0" cellpadding="0" id="Pol_Definition_Row" class="todotab_active" height=35>
					<tr>
						<td align="center" onClick="LoadNewQuotePolicyDefinitionTab('Pol_Definition_Row');" Style="Cursor:hand">Policy Definition</td>
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
		
     <div id="CovLimitsDiv">     
     </div>
     	<dmshtml:getPDFRelativePath nameInSession="pdfDestinationPath" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
<div id="DocumentDiv">
			<div align="left" >&nbsp; Core Documents</div>
				<div class="frlabel3 left">
					&nbsp;
				</div>
				<div class="frinfo3 left" style="width:450px">
					
					<logic:present name="pdfDestinationPath" scope="request">
		<bean:define id="PDFDestinationFilePath" name="pdfDestinationPath" scope="request" />
	
		<% String strQuoteSubNumber=QuoteSubNumber.toString(); %>
			 
			<%
				java.util.ArrayList empBasedPdfList = new java.util.ArrayList();		
				String xmlPath = "";		
				String strQuoteNum = QuoteNumber.toString();
				//String pdfDestinationFilePath = "";
				//pdfDestinationFilePath = com.dms.util.Constants.getVersionedValueOf("PDFDestinationFilePath_"+ownerId);
		   
				if(strQuoteSubNumber.length()>0) {
					strQuoteNum=strQuoteNum+"-"+strQuoteSubNumber;
				}
				{			
					pdfList=com.dms.util.Constants.listFilesInsideADirectory("QuotePDF_Path",PDFDestinationFilePath+strQuoteNum);
					if (EmpGrpNum!=null && EmpGrpNum.length() !=0)
					{
						empBasedPdfList = com.dms.util.Constants.listFilesInsideADirectory("QuotePDF_Path",PDFDestinationFilePath+EmpGrpNum.toString()+"/"+strQuoteNum);
						
					}
				}
				
				java.util.ArrayList xmlList = new java.util.ArrayList();
				xmlList=com.dms.util.Constants.listFilesInsideADirectory("QuotePDF_Path",PDFDestinationFilePath+strQuoteNum+"/SoldQuotes");
				
				
			%>
		
			
				<% if((pdfList !=null && pdfList.size()>0) || (empBasedPdfList !=null && empBasedPdfList.size()>0)){ %>
				
					
					
					<table>
						<tr>
							
							<% if((pdfList !=null && pdfList.size()>0)){ 
								String proposalPDFDisplayed = "N";
								for (int i=0; i<pdfList.size(); i++)  {
								   
									String fileName=(String) pdfList.get(i);
									if(fileName.equalsIgnoreCase("SoldQuotes")){
										continue;
									}
					 		if( proposalPDFDisplayed.equals("N")&& fileName.indexOf("PROPOSAL") !=-1){%>
					 		<td>
							
							Quote : 
							
							</td>
							
					 		<%}else if(proposalPDFDisplayed.equals("N")&& fileName.indexOf("Proposal") !=-1){%>
					 			
					 			<td>
							
									Quote : 
							
								</td>
					 		<%}if( proposalPDFDisplayed.equals("Y")&& fileName.indexOf("PROPOSAL") !=-1){ %>
					 		
					 		<tr>
					 		<td>
					 		&nbsp;
					 		</td>
					 		<%} if(fileName.indexOf("PROPOSAL") !=-1) { %>
							<td>
								
									<%proposalPDFDisplayed = "Y";%>
									<a href="javascript:void(0);"onClick="javascript:window.open('../<%=PDFDestinationFilePath%><%=strQuoteNum%>/<%=fileName.toString()%>')">
										<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""><%=fileName.toString()%> 
									</a>
	
							</td>
							<%} else if(fileName.indexOf("Proposal") !=-1) { %>
							<td>
								
									<%proposalPDFDisplayed = "Y";%>
									<a href="javascript:void(0);"onClick="javascript:window.open('../<%=PDFDestinationFilePath%><%=strQuoteNum%>/<%=fileName.toString()%>')">
										<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""><%=fileName.toString()%> 
									</a>
	
							</td>
							<%} %>
							<%if(proposalPDFDisplayed.equals("Y")){ %>
					 		</tr>
					 		<%} %>
						<%} %>
						</tr>
						
						
						<tr>
							
							<% if((pdfList !=null && pdfList.size()>0)){ 
								for (int i=0; i<pdfList.size(); i++)  {
									String fileName=(String) pdfList.get(i);
									if(fileName.equalsIgnoreCase("SoldQuotes")){
										continue;
									}
					 		if(fileName.indexOf("INVOICE") !=-1) {%>
					 		<td>
							
							Invoice : 
							
							</td>
							<%}else if(fileName.indexOf("Invoice") !=-1) {%>
					 		<td>
							
							Invoice : 
							
							</td>
							<%} %>
							
								<%if(fileName.indexOf("Invoice") !=-1) {%>
								<td>
									<a href="javascript:void(0);"onClick="javascript:window.open('../<%=PDFDestinationFilePath%><%=strQuoteNum%>/<%=fileName.toString()%>')">
										<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""><%=fileName.toString()%> 
									</a>
								</td>
								<%}else  if(fileName.indexOf("INVOICE") !=-1) {%>
								<td>
									<a href="javascript:void(0);"onClick="javascript:window.open('../<%=PDFDestinationFilePath%><%=strQuoteNum%>/<%=fileName.toString()%>')">
										<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""><%=fileName.toString()%> 
									</a>
								</td>
								<%}
							
							
						} %>
						</tr>
						
						
						<tr>
							
						
							
						<%for (int i=0; i<pdfList.size(); i++)  {
									String fileName=(String) pdfList.get(i);
									if(fileName.equalsIgnoreCase("SoldQuotes")){
										continue;
									}
					 		if(fileName.indexOf("ISSUANCE") !=-1) {%>
					 		<td>
								Issuance :
							</td>
							<%}else if(fileName.indexOf("Issuance") !=-1) {%>
					 		<td>
							Issuance :
						</td>
						<%}
					 		
							if(fileName.indexOf("ISSUANCE") !=-1) {%>
								<td>
									<a href="javascript:void(0);"onClick="javascript:window.open('../<%=PDFDestinationFilePath%><%=strQuoteNum%>/<%=fileName.toString()%>')">
										<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""><%=fileName.toString()%> 
									</a>
								</td>
								<%} else if(fileName.indexOf("Issuance") !=-1) {%>
								<td>
								<a href="javascript:void(0);"onClick="javascript:window.open('../<%=PDFDestinationFilePath%><%=strQuoteNum%>/<%=fileName.toString()%>')">
									<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""><%=fileName.toString()%> 
								</a>
							</td>
							<%}
							} %>
								
							
						
						
						</tr>
						
						
						<tr>
							
						
							
						
								
							
						
						
						</tr>
						
					<!--   	<tr>
							<td>
								Application :
							</td>
						
							<td>
							
							<a href='../CreateEILApplicationPdf.go?TabPanelName=Quote_Panel&answer(DocumentType)=APPLICATION&answer(QuoteId)=<%= parentQuoteId.toString()%>&answer(subQuoteId)=<%=strSubQuoteId1.toString()%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(QuoteStatus)=<%=paretQuoteStatus.toString()%>' target="_new"><IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Application PDF</a>
							
							</td>
						
						
						</tr>-->
						
						
						
					
					</table>
					<%} //end of for loop
						} //end of if((pdfList !=null && pdfList.size()>0))
					if((empBasedPdfList !=null && empBasedPdfList.size()>0)){ 
						for (int j=0; j<empBasedPdfList.size(); j++)  {
							String fileName2=(String) empBasedPdfList.get(j);
							if(fileName2.equalsIgnoreCase("SoldQuotes")){
								continue;
							}				
					%>
					
				<a href="javascript:void(0);"
						onClick="javascript:window.open('../<%=PDFDestinationFilePath%><%=EmpGrpNum.toString()%>/<%=strQuoteNum%>/<%=fileName2.toString()%>')">
					<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15"
						BORDER="0" ALT=""><%=fileName2.toString()%></a><br/>
						<%} //end of for loop
					} //end of if((empBasedPdfList !=null && empBasedPdfList.size()>0))
					%>
					
				<%}%>				
				<%if(pdfList ==null || pdfList.size() == 0){ %>
			<!-- 	<table>
				<tr>
							<td>
								Application :
							</td>
						
							<td>
							
							<a href='../CreateEILApplicationPdf.go?TabPanelName=Quote_Panel&answer(DocumentType)=APPLICATION&answer(QuoteId)=<%= parentQuoteId.toString()%>&answer(subQuoteId)=<%=strSubQuoteId1.toString()%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(QuoteStatus)=<%=paretQuoteStatus.toString()%>' target="_new"><IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Application PDF</a>
							
							</td>
						
						
				</tr>
				</table> -->
				<%} %>
	</div>
	
<table>
<tr><td>&nbsp;<div id='frame' style="display:none"><iframe onload="hideAttachPopup()" src="../common/MessageFromRule.jsp" id='upload_target_iFrame' name='upload_target_iFrame'   style='width:300px;height:30px;border:1px solid #ccc;'></iframe></div></td></tr>
<tr><td>
		
	Attached Files
		<div id="QUOTE_ATTACHMENT_LIST" style="word-wrap:break-word;"></div>
		

<a href="javascript:void(0)" onclick="showAttach('<%=""+parentQuoteId %>','0','QUOTE');" class="button2" style="width:100px">Add File</a>

<table>
<tr><td></td></tr>
<tr><td><div id="AttachFiles"></div></td></tr>
<tr><td><div id="AddNotespopup" style="display:none"></div></td></tr>
</table>
<br>
Diary notes
<br>
		<div id="QUOTE_NOTES_LIST" style="word-wrap:break-word;"></div>
<a href="javascript:void(0)" onclick="showNotes('<%=""+parentQuoteId %>','0','Quote');" class="button2" style="width:100px">Add Notes</a>

 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_VIEW"}%>' connector='or' negated="true">

			<br>
			Email
			<br>
		<div id="QUOTE_EMAIL_LIST" style="word-wrap:break-word;"></div>
		<a href="javascript:void(0)" onclick="sendEmailDetails();" class="button2" style="width:100px">Compose Email</a>
		
</dmshtml:dms_static_with_connector>

	

	</logic:present>
	</td></tr></table>		
				</div>	
				
      <div id="ClassListDiv" style="display:none;width:900px;">
      <table>
    	 <tr><td>&nbsp;</td></tr>
      </table>
      <dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
				     <a href="javascript:void(0);" onclick="appendAddClassToParent();" id="AddClass_link" class="button2" style="width:100px;height:17px;">Add a Class</a>
	  </dmshtml:dms_isPresent>
	  	<table>
			<tr>
				<td>
				<div id="deleteSuccess1"
					style="display:none;color:red;font-weight:bold;">Deleted Successfully. Recalculating...</div>
				</td>
			</tr>
		</table>
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
					style="display:none;color:red;font-weight:bold;">Saved Successfully and recalculating</div>
				</td>
			</tr>
		</table>
		
		<table>
     	 <tr><td>&nbsp;</td></tr>
      </table>
     <div id="classTabs">
     <a href="javascript:void(0);" id="ClassList" onclick="loadAllClassList(this.id);" class="loctab_active left">	
	 <div id="ClassList" >Class List</div></a>
	 </div>
	 
     <div id="ClassList1" class="locformpages" style="float:left;width:900px;">
    </div>
     <div id="ClassInformationDiv" class="locformpages" style="float:left;width:900px;">
    </div>   
    </div>
    <div id="RiskPopUp" class="todotab_yellowbox4" style="padding-top:0px;display:none;">
		<div class="Applicationpage3">
			<div class="todotab_yellowbox4" id="RiskPopUpBody" style="float: left;"></div>
		</div>
	</div>
     </td>
   </tr>
	<tr>
		<td>
		&nbsp;<br/>
		
		</td>
	</tr>
 </table>
	
 <Script type="text/javascript">	 
 	
 	
 	
 	
    function enableTabs(){

    if(document.getElementById("Documentation_Row") != undefined){
    	document.getElementById("Documentation_Row").disabled = false;
    }
     if(document.getElementById("CoverageandLimits_Row") != undefined){
    	document.getElementById("CoverageandLimits_Row").disabled = false;
    }
    if(document.getElementById("PolicyInformation_Row") != undefined ){
    	document.getElementById("PolicyInformation_Row").disabled = false;
    }
  	if(document.getElementById("PolicyExclusions_Row") != undefined){
 		document.getElementById("PolicyExclusions_Row").disabled = false;
 	}
 	if(document.getElementById("ClassHazards_Row") != undefined){
 		document.getElementById("ClassHazards_Row").disabled = false;
 	}
 	if(document.getElementById("ClassBenefits_Row") != undefined){
 		document.getElementById("ClassBenefits_Row").disabled = false;
 	}
 	if(document.getElementById("ClassBenefits_Row") != undefined){
 		document.getElementById("ClassBenefits_Row").disabled = false;
 	}
 	if(document.getElementById("AircraftSchedule")!=undefined){
    	document.getElementById("AircraftSchedule").disabled = false;
    }
 		document.body.style.cursor = "default";
    }
    
    function LoadNewQuoteWorksheet(TabId){
    		activateTabs(TabId);
			document.getElementById("CovLimitsDiv").style.display = "block";
			document.getElementById("CovLimitsDiv").innerHTML= "";
			document.getElementById("DocumentDiv").style.display = 'none';
			document.getElementById("PolicyInformationDiv").style.display="none";
			document.getElementById("ClassListDiv").style.display="none";
			document.getElementById("RiskPopUp").style.display = "none";
			var parentQuoteId = document.getElementById("parentQuoteId").value;
	        var submissionStatus="";
	        var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
	        var customerId = document.getElementById("customerId").value;
	        var ownerId = document.getElementById("ownerId").value;
		 	var subQuoteId = document.getElementById("subQuoteId11").value;
	        var pars = 'answer(QuoteId)='+parentQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(OwnerId)='+ownerId+'&answer(Object::UWWorkSheet::ParentQuoteId)='+subQuoteId+'&answer(subQuoteId)='+subQuoteId;
	       // var anotherDataSource = new YAHOO.util.DataSource("../GetQuoteClassTabContent.do?"+pars);
			new Ajax.Request("../GetUWWorkSheetAction.do?"+pars, 
		 	{method: 'post',
				asynchronous:true,
				onFailure:function(){},
				onException:function(){},
				onComplete:function(transport){
			 	document.getElementById("CovLimitsDiv").style.display = "block";
			 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
			 	document.getElementById("PolicyInformationDiv").style.display="none";
			 	showReasonsText();
			 	showHideMinimumPremium();
				 enableTabs();
			 	},onSuccess: function(transport){	
			 	document.getElementById("CovLimitsDiv").style.display = "block";
			 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
			 	document.getElementById("DocumentDiv").style.display = 'none';
			 	document.getElementById("PolicyInformationDiv").style.display="none";
			 	showReasonsText();
			 	showHideMinimumPremium();
			 	}
			 	}
			
		);
    }
 	function LoadNewQuoteCoverageandLimits(TabId){
 		activateTabs(TabId);
 		disblePolicyTabs(TabId);
 		tabLoad="CoverageandLimits";
 		document.getElementById("CovLimitsDiv").style.display = "none";
 		document.getElementById("DocumentDiv").style.display = 'none';
 		document.getElementById("ClassListDiv").style.display="none";
 		document.getElementById("PolicyInformationDiv").style.display="none";
 		document.getElementById("RiskPopUp").style.display = "none";
 		var parentQuoteId = document.getElementById("parentQuoteId").value;
	 	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
	 	var subQuoteId = document.getElementById("subQuoteId11").value;
	 	var customerId = document.getElementById("customerId").value;
	 	var agencyId = document.getElementById("agencyId").value;
	 	var ownerId = document.getElementById("ownerId").value;
	 	var userId = document.getElementById("userId").value;
	 	var subQuoteProductId = document.getElementById("subQuoteProductId1").value;
	 	var prodId = document.getElementById("prodId").value;
	 	var ProductVerId = document.getElementById("ProductVerId").value;
	 	var GroupId = document.getElementById("GroupId").value;
	 	var GroupVerId = document.getElementById("GroupVerId").value;
	 	var productStatus = document.getElementById("productStatus").value;
	 	var subQuoteVerId = document.getElementById("subQuoteVerId").value;
	 	var isOptionsDisabled = document.getElementById("IsOptionDisabled").value;
	 	var custState = document.getElementById("custState").value;
	 	var planState = document.getElementById("planState").value;
	 	var pars = 'answer(System::flag::requiredMultiSubmissionCheck)=&changePlan=yes&answer(Object::Risk::Teritory)=0&answer(parentQuoteId)='+parentQuoteId+'&answer(Object::Quote::ProductId)='+prodId+'&answer(Object::Quote::ProductVerId)='+ProductVerId+
	 	'&answer(parentQuoteVerId)='+parentQuoteVerId+'&answer(Object::Agency::AgencyId)='+agencyId+
	 	'&answer(IsOptionDisabled)='+isOptionsDisabled+'&answer(QuoteId)='+subQuoteId+'&answer(subQuoteId)='+subQuoteId+
	 	'&answer(Object::Customer::CustomerId)='+customerId+'&answer(Object::Agency::AgencyId)='+agencyId+
	 	'&answer(ownerId)='+ownerId+'&answer(userId)='+userId+'&answer(Plan::PlanNumber)='+subQuoteId+
	 	'&answer(Object::Quote::ProductId)='+subQuoteProductId+'&answer(Option::DefaultValue)=No&answer(ProductId)='+prodId+
	 	'&answer(ProductVerId)='+ProductVerId+'&answer(prdGroupId)='+GroupId+'&answer(prdGroupVerId)='+GroupVerId+
	 	'&answer(productStatus)='+productStatus+'&answer(subQuoteVerId)='+subQuoteVerId+'&answer(customerId)='+customerId+
	 	'&answer(Object::Plan::StateCode)='+planState+'&answer(isUpdated)=Y&answer(Object::Quote::PrevSubQuoteVerId)='+subQuoteVerId;
	 	
	 	var url = '../PlanChangeBTA.do?'+pars;
	 	autologout();
	 	new Ajax.Request(url, 
		 	{method: 'post',
				asynchronous:true,
				onFailure:function(){},
				onException:function(){},
				onComplete:function(transport){
			 	document.getElementById("CovLimitsDiv").style.display = "block";
			 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
			 	document.getElementById("PolicyInformationDiv").style.display="none";
				 enableTabs();
				 enablePolicyTabs();
			 	},onSuccess: function(transport){	
			 		if(tabLoad=="CoverageandLimits"){
					 	document.getElementById("CovLimitsDiv").style.display = "block";
					 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
					 	document.getElementById("DocumentDiv").style.display = 'none';
					 	document.getElementById("PolicyInformationDiv").style.display="none";
			 		}
			 	}
			}
		);
 	
 			
 	
 	}
 
    function LoadNewQuoteScheduleofForms(TabId){
    activateTabs(TabId);
    disblePolicyTabs(TabId);
    tabLoad="ScheduleofForms";
    document.getElementById("ClassListDiv").style.display="none";
    document.getElementById("RiskPopUp").style.display = "none";
    document.getElementById("DocumentDiv").style.display = 'none';
    document.getElementById("CovLimitsDiv").style.display = "none";
	document.getElementById("PolicyInformationDiv").style.display="none";
	var subQuoteId    = document.getElementById("subQuoteId11").value;
    var productVerId  = document.getElementById("ProductVerId").value;
    var planState = document.getElementById("planState").value;
    var prodId = document.getElementById("prodId").value;
    var parentQuoteId = document.getElementById("parentQuoteId").value;
    var subQuoteVerId = document.getElementById("subQuoteVerId").value;    
    var ownerId = document.getElementById("ownerId").value;
    var custId = document.getElementById("customerId").value;
    var GroupId = document.getElementById("GroupId").value;
    var GroupVerId = document.getElementById("GroupVerId").value;
    var productStatus = document.getElementById("productStatus").value;
    var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
    var paretQuoteStatus = document.getElementById("paretQuoteStatus").value;
    var userId = document.getElementById("userId").value;
    var Quote = document.getElementById("Quote").value;
    var QuoteManagement = document.getElementById("QuoteManagement").value;
    var QuoteId = document.getElementById("QuoteId").value;
    var pars ='answer(activateTabId)='+TabId+'&requestType=&answer(DocumentType)=ISSUANCE&answer(DocumentTypeHidden)=PROPOSAL&answer(Object::Quote::ProductId)='+prodId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(subQuoteId)='+subQuoteId+'&answer(subQuoteVerId)='+subQuoteVerId+'&answer(OwnerId)='+ownerId+'&answer(ProductVerId)='+productVerId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(customerId)='+custId+'&answer(ProductId)='+prodId+'&answer(prdGroupId)='+GroupId+'&answer(prdGroupVerId)='+GroupVerId+'&answer(productStatus)='+productStatus+'&answer(Object::Quote::QuoteVerId)='+parentQuoteVerId+'&answer(State)='+planState+'&answer(isUpdated)='+"Y"+'&answer(Object::Activity::ActivityType)='+QuoteManagement+'&answer(Object::Activity::ObjectType)='+Quote+'&answer(Object::Activity::CreatedBy)='+userId+'&answer(Object::Quote::QuoteStatus)='+paretQuoteStatus+'&answer(Object::Activity::OwnerId)='+ownerId+'&answer(QuoteId)='+QuoteId;
    	var url = '../GetDocumentListBTA_in_ScheduleofFormsTab.do?'+pars;	
    	var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab&answer(activateTabId)='+TabId;
     	autologout();
     	new Ajax.Request(url, {method: 'post',parameters:pars2,asynchronous:true,onFailure:function(){},onException:function(){},onComplete:function(transport){
		 		 enableTabs();
		 		 enablePolicyTabs();
		 		 document.getElementById("CovLimitsDiv").style.display = "block";
		 		 document.getElementById("PolicyInformationDiv").style.display="none";
		 		 
		 	},onSuccess: function(transport){	
				if(tabLoad=="ScheduleofForms"){
				 	document.getElementById("CovLimitsDiv").innerHTML = "";		 	
				 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
				 	document.getElementById("DocumentDiv").style.display = 'none';
				 	document.getElementById("PolicyInformationDiv").style.display="none";
		 		}
		 	}
		}
	);
	}
    
 	function LoadNewQuotePolicyDefinitionTab(TabId){
 		disblePolicyInnerTabs(TabId);
	 	activateInnerTabs('Pol_Definition_Row');
	 	tabLoad="PolicyDefinition";
	 	var locationListArraySize = 0;	 	
	 	document.getElementById("ClassListDiv").style.display="none";
	 	document.getElementById("CovLimitsDiv").style.display="none";
	 	var parentQuoteId    = document.getElementById("parentQuoteId").value;	
		var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;	
		var subQuoteId    = document.getElementById("subQuoteId11").value;	
		var productVerId  = document.getElementById("ProductVerId").value;	
		var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
		var appEnabled = "";
		if(IsApplicationDisabled == 'N'){
			appEnabled = 'Y';
		}else{
			appEnabled = "N";	
		}
		var agencyId = document.getElementById("agencyId").value;	
		var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
		var FamilyId = document.getElementById("ProductFamilyId").value;
	 	var ownerId = document.getElementById("ownerId").value;
		var custId = document.getElementById("customerId").value;
	 	var subQuoteVerId = document.getElementById("subQuoteVerId").value;
	 	var quoteStartDate = document.getElementById("txtDate").value;
	 	
	 	var pars = 'answer(DisplayValue_Object::Quote::PolicyInformation::PremiumDueDate)='+quoteStartDate+'&answer(ApplicationName)=Policy Definition&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=POLICYINFORMATION&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplicationQuoteSummary3.0.go?&answer(activateTabId)='+TabId+'&answer(isApplicationEnabled)='+appEnabled+
	 				'&answer(SubQuoteVerId)='+subQuoteVerId+'&answer(Object::Application::ApplicationId__DMS_PROP_QUOTE_VER_ADD_POLICY_INFORMATION~APPLICATION_ID)=202&answer(Object::Application::ApplicationVerId__DMS_PROP_QUOTE_VER_ADD_POLICY_INFORMATION~APPLICATION_VER_ID)=228&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=Quote_POLICY_INFORMATION&answer(objectType)=PolicyDefenition&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
	 				'&answer(riskType)=Class&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId;
	 				
	 	var url = '../DisplayApplication3.0.do?'+pars;	
	    
	    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
	     autologout();
		 new Ajax.Request(url, 
		 	{method: 'post',parameters:pars2,
				asynchronous:true,
				onFailure:function(){},
				onException:function(){},
				onComplete:function(transport){
			 		 enableTabs();
			 		 enablePolicyInnerTabs();
			 		document.getElementById("Policy Information").className = "todotab_yellowbox2";
			 		 document.getElementById("CovLimitsDiv").style.display = "block";			 		
			 	},onSuccess: function(transport){
			 		if(tabLoad=="PolicyDefinition"){	
					 	document.getElementById("DocumentDiv").style.display="none";
					 	document.getElementById("CovLimitsDiv").style.display="block";
					 	document.getElementById("CovLimitsDiv").innerHTML = "";			 	
					 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
					 	document.getElementById("Documentation_Row").className = "todotab_inactive";
					 	document.getElementById("PolicyInformation_Row").className = "todotab_active";	
					 	document.getElementById("RiskPopUp").style.display = "none";		
					 	document.getElementById("submitButton").className="covsmallbutton"; 
			 		}
			 	}
			}
		);
	}
	
	function LoadNewQuotePolicyHazardsTab(TabId){
 	activateInnerTabs('Pol_Hazards_Row');
 	activateTabs('PolicyInformation_Row');
 	tabLoad="PolicyHazards";
 	disblePolicyInnerTabs(TabId);
 	var locationListArraySize = 0;	 	
 	document.getElementById("ClassListDiv").style.display="none";
 	document.getElementById("CovLimitsDiv").style.display="none";
 	var parentQuoteId    = document.getElementById("parentQuoteId").value;

	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

	var subQuoteId    = document.getElementById("subQuoteId11").value;

	var productVerId  = document.getElementById("ProductVerId").value;

	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
	}else{
		appEnabled = "N";	
	}
	var agencyId = document.getElementById("agencyId").value;

	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	var FamilyId = document.getElementById("ProductFamilyId").value;
 	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("customerId").value;
 	var subQuoteVerId = document.getElementById("subQuoteVerId").value;
 	var actName = "/saveQuoteHazardsApplication.go?";
 	var pars = 'answer(ApplicationName)=Policy hazards&answer(actionName)='+actName+'&answer(customerId)='+custId+'&answer(productVerId)='+productVerId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=HAZARDS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplicationQuoteSummary3.0.go?&answer(activateTabId)='+TabId+'&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(SubQuoteVerId)='+subQuoteVerId+'&answer(Object::Application::ApplicationId__DMS_PROP_QUOTE_VER_ADD_HAZARDS~APPLICATION_ID)=252&answer(Object::Application::ApplicationVerId__DMS_PROP_QUOTE_VER_ADD_HAZARDS~APPLICATION_VER_ID)=278&answer(riskTerritory)=&answer(State)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(riskType)=Class&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId;
 				
 				var url = '../DisplayApplication3.0.do?'+pars;	
    
    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';

     autologout();
     	new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
			if(tabLoad=="PolicyHazards"){
			 	document.getElementById("CovLimitsDiv").style.display = "block";		 	
			 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
			 	if(document.getElementById("submitButton")!=null && document.getElementById("submitButton")!=undefined){
			 		document.getElementById("submitButton").value ="Save";	
			 		document.getElementById("submitButton").className="covsmallbutton";
			 	}	 		 				 	
			 	document.getElementById("DocumentDiv").style.display = "none";
			 	document.getElementById("Hazards").className = "todotab_yellowbox2";			 	
			 	
			 	
			 }
			 
		 	enablePolicyInnerTabs();
		 	}
		}
	);
	document.body.style.cursor = "default" ;
	}
	
	function LoadNewQuotePolicyBenefitsTab(TabId){
	disblePolicyInnerTabs(TabId);
	tabLoad="PolicyBenefits";
	document.body.style.cursor = "wait" ;
 	activateInnerTabs('Pol_Benefits_Row');
 	var locationListArraySize = 0;	 	
 	document.getElementById("ClassListDiv").style.display="none";
 	document.getElementById("CovLimitsDiv").style.display="none";
 	var parentQuoteId    = document.getElementById("parentQuoteId").value;

	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

	var subQuoteId    = document.getElementById("subQuoteId11").value;

	var productVerId  = document.getElementById("ProductVerId").value;

	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
	}else{
		appEnabled = "N";	
	}
	var agencyId = document.getElementById("agencyId").value;

	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	var FamilyId = document.getElementById("ProductFamilyId").value;
 	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("customerId").value;
 	var subQuoteVerId = document.getElementById("subQuoteVerId").value;
 
 	var pars = 'answer(ApplicationName)=Policy Benefits&answer(Object::Quote::ApplicationId)=262&answer(Object::Quote::ApplicationVerId)=288&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=BENEFITS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplicationQuoteSummary3.0.go?&answer(activateTabId)='+TabId+'&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(SubQuoteVerId)='+subQuoteVerId+'&answer(Object::Quote::ApplicationId__DMS_PROP_QUOTE_VER_ADD_BENEFITS~APPLICATION_ID)=262&answer(Object::Quote::ApplicationVerId__DMS_PROP_QUOTE_VER_ADD_BENEFITS~APPLICATION_VER_ID)=288&answer(riskTerritory)=&answer(State)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=POLICY_BENEFITS&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(riskType)=Class&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+
 				'&answer(DisplayValue_Object::Quote::ApplicationId)=262&answer(DisplayValue_Object::Quote::ApplicationVerId)=288';

 				var url = '../DisplayApplication3.0.do?'+pars;	
    
    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
     autologout();
     	new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
			if(tabLoad == "PolicyBenefits"){
		 		document.getElementById("CovLimitsDiv").style.display = "block";		 	
		 		document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;		 	
		 		document.getElementById("DocumentDiv").style.display = "none";
		 		document.getElementById("Documentation_Row").className = "todotab_inactive";
		 		document.getElementById("PolicyInformation_Row").className = "todotab_active";
		 		document.getElementById("Benefits").className = "todotab_yellowbox2";
		 		if(document.getElementById("submitButton")!=null && document.getElementById("submitButton")!=undefined){			 		
			 		document.getElementById("submitButton").className="covsmallbutton";
			 	}
			}
			enablePolicyInnerTabs();		
		 	}
		}
	);
	document.body.style.cursor = "default" ;
	}
	
	function LoadNewQuotePolicyInformationTab(TabId){
		activateTabs(TabId);
		disblePolicyTabs(TabId);
		document.getElementById("CovLimitsDiv").style.display="none";
		document.getElementById("ClassListDiv").style.display="none";
		document.getElementById("DocumentDiv").style.display="none";
		LoadNewQuotePolicyDefinitionTab('Pol_Definition_Row');
		enablePolicyTabs();
	}
	
	 function activateTabs(TabId){	
		  if(document.getElementById("Documentation_Row") != undefined){
	    	//document.getElementById("Documentation_Row").disabled = true;
	    	document.getElementById("Documentation_Row").className = "todotab_inactive";
	   	  }
	      if(document.getElementById("CoverageandLimits_Row") != undefined){    	
	    	//document.getElementById("CoverageandLimits_Row").disabled = true;
	    	document.getElementById("CoverageandLimits_Row").className = "todotab_inactive";
	   	  }
	      if(document.getElementById("PolicyInformation_Row") != undefined){
	    	//document.getElementById("PolicyInformation_Row").disabled = true;
	    	document.getElementById("PolicyInformation_Row").className = "todotab_inactive";
	   	  }
	      if(document.getElementById("PolicyExclusions_Row") != undefined){
	    	//document.getElementById("PolicyExclusions_Row").disabled = true;
	    	document.getElementById("PolicyExclusions_Row").className = "todotab_inactive";
	      }
	      if(document.getElementById("ClassHazards_Row") != undefined){
	    	//document.getElementById("ClassHazards_Row").disabled = true;
	    	document.getElementById("ClassHazards_Row").className = "todotab_inactive";
	   	  }
	      if(document.getElementById("ClassBenefits_Row") != undefined){
	    	//document.getElementById("ClassBenefits_Row").disabled = true;
	    	document.getElementById("ClassBenefits_Row").className = "todotab_inactive";
	   	  }
	      if(document.getElementById("AircraftSchedule")!=undefined){
	    	//document.getElementById("AircraftSchedule").disabled = true;
	    	document.getElementById("AircraftSchedule").className = "todotab_inactive";
	   	  }
	      if(document.getElementById("ScheduleOfForms_Row")!=undefined){
	    	//document.getElementById("ScheduleOfForms_Row").disabled = true;
	    	document.getElementById("ScheduleOfForms_Row").className = "todotab_inactive";
	      }
	      if(document.getElementById("Worksheet")!=undefined){
	    	//document.getElementById("Worksheet").disabled = true;
	    	document.getElementById("Worksheet").className = "todotab_inactive";
	      }
		  if(document.getElementById(TabId)!=undefined){
		 	document.getElementById(TabId).disabled = false;
		 	document.getElementById(TabId).className = "todotab_active";
		  }
	 }
	 
	 function activateInnerTabs(TabId){
 		document.getElementById('PolicyInformationDiv').style.display="block";
		if(document.getElementById("Pol_Definition_Row") != undefined){
	    	//document.getElementById("Pol_Definition_Row").disabled = true;
	    	document.getElementById("Pol_Definition_Row").className = "todotab_inactive";
    	}
   	 	if(document.getElementById("Pol_Hazards_Row") != undefined){
	    	//document.getElementById("Pol_Hazards_Row").disabled = true;
	    	document.getElementById("Pol_Hazards_Row").className = "todotab_inactive";
    	}    	
   		if(document.getElementById("Pol_Benefits_Row") != undefined){
	    	//document.getElementById("Pol_Benefits_Row").disabled = true;
	    	document.getElementById("Pol_Benefits_Row").className = "todotab_inactive";
    	}
   		if(document.getElementById(TabId)!=undefined){
   			document.getElementById(TabId).disabled = false;
	 		document.getElementById(TabId).className = "todotab_active";
		}
	 }
	 
	
 </Script>
 
  <%  String openTabs = "";%>
	

	<%if(request.getParameter("answer(activateTabId)")!=null){
	 openTabs = ""+request.getParameter("answer(activateTabId)");
	}	
	if(openTabs.equals("PolicyInformation_Row")){%>
		<script type="text/javascript">
			LoadNewQuotePolicyInformationTab('PolicyInformation_Row');			
		</script>
	<%}else if(openTabs.equals("PolicyExclusions_Row")){%>
		<script type="text/javascript">
			LoadNewQuotePolicyExclusions('PolicyExclusions_Row');
		</script>
	<%}else if(openTabs.equals("ClassHazards_Row")){%>
		<script type="text/javascript">
			LoadClassList('ClassHazards_Row');
			<%if(classBenefitsTab_ClassTab_req.equals("true")){%>
				loadAllClassList('ClassHazards_Row');
				getClassList_recalculate(<%=""+classId_req%>,'<%=""+className_req%>',<%=""+hazardId_req%>,'<%=""+hazardsName_req%>');
			<%}%>
			<%if(deleteClass_req.equals("true")){%>
				loadAllClassList('ClassHazards_Row');
			<%}%>
		</script>
	<%}else if(openTabs.equals("ClassBenefits_Row")){%>
		<script type="text/javascript">
			LoadClassBenefitsList('ClassBenefits_Row');
		</script>
	<%}else if(openTabs.equals("CoverageandLimits_Row")){%>		
		<logic:present name="OPTIONS_HTML" scope="request">
			<!-- To Load Coverage and Limits Tab Content when the "OPTIONS_HTML" Request Present -->	 
			<div id="coveragesAndLimitsTabDivId" style="display:none">
			 <jsp:include page="../quote/PlanOptionCriteriaBTAContent.jsp" />
			</div>
			<script type="text/javascript">
			document.getElementById("CovLimitsDiv").style.display = "block";
		 	document.getElementById("DocumentDiv").style.display = 'none';
		 	document.getElementById("PolicyInformationDiv").style.display="none";
			document.getElementById("CovLimitsDiv").innerHTML = document.getElementById("coveragesAndLimitsTabDivId").innerHTML;
			activateTabs('CoverageandLimits_Row');
	 		disblePolicyTabs('CoverageandLimits_Row');
			enableTabs();
			enablePolicyTabs();
			</script>
		</logic:present>
		<logic:notPresent name="OPTIONS_HTML" scope="request">
			<script type="text/javascript">
			LoadNewQuoteCoverageandLimits('CoverageandLimits_Row');
			</script>
		</logic:notPresent>		
	<%}else if(openTabs.equals("ScheduleOfForms_Row")){%>
		<script type="text/javascript">
			LoadNewQuoteScheduleofForms('ScheduleOfForms_Row');
		</script>
	<%}else if(openTabs.equals("Pol_Definition_Row")){%>
		<script type="text/javascript">
			LoadNewQuotePolicyDefinitionTab('Pol_Definition_Row');
		</script>
	<%}else if(openTabs.equals("Pol_Hazards_Row")){%>
		<script type="text/javascript">
			LoadNewQuotePolicyHazardsTab('Pol_Hazards_Row');
		</script>
	<%}else if(openTabs.equals("Pol_Benefits_Row")){%>
		<script type="text/javascript">
			LoadNewQuotePolicyBenefitsTab('Pol_Benefits_Row');
		</script>
	<%}else if(openTabs.equals("Worksheet")){%>
		<script type="text/javascript">
			LoadNewQuoteWorksheet('Worksheet');
		</script>
	<%}else if(openTabs.equals("Documentation_Row")){%>
		<script type="text/javascript">
			LoadDocumentationTab('Documentation_Row');
		</script>	
	<%}else if(openTabs.equals("AircraftSchedule")){%>
		<script type="text/javascript">
			LoadNewQuoteAircraftSchedule('AircraftSchedule');
		</script>	
	<%}else{ %>
		<script type="text/javascript">
			LoadDocumentationTab('Documentation_Row');
		</script>	
	
	<%} %>
<script type="text/javascript">

var iframe = document.getElementById("upload_target_iFrame");
if (iframe.addEventListener) {
  iframe.addEventListener("load", hideAttachPopup, false);  // firefox
} else if (iframe.attachEvent) {
  iframe.attachEvent("onload", hideAttachPopup);  // IE
}
</script>

<script>
function validateTextAreaElement(frm){	
	if(frm.ClassDescription !=undefined){
	if((frm.ClassDescription.value=="") && (frm.ClassDescription.type=="textarea") && (frm.ClassDescription !=undefined)) {
		var ele =frm.ClassDescription;
		ele.style.background='#FFCC33';
		ele.focus();		
		alert("Please enter Description ")
		return false;	
	}
}
if(frm.Description !=undefined){
	if((frm.Description.value=="") && (frm.Description.type=="textarea") && (frm.Description !=undefined)) {
		var ele =frm.Description;
		ele.style.background='#FFCC33';
		ele.focus();		
		alert("Please enter Description ")
		return false;	
	}
}
return true;
}

function doSpecificValidation(frm){

if(frm.name=='PolicyInformation'){
	var vardate = document.getElementById("PremiumDueDate").value;
    var dmonth = parseInt(vardate.substring(0, 2), 10);
	var dday = parseInt(vardate.substring(3, 5), 10);
	var dyear = parseInt(vardate.substring(6, 10), 10);	
	if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || dyear<1000 || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
	{
		alert("Please enter Premium due date in 'MM/DD/YYYY' format");
		return false;
		document.getElementById("PremiumDueDate").select();
		document.getElementById("CaledarFeild_PremiumDueDate").focus();
	}
}	
	if(frm.name =='PolicyExclusion') {			
			if((document.getElementById('PreExistingConditions') != null) && (document.getElementById('PreExistingConditions') != undefined)) {
				if(!frm.PreExistingConditions[0].checked && !frm.PreExistingConditions[1].checked) { 
					alert('Please enter the PreExisting Conditions'); 
					return false; 
				}
			}
			if((document.getElementById('PregnancyAbortion') != null) && (document.getElementById('PregnancyAbortion') != undefined)) {
				if(!frm.PregnancyAbortion[0].checked && !frm.PregnancyAbortion[1].checked) { 
					alert('Please enter the Pregnancy Abortion'); 
					return false; 
				}
			}
			if((document.getElementById('MentalNervous') != null) && (document.getElementById('MentalNervous') != undefined)) {
				if(!frm.MentalNervous[0].checked && !frm.MentalNervous[1].checked) { 
					alert('Please enter the Mental and nervous disorders'); 
					return false; 
				}
			}
			if((document.getElementById('HomeCountry') != null) && (document.getElementById('HomeCountry') != undefined)) {
				if(!frm.HomeCountry[0].checked && !frm.HomeCountry[1].checked) { 
					alert('Please enter the services or supplies received by the Covered Person in Home Country'); 
					return false; 
				}
			}
			if((document.getElementById('MentalPsychological') != null) && (document.getElementById('MentalPsychological') != undefined)) {
				if(!frm.MentalPsychological[0].checked && !frm.MentalPsychological[1].checked) { 
					alert('Please enter the Mental disorder or psychological or psychiatric care or treatment'); 
					return false; 
				}
			}
			if((document.getElementById('SicknessWorkersCompensation') != null) && (document.getElementById('SicknessWorkersCompensation') != undefined)) {
				if(!frm.SicknessWorkersCompensation[0].checked && !frm.SicknessWorkersCompensation[1].checked) { 
					alert('Please enter the Injury or Sickness covered by Workers Compensation'); 
					return false; 
				}
			}
			if((document.getElementById('BenefitsWorkersCompensation') != null) && (document.getElementById('BenefitsWorkersCompensation') != undefined)) {
				if(!frm.BenefitsWorkersCompensation[0].checked && !frm.BenefitsWorkersCompensation[1].checked) { 
					alert('Please enter the condition for which the Covered Person is entitled to benefits under any Workers Compensation Act'); 
					return false; 
				}
			}
		}		
	return true;
}
</script>

<script type="text/javascript">
   		if(document.getElementById("paretQuoteStatus").value=="In Progress"){	
   			Ext.onReady(function(){
   				 var txtDate = document.getElementById('txtDate').value;		
   				 Ext.getCmp('policyAnniversaryDate').setValue(txtDate);
   				 var expDate = document.getElementById('ExpDate').value;		
   				 Ext.getCmp('policyExpirationDate').setValue(expDate);
				   				
   				var blurHandlerAnniversaryDate = function() {        				
   					 var effDate1 = Ext.getCmp('policyAnniversaryDate').getValue(); 
   					 var effDate2 = Ext.getCmp('policyAnniversaryDate').getValue();
   					var vardate = document.getElementById("policyAnniversaryDate").value;

   					var expiryDate = document.getElementById("policyExpirationDate").value;
   					
   					var ddate = new Date(vardate);	
   					
   					var expiryDate1 = new Date(expiryDate);	
   					
   					if(!isDate(vardate)){
   						alert("Invalid Effective Date")
   						document.getElementById("txtDate").select();
   						return false;
   					}
   					
   					
   					if(!isDate(expiryDate)){
   						alert("Invalid Expiration Date")
   						document.getElementById("ExpDate").select();
   						return false;
   					}
   					if (vardate=="")
   					{
   						alert("Please enter the Effective Date");
   						//frm.txtDate.focus();
   						return false;
   					}
   					
   					
   					if (expiryDate=="")
   					{
   						alert("Please enter the Policy Expiration Date");
   						//frm.ExpDate.focus();
   						return false;
   					}
   					
   					
   					var dmonth = parseInt(vardate.substring(0, 2), 10);
   					var dday = parseInt(vardate.substring(3, 5), 10);
   					var dyear = parseInt(vardate.substring(6, 10), 10);
   					
   					var dmonthExpiryDate = parseInt(expiryDate.substring(0, 2), 10);
   					var ddayExpiryDate = parseInt(expiryDate.substring(3, 5), 10);
   					var dyearExpiryDate = parseInt(expiryDate.substring(6, 10), 10);

   					if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
   					{
   						alert("Please enter Effective date in 'MM/DD/YYYY' format");
   						document.getElementById("txtDate").select();
   						return false;
   					}
   					
   					
   					if (isNaN(dmonthExpiryDate) || dmonthExpiryDate < 1 || dmonthExpiryDate > 12 || isNaN(ddayExpiryDate) || ddayExpiryDate < 1 || ddayExpiryDate > 31 || isNaN(dyearExpiryDate) || expiryDate.substring(2, 3)!="/" || expiryDate.substring(5, 6)!="/")
   					{
   						alert("Please enter Expiration date in 'MM/DD/YYYY' format");
   						//frm.AnniversaryDate.select();
   						return false;
   					}

   					var reqDate = new Date("01/01/2005");

   					if (ddate < reqDate)
   					{
   					
   						alert("Effective Date cannot be prior to Jan 1, 2005");
   						document.getElementById("txtDate").select();
   						//frm.txtDate.focus();
   						return false;
   					}


   					if(expiryDate1 < ddate  ){
   						alert("Expiration Date is less than Effective date");
   						document.getElementById("txtDate").select();
   						//frm.txtDate.focus();
   						return false;
   					
   					}
   			   					 
   					 var MM1 = effDate1.getMonth()+1;
					 var DD1 = effDate1.getDate();
					 var YY1 = effDate1.getFullYear();
					 if(MM1<10){ MM1 = "0"+(MM1);}
					 if(DD1<10){ DD1 = "0"+DD1;}
					 Ext.getCmp('policyExpirationDate').setValue(MM1+'/'+DD1+'/'+YY1);		
					 document.getElementById("txtDate").value = MM1+'/'+DD1+'/'+YY1;
					 
					 var MM2 = effDate2.getMonth()+1;
					 var DD2 = effDate2.getDate();
					 var YY2 = effDate2.getFullYear()+1;
					 if(MM2<10){ MM2 = "0"+(MM2);}
					 if(DD2<10){ DD2 = "0"+DD2;}
					 Ext.getCmp('policyExpirationDate').setValue(MM2+'/'+DD2+'/'+YY2);
					 document.getElementById("ExpDate").value = MM2+'/'+DD2+'/'+YY2;					 		 
   				};      				
   				
   				var blurHandlerExpirationDate = function() { 					 
   					 var effDate2 = Ext.getCmp('policyAnniversaryDate').getValue();
   					 var expDate1 = Ext.getCmp('policyExpirationDate').getValue();  
   					var vardate = document.getElementById("policyAnniversaryDate").value;

   					var expiryDate = document.getElementById("policyExpirationDate").value;
   					
   					var ddate = new Date(vardate);	
   					
   					var expiryDate1 = new Date(expiryDate);	
   					
   					if(!isDate(vardate)){
   						alert("Invalid Effective Date")
   						document.getElementById("txtDate").select();
   						return false;
   					}
   					
   					
   					if(!isDate(expiryDate)){
   						alert("Invalid Expiration Date")
   						document.getElementById("ExpDate").select();
   						return false;
   					}
   					if (vardate=="")
   					{
   						alert("Please enter the Effective Date");
   						//frm.txtDate.focus();
   						return false;
   					}
   					
   					
   					if (expiryDate=="")
   					{
   						alert("Please enter the Policy Expiration Date");
   						//frm.ExpDate.focus();
   						return false;
   					}
   					
   					
   					var dmonth = parseInt(vardate.substring(0, 2), 10);
   					var dday = parseInt(vardate.substring(3, 5), 10);
   					var dyear = parseInt(vardate.substring(6, 10), 10);
   					
   					var dmonthExpiryDate = parseInt(expiryDate.substring(0, 2), 10);
   					var ddayExpiryDate = parseInt(expiryDate.substring(3, 5), 10);
   					var dyearExpiryDate = parseInt(expiryDate.substring(6, 10), 10);

   					if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
   					{
   						alert("Please enter Effective date in 'MM/DD/YYYY' format");
   						document.getElementById("txtDate").select();
   						return false;
   					}
   					
   					
   					if (isNaN(dmonthExpiryDate) || dmonthExpiryDate < 1 || dmonthExpiryDate > 12 || isNaN(ddayExpiryDate) || ddayExpiryDate < 1 || ddayExpiryDate > 31 || isNaN(dyearExpiryDate) || expiryDate.substring(2, 3)!="/" || expiryDate.substring(5, 6)!="/")
   					{
   						alert("Please enter Expiration date in 'MM/DD/YYYY' format");
   						//frm.AnniversaryDate.select();
   						return false;
   					}

   					var reqDate = new Date("01/01/2005");

   					if (ddate < reqDate)
   					{
   					
   						alert("Effective Date cannot be prior to Jan 1, 2005");
   						document.getElementById("txtDate").select();
   						//frm.txtDate.focus();
   						return false;
   					}


   					if(expiryDate1 < ddate  ){
   						alert("Expiration Date is less than Effective date");
   						document.getElementById("txtDate").select();
   						//frm.txtDate.focus();
   						return false;
   					
   					}
   					 var MM1 = expDate1.getMonth()+1;
					 var DD1 = expDate1.getDate();
					 var YY1 = expDate1.getFullYear();
					 
   					 var MM2 = effDate2.getMonth()+1;
					 var DD2 = effDate2.getDate();
					 var YY2 = effDate2.getFullYear();				 
					 
					 if(MM1<10){ MM1 = "0"+(MM1);}
					 if(DD1<10){ DD1 = "0"+DD1;}
					 Ext.getCmp('policyExpirationDate').setValue(MM1+'/'+DD1+'/'+YY1);
					 document.getElementById("ExpDate").value = MM1+'/'+DD1+'/'+YY1;					 
					 
					 if(MM2<10){ MM2 = "0"+(MM2);}
					 if(DD2<10){ DD2 = "0"+DD2;}
					 Ext.getCmp('policyAnniversaryDate').setValue(MM2+'/'+DD2+'/'+YY2);
					 document.getElementById("txtDate").value = MM2+'/'+DD2+'/'+YY2;
   				}; 
   										   							
   				Ext.EventManager.on('policyAnniversaryDate', 'blur', blurHandlerAnniversaryDate);   				  				
  				Ext.EventManager.on('policyExpirationDate', 'blur', blurHandlerExpirationDate);
  			});
  		}
</script>
			