package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = 1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];

	private static var creditsStuff:Array<Dynamic> = [ //Name - Icon name - Description - Link - BG Color
		['Main mod creators'],
		['Joolian',				'joolian',			'Song Creator, Coding, Modcharting, Sprite Creator, Charter',						'https://www.youtube.com/channel/UCodhrSzni1q310Xpx72Ehzg',			0xFF0000FF], //blue
		['Kris',			'kris',			'Modcharting',				'https://www.youtube.com/channel/UC_FdqDeT9EP4l9Y1XYInU3g',			0xFF329932], //green
		['Memory 001',				'memory',			'Director',							'https://gamebanana.com/members/1771876',			0xFF0000FF], //blue
		['LiterallyWize',			'wize',		'Song Creator, Director',		'https://www.youtube.com/c/LiterallyWize',		0xFFFF0000], //red
		['Maevings',			'maevings',		'Song Creator ',/*they're gone from the mod team :(*/		'https://www.youtube.com/c/Maevings',		0xFFFFFF00],//yellow
		['Alex Director',				'alexdirector',		'Director (lol)',	'https://www.youtube.com/c/AlexDirector',	0xFFFF0000], //red
		['Roundcat',			'roundcat',		'Sprite Creator',				'https://www.youtube.com/channel/UCYGckDXCCBRIcyspEeJdg-g',		0xFFFFC0CB], //pink
		['NLee',			'nlee',		'Song Creator',				'https://www.youtube.com/c/LeeBoyGaming167/featured',		0xFFFFC0CB], //pink
		['Delta',			'delta',		'A whole lot of coding shit that I can\'t\nfit in this text at all.',				'https://www.youtube.com/c/Delta1248',		0xFF00C6FF], //light blue
		['Catmo',			'catmo',		'Artist, Sprite Creator, Song Creator',				'https://www.youtube.com/channel/UCP53vUYJxiQf4BBK_Yjze0Q',		0xFFFF69B4], //hot pink
		['Mr Oof',			'mroof',		'Charter',				'https://www.youtube.com/channel/UCxc2inbxRJSZln74W_ybnFg',		0xFFFFFF00], //yellow
		['ABrainlessShork',			'abrainlessshork',		'Charter',				'https://www.youtube.com/channel/UC7HFj0_NjSZ20jvgk_w8j6A',		0xFF808080], //grey
		['Matiaris',			'matiaris',		'Concept Artist, Charter, Song Creator',				'https://www.youtube.com/channel/UC9KBQlJUFn4zs1Zp5PnhYmA',		0xFF808080], //grey
		['NewPlayer',			'newplayer',		'Artist',				'https://www.youtube.com/channel/UCqxtnCuemVF_EXK7P0Mo3lw',		0xFFFFFFFF], //white
		['Hortas',			'hortas',		'Song Creator',				'https://www.youtube.com/channel/UCvR1oxdjnB9hV-MLeH339Kg',		0xFF89CFF0], //like a baby blue color idk
		['Squibble',			'squibble',		'Charter',				'https://www.youtube.com/channel/UCFauerFFkn1WlPCY3Y3iTIQ',		0xFFFFC0CB], //pink
		['Max',		'max',	'Early Playtester',						'https://www.youtube.com/channel/UCNU3A-UBMyd76BvZaqQUGJg',	0xFF329932], //green
		['Tatertosz',		'nate',	'Early Playtester',						'https://www.youtube.com/channel/UCz4_xOQfn1Kqu-veDhomLFQ',	0xFF00C6FF], //light blue
		['FUTURISTIC_ENTERTAINMENT',			'future',		'Artist/Sprite Creator',				'https://www.youtube.com/channel/UCEIwEq_0KycIQTpDzYmFjyQ',		0xFF808080], //grey
		['Pyramix',			'pyramix',		'Song Creator',				'https://www.youtube.com/channel/UCPKFkbgvQ5_3ETVd3l75wAA',		0xFFFFFFFF], //white
		['Lier',		'LIER',	'Playtester',						'https://www.youtube.com/channel/UC7NWZaan4n7gR1Mcu4JdDAQ/',	0xFF0000FF], //blue
		['OOF Productions',			'oof',		'Director, Modcharter, Coder, Artist And Charter',				'https://www.youtube.com/channel/UCVAf4TewS2ckoiHa8s8QiQg',		0xFFFFFF00], //yellow
		['Point',			'point',		'Modcharter And Coder',				'https://www.youtube.com/channel/UCB5J-4DFe0L1jbZrJxJFgLw',		0xFF329932], //green
		['Rapperep Lol',			'rapperep',		'Playtester, Sprite Creator',		'https://www.youtube.com/c/rappareplol',		0xFFFF0000], //red
		['Lancey',			'lancey',		'Playtester',		'https://www.youtube.com/c/Lancey170/featured',		0xFFFFFFFF], //white
		['Spook',			'spook',		'Artist',		'https://www.youtube.com/channel/UC6cr8E9ACxcpGWvHQmjoqlw',		0xFF808080], //grey
		['Vivica',			'vivica',		'Artist And Made Dortas',		'https://www.youtube.com/c/VivacaForever',		0xFFFFA500], //orange
		['6160mas',			'mas',		'Artist',		'https://discord.gg/Kks6aMfN7c',		0xFF808080], //grey
		['EvanOrSomething',			'idk',		'Artist',		'https://twitter.com/EvanOrSomethin',		0xFF808080], //grey
		['GoldenInHell',			'golden',		'Artist',		'https://www.youtube.com/channel/UCb4p8aGt8xPtv64tEuOG61Q',		0xFFFFFFFF], //white
		['Jac0bb',			'idk',		'Artist',		'https://www.youtube.com/channel/UCkJ4Lnowp9EgEMyRGAPlGBQ',		0xFFFF0000], //red
		['Kum0ri',			'idk',		'Made Diambi And Artist',				'https://www.youtube.com/c/Kum0rii',		0xFF00ffff], //cyan
		['Owen',			'idiot',		'Artist And Made Idiot',				'https://www.youtube.com/channel/UC5yw-4zUnyOVFjmpa-o5QLw',		0xFFFFC0CB], //pink
		['PizzaSlice',			'idk',		'Artist And Made Bambinton',				'https://www.youtube.com/channel/UCmJ86WgUlyD0om4ybMCe8ew',		0xFF00ffff], //cyan
		['RandomDude',				'idk',			'Artist',							'https://www.youtube.com/channel/UCFN0vvgy7c7psQB4-vB_22Q',			0xFF0000FF], //blue
		['SpiralGraveStudios',				'idk',			'Artist',							'https://www.youtube.com/channel/UCDcJgi_SkoeeRIk5r2E7FJQ',			0xFF0000FF], //blue
		['AadastaPinWheel',			'idk',		'Artist, Composer And Charter',				'https://www.youtube.com/channel/UCAlpOaGyOhwTL0inyhJeUQw',		0xFFFFC0CB], //pink
		['Bide',			'idk',		'Composer',				'https://www.youtube.com/channel/UCTSrJmGWIB_LQwVGi7x8niA',		0xFF329932], //green
		['Shifty',			'idk',		'Composer',		'',		0xFFFFFFFF], //white
		['Emperor Yami',			'yami',		'Composer',		'https://www.youtube.com/c/EmperorYami0227',	    0xFF151515], //darker grey
		['Reevrze',			'ree',		'Mania Charter',		'https://www.youtube.com/c/ReeVrze',		0xFFFFA500], //orange
		['ToxicFlame',			'toxic',		'Mania Charter',				'',		0xFFFFFF00], //yellow
		['New Real',			'idk',		'Artist',		'https://www.youtube.com/channel/UCquhSEd3hu5Ssp3n_fpiyEQ',	    0xFF808080], //grey
		['GoddessAwe',			'idk',		'Composer',				'https://www.youtube.com/channel/UCm_J_m6_tbNKHwlV1YBH7cw',		0xFF00ffff], //cyan
		['Requierem Memes (Doom)',			'idk',		'Director, Artist And Made Benoit/Opposition X',		'https://www.youtube.com/channel/UC9HZTyeG2VlkUZZHmJ36qTw',		0xFF808080], //grey
		['Iplux',			'idk',		'Composer',				'https://www.youtube.com/channel/UC7FktV-n-bLIbmuktxPt6nA',		0xFF329932], //green
		['LongestSoloEver',			'idk',		'Composer',		'https://www.youtube.com/c/longestsoloever',		0xFFFF0000], //red
		['Novak_M',			'novak',		'Artist',				'https://www.youtube.com/channel/UCTSJpoLC_edCJV4F8vEyKsQ',		0xFF00ffff], //cyan
		['SpOrb',			'idk',		'Composer',				'https://www.youtube.com/channel/UCLatIUH1TeuM9p41lbvOhXw',		0xFF329932], //green
		['Obyy',			'obyy',		'Artist',				'',		0xFFAA0387], //magenta
		[''],
		['Mod Contributors'],
		['MoldyGH',			'moldy',		'Creator of vs dave and made the original cheating, blocked and unfairness',				'https://www.youtube.com/c/MoldyGH',		0xFF00ffff], //blue
		['BombiPog',			'bombi',		'Concept of Nampi and Nompi',				'https://www.youtube.com/channel/UCZ-e_SXP5_f3cqsHZ2bb05g',		0xFFFFFF00], //yellow
		['SeTre',			'setre',		'Made the main menu music',				'https://www.youtube.com/channel/UCaUhkHMAa4Y6lFUBiWwpFzA',		0xFF800080], //purple
		['Bamber',			'bamber',		'Concept of Benson',				'https://www.youtube.com/channel/UCfZ4oK83Rgp8cohM764LE_g',		0xFFFF0000], //red
		['Landy',			'landy',		'Hellbreaker/Hadephobia BG, M Best Icon',				'https://www.youtube.com/channel/UCKxKSZiO7gS7uCNg9eJBxwQ',		0xFFFFA500], //orange also hi landy
		['EmmanuelYabut',			'EmmanuelYabut',		'Made the sprites and chart of hjoim',				'https://www.youtube.com/watch?v=Z_ewctNuBQE',		0xFFFF0000], //red
		['Saper_Awen',			'saper',		'Existing (sub2saper)',				'https://www.youtube.com/channel/UCwpzd0J-TM8DJ87-Epdnl4g',		0xFFFFA500], //orange
		['Sz',			'idk',		'Cool Guy And Made 1.5 logo',				'https://www.youtube.com/channel/UC8_3muw6KgIwUvFPPUWw7Pw',		0xFF329932], //green
		[''],
		['Psych Engine Team'],
		['Shadow Mario',		'shadowmario',		'Main Programmer of Psych Engine',					'https://twitter.com/Shadow_Mario_',	0xFFFFDD33],
		['RiverOaken',			'riveroaken',		'Main Artist/Animator of Psych Engine',				'https://twitter.com/river_oaken',		0xFFC30085],
		[''],
		['Engine Contributors'],
		['shubs',				'shubs',			'New Input System Programmer',						'https://twitter.com/yoshubs',			0xFF4494E6],
		['PolybiusProxy',		'polybiusproxy',	'.MP4 Video Loader Extension',						'https://twitter.com/polybiusproxy',	0xFFE01F32],
		['gedehari',			'gedehari',			'Chart Editor\'s Sound Waveform base',				'https://twitter.com/gedehari',			0xFFFF9300],
		['Keoiki',				'keoiki',			'Note Splash Animations',							'https://twitter.com/Keoiki_',			0xFFFFFFFF],
		['SandPlanet',			'sandplanet',		'Mascot\'s Owner\nMain Supporter of the Engine',		'https://twitter.com/SandPlanetNG',		0xFFD10616],
		['bubba',				'bubba',		'Guest Composer for "Hot Dilf"',	'https://www.youtube.com/channel/UCxQTnLmv0OAS63yzk9pVfaw',	0xFF61536A],
		[''],
		["Funkin' Crew"],
		['ninjamuffin99',		'ninjamuffin99',	"Programmer of Friday Night Funkin'",				'https://twitter.com/ninja_muffin99',	0xFFF73838],
		['PhantomArcade',		'phantomarcade',	"Animator of Friday Night Funkin'",					'https://twitter.com/PhantomArcade3K',	0xFFFFBB1B],
		['evilsk8r',			'evilsk8r',			"Artist of Friday Night Funkin'",					'https://twitter.com/evilsk8r',			0xFF53E52C],
		['kawaisprite',			'kawaisprite',		"Composer of Friday Night Funkin'",					'https://twitter.com/kawaisprite',		0xFF6475F3]
	];
	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;

	override function create()
	{				
		
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		add(bg);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(0, 70 * i, creditsStuff[i][0], !isSelectable, false);
			optionText.isMenuItem = true;
			optionText.screenCenter(X);
			if(isSelectable) {
				optionText.x -= 70;
			}
			optionText.forceX = optionText.x;
			//optionText.yMult = 90;
			optionText.targetY = i;
			grpOptions.add(optionText);

			if(isSelectable) {
				var icon:AttachedSprite = new AttachedSprite('credits/' + creditsStuff[i][1]);
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
			}
		}

		descText = new FlxText(50, 600, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		add(descText);

		bg.color = creditsStuff[curSelected][4];
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}

		if (controls.BACK)
		{
			if(colorTween != null) {
				colorTween.cancel();
			}
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new ExtrasMenuState());
		}
		if(controls.ACCEPT) {
			CoolUtil.browserLoad(creditsStuff[curSelected][3]);
		}
		super.update(elapsed);
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:Int = creditsStuff[curSelected][4];
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

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}
		descText.text = creditsStuff[curSelected][2];
	}

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}
