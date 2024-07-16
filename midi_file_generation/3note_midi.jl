import MIDI
using MIDI, MusicVisualizations

# Note(pitch, velocity, position, duration, channel = 0) <: AbstractNote
C = Note("C4";position=0)
E = Note("E4";position=960)
G = Note("G4";position=1920)

file = MIDIFile()
track = MIDITrack()
notes = Notes() # tpq automatically = 960

push!(notes, C)
push!(notes, E)
push!(notes, G)



addnotes!(track, notes)
addtrackname!(track, "piano")
push!(file.tracks, track)
save("./midi_files/3note.mid", file)

# Read
midi = readMIDIFile("./midi_files/3note.mid")
grid = 0:1//4:1
@show grid
@show typeof(grid)
piano = getnotes(midi, 1)
noteplotter(piano; grid = grid)