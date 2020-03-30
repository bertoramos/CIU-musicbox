
class Sheet {
  
  private String[] sheet;
  private int line;
  
  Sheet(String file)
  {
    this.sheet = loadStrings(file);
    this.line = 0;
  }
  
  /**
   * 
   * 
   * @returns : note symbol note symbol ...
   */
  public String[] getNext() {
    while(this.sheet[this.line].isEmpty() || this.sheet[this.line].startsWith("#")) { // Ignore empty or comments
      this.line++;
      if(this.line >= this.sheet.length) this.line = 0;
    }
    
    String[] note = this.sheet[this.line++].split("\\|");
    assert note.length == 2;
    assert note[0].length() >= 0;
    assert note[1].length() > 0;
    
    if(this.line >= this.sheet.length) this.line = 0;
    
    return note;
  }
  
  public void reset() {
    this.line = 0;
  }
  
}
