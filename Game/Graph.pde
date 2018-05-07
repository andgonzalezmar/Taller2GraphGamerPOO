/**
 Un grafo esta compuesto de un conjunto de nodos
 y un conjunto de lineas.
 */

class Graph {
  // 1. Attributes
  Node[] nodes;
  Line[] lines;
  ConnectNodes[] uniones;
  DrawLine[] unirLineas;
  
  Table ubicacionNodos;
  Table conexiones;
  Table pintarLineas;
  
  int cantidad;
  // 2. Constructors
  // 2.1. Default in this case dummy constructor
  Graph() {
    for (int i = 0; i < nodes.length; i++)
      nodes[i] = i<5 ? new Circle() : new Rectangle();
    // conecta todos los nodos en bucle
    lines = new Line[nodes.length];
    for (int i = 0; i < lines.length; i++){
      if (i < lines.length-1)
        lines[i] = new Line(nodes[i], nodes[i+1]);
      else
        lines[i] = new Line(nodes[i], nodes[0]);
    }
  }

  // 2.2. Main constructor
  // file es un archico csv ubicado en la carpeta
  // data del sketch. Implemente este constructor
  // empleando Table (https://processing.org/reference/Table.html)
  Graph(String file, String file2, String file3) {
    int contador = 0;
    ubicacionNodos = loadTable(file,"header");
    nodes = new Node[ubicacionNodos.getRowCount()];
    for(int i = 0; i< ubicacionNodos.getRowCount() ;i++){
      TableRow nodes1 = ubicacionNodos.getRow(i);
      int x = nodes1.getInt("x");
      int y = nodes1.getInt("y");
      nodes[i] = i<5 ? new Circle(new PVector(x,y), float (35)): new Rectangle(new PVector(x,y), float (35));
    }
    
   conexiones = loadTable(file2);
    for(int i = 0; i < conexiones.getRowCount(); i++){
      for(int j = 0; j < conexiones.getRowCount(); j++){
        float aux = conexiones.getFloat(i,j);
        if(aux == 1){
         contador++; 
        }
      }
    }
    
    lines = new Line[contador];
    int x=-1;
    for(int i=0;i < conexiones.getRowCount();i++){
     for(int j=0;j < conexiones.getRowCount();j++){
      if(conexiones.getFloat(i, j)==1){
     x++;
     lines[x]= new Line(nodes[i], nodes[j]);
      }
     }
   }
   
   uniones = new ConnectNodes[contador];
   for(int i = 0; i < nodes.length;i++){
     uniones[i] = new ConnectNodes(nodes[i]);
   }
   
   pintarLineas = loadTable(file3,"header");
   unirLineas = new DrawLine[pintarLineas.getRowCount()];  
   for(int i = 0; i < pintarLineas.getRowCount();i++){
     unirLineas[i].loadData(file3);
     }
   if(mousePressed == true){
     for(int i = 0; i < pintarLineas.getRowCount();i++){
     unirLineas[i].subirAtabla(file3,nodes[i]);
     }
   }
  }

  void display() {
    pushStyle();
    strokeWeight(3);
    stroke(255, 255, 0);
    for (int i = 0; i < lines.length; i++){
      lines[i].display();
    }
    for (int i = 0; i < nodes.length; i++){
      nodes[i].display();
    }    
    for (int i = 0; i < nodes.length; i++){
      if(mousePressed == true){
      uniones[i].clickedI(nodes[i]);
      }     
    }
    for (int i = 0; i < nodes.length; i++){
    if(mousePressed == true){
    uniones[i].clickedF(nodes[i]);
    }
    }
    for (int i = 0; i < nodes.length; i++){
    uniones[i].display(); 
    }
    for (int i = 0; i < unirLineas.length; i++){  
      unirLineas[i].display();
    }
    popStyle();
  }
}
