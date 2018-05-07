/**
 Para cambiar el 'nivel' presione cualquier tecla
 */

Graph[] levels;

// total, current por defecto vale 0
// ver: https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html
int total, current;

void setup() {
  size(600, 600);
  // numero total de niveles
  total = 5;
  levels = new Graph[total];
  for (int i = 0; i < levels.length; i++){
    levels[0] = new Graph("Nivel1.csv","ConexcionesNivel1.csv","NuevasLineasNivel1.csv");
    levels[1] = new Graph("Nivel2.csv","ConexcionesNivel2.csv","NuevasLineasNivel2.csv");
    levels[2] = new Graph("Nivel3.csv","ConexcionesNivel3.csv","NuevasLineasNivel3.csv");
    levels[3] = new Graph("Nivel4.csv","ConexcionesNivel4.csv","NuevasLineasNivel4.csv");
    levels[4] = new Graph("Nivel5.csv","ConexcionesNivel5.csv","NuevasLineasNivel5.csv");
  }
  
}

void draw() {
  background(255);
  levels[current].display();
  
}

void keyPressed() {
  current = current < total-1 ? current+1 : 0;
}
