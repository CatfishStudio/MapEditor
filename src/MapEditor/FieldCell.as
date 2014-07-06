package MapEditor 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import MapEditor.Resource;
	
	public class FieldCell extends Sprite 
	{
		private var cell:Bitmap = new Resource.CellClearImage();
		public var cellType:int = 1;	// 0 - нет ячейки, 1 - пустая ячейка, 2 - ячейка для спуска руны
		public var cellObject:int = 0;
		
		public function FieldCell() 
		{
			this.addChild(cell);
		}
		
	}

}