// *********************************************************************
// TEAMions menu
// *********************************************************************

INSTANCE MENU_TEAM(C_MENU_DEF)
{
	backpic		= MENU_BACK_PIC;

	items[0]	= "MENUITEM_TEAM_HEADING";

	items[1]	= "MENUITEM_TEAM_AMPROSIUS";
	items[2]	= "MENUITEM_TEAM_BONNE6";
	items[3]	= "MENUITEM_TEAM_JIMHALWILSON";
	items[4]	= "MENUITEM_TEAM_NIN";
	items[5]	= "MENUITEM_TEAM_ZAFIRON";
	items[6]	= "MENUITEM_TEAM_BACK";

	flags = flags | MENU_SHOW_INFO;
};


const int MENU_TEAM_DY 		=  600;
const int MENU_TEAM_START_Y	= 2000;

INSTANCE MENUITEM_TEAM_HEADING(C_MENU_ITEM_DEF)
{
	text[0]		=	"TEAM";
	type		=	MENU_ITEM_TEXT;
	// Position und Dimension
	posx		=	0;		posy		=	MENU_TITLE_Y;
	dimx		=	8192;

	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_TEAM_AMPROSIUS(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "AmProsius";
	text[1]		= "Textures";  // Kommentar

	// Position und Dimension
	posx		= 2048;		posy		= MENU_TEAM_START_Y + MENU_TEAM_DY*0;
	dimx		= 4096;		dimy		= 750;

	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_TEAM";
	
	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_TEAM_BONNE6(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		=	"Bonne";
	text[1]		=	"Scripter and Mapper";  // Kommentar

	// Position und Dimension
	posx		= 2048;		posy		= MENU_TEAM_START_Y + MENU_TEAM_DY*1;
	dimx		= 4096;		dimy		= 750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_TEAM";
	
	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_TEAM_JIMHALWILSON(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Jim Hal Wilson";
	text[1]		= "Spacerer, Music and Sound";  // Kommentar

	// Position und Dimension
	posx		= 2048;		posy		= MENU_TEAM_START_Y + MENU_TEAM_DY*2;
	dimx		= 4096;		dimy		= 750;

	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_TEAM";
	
	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_TEAM_NIN(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "NineInchNail";
	text[1]		= "Tester";  // Kommentar

	// Position und Dimension
	posx		= 2048;		posy		= MENU_TEAM_START_Y + MENU_TEAM_DY*3;
	dimx		= 4096;		dimy		= 750;

	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_TEAM";
	
	// Weitere Eigenschaften
	flags = flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_TEAM_ZAFIRON(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Zafiron";
	text[1]		= "Meshes";  // Kommentar

	// Position und Dimension
	posx		= 2048;		posy		= MENU_TEAM_START_Y + MENU_TEAM_DY*4;
	dimx		= 4096;		dimy		= 800;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	onSelAction_S[0] = "MENU_TEAM";
	
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
	flags 			= flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_TEAM_BACK(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Zurück";
	// Position und Dimension
	posx		=	0;		posy		=	MENU_TEAM_START_Y + MENU_TEAM_DY*8;
	dimx		=	8192;		dimy		=	800;
	// Aktionen
	onSelAction[0]	= 	SEL_ACTION_BACK;
	//onSelAction_S[0] = "MENU_MAIN";
	// Weitere Eigenschaften
	flags			= flags |IT_TXT_CENTER;
};
