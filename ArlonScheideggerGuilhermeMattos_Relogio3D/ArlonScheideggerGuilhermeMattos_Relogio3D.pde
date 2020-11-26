PShape pulseira,pulseira2F,pulseira2T, vidro, ponteiroMin, ponteiroSeg, ponteiroHr, borda, caixa;
PShape dot, dotMin, tracoH, tracoV,borda2, doze, tampa;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

int x = 0;
float zoom =600;

final int minNumberOfTeeth=3;
final int maxNumberOfTeeth=40;

int cx,cy;

int i = 0;

void setup(){
  size(600,600,P3D);
  smooth();
  int radius = min(width, height) / 4;
  println(radius);
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  
  
  color c = color(207,255,249,50);
  vidro = createShape(ELLIPSE, 0,0, clockDiameter,clockDiameter);
  vidro.setFill(c);
  
  tampa = createShape(ELLIPSE, 0,0, clockDiameter+5,clockDiameter+5);
  tampa.setFill(color(207,255,249));
  
  caixa = drawCylinder(40,radius-9.5,100);
  borda = drawCircle(40, radius-13, 1);
  borda2 = drawCircle(10, radius, 255);
  borda2.setFill(color(242,210,16));
  dot = createShape(SPHERE,3);
  dot.setFill(0);
  
  pulseira = drawPulseiraLateral(100);
  pulseira2F = drawPulseira(100,0);
  pulseira2T = drawPulseira(100,1);
  
  dotMin = createShape(SPHERE,1);
  dotMin.setFill(0);
  
  tracoH = createShape(BOX, 20,10,2);
  tracoV = createShape(BOX, 10,20,2);
  doze = createShape(TRIANGLE,-10,-15,0,10,10,-15);
  
  
  
  ponteiroHr = ponteiro(color(0,0,255), 20,1);
  ponteiroMin = ponteiro(color(0), 10,2);
  ponteiroSeg = ponteiro(color(255,0,0), 0,3);
  
  cx = 300;
  cy = 300;
}

void draw(){ 
  int h = hour();
  if(h>=12){
     h = h-12; 
  }
 

   background(255);
   float fov = PI/3.0;
   float cameraZ = (height/2.0) / tan(fov/2.0);
   perspective(fov, float(width)/float(height),cameraZ/10.0, cameraZ*10.0);
   ambientLight(165,165,165);
    if(mousePressed) ortho(); 
  
   
  if(keyPressed){
     if(keyCode == LEFT){
       x--;
     }else if(keyCode == RIGHT){
       x++;
     }else if(key == 'P' || key == 'p'){
       i = i+4;
       pointLight (255, 255, 255, i, 280, 100);
        if(i>600) i=0;
        
     }else if(key == 'S' || key == 's'){
       spotLight (255, 255, 255, mouseX, mouseY, 120, 0, 1, 0, 200, 1); 
    }else if(key == 'D' || key == 'd'){
      directionalLight (255, 255, 255, pmouseX,pmouseY,300);
    }else if(key == 'L' || key == 'l'){
      lights();
    }
     
     
   }
   
   
 
      
   
   
   
   shape(vidro,300,300);
   shape(borda,300,300);
   translate(0,0,-2);
   shape(borda2,300,300);
   translate(0,0,3);
   shape(caixa,300,300);
   shape(dot,300,300);
   shape(pulseira,300,300);
   shape(pulseira2F,300,300);
   shape(pulseira2T,300,300);
   
   rotate(radians(180));
   shape(pulseira,-300,-300);
   shape(pulseira2F,-300,-300);
   shape(pulseira2T,-300,-300);  
   
   rotate(radians(180));
   
   for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    
    if(a==0 ||a==180){
      shape(tracoH,x,y);
    }else if(a==90){
      
      shape(tracoV,x,y);
      
    }else if(a==270){
      translate(0,0,1);
      shape(doze,x,y);
      translate(0,0,-1);
   }else if (a==30||a==60||a==120||a==150||a==210||a==240||a==300||a==330){
      shape(dot,x,y);
    }else{
      shape(dotMin,x,y);
    }
   }
   

   
   translate(x,0,-50);
   shape(tampa,300,300);
   translate(-x,0,50);
   
   
   //if(i<=300){
    //translate(i,300);
    //i++;
   translate(300,300);
    ponteiroHr(h);
    rotate(-radians(29.4*h));
    rotate(-radians(0.6*minute()));
    ponteiroMin();
    rotate(-radians(5.9*minute()));
    rotate(-radians(0.1*second()));
    ponteiroSeg();
    int radio=50;  
    int rotationDirection=-1;
    int rotationSpeed=2; 
    float teethHeight=0.18*radio; 
    translate(0,0,-6);
    drawGear(radio, 0, 0, teethHeight, rotationDirection, rotationSpeed); 
    translate(0,0,-1);
    drawGear(radio, 0, 0, teethHeight, rotationDirection, rotationSpeed); 
    translate(0,0,-1);
    drawGear(radio, 0, 0, teethHeight, rotationDirection, rotationSpeed); 

    
    camera(mouseX, mouseY, zoom , width/2, height/2, 0, 0, 1, 0);
}

void mouseWheel(MouseEvent event) {
  
    if (event.getCount() > 0) { 
      zoom += 20*event.getCount() ;
    } else if (event.getCount() < 0) {
      zoom += 20*event.getCount() ;
    }
  println( event.getCount());
}

PShape drawPulseira(float h,int flag){
  
  float halfHeight = h / 2;
  PShape pulseira = createShape();
  
  pulseira.beginShape();
  
  pulseira.fill(184,119,94);
  if(flag == 0){
    pulseira.vertex(-108,90,-halfHeight+1);
    pulseira.vertex(-100,150,-halfHeight+1);
    pulseira.vertex(100,150,-halfHeight+1);
    pulseira.vertex(108,90,-halfHeight+1);
    pulseira.vertex(-108,90,-halfHeight+1);
  
  
    pulseira.vertex(-100,150,-halfHeight+1);
    pulseira.vertex(100,150,-halfHeight+1);
    pulseira.vertex(70,240,-halfHeight+1);
    pulseira.vertex(-70,240,-halfHeight+1);
    pulseira.vertex(-100,150,-halfHeight+1);
  }else{
    pulseira.vertex(-100,150,-3);
    pulseira.vertex(100,150,-3);
    pulseira.vertex(70,240,-3);
    pulseira.vertex(-70,240,-3);
    pulseira.vertex(-100,150,-3);
    
    pulseira.vertex(-108,90,-3);
    pulseira.vertex(-100,150,-3);
    pulseira.vertex(100,150,-3);
    pulseira.vertex(108,90,-3);
    pulseira.vertex(-108,90,-3);
  }
  pulseira.endShape(CLOSE);
  
  return pulseira;
}

PShape drawPulseiraLateral(float h)
{
  float halfHeight = h / 2;

  PShape pulseira = createShape();
  pulseira.beginShape(TRIANGLE_STRIP);
  pulseira.fill(184,119,94);
  pulseira.noStroke();
  pulseira.vertex(-108,90,-4);
  pulseira.vertex(-108,90,-halfHeight);
  pulseira.vertex(-100,150,-4);
  pulseira.vertex(-100,150,-halfHeight);
  pulseira.vertex(-70,240,-4);
  pulseira.vertex(-70,240,-halfHeight);
  
  pulseira.vertex(70,240,-4);
  pulseira.vertex(70,240,-halfHeight);
  pulseira.vertex(100,150,-4);
  pulseira.vertex(100,150,-halfHeight);
  pulseira.vertex(108,90,-4);
  pulseira.vertex(108,90,-halfHeight);
  
  //pulseira.stroke(255,255,0);
  
  
  //pulseira.noStroke();  
  
  pulseira.endShape(CLOSE);

  
  return pulseira;
}

void ponteiroSeg(){
  rotate(radians(6*second()));
  
  shape(ponteiroSeg,0,0);
}

void ponteiroMin(){
  rotate(radians(minute()*5.9));
  rotate(radians(0.1*second()));
  shape(ponteiroMin,0,0);
}

void ponteiroHr(int h){
  rotate(radians(h*29.4));
  rotate(radians(0.6*minute()));
    shape(ponteiroHr,0,0);
}

PShape ponteiro(color cor, int tam,int z){
  PShape ponteiro = createShape();
  
  ponteiro.beginShape();
  ponteiro.fill(cor);
  ponteiro.vertex(0,0,z);
  ponteiro.vertex(-5,-20,z);
  ponteiro.vertex(0,-100+tam,z);
  ponteiro.vertex(5,-20,z);
  ponteiro.vertex(0,0,z);
  ponteiro.endShape(CLOSE);
  return ponteiro; 
}

PShape drawCircle(int sides, float r, int val)
{
    float angle = 360 / sides;
    PShape circle = createShape();
    circle.beginShape();
    circle.fill(242,210,16,val);
    //circle.stroke(98,69,27);
    circle.stroke(242,210,16);
    circle.strokeWeight(6);
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r;
        float y = sin( radians( i * angle ) ) * r;
        circle.vertex( x, y,1);    
    }
    circle.endShape(CLOSE);
    return circle;
}

PShape drawCylinder( int sides, float r, float h)
{
  float angle = 360 / sides;
  float halfHeight = h / 2;

  PShape cilindro = createShape();
  // draw sides
  cilindro.beginShape(TRIANGLE_STRIP);
  cilindro.fill(181,181,181);
  for (int i = 0; i < sides + 1; i++) {
    float x = cos( radians( i * angle ) ) * r;
    float y = sin( radians( i * angle ) ) * r;
    cilindro.vertex( x, y, -2);
    cilindro.vertex( x, y, -halfHeight);
  }
  cilindro.noStroke();
  cilindro.endShape(CLOSE);

  return cilindro;
}


void drawGear(int radio, float centerPositionX, float centerPositionY, float teethHeight, float rotationDirection, float rotationSpeed )
{ 
  //float rotationAngle=map(mouseX, 0, width, 0, TWO_PI ); 
  int numberOfTeeth=radio/5; 
  numberOfTeeth=constrain(numberOfTeeth, minNumberOfTeeth, maxNumberOfTeeth);
  float teethAngle=TWO_PI/numberOfTeeth;
  float teethWidth=sin(teethAngle/2)*radio; 
  float lineY=cos(teethAngle/2)*radio+teethHeight;
  pushMatrix();
  translate(centerPositionX, centerPositionY);
  //rotate( rotationDirection*rotationSpeed*rotationAngle);
  fill(150);
  stroke(255);
  for (int i=0; i<numberOfTeeth; i++)
  {  
    rotate(teethAngle); 
    stroke(200);
    strokeWeight(1);
    triangle(-3*teethWidth/4, -lineY+teethHeight, teethWidth/2, -lineY+teethHeight, -teethWidth/2, -lineY);
    triangle(teethWidth/4, -lineY, -teethWidth/2, -lineY, teethWidth/2, -lineY+teethHeight);
    stroke(150);
    strokeWeight(2);
    line(-teethWidth/2, -lineY, teethWidth/2, -lineY+teethHeight);
  }
  stroke(100);
  ellipse(0, 0, 2*(-lineY+teethHeight), 2*(-lineY+teethHeight)) ;
  stroke(80);
  strokeWeight(radio/2); 
  ellipse(0, 0, radio, radio);
  fill(0);
  noStroke();
  ellipse(0, 0, radio/5, radio/5);//Shaft
  AdditionsBlock(radio);
  popMatrix();
}
 
void AdditionsBlock(float radio)
{
  rectMode(CENTER);
  rect(0, -radio/10, radio/20, -radio/15);
  ellipse(0, 0.85*radio, radio/15, radio/15);//counterWeight
  rotate(PI/20);
  ellipse(0, 0.85*radio, radio/15, radio/15);//counterWeight
  rotate(PI/20);
  ellipse(0, 0.85*radio, radio/15, radio/15);//counterWeight
}
