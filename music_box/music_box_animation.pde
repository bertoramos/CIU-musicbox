
MusicBox mb;

void setup_music_box() {
  mb = new MusicBox(new PVector(0,0,0));
}

void draw_music_box_amb() {
  background(0);
  
  float cameraZ = ((height/2.0) / tan(PI*120.0/360.0));
  perspective(PI/3.0, width/height, cameraZ/10.0, cameraZ*10.0); 
  
  camera(+17, -10, -15,
         0, -5, 0,
         0, 1, 0);
  
  ambientLight(255, 255, 255);
  spotLight(255,255,255,
             40, 40, 0,
             -1, -1, 0,
             PI/2,
             2);
}

void move_music_box() {
  draw_music_box_amb();
  mb.move();
}

void windUp_music_box() {
  draw_music_box_amb();
  mb.windUp();
}

void move_loop_music_box() {
  draw_music_box_amb();
  mb.infiniteMove();
}
