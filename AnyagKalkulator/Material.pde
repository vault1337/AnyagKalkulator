class Material{
  // A felhasznált kép fájlneve megegyezik a name-el
  String materialGroup;
  String wnr;
  String profile;
  
  int A;
  int B;
  int C;
  int L;
  int maxL;
  
  int pricePerMeter;
  
  Material(){
  }
  
  Material(String materialGroup, String wnr, String profile,
    int A, int B, int C, int maxL, int pricePerMeter){
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
