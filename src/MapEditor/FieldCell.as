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
		private var _object:Bitmap;
		public var cellType:String = "CELL_TYPE_CLEAR";				// тип ячейки
		public var cellObject:String = "CRYSTAL_TYPE_1_NO_OBJECT";	// объект ячейки
		
		public function FieldCell() 
		{
			this.addEventListener(MouseEvent.CLICK, onMouseClick);
			this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			this.addChild(_cell);
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
				if (Resource.SelectObject == "CRYSTAL_TYPE_1_VIOLET") {
					_object = new Resource.CImage1();
					this.addChild(_object);
				}
			}
		}
		
	}

}