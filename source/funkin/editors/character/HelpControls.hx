package funkin.editors.character;

class HelpControls extends UISubstateWindow
{
	public function new()
	{
		super();
	}

	public override function create()
	{
		winTitle = 'Help: Controls';
		winWidth = 960;

		super.create();

		var helpText = new UIText(windowSpr.x + 25, windowSpr.y + 240, -1, "Left/Right/Up/Down Arrow: To change the offset of the current\nplaying animation.\n
Left mouse button on the character: Change character's position.\nK to change to prev anim, L to change to new anim
Space to play animation

I to zoom in
O to zoom out", 24);
		add(helpText);

		var closeButton = new UIButton(helpText.x, helpText.y + 160, "Close", function()
		{
			close();
		});
		add(closeButton);
	}
}