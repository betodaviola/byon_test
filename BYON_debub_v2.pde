import java.util.Arrays;

import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myBroadcastLocation; 

void setup() {
  size(854,480);
  oscP5 = new OscP5(this, 12000);
  myBroadcastLocation = new NetAddress("xxx.x.x.x", 8000);

  myEclipse = new Eclipse();
}

void draw() {
  background(0);

  walkerDraw();
  myEclipse.display();
  rippleDraw();

}

void oscEvent(OscMessage theOscMessage) {
  synchronized (this) {
    println("Received OSC message: " + theOscMessage.addrPattern());
    // get screen size and send to PureData
    if (theOscMessage.addrPattern().equals("/size")) {
      OscMessage screenW = new OscMessage("/width");
      screenW.add(width);
      oscP5.send(screenW, myBroadcastLocation);
      OscMessage screenH = new OscMessage("/height");
      screenH.add(height);
      oscP5.send(screenH, myBroadcastLocation);
    }
    //eclipse OSC data
    if (theOscMessage.addrPattern().equals("/eclipse")) {
      for (int i = 0; i < 2; i++) {
        eclipse[i] = theOscMessage.get(i).floatValue();
        println("Eclipse data[" + i + "]: " + eclipse[i]);
      }
    }
    if (theOscMessage.addrPattern().equals("/moonR")) {
      eclipse[2] = theOscMessage.get(0).floatValue();
      println("Moon data: " + eclipse[2]);
    }
    //walker data
    if (theOscMessage.addrPattern().equals("/walkerData") || theOscMessage.addrPattern().equals("/walkerData2")) {
      for (int i = 0; i < 6; i++) {
        walkerData[i] = theOscMessage.get(i).floatValue();
      }
      walkerSetup();
    }
    // ripple data
    if (theOscMessage.addrPattern().equals("/rippleData")) {
      for (int i = 0; i < 4; i++) {
        rippleData[i] = theOscMessage.get(i).floatValue();
        println("Ripple data[" + i + "]: " + rippleData[i]);
  
      }
      updateRippleData(rippleData);
    }
  }
}
