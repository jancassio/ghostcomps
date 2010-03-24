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

package ghost.helpers
{
	import ghost.events.SliderEvent;

	import flash.events.EventDispatcher;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	[Event (name="sliderDrag", type="ghost.events.SliderEvent")]
	[Event (name="sliderDrop", type="ghost.events.SliderEvent")]
	[Event (name="sliderUpdate", type="ghost.events.SliderEvent")]
	
	/**
	 *  Helper to assist in slider based interactions/instructions.
	 *  
	 *  @example
	 *  <code>
	 *  
	 *  var slider : Slider2D;
	 *  var rect : Rectangle;
	 *  var point : Point;
	 *  
	 *  slider = new Slider;
	 *  rect = new Rectangle(0, 0, 100, 100);
	 *  point = new Point(50, 50);
	 *  
	 *  slider.area = rect;
	 *  slider.position = point;
	 *  
	 *  trace("percentage x over area is: ", slider.percentageX); // .5;
	 *  slider.percentageY = .2;
	 *  trace("position Y over area is: ", slider.positionY); // 20;
	 *  </code>
	 *  
	 *  @author jancassio | janio@jancassio.com
	 */
	public class Slider2D extends EventDispatcher
	{
		
		/** lock x axis */
		public static const HORIZONTAL	: String = "horizontal";
		
		/** lock y axis */
		public static const VERTICAL	: String = "vertical";
		
		
		private var _pos 	: Point;
		private var _area	: Rectangle;
		private var _axis	: String;
	
		/**
		 *	Creates a new Slider2D instance.
		 */
		public function Slider2D (
			area : Rectangle = null, 
			position : Point = null, 
			percentage : Point = null, 
			axis : String = null
		)
		{
			conf(
				area != null ? area.clone() : new Rectangle,
				position != null ? position.clone() : new Point,
				axis
			);
		}
		
		protected function conf (area : Rectangle, point : Point, axis : String) : void
		{
			this._area	= area;
			this._pos	= point;
			this._axis	= axis;
		}
		
		/**
		 *	The point x and y position.
		 */
		public function set position (value : Point):void
		{
			_pos.x = Math.max( _area.x, Math.min(_area.width + _area.x, value.x) );
			_pos.y = Math.max( _area.y, Math.min(_area.height + _area.y, value.y) );
			
			dispatch(SliderEvent.UPDATE);
		}
		
		/**
		 *	The x axis position.
		 */
		public function set positionX (value : Number):void
		{
			position = new Point( value, positionY );
		}
		
		/**
		 *	The y axis position.
		 */
		public function set positionY (value : Number) : void
		{
			position = new Point( positionX, value );
		}
		
		public function get position () : Point
		{
			return _pos.clone();
		}
		
		public function get positionX () : Number
		{
			return _pos.x;
		}
		
		public function get positionY () : Number
		{
			return _pos.y;
		}
		
		/**
		 *	The point position percentage over area.
		 */
		public function set percentage (value : Point):void
		{
			position = new Point(
			 	_area.x + (_area.width * value.x), 
				_area.y + (_area.height * value.y)
			);
			dispatch(SliderEvent.UPDATE);
		}
		
		/**
		 *	The x axis slide percentage over area position.
		 */
		public function set percentageX (value : Number):void
		{
			percentage = new Point( value, percentageY );
		}
		
		/**
		 *	The y axis slide percentage over area position.
		 */
		public function set percentageY (value : Number) : void
		{
			percentage = new Point( percentageX, value );
		}
		
		public function get percentage () : Point
		{
			var x : Number;
			var y : Number;
			
			x = (position.x - _area.x) / _area.width;
			y = (position.y - _area.y) / _area.height;
			
			x = isNaN(x) ? 1 : x;
			y = isNaN(y) ? 1 : y;
			
			return new Point( x, y );
		}
		
		public function get percentageX () : Number
		{
			return percentage.x;
		}
		
		public function get percentageY () : Number
		{
			return percentage.y;
		}
		
		
		/**
		 *	Slider area.
		 */
		public function set area (rectangle : Rectangle) : void
		{
			var oldPct : Point;
			oldPct = percentage.clone();
			_area = rectangle.clone();
			
			if(_axis != null)
			{
				if(_axis == HORIZONTAL) _area.height = 0;
				if(_axis == VERTICAL) _area.width = 0;
			}
			percentage = oldPct;
		}
		
		public function get area () : Rectangle
		{
			return _area.clone();
		}
		
		/**
		 *	Active axis on slider.
		 */
		public function set axis (value : String) : void
		{
			_axis = value;
		}
		
		public function get axis () : String
		{
			return _axis;
		}
		
		/**
		 *	The x, y Point offset.
		 */
		public function get offset () : Point
		{
			var x : Number;
			var y : Number;
			
			x = (_pos.x - _area.x);
			y = (_pos.y - _area.y);
			
			return new Point( x, y );
		}
		
		
		/**
		 *	Disposes object.
		 */
		public function dispose () : void
		{
			_pos = undefined;
			_area = undefined;
			_axis = undefined;
		}
		
		
		public function dispatch(type : String):Boolean
		{
			var event : SliderEvent;
			
			event				= new SliderEvent( type );
			event.percentage	= percentage;
			event.position		= position;
			event.offset		= offset;
			event.area			= area;
			
			return dispatchEvent( event );
		}
	
	}
}