PShape predio, janelaFechada, janelaAberta, porta, telhado, macaneta, tronco, arvore;
float zoom = 0;
void setup() {
  size(600,600,P3D );
  
  predio = createShape(BOX,180, 300,-100);
  predio.setFill(color(255,255,255));
  //predio.noStroke();
  
  janelaAberta = createShape(BOX, 60,30,-101);
  janelaAberta.setFill(color(0,0,0));
  
  janelaFechada = createShape(BOX, 30,30,101);
  janelaFechada.setFill(color(36,184,224));
  
  porta = createShape(BOX,30,60,101);
  porta.setFill(color(154,87,52));
  
  macaneta = createShape(SPHERE,5);
  macaneta.setFill(color(247,247,0));
  
  telhado =  shapePiramide();
  //telhado.setFill(color(129,34,23));
  
  tronco = drawCylinder(30,10,130);
  //tronco.setFill(color(120,78,49));
  
  
  arvore = createShape(SPHERE, 70);
  arvore.setStroke(color(0,0,0,0));
  //arvore.fill(101,150,45);
  //arvore.noStroke();
  //arvore.endShape();
  
  arvore.setFill(color(101,150,45));
}
int i=0;
void draw() {
  //rotateY(0.6);
  background(204);
  translate(600, 0, -200);
  float cameraY = height/2.0;
  float fov = mouseX/float(width) * PI/2;
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);
  
  
  perspective(zoom, aspect, cameraZ/10.0, cameraZ*10.0);
  println(mouseY);
  rotateX((PI/3-(mouseY-60)/float(height) * PI)*-1);
  rotateY((PI/3 + mouseX/float(height) * PI)*-1);
 
  if (mousePressed)
  {
    ortho();
  }
  shape(predio, 290,315);
  
  shape(janelaAberta, 240, 190);
 
  
  shape(janelaAberta, 240, 240);
  shape(janelaAberta, 240, 285);
  
  shape(janelaFechada, 325, 190);
  shape(janelaFechada, 355, 190);
  
  shape(janelaFechada, 325, 240);
  shape(janelaFechada, 355, 240);
  
  shape(janelaFechada, 325, 285);
  shape(janelaFechada, 355, 285);
  
  shape(janelaFechada, 325,330);
  shape(janelaFechada, 355,330);
  
  shape(janelaFechada, 325,375);
  shape(janelaFechada, 355,375);
  
  shape(janelaFechada, 225,330);
  shape(janelaFechada, 255,330);
  
  shape(janelaFechada, 225,375);
  shape(janelaFechada, 255,375);
  
  shape(porta, 275, 435);
  shape(porta, 305, 435);
  
  shape(macaneta, 285,420);
  
  shape(macaneta, 295,420);
  
  shape(telhado, 290,65);
 
  
  shape(arvore, 457,280);
  translate(460,415);
  rotateX(1.6);
  
  shape(tronco, 0,0);
  
  translate(0, 0, -50);
}

void mouseWheel(MouseEvent event) {
  if(zoom >=0.0 && zoom <= 3.0){
    if(event.getCount() > 0){ 
      zoom += event.getCount() - 0.8;
    }else if(event.getCount() < 0){
      zoom += event.getCount() + 0.8;
      if(zoom <0.0) zoom = 0;
    }
  }else zoom = 0;
  println( event.getCount());
}

PShape shapePiramide(){
  PShape star = createShape();
  star.beginShape();
  // You can set fill and stroke
  star.fill(129,34,23);
  star.stroke(0);
  star.strokeWeight(2);

  star.vertex(120, 120, -120);
  star.vertex(-120, 120, -120);
  star.vertex(   0,    0,  0);
  
  star.vertex(-120, 120, -120);
  star.vertex(-120, 120, 120);
  star.vertex(   0,    0,  0);
  
  star.vertex(-120, 120, 120);
  star.vertex(120, 120, 120);
  star.vertex(   0,    0,  0);
  
  star.vertex(120, 120, 120);
  star.vertex(120, 120, -120);
  star.vertex(   0,    0,  0);
  
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
    cilindro.fill(120,78,49);
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
