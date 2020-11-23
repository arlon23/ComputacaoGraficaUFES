PShape pulseira, vidro, ponteiroMin, ponteiroSeg, ponteiroHr, borda, caixa;
PShape dot, dotMin, tracoH, tracoV;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

int cx,cy;

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
  caixa = drawCylinder(40,radius-9.5,100);
  borda = drawCircle(40, radius-13);
  dot = createShape(SPHERE,3);
  dot.setFill(0);
  
  dotMin = createShape(SPHERE,1);
  dotMin.setFill(0);
  
  tracoH = createShape(BOX, 20,10,2);
  tracoV = createShape(BOX, 10,20,2);
  
  
  
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
   ambientLight(165,165,165);
   if(mousePressed){
    lights(); 
   }
   
   shape(vidro,300,300);
   shape(borda,300,300);
   shape(caixa,300,300);
   shape(dot,300,300);
   
   for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    
    if(a==0||a==180){
      shape(tracoH,x,y);
    }else if(a==90||a==270){
      shape(tracoV,x,y);
    }else if (a==30||a==60||a==120||a==150||a==210||a==240||a==300||a==330){
      shape(dot,x,y);
    }else{
      shape(dotMin,x,y);
    }
   }
   
   
   
   
    translate(300,300);
    ponteiroHr(h);
    rotate(-radians(29.4*h));
    rotate(-radians(0.6*minute()));
    ponteiroMin();
    rotate(-radians(5.9*minute()));
    rotate(-radians(0.1*second()));
    ponteiroSeg();
    
   
   
    camera(mouseX*10, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
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

PShape drawCircle(int sides, float r)
{
    float angle = 360 / sides;
    PShape circle = createShape();
    circle.beginShape();
    circle.noFill();
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
  cilindro.fill(255,255,0);
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
