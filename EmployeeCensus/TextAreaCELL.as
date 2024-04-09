/**
  * Class to create the Text Area in the Data Grid
  * @ author ananthakumar_g@solartis.net
  */ 
import mx.core.UIComponent
import mx.controls.TextArea
import mx.controls.DataGrid

class TextAreaCELL extends UIComponent
{

	private var textArea : MovieClip;
	private var owner;						// The row that contains the cell.
	private var listOwner : DataGrid;		// The reference of the list type component that contains this cell.  
	private var getCellIndex : Function;	// A function we receive from the parent list (in this case a DataGrid).
	private var getDataLabel : Function;	// A function we receive from the parent list (in this case a DataGrid).
	
	//Empty Constructor
	public function TextAreaCELL() {
	
	}
	
	/**
	  * To create the Textarea- This API is called by listOwner[Data Grid] at first.
	  */	  
	public function createChildren(Void) : Void
	{
		textArea = createObject("TextArea", "text");		
		textArea.setStyle("themeColor",0xF0F9FD);	
		textArea.setSize(250,50);
		textArea.editable = true;
		textArea.wordWrap = true;
		textArea.enabled = true;
		textArea.html = false;		
		textArea.addEventListener("change", this);	
	}
	
	function setValue (str:String, item:Object, sel:Boolean) : Void
	{
		if (item[getDataLabel()] == undefined)
		{
			//textArea.visible = false;
		}
		else
		{
			textArea.visible = true;			
			if ( textArea.text != item [ getDataLabel() ] )
			{
				textArea.text = item [ getDataLabel() ];
			}
		}
	}
	
	/**
	  * Set the value to listOwner while onchange of Textarea.
	  */	 
	public function change()
	{		
		listOwner.dataProvider.editField(getCellIndex().itemIndex, getDataLabel(),textArea.text);	
	}

}
