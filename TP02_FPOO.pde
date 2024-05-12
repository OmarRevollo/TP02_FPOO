abstract class GameObject {
  PVector position;
  
  GameObject(float x, float y) {
    position = new PVector(x, y);
  }
  
  abstract void display();
}

class Dice extends GameObject {
  int value;
  PFont font;
  
  Dice(float x, float y, PFont font) {
    super(x, y);
    this.font = font;
    rollDice();
  }
  
  void rollDice() {
    value = (int)random(1, 7);
  }
  
  void display() {
    fill(255);
    rect(position.x, position.y, 100, 100);
    fill(0);
    textFont(font, 32);
    textAlign(CENTER, CENTER);
    // Dibuja los puntos del dado en lugar de los números
    if (value == 1) {
      ellipse(position.x + 50, position.y + 50, 10, 10);
    } else if (value == 2) {
      ellipse(position.x + 30, position.y + 30, 10, 10);
      ellipse(position.x + 70, position.y + 70, 10, 10);
    } else if (value == 3) {
      ellipse(position.x + 30, position.y + 30, 10, 10);
      ellipse(position.x + 50, position.y + 50, 10, 10);
      ellipse(position.x + 70, position.y + 70, 10, 10);
    } else if (value == 4) {
      ellipse(position.x + 30, position.y + 30, 10, 10);
      ellipse(position.x + 70, position.y + 30, 10, 10);
      ellipse(position.x + 30, position.y + 70, 10, 10);
      ellipse(position.x + 70, position.y + 70, 10, 10);
    } else if (value == 5) {
      ellipse(position.x + 30, position.y + 30, 10, 10);
      ellipse(position.x + 70, position.y + 30, 10, 10);
      ellipse(position.x + 50, position.y + 50, 10, 10);
      ellipse(position.x + 30, position.y + 70, 10, 10);
      ellipse(position.x + 70, position.y + 70, 10, 10);
    } else if (value == 6) {
      ellipse(position.x + 30, position.y + 30, 10, 10);
      ellipse(position.x + 70, position.y + 30, 10, 10);
      ellipse(position.x + 30, position.y + 50, 10, 10);
      ellipse(position.x + 70, position.y + 50, 10, 10);
      ellipse(position.x + 30, position.y + 70, 10, 10);
      ellipse(position.x + 70, position.y + 70, 10, 10);
    }
  }
}

class Board {
  Dice dice;
  ArrayList<Integer> diceRolls;
  PFont font;
  
  Board() {
    font = createFont("Arial", 32);
    dice = new Dice(width/2 - 50, height/2 - 50, font); // Posiciona el dado en el centro del lienzo
    diceRolls = new ArrayList<Integer>();
  }
  
  void rollDice() {
    dice.rollDice();
    diceRolls.add(dice.value);
  }
  
  void display() {
    dice.display();
    displayRolls();
  }
  
  void displayRolls() {
    fill(0);
    textFont(font, 16);
    textAlign(RIGHT, TOP);
    text("Último valor: " + dice.value, width - 10, 10);
  }
  
  void drawResults() {
    println("Resultados de los dados:");
    for (int i = 0; i < diceRolls.size(); i++) {
      if (i > 0 && i % 4 == 0) {
        println();
      }
      print(diceRolls.get(i) + "\t");
    }
    println();
  }
