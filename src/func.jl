abstract type FunctionalMagneticResonanceImaging{P,S,T,A,Rl,Ri,Ei,E} <: BIDSDataType end
const FMRI{P,S,T,A,Rl,Ri,Ei,E} = FunctionalMagneticResonanceImaging{P,S,T,A,Rl,Ri,Ei,E}
datatypefolder(::FMRI) = "func"

struct TaskFMRI{P,S,T,A,Rl,Ri,Ei,E} <: FMRI{P,S,T,A,Rl,Ri,Ei,E}
    participant::P
    seslabel::S
    tasklabel::T
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    echoindex::Ei
    ext::E
end

struct RestingStateFMRI{P,S,T,A,Rl,Ri,Ei,E} <: FMRI{P,S,T,A,Rl,Ri,Ei,E}
    participant::P
    seslabel::S
    tasklabel::T
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    echoindex::Ei
    ext::E
end

"""
    tasklabel(bidsp::FMRI) -> "_task-<label>"

Required
"""
tasklabel(bidsp::FMRI) = "_task-$(bidsp.tasklabel)"

acqlabel(bidsp::FMRI{P,S,A,L,Rl,Ri}) where {P,S,A,L,Rl,Ri} = "_acq-$(bidsp.seslabel)"
acqlabel(bidsp::FMRI{P,S,Nothing,L,RL,Ri}) where {P,S,L,Ri} = ""

seslabel(bidsp::FMRI{P,S,A,L,Rl,Ri}) where {P,S,A,L,Rl,Ri} = "_ses-$(bidsp.seslabel)"
seslabel(bidsp::FMRI{P,Nothing,A,L,RL,Ri}) where {P,A,L,Rl,Ri} = ""

recindex(bidsp::FMRI{P,S,A,L,Rl,Ri}) where {P,S,A,L,Rl,Ri} = "_rec-$(bidsp.reclabel)"
recindex(bidsp::FMRI{P,S,A,L,Nothing,Ri}) where {P,S,A,L,Ri} = ""

runindex(bidsp::FMRI{P,S,A,L,Rl,Ri}) where {P,S,A,L,Rl,Ri} = "_run-$(bidsp.runindex)"
runindex(bidsp::FMRI{P,S,A,L,Rl,Nothing}) where {P,S,A,L,Rl} = ""


"""
    echoindex(::FMRI) -> "_echo-<index>"
"""
echoindex(bidsp::FMRI{P,S,A,L,Rl,Ri,Ei}) where {P,S,A,L,Rl,Ri,Ei} = "_echo-$(bidsp.echoindex)"
echoindex(bidsp::FMRI{P,S,A,L,Rl,Ri,Nothing}) where {P,S,A,L,Rl,Ri} = ""


function filename(bidsp::FMRI)
    string(participant(bidsp),
           seslabel(bidsp),
           tasklabel(bidsp),
           acqlabel(bidsp),
           reclabel(bidsP),
           runindex(bidsp),
           echoindex(bidsp),
           "_bold",
           join(string.(".", extensions(bidsp)))
          )
end

struct MultiBandFMRI{P,S,T,A,Rl,Ri,Ei,E} <: FMRI{P,S,T,A,Rl,Ri,Ei,E}
    participant::P
    seslabel::S
    tasklabel::T
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    echoindex::Ei
    ext::E
end

function filename(bidsp::MultiBandFMRI)
    string(participant(bidsp),
           seslabel(bidsp),
           tasklabel(bidsp),
           acqlabel(bidsp),
           reclabel(bidsP),
           runindex(bidsp),
           echoindex(bidsp),
           "_sbref",
           join(string.(".", extensions(bidsp)))
          )
end

