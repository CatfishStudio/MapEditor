package MapEditor 
{
	import flash.display.Bitmap;
	import MapEditor.FieldCell;
	
	public class Resource 
	{
		[Embed(source = '../../images/crystal_1_50_50.png')]
		public static var CImage1:Class;
		[Embed(source = '../../images/crystal_2_50_50.png')]
		public static var CImage2:Class;
		[Embed(source = '../../images/crystal_3_50_50.png')]
		public static var CImage3:Class;
		[Embed(source = '../../images/crystal_4_50_50.png')]
		public static var CImage4:Class;
		[Embed(source = '../../images/crystal_5_50_50.png')]
		public static var CImage5:Class;
		[Embed(source = '../../images/cursor.png')]
		public static var CursorImage:Class;
		[Embed(source = '../../images/cell.png')]
		public static var CellClearImage:Class;
		[Embed(source = '../../images/drop.png')]
		public static var DropImage:Class;
		[Embed(source = '../../images/empty.png')]
		public static var EmptyImage:Class;
		[Embed(source = '../../images/rune.png')]
		public static var RuneImage:Class;
		[Embed(source = '../../images/stone.png')]
		public static var StoneImage:Class;
		
		/* Параметры редактируемого уровня */
		public static var Level:String;			// номер уровня
		public static var Location:String;		// номер локации
		public static var LevelType:String;		// тип уровня
		public static var CrystalType:String;	// тип кристала
		public static var AmountCrystals:String;// количество кристалов
		public static var AmountScore:String;	// количество очков
		public static var Time:String;			// время на уровне
		public static var AmountMoves:String;	// количество ходов
		public static var FileAtlas:String;		// имя файла атласа
		public static var FileAtlasXML:String;	// имя файла атласа xml
		
		public static var MatrixCell:Vector.<Vector.<FieldCell>>;
		
		/* Игровое поле */
		public static function CreateArrayMatrix2D(_columns:int, _rows:int):Array
		{
			/* i - столбец; j - строка */
			var newArray:Array = [];
			var unitAdd:FieldCell = new FieldCell();
			for (var i:int = 0; i < _columns; i++) {
				var newRow:Array = [];
				for (var j:int = 0; j < _rows; j++) {
					newRow.push(unitAdd);
				}
				newArray.push(newRow);
			}
			return newArray;
		}
		
		public static function CreateVectorMatrix2D(_columns:uint, _rows:uint):Vector.<Vector.<FieldCell>>
		{
			/*
			MatrixCell = new < Vector.<FieldCell> > [
				new <FieldCell>[new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell()], 
				new <FieldCell>[new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell()],
				new <FieldCell>[new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell()],
				new <FieldCell>[new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell()],
				new <FieldCell>[new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell()],
				new <FieldCell>[new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell()],
				new <FieldCell>[new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell()],
				new <FieldCell>[new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell()],
				new <FieldCell>[new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell()],
				new <FieldCell>[new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell(), new FieldCell()]
			];
			*/
			
			/* i - столбец; j - строка */
			/*
			MatrixCell = new Vector.<Vector.<FieldCell>>();
			for (var i:uint = 0; i < _columns; i++) {
				var newRow:Vector.<FieldCell> = new Vector.<FieldCell>();
				for (var j:uint = 0; j < _rows; j++) {
					newRow.push(new FieldCell());
				}
				MatrixCell.push(newRow);
			}
			*/
			
			var _matrixCell:Vector.<Vector.<FieldCell>> = new Vector.<Vector.<FieldCell>>();
			for (var i:uint = 0; i < _columns; i++) {
				var newRow:Vector.<FieldCell> = new Vector.<FieldCell>();
				for (var j:uint = 0; j < _rows; j++) {
					newRow.push(new FieldCell());
				}
				_matrixCell.push(newRow);
			}
			return _matrixCell;
		}
		
		
	}

}