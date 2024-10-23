# 2048 Game in RISC-V Assembly

## Overview

This repository contains an implementation of the classic 2048 game, entirely written in RISC-V assembly language. The game was developed as the final project for the Computer Architecture class by: 

- [Emanuel Peixoto](https://github.com/EmanuelPeixoto)
- [Bruno Mateus Sales](https://github.com/BMSales)
- [Sophia Hoffmann](https://github.com/MintzyG).

The goal of the game is to merge numbered tiles on a 4x4 grid to reach the 2048 tile by sliding the tiles in one of four directions: up, down, left, or right. When two tiles with the same number collide, they combine into one with double the value.

## How to Build and Run

To build and run this project, you will need the **RARS** (RISC-V Assembler and Runtime Simulator) emulator.

### Requirements

- [RARS](https://github.com/TheThirdOne/rars) (RISC-V Assembler and Runtime Simulator)

### Steps to Build

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-github/2048-RISCV.git
   cd 2048-RISCV
   ```

2. Open the project in RARS:
        Open the main.asm file in the RARS emulator.

3. Assemble and Run:
        In RARS, assemble the code by going to the Assemble menu.
        Run the program using the Run menu.

### Controls

  Use the WASD keys to move tiles in the respective direction.
  The game ends when no more valid moves are available
  Try to get the highest score possible

### Notes

  The game logic is implemented entirely in RISC-V assembly.
  RARS is a lightweight, user-friendly tool that simulates RISC-V assembly programs, making it perfect for this project.

## License

This project is licensed under the MIT License.
