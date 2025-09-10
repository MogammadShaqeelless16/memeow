# Memeow - The Cat Meme Reaction Game

## Overview

A fun and interactive mobile game where players react to cat memes.

## Project Blueprint

### Style, Design, and Features (Current)

*   **Theme:**
    *   Light and Dark mode support using Material 3.
    *   `google_fonts` for typography (Oswald, Roboto, Open Sans).
    *   Centralized theme management in `app_theme.dart`.
*   **State Management:**
    *   `provider` for theme switching.
*   **UI/UX:**
    *   Basic animations on the main menu using `flutter_animate`.
    *   Custom `MenuButton` widget for consistent styling.
*   **Game Engine:**
    *   `flame` integrated for the game screen.
    *   Basic `FlameGame` instance (`MemeowGame`) created.
*   **Core Features:**
    *   Main menu with navigation to different screens.
    *   Placeholder screens for Game, How to Play, Settings, and About.
    *   Basic game screen structure implemented in `game_screen.dart`.

### Current Plan

1.  **Enhance the Game Screen:**
    *   Add a background image to the game world.
    *   Create a `MemeCard` component to display cat memes.
    *   Add placeholder UI for score and timer.
    *   Add animated characters or effects using `flame`.
2.  **Develop Game Logic:**
    *   Implement a system for loading and displaying a sequence of memes.
    *   Add reaction buttons (e.g., "Funny," "Cute," "Grumpy") as Flame components.
    *   Implement scoring and timer logic within the `FlameGame`.
