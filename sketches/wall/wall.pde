import codeanticode.syphon.*;

OPC opc;
PImage img;
SyphonClient client;

void setup() {
	int WIDTH = 640;
	int HEIGHT = 480;

	// OPC server config
	String HOST = "127.0.0.1";
	int PORT = 7890;

	// Syphon input config
	String SYPHON_SERVER_NAME = "Arena";
	String SYPHON_SERVER_SCREEN = "Wall"; // e.g. 'Composition', 'Screen 1', etc.

	size(640, 480, P3D);
	client = new SyphonClient(this, SYPHON_SERVER_NAME, SYPHON_SERVER_SCREEN);
	opc = new OPC(this, HOST, PORT);
	opc.ledGrid(0, 128, 10, width/2, height/2, width/128, height/10, 0, false);
}

void draw() {
	background(0);
	if (client.available()) {
		img = client.getImage(img);
		image(img, 0, 0, width, height);
	} else {
		// Nothing to do here?
	}
}
