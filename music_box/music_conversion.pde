
import java.util.*;

Map<String, Double> note2midi;

void setup_music_conversion()
{
  String[] n2m = loadStrings("data\\note2midi.txt");
  note2midi = new HashMap<String, Double>();
  
  for(String line : n2m) {
    String[] line_split = line.split(" ");
    note2midi.put(line_split[0], Double.parseDouble(line_split[1]));
  }
}

double note2Midi(String note)
{
  return note2midi.get(note);
}

float symbol2Time(String sym, float bpm)
{
  float dur;
  
  switch(sym.trim()) {
    // ++++++++++++++++++++++++++++++ MAXIMA
    case "LARGE":
      dur = 32;
      break;
    case "LARGE_REST":
      dur = 32;
      break;
    // ++++++++++++++++++++++++++++++ LONGA
    case "LONG":
      dur = 16;
      break;
    case "LONG_REST":
      dur = 16;
      break;
    // ++++++++++++++++++++++++++++++ CUADRADA
    case "BREVE":
      dur = 8;
      break;
    case "BREVE_REST":
      dur = 8;
      break;
    // ++++++++++++++++++++++++++++++ REDONDA
    case "SEMIBREVE":
      dur = 4;
      break;
    case "SEMIBREVE_REST":
      dur = 4;
      break;
    // ++++++++++++++++++++++++++++++ BLANCA
    case "MINIM":
      dur = 2;
      break;
    case "MINIM_REST":
      dur = 2;
      break;
    // ++++++++++++++++++++++++++++++ NEGRA
    case "CROTCHET":
      dur = 1;
      break;
    case "CROTCHET_REST":
      dur = 1;
      break;
    // ++++++++++++++++++++++++++++++ CORCHEA
    case "QUAVER":
      dur = 1.0/2.0;
      break;
    case "QUAVER_REST":
      dur = 1.0/2.0;
      break;
    // ++++++++++++++++++++++++++++++ SEMICORCHEA
    case "SEMIQUAVER":
      dur = 1.0/4.0;
      break;
    case "SEMIQUAVER_REST":
      dur = 1.0/4.0;
      break;
    case "DEMISEMIQUAVER":
      dur = 1.0/8.0;
      break;
    case "DEMISEMIQUAVER_REST":
      dur = 1./8.0;
      break;
    // ++++++++++++++++++++++++++++++ ERROR (Default)
    default:
      dur = 1;
      println(sym + " doesn't exists");
      assert false;
      break;
  }
  
  return dur * 60.0/bpm;
}

float dotNote(float dur, float bpm)
{
  return dur + 0.5*(60.0/bpm);
}
