//Trabajo de Tomas Barraza - Comision: 1
int estado = 0;
PImage imagen1;
PImage imagen2;
PImage imagen3;
PImage imagen4;
PImage imagen5;
PImage imagen6;

float escala = 0.1;
float limite = 0.7;

float textoY = 480;
float textoY2 = -200;
float textoY3 = 600;
float textoY4 = 480;
float textoY5 = 600;
boolean subiendo = true;
boolean pausa1 = false;
boolean pausa2 = false;
boolean pausa3 = false;
boolean pausa4 = false;

int pausa1Inicio = 0;
int zoomHecho = 0;
int pausa2Inicio = 0;
int pausa3Inicio = 0;
int pausa4Inicio = 0;

void setup() {
  size(640, 480);
  textAlign(CENTER, CENTER);
  textSize(18);

  imagen1 = loadImage("invincible_png.png");
  imagen2 = loadImage("invencible 2.png");
  imagen3 = loadImage("invencible 3.png");
  imagen4 = loadImage("invencible 4.png");
  imagen5 = loadImage("invencible 5.jpg");
  imagen6 = loadImage("invencible 6.jpg");
}

void draw() {
  println("estado: " + estado);

  if (estado == 0) pantallaIntro();
  else if (estado == 1) pantallaZoom();
  else if (estado == 2) pantallaInfo();
  else if (estado == 3) pantallaReparto();
  else if (estado == 4) pantallaResumen();
  else if (estado == 5) pantallaDondeVer();
  else if (estado == 6) pantallaDespedida();
}

void pantallaIntro() {
  background(0);

  String frase = "\"La verdad es que el mundo no necesita héroes Necesita algo más. Necesita un propósito, a alguien...\"";
  String linea1 = frase.substring(0, 45);
  String linea2 = frase.substring(45);

  fill(255);
  text(linea1, width / 2, height / 2 - 40);
  text(linea2, width / 2, height / 2);

  fill(50, 200, 255);
  rect(width / 2 - 80, height / 2 + 30, 160, 40, 10);
  fill(230, 230, 100);
  textSize(20);
  text("iniciar", width / 2, height / 2 + 50);
}

void pantallaZoom() {
  background(120, 200, 245);

  pushMatrix();
  translate(width / 2, height / 2);
  scale(escala);
  imageMode(CENTER);
  image(imagen1, 0, 0);
  popMatrix();

  if (escala < limite) {
    escala += 0.004;
  } else {
    if (zoomHecho == 0) zoomHecho = millis();
    if (millis() - zoomHecho > 2000) {
      estado = 2;
      textoY = 480;
      subiendo = true;
      pausa1 = false;
    }
  }
}

void pantallaInfo() {
  imageMode(CORNER);
  image(imagen2, 0, 0, width, height);

  fill(255);
  textSize(28);
  textAlign(RIGHT, TOP);

  float x = width - 40;
  text("La serie fue creada por Robert Kirkman", x, textoY);
  text("Y esta basada en el cómic del mismo nombre", x, textoY + 30);
  text("Su animación está hecha por el estudio: Skybound", x, textoY + 60);
  text("Fue estrenada el 25 de marzo de 2021", x, textoY + 90);
  text("Y cuenta con 3 temporadas hasta el momento.", x, textoY + 120);

  if (textoY > height / 2 - 60) textoY -= 1.5;
  else {
    subiendo = false;
    if (!pausa1) {
      pausa1Inicio = millis();
      pausa1 = true;
    }
    if (millis() - pausa1Inicio > 3000) {
      estado = 3;
      textoY2 = -200;
    }
  }
}

void pantallaReparto() {
  imageMode(CORNER);
  image(imagen3, 0, 0, width, height);

  fill(255);
  textSize(35);
  textAlign(CENTER, TOP);

  text("Su reparto consta de:", width / 2, textoY2);
  text("Steven Yeun (Invencible).", width / 2, textoY2 + 40);
  text("Gillian Jacobs (Atom Eve).", width / 2, textoY2 + 80);
  text("J.K. Simmons (Omni-Man).", width / 2, textoY2 + 120);
  text("Walton Goggins (Cecil Stedman).", width / 2, textoY2 + 160);
  text("Sandra Oh (Debbie Grayson).", width / 2, textoY2 + 200);
  text("Entre otros grandes actores.", width / 2, textoY2 + 240);

  if (textoY2 < height / 2 - 60) textoY2 += 1.5;
  else {
    if (!pausa2) {
      pausa2Inicio = millis();
      pausa2 = true;
    }
    if (millis() - pausa2Inicio > 3000) {
      estado = 4;
      textoY3 = 600;
    }
  }
}

void pantallaResumen() {
  imageMode(CORNER);
  image(imagen4, 0, 0, width, height);

  fill(255);
  textSize(25);
  textAlign(CENTER, CENTER);

  text("Invencible es una serie animada de superhéroes y", width / 2, textoY3);
  text("Sigue la historia de Mark Grayson, un adolescente común", width / 2, textoY3 + 30);
  text("cuyo padre es el superhéroe más poderoso del planeta.", width / 2, textoY3 + 90);
  text("Pero todo cambia cuando Mark descubre que tiene poderes", width / 2, textoY3 + 120);
  text("y se da cuenta que ser un héroe no es tan facil como parece.", width / 2, textoY3 + 150);

  if (textoY3 > height / 2 - 80) textoY3 -= 1.5;
  else {
    if (!pausa3) {
      pausa3Inicio = millis();
      pausa3 = true;
    }
    if (millis() - pausa3Inicio > 3000) {
      estado = 5;
      textoY4 = 480;
    }
  }
}

void pantallaDondeVer() {
  imageMode(CORNER);
  image(imagen5, 0, 0, width, height);

  fill(255);
  textSize(36);
  textAlign(CENTER, CENTER);

  text("Dónde puedes ver esta serie:", width / 2, textoY4);
  textSize(30);
  text("- Amazon Prime Video.", width / 2, textoY4 + 40);
  text("- Y otras paginas... ilisitas.", width / 2, textoY4 + 70);

  if (textoY4 > height / 2 - 50) textoY4 -= 1.5;
  else {
    if (!pausa4) {
      pausa4Inicio = millis();
      pausa4 = true;
    }
    if (millis() - pausa4Inicio > 3000) {
      estado = 6;
      textoY5 = 600;
    }
  }
}

void pantallaDespedida() {
  imageMode(CORNER);
  image(imagen6, 0, 0, width, height);

  fill(255);
  textSize(28);
  textAlign(CENTER, CENTER);
  text("Hasta aca la presentacion.", width / 2, textoY5);
  text("Y recuerda...", width / 2, textoY5 + 40);

  if (textoY5 > height / 2 - 40) textoY5 -= 1.5;

 
  fill(50, 200, 255);
  rect(width - 140, height - 60, 120, 40, 10);
  fill(255);
  textSize(16);
  text("Reiniciar", width - 80, height - 40);
}

void mousePressed() {
  if (estado == 0) {
    if (mouseX > width / 2 - 80 && mouseX < width / 2 + 80 &&
        mouseY > height / 2 + 30 && mouseY < height / 2 + 70) {
      estado = 1;
      escala = 0.1;
      zoomHecho = 0;
    }
  }

  if (estado == 6) {
    if (mouseX > width - 140 && mouseX < width - 20 &&
        mouseY > height - 60 && mouseY < height - 20) {
      
      estado = 0;
      escala = 0.1;
      textoY = 480;
      textoY2 = -200;
      textoY3 = 600;
      textoY4 = 480;
      textoY5 = 600;
      pausa1 = pausa2 = pausa3 = pausa4 = false;
    }
  }
}
