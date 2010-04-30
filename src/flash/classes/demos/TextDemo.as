package demos 
{
	import demos.text.TextArea;
	import demos.text.TextInput;

	import ghost.comps.IGhostComp;
	import ghost.comps.text.GhostTextArea;
	import ghost.comps.text.GhostTextInput;

	import flash.display.Sprite;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.TextEvent;

	/**
	 * @author jancassio | janio@jancassio.com
	 */
	public class TextDemo extends Sprite 
	{
		
		private var nameField   : TextInput;
		private var emailField	: TextInput;
		private var msgField    : TextArea;
		
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
			
			listen();
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
		
		
		
		
		
		private function listen () : void
        {
            nameGhost.onChange       = onChange;
            nameGhost.onChanged      = onChanged;
            nameGhost.onEnter        = onKeyEvent;
            nameGhost.onFocusIn      = onFocusIn;
            nameGhost.onFocusOut     = onFocusOut;
            
            emailGhost.onChange       = onChange;
            emailGhost.onChanged      = onChanged;
            emailGhost.onEnter        = onKeyEvent;
            emailGhost.onFocusIn      = onFocusIn;
            emailGhost.onFocusOut     = onFocusOut;
            
            msgGhost.onChange       = onChange;
            msgGhost.onChanged      = onChanged;
            msgGhost.onEnter        = onKeyEvent;
            msgGhost.onFocusIn      = onFocusIn;
            msgGhost.onFocusOut     = onFocusOut;
        }
        
        
        
        
		
		// [ Handlers ] -------------------------------------------------------
		
		private function onKeyEvent (event : KeyboardEvent, owner : IGhostComp) : void
		{
            trace("[ TextDemo ]: onKeyEvent ");
            trace("\tevent = ", event);
            trace("\towner = ", owner);
		}
		
		private function onFocusOut (event : FocusEvent, owner : IGhostComp) : void 
        {
            trace("[ TextDemo ]: onFocusOut ");
            trace("\tevent = ", event);
            trace("\towner = ", owner);
        }

        
        private function onFocusIn (event : FocusEvent, owner : IGhostComp) : void 
        {
            trace("[ TextDemo ]: onFocusIn ");
            trace("\tevent = ", event);
            trace("\towner = ", owner);
        }

        
        private function onChanged (event : TextEvent, owner : IGhostComp) : void 
        {
            trace("[ TextDemo ]: onChanged ");
            trace("\tevent = ", event);
            trace("\towner = ", owner);
        }

        
        private function onChange (event : TextEvent, owner : IGhostComp) : void 
        {
            trace("[ TextDemo ]: onChange ");
            trace("\tevent = ", event);
            trace("\towner = ", owner);
        }
	}
}
