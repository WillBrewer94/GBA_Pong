#include <stdlib.h> //Used for random

#define REG_DISPCTL *(unsigned short *)0x4000000
#define VIDEO_BUFFER ((unsigned short *)0x6000000)

#define MODE3 3
#define BG2_ENABLE (1<<10)

/* Create a color with the specified RGB values */
#define COLOR(r, g, b) ((r) | (g)<<5 | (b)<<10)

/* Calculate the position of a pixel based on it's row and column */
#define OFFSET(R,C,ROWLEN) ((R)*ROWLEN+(C))

//Predefined colors
#define RED COLOR(31, 0, 0)
#define GREEN COLOR(0, 31, 0)
#define DARKER_GREEN COLOR(0, 20, 0)
#define BLUE COLOR(0, 0, 31)
#define MAGENTA COLOR(31, 0, 31)
#define CYAN COLOR(0, 31, 31)
#define YELLOW COLOR(31, 31, 0)
#define BLACK 0
#define WHITE COLOR(31, 31, 31)

#define SCANLINECOUNTER *(volatile unsigned short*) 0x4000006

unsigned int oldButtons;
unsigned int buttons;

//Buttons
#define BUTTONS *(volatile unsigned short*) 0x4000130

#define BUTTON_HELD(key)  (~(BUTTONS) & (key))
#define BUTTON_PRESSED(key) (!(~(oldButtons)&(key)) && (~(buttons) & (key)))

#define BUTTON_A		(1<<0)
#define BUTTON_B		(1<<1)
#define BUTTON_SELECT	(1<<2)
#define BUTTON_START	(1<<3)
#define BUTTON_RIGHT	(1<<4)
#define BUTTON_LEFT		(1<<5)
#define BUTTON_UP		(1<<6)
#define BUTTON_DOWN		(1<<7)
#define BUTTON_R		(1<<8)
#define BUTTON_L		(1<<9)

//Prototypes
void setPixel(int, int, unsigned short);
void drawBall(int, int, unsigned short);
void drawPaddles(int, int, int, int, unsigned short);
void initialize();
void draw();
void update();
void waitForVBlank();

/* Player Variables */
int paddleHeight = 50;
int paddleWidth = 10;

//Player 1 
int col1;
int row1;
int oldCol1;
int oldRow1;

//Player 2 
int col2;
int row2;
int oldCol2;
int oldRow2;

//Ball 
int ballCol;
int ballRow;
int ballOldRow;
int ballOldCol;
int rowD;
int colD;
int ballHeight = 10;
int ballWidth = 10;

/* Game Variables */
char gameOver = 0; // Treated as a boolean
unsigned short bgColor = BLACK; // Color of the background

int main() {
    REG_DISPCTL = MODE3 | BG2_ENABLE; // Turn on BG2 and set mode to Mode 3
    initialize();

    while(1) {
    	// TODO: Update buttons and oldButtons appropriately
    	oldButtons = buttons;
    	buttons = BUTTONS;

    	if(!gameOver) {
    		update();
	    	waitForVBlank();
	    	draw();
	    }

	    //Restarts game if game over and start button is pressed
	    if(gameOver && BUTTON_PRESSED(BUTTON_START)) {
	    	initialize();
	    }
	}
}

void initialize() {
	//Draw background
	for(int c = 0; c < 160; c++) {
		for(int r = 0; r < 240; r++) {
			setPixel(c, r, BLACK);
		}
	}

	//Reset Player Position
	row1 = 10;
	col1 = 60;
	row2 = 220;
	col2 = 60;

	//Reset Ball Position and Direction
	ballRow = 120;
	ballCol = 80;
	rowD = 1;
	colD = 1;

	//Resets game boolean
	gameOver = 0;
}

void update() {
	oldRow1 = row1;
	oldCol1 = col1;
	oldRow2 = row2;
	oldCol2 = col2;
	ballOldRow = ballRow;
	ballOldCol = ballCol;

   	//Player 1 Input
   	if(col1 + paddleHeight < 160 && BUTTON_HELD(BUTTON_B)) {
   		col1++;
   	}

   	if(col1 > 0 && BUTTON_HELD(BUTTON_A)) {
   		col1--;
   	}

   	//Player 2 Input
   	if(col2 + paddleHeight < 160 && BUTTON_HELD(BUTTON_DOWN)) {
   		col2++;
   	}

   	if(col2 > 0 && BUTTON_HELD(BUTTON_UP)) {
   		col2--;
   	}

   	//Check for game over
   	if(ballRow + ballWidth > 240 || ballRow < 0) {
   		gameOver = 1;
   	}

   	//Check for Wall Collisions
   	if(ballCol < 0 || ballCol + ballHeight > 160) {
   		colD = -colD;
   	}

   	//Check for paddle collisions
   	//Paddle 1
   	if(ballRow < row1 + paddleWidth && ballCol > col1 && ballCol < col1 + paddleHeight) {
   		rowD = -rowD;
   	}
   	//Paddle 2
   	   	if(ballRow + ballHeight > row2 && ballCol > col2 && ballCol < col2 + paddleHeight) {
   		rowD = -rowD;
   	}

   	//Move Ball
	ballRow += rowD;
	ballCol += colD;
}

void draw() {
	//Erases Paddles and Ball
	drawBall(ballOldRow, ballOldCol, BLACK);
	drawPaddles(oldRow1, oldCol1, oldRow2, oldCol2, BLACK);

	//Draws Paddles and Ball
	drawBall(ballRow, ballCol, WHITE);
	drawPaddles(row1, col1, row2, col2, WHITE);
}

// Draws the Ball
void drawBall(int row, int col, unsigned short color) {
	for(int c = 0; c < ballHeight; c++) {
		for(int r = 0; r < ballWidth; r++) {
			setPixel(col + c, row + r, color);
		}
	}
}

void drawPaddles(int row1, int col1, int row2, int col2, unsigned short color) {
	//Draws player 1's paddle
	for(int c = 0; c < paddleHeight; c++) {
		for(int r = 0; r < paddleWidth; r++) {
			setPixel(col1 + c, row1 + r, color);
		}
	}

	//Draws player 2's paddle
	for(int c = 0; c < paddleHeight; c++) {
		for(int r = 0; r < paddleWidth; r++) {
			setPixel(col2 + c, row2 + r, color);
		}
	}
}

void waitForVBlank() {
	while(SCANLINECOUNTER>160);
	while(SCANLINECOUNTER<160);
}

void setPixel(int row, int col, unsigned short color) {
    VIDEO_BUFFER[OFFSET(row,col,240)] = color;
}