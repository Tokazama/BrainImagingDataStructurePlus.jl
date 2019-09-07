module InPlaneSpatielEncoding

export nshots,
       parallel_reduction_factor_in_plane,
       parallel_acquisition_technique,
       partial_fourier,
       phase_encoding_direction,
       total_readout_time

"""
    nshots

The number of RF excitations need to reconstruct a slice or volume. Please mind
that this is not the same as Echo Train Length which denotes the number of
lines of k-space collected after an excitation.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
"""

"""
    parallel_reduction_factor_in_plane

The parallel imaging (e.g, GRAPPA) factor. Use the denominator of the fraction
of k-space encoded for each slice. For example, 2 means half of k-space is
encoded. Corresponds to DICOM Tag 0018, 9069 `Parallel Reduction Factor
In-plane`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
"""

"""
    parallel_acquisition_technique

The type of parallel imaging used (e.g. GRAPPA, SENSE). Corresponds to DICOM
Tag 0018, 9078 `Parallel Acquisition Technique`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
"""

"""
    partial_fourier

The fraction of partial Fourier information collected. Corresponds to DICOM
Tag 0018, 9081 `Partial Fourier`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
"""
function partial_fourier end

"""
    partial_fourier_direction

The direction where only partial Fourier information was collected. Corresponds to DICOM Tag 0018, 9036 `Partial Fourier Direction`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
"""

"""
    phase_encoding_direction

Possible values: `i`, `j`, `k`, `i-`, `j-`, `k-`. The letters `i`, `j`, `k`
correspond to the first, second and third axis of the data in the NIFTI file.
The polarity of the phase encoding is assumed to go from zero index to maximum
index unless `-` sign is present (then the order is reversed - starting from
the highest index instead of zero). `PhaseEncodingDirection` is defined as the
direction along which phase is was modulated which may result in visible
distortions. Note that this is not the same as the DICOM term
`InPlanePhaseEncodingDirection` which can have `ROW` or `COL` values. This
parameter is REQUIRED if corresponding fieldmap data is present or when using
multiple runs with different phase encoding directions (which can be later used
for field inhomogeneity correction).
"""
function phase_encoding_direction end

"""
    effective_echo_spacing

The "effective" sampling interval, specified in seconds, between lines in the
phase-encoding direction, defined based on the size of the reconstructed image
in the phase direction. It is frequently, but incorrectly, referred to as
"dwell time" (see `DwellTime` parameter below for actual dwell time). It is
required for unwarping distortions using field maps. Note that beyond just
in-plane acceleration, a variety of other manipulations to the phase encoding
need to be accounted for properly, including partial fourier, phase
oversampling, phase resolution, phase field-of-view and interpolation.<sup>2</sup>
This parameter is REQUIRED if corresponding fieldmap data is present.                                                                                                                  |


<sup>2</sup>Conveniently, for Siemens’ data, this value is easily obtained as
1/\[`BWPPPE` \* `ReconMatrixPE`\], where BWPPPE is the
"`BandwidthPerPixelPhaseEncode` in DICOM tag (0019,1028) and ReconMatrixPE is
the size of the actual reconstructed data in the phase direction (which is NOT
reflected in a single DICOM tag for all possible aforementioned scan
manipulations). See [here](https://lcni.uoregon.edu/kb-articles/kb-0003) and
[here](https://github.com/neurolabusc/dcm_qa/tree/master/In/TotalReadoutTime)

"""
function effective_echo_spacing end

"""
    total_readout_time

This is actually the "effective" total readout time , defined as the readout
duration, specified in seconds, that would have generated data with the given
level of distortion. It is NOT the actual, physical duration of the readout
train. If `EffectiveEchoSpacing` has been properly computed, it is just
`EffectiveEchoSpacing * (ReconMatrixPE - 1)`.<sup>3</sup> .

* This parameter is
REQUIRED if corresponding "field/distortion" maps acquired with opposing phase
encoding directions are present (see 8.9.4).                                                                                                                                                                                                                                                                                                  |

<sup>3</sup>We use the "FSL definition", i.e, the time between the center of the
first "effective" echo and the center of the last "effective" echo.
"""
function total_readout_time end

"""
"""
end
