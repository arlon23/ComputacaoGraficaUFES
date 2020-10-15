PImage source;       // Source image
PImage destination;

void setup() {
  size(400, 400, P2D);
  //blur = loadShader("blur.glsl");
  source = loadImage("crf250_lateral.jpg");
  destination = createImage(source.width+200, source.height+500, RGB);
  background(135);
  
}


void draw() {  


  // We are going to look at both image's pixels
  source.loadPixels();
  //image(source,0,0,400,400);

  
  for (int x = 0; x < source.width; x++) {
    for (int y = 0; y < source.height; y++ ) {
      color c = source.get(x,y);
      //println(rotacionarX(5, x,y));
      
      destination.set(rotacionarX(radians(-20), x,y),rotacionarY(radians(-20),x,y)+300, c);
     
    }
  }
  destination.updatePixels();
  
  //destination.resize(400,400);
  //translate(0, 200);
  image(destination,0,0,400,400);
  save("imagemRotacionada.png");
  
}

int rotacionarX(float grau, int x, int y){
  int novoX;
  novoX = round(((x*cos(grau)) + y*(-sin(grau))));

  return novoX;
  
}

int rotacionarY(float grau,int x, int y){
  int novoY;
  novoY = round((x*sin(grau) + ((cos(grau))*y)));
  return novoY;
}
