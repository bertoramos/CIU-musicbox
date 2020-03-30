
class Player
{
  
  private Sheet sheet;
  private Instrument instrument;
  
  Player(Sheet sheet, Instrument instrument)
  {
    this.sheet = sheet;
    this.instrument = instrument;
  }
  
  void playNext(float bpm)
  {
    float start = millis();
    
    String[] note = this.sheet.getNext();
    
    boolean dot = note[1].endsWith(".");
    String sym = dot ? note[1].substring(0, note[1].length()-1) : note[1];
    
    
    float dur = this.instrument.play(bpm, note[0].isEmpty() ? new String[0] : note[0].split(" "), sym, dot);
    
    this.instrument.waitNote(dur - (millis() - start));
    println(sym, Arrays.toString(note));
  }
  
}
