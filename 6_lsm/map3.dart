/*
sume +2 a 'Spain' en: 
	golds = {"Italy": 12, "USA": 33, "Brazil": 15, "China": 27, "Spain": 19, "Canada": 22, "Argentina": 8, "England": 29}
*/

void main(){

  //declaramos el mapa
  Map golds = {"Italy": 12, "USA": 33, "Brazil": 15, "China": 27, "Spain": 19, "Canada": 22, "Argentina": 8, "England": 29};

  golds["Spain"]+=2;

  print(golds);
}