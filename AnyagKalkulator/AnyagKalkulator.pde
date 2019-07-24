import controlP5.*;
import java.util.*;

ControlP5 cp5;
List<Material> anyagok;
List<String> materialGroups;
List<String> wnrs;
List<String> profiles;
List<String> a;
List<String> b;
List<String> c;
PImage profilkep = null;
Textlabel price;
Button calculateButton;

String selectedMaterialGroup;
String selectedWnr;
String selectedProfile;
String selectedA;
String selectedB;
String selectedC;
Material selectedMaterial;


void setup(){
  size(800, 600);
  anyagok = new ArrayList<Material>();
  materialGroups = new ArrayList<String>();
  wnrs =  new ArrayList<String>();
  profiles =  new ArrayList<String>();
  a = new ArrayList<String>();
  b = new ArrayList<String>();
  c = new ArrayList<String>();
  
  BufferedReader reader;
  String line;
  reader = createReader("materials.csv");
  do{
    try {
      line = reader.readLine();
    } catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    if(line != null){
      String[] fields = line.split(";");
      anyagok.add(new Material(fields[0], 
                               fields[1], 
                               fields[2], 
                               fields[3], 
                               fields[4],
                               fields[5],
                               Float.parseFloat(fields[7]),
                               Float.parseFloat(fields[8])));
                             } //<>//
  }
  while(line != null);
     
  for(Material m : anyagok){
    addToList(materialGroups, m.materialGroup);
    addToList(profiles, m.profile);
  }
  selectedMaterial = anyagok.get(0);
  
  // Itt már elérhető minden alapnyag
  
  cp5 = new ControlP5(this);
  /* add a ScrollableList, by default it behaves like a DropdownList */
  cp5.addScrollableList("Wnrs")
     .setPosition(430, 100)
     .setSize(200, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(wnrs)
     .setType(ScrollableList.DROPDOWN) // currently supported DROPDOWN and LIST
     ;
   cp5.addScrollableList("Profilok")
     .setPosition(220, 100)
     .setSize(200, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(profiles)
     .setType(ScrollableList.DROPDOWN) // currently supported DROPDOWN and LIST
     ;
   cp5.addScrollableList("Anyagcsoport")
     .setPosition(10, 100)
     .setSize(200, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(materialGroups)
     .setType(ScrollableList.DROPDOWN) // currently supported DROPDOWN and LIST
     ;
     
     cp5.addScrollableList("a")
     .setPosition(10, 200)
     .setSize(200, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(a)
     .setType(ScrollableList.DROPDOWN) // currently supported DROPDOWN and LIST
     ;
     cp5.addScrollableList("b")
     .setPosition(220, 200)
     .setSize(200, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(b)
     .setType(ScrollableList.DROPDOWN) // currently supported DROPDOWN and LIST
     .setOpen(false)
     ;
     cp5.addScrollableList("c")
     .setPosition(430, 200)
     .setSize(200, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(c)
     .setType(ScrollableList.DROPDOWN) // currently supported DROPDOWN and LIST
     ;
     cp5.addTextfield("length")
                    .setPosition(640,200)
                    .setSize(100,30)
                    .setColor(color(255,200,0))
                    .setInputFilter(ControlP5.INTEGER)
                    ;
     calculateButton = cp5.addButton("calculate").setPosition(640,250)
     .setSize(100,30)
     ;
     price = cp5.addTextlabel("price")
                    .setText("0 Ft")
                    .setPosition(630,150)
                    .setColorValue(0x00000000)
                    .setFont(createFont("Georgia",20))
                    ;
}

void draw(){
  background(255);
  if(profilkep != null){
    image(profilkep, 10, 400);  
  }
}

void A(int n){
  selectedA = a.get(n);
  fineFilter();
  selectMaterial();
}
void B(int n){
  selectedB = b.get(n);
  fineFilter();
  selectMaterial();
}
void C(int n){
  selectedC = c.get(n);
  fineFilter();
  selectMaterial();
}
void L(int n){
  //selectedL = n;
}

void Wnrs(int n){
  selectedWnr = wnrs.get(n);
  println("Választott WNR: " + selectedWnr);
  fineFilter();
  selectMaterial();
}

void Profilok(int n){
  selectedProfile = profiles.get(n);
  println("Választott profil: " + selectedProfile);
  profilkep = loadImage("Profilok/" + selectedProfile + ".png");
  profilkep.resize(200, 200);
  baseFilter();
  selectMaterial();
  
}
void Anyagcsoport(int n){
  selectedMaterialGroup = materialGroups.get(n);
  println("Választott anyagcsoport: " + selectedMaterialGroup);
  baseFilter();
  selectMaterial();
}

void calculate(int theValue){
  // itt matekolunk
  Float calculatedPrice = selectedMaterial.pricePerMeter * 
    Float.parseFloat(cp5.get(Textfield.class, "length").getText()) / 1000;
  println(calculatedPrice);
  price.setText(calculatedPrice.toString() + " Ft");
}

void baseFilter(){
  // TODO anyagcsoport és profil szerinti szűrés
  if((selectedProfile != null) &&
     (selectedMaterialGroup != null)){
    println("Anyag szűrése");
    a = new ArrayList<String>();
    b = new ArrayList<String>();
    c = new ArrayList<String>();
    wnrs = new ArrayList<String>();
    for(Material m: anyagok){
      if(m.profile.equals(selectedProfile) &&
         m.materialGroup.equals(selectedMaterialGroup)){
           addToList(a, m.A);
           addToList(b, m.B);
           addToList(c, m.C);
           addToList(wnrs, m.wnr);
       }
    }
     cp5.get(ScrollableList.class, "a").clear();
     cp5.get(ScrollableList.class, "b").clear();
     cp5.get(ScrollableList.class, "c").clear();
     cp5.get(ScrollableList.class, "Wnrs").clear();
     cp5.get(ScrollableList.class, "a").addItems(a);
     cp5.get(ScrollableList.class, "b").addItems(b);
     cp5.get(ScrollableList.class, "c").addItems(c);
     cp5.get(ScrollableList.class, "Wnrs").addItems(wnrs);
     cp5.get(ScrollableList.class, "a").setBarVisible(a.size() > 1 || (a.size() == 1 && !a.get(0).equals("0")));
     cp5.get(ScrollableList.class, "b").setBarVisible(b.size() > 1 || (b.size() == 1 && !b.get(0).equals("0")));
     cp5.get(ScrollableList.class, "c").setBarVisible(c.size() > 1 || (c.size() == 1 && !c.get(0).equals("0")));
     cp5.get(ScrollableList.class, "Wnrs").setBarVisible(wnrs.size() > 1 || (wnrs.size() == 1 && !wnrs.get(0).equals("0")));
   } //<>//
}

void fineFilter(){
  // TODO WNR és A-B-C méretváltás szűrése //<>//
  
}

void calculatePrice(){
  // TODO kiszámolni a végleges árat
}

void selectMaterial(){
  if(selectedMaterialGroup != null && //<>//
     selectedProfile != null &&
     selectedWnr != null &&
     selectedA != null &&
     selectedB != null &&
     selectedC != null){
       for(Material m: anyagok){
        if(m.materialGroup.equals(selectedMaterialGroup) &&
           m.profile.equals(selectedProfile) &&
           m.wnr.equals(selectedWnr) &&
           m.A.equals(selectedA) &&
           m.B.equals(selectedB) &&
           m.C.equals(selectedC)){
             selectedMaterial = m;
             calculateButton.setVisible(true);
             println("megvan az anyag");
         }
     }
   }
   else{
     selectedMaterial = null;
     calculateButton.setVisible(false);
     println("nincs minden kiválasztva");
   }
}

void addToList(List<String> lista, String ertek){
  boolean exists = false;
  for(String s : lista){
    if(s.equals(ertek)){
      exists = true;
      break;
    }
  }
  if(exists == false){
    lista.add(ertek);
  }
}

void addToList(List<Float> lista, float ertek){
  boolean exists = false;
  for(Float f : lista){
    if(f == ertek){
      exists = true;
      break;
    }
  }
  if(exists == false){
    lista.add(ertek);
  }
}
