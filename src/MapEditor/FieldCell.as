package MapEditor 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import MapEditor.Resource;
	
	public class FieldCell extends Sprite 
	{
		/*
		 * 11. Тип ячейки:
				"Нет ячейки" - "CELL_TYPE_EMPTY"
				"Пустая ячейка" - "CELL_TYPE_CLEAR"
				"Место спуска" - "CELL_TYPE_DROP"
		 * 12. Тип объекта в ячейке
				"нет объекта" - "CRYSTAL_TYPE_0_NO_OBJECT"
				"1-Фиолетовый" - "CRYSTAL_TYPE_1_VIOLET" 
				"2-Зеленый" - "CRYSTAL_TYPE_2_GREEN" 
				"3-Красный" - "CRYSTAL_TYPE_3_RED" 
				"4-Синий" - "CRYSTAL_TYPE_4_BLUE" 
				"5-Желтый" - "CRYSTAL_TYPE_5_YELLOW"
				"6-Линейный кристал вертикаль" - "CRYSTAL_TYPE_6_LINE_UPRIGHT"
				"7-Линейный кристал горизонталь" - "CRYSTAL_TYPE_7_HORIZONTALLY"
				"8-Супер кристал" - "CRYSTAL_TYPE_8_SUPER"
				"9-Камень" - "CRYSTAL_TYPE_9_STONE"
				"10-Руна" - "CRYSTAL_TYPE_10_RUNE"
		 * 
		 * */
		
		private var _cell:Bitmap = new Resource.CellClearImage();	// ячейка
		private var _object:Bitmap = new Bitmap();					// объект
		public var cellType:String = "CELL_TYPE_CLEAR";				// тип ячейки
		public var cellObject:String = "CRYSTAL_TYPE_1_NO_OBJECT";	// объект ячейки
		
		public function FieldCell() 
		{
			this.addEventListener(MouseEvent.CLICK, onMouseClick);
			this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			this.addChild(_cell);
			this.addChild(_object);
		}
		
		private function onMouseOver(e:MouseEvent):void 
		{
			Mouse.cursor = MouseCursor.BUTTON;
		}
		
		private function onMouseOut(e:MouseEvent):void 
		{
			Mouse.cursor = MouseCursor.AUTO;
		}
		
		private function onMouseClick(e:MouseEvent):void 
		{
			if (Resource.SelectObject != "SELECT_NO_OBJECT") {
				if (Resource.SelectObject == "CRYSTAL_TYPE_1_VIOLET" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CImage1();
					this.addChild(_object);
				}
				if (Resource.SelectObject == "CRYSTAL_TYPE_1_VIOLET_LINE_HORIZONTALLY" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CLHImage1();
					this.addChild(_object);
				}
				if (Resource.SelectObject == "CRYSTAL_TYPE_1_VIOLET_LINE_UPRIGHT" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CLUImage1();
					this.addChild(_object);
				}
				if (Resource.SelectObject == "CRYSTAL_TYPE_1_VIOLET_SUPER" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CSImage1();
					this.addChild(_object);
				}
				
				if (Resource.SelectObject == "CRYSTAL_TYPE_2_GREEN" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CImage2();
					this.addChild(_object);
				}
				if (Resource.SelectObject == "CRYSTAL_TYPE_2_GREEN_LINE_HORIZONTALLY" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CLHImage2();
					this.addChild(_object);
				}
				if (Resource.SelectObject == "CRYSTAL_TYPE_2_GREEN_LINE_UPRIGHT" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CLUImage2();
					this.addChild(_object);
				}
				if (Resource.SelectObject == "CRYSTAL_TYPE_2_GREEN_SUPER" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CSImage2();
					this.addChild(_object);
				}
				
				if (Resource.SelectObject == "CRYSTAL_TYPE_3_RED" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CImage3();
					this.addChild(_object);
				}
				if (Resource.SelectObject == "CRYSTAL_TYPE_3_RED_LINE_HORIZONTALLY" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CLHImage3();
					this.addChild(_object);
				}
				if (Resource.SelectObject == "CRYSTAL_TYPE_3_RED_LINE_UPRIGHT" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CLUImage3();
					this.addChild(_object);
				}
				if (Resource.SelectObject == "CRYSTAL_TYPE_3_RED_SUPER" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CSImage3();
					this.addChild(_object);
				}
				
				if (Resource.SelectObject == "CRYSTAL_TYPE_4_BLUE" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CImage4();
					this.addChild(_object);
				}
				if (Resource.SelectObject == "CRYSTAL_TYPE_4_BLUE_LINE_HORIZONTALLY" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CLHImage4();
					this.addChild(_object);
				}
				if (Resource.SelectObject == "CRYSTAL_TYPE_4_BLUE_LINE_UPRIGHT" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CLUImage4();
					this.addChild(_object);
				}
				if (Resource.SelectObject == "CRYSTAL_TYPE_4_BLUE_SUPER" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CSImage4();
					this.addChild(_object);
				}
				
				if (Resource.SelectObject == "CRYSTAL_TYPE_5_YELLOW" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CImage5();
					this.addChild(_object);
				}
				if (Resource.SelectObject == "CRYSTAL_TYPE_5_YELLOW_LINE_HORIZONTALLY" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CLHImage5();
					this.addChild(_object);
				}
				if (Resource.SelectObject == "CRYSTAL_TYPE_5_YELLOW_LINE_UPRIGHT" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CLUImage5();
					this.addChild(_object);
				}
				if (Resource.SelectObject == "CRYSTAL_TYPE_5_YELLOW_SUPER" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.CSImage5();
					this.addChild(_object);
				}
				
				if (Resource.SelectObject == "CRYSTAL_TYPE_9_STONE" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.StoneImage();
					this.addChild(_object);
				}
				if (Resource.SelectObject == "CRYSTAL_TYPE_10_RUNE" && cellType != "CELL_TYPE_EMPTY") {
					cellObject = Resource.SelectObject;
					this.removeChild(_object);
					_object = new Resource.RuneImage();
					this.addChild(_object);
				}
				
				
				if (Resource.SelectObject == "CELL_TYPE_DROP") {
					cellObject = "CELL_TYPE_CLEAR";
					cellType = Resource.SelectObject;
					this.removeChild(_object);
					this.removeChild(_cell);
					_cell = new Resource.DropImage();
					_object = new Bitmap();
					this.addChild(_cell);
					this.addChild(_object);
				}
				if (Resource.SelectObject == "CELL_TYPE_EMPTY") {
					cellObject = "CELL_TYPE_CLEAR";
					cellType = Resource.SelectObject;
					this.removeChild(_object);
					this.removeChild(_cell);
					_cell = new Resource.EmptyImage();
					_object = new Bitmap();
					this.addChild(_cell);
					this.addChild(_object);
				}
				if (Resource.SelectObject == "CELL_TYPE_CLEAR") {
					cellObject = "CELL_TYPE_CLEAR";
					cellType = Resource.SelectObject;
					this.removeChild(_object);
					this.removeChild(_cell);
					_cell = new Resource.CellClearImage();
					_object = new Bitmap();
					this.addChild(_cell);
					this.addChild(_object);
				}
			}
		}
		
	}

}