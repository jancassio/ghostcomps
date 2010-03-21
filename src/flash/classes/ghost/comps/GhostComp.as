package ghost.comps
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	/**
	 *  GhostComp is the core of all ghosts comps api classes.
	 *	The basic way to use is simple, just override the <code>body</code> in your ghost.
	 *
	 * @author jancassio | jancassio@ghost.com
	 */
	public class GhostComp implements IGhostComp, IEventDispatcher
	{

		protected var _body : *;
		
		private var disp : EventDispatcher;
		
		
		
		
		
		// [ Setup ] ----------------------------------------------------------
		
		/**
		 *	Creates a new GhostComp.
		 *	@constructor
		 */
		public function GhostComp()
		{
			conf();
			anatomy();
		}
		
		private function conf () : void
		{
			disp = new EventDispatcher(this);
		}
		
		/**
		 * Useful method to edit default anatomy of a body. By default, all comps implements
		 * this methods with default body instance names values. The default names is changed in
		 * two situations. When anatomy method is override by another inheritance or a body part is
		 * passed to comp with a diferent name.
		 */
		protected function anatomy () : void
		{
			// override in inheritance.
		}
		
		
		
		
		// [ Get/Set ] --------------------------------------------------------
		
		public function get body():*
		{
			return _body;
		}
		
		public function set body(value:*):void
		{
			_body = value;
		}
		
		
		
		
		
		// [ IEventDispatcher implementation ]
			
		public function addEventListener(
			type:String,
			listener:Function,
			useCapture:Boolean=false,
			priority:int=0,
			useWeakReference:Boolean=false
		):void
		{
			disp.addEventListener(
				type,
				listener,
				useCapture,
				priority,
				useWeakReference
			);
		}
		
		public function removeEventListener(
			type:String,
			listener:Function,
			useCapture:Boolean=false
		):void
		{
			disp.removeEventListener(type, listener, useCapture);
		}
		
		public function dispatchEvent(event:Event):Boolean
		{
			return disp.dispatchEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean
		{
			return disp.hasEventListener(type);
		}
		
		public function willTrigger(type:String):Boolean
		{
			return disp.willTrigger(type);
		}
	}
}