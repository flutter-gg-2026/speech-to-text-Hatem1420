# Lab: Flutter Voice-to-Text (Gladia Integration)

## Objective
Build a Flutter feature that records a user's voice and utilizes the **Gladia API** to transcribe the audio into text.

## Requirements

### 1. Audio Processing
* **Recording:** Implement a way to capture the user's voice note.
* **Gladia API:** Integrate [Gladia](https://docs.gladia.io/) to handle the transcription process.
* **Flow:** Voice Note ➔ Gladia API ➔ Text Display.

### 2. Technical Implementation
* **State Management:** Use **BLoC** to manage `Initial`, `Recording`, `Uploading`, and `Success(text)` states.

