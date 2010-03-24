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

	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;

	/**
	 *  Simple list composition, just add display objects and his resposes the selections.
	 *
	 *	@author jancassio | janio@jancassio.com  
	 */
	public class ListGhostComp extends GhostComp
	{	
		
		// [ Event stubs ] ----------------------------------------------------
		
		public var onSelect		: Function;
		
		
		// [ composition fields ] ---------------------------------------------
		
		private var precedent	: DisplayObject;
		private var itemsBox	: Sprite;
		private var _selected	: ToggleBtnGhostComp;
		private var _container	: DisplayObjectContainer;
		private var _mask		: DisplayObject;
		
		
		// [ Default body's manipulated parts names ] -------------------------
		
		private var containerName : String;
		private var containerMaskName : String;
		
		
		

		
		// [ Setup ] ----------------------------------------------------------
		
		/**
		 *	Initialize a new ListGhostComp instance.
		 */
		public function ListGhostComp (body : * = null)
		{
			if(body) this.body = body;
			super();
		}
		
		override protected function anatomy () : void
		{
			containerName = "container";
			containerMaskName = "containerMask";
		}
		
		
		
		/**
		 *	@inheritDoc
		 */
		override public function set body (value : *) : void
		{
			super.body = value;
			container = value[ containerName ];
			mask = value[ containerMaskName ];
			mask.visible = false;
			
			itemsBox = new Sprite;
			itemsBox.mask = mask;
			container.addChild( itemsBox );
		}
		
		/**
		 *	The mask of list used to reveal or hide list items.
		 */
		public function set mask (value : DisplayObject) : void
		{
			_mask = value;
		}
		
		
		public function get mask () : DisplayObject
		{
			return _mask ;
		}
		
		/**
		 *	The visual representation of list, like a movieclip with graphical list elements.
		 */
		public function set container (value : DisplayObjectContainer) : void
		{
			_container = value;
		}
		
		public function get container () : DisplayObjectContainer
		{
			return _container;
		}
		
		
		public function get box () : Sprite
		{
			return itemsBox;
		}
		
		
		
		/**
		 *	Push a instance into list.
		 *	@return The ToggleBtnGhostComp to handles option activities.
		 *	@see patota.gui.controls.ToggleBtnGhostComp
		 */
		public function add ( instance : DisplayObject, at : Number = 0) : *
		{
			var option : ToggleBtnGhostComp;
			
			option = new ToggleBtnGhostComp( itemsBox.addChildAt( instance, at ) );
			option.body.y = ( precedent ) ? precedent.y + precedent.height + 5: 0;
			
			precedent = option.body;
			
			option.onSwitch = onSelection;
			
			return option;
		}
		
		public function pick (at : Number) : DisplayObject
		{
			return itemsBox.getChildAt(at);
		}
		
		/**
		 *	Makes/Retrives an option.
		 */
		public function set selected(value:ToggleBtnGhostComp) : void
		{
			_selected = value;
			
			if( onSelect != null) onSelect( value );
		}
		
		public function get selected():ToggleBtnGhostComp
		{
			return _selected;
		}
		
		
		
		
		
		// [ Handlers ] -------------------------------------------------------
		
		private function onSelection(option : ToggleBtnGhostComp):void
		{
			selected = option;
		}
	}
}