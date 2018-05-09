using Toybox.WatchUi as Ui;
using Toybox.Time.Gregorian as Gre;
using Toybox.Time;
using Toybox.Graphics as Gfx;

class Field1 extends Ui.Drawable  {
	var dataField;
	function initialize(params){ dataField = new HeartRate(params);	}
	function draw(dc) {	dataField.draw(dc); }
}

class Field2 extends Ui.Drawable  {
	var dataField;
	function initialize(params){ dataField = new Seconds(params); }
	function draw(dc) {	dataField.draw(dc); }
}

class HeartRate extends Ui.Drawable {
	hidden var x, y, color, font;
	
	function initialize(params){
		x = params.get(:x);
		y = params.get(:y);		
		color =  Application.getApp().getProperty(params.get(:color1));
		font = Ui.loadResource(Rez.Fonts.SecondFont);		
	}
	function draw(dc) {
		if (Globals.getActive()) {
			dc.setColor(color, Gfx.COLOR_TRANSPARENT);
			dc.drawText(x, y, font, 
				Gre.info(Time.now(), Time.FORMAT_SHORT).sec.format("%02d"), 
				Gfx.TEXT_JUSTIFY_LEFT);
		}		
	}
}

class Seconds extends Ui.Drawable {
	hidden var x, y, color, font;
	
	function initialize(params){
		x = params.get(:x);
		y = params.get(:y);
		
		color =  Application.getApp().getProperty("AccentColor");
		font = Ui.loadResource(Rez.Fonts.SecondFont);		
	}
	function draw(dc) {
		if (Globals.getActive()) {
			dc.setColor(color, Gfx.COLOR_TRANSPARENT);
			dc.drawText(x, y, font, 
				Gre.info(Time.now(), Time.FORMAT_SHORT).sec.format("%02d"), 
				Gfx.TEXT_JUSTIFY_LEFT);
		}		
	}
}
