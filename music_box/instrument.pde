
int PIANO = 0;

import arb.soundcipher.*;

class Instrument
{
  
  private SoundCipher sc;
  public final float max_bpm;
  public final float dynamic;
  
  /**
   *
   * bmp : beats per minute 1/bpm = crotchet 
   *
   */
  Instrument(PApplet applet, int instrument, float max_bpm, float dynamic)
  {
    this.sc = new SoundCipher(applet);
    this.sc.instrument = instrument;
    this.max_bpm = max_bpm;
    this.dynamic = dynamic;
  }
  
  void waitNote(float dur)
  {
    //delay((int)(dur*1000));
    float start = millis();
    while(dur*1000.0 > (millis()-start))
    {}
  }
  
  float play(float bpm, String[] notes, String symbol, boolean dot)
  {
    float[] pitches = new float[notes.length];
    for(int i = 0; i < notes.length; i++) pitches[i] = (float) note2Midi(notes[i]);
    float dur = symbol2Time(symbol, min(bpm, max_bpm));
    
    if(pitches.length > 0) {
      this.sc.playChord(pitches, dynamic, dur);
    } else {
      this.sc.playNote(0,0,dur);
    }
    return dur;
  }
  
}
