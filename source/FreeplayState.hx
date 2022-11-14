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

using StringTools;

class FreeplayState extends MusicBeatState
{
	var songs:Array<SongMetadata> = [];

	var selector:FlxText;
	public var sprTracker:FlxSprite;
	private static var curSelected:Int = 0;
	private static var curDifficulty:Int = 1;
	private static var curWeek:Int = 0;

	var scoreBG:FlxSprite;

	var lockedImage:FlxSprite;

	var gotIn:Bool = false;
	var scoreText:FlxText;
	var diffText:FlxSprite;
	var leftArrow:FlxSprite;
	var rightArrow:FlxSprite;
	var youNeedToBeatTxt:FlxText;
	var lerpScore:Int = 0;
	var lerpRating:Float = 0;
	var intendedScore:Int = 0;
	var intendedRating:Float = 0;
	var unlockTxtThing:Bool = false;
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

	var sectionSelected:Int = 0;
	var sectionText:FlxText;
	var theCurSectionLmao:FlxText;
	var sectionImage:FlxSprite;
	var inMainFreeplay:Bool = false;
	var sections:Array<String> = ['main', 'extra', 'joke', 'hidden'];

	var sectionString:String = 'UNKNOWN';
	
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

	var sectionImageMain:FlxSprite;
	var sectionImageExtra:FlxSprite;
	var sectionImageJoke:FlxSprite;
	var sectionImageHidden:FlxSprite;
	var playingNow:Bool = false;

	var timeLmao:String = "";

	var controlsThingy:FlxText;
	var controlsThingyPlaying:FlxText;

	var songStats:FlxText;
	var pausedText:FlxText;


	var goingNowYouShithead:Bool = false;

	var fadedBG:FlxSprite;

	var inTheSelectorThing:Bool = false;
	override function create()
	{

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
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

		controlsThingy = new FlxText(FlxG.width / 1.5, 20, 400, "", 32);
		controlsThingy.setFormat(Paths.font("comicsanslol.ttf"), 32, FlxColor.LIME, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		controlsThingy.scrollFactor.set();
		controlsThingy.alpha = 0;
		controlsThingy.borderSize = 2;

		controlsThingyPlaying = new FlxText(FlxG.width / 1.5, FlxG.height / 2, 400, "Press SPACE to pause.\nPress LEFT or RIGHT to change time.\nPress BACK to stop playing the song.", 32);
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

		

		sectionImageMain = new FlxSprite(0, 60).loadGraphic(Paths.image('main_extra_joke_hidden'), true);
		sectionImageMain.frames = Paths.getSparrowAtlas('main_extra_joke_hidden');
		sectionImageMain.animation.addByPrefix('main basic instance 1', 'main basic instance 1', 24, true);
		sectionImageMain.animation.addByPrefix('main white instance 1', 'main white instance 1', 24, true);
		add(sectionImageMain);
		sectionImageMain.animation.play('main basic instance 1');

		sectionImageExtra = new FlxSprite(0, sectionImageMain.y + 150).loadGraphic(Paths.image('main_extra_joke_hidden'), true);
		sectionImageExtra.frames = Paths.getSparrowAtlas('main_extra_joke_hidden');
		sectionImageExtra.animation.addByPrefix('extra basic instance 1', 'extra basic instance 1', 24, true);
		sectionImageExtra.animation.addByPrefix('extra white instance 1', 'extra white instance 1', 24, true);
		add(sectionImageExtra);
		sectionImageExtra.animation.play('extra basic instance 1');

		sectionImageJoke = new FlxSprite(0, sectionImageMain.y + 300).loadGraphic(Paths.image('main_extra_joke_hidden'), true);
		sectionImageJoke.frames = Paths.getSparrowAtlas('main_extra_joke_hidden');
		sectionImageJoke.animation.addByPrefix('joke basic instance 1', 'joke basic instance 1', 24, true);
		sectionImageJoke.animation.addByPrefix('joke white instance 1', 'joke white instance 1', 24, true);
		add(sectionImageJoke);
		sectionImageJoke.animation.play('joke basic instance 1');

		sectionImageHidden = new FlxSprite(0, sectionImageMain.y + 450).loadGraphic(Paths.image('main_extra_joke_hidden'), true);
		sectionImageHidden.frames = Paths.getSparrowAtlas('main_extra_joke_hidden');
		sectionImageHidden.animation.addByPrefix('hidden basic instance 1', 'hidden basic instance 1', 24, true);
		sectionImageHidden.animation.addByPrefix('hidden white instance 1', 'hidden white instance 1', 24, true);
		add(sectionImageHidden);
		sectionImageHidden.animation.play('hidden basic instance 1');

		sectionImage = new FlxSprite(0, 150).loadGraphic(Paths.image('week_icons_' + sections[sectionSelected]));
		sectionImage.screenCenter(X);
		sectionImage.screenCenter(Y);
		sectionImage.x = sectionImage.x + 200;
		add(sectionImage);

		curSelected = 0;

		super.create();

	}



	public function goToFreeplay()
	{
		sectionImageExtra.alpha = 0;
		sectionImageJoke.alpha = 0;
		sectionImageMain.alpha = 0;
		sectionImageHidden.alpha = 0;
		sectionImage.alpha = 0;
		PlayState.storyDifficulty = curDifficulty;
		#if MODS_ALLOWED
		Paths.destroyLoadedImages();
		#end
		WeekData.reloadWeekFiles(false);

		main = CoolUtil.coolTextFile(Paths.txt('sectionMainSonglist'));
		
		extra = CoolUtil.coolTextFile(Paths.txt('sectionExtraSonglist'));
		
		joke = CoolUtil.coolTextFile(Paths.txt('sectionJokeSonglist'));
		
		hidden = CoolUtil.coolTextFile(Paths.txt('sectionHiddenSonglist'));

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
		}
		WeekData.setDirectoryFromWeek();


		



		grpSongs = new FlxTypedGroup<Alphabet>();
		add(grpSongs);

		for (i in 0...songs.length)
		{
			
			if(songs[i].songName == 'Pessimistic' && FlxG.save.data.invisibleWeekUnlocked1 != true) //old one was tutorialCompletePlaceholder2
				{
					var songText:Alphabet = new Alphabet(0, (9000 * i) + 30, 'Hidden Song', true, false);
					songText.isMenuItem = false;
					songText.itemType = "D-Shape";
					songText.targetY = i;
					grpSongs.add(songText);
					Paths.currentModDirectory = songs[i].folder;
					var icon:HealthIcon = new HealthIcon('lock');
					icon.sprTracker = songText;
		
					// using a FlxGroup is too much fuss!
					iconArray.push(icon);
					add(icon);
				}

			else if(songs[i].songName == 'Ornery' && FlxG.save.data.orneryUnlocked != true) //old one was tutorialCompletePlaceholder2
			{
				var songText:Alphabet = new Alphabet(0, (70 * i) + 30, 'Hidden Song', true, false);
				songText.isMenuItem = true;
				songText.itemType = "D-Shape";
				songText.targetY = i;
				grpSongs.add(songText);
				Paths.currentModDirectory = songs[i].folder;
				var icon:HealthIcon = new HealthIcon('lock');
				icon.sprTracker = songText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
			}
			else if(songs[i].songName == 'Spamophobia' && FlxG.save.data.spamophobiaUnlocked != true) //old one was tutorialCompletePlaceholder2
			{
				var songText:Alphabet = new Alphabet(0, (70 * i) + 30, 'Hidden Song', true, false);
				songText.isMenuItem = true;
				songText.itemType = "D-Shape";
				songText.targetY = i;
				grpSongs.add(songText);
				Paths.currentModDirectory = songs[i].folder;
				var icon:HealthIcon = new HealthIcon('lock');
				icon.sprTracker = songText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
			}
			else if(songs[i].songName == 'Tribulation' && FlxG.save.data.tribUnlocked != true) //old one was tutorialCompletePlaceholder2
				{
					var songText:Alphabet = new Alphabet(0, (70 * i) + 30, 'Hidden Song', true, false);
					songText.isMenuItem = true;
					songText.itemType = "D-Shape";
					songText.targetY = i;
					grpSongs.add(songText);
					Paths.currentModDirectory = songs[i].folder;
					var icon:HealthIcon = new HealthIcon('lock');
					icon.sprTracker = songText;
		
					// using a FlxGroup is too much fuss!
					iconArray.push(icon);
					add(icon);
				}
			else if(songs[i].songName == 'Fucked' && FlxG.save.data.fuckedUnlocked != true) //old one was tutorialCompletePlaceholder2
					{
						var songText:Alphabet = new Alphabet(0, (70 * i) + 30, 'Hidden Song', true, false);
						songText.isMenuItem = true;
						songText.itemType = "D-Shape";
						songText.targetY = i;
						grpSongs.add(songText);
						Paths.currentModDirectory = songs[i].folder;
						var icon:HealthIcon = new HealthIcon('lock');
						icon.sprTracker = songText;
			
						// using a FlxGroup is too much fuss!
						iconArray.push(icon);
						add(icon);
					}
			else if(songs[i].songName == 'Golden' && FlxG.save.data.goldenUnlocked != true) //old one was tutorialCompletePlaceholder2
				{
					var songText:Alphabet = new Alphabet(0, (70 * i) + 30, 'Hidden Song', true, false);
					songText.isMenuItem = true;
					songText.itemType = "D-Shape";
					songText.targetY = i;
					grpSongs.add(songText);
					Paths.currentModDirectory = songs[i].folder;
					var icon:HealthIcon = new HealthIcon('lock');
					icon.sprTracker = songText;
		
					// using a FlxGroup is too much fuss!
					iconArray.push(icon);
					add(icon);
				}
			else
			{
			var songText:Alphabet = new Alphabet(0, (1000 * i) + 90, songs[i].songName, true, false);
			songText.isMenuItem = true;
			songText.itemType = "D-Shape";
			songText.targetY = i;
			songText.screenCenter(X);
			grpSongs.add(songText);
			Paths.currentModDirectory = songs[i].folder;
			var icon:HealthIcon = new HealthIcon(songs[i].songCharacter);
			icon.sprTracker = songText;

			// using a FlxGroup is too much fuss!
			iconArray.push(icon);
			add(icon);
			}
			#if PRELOAD_ALL
			controlsThingy.alpha = 1;
			#end
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
		}
		WeekData.setDirectoryFromWeek();

		add(timeTxt);
		add(songStats);
		add(controlsThingy);
		add(controlsThingyPlaying);
		add(pausedText);
		scoreText = new FlxText(FlxG.width * 0.7, 675, 0, "", 32);
		scoreText.setFormat(Paths.font("comicsanslol.ttf"), 32, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);

		scoreBG = new FlxSprite(scoreText.x - 6, 0).makeGraphic(1, 66, 0xFF000000);
		scoreBG.alpha = 0.;
		add(scoreBG);


		diffText = new FlxSprite(FlxG.width * 0.7, 400);
		diffText.loadGraphic(Paths.image(''));
		add(diffText);
		diffText.scale.x /= 1.9;
		diffText.scale.y /= 1.9;
		leftArrow = new FlxSprite(diffText.x - 30, diffText.y + 80);
		leftArrow.frames = Paths.getSparrowAtlas('freeplay_menu_UI_assets');
		leftArrow.animation.addByPrefix('idle', "arrow left");
		leftArrow.animation.addByPrefix('press', "arrow push left");
		leftArrow.animation.play('idle');
		leftArrow.antialiasing = ClientPrefs.globalAntialiasing;
		add(leftArrow);
		leftArrow.alpha = 0;
		rightArrow = new FlxSprite(leftArrow.x + 370, diffText.y + 80);
		rightArrow.frames = Paths.getSparrowAtlas('freeplay_menu_UI_assets');
		rightArrow.animation.addByPrefix('idle', "arrow right");
		rightArrow.animation.addByPrefix('press', "arrow push right");
		rightArrow.animation.play('idle');
		rightArrow.antialiasing = ClientPrefs.globalAntialiasing;
		add(rightArrow);
		rightArrow.alpha = 0;
		

		add(scoreText);

		if(curSelected >= songs.length) curSelected = 0;
		bg.color = songs[curSelected].color;
		intendedColor = bg.color;
		changeSelection();
		changeDiff();

		var swag:Alphabet = new Alphabet(1, 0, "swag");

		inMainFreeplay = true;
		curSelected = 0;
		fadedBG = new FlxSprite(0, 0);
		fadedBG.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		fadedBG.alpha = 0;
		add(fadedBG);
		playTheSongWith = new Alphabet(0, FlxG.height / 1.2, 'Play the song with', true);
		playTheSongWith.screenCenter(X);
		playTheSongWith.alpha = 0;
		add(playTheSongWith);
	}
	override function closeSubState() {
		if(inMainFreeplay)
		{
		changeSelection();
		}
		super.closeSubState();
	}

	public function addSong(songName:String, weekNum:Int, songCharacter:String, color:Int)
	{
		if(sections[sectionSelected] == 'main')
			{
		if(main.contains(songName))
			{
				trace("main songs add");
				songs.push(new SongMetadata(songName, weekNum, songCharacter, color));
			}
			}

		if(sections[sectionSelected] == 'extra')
			{
		if(extra.contains(songName))
			{
				trace("extra songs add");
				songs.push(new SongMetadata(songName, weekNum, songCharacter, color));
			}
			}

		if(sections[sectionSelected] == 'joke')
			{
		if(joke.contains(songName))
			{
				trace("joke songs add");
				songs.push(new SongMetadata(songName, weekNum, songCharacter, color));
			}
			}

		if(sections[sectionSelected] == 'hidden')
		{
		if(hidden.contains(songName))
			{
				trace("hidden songs add");
				songs.push(new SongMetadata(songName, weekNum, songCharacter, color));
			}
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

		if(!inMainFreeplay) {
			if(sections[sectionSelected] == 'main')
				{
					sectionImageMain.animation.play('main white instance 1');
				}
			else {
				sectionImageMain.animation.play('main basic instance 1');
			}

			if(sections[sectionSelected] == 'extra')
				{
					sectionImageExtra.animation.play('extra white instance 1');
				}
			else {
				sectionImageExtra.animation.play('extra basic instance 1');
			}

			if(sections[sectionSelected] == 'joke')
				{
					sectionImageJoke.animation.play('joke white instance 1');
				}
			else {
				sectionImageJoke.animation.play('joke basic instance 1');
			}

			if(sections[sectionSelected] == 'hidden')
				{
					sectionImageHidden.animation.play('hidden white instance 1');
				}
			else {
				sectionImageHidden.animation.play('hidden basic instance 1');
			}

			sectionImage.loadGraphic(Paths.image('week_icons_' + sections[sectionSelected]));
			sectionImage.screenCenter(X);
			sectionImage.x = sectionImage.x + 200;
			if(!goingNowYouShithead)
				{
					if (controls.UI_UP_P)
						changeSectionFunction(-1);
					if (controls.UI_DOWN_P)
						changeSectionFunction(1);
				}
		}

		if(inMainFreeplay)
			{
				if(controls.UI_LEFT_P)
					{
						leftArrow.animation.play('press');
					}
				else
				{
					leftArrow.animation.play('idle');
				}
				if(controls.UI_RIGHT_P)
					{
						rightArrow.animation.play('press');
					}
				else
				{
					rightArrow.animation.play('idle');
				}
				lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, CoolUtil.boundTo(elapsed * 24, 0, 1)));
				lerpRating = FlxMath.lerp(lerpRating, intendedRating, CoolUtil.boundTo(elapsed * 12, 0, 1));
		
				if (Math.abs(lerpScore - intendedScore) <= 10)
					lerpScore = intendedScore;
				if (Math.abs(lerpRating - intendedRating) <= 0.01)
					lerpRating = intendedRating;
				scoreText.text = 'PERSONAL BEST: ' + lerpScore + ' (' + Math.floor(lerpRating * 100) + '%)';
				positionHighscore();
			}

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;
		var accepted = controls.ACCEPT;
		var space = FlxG.keys.justPressed.SPACE;
		if (controls.BACK && inMainFreeplay && !gotIn)
			{
				if(colorTween != null) {
					colorTween.cancel();
				}
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.resetState();
			}
		else if (controls.BACK && !inMainFreeplay)
			{
				if(colorTween != null) {
					colorTween.cancel();
				}
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new MainMenuState());
			}
		if(inMainFreeplay)

			{
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

		if(!playingRN && !gotIn)
		{
			if (controls.UI_LEFT_P)
				changeDiff(-1);
			if (controls.UI_RIGHT_P)
				changeDiff(1);
		}
		else if(playingRN)
		{
			if (controls.UI_LEFT_P)
				FlxG.sound.music.time -= 5000;
			vocals.time = FlxG.sound.music.time; 
			if (controls.UI_RIGHT_P)
				FlxG.sound.music.time += 5000;
			vocals.time = FlxG.sound.music.time;
			if(space && !pausedSong)
				{
					pausedSong = true;
					FlxG.sound.music.pause();
					vocals.pause();
					pausedText.alpha = 1;
				} 
			else if(space && pausedSong)
				{
					pausedSong = false;
					FlxG.sound.music.resume();
					vocals.resume();
					pausedText.alpha = 0;
				}
		}
	
		

		#if PRELOAD_ALL

		if(inTheSelectorThing)
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
				instPlaying = curSelected;
				timeTxt.alpha = 1;
				FlxG.sound.music.time = 0;
				vocals.time = 0;
				vocals.play();
				songLength = FlxG.sound.music.length;
				playingNow = false;
				Conductor.changeBPM(PlayState.SONG.bpm);
				playingRN = true;
				diffText.alpha = 0;
				scoreText.alpha = 0;
				songStats.text = "BPM: " + PlayState.SONG.bpm + "\nBy: " + PlayState.SONG.credit; 
				if(PlayState.SONG.credit == null || PlayState.SONG.credit == "")
					{
						songStats.text = "BPM: " + PlayState.SONG.bpm; 
					}
				songStats.alpha = 1;
				controlsThingy.alpha = 0;
				pausedText.alpha = 0;
				controlsThingyPlaying.alpha = 1;
			}
		/*if (controls.BACK && instPlaying == curSelected && playingRN)
		{
			FlxG.sound.playMusic(Paths.music("freakyMenu"), 0.7);
			vocals.stop();
			vocals.persist = false;
			vocals.looped = false;
			vocals.volume = 0;
			Conductor.changeBPM(200);
			playingRN = false;
			timeTxt.alpha = 0;
			instPlaying = -1;
			changeSelection(0);
			diffText.alpha = 1;
			scoreText.alpha = 1;
			songStats.alpha = 0;
			pausedText.alpha = 0;
			controlsThingy.alpha = 1;
			controlsThingyPlaying.alpha = 0;
		}
		else*/ #end if (accepted && !playingRN)
		{
			var songLowercase:String = Paths.formatToSongPath(songs[curSelected].songName);
			var poop:String = Highscore.formatSong(songLowercase, curDifficulty);
			#if MODS_ALLOWED
			if(!sys.FileSystem.exists(Paths.modsJson(songLowercase + '/' + poop)) && !sys.FileSystem.exists(Paths.json(songLowercase + '/' + poop))) {
			#else
			if(!OpenFlAssets.exists(Paths.json(songLowercase + '/' + poop))) {
			#end
				poop = songLowercase;
				curDifficulty = 1;
				trace('Couldnt find file');
			}
			trace(poop);
			if(songLowercase == 'pessimistic' && FlxG.save.data.invisibleWeekUnlocked1 != true)
				{
					FlxG.sound.play(Paths.sound('cancelMenu'), 0.7);
					if(!unlockTxtThing)
						{
						unlockTxtThing = true;
						youNeedToBeatTxt = new FlxText(0, 0, FlxG.width, "You need to beat Chapter 4\nto unlock this song.", 32);
						 youNeedToBeatTxt.setFormat("Comic Sans MS", 32, FlxColor.WHITE, CENTER, OUTLINE, 0xFF000000);
						  youNeedToBeatTxt.screenCenter(Y);
						 add(youNeedToBeatTxt);
						new FlxTimer().start(1, function(tmr:FlxTimer)
							{
								unlockTxtThing = false;
								remove(youNeedToBeatTxt);
							});
						}
				}
			else if(songLowercase == 'ornery' && FlxG.save.data.orneryUnlocked != true)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'), 0.7);
				if(!unlockTxtThing)
					{
					unlockTxtThing = true;
					youNeedToBeatTxt = new FlxText(0, 0, FlxG.width, "You need to beat Chapter 3\nto unlock this song.", 32);
     				youNeedToBeatTxt.setFormat("Comic Sans MS", 32, FlxColor.WHITE, CENTER, OUTLINE, 0xFF000000);
      				youNeedToBeatTxt.screenCenter(Y);
     				add(youNeedToBeatTxt);
					new FlxTimer().start(1, function(tmr:FlxTimer)
						{
							unlockTxtThing = false;
							remove(youNeedToBeatTxt);
						});
					}
			}
			else if(songLowercase == 'golden' && FlxG.save.data.goldenUnlocked != true)
				{
					FlxG.sound.play(Paths.sound('cancelMenu'), 0.7);
					if(!unlockTxtThing)
						{
						unlockTxtThing = true;
						youNeedToBeatTxt = new FlxText(0, 0, FlxG.width, "You need to beat Ornery\nto unlock this song.", 32);
						 youNeedToBeatTxt.setFormat("Comic Sans MS", 32, FlxColor.WHITE, CENTER, OUTLINE, 0xFF000000);
						  youNeedToBeatTxt.screenCenter(Y);
						 add(youNeedToBeatTxt);
						new FlxTimer().start(1, function(tmr:FlxTimer)
							{
								unlockTxtThing = false;
								remove(youNeedToBeatTxt);
							});
						}
				}
				else if(songLowercase == 'fucked' && FlxG.save.data.fuckedUnlocked != true)
					{
						FlxG.sound.play(Paths.sound('cancelMenu'), 0.7);
						if(!unlockTxtThing)
							{
							unlockTxtThing = true;
							youNeedToBeatTxt = new FlxText(0, 0, FlxG.width, "You need to press 7 on Hjoim and\nbeat the secret song\nto unlock this song.", 32);
							 youNeedToBeatTxt.setFormat("Comic Sans MS", 32, FlxColor.WHITE, CENTER, OUTLINE, 0xFF000000);
							  youNeedToBeatTxt.screenCenter(Y);
							 add(youNeedToBeatTxt);
							new FlxTimer().start(1, function(tmr:FlxTimer)
								{
									unlockTxtThing = false;
									remove(youNeedToBeatTxt);
								});
							}
					}
					else if(songLowercase == 'tribulation' && FlxG.save.data.tribUnlocked != true)
						{
							FlxG.sound.play(Paths.sound('cancelMenu'), 0.7);
							if(!unlockTxtThing)
								{
								unlockTxtThing = true;
								youNeedToBeatTxt = new FlxText(0, 0, FlxG.width, "You need to press 7 on Idot and\nbeat the secret song\nto unlock this song.", 32);
								 youNeedToBeatTxt.setFormat("Comic Sans MS", 32, FlxColor.WHITE, CENTER, OUTLINE, 0xFF000000);
								  youNeedToBeatTxt.screenCenter(Y);
								 add(youNeedToBeatTxt);
								new FlxTimer().start(1, function(tmr:FlxTimer)
									{
										unlockTxtThing = false;
										remove(youNeedToBeatTxt);
									});
								}
						}
			else if(songLowercase == 'spamophobia' && FlxG.save.data.spamophobiaUnlocked != true)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'), 0.7);
				if(!unlockTxtThing)
					{
					unlockTxtThing = true;
					youNeedToBeatTxt = new FlxText(0, 0, FlxG.width, "You need to beat Pessimistic\nto unlock this song.", 32);
     				youNeedToBeatTxt.setFormat("Comic Sans MS", 32, FlxColor.WHITE, CENTER, OUTLINE, 0xFF000000);
      				youNeedToBeatTxt.screenCenter(Y);
     				add(youNeedToBeatTxt);
					new FlxTimer().start(1, function(tmr:FlxTimer)
						{
							unlockTxtThing = false;
							remove(youNeedToBeatTxt);
						});
					}
			}
			else if (accepted && !gotIn)
			{
				FlxTween.tween(diffText, {alpha: 0}, 0.25, {ease: FlxEase.cubeIn, type:ONESHOT});
				FlxTween.tween(scoreText, {alpha: 0}, 0.25, {ease: FlxEase.cubeIn, type:ONESHOT});
				FlxTween.tween(leftArrow, {alpha: 0}, 0.25, {ease: FlxEase.cubeIn, type:ONESHOT});
				FlxTween.tween(rightArrow, {alpha: 0}, 0.25, {ease: FlxEase.cubeIn, type:ONESHOT});
				FlxTween.tween(controlsThingy, {alpha: 0}, 0.25, {ease: FlxEase.cubeIn, type:ONESHOT});
				gotIn = true;
				FlxG.sound.play(Paths.sound('confirmMenu'));
				FlxFlicker.flicker(iconArray[curSelected], 1, 0.06, false, false, function(flick:FlxFlicker)
					{

					});
								for(item in grpSongs.members)
									{
										if(item.targetY == 0)
										{
											FlxFlicker.flicker(item, 1, 0.06, false, false, function(flick:FlxFlicker)
											{

											});
										}
										else if(item.targetY < 0)
										{
											FlxTween.tween(item, {alpha: 0}, 0.25, {ease: FlxEase.cubeIn, type:ONESHOT});
										}
										else if(item.targetY > 0)
										{
											FlxTween.tween(item, {alpha: 0}, 0.25, {ease: FlxEase.cubeIn, type:ONESHOT});
										}
										for (i in 0...iconArray.length)
											{
												if(i != curSelected)
													{
																FlxTween.tween(iconArray[i], {alpha: 0}, 0.25, {ease: FlxEase.cubeIn, type:ONESHOT});
													}
											}
										
									}
						
				new FlxTimer().start(0.75, function(tmr:FlxTimer)
					{
						FlxTween.tween(FlxG.camera, {zoom: 10}, 0.5, {ease: FlxEase.cubeIn, type:ONESHOT});
					});
				new FlxTimer().start(1.25, function(tmr:FlxTimer)
					{
						PlayState.SONG = Song.loadFromJson(poop, songLowercase);
						PlayState.isStoryMode = false;
						PlayState.storyDifficulty = curDifficulty;
		
						PlayState.storyWeek = songs[curSelected].week;
						trace('CURRENT WEEK: ' + WeekData.getWeekFileName());
						if(colorTween != null) {
							colorTween.cancel();
						}
						MusicBeatState.switchState(new CharacterSelectionState());
		
						FlxG.sound.music.volume = 0;
		
						destroyFreeplayVocals();			
					});
				
			}
		}
		else if(controls.RESET)
		{
			if(songs[curSelected].songName == 'Pessimistic' && FlxG.save.data.invisibleWeekUnlocked1 != true)
				{
	
				}
			else if(songs[curSelected].songName == 'Spamophobia' && FlxG.save.data.spamophobiaUnlocked != true)
			{

			}
			else if(songs[curSelected].songName == 'Fucked' && FlxG.save.data.fuckedUnlocked != true)
				{
	
				}
			else if(songs[curSelected].songName == 'Tribulation' && FlxG.save.data.tribUnlocked != true)
					{
		
					}
			else if(songs[curSelected].songName == 'Ornery' && FlxG.save.data.orneryUnlocked != true)
			{

			}
			else if(songs[curSelected].songName == 'Golden' && FlxG.save.data.goldenUnlocked != true)
				{
	
				}
			else
			{
			openSubState(new ResetScoreSubState(songs[curSelected].songName, curDifficulty, songs[curSelected].songCharacter));
			FlxG.sound.play(Paths.sound('scrollMenu'));
			}
		}

		if(FlxG.keys.justPressed.SIX)
			{
				var songLowercase:String = Paths.formatToSongPath(songs[curSelected].songName);
				var poop:String = Highscore.formatSong(songLowercase, curDifficulty);
				#if MODS_ALLOWED
				if(!sys.FileSystem.exists(Paths.modsJson(songLowercase + '/' + poop)) && !sys.FileSystem.exists(Paths.json(songLowercase + '/' + poop))) {
				#else
				if(!OpenFlAssets.exists(Paths.json(songLowercase + '/' + poop))) {
				#end
				poop = songLowercase;
				curDifficulty = 1;
				trace('Couldnt find file');
				}
				trace(poop);
				PlayState.SONG = Song.loadFromJson(poop, songLowercase);
				PlayState.isStoryMode = false;
				PlayState.storyDifficulty = curDifficulty;

				PlayState.storyWeek = songs[curSelected].week;
				trace('CURRENT WEEK: ' + WeekData.getWeekFileName());
				if(colorTween != null) {
					colorTween.cancel();
				}
				LoadingState.loadAndSwitchState(new PlayState());

				FlxG.sound.music.volume = 0;

				destroyFreeplayVocals();
			}
			}

		if(accepted && !inMainFreeplay && !goingNowYouShithead)
			{
				goingNowYouShithead = true;
				FlxG.sound.play(Paths.sound('confirmMenu'));
				switch sectionSelected
				{
					case 0:
						FlxFlicker.flicker(sectionImageMain, 1, 0.1, true);
						fadeSections(1);
						fadeSections(2);
						fadeSections(3);
					case 1:
						FlxFlicker.flicker(sectionImageExtra, 1, 0.1, true);
						fadeSections(0);
						fadeSections(2);
						fadeSections(3);
					case 2:
						FlxFlicker.flicker(sectionImageJoke, 1, 0.1, true);
						fadeSections(1);
						fadeSections(0);
						fadeSections(3);
					case 3:
						FlxFlicker.flicker(sectionImageHidden, 1, 0.1, true);
						fadeSections(1);
						fadeSections(2);
						fadeSections(0);
				}
				new FlxTimer().start(1, function(tmr:FlxTimer)
					{
						goToFreeplay();
					});
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
			
			if(playingRN && !gotIn)
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
			if(!gotIn)
				{
					FlxG.camera.zoom = FlxMath.lerp(1, FlxG.camera.zoom, CoolUtil.boundTo(1 - (elapsed * 3.125), 0, 1));
				}
		super.update(elapsed);
	}

	public function fadeSections(theTarget:Int)
		{
			switch theTarget
			{
				case 0:
					FlxTween.tween(sectionImageMain, {alpha: 0}, 0.25, {ease: FlxEase.cubeIn, type:ONESHOT});
				case 1:
					FlxTween.tween(sectionImageExtra, {alpha: 0}, 0.25, {ease: FlxEase.cubeIn, type:ONESHOT});
				case 2:
					FlxTween.tween(sectionImageJoke, {alpha: 0}, 0.25, {ease: FlxEase.cubeIn, type:ONESHOT});
				case 3:
					FlxTween.tween(sectionImageHidden, {alpha: 0}, 0.25, {ease: FlxEase.cubeIn, type:ONESHOT});
			}
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

	public function changeSectionFunction(changeSection:Int = 0)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'));
			sectionSelected += changeSection;
	
			if (sectionSelected < 0)
				sectionSelected = sections.length-1;
			if (sectionSelected >= sections.length)
				sectionSelected = 0;

	
		}

	function changeDiff(change:Int = 0)
	{
		curDifficulty += change;

		if (curDifficulty < 0)
			curDifficulty = CoolUtil.difficultyStuff.length-1;
		if (curDifficulty >= CoolUtil.difficultyStuff.length)
			curDifficulty = 0;

		#if !switch
		intendedScore = Highscore.getScore(songs[curSelected].songName, curDifficulty);
		intendedRating = Highscore.getRating(songs[curSelected].songName, curDifficulty);
		#end

		PlayState.storyDifficulty = curDifficulty;
		diffText.loadGraphic(Paths.image('menudifficulties/' + CoolUtil.difficultyString().toLowerCase() + 'freeplay'));
		if(inMainFreeplay)
		{
		positionHighscore();
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

		#if !switch
		intendedScore = Highscore.getScore(songs[curSelected].songName, curDifficulty);
		intendedRating = Highscore.getRating(songs[curSelected].songName, curDifficulty);
		#end

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
		changeDiff();
		Paths.currentModDirectory = songs[curSelected].folder;
			}
		
	}

	private function positionHighscore() {
		scoreText.x = FlxG.width - scoreText.width - 6;

		scoreBG.scale.x = FlxG.width - scoreText.x + 6;
		scoreBG.x = FlxG.width - (scoreBG.scale.x / 2);
		diffText.x = Std.int(scoreBG.x + (scoreBG.width / 2));
		diffText.x -= diffText.width / 2;
		leftArrow.x = Std.int(scoreBG.x + (scoreBG.width / 2));
		leftArrow.x -= leftArrow.width / 2;
		leftArrow.x = leftArrow.x - 175;
		rightArrow.x = Std.int(scoreBG.x + (scoreBG.width / 2));
		rightArrow.x -= rightArrow.width / 2;
		rightArrow.x = rightArrow.x + 175;
		
	}
}

class SongMetadata
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
