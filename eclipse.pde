float[] eclipse = new float[3];

float angle;
Eclipse myEclipse;

class Eclipse {
  float[] moon;
  float ecX, ecY, ecR;
  float whiteSize;
  float blackSizeX;
  float blackSizeY;

  Eclipse() {
    moon = eclipse;
    updateEclipse();
    whiteSize = width/9;
    blackSizeX = whiteSize - 7;
    blackSizeY = whiteSize + 7;
  }

  void updateEclipse() {
    ecX = moon[0];
    ecY = moon[1];
    ecR = moon[2];
  }

  void display() {
    println("Displaying Eclipse - whiteSize: " + whiteSize + ", blackSizeX: " + blackSizeX + ", blackSizeY: " + blackSizeY);
    stroke(255);
    fill(255);
    float whiteSize = width/9;
    float blackSizeX = whiteSize - 7;
    float blackSizeY = whiteSize + 7;

    ellipse(width/2, height/2, whiteSize, whiteSize); // Static white ellipse

    updateEclipse();
    float angle = radians(ecR);
    pushMatrix();
    translate(width/2, height/2);
    rotate(angle);
    stroke(0);
    fill(0);
    ellipse(ecX, ecY, blackSizeX, blackSizeY); // Rotating black ellipse
    popMatrix();
  }
}
