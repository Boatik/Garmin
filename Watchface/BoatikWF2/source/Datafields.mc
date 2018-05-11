using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Time;
using Toybox.Graphics as Gfx;
using Toybox.ActivityMonitor as Act;

class Field1 extends Ui.Drawable  { //HR
	var dataField;
	function initialize(params){ dataField = new HeartRate(params);	}
	function draw(dc) {	dataField.draw(dc); }
}

class Field2 extends Ui.Drawable  { //Seconds
	var dataField;
	function initialize(params){ dataField = new Seconds(params); }
	function draw(dc) {	dataField.draw(dc); }
}

class Field3 extends Ui.Drawable  { //day of week
	var dataField;
	function initialize(params){ dataField = new DayOfWeek(params); }
	function draw(dc) {	dataField.draw(dc); }
}
class Field4 extends Ui.Drawable  { //date
	var dataField;
	function initialize(params){ dataField = new Date (params); }
	function draw(dc) {	dataField.draw(dc); }
}

class Field5 extends Ui.Drawable  { //battery
	var dataField;
	function initialize(params){ dataField = new Battery (params); }
	function draw(dc) {	dataField.draw(dc); }
}
class Field6 extends Ui.Drawable  { //battery
	var dataField;
	function initialize(params){ dataField = new Notifications (params); }
	function draw(dc) {	dataField.draw(dc); }
}

class Notifications extends Ui.Drawable {
	hidden var x, y, color, font;
	
	function initialize(params){
		x = params.get(:x);
		y = params.get(:y);
		
		color =  Application.getApp().getProperty("BackgroundColor");
		font = Gfx.FONT_XTINY;		
	}
	function draw(dc) {
		if (Globals.notifications > 0) {
			dc.setColor(color, Gfx.COLOR_TRANSPARENT);
			dc.drawText(x, y, font, 
				"n:"+Globals.notifications, 
				Gfx.TEXT_JUSTIFY_RIGHT);
		}
	}
}

class Battery extends Ui.Drawable {
	hidden var x, y, color, font;
	
	function initialize(params){
		x = params.get(:x);
		y = params.get(:y);
		
		color =  Application.getApp().getProperty("BackgroundColor");
		font = Gfx.FONT_XTINY;		
	}
	function draw(dc) {
		dc.setColor(color, Gfx.COLOR_TRANSPARENT);
		dc.drawText(x, y, font, 
			Sys.getSystemStats().battery.format("%d") + "%", 
			Gfx.TEXT_JUSTIFY_RIGHT);
	}
}

class Date extends Ui.Drawable {
	hidden var x, y, color, font;
	
	function initialize(params){
		x = params.get(:x);
		y = params.get(:y);
		
		color =  Application.getApp().getProperty("BackgroundColor");
		font = Gfx.FONT_XTINY;		
	}
	function draw(dc) {
		dc.setColor(color, Gfx.COLOR_TRANSPARENT);
		dc.drawText(x, y, font, 
			Globals.dayStr + " " + Globals.monthStr, 
			Gfx.TEXT_JUSTIFY_RIGHT);
	}
}

class DayOfWeek extends Ui.Drawable {
	hidden var x, y, color, font;
	
	function initialize(params){
		x = params.get(:x);
		y = params.get(:y);
		
		color =  Application.getApp().getProperty("BackgroundColor");
		font = Gfx.FONT_XTINY;		
	}
	function draw(dc) {
		dc.setColor(color, Gfx.COLOR_TRANSPARENT);
		dc.drawText(x, y, font, 
			Globals.dayOfWeekStr, 
			Gfx.TEXT_JUSTIFY_RIGHT);
	}
}



class HeartRate extends Ui.Drawable {
	hidden var x, y, color, font;

	function initialize(params){
		x = params.get(:x);
		y = params.get(:y);		
		color =  Application.getApp().getProperty("ForegroundColor");
		font = Ui.loadResource(Rez.Fonts.SecondFont);		
	}
	function draw(dc) {
		dc.setColor(color, Gfx.COLOR_TRANSPARENT);
		dc.drawText(x, y, font, 
			getHeartRate().toString(), 
			Gfx.TEXT_JUSTIFY_LEFT);		
	}
	
	function getHeartRate() {
		if (Act has :HeartRateIterator)
		{
			var hrHist = Act.getHeartRateHistory(null, true);
	        if(hrHist != null)
	        {
	            var hr = hrHist.next();
	            if (hr.heartRate != Act.INVALID_HR_SAMPLE && hr.heartRate > 0)
	            {
	            	return hr.heartRate;
	            }
			}
		}	
		return 0;
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
				Globals.secondStr, 
				Gfx.TEXT_JUSTIFY_LEFT);
		}		
	}
}
