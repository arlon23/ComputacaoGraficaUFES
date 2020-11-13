PShape predio, janelaFechada, janelaAberta, porta, telhado, macaneta, tronco, arvore;
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
  rotateY(0.6);
  ambientLight (50,50,50);
  
  if(mousePressed == true && mouseButton == LEFT){
    lights();
    pointLight (51, 102, 126, 467, 280, 100);
    save("lightImage.png");
  }else if(mousePressed == true && mouseButton == RIGHT){
    directionalLight (255, 255, 255, pmouseX,pmouseY,0);
    save("directionalImage.png");
  }else if(mousePressed == true && mouseButton == CENTER){
    spotLight (255, 255, 255, mouseX, mouseY, 120, 0, 1, 0, 200, 1); 
    save("spotImage.png");
  }
  
   if(keyPressed == true && (key == 'T' || key == 't')){//OPÇÃO 4, TELCA "T" OU "t" QUE TORNA O DISCO COM 3 NIVEIS DE TRANSPARÊNCIA E O TEXTO COM QUEBRA DE LINHA
    i = i+4;
    pointLight (255, 255, 255, i, 280, 100);
    if(i>600){
      i=0;
    }
    save("pointImage.png");
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
  
  save("ambientImage.png");
  //sphere(60);
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
