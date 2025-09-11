# Memeow - The Kitty Meme Scenario Game

## Overview

A fun and interactive mobile game where players match cat memes to humorous scenarios.

## Project Blueprint

### Style, Design, and Features (Current)

*   **Theme:**
    *   Light and Dark mode support using Material 3.
    *   `google_fonts` for typography (Oswald, Roboto, Open Sans).
    *   Centralized theme management in `app_theme.dart`.
    *   Theme toggling implemented in the `SettingsScreen`.
*   **State Management:**
    *   `provider` for theme switching.
*   **Navigation:**
    *   `go_router` for declarative routing between all screens.
*   **UI/UX:**
    *   Custom `MenuButton` widget for consistent styling on the `MainMenuScreen`.
*   **Screens:**
    *   `MainMenuScreen`: The main entry point with navigation.
    *   `GameScreen`: The core gameplay screen with scenario-based meme matching.
    *   `HowToPlayScreen`: Instructions on how to play the game.
    *   `SettingsScreen`: Allows the user to toggle between light and dark themes.
    *   `AboutScreen`: Information about the application.
    *   `MemeCollectionScreen`: Displays all available memes.
*   **Game Logic:**
    *   Data models for `Scenario` and `Meme` are defined.
    *   `game_data.dart` contains the dummy data for scenarios and memes.
    *   The `GameScreen` implements the logic for presenting scenarios, handling user answers, scoring, and progressing to the next question.
    *   Sound effects for correct and incorrect answers are implemented using `audioplayers`.
*   **Assets:**
    *   Placeholder images for cat memes.
    *   Placeholder sound files for game feedback.

### Current Plan

1.  **Refine UI/UX:**
    *   Improve the layout and design of the `GameScreen` to be more visually appealing.
    *   Add animations or visual feedback when a user answers a question.
    *   Enhance the `MemeCollectionScreen` with better styling.
2.  **Add More Content:**
    *   Add more diverse and humorous scenarios to the `game_data.dart` file.
    *   Add a wider variety of cat meme images.
    *   Find and add real sound clips for correct/incorrect answers.
3.  **Implement a Progression System:**
    *   Currently, all memes are available from the start. Implement a system where players unlock memes as they progress through the game.
4.  **Polish and Deploy:**
    *   Conduct thorough testing to find and fix bugs.
    *   Prepare the app for a release build.
