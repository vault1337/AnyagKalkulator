import controlP5.*;
import java.util.*;

ControlP5 cp5;
List<Material> anyagok;
List<String> materialGroups;
List<String> wnrs;
List<String> profiles;

void setup(){
  size(800, 600);
  anyagok = new ArrayList<Material>();
  materialGroups = new ArrayList<String>();
  wnrs =  new ArrayList<String>();
  profiles =  new ArrayList<String>();
  
  for(int i = 0; i < 9; i++){
    anyagok.add(new Material(
    "acél", "1.2352", "Zártszelvény", 20 * (i + 1), 40, 3, 6000, i));  
  }
  anyagok.add(new Material(
    "alumínium", "1.0503", "Cső", 42, 0, 3, 6000, 20));
  
  for(Material m : anyagok){
    boolean exists = false;
    for(String s : materialGroups){
      if(m.materialGroup.equals(s)){
        exists = true;
      }
    }
    if(exists == false){
      materialGroups.add(m.materialGroup);
    }
    exists = false;
    for(String s : wnrs){
      if(m.wnr.equals(s)){
        exists = true;
      }
    }
    if(exists == false){
      wnrs.add(m.wnr);
    }
    exists = false;
    for(String s : profiles){
      if(m.profile.equals(s)){
        exists = true;
      }
    }
    if(exists == false){
      profiles.add(m.profile);
    }
  }
  
  // Itt már elérhető minden alapnyag
  
  cp5 = new ControlP5(this); //<>//
  // TODO töltsük be az adatbázist
  // válogassuk ki, milyen anyagok, milyen paraméterekkel vannak
  /* add a ScrollableList, by default it behaves like a DropdownList */
  cp5.addScrollableList("Anyagcsoport")
     .setPosition(100, 100)
     .setSize(200, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(wnrs)
     .setType(ScrollableList.DROPDOWN) // currently supported DROPDOWN and LIST
     ;
}

void draw(){
  background(100, 211, 43);
}

void baseFilter(){
  // TODO anyagcsoport és profil szerinti szűrés
}

void fineFilter(){
  // TODO A-B-C méretváltás szűrése
}

void calculatePrice(){
  // TODO kiszámolni a végleges árat
}
