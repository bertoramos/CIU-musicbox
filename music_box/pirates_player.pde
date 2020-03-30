
SoundCipher sc3;
float bpm3 = 40;

boolean run_music3;

void setup_music3()
{
  sc3 = new SoundCipher(this);
  sc3.repeat = -1;
}

void start_music3()
{
  sc3.playMidiFile(".\\music\\pirates.mid", bpm3);
  run_music3 = true;
}

void stop_music3()
{
  sc3.stop();
  run_music3 = false;
}
