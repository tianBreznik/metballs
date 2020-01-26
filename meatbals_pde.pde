Blob b;
Blob[] blobs = new Blob[5];

//COMBINE WITH BLOB TRACKING DA LAHKO Z RDECIM PREDMETOM KONTROLIRAS BLOB IN POTEM
//DODAJ SE EN OTHER BLOB KI JE KOT PAK IN POTEM JE TAK AIR HOCKEY CAMERA GAME - 
//TISTI NEW BLOB JE ZOGICA AL PAC KAJ IN Z TRACKED BLOBS GA DEFLECTAS ON EACH SIDE
//IN MORAS PREPRECIT DA GRE ZOGICA PAST EITHER SIDE - PA MOGOCE SE NAREDI TAK DA JE 
//SE VSE STRANI SVETIJO TAK NEON - IN NEKI EFFEKT KO SE ZOGICA ZALETI  - VSE OBJECT BASED OFC
// https://www.youtube.com/watch?v=ccYLb7cLB1I&list=PL2K0O_MNp_6rgepNURSO3eUJ57aLPVFkF&index=40&t=0s 
//PO 16 SE ZACNE TRACKING 
void setup(){
  size(800, 400);
  colorMode(HSB);
  for (int i = 0; i < blobs.length; i++){
    blobs[i] = new Blob(random(width), random(height));
  }
  //b = new Blob(100, 100);
}

void draw(){
  background(51);
  
  loadPixels();
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      int index = x + y * width;
      float sum = 0;
      for(Blob b: blobs){
        float d = dist(x, y, b.pos.x, b.pos.y);
        sum += 100 * b.r / d;
      }
      pixels[index] = color(constrain(sum, 0, 220), 255, 255);
    
    }
  }
  
  updatePixels();
  
  for(Blob b : blobs){
   b.update(); 
   // b.show();
  }

}
