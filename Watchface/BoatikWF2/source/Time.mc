using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
	
using Toybox.Time.Gregorian as Gre;
using Toybox.Time;


class Time extends Ui.Drawable {

	hidden var hourX, hourY, hourColor, hourFont;
	hidden var minuteX, minuteY, minuteColor, minuteFont;
	
		
	hidden var hourStr,minuteStr,secondStr,dayStr, monthStr, dayOfWeekStr;
	
	function initialize(params){
		Drawable.initialize(params);

		hourX = params.get(:hourX);
		hourY = params.get(:hourY);
		hourColor =  Application.Properties.getValue("ForegroundColor");
		hourFont = Ui.loadResource(Rez.Fonts.TimeFont);
		
		minuteX = params.get(:minuteX);
		minuteY = params.get(:minuteY);		
		minuteColor =  Application.Properties.getValue("AccentColor");
		minuteFont = Ui.loadResource(Rez.Fonts.TimeFont);
			
	}
	
	
	function draw(dc) {
		updateTime();
		//hour
		dc.setColor(hourColor, Gfx.COLOR_TRANSPARENT);
		dc.drawText(hourX, hourY, hourFont, hourStr, Gfx.TEXT_JUSTIFY_LEFT);
		//minute
		dc.setColor(minuteColor, Gfx.COLOR_TRANSPARENT);
		dc.drawText(minuteX, minuteY, minuteFont, minuteStr, Gfx.TEXT_JUSTIFY_LEFT);

	}

	function updateTime() {
		var moment = Time.now();
        var date = Gre.info(moment, Time.FORMAT_MEDIUM); 
        hourStr = date.hour.format("%02d");
		minuteStr = date.min.format("%02d");
		secondStr = date.sec.format("%02d");
		dayStr = date.day.format("%02d");
		monthStr = date.month;
		dayOfWeekStr = date.day_of_week;	
	}
}