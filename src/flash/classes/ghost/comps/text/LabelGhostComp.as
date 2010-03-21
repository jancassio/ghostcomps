package ghost.comps.text
{
	import ghost.comps.GhostComp;

	import flash.errors.IllegalOperationError;
	import flash.text.TextField;
	import flash.text.TextFieldType;

	/**
	 * Label controls a single dynamic text field.
	 * 
	 * By default, LabelGhostComp searches the instances below to controls the body:
	 * 
	 * <code>label_txt</code>: The text field used to displays a text.
	 * 
	 * @example
	 * <code>
	 * var label : LabelGhostComp
	 * 
	 * anythingLabel = new LabelGhostComp( myLabelContainer );
	 * 
	 * //or
	 * 
	 * anythingLabel = new LabelGhostComp
	 * anythingLabel.field = myLabelContainer.label_txt // or myAnotherLabel.field_txt
	 * </code>
	 * @author jancassio | jancassio@ghost.com
	 */
	public class LabelGhostComp extends GhostComp
	{
		private var _txtfield : TextField;
		
		// [ Error messages ] -------------------------------------------------
		
		private const LABEL_ERROR : String = "LabelGUI object requires an instance of TextField to define label box.";
		
		
		
		// [ Default body parts name ] ----------------------------------------
		
		protected var labelName : String;

		
		// [ Setup ] ----------------------------------------------------------
		
		
		
		/**
		 *	Creates a new LabelGhostComp instance.
		 *	@constructor
		 */
		public function LabelGhostComp (skin : * = null)
		{
			this.body = skin;
		}
		
		override protected function anatomy () : void
		{
			labelName = "label_txt";
		}

		
		override public function set body (value : *):void
		{
			super.body = value;
			if(value)
				txtfield = body[ labelName ];
		}
		
		/**
		 * The textfield to be manipuled by ghost.
		 */
		public function set txtfield (value : TextField) : void
		{
			if(!value)
				throw new IllegalOperationError( LABEL_ERROR );
				
			_txtfield = value;
			_txtfield.type = TextFieldType.DYNAMIC;
			_txtfield.mouseEnabled = false;
			labelName = _txtfield.name;
		}
		
		public function get txtfield () : TextField
		{
			return _txtfield ;
		}
	}
}