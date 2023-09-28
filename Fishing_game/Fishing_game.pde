/* Fishing game CS171 project
 22311213  Muhammad Usman Akhtar  1st year
 This is a game which is meant to have more levels but i had only created a demo of the game which icluded the first level if i were to continue this as a game i would have added in more levels containing different backgrounds, different and more random 
 speeds and fish and trash and maybe customizable cosmetics for the player. the possibilities of what i can add are endless.
 all images were found from google but i had altered thm to my liking:
 
 Water = i had made the water deeper and had gotten rid of clouds in the sky   
         source:  https://www.alamy.com/water-ocean-sea-landscape-with-sky-and-clouds-vector-game-style-illustration-background-for-games-image365539908.html
 
 barrel = for the barrel i just made it transparent on the background and just resized it to my liking     
          source :  https://www.vecteezy.com/vector-art/2511546-barrel-for-wine-or-beer-wooden-barrel-storage-of-alcohol-cartoon-style
 
 player = for the player i had gotten an image of a cartoon character from google but i had edited it by removing its head and it also had a fishing rod with it which made it perfect for me but i removes the hook and fishing line,
           along with tht i removed the head and replaced it with a trash bag and edited the trash bag so that it would look like it was looking down at the magnet.
           player Source :  https://www.istockphoto.com/vector/young-fisherman-seating-with-fish-rod-pulls-out-the-caught-fish-caughted-fish-gm1272479811-374741615?phrase=cartoon%20fishing%20pole
           cardboard trash bag:  https://nickelodeon.fandom.com/wiki/Bucky_McBadbat
           
 Tin can= i had just got the image from google once again and just made the background transparent  
           source: https://www.clipartmax.com/middle/m2i8H7G6Z5N4m2Z5_bacteria-cell-tin-can-tin-can-cartoon-png/
           
 All fish = i got a image of multiple varients of fish and used that and only took 4 fishes from the image and just changed the background and resized the image
            source:  https://www.pngwing.com/en/free-png-bkouv
            
 magnet = i got a magnet img and removed the background and resized it
          source:   https://www.nicepng.com/ourpic/u2r5a9r5t4t4w7o0_magnet-images-free-horseshoe-magnet-clipart/
          
  code = i had onlt got the timer count from the internet which was all got from the processing 4 website, i had gotten the rest of the code from my knowledge of computer science as i had done it in LC and i had self taught myself java before.
         for other help i had went back to previous labs we had done, i had only used lab 3 which was the sprite game lab useful and i had taken code from that to help me out with the vertex of a img and collision boxes and how they worked.
         Source: https://processing.org/reference
 */




PImage barrel, water, boat, player, fish1, fish2, fish4, fish5, TinCan, magnet;  // Variable to store information about an image
// assigning values to variables
int  player_x =240, player_y =50;
int fish1_x, fish1_y;
int fish2_x, fish2_y;
int fish4_x, fish4_y;
int fish5_x, fish5_y;
int trash_x, trash_y;
int trash2_x, trash2_y;
int FishRod_x = 290, FishRod_y = 125;
int magnet_x = 280, magnet_y = 200;
int score=0, preScore =100, FishDead = 0;
int min = 300;
int max = 520;
int startTime, startTime1;
int elapsedTime,elapsedTime1;
int num1=20000, num2 = 18000, num3 = 17000, num4 = 15000, num5 = 18000, num6 = 25000, num7 = -8;
float speed1= 1.0f;
float speed2 = 1.5f;
int FishLine_x = 100, FishLine_y = 100;
int quit=0;
float Time,Time1;




void setup()
{
  surface.setTitle("CS171 Project");

  //load all images into GPU, and resize images to be smaller
  size(800, 600, P2D);
  player = loadImage("player.png");
  player.resize(270, 270);

  boat = loadImage("boat.png");

  water = loadImage("Water.png");
  water.resize(800, 600);

  barrel = loadImage("barrel.png");
  barrel.resize(100, 100);

  fish1 = loadImage("Fish1.png");
  fish1.resize(70, 70);
  fish2 = loadImage("Fish2.png");
  fish2.resize(70, 70);
  fish4 = loadImage("Fish4.png");
  fish4.resize(70, 70);
  fish5 = loadImage("Fish5.png");
  fish5.resize(70, 70);
  TinCan = loadImage("TinCan.png");
  TinCan.resize(70, 70);
  magnet = loadImage("magnet.png");
  magnet.resize(50, 50);


  trash_x=-500; // Choose x starting position
  trash_y = int(random(min, max + 2));// choose y starting postition

  fish1_x=-170;
  fish1_y=int(random(min, max + 1));

  fish4_x=850;
  fish4_y=int(random(min, max ));

  fish5_x=-300;
  fish5_y=int(random(min, max -1));

  fish2_x=1050;
  fish2_y=int(random(min, max -2));

  trash2_x=-400;
  trash2_y = int(random(min, max +3 ));




  textureMode(NORMAL); //Texture Top right (0,0) to (1,1)
  blendMode(BLEND); // Mix a new image and blend it with the other one behind it
  noStroke(); // Does not draw a line around objects


  startTime = millis(); // defining startTime as milliseconds
}
void draw()
{
  if (quit ==1)
  {
  } else
  {
    Time = (millis() - startTime1) / 1000.0; // count time from start till the end of game in milliseconds and then convert them into seconds i done it this way so people can have some competition against each other.
  }
  elapsedTime = millis() - startTime;  // count upwards for timer count used as a delay without delaying all the code.
  // printing out the images
  background(water);
  image(player, player_x, player_y);
  image(boat, 80, -50);

  trash(); // calling class void trash();
  trash_x += speed1; // Make "trash" move from left to right on the screen (base speed of 1.0 and then increases)
  if (trash_x>799) // If x value of the trash in more than the sie of the screen
  {
    if (elapsedTime > num1) // delay timer count
    {
      score-=5;        // take away score
      num1 = num1 + 18000;     // add more to the delay timer count to make it more random
      trash_y = int(random(min, max + 2));// Restart the process of the print
      trash_x=-500;
      if (speed1 == 4) // see if speed is equal to 4 if not increase speed  Lvl 1 has a max speed of 4 pixels at a time
      {
      } else
      {
        speed1+=0.05;
        speed2+=0.05;
      }
    }
  }

  fish1();// calling class void fish1();
  fish1_x+=speed2;
  if (fish1_x>799)
  {
    if (elapsedTime > num2)
    {
      num2 = num2 + 16000; // increase by diffrent value to make it even more random
      fish1_y = int(random(min, max + 1)); // restart the print process
      fish1_x=-1700;
    }
  }
  fish4(); // calling class void fish4();
  fish4_x-=speed2;
  if (fish4_x<-50) // If x value is less than the left side because fish is going from right to left
  {
    if (elapsedTime > num3)
    {
      num3 = num3 + 15000; // more random
      fish4_y = int(random(min, max));// Restart the process
      fish4_x=850;
    }
  }
  fish5(); // calling class void fish4();
  fish5_x+=speed2;
  if (fish5_x>799)
  {
    if (elapsedTime > num4)
    {
      num4 = num4 + 20000;
      fish5_y = int(random(min, max -1));// Restart the process
      fish5_x=-300;
    }
  }
  fish2(); // calling class void fish4();
  fish2_x-=speed2;
  if (fish2_x<-50)
  {
    if (elapsedTime > num5)
    {
      num5 = num5 + 12000;
      fish2_y = int(random(min, max -2));// Restart the process
      fish2_x=1050;
    }
  }
  trash2(); // calling class void trash();
  trash2_x += speed1;
  if (trash2_x>799)
  {
    if (elapsedTime > num6)
    {
      score-=5;
      num6 = num6 + 25000;
      trash2_y = int(random(min, max + 3));// Restart the process
      trash2_x=-400;
      if (speed1 == 4)
      {
      } else
      {
        speed1+=0.05;
        speed2+=0.05;
      }
    }
  }
  magnet(); // calling class void magnet()
  /*
User input for the magnet which is UP and DOWN arrows on the keyboard and has different speed whcih is slow enough for precision and fast enought for later on in the game
   Limited y values for magnet so it has a barrier of min y=200 and max of y=650
   */
  if (keyPressed == true)
  {
    if (keyCode == UP)
    {
      magnet_y-=8;
      if (magnet_y <200)
      {
        magnet_y = 200;
      }
    }

    if (keyCode == DOWN)
    {
      magnet_y+=8;
      if (magnet_y >560)
      {
        magnet_y = 560;
      }
    }
    if ((trash_y>200)&&(trash_y<600)) // If trash is on same level as magnet y axis
    {
      if ((trash_y>200)&&(trash_y<600) && dist(magnet_x, magnet_y, trash_x, trash_y) < 50)  // And if trash is near magnet according to pixels and added in && to make it more precise. its < 50 because the image is 100x100 this will make it so that its precise
      {
        score+= 20; // Increase score by 20 if caught trash

        trash_y=int(random(min, max + 1));// Restart the process
        trash_x=-270;
        if ((score > preScore)&&(score < 800)) // before the speed would increase if u missed the trash this time if u hit it there is a certain score where it would increase the speed again for this its 100 and goes on again until it reaches 800
        {
          if (speed1 == 4)
          {
          } else
          {
            preScore+= 100;
            speed1+=0.05;
            speed2+=0.05;
          }
        }
      }
    }
    // same code as above but pixels are different according to img and trash2 is placed instead of trash
    if ((trash2_y>200)&&(trash2_y<600))
    {
      if ((trash2_y>200)&&(trash2_y<600) && dist(magnet_x, magnet_y, trash2_x, trash2_y) < 35) // image is 70x70 which <35 will also make it more precise
      {
        score+= 20;
        trash2_x=-500;
        trash2_y=int(random(min, max + 1));
        if ((score > preScore)&&(score < 800))
        {
          if (speed1 == 4)
          {
          } else
          {
            preScore+= 100;
            speed1+=0.05;
            speed2+=0.05;
          }
        }
      }
    }
    //Fish 1
    if ((fish1_y>200)&&(fish1_y<600))
    {
      if ((fish1_y>200)&&(fish1_y<600) && dist(magnet_x, magnet_y, fish1_x, fish1_y) < 35)
      {
        score-= 5;
        fish1_x=-2700;
        fish1_y=int(random(min, max + 1));
        FishDead+=1;
        if ((score > preScore)&&(score < 800))
        {
          if (speed1 == 4)
          {
          } else
          {
            preScore+= 100;
            speed1+=0.05;
            speed2+=0.05;
          }
        }
      }
    }

    //Fish 2
    if ((fish2_y>200)&&(fish2_y<600))
    {
      if ((fish2_y>200)&&(fish2_y<600) && dist(magnet_x, magnet_y, fish2_x, fish2_y) < 35)
      {
        score-= 5;
        fish2_x=-2050;
        fish2_y=int(random(min, max + 1));
        FishDead+=1;
        if ((score > preScore)&&(score < 800))
        {
          if (speed1 == 4)
          {
          } else
          {
            preScore+= 100;
            speed1+=0.05;
            speed2+=0.05;
          }
        }
      }
    }

    //Fish4
    if ((fish4_y>200)&&(fish4_y<600))
    {
      if ((fish4_y>200)&&(fish4_y<600) && dist(magnet_x, magnet_y, fish4_x, fish4_y) < 35)
      {
        score-= 5;
        fish4_x=950;
        fish4_y=int(random(min, max + 1));
        FishDead+=1;
        if ((score > preScore)&&(score < 800))
        {
          if (speed1 == 4)
          {
          } else
          {
            preScore+= 100;
            speed1+=0.05;
            speed2+=0.05;
          }
        }
      }
    }

    //Fish 5
    if ((fish5_y>200)&&(fish5_y<600))
    {
      if ((fish5_y>200)&&(fish5_y<600) && dist(magnet_x, magnet_y, fish5_x, fish5_y) < 35)
      {
        score-= 5;
        fish5_x=-400;
        fish5_y=int(random(min, max + 1));
        FishDead+=1;
        if ((score > preScore)&&(score < 800))
        {
          if (speed1 == 4)
          {
          } else
          {
            preScore+= 100;
            speed1+=0.05;
            speed2+=0.05;
          }
        }
      }
    }
  }




// when magnet stationary it still detects the obstacles and fish and counts it
  if ((trash_y>200)&&(trash_y<600)) // If trash is on same level as magnet y axis
  {
    if ((trash_y>200)&&(trash_y<600) && dist(magnet_x, magnet_y, trash_x, trash_y) < 50)  // And if trash is near magnet according to pixels and added in && to make it more precise.
    {
      score+= 20; // Increase score by 20 if caught trash

      trash_y=int(random(min, max + 1));// Restart the process
      trash_x=-270;
      if ((score > preScore)&&(score < 800)) // before the speed would increase if u missed the trash this time if u hit it there is a certain score where it would increase the speed again for this its 100 and goes on again until it reaches 800
      {
        if (speed1 == 4)
        {
        } else
        {
          preScore+= 100;
          speed1+=0.05;
          speed2+=0.05;
        }
      }
    }
  }
  // same code as above but pixels are different according to image,trash2 is replaced instead of trash
  if ((trash2_y>200)&&(trash2_y<600))
  {
    if ((trash2_y>200)&&(trash2_y<600) && dist(magnet_x, magnet_y, trash2_x, trash2_y) < 35)
    {
      score+= 20;
      trash2_x=-500;
      trash2_y=int(random(min, max + 1));
      if ((score > preScore)&&(score < 800))
      {
        if (speed1 == 4)
        {
        } else
        {
          preScore+= 100;
          speed1+=0.05;
          speed2+=0.05;
        }
      }
    }
  }
  //Fish 1
  if ((fish1_y>200)&&(fish1_y<600))
  {
    if ((fish1_y>200)&&(fish1_y<600) && dist(magnet_x, magnet_y, fish1_x, fish1_y) < 35)
    {
      score-= 5;
      fish1_x=-2700;
      fish1_y=int(random(min, max + 1));
      FishDead+=1;
      if ((score > preScore)&&(score < 800))
      {
        if (speed1 == 4)
        {
        } else
        {
          preScore+= 100;
          speed1+=0.05;
          speed2+=0.05;
        }
      }
    }
  }

  //Fish 2
  if ((fish2_y>200)&&(fish2_y<600))
  {
    if ((fish2_y>200)&&(fish2_y<600) && dist(magnet_x, magnet_y, fish2_x, fish2_y) < 35)
    {
      score-= 5;
      fish2_x=-2050;
      fish2_y=int(random(min, max + 1));
      FishDead+=1;
      if ((score > preScore)&&(score < 800))
      {
        if (speed1 == 4)
        {
        } else
        {
          preScore+= 100;
          speed1+=0.05;
          speed2+=0.05;
        }
      }
    }
  }

  //Fish4
  if ((fish4_y>200)&&(fish4_y<600))
  {
    if ((fish4_y>200)&&(fish4_y<600) && dist(magnet_x, magnet_y, fish4_x, fish4_y) < 35)
    {
      score-= 5;
      fish4_x=950;
      fish4_y=int(random(min, max + 1));
      FishDead+=1;
      if ((score > preScore)&&(score < 800))
      {
        if (speed1 == 4)
        {
        } else
        {
          preScore+= 100;
          speed1+=0.05;
          speed2+=0.05;
        }
      }
    }
  }

  //Fish 5
  if ((fish5_y>200)&&(fish5_y<600))
  {
    if ((fish5_y>200)&&(fish5_y<600) && dist(magnet_x, magnet_y, fish5_x, fish5_y) < 35)
    {
      score-= 5;
      fish5_x=-400;
      fish5_y=int(random(min, max + 1));
      FishDead+=1;
      if ((score > preScore)&&(score < 800))
      {
        if (speed1 == 4)
        {
        } else
        {
          preScore+= 100;
          speed1+=0.05;
          speed2+=0.05;
        }
      }
    }
  }


  textSize(18); // text size
  fill(255, 255, 255);// colour black
  stroke(98); // fishing line colour and draws line
  line(300, 100, magnet_x+25, magnet_y+5); // draws fishing ine from fixed point till the magnet to give it that moving fishing line effect.
  noStroke(); // undraws line so that theres no line around any of the images moving
  if (quit == 1)
  {  
  }
  else
  {
    text("Score: "+ score+ "       Fish Killed: "+ FishDead+"       Time: "+ Time, 450, 20); // score counter
  }
  if (quit == 1) // end game screen
  {
    startTime1 = 60; // make time go down in seconds
    Time1 = (second() - startTime1); // another timer counter that i messed aroung with
    
  
    if (score >= 1000)
    {
     textSize(20);
    text("Congratulations on completing the first level of game, Thanks for saving the planet :)", 50, 70);
    text("Score: " + score, 50, 100);
    text("Time: " +Time+ " Seconds", 50, 125);
    text("Fish Killed: " +FishDead, 50, 150);
    text("MORE LEVELS COMING SOON", 500, 120);
    }
    else if(score <= -30)
    {
    textSize(20);
    text("You Lost, The planet still has trash in the sea and the fish are not happy :(", 50, 70);
    text("Score: " + score, 50, 100);
    text("Time: " +Time+ " Seconds", 50, 125);
    text("Fish Killed: " +FishDead, 50, 150);
    text("MORE LEVELS COMING SOON", 500, 120);
    }
    
    if (Time1 > num7) // delay till screen closes 
    {
      exit();
    }
    magnet_y=200;
    keyPressed = false; // disables user input
    
  }
  if ((score >= 1000)||(score <= -30)) // conditions for end game if max score and min score
  {
    quit = 1;
  }
}

// All are void classes to make code tidy above all void classes contain push matrix and vertex which makes a box of a certain size that moves and then prints the img in that box.
void trash()
{
  pushMatrix(); // Store current location of origin (0,0)
  translate(trash_x, trash_y); // Change origin (0,0) for drawing to (trash_x,trash_y)
  beginShape(); // Open graphics pipeline
  texture(barrel); // Tell GPU to use drop to texture the polygon
  vertex(0, 0, 0, 0); // custom box dimensions chosen to fit image pixels
  vertex(100, 0, 1, 0);
  vertex (100, 100, 1, 1);
  vertex(0, 100, 0, 1);
  endShape(CLOSE); // Tell GPU you have loaded shape into memory.
  popMatrix();
}
void magnet()
{
  pushMatrix(); 
  translate(magnet_x, magnet_y); 
  beginShape(); 
  texture(magnet); 
  vertex(0, 0, 0, 0);
  vertex(50, 0, 1, 0);
  vertex (50, 50, 1, 1);
  vertex(0, 50, 0, 1);
  endShape(CLOSE);
  popMatrix();
}
void fish1()
{
  pushMatrix(); 
  translate(fish1_x, fish1_y); 
  beginShape(); 
  texture(fish1);
  vertex(0, 0, 0, 0);
  vertex(70, 0, 1, 0);
  vertex (70, 70, 1, 1);
  vertex(0, 70, 0, 1);
  endShape(CLOSE);
  popMatrix();
}

void fish4()
{
  pushMatrix(); 
  translate(fish4_x, fish4_y); 
  beginShape(); 
  texture(fish4); 
  vertex(0, 0, 0, 0);
  vertex(70, 0, 1, 0);
  vertex (70, 70, 1, 1);
  vertex(0, 70, 0, 1);
  endShape(CLOSE); 
  popMatrix();
}

void fish5()
{
  pushMatrix(); 
  translate(fish5_x, fish5_y); 
  beginShape(); 
  texture(fish5); 
  vertex(0, 0, 0, 0);
  vertex(70, 0, 1, 0);
  vertex (70, 70, 1, 1);
  vertex(0, 70, 0, 1);
  endShape(CLOSE); 
  popMatrix();
}
void fish2()
{
  pushMatrix(); 
  translate(fish2_x, fish2_y); 
  beginShape(); 
  texture(fish2); 
  vertex(0, 0, 0, 0);
  vertex(70, 0, 1, 0);
  vertex (70, 70, 1, 1);
  vertex(0, 70, 0, 1);
  endShape(CLOSE); 
  popMatrix();
}

void trash2()
{
  pushMatrix(); 
  translate(trash2_x, trash2_y); 
  beginShape(); 
  texture(TinCan); 
  vertex(0, 0, 0, 0);
  vertex(70, 0, 1, 0);
  vertex (70, 70, 1, 1);
  vertex(0, 70, 0, 1);
  endShape(CLOSE); 
  popMatrix();
}
