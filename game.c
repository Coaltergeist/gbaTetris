#include "game.h"
#include "myLib.h"
#include "bg.h"

PIECE pieces[PIECECOUNT];

// Initialize the game
void initGame() {


    // Initialize the colors
    unsigned short colors[NUMCOLORS] = {BLACK, CYAN, BLUE, ORANGE, YELLOW, GREEN, PURPLE, RED, WHITE};

    // Load the background image's colors
    loadPalette(bgPal);

    // Load the custom game colors to the end
    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }
}