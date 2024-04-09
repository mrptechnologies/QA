/**
  * Class to create the ComboBox in the Date Grid
  * @ author gnanaguru_g@solartis.net
  */ 
import mx.core.UIComponent
import mx.controls.ComboBox
import mx.controls.DataGrid

class ComboGender extends UIComponent
{

	private var combo : MovieClip;
	private var owner;						// The row that contains the cell.
	var isSaved = false;
	var isModified = false;
	var char;
	private var listOwner : DataGrid;		// The reference of the list type component that contains this cell.  
	private var getCellIndex : Function;	// A function we receive from the parent list (in this case a DataGrid).
	private var getDataLabel : Function;	// A function we receive from the parent list (in this case a DataGrid).
	
	private static var PREFERRED_HEIGHT_OFFSET = 4; 	// The preferred offset height of the cell containing the ComboBox.
	private static var PREFERRED_WIDTH = 80; 			// The preferred width of the cell containing the Combobox.
	private static var COMBOBOX_HEIGHT = 20;			// The height of the ComboBox.
	private static var COMBOBOX_WIDTH_OFFSET = 10; 		// Amount of space we will add between the ComboBox and its cell so it looks better.
	private var startDepth:Number = 10;
	
	// Array of label/data pairs that define the ComboBox data provider.
	private static var COMBOBOX_DATA_PROVIDER : Array = [{label: "Male", data: "M"}, 
														 {label: "Female", data:"F"}];
	// Constructor:  Should be empty.
	public function ComboGender()
	{
	}

	//Creates a ComboBox object and sets listeners.
	public function createChildren(Void) : Void
	{
		combo = createObject("ComboBox", "Combo", startDepth++);
		
		// Assign the data provider.
    	combo.dataProvider = COMBOBOX_DATA_PROVIDER;
		combo.setStyle("textAlign","left");
		combo.setStyle("selectionColor", "0xF0F9FD");
		combo.setStyle("useRollOver", false);
		// Register this class instance as a listener for the ComboBox instance.
		combo.addEventListener("change", this);
		combo.addEventListener("open", this); 
	}
	public  function modifiedAttribute(){
		isModified = true;
		char.text = "*";
	}


	public function size(Void) : Void
	{
		/*  Set the size and location of the ComboBox.
		Note: setSize() is already implemented by UIComponent
		which this class extends.  UI component in turn expects this class
		to implement size(). */
		combo.setSize(__width, COMBOBOX_HEIGHT);
	}

	public function setValue(str:String, item:Object, sel:Boolean) : Void
	{
		/*  Sets the ComboBox to the correspoinding cell data from the list owner's data provider if the cell data matches
		with any items available for the ComboBox. */
		
		var drawCombo:Boolean = true;
		if (item[getDataLabel()]!=undefined)
		{
			/* For each item's data in the ComboBox, verify if it matches
			the assigned data for the cell this ComboBox is in.  
			Set the selectedIndex of the ComboBox to what matches. */
			for(var i:Number = 0; i < combo.length; i++) 
			{
				if( combo.getItemAt(i).data == item[getDataLabel()] ) 
				{
					combo.selectedIndex = i;
					break;
				}
				if ( i == combo.length - 1 )
				{
					// There was no matching data, the ComboBox should not be shown.
					drawCombo = false;  
				}
			}
		}
		else
		{
			drawCombo = false;  // There was no data, hide the ComboBox.
		}
		
		combo._visible = drawCombo;
	}
	
	public function onLoad()
	{
	}

	public function open()
	{
		/*  Handler for the open event sent by the ComboBox when
		it has been clicked and opened to show its selectable items.
		Tell the Datagrid that the cell containing the ComboBox
		should be considered selected so that in turn the DataGrid
		updates the entire row in a selected visual state. */
		
		listOwner.selectedIndex = getCellIndex().itemIndex;
	}
	
	public function change()
	{
		// Handler for the ComboBox change event.   
		// Set the listOwner's data to the currently selected item's data of the combo box.
		//if(isModified == true){
			listOwner.dataProvider.editField(getCellIndex().itemIndex, getDataLabel(),combo.selectedItem.data);	
		//}
	}
	
	public function getPreferredHeight(Void) : Number
	{
		/* 	The cell is given a property, "owner",
		that references the row. It’s always preferred
		that the cell take up most of the row's height. */
		return owner.__height;
	}

}
