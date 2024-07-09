float[] eclipse = new float[3];

float angle;
Eclipse myEclipse;

void eclipseDraw() {
  myEclipse.update();
  myEclipse.display();
}

class Eclipse {
  float ecX, ecY, ecR;
  float whiteSize;
  float blackSizeX;
  float blackSizeY;

  Eclipse() {
//    updateEclipse();
    whiteSize = width/9;
    blackSizeX = whiteSize - 7;
    blackSizeY = whiteSize + 7;
  }

  void update() {
    ecX = eclipse[0];
    ecY = eclipse[1];
    ecR = eclipse[2];
  }

  void display() {
    println("Displaying Eclipse - whiteSize: " + whiteSize + ", blackSizeX: " + blackSizeX + ", blackSizeY: " + blackSizeY);
    stroke(255);
    fill(255);
    float whiteSize = width/9;
    float blackSizeX = whiteSize - 7;
    float blackSizeY = whiteSize + 7;

    ellipse(width/2, height/2, whiteSize, whiteSize); // Static white ellipse

//    updateEclipse();
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
