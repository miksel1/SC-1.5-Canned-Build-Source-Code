package;

import flixel.ui.FlxBar;
import flixel.tweens.FlxEase;
import flixel.effects.FlxFlicker;
import openfl.display.Sprite;
#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.effects.FlxFlicker;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import lime.utils.Assets;
import flixel.system.FlxSound;
import openfl.utils.Assets as OpenFlAssets;
import WeekData;
#if desktop
import Discord.DiscordClient;
import sys.thread.Thread;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
//import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.math.FlxMath;
import lime.app.Application;
import openfl.Assets;
import Section.SwagSection;
import Song.SwagSong;

using StringTools;

class OstPlayerState extends MusicBeatState
{
	var songs:Array<OSTSongMetadata> = [];

	var selector:FlxText;
    var beatShit:Bool = false;
	public var sprTracker:FlxSprite;
	private static var curSelected:Int = 0;
	private static var curDifficulty:Int = 1;
	private static var curWeek:Int = 0;


	var lockedImage:FlxSprite;

	var gotIn:Bool = false;
    var trueBypass = true;
	var onlyOnce:Bool = false;

	var playingRN:Bool = false;

	var pausedSong:Bool = false;

	var instCheckbox:CheckboxThingie;
	var vocalsCheckbox:CheckboxThingie;
	var playTheSongWith:Alphabet;

	
//'Blocked', 'Sweetcorn', 'Revise', 'Cob', 'Idiot', 'Apathetic', 'Screwed', 'Overthink', 'Nomophobia', 'Dismember', 'Kalampokiphobia', 'Reality-Breaking', 'Opposition', 'Cheating', 'Shit', 'Unfairness', 'Phonophobia', 'Hellbreaker'
	var main:Array<String> = [];
	var extra:Array<String> = [];
	var joke:Array<String> = [];
	var hidden:Array<String> = [];

	
	private var grpSongs:FlxTypedGroup<Alphabet>;
	private var curPlaying:Bool = false;

	private var iconArray:Array<HealthIcon> = [];

	var bg:FlxSprite;
	var intendedColor:Int;
	var colorTween:FlxTween;
	
	var timeTxt:FlxText;
	private var timeBarBG:AttachedSprite;
	public var timeBar:FlxBar;
	public var songLength:Float;

	var playingNow:Bool = false;

	var timeLmao:String = "";

	var controlsThingyPlaying:FlxText;

	var songStats:FlxText;
	var pausedText:FlxText;


	var goingNowYouShithead:Bool = false;

	var fadedBG:FlxSprite;

	var inTheSelectorThing:Bool = false;
	override function create()
	{
		main = CoolUtil.coolTextFile(Paths.txt('sectionMainSonglist'));
		
		extra = CoolUtil.coolTextFile(Paths.txt('sectionExtraSonglist'));
		
		joke = CoolUtil.coolTextFile(Paths.txt('sectionJokeSonglist'));
		
		hidden = CoolUtil.coolTextFile(Paths.txt('sectionHiddenSonglist'));
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Listening to OSTs", null);
		#end


		// LOAD MUSIC

		// LOAD CHARACTERS

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		
		timeTxt = new FlxText(FlxG.width / 1.5, 20, 400, "", 32);
		timeTxt.setFormat(Paths.font("comicsanslol.ttf"), 32, FlxColor.LIME, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		timeTxt.scrollFactor.set();
		timeTxt.alpha = 0;
		timeTxt.borderSize = 2;

		controlsThingyPlaying = new FlxText(FlxG.width / 1.5, FlxG.height / 1.5, 400, "Press SPACE to pause.\nPress LEFT or RIGHT to change time.\nPress BACK to stop playing the song.", 32);
		controlsThingyPlaying.setFormat(Paths.font("comicsanslol.ttf"), 32, FlxColor.LIME, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		controlsThingyPlaying.scrollFactor.set();
		controlsThingyPlaying.alpha = 0;
		controlsThingyPlaying.borderSize = 2;

		songStats = new FlxText(FlxG.width / 1.5, 80, 400, "", 32);
		songStats.setFormat(Paths.font("comicsanslol.ttf"), 32, FlxColor.LIME, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		songStats.scrollFactor.set();
		songStats.alpha = 0;
		songStats.borderSize = 2;

		pausedText = new FlxText(FlxG.width / 1.5, 200, 400, "PAUSED", 32);
		pausedText.setFormat(Paths.font("comicsanslol.ttf"), 32, FlxColor.LIME, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		pausedText.scrollFactor.set();
		pausedText.alpha = 0;
		pausedText.borderSize = 2;


		timeBarBG = new AttachedSprite('timeBar');
		timeBarBG.x = timeTxt.x;
		timeBarBG.y = timeTxt.y + (timeTxt.height / 4);
		timeBarBG.scrollFactor.set();
		timeBarBG.alpha = 0;
		timeBarBG.visible = !ClientPrefs.hideTime;
		timeBarBG.xAdd = -4;
		timeBarBG.yAdd = -4;
		add(timeBarBG);

		timeBar = new FlxBar(timeBarBG.x + 4, timeBarBG.y + 4, LEFT_TO_RIGHT, Std.int(timeBarBG.width - 8), Std.int(timeBarBG.height - 8), this,
			'songPercent', 0, 1);
		timeBar.scrollFactor.set();
		timeBar.createFilledBar(0xFF000000, 0xFF00FF00);
		timeBar.numDivisions = 800; //How much lag this causes?? Should i tone it down to idk, 400 or 200?
		timeBar.alpha = 0;
		timeBar.visible = !ClientPrefs.hideTime;
		add(timeBar);
		timeBarBG.sprTracker = timeBar;

		PlayState.storyDifficulty = curDifficulty;
		#if MODS_ALLOWED
		Paths.destroyLoadedImages();
		#end
		WeekData.reloadWeekFiles(false);


		for (i in 0...WeekData.weeksList.length) {
			var leWeek:WeekData = WeekData.weeksLoaded.get(WeekData.weeksList[i]);
			var leSongs:Array<String> = [];
			var leChars:Array<String> = [];
			for (j in 0...leWeek.songs.length) {
				leSongs.push(leWeek.songs[j][0]);
				leChars.push(leWeek.songs[j][1]);
			}

			WeekData.setDirectoryFromWeek(leWeek);
			for (song in leWeek.songs) {
				var colors:Array<Int> = song[2];
				if(colors == null || colors.length < 3) {
					colors = [146, 113, 253];
				}
				addSong(song[0], i, song[1], FlxColor.fromRGB(colors[0], colors[1], colors[2]));
			}
			if(i == WeekData.weeksList.length - 1)
				{
					trace("adding music ost");
					songs.push(new OSTSongMetadata("Main Theme", 1337, 'musicnote', FlxColor.fromRGB(255,237,0)));
					songs.push(new OSTSongMetadata("Game Over Theme", 1337, 'musicnote', FlxColor.fromRGB(4,62,103)));
					songs.push(new OSTSongMetadata("Game Over End", 1337, 'musicnote', FlxColor.fromRGB(4,62,103)));
					songs.push(new OSTSongMetadata("Pause Theme", 1337, 'musicnote', FlxColor.fromRGB(46,102,36)));
				}
		}
		WeekData.setDirectoryFromWeek();


		



		grpSongs = new FlxTypedGroup<Alphabet>();
		add(grpSongs);

		for (i in 0...songs.length)
		{
			var songText:Alphabet = new Alphabet(0, (1000 * i) + 90, songs[i].songName, true, false);
			songText.isMenuItem = true;
			songText.itemType = "Left Side";
			songText.targetY = i;
			songText.screenCenter(X);
			grpSongs.add(songText);
			Paths.currentModDirectory = songs[i].folder;
			var icon:HealthIcon = new HealthIcon(songs[i].songCharacter);
			icon.sprTracker = songText;

			// using a FlxGroup is too much fuss!
			iconArray.push(icon);
			add(icon);
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
		}
		WeekData.setDirectoryFromWeek();

		add(timeTxt);
		add(songStats);
		add(controlsThingyPlaying);
		add(pausedText);

		if(curSelected >= songs.length) curSelected = 0;
		bg.color = songs[curSelected].color;
		intendedColor = bg.color;
		changeSelection();

		var swag:Alphabet = new Alphabet(1, 0, "swag");

		curSelected = 0;
		fadedBG = new FlxSprite(0, 0);
		fadedBG.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		fadedBG.alpha = 0;
		add(fadedBG);
		playTheSongWith = new Alphabet(0, FlxG.height / 1.2, 'Play the song with', true);
		playTheSongWith.screenCenter(X);
		playTheSongWith.alpha = 0;
		add(playTheSongWith);

		

		curSelected = 0;

		super.create();

	}



	public function goToFreeplay()
	{
		
	}
	override function closeSubState() {
		changeSelection();
		super.closeSubState();
	}

	public function addSong(songName:String, weekNum:Int, songCharacter:String, color:Int)
	{
				if(main.contains(songName) || extra.contains(songName) || joke.contains(songName) || hidden.contains(songName))
					{
						songs.push(new OSTSongMetadata(songName, weekNum, songCharacter, color));
					}
		
	}

	/*public function addWeek(songs:Array<String>, weekNum:Int, weekColor:Int, ?songCharacters:Array<String>)
	{
		if (songCharacters == null)
			songCharacters = ['bf'];

		var num:Int = 0;
		for (song in songs)
		{
			addSong(song, weekNum, songCharacters[num]);
			this.songs[this.songs.length-1].color = weekColor;

			if (songCharacters.length != 1)
				num++;
		}
	}*/

	var instPlaying:Int = -1;
	private static var vocals:FlxSound = null;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}
			

				

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;
		var accepted = controls.ACCEPT;
		var space = FlxG.keys.justPressed.SPACE;
		if (controls.BACK && !playingRN)
			{
				if(colorTween != null) {
					colorTween.cancel();
				}
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new ExtrasMenuState());
			}
		var shiftMult:Int = 1;
		if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

		if (upP)
		{
			changeSelection(-shiftMult);
		}
		if (downP)
		{
			changeSelection(shiftMult);
		}

		if(playingRN)
		{
			if (controls.UI_LEFT_P)
                {
					FlxG.sound.music.time -= 5000;
					if(songs[curSelected].week != 1337)
						{
				vocals.time = FlxG.sound.music.time; 
						}
                }
			if (controls.UI_RIGHT_P)
                {
                    FlxG.sound.music.time += 5000;
					if(songs[curSelected].week != 1337)
						{
                vocals.time = FlxG.sound.music.time;
						}
                if(FlxG.sound.music.time >= FlxG.sound.music.length)
                    {
                        FlxG.sound.music.time = 0;
						if(songs[curSelected].week != 1337)
							{
                        vocals.time = 0;
							}
                    }
                }
			if(space && !pausedSong)
				{
					pausedSong = true;
					FlxG.sound.music.pause();
					if(songs[curSelected].week != 1337)
						{
					vocals.pause();
						}
					pausedText.alpha = 1;
				} 
			else if(space && pausedSong)
				{
					pausedSong = false;
					FlxG.sound.music.resume();
					if(songs[curSelected].week != 1337)
						{
					vocals.resume();
						}
					pausedText.alpha = 0;
				}
		}
	
		

		if(inTheSelectorThing)
			{
				
			}
		if(controls.ACCEPT && instPlaying != curSelected)
		{
			if(songs[curSelected].week != 1337)
				{
					destroyFreeplayVocals();
					Paths.currentModDirectory = songs[curSelected].folder;
					var poop:String = Highscore.formatSong(songs[curSelected].songName.toLowerCase(), curDifficulty);
					PlayState.SONG = Song.loadFromJson(poop, songs[curSelected].songName.toLowerCase());
					if (PlayState.SONG.needsVoices)
						vocals = new FlxSound().loadEmbedded(Paths.voices(PlayState.SONG.song));
					else
						vocals = new FlxSound();
					if(!FlxG.sound.list.members.contains(vocals))
						{
							FlxG.sound.list.add(vocals);
						}
					else
					{
						FlxG.sound.list.remove(vocals);
						FlxG.sound.list.add(vocals);
					}
					FlxG.sound.playMusic(Paths.inst(PlayState.SONG.song), 0.7);
					vocals.persist = true;
					vocals.looped = true;
					vocals.volume = 0.7;
					vocals.time = 0;
					vocals.play();
					Conductor.changeBPM(PlayState.SONG.bpm);
					songStats.text = "BPM: " + PlayState.SONG.bpm + "\nBy: " + PlayState.SONG.credit; 
					if(PlayState.SONG.credit == null || PlayState.SONG.credit == "")
						{
							songStats.text = "BPM: " + PlayState.SONG.bpm; 
						}
					songStats.alpha = 1;
				}
				else
					{
						switch songs[curSelected].songName
						{
							case "Main Menu":
								FlxG.sound.playMusic(Paths.music("freakyMenu"), 0.7);
							case "Game Over Theme":
								FlxG.sound.playMusic(Paths.music("gameOver"), 0.7);
							case "Game Over End":
								FlxG.sound.playMusic(Paths.music("gameOverEnd"), 0.7);
							case "Pause Theme":
								FlxG.sound.playMusic(Paths.music("breakfast"), 0.7);
								
						}
					}
				instPlaying = curSelected;
				timeTxt.alpha = 1;
				FlxG.sound.music.time = 0;
				songLength = FlxG.sound.music.length;
				playingNow = false;
				playingRN = true;
				pausedText.alpha = 0;
				controlsThingyPlaying.alpha = 1;
		}
		if (controls.BACK && instPlaying == curSelected && playingRN)
		{
			FlxG.sound.playMusic(Paths.music("freakyMenu"), 0.7);
			if(songs[curSelected].week != 1337)
				{
			vocals.stop();
			vocals.persist = false;
			vocals.looped = false;
			vocals.volume = 0;
				}
			Conductor.changeBPM(200);
			playingRN = false;
			timeTxt.alpha = 0;
			instPlaying = -1;
			changeSelection(0);
			songStats.alpha = 0;
			pausedText.alpha = 0;
			controlsThingyPlaying.alpha = 0;
		}
		

		
		if(playingRN)
			{
				var curTime:Float = FlxG.sound.music.time;

				if(curTime < 0) curTime = 0;
				var secondsTotal:Int = Math.floor((songLength - curTime) / 1000);
				if(secondsTotal < 0) secondsTotal = 0;
				var minutesRemaining:Int = Math.floor(secondsTotal / 60);
				var secondsRemaining:String = '' + secondsTotal % 60;
				var minutesTotal:Int = Math.floor(secondsTotal / 60);
				if(secondsRemaining.length < 2) secondsRemaining = '0' + secondsRemaining; //Dunno how to make it display a zero first in Haxe lol
				timeTxt.text = minutesRemaining + ':' + secondsRemaining;
				if(!playingNow)
					{
						timeLmao = timeTxt.text;
						playingNow = true;
					}
				timeTxt.text = "Time Left: " + minutesRemaining + ':' + secondsRemaining + "/" + timeLmao;
			}
    
            if(playingRN)
				{
					for(item in grpSongs.members)
						{
							if(item.targetY != 0)
								{
									item.alpha = 0;
								}
						}
					for (i in 0...iconArray.length)
						{
							if(i != curSelected)
								{
									iconArray[i].alpha = 0;
								}
						}	
				}

                if(playingRN)
                    {
                       // if (FlxG.camera.zoom < 1.35 && ClientPrefs.camZooms && curBeat % 4 == 0 && !beatShit) // the funni camera zoom each beat
                        //    FlxG.camera.zoom += 0.015;
                       // if(curBeat % 4 == 0 && !beatShit)
                       //     {
                       //         trace("beat hit");
                        //        beatShit = true;
                       //     }
                       // else {
                       //     beatShit = false;
                      //  }
                    }
                


		    FlxG.camera.zoom = FlxMath.lerp(1, FlxG.camera.zoom, CoolUtil.boundTo(1 - (elapsed * 3.125), 0, 1));
		super.update(elapsed);
	}

	

	public static function destroyFreeplayVocals() {
		if(vocals != null) {
			vocals.stop();
			vocals.destroy();
		}
		vocals = null;
	}

	override function beatHit()
	{
		if(playingRN)
			{
				trace("beat hit");
				if (FlxG.camera.zoom < 1.35 && ClientPrefs.camZooms && curBeat % 4 == 0) // the funni camera zoom each beat
					FlxG.camera.zoom += 0.015;
			}
	}

	

	
	function changeSelection(change:Int = 0)
	{
		if(!playingRN)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = songs.length - 1;
		if (curSelected >= songs.length)
			curSelected = 0;
		var newColor:Int = songs[curSelected].color;
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		// selector.y = (70 * curSelected) + 30;


		var bullShit:Int = 0;

		for (i in 0...iconArray.length)
		{
			iconArray[i].alpha = 0.6;
		}

		iconArray[curSelected].alpha = 1;

		for (item in grpSongs.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
		Paths.currentModDirectory = songs[curSelected].folder;
			}
		
	}

	
}

class OSTSongMetadata
{
	public var songName:String = "";
	public var week:Int = 0;
	public var songCharacter:String = "";
	public var color:Int = -7179779;
	public var folder:String = "";

	public function new(song:String, week:Int, songCharacter:String, color:Int)
	{
		this.songName = song;
		this.week = week;
		this.songCharacter = songCharacter;
		this.color = color;
		this.folder = Paths.currentModDirectory;
		if(this.folder == null) this.folder = '';
	}
}
