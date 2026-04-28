# Alien-Voice-Transformer
A real-time voice changer built on a microcontroller that makes you sound like an alien — instantly, with no computer required
---

## What Does It Do?

Speak into the microphone and hear your voice come out transformed in real time through a speaker. The effect shifts the sound frequencies in your voice, making it sound eerie, robotic, and distinctly non-human — like something straight out of a sci-fi movie.

No apps. No laptop. No internet. Just plug in, speak, and hear the effect live.

---

## How Does the Effect Work?

Sound is made up of different frequencies (think of them like musical notes layered together). Your voice has a specific mix of these frequencies that makes it sound like *you*.

This project works by taking your voice and mathematically mixing it with a rapid oscillating wave (vibrating 400 times per second). This pushes all the frequencies in your voice up and down at the same time — creating copies of your voice shifted to unusual frequencies. The result? You sound like an alien.

This technique is called **cosine modulation**, and it's the same math used in radio broadcasting and music synthesizers.

```
Your Voice  +  400 Hz Oscillating Wave  =  Alien Voice 🛸
```

---

## How Is It Built?

The brain of the system is a small **STM32 microcontroller** — a tiny chip that can capture sound, process it, and play it back fast enough that there's no noticeable delay.

### The Signal Journey

```
🎙️ Microphone  →  📥 Capture  →  ⚙️ Transform  →  📤 Output  →  🔊 Speaker
```

1. **Microphone** picks up your voice
2. The microcontroller **converts the sound** into numbers it can work with
3. Each number is **multiplied** by a value from a precomputed wave table (the alien effect)
4. The transformed numbers are **converted back** into sound
5. The speaker **plays** the alien voice

A clever trick called **ping-pong buffering** is used so the chip can process one chunk of audio while simultaneously recording the next — keeping everything smooth and real-time with zero gaps.

---

## Hardware Used

| Part | What It Does |
|------|--------------|
| STM32 Nucleo-L476RG | The microcontroller — the brain of the project |
| MEMS Microphone | Captures your voice |
| Audio Jack Breakout | Routes audio to the speaker |
| Earbuds / Headset | Where you hear the alien effect |

---

## Sampling Rate — What Changes the Effect?

The system can run at different **sampling rates** (how many times per second it listens to your voice):

- **20 kHz** — Standard setting. The alien effect is clear and the voice is still somewhat recognizable
- **40 kHz** — Higher quality audio. Effect sounds more natural while still being transformed
- **Very high rates** — The effect becomes so extreme the voice is completely unrecognizable

---

## Frequency Analysis

Using MATLAB, the sound was analyzed before and after the transformation:

- 🔵 **Original voice** — Energy concentrated in the low frequencies (under 2,000 Hz), which is normal for human speech
- 🔴 **Alien voice** — Energy is spread across a much wider range with new peaks appearing from the modulation — this is what makes it sound so strange

---

## Possible Extensions

- 🎛️ Add a physical dial to control how strong the alien effect is
- 🤖 Try different modulation frequencies for a robot voice, chipmunk effect, or deep monster sound
- 🎚️ Layer in echo or reverb for a more dramatic result
- 💡 Add an LED that reacts to your voice volume

---

## Repository Contents

```
├── main.c                      # Core program running on the microcontroller
├── readBinFileAndPlotFFT.mlx   # Script to visualize the audio frequencies in MATLAB
└── README.md                   # You are here
```

