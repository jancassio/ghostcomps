/* ----------------------------------------------------------------------------
		Ghost Comps is a set of controls to manipulate user interface objects.
		Copyright (C) 2010 Jan Cássio
	---------------------------------------------------------------------------
   
		This library is free software; you can redistribute it and/or modify
	it under the terms of the GNU Lesser General Public License as published
	by the Free Software Foundation; either version 2.1 of the License, or
	(at your option) any later version.
		
		This library is distributed in the hope that it will be useful, but
	WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
	or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public
	License for more details.
 
		You should have received a copy of the GNU Lesser General Public License
	along with this library; if not, write to the Free Software Foundation,
	Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 

	Ghost Comps Project
	http://ghost.as
	
	------------------------------------------------------------------------ */

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
		// [ Body's manipulated parts ] ---------------------------------------
		private var _txtfield : TextField;
		
		
		
		
		
		// [ Default body's manipulated parts names ] -------------------------
		protected var labelName : String;





		// [ Error messages ] -------------------------------------------------
		private const LABEL_ERROR : String = "LabelGhost object requires an instance of TextField to define label box.";
		
		
		
		
		
		// [ Setup ] ----------------------------------------------------------
		
		/**
		 *	Creates a new LabelGhostComp instance.
		 *	@constructor
		 */
		public function LabelGhostComp (body : * = null)
		{
			this.body = body;
			super();
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