void displayTextHUD(String str1, float x, float y, color rgb) {
  camera();
  hint(DISABLE_DEPTH_TEST);
  noLights();
  textMode(MODEL);
  stroke(rgb);
  text(str1, x, y);
  hint(ENABLE_DEPTH_TEST);
}
