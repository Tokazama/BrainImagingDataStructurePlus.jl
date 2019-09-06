"""
    StructuralImaging
The optional “acq-<label>” key/value pair corresponds to a . For example this should be used when a study
includes two T1w images - one full brain low resolution and and one restricted field of view but high resolution. In
such case two files could have the following names: sub-01_acq-highres_T1w.nii.gz and
sub-01_acq-lowres_T1w.nii.gz,however the user is free to choose any other label than “highres” and
“lowres” as long as they are consistent across subjects and sessions.
* `seslabel::AbstractString`: distinguishes the image corresponding to a specific session.
* `acqlabel::AbstractString`: custom label the user may use to distinguish a different set of parameters used for acquiring the same modality
* `celabel::AbstractString`: distinguishes sequences using different contrast enhanced images. The label is the name of the contrast agent. (optional)
  - The key "ContrastBolusIngredient" can also be added in the JSON file, with the same label.
* `reclabel::AbstractString`: distinguishes different reconstruction algorithms (optional)
* `runindex::AbstractString`: if several scan of the same modality are acquired this is the index (only necessary for multiple scans of same modality)
* `modlabel::AbstractString`: if different modalities referenced by a multiple defacing masks this is the corresponding modality label (optional)
"""
abstract type StructuralImaging{P<:AbstractString,S,A,Rl,Ri,E<:AbstractString} <: BIDSDataType end
const ANAT{P,S,A,Rl,Ri,E} = StructuralImaging{P,S,A,Rl,Ri,E}
datatypefolder(::ANAT) = "anat"

struct T1Weighted{P,S,A,Rl,Ri,E} <: ANAT{P,S,A,Rl,Ri,E}
    participant::P
    seslabel::S
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    ext::Vector{E}
end
modalitylabel(::T1WeightedPath) = "T1w"


struct T2Weighted{P,S,A,Rl,Ri,E} <: ANAT{P,S,A,Rl,Ri,E}
    participant::P
    seslabel::S
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    ext::Vector{E}
end
modalitylabel(::T2WeightedPath) = "T2w"


struct T1RhoMap{P,S,A,Rl,Ri,E} <: ANAT{P,S,A,Rl,Ri,E}
    participant::P
    seslabel::S
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    ext::Vector{E}
end
modalitylabel(::T1RhoMap) = "T1rho"

struct T1RhoMap{P,S,A,Rl,Ri,E} <: ANAT{P,S,A,Rl,Ri,E}
    participant::P
    seslabel::S
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    ext::Vector{E}
end
modalitylabel(::T1RhoMap) = "T1rho"

struct T1Map{P,S,A,Rl,Ri,E} <: ANAT{P,S,A,Rl,Ri,E}
    participant::P
    seslabel::S
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    ext::Vector{E}
end
modalitylabel(::T1Map) = "T1map"

struct T2Map{P,S,A,Rl,Ri,E} <: ANAT{P,S,A,Rl,Ri,E}
    participant::P
    seslabel::S
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    ext::Vector{E}
end
modalitylabel(::T2Map) = "T2map"

struct T2Star{P,S,A,Rl,Ri,E} <: ANAT{P,S,A,Rl,Ri,E}
    participant::P
    seslabel::S
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    ext::Vector{E}
end
modalitylabel(::T2Star) = "T2star"

struct FLAIR{P,S,A,Rl,Ri,E} <: ANAT{P,S,A,Rl,Ri,E}
    participant::P
    seslabel::S
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    ext::Vector{E}
end
modalitylabel(::FLAIR) = "FLAIR"

struct FLASH{P,S,A,Rl,Ri,E} <: ANAT{P,S,A,Rl,Ri,E}
    participant::P
    seslabel::S
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    ext::Vector{E}
end
modalitylabel(::FLASH) = "FLASH"

struct ProtonDensity{P,S,A,Rl,Ri,E} <: ANAT{P,S,A,Rl,Ri,E}
    participant::P
    seslabel::S
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    ext::Vector{E}
end
modalitylabel(::ProtonDensity) = "PD"

struct ProtonDensityMap{P,S,A,Rl,Ri,E} <: ANAT{P,S,A,Rl,Ri,E}
    participant::P
    seslabel::S
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    ext::Vector{E}
end
modalitylabel(::ProtonDensityMap) = "PDmap"

struct CombinedPDT2{P,S,A,Rl,Ri,E} <: ANAT{P,S,A,Rl,Ri,E}
    participant::P
    seslabel::S
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    ext::Vector{E}
end
modalitylabel(::CombinedPDT2) = "PDT2"

struct InplaneT1{P,S,A,Rl,Ri,E} <: ANAT{P,S,A,Rl,Ri,E}
    participant::P
    seslabel::S
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    ext::Vector{E}
end
modalitylabel(::InplaneT1) = "inplaneT1"

struct InplaneT2{P,S,A,Rl,Ri,E} <: ANAT{P,S,A,Rl,Ri,E}
    participant::P
    seslabel::S
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    ext::Vector{E}
end
modalitylabel(::InplaneT2) = "inplaneT2"

struct Angiography{P,S,A,Rl,Ri,E} <: ANAT{P,S,A,Rl,Ri,E}
    participant::P
    seslabel::S
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    ext::Vector{E}
end
modalitylabel(::Angiography) = "angio"

struct DefacingMask{P,S,A,Rl,Ri,M,E} <: ANAT{P,S,A,Rl,Ri,E}
    participant::P
    seslabel::S
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    modlabel::M
    ext::Vector{E}
end
modalitylabel(::DefacingMask) "defacemask"
modlabel(bidsp::DefacingMask{P,S,A,L,Rl,Ri,M}) where {P,S,A,L,Rl,Ri,M} = string("_mod-", bidsp.modlabel)
modlabel(bidsp::DefacingMask{P,S,A,L,Rl,Ri,Nothing}) where {P,S,A,L,Rl,Ri} = ""

struct SusceptibilityWeightedImaging{P,S,A,Rl,Ri,E} <: ANAT{P,S,A,Rl,Ri,E}
    participant::P
    seslabel::S
    acqlabel::A
    reclabel::Rl
    runindex::Ri
    ext::Vector{E}
end
const SWI = SusceptibilityWeightedImaging
modalitylabel(::SWI) = "SWImagandphase"




acqlabel(bidsp::ANAT{P,S,A,L,Rl,Ri}) where {P,S,A,L,Rl,Ri} = string("_acq-", bidsp.seslabel)
acqlabel(bidsp::ANAT{P,S,Nothing,L,RL,Ri}) where {P,S,L,Ri} = ""

seslabel(bidsp::ANAT{P,S,A,L,Rl,Ri}) where {P,S,A,L,Rl,Ri} = string("_ses-", bidsp.seslabel)
seslabel(bidsp::ANAT{P,Nothing,A,L,RL,Ri}) where {P,A,L,Rl,Ri} = ""

recindex(bidsp::ANAT{P,S,A,L,Rl,Ri}) where {P,S,A,L,Rl,Ri} = string("_rec-", bidsp.reclabel)
recindex(bidsp::ANAT{P,S,A,L,Nothing,Ri}) where {P,S,A,L,Ri} = ""

runindex(bidsp::ANAT{P,S,A,L,Rl,Ri}) where {P,S,A,L,Rl,Ri} = string("_run-", bidsp.runindex)
runindex(bidsp::ANAT{P,S,A,L,Rl,Nothing}) where {P,S,A,L,Rl} = ""
