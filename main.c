#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "game.h"
#include "bg.h"
#include "text.h"

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

//counts frame by frame to flash image
int frameCount;

// score
int score;

char buffer1[41];
char buffer2[41];

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(state) {

            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
               
    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;

    // Set up the first state
    goToStart();
}

void goToStart() {
	unsigned short colors[NUMCOLORS] = {BLACK, CYAN, BLUE, ORANGE, YELLOW, GREEN, PURPLE, RED, WHITE, GRAY};

    loadPalette(bgPal);

    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }

    drawFullscreenImage4(bgBitmap);

    waitForVBlank();
    flipPage();

    drawFullscreenImage4(bgBitmap);
    drawString4(76, 86, "Press Start", WHITEID);



    state = START;

    // Begin the seed randomization
    seed = 0;
    frameCount = 1;
}

// Runs every frame of the start state
void start() {
	// frameCount = 1;
    seed++;

    // Lock the framerate to 60 fps
    waitForVBlank();

    if (frameCount > 0) {
        frameCount++;
        if (frameCount > 120) {
            flipPage();
            frameCount = -1;
        }
    } else {
        frameCount--;
        if (frameCount < -120) {
            flipPage();
            frameCount = 1;
        }
    }

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Seed the random generator
        srand(seed);

        goToGame();
        initGame();
    }
}

// Sets up the game state
void goToGame() {

    state = GAME;
}

// Runs every frame of the game state
void game() {
	
    updateGame();
    drawGame();

    // Update the score
    sprintf(buffer1, "Score: %d", score);
    drawString4(32, 142, buffer1, WHITEID);
    // Update next piece
    sprintf(buffer2, "Next:");
    drawString4(42, 142, buffer2, WHITEID);

    waitForVBlank();
    flipPage();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) 
        goToPause();
    else if (BUTTON_PRESSED(BUTTON_B))
        goToLose();

    frameCount++;
}

// Sets up the pause state
void goToPause() {

    fillScreen4(WHITEID);
    drawString4(80-3, 120-15, "Pause", BLACKID);

    //TODO 2.2: Wait for vertical blank and flip the page
    waitForVBlank();
    flipPage();



    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    
    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Sets up the win state
void goToWin() {

    fillScreen4(GREENID);
    drawString4(80-3, 120-9, "Win", BLACKID);

    //TODO 2.3: Wait for vertical blank and flip the page
    waitForVBlank();
    flipPage();



    state = WIN;
}

// Runs every frame of the win state
void win() {
    
    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// Sets up the lose state
void goToLose() {

    fillScreen4(REDID);
    drawString4(80-3, 120-12, "Lose", BLACKID);

    //TODO 2.4: Wait for vertical blank and flip the page
    waitForVBlank();
    flipPage();

    

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
     
    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) 
        goToStart();
}