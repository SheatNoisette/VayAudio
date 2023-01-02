module vayaudio

/*
** Sound wrapper for the Vayaudio library.
** MIT Licensed
*/

// Main struct for a sound.
[heap]
pub struct VaySound {
mut:
	sound C.Sound
}

// Load a sound from a file.
pub fn load(filename string) ?VaySound {
	mut s := VaySound {}

	unsafe {
		s.sound = C.LoadSound(filename.str)
		println('sound: $s.sound')
		/*
		if s.sound == nil {
			return error('Could not load sound')
		}
		*/
	}
	return s
}

// Play a sound
pub fn (s VaySound) play() {
	unsafe {
		C.PlaySound(s.sound)
	}
}

// Unload a sound
pub fn (s VaySound) unload() {
	unsafe {
		C.UnloadSound(s.sound)
	}
}

// Is the sound playing?
pub fn (s VaySound) is_playing() bool {
	unsafe {
		return C.IsSoundPlaying(s.sound)
	}
}
