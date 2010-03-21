package ghost.comps
{

	/**
	 *  All ghost comps have an interface called IGhostComp.
	 *  In this face, you only see the controled body part.
	 *  
	 *  @author Jan Cássio | janio@ghost.as
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