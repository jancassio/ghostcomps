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

	import flash.events.MouseEvent;

	/**
	 *  The ComboGhostComp is a composition of list + slider + button, compose this ghosts
	 *  and put into Combo to works fine!
	 *  
	 *  @author jancassio | janio@jancassio.com
	 *  
	 */
	public class ComboGhost extends GhostComp
	{
		
		// [ Event stubs ] ----------------------------------------------------
		
		public var onSelect		: Function;
		public var onExpand		: Function;
		public var onCollapse	: Function;
		
		
		// [ composition fields ] ---------------------------------------------
		
		private var _list	: ListGhost;
		private var _scroll	: SliderGhost;
		private var _button	: BtnGhost;
		

		// [ Default body's manipulated parts names ] -------------------------
		
		private var listName	: String;
		private var scrollName	: String;
		private var buttonName	: String;

		
		public function ComboGhost (skin : * = null)
		{
			conf(skin);
		}
		
		private function conf (skin : * = null) : void
		{
			_list	= new ListGhost;
			_scroll = new SliderGhost;
			_button = new BtnGhost;
			
			this.body = skin;
		}
		
		override protected function anatomy () : void
		{
			listName	= "list_mc";
			scrollName	= "scroll_mc";
			buttonName	= "button_mc";
		}
		
		
		
		
		// [ Get/Set ] --------------------------------------------------------
		
		/**
		 *	@inheritDoc
		 */
		override public function set body (value:*):void
		{
			super.body	= value;
			list.body	= value[ listName ];
			scroll.body	= value[ scrollName ];
			button.body	= value[ buttonName ];
			
			list.onSelect = onListSelect;
			collapse();
		}
		
		/**
		 *	A ListGUI instance.
		 */
		public function get list () : ListGhost
		{
			return _list;
		}
		
		/**
		 *	A Slider2DGhostComp instance.
		 */
		public function get scroll () : SliderGhost
		{
			return _scroll;
		}
		
		/**
		 *	A BtnGhostComp instance.
		 */
		public function get button () : BtnGhost
		{
			return _button;
		}
		
		
		
		
				
		/**
		 *	Show options list.
		 */
		public function expand () : void
		{
			list.body.visible = true;
			scroll.body.visible = true;
			if( onExpand != null ) onExpand( this );
			list.container.addEventListener(MouseEvent.MOUSE_MOVE, onMaskMouseOut);
		}
		
		private function onMaskMouseOut(e:MouseEvent) : void
		{
			if(list.container.hitTestPoint(list.container.mouseX, list.container.mouseY)) collapse();
		}
		
		/**
		 *	Hide option list.
		 */
		public function collapse () : void
		{
			list.body.visible = false;
			scroll.body.visible = false;
			if( onCollapse != null ) onCollapse( this );
			list.container.removeEventListener(MouseEvent.MOUSE_MOVE, onMaskMouseOut);
		}
		
		/**
		 *	Toggle between expand/collapse methods.
		 *	@return Has expanded (true) or collapsed (false).
		 */
		public function toggleExpand () : Boolean
		{
			(_list.body.visible) ? collapse() : expand();
			return _list.body.visible;
		}
		
		
		
		
		
		// [ Handlers ] -------------------------------------------------------
		
		private function onListSelect (option : ToggleBtnGhost) : void
		{
			collapse();
			onSelect(list.selected);
		}
	}
}