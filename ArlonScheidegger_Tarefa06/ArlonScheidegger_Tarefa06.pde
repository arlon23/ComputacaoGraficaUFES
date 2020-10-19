PImage source;       // Source image
PImage destination;

void setup() {
  size(800, 900, P2D);
  source = loadImage("imagem.jpg");
  destination = createImage(source.width+450, source.height+200, RGB);
  background(135);
  
}


void draw() {  
  source.loadPixels();

  rotacionarInverso();   

  image(destination,0,0,800,900);
  save("imagemRotacionada.png");
  
}

void rotacionarInverso(){
  for (int x = 0; x < source.width; x++) {
    for (int y = 0; y < source.height; y++ ) {
      
      float novoY, novoX ;

      color c = source.get(x,y);
      novoX = rotacionarInversoX(radians(33), x, y);      
      novoY = rotacionarInversoY(radians(33), x, y);

      destination.set((int)novoX,(int)novoY+340, c);
     
    }
  }
  destination.updatePixels();
  for (int x = 0; x < destination.width; x++) {
    for (int y = -340; y < destination.height; y++ ) {
      float novoX = rotacionarX(radians(33), x, y);
      float novoY = rotacionarY(radians(33), x, y);
      
      
      color c = getPx(novoX,novoY);
      
      destination.set(x,y+340, c);
      
    }
   }
  destination.updatePixels();
}

float rotacionarInversoX(float grau, int x, int y){  
  return ((x*cos(radians(grau))) + y*(sin(radians(grau))));
}

float rotacionarInversoY(float grau,int x, int y){
  return ((x*(-sin(radians(grau)))) + y*cos(radians(grau)));
}

float rotacionarX(float grau, int x, int y){  
  return (x*cos(grau)) + y*(-sin(grau));
}

float rotacionarY(float grau,int x, int y){
  return (x*sin(grau) + ((cos(grau))*y));
}

color getPx (float x, float y){
         
      float pixelARed = red(source.get(floor(x), floor(y)));
      float pixelBRed = red(source.get(ceil(x), floor(y)));
      float pixelCRed = red(source.get(floor(x), ceil(y)));
      float pixelDRed = red(source.get(ceil(x), ceil(y)));
      
      float pixelAGreen = green(source.get(floor(x), floor(y)));
      float pixelBGreen = green(source.get(ceil(x), floor(y)));
      float pixelCGreen = green(source.get(floor(x), ceil(y)));
      float pixelDGreen = green(source.get(ceil(x), ceil(y)));
      
      float pixelABlue = blue(source.get(floor(x), floor(y)));
      float pixelBBlue = blue(source.get(ceil(x), floor(y)));
      float pixelCBlue = blue(source.get(floor(x), ceil(y)));
      float pixelDBlue = blue(source.get(ceil(x), ceil(y)));
      
      float Dcol = (( x - floor(x) ));
      float Dlin = ((y - floor(y) ));
      
      float ctrlABRed = (Dcol*(pixelBRed - pixelARed)) + pixelARed;
      float ctrlCDRed = (Dcol*( pixelDRed - pixelCRed)) + pixelCRed;
      
      float ctrlABGreen = (Dcol*(pixelBGreen - pixelAGreen)) + pixelAGreen;
      float ctrlCDGreen = (Dcol*( pixelDGreen - pixelCGreen)) + pixelCGreen;
      
      float ctrlABBlue = (Dcol*(pixelBBlue - pixelABlue)) + pixelABlue;
      float ctrlCDBlue = (Dcol*( pixelDBlue - pixelCBlue)) + pixelCBlue;
      
      float PxRed = Dlin*(ctrlCDRed - ctrlABRed) + ctrlABRed ;
      float PxGreen = Dlin*(ctrlCDGreen - ctrlABGreen) + ctrlABGreen ;
      float PxBlue = Dlin*(ctrlCDBlue - ctrlABBlue) + ctrlABBlue ;
      
      return color(PxRed, PxGreen, PxBlue);
}
