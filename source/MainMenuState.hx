package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.addons.display.FlxBackdrop;

using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.1.0'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	
	var optionShit:Array<String> = ['story_mode', 'freeplay', 'extras', 'awards', 'options'];

	var char:FlxSprite;
	var backdrop:FlxBackdrop;

	var camFollow:FlxObject;
	var camFollowPos:FlxObject;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement);
		FlxCamera.defaultCameras = [camGame];

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		var theBG:BGSprite = new BGSprite('greenfarm', -680, -130, 0, 0);
		add(theBG);
		

		backdrop = new FlxBackdrop(Paths.image('backd'), 0.2, 0, true, true);
		backdrop.velocity.set(200, 110);
		backdrop.updateHitbox();
		backdrop.alpha = 0.5;
		backdrop.screenCenter(X);
		add(backdrop);

		var bga:FlxSprite = new FlxSprite(-120).loadGraphic(Paths.image('bgthing'));
		bga.setGraphicSize(Std.int(bg.width * 1.175));
		bga.updateHitbox();
		bga.screenCenter();
		bga.antialiasing = ClientPrefs.globalAntialiasing;
		add(bga);

		camFollow = new FlxObject(0, 0, 1, 1);
		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		add(camFollowPos);

		// magenta.scrollFactor.set();

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		for (i in 0...optionShit.length)
		{
			var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(0, (i * 140)  + offset);
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItem.screenCenter(X);
			menuItem.x += 300;
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			if(optionShit.length < 6) scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
			//menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
			menuItem.updateHitbox();
		}


		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Strident Engine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("Comic Sans MS", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("Comic Sans MS", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var watermarkMenuTxt:FlxText = new FlxText(12, FlxG.height - 64, 0, "Strident Crisis V1.5", 12);
		watermarkMenuTxt.scrollFactor.set();
		watermarkMenuTxt.setFormat("Comic Sans MS", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(watermarkMenuTxt);

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (!Achievements.achievementsUnlocked[achievementID][1] && leDate.getDay() == 5 && leDate.getHours() >= 18) { //It's a friday night. WEEEEEEEEEEEEEEEEEE
			Achievements.achievementsUnlocked[achievementID][1] = true;
			giveAchievement();
			ClientPrefs.saveSettings();
		}
		#end

		super.create();

		switch (FlxG.random.int(1, 6))
		{
			case 1:
				char = new FlxSprite(100, 270).loadGraphic(Paths.image('mainmenu/bambiRemake'));//put your cords and image here
				char.frames = Paths.getSparrowAtlas('mainmenu/bambiRemake');//here put the name of the xml
				char.animation.addByPrefix('idleR', 'bambi idle', 24, true);//on 'idle normal' change it to your xml one
				char.animation.play('idleR');//you can rename the anim however you want to
				char.scrollFactor.set();
				char.antialiasing = ClientPrefs.globalAntialiasing;
				add(char);
			case 2:
				char = new FlxSprite(-700, -170).loadGraphic(Paths.image('mainmenu/Bamb'));//put your cords and image here
				char.frames = Paths.getSparrowAtlas('mainmenu/Bamb');//here put the name of the xml
				char.animation.addByPrefix('idleR', 'Bamb Idle', 24, true);//on 'idle normal' change it to your xml one
				char.animation.play('idleR');//you can rename the anim however you want to
				char.scrollFactor.set();
				char.scale.set(0.6, 0.6);
				char.antialiasing = ClientPrefs.globalAntialiasing;
				add(char);
			case 3:
				char = new FlxSprite(-100, 120).loadGraphic(Paths.image('mainmenu/Banbi'));//put your cords and image here
				char.frames = Paths.getSparrowAtlas('mainmenu/Banbi');//here put the name of the xml
				char.animation.addByPrefix('idleR', 'Banbi Idle', 24, true);//on 'idle normal' change it to your xml one
				char.animation.play('idleR');//you can rename the anim however you want to
				char.scrollFactor.set();
				char.scale.set(0.7, 0.7);
				char.antialiasing = ClientPrefs.globalAntialiasing;
				add(char);

				case 4:
					char = new FlxSprite(100, 140).loadGraphic(Paths.image('mainmenu/OppositionX_Assets'));//put your cords and image here
					char.frames = Paths.getSparrowAtlas('mainmenu/OppositionX_Assets');//here put the name of the xml
					char.animation.addByPrefix('idleR', 'Idle', 24, true);//on 'idle normal' change it to your xml one
					char.animation.play('idleR');//you can rename the anim however you want to
					char.scrollFactor.set();
					char.scale.set(1.5, 1.5);
					char.antialiasing = ClientPrefs.globalAntialiasing;
					add(char);

					case 5:
						char = new FlxSprite(50, -80).loadGraphic(Paths.image('mainmenu/Cheater'));//put your cords and image here
						char.frames = Paths.getSparrowAtlas('mainmenu/Cheater');//here put the name of the xml
						char.animation.addByPrefix('idleR', 'Cheater Idle', 24, true);//on 'idle normal' change it to your xml one
						char.animation.play('idleR');//you can rename the anim however you want to
						char.scrollFactor.set();
						char.scale.set(0.7, 0.7);
						char.antialiasing = ClientPrefs.globalAntialiasing;
						add(char);
					case 6:
						char = new FlxSprite(-300, -170).loadGraphic(Paths.image('mainmenu/diambi'));//put your cords and image here
						char.frames = Paths.getSparrowAtlas('mainmenu/diambi');//here put the name of the xml
						char.animation.addByPrefix('idleR', 'diambi idle', 24, true);//on 'idle normal' change it to your xml one
						char.animation.play('idleR');//you can rename the anim however you want to
						char.scrollFactor.set();
						char.scale.set(0.7, 0.7);
						char.antialiasing = ClientPrefs.globalAntialiasing;
						add(char);
					    

		}
	}

	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	var achievementID:Int = 0;
	function giveAchievement() {
		add(new AchievementObject(achievementID, camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
		trace('Giving achievement ' + achievementID);
	}
	#end

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		FlxG.camera.zoom = FlxMath.lerp(1, FlxG.camera.zoom, CoolUtil.boundTo(1 - (elapsed * 3.125), 0, 1)); // funny camera
		
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 5.6, 0, 1);
		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));

		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));


					menuItems.forEach(function(spr:FlxSprite)
						{
							if (curSelected != spr.ID)
							{
								/*
								FlxTween.tween(spr, {alpha: 0}, 0.4, {
									ease: FlxEase.quadOut,
									onComplete: function(twn:FlxTween)
									{
										spr.kill();
									}
								});
								*/
								FlxTween.tween(char, {x: -700}, 2, {ease: FlxEase.backInOut, type: ONESHOT, onComplete: function(twn:FlxTween) {
									char.kill(); /*I killed the char*/
								}});
								FlxTween.tween(spr, {x: 1200}, 2, {ease: FlxEase.backInOut, type: ONESHOT, onComplete: function(twn:FlxTween) {
									spr.kill(); /*Mom I killed the sprs again*/
								}});
								FlxTween.tween(spr, {alpha: 0}, 1.3, {ease: FlxEase.backInOut, type: ONESHOT, onComplete: function(twn:FlxTween){
									spr.kill(); /*Mom I killed the sprs again*/
								}});
							}
							else
							{
								/*
								FlxTween.tween(spr, {x: 500}, 1, {ease: FlxEase.backInOut, type: ONESHOT, onComplete: function(tween: FlxTween) {	no more tweenings
									var daChoice:String = optionShit[curSelected];
	
	
									switch (daChoice)
									{
										case 'story_mode':
											MusicBeatState.switchState(new StoryMenuState());
										case 'freeplay':
											MusicBeatState.switchState(new FreeplayState());
										#if MODS_ALLOWED
										case 'mods':
											MusicBeatState.switchState(new ModsMenuState());
										#end			
										case 'awards':
											MusicBeatState.switchState(new AchievementsMenuState());
										case 'credits':
											MusicBeatState.switchState(new CreditsState());
										case 'options':
											LoadingState.loadAndSwitchState(new options.OptionsState());
									}
								}});
								*/
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)

							{
								var daChoice:String = optionShit[curSelected];

								switch (daChoice)
								{
									case 'story_mode':
										MusicBeatState.switchState(new StoryMenuState());
									case 'freeplay':
										MusicBeatState.switchState(new FreeplayState());
									case 'extras':
										MusicBeatState.switchState(new ExtrasMenuState());
									case 'awards':
										MusicBeatState.switchState(new AchievementsMenuState());
									case 'options':
										MusicBeatState.switchState(new OptionsState());
								}
							});
						}
					});
				}
			}
			#if desktop
			else if (FlxG.keys.justPressed.SEVEN)
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
		}

		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			//spr.screenCenter(X);
		});
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.offset.y = 0;
			spr.updateHitbox();

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y);
				spr.offset.x = 0.15 * (spr.frameWidth / 2 + 180);
				spr.offset.y = 0.15 * spr.frameHeight;
				FlxG.log.add(spr.frameWidth);
			}
		});
	}
								
	override function beatHit() {
		super.beatHit();
		
		if (FlxG.camera.zoom < 1.35 && ClientPrefs.camZooms && curBeat % 1 == 0) // the funni camera zoom each beat
			FlxG.camera.zoom += 0.015;
	}
}
