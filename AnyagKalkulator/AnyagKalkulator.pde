import controlP5.*;
import java.util.*;

ControlP5 cp5;

void setup(){
  size(800, 600);
  cp5 = new ControlP5(this);
  // TODO töltsük be az adatbázist
  // válogassuk ki, milyen anyagok, milyen paraméterekkel vannak
  List materialTypes = Arrays.asList("1.2352", "1.2379", "1.0570");
  /* add a ScrollableList, by default it behaves like a DropdownList */
  cp5.addScrollableList("Anyagcsoport")
     .setPosition(100, 100)
     .setSize(200, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(materialTypes)
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
