// *************************
// Globalvariablen für Story
// *************************

var string GOTHIC_RESTART;

// Zeit

var int TimeCounter_Sek;
var int TimeCounter_Min;
var int TimeCounter_H;

// Highscores speichern

var int Level01_Highscore;
var int Level01_Platz;
var int Level01_Highscore_Neu;
var int Level01_Highscore_Zeit;

var int Level02_Highscore;
var int Level02_Platz;
var int Level02_Highscore_Neu;
var int Level02_Highscore_Zeit;

var int Level03_Highscore;
var int Level03_Platz;
var int Level03_Highscore_Neu;
var int Level03_Highscore_Zeit;

var int Level04_Highscore;
var int Level04_Platz;
var int Level04_Highscore_Neu;
var int Level04_Highscore_Zeit;

var int Level05_Highscore;
var int Level05_Platz;
var int Level05_Highscore_Neu;
var int Level05_Highscore_Zeit;
var int StachelMalus;

var int Level06_Highscore;
var int Level06_Platz;
var int Level06_Highscore_Neu;
var int Level06_Highscore_Zeit;

var int Level07_Highscore;
var int Level07_Platz;
var int Level07_Highscore_Neu;
var int Level07_Highscore_Zeit;

var int Level08_Highscore;
var int Level08_Platz;
var int Level08_Highscore_Neu;
var int Level08_Highscore_Zeit;

var int Level09_Highscore;
var int Level09_Platz;
var int Level09_Highscore_Neu;
var int Level09_Highscore_Zeit;

var int Level10_Highscore;
var int Level10_Platz;
var int Level10_Highscore_Neu;
var int Level10_Highscore_Zeit;

var int Level11_Highscore;
var int Level11_Platz;
var int Level11_Highscore_Neu;
var int Level11_Highscore_Zeit;

var int Level13_Highscore;
var int Level13_Platz;

// Info-Text für Level 4 und 5

var int Infotext04;
var int Infotext05;
var int Infotext10;
var int Infotext11;
var int InfotextStart;

// Level freischalten

var int Level03_Frei;
var int Level04_Frei;
var int Level05_Frei;
var int Level08_Frei;
var int Level09_Frei;

// Level 7/9 Spielzeit

var int DiveTime;

// Zeit für Highscore

var int TimeCounter_Real;
var int TimeAn;

// Richtung in Level 10

var int Level10_Dir;
var int Level11_Dir;

// Wieder in Startlevel, nach Highscore

var int ReturnToStartlevel;
var int ComeBackCounter;

// Wackeldackel

var int Wackeldackel_Counter;

// Wand

var int Wand_Unterwegs;
var int Wand01_Unterwegs;
var int Wand02_Unterwegs;
var int Wand03_Unterwegs;
var int Wand04_Unterwegs;
var int Sound02_An;
var int Sound03_An;
var int Sound04_An;

var int Level05_Counter;

var int Wagen_Unterwegs;
var int Wagen11_Unterwegs;

// Akrobatik

var int Acrobat;

// Sprungsound

var int Huepft;
var int Huepft_Counter;
var int HuepftCooli;

// Checkpoints usw.

var int Check01;
var int Check02;
var int Check03;
var int Check04;
var int Check05;
var int Check06;
var int Check07;
var int Lore;
var int Lore_R;

// Irrlichter

var int LichtCounter;

var int Item01;
var int Item02;
var int Item03;
var int Item04;
var int Item05;
var int Item06;
var int Item07;
var int Item08;
var int Item09;
var int Item10;
var int Item11;
var int Item12;
var int Item13;
var int Item14;
var int Item15;
var int Item16;
var int Item17;
var int Item18;
var int Item19;
var int Item20;
var int Item21;
var int Item22;
var int Item23;
var int Item24;
var int Item25;
var int Item26;
var int Item27;
var int Item28;
var int Item29;
var int Item30;
var int Item31;
var int Item32;
var int Item33;
var int Item34;
var int Item35;
var int Item36;
var int Item37;
var int Item38;
var int Item39;
var int Item40;
var int Item41;
var int Item42;
var int Item43;
var int Item44;
var int Item45;
var int Item46;
var int Item47;
var int Item48;
var int Item49;
var int Item50;

var int Item201;
var int Item202;
var int Item203;
var int Item204;
var int Item205;
var int Item206;
var int Item207;
var int Item208;
var int Item209;
var int Item210;
var int Item211;
var int Item212;
var int Item213;
var int Item214;
var int Item215;
var int Item216;
var int Item217;
var int Item218;
var int Item219;
var int Item220;
var int Item221;
var int Item222;
var int Item223;
var int Item224;
var int Item225;
var int Item226;
var int Item227;
var int Item228;
var int Item229;
var int Item230;
var int Item231;
var int Item232;
var int Item233;
var int Item234;
var int Item235;
var int Item236;
var int Item237;
var int Item238;
var int Item239;
var int Item240;
var int Item241;
var int Item242;
var int Item243;
var int Item244;
var int Item245;
var int Item246;
var int Item247;
var int Item248;
var int Item249;
var int Item250;

var int ItemLevel0501;
var int ItemLevel0502;
var int ItemLevel0503;
var int ItemLevel0504;
var int ItemLevel0505;
var int ItemLevel0506;
var int ItemLevel0507;
var int ItemLevel0508;
var int ItemLevel0509;
var int ItemLevel0510;
var int ItemLevel0511;
var int ItemLevel0512;
var int ItemLevel0513;
var int ItemLevel0514;
var int ItemLevel0515;
var int ItemLevel0516;
var int ItemLevel0517;
var int ItemLevel0518;
var int ItemLevel0519;
var int ItemLevel0520;
var int ItemLevel0521;
var int ItemLevel0522;
var int ItemLevel0523;
var int ItemLevel0524;
var int ItemLevel0525;
var int ItemLevel0526;
var int ItemLevel0527;
var int ItemLevel0528;
var int ItemLevel0529;
var int ItemLevel0530;
var int ItemLevel0531;
var int ItemLevel0532;
var int ItemLevel0533;
var int ItemLevel0534;
var int ItemLevel0535;
var int ItemLevel0536;
var int ItemLevel0537;
var int ItemLevel0538;
var int ItemLevel0539;
var int ItemLevel0540;
var int ItemLevel0541;
var int ItemLevel0542;
var int ItemLevel0543;
var int ItemLevel0544;
var int ItemLevel0545;
var int ItemLevel0546;
var int ItemLevel0547;
var int ItemLevel0548;
var int ItemLevel0549;
var int ItemLevel0550;

// Irrlichter für Level10

var int Licht10_Counter;

var int Item10_01;
var int Item10_02;
var int Item10_03;
var int Item10_04;
var int Item10_05;
var int Item10_06;
var int Item10_07;
var int Item10_08;
var int Item10_09;
var int Item10_10;
var int Item10_11;
var int Item10_12;
var int Item10_13;
var int Item10_14;
var int Item10_15;
var int Item10_16;
var int Item10_17;
var int Item10_18;
var int Item10_19;
var int Item10_20;
var int Item10_21;
var int Item10_22;
var int Item10_23;
var int Item10_24;
var int Item10_25;
var int Item10_26;
var int Item10_27;
var int Item10_28;
var int Item10_29;
var int Item10_30;
var int Item10_31;
var int Item10_32;
var int Item10_33;
var int Item10_34;
var int Item10_35;
var int Item10_36;
var int Item10_37;
var int Item10_38;
var int Item10_39;
var int Item10_40;
var int Item10_41;
var int Item10_42;
var int Item10_43;
var int Item10_44;
var int Item10_45;
var int Item10_46;
var int Item10_47;
var int Item10_48;
var int Item10_49;
var int Item10_50;

// Irrlichter für Level11

var int Licht11_Counter;

var int Item11_01;
var int Item11_02;
var int Item11_03;
var int Item11_04;
var int Item11_05;
var int Item11_06;
var int Item11_07;
var int Item11_08;
var int Item11_09;
var int Item11_10;
var int Item11_11;
var int Item11_12;
var int Item11_13;
var int Item11_14;
var int Item11_15;
var int Item11_16;
var int Item11_17;
var int Item11_18;
var int Item11_19;
var int Item11_20;
var int Item11_21;
var int Item11_22;
var int Item11_23;
var int Item11_24;
var int Item11_25;
var int Item11_26;
var int Item11_27;
var int Item11_28;
var int Item11_29;
var int Item11_30;
var int Item11_31;
var int Item11_32;
var int Item11_33;
var int Item11_34;
var int Item11_35;
var int Item11_36;
var int Item11_37;
var int Item11_38;
var int Item11_39;
var int Item11_40;
var int Item11_41;
var int Item11_42;
var int Item11_43;
var int Item11_44;
var int Item11_45;
var int Item11_46;
var int Item11_47;
var int Item11_48;
var int Item11_49;
var int Item11_50;

// Aktueller Level

var int CurrentLevel;

// Namen

var string eingabe;
var string username;
var string passwort;

var int Offline_Modus;
var int online_playtime;
var string online_playtime_s;
var int ValidateUserPasswort;

var int CurrentLevel2;

// Gespielte Level abhaken

var int Level01_Gespielt;
var int Level02_Gespielt;
var int Level03_Gespielt;
var int Level04_Gespielt;
var int Level05_Gespielt;
var int Level06_Gespielt;
var int Level07_Gespielt;
var int Level08_Gespielt;
var int Level09_Gespielt;
var int Level10_Gespielt;
var int Level11_Gespielt;
var int Level12_Gespielt;
var int Level13_Gespielt;

// Racer 

VAR INT r_zeit_sek;
VAR INT Level12_Platz;
VAR INT Level12_Highscore;
VAR INT score;
VAR INT lastscore;
VAR INT lasttime;
var int besttime;
var int runden;
var int highscore;


VAR INT r_start;

var int Mod_HasEquippedArmor;

var int Mod_OnlineMode;
var int Mod_OnlineMode2;

// ------ Teacher MAX Werte ------
const int T_MEGA = 300; //Pyrokar MANA
const int T_MAX = 200;
const int T_HIGH = 120;
const int T_MED = 90;
const int T_LOW = 60;