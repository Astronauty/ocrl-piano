import Combinatorics
using Combinatorics

finger_set = 1:5

mode_sequences = multiset_permutations(finger_set, 3)

for mode_sequence in mode_sequences
    println(mode_sequence)
end

println(length(mode_sequences))


function mode_constraints(time, mode_sequence, midi_file)
    """
    Return mode constraints for a piano playing problem. The mode sequence describes the fingers assigned to each note.
    """
    midi = load("C_scale.mid")

    # midi = load("bach_846.mid")
    notes = getnotes(midi.tracks[1], midi.tpq)
    

    @assert length(mode_sequence) == length(notes)
    
end