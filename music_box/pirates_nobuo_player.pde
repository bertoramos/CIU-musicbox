
SoundCipher sc4;
float bpm4 = 120;

boolean run_music4;

void setup_music4()
{
  sc4 = new SoundCipher(this);
  sc4.repeat = -1;
}

void start_music4()
{
  sc4.playMidiFile(".\\music\\pirates_nobuo.mid", bpm4);
  run_music4 = true;
}

void stop_music4()
{
  sc4.stop();
  run_music4 = false;
}
