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
	import flash.events.MouseEvent;

	/**
	 *  Just a simple toggle button ghost.
	 * @example
	 *
	 * <code>
	 * var tBtn : ToggleBtnGhostComp;
	 * 
	 * tBtn = new ToggleBtnGhostComp (bSpriteInstance);
	 * 
	 * tBtn.onSelectorChange
	 * 
	 * tBtn.isChosen = true;
	 * </code>
	 * @author jancassio | janio@jancassio.com
	 */
	public class ToggleBtnGhost extends BtnGhost
	{	
		
		// [ Event stubs ] ----------------------------------------------------
		/**
		 *	Executes on button is switched
		 */
		public var onSwitch : Function;
		
		
		
		
		
		// [ Body's manipulated parts ] ---------------------------------------
		private var _chosen : Boolean;
		
		
		
		
		
		// [ Setup ] ----------------------------------------------------------
		
		/**
		 * Creates a new ToggleBtnGhostComp instance
		 */
		public function ToggleBtnGhost (body : * = null)
		{
			_chosen = false;
			super(body);
		}



		
		
		/**
		 *	Switches button.
		 */
		public function set isChosen (value:Boolean):void
		{
			_chosen = value;
			if(onSwitch != null) onSwitch(this);
		}
		
		public function get isChosen () : Boolean
		{
			return _chosen ;
		}
		
		
		
		
		// [ Handlers ] -------------------------------------------------------
		
		override protected function onMouseClick (e : MouseEvent) : void
		{
			isChosen = !isChosen;
			super.onMouseClick(e);
		}
	}
}