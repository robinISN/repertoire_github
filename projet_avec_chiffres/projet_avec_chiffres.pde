import processing.serial.*;
import pt.citar.diablu.nxt.protocol.*;
import pt.citar.diablu.processing.nxt.*;
import pt.citar.diablu.nxt.brick.*;


LegoNXT lego;



PImage haut ; //listing de toutes les images utilisées dans le programme
PImage bas ;
PImage gauche ;
PImage droite ;
PImage stop ;
PImage fond ;
PImage rotation ;


void setup()
{
  size(800, 450); //fenêtre
  fond = loadImage("new_fond.jpg");  //importation des différentes images utilisées dans le programme

  haut = loadImage("fleche_haut.jpg");
  bas = loadImage("fleche_bas.jpg");
  gauche = loadImage("fleche_gauche.jpg");
  droite = loadImage("fleche_droite.jpg");
  stop = loadImage("stop.gif");
  rotation = loadImage("rotation.jpg")
  lego = new LegoNXT(this, "COM8");
  frameRate(5);
  image(fond, 0, 0); //mise en place de l'image de fond
  
}

void draw() {
  image(rotation, 0, 0);
  fill(255);
  text(lego.getMotorRotationCount(LegoNXT.MOTOR_B),110,70);
  text(lego.getMotorRotationCount(LegoNXT.MOTOR_C),342,70);
}

void keyPressed() {
  println(key);

  

  if (key == CODED) {
    if (keyCode == UP) { //si la touche "flèche du haut" est pressée
      println("UP!");

      lego.motorForward(LegoNXT.MOTOR_B, 100); //moteur B est mis en marche, vers l'avant, puissance 100
      lego.motorForward(LegoNXT.MOTOR_C, 100); //moteur C est mis en marche, vers l'avant, puissance 100
      image(fond, 0, 0); //réinitialisation de l'interface graphique
      image(haut, 600, 180); // l'image "haut" apparait aux coordonnées (600;180)
      fill(0); // texte de couleur noire
      textSize(20); //taille de police du texte
      text("utilisé", 120, 130); // le texte "utilisé" apparait aux coordonnées (120;130)
      text("utilisé", 355, 130); // le texte "utilisé" apparait aux coordonnées (355;130)
     
      
    } 
     if (keyCode == DOWN) { // si la touche "flèche du bas" est pressée
      println("DOWN!");
      lego.motorForward(LegoNXT.MOTOR_B, -100); //moteur B est mis en marche, vers l'arrière, puissance 100
      lego.motorForward(LegoNXT.MOTOR_C, -100); //moteur C est mis en marche, vers l'arrière, puissance 100
      image(fond, 0, 0); //réinitialisation de l'interface graphique
      image(bas, 600, 180);
      fill(0); // texte de couleur noire
      textSize(20); //taille de police du texte
      text("utilisé", 120, 130); // le texte "utilisé" apparait aux coordonnées (120;130)
      text("utilisé", 355, 130); // le texte "utilisé" apparait aux coordonnées (355;130)
    }
     if (keyCode == LEFT) {
      println ("LEFT!");
      lego.motorForward(LegoNXT.MOTOR_B, 100);
      lego.motorHandBrake(LegoNXT.MOTOR_C);
      image(fond, 0, 0);
      image(gauche, 600, 180);
      fill(0);
      text("utilisé", 120, 130);
      text("repos", 355, 130);
    }
     if (keyCode == CONTROL) { // si la touche "CONTROL" est pressée
      println ("STOP!");
      lego.motorHandBrake(LegoNXT.MOTOR_B); //le moteur B est arrêté
      lego.motorHandBrake(LegoNXT.MOTOR_C); //le moteur C est arrêté
      lego.motorHandBrake(LegoNXT.MOTOR_A); //le moteur A est arrêté
      image(fond, 0, 0);
      image(stop, 600, 180);
      fill(0);
      textSize(20); //taille de police du texte
      text("repos", 120, 130);
      text("repos", 355, 130);
    }
     if (keyCode == RIGHT) {
      println ("RIGHT!");
      lego.motorForward(LegoNXT.MOTOR_C, 100);
      lego.motorHandBrake(LegoNXT.MOTOR_B);
      image(fond, 0, 0);
      image(droite, 600, 180);
      fill(0);
      textSize(20);
      text("repos", 120, 130);
      text("utilisé", 355, 130);
    }
     if (keyCode == SHIFT) {
      lego.motorForward(LegoNXT.MOTOR_A, 50);
    }
  }
   if (key == 'o') {
    println ("O");
    lego.motorForwardLimit(LegoNXT.MOTOR_C, 50,3600);
    lego.motorForwardLimit(LegoNXT.MOTOR_B, 100,5400);
    image(fond, 0, 0);
    fill(0);
    textSize(110);
    text("O", 600, 250);

    textSize(20);
    text("utilisé", 120, 130);
    text("utilisé", 355, 130);
  }
   if (key == '*') {
    println("tourne fort !");
    lego.motorForward(LegoNXT.MOTOR_B, -100);
    lego.motorForward(LegoNXT.MOTOR_C, 100);
    image(fond, 0, 0);
    fill(0);
    textSize(110);
    text("??", 600, 260);
    textSize(20);
    text("utilisé", 120, 130);
    text("utilisé", 355, 130);
  }

   if (key == '(' | key == '8') {
    println("avance doucement");
    lego.motorForward(LegoNXT.MOTOR_B, 30);
    lego.motorForward(LegoNXT.MOTOR_C, 30);
    image(fond, 0, 0);
    image(haut, 600, 180);
    fill(0);
    textSize(20);
    text("utilisé", 120, 130);
    text("utilisé", 355, 130);
    
  }
   if (key == '"' | key == '4') {
    println("tourne à gauche doucement");
    lego.motorForward(LegoNXT.MOTOR_B, 30);
    lego.motorHandBrake(LegoNXT.MOTOR_C);
    image(fond, 0, 0);
    image(gauche, 600, 180);
    fill(0);
    textSize(20);
    text("utilisé", 120, 130);
    text("repos", 355, 130);
  }
   if (key == '_' | key == '6') {
    println("tourne à droite doucement");
    lego.motorHandBrake(LegoNXT.MOTOR_B);
    lego.motorForward(LegoNXT.MOTOR_C, 30);
    image(fond, 0, 0);
    image(droite, 600, 180);
    fill(0);
    textSize(20);
    text("repos", 120, 130);
    text("utilisé", 355, 130);
  }
   if (key == '-' | key == '2') {
    println("recule doucement");
    lego.motorForward(LegoNXT.MOTOR_B, -30);
    lego.motorForward(LegoNXT.MOTOR_C, -30);
    image(fond, 0, 0);
    image(bas, 600, 180);
    fill(0);
    textSize(20);
    text("utilisé", 120, 130);
    text("utilisé", 355, 130);
  }
   if (key == 'l' | key == 'L') {
    image(fond, 0, 0);
    fill(0);
    textSize(110);
    text("L", 600, 260);
    fill(0);
    textSize(20);
    text("utilisé", 120, 130);
    text("utilisé", 355, 130);
    lego.motorForwardLimit(LegoNXT.MOTOR_B, 100, 1000);
    lego.motorForwardLimit(LegoNXT.MOTOR_C, 100, 1000);
    delay(2000);
    lego.motorForwardLimit(LegoNXT.MOTOR_B, 100, 250);
    lego.motorHandBrake(LegoNXT.MOTOR_C);
    delay(1000);
    lego.motorForwardLimit(LegoNXT.MOTOR_B, 100, 600);
    lego.motorForwardLimit(LegoNXT.MOTOR_C, 100, 600);
  }


   if (key == 't' | key == 'T') {
    image(fond, 0, 0);
    fill(0);
    textSize(110);
    text("T", 600, 260);
    fill(0);
    textSize(20);
    text("utilisé", 120, 130);
    text("utilisé", 355, 130);
    lego.motorForwardLimit(LegoNXT.MOTOR_B, 100, 1800);
    lego.motorForwardLimit(LegoNXT.MOTOR_C, 100, 1800);
    delay(2000);
    lego.motorHandBrake(LegoNXT.MOTOR_B);
    lego.motorForwardLimit(LegoNXT.MOTOR_C, 100, 250);
    delay(1000);
    lego.motorForwardLimit(LegoNXT.MOTOR_B, 100, 400);
    lego.motorForwardLimit(LegoNXT.MOTOR_C, 100, 400);
    delay(1000);
    lego.motorHandBrake(LegoNXT.MOTOR_C);
    lego.motorHandBrake(LegoNXT.MOTOR_B);
    delay(1000);
    lego.motorForwardLimit(LegoNXT.MOTOR_B, -100, 800);
    lego.motorForwardLimit(LegoNXT.MOTOR_C, -100, 800);
   
  }
  
  if (key == 'v' | key == 'V') {
    image(fond, 0, 0);
    fill(0);
    textSize(110);
    text("V", 600, 260);
    fill(0);
    textSize(20);
    text("utilisé", 120, 130);
    text("utilisé", 355, 130);
    lego.motorForwardLimit(LegoNXT.MOTOR_B, 100, 1800);
    lego.motorForwardLimit(LegoNXT.MOTOR_C, 75, 1800);
    delay(2000);
    lego.motorHandBrake(LegoNXT.MOTOR_B);
    lego.motorForwardLimit(LegoNXT.MOTOR_C, -100, 400);
    delay(2000);
    lego.motorForwardLimit(LegoNXT.MOTOR_B, 100, 1200);
    lego.motorForwardLimit(LegoNXT.MOTOR_C, 100, 1200);
    
  }
   if (key == 'z' | key == 'Z') {
    image(fond, 0, 0);
    fill(0);
    textSize(110);
    text("Z", 600, 260);
    fill(0);
    textSize(20);
    text("utilisé", 120, 130);
    text("utilisé", 355, 130);
    lego.motorForwardLimit(LegoNXT.MOTOR_B, 100, 1000);
    lego.motorForwardLimit(LegoNXT.MOTOR_C, 100, 1000);
    delay(2000);
    lego.motorHandBrake(LegoNXT.MOTOR_B);
    lego.motorForwardLimit(LegoNXT.MOTOR_C, 100, 500);
    delay(2300);
    lego.motorForwardLimit(LegoNXT.MOTOR_B, 100, 1200);
    lego.motorForwardLimit(LegoNXT.MOTOR_C, 100, 1200);
    delay(2300);
    lego.motorHandBrake(LegoNXT.MOTOR_C);
    lego.motorForwardLimit(LegoNXT.MOTOR_B, 100, 500);
    delay(2300);
    lego.motorForwardLimit(LegoNXT.MOTOR_B, 100, 1000);
    lego.motorForwardLimit(LegoNXT.MOTOR_C, 100, 1000);
    
    
  }
  /*
 if (key == 's' | key == 's') {
    image(fond, 0, 0);
    fill(0);
    textSize(110);
    text("S", 600, 260);
    fill(0);
    textSize(20);
    text("utilisé", 120, 130);
    text("utilisé", 355, 130);
    lego.motorForwardLimit(LegoNXT.MOTOR_B, 100, 1000);
    lego.motorForwardLimit(LegoNXT.MOTOR_C, 100, 1000);
    
 } */
   if (key == '²') {
    exit();
  }
}




//  while (key == 'r') {
//  lego.resetMotorPosition(LegoNXT.MOTOR_B, false);
// lego.resetMotorPosition(LegoNXT.MOTOR_C, false);

