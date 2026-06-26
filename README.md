# AetherTune ⚡

A lightweight, no-nonsense Android automation and optimization utility. AetherTune is built to give you actual, low-level control over your device's hardware performance and battery life. No corporate guardrails, no unnecessary bloat—just a clean tool to make your phone run the way it should have out of the box.

---

## 🧐 Why this exists
Modern stock ROMs are notoriously aggressive with background tracking but surprisingly lazy with actual hardware optimization. High-end displays get locked into rigid refresh rate buckets, and background apps wake up your CPU constantly even when the phone is sitting on a desk. AetherTune bridges that gap by letting you tune the system framework directly.

---

## 🛠️ Core Features

### 1. Custom Display Controls
Take manual control over your panel's refresh rate floors and ceilings instead of letting stock optimization services make the choice for you.
* **Standby Drop:** Forces the display to drop down to its absolute physical minimum (10Hz or 24Hz) the second the screen goes off, preventing the panel from drawing unnecessary juice during Always-On Display (AOD).
* **Dynamic Ramping:** Restores full smoothness (up to 120Hz) instantly upon waking or unlocking the device so you don't lose that premium fluid feel when navigating the UI.

### 2. Aggressive Doze Tuning
Android naturally takes its sweet time putting the phone into a true deep sleep. This module rewrites that logic.
* **Instant Idle:** Bypasses the default multi-step wait timers and pushes the kernel straight into deep Doze mode as soon as the display cuts out.
* **Wakelock & Maintenance Blocking:** Temporarily flattens background maintenance windows while you sleep, preventing apps from randomly spinning up your CPU to sync non-essential data.

### 3. Interactive Debloat Wizard
A clean, step-by-step setup script that lets you strip out pre-installed vendor junk and carrier bloatware based on your actual daily usage.
* **Preference Prompts:** Instead of a generic "remove all" script that might break system dependencies, the wizard asks you direct questions (e.g., *"Do you use the stock messaging app?"*) to safely determine what stays and what goes.
* **Under-the-Hood Safety:** Uses a safe uninstallation cache structure, meaning the background packages are unlinked from your active user profile but can still be restored easily if you change your mind.

### 4. Quick System Tune
A simple, one-tap dashboard option that cleans out system memory caches and optimizes background thread scheduling to cut down on frame drops and micro-stutters.

---

## ⚡ Quick Start & Installation
Because AetherTune requires deep system access to override hardware variables, it cannot be installed as a standard app. We built a custom 1-Click Installer to handle the ADB bridging automatically.

1. Download and extract the latest `AetherTune_Release.zip` to your PC.
2. Ensure **USB Debugging** is enabled in your phone's Developer Options.
3. Plug your phone into your PC via USB.
4. Run `Install_AetherTune.bat` and follow the terminal prompts. 
5. Unplug and enjoy.

---

## 🗺️ Roadmap & Things To Do

### UI/UX & Design Engine
- [ ] Build a modern, highly aesthetic dashboard layout with minimal, clean visual transitions.
- [ ] Design the interactive wizard interface for the debloater using a step-by-step card stack.
- [x] Implement true AMOLED black themes for deep contrast and lower power draw. *(Setup Gateway Complete)*
- [ ] Add quick-settings status tiles to toggle specific performance profiles with one tap.

### Core Automation & Subsystems
- [x] Implement local permission binding so the app can run background commands seamlessly without needing a PC connection after the first setup.
- [ ] Fine-tune the core background service to track screen broadcast events instantly without lag.
- [ ] Write an automated safeguard that pauses aggressive Doze cycles if it detects a high-priority system task or emergency broadcast.
- [ ] Add an ambient light and brightness safety check to scale up refresh rates in pitch-black environments (preventing display tinting/flicker issues).

### Package Database & Calibration
- [ ] Complete the master "safe-to-remove" package list for CPU/GPU hardware on Samsung devices.
- [ ] Map out specific debloat matrices for Pixel and OnePlus devices.
- [ ] Create an exclusion whitelist so users can specify certain apps that should never be put into deep sleep or optimized.
- [ ] Test the low-level hardware overrides across multiple Android versions to ensure stability.

### Deployment & Documentation
- [x] Package and compile the initial alpha build for internal closed testing. *(Installer Pipeline Built)*
- [ ] Create an extensive wiki/guide on GitHub Pages covering initial permissions setup.
- [ ] Move to open public beta launch.

---

## ⚠️ Disclaimer
AetherTune alters hidden hardware profiles and uninstalls system-level packages. While designed with safety and standard rollback methods in mind, use this tool at your own risk. Pull requests and database updates for vendor packages [e.g. Realme/Infinix etc.] are always welcome.
