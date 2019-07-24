class Material{
  // A felhasznált kép fájlneve megegyezik a name-el
  String materialGroup;
  String wnr;
  String profile;
  
  String A;
  String B;
  String C;
  float L;
  float maxL;
  
  float pricePerMeter;
  
  Material(){
  }
  
  Material(String materialGroup, String wnr, String profile,
    String A, String B, String C, float maxL, float pricePerMeter){
    this.materialGroup = materialGroup;
    this.wnr = wnr;
    this.profile = profile;
    this.A = A;
    this.B = B;
    this.C = C;
    this.maxL = maxL;
    this.L = 0;
    this.pricePerMeter = pricePerMeter;
  }
}
