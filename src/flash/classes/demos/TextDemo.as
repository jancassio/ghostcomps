package demos 
{
	import ghost.comps.IGhostComp;
	import flash.events.KeyboardEvent;
	import demos.text.TextArea;
	import demos.text.TextInput;

	import ghost.comps.text.GhostTextArea;
	import ghost.comps.text.GhostTextInput;

	import flash.display.Sprite;
	import flash.events.TextEvent;

	/**
	 * @author jancassio | janio@jancassio.com
	 */
	public class TextDemo extends Sprite 
	{
		
		private var nameField   : TextInput;
		private var emailField	: TextInput;
		private var msgField    : TextArea;
		private var output      : TextInput;
		
		private var nameGhost   : GhostTextInput;
		private var emailGhost	: GhostTextInput;
		private var msgGhost    : GhostTextArea;
		
		
		// [ Setup ] ----------------------------------------------------------
		
		public function TextDemo ()
		{
			conf();
			init();
		}
		
		private function conf () : void
		{
			nameField    = new TextInput;
			emailField   = new TextInput;
			msgField     = new TextArea;
			output       = new TextInput;
			
			nameField.label.text	= "NAME:";
			emailField.label.text	= "EMAIL:";
			msgField.label.text		= "MESSAGE:";
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
			addChild( output );
		}

		
		private function createGhosts () : void
		{
			nameGhost    = new GhostTextInput;
			emailGhost   = new GhostTextInput;
			msgGhost     = new GhostTextArea;
			
			nameGhost.input		= nameField.input;
			emailGhost.input	= emailField.input;
			msgGhost.input		= msgField.input_txt;
			
			nameGhost.input.text	= "";
			emailGhost.input.text	= "";
			msgGhost.input.text		= "";
			
			nameGhost.onEnter    = onKeyEvent;
			emailGhost.onEnter   = onKeyEvent;
			msgGhost.onEnter     = onKeyEvent;
		}

		
		public function render () : void 
		{
			nameField.x = 10;
			nameField.y = 10;
			
			emailField.x = 10;
			emailField.y = nameField.y + nameField.height + 10;
			
			msgField.x = 10;
			msgField.y = emailField.y + emailField.height + 10;
			
			output.x = 10;
			output.y = msgField.y + msgField.height + 10;
		}

		
		// [ Handlers ] -------------------------------------------------------
		
		
		
		private function onKeyEvent (event : KeyboardEvent, owner : IGhostComp) : void
		{
            trace("[ TextDemo ]: onKeyEvent ");
            trace("\tevent = ", event);
            trace("\towner = ", owner);
		}
	}
}
