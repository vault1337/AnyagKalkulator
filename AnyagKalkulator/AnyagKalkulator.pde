import controlP5.*;
import java.util.*;

ControlP5 cp5;
List<Material> anyagok;
List<String> materialGroups;
List<String> wnrs;
List<String> profiles;
List<Integer> a;
List<Integer> b;
List<Integer> c;

String selectedMaterialGroup;
String selectedWnr;
String selectedProfile;
int selectedA;
int selectedB;
int selectedC;
Material selectedMaterial;

void setup(){
  size(800, 600);
  anyagok = new ArrayList<Material>();
  materialGroups = new ArrayList<String>();
  wnrs =  new ArrayList<String>();
  profiles =  new ArrayList<String>();
  a = new ArrayList<Integer>();
  b = new ArrayList<Integer>();
  c = new ArrayList<Integer>();
  
  for(int i = 0; i < 9; i++){
    anyagok.add(new Material(
    "acél", "1.2352", "Zártszelvény", 20 * (i + 1), 40, 3, 6000, i));  
  }
  anyagok.add(new Material(
    "alumínium", "1.0503", "Cső", 42, 0, 3, 6000, 20));
  
  for(Material m : anyagok){
    addToList(materialGroups, m.materialGroup);
    addToList(profiles, m.profile);
  }
  
  // Itt már elérhető minden alapnyag
  
  cp5 = new ControlP5(this); //<>//
  /* add a ScrollableList, by default it behaves like a DropdownList */
  cp5.addScrollableList("Wnrs")
     .setPosition(220, 100)
     .setSize(200, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(wnrs)
     .setType(ScrollableList.DROPDOWN) // currently supported DROPDOWN and LIST
     ;
   cp5.addScrollableList("Profilok")
     .setPosition(430, 100)
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
}

void draw(){
  background(100, 211, 43);
}

void A(int n){
  selectedA = a.get(n);
}
void B(int n){
  selectedB = b.get(n);
}
void C(int n){
  selectedC = c.get(n);
}
void L(int n){
  //selectedL = n;
}

void Wnrs(int n){
  selectedWnr = wnrs.get(n);
}

void Profilok(int n){
  selectedProfile = profiles.get(n);
  baseFilter();
}
void Anyagcsoport(int n){
  selectedMaterialGroup = materialGroups.get(n);
  baseFilter();
}

void baseFilter(){
  // TODO anyagcsoport és profil szerinti szűrés
  if((selectedProfile != null) &&
     (selectedMaterialGroup != null)){
    a = new ArrayList<Integer>();
    b = new ArrayList<Integer>();
    c = new ArrayList<Integer>();
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
   }
}

void fineFilter(){
  // TODO WNR és A-B-C méretváltás szűrése
}

void calculatePrice(){
  // TODO kiszámolni a végleges árat
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

void addToList(List<Integer> lista, int ertek){
  boolean exists = false;
  for(Integer i : lista){
    if(i == ertek){
      exists = true;
      break;
    }
  }
  if(exists == false){
    lista.add(ertek);
  }
}
