package demos 
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	/**
	 * Example of ghosts comps usage.
	 * 
	 * @author jancassio | janio@jancassio.com
	 */
	 
	[SWF(frameRate="31", backgroundColor="0x000000")]
	public class CompleteDemo extends Sprite 
	{
		private var textDemo : TextDemo;
		
		public function CompleteDemo()
		{
			( stage ) ? init() : addEventListener(Event.ADDED_TO_STAGE, onAddedToStage );
		}

		
		private function onAddedToStage (event : Event) : void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			init( );
		}

		
		private function init () : void 
		{
			setupStage();
			
			textDemo = addChild( new TextDemo ) as TextDemo;
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame );
		}

		
		private function onEnterFrame (event : Event) : void 
		{
			textDemo.render();
		}

		
		private function setupStage () : void
		{
			stage.align						= StageAlign.TOP_LEFT;
			stage.scaleMode					= StageScaleMode.NO_SCALE;
			stage.showDefaultContextMenu	= false;
			stage.stageFocusRect			= false;
		}
	}
}