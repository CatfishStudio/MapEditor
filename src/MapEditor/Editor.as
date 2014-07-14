package MapEditor 
{
	import fl.controls.Button;
	import fl.controls.TextInput;
	import fl.controls.ComboBox;
	import fl.controls.Label
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.FileReference;
	import flash.net.URLLoader;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import fl.data.DataProvider; 
	import fl.events.ComponentEvent;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL; 
	import flash.net.Responder;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import MapEditor.Resource;
	
	/*
		 * ТАБЛИЦА ЗНАЧЕНИЙ РЕДАКТОРА
		 * -------------------------------------
		 * 1. Номер уровня: 0
		 * 2. Номер локации: 0
		 * 3. Тип уровня: 
				"Собрать кристалы" - "LEVEL_TYPE_COLLECT" 
				"Набрать очки" - "LEVEL_TYPE_SCORE_POINTS" 
				"Спустить объект" - "LEVEL_TYPE_DROP_OBJECT" 
				"На время" - "LEVEL_TYPE_TIME"
		 * 4. Тип кристала:
				"Все кристалы" - "CRYSTAL_TYPE_ALL"
				"1-Фиолетовый" - "CRYSTAL_TYPE_1_VIOLET" 
				"2-Зеленый" - "CRYSTAL_TYPE_2_GREEN" 
				"3-Красный" - "CRYSTAL_TYPE_3_RED" 
				"4-Синий" - "CRYSTAL_TYPE_4_BLUE" 
				"5-Желтый" - "CRYSTAL_TYPE_5_YELLOW" 
				"6-Линейный кристал вертикаль" - "CRYSTAL_TYPE_6_LINE_UPRIGHT"
				"7-Линейный кристал горизонталь" - "CRYSTAL_TYPE_7_LINE_HORIZONTALLY"
				"8-Супер кристал" - "CRYSTAL_TYPE_8_SUPER"
				"9-Не собирать" - "CRYSTAL_TYPE_9_NO"
		 * 5. Количество кристалов: 0
		 * 6. Количество очков: 0
		 * 7. Время на уровне: 0
		 * 8. Количество ходов: 0
		 * 9. Имя картинки атласа: *.png
		 * 10. Имя xml файла атласа: *.xml
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
				"7-Линейный кристал горизонталь" - "CRYSTAL_TYPE_7_LINE_HORIZONTALLY"
				"8-Супер кристал" - "CRYSTAL_TYPE_8_SUPER"
				"9-Камень" - "CRYSTAL_TYPE_9_STONE"
				"10-Руна" - "CRYSTAL_TYPE_10_RUNE"
		 * 13. Интенсивность выпадения кристалов
				"Все кристалы" - "CRYSTAL_TYPE_ALL"
				"1-Фиолетовый" - "CRYSTAL_TYPE_1_VIOLET" 
				"2-Зеленый" - "CRYSTAL_TYPE_2_GREEN" 
				"3-Красный" - "CRYSTAL_TYPE_3_RED" 
				"4-Синий" - "CRYSTAL_TYPE_4_BLUE" 
				"5-Желтый" - "CRYSTAL_TYPE_5_YELLOW"
		 * 
		 * -------------------------------------
		 * */
	
	public class Editor extends Sprite 
	{
		private var fileRef:FileReference; // работа с файном
		private var openFile:URLLoader; // открытие XML файла
		
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
		private var label20:Label = new Label();
		private var textBox11:TextInput = new TextInput();
		
				
		private var label12:Label = new Label();
		private var comboBox10:ComboBox = new ComboBox();
		private var comboBox11:ComboBox = new ComboBox();
		private var comboBox12:ComboBox = new ComboBox();
		private var comboBox13:ComboBox = new ComboBox();
		private var comboBox14:ComboBox = new ComboBox();
		private var comboBox15:ComboBox = new ComboBox();
		private var comboBox16:ComboBox = new ComboBox();
		private var comboBox17:ComboBox = new ComboBox();
		private var comboBox18:ComboBox = new ComboBox();
		private var comboBox19:ComboBox = new ComboBox();
		
				
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
			comboBox1.dataProvider = new DataProvider(Resource.levelType); 
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
			comboBox2.dataProvider = new DataProvider(Resource.crystalType); 
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
			/* имя файла*/
			textBox9.text = "*.png";
			textBox9.x = 20; textBox9.y = 520;
			textBox9.width = 200;
			this.addChild(textBox9);
			
			/* Метка */
			label10.text = "Имя XML атласа:";
			label10.x = 20; label10.y = 550;
			this.addChild(label10);
			/* имя файла */
			textBox10.text = "*.xml";
			textBox10.x = 20; textBox10.y = 570;
			textBox10.width = 200;
			this.addChild(textBox10);
			
			/* Метка */
			label20.text = "Имя фона в атласе:";
			label20.x = 20; label20.y = 600;
			this.addChild(label20);
			/* имя файла */
			textBox11.text = "";
			textBox11.x = 20; textBox11.y = 620;
			textBox11.width = 200;
			this.addChild(textBox11);
			
			/* ПАНЕЛЬ ОБЪЕКТОВ */
			this.addChild(new PanelObjects());
			
			/* ИГРОВОЕ ПОЛЕ */
			Resource.MatrixCell =  Resource.CreateVectorMatrix2D(Resource.COLUMNS, Resource.ROWS);
			showField(Resource.COLUMNS, Resource.ROWS);
			
			/* Метка */
			label12.text = "Интенсивность выпадения кристалов:";
			label12.x = 300; label12.y = 550; label12.width = 300;
			this.addChild(label12);
			/* Интентивность колонки */
			comboBox10.x = 300; comboBox10.y = 570;
			comboBox10.dropdownWidth = 50; 	comboBox10.width = 50;  
			comboBox10.selectedIndex = 0; comboBox10.dataProvider = new DataProvider(Resource.crystalIntensive); 
			comboBox10.addEventListener(Event.CHANGE, changeHandler10);
			this.addChild(comboBox10);
			/* Интентивность колонки */
			comboBox11.x = 350; comboBox11.y = 570;
			comboBox11.dropdownWidth = 50; 	comboBox11.width = 50;  
			comboBox11.selectedIndex = 0; comboBox11.dataProvider = new DataProvider(Resource.crystalIntensive); 
			comboBox11.addEventListener(Event.CHANGE, changeHandler11);
			this.addChild(comboBox11);
			/* Интентивность колонки */
			comboBox12.x = 400; comboBox12.y = 570;
			comboBox12.dropdownWidth = 50; 	comboBox12.width = 50;  
			comboBox12.selectedIndex = 0; comboBox12.dataProvider = new DataProvider(Resource.crystalIntensive); 
			comboBox12.addEventListener(Event.CHANGE, changeHandler12);
			this.addChild(comboBox12);
			/* Интентивность колонки */
			comboBox13.x = 450; comboBox13.y = 570;
			comboBox13.dropdownWidth = 50; 	comboBox13.width = 50;  
			comboBox13.selectedIndex = 0; comboBox13.dataProvider = new DataProvider(Resource.crystalIntensive); 
			comboBox13.addEventListener(Event.CHANGE, changeHandler13);
			this.addChild(comboBox13);
			/* Интентивность колонки */
			comboBox14.x = 500; comboBox14.y = 570;
			comboBox14.dropdownWidth = 50; 	comboBox14.width = 50;  
			comboBox14.selectedIndex = 0; comboBox14.dataProvider = new DataProvider(Resource.crystalIntensive); 
			comboBox14.addEventListener(Event.CHANGE, changeHandler14);
			this.addChild(comboBox14);
			/* Интентивность колонки */
			comboBox15.x = 550; comboBox15.y = 570;
			comboBox15.dropdownWidth = 50; 	comboBox15.width = 50;  
			comboBox15.selectedIndex = 0; comboBox15.dataProvider = new DataProvider(Resource.crystalIntensive); 
			comboBox15.addEventListener(Event.CHANGE, changeHandler15);
			this.addChild(comboBox15);
			/* Интентивность колонки */
			comboBox16.x = 600; comboBox16.y = 570;
			comboBox16.dropdownWidth = 50; 	comboBox16.width = 50;  
			comboBox16.selectedIndex = 0; comboBox16.dataProvider = new DataProvider(Resource.crystalIntensive); 
			comboBox16.addEventListener(Event.CHANGE, changeHandler16);
			this.addChild(comboBox16);
			/* Интентивность колонки */
			comboBox17.x = 650; comboBox17.y = 570;
			comboBox17.dropdownWidth = 50; 	comboBox17.width = 50;  
			comboBox17.selectedIndex = 0; comboBox17.dataProvider = new DataProvider(Resource.crystalIntensive); 
			comboBox17.addEventListener(Event.CHANGE, changeHandler17);
			this.addChild(comboBox17);
			/* Интентивность колонки */
			comboBox18.x = 700; comboBox18.y = 570;
			comboBox18.dropdownWidth = 50; 	comboBox18.width = 50;  
			comboBox18.selectedIndex = 0; comboBox18.dataProvider = new DataProvider(Resource.crystalIntensive); 
			comboBox18.addEventListener(Event.CHANGE, changeHandler18);
			this.addChild(comboBox18);
			/* Интентивность колонки */
			comboBox19.x = 750; comboBox19.y = 570;
			comboBox19.dropdownWidth = 50; 	comboBox19.width = 50;  
			comboBox19.selectedIndex = 0; comboBox19.dataProvider = new DataProvider(Resource.crystalIntensive); 
			comboBox19.addEventListener(Event.CHANGE, changeHandler19);
			this.addChild(comboBox19);
		}
		
		/* Открыть файл ----------------------------------------------- */
		private function onButton1MouseClick(e:MouseEvent):void 
		{
			fileRef = new FileReference();
			fileRef.addEventListener(Event.SELECT, selectFileDialog);
			fileRef.browse();
		}
		
		private function selectFileDialog(e:Event):void 
		{
			openFile = new URLLoader();
			openFile.load(new URLRequest(fileRef.name));
			openFile.addEventListener(Event.COMPLETE,onCompleteOpenFile);
			openFile.addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityError);
			openFile.addEventListener(IOErrorEvent.IO_ERROR, ioError); 
		}
		
		private function onCompleteOpenFile(e:Event):void 
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
			Resource.BackgroundAtlas = textBox11.text;
			Resource.IntensityColumn0 = comboBox10.selectedItem.data;
			Resource.IntensityColumn1 = comboBox11.selectedItem.data;
			Resource.IntensityColumn2 = comboBox12.selectedItem.data;
			Resource.IntensityColumn3 = comboBox13.selectedItem.data;
			Resource.IntensityColumn4 = comboBox14.selectedItem.data;
			Resource.IntensityColumn5 = comboBox15.selectedItem.data;
			Resource.IntensityColumn6 = comboBox16.selectedItem.data;
			Resource.IntensityColumn7 = comboBox17.selectedItem.data;
			Resource.IntensityColumn8 = comboBox18.selectedItem.data;
			Resource.IntensityColumn9 = comboBox19.selectedItem.data;
		}
		private function securityError(e:SecurityErrorEvent):void
		{
			trace("SecurityErrorEvent");
		}
		private function ioError(e:IOErrorEvent):void
		{
			trace("IOErrorEvent");
		} 
		
		/* Сохранить файл ----------------------------------------------- */
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
			Resource.BackgroundAtlas = textBox11.text;
			Resource.IntensityColumn0 = comboBox10.selectedItem.data;
			Resource.IntensityColumn1 = comboBox11.selectedItem.data;
			Resource.IntensityColumn2 = comboBox12.selectedItem.data;
			Resource.IntensityColumn3 = comboBox13.selectedItem.data;
			Resource.IntensityColumn4 = comboBox14.selectedItem.data;
			Resource.IntensityColumn5 = comboBox15.selectedItem.data;
			Resource.IntensityColumn6 = comboBox16.selectedItem.data;
			Resource.IntensityColumn7 = comboBox17.selectedItem.data;
			Resource.IntensityColumn8 = comboBox18.selectedItem.data;
			Resource.IntensityColumn9 = comboBox19.selectedItem.data;
			
			var bytes:ByteArray = new ByteArray();
			fileRef = new FileReference();
			bytes.writeMultiByte("<levelNumber>", "iso-8859-1");
			bytes.writeMultiByte(Resource.Level, "iso-8859-1");
			bytes.writeMultiByte("</levelNumber>\n", "iso-8859-1");
			bytes.writeMultiByte("<locationNumber>", "iso-8859-1");
			bytes.writeMultiByte(Resource.Location, "iso-8859-1");
			bytes.writeMultiByte("</locationNumber>\n", "iso-8859-1");
			bytes.writeMultiByte("<levelType>", "iso-8859-1");
			bytes.writeMultiByte(Resource.LevelType, "iso-8859-1");
			bytes.writeMultiByte("</levelType>\n", "iso-8859-1");
			bytes.writeMultiByte("<crystalType>", "iso-8859-1");
			bytes.writeMultiByte(Resource.CrystalType, "iso-8859-1");
			bytes.writeMultiByte("</crystalType>\n", "iso-8859-1");
			bytes.writeMultiByte("<amountCrystals>", "iso-8859-1");
			bytes.writeMultiByte(Resource.AmountCrystals, "iso-8859-1");
			bytes.writeMultiByte("</amountCrystals>\n", "iso-8859-1");
			bytes.writeMultiByte("<amountScore>", "iso-8859-1");
			bytes.writeMultiByte(Resource.AmountScore, "iso-8859-1");
			bytes.writeMultiByte("</amountScore>\n", "iso-8859-1");
			bytes.writeMultiByte("<time>", "iso-8859-1");
			bytes.writeMultiByte(Resource.Time, "iso-8859-1");
			bytes.writeMultiByte("</time>\n", "iso-8859-1");
			bytes.writeMultiByte("<amountMoves>", "iso-8859-1");
			bytes.writeMultiByte(Resource.AmountMoves, "iso-8859-1");
			bytes.writeMultiByte("</amountMoves>\n", "iso-8859-1");
			bytes.writeMultiByte("<fileAtlas>", "iso-8859-1");
			bytes.writeMultiByte(Resource.FileAtlas, "iso-8859-1");
			bytes.writeMultiByte("</fileAtlas>\n", "iso-8859-1");
			bytes.writeMultiByte("<fileAtlasXML>", "iso-8859-1");
			bytes.writeMultiByte(Resource.FileAtlasXML, "iso-8859-1");
			bytes.writeMultiByte("</fileAtlasXML>\n", "iso-8859-1");
			bytes.writeMultiByte("<backgroundAtlas>", "iso-8859-1");
			bytes.writeMultiByte(Resource.BackgroundAtlas, "iso-8859-1");
			bytes.writeMultiByte("</backgroundAtlas>\n", "iso-8859-1");
			bytes.writeMultiByte("<intensityColumn0>", "iso-8859-1");
			bytes.writeMultiByte(Resource.IntensityColumn0, "iso-8859-1");
			bytes.writeMultiByte("</intensityColumn0>\n", "iso-8859-1");
			bytes.writeMultiByte("<intensityColumn1>", "iso-8859-1");
			bytes.writeMultiByte(Resource.IntensityColumn1, "iso-8859-1");
			bytes.writeMultiByte("</intensityColumn1>\n", "iso-8859-1");
			bytes.writeMultiByte("<intensityColumn2>", "iso-8859-1");
			bytes.writeMultiByte(Resource.IntensityColumn2, "iso-8859-1");
			bytes.writeMultiByte("</intensityColumn2>\n", "iso-8859-1");
			bytes.writeMultiByte("<intensityColumn3>", "iso-8859-1");
			bytes.writeMultiByte(Resource.IntensityColumn3, "iso-8859-1");
			bytes.writeMultiByte("</intensityColumn3>\n", "iso-8859-1");
			bytes.writeMultiByte("<intensityColumn4>", "iso-8859-1");
			bytes.writeMultiByte(Resource.IntensityColumn4, "iso-8859-1");
			bytes.writeMultiByte("</intensityColumn4>\n", "iso-8859-1");
			bytes.writeMultiByte("<intensityColumn5>", "iso-8859-1");
			bytes.writeMultiByte(Resource.IntensityColumn5, "iso-8859-1");
			bytes.writeMultiByte("</intensityColumn5>\n", "iso-8859-1");
			bytes.writeMultiByte("<intensityColumn6>", "iso-8859-1");
			bytes.writeMultiByte(Resource.IntensityColumn6, "iso-8859-1");
			bytes.writeMultiByte("</intensityColumn6>\n", "iso-8859-1");
			bytes.writeMultiByte("<intensityColumn7>", "iso-8859-1");
			bytes.writeMultiByte(Resource.IntensityColumn7, "iso-8859-1");
			bytes.writeMultiByte("</intensityColumn7>\n", "iso-8859-1");
			bytes.writeMultiByte("<intensityColumn8>", "iso-8859-1");
			bytes.writeMultiByte(Resource.IntensityColumn8, "iso-8859-1");
			bytes.writeMultiByte("</intensityColumn8>\n", "iso-8859-1");
			bytes.writeMultiByte("<intensityColumn9>", "iso-8859-1");
			bytes.writeMultiByte(Resource.IntensityColumn9, "iso-8859-1");
			bytes.writeMultiByte("</intensityColumn9>\n", "iso-8859-1");
			
			/* i - столбец; j - строка */
			for (var i:uint = 0; i < Resource.COLUMNS; i++) {
				for (var j:uint = 0; j < Resource.ROWS; j++) {
					bytes.writeMultiByte("<cell" + i.toString() + "_" + j.toString() + ">\n", "iso-8859-1");
						bytes.writeMultiByte("<cellType>", "iso-8859-1");
						bytes.writeMultiByte((Resource.MatrixCell[i][j] as FieldCell).cellType, "iso-8859-1");
						bytes.writeMultiByte("</cellType>\n", "iso-8859-1");
						bytes.writeMultiByte("<cellObject>", "iso-8859-1");
						bytes.writeMultiByte((Resource.MatrixCell[i][j] as FieldCell).cellObject, "iso-8859-1");
						bytes.writeMultiByte("</cellObject>\n", "iso-8859-1");
						bytes.writeMultiByte("<cellColumn>", "iso-8859-1");
						bytes.writeMultiByte(i.toString(), "iso-8859-1");
						bytes.writeMultiByte("</cellColumn>\n", "iso-8859-1");
						bytes.writeMultiByte("<cellRow>", "iso-8859-1");
						bytes.writeMultiByte(j.toString(), "iso-8859-1");
						bytes.writeMultiByte("</cellRow>\n", "iso-8859-1");
					bytes.writeMultiByte("</cell>\n", "iso-8859-1");
					
				}
			}
			
			fileRef.save(bytes,"savedata.xml");
			
			
		}
		
		
		
		private function changeHandler1(e:Event):void { 
			comboBox1.text = ComboBox(e.target).selectedItem.label;
			/*
			if (ComboBox(e.target).selectedItem.label == "Собрать кристалы")
			{
				comboBox2.enabled = true;
				textBox6.enabled = true;
			}else {
				comboBox2.enabled = false;
				textBox6.enabled = false;
			}
			*/
		}
		
		private function changeHandler2(e:Event):void 
		{
			//Resource.CrystalType = ComboBox(e.target).selectedItem.data;
			comboBox2.text = ComboBox(e.target).selectedItem.label;
		}
		
		
		private function changeHandler19(e:Event):void 
		{
			comboBox19.text = ComboBox(e.target).selectedItem.label;
		}
		
		private function changeHandler18(e:Event):void 
		{
			comboBox18.text = ComboBox(e.target).selectedItem.label;
		}
		
		private function changeHandler17(e:Event):void 
		{
			comboBox17.text = ComboBox(e.target).selectedItem.label;
		}
		
		private function changeHandler16(e:Event):void 
		{
			comboBox16.text = ComboBox(e.target).selectedItem.label;
		}
		
		private function changeHandler15(e:Event):void 
		{
			comboBox15.text = ComboBox(e.target).selectedItem.label;
		}
		
		private function changeHandler14(e:Event):void 
		{
			comboBox14.text = ComboBox(e.target).selectedItem.label;
		}
		
		private function changeHandler13(e:Event):void 
		{
			comboBox13.text = ComboBox(e.target).selectedItem.label;
		}
		
		private function changeHandler12(e:Event):void 
		{
			comboBox12.text = ComboBox(e.target).selectedItem.label;
		}
		
		private function changeHandler11(e:Event):void 
		{
			comboBox11.text = ComboBox(e.target).selectedItem.label;
		}
		
		private function changeHandler10(e:Event):void 
		{
			comboBox10.text = ComboBox(e.target).selectedItem.label;
		}
		
		
		/* Общие события мыши */
		private function onMouseOver(e:MouseEvent):void 
		{
			Mouse.cursor = MouseCursor.BUTTON;
		}
		
		private function onMouseOut(e:MouseEvent):void 
		{
			Mouse.cursor = MouseCursor.AUTO;
		}
		
		/* Отобразить игровое поле */
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