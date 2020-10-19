PShape predio, janelaFechada, janelaAberta, porta, telhado, macaneta, tronco, arvore;

void setup (){
  size(600,600);
  
  predio = createShape(RECT, 0,0,180, 300);
  predio.setFill(color(255,255,255));
  predio.noStroke();
  
  janelaAberta = createShape(RECT, 0,0, 60,30);
  janelaAberta.setFill(color(0,0,0,0));
  
  janelaFechada = createShape(RECT, 0, 0, 30,30);
  janelaFechada.setFill(color(36,184,224));
  
  porta = createShape(RECT,0,0, 30,60);
  porta.setFill(color(154,87,52));
  
  macaneta = createShape(ELLIPSE, 0,0, 5,5);
  macaneta.setFill(color(247,247,0));
  
  telhado = createShape(TRIANGLE, 80, 50, 200, 0, 300, 50);
  telhado.setFill(color(129,34,23));
  
  tronco = createShape(RECT, 0, 0, 15,100);
  tronco.setFill(color(120,78,49));
  
  arvore = createShape(ELLIPSE, 0,0,50,150);
  arvore.setFill(color(101,150,45));
  
}

void draw (){
  shape(predio, 200,150);
  
  shape(janelaAberta, 210, 165);
 
  
  shape(janelaAberta, 210, 215);
  shape(janelaAberta, 210, 260);
  
  shape(janelaFechada, 300, 165);
  shape(janelaFechada, 330, 165);
  
  shape(janelaFechada, 300, 215);
  shape(janelaFechada, 330, 215);
  
  shape(janelaFechada, 300, 260);
  shape(janelaFechada, 330, 260);
  
  shape(janelaFechada, 300,305);
  shape(janelaFechada, 330,305);
  
  shape(janelaFechada, 300,350);
  shape(janelaFechada, 330,350);
  
  shape(janelaFechada, 210,305);
  shape(janelaFechada, 240,305);
  
  shape(janelaFechada, 210,350);
  shape(janelaFechada, 240,350);
  
  shape(porta, 260, 390);
  shape(porta, 290, 390);
  
  shape(macaneta, 285,420);
  shape(macaneta, 295,420);
  
  shape(telhado, 100,100);
  
  shape(tronco, 450,350);
  shape(arvore, 457, 280);
  
  save(".png");
  
  
}
