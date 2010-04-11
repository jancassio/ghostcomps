package demos 
{
	import flash.events.TextEvent;
	import demos.text.TextArea;
	import demos.text.TextInput;
	import ghost.comps.text.GhostTextArea;
	import ghost.comps.text.GhostTextInput;

	import flash.display.Sprite;

	/**
	 * @author jancassio | janio@jancassio.com
	 */
	public class TextDemo extends Sprite 
	{
		
		private var nameField	: TextInput;
		private var emailField	: TextInput;
		private var msgField	: TextArea;
		
		private var nameGhost	: GhostTextInput;
		private var emailGhost	: GhostTextInput;
		private var msgGhost	: GhostTextArea;
		

		
		// [ Setup ] ----------------------------------------------------------
		
		
		
		
		
		public function TextDemo ()
		{
			conf();
			init();
			
		}
		
		private function conf () : void
		{
			nameField	= new TextInput;
			emailField	= new TextInput;
			msgField	= new TextArea;
		}

		private function init() : void
		{
			addFields();
			createGhosts();
		}
		
		private function addFields () : void
		{
			addChild( nameField );
			addChild( emailField );
			addChild( msgField );
		}
		
		
		
		
		
		private function createGhosts () : void
		{
			nameGhost	= new GhostTextInput;
			emailGhost	= new GhostTextInput;
			msgGhost	= new GhostTextArea;
			
			nameGhost.input		= nameField.input;
			emailGhost.input	= emailField.input;
			msgGhost.input		= msgField.input_txt;
			
			nameGhost.input.text	= "";
			emailGhost.input.text	= "";
			msgGhost.input.text		= "";
			
			nameGhost.onEnter	= onFormEnter;
			emailGhost.onEnter	= onFormEnter;
			msgGhost.onEnter	= onFormEnter;
		}

		
		public function render () : void 
		{
			nameField.x = 10;
			nameField.y = 10;
			
			emailField.x = 10;
			emailField.y = nameField.y + nameField.height + 10;
			
			msgField.x = 10;
			msgField.y = emailField.y + emailField.height + 10;
		}
		
		
		
		
		
		// [ Handlers ] -------------------------------------------------------
		
		private function onFormEnter (event : TextEvent, ghost : GhostTextArea) : void
		{
			
		}
	}
}
