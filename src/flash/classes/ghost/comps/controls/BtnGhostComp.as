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
	http://github.com/jancassio/ghostcomps/
	
	------------------------------------------------------------------------ */

package ghost.comps.controls
{
	import ghost.comps.GhostComp;

	import flash.display.Sprite;
	import flash.errors.IllegalOperationError;
	import flash.events.MouseEvent;

	/**
	 * BtnGhostComp is a simple way to make any displayobject as interactive.
	 * Use the stub methods to handles quickly the most important mouse events over buttons.
	 * 
	 * @example
	 * <code>
	 * var myBtn : BtnGhostComp;
	 * 
	 * myBtn = new BtnGhostComp( aSprite );
	 * 
	 * myBtn.onClick = onBtnClick;
	 * 
	 * function onBtnClick (e : MouseEvent, ghost : BtnGhostComp) : void {};
	 * </code>
	 * @author jancassio | janio@jancassio.com
	 */
	public class BtnGhostComp extends GhostComp
	{
		/**
		 *	Shots on mouse over hit instance.
		 */
		public var onRollOver : Function;
		
		/**
		 *	Shots on mouse out hit instance.
		 */
		public var onRollOut : Function;
		
		/**
		 *	Shots on mouse press hit instance.
		 */
		public var onPress : Function;
		
		/**
		 *	Shots on mouse releases hit instance.
		 */
		public var onClick : Function;
		
		/**
		 *	Shots on mouse release of instance.
		 */
		public var onRelease : Function;
		
		/**
		 *	Shots on mouse release outside of instance
		 */
		public var onReleaseOutside : Function;
		
		
		
		
		
		// [ Body's manipulated parts ] ---------------------------------------
		private var _hit : Sprite;
		
		
		
		
		
		// [ Default body's manipulated parts names ] -------------------------
		protected var hitName : String;
		
		
		
		
		
		// [ Error messages ] -------------------------------------------------
		private static const HIT_ERROR : String = "BtnGhostComp object requires an instance of Sprite for mouse responses events";
		
		
		
		
		
		// [ Setup ] ----------------------------------------------------------
		
		/**
		 *	Creates a new BtnGhostComp instance.
		 */
		public function BtnGhostComp (body : * = null)
		{
			super();
			this.body = body;
		}
		
		override protected function anatomy () : void
		{
			hitName = "hit";
		}

		
		/**
		 *	@inheritDoc
		 */
		override public function set body( value:* ):void
		{
			if( !value ) return;
			
			super.body = value;
			hit = value[ hitName ];
		}
		
		override public function get body():*
		{
			return _body;
		}
		
		
		
		
		/**
		 *	The hit/active button area.
		 */
		public function set hit (value : Sprite) : void
		{
			if( !value )
				throw new IllegalOperationError ( HIT_ERROR );
				
			if(hit && hit != value) enabled = false;
			_hit = value;
			enabled = true;
		}
		
		public function get hit () : Sprite
		{
			return _hit;
		}
		
		/**
		 *	Makes the button interactive or not.
		 */
		public function set enabled (value : Boolean) : void
		{
			hit.mouseChildren = !value;
			hit.buttonMode = value;
			(value) ? listen() : unlisten();	
		}
		
		public function get enabled () : Boolean
		{
			return hit.buttonMode;
		}
		
		/**
		 *	Dispose the instance.
		 */
		public function dispose () : void
		{
			enabled	= false;
			
			onPress = undefined;
			onClick = undefined;
			onRollOut = undefined;
			onRollOver = undefined;
			onRelease = undefined;
			onReleaseOutside = undefined;
			
			body = undefined;
			_hit = undefined;
		}
		
		
		
		
		
		// [ Listening ] ------------------------------------------------------
	
		private function listen () : void
		{
			_hit.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			_hit.addEventListener(MouseEvent.ROLL_OVER, onMouseOver);
			_hit.addEventListener(MouseEvent.CLICK, onMouseClick);
		}
		
		private function unlisten () : void
		{
			_hit.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			_hit.removeEventListener(MouseEvent.CLICK, onMouseClick);
			_hit.removeEventListener(MouseEvent.ROLL_OUT, onMouseOut);
			_hit.removeEventListener(MouseEvent.ROLL_OVER, onMouseOver);
			_hit.stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUpOutside);
		}
		
		
		
		
		
		// [ Handlers ] -------------------------------------------------------
		
		protected function onMouseDown (e : MouseEvent) : void
		{
			_hit.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			_hit.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			_hit.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUpOutside);
			if( onPress != null ) exec( e, onPress );
		}
		
		protected function onMouseUp (e : MouseEvent) : void
		{
			_hit.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			_hit.stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUpOutside);
			_hit.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			if( onRelease != null ) exec( e, onRelease );
		}
		
		protected function onMouseUpOutside (e : MouseEvent) : void
		{
			_hit.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			_hit.stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUpOutside);
			_hit.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			if( onReleaseOutside != null ) exec( e, onReleaseOutside);
		}
		
		protected function onMouseOut (e : MouseEvent) : void
		{
			_hit.removeEventListener(MouseEvent.ROLL_OUT, onMouseOut);
			_hit.addEventListener(MouseEvent.ROLL_OVER, onMouseOver);
			if( onRollOut != null ) exec( e, onRollOut );
		}
		
		protected function onMouseOver (e : MouseEvent) : void
		{
			_hit.removeEventListener(MouseEvent.ROLL_OVER, onMouseOver);
			_hit.addEventListener(MouseEvent.ROLL_OUT, onMouseOut);
			if( onRollOver != null ) exec( e, onRollOver );
		}
		
		protected function onMouseClick (e : MouseEvent) : void
		{
			if( onClick != null ) exec( e, onClick );
		}
		
		
		
		
		
		// [ Utils ] ----------------------------------------------------------
		
		/**
		 *	Executes a callback and sends event on params.
		 */
		protected function exec (event : MouseEvent, stub : Function) : void
		{
			stub(event);
		}
	}
}