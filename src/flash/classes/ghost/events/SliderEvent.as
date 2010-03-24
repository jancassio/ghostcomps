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
	http://ghost.as
	
	------------------------------------------------------------------------ */

package ghost.events
{
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * Slider event is trigged on general slide interaction type.
	 * 
	 * @author jancassio | janio@jancassio.com
	 */
	public final class SliderEvent extends Event
	{
		
		
		/** Dispatched when slider is dragged */
		public static const DRAG	: String = "sliderDrag";
		
		/** Dispatched when slider is dropped */
		public static const DROP	: String = "sliderDrop";
		
		/** Dispatched when slider is updated */
		public static const UPDATE	: String = "sliderUpdate";
		

		/** percentage (x and y, values between 0..1) of slide point over area */
		public var percentage	: Point;
		
		/** point postion (x and y) on slide area */ 
		public var position		: Point;
		
		/** offset (x and y) over rect */
		public var offset		: Point;
		
		/** current area size and position */
		public var area			: Rectangle;
		
		
		public function SliderEvent( type:String, bubbles:Boolean=false, cancelable:Boolean=false )
		{
			super(type, bubbles, cancelable);
		}

		override public function clone():Event
		{
			var e : SliderEvent;
			e = new SliderEvent(type, bubbles, cancelable);
			
			e.percentage = percentage;
			e.position = position;
			e.offset = offset;
			e.area = area;
			
			return e;
		}
		
		override public function toString () : String
		{
			return super.toString() + this.formatToString("SliderEvent", "position", "percentage", "offset", "area");
		}
	}
}