
float bpm1 = 80;
float dyn1 = 100;
Instrument i1;
Sheet s1;

boolean run_music1 = false;
Player p1;

void setup_music1() {
  i1 = new Instrument(this, PIANO, bpm1, dyn1);
  s1 = new Sheet(".\\music\\hallelujah.music");
  p1 = new Player(s1, i1);
}

void execute_music1() {
  do {
    p1.playNext(bpm1);
  } while(run_music1);
  println("stopped");
}

void start_music1() {
  thread("execute_music1");
  run_music1 = true;
}

void pause_music1() {
  run_music1 = false;
}

void stop_music1() {
  run_music1 = false;
  s1.reset();
  
}
