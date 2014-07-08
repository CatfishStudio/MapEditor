package MapEditor 
{
	import fl.controls.Button;
	import fl.controls.TextInput;
	import fl.controls.ComboBox;
	import fl.controls.Label
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import fl.data.DataProvider; 
	import fl.events.ComponentEvent;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL; 
	import flash.net.Responder;
	import flash.net.URLRequest;
	import MapEditor.Resource;
	
	public class PanelObjects extends Sprite 
	{
		
		private var label11:Label = new Label();
		private var cursor:Bitmap = new Resource.CursorImage();
		private var sCursor:Sprite = new Sprite();
		
		private var crystal1:Bitmap = new Resource.CImage1();
		private var sCrystal1:Sprite = new Sprite();
		private var crystalLH1:Bitmap = new Resource.CLHImage1();
		private var sCrystalLH1:Sprite = new Sprite();
		private var crystalLU1:Bitmap = new Resource.CLUImage1();
		private var sCrystalLU1:Sprite = new Sprite();
		private var crystalS1:Bitmap = new Resource.CSImage1();
		private var sCrystalS1:Sprite = new Sprite();
		
		private var crystal2:Bitmap = new Resource.CImage2();
		private var sCrystal2:Sprite = new Sprite();
		private var crystalLH2:Bitmap = new Resource.CLHImage2();
		private var sCrystalLH2:Sprite = new Sprite();
		private var crystalLU2:Bitmap = new Resource.CLUImage2();
		private var sCrystalLU2:Sprite = new Sprite();
		private var crystalS2:Bitmap = new Resource.CSImage2();
		private var sCrystalS2:Sprite = new Sprite();
		
		private var crystal3:Bitmap = new Resource.CImage3();
		private var sCrystal3:Sprite = new Sprite();
		private var crystalLH3:Bitmap = new Resource.CLHImage3();
		private var sCrystalLH3:Sprite = new Sprite();
		private var crystalLU3:Bitmap = new Resource.CLUImage3();
		private var sCrystalLU3:Sprite = new Sprite();
		private var crystalS3:Bitmap = new Resource.CSImage3();
		private var sCrystalS3:Sprite = new Sprite();
		
		private var crystal4:Bitmap = new Resource.CImage4();
		private var sCrystal4:Sprite = new Sprite();
		private var crystalLH4:Bitmap = new Resource.CLHImage4();
		private var sCrystalLH4:Sprite = new Sprite();
		private var crystalLU4:Bitmap = new Resource.CLUImage4();
		private var sCrystalLU4:Sprite = new Sprite();
		private var crystalS4:Bitmap = new Resource.CSImage4();
		private var sCrystalS4:Sprite = new Sprite();
		
		private var crystal5:Bitmap = new Resource.CImage5();
		private var sCrystal5:Sprite = new Sprite();
		private var crystalLH5:Bitmap = new Resource.CLHImage5();
		private var sCrystalLH5:Sprite = new Sprite();
		private var crystalLU5:Bitmap = new Resource.CLUImage5();
		private var sCrystalLU5:Sprite = new Sprite();
		private var crystalS5:Bitmap = new Resource.CSImage5();
		private var sCrystalS5:Sprite = new Sprite();
		
		private var cell:Bitmap = new Resource.CellClearImage();
		private var sCell:Sprite = new Sprite();
		private var empty:Bitmap = new Resource.EmptyImage();
		private var sEmpty:Sprite = new Sprite();
		private var drop:Bitmap = new Resource.DropImage();
		private var sDrop:Sprite = new Sprite();
		private var rune:Bitmap = new Resource.RuneImage();
		private var sRune:Sprite = new Sprite();
		private var stone:Bitmap = new Resource.StoneImage();
		private var sStone:Sprite = new Sprite();
		
		public function PanelObjects() 
		{
			/* ОБЪЕКТЫ: -------------------------------------------------------*/
			/* Метка */
			label11.text = "Объекты:";
			label11.x = 950; label11.y = 00;
			this.addChild(label11);
			/* Кристалы */
			sCursor.addChild(cursor);
			sCursor.x = 950; sCursor.y = 25;
			sCursor.addEventListener(MouseEvent.CLICK, onMouseClickCursor);
			sCursor.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCursor.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			this.addChild(sCursor);
			
			sCrystal1.addChild(crystal1);
			sCrystalLH1.addChild(crystalLH1);
			sCrystalLU1.addChild(crystalLU1);
			sCrystalS1.addChild(crystalS1);
			sCrystal1.x = 800; sCrystal1.y = 100;
			sCrystalLH1.x = 850; sCrystalLH1.y = 100;
			sCrystalLU1.x = 900; sCrystalLU1.y = 100;
			sCrystalS1.x = 950; sCrystalS1.y = 100;
			sCrystal1.addEventListener(MouseEvent.CLICK, onMouseClickCrystal1);
			sCrystal1.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystal1.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			sCrystalLH1.addEventListener(MouseEvent.CLICK, onMouseClickCrystalLH1);
			sCrystalLH1.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystalLH1.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			sCrystalLU1.addEventListener(MouseEvent.CLICK, onMouseClickCrystalLU1);
			sCrystalLU1.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystalLU1.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			sCrystalS1.addEventListener(MouseEvent.CLICK, onMouseClickCrystalS1);
			sCrystalS1.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystalS1.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			this.addChild(sCrystal1);
			this.addChild(sCrystalLH1);
			this.addChild(sCrystalLU1);
			this.addChild(sCrystalS1);
			
			sCrystal2.addChild(crystal2);
			sCrystalLH2.addChild(crystalLH2);
			sCrystalLU2.addChild(crystalLU2);
			sCrystalS2.addChild(crystalS2);
			sCrystal2.x = 800; sCrystal2.y = 150;
			sCrystalLH2.x = 850; sCrystalLH2.y = 150;
			sCrystalLU2.x = 900; sCrystalLU2.y = 150;
			sCrystalS2.x = 950; sCrystalS2.y = 150;
			sCrystal2.addEventListener(MouseEvent.CLICK, onMouseClickCrystal2);
			sCrystal2.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystal2.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			sCrystalLH2.addEventListener(MouseEvent.CLICK, onMouseClickCrystalLH2);
			sCrystalLH2.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystalLH2.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			sCrystalLU2.addEventListener(MouseEvent.CLICK, onMouseClickCrystalLU2);
			sCrystalLU2.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystalLU2.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			sCrystalS2.addEventListener(MouseEvent.CLICK, onMouseClickCrystalS2);
			sCrystalS2.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystalS2.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			this.addChild(sCrystal2);
			this.addChild(sCrystalLH2);
			this.addChild(sCrystalLU2);
			this.addChild(sCrystalS2);
			
			sCrystal3.addChild(crystal3);
			sCrystalLH3.addChild(crystalLH3);
			sCrystalLU3.addChild(crystalLU3);
			sCrystalS3.addChild(crystalS3);
			sCrystal3.x = 800; sCrystal3.y = 200;
			sCrystalLH3.x = 850; sCrystalLH3.y = 200;
			sCrystalLU3.x = 900; sCrystalLU3.y = 200;
			sCrystalS3.x = 950; sCrystalS3.y = 200;
			sCrystal3.addEventListener(MouseEvent.CLICK, onMouseClickCrystal3);
			sCrystal3.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystal3.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			sCrystalLH3.addEventListener(MouseEvent.CLICK, onMouseClickCrystalLH3);
			sCrystalLH3.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystalLH3.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			sCrystalLU3.addEventListener(MouseEvent.CLICK, onMouseClickCrystalLU3);
			sCrystalLU3.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystalLU3.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			sCrystalS3.addEventListener(MouseEvent.CLICK, onMouseClickCrystalS3);
			sCrystalS3.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystalS3.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			this.addChild(sCrystal3);
			this.addChild(sCrystalLH3);
			this.addChild(sCrystalLU3);
			this.addChild(sCrystalS3);
			
			sCrystal4.addChild(crystal4);
			sCrystalLH4.addChild(crystalLH4);
			sCrystalLU4.addChild(crystalLU4);
			sCrystalS4.addChild(crystalS4);
			sCrystal4.x = 800; sCrystal4.y = 250;
			sCrystalLH4.x = 850; sCrystalLH4.y = 250;
			sCrystalLU4.x = 900; sCrystalLU4.y = 250;
			sCrystalS4.x = 950; sCrystalS4.y = 250;
			sCrystal4.addEventListener(MouseEvent.CLICK, onMouseClickCrystal4);
			sCrystal4.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystal4.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			sCrystalLH4.addEventListener(MouseEvent.CLICK, onMouseClickCrystalLH4);
			sCrystalLH4.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystalLH4.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			sCrystalLU4.addEventListener(MouseEvent.CLICK, onMouseClickCrystalLU4);
			sCrystalLU4.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystalLU4.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			sCrystalS4.addEventListener(MouseEvent.CLICK, onMouseClickCrystalS4);
			sCrystalS4.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystalS4.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			this.addChild(sCrystal4);
			this.addChild(sCrystalLH4);
			this.addChild(sCrystalLU4);
			this.addChild(sCrystalS4);
			
			sCrystal5.addChild(crystal5);
			sCrystalLH5.addChild(crystalLH5);
			sCrystalLU5.addChild(crystalLU5);
			sCrystalS5.addChild(crystalS5);
			sCrystal5.x = 800; sCrystal5.y = 300;
			sCrystalLH5.x = 850; sCrystalLH5.y = 300;
			sCrystalLU5.x = 900; sCrystalLU5.y = 300;
			sCrystalS5.x = 950; sCrystalS5.y = 300;
			sCrystal5.addEventListener(MouseEvent.CLICK, onMouseClickCrystal5);
			sCrystal5.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystal5.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			sCrystalLH5.addEventListener(MouseEvent.CLICK, onMouseClickCrystalLH5);
			sCrystalLH5.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystalLH5.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			sCrystalLU5.addEventListener(MouseEvent.CLICK, onMouseClickCrystalLU5);
			sCrystalLU5.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystalLU5.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			sCrystalS5.addEventListener(MouseEvent.CLICK, onMouseClickCrystalS5);
			sCrystalS5.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			sCrystalS5.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			this.addChild(sCrystal5);
			this.addChild(sCrystalLH5);
			this.addChild(sCrystalLU5);
			this.addChild(sCrystalS5);
			
			/* Ячейки и объекты */
			sCell.addChild(cell);
			sCell.x = 950; sCell.y = 400;
			this.addChild(sCell);
			
			sEmpty.addChild(empty);
			sEmpty.x = 950; sEmpty.y = 460;
			this.addChild(sEmpty);
			
			sDrop.addChild(drop);
			sDrop.x = 950; sDrop.y = 520;
			this.addChild(sDrop);
			
			sRune.addChild(rune);
			sRune.x = 950; sRune.y = 580;
			this.addChild(sRune);
			
			sStone.addChild(stone);
			sStone.x = 950; sStone.y = 640;
			this.addChild(sStone);
			/*---------------------------------------------------------------------------------*/
		}
		
		/* Желтый */
		private function onMouseClickCrystalS5(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_5_YELLOW_SUPER";
		}
		
		private function onMouseClickCrystalLU5(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_5_YELLOW_LINE_UPRIGHT";
		}
		
		private function onMouseClickCrystalLH5(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_5_YELLOW_LINE_HORIZONTALLY";
		}
		
		private function onMouseClickCrystal5(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_5_YELLOW";
		}
		
		/* Синий */
		private function onMouseClickCrystalS4(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_4_BLUE_SUPER";
		}
		
		private function onMouseClickCrystalLU4(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_4_BLUE_LINE_UPRIGHT";
		}
		
		private function onMouseClickCrystalLH4(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_4_BLUE_LINE_HORIZONTALLY";
		}
		
		private function onMouseClickCrystal4(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_4_BLUE";
		}
		
		/* Красный */
		private function onMouseClickCrystalS3(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_3_RED_SUPER";
		}
		
		private function onMouseClickCrystalLU3(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_3_RED_LINE_UPRIGHT";
		}
		
		private function onMouseClickCrystalLH3(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_3_RED_LINE_HORIZONTALLY";
		}
		
		private function onMouseClickCrystal3(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_3_RED";
		}
		
		/* Зелёный */
		private function onMouseClickCrystalS2(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_2_GREEN_SUPER";
		}
		
		private function onMouseClickCrystalLU2(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_2_GREEN_LINE_UPRIGHT";
		}
		
		private function onMouseClickCrystalLH2(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_2_GREEN_LINE_HORIZONTALLY";
		}
		
		private function onMouseClickCrystal2(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_2_GREEN";
		}
		
		/* Фиолетовый */
		private function onMouseClickCrystalS1(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_1_VIOLET_SUPER";
		}
		
		private function onMouseClickCrystalLU1(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_1_VIOLET_LINE_UPRIGHT";
		}
		
		private function onMouseClickCrystalLH1(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_1_VIOLET_LINE_HORIZONTALLY";
		}
		
		private function onMouseClickCrystal1(e:MouseEvent):void 
		{
			Resource.SelectObject = "CRYSTAL_TYPE_1_VIOLET";
		}
				
		private function onMouseClickCursor(e:MouseEvent):void 
		{
			Resource.SelectObject = "SELECT_NO_OBJECT";
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
	}

}