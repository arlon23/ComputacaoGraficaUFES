import processing.sound.*;
PShape predio, janelaFechada, janelaAberta, porta, telhado, macaneta, tronco, arvore;
PShape rua, arvoreTriangular,calcada, faixa;
PShape predio2, telhado2, bottom, bottom2;
float zoom = 1;

  

SoundFile file;
void setup() {
  size(800, 600, P3D );

//  file = new SoundFile(this, "bensound-sunny.mp3");
//  file.play();

  predio = createShape(BOX, 180, 300, 95);
  predio.setFill(color(255, 255, 255));
  
  predio2 = createShape(BOX, 180, 300, 95);
  predio2.setFill(color(85, 91, 102));
  //predio.noStroke();

  janelaAberta = createShape(BOX, 60, 30, -95);//sdfgsdgf
  janelaAberta.setFill(color(0, 0, 0));

  janelaFechada = createShape(BOX, 30, 30, 95);
  janelaFechada.setFill(color(36, 184, 224));

  porta = createShape(BOX, 30, 60, 95);
  porta.setFill(color(154, 87, 52));
  
  

//  macaneta = createShape(SPHERE, 5);
//  macaneta.setFill(color(247, 247, 0));

  telhado2 =  shapePiramide(color(129, 34, 23), 100);
  
  telhado =  shapePiramide(color(114,131,150), 100);

  tronco = drawCylinder(30, 10, 130);


  arvore = createShape(SPHERE, 70);
  arvore.setStroke(color(0, 0, 0, 0));

  arvore.setFill(color(101, 150, 45));
  
 //Rua
 
  calcada = createShape(BOX, 600, 5, 160);
  calcada.setFill(color(70));
  
  rua = createShape(BOX, 600, 5, 160);
  rua.setFill(color(175));
  
  bottom = createShape(BOX,200,2,160);
  bottom.setFill(color(0));
 
  
  faixa = createShape(BOX,30,5,5);
  faixa.setFill(color(210,204,17));
}
int i=0;
void draw() {
  //rotateY(0.6);
  background(204);
  translate(600, 0, -400);
  lights();
  //camera()
  float cameraY = height;
  float fov = mouseX/float(height) * PI/2;
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);


  perspective(zoom, aspect, cameraZ/100.0, cameraZ*100.0);
  rotateX((PI/3-(mouseY-60)/float(height) * PI)*-1);
  rotateY((PI/3 + (mouseX+80)/float(height) * PI)*-1);

  shape(predio, 335, 330);
  
  shape(predio2, 95, 330);

  translate(45,0,-2);
  
  shape(bottom,290,180);
  
  shape(bottom,50,180);
  
  for(int j=0; j<2; j++){
    shape(janelaAberta, 240+(j*-240), 205);
  
  
    shape(janelaAberta, 240+(j*-240), 255);
    shape(janelaAberta, 240+(j*-240), 300);
  
    shape(janelaFechada, 325+(j*-240), 205);
    shape(janelaFechada, 355+(j*-240), 205);
  
    shape(janelaFechada, 325+(j*-240), 255);
    shape(janelaFechada, 355+(j*-240), 255);
  
    shape(janelaFechada, 325+(j*-240), 300);
    shape(janelaFechada, 355+(j*-240), 300);
  
    shape(janelaFechada, 325+(j*-240), 345);
    shape(janelaFechada, 355+(j*-240), 345);
  
    shape(janelaFechada, 325+(j*-240), 390);
    shape(janelaFechada, 355+(j*-240), 390);
  
    shape(janelaFechada, 225+(j*-240), 345);
    shape(janelaFechada, 255+(j*-240), 345);
  
    shape(janelaFechada, 225+(j*-240), 390);
    shape(janelaFechada, 255+(j*-240), 390);
  
    shape(porta, 275+(j*-240), 450);
    shape(porta, 305+(j*-240), 450);
  
    
  
    shape(telhado, 290, 80);
    shape(telhado2, 50, 80);
  }


  shape(arvore, 457, 280);
  
  translate(0,0,-30);
  shape(calcada,260,482);
  
  translate(0,0,-160);
  shape(rua,260,482);
  
  translate(0,-0.8,0);
  for(int i=0; i<13; i++){
    shape(faixa,(44 *i),482);
  }
  
  
  translate(460, 415, 192);
  rotateX(1.6);

  shape(tronco, 0, 0);
}

void mouseWheel(MouseEvent event) {
  if (zoom >=0.0 && zoom <= 3.0) {
    if (event.getCount() > 0) { 
      zoom += event.getCount() - 0.8;
    } else if (event.getCount() < 0) {
      zoom += event.getCount() + 0.8;
      if (zoom <0.0) zoom = 1;
    }
  } else zoom = 1;
}

PShape shapePiramide(color cor,int tam) {
  PShape star = createShape();
  star.beginShape();
  // You can set fill and stroke
  star.fill(cor);
  star.stroke(0);
  star.strokeWeight(2);

  star.vertex(tam, tam, -80);
  star.vertex(-tam, tam, -80);
  star.vertex(   0, 0, 0);

  star.vertex(-tam, tam, -80);
  star.vertex(-tam, tam, 80);
  star.vertex(   0, 0, 0);

  star.vertex(-tam, tam, 80);
  star.vertex(tam, tam, 80);
  star.vertex(   0, 0, 0);

  star.vertex(tam, tam, 80);
  star.vertex(tam, tam, -80);
  star.vertex(   0, 0, 0);

  star.endShape(CLOSE);
  //fill(129,34,23);

  return star;
}

PShape drawCylinder( int sides, float r, float h)
{
  float angle = 360 / sides;
  float halfHeight = h / 2;

  PShape cilindro = createShape();
  // draw top of the tube
  cilindro.beginShape();
  cilindro.fill(120, 78, 49);
  for (int i = 0; i < sides; i++) {
    float x = cos( radians( i * angle ) ) * r;
    float y = sin( radians( i * angle ) ) * r;
    cilindro.vertex( x, y, -halfHeight);
  }
  cilindro.endShape(CLOSE);

  // draw bottom of the tube
  cilindro.beginShape();
  for (int i = 0; i < sides; i++) {
    float x = cos( radians( i * angle ) ) * r;
    float y = sin( radians( i * angle ) ) * r;
    cilindro.vertex( x, y, halfHeight);
  }
  cilindro.endShape(CLOSE);

  // draw sides
  cilindro.beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x = cos( radians( i * angle ) ) * r;
    float y = sin( radians( i * angle ) ) * r;
    cilindro.vertex( x, y, halfHeight);
    cilindro.vertex( x, y, -halfHeight);
  }
  cilindro.noStroke();
  cilindro.endShape(CLOSE);

  return cilindro;
}
