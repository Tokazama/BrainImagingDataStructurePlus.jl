module BrainImagingDataStructurePaths
using FilePaths

include("ScannerHardware.jl")
using .ScannerHardware

include("SequenceSpecifics.jl")
using .SequenceSpecifics

include("InPlaneSpatielEncoding.jl")
using .InPlaneSpatielEncoding

include("TimingParameters.jl")
using .TimingParameters

abstract type BrainImagingDataStructurePath <: AbstractPath end
const BIDSPath = BrainImagingDataStructurePath

abstract type BIDSDataType <: BIDSPath end

"""
    participant(::BIDSDataType) -> "sub-<participant>"
"""
participant(bidsp::BIDSDataType) = string("sub-", bidsp.participant)

abstract type DiffusionWeightedImaging <: BIDSDataType end
const DWI = DiffusionWeightedImaging
datatypefolder(::DWI) = "dwi"


abstract type FieldInhomogeneityMapping <: BIDSDataType end
const FMAP = FieldInhomogeneityMapping
datatypefolder(::FMAP) = "fmap"


"""
    modalitylabel(x) -> AbstractString

Returns label associated with the `x`, where `x` is a either a subtype of
`NeuroModality` or `BrainImagingDataStructurePath`.
"""
function modalitylabel end

include("participant.jl")
include("session.jl")
include("anat.jl")
include("func.jl")
include("taskevents.jl")
include("dwi.jl")
include("fmap.jl")
include("behavioral.jl")

end
