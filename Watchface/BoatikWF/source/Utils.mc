using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.ActivityMonitor as Act;

module Utils
{
	hidden var hoursFont = null;
	hidden var minFont = null;
	hidden var secFont = null;
	hidden var iFont = null;	
	hidden var active = true;
	hidden var cx;
	hidden var cy;
	hidden var cix=55;
	hidden var csx=180;
	
	function getAccentColor()
	{
		return Gfx.COLOR_ORANGE;
	}
	function getSecondColor()
	{
		return Gfx.COLOR_WHITE;
	}
	function getInfColor()
	{
		return Gfx.COLOR_BLACK;
	}
	function getStrSize(dc, str, font)
	{
		return dc.getTextDimensions(str, font);
	}
	function getInfFont() 
	{
		return Gfx.FONT_XTINY;
	}
		
	function getMinFont() 
	{
		if (minFont == null) 
		{
			minFont = Ui.loadResource(Rez.Fonts.Opt1_font);
		}

    	return minFont; 
    }
	function getSecFont() 
	{
		if (secFont == null) 
		{
			secFont = Ui.loadResource(Rez.Fonts.Opt2_font);
		}

    	return secFont; 
    }    
	function getIFont() 
	{
		if (iFont == null) 
		{
			iFont = Ui.loadResource(Rez.Fonts.Opt3_font);
		}

    	return iFont; 
    }
	function getActive()
	{
		return active;
	}
	function setActive(value)
	{
		if (value instanceof Toybox.Lang.Boolean)
		{
			active = value;
		}
		else
		{
			//System.println("wrong type");
		}
				
	}
	
	function setCenter(x,y)
	{
		if (x instanceof Toybox.Lang.Number &&
			y instanceof Toybox.Lang.Number)
		{
			cx = x;
			cy = y;
		}
		else
		{
			//System.println("wrong type");
		}
		
	}
	function getCoordSecX()
	{
		return csx;
	}	
		
	function getCenterIX()
	{
		return cix;
	}	
	function getCenterX()
	{
		return cx;
	}
	function getCenterY()
	{
		return cy;
	}
	
	function getHourFont() 
	{
		if (hoursFont == null) 
		{
			hoursFont = Ui.loadResource(Rez.Fonts.Opt1_font);
		}

    	return hoursFont; 
    }

	function getHeartRate()
	{
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
