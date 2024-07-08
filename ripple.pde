ArrayList<RippleSet> allRippleSets = new ArrayList<RippleSet>();
float [] rippleData = new float[4];

void rippleDraw() {
  for (int i = allRippleSets.size() - 1; i >= 0; i--) {
    RippleSet rippleSet = allRippleSets.get(i);
    rippleSet.update();

    if (rippleSet.isEmpty()) {
      allRippleSets.remove(i);
    }
  }
}

// Function to update ripple data and add a new ripple set
void updateRippleData(float[] newRippleData) {
  println("Updating Ripple Data: " + Arrays.toString(newRippleData));
  allRippleSets.add(new RippleSet(newRippleData));
}


class RippleSet {
  ArrayList<Ripple> ripples;
  float[] data;
  int lastRipple;
  boolean generatingRipples;
  float stopGenerationThreshold = 160;

  RippleSet(float[] data) {
    this.data = data;
    this.ripples = new ArrayList<Ripple>();
    this.lastRipple = 0;
    this.generatingRipples = true;
  }

  void update() {
    
    if ((int) data[3] > 150) {
      if (millis() - lastRipple > (int) data[3] && generatingRipples) {
        ripples.add(new Ripple(data));
        lastRipple = millis();
      }
    } else {
      if (generatingRipples && ripples.isEmpty()) {
        ripples.add(new Ripple(data));
//        lastRipple = millis();
      }
    }

    for (int i = ripples.size() - 1; i >= 0; i--) {
      Ripple ripple = ripples.get(i);
      ripple.update();
      ripple.display();

      if (ripple.trans < stopGenerationThreshold) {
        generatingRipples = false;
      }

      if (ripple.trans < 0.1) {
        ripples.remove(i);
      }
    }
  }

  boolean isEmpty() {
    return ripples.isEmpty();
  }
}

class Ripple {
  float w, h, trans, reduce, weight;
  color c;
  float x, y;
  float pdReduce;

  Ripple(float[] data) {
    this.x = data[0];
    this.y = data[1];
    this.pdReduce = data[2];
    this.reduce = 0.99 + (pdReduce / 100);
    this.w = 1;
    this.h = 1;
    this.trans = 255;
    if (data[3] > 150) {
      this.weight = 1;
    } else {
      this.weight = 15;
    }
  }

  void update() {
      w += 1;
      h += 1;
      weight += 0.05;
      trans *= reduce;
  }

  void display() {
    c = color(255, 0, 0, trans);
    noFill();
    stroke(c);
    strokeWeight(weight);
    ellipse(x, y, w, h);
  }
}
