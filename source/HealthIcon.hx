package;

import flixel.FlxSprite;
import openfl.utils.Assets as OpenFlAssets;

using StringTools;

class HealthIcon extends FlxSprite
{
	public var sprTracker:FlxSprite;
	private var isOldIcon:Bool = false;
	private var isPlayer:Bool = false;
	private var char:String = '';
	public var canBounce:Bool = false;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		isOldIcon = (char == 'bf-old');
		this.isPlayer = isPlayer;
		changeIcon(char);
		scrollFactor.set();
	}
	public function bounce()
	{
		this.scale.y - 10;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}

	public function swapOldIcon() {
		if(isOldIcon = !isOldIcon) changeIcon('bf-old');
		else changeIcon('bf');
	}

	public function changeIcon(char:String) {
		if(this.char != char) {
			var name:String = 'icons/' + char;
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-' + char; //Older versions of psych engine's support
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-face'; //Prevents crash from missing icon
			var file:Dynamic = Paths.image(name);

			loadGraphic(file, true, 150, 150);
			animation.add(char, [0, 1], 0, false, isPlayer);
			animation.play(char);
			this.char = char;

			antialiasing = ClientPrefs.globalAntialiasing;
			if(char.endsWith('-pixel')) {
				antialiasing = false;
			}
		}
	}

	public function getCharacter():String {
		return char;
	}
}

/*

WTF CYCLO HOW THE FUCK DO YOU KNOW HOW TO COME IN STATES


becuz i can -cyclo

°                                                                                                                                                                                                       
°                                                                                                                                                                                                       
°                                                                                                                                                                                                       
°                                                                                                                                       ..°°°**ooooooooo**°°..                                          
°                                                                                                                               .°°**oOO###@@@@@@@@@@@@@@@@###OOo*.                                     
°                                                                                                                        .°°*oOO##@@@@@@@@@################@@@@@@@#Oo°.                                 
°                                                                                        ........                  .°*oOO##@@@@@@########OOOOOOOOOOOOOOOOOOOO#####@@@#O*.                               
°                                                                      ...°°**oooOOOOO###############OOOOooo****oOO##@@@@@@#####OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO#######@#O*°.                            
°                                                              ..°*ooOO###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@######OOOOOOOOOOOOOOOOOOOO###############@@@@@@@@@@@@###Oo*°.                      
°                                                       .°°*oOO##@@@@@@@@@######OOOOOOOOOOOOOOOOOOO#########@@@######OOOOOOOOOOOOOOOOOOO#######@@@@@@@@@@@@@@@############@@@@@@##O*.                   
°                                                  .°*oO##@@@@@@######OOOOoooooooo***********ooOO#####@@@######OOOOOOOOOOOOOOOOOOO######@@@@@@@@@@@@###OOo***°°..........°**oO#@@@@@#O°.                
°                                             .°*oO##@@@@@####OOOoooooo*******oooooo**ooooOO###@@@@@@#####OOOOOOOOOOOOOOOOOO######@@@@@@##OOo***oo*°°.                        .*O#@#@@#O°               
°                                         .°*O##@@@@@###OOooooo******oooooooooo***oooOO###@@@@@#####OOOOOOOOOOOOOOOOOOOO#####@@@@@##Oo**°.                                       °o#@##@#o.             
°                                      °*O##@@@@####OOooo*****ooooooooooooo***oooOO###@@@@#####OOOOOOOOOOOOOOOOOOOO#####@@@@@##Oo*°.                                               °O###@#o.            
°                                  .°oO#@@@@###OOooo****ooooooooooooooo***oooO###@@@@####OOOOOOOOOOOOOOOOOOOOOO#####@@@@@#Oo*°.                                                     .O#@###*            
°                               .*o##@@@###OOoo****ooooooooooooooooo**oooO###@@@@####OOOOOOOOOOOOOOOOOOOOOO#####@@@@##O*°.                                                           o#@###o.           
°                            .°o##@@####Oooo**ooooooooooooooooooo**ooOO##@@@@@####OOOOOOOOOOOOOOOOOOOOOO#####@@@@#O*°.                                                              °O#@###*            
°                          .*O#@@####OOoo**ooooooooooooooooooo**ooOO##@@@@####OOOOOOOOOOOOOOOOOOOOOOO####@@@@##o*.                                                                 °O###@#o.            
°                       .°o##@@@##OOoo**ooooooooooooooooooo**ooOO##@@@@###OOOOOOOOOOOOOOOOOOOOOOOOO#####@@#Oo°.                                                                  .*#@##@#o.             
°                     .*O#@@####Ooo**ooooooooooooooooooo**ooO##@@@@####OOOOOOOOOOOOOOOOOOOOOOOOOO####@@#Oo°                                                                    .*O###@#O*               
°                   .*O#@####Ooo***oooooooooooooooooo**ooO##@@@@###OOOOOOOOOOOOOOOOOOOOOOOOOOOO##@#@@#O*.                                                                    °oO#@@@@#*.                
°                 .*O######Ooo*oooooooooooooooooooo*ooOO##@@@####OOOOOOOOOOOOOOOOOOOOOOOOOOOO##@#@@#O°                                                                   .*oO#@@@@#O*.                  
°               .*O######Ooo*ooooooooooooooooooo**ooO##@@@###OOOOOOOOOOOOOOOOOOOOOOOOOOOOOO####@@#o°                                                                 .°oO#@@@@@##o°.                    
.              °O#@####Ooooooooooooooooooooooo*ooO##@@@@###OOOOOOOOOOOOOOOOOOOOOOOOOOOOOO#####@#O°                                                               .*oO#@@@@###Oo°.                       
°            .o#@####Ooo*oooooooooooooooooo**oOO#@@@@###OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO##@#@#O*                                                            .*oO##@@@@#####O*                           
°          .*O######oo*oooooooooooooooooo*ooO##@@@@##OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO####@#o.                                                         .*O##@@@@@#####@####O*                          
°         .o######Ooooooooooooooooooooo*ooO##@#####OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO######o.                                                        .o#@@@@########O*o####@#o.                        
°        .O######Oo*ooooooooooooooooo*ooO##@#####OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO##@###O.                                                         .o############O°  *O#####o.                       
°       *O#####Oooooooooooooooooooo**oO##@#####OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO##@##O°                                          .°*ooooo°        .o##########o.    °o#####O.                      
°     .o#@####Oo*oooooooooooooooooooO##@@####OOOOOOOOOOOOOOOOOOO##########OOOOOOOOOO##@@##o.                                      °*oO#@@@@@@@#o.       .o########o.      .o#####O°                     
°    .o######Oooooooooooooooooo**oO##@@####OOOOOOOOOOOOO#######@@@@@@@@@@@@#####OOOO##@###*                                    .*O#@@@##@@@@####o.       .O######o.        .o#####O°                    
°    *######OooooooooooooooooooooO#@#####OOOOOOOO#######@@@@@@@#####O#####@@@@@#######@@##*                                  °o#@@####@##o*O#####O°       °O#@###*          .o#####O.                   
°   *######OoooooooooooooooooooO#@@#@##OOOOO#####@@@@@@@#OOo**°....     ..°*O#@@@@@####@##o                               .*O#@####@@#O*.  .o######*       *#####O.          .o#####o.                  
°  °O#####OooooooooooooooooooO##@####OOO####@@@@@@##Oo*°.                    .*o##@##@@@##O.                            °o##@####@#Oo°       *O###@#o°     °O####O°           .O#####o                  
° .o######ooooooooooooooo*oo##@#####OO#######@@#o°..                            .*O#@##@@##o.                        .*O#@@###@##o°.          °o#@####o*...*O####O°            °O####O°                 
° *######Oo*oooooooooo**ooO#@@#@#######@@@@@@#O°                                  .*O#@@@@##*                     .°o#@@###@@#O*.               °O#@@@@@######@@#o.            .*##@##o.                
°.O#####OoooooooooooooooO#@@@@@@@##@@@@##OOo°.                                      .o###@#@#o.                .°o##@@##@@#Oo°                    °oO###@@@@@##O°.              °O#####*                
°.######Oooooooooooo*oo##@##@@###@@@#O*.                                              *#####@@#O*.          .*o#@@@######o°.                         .°**ooo*°.                  *#####O.               
°.#####OooooooooooooooO####@##@@##o*.                                                  *##@@##@@##Ooo**oooOO#@@@#######O*°....                                                   °O#####°               
°.#####OooooooooooooooO##@##@@#O*.                                                     .o###@###@@@@@@@@@@@@@######@@#########OOOo*°.                                            .o#####o               
°.#####Oooooooooooo*ooO###@@#O°                                                        .o#@@@################@@@@@@@##@@@@@@@@@@@@@##O*°                                          *#####o.              
°.#####oooooooooo*ooO#@@#@#O°                                                           o######O######@@@#@#########################@@@#O*.                                       °O####O°              
°.#####ooooooooo*oO##@#@#O*                                                            °O#@@@@##@@######################################@##o.                                     °O####O°              
°.#####ooooooooooO######o.                                                           .o##@@@@@############################################@#O*.                                   °O#####°              
°.#####ooooooooO######o°                                                           .*O@@#@@@################################################@#o°                                  °O####O°              
°.#####oooooooO##@@@#o.                                                          .*O#@##@###################@@@@@@@@@@@@@@@@@@@@@##############O*                                 °O####O.              
°.#@###ooo*ooO#####O*                                                        °*oO#@@##@@############@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@############o.                               *#####O***oooOOOOOOOoo
°.#####OooooO#@###O°                                                    .°*oO#@@@@@#@@############@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@###########o.                           .°*O######@@@@@@@@@@@@@@@
°.#####OoooO#####O°                                                 °*OO##@@@@@@#O##@@##########@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@##########o.                     .°*oO####@@@@@@@####OOOOOOOOO#
°.######ooO#@@@##*                                                 .O@@@@@##OOo*.°O############@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@##########o.                .*oO##@@@@@@###OOo**°...        ..
°.O#####OoO#@###o.                                                  °O#@####O°   *#############@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#########@O°            °*O##@@@@##Oo*°°..                   
° o######O##@##O°                                                     °O#@####o°.o#############@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#######################@#*        .*O##@@@##O*°.                        .*
° °O##@@#######O.                                         °*o*°         °O#@#@#OoO#############@@@@@@@@@@@@@@@@@@@@@@@@@@###############################o.    °o#@@####o*.                           *O#
°  *####@@@#@@#o.                                        o#@@@#O°         *####################@@@@@@@@@@@@@@@@@@@@@@@@@################################@O°.*O#@##@#O*.                            °O###
°  .o###@@@@@##*                                        .O####@@#*         °O#######@##########@@@@@@@@@@@@@@@@@@@@@@@@##################################@#O#@##@#o°                             .o#####
°   .o###@##@##*                                       .o#######@#o.        *########@###########@@@@@@@@@@@@@@@@@@@@@@##########@@@@@#####################@####o°                             .*O#####O
°    .o####@@##°                                       *####@@@####o.       °O####@@@#############@@@@@@@@@@@@@@@@@@@@@#########O*°oO##@@@####################O°. ....°°°°°.....              °O#@#@@#o°
°     °O#######°                                      *######oO#####O°      °O######################@@@@@@@@@@@@@@@@@@##########*    .°*O#@@@#################OOOO##############OOOoo*°°°....°O@@###o°..
°      °O###@##*                                     °O#####* .o#@####*    .o#####o°o#@###############@@@@@@@@@@@@@@@@##########*       .°oO#@################@@@@@@@@@@@@@@@@@@@@@@@@@#############oo**
°       °O#@@@#O.                                   °O#####o.   *#@####o°°oO###@#O° .*#@@###############@@@@@@@@@@@@@@#########O°           °O#############@@@#OOOo*****°°***oooOOO######@@@@@###@@@@@@#
°        °O#####°                                  *######*.     °O#@@@@##@@@@#Oo.    °o#@@###############@@@@@@@@@@@@#########o.        .°*oO##@@@@@@@##@##O*°.                   ..°oO#####@@@@######@
°         o#####O.                               °o####@#*         °oO######Oo°.        °o##@###############@@@@@@@@@@#########*      .*oO#@@@@@##OOO#####o.                     .°*oO###@@@@##Oo**°°**o
°         °O#####o.                            °o####@#o°             .°°°°.              .*O#@@@#############@@@@@@@#########O°   .*o##@@@@##o*°.   .°°°.                    .*oO#@@@@@##Ooo*°°........
°          *#@####*                         .*O#@@@@#O°                                      °*O#@@################@@#########O. °o##@@@##O*°.                            .*oO##@@@@##Oo*°°....°°°°°°°°°
°           *O#####o.                    .°oO#@@@@#o°                                           .*O##@@#######################OoO#@####O*°                            .°oO##@@@@##Oo*°°...°°°°°°°°°°°°°°
°            °O#@###O*.               °*o##@@@@#O*.                                                .°oO#@@@#####################@####o°                           .°*O##@@@@##Oo*°°...°°°°°°°°°°°°°°°°°°
°             .o#@@#@#Oo*°...   ..°*oO#@@@@@#Oo°.                                                      .*oO#@@@####################o°                         .°*o##@@@@##Oo*°°...°°°°°°°°°°°°°°°°°°°°°°
°               °oO#@@@@@#####OO###@@@@@##O*°                                                             .°*oO#@@@@#############O°                       .°*O##@@@@@##Oo*°....°°°°°°°°°°°°°°°°°°°°°°°°°
°                 .°oO##@@@@@@@@@@#####O*.                                                                    .°*oO##@@@@@@######*                       °O#@@@####Oo*°°...°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
°                     .°°*oO#@@######O*.                                                                           .°*ooO#######O°                       *##@#####O*°...°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
°                          .°O#@@@###O*°                                                                                 .o#####O.                        .*O##@@###Oo*°°..°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
°                             °*O#@@@@@#Oo°.                                                                              *#####O.                           .*o##@@@@##o*°..°°°°°°°°°°°°°°°°°°°°°°°°°°°
°                                .*O##@@@@##o*°.                                                                          °O#####°                              .°oO#@@@@#Oo°°..°°°°°°°°°°°°°°°°°°°°°°°°
°                                   .°oO#@@@@@##O*°.                                                                      .o#####O.                                .°o##@#@##Oo°..°°°°°°°°°°°°°°°°°°°°°°
°                                       °*oO#@@@@@##Oo*°.                                                                  .o#####O°                                  .*O#@@@@#Oo°..°°°°°°°°°°°°°°°°°°°°
°                                          .°*oO##@@@@@##Oo*°°.                                                           ..*O######o.                                   °o####@#O*°.°°°°°°°°°°°°°°°°°°°
°                                               .°*oO##@@@@@@##OOo*°°...                                          ..°°*ooO#####@@@####o°.                                  °O###@@#O*°.°°°°°°°°°°°°°°°°°
°                                                    .°*oOO##@@@@@@@####OOoo**°°°°.......         ......°°°°**ooOO####@@@@@@@##OO##@@@@##o*°.                            .°o####@#@@#o°.°°°°°°°°°°°°°°°°
°                                                          .°*oOO###@@@@@@@@@@@############OOOO###########@@@@@@@@@@@####Ooo*..  .*o##@#@@@##OOo*°°..                .°*oO#@@#######@#O*.°°°°°°°°°°°°°°°
°                                                                ..°°*ooOOO##########@@@@@@@@@@@@@@@@@#########OOOo**°°..           .°o######@@@@@###OOOooooooooooOOO##@@@#####OO######O*°°°°°°°°°°°°°°°


*/