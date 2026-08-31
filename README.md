# Call of the Void Card Game

Welcome to our Card Game repository! This file serves as the main **Game Design Document (GDD)**, detailing the technical aspects, gameplay mechanics, and game rules.

---

## Technical Aspects

*   **Engine:** [Godot Engine](https://godotengine.org/)
*   **Programming Language:** TBD (Initially C or C#)
*   **Design Software:** Krita (Open Source) and others to be defined as needed.

---

## Game Overview

A turn-based strategy card game heavily inspired by the classic *Adventure Time Card Wars*.

### The Board
The battlefield is divided into **4 distinct territories**.
* Players are required to use **Terrain** cards to compose the field.
* Each terrain card has unique attributes and defines the element of that specific area.

---

## Core Mechanics

### Mana System and Card Flow
*   **Initial Mana:** The player starts the match with 6 mana.
*   **Mana Recovery:** Players recover 2 to 3 mana per turn (exact value pending balancing). Mana is the essential resource for playing cards.
*   **Card Draw:** Every turn, the player draws **2 random cards** from their constructed deck.
*   **Discard and "Death":** Played cards are removed from the deck and the hand at the moment of use. Since the field is "alive", creatures will "live" inside it during the match, justifying why they do not return to the deck.

### Card Types

#### 1. Terrains (Mandatory)
*   The player must have **at least 1 terrain card** on the field to be able to enter combat.
*   **Function:** Defines the aesthetics and the element of the territory.
*   **Synergy (Elemental Adept):** Placing 4 cards of the same element on the field grants a powerful *buff* to cards of that element.
*   **Elemental Conflict (Debuff):** Using cards of opposing elements on the same terrain or in poorly optimized decks triggers *debuffs* (e.g., less damage, less defense, or less health, depending on the card).
*   **Living Field Concept:** The terrain is dynamic and visually interacts with the creatures placed upon it.

#### 2. Creatures
*   The primary combat units, featuring unique **Attack**, **Defense**, and **Ability** attributes.
*   **Visual Design (Base):** The Mana Cost will be positioned on the *right*, with Attack and Defense attributes at the *bottom* of the card.

---
## Turn Structure

The match flow happens in two major phases:

### Phase 1: Initial Preparation
*   Both players place their **Terrain** cards simultaneously.
*   After the field is set, the system **randomly** decides which player will take the first turn.

### Phase 2: Combat and Actions
From this phase onward, turns alternate. Each player's turn is subdivided into two stages:

1. **Preparation Phase:**
   *   Complete freedom to position creatures, deploy structures, and distribute cards on the field.
   *   Execution of strategic support actions (that do not involve attacking).
2. **Attack Phase:**
   *   Execution of the attacks planned during the preparation phase.
   *   Actions focused on direct damage or the activation of specific abilities (details and limitations to be defined).

---
*Note: This GDD is a living document and will be updated throughout the project's development.*
