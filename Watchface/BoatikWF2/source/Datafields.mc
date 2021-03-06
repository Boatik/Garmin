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
class Field6 extends Ui.Drawable  { //Notifications
	var dataField;
	function initialize(params){ dataField = new Notifications (params); }
	function draw(dc) {	dataField.draw(dc); }
}
class Field7 extends Ui.Drawable  { //alarms
	var dataField;
	function initialize(params){ dataField = new Alarms (params); }
	function draw(dc) {	dataField.draw(dc); }
}
class Field8 extends Ui.Drawable  { //alarms
	var dataField;
	function initialize(params){ dataField = new PhoneConnected (params); }
	function draw(dc) {	dataField.draw(dc); }
}

class PhoneConnected extends Ui.Drawable {
	hidden var x, y, color, font, icon;
	
	function initialize(params) {
		x = params.get(:x)-12;
		y = params.get(:y)-5;
		color =  Application.getApp().getProperty("BackgroundColor");
		font =  Ui.loadResource(Rez.Fonts.Icons);
		icon="2";	
	}
	function draw(dc) {
		if (Globals.phoneConnected) {
			dc.setColor(color, Gfx.COLOR_TRANSPARENT);
			dc.drawText(x, y, font, 
				icon, 
				Gfx.TEXT_JUSTIFY_LEFT);
		}
	}
}



class Alarms extends Ui.Drawable {
	hidden var x, y, color, font;
	hidden var iconX, iconY, iconsFont, icon;
	
	function initialize(params) {
		x = params.get(:x);
		y = params.get(:y);
		//initialize icon coordinates to avoid unnecessary calculations during updates
		iconX = x-15;
		iconY = y-7;
		color =  Application.getApp().getProperty("BackgroundColor");
		font = Gfx.FONT_XTINY;
		iconsFont = Ui.loadResource(Rez.Fonts.Icons);
		icon="1";	
	}
	function draw(dc) {
		if (Globals.alarms > 0) {
			dc.setColor(color, Gfx.COLOR_TRANSPARENT);
			var textDimensions = dc.getTextDimensions(Globals.alarms.toString(), font);
			drawIcon(dc,textDimensions);
			dc.drawText(x-textDimensions[0], y, font, 
				Globals.alarms, 
				Gfx.TEXT_JUSTIFY_LEFT);
		}
	}
	function drawIcon(dc, textDimensions) {
		dc.drawText(iconX-textDimensions[0], iconY, iconsFont, 
				icon,
				Gfx.TEXT_JUSTIFY_LEFT);		
	}
	
}

class Notifications extends Ui.Drawable {
	hidden var x, y, color, font;
	hidden var iconX, iconY, iconsFont, icon;
	
	function initialize(params) {
		x = params.get(:x);
		y = params.get(:y);
		//initialize icon coordinates to avoid unnecessary calculations during updates
		iconX = x-18;
		iconY = y-7;
		color =  Application.getApp().getProperty("BackgroundColor");
		font = Gfx.FONT_XTINY;
		iconsFont = Ui.loadResource(Rez.Fonts.Icons);
		icon="0";	
	}
	function draw(dc) {
		if (Globals.notifications > 0) {
			dc.setColor(color, Gfx.COLOR_TRANSPARENT);
			var textDimensions = dc.getTextDimensions(Globals.notifications.toString(), font);
			drawIcon(dc,textDimensions);
			dc.drawText(x-textDimensions[0], y, font, 
				Globals.notifications, 
				Gfx.TEXT_JUSTIFY_LEFT);
		}
	}
	function drawIcon(dc, textDimensions) {
		dc.drawText(iconX-textDimensions[0], iconY, iconsFont, 
				icon,
				Gfx.TEXT_JUSTIFY_LEFT);		
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
