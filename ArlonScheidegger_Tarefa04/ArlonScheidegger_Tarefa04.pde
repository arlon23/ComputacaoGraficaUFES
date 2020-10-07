PImage source;       // Source image
PImage destination;
PShape abaInfo;

void setup() {
  size(768, 460, P2D);
  //blur = loadShader("blur.glsl");
  source = loadImage("crf250_lateral.jpg");
  destination = createImage(source.width, source.height, RGB);
  abaInfo = createShape(RECT, 0,0,source.width, 50);
  abaInfo.setFill(color(255,255,255));
  
  
  

  
  
}
int t=0;

void draw() { 
  if(t==0){
    background(source);
    text("Aperte botão cima para Espelhar verticalmente, direita para espelhar horizontalmente e Esquerda/Baixo para retornar para original",0,20);
    fill(0);  
}
  
  
  source.loadPixels();
  
  
}

void keyPressed() {
  t++;
  if (key == CODED) {
    if (keyCode == UP) {
      int yF = source.height-1;
      espelhamentoVertical(yF);
    } else if (keyCode == RIGHT) {
      int xF = source.width-1;
      espelhamentoHorizontal(xF);
    } else if (keyCode == LEFT || keyCode == DOWN){
        background(source);
        text("Aperte botão cima para Espelhar verticalmente, direita para espelhar horizontalmente e Esquerda/Baixo para retornar para original",0,20);
        fill(0);  
    }
  }
}

void espelhamentoVertical(int yF){
    for (int x = 0; x < source.width; x++) {
    
    for (int y = 0; y < source.height; y++ ) {
      color c = source.get(x,y);
      destination.set(x,yF, c);
      yF--;
    }
    yF = source.height-1;
    
  }
  destination.updatePixels();
  // Display the destination
  background(destination);
  text("Aperte botão cima para Espelhar verticalmente, direita para espelhar horizontalmente e Esquerda/Baixo para retornar para original",0,20);
    fill(0);  
  save("imagemEspelhadaVertical.png");

}


void espelhamentoHorizontal(int xF){
    for (int x = 0; x < source.width; x++) {
    
    for (int y = 0; y < source.height; y++ ) {
      color c = source.get(x,y);
      destination.set(xF,y, c);
    }
    xF--;
    
  }
  destination.updatePixels();
  // Display the destination
  background(destination);
  text("Aperte botão cima para Espelhar verticalmente, direita para espelhar horizontalmente e Esquerda/Baixo para retornar para original",0,20);
    fill(0);  
  save("imagemEspelhadaHorizontal.png");

}
