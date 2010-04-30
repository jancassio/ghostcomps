package demos.text 
{
	import flash.text.TextField;
	import ghostcomps.skins.ATextArea;

	/**
	 * @author jancassio | janio@jancassio.com
	 */
	public class TextArea extends ATextArea 
	{
		public function TextArea ()
		{
		}
		
		public function get label () : TextField
		{
			return label_txt;
		}
	}
}
