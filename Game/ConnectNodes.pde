class ConnectNodes {
// 1. Attributes
  Node inicial;
  Node end;
  float x1;
  float x2;
  float y1;
  float y2;
  int aux = 0;
   
//2. Constructor
  ConnectNodes(Node node1){
   inicial = node1;
  }
  
    // 3. Methods

  void clickedI(Node node1){
    if(node1.pick(mouseX,mouseY)){
      stroke(255);
      strokeWeight(15);
      x1 = node1.position().x;
      y1 = node1.position().y;
      
    }
  }
  
  void clickedF(Node node2){
    if(node2.pick(mouseX,mouseY)){
      stroke(255);
      strokeWeight(15);
      x2 = node2.position().x;
      y2 = node2.position().y;
    }
  }
  
  void display() {
    strokeWeight(10);
    stroke(0);
    line(x1,y1,x2,y2);
  }
}
