module vayaudio

/*
** V wrapper for Raylib audio module
** MIT Licensed
*/

// Init the sound device
pub fn start_device() {
	C.InitAudioDevice()
}

// Destroy the sound device
pub fn close() {
	C.CloseAudioDevice()
}

// Is the audio device ready?
pub fn is_initialized() bool {
	return C.IsAudioDeviceReady()
}

// Set master volume
pub fn set_master_volume(volume f32) {
	$if debug {
		eprintln('VAYAUDIO: Set master volume to ${volume}')
	}
	C.SetMasterVolume(volume)
}
