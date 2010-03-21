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
	public class TextAreaGhostComp extends TextInputGhostComp
	{

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

