
abstract type AnatomicalImage <: Imaging end

"""
"""
struct T1Weighted <: AnatomicalImage end
modalitylabel(::T1Weighted) = "T1w"

struct T2Weighted <: AnatomicalImage end
modalitylabel(::T2Weighted) = "T2w"

struct T1RhoMap <: AnatomicalImage end
modalitylabel(::T1RhoMap) = "T1rho"

struct T1Map <: AnatomicalImage end
modalitylabel(::T1Map) = "T1map"

struct T2Map <: AnatomicalImage end
modalitylabel(::T2Map) = "T2map"

struct T2Star <: AnatomicalImage end
modalitylabel(::T2Star) = "T2star"


"""
    Fluid-Attenuated Inversion Recovery (FLAIR)
"""
struct FluidAttenuatedInversionRecovery <: AnatomicalImage end
const FLAIR = FluidAttenuatedInversionRecovery
modalitylabel(::FLAIR) = "FLAIR"

"""
    Fast Imaging with Steady-state free Precision
"""
struct FastImagingwithSteadyStateFreePrecission <: FunctionalMRI end
const FISPImage = FastImagingwithSteadyStateFreePrecission

struct ProtonDensity <: AnatomicalImage end
modalitylabel(::ProtonDensity) = "PD"

struct ProtonDensityMap <: AnatomicalImage end
modalitylabel(::ProtonDensityMap) = "PDmap"

"""
    Magnetization Prepared Rapid Acquisition With Gradient Echo (MPRAGE)
"""
struct MagnetizationPreparedRapidAcquisitionWithGradientEcho <: AnatomicalImage end
const MPRAGEImage = MagnetizationPreparedRapidAcquisitionWithGradientEcho

"""
    Fast Spoiled Gradient Echo (FSPGR)
"""
struct FastSpoiledGradientEcho <: AnatomicalImage end
const FSPGRImage = FastSpoiledGradientEcho

"""
    RapidAcquisitionWithRefocusedEchoes
"""
struct RapidAcquisitionWithRefocusedEchoes <: AnatomicalImage end
const RAREImage = RapidAcquisitionWithRefocusedEchoes
const TurboSpinEcho = RapidAcquisitionWithRefocusedEchoes
const FastSpinEcho = RapidAcquisitionWithRefocusedEchoes

static magnetic field B0;

"""
    Fast low angle shot (FLASH)
"""
struct FastLowAngleShot <: AnatomicalImage end
const FLASH = FastLowAngleShot
modalitylabel(::FLASH) = "FLASH"


struct CombinedPDT2 <: AnatomicalImage end
modalitylabel(::CombinedPDT2) = "PDT2"


struct InplaneT1 <: AnatomicalImage end
modalitylabel(::InplaneT1) = "inplaneT1"

struct InplaneT2 <: AnatomicalImage end
modalitylabel(::InplaneT2) = "inplaneT2"

struct Angiography <: AnatomicalImage end
modalitylabel(::Angiography) = "angio"

struct SusceptibilityWeightedImaging <: AnatomicalImage end
const SWI = SusceptibilityWeightedImaging
modalitylabel(::SWI) = "SWImagandphase"

