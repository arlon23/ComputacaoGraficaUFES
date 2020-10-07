PImage source;       // Source image

void setup() {
  size(768, 460, P2D);
  //blur = loadShader("blur.glsl");
  source = loadImage("crf250_lateral.jpg");
  
  background(source);
  
}


void draw() {  


  // We are going to look at both image's pixels
  source.loadPixels();

  println(source.width);
  for (int x = 0; x < source.width; x++) {
    for (int y = 0; y < source.height; y++ ) {
      color c = source.get(x,y);
      set(x,y, c*-1);
    }
  }
  updatePixels();
  save("imagemCorInvertida.png");
  
}
