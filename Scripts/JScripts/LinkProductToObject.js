function copyToList(from,to)
{
 fromList = eval('document.forms[0].' + from);
 toList = eval('document.forms[0].' + to);
  if (toList.options.length > 0 && toList.options[0].value == 'temp')
  {
    toList.options.length = 0;
  }
  var sel = false;
  for (i=0;i<fromList.options.length;i++)
  {
    var current = fromList.options[i];
    if (current.selected)
    {
      sel = true;
      if (current.value == 'temp')
      {
        alert ('You cannot move this text!');
        return;
      }
      txt = current.text;
      val = current.value;
      toList.options[toList.length] = new Option(txt,val);
      fromList.options[i] = null;
      i--;
    }
  }
  if (!sel) alert ('You haven\'t selected any option!');
}

function allSelect()
{
  List = document.forms[0].chosen;
  if (List.length && List.options[0].value == 'temp') return;
  for (i=0;i<List.length;i++)
  {
     List.options[i].selected = true;
  }

var formElement=document.forms[0];
var QuoteMM=formElement.month.value;
var QuoteDD=formElement.day.value;
var QuoteYY=formElement.year.value;
if((QuoteMM!="")&&(QuoteDD!="")&&(QuoteYY!="")) {
formElement.quoteDate.value=QuoteMM+"/"+QuoteDD+"/"+QuoteYY;
}
return true;

}



function selectBothLists()
{
  List = document.forms[0].chosen;
  if (List.length && List.options[0].value == 'temp') return;
  for (i=0;i<List.length;i++)
  {
     List.options[i].selected = true;
  }
  
  List1 = document.forms[0].chosenList;
  if (List1.length && List1.options[0].value == 'temp') return;
  for (i=0;i<List1.length;i++)
  {
     List1.options[i].selected = true;
  }

List2 = document.forms[0].chosenApps;
  if (List2.length && List2.options[0].value == 'temp') return;
  for (i=0;i<List2.length;i++)
  {
     List2.options[i].selected = true;
  }

  List3 = document.forms[0].chosenEnds;
  if (List3.length && List3.options[0].value == 'temp') return;
  for (i=0;i<List3.length;i++)
  {
     List3.options[i].selected = true;
  }

}

function setDate()
{
		var formElement=document.forms[0];
	
	var now = new Date();
	var day=now.getDate();
	var month=now.getMonth() + 1;
	var year=now.getYear();

	var strMonth=month.toString();
	var strDay=day.toString();

	if (strMonth.length < 2)
		{
			month="0"+month;
		}
	

	if (strDay.length < 2)
		{
			day="0"+day;
		}


formElement.month.value=month;
formElement.day.value=day;
formElement.year.value=year;

formElement.month.disabled=true;
formElement.day.disabled=true;
formElement.year.disabled=true;

}

