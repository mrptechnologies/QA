<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">


	<head>
		<title>Liberty International Underwriters</title>

<link rel="stylesheet" type="text/css" href="../styles/ui3.0/style.css" />
<link rel="stylesheet" type="text/css" href="../styles/ui3.0/menu.css" />
<script type="text/javascript" src="./Scripts/ui3.0/menu.js"></script>

		<link rel="stylesheet" href="../styles/Styles.css" type="text/css">
		<!-- link rel="stylesheet" href="../styles/structure.css" type="text/css" -->
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/assets/dpSyntaxHighlighter.css">

<!--Script and CSS includes for YUI dependencies on this page-->

<!--Script and CSS includes for YUI dependencies on this page-->

<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/button/assets/skins/sam/button.css" />
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo/yahoo-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/event/event-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/dom/dom-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>
<SCRIPT SRC="../Scripts/JScripts/HomePanel.js" type="text/javascript"> </SCRIPT>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/button/button-min.js"></script>

<!--begin custom header content for this example-->

<style type="text/css">
.yui-navset button {
    position:absolute;
    top:0;
    right:0;
}
</style>

<!-- end of Tabs style definition -->

<!-- beging top nav menu -->

<!-- menu -->
        <meta http-equiv="content-type" content="text/html; charset=utf-8">

        <!-- Standard reset, fonts and grids -->

        <link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/reset-fonts-grids.css">


        <!-- CSS for Menu -->

        <link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/assets/skins/sam/menu.css">

        <!-- Dependency source files -->


        <script type="text/javascript" src="../Scripts/YUI/2.4.1/build/animation/animation-min.js"></script>
        <script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container_core-min.js"></script>

        <!-- Menu source file -->
        <script type="text/javascript" src="../Scripts/YUI/2.4.1/build/menu/menu-min.js"></script>

        <!-- Page-specific script for dropdown menu-->
		<script type="text/javascript" src="../Scripts/solartis_menu.js"></script>

<!-- end of menu -->


<!-- end of top nav menu -->
<!-- Ajax declarations -->

<script type="text/javascript">

	function loadPageScript(scriptFilename)
	 {
	  try {
	  alert("loading script="+scriptFilename);

	   Load (scriptFilename);
	  }catch(err) {
	   txt="There was an error on this page.\n\n";
	    txt+="Error description: " + err.description + "\n\n";
	    txt+="Click OK to continue.\n\n";
	    alert(txt);
	  }
	 }

	 function refreshAjaxTabPost(panel, url, form, jsFilename)
	 {
	  loadPageScript(jsFilename);
	  retVal = refreshTabPost(panel, url, form);
	  return retVal;
	 }

	 function refreshAjaxTabGet(panel, url, jsFilename)
	 {
	  loadPageScript(jsFilename);
	  retVal = refreshTabGet(panel, url);

	  return retVal;
	 }



	function refreshTabPost(panel, url, form)
	{
		setFocusTowTabView(panel);
		try {
			new Ajax.Updater(
				panel,
				url,
				{asynchronous:true, parameters:$(form).serialize(this)}
				);
		}catch(err) {
		 txt="There was an error on this page.\n\n";
		  txt+="Error description: " + err.description + "\n\n";
		  txt+="Click OK to continue.\n\n";
		  alert(txt);
		}
		return false;
	}

	function refreshTabGet(panel, url)
	{
		setFocusTowTabView(panel);
		try {
			new Ajax.Updater(
				panel,
				url,
				{
					method: "get",
					onComplete: function(){
						//Do something
					}
				}
			);
		}catch(err) {
		 txt="There was an error on this page.\n\n";
		  txt+="Error description: " + err.description + "\n\n";
		  txt+="Click OK to continue.\n\n";
		  alert(txt);
		}
	}

</script>
<!-- end of AJAX declarations -->




		<base href="https://127.0.0.1/clearance/CheckClearance1.jsp">

		<script type="text/javascript">
		 <!--
			 var submitcount = 0;
			 function checksubmitcount()
			 {
			 	submitcount++;
			 	if (1 == submitcount )
			 	{
			 		document.forms[0].submit();
			 	}else
				 {
					return false;
				 }
			 }
			function newchecksubmitcount()
			 {
				submitcount++;
			 	if (1 == submitcount )
			 	{
			 		return true;
			 	}else
				 {
					return false;
				 }
			 }
			 //

			 var form_submitted = false;
			 function submit_form ( )
			 {
			   if ( form_submitted )
			   {
			     return false;
			   }
			   else
			   {
			     form_submitted = true;
			     return true;
			   }
			 }


		 -->
		 </script>
	</head>
				

	
	<body onresize="adjustPageWidth()" onload="{setTabFocus('Submission_Panel');adjustPageWidth();}">

<div class="container">

<div class="head">
<div class="clientlogo left">Liberty International Underwriters</div>
<h1 class="formlogo left">Storage Tank Policy Quote System</h1>
<div class="signin right">
<b>Signed in as:</b> Jane Doe
<a href="Servlet?dms_id=d926b4b5f29e188f1ceb2d951587dd77">My Account</a><a href="Servlet?dms_id=d926b4b5f29e188f1ceb2d951587dd77">Logout</a>
</div>
</div>

<div class="nav">
<ul>
<li><a href="Servlet?dms_id=d926b4b5f29e188f1ceb2d951587dd77">To Do List</a></li>
<li><a href="Servlet?dms_id=d926b4b5f29e188f1ceb2d951587dd77" class="anchorclass" rel="submenu1">Submissions</a></li>
<li><a href="Servlet?dms_id=d926b4b5f29e188f1ceb2d951587dd77" class="anchorclass" rel="submenu2">Quotes</a></li>
<li><a href="Servlet?dms_id=d926b4b5f29e188f1ceb2d951587dd77" class="anchorclass" rel="submenu3">Policies</a></li>
</ul>
</div>
<div id="submenu1" class="anylinkcss"><ul><li><a href="Servlet?dms_id=d926b4b5f29e188f1ceb2d951587dd77">New Submission</a></li><li><a href="Servlet?dms_id=d926b4b5f29e188f1ceb2d951587dd77">Find Submission</a></li></ul></div>
<div id="submenu2" class="anylinkcss"><ul><li><a href="Servlet?dms_id=d926b4b5f29e188f1ceb2d951587dd77">Find Quote</a></li></ul></div>
<div id="submenu3" class="anylinkcss"><ul><li><a href="Servlet?dms_id=d926b4b5f29e188f1ceb2d951587dd77">Find Policy</a></li></ul></div>
<div class="frame2">
<div class="frlabel left">
Submission Name:<br />
Submission:<br />
Created by:</div>
<div class="frinfo left">
My Submission Name<br />
abc12345<br />
username</div>
<div class="frlabel left">
Submission Status:<br />
Clearance Status:<br />
Last Updated by:
</div>
<div class="frinfo left">
In progress<br />
Cleared<br />
username
</div>
<div class="frlabel left">
Agency Name:<br />
Agent Name:<br />
Last Updated Date:</div>
<div class="frinfo left" style="border:none;">
ABC Insurance Solutions<br />
Name<br />
July 17, 2009
</div>
</div>

<div class="content">
<h2 class="newsub">New Submission</h2>

<div class="stages">
<div class="stage1 left">Agency</div>
<div class="stage2 left">Insured<br />Clearance</div>
<div class="stage3 left"><b>Insured Detail</b></div>
<div class="stage4 left">Coverage<br />and Limits</div>
<div class="stage5 left">General<br />Questions</div>
<div class="stage6 left">Locations<br />and Tanks</div>
</div>
<br class="clear" />
<div class="notice">Insured 'ABC Company' passed clearance.</div>

		<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0" style="height: 100%">


			<!-- Implementation for customisation of  company based logo, title and owner id stats -->

			
			
				

			
			<tr>
				<td width="200px" align="left" height="1%"  valign="left"><IMG SRC="../Images/liu.jpg" ></td>
			</tr>
			

			<!-- Implementation for customisation of  company based logo, title and owner id end-->

			<tr>
				<td colspan="3" height="1px" bgcolor="#336699"></td>
			</tr>



			<tr>
				<td class="username" bgcolor="#336699" height="20px" align="right" colspan="3">
					Welcome
					
						
						

						

						
						

						

						
						 
						UW

						



						&nbsp;&nbsp;&nbsp;&nbsp;
					
				</td>
			</tr>


<tr>

<!-- Tabs Definition Begins here -->
<td valign="top" colspan="3" width="100%" id="yahoo-com" class="yui-skin-sam" bgcolor="#EDF5FF">
	<!-- Tabs Definition -->
	<div id="solartisTabs" class="yui-navset">


    <ul class="yui-nav">
     <li class="selected"><a href="Servlet?dms_id=a90fe29b423a1302c0b3fdee6faa607b"><em>Home</em></a></li>
      <li class="selected"><a href="Servlet?dms_id=20b260a6762641ed5e428458faa7961e"><em>Submission</em></a></li>
        	<li><a href="Servlet?dms_id=ef4af12e0fdd465c2d128011911cb094"><em>Insured</em></a></li>
        	
        	<li><a href="Servlet?dms_id=87426e934e21e99fac8e5864f5262a84"><em>Quote</em></a></li>
     	    <li><a href="Servlet?dms_id=1c3cd1979d7ceb13bdc0d5c8cd083b31"><em>Policy</em></a></li>
        	
        	<li><a href="Servlet?dms_id=da81907baf967e198a74265c2f67eb81"><em>Search</em></a></li>
        	<li><a href="Servlet?dms_id=af9d62182aadedf1f94d67b4a9cbd57d"><em>Manage</em></a></li>
    </ul>
    
    <div class="yui-content">

		<!-- Home Tab Definition -->
		<div id="home_tab">

        	<table width="100%" cellpadding="0" cellspacing="0" align="center" style="height: 100%" border="0">
				<tr class="yui-skin-sam" id="yahoo-com" >
					<td valign="top" class="yui-skin-sam" id="yahoo-com" width="100%" style="{border-left:1px solid #336699;}">

						<div id="Home_Panel">
						










<script type="text/javascript" >

        <!-- Page-specific script for dropdown menu-->

            /*
                 Initialize and render the MenuBar when its elements are ready
                 to be scripted.
            */

            YAHOO.util.Event.onContentReady("home_tab_menu", function () {

                var Dom = YAHOO.util.Dom,
                    oAnim;  // Animation instance


                /*
                     "beforeshow" event handler for each submenu of the MenuBar
                     instance, used to setup certain style properties before
                     the menu is animated.
                */

                function onSubmenuBeforeShow(p_sType, p_sArgs) {

                    var oBody,
                        oShadow,
                        oUL;


                    if (this.parent) {

                        /*
                             Get a reference to the Menu's shadow element and
                             set its "height" property to "0px" to syncronize
                             it with the height of the Menu instance.
                        */

                        oShadow = this.element.lastChild;
                        oShadow.style.height = "0px";


                        /*
                            Stop the Animation instance if it is currently
                            animating a Menu.
                        */

                        if (oAnim && oAnim.isAnimated()) {

                            oAnim.stop();
                            oAnim = null;

                        }


                        /*
                            Set the body element's "overflow" property to
                            "hidden" to clip the display of its negatively
                            positioned <ul> element.
                        */

                        oBody = this.body;


                        /*
                            There is a bug in gecko-based browsers where
                            an element whose "position" property is set to
                            "absolute" and "overflow" property is set to
                            "hidden" will not render at the correct width when
                            its offsetParent's "position" property is also
                            set to "absolute."  It is possible to work around
                            this bug by specifying a value for the width
                            property in addition to overflow.
                        */

                        if (this.parent &&
                            !(this.parent instanceof YAHOO.widget.MenuBarItem) &&
                            YAHOO.env.ua.gecko) {

                            Dom.setStyle(oBody, "width", (oBody.clientWidth + "px"));

                        }


                        Dom.setStyle(oBody, "overflow", "hidden");


                        /*
                            Set the <ul> element's "marginTop" property
                            to a negative value so that the Menu's height
                            collapses.
                        */

                        oUL = oBody.getElementsByTagName("ul")[0];

                        Dom.setStyle(oUL, "marginTop", ("-" + oUL.offsetHeight + "px"));

                    }

                }


                /*
                    "tween" event handler for the Anim instance, used to
                    syncronize the size and position of the Menu instance's
                    shadow and iframe shim (if it exists) with its
                    changing height.
                */

                function onTween(p_sType, p_aArgs, p_oShadow) {

                    if (this.cfg.getProperty("iframe")) {

                        this.syncIframe();

                    }

                    if (p_oShadow) {

                        p_oShadow.style.height = this.element.offsetHeight + "px";

                    }

                }


                /*
                    "complete" event handler for the Anim instance, used to
                    remove style properties that were animated so that the
                    Menu instance can be displayed at its final height.
                */

                function onAnimationComplete(p_sType, p_aArgs, p_oShadow) {

                    var oBody = this.body,
                        oUL = oBody.getElementsByTagName("ul")[0];

                    if (p_oShadow) {

                        p_oShadow.style.height = this.element.offsetHeight + "px";

                    }

                    Dom.setStyle(oUL, "marginTop", "");
                    Dom.setStyle(oBody, "overflow", "");


                    if (this.parent &&
                        !(this.parent instanceof YAHOO.widget.MenuBarItem) &&
                        YAHOO.env.ua.gecko) {

                        Dom.setStyle(oBody, "width", "");

                    }

                }


                /*
                     "show" event handler for each submenu of the MenuBar
                     instance - used to kick off the animation of the
                     <ul> element.
                */

                function onSubmenuShow(p_sType, p_sArgs) {

                    var oElement,
                        oShadow,
                        oUL;

                    if (this.parent) {

                        oElement = this.element;
                        oShadow = oElement.lastChild;
                        oUL = this.body.getElementsByTagName("ul")[0];


                        /*
                             Animate the <ul> element's "marginTop" style
                             property to a value of 0.
                        */

                        oAnim = new YAHOO.util.Anim(oUL,
                            { marginTop: { to: 0 } },
                            .5, YAHOO.util.Easing.easeOut);


                        oAnim.onStart.subscribe(function () {

                            oShadow.style.height = "100%";

                        });


                        oAnim.animate();


                        /*
                            Subscribe to the Anim instance's "tween" event for
                            IE to syncronize the size and position of a
                            submenu's shadow and iframe shim (if it exists)
                            with its changing height.
                        */

                        if (YAHOO.env.ua.ie) {

                            oShadow.style.height = oElement.offsetHeight + "px";


                            /*
                                Subscribe to the Anim instance's "tween"
                                event, passing a reference Menu's shadow
                                element and making the scope of the event
                                listener the Menu instance.
                            */

                            oAnim.onTween.subscribe(onTween, oShadow, this);

                        }


                        /*
                            Subscribe to the Anim instance's "complete" event,
                            passing a reference Menu's shadow element and making
                            the scope of the event listener the Menu instance.
                        */

                        oAnim.onComplete.subscribe(onAnimationComplete, oShadow, this);

                    }

                }
                /*
                     Instantiate a MenuBar:  The first argument passed to the
                     constructor is the id of the element in the page
                     representing the MenuBar; the second is an object literal
                     of configuration properties.
                */

                var oMenuBar = new YAHOO.widget.MenuBar("home_tab_menu", {
                                                            autosubmenudisplay: true,
                                                            hidedelay: 750,
                                                            lazyload: true });


                /*
                     Subscribe to the "beforeShow" and "show" events for
                     each submenu of the MenuBar instance.
                */

                oMenuBar.subscribe("beforeShow", onSubmenuBeforeShow);
                oMenuBar.subscribe("show", onSubmenuShow);
		oMenuBar.subscribe("click", onClick);

		// Define a handler for the "click" event
		 function onClick(p_sType, p_aArgs) {
			 var oEvent = p_aArgs[0],    // DOM Event
			oMenuItem = p_aArgs[1]; // YAHOO.widget.MenuItem instance


			 // Alert the type of the DOM event
//			 alert(oEvent.type);

			 // If a MenuItem was clicked, alert the value of its text label
			 if (oMenuItem) {
//				 alert(oMenuItem.cfg.getProperty("text") + "----abc");
//				 alert("menuItem-" + oMenuItem.cfg.getProperty("target"));

			 }
/*
			 alert("onClick: index: " + this.index +
						", text: " + //this.cfg.getProperty("text") +
						", value: " + p_oValue);
*/
			loadTable(oMenuItem.cfg.getProperty("target"));

		 }

		function loadTable(url) {
			var divObj = $('Home_Panel');
			new Ajax.Updater(
				"Home_Panel",
				url,
				{
				method: "get",
				onComplete: function(){
					//Do something
				}
				}
			);
		}

                /*
                     Call the "render" method with no arguments since the
                     markup for this MenuBar already exists in the page.
                */

                oMenuBar.render();

            }

            );


</script>

		<table>
			<tr>
				<td class="yui-skin-sam" id="yahoo-com">
		
					<!-- MENU start here -->
			   		<div id="home_tab_menu" class="yuimenubar yuimenubarnav">
						<div class="bd">
							<ul class="first-of-type">					
								<li class="yuimenubaritem"><a class="Servlet?dms_id=97b4884f17f7f80e3f270952ffd9f9fd" href="../LoginOutAction.do">Log Off</a></li>
							</ul>
						</div>	
						
					</div>
					<!-- MENU ends here -->	
				</td>
			</tr>
		</table>
						





<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/HomePanelStyles.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.7.0/build/datatable/assets/skins/sam/datatable.css" />


<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/datasource/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/datatable/datatable-min.js"></script>

<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/paginator/assets/skins/sam/paginator.css">      
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/paginator/paginator-min.js"></script>  


<table class="table_Home">
<tr><td>&nbsp;</td></tr>
<tr>
<td>
<DIV class=page_Home id=startPage>
	
	
		<!-- Start of Clearence Checks -->
		<DIV class="block_Home" id="blockClearance">
			<!-- inlcude the jsp required to show at the top left panel-->
			




<IMG class="arrowup_Home" id="arrowupClearance" onclick="switchContent('arrowdownClearance', 'inline', 'arrowupClearance', 'none', 'bodyClearance', 'inline');"
			src="../Images/ArrowRightHomePanel.gif" alt="Click Here to Show Clearance Requests">
<IMG class="arrowdown_Home" id="arrowdownClearance" onclick="switchContent('arrowdownClearance', 'none', 'arrowupClearance', 'inline', 'bodyClearance', 'none');"			
			src="../Images/ArrowDownHomePanel.gif" alt="Click Here to Hide Clearance Requests">
<DIV class="head_Home" id="headClearance">
	<SPAN class="subFirst_Home">clearance requests</SPAN>
	
</DIV>

<DIV class="body_Home" id="bodyClearance"  style="display: none;">
	<table class="new_table_CL">
		<TBODY>
			<TR>
				<TD class=rowicon_Home>
					<table>
						<tr>
							<td><SPAN  style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox" style="border: 0px" checked="checked" id="clAssignedChk" name="asdf" onclick="onRefCheckClick(this.form)"/>Assigned To You</SPAN></td>
							<td width="10%"></td>
							<td><SPAN  style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox"  style="border: 0px" checked="checked" id="clUnassignedChk" name="asdf" onclick="onRefCheckClick(this.form)"/>Un Assigned</SPAN></td>
							<td width="10%"></td>
							<td><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox" style="border: 0px" checked="checked" id="clOtherChk" name="asdf" onclick="onRefCheckClick(this.form)"/>Assigned To Others</SPAN></td>
							<td width="10%"></td>
							<td><SPAN  >&nbsp;&nbsp;&nbsp;Period :
								<select class="txtbox_Home" id="clearancePeriod">
									<option value="7">Last 7 Days</option>
									<option value="14">Last 14 Days</option>
									<option value="30">Last Month</option>
									<option value="0">Today</option>
									<option value="-1">All</option>
								</select></SPAN>
							</td>
						</tr>
					</table>
					<DIV class=divider_Home></DIV>
					<br>
					<DIV class="yuitable_Home" id="classigned" style="display:inline;"></DIV>
					<br>
				</TD>
			</TR>
		</TBODY>
	</table>						
</DIV>
<DIV class=divider_Home></DIV>
<DIV class=clear_Home></DIV>


<script type="text/javascript" >
YAHOO.util.Event.addListener(clearancePeriod, "change", function() {
loadClearanceReq();
});
YAHOO.util.Event.addListener(arrowupClearance, "click", function() {
loadClearanceReq();
});

function loadClearanceReq(){
    YAHOO.example.XHR_Text = function() {
    	
    	// var myConfigs = { paginator : new YAHOO.widget.Paginator({rowsPerPage : 10  })	};   
    	    
         var formatUrl = function(elCell, oRecord, oColumn, sData) {        
             elCell.innerHTML = "<a id='' rel='' target=''  href='"+oRecord.getData("URL")+"?TabPanelName="+oRecord.getData("PanelName")+"&answer(TabPanelName)="+oRecord.getData("PanelName")+"&answer(customerId)="+oRecord.getData("CustomerId")+"&customerId="+oRecord.getData("CustomerId")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(requestForm)=Submission"+"&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION"+"&answer(Object::Submission::InsuredId)="+oRecord.getData("CustomerId")+"&answer(Object::Submission::SubmissionId)="+oRecord.getData("SubmissionId")+"&answer(Object::Submission::SubmissionVerId)="+oRecord.getData("SubmissionVerId")+"'>"+sData+"</a>";             
             
        };
                        
        var formatPriorityUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' <img src="../Images/Priority.jpeg">'; 
        };
       
       var moreColumnDefsCl = [
             {key:"Assignee", resizable:"true"},
            {key:"Date", resizable:"true"},
            {key:"Submission #", formatter:formatUrl, resizable:"true"},
            {key:"Insured Name", resizable:"true"},
            {key:"State", resizable:"true"},            
            {key:"Broker", resizable:"true"},
            {key:"Priority", className:'priority-image', resizable:"true"},
            {key:"Delete", className:'delete-image', resizable:"true"}
            
        ];
         
        var period = document.getElementById("clearancePeriod").value;        
        var searchStartDate = getSearchStartDate(period);
        var searchEndDate = getSearchEndDate(period);              
             	
	    var anotherDataSourceCL = new YAHOO.util.DataSource("../GetClearanceAlertAction.do?SearchStartDate="+searchStartDate+"&SearchEndDate="+searchEndDate+" ");
        anotherDataSourceCL.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSourceCL.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "|",
            fields: ["Assignee","Date","Submission #","Insured Name","State","SubmissionId","SubmissionVerId","Broker","Priority","Delete","URL","CustomerId","PanelName","AlertId"]
        };
        
        
        // Upgrade note: As of 2.5.0, the second argument is the full type-converted
        // response from the live data, and not the unconverted raw response
        anotherDataSourceCL.doBeforeCallback = function(oRequest, oFullResponse, oParsedResponse) {
            // Remove the first result (i.e., the headers);
            oParsedResponse.results.shift();
            return oParsedResponse;
        };	        
        
        // Configuration for Pagination
        var myConfigs = {   
     	paginator : new YAHOO.widget.Paginator({   
         rowsPerPage    : 10, // REQUIRED  
               
         // use a custom layout for pagination controls   
          template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   
               
         // use these in the rows-per-page dropdown   
         rowsPerPageOptions : [10,15,20],   
   
         // use custom page link labels   
         pageLabelBuilder : function (page,paginator) {   
             var recs = paginator.getPageRecords(page);   
             return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
         }   
     		})   
 		};    
     
       var myDataTableY = new YAHOO.widget.DataTable("classigned", moreColumnDefsCl,anotherDataSourceCL,myConfigs);
       
       myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var submissionNum = record.getData("Submission #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Delete') {
		        if (confirm('Do you really want to delete this Clearance Request action "'+ submissionNum +'"?')) {
		        	YAHOO.util.Connect.asyncRequest('GET', '../DeleteHomeAlertAction.do?answer(Object::Alert::AlertId)=' + record.getData('AlertId'),                
	                {
	                    success: function (o) {
	                        if (o.responseText == 'success') {       	
		            			myDataTableY.deleteRow(target);	            	            
		        			}
		        			if (o.responseText == 'failure') {       	
		            			alert("Error in Deletion Operation!!");            	            
		        			}
		        		},
		        		failure: function (o) {
	                        alert("Error in Deletion Operation!!");
	                    },
	                    scope:this
	              	}
	           		);
	        	}             
       		} 
	   });  	   
	              
       return {
           oDS2: anotherDataSourceCL,
           oDTY: myDataTableY
       };
    }();
}
</script>
		</DIV>
		<!-- End of Clearence Checks -->
		<br>
		
		<DIV class="block_Home" id="blockReferal">
			<!-- inlcude the jsp required to show at the top left panel-->
			




<IMG class="arrowup_Home" id="arrowupReferal" onclick="switchContent('arrowdownReferal', 'inline', 'arrowupReferal', 'none', 'bodyReferal', 'inline');"
			src="../Images/ArrowRightHomePanel.gif" alt="Click Here to Show UnderWriting Referrals">			
<IMG class="arrowdown_Home" id="arrowdownReferal" onclick="switchContent('arrowdownReferal', 'none', 'arrowupReferal', 'inline', 'bodyReferal', 'none');"			
			src="../Images/ArrowDownHomePanel.gif"  alt="Click Here to Hide UnderWriting Referrals">

<DIV class="head_Home" id="headReferal">
	<SPAN class="subFirst_Home">Underwriting Referrals</SPAN>
</DIV>

<DIV class="body_Home" id="bodyReferal"  style="display: none;">
	<table class="new_table_UR">
		<TBODY>
			<TR>
				<TD class=rowicon_Home>
					<table>
						<tr>
							<td><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox" style="border: 0px" checked="checked" id="chk1" name="asdf" onclick="onRefCheckClick(this.form)"/>Assigned To You</SPAN></td>
							<td width="10%"></td>
							<td><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox"  style="border: 0px" checked="checked" id="chk2" name="asdf" onclick="onRefCheckClick(this.form)"/>Un Assigned</SPAN></td>
							<td width="10%"></td>
							<td><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox" style="border: 0px" checked="checked" id="chk3" name="asdf" onclick="onRefCheckClick(this.form)"/>Assigned To Others</SPAN></td>
							<td width="10%"></td>
							<td><SPAN>&nbsp;&nbsp;&nbsp;Period :
								<select class="txtbox_Home" id="referalPeriod">
									<option value="7">Last 7 Days</option>
									<option value="14">Last 14 Days</option>
									<option value="30">Last Month</option>
									<option value="0">Today</option>
									<option value="-1">All</option>
								</select></SPAN>
							</td>
						</tr>
					</table>
					<DIV class=divider_Home></DIV>
					<br>					
					<div class="yuitable_Home" id="assigned" style="display:inline;"></div>
					<br>
					
				</TD>
			</TR>
		</TBODY>
	</table>						
</DIV>
<DIV class=divider_Home></DIV>
<DIV class=clear_Home></DIV>
		

<script type="text/javascript" >
YAHOO.util.Event.addListener(referalPeriod, "change", function() {
loadUnderwriterRef();
});
YAHOO.util.Event.addListener(arrowupReferal, "click", function() {
loadUnderwriterRef();
});

function loadUnderwriterRef(){
    YAHOO.example.XHR_Text = function() {  
    
         var formatObjectUrl = function(elCell, oRecord, oColumn, sData) {  
         if(oRecord.getData("ObjectType")=="Quote") {
        		elCell.innerHTML = "<a id='' rel='' target=''  href='" + oRecord.getData("Quote Url") +"?TabPanelName="+oRecord.getData("Quote PanelName")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(QuoteId)="+oRecord.getData("ObjectId")+"&answer(parentQuoteId)="+oRecord.getData("ObjectId")+"&answer(ownerId)="+oRecord.getData("OwnerId")+"&answer(Object::Agency::AgencyId)="+oRecord.getData("AgencyId")+"&answer(userId)="+oRecord.getData("UserId")+"'>"+sData+"</a>";        		 
        	}
        	
        	if(oRecord.getData("ObjectType")=="Submission") {
        		elCell.innerHTML = "<a id='' rel='' target=''  href='"+oRecord.getData("Submission Url")+"?TabPanelName="+oRecord.getData("Submission PanelName")+"&answer(Object::Submission::SubmissionVerId)="+oRecord.getData("ObjectVerId")+"&answer(Object::Submission::SubmissionId)="+oRecord.getData("ObjectId")+"&answer(TabPanelName)="+oRecord.getData("Submission PanelName")+"&answer(customerId)="+oRecord.getData("CustomerId")+"&customerId="+oRecord.getData("CustomerId")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(requestForm)=Submission"+"&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION"+"&answer(Object::Submission::InsuredId)="+oRecord.getData("CustomerId")+"'>"+sData+"</a>";             
        		
        	}               
        };
        
        var formatInsuredUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = "<a id='' rel='' target=''  href='"+oRecord.getData("Insured Url")+"?TabPanelName="+oRecord.getData("Insured PanelName")+"&customerId="+oRecord.getData("CustomerId")+"'>"+sData+"</a>";
        };
        
        var formatDeleteUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' <img src="../Images/delete1.jpg">'; 
        };
        
        var formatPriorityUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' <img src="../Images/Priority.jpeg">'; 
        };
        
       var moreColumnDefs = [
            {key:"Assignee", resizable:"true"},
            {key:"Date", resizable:"true"},
            {key:"Quote/Submission #", formatter:formatObjectUrl, resizable:"true"},
            {key:"Insured Name", formatter:formatInsuredUrl, resizable:"true"},
            {key:"State", resizable:"true"},
            {key:"Broker", resizable:"true"},
            {key:"Priority", className:'priority-image', resizable:"true"},
            {key:"Delete", className:'delete-image', resizable:"true"}
            
        ];
        
        var period = document.getElementById("referalPeriod").value;                
        var searchStartDate = getSearchStartDate(period);
        var searchEndDate = getSearchEndDate(period);   
        
        // var anotherDataSource = new YAHOO.util.DataSource("/HomePanel/result/UnderwritingReferalResult.jsp");
        var anotherDataSource = new YAHOO.util.DataSource("../GetReferralAlertAction.do?SearchStartDate="+searchStartDate+"&SearchEndDate="+searchEndDate+" ");
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "|",
            fields: ["Assignee","Date","Quote/Submission #","Insured Name","State","Broker","Priority","Delete","Quote Url","Insured Url","Submission Url","CustomerId","ObjectId","AgencyId","UserId","Quote PanelName","Insured PanelName","Submission PanelName","OwnerId","AlertId","ObjectType","ObjectVerId"]
        };
        // Upgrade note: As of 2.5.0, the second argument is the full type-converted
        // response from the live data, and not the unconverted raw response
        anotherDataSource.doBeforeCallback = function(oRequest, oFullResponse, oParsedResponse) {
            // Remove the first result (i.e., the headers);
            oParsedResponse.results.shift();
            return oParsedResponse;
        };
        
        // Configuration for Pagination
        var myConfigs = {   
     	paginator : new YAHOO.widget.Paginator({   
         rowsPerPage    : 10, // REQUIRED  
               
         // use a custom layout for pagination controls   
         template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   
      
         // use these in the rows-per-page dropdown   
         rowsPerPageOptions : [10,15,20],   
   
         // use custom page link labels   
         pageLabelBuilder : function (page,paginator) {   
             var recs = paginator.getPageRecords(page);   
             return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
         }   
     		})   
 		};  
        	
        var myDataTableY = new YAHOO.widget.DataTable("assigned", moreColumnDefs,anotherDataSource, myConfigs);
        
        myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var objectNum = record.getData("Quote/Submission #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Delete') {
		        if (confirm('Do you really want to delete this Referral Request action "'+ objectNum +'" ?')) {
		        	YAHOO.util.Connect.asyncRequest('GET',
	                '../DeleteHomeAlertAction.do?answer(Object::Alert::AlertId)=' + record.getData('AlertId'),                
	                {
	                    success: function (o) {
	                        if (o.responseText == 'success') {       	
		            			myDataTableY.deleteRow(target);	            	            
		        			}
		        		},
		        		failure: function (o) {
	                        alert(o.statusText);
	                    },
	                    scope:this
	              	}
	           		);
	        	}             
       		} 
	   });
	   
	   myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var objectNum = record.getData("Quote/Submission #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Priority') {
		            switchContent('priority-image', 'none', 'delete-image', 'inline', 'bodyClearance', 'none');    
       		} 
	   });        
         
        return {
            oDS2: anotherDataSource,
            oDTY: myDataTableY
        };
    }();
}

</script>		
		</DIV>
		<!-- End of Underwriting Referal -->
				
		<br>
				
		<DIV class="block_Home" id="blockBind">
			<!-- inlcude the jsp required to show at the top left panel-->
			




<IMG class="arrowup_Home" id="arrowupBind" onclick="switchContent('arrowdownBind', 'inline', 'arrowupBind', 'none', 'bodyBind', 'inline');"
			src="../Images/ArrowRightHomePanel.gif" alt="Click Here to Show Bind Requests">	
<IMG class="arrowdown_Home" id="arrowdownBind" onclick="switchContent('arrowdownBind', 'none', 'arrowupBind', 'inline', 'bodyBind', 'none');"			
			src="../Images/ArrowDownHomePanel.gif" alt="Click Here to Hide Bind Requests">
<DIV class="head_Home" id="headBind">
	<SPAN class="subFirst_Home">Bind Requests/</SPAN>
	<SPAN class=subFirst_Home>Binders Produced</SPAN>				
</DIV>

<DIV class="body_Home" id="bodyBind" style="display: none;">
	<table class="new_table_BR">
		<TBODY>
			<TR>
				<TD class=rowicon_Home>
					<table>
						<tr>
							<td><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox" style="border: 0px" checked="checked" id="clchk1" name="asdf" onclick="onBindReqCheckClick(this.form)"/>Assigned To You</SPAN></td>
							<td width="10%"></td>
							<td><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox"  style="border: 0px" checked="checked" id="clchk2" name="asdf" onclick="onBindReqCheckClick(this.form)"/>Un Assigned</SPAN></td>
							<td width="10%"></td>
							<td><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox" style="border: 0px" checked="checked" id="clchk3" name="asdf" onclick="onBindReqCheckClick(this.form)"/>Assigned To Others</SPAN></td>
							<td width="10%"></td>
							<td><SPAN>&nbsp;&nbsp;&nbsp;Period :
								<select class="txtbox_Home" id="bindRequestPeriod">
									<option value="7">Last 7 Days</option>
									<option value="14">Last 14 Days</option>
									<option value="30">Last Month</option>
									<option value="0">Today</option>
									<option value="-1">All</option>
								</select></SPAN>
							</td>
						</tr>
					</table>
					<DIV class=divider_Home></DIV>
					<br>					
					<div class="yuitable_Home" id="bindReqAssigned" style="display:inline;"></div>
					<br>
				</TD>
			</TR>
		</TBODY>
	</table>						
</DIV>
<DIV class=divider_Home></DIV>
<DIV class=clear_Home></DIV>

<script type="text/javascript">

YAHOO.util.Event.addListener(bindRequestPeriod, "change", function() {
loadBindReq();
});
YAHOO.util.Event.addListener(arrowupBind, "click", function() {
loadBindReq();
});

function loadBindReq(){
    YAHOO.example.XHR_Text = function() {
    	    	   
    	// var myConfigs = { paginator : new YAHOO.widget.Paginator({rowsPerPage : 10  })	};     	    	 	 
    	    	
        var formatQuoteUrl = function(elCell, oRecord, oColumn, sData) {

              elCell.innerHTML = "<a id='' rel='' target=''  href='" + oRecord.getData("Quote Url") +"?TabPanelName="+oRecord.getData("Quote PanelName")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(QuoteId)="+oRecord.getData("QuoteId")+"&answer(parentQuoteId)="+oRecord.getData("QuoteId")+"&answer(ownerId)="+oRecord.getData("OwnerId")+"&answer(Object::Agency::AgencyId)="+oRecord.getData("AgencyId")+"&answer(userId)="+oRecord.getData("UserId")+"'>"+sData+"</a>";
        };
        
        var formatInsuredUrl = function(elCell, oRecord, oColumn, sData) {        
             elCell.innerHTML = "<a id='' rel='' target=''  href='"+oRecord.getData("Insured Url")+"?TabPanelName="+oRecord.getData("Insured PanelName")+"&customerId="+oRecord.getData("CustomerId")+"'>"+sData+"</a>";
        };
        
        var formatDeleteUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' <img src="../Images/delete1.jpg">'; 
        };
        
        var formatPriorityUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' <img src="../Images/Priority.jpeg">'; 
        };

       var moreColumnDefs = [
            {key:"Assignee", resizable:"true"},
            {key:"Date", resizable:"true"},
            {key:"Quote #", formatter:formatQuoteUrl, resizable:"true"},
            {key:"Insured Name", formatter:formatInsuredUrl, resizable:"true"},
            {key:"State", resizable:"true"},
            {key:"Broker", resizable:"true"},
            {key:"Priority", className:'priority-image', resizable:"true"},
            {key:"Delete", className:'delete-image', resizable:"true"}
        ];
        
        var period = document.getElementById("bindRequestPeriod").value;               
        var searchStartDate = getSearchStartDate(period);
        var searchEndDate = getSearchEndDate(period);  
        
        var anotherDataSource = new YAHOO.util.DataSource("../GetBindRequestAlertAction.do?SearchStartDate="+searchStartDate+"&SearchEndDate="+searchEndDate+" ");
        
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "|",
            fields: ["Assignee","Date","Quote #","Insured Name","State","Broker","Priority","Delete","Quote Url","Insured Url","CustomerId","QuoteId","AgencyId","UserId","Quote PanelName","Insured PanelName","OwnerId","AlertId"]
        };
        
        // Upgrade note: As of 2.5.0, the second argument is the full type-converted
        // response from the live data, and not the unconverted raw response
        anotherDataSource.doBeforeCallback = function(oRequest, oFullResponse, oParsedResponse) {
            // Remove the first result (i.e., the headers);
            oParsedResponse.results.shift();
            return oParsedResponse;
        };	
        
        YAHOO.widget.DataTable._bStylesheetFallback = !!YAHOO.env.ua.ie;    
        
        // Configuration for Pagination
        var myConfigs = {   
     	paginator : new YAHOO.widget.Paginator({   
         rowsPerPage    : 10, // REQUIRED  
               
         // use a custom layout for pagination controls   
         template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   
            
   
         // use these in the rows-per-page dropdown   
         rowsPerPageOptions : [10,15,20],   
   
         // use custom page link labels   
         pageLabelBuilder : function (page,paginator) {   
             var recs = paginator.getPageRecords(page);   
             return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
         }   
     		})   
 		};  
              
        var myDataTableY = new YAHOO.widget.DataTable("bindReqAssigned", moreColumnDefs,anotherDataSource,myConfigs); 
                
        myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var quoteNum = record.getData("Quote #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Delete') {
		        if (confirm('Do you really want to delete this BindRequest action "'+ quoteNum +'" ?')) {
		        	YAHOO.util.Connect.asyncRequest('GET',
	                '../DeleteHomeAlertAction.do?answer(Object::Alert::AlertId)=' + record.getData('AlertId'),                
	                {
	                    success: function (o) {
	                        if (o.responseText == 'success') {       	
		            			myDataTableY.deleteRow(target);	            	            
		        			}
		        		},
		        		failure: function (o) {
	                        alert(o.statusText);
	                    },
	                    scope:this
	              	}
	           		);
	        	}             
       		} 
	   });
	   
	   myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var submissionNum = record.getData("Quote #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Priority') {
		            switchContent('priority-image', 'none', 'delete-image', 'inline', 'bodyClearance', 'none');    
       		} 
	   });
        

        return {
            oDS2: anotherDataSource,
          oDT2: myDataTableY
        };
    }();
}

</script>
		</DIV>
			<BR>
	

		<DIV class=block_Home id=blockPreNotification>
			<!-- inlcude the jsp required to show at the top left panel-->
			




<IMG class="arrowup_Home" id="arrowupNotification" onclick="switchContent('arrowdownNotification', 'inline', 'arrowupNotification', 'none', 'bodyNotification', 'inline');"
			src="../Images/ArrowRightHomePanel.gif"  alt="Click Here to Show Notifications">			
<IMG class="arrowdown_Home" id="arrowdownNotification" onclick="switchContent('arrowdownNotification', 'none', 'arrowupNotification', 'inline', 'bodyNotification', 'none');"			
			src="../Images/ArrowDownHomePanel.gif" alt="Click Here to Hide Notifications">
<DIV class=head_Home id=headPreNotification>
	<SPAN class=subFirst_Home>notification</SPAN>			
</DIV>

<DIV class="body_Home" id=bodyNotification  style="display: none;">        
	<table class="new_table_NF">
		<TBODY>
			<TR>
				<TD class="rowicon_Home">
					<table>
						<tr>
							<td><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox" style="border: 0px" checked="checked" id="clchk1" name="asdf" onclick="onNotifyCheckClick(this.form)"/>Assigned To You</SPAN></td>
							<td  width="10%"></td>
							<td><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox"  style="border: 0px" checked="checked" id="clchk2" name="asdf" onclick="onNotifyCheckClick(this.form)"/>Un Assigned</SPAN></td>
							<td width="10%"></td>
							<td><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox" style="border: 0px" checked="checked" id="clchk3" name="asdf" onclick="onNotifyCheckClick(this.form)"/>Assigned To Others</SPAN></td>
							<td width="10%"></td>
							<td><SPAN>&nbsp;&nbsp;&nbsp;Period :
								<select class="txtbox_Home" id="notificationPeriod">
									<option value="7">Last 7 Days</option>
									<option value="14">Last 14 Days</option>
									<option value="30">Last Month</option>
									<option value="0">Today</option>
									<option value="-1">All</option>
								</select></SPAN>
							</td>
						</tr>
					</table>
					<DIV class=divider_Home></DIV>
					<BR>					
					<div class="yuitable_Home" id="notificationassigned" style="display:inline;"></div>
					<br>
				</TD>
			</TR>
		</TBODY>
	</table>
</DIV>	
<DIV class=divider_Home></DIV>				
<DIV class=clear_Home></DIV>

			
<script type="text/javascript" >
YAHOO.util.Event.addListener(notificationPeriod, "change", function() {
loadNotifications();
});
YAHOO.util.Event.addListener(arrowupNotification, "click", function() {
loadNotifications();
});

function loadNotifications(){
    YAHOO.example.XHR_Text = function() {
    
        var formatUrl = function(elCell, oRecord, oColumn, sData) {        	
        	if(oRecord.getData("ObjectType")=="Quote") {
        		elCell.innerHTML = "<a id='' rel='' target=''  href='" + oRecord.getData("Quote Url") +"?TabPanelName="+oRecord.getData("Quote PanelName")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(QuoteId)="+oRecord.getData("ObjectId")+"&answer(parentQuoteId)="+oRecord.getData("ObjectId")+"&answer(ownerId)="+oRecord.getData("OwnerId")+"&answer(Object::Agency::AgencyId)="+oRecord.getData("AgencyId")+"&answer(userId)="+oRecord.getData("UserId")+"'>"+sData+"</a>";        		 
        	}
        	
        	if(oRecord.getData("ObjectType")=="Submission") {
        		elCell.innerHTML = "<a id='' rel='' target=''  href='"+oRecord.getData("Submission Url")+"?TabPanelName="+oRecord.getData("Submission PanelName")+"&answer(Object::Submission::SubmissionVerId)="+oRecord.getData("ObjectVerId")+"&answer(Object::Submission::SubmissionId)="+oRecord.getData("ObjectId")+"&answer(TabPanelName)="+oRecord.getData("Submission PanelName")+"&answer(customerId)="+oRecord.getData("CustomerId")+"&customerId="+oRecord.getData("CustomerId")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(requestForm)=Submission"+"&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION"+"&answer(Object::Submission::InsuredId)="+oRecord.getData("CustomerId")+"'>"+sData+"</a>";             
        		
        	}            
        };
        
        var formatDeleteUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' <img src="../Images/delete1.jpg">'; 
        };
        
        var formatPriorityUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' <img src="../Images/Priority.jpeg">'; 
        };

       var moreColumnDefs = [
            {key:"Assignee", resizable:"true"},
            {key:"Date", resizable:"true"},
            {key:"Quote/Submission #", formatter:formatUrl, resizable:"true"},
            {key:"Message", resizable:"true"},
            {key:"Insured Name", resizable:"true"},
            {key:"Broker", resizable:"true"},
            {key:"Priority", className:'priority-image', resizable:"true"},
            {key:"Delete", className:'delete-image', resizable:"true"}
        ];
        
        var period = document.getElementById("notificationPeriod").value;                
        var searchStartDate = getSearchStartDate(period);
        var searchEndDate = getSearchEndDate(period); 
        
        var anotherDataSource = new YAHOO.util.DataSource("../GetNotificationAlertAction.do?SearchStartDate="+searchStartDate+"&SearchEndDate="+searchEndDate+" ");
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "|",
            fields: ["Assignee","Date","Quote/Submission #","Message","Insured Name","Broker","Priority","Delete","Quote Url","Submission Url","CustomerId","ObjectId","AgencyId","UserId","Quote PanelName","Submission PanelName","OwnerId","AlertId","ObjectType","ObjectVerId"]
        };
        // Upgrade note: As of 2.5.0, the second argument is the full type-converted
        // response from the live data, and not the unconverted raw response
        anotherDataSource.doBeforeCallback = function(oRequest, oFullResponse, oParsedResponse) {
            // Remove the first result (i.e., the headers);
            oParsedResponse.results.shift();
            return oParsedResponse;
        };
        
        // Configuration for Pagination
        var myConfigs = {   
     	paginator : new YAHOO.widget.Paginator({   
         rowsPerPage    : 10, // REQUIRED  
               
         // use a custom layout for pagination controls   
          template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   
      
         // use these in the rows-per-page dropdown   
         rowsPerPageOptions : [10,15,20],   
   
         // use custom page link labels   
         pageLabelBuilder : function (page,paginator) {   
             var recs = paginator.getPageRecords(page);   
             return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
         }   
     		})   
 		};  	
        
        var myDataTableY = new YAHOO.widget.DataTable("notificationassigned", moreColumnDefs,anotherDataSource,myConfigs);  
        
        myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var num = record.getData("Quote/Submission #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Delete') {
		        if (confirm('Do you really want to delete this Notification Request action "'+ num +'" ?')) {
		        	YAHOO.util.Connect.asyncRequest('GET',
	                '../DeleteHomeAlertAction.do?answer(Object::Alert::AlertId)=' + record.getData('AlertId'),                
	                {
	                    success: function (o) {
	                        if (o.responseText == 'success') {       	
		            			myDataTableY.deleteRow(target);	            	            
		        			}
		        		},
		        		failure: function (o) {
	                        alert(o.statusText);
	                    },
	                    scope:this
	              	}
	           		);
	        	}             
       		} 
	   });
	   
	   myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var submissionNum = record.getData("Quote/Submission #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Priority') {
		            switchContent('priority-image', 'none', 'delete-image', 'inline', 'bodyClearance', 'none');    
       		} 
	   });
        

        return {
            oDS2: anotherDataSource,
          oDT2: myDataTableY
        };
    }();
}

</script>
		</DIV>
			
		<BR>
		
		<DIV class=block_Home id=blockPreBind>			
			<!-- inlcude the jsp required to show at the top left panel-->
			




<IMG class=arrowup_Home id="arrowupPreBind" onclick="switchContent('arrowdownPreBind', 'inline', 'arrowupPreBind', 'none', 'bodyPreBind', 'inline');"
			src="../Images/ArrowRightHomePanel.gif" alt="Click Here to Show Pre-Bind Subjectivities">			
<IMG class="arrowdown_Home" id="arrowdownPreBind" onclick="switchContent('arrowdownPreBind', 'none', 'arrowupPreBind', 'inline', 'bodyPreBind', 'none');"			
			src="../Images/ArrowDownHomePanel.gif" alt="Click Here to Hide Pre-Bind Subjectivities">
<DIV class=head_Home id=headPreBind><!-- Begin prebindsubjectivities800448896 Head -->
	<SPAN class=subFirst_Home>pre-bind subjectivities</SPAN>
</DIV>

<DIV class=body_Home id=bodyPreBind  style="display: none;">
	<table class="new_table_PREB">
		<TBODY>
			<TR>
				<TD class="rowicon_Home">
					<table>
						<tr>
							<td><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox" style="border: 0px" checked="checked" id="clchk1" name="asdf" onclick="onPrebindCheckClick(this.form)"/>Assigned To You</SPAN></td>
							<td width="10%"></td>
							<td><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox"  style="border: 0px" checked="checked" id="clchk2" name="asdf" onclick="onPrebindCheckClick(this.form)"/>Un Assigned</SPAN></td>
							<td width="10%"></td>
							<td><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox" style="border: 0px" checked="checked" id="clchk3" name="asdf" onclick="onPrebindCheckClick(this.form)"/>Assigned To Others</SPAN></td>
							<td width="10%"></td>
							<td><SPAN>&nbsp;&nbsp;&nbsp;Period :
								<select class="txtbox_Home" id="prebindPeriod">
									<option value="7">Last 7 Days</option>
									<option value="14">Last 14 Days</option>
									<option value="30">Last Month</option>
									<option value="0">Today</option>
									<option value="-1">All</option>
								</select></SPAN>
							</td>
						</tr>
					</table>
					<DIV class=divider_Home></DIV>
					<br>
					<div class="yuitable_Home" id="prebindAssigned" style="display:inline;"></div>
					<br>
				</TD>
			</TR>
		</TBODY>
	</table>
</DIV>	
<DIV class=divider_Home></DIV>				
<DIV class=clear_Home></DIV>
				
<script type="text/javascript" >
YAHOO.util.Event.addListener(prebindPeriod, "change", function() {
loadOpenPreBindSubj();
});
YAHOO.util.Event.addListener(arrowupPreBind, "click", function() {
loadOpenPreBindSubj();
});

function loadOpenPreBindSubj(){
    YAHOO.example.XHR_Text = function() {
    
        var formatQuoteUrl = function(elCell, oRecord, oColumn, sData) {
           elCell.innerHTML = "<a id='' rel='' target=''  href='" + oRecord.getData("Quote Url") +"?TabPanelName="+oRecord.getData("Quote PanelName")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(QuoteId)="+oRecord.getData("QuoteId")+"&answer(parentQuoteId)="+oRecord.getData("QuoteId")+"&answer(Object::Quote::QuoteVerId)="+oRecord.getData("QuoteVerId")+"&answer(policyNumber)="+oRecord.getData("PolicyNum")+"&answer(Object::Policy::ParentPolicyId)="+oRecord.getData("PolicyId")+"&answer(Object::Policy::ParentPolicyVerId)="+oRecord.getData("PolicyVerId")+"'>"+sData+"</a>";           																																																																																																																								
        };
        
        var formatSubjUrl = function(elCell, oRecord, oColumn, sData) {           
           if(oRecord.getData("QuoteType")=="NEW_BUSINESS") {
        		elCell.innerHTML = "<a id='' rel='' target=''  href='" + oRecord.getData("Subj Url") +"?TabPanelName="+oRecord.getData("Quote PanelName")+"&answer(Object::Quote::Subjectivity::QuoteSubjectivityId)="+oRecord.getData("SubjId")+"&answer(Object::Quote::ParentQuoteId)="+oRecord.getData("QuoteId")+"&answer(Object::Quote::ProductVerId)="+oRecord.getData("productVerId")+"&answer(Object::Quote::ParentQuoteVerId)="+oRecord.getData("QuoteVerId")+"&answer(Object::Quote::SubQuoteId)="+oRecord.getData("SubQuoteId")+"&answer(Object::Quote::SuQuoteVerId)="+oRecord.getData("SubQuoteVerId")+"&answer(Object::Quote::ProductId)="+oRecord.getData("productId")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(Object::Quote::QuoteStatus)="+oRecord.getData("QuoteStatus")+"'>"+sData+"</a>";
        	}
        	
        	if(oRecord.getData("QuoteType")=="ENDORSEMENT") {
        		elCell.innerHTML = "<a id='' rel='' target=''  href='" + oRecord.getData("Subj Url") +"?TabPanelName="+oRecord.getData("Quote PanelName")+"&answer(Object::Quote::Subjectivity::QuoteSubjectivityId)="+oRecord.getData("SubjId")+"&answer(parentPolicyId)="+oRecord.getData("PolicyId")+"&answer(policyVerId)="+oRecord.getData("PolicyVerId")+"&answer(policyNumber)="+oRecord.getData("PolicyNum")+"&answer(Object::Quote::ParentQuoteId)="+oRecord.getData("QuoteId")+"&answer(Object::Quote::ProductVerId)="+oRecord.getData("productVerId")+"&answer(Object::Quote::ParentQuoteVerId)="+oRecord.getData("QuoteVerId")+"&answer(Object::Quote::SubQuoteId)="+oRecord.getData("SubQuoteId")+"&answer(Object::Quote::SuQuoteVerId)="+oRecord.getData("SubQuoteVerId")+"&answer(Object::Quote::ProductId)="+oRecord.getData("productId")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(Object::Quote::QuoteStatus)="+oRecord.getData("QuoteStatus")+"'>"+sData+"</a>";
        	}
           																										 					
        };
        
        var formatDeleteUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' <img src="../Images/delete1.jpg">'; 
        };
        
        var formatPriorityUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' <img src="../Images/Priority.jpeg">'; 
        };

       var moreColumnDefs = [
            {key:"Assignee", resizable:"true"},
            {key:"Date", resizable:"true"},
            {key:"Quote #", formatter:formatQuoteUrl, resizable:"true"},
            {key:"Subjectivity", formatter:formatSubjUrl, resizable:"true"},
            {key:"Insured Name", resizable:"true"},
            {key:"Broker", resizable:"true"},
            {key:"Priority", className:'priority-image', resizable:"true"},
            {key:"Delete", className:'delete-image', resizable:"true"}
        ];
        
        var period = document.getElementById("prebindPeriod").value;               
        var searchStartDate = getSearchStartDate(period);
        var searchEndDate = getSearchEndDate(period); 

        // var anotherDataSource = new YAHOO.util.DataSource("/HomePanel/result/OpenPreBindResult.jsp");
        var anotherDataSource = new YAHOO.util.DataSource("../GetPreBindSubjectivityAlertAction.do?SearchStartDate="+searchStartDate+"&SearchEndDate="+searchEndDate+" ");
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "|",
            fields: ["Assignee","Date","Quote #","Subjectivity","Insured Name","Broker","Priority","Delete","Quote Url","Subj Url","SubjId","productId","productVerId","QuoteId","QuoteVerId","SubQuoteId","SubQuoteVerId","QuoteStatus","QuoteType","PolicyId","PolicyVerId","PolicyNum","CustomerId","AgencyId","UserId","Quote PanelName","OwnerId","AlertId"]
        };
        // Upgrade note: As of 2.5.0, the second argument is the full type-converted
        // response from the live data, and not the unconverted raw response
        anotherDataSource.doBeforeCallback = function(oRequest, oFullResponse, oParsedResponse) {
            // Remove the first result (i.e., the headers);
            oParsedResponse.results.shift();
            return oParsedResponse;
        };	
        
        // Configuration for Pagination
        var myConfigs = {   
     	paginator : new YAHOO.widget.Paginator({   
         rowsPerPage    : 10, // REQUIRED  
               
         // use a custom layout for pagination controls   
          template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   
    
         // use these in the rows-per-page dropdown   
         rowsPerPageOptions : [10,15,20],   
   
         // use custom page link labels   
         pageLabelBuilder : function (page,paginator) {   
             var recs = paginator.getPageRecords(page);   
             return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
         }   
     		})   
 		};  

		var myDataTableY = new YAHOO.widget.DataTable("prebindAssigned", moreColumnDefs,anotherDataSource,myConfigs);  		
		
		myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var quoteNum = record.getData("Quote #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Delete') {
		        if (confirm('Do you really want to delete this OpenPreBindSubjectivity Request "'+ quoteNum +'" ?')) {
		        	YAHOO.util.Connect.asyncRequest('GET',
	                '../DeleteHomeAlertAction.do?answer(Object::Alert::AlertId)=' + record.getData('AlertId'),                
	                {
	                    success: function (o) {
	                        if (o.responseText == 'success') {       	
		            			myDataTableY.deleteRow(target);	            	            
		        			}
		        		},
		        		failure: function (o) {
	                        alert(o.statusText);
	                    },
	                    scope:this
	              	}
	           		);
	        	}             
       		} 
	   });    
	   
	   myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var submissionNum = record.getData("Quote #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Priority') {
		            switchContent('priority-image', 'none', 'delete-image', 'inline', 'bodyClearance', 'none');    
       		} 
	   });    
        

        return {
            oDS2: anotherDataSource,
          oDT2: myDataTableY
        };
    }();
}

</script>
		</DIV>
			
		<BR>
		
		<DIV class=block_Home id=blockPostBound><!-- Start prebindsubjectivities800448896 Block -->				
			<!-- inlcude the jsp required to show at the top left panel  OpenPostboundSubjectivities.jsp -->
			




<IMG class="arrowup_Home" id="arrowupPostBound" onclick="switchContent('arrowdownPostBound', 'inline', 'arrowupPostBound', 'none', 'bodyPostBound', 'inline');"
			src="../Images/ArrowRightHomePanel.gif" alt="Click Here to Show Post-Bound Subjectivities">						
<IMG class="arrowdown_Home" id="arrowdownPostBound" onclick="switchContent('arrowdownPostBound', 'none', 'arrowupPostBound', 'inline', 'bodyPostBound', 'none');"			
			src="../Images/ArrowDownHomePanel.gif" alt="Click Here to Hide Post-Bound Subjectivities">
<DIV class=head_Home id=headPostBound>
	<SPAN class=subFirst_Home>open post-bound subjectivities</SPAN>
</DIV>

<DIV class=body_Home id=bodyPostBound  style="display: none;">	
	<table class="new_table_POSTB">      
		<TBODY>
			<TR>
				<TD class="rowicon_Home">
					<table>
						<tr>
							<td><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox" style="border: 0px" checked="checked" id="clchk1" name="asdf" onclick="onPostboundCheckClick(this.form)"/>Assigned To You</SPAN></td>
							<td width="10%"></td>
							<td><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox"  style="border: 0px" checked="checked" id="clchk2" name="asdf" onclick="onPostboundCheckClick(this.form)"/>Un Assigned</SPAN></td>
							<td width="10%"></td>
							<td><SPAN style="FONT-WEIGHT: normal; WIDTH: 99.9%"><input type="checkbox" style="border: 0px" checked="checked" id="clchk3" name="asdf" onclick="onPostboundCheckClick(this.form)"/>Assigned To Others</SPAN></td>
							<td width="10%"></td>
							<td><SPAN>&nbsp;&nbsp;&nbsp;Period :
								<select class="txtbox_Home" id="postboundPeriod">
									<option value="7">Last 7 Days</option>
									<option value="14">Last 14 Days</option>
									<option value="30">Last Month</option>
									<option value="0">Today</option>
									<option value="-1">All</option>
								</select></SPAN>
							</td>
						</tr>
					</table>
					<DIV class=divider_Home></DIV>
					<br>
					<div class="yuitable_Home" id="postBoundassigned" style="display:inline;"></div>
					<br>
				</TD>
			</TR>
		</TBODY>
	</table>
</DIV>	
<DIV class=divider_Home></DIV>				
<DIV class=clear_Home></DIV>
			
<script type="text/javascript">
YAHOO.util.Event.addListener(postboundPeriod, "change", function() {
loadOpenPostBoundSubj();
});
YAHOO.util.Event.addListener(arrowupPostBound, "click", function() {
loadOpenPostBoundSubj();
});

function loadOpenPostBoundSubj(){
    YAHOO.example.XHR_Text = function() {
    
        var formatQuotePolicyUrl = function(elCell, oRecord, oColumn, sData) {
           elCell.innerHTML = "<a id='' rel='' target=''  href='" + oRecord.getData("Quote Url") +"?TabPanelName="+oRecord.getData("Quote PanelName")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(QuoteId)="+oRecord.getData("QuoteId")+"&answer(parentQuoteId)="+oRecord.getData("QuoteId")+"&answer(Object::Quote::QuoteVerId)="+oRecord.getData("QuoteVerId")+"&answer(policyNumber)="+oRecord.getData("PolicyNum")+"&answer(Object::Policy::ParentPolicyId)="+oRecord.getData("PolicyId")+"&answer(Object::Policy::ParentPolicyVerId)="+oRecord.getData("PolicyVerId")+"'>"+sData+"</a>";           																																																																																																																								
        };
        
        var formatSubjUrl = function(elCell, oRecord, oColumn, sData) {
            if(oRecord.getData("QuoteType")=="NEW_BUSINESS") {
            	if(oRecord.getData("QuoteStatus")=="Bound" || oRecord.getData("QuoteStatus")=="Issued"){
            		
            		var policyStatus = 'BOUND';
            		if(oRecord.getData("QuoteStatus")=="Issued"){
            			policyStatus='ISSUED';
            		}            		
            		elCell.innerHTML = "<a id='' rel='' target=''  href='" + oRecord.getData("Subj Url") +"?TabPanelName=Policy_Panel&answer(Object::Policy::Subjectivity::PolicySubjectivityId)="+oRecord.getData("SubjId")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(policyVerId)="+oRecord.getData("PolicyVerId")+"&answer(policyNumber)="+oRecord.getData("PolicyNum")+"&answer(policyId)="+oRecord.getData("PolicyId")+"&answer(policyStatus)="+policyStatus+"'>"+sData+"</a>";
            	} else {
        			elCell.innerHTML = "<a id='' rel='' target=''  href='" + oRecord.getData("Subj Url") +"?TabPanelName="+oRecord.getData("Quote PanelName")+"&answer(Object::Quote::Subjectivity::QuoteSubjectivityId)="+oRecord.getData("SubjId")+"&answer(Object::Quote::ParentQuoteId)="+oRecord.getData("QuoteId")+"&answer(Object::Quote::ProductVerId)="+oRecord.getData("productVerId")+"&answer(Object::Quote::ParentQuoteVerId)="+oRecord.getData("QuoteVerId")+"&answer(Object::Quote::SubQuoteId)="+oRecord.getData("SubQuoteId")+"&answer(Object::Quote::SuQuoteVerId)="+oRecord.getData("SubQuoteVerId")+"&answer(Object::Quote::ProductId)="+oRecord.getData("productId")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(Object::Quote::QuoteStatus)="+oRecord.getData("QuoteStatus")+"'>"+sData+"</a>";
        		}
        	}
        	
        	if(oRecord.getData("QuoteType")=="ENDORSEMENT") {
        		elCell.innerHTML = "<a id='' rel='' target=''  href='" + oRecord.getData("Subj Url") +"?TabPanelName="+oRecord.getData("Quote PanelName")+"&answer(Object::Quote::Subjectivity::QuoteSubjectivityId)="+oRecord.getData("SubjId")+"&answer(parentPolicyId)="+oRecord.getData("PolicyId")+"&answer(policyVerId)="+oRecord.getData("PolicyVerId")+"&answer(policyNumber)="+oRecord.getData("PolicyNum")+"&answer(Object::Quote::ParentQuoteId)="+oRecord.getData("QuoteId")+"&answer(Object::Quote::ProductVerId)="+oRecord.getData("productVerId")+"&answer(Object::Quote::ParentQuoteVerId)="+oRecord.getData("QuoteVerId")+"&answer(Object::Quote::SubQuoteId)="+oRecord.getData("SubQuoteId")+"&answer(Object::Quote::SuQuoteVerId)="+oRecord.getData("SubQuoteVerId")+"&answer(Object::Quote::ProductId)="+oRecord.getData("productId")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(Object::Quote::QuoteStatus)="+oRecord.getData("QuoteStatus")+"'>"+sData+"</a>";
        	}           																										 					
        };
        
        var formatDeleteUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' <img src="../Images/delete1.jpg">'; 
        };
        
        var formatPriorityUrl = function(elCell1, oRecord, oColumn, sData) {                
             elCell1.innerHTML = ' <img src="../Images/Priority.jpeg">'; 
        };

       var moreColumnDefs = [
            {key:"Assignee", resizable:"true"},
            {key:"Date", resizable:"true"},
            {key:"Quote/Policy #", formatter:formatQuotePolicyUrl, resizable:"true"},
            {key:"Subjectivity", formatter:formatSubjUrl, resizable:"true"},
            {key:"Insured Name", resizable:"true"},
            {key:"Broker", resizable:"true"},
            {key:"Priority", className:'priority-image', resizable:"true"},
            {key:"Delete", className:'delete-image', resizable:"true"}
        ];
        
        var period = document.getElementById("postboundPeriod").value;               
        var searchStartDate = getSearchStartDate(period);
        var searchEndDate = getSearchEndDate(period);  

        // var anotherDataSource = new YAHOO.util.DataSource("/HomePanel/result/OpenPostBoundResult.jsp");
        var anotherDataSource = new YAHOO.util.DataSource("../GetPostBindSubjectivityAlertAction.do?SearchStartDate="+searchStartDate+"&SearchEndDate="+searchEndDate+" ");
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "|",
            fields: ["Assignee","Date","Quote/Policy #","Subjectivity","Insured Name","Broker","Priority","Delete","Quote Url","Subj Url","SubjId","productId","productVerId","QuoteId","QuoteVerId","SubQuoteId","SubQuoteVerId","QuoteStatus","QuoteType","PolicyId","PolicyVerId","PolicyNum","CustomerId","AgencyId","UserId","Quote PanelName","Policy PanelName","OwnerId","AlertId"]
        };
        // Upgrade note: As of 2.5.0, the second argument is the full type-converted
        // response from the live data, and not the unconverted raw response
        anotherDataSource.doBeforeCallback = function(oRequest, oFullResponse, oParsedResponse) {
            // Remove the first result (i.e., the headers);
            oParsedResponse.results.shift();
            return oParsedResponse;
        };	
        
        // Configuration for Pagination
        var myConfigs = {   
     	paginator : new YAHOO.widget.Paginator({   
         rowsPerPage    : 10, // REQUIRED  
               
         // use a custom layout for pagination controls   
         template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   
   
         // use these in the rows-per-page dropdown   
         rowsPerPageOptions : [10,15,20],   
   
         // use custom page link labels   
         pageLabelBuilder : function (page,paginator) {   
             var recs = paginator.getPageRecords(page);   
             return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
         }   
     		})   
 		};  
        
        var myDataTableY = new YAHOO.widget.DataTable("postBoundassigned", moreColumnDefs,anotherDataSource,myConfigs);  
         
        myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var policyNum = record.getData("Quote/Policy #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Delete') {
		        if (confirm('Do you really want to delete this OpenPostBoundSubjectivity Request "'+ policyNum +'" ?')) {
		        	YAHOO.util.Connect.asyncRequest('GET',
	                '../DeleteHomeAlertAction.do?answer(Object::Alert::AlertId)=' + record.getData('AlertId'),                
	                {
	                    success: function (o) {
	                        if (o.responseText == 'success') {       	
		            			myDataTableY.deleteRow(target);	            	            
		        			}
		        		},
		        		failure: function (o) {
	                        alert(o.statusText);
	                    },
	                    scope:this
	              	}
	           		);
	        	}             
       		} 
	   });
	   
	   myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	var submissionNum = record.getData("Policy #");
	    	var column = myDataTableY.getColumn(target);	    	
	    	if (column.key == 'Priority') {
		            switchContent('priority-image', 'none', 'delete-image', 'inline', 'bodyClearance', 'none');    
       		} 
	   });
        

        return {
            oDS2: anotherDataSource,
          oDT2: myDataTableY
        };
    }();
}

</script>
		</DIV>
			
		

	
</DIV>
</td>	
</tr>
</table>

						</div>
					</td>
				</tr>
				<tr>
					<td valign="top" width="100%" style="{border-left:1px solid #999999;}">
						<div id="Home_Panel">

						</div>
					</td>
				</tr>
			</table>
        </div>



        <!-- Insured & Exposure Tab Definition -->
        <div id="submission_tab">
   			<table width="100%" cellpadding="0" cellspacing="0" align="center" style="height: 100%" border="0">
				<tr class="yui-skin-sam" id="yahoo-com" >
					<td valign="top" class="yui-skin-sam" id="yahoo-com" width="100%" style="{border-left:1px solid #336699;}">
						










<script type="text/javascript">

        <!-- Page-specific script for dropdown menu-->

            /*
                 Initialize and render the MenuBar when its elements are ready
                 to be scripted.
            */

            YAHOO.util.Event.onContentReady("submission_tab_menu", function () {

                var Dom = YAHOO.util.Dom,
                    oAnim;  // Animation instance


                /*
                     "beforeshow" event handler for each submenu of the MenuBar
                     instance, used to setup certain style properties before
                     the menu is animated.
                */

                function onSubmenuBeforeShow(p_sType, p_sArgs) {

                    var oBody,
                        oShadow,
                        oUL;


                    if (this.parent) {

                        /*
                             Get a reference to the Menu's shadow element and
                             set its "height" property to "0px" to syncronize
                             it with the height of the Menu instance.
                        */

                        oShadow = this.element.lastChild;
                        oShadow.style.height = "0px";


                        /*
                            Stop the Animation instance if it is currently
                            animating a Menu.
                        */

                        if (oAnim && oAnim.isAnimated()) {

                            oAnim.stop();
                            oAnim = null;

                        }


                        /*
                            Set the body element's "overflow" property to
                            "hidden" to clip the display of its negatively
                            positioned <ul> element.
                        */

                        oBody = this.body;


                        /*
                            There is a bug in gecko-based browsers where
                            an element whose "position" property is set to
                            "absolute" and "overflow" property is set to
                            "hidden" will not render at the correct width when
                            its offsetParent's "position" property is also
                            set to "absolute."  It is possible to work around
                            this bug by specifying a value for the width
                            property in addition to overflow.
                        */

                        if (this.parent &&
                            !(this.parent instanceof YAHOO.widget.MenuBarItem) &&
                            YAHOO.env.ua.gecko) {

                            Dom.setStyle(oBody, "width", (oBody.clientWidth + "px"));

                        }


                        Dom.setStyle(oBody, "overflow", "hidden");


                        /*
                            Set the <ul> element's "marginTop" property
                            to a negative value so that the Menu's height
                            collapses.
                        */

                        oUL = oBody.getElementsByTagName("ul")[0];

                        Dom.setStyle(oUL, "marginTop", ("-" + oUL.offsetHeight + "px"));

                    }

                }


                /*
                    "tween" event handler for the Anim instance, used to
                    syncronize the size and position of the Menu instance's
                    shadow and iframe shim (if it exists) with its
                    changing height.
                */

                function onTween(p_sType, p_aArgs, p_oShadow) {

                    if (this.cfg.getProperty("iframe")) {

                        this.syncIframe();

                    }

                    if (p_oShadow) {

                        p_oShadow.style.height = this.element.offsetHeight + "px";

                    }

                }


                /*
                    "complete" event handler for the Anim instance, used to
                    remove style properties that were animated so that the
                    Menu instance can be displayed at its final height.
                */

                function onAnimationComplete(p_sType, p_aArgs, p_oShadow) {

                    var oBody = this.body,
                        oUL = oBody.getElementsByTagName("ul")[0];

                    if (p_oShadow) {

                        p_oShadow.style.height = this.element.offsetHeight + "px";

                    }

                    Dom.setStyle(oUL, "marginTop", "");
                    Dom.setStyle(oBody, "overflow", "");


                    if (this.parent &&
                        !(this.parent instanceof YAHOO.widget.MenuBarItem) &&
                        YAHOO.env.ua.gecko) {

                        Dom.setStyle(oBody, "width", "");

                    }

                }


                /*
                     "show" event handler for each submenu of the MenuBar
                     instance - used to kick off the animation of the
                     <ul> element.
                */

                function onSubmenuShow(p_sType, p_sArgs) {

                    var oElement,
                        oShadow,
                        oUL;

                    if (this.parent) {

                        oElement = this.element;
                        oShadow = oElement.lastChild;
                        oUL = this.body.getElementsByTagName("ul")[0];


                        /*
                             Animate the <ul> element's "marginTop" style
                             property to a value of 0.
                        */

                        oAnim = new YAHOO.util.Anim(oUL,
                            { marginTop: { to: 0 } },
                            .5, YAHOO.util.Easing.easeOut);


                        oAnim.onStart.subscribe(function () {

                            oShadow.style.height = "100%";

                        });


                        oAnim.animate();


                        /*
                            Subscribe to the Anim instance's "tween" event for
                            IE to syncronize the size and position of a
                            submenu's shadow and iframe shim (if it exists)
                            with its changing height.
                        */

                        if (YAHOO.env.ua.ie) {

                            oShadow.style.height = oElement.offsetHeight + "px";


                            /*
                                Subscribe to the Anim instance's "tween"
                                event, passing a reference Menu's shadow
                                element and making the scope of the event
                                listener the Menu instance.
                            */

                            oAnim.onTween.subscribe(onTween, oShadow, this);

                        }


                        /*
                            Subscribe to the Anim instance's "complete" event,
                            passing a reference Menu's shadow element and making
                            the scope of the event listener the Menu instance.
                        */

                        oAnim.onComplete.subscribe(onAnimationComplete, oShadow, this);

                    }

                }
                /*
                     Instantiate a MenuBar:  The first argument passed to the
                     constructor is the id of the element in the page
                     representing the MenuBar; the second is an object literal
                     of configuration properties.
                */

                var oMenuBar = new YAHOO.widget.MenuBar("submission_tab_menu", {
                                                            autosubmenudisplay: true,
                                                            hidedelay: 750,
                                                            lazyload: true });


                /*
                     Subscribe to the "beforeShow" and "show" events for
                     each submenu of the MenuBar instance.
                */

                oMenuBar.subscribe("beforeShow", onSubmenuBeforeShow);
                oMenuBar.subscribe("show", onSubmenuShow);
		oMenuBar.subscribe("click", onClick);

		// Define a handler for the "click" event
		 function onClick(p_sType, p_aArgs) {
			 var oEvent = p_aArgs[0],    // DOM Event
			oMenuItem = p_aArgs[1]; // YAHOO.widget.MenuItem instance


			 // Alert the type of the DOM event
//			 alert(oEvent.type);
//
			 // If a MenuItem was clicked, alert the value of its text label
			 if (oMenuItem) {
//				 alert(oMenuItem.cfg.getProperty("text") + "----abc");
//				 alert("menuItem-" + oMenuItem.cfg.getProperty("target"));

			 }
/*
			 alert("onClick: index: " + this.index +
						", text: " + //this.cfg.getProperty("text") +
						", value: " + p_oValue);
*/
			loadTable(oMenuItem.cfg.getProperty("target"));

		 }

		function loadTable(url) {
			var divObj = $('Submission_Panel');
//			alert(url);
			try {
				new Ajax.Updater(
					"Submission_Panel",
					url,
					{
						method: "get",
						onComplete: function(){
								//Do something
							}
					}
				);

			}
			catch (oException) {
				alert("error");
			}
		}



                /*
                     Call the "render" method with no arguments since the
                     markup for this MenuBar already exists in the page.
                */

                oMenuBar.render();

            });


</script>





		<table>
		<tr>
		<td class="yui-skin-sam" id="yahoo-com">

		<!-- MENU start here -->
	   <div id="submission_tab_menu" class="yuimenubar yuimenubarnav">
			<div class="bd">
				<ul class="first-of-type">
				
					<!-- Submission Management Menu building -->  <!-- submission home page add= AddSubmission.do -->
					<li class="yuimenuitem"><a class="Servlet?dms_id=ea3769f105c4a99f531053adb49d276d" href="../CheckClearanceAction.do?TabPanelName=Submission_Panel&clear=yes">Create Submission</a></li>
					<li class="yuimenuitem"><a class="Servlet?dms_id=ea3769f105c4a99f531053adb49d276d" href="../FindSubmissionNBF.do?TabPanelName=Submission_Panel&clear=yes">Find Submission</a></li>
					
				 
				 
				 <!-- Change Password Menu building  -->
					
				 	
					
					<!-- logoff Menu building -->
					<li class="yuimenubaritem"><a class="Servlet?dms_id=97b4884f17f7f80e3f270952ffd9f9fd" href="../LoginOutAction.do">Log Off</a></li>
					<!-- <img border="0" src="../Images/logoff.jpg" width="18" height="18" ALT="">&nbsp;Log Off -->
					</ul>
					
				</div>
			</div>
</td>
</tr>
</table>

					</td>
				</tr>
				<tr>
					<td valign="top" width="100%" style="{border-left:1px solid #999999;}">
						<div id="Submission_Panel">
							

									




<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/CheckClearance.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/ZipCodeCommon.js"> </SCRIPT>






<form name="CheckClearance" method="post" action="/ClearanceAction.go" onsubmit="return Validate()"><input type="hidden" name="org.apache.struts.taglib.html.TOKEN" value="0fbbf5496154b67014eeac42532f84f7">
	
	
	
	
	
	
	
	
	
	<input type="hidden" name="answer(dbname)" value="java:/jdbc/libertyds">
	<input type="hidden" name="versionNum" value="1.0">
	<input type="hidden" name="frmtmpid" value="CUSTOMERDETAILSMICACARE">
	<input type="hidden" name="formName" value="form::Clearance">
	<table WIDTH="95%" ALIGN="left" BORDER="0" CELLSPACING="0"	CELLPADDING="0">
	<tr><td>
		<table WIDTH="90%" ALIGN="center" border="0" CELLSPACING="2" CELLPADDING="0">
			<tr>
				<td class="FormLabels" align="left" colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td class="NewSectionHead" colspan="5" align="center">CHECK	CLEARANCE</td>
			</tr>
			<tr>
				<td class="FormLabels" align="left" colspan="4">&nbsp;</td>
			</tr>			
				<tr>
					<td class="sectionhead" colspan="5" align="center">Agency Information</td>
				</tr>			
				<tr> 
					<td>&nbsp;</td>					
				</tr>				
			<tr>
					<td class="FormLabels" align="right" width="44%"> 
						Agency *&nbsp;&nbsp;
					</td>	
					<td class="links" width="20%">&nbsp;<input type="text" name="answer(AgencyName)" maxlength="60" size="60" value="" readonly="readonly" class="txtbox" id="AgencyName">
					</td>
					<td>	
						<IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="left" ALT="Search for Agency." onmouseover="this.style.cursor='hand';" onclick="return GoTOFindButtonLIU()">
					</td>									
				</tr>
			 		<tr><td>&nbsp;</td></tr>
			 		<input type="hidden" name="answer(Agency::AgencyId)" value="">	
    		
    		</table>
			<table WIDTH="90%" ALIGN="center" border="0" CELLSPACING="2" CELLPADDING="0">
			<tr>				
				<td class="sectionhead" colspan="5" align="center">Insured Information</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td class="FormLabels" width="40%" align="right">Insured Name Type&nbsp;&nbsp;</td>
				<td class="links" width="60%" style="Class:txtbox">
				<select name="answer(Object::Clearance::NameType)" onchange="showPersonInformation(this.form)" class="txtbox" id="NameType"><option value="Company" class="txtbox">Company</option>
					<option value="Person" class="txtbox">Person</option></select></td>				
			</tr>
			<tr id="company_legal_name1" >
				<td width="40%" class="FormLabels" align="right"	id="legalName1">Legal Name 1 *&nbsp;&nbsp;</td>
				<td class="links" width="60%">
				<input type="text" name="answer(Object::Clearance::LegalName1)" maxlength="50" size="50" value="" class="txtbox" id="LegalName1"></td>				
				
			</tr>
			<tr id="company_legal_name2">
				<td width="40%" class="FormLabels" align="right"	id="legalName2">Legal Name 2&nbsp;&nbsp;</td>
				<td class="links" width="60%">
				<input type="text" name="answer(Object::Clearance::LegalName2)" maxlength="50" size="50" value="" class="txtbox" id="LegalName2"></td>
				
			</tr>
			<tr id="personfirstname">
				<td width="40%" class="FormLabels" align="right" id="firstName">First Name *&nbsp;&nbsp;</td>
				<td class="links" width="60%">
				<input type="text" name="answer(Object::Clearance::FirstName)" maxlength="30" size="30" value="" class="txtbox" id="FirstName"></td>
				
			</tr>
			<tr id="personlastname">
				<td width="40%" class="FormLabels" align="right"	id="lastName">Last Name&nbsp;&nbsp;</td>
				<td class="links" width="60%">
				<input type="text" name="answer(Object::Clearance::LastName)" maxlength="30" size="30" value="" class="txtbox" id="LastName"></td>
				
			</tr>
			<tr id="insureddba">
				<td class="FormLabels" width="40%" align="right">Insured DBA&nbsp;&nbsp;</td>
				<td class="links" width="60%">
				<input type="text" name="answer(Object::Clearance::DBA)" maxlength="50" size="50" value="" class="txtbox" id="DBA"></td>
			</tr>
			<tr>
				<td class="FormLabels" width="40%" align="right">Zip Code *&nbsp;&nbsp;</td>
				<td class="links" width="60%">
				<input type="text" name="answer(Object::Clearance::Zipcode)" maxlength="5" size="5" value="" class="txtbox" id="Zip">				
				<!--Zipcode lookup start 05-06-2006--> <a
					href="../Servlet?dms_id=1d9995e4088318401a811432994a8c1f"
					title="Search for zip code, state, county"
					onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG
					SRC="../Images/zipcodefind.jpg" BORDER="0" align="top"
					ALT="Search for Zip code, City, State and County."></a></td>
				<!-- 05-06-2006 end-->
			</tr>
			<tr>
				<td class="FormLabels" align="right">Country&nbsp;&nbsp;</td>			
				<td class="links" style="Class:txtbox"><select name="answer(Object::Customer::Address::Country)" class="txtbox" id="Country"><option value="USA" class="txtbox">USA</option></select>
				</td>
			</tr>					
			<tr>
				<td width="40%" class="FormLabels" align="right">Proposed Effective Date *&nbsp;&nbsp;</td>
				<td class="links" width="60%">
				<input type="text" name="answer(Month)" maxlength="2" size="2" value="" onkeyup="validateDate(12,this,'Month');" class="txtbox" id="csdmm">&nbsp; <input type="text" name="answer(Date)" maxlength="2" size="2" value="" onkeyup="validateDate(31,this,'Date');" class="txtbox" id="csddd">&nbsp; <input type="text" name="answer(Year)" maxlength="4" size="4" value="" onkeyup="var dat = new Date();var currentyear = dat.getFullYear();validateDate(currentyear,this,'Year');" class="txtbox" id="csdyy">&nbsp;(MM/DD/YYYY)</td>
			</tr>
		</table>
		</td>
		</tr>
		<tr> <td>&nbsp;</td>
		</tr>
		<tr>
			<td align="center">
				<input type="submit" name="answer(button)" value="Check Clearance" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';" class="sbttn">
				<input type="button" name="answer(button)" value="Reset" onclick="return resetFields()" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';" class="sbttn" id="reset">
			</td>
		</tr>
		<tr> <td>&nbsp;</td>
		</tr>		
	</table>
	<input type="hidden" name="TabPanelName" value="Submission_Panel">
	<input type="hidden" name="answer(Object::Clearance::OwnerId)" value="12">
	<input type="hidden" name="answer(Object::Customer::City)" value="" id="City">
	<input type="hidden" name="answer(Object::Customer::County)" value="" id="County">
	<input type="hidden" name="answer(Object::Customer::State)" value="" id="State">
	<input type="hidden" name="answer(Object::Customer::CustomerName)" value="" id="customerName1">
	<input type="hidden" name="answer(Object::Customer::CustomerName2)" value="" id="customerName2">
	<input type="hidden" name="answer(Object::Customer::NameType)" value="" id="HNameType">
	<input type="hidden" name="answer(Object::Customer::DBA)" value="" id="HDBA">
	<input type="hidden" name="answer(Object::Customer::Zip)" value="" id="HZip">	
	<input type="hidden" name="answer(Object::Submission::Status)" value="In Progress">
	<input type="hidden" name="answer(Object::Customer::Status)" value="In Progress">
	<input type="hidden" name="answer(Object::Submission::ClearanceStatus)" value="Cleared">
	<input type="hidden" name="answer(Object::isClearance)" value="Y">
	<input type="hidden" name="answer(Object::Clearance::LobId)" value="1">
	<input type="hidden" name="answer(Object::Clearance::ProposedEffectiveDate)" value="" id="ProposedEffectiveDate">
	<input type="hidden" name="answer(Object::Clearance::ProposedEffectiveDate1)" value="" id="ProposedEffectiveDate1">
	<input type="hidden" name="answer(Object::Submission::CreatedBy)" value="underwriter1">   
   	<input type="hidden" name="answer(Object::Clearance::LobId)" value="1">
   	<input type="hidden" name="answer(Object::PageType)" value="CHECK_CLEARANCE">
   	<input type="hidden" name="answer(ownerId)" value="12" id="ownerIdfrmjsp">
   	
</form>
<SCRIPT type="text/javaScript">	
var formElement=document.forms[0];

function resetFields(){
	formElement.LegalName1.value = "";
	formElement.LegalName2.value = "";
	formElement.FirstName.value = "";
	formElement.LastName.value = "";
	formElement.Zip.value = "";
	formElement.DBA.value = "";
	formElement.AgencyName.value = "";
}


	showPersonInformation(formElement);
  		var currdate = new Date(); 
  		var month = currdate.getMonth()+1;   		
  		if(currdate.getMonth() < 10)
  			document.getElementById('csdmm').value=new String("0"+month);
  		else 
  			document.getElementById('csdmm').value=month;  			
  		if(currdate.getDate() < 10)
  			document.getElementById('csddd').value=new String("0"+currdate.getDate());
  		else 			
  			document.getElementById('csddd').value=currdate.getDate();  				
  		document.getElementById('csdyy').value=currdate.getFullYear();  		  
</SCRIPT>
							
						</div>
					</td>
				</tr>
			</table>
        </div>
		<!-- Insured & Exposure Tab Definition -->
        <div id="insured_tab">
   			<table width="100%" cellpadding="0" cellspacing="0" align="center" style="height: 100%" border="0">
				<tr class="yui-skin-sam" id="yahoo-com" >
					<td valign="top" class="yui-skin-sam" id="yahoo-com" width="100%" style="{border-left:1px solid #336699;}">
						










<script type="text/javascript">

        <!-- Page-specific script for dropdown menu-->

            /*
                 Initialize and render the MenuBar when its elements are ready
                 to be scripted.
            */

            YAHOO.util.Event.onContentReady("insured_tab_menu", function () {

                var Dom = YAHOO.util.Dom,
                    oAnim;  // Animation instance


                /*
                     "beforeshow" event handler for each submenu of the MenuBar
                     instance, used to setup certain style properties before
                     the menu is animated.
                */

                function onSubmenuBeforeShow(p_sType, p_sArgs) {

                    var oBody,
                        oShadow,
                        oUL;


                    if (this.parent) {

                        /*
                             Get a reference to the Menu's shadow element and
                             set its "height" property to "0px" to syncronize
                             it with the height of the Menu instance.
                        */

                        oShadow = this.element.lastChild;
                        oShadow.style.height = "0px";


                        /*
                            Stop the Animation instance if it is currently
                            animating a Menu.
                        */

                        if (oAnim && oAnim.isAnimated()) {

                            oAnim.stop();
                            oAnim = null;

                        }


                        /*
                            Set the body element's "overflow" property to
                            "hidden" to clip the display of its negatively
                            positioned <ul> element.
                        */

                        oBody = this.body;


                        /*
                            There is a bug in gecko-based browsers where
                            an element whose "position" property is set to
                            "absolute" and "overflow" property is set to
                            "hidden" will not render at the correct width when
                            its offsetParent's "position" property is also
                            set to "absolute."  It is possible to work around
                            this bug by specifying a value for the width
                            property in addition to overflow.
                        */

                        if (this.parent &&
                            !(this.parent instanceof YAHOO.widget.MenuBarItem) &&
                            YAHOO.env.ua.gecko) {

                            Dom.setStyle(oBody, "width", (oBody.clientWidth + "px"));

                        }


                        Dom.setStyle(oBody, "overflow", "hidden");


                        /*
                            Set the <ul> element's "marginTop" property
                            to a negative value so that the Menu's height
                            collapses.
                        */

                        oUL = oBody.getElementsByTagName("ul")[0];

                        Dom.setStyle(oUL, "marginTop", ("-" + oUL.offsetHeight + "px"));

                    }

                }


                /*
                    "tween" event handler for the Anim instance, used to
                    syncronize the size and position of the Menu instance's
                    shadow and iframe shim (if it exists) with its
                    changing height.
                */

                function onTween(p_sType, p_aArgs, p_oShadow) {

                    if (this.cfg.getProperty("iframe")) {

                        this.syncIframe();

                    }

                    if (p_oShadow) {

                        p_oShadow.style.height = this.element.offsetHeight + "px";

                    }

                }


                /*
                    "complete" event handler for the Anim instance, used to
                    remove style properties that were animated so that the
                    Menu instance can be displayed at its final height.
                */

                function onAnimationComplete(p_sType, p_aArgs, p_oShadow) {

                    var oBody = this.body,
                        oUL = oBody.getElementsByTagName("ul")[0];

                    if (p_oShadow) {

                        p_oShadow.style.height = this.element.offsetHeight + "px";

                    }

                    Dom.setStyle(oUL, "marginTop", "");
                    Dom.setStyle(oBody, "overflow", "");


                    if (this.parent &&
                        !(this.parent instanceof YAHOO.widget.MenuBarItem) &&
                        YAHOO.env.ua.gecko) {

                        Dom.setStyle(oBody, "width", "");

                    }

                }


                /*
                     "show" event handler for each submenu of the MenuBar
                     instance - used to kick off the animation of the
                     <ul> element.
                */

                function onSubmenuShow(p_sType, p_sArgs) {

                    var oElement,
                        oShadow,
                        oUL;

                    if (this.parent) {

                        oElement = this.element;
                        oShadow = oElement.lastChild;
                        oUL = this.body.getElementsByTagName("ul")[0];


                        /*
                             Animate the <ul> element's "marginTop" style
                             property to a value of 0.
                        */

                        oAnim = new YAHOO.util.Anim(oUL,
                            { marginTop: { to: 0 } },
                            .5, YAHOO.util.Easing.easeOut);


                        oAnim.onStart.subscribe(function () {

                            oShadow.style.height = "100%";

                        });


                        oAnim.animate();


                        /*
                            Subscribe to the Anim instance's "tween" event for
                            IE to syncronize the size and position of a
                            submenu's shadow and iframe shim (if it exists)
                            with its changing height.
                        */

                        if (YAHOO.env.ua.ie) {

                            oShadow.style.height = oElement.offsetHeight + "px";


                            /*
                                Subscribe to the Anim instance's "tween"
                                event, passing a reference Menu's shadow
                                element and making the scope of the event
                                listener the Menu instance.
                            */

                            oAnim.onTween.subscribe(onTween, oShadow, this);

                        }


                        /*
                            Subscribe to the Anim instance's "complete" event,
                            passing a reference Menu's shadow element and making
                            the scope of the event listener the Menu instance.
                        */

                        oAnim.onComplete.subscribe(onAnimationComplete, oShadow, this);

                    }

                }
                /*
                     Instantiate a MenuBar:  The first argument passed to the
                     constructor is the id of the element in the page
                     representing the MenuBar; the second is an object literal
                     of configuration properties.
                */

                var oMenuBar = new YAHOO.widget.MenuBar("insured_tab_menu", {
                                                            autosubmenudisplay: true,
                                                            hidedelay: 750,
                                                            lazyload: true });


                /*
                     Subscribe to the "beforeShow" and "show" events for
                     each submenu of the MenuBar instance.
                */

                oMenuBar.subscribe("beforeShow", onSubmenuBeforeShow);
                oMenuBar.subscribe("show", onSubmenuShow);
		oMenuBar.subscribe("click", onClick);

		// Define a handler for the "click" event
		 function onClick(p_sType, p_aArgs) {
			 var oEvent = p_aArgs[0],    // DOM Event
			oMenuItem = p_aArgs[1]; // YAHOO.widget.MenuItem instance


			 // Alert the type of the DOM event
//			 alert(oEvent.type);
//
			 // If a MenuItem was clicked, alert the value of its text label
			 if (oMenuItem) {
//				 alert(oMenuItem.cfg.getProperty("text") + "----abc");
//				 alert("menuItem-" + oMenuItem.cfg.getProperty("target"));

			 }
/*
			 alert("onClick: index: " + this.index +
						", text: " + //this.cfg.getProperty("text") +
						", value: " + p_oValue);
*/
			loadTable(oMenuItem.cfg.getProperty("target"));

		 }

		function loadTable(url) {
			var divObj = $('Insured_Panel');
//			alert(url);
			try {
				new Ajax.Updater(
					"Insured_Panel",
					url,
					{
						method: "get",
						onComplete: function(){
								//Do something
							}
					}
				);

			}
			catch (oException) {
				alert("error");
			}
		}



                /*
                     Call the "render" method with no arguments since the
                     markup for this MenuBar already exists in the page.
                */

                oMenuBar.render();

            });


</script>





		<table>
		<tr>
		<td class="yui-skin-sam" id="yahoo-com">

		<!-- MENU start here -->
	   <div id="insured_tab_menu" class="yuimenubar yuimenubarnav">
			<div class="bd">
				<ul class="first-of-type">
				
					<!-- Insured Management Menu building -->
					
					
							
					<li class="yuimenuitem"><a class="Servlet?dms_id=ea3769f105c4a99f531053adb49d276d" href="../FindInsured.do?TabPanelName=Insured_Panel&clear=yes">Find Insured</a></li>
					
					<!-- static documents Menu building 
					<li class="yuimenubaritem"><a class="Servlet?dms_id=97b4884f17f7f80e3f270952ffd9f9fd" href="../documents/Documents.jsp?TabPanelName=Insured_Panel">Documents</a>
							<div id="insured_tab_staticdocuments" class="yuimenu">
								<div class="bd">
									<ul>
										<li class="yuimenuitem"><a class="Servlet?dms_id=ea3769f105c4a99f531053adb49d276d" href="../documents/AdminForms.jsp?TabPanelName=Insured_Panel">Administrative Forms</a></li>
											<li class="yuimenuitem"><a class="Servlet?dms_id=ea3769f105c4a99f531053adb49d276d" href="../documents/BenefitAndContact.jsp?TabPanelName=Insured_Panel">Benefit Summary & Contact Info</a></li>
									</ul>
								</div>
							</div>
						</li> -->
					
				 
				 
				 <!-- Change Password Menu building  -->
					
				 	
					
					<!-- logoff Menu building -->
					<li class="yuimenubaritem"><a class="Servlet?dms_id=97b4884f17f7f80e3f270952ffd9f9fd" href="../LoginOutAction.do">Log Off</a></li>
					<!-- <img border="0" src="../Images/logoff.jpg" width="18" height="18" ALT="">&nbsp;Log Off -->
					</ul>
					
				</div>
			</div>
</td>
</tr>
</table>

					</td>
				</tr>
				<tr>
					<td valign="top" width="100%" style="{border-left:1px solid #999999;}">
						<div id="Insured_Panel">
							
						</div>
					</td>
				</tr>
			</table>
        </div>
		<!-- Quote & Shop Tab Definition -->
		
		<div id="quote_tab">
   			<table width="100%" cellpadding="0" cellspacing="0" align="center" style="height: 100%" border="0">
				<tr class="yui-skin-sam" id="yahoo-com" >
					<td valign="top" class="yui-skin-sam" id="yahoo-com" width="100%" style="{border-left:1px solid #999999;}">
						










<script type="text/javascript">

        <!-- Page-specific script for dropdown menu-->

            /*
                 Initialize and render the MenuBar when its elements are ready
                 to be scripted.
            */

            YAHOO.util.Event.onContentReady("quote_tab_menu", function () {

                var Dom = YAHOO.util.Dom,
                    oAnim;  // Animation instance


                /*
                     "beforeshow" event handler for each submenu of the MenuBar
                     instance, used to setup certain style properties before
                     the menu is animated.
                */

                function onSubmenuBeforeShow(p_sType, p_sArgs) {

                    var oBody,
                        oShadow,
                        oUL;


                    if (this.parent) {

                        /*
                             Get a reference to the Menu's shadow element and
                             set its "height" property to "0px" to syncronize
                             it with the height of the Menu instance.
                        */

                        oShadow = this.element.lastChild;
                        oShadow.style.height = "0px";


                        /*
                            Stop the Animation instance if it is currently
                            animating a Menu.
                        */

                        if (oAnim && oAnim.isAnimated()) {

                            oAnim.stop();
                            oAnim = null;

                        }


                        /*
                            Set the body element's "overflow" property to
                            "hidden" to clip the display of its negatively
                            positioned <ul> element.
                        */

                        oBody = this.body;


                        /*
                            There is a bug in gecko-based browsers where
                            an element whose "position" property is set to
                            "absolute" and "overflow" property is set to
                            "hidden" will not render at the correct width when
                            its offsetParent's "position" property is also
                            set to "absolute."  It is possible to work around
                            this bug by specifying a value for the width
                            property in addition to overflow.
                        */

                        if (this.parent &&
                            !(this.parent instanceof YAHOO.widget.MenuBarItem) &&
                            YAHOO.env.ua.gecko) {

                            Dom.setStyle(oBody, "width", (oBody.clientWidth + "px"));

                        }


                        Dom.setStyle(oBody, "overflow", "hidden");


                        /*
                            Set the <ul> element's "marginTop" property
                            to a negative value so that the Menu's height
                            collapses.
                        */

                        oUL = oBody.getElementsByTagName("ul")[0];

                        Dom.setStyle(oUL, "marginTop", ("-" + oUL.offsetHeight + "px"));

                    }

                }


                /*
                    "tween" event handler for the Anim instance, used to
                    syncronize the size and position of the Menu instance's
                    shadow and iframe shim (if it exists) with its
                    changing height.
                */

                function onTween(p_sType, p_aArgs, p_oShadow) {

                    if (this.cfg.getProperty("iframe")) {

                        this.syncIframe();

                    }

                    if (p_oShadow) {

                        p_oShadow.style.height = this.element.offsetHeight + "px";

                    }

                }


                /*
                    "complete" event handler for the Anim instance, used to
                    remove style properties that were animated so that the
                    Menu instance can be displayed at its final height.
                */

                function onAnimationComplete(p_sType, p_aArgs, p_oShadow) {

                    var oBody = this.body,
                        oUL = oBody.getElementsByTagName("ul")[0];

                    if (p_oShadow) {

                        p_oShadow.style.height = this.element.offsetHeight + "px";

                    }

                    Dom.setStyle(oUL, "marginTop", "");
                    Dom.setStyle(oBody, "overflow", "");


                    if (this.parent &&
                        !(this.parent instanceof YAHOO.widget.MenuBarItem) &&
                        YAHOO.env.ua.gecko) {

                        Dom.setStyle(oBody, "width", "");

                    }

                }


                /*
                     "show" event handler for each submenu of the MenuBar
                     instance - used to kick off the animation of the
                     <ul> element.
                */

                function onSubmenuShow(p_sType, p_sArgs) {

                    var oElement,
                        oShadow,
                        oUL;

                    if (this.parent) {

                        oElement = this.element;
                        oShadow = oElement.lastChild;
                        oUL = this.body.getElementsByTagName("ul")[0];


                        /*
                             Animate the <ul> element's "marginTop" style
                             property to a value of 0.
                        */

                        oAnim = new YAHOO.util.Anim(oUL,
                            { marginTop: { to: 0 } },
                            .5, YAHOO.util.Easing.easeOut);


                        oAnim.onStart.subscribe(function () {

                            oShadow.style.height = "100%";

                        });


                        oAnim.animate();


                        /*
                            Subscribe to the Anim instance's "tween" event for
                            IE to syncronize the size and position of a
                            submenu's shadow and iframe shim (if it exists)
                            with its changing height.
                        */

                        if (YAHOO.env.ua.ie) {

                            oShadow.style.height = oElement.offsetHeight + "px";


                            /*
                                Subscribe to the Anim instance's "tween"
                                event, passing a reference Menu's shadow
                                element and making the scope of the event
                                listener the Menu instance.
                            */

                            oAnim.onTween.subscribe(onTween, oShadow, this);

                        }


                        /*
                            Subscribe to the Anim instance's "complete" event,
                            passing a reference Menu's shadow element and making
                            the scope of the event listener the Menu instance.
                        */

                        oAnim.onComplete.subscribe(onAnimationComplete, oShadow, this);

                    }

                }
                /*
                     Instantiate a MenuBar:  The first argument passed to the
                     constructor is the id of the element in the page
                     representing the MenuBar; the second is an object literal
                     of configuration properties.
                */

                var oMenuBar = new YAHOO.widget.MenuBar("quote_tab_menu", {
                                                            autosubmenudisplay: true,
                                                            hidedelay: 750,
                                                            lazyload: false });


                /*
                     Subscribe to the "beforeShow" and "show" events for
                     each submenu of the MenuBar instance.
                */

                oMenuBar.subscribe("beforeShow", onSubmenuBeforeShow);
                oMenuBar.subscribe("show", onSubmenuShow);
		oMenuBar.subscribe("click", onClick);

		// Define a handler for the "click" event
		 function onClick(p_sType, p_aArgs) {
			 var oEvent = p_aArgs[0],    // DOM Event
			oMenuItem = p_aArgs[1]; // YAHOO.widget.MenuItem instance


			 // Alert the type of the DOM event
//			 alert(oEvent.type);
//
			 // If a MenuItem was clicked, alert the value of its text label
			 if (oMenuItem) {
//				 alert(oMenuItem.cfg.getProperty("text") + "----abc");
//				 alert("menuItem-" + oMenuItem.cfg.getProperty("target"));

			 }
/*
			 alert("onClick: index: " + this.index +
						", text: " + //this.cfg.getProperty("text") +
						", value: " + p_oValue);
*/
			loadTable(oMenuItem.cfg.getProperty("target"));

		 }

		function loadTable(url) {
			var divObj = $('Quote_Panel');
//			alert(url);
			try {
				new Ajax.Updater(
					"Quote_Panel",
					url,
					{
						method: "get",
						onComplete: function(){
								//Do something
							}
					}
				);

			}
			catch (oException) {
				alert("error");
			}
		}



                /*
                     Call the "render" method with no arguments since the
                     markup for this MenuBar already exists in the page.
                */

                oMenuBar.render();

            });


</script>



<table>
	<tr>
		<td class="yui-skin-sam" id="yahoo-com">
			<!-- MENU start here -->
	   <div id="quote_tab_menu" class="yuimenubar yuimenubarnav">
			<div class="bd">
				<ul class="first-of-type">
				
					<!-- Quote Menu building -->
					
					
					<li class="yuimenubaritem"><a class="Servlet?dms_id=97b4884f17f7f80e3f270952ffd9f9fd" href="../quote/FindQuote.jsp?TabPanelName=Quote_Panel">Find Quote</a> </li>
					
					<!-- static documents Menu building -->
					<!--
					<li class="yuimenubaritem"><a class="Servlet?dms_id=97b4884f17f7f80e3f270952ffd9f9fd" href="../documents/Documents.jsp?TabPanelName=Quote_Panel">Documents</a>
							<div id="quote_tab_staticdocuments" class="yuimenu">
								<div class="bd">
									<ul>
										<li class="yuimenuitem"><a class="Servlet?dms_id=ea3769f105c4a99f531053adb49d276d" href="../documents/AdminForms.jsp?TabPanelName=Quote_Panel">Administrative Forms</a></li>
											<li class="yuimenuitem"><a class="Servlet?dms_id=ea3769f105c4a99f531053adb49d276d" href="../documents/BenefitAndContact.jsp?TabPanelName=Quote_Panel">Benefit Summary & Contact Info</a></li>
									</ul>
								</div>
							</div>
						</li>
					 -->					
				 		
					
					<!-- logoff Menu building -->
					<li class="yuimenubaritem"><a class="Servlet?dms_id=97b4884f17f7f80e3f270952ffd9f9fd" href="../LoginOutAction.do">Log Off</a></li>
					<!-- <img border="0" src="../Images/logoff.jpg" width="18" height="18" ALT="">&nbsp;Log Off -->
					</ul>
				</div>
			</div>
		
		</td>
	</tr>
</table>

					</td>
				</tr>
				<tr>
					<td valign="top" width="100%" style="{border-left:1px solid #999999;}">
						<div id="Quote_Panel">
							
						</div>
					</td>
				</tr>
			</table>
        </div>
		<!-- Policy Tab Definition -->
        <div id="policy_tab">
   			<table width="100%" cellpadding="0" cellspacing="0" align="center" style="height: 100%" border="0">
				<tr class="yui-skin-sam" id="yahoo-com" >
					<td valign="top" class="yui-skin-sam" id="yahoo-com" width="100%" style="{border-left:1px solid #999999;}">
							










<script type="text/javascript" >

        <!-- Page-specific script for dropdown menu-->

            /*
                 Initialize and render the MenuBar when its elements are ready
                 to be scripted.
            */

            YAHOO.util.Event.onContentReady("policy_tab_menu", function () {

                var Dom = YAHOO.util.Dom,
                    oAnim;  // Animation instance


                /*
                     "beforeshow" event handler for each submenu of the MenuBar
                     instance, used to setup certain style properties before
                     the menu is animated.
                */

                function onSubmenuBeforeShow(p_sType, p_sArgs) {

                    var oBody,
                        oShadow,
                        oUL;


                    if (this.parent) {

                        /*
                             Get a reference to the Menu's shadow element and
                             set its "height" property to "0px" to syncronize
                             it with the height of the Menu instance.
                        */

                        oShadow = this.element.lastChild;
                        oShadow.style.height = "0px";


                        /*
                            Stop the Animation instance if it is currently
                            animating a Menu.
                        */

                        if (oAnim && oAnim.isAnimated()) {

                            oAnim.stop();
                            oAnim = null;

                        }


                        /*
                            Set the body element's "overflow" property to
                            "hidden" to clip the display of its negatively
                            positioned <ul> element.
                        */

                        oBody = this.body;


                        /*
                            There is a bug in gecko-based browsers where
                            an element whose "position" property is set to
                            "absolute" and "overflow" property is set to
                            "hidden" will not render at the correct width when
                            its offsetParent's "position" property is also
                            set to "absolute."  It is possible to work around
                            this bug by specifying a value for the width
                            property in addition to overflow.
                        */

                        if (this.parent &&
                            !(this.parent instanceof YAHOO.widget.MenuBarItem) &&
                            YAHOO.env.ua.gecko) {

                            Dom.setStyle(oBody, "width", (oBody.clientWidth + "px"));

                        }


                        Dom.setStyle(oBody, "overflow", "hidden");


                        /*
                            Set the <ul> element's "marginTop" property
                            to a negative value so that the Menu's height
                            collapses.
                        */

                        oUL = oBody.getElementsByTagName("ul")[0];

                        Dom.setStyle(oUL, "marginTop", ("-" + oUL.offsetHeight + "px"));

                    }

                }


                /*
                    "tween" event handler for the Anim instance, used to
                    syncronize the size and position of the Menu instance's
                    shadow and iframe shim (if it exists) with its
                    changing height.
                */

                function onTween(p_sType, p_aArgs, p_oShadow) {

                    if (this.cfg.getProperty("iframe")) {

                        this.syncIframe();

                    }

                    if (p_oShadow) {

                        p_oShadow.style.height = this.element.offsetHeight + "px";

                    }

                }


                /*
                    "complete" event handler for the Anim instance, used to
                    remove style properties that were animated so that the
                    Menu instance can be displayed at its final height.
                */

                function onAnimationComplete(p_sType, p_aArgs, p_oShadow) {

                    var oBody = this.body,
                        oUL = oBody.getElementsByTagName("ul")[0];

                    if (p_oShadow) {

                        p_oShadow.style.height = this.element.offsetHeight + "px";

                    }

                    Dom.setStyle(oUL, "marginTop", "");
                    Dom.setStyle(oBody, "overflow", "");


                    if (this.parent &&
                        !(this.parent instanceof YAHOO.widget.MenuBarItem) &&
                        YAHOO.env.ua.gecko) {

                        Dom.setStyle(oBody, "width", "");

                    }

                }


                /*
                     "show" event handler for each submenu of the MenuBar
                     instance - used to kick off the animation of the
                     <ul> element.
                */

                function onSubmenuShow(p_sType, p_sArgs) {

                    var oElement,
                        oShadow,
                        oUL;

                    if (this.parent) {

                        oElement = this.element;
                        oShadow = oElement.lastChild;
                        oUL = this.body.getElementsByTagName("ul")[0];


                        /*
                             Animate the <ul> element's "marginTop" style
                             property to a value of 0.
                        */

                        oAnim = new YAHOO.util.Anim(oUL,
                            { marginTop: { to: 0 } },
                            .5, YAHOO.util.Easing.easeOut);


                        oAnim.onStart.subscribe(function () {

                            oShadow.style.height = "100%";

                        });


                        oAnim.animate();


                        /*
                            Subscribe to the Anim instance's "tween" event for
                            IE to syncronize the size and position of a
                            submenu's shadow and iframe shim (if it exists)
                            with its changing height.
                        */

                        if (YAHOO.env.ua.ie) {

                            oShadow.style.height = oElement.offsetHeight + "px";


                            /*
                                Subscribe to the Anim instance's "tween"
                                event, passing a reference Menu's shadow
                                element and making the scope of the event
                                listener the Menu instance.
                            */

                            oAnim.onTween.subscribe(onTween, oShadow, this);

                        }


                        /*
                            Subscribe to the Anim instance's "complete" event,
                            passing a reference Menu's shadow element and making
                            the scope of the event listener the Menu instance.
                        */

                        oAnim.onComplete.subscribe(onAnimationComplete, oShadow, this);

                    }

                }
                /*
                     Instantiate a MenuBar:  The first argument passed to the
                     constructor is the id of the element in the page
                     representing the MenuBar; the second is an object literal
                     of configuration properties.
                */

                var oMenuBar = new YAHOO.widget.MenuBar("policy_tab_menu", {
                                                            autosubmenudisplay: true,
                                                            hidedelay: 750,
                                                            lazyload: true });


                /*
                     Subscribe to the "beforeShow" and "show" events for
                     each submenu of the MenuBar instance.
                */

                oMenuBar.subscribe("beforeShow", onSubmenuBeforeShow);
                oMenuBar.subscribe("show", onSubmenuShow);
		oMenuBar.subscribe("click", onClick);

		// Define a handler for the "click" event
		 function onClick(p_sType, p_aArgs) {
			 var oEvent = p_aArgs[0],    // DOM Event
			oMenuItem = p_aArgs[1]; // YAHOO.widget.MenuItem instance


			 // Alert the type of the DOM event
//			 alert(oEvent.type);

			 // If a MenuItem was clicked, alert the value of its text label
			 if (oMenuItem) {
//				 alert(oMenuItem.cfg.getProperty("text") + "----abc");
//				 alert("menuItem-" + oMenuItem.cfg.getProperty("target"));

			 }
/*
			 alert("onClick: index: " + this.index +
						", text: " + //this.cfg.getProperty("text") +
						", value: " + p_oValue);
*/
			loadTable(oMenuItem.cfg.getProperty("target"));

		 }

		function loadTable(url) {
			var divObj = $('Policy_Panel');
			new Ajax.Updater(
				"Policy_Panel",
				url,
				{
				method: "get",
				onComplete: function(){
					//Do something
				}
				}
			);
		}

                /*
                     Call the "render" method with no arguments since the
                     markup for this MenuBar already exists in the page.
                */

                oMenuBar.render();

            }

            );


</script>



		<table>
		<tr>
		<td class="yui-skin-sam" id="yahoo-com">

		<!-- MENU start here -->
	   <div id="policy_tab_menu" class="yuimenubar yuimenubarnav">
			<div class="bd">
				<ul class="first-of-type">
					<!-- Policy Menu building -->
					<li class="yuimenubaritem"><a class="Servlet?dms_id=97b4884f17f7f80e3f270952ffd9f9fd" href="/SearchPolicyDisplayAction.do?TabPanelName=Policy_Panel">Find Policy</a></li>
					
					
					<!-- static documents Menu building -->
					<!-- 
					<li class="yuimenubaritem"><a class="Servlet?dms_id=97b4884f17f7f80e3f270952ffd9f9fd" href="../documents/Documents.jsp?TabPanelName=Policy_Panel">Documents</a>
							<div id="policy_tab_staticdocuments" class="yuimenu">
								<div class="bd">
									<ul>
										<li class="yuimenuitem"><a class="Servlet?dms_id=ea3769f105c4a99f531053adb49d276d" href="../documents/AdminForms.jsp?TabPanelName=Policy_Panel">Administrative Forms</a></li>
											<li class="yuimenuitem"><a class="Servlet?dms_id=ea3769f105c4a99f531053adb49d276d" href="../documents/BenefitAndContact.jsp?TabPanelName=Policy_Panel">Benefit Summary & Contact Info</a></li>
									</ul>
								</div>
							</div>
						</li>
					 -->
					<!-- logoff Menu building -->
					<li class="yuimenubaritem"><a class="Servlet?dms_id=97b4884f17f7f80e3f270952ffd9f9fd" href="../LoginOutAction.do">Log Off</a></li>
					<!-- <img border="0" src="../Images/logoff.jpg" width="18" height="18" ALT="">&nbsp;Log Off -->
					</ul>
				</div>
			</div>
</td>
</tr>
</table>

					</td>
				</tr>
				<tr>
					<td valign="top" width="100%" style="{border-left:1px solid #999999;}">
						<div id="Policy_Panel">
							
						</div>
					</td>
				</tr>
			</table>
        </div>
		

		<!-- Search Tab Definition -->
		<div id="search_tab">
			<table width="100%" cellpadding="0" cellspacing="0" align="center" style="height: 100%" border="0">
				<tr class="yui-skin-sam" id="yahoo-com" >
					<td valign="top" class="yui-skin-sam" id="yahoo-com" width="100%" style="{border-left:1px solid #999999;}">
							<!--
 * Copyright 2002-2009 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
-->












<script type="text/javascript">
        <!-- Page-specific script for dropdown menu-->

            /*
                 Initialize and render the MenuBar when its elements are ready
                 to be scripted.
            */

            YAHOO.util.Event.onContentReady("s_tab_menu", function () {

                var Dom = YAHOO.util.Dom,
                    oAnim;  // Animation instance


                /*
                     "beforeshow" event handler for each submenu of the MenuBar
                     instance, used to setup certain style properties before
                     the menu is animated.
                */

                function onSubmenuBeforeShow(p_sType, p_sArgs) {

                    var oBody,
                        oShadow,
                        oUL;


                    if (this.parent) {

                        /*
                             Get a reference to the Menu's shadow element and
                             set its "height" property to "0px" to syncronize
                             it with the height of the Menu instance.
                        */

                        oShadow = this.element.lastChild;
                        oShadow.style.height = "0px";


                        /*
                            Stop the Animation instance if it is currently
                            animating a Menu.
                        */

                        if (oAnim && oAnim.isAnimated()) {

                            oAnim.stop();
                            oAnim = null;

                        }


                        /*
                            Set the body element's "overflow" property to
                            "hidden" to clip the display of its negatively
                            positioned <ul> element.
                        */

                        oBody = this.body;


                        /*
                            There is a bug in gecko-based browsers where
                            an element whose "position" property is set to
                            "absolute" and "overflow" property is set to
                            "hidden" will not render at the correct width when
                            its offsetParent's "position" property is also
                            set to "absolute."  It is possible to work around
                            this bug by specifying a value for the width
                            property in addition to overflow.
                        */

                        if (this.parent &&
                            !(this.parent instanceof YAHOO.widget.MenuBarItem) &&
                            YAHOO.env.ua.gecko) {

                            Dom.setStyle(oBody, "width", (oBody.clientWidth + "px"));

                        }


                        Dom.setStyle(oBody, "overflow", "hidden");


                        /*
                            Set the <ul> element's "marginTop" property
                            to a negative value so that the Menu's height
                            collapses.
                        */

                        oUL = oBody.getElementsByTagName("ul")[0];

                        Dom.setStyle(oUL, "marginTop", ("-" + oUL.offsetHeight + "px"));

                    }

                }


                /*
                    "tween" event handler for the Anim instance, used to
                    syncronize the size and position of the Menu instance's
                    shadow and iframe shim (if it exists) with its
                    changing height.
                */

                function onTween(p_sType, p_aArgs, p_oShadow) {

                    if (this.cfg.getProperty("iframe")) {

                        this.syncIframe();

                    }

                    if (p_oShadow) {

                        p_oShadow.style.height = this.element.offsetHeight + "px";

                    }

                }


                /*
                    "complete" event handler for the Anim instance, used to
                    remove style properties that were animated so that the
                    Menu instance can be displayed at its final height.
                */

                function onAnimationComplete(p_sType, p_aArgs, p_oShadow) {

                    var oBody = this.body,
                        oUL = oBody.getElementsByTagName("ul")[0];

                    if (p_oShadow) {

                        p_oShadow.style.height = this.element.offsetHeight + "px";

                    }

                    Dom.setStyle(oUL, "marginTop", "");
                    Dom.setStyle(oBody, "overflow", "");


                    if (this.parent &&
                        !(this.parent instanceof YAHOO.widget.MenuBarItem) &&
                        YAHOO.env.ua.gecko) {

                        Dom.setStyle(oBody, "width", "");

                    }

                }


                /*
                     "show" event handler for each submenu of the MenuBar
                     instance - used to kick off the animation of the
                     <ul> element.
                */

                function onSubmenuShow(p_sType, p_sArgs) {

                    var oElement,
                        oShadow,
                        oUL;

                    if (this.parent) {

                        oElement = this.element;
                        oShadow = oElement.lastChild;
                        oUL = this.body.getElementsByTagName("ul")[0];


                        /*
                             Animate the <ul> element's "marginTop" style
                             property to a value of 0.
                        */

                        oAnim = new YAHOO.util.Anim(oUL,
                            { marginTop: { to: 0 } },
                            .5, YAHOO.util.Easing.easeOut);


                        oAnim.onStart.subscribe(function () {

                            oShadow.style.height = "100%";

                        });


                        oAnim.animate();


                        /*
                            Subscribe to the Anim instance's "tween" event for
                            IE to syncronize the size and position of a
                            submenu's shadow and iframe shim (if it exists)
                            with its changing height.
                        */

                        if (YAHOO.env.ua.ie) {

                            oShadow.style.height = oElement.offsetHeight + "px";


                            /*
                                Subscribe to the Anim instance's "tween"
                                event, passing a reference Menu's shadow
                                element and making the scope of the event
                                listener the Menu instance.
                            */

                            oAnim.onTween.subscribe(onTween, oShadow, this);

                        }


                        /*
                            Subscribe to the Anim instance's "complete" event,
                            passing a reference Menu's shadow element and making
                            the scope of the event listener the Menu instance.
                        */

                        oAnim.onComplete.subscribe(onAnimationComplete, oShadow, this);

                    }

                }
                /*
                     Instantiate a MenuBar:  The first argument passed to the
                     constructor is the id of the element in the page
                     representing the MenuBar; the second is an object literal
                     of configuration properties.
                */

                var oMenuBar = new YAHOO.widget.MenuBar("s_tab_menu", {
                                                            autosubmenudisplay: true,
                                                            hidedelay: 750,
                                                            lazyload: true });


                /*
                     Subscribe to the "beforeShow" and "show" events for
                     each submenu of the MenuBar instance.
                */

                oMenuBar.subscribe("beforeShow", onSubmenuBeforeShow);
                oMenuBar.subscribe("show", onSubmenuShow);
		oMenuBar.subscribe("click", onClick);

		// Define a handler for the "click" event
		 function onClick(p_sType, p_aArgs) {
			 var oEvent = p_aArgs[0],    // DOM Event
			oMenuItem = p_aArgs[1]; // YAHOO.widget.MenuItem instance


			 // Alert the type of the DOM event
//			 alert(oEvent.type);

			 // If a MenuItem was clicked, alert the value of its text label
			 if (oMenuItem) {
//				 alert(oMenuItem.cfg.getProperty("text") + "----abc");
//				 alert("menuItem-" + oMenuItem.cfg.getProperty("target"));

			 }
/*
			 alert("onClick: index: " + this.index +
						", text: " + //this.cfg.getProperty("text") +
						", value: " + p_oValue);
*/
			loadTable(oMenuItem.cfg.getProperty("target"));

		 }

		function loadTable(url) {
			var divObj = $('Search_Panel');
			new Ajax.Updater(
				"Search_Panel",
				url,
				{
				method: "get",
				onComplete: function(){
					//Do something
				}
				}
			);
		}


                /*
                     Call the "render" method with no arguments since the
                     markup for this MenuBar already exists in the page.
                */

                oMenuBar.render();

            });


</script>




		<table>
		<tr>
		<td class="yui-skin-sam" id="yahoo-com">

		<!-- MENU start here -->
	   <div id="s_tab_menu" class="yuimenubar yuimenubarnav">
			<div class="bd">
				<ul class="first-of-type">
				
				 
				
					<!-- General Agency Management Menu building -->
					
					<!-- Agency Management Menu building -->
					
					<!-- Agent Management Menu building -->
					
					<!-- Sales Manager (CSR) Management Menu building -->
					
					<!-- Insured Management Menu building -->
					<li class="yuimenubaritem"><a class="Servlet?dms_id=97b4884f17f7f80e3f270952ffd9f9fd" href="../FindInsured.do?TabPanelName=Search_Panel&clear=yes">Find Insured</a></li>
					<!-- Quote Menu building -->
					
					<li class="yuimenubaritem"><a class="Servlet?dms_id=97b4884f17f7f80e3f270952ffd9f9fd" href="../quote/FindQuote.jsp?TabPanelName=Search_Panel">Find Quote</a> </li>
					<!-- Policy Menu building -->
					<li class="yuimenubaritem"><a class="Servlet?dms_id=97b4884f17f7f80e3f270952ffd9f9fd" href="/SearchPolicyDisplayAction.do?TabPanelName=Search_Panel">Find Policy</a></li>
					
					<!-- *******************************************Search Email************************************************ -->
						<li class="yuimenubaritem"><a class="Servlet?dms_id=97b4884f17f7f80e3f270952ffd9f9fd" href="../email/FindEmail.jsp?TabPanelName=Search_Panel">Find E-Mail</a></li>
              		<!-- ************************************************************************************************************** -->
					
					<!-- *******************************************Search Submission & Billing************************************************ -->
						
						
              		<!-- ************************************************************************************************************** -->
					
					<!-- Clearance Management Menu building -->
					<li class="yuimenubaritem"><a class="Servlet?dms_id=97b4884f17f7f80e3f270952ffd9f9fd" href="../FindClearance.do?TabPanelName=Search_Panel&clear=yes">Search in Clearance Database</a></li>
					<!-- Submission Management Menu building -->
					<li class="yuimenuitem"><a class="Servlet?dms_id=ea3769f105c4a99f531053adb49d276d" href="../FindSubmissionNBF.do?TabPanelName=Submission_Panel&clear=yes">Find Submission</a></li>
					
					<!-- Product Management Menu building -->
					
		 	
					<!-- User Management Menu building -->
					
					<!-- logoff Menu building -->
					<li class="yuimenubaritem"><a class="Servlet?dms_id=97b4884f17f7f80e3f270952ffd9f9fd" href="../LoginOutAction.do">Log Off</a></li>
					<!-- <img border="0" src="../Images/logoff.jpg" width="18" height="18" ALT="">&nbsp;Log Off -->
				</ul>
			</div>
		</div>
<!-- end of menu -->

</td>
</tr>
</table>

					</td>
				</tr>
				<tr>
					<td valign="top" width="100%" style="{border-left:1px solid #999999;}">
						<div id="Search_Panel">
							
						</div>
					</td>
				</tr>
			</table>
        </div>

		<!-- Manage Tab Definition -->
		<div id="manage_tab">
   			<table width="100%" cellpadding="0" cellspacing="0" align="center" style="height: 100%" border="0">
				<tr class="yui-skin-sam" id="yahoo-com" >
					<td valign="top" class="yui-skin-sam" id="yahoo-com" width="100%" style="{border-left:1px solid #999999;}">
						










<script type="text/javascript">
        <!-- Page-specific script for dropdown menu-->

            /*
                 Initialize and render the MenuBar when its elements are ready
                 to be scripted.
            */

            YAHOO.util.Event.onContentReady("manage_tab_menu", function () {

                var Dom = YAHOO.util.Dom,
                    oAnim;  // Animation instance


                /*
                     "beforeshow" event handler for each submenu of the MenuBar
                     instance, used to setup certain style properties before
                     the menu is animated.
                */

                function onSubmenuBeforeShow(p_sType, p_sArgs) {

                    var oBody,
                        oShadow,
                        oUL;


                    if (this.parent) {

                        /*
                             Get a reference to the Menu's shadow element and
                             set its "height" property to "0px" to syncronize
                             it with the height of the Menu instance.
                        */

                        oShadow = this.element.lastChild;
                        oShadow.style.height = "0px";


                        /*
                            Stop the Animation instance if it is currently
                            animating a Menu.
                        */

                        if (oAnim && oAnim.isAnimated()) {

                            oAnim.stop();
                            oAnim = null;

                        }


                        /*
                            Set the body element's "overflow" property to
                            "hidden" to clip the display of its negatively
                            positioned <ul> element.
                        */

                        oBody = this.body;


                        /*
                            There is a bug in gecko-based browsers where
                            an element whose "position" property is set to
                            "absolute" and "overflow" property is set to
                            "hidden" will not render at the correct width when
                            its offsetParent's "position" property is also
                            set to "absolute."  It is possible to work around
                            this bug by specifying a value for the width
                            property in addition to overflow.
                        */

                        if (this.parent &&
                            !(this.parent instanceof YAHOO.widget.MenuBarItem) &&
                            YAHOO.env.ua.gecko) {

                            Dom.setStyle(oBody, "width", (oBody.clientWidth + "px"));

                        }


                        Dom.setStyle(oBody, "overflow", "hidden");


                        /*
                            Set the <ul> element's "marginTop" property
                            to a negative value so that the Menu's height
                            collapses.
                        */

                        oUL = oBody.getElementsByTagName("ul")[0];

                        Dom.setStyle(oUL, "marginTop", ("-" + oUL.offsetHeight + "px"));

                    }

                }


                /*
                    "tween" event handler for the Anim instance, used to
                    syncronize the size and position of the Menu instance's
                    shadow and iframe shim (if it exists) with its
                    changing height.
                */

                function onTween(p_sType, p_aArgs, p_oShadow) {

                    if (this.cfg.getProperty("iframe")) {

                        this.syncIframe();

                    }

                    if (p_oShadow) {

                        p_oShadow.style.height = this.element.offsetHeight + "px";

                    }

                }


                /*
                    "complete" event handler for the Anim instance, used to
                    remove style properties that were animated so that the
                    Menu instance can be displayed at its final height.
                */

                function onAnimationComplete(p_sType, p_aArgs, p_oShadow) {

                    var oBody = this.body,
                        oUL = oBody.getElementsByTagName("ul")[0];

                    if (p_oShadow) {

                        p_oShadow.style.height = this.element.offsetHeight + "px";

                    }

                    Dom.setStyle(oUL, "marginTop", "");
                    Dom.setStyle(oBody, "overflow", "");


                    if (this.parent &&
                        !(this.parent instanceof YAHOO.widget.MenuBarItem) &&
                        YAHOO.env.ua.gecko) {

                        Dom.setStyle(oBody, "width", "");

                    }

                }


                /*
                     "show" event handler for each submenu of the MenuBar
                     instance - used to kick off the animation of the
                     <ul> element.
                */

                function onSubmenuShow(p_sType, p_sArgs) {

                    var oElement,
                        oShadow,
                        oUL;

                    if (this.parent) {

                        oElement = this.element;
                        oShadow = oElement.lastChild;
                        oUL = this.body.getElementsByTagName("ul")[0];


                        /*
                             Animate the <ul> element's "marginTop" style
                             property to a value of 0.
                        */

                        oAnim = new YAHOO.util.Anim(oUL,
                            { marginTop: { to: 0 } },
                            .5, YAHOO.util.Easing.easeOut);


                        oAnim.onStart.subscribe(function () {

                            oShadow.style.height = "100%";

                        });


                        oAnim.animate();


                        /*
                            Subscribe to the Anim instance's "tween" event for
                            IE to syncronize the size and position of a
                            submenu's shadow and iframe shim (if it exists)
                            with its changing height.
                        */

                        if (YAHOO.env.ua.ie) {

                            oShadow.style.height = oElement.offsetHeight + "px";


                            /*
                                Subscribe to the Anim instance's "tween"
                                event, passing a reference Menu's shadow
                                element and making the scope of the event
                                listener the Menu instance.
                            */

                            oAnim.onTween.subscribe(onTween, oShadow, this);

                        }


                        /*
                            Subscribe to the Anim instance's "complete" event,
                            passing a reference Menu's shadow element and making
                            the scope of the event listener the Menu instance.
                        */

                        oAnim.onComplete.subscribe(onAnimationComplete, oShadow, this);

                    }

                }
                /*
                     Instantiate a MenuBar:  The first argument passed to the
                     constructor is the id of the element in the page
                     representing the MenuBar; the second is an object literal
                     of configuration properties.
                */

                var oMenuBar = new YAHOO.widget.MenuBar("manage_tab_menu", {
                                                            autosubmenudisplay: true,
                                                            hidedelay: 750,
                                                            lazyload: true });


                /*
                     Subscribe to the "beforeShow" and "show" events for
                     each submenu of the MenuBar instance.
                */

                oMenuBar.subscribe("beforeShow", onSubmenuBeforeShow);
                oMenuBar.subscribe("show", onSubmenuShow);
		oMenuBar.subscribe("click", onClick);

		// Define a handler for the "click" event
		 function onClick(p_sType, p_aArgs) {
			 var oEvent = p_aArgs[0],    // DOM Event
			oMenuItem = p_aArgs[1]; // YAHOO.widget.MenuItem instance


			 // Alert the type of the DOM event
//			 alert(oEvent.type);

			 // If a MenuItem was clicked, alert the value of its text label
			 if (oMenuItem) {
//				 alert(oMenuItem.cfg.getProperty("text") + "----abc");
//				 alert("menuItem-" + oMenuItem.cfg.getProperty("target"));

			 }
/*
			 alert("onClick: index: " + this.index +
						", text: " + //this.cfg.getProperty("text") +
						", value: " + p_oValue);
*/
			loadTable(oMenuItem.cfg.getProperty("target"));

		 }

		function loadTable(url) {
			var divObj = $('Manage_Panel');
			new Ajax.Updater(
				"Manage_Panel",
				url,
				{
				method: "get",
				onComplete: function(){
					//Do something
				}
				}
			);
		}



                /*
                     Call the "render" method with no arguments since the
                     markup for this MenuBar already exists in the page.
                */

                oMenuBar.render();

            });


</script>




		<table>
		<tr>
		<td class="yui-skin-sam" id="yahoo-com">

		<!-- MENU start here -->
	   <div id="manage_tab_menu" class="yuimenubar yuimenubarnav">
			<div class="bd">
				<ul class="first-of-type">
				
					<!-- General Agency Management Menu building -->
					
					<!-- Agency Management Menu building -->
					
					<!-- Agent Management Menu building -->
					
					<!-- Sales Manager (CSR) Management Menu building -->
					
					
					<!-- *******************************************Search Email************************************************ -->
			
			
					
			
			
					<!-- ************************************************************************************************************** -->
					
					<!-- Product Management Menu building -->
					
							
					<!-- static documents Menu building 
					<li class="yuimenubaritem"><a class="Servlet?dms_id=97b4884f17f7f80e3f270952ffd9f9fd" href="../documents/Documents.jsp?TabPanelName=Manage_Panel">Documents</a>
							<div id="manage_tab_staticdocuments" class="yuimenu">
								<div class="bd">
									<ul>
										<li class="yuimenuitem"><a class="Servlet?dms_id=ea3769f105c4a99f531053adb49d276d" href="../documents/AdminForms.jsp?TabPanelName=Manage_Panel">Administrative Forms</a></li>
											<li class="yuimenuitem"><a class="Servlet?dms_id=ea3769f105c4a99f531053adb49d276d" href="../documents/BenefitAndContact.jsp?TabPanelName=Manage_Panel">Benefit Summary & Contact Info</a></li>
									</ul>
								</div>
							</div>
						</li>-->			
					
					
					<!-- User Management Menu building -->
					
					
					<!-- Alert Management Menu building -->									
					
	
					
					<!-- Logged-in Users Menu building -->
					
					<!-- Data Export Menu building -->
					
					<!-- Data Import Menu building -->
										
					<!-- Clearance Import Menu building -->
										
					
					
			<!-- WebServices Menu building -->		
					
	 
	 				
					<!-- Change Password Menu building -->
					<li class="yuimenubaritem"><a class="Servlet?dms_id=97b4884f17f7f80e3f270952ffd9f9fd" href="../ChangePassword.do?TabPanelName=Manage_Panel&entityId=31&objectType=ENTITY">Change Password</a>
						</li>
					<!-- logoff Menu building -->
					<li class="yuimenubaritem"><a class="Servlet?dms_id=97b4884f17f7f80e3f270952ffd9f9fd" href="../LoginOutAction.do">Log Off</a></li>
					<!-- <img border="0" src="../Images/logoff.jpg" width="18" height="18" ALT="">&nbsp;Log Off -->

					</ul>
				</div>
			</div>

</td>
</tr>
</table>

					</td>
				</tr>
				<tr>
					<td valign="top" width="100%" style="{border-left:1px solid #999999;}">
						<div id="Manage_Panel">
							
						</div>
					</td>
				</tr>
			</table>
        </div>
    </div>
</div>

<script>
(function() {
    var tabView = new YAHOO.widget.TabView('solartisTabs');
})();
</script>
<!-- Tabs Definition Ends here -->


	<!--END SOURCE CODE FOR EXAMPLE =============================== -->


</td>
</tr>

<!-- end of Tab definition -->

<!-- footer begins here -->

			<tr>
				<td colspan="3" bgcolor="#999999" height="2px"></td>
			</tr>

			<tr>
				<td colspan="3" height="1%">
					<table border="0">
						<tr>
							<td align="left" width="300px">
								<img src="../Images/Poweredby.gif" alt="Powered By Solartis">
							</td>

							<td align="center" class ="PageFooter" width="450px">
								Powered by Solartis Inc. All Rights Reserved.
							</td>

							

							<td align="right" class ="PageFooter" width="280px">
								<FONT SIZE="1" COLOR="#FFFFFF">	[DateTime:SEP-6-2009-18-11-0]&nbsp;0.0&nbsp;(687)&nbsp;[1]
								</FONT>
							</td>
							<td align="right">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font color="#808080">2.0.1.9</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
<!-- footer end here -->

	</table>

<script type="text/javascript">

	function setTabFocus(tabName) {
		if(tabName !=null && tabName != "") {
			setFocusTowTabView(tabName);
		}
		else {
			setFocusTowTabView('Home_Panel');
		}
	}

	function setFocusTowTabView(panelName) {
		var tabIndex = 0; // default tab index
		if ( panelName!="" )
		{
			if ( panelName=="Home_Panel" ) {
				tabIndex = 0 // set focus to Home tab
			}
			else if ( panelName=="Submission_Panel" ) {
				tabIndex = 1; // set focus to Submission tab
			}
			else if ( panelName=="Insured_Panel" ) {
				tabIndex = 2; // set focus to Insured tab
			}
			else if ( panelName=="Quote_Panel" ) {
				tabIndex = 3; // set focus to Quote tab
			}
			else if ( panelName=="Policy_Panel" ) {
				tabIndex = 4; // set focus to Policy tab
			}
			else if ( panelName=="Search_Panel" ) {
				tabIndex = 5;
				// set focus to Search tab
			}
			else if ( panelName=="Manage_Panel" ) {
				tabIndex = 6; // set focus to Manage tab
			}
			var myTabs = new YAHOO.widget.TabView('solartisTabs', { activeIndex: tabIndex } ); // make tab at position 1 active
			myTabs.set('activeIndex', tabIndex); // make tab at index 0 active
		}
		else
			alert ("No Panel...");
	}

</script>

</body>
</html>




