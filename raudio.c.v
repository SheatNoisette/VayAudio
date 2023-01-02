module vayaudio

// vayaudio is a simple audio library for V based on Raylib's audio module.

// Configuration

#define AUDIO_DEVICE_FORMAT    ma_format_f32
#define AUDIO_DEVICE_CHANNELS              2
#define AUDIO_DEVICE_SAMPLE_RATE           0
#define MAX_AUDIO_BUFFER_POOL_CHANNELS    16

#define RL_MALLOC(sz)           malloc(sz)
#define RL_CALLOC(n,sz)         calloc(n,sz)
#define RL_REALLOC(ptr,sz)      realloc(ptr,sz)
#define RL_FREE(ptr)            free(ptr)

$if debug {
	#define TRACELOG(level, ...)    printfln(__VA_ARGS__)
} $else {
	#define TRACELOG(level, ...)
}

// Enable features
#define RAUDIO_STANDALONE
#define MINIAUDIO_IMPLEMENTATION
#define SUPPORT_MODULE_RAUDIO
#define SUPPORT_FILEFORMAT_WAV

// Import
#include "@VROOT/extern/raudio.c"
#flag -I @VROOT/extern

// Simple structure initialisation for wrapper

// Wave
[typedef]
struct C.Wave {}

// rAudioBuffer
[typedef]
struct C.rAudioBuffer {}

// rAudioSource
[typedef]
struct C.rAudioSource {}

// rAudioProcessor
[typedef]
struct C.rAudioProcessor {}

// AudioStream
[typedef]
struct C.AudioStream {}

// Sound
[typedef]
struct C.Sound {}

// Music
[typedef]
struct C.Music {}


// ----------------------------------------------------
// Function wrappers

// RLAPI void InitAudioDevice(void);                                     // Initialize audio device and context
fn C.InitAudioDevice()

// RLAPI void CloseAudioDevice(void);                                    // Close the audio device and context
fn C.CloseAudioDevice()

// RLAPI bool IsAudioDeviceReady(void);                                  // Check if audio device has been initialized successfully
fn C.IsAudioDeviceReady() bool

// RLAPI void SetMasterVolume(float volume);                             // Set master volume (listener)
fn C.SetMasterVolume(f32)

// Wave/Sound loading/unloading functions
// RLAPI Wave LoadWave(const char *fileName);                            // Load wave data from file
fn C.LoadWave(&byte) C.Wave
// RLAPI Wave LoadWaveFromMemory(const char *fileType, const unsigned char *fileData, int dataSize); // Load wave from memory buffer, fileType refers to extension: i.e. '.wav'
fn C.LoadWaveFromMemory(&byte, &byte, int) C.Wave
// RLAPI Sound LoadSound(const char *fileName);                          // Load sound from file
fn C.LoadSound(&byte) C.Sound
// RLAPI Sound LoadSoundFromWave(Wave wave);                             // Load sound from wave data
fn C.LoadSoundFromWave(C.Wave) C.Sound
// RLAPI void UpdateSound(Sound sound, const void *data, int sampleCount); // Update sound buffer with new data
fn C.UpdateSound(C.Sound, voidptr, int)
// RLAPI void UnloadWave(Wave wave);
fn C.UnloadWave(C.Wave)
// RLAPI void UnloadSound(Sound sound);
fn C.UnloadSound(C.Sound)

// Wave/Sound management functions
// RLAPI void PlaySound(Sound sound);                                    // Play a sound
fn C.PlaySound(C.Sound)
// RLAPI void StopSound(Sound sound);                                    // Stop playing a sound
fn C.StopSound(C.Sound)
// RLAPI void PauseSound(Sound sound);                                   // Pause a sound
fn C.PauseSound(C.Sound)
// RLAPI void ResumeSound(Sound sound);                                  // Resume a paused sound
fn C.ResumeSound(C.Sound)
// RLAPI void PlaySoundMulti(Sound sound);                               // Play a sound (using multichannel buffer pool)
fn C.PlaySoundMulti(C.Sound)
// RLAPI void StopSoundMulti(void);                                      // Stop any sound playing (using multichannel buffer pool)
fn C.StopSoundMulti()
// RLAPI int GetSoundsPlaying(void);                                     // Get number of sounds playing in the multichannel
fn C.GetSoundsPlaying() int
// RLAPI bool IsSoundPlaying(Sound sound);                               // Check if a sound is currently playing
fn C.IsSoundPlaying(C.Sound) bool
// RLAPI void SetSoundVolume(Sound sound, float volume);                 // Set volume for a sound (1.0 is max level)
fn C.SetSoundVolume(C.Sound, f32)
// RLAPI void SetSoundPitch(Sound sound, float pitch);                   // Set pitch for a sound (1.0 is base level)
fn C.SetSoundPitch(C.Sound, f32)
// RLAPI void SetSoundPan(Sound sound, float pan);                       // Set pan for a sound (0.5 is center)
fn C.SetSoundPan(C.Sound, f32)
// RLAPI Wave WaveCopy(Wave wave);                                       // Copy a wave to a new wave
fn C.WaveCopy(C.Wave) C.Wave
// RLAPI void WaveCrop(Wave *wave, int initSample, int finalSample);     // Crop a wave to defined samples range
fn C.WaveCrop(&C.Wave, int, int)
// RLAPI void WaveFormat(Wave *wave, int sampleRate, int sampleSize, int channels); // Convert wave data to desired format
fn C.WaveFormat(&C.Wave, int, int, int)
// RLAPI float *LoadWaveSamples(Wave wave);                              // Load samples data from wave as a 32bit float data array
fn C.LoadWaveSamples(C.Wave) voidptr
// RLAPI void UnloadWaveSamples(float *samples);                         // Unload samples data loaded with LoadWaveSamples()
fn C.UnloadWaveSamples(voidptr)


// Music management functions
// RLAPI Music LoadMusicStream(const char *fileName);                    // Load music stream from file
fn C.LoadMusicStream(&byte) C.Music
// RLAPI Music LoadMusicStreamFromMemory(const char *fileType, const unsigned char *data, int dataSize); // Load music stream from data
fn C.LoadMusicStreamFromMemory(&byte, &byte, int) C.Music
// RLAPI void UnloadMusicStream(Music music);                            // Unload music stream
fn C.UnloadMusicStream(C.Music)
// RLAPI void PlayMusicStream(Music music);                              // Start music playing
fn C.PlayMusicStream(C.Music)
// RLAPI bool IsMusicStreamPlaying(Music music);                         // Check if music is playing
fn C.IsMusicStreamPlaying(C.Music) bool
// RLAPI void UpdateMusicStream(Music music);                            // Updates buffers for music streaming
fn C.UpdateMusicStream(C.Music)
// RLAPI void StopMusicStream(Music music);                              // Stop music playing
fn C.StopMusicStream(C.Music)
// RLAPI void PauseMusicStream(Music music);                             // Pause music playing
fn C.PauseMusicStream(C.Music)
// RLAPI void ResumeMusicStream(Music music);                            // Resume playing paused music
fn C.ResumeMusicStream(C.Music)
// RLAPI void SeekMusicStream(Music music, float position);              // Seek music to a position (in seconds)
fn C.SeekMusicStream(C.Music, f32)
// RLAPI void SetMusicVolume(Music music, float volume);                 // Set volume for music (1.0 is max level)
fn C.SetMusicVolume(C.Music, f32)
// RLAPI void SetMusicPitch(Music music, float pitch);                   // Set pitch for a music (1.0 is base level)
fn C.SetMusicPitch(C.Music, f32)
// RLAPI void SetMusicPan(Music music, float pan);                       // Set pan for a music (0.5 is center)
fn C.SetMusicPan(C.Music, f32)
// RLAPI float GetMusicTimeLength(Music music);                          // Get music time length (in seconds)
fn C.GetMusicTimeLength(C.Music) f32
// RLAPI float GetMusicTimePlayed(Music music);                          // Get current music time played (in seconds)
fn C.GetMusicTimePlayed(C.Music) f32

// AudioStream management functions
// RLAPI AudioStream LoadAudioStream(unsigned int sampleRate, unsigned int sampleSize, unsigned int channels); // Load audio stream (to stream raw audio pcm data)
fn C.LoadAudioStream(int, int, int) C.AudioStream
// RLAPI void UnloadAudioStream(AudioStream stream);                     // Unload audio stream and free memory
fn C.UnloadAudioStream(C.AudioStream)
// RLAPI void UpdateAudioStream(AudioStream stream, const void *data, int frameCount); // Update audio stream buffers with data
fn C.UpdateAudioStream(C.AudioStream, voidptr, int)
// RLAPI bool IsAudioStreamProcessed(AudioStream stream);                // Check if any audio stream buffers requires refill
fn C.IsAudioStreamProcessed(C.AudioStream) bool
// RLAPI void PlayAudioStream(AudioStream stream);                       // Play audio stream
fn C.PlayAudioStream(C.AudioStream)
// RLAPI void PauseAudioStream(AudioStream stream);                      // Pause audio stream
fn C.PauseAudioStream(C.AudioStream)
// RLAPI void ResumeAudioStream(AudioStream stream);                     // Resume audio stream
fn C.ResumeAudioStream(C.AudioStream)
// RLAPI bool IsAudioStreamPlaying(AudioStream stream);                  // Check if audio stream is playing
fn C.IsAudioStreamPlaying(C.AudioStream) bool
// RLAPI void StopAudioStream(AudioStream stream);                       // Stop audio stream
fn C.StopAudioStream(C.AudioStream)
// RLAPI void SetAudioStreamVolume(AudioStream stream, float volume);    // Set volume for audio stream (1.0 is max level)
fn C.SetAudioStreamVolume(C.AudioStream, f32)
// RLAPI void SetAudioStreamPitch(AudioStream stream, float pitch);      // Set pitch for audio stream (1.0 is base level)
fn C.SetAudioStreamPitch(C.AudioStream, f32)
// RLAPI void SetAudioStreamPan(AudioStream stream, float pan);          // Set pan for audio stream (0.5 is centered)
fn C.SetAudioStreamPan(C.AudioStream, f32)
// RLAPI void SetAudioStreamBufferSizeDefault(int size);                 // Default size for new audio streams
fn C.SetAudioStreamBufferSizeDefault(int)
// RLAPI void SetAudioStreamCallback(AudioStream stream, AudioCallback callback);  // Audio thread callback to request new data
fn C.SetAudioStreamCallback(C.AudioStream, C.AudioCallback)

// RLAPI void AttachAudioStreamProcessor(AudioStream stream, AudioCallback processor); // Attach audio stream processor to stream
fn C.AttachAudioStreamProcessor(C.AudioStream, C.AudioCallback)
// RLAPI void DetachAudioStreamProcessor(AudioStream stream, AudioCallback processor); // Detach audio stream processor from stream
fn C.DetachAudioStreamProcessor(C.AudioStream, C.AudioCallback)
