# 📘 Voice Transcription & Translation Plugin – User Manual

A professional plugin for Oracle APEX to enable speech-to-text conversion and optional translation. This plugin allows mapping the transcript or translated text directly to APEX page items, making it ideal for multilingual forms, chatbots, or voice-driven data entry.

---

## 🔍 1. Description

This plugin captures spoken input from the user, converts it into text, and optionally translates it into a target language. The resulting text can be passed to APEX items dynamically. It supports multiple languages for both speech recognition and translation, with the ability to enable or disable translation based on a toggle.

---

## ✨ 2. Features

* 🎙️ **Speech-to-Text**
  * Converts spoken words into text
  * Supports dynamic selection of speaking language

* 🌍 **Optional Translation**
  * Translate transcript into a target language
  * Can be enabled or disabled using a translation option (`Y`/`N`)

* ✅ **Direct APEX Integration**
  * Pass transcript or translation to configured APEX page items
  * Supports dynamic APEX item mapping

* 💡 **Dynamic Language Selection**
  * Speaking language and translation language can be set per page or per region
  * Works with Google-supported language codes (e.g., `ml-IN`, `en`)

* 📈 **Conditional Translation**
  * When translation option is `'N'`, only transcript is stored
  * When `'Y'`, translated text is stored in the target APEX item

---

## 💼 3. Use Cases

* Multilingual form submissions in Oracle APEX  
* Voice-driven data entry for internal apps  
* Chatbots or AI interfaces integrated with APEX  
* Customer support or helpdesk applications  

---

## ⚙️ 4. Installation Guide

### ✅ Step 1: Download Plugin

* Obtain the plugin package or SQL script from your source repository.

### ✅ Step 2: Install Plugin

* Open Oracle APEX → **SQL Workshop > SQL Scripts**
* Upload and run the plugin script if applicable.

### ✅ Step 3: Add Plugin Region

* Navigate to your APEX Page Designer
* Click **+** → Add Region
* Region Type: **Voice Transcription & Translation**

### ✅ Step 4: Configure Supporting Items

* Create page items for storing speech and translation:

  * `Speech Text Item` → Stores speech transcript (or translation if enabled)  
    Example: `P2_SPEAK`  

  * `Translated Text Item` (optional) → Stores translated text  
    Example: `P2_TRANS`  

  * `Speaking Language` → Language code for speech recognition  
    Example: `ml-IN`  

  * `Translation Language` → Target language code for translation  
    Example: `en`  

  * `Translation Option` → Toggle translation on/off (`Y` or `N`)  

---

## 📂 Example Configuration

| Parameter | Example Value | Description |
|-----------|---------------|-------------|
| Speaking Language | `ml-IN` | Malayalam speech recognition |
| Translation Language | `en` | Target translation language |
| Speech Text Item | `P2_SPEAK` | APEX page item to store transcript or translation |
| Translated Text Item | `P2_TRANS` | Optional: Stores translation if enabled |
| Translation Option | `N` | `'N'` to store only transcript, `'Y'` to translate |

---

## 📣 Notes

* Speech recognition requires Google Chrome (uses `webkitSpeechRecognition`).  
* Language codes must be supported by Google Translate.  
* If `Translation Option` is `'N'`, only the transcript is passed to the target APEX item.  
* Ideal for creating multilingual voice-enabled applications in Oracle APEX.  

---

## 📣 Contact & Contribution

Feel free to submit issues, contribute features, or fork from GitHub.  
