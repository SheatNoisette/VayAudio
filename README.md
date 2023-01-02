# VayAudio

A basic and simple audio library for V based on Raylib Audio module.

I needed a simple audio library for V but I didn't wanted to use SDL_mixer or
import the whole RayLib module, so I decided to create this standalone
wrapper using the RayLib "raudio" module.

**GCC or Clang is recommended**

Feature:
- Create a audio device
- Load WAV and MP3 files

**This module is unfinished but fulfills his main purpose: play sounds.**
It will be improved in the future.

## Quick Start

```v
import vayaudio

fn main() {
    vayaudio.init()
    if !vayaudio.is_ready() {
        panic('Audio device could not be initialized')
    }
    sound := vayaudio.load('assets/demo.wav') ?
    vayaudio.play(sound)
    vayaudio.close()
}
```

See the `examples` directory for more examples.

To see Raylib Audio traces, add `-cg` or `-d debug` to the V command line:
```bash
$ v run -cg examples/playwav.v
AUDIO: Device initialized successfully
    > Backend:       miniaudio / Core Audio
    > Format:        32-bit IEEE Floating Point -> 32-bit IEEE Floating Point
    > Channels:      2 -> 2
    > Sample rate:   44100 -> 44100
    > Periods size:  1323
...
AUDIO: Device closed successfully
```

## License
This wrapper is licensed under the MIT License. See the `LICENSE` file for
details.
