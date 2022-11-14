package;

// crazy system shit!!!!! (only for windows)
// lordryan wrote this :)

//some of this is new because i edited it for fun --delta
#if windows
import sys.io.File;
import sys.io.Process;
import haxe.io.Bytes;

class CoolSystemStuff
{
	public static function getUsername():String
	{
		// uhh this one is self explanatory
		return Sys.getEnv("USERNAME");
	}

	public static function getUserPath():String
	{
		// this one is also self explantory
		return Sys.getEnv("USERPROFILE");
	}

	public static function getTempPath():String
	{
		// gets appdata temp folder lol
		return Sys.getEnv("TEMP");
	}

	public static function getGamePath():String
		{
			// gets cur folder lol
			return Sys.getCwd();
		}
}
#end