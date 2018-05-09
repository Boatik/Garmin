using Toybox.WatchUi as Ui;

class InfoBlock extends Ui.Drawable {
	hidden var x,y,width, height, bgColor;
	
	function initialize(params){
		Drawable.initialize(params);
		x = params.get(:x);
		y = params.get(:y);
		width = params.get(:width);
		height = params.get(:height);
		bgColor =  Application.Properties.getValue("AccentColor");
	}
		
    function draw(dc) {
        // Draw the move bar here        
        //dc.fillRectangle(iCoords[0],iCoords[1],iCoords[2],iCoords[3]);//0,0,90,240
        dc.setColor(bgColor, bgColor);
        dc.fillRectangle(x,y,width, height);
        
    }
}
