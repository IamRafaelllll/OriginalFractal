public class Stick {
  public PVector start;
   PVector finalS;
  public boolean sprout = false;


  Stick(PVector begin, PVector end) {
    start = begin;
    finalS = end;
  }
  public void rando() {
    finalS.x += random(-1, 1);
    finalS.y += random(-1, 1);
  }

 public  void show() {

    stroke(51, 25, 0);
    line(start.x, start.y, finalS.x, finalS.y);
    fill(0, 51, 0);
    fill(0, 51, 25);
    noStroke();
    rect(0, 370, 400, 400);
  }


  Stick StickA() {
    PVector direction = PVector.sub(finalS, start);
    direction.rotate(PI / 6);
    direction.mult(0.67);
    PVector newEnd = PVector.add(finalS, direction);
    Stick branch = new Stick(finalS, newEnd);
    return branch;
  }
  Stick StickB() {
    PVector direction = PVector.sub(finalS, start);
    direction.rotate(- PI / 4);
    direction.mult(0.67);
    PVector newEnd = PVector.add(finalS, direction);
    Stick branch = new Stick(finalS, newEnd);
    return branch;
  }
}
