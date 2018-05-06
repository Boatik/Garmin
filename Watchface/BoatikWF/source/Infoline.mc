using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.WatchUi as Ui;


module Infoline 
{
	function drawHeartRate(dc)
	{
		//200
		var hr = Utils.getHeartRate();
		if ( hr>0 )
		{
			dc.setColor(Utils.getSecondColor(), Gfx.COLOR_TRANSPARENT); 
	        dc.drawText(
	        	Utils.getCoordSecX(), Utils.getCenterY()-43, 
	        	Utils.getSecFont(), 
	        	hr.toString(), 
	        	Gfx.TEXT_JUSTIFY_LEFT);		
		}
	}
	function drawNotifications(dc)
	{
		if (Sys.getDeviceSettings().notificationCount > 0) 
		{
		
		 	//var bitmap = Ui.loadResource(Rez.Drawables.alarms);
			//dc.drawBitmap(Utils.getCenterIX(), 160, bitmap);
			dc.drawText(Utils.getCenterIX(), 160, 
				Utils.getInfFont(), 
				"n:" + Sys.getDeviceSettings().notificationCount.toString(), 
				Gfx.TEXT_JUSTIFY_CENTER);	
		}
	
	}
	
	function drawAlarm(dc)
	{
		if (Sys.getDeviceSettings().alarmCount > 0) 
		{
		
		 	//var bitmap = Ui.loadResource(Rez.Drawables.alarms);
			//dc.drawBitmap(x, y, bitmap);
			dc.drawText(Utils.getCenterIX(), 140, 
				Utils.getInfFont(), 
				"a:" + Sys.getDeviceSettings().alarmCount.toString(), 
				Gfx.TEXT_JUSTIFY_CENTER);	
		}
	
	}
	
	function drawBattery(dc) 
	{
		//dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_TRANSPARENT);
		var battery = Sys.getSystemStats().battery;
		dc.drawText(Utils.getCenterIX(), 100, 
			Utils.getInfFont(), 
			Sys.getSystemStats().battery.format("%d") + "%", 
			Gfx.TEXT_JUSTIFY_CENTER);
	}
	
	
	function drawText(dc)
	{
		dc.setColor(Utils.getAccentColor(), Gfx.COLOR_TRANSPARENT);
		dc.drawText(-25, -200, 
			Utils.getIFont(), 
			"I", 
			Gfx.TEXT_JUSTIFY_LEFT);
			
		dc.setColor(Utils.getInfColor(), Gfx.COLOR_TRANSPARENT);
		
		drawBattery(dc);
		drawAlarm(dc);
		drawNotifications(dc);
		drawHeartRate(dc);
		
	}
	

	
}