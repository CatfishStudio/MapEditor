package MapEditor 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import MapEditor.Resource;
	
	public class FieldCell extends Sprite 
	{
		private var cell:Bitmap = new Resource.CellClearImage();
		
		public function FieldCell() 
		{
			this.addChild(cell);
		}
		
	}

}