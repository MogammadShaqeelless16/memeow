# Memeow - The Kitty Meme Scenario Game

## Overview

A fun and interactive mobile game where players drag and drop cat memes to match them with humorous scenarios.

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
*   **Core Features:**
    *   Main menu with navigation to different screens.
    *   Placeholder screens for Game, How to Play, Settings, and About.

### Current Plan

1.  **Refactor Game to Drag-and-Drop:**
    *   Update the "How to Play" screen to explain the new game mechanics.
    *   Create a `Scenario` widget to display the situation (e.g., "POV: You told your grandma you're sick...").
    *   Implement drag-and-drop functionality for cat memes.
    *   Create "role" drop zones within the scenario (e.g., "Grandma," "Mom," "You").
    *   Create a scrollable list/palette of available cat memes.
2.  **Develop Game Logic:**
    *   Create data models for Scenarios and Memes.
    *   Implement logic to check if the dropped meme is the correct one for the role in the scenario.
    *   Add scoring and a system for progressing through different scenarios.
3.  **Add Art Assets:**
    *   Find and add a variety of cat meme images to the assets.
    *   Create or find humorous scenarios.
