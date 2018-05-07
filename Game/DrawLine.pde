class DrawLine{
  // 1. Attributes
  String lineasNivel;
  Table tabla1;
  float x1;
  float y1;
  float x2;
  float y2;
  
  // 2. Constructors
  // 2.1. Default
  DrawLine(String file) {
    lineasNivel = file;
  }
 // 3. Methods
 
 void subirAtabla(String file, Node node1){
 tabla1 = loadTable(file,"header");
 TableRow row1 = tabla1.addRow();
 row1.setFloat("x1", node1.position().x);
 row1.setFloat("y1", node1.position().y);
 row1.setFloat("x2", 0);
 row1.setFloat("y2", 0);
 saveTable(tabla1,file);
 loadData(file);
 }
 
 void loadData(String file) { 
 tabla1 = loadTable(file, "header");
 for (int i = 0; i < tabla1.getRowCount(); i++){
 TableRow row2 = tabla1.getRow(i);
 x1 = row2.getInt("x1");
 y1 = row2.getInt("y1");
 x2 = row2.getInt("x2");
 y2 = row2.getInt("y2");
 }
}

  void display() {
    pushStyle();
    strokeWeight(10);
    stroke(0);
    line(x1,y1,x2,y2);
    popStyle();
  }
  
}
