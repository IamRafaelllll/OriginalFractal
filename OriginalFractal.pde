public ArrayList<Stick> fractalTree = new ArrayList<Stick>();
public ArrayList<PVector> leaves = new ArrayList<PVector>();
public int count = 0;
public void setup() {
  size(400, 400);
  for (int i=0; i<cloudy.length; i++) {
    cloudy[i]=new Cloud();
  }
  PVector orig = new PVector(width / 2, height);
  PVector orig2 = new PVector(width / 2, height - 100);
  Stick root = new Stick(orig, orig2); 
  //if (count<6){
  //    fill(162,42,42); 
  //   }
  fractalTree.add(root);
}

public void mousePressed() {
  for (int i = fractalTree.size() -1; i >= 0; i--) {
    Stick tree = fractalTree.get(i);
    //if the current Stick has no children: add them
    if (!tree.sprout) {

      fractalTree.add(tree.StickA());
      fractalTree.add(tree.StickB());
    }
    tree.sprout = true;
  }
  count ++;
  if (count==2||count == 4||count ==6||count==10) {
    for (int i = 0; i < fractalTree.size(); i++) {
      Stick current = fractalTree.get(i);
      if (!current.sprout) {
        PVector leaf = current.finalS.copy();
        leaves.add(leaf);
      }
    }
  }
}

public void draw() {
  int daylight = 85;
  if (count>=1){
   daylight-=10; 
  }
  if (count>=2){
    daylight-=10;
  }
  if (count>=3){
    daylight-=10;
  }
  if (count>=4){
    daylight-=8;
  }
  if (count>=5){
    daylight-=7;
  }
  if (count>=6){
    daylight-=5;
  }
  background(0, daylight, 102);
  stroke(255);
  fill(192);
  ellipse(20, 20, 30, 30);
  noStroke (); 
  for (int i=0; i<cloudy.length; i++) {
    fill(49, 99, 0);
    cloudy[i].show(); 
    cloudy[i].drift();
  }

  for (int i=0; i<cloudy.length; i++) {
    fill(49, 99, 0);
    cloudy[i].show(); 
    cloudy[i].drift();
  }
  for (int i = 0; i < fractalTree.size(); i++) {
    fractalTree.get(i).show();
  }
  for (int i = 0; i < leaves.size(); i++) {
    fill(0, 121, 0);
    stroke(0);
    PVector leaf = leaves.get(i);
    ellipse(leaf.x, leaf.y, 8, 8);
    leaf.y += random(0, 2);
  }
}
