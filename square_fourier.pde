int xMax = 512;
int yMax = 256;
float mx = 0;
float omx = mx;
float my = 0;
float omy = my;
float oy = 120;
int i;
int lp = 1;
boolean Upls = false;
boolean Dpls = false;

void setup() {
  size(512, 256);
  frameRate(120);
  background(180);
}

void draw() {
  i = i + 1;
  if (i >= 359) i = 0;
  my = 0;
  float rad = PI * i / 180.000 ;
  for (int N = lp; N >= 1; N --) {
    my = my + (sin(((2 * N) - 1) * rad) / (float)((2 * N) - 1)) * 64;
  }
  mx ++;
  if (mx <= 0) mx = 0;
  if (mx >= xMax) {
    mx = 0;
    omx = 0;
    background(180);
    fill(0);
    textSize(12);
    text(lp, 0, 10);
  }
  stroke(0);
  line(omx, omy+oy, mx, my + oy);
  omx = mx;
  omy = my;
}

void mousePressed() {
  if (Upls == false) {
    stroke(180);
    fill(180);
    rect(0, 0, 20, 20);
    if (lp < 20) lp ++;
    else lp = 1;
    Upls = true;
    fill(0);
    textSize(12);
    text(lp, 0, 10);
  }
}
void mouseReleased() {
  Upls = false;
}
