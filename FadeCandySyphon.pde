import codeanticode.syphon.*;

OPC opc;
SyphonClient client;
PImage dot;
PImage img;

void setup() {
    size(640, 360, P3D);
    client = new SyphonClient(this);
    opc = new OPC(this, "127.0.0.1", 7890);
  opc.ledGrid(0, 128, 10, width/2, height/2, width / 128.0, height/10.0, 0, false);
}

void draw() {
    background(0);
    if (client.available()) {
        img = client.getImage(img);
        image(img, 0, 0, width, height);
    }
}
