package demos 
{
	import ghost.comps.text.GhostTextArea;
	import ghost.comps.text.GhostTextInput;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.Event;
	import demos.text.TextInput;
	import demos.text.TextArea;
	import flash.display.Sprite;

	/**
	 * Example of ghosts comps usage.
	 * 
	 * @author jancassio | janio@jancassio.com
	 */
	 
	[SWF(frameRate="31", backgroundColor="0x000000")]
	public class CompleteDemo extends Sprite 
	{
		private var nameField	: TextInput;
		private var emailField	: TextInput;
		private var msgField	: TextArea;
		
		private var nameGhost	: GhostTextInput;
		private var emailGhost	: GhostTextInput;
		private var msgGhost	: GhostTextArea;
		
		// [ Setup ] ----------------------------------------------------------
		
		public function CompleteDemo ()
		{
			conf();
		}
		
		private function conf () : void
		{
			nameField	= new TextInput;
			emailField	= new TextInput;
			msgField	= new TextArea;
			
			( stage ) ? init() : addEventListener(Event.ADDED_TO_STAGE, onAddedToStage );
		}

		private function init() : void
		{
			stage.align						= StageAlign.TOP_LEFT;
			stage.scaleMode					= StageScaleMode.NO_SCALE;
			stage.showDefaultContextMenu	= false;
			stage.stageFocusRect			= false;
			
			render();
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function render () : void
		{
			addChild( nameField );
			addChild( emailField );
			addChild( msgField );
		}
		
		
		
		
		
		private function update () : void
		{
			nameField.x = 10;
			nameField.y = 10;
			
			emailField.x = 10;
			emailField.y = nameField.y + nameField.height + 10;
			
			msgField.x = 10;
			msgField.y = emailField.y + emailField.height + 10;
		}




		
		// [ Handlers ] -------------------------------------------------------
		
		private function onAddedToStage (event : Event) : void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			init();
		}
		
		private function onEnterFrame (event : Event) : void 
		{
			update();
		}
	}
}