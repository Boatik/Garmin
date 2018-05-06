using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Application as App;
using Toybox.Sensor;
using Toybox.SensorHistory;



class BoatikWFView extends Ui.WatchFace {

	var coords = {};
	var fonts = {};
	
	
	function onEnterSleep() 
	{
		Utils.setActive(false);
		Ui.requestUpdate();
	}
	function onExitSleep() 
	{
		Utils.setActive(true);
		Ui.requestUpdate();
	}	
    function initialize() {
        WatchFace.initialize();
    }


    // Load your resources here
    function onLayout(dc) {
    	Utils.setCenter(dc.getWidth() / 2, dc.getHeight() / 2);
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Get the current time and format it correctly
        //var clockTime = Sys.getClockTime(); 
        
               
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();
        
        Infoline.drawText(dc);       
        Datetime.drawText(dc);

		//drawGrid(dc);
		
        // Call the parent onUpdate function to redraw the layout
        //View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
    
	(:debugOnly) function drawGrid(dc)
	{
        dc.setColor(Gfx.COLOR_DK_GRAY, Gfx.COLOR_BLACK);        
        for (var i = 0; i <=12; i++) 
        {
        	dc.drawLine(i*20, 0, i*20, dc.getWidth());
        	dc.drawLine(0, i*20, dc.getHeight(), i*20);
        }		
        
        dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_BLACK);
        
		dc.drawLine(Utils.getCenterX(), 0, Utils.getCenterX(), dc.getWidth());
		dc.drawLine(0, Utils.getCenterY(), dc.getHeight(),Utils.getCenterY());	
	}
}
