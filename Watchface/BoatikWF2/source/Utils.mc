using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Time.Gregorian as Gre;
using Toybox.Time;
using Toybox.System as Sys;

module Globals {
	hidden var active=true;
	var date,hourStr,minuteStr,secondStr,dayStr,monthStr,dayOfWeekStr;	
	var notifications, alarms;
	
	function updateCurrentTime() {
        date = Gre.info(Time.now(), Time.FORMAT_MEDIUM); 
        hourStr = date.hour.format("%02d");
		minuteStr = date.min.format("%02d");
		secondStr = date.sec.format("%02d");
		dayStr = date.day.format("%02d");
		monthStr = date.month;
		dayOfWeekStr = date.day_of_week;
		
		notifications = Sys.getDeviceSettings().notificationCount;
		alarms = Sys.getDeviceSettings().alarmCount;
	}
	function setActive(value) { active = value; }
	function getActive() { return active; }
}

class MyGrid extends Ui.Drawable {

	function draw(dc) {
       dc.setColor(Gfx.COLOR_DK_GRAY, Gfx.COLOR_BLACK);        
        for (var i = 0; i <=12; i++) 
        {
        	dc.drawLine(i*20, 0, i*20, dc.getWidth());
        	dc.drawLine(0, i*20, dc.getHeight(), i*20);
        }		
        
        dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_BLACK);
        
		dc.drawLine(dc.getHeight()/2, 0, dc.getHeight()/2, dc.getWidth());
		dc.drawLine(0, dc.getWidth()/2, dc.getHeight(),dc.getWidth()/2);		
	}
}