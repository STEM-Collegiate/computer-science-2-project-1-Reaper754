# Project 01: Recreate a Classic Game

One of the best ways to practice creating modular programs is to take something that already exists and build it yourself. Below is a curated list of simple games that give you a chance to practice the modular programming paradigm by focusing on implementation instead of design.

---

## Step 1 — Choose a Game to Recreate

Using **Godot**, choose **one** of the following simple games to recreate:

- *Flappy Bird*
- *Pong*
- *Lock'n Spin*
- *Tic Tac Toe*
- *Whack-a-Mole*
- *Asteroids*

---

## Step 2 — Analyze the Game and Break It Down Into Its Modules (20%)

Once you have decided which game to recreate, analyze its gameplay and determine what components the game has. In previous projects, this step has been performed for you, dictating what elements needed to be created to receive full marks. For this project, **you** are responsible for deciding what components need to be implemented to recreate a game that is faithful to the original.

You will be provided a document to outline:
- each module
- your rationale for including it in your game.

---

## Step 3 — Stepwise Refinement (20%)

By now you should have a list of modules your game will require. Before developing, break down what tasks each module should complete. If a single module is handling too many tasks, consider splitting it into multiple modules.

> For an example of what this might look like, review **Lesson 2**.

Your responsibility is to ensure that every task a component accomplishes is accounted for so when it comes to programming, you can focus on implementation.

---

## Step 4 — Create and Maintain a Data Dictionary (10%)

Before beginning development, create a **data dictionary** to track which components control which values and what each value represents.

- Using the provided Excel spreadsheet, each module should have its **own sheet** (two example modules are provided).
- Name each sheet according to the module it represents.
- Each data dictionary entry should include the **Name**, **Data Type**, and **Description**.

**Sheet Name: `Pong Paddle`**

| Name  | Data Type | Description                      |
|------:|:---------:|----------------------------------|
| speed |  float    | Controls the speed of the paddle |

---

## Step 5 — Build a Prototype (50%)

Begin creating the game. This should be a **prototype**—rough, with no polish. You do not need to worry about art or sound design. The focus is on creating meaningful, modularized programs.

**The game should:**
- Have **high coherence**.
- Have **low coupling**.
- **Consider scope** (use local variables whenever possible).
- **Avoid “magic numbers”** (any value used should be named as a variable or constant).
- **Use reusable modules** (write code that could be reused in future projects where possible).
- **Follow bottom-up implementation** (build and test small components one at a time before constructing everything together).


