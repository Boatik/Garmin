using Toybox.Graphics as Gfx;
using Toybox.Time.Gregorian as Gre;
using Toybox.Time;


module Datetime 
{

	function drawText(dc)
	{
        
        var fontSize = Utils.getStrSize(dc, "0", Utils.getHourFont());
        var dx = -1 * (fontSize[0]/2+5);   
		var dy = fontSize[1]-20;
		
		var moment = Time.now();
        var date = Gre.info(moment, Time.FORMAT_MEDIUM); 
        var hourStr = date.hour.format("%02d");
		var minuteStr = date.min.format("%02d");
		var secondStr = date.sec.format("%02d");
		var dayStr = date.day.format("%02d");
		var monthStr = date.month;
		var dayOfWeekStr = date.day_of_week;
       
       	//hours, miutes
        dc.setColor(Utils.getSecondColor(), Gfx.COLOR_TRANSPARENT);      
        dc.drawText(Utils.getCenterX()+dx, Utils.getCenterY()-dy, Utils.getHourFont(), hourStr, Gfx.TEXT_JUSTIFY_LEFT);
        dc.setColor(Utils.getAccentColor(), Gfx.COLOR_TRANSPARENT);
        dc.drawText(Utils.getCenterX()+dx, Utils.getCenterY()-16, Utils.getMinFont(), minuteStr, Gfx.TEXT_JUSTIFY_LEFT);
        
        //seconds
        if (Utils.getActive())
        {     
        	dc.drawText(Utils.getCoordSecX(), Utils.getCenterY()-3, Utils.getSecFont(), secondStr, Gfx.TEXT_JUSTIFY_LEFT);
        }
        
		//date
		dc.setColor(Utils.getInfColor(), Gfx.COLOR_TRANSPARENT);
        dc.drawText(Utils.getCenterIX(), 40, Utils.getInfFont(), dayOfWeekStr, Gfx.TEXT_JUSTIFY_CENTER);
		
        dc.drawText(Utils.getCenterIX(), 60, Utils.getInfFont(), dayStr + monthStr, Gfx.TEXT_JUSTIFY_CENTER);
		
	}


}