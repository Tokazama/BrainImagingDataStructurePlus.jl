module Modalities



"""
    NeuroModality

Supertype for traits corresponding to neuroinformatics modalities.
"""
abstract type NeuroModality end

"""
    NeuroNone

Indicates the complete absence of any `NeuroModality`.
"""
struct NeuroNone <: NeuroModality end

"""
    modality(x) -> NeuroModality

Returns the underlying `NeuroModality`, if present. Otherwise returns
`NeuroNone`.
"""
modality(x::T) where {T} = NeuroNone

modality(x::NeuroModality) = x


"""
    HasTimeComponent

Trait type for whether a modality has a time component.
"""
struct HasTimeComponent{T} end

HasTimeComponent(::T) where {T} = HasTimeComponent(T)

HasTimeComponent(::Type{T}) where {T} = HasTimeComponent{false}()


"""
    Imaging
"""
abstract type Imaging <: NeuroModality end

"""
    Localizer Scan
"""
struct LocalizerScan <: Imaging end

"""
    MagneticResonanceImaging (MRI)

Magnetic resonance imaging.
"""
abstract type MagneticResonanceImaging <: Imaging end

include("smri.jl")
include("dwi.jl")
include("fmri.jl")
include("xray.jl")
include("electrophysiology.jl")

###
### Diffusion
###

abstract type DiffusionMRI <: MagneticResonanceImaging end

struct SingleShellDTI <: DiffusionMRI end

struct MultiShellDTI <: DiffusionMRI end

struct Microscopy <: Imaging end

end
