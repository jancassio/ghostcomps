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

package ghost.comps
{

	/**
	 *  All ghost comps have an interface called IGhostComp.
	 *  In this face, you only see the controled body part.
	 *  
	* @author jancassio | janio@jancassio.com
	 */
	public interface IGhostComp
	{
		/**
		 *	Body that controls.
		 */
		function get body () : *
		
		function set body (value : *) : void
	}
}