
/*
 Instalar SoundCipher
 Processing sound
*/

import processing.sound.*;

AudioIn IN;
Amplitude nivel;

// ***********************

int modeMusic = 4;
final int nMusic = 4;

int windUpMode = 0; // 0 - no windup; 1 - voice; 2 - key 

void setup()
{
  size(500, 500, P3D);
  
  // Setup audio input
  IN = new AudioIn(this, 0);
  IN.start();
  nivel = new Amplitude(this);
  nivel.input(IN);
  
  // Setup music 
  setup_music_conversion();
  
  setup_music1();
  setup_music2();
  setup_music3();
  setup_music4();
  
  setup_music_box();
  
  start_music4();
}

void pause_curr_song() {
  if(run_music1 && modeMusic == 1) pause_music1();
  if(run_music2 && modeMusic == 2) pause_music2();
  if(run_music3 && modeMusic == 3) stop_music3();
  if(run_music4 && modeMusic == 4) stop_music4();
}

void draw() {
  if(windUpMode == 0) {
    move_loop_music_box();
  } else {
    float vol = nivel.analyze();
    if(windUpMode == 1 && vol > 0.2) {
      pause_curr_song();
      windUp_music_box();
    } else if(windUpMode == 2 && keyPressed && key == '\n') {
      pause_curr_song();
      windUp_music_box();
    } else {
      if(modeMusic == 1) {
        if(!run_music1 && mb.getSpeed() > 0) start_music1();
        if(mb.getSpeed() <= 0.001) pause_music1();
      }
      if(modeMusic == 2) {
        if(!run_music2 && mb.getSpeed() > 0) start_music2();
        if(mb.getSpeed() <= 0.001) pause_music2();
      }
      if(modeMusic == 3) {
        if(!run_music3 && mb.getSpeed() > 0) start_music3();
        if(mb.getSpeed() <= 0.001) stop_music3();
      }
      if(modeMusic == 4) {
        if(!run_music4 && mb.getSpeed() > 0) start_music4();
        if(mb.getSpeed() <= 0.001) stop_music4();
      }
      move_music_box();
    }
    
  }
  
  textSize(20);
  displayTextHUD(" <=                      Cambiar canción                      =>", 0, height-5, 0);
  
  String msg = "";
  switch(windUpMode) {
    case 1:
      msg = " dar cuerda con la voz.";
      break;
    case 2:
      msg = " dar cuerda con tecla enter.";
      break;
    case 0:
      msg = " en bucle";
      break;
    default:
      break;
  }
  textSize(15);
  displayTextHUD("Modo " + msg + "\nCambiar modo (Espacio)", 0, 20, 0);
  
}

void changeMusic() {
  stop_music1();
  stop_music2();
  stop_music3();
  stop_music4();
  
  switch(modeMusic) {
    case 1:
      start_music1();
      break;
    case 2:
      start_music2();
      break;
    case 3:
      start_music3();
      break;
    case 4:
      start_music4();
      break;
    default:
      println("ERROR: no mode music exists");
      assert false;
  }
}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == LEFT) {
      modeMusic--;
      if(modeMusic < 1) modeMusic = nMusic;
      changeMusic();
    }
    if(keyCode == RIGHT) {
      modeMusic++;
      if(modeMusic > nMusic) modeMusic = 1;
      changeMusic();
    }
  }
  if(key == ' ') {
    windUpMode++;
    windUpMode = windUpMode % 3;
  }
  println(modeMusic);
}

void keyReleased() {
  
}
