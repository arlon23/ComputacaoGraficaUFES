PFont f;
PImage source;
float x1,y1,x2,y2,x3,y3,x4,y4;
float desloc = 700/8;

void setup (){
 size(700,500);
 
 
 
 x1 = 700/8;
 y1 = 500/2;
 x2 = 700/2;
 y2 = 500/8;
 x3 = x1*7;
 y3 = y1;
 x4 = x2;
 y4 = y2*7;
 f = createFont("Arial",16,true);
 
}

void draw (){
  if(mousePressed==false && keyPressed == false){//OPCÃO 1, QUANDO USUARIO NAO ACIONA NENHUMA DAS OUTRAS OPÇÕES
     bandeiraOriginal();
  }else if(mousePressed == true && mouseButton == LEFT){//OPÇÃO 2, BOTÃO ESQUERDO MOUSE - INVERSÃO DE COR
    inverterCor();
  }else if(mousePressed == true && mouseButton == RIGHT){//OPÇÃO 3, BOTÃO DIREITO MOUSE - DESCOLAMENTO DE UM OITAVO A DIREITA DO LOSANGO E TUDO QUE ESTÁ DENTRO DELE
    deslocamento();
  }
  
  if(keyPressed == true && (key == 'T' || key == 't')){//OPÇÃO 4, TELCA "T" OU "t" QUE TORNA O DISCO COM 3 NIVEIS DE TRANSPARÊNCIA E O TEXTO COM QUEBRA DE LINHA
    bandeiraTransparencia();
  }
}

void bandeiraOriginal(){
     strokeWeight(4);
     stroke(255);
     fill(0,150,0);
     rect(0,0,700,500);
     
     fill(255,255,0);
     noStroke();
     quad(x1, y1, x2, y2, x3, y3, x4, y4);
     
     fill(0,0,100);
     ellipse(700/2, 500/2, 700/3, 700/3);
     
     fill(255,255,0);
     
     textFont(f,20);
     textAlign(CENTER);
     text("ORDEM e PROGRESSO", 700/2,500/2);
     
     save("BandeiraOriginal.png");
}

void inverterCor (){
      source = loadImage("BandeiraOriginal.png");
    source.loadPixels();
       for (int x = 0; x < source.width; x++) {
        for (int y = 0; y < source.height; y++ ) {
          float red = red(source.get(x,y));
          float green = green(source.get(x,y));
          float blue = blue(source.get(x,y));
          color c;
          if(x <2 || y<2 || x>= source.width-2 || y >source.height-2){
            c = color(red,green,blue);
          }else{
            c = color(255-red, 255-green, 255-blue);
          }
          source.set(x,y, c);
        }
      }
      updatePixels();
      image(source,0,0);
      save("BandeiraInvertida.png");
}

void deslocamento(){
      strokeWeight(4);
     stroke(255);
     fill(0,150,0);
     rect(0,0,700,500);
     
     fill(255,255,0);
     noStroke();
     quad(x1+desloc, y1, x2+desloc, y2, x3+desloc, y3, x4+desloc, y4);
     
     fill(0,0,100);
     ellipse(700/2+desloc, 500/2, 700/3, 700/3);
     
     fill(255,255,0);
     textFont(f,20);
     text("ORDEM e PROGRESSO", 700/2+desloc,500/2);
     save("BandeiraDeslocada.png");
}

void bandeiraTransparencia(){
     strokeWeight(4);
     stroke(255);
     fill(0,150,0);
     rect(0,0,700,500);
     
     fill(255,255,0);
     noStroke();
     quad(x1, y1, x2, y2, x3, y3, x4, y4);
     
     fill(0,0,100,64);
     ellipse(700/2, 500/2, 700/3, 700/3);
     
     fill(0,0,100,126);
     ellipse(700/2, 500/2, 700/3-(0.5*desloc), 700/3-(0.5*desloc));
     
     fill(0,0,100,255);
     ellipse(700/2, 500/2, 700/3-desloc, 700/3-desloc);
     
     fill(255,255,0);
     f = createFont("Arial",16,true);
     textFont(f,20);
     textAlign(CENTER);
     text("ORDEM\n e \nPROGRESSO", 700/2,500/2-(desloc*0.5));
     save("BandeiraTransparencia.png"); 
}
