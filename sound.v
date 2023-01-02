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
	s := VaySound{
		sound: C.LoadSound(filename.str)
	}
	unsafe {
		if s.sound.frameCount == 0 || s.sound.stream.buffer == nil {
			return error('Could not load sound')
		}
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
	return C.IsSoundPlaying(s.sound)
}

// Set the volume of a sound
pub fn (s VaySound) set_volume(volume f32) {
	C.SetSoundVolume(s.sound, volume)
}

// Set pan
pub fn (s VaySound) set_pan(pan f32) {
	C.SetSoundPan(s.sound, pan)
}

// Stop the sound
pub fn (s VaySound) stop() {
	C.StopSound(s.sound)
}

// Resume the sound
pub fn (s VaySound) resume() {
	C.ResumeSound(s.sound)
}

// Get the number of frames
[inline]
pub fn (s VaySound) get_number_of_frames() u32 {
	return s.sound.frameCount
}

// Get pan
[inline]
pub fn (s VaySound) get_pan() f32 {
	return s.sound.stream.buffer.pan
}

// Get volume
[inline]
pub fn (s VaySound) get_volume() f32 {
	return s.sound.stream.buffer.volume
}

// Get the sample rate
[inline]
pub fn (s VaySound) get_sample_rate() u32 {
	return s.sound.stream.sampleRate
}

// Get sample size
[inline]
pub fn (s VaySound) get_sample_size() u32 {
	return s.sound.stream.sampleSize
}

// Get channels
[inline]
pub fn (s VaySound) get_channels() u32 {
	return s.sound.stream.channels
}

// Get the length of the sound in seconds
[inline]
pub fn (s VaySound) get_duration() f32 {
	return s.get_number_of_frames() / s.get_sample_rate()
}
