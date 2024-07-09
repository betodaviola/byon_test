int partsX = 9;
int partsY = 7;
float distX;
float distY;
float [] arrayOfX = new float[partsX-1];
float [] arrayOfY = new float[partsY-1];

void gridSetup() {
  distX = width/partsX;
  distY = height/partsY;
}

void gridDraw() {
  for (int i = 0; i < arrayOfX.length; i++) {
    arrayOfX[i] = (i + 1) * distX;
    stroke(0,0,255);
    strokeWeight(2);
    line(arrayOfX[i],0,arrayOfX[i],height);
  }
  for (int i = 0; i < arrayOfY.length; i++) {
    arrayOfY[i] = (i + 1) * distY;
    stroke(0,0,255);
    strokeWeight(2);
    line(0,arrayOfY[i],width,arrayOfY[i]);
  }
  stroke(0,255,0);
  strokeWeight(2);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
}
