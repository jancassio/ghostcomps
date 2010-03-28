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
	import flash.text.TextField;

	/**
	 * Like TextInputGhostComp except, for having multiline field.
	 * @example
	 * 
	 * var myInput : TextAreaGhostComp
	 * 
	 * myInput = new TextAreaGhostComp( myInputClip );
	 * myInput.onChange = onChangeInput;
	 * 
	 * function onChangeInput( event : TextEvent, ghost : TextAreaGhostComp ) : void
	 * {
	 * 		// your handle block here.
	 * }
	 * 
	 * @author jancassio | janio@jancassio.com
	 * @see ghost.comps.text.TextInputGhostComp
	 *	
	 */
	public class GhostTextArea extends GhostTextInput
	{
		public function GhostTextArea (body : * = null)
		{
			super( body );
		}

		/**
		 * The textfield to be manipuled by ghost.
		 */
		override public function set input (value : TextField) : void
		{
			super.input = value;
			_input.multiline = true;
		}

	}
}

