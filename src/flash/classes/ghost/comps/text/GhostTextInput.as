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
	import flash.events.Event;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;

	/**
	 * This ghost just manipulate a text field to works like a input field.
	 * @example
	 * 
	 * var myInput : TextInputGhostComp
	 * 
	 * myInput = new TextInputGhostComp( myInputClip );
	 * myInput.onChange = onChangeInput;
	 * 
	 * function onChangeInput( event : TextEvent, ghost : TextInputGhostComp ) : void
	 * {
	 * 		// your handle block here.
	 * }
	 * 
	 * @author jancassio | janio@jancassio.com
	 */
	public class GhostTextInput extends GhostComp
	{
		// [ Event stubs ] ----------------------------------------------------
		public var onChange		: Function;
		public var onChanged	: Function;
		
		
		
		
		
		// [ Body's manipulated parts ] ---------------------------------------
		protected var _input : TextField;
	
	
	
	
	
		// [ Default body's manipulated parts names ] -------------------------
		protected var inputName : String;
		
		
	
	
		// [ Error messages ] -------------------------------------------------
		private const INPUT_ERROR : String = "TextInputGhostComp object requires an instance of TextField to define input box.";
	
	
	
	
	
		// [ Setup ] ----------------------------------------------------------
		
		/**
		 *	Creates a new TextInputGhostComp instance.
		 *	@constructor
		 */
		public function GhostTextInput (body : *)
		{
			this.body = body;
		}
		
		override protected function anatomy () : void
		{
			inputName = "input_txt";
		}




		
		override public function set body (value : *) : void
		{
			super.body = value;
			
			if(value)
				input = body[ inputName ];
		}

		/**
		 * The textfield to be manipuled by ghost.
		 */
		public function set input (value : TextField) : void
		{
			if(!value)
				throw new IllegalOperationError ( INPUT_ERROR );
			
			if(_input == value) return;
			if(_input) unlisten();
			
			_input = value;
			_input.type = TextFieldType.INPUT;
			_input.multiline = false;
			
			listen();
		}
		
		public function get input () : TextField
		{
			return _input;
		}
		
		
		
		
		
		// [ Listen/Unlisten events ] -----------------------------------------
		
		private function listen () : void
		{
			_input.addEventListener(TextEvent.TEXT_INPUT, onTextInput);
			_input.addEventListener(Event.CHANGE, onTextChange);
		}
		
		private function unlisten () : void
		{
			_input.removeEventListener(TextEvent.TEXT_INPUT, onTextInput);
			_input.removeEventListener(Event.CHANGE, onTextChange);
		}
		
		
		
		
		
		// [ Handlers ] -------------------------------------------------------
		
		private function onTextInput (e:TextEvent) : void
		{
			onChange( e.clone(), this );
		}
		
		private function onTextChange (e:Event) : void
		{
			var event : TextEvent;
			
			event = new TextEvent(e.type);
			event.text = _input.text;
			
			onChanged( event );
		}
	}
}