class Cloud {
  int myX, myY, myWidth, myHeight, mySpeed, myColor, myOpacity;
  Cloud() {
    myX = (int)(Math.random()*1100)-150;
    myY = (int)(Math.random()*80);
    myWidth = (int)(Math.random()*80)+80;
    myHeight = (int)(Math.random()*40)+20;
    mySpeed = (int)(Math.random()*2)+1;
    myColor=255;
    myOpacity = (int)(Math.random()*60)+60;
  }
  void show() {
    fill(myColor, myOpacity);
    ellipse(myX, myY, myWidth, myHeight);
  }
  void drift() {
    myX+=mySpeed;
    if (myX>430) {
      myX=-50;
    }
  }
}
Cloud []cloudy = new Cloud[10];
