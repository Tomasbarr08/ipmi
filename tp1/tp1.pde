PImage kirbyImg;

void setup() {
  size(800, 400);
  kirbyImg = loadImage("kirby.jpg");
}

void draw() {
  background(205, 170, 125);

  stroke(200);
  line(width/2, 0, width/2, height);

  // Imagen de referencia
  imageMode(CORNER);
  image(kirbyImg, 0, 0, width/2, height);
  
  noStroke();
  fill(100, 50, 30, 100);
  ellipse(610, 290, 230, 150);

  stroke(0); // Contorno negro
  strokeWeight(6); // Grosor del contorno
  fill(255, 190, 190); // Relleno rosa crema

  //cuerpo de Kirby
  float x = 600; // posición horizontal
  float y = 160; // posición vertical
  float diametro = 240;

  // Pies
  stroke(0);
  strokeWeight(6);
  fill(220, 40, 40);

  pushMatrix();
  translate(x - 40, y + 100);
  rotate(radians(-30));
  ellipse(0, 0, 155, 95);
  popMatrix();

  pushMatrix();
  translate(x + 60, y + 100);
  rotate(radians(30));
  ellipse(0, 0, 150, 95);
  popMatrix();

  // Brazos detrás del cuerpo
  fill(255, 190, 190);
  ellipse(x - 120, y + 60, 70, 70);
  ellipse(x + 120, y + 30, 70, 70);

  // Cuerpo
  stroke(0);
  strokeWeight(6);
  fill(255, 190, 190);
  ellipse(x, y, diametro, diametro);

  // Mejillas
  noStroke();
  fill(255, 80, 90, 90); // Difuminado
  ellipse(x - 75, y + 10, 44, 44); // Izquierda
  ellipse(x + 55, y + 10, 44, 44); // Derecha
  
  stroke(255, 0, 0);
  strokeWeight(4);

  // Líneas mejilla izquierda
  line(510, 164, 510, 177);
  line(518, 170, 518, 177);
  line(527, 170, 527, 177);

  // Líneas mejilla derecha
  line(644, 155, 645, 170);
  line(656, 155, 655, 170);
  line(667, 155, 668, 170);

  // Ojos
  stroke(0);
  strokeWeight(6);
  fill(0);
  float ojoAncho = 40;
  float ojoAlto = 80;
  ellipse(x - 60, y - 25, ojoAncho, ojoAlto);
  ellipse(x + 16, y - 25, ojoAncho, ojoAlto);

  // Pupilas
  fill(240, 220, 190);
  float pupilaAncho = 30;
  float pupilaAlto = 50;
  ellipse(x - 62, y - 38, pupilaAncho, pupilaAlto);
  ellipse(x + 13, y - 38, pupilaAncho, pupilaAlto);

  // Brazos frontales (sin contorno)
  noStroke();
  fill(255, 190, 190);
  ellipse(x - 102, y + 53, 55, 60); // Izquierdo
  ellipse(x + 111, y + 29, 65, 65); // Derecho

  // Boca
  fill(140, 30, 50);
  ellipse(x - 30, y + 26, 7, 14);
}
