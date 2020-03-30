
float bpm2 = 92;
float dyn2 = 100;

Instrument i2_piano1;
Sheet s2_piano1;
Player p2_piano1;

Instrument i2_piano2;
Sheet s2_piano2;
Player p2_piano2;

Instrument i2_voz;
Sheet s2_voz;
Player p2_voz;

boolean run_music2 = false;


void setup_music2() {
  i2_piano1 = new Instrument(this, PIANO, bpm2, dyn2/4);
  i2_piano2 = new Instrument(this, PIANO, bpm2, dyn2/4);
  i2_voz = new Instrument(this, PIANO, bpm2, dyn2);
  
  s2_piano1 = new Sheet(".\\music\\city_of_stars_piano1.music");
  s2_piano2 = new Sheet(".\\music\\city_of_stars_piano2.music");
  s2_voz = new Sheet(".\\music\\city_of_stars_voz.music");
  
  p2_piano1 = new Player(s2_piano1, i2_piano1);
  p2_piano2 = new Player(s2_piano2, i2_piano2);
  p2_voz = new Player(s2_voz, i2_voz);
}

void execute_music2_piano1() {
  do {
    p2_piano1.playNext(bpm2);
  } while(run_music2);
}

void execute_music2_piano2() {
  do {
    p2_piano2.playNext(bpm2);
  } while(run_music2);
}

void execute_music2_voz() {
  do {
    p2_voz.playNext(bpm2);
  } while(run_music2);
}

void start_music2() {
  run_music2 = true;
  thread("execute_music2_piano1");
  thread("execute_music2_piano2");
  thread("execute_music2_voz");
  
}

void pause_music2() {
  run_music2 = false;
}

void stop_music2() {
  run_music2 = false;
  s2_piano1.reset();
  s2_piano2.reset();
  s2_voz.reset();
}
