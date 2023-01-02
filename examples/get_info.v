module main

import vayaudio
import os

fn main() {
	if os.args.len < 2 {
		println('Usage: vayplay <soundfile>')
		return
	}

	// Initialize the audio system
	vayaudio.start_device()

	// Load a sound file
	sound := vayaudio.load(os.args[1]) or {
		println('Failed to load sound file')
		return
	}

	// Get some information about the sound
	println('Sound file info:')
	println('  Channels: ${sound.get_channels()}')
	println('  Sample rate: ${sound.get_sample_rate()}')
	println('  Sample count: ${sound.get_sample_size()}')
	println('  Number of frames: ${sound.get_number_of_frames()}')
	println('  Duration: ${sound.get_duration()}')

	vayaudio.close()
}
