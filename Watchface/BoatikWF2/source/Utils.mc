using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

module Globals {
	hidden var active=true;
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