/**
  * Class to create the DateField in the Date Grid
  * @ author gnanaguru_g@solartis.net
  */ 
import mx.core.UIComponent
import mx.controls.DateField
import mx.controls.DataGrid

class DateCELL extends UIComponent
{

	private var dateField : MovieClip;
	private var owner;						// The row that contains the cell.
	private var listOwner : DataGrid;		// The reference of the list type component that contains this cell.  
	private var getCellIndex : Function;	// A function we receive from the parent list (in this case a DataGrid).
	private var getDataLabel : Function;	// A function we receive from the parent list (in this case a DataGrid).
	
	//Empty Constructor
	public function DateCELL() {
	
	}
	
	/**
	  * To create the Datefield- This API is called by listOwner[Data Grid] at first.
	  */	  
	public function createChildren(Void) : Void
	{
		dateField = createObject("DateField", "date1");
		
		//TO format the date displayed as MM/DD/YYYY
		dateField.dateFormatter = function(d:Date){
		return (d.getMonth()+1)+"/"+d.getDate()+"/"+d.getFullYear();
		};	
		dateField.setStyle("themeColor",0xF0F9FD);
		dateField.setStyle("backgroundColor",0xFFFFFF);
		dateField.setStyle("headerColor",0xF0F9FD);
		dateField.setStyle("todayColor",0x99CCFF);

		dateField.addEventListener("change", this);	
	}
	
	/**
	  * To set the incoming value to DateField - Call and Set by listOwner[Data Grid ]
	  */
	public function setValue(str:String, item:Object, sel:Date) : Void
	{
		if(item[getDataLabel()]!=undefined) {
			dateField.text=item[getDataLabel()];
		}else {
			dateField.text="";
		}
		
	}
	
	/**
	  * Set the value to listOwner while onchange of DateField
	  */	 
	public function change()
	{
		var day=""+dateField.selectedDate;		
		var days = day.split(" ");				
		var originalDate=""+days[2];
		if(originalDate.length==1){
			originalDate="0"+originalDate;
		}
		var changedDate=(dateField.displayedMonth+1)+"/"+originalDate+"/"+dateField.displayedYear;
		
		listOwner.dataProvider.editField(getCellIndex().itemIndex, getDataLabel(),changedDate);	
	}

}
