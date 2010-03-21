package ghost.comps
{

	/**
	 *  All ghost comps have an interface called IGhostComp.
	 *  In this face, you only see the controled body part.
	 *  
	* @author jancassio | jancassio@ghost.com
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