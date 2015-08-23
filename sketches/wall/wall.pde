import codeanticode.syphon.*;

OPC opc;
SyphonClient client;
PImage dot;
PImage img;

void setup() {
    size(640, 480, P3D);
    client = new SyphonClient(this, "Arena", "Composition");

    // Roof is on port 7890
    opc = new OPC(this, "127.0.0.1", 7890);
    opc.ledGrid(0, 64, 32, width/2, height/2, width/64, height/32, 0, false);

    // Wall is on port 7891
    // opc = new OPC(this, "127.0.0.1", 7891);
    // opc.ledGrid(0, 64, 30, width/2, height/2, width/64, height/30, 0, false);

//    opc2 = new OPC(this, "127.0.0.1", 7891);
//    opc2.ledGrid(0, 64, 30, width/2, height/2, width/64, height/30, 0, false);

}

void draw() {
    background(0);
    if (client.available()) {
        img = client.getImage(img);
        image(img, 0, 0, width, height);
    }
}
