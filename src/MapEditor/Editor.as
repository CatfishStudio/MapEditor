package MapEditor 
{
	import fl.controls.Button;
	import fl.controls.TextInput;
	import fl.controls.ComboBox;
	import fl.controls.Label
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import fl.data.DataProvider; 
	import fl.events.ComponentEvent;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL; 
	import flash.net.Responder;
	import flash.net.URLRequest;
	import MapEditor.Resource;
	
	public class Editor extends Sprite 
	{
		private var levelType:Array = new Array( 
			{label:"Собрать кристалы", data:"LEVEL_TYPE_COLLECT"}, 
			{label:"Набрать очки", data:"LEVEL_TYPE_SCORE_POINTS"}, 
			{label:"Спустить объект", data:"LEVEL_TYPE_DROP_OBJECT"}, 
			{label:"На время", data:"LEVEL_TYPE_TIME"} 
		); 
		
		private var crystalType:Array = new Array( 
			{label:"Все кристалы", data:"CRYSTAL_TYPE_ALL"},
			{label:"1-Фиолетовый", data:"CRYSTAL_TYPE_1_VIOLET"}, 
			{label:"2-Зеленый", data:"CRYSTAL_TYPE_2_GREEN"}, 
			{label:"3-Красный", data:"CRYSTAL_TYPE_3_RED"}, 
			{label:"4-Синий", data:"CRYSTAL_TYPE_4_BLUE" }, 
			{label:"5-Желтый", data:"CRYStAL_TYPE_5_YELLOW"} 
		);
		
		private var button1:Button = new Button();
		private var button2:Button = new Button();
		private var label1:Label = new Label();
		private var textBox1:TextInput = new TextInput();
		private var label2:Label = new Label();
		private var textBox2:TextInput = new TextInput();
		private var label3:Label = new Label();
		private var comboBox1:ComboBox = new ComboBox();
		private var label4:Label = new Label();
		private var textBox4:TextInput = new TextInput();
		private var label5:Label = new Label();
		private var comboBox2:ComboBox = new ComboBox();
		private var label6:Label = new Label();
		private var textBox6:TextInput = new TextInput();
		private var label7:Label = new Label();
		private var textBox7:TextInput = new TextInput();
		private var label8:Label = new Label();
		private var textBox8:TextInput = new TextInput();
		private var label9:Label = new Label();
		private var textBox9:TextInput = new TextInput();
		private var label10:Label = new Label();
		private var textBox10:TextInput = new TextInput();
		private var label11:Label = new Label();
		private var cursor:Bitmap = new Resource.CursorImage();
		private var crystal1:Bitmap = new Resource.CImage1();
		private var crystal2:Bitmap = new Resource.CImage2();
		private var crystal3:Bitmap = new Resource.CImage3();
		private var crystal4:Bitmap = new Resource.CImage4();
		private var crystal5:Bitmap = new Resource.CImage5();
		private var cell:Bitmap = new Resource.CellClearImage();
		private var empty:Bitmap = new Resource.EmptyImage();
		private var drop:Bitmap = new Resource.DropImage();
		private var rune:Bitmap = new Resource.RuneImage();
		private var stone:Bitmap = new Resource.StoneImage();
		
		
		public function Editor() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			this.x = 0; this.y = 0;
			
			/* Кнопки */
			button1.label = "Открыть";
			button1.x = 10; button1.y = 10;
			button1.addEventListener(MouseEvent.CLICK, onButton1MouseClick);
			this.addChild(button1);
			button2.label = "Сохранить";
			button2.x = 120; button2.y = 10;
			button2.addEventListener(MouseEvent.CLICK, onButton2MouseClick);
			this.addChild(button2);
			
			/* Метка */
			label1.text = "Номер уровня:";
			label1.x = 20; label1.y = 50;
			this.addChild(label1);
			/* Номер уровня */
			textBox1.text = "0";
			textBox1.x = 20; textBox1.y = 70;
			textBox1.width = 200;
			this.addChild(textBox1);
			
			/* Метка */
			label2.text = "Номер локации:";
			label2.x = 20; label2.y = 100;
			this.addChild(label2);
			/* Номер локации */
			textBox2.text = "0";
			textBox2.x = 20; textBox2.y = 120;
			textBox2.width = 200;
			this.addChild(textBox2);
			
			/* Метка */
			label3.text = "Тип уровня:";
			label3.x = 20; label3.y = 150;
			this.addChild(label3);
			/* Тип уровня */
			comboBox1.x = 20; comboBox1.y = 170;
			comboBox1.dropdownWidth = 210; 
			comboBox1.width = 200;  
			//comboBox1.move(150, 50);
			comboBox1.selectedIndex = 0;
			//comboBox1.prompt = "Собрать кристалы"; 
			comboBox1.dataProvider = new DataProvider(levelType); 
			comboBox1.addEventListener(Event.CHANGE, changeHandler1); 
			this.addChild(comboBox1);
			
			/* Метка */
			label5.text = "Тип кристала по заданию сбора:";
			label5.x = 20; label5.y = 200;
			label5.width = 200;
			this.addChild(label5);
			/* Тип уровня */
			comboBox2.x = 20; comboBox2.y = 220;
			comboBox2.dropdownWidth = 210; 
			comboBox2.width = 200;  
			comboBox2.selectedIndex = 0;
			comboBox2.dataProvider = new DataProvider(crystalType); 
			comboBox2.addEventListener(Event.CHANGE, changeHandler2);
			this.addChild(comboBox2);
			
			/* Метка */
			label6.text = "Количество кристалов:";
			label6.x = 20; label6.y = 250;
			label6.width = 200;
			this.addChild(label6);
			/* Количество ходов*/
			textBox6.text = "0";
			textBox6.x = 20; textBox6.y = 270;
			textBox6.width = 200;
			this.addChild(textBox6);
			
			/* Метка */
			label7.text = "Количество очнов:";
			label7.x = 20; label7.y = 300;
			this.addChild(label7);
			/* Количество ходов*/
			textBox7.text = "0";
			textBox7.x = 20; textBox7.y = 320;
			textBox7.width = 200;
			this.addChild(textBox7);
			
			/* Метка */
			label8.text = "Время на уровне:";
			label8.x = 20; label8.y = 350;
			this.addChild(label8);
			/* Количество ходов*/
			textBox8.text = "0";
			textBox8.x = 20; textBox8.y = 370;
			textBox8.width = 200;
			this.addChild(textBox8);
			
			/* Метка */
			label4.text = "Количество ходов:";
			label4.x = 20; label4.y = 400;
			this.addChild(label4);
			/* Количество ходов*/
			textBox4.text = "0";
			textBox4.x = 20; textBox4.y = 420;
			textBox4.width = 200;
			this.addChild(textBox4);
			
			/* Метка */
			label9.text = "Имя атласа:";
			label9.x = 20; label9.y = 500;
			this.addChild(label9);
			/* Количество ходов*/
			textBox9.text = "*.png";
			textBox9.x = 20; textBox9.y = 520;
			textBox9.width = 200;
			this.addChild(textBox9);
			
			/* Метка */
			label10.text = "Имя XML атласа:";
			label10.x = 20; label10.y = 550;
			this.addChild(label10);
			/* Количество ходов*/
			textBox10.text = "*.xml";
			textBox10.x = 20; textBox10.y = 570;
			textBox10.width = 200;
			this.addChild(textBox10);
			
			/* ОБЪЕКТЫ: */
			/* Метка */
			label11.text = "Объекты:";
			label11.x = 950; label11.y = 00;
			this.addChild(label11);
			/* Кристалы */
			cursor.x = 950; cursor.y = 25;
			this.addChild(cursor);
			crystal1.x = 950; crystal1.y = 100;
			this.addChild(crystal1);
			crystal2.x = 950; crystal2.y = 150;
			this.addChild(crystal2);
			crystal3.x = 950; crystal3.y = 200;
			this.addChild(crystal3);
			crystal4.x = 950; crystal4.y = 250;
			this.addChild(crystal4);
			crystal5.x = 950; crystal5.y = 300;
			this.addChild(crystal5);
			/* Ячейки */
			cell.x = 950; cell.y = 400;
			this.addChild(cell);
			empty.x = 950; empty.y = 460;
			this.addChild(empty);
			drop.x = 950; drop.y = 520;
			this.addChild(drop);
			rune.x = 950; rune.y = 580;
			this.addChild(rune);
			stone.x = 950; stone.y = 640;
			this.addChild(stone);
			
			/* ИГРОВОЕ ПОЛЕ */
			Resource.MatrixCell =  Resource.CreateVectorMatrix2D(10, 10);
			showField(10, 10);
		}
		
		private function onButton1MouseClick(e:MouseEvent):void 
		{
			Resource.Level = textBox1.text;
			Resource.Location = textBox2.text
			Resource.LevelType = comboBox1.selectedItem.data;
			Resource.CrystalType = comboBox2.selectedItem.data;
			Resource.AmountCrystals = textBox6.text;
			Resource.AmountScore = textBox7.text;
			Resource.Time = textBox8.text;
			Resource.AmountMoves = textBox4.text;
			Resource.FileAtlas = textBox9.text;
			Resource.FileAtlasXML = textBox10.text;
		}
		
		private function onButton2MouseClick(e:MouseEvent):void 
		{
			Resource.Level = textBox1.text;
			Resource.Location = textBox2.text
			Resource.LevelType = comboBox1.selectedItem.data;
			Resource.CrystalType = comboBox2.selectedItem.data;
			Resource.AmountCrystals = textBox6.text;
			Resource.AmountScore = textBox7.text;
			Resource.Time = textBox8.text;
			Resource.AmountMoves = textBox4.text;
			Resource.FileAtlas = textBox9.text;
			Resource.FileAtlasXML = textBox10.text;
		}
		
		
		private function changeHandler1(e:Event):void { 
			comboBox1.text = ComboBox(e.target).selectedItem.label;
			if (ComboBox(e.target).selectedItem.label == "Собрать кристалы")
			{
				comboBox2.enabled = true;
				textBox6.enabled = true;
			}else {
				comboBox2.enabled = false;
				textBox6.enabled = false;
			}
		}
		
		private function changeHandler2(e:Event):void 
		{
			Resource.CrystalType = ComboBox(e.target).selectedItem.data;
			comboBox2.text = ComboBox(e.target).selectedItem.label;
		}
		
		private function showField(_columns:uint, _rows:uint):void
		{
			/* i - столбец; j - строка */
			for (var i:uint = 0; i < _columns; i++) {
				for (var j:uint = 0; j < _rows; j++) {
					(Resource.MatrixCell[i][j] as FieldCell).x = 300 + (50 * i);
					(Resource.MatrixCell[i][j] as FieldCell).y = 50 + (50 * j);
					this.addChild(Resource.MatrixCell[i][j]);
				}
			}
		}
	}

}