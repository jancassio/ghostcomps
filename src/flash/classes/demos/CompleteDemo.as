package demos 
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import demos.TextDemo;

	/**
	 * Example of ghosts comps usage.
	 * 
	 * @author jancassio | janio@jancassio.com
	 */
	 
	[SWF(frameRate="31", backgroundColor="0x000000")]
	public class CompleteDemo extends Sprite 
	{
		protected var textDemo : TextDemo;
		
		public function CompleteDemo()
		{
			( stage ) ? init() : addEventListener(Event.ADDED_TO_STAGE, onAddedToStage );
		}

		
		protected function onAddedToStage (event : Event) : void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			init( );
		}

		
		protected function init () : void 
		{
			setupStage();
			
			textDemo = addChild( new TextDemo ) as TextDemo;
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame );
		}

		
		protected function onEnterFrame (event : Event) : void 
		{
			textDemo.render();
		}

		
		protected function setupStage () : void
		{
			stage.align						= StageAlign.TOP_LEFT;
			stage.scaleMode					= StageScaleMode.NO_SCALE;
			stage.showDefaultContextMenu	= false;
			stage.stageFocusRect			= false;
		}
	}
}