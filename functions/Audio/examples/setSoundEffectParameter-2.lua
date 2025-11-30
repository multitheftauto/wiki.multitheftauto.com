local sound = playSound3D("music.mp3", 0, 0, 10)

setSoundEffectEnabled(sound, "echo", true)
setSoundEffectParameter(sound, "echo", "wetDryMix", 80)
setSoundEffectParameter(sound, "echo", "feedback", 30)
