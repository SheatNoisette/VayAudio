module main

import vayaudio

fn main() {
	println('Vayaudio Demo')

	// Create a new audio context
	vayaudio.start_device()

	// Check if the audio context is initialized
	if vayaudio.is_initialized() {
		println('Audio context initialized')
	} else {
		eprintln('Error: Audio context not initialized')
		exit(1)
	}

	// Create a new sound
	sound := vayaudio.load('assets/demo.wav') or {
		eprintln('Error: Could not load sound')
		exit(1)
	}

	// Play the sound
	sound.play()

	// Wait for the sound to finish playing
	for sound.is_playing() {
		C.sleep(1)
	}

	// Unload the sound
	sound.unload()

	// Close the audio context
	vayaudio.close()
}
