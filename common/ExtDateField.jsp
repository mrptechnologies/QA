<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<bean:parameter id="dateInputID" name="inputDateField" />
<bean:parameter id="dateFieldPanel" name="panelDiv" />
<bean:parameter id="minDate" name="minimumDate" />
<bean:parameter id="maxDate" name="maximumDate" />
<bean:parameter id="trueOrFalse" name="allowBlank" />
<bean:parameter id="setDefaultToday" name="setDefaultToday" />
<bean:parameter id="TodayDate" name="TodayDate" />
<script type="text/javascript">
Ext.onReady(function(){
	var myDatePanel = new Ext.Panel({
    applyTo:'<%=dateFieldPanel%>',
    hideLabels:true,
    width:120,
    autoHeight:true,
	bodyBorder : false,
    border : false,
    frame:false,
    items:[{
      xtype:'datefield',
      name:'dob',
      id:'<%=dateInputID%>',
      width:100,
      allowBlank:<%=trueOrFalse%>
    }]
  });

//Date Range Setting 
var minValue = "<%=minDate%>";
if( minValue != ""){
			Ext.getCmp('<%=dateInputID%>').setMinValue('<%=minDate%>');
};
var maxValue = "<%=maxDate%>";
if(maxValue != ""){
			Ext.getCmp('<%=dateInputID%>').setMaxValue('<%=maxDate%>');
};

// Today's date setting - If true, sets to default date
var todayDate = "<%=setDefaultToday%>";
if( todayDate == "true"){
			Ext.getCmp('<%=dateInputID%>').setValue('<%=TodayDate%>');
};

//hitting on datefield text input, pops up the calendar dropdown
var clickHandler = function() {
	Ext.getCmp('<%=dateInputID%>').onTriggerClick();
};

Ext.EventManager.on('<%=dateInputID%>', 'click', clickHandler);


});
</script>