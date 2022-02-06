
public ArrayList<Stick> fractalTree = new ArrayList<Stick>();
public ArrayList<PVector> leaves = new ArrayList<PVector>();
public int count = 0;
public void setup(){
  size(400,400);
for (int i=0;i<cloudy.length;i++){
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

public void mousePressed(){
  for(int i = fractalTree.size() -1; i >= 0; i--){
    Stick current = fractalTree.get(i);
    //if the current Stick has no children: add them
    if(!current.finished){
     
      fractalTree.add(current.StickA());
      fractalTree.add(current.StickB());
    }
    current.finished = true;
  }

  count ++;
  

  if(count==2||count == 6||count ==9||count==10){
    for(int i = 0; i < fractalTree.size(); i++){
      Stick current = fractalTree.get(i);
     
      if(!current.finished){
        PVector leaf = current.end.copy();
        leaves.add(leaf);
      }
    }
  }
    
}

public void draw(){
  background(0,51,102);
  stroke(255);
      fill(192);
   ellipse(20,20,30,30);
   noStroke (); 
   for(int i=0;i<cloudy.length;i++){
    fill(49,99,0);
   cloudy[i].show(); 
   cloudy[i].drift();
  }
      
      for (int i=0;i<cloudy.length;i++){
    fill(49,99,0);
   cloudy[i].show(); 
   cloudy[i].drift();
  }
  for(int i = 0; i < fractalTree.size(); i++){
    fractalTree.get(i).show();
  }
  for(int i = 0; i < leaves.size(); i++){
    fill(0,121,0);
    stroke(0);
    PVector leave = leaves.get(i);
    ellipse(leave.x, leave.y, 8, 8);
       leave.y += random(0, 2);
  }
 
   
}
