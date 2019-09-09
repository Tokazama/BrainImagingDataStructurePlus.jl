"""
    SequenceSpecifics

The `SequenceSpecifics` module is intended only for implementing an API for
other formats to interact and exchange scanner sequence specific information.
It is intended to be robust and sufficient, as opposed to comprehensive
coverage of sequence design elements. All methods are exported and no
structures are defined.
"""
module SequenceSpecifics

export pulse_sequence,
       scanning_sequence,
       sequence_variant,
       scan_options

# TODO Pulse sequence type could probably have specific type parameters but for
# now this is just going to return String
"""
    pulse_sequence(x) -> String

A general description of the pulse sequence used for the scan (i.e. MPRAGE,
Gradient Echo EPI, Spin Echo EPI, Multiband gradient echo EPI).                                                                                                                       |
"""
pulse_sequence(x::Any) = ""

"""
    scanning_sequence

Description of the type of data acquired. Corresponds to DICOM Tag 0018, 0020
`Scanning Sequence`.                                                                                                                                                                |
"""
scanning_sequence(x::Any) = ""

"""
    sequence_variant

Variant of the ScanningSequence. Corresponds to DICOM Tag 0018, 0021 `Sequence
Variant`.                                                                                                                                                                          |
"""
function sequence_variant end

"""
    scan_options

Parameters of ScanningSequence. Corresponds to DICOM Tag 0018, 0022
`Scan Options`.                                                                                                                                                                               |
"""
function scan_options end

"""
    sequence_name

Manufacturer’s designation of the sequence name. Corresponds to DICOM Tag 0018,
0024 `Sequence Name`.                                                                                                                                                             |
"""
function sequence_name end

"""
    pulse_sequence_details

Information beyond pulse sequence type that identifies the specific pulse
sequence used (i.e. "Standard Siemens Sequence distributed with the VB17
software," "Siemens WIP ### version #.##," or "Sequence written by X using a
version compiled on MM/DD/YYYY"). |
"""
function pulse_sequence_details end

"""
    nonlinear_gradient_correction(x) -> Bool

Stating if the image saved has been corrected for gradient nonlinearities by
the scanner sequence.                                                                                                                                                        |
"""
function nonlinear_gradient_correction(x) end

# TODO does this mean JSON is in seconds and DICOM is in ms
"""
    echotime(x) -> Millisecond

The echo time (TE) for the acquisition.

This parameter is REQUIRED if corresponding fieldmap data is present or the
data comes from a multi echo sequence.

please note that the DICOM term is in milliseconds not seconds
"""
echotime(x::Any) = Millisecond(1)
dicomtag(::typeof(echotime)) = (0x0018, 0x0081)
jsontag(::typeof(echotime)) = "EchoTime"


"""
    inversiontime

The inversion time (TI) for the acquisition, specified in seconds. Inversion
time is the time after the middle of inverting RF pulse to middle of excitation
pulse to detect the amount of longitudinal magnetization. Corresponds to DICOM
Tag 0018, 0082 `Inversion Time` (please note that the DICOM term is in
milliseconds not seconds).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
"""
inversiontime
dicomtag(::typeof(inversiontime)) = (0x0018, 0x0082)
jsontag(::typeof(inversiontime)) = "InversionTime"

"""
    slicetime

The time at which each slice was acquired within each volume (frame) of the
acquisition. Slice timing is not slice order -- rather, it is a list of times
(in JSON format) containing the time (in seconds) of each slice acquisition in
relation to the beginning of volume acquisition. The list goes through the
slices along the slice axis in the slice encoding dimension (see below). Note
that to ensure the proper interpretation of the `SliceTiming` field, it is
important to check if the OPTIONAL `SliceEncodingDirection` exists. In
particular, if `SliceEncodingDirection` is negative, the entries in
`SliceTiming` are defined in reverse order with respect to the slice axis
(i.e., the final entry in the `SliceTiming` list is the time of acquisition of
slice 0). This parameter is REQUIRED for sparse sequences that do not have the
`DelayTime` field set. In addition without this parameter slice time correction
will not be possible.
"""
function slicetiming end

"""
    slicedirection

Possible values: `i`, `j`, `k`, `i-`, `j-`, `k-` (the axis of the NIfTI data
along which slices were acquired, and the direction in which `SliceTiming` is
defined with respect to). `i`, `j`, `k` identifiers correspond to the first,
second and third axis of the data in the NIfTI file. A `-` sign indicates that
the contents of `SliceTiming` are defined in reverse order - that is, the first
entry corresponds to the slice with the largest index, and the final entry
corresponds to slice index zero. When present, the axis defined by
`SliceEncodingDirection` needs to be consistent with the ‘slice_dim’ field in
the NIfTI header. When absent, the entries in `SliceTiming` must be in the
order of increasing slice index as defined by the NIfTI header.                                                                                                                                                                                           |
"""
function slicedirection end

"""
    dwelltime -> Nanosecond

Actual dwell time (in seconds) of the receiver per point in the readout
direction, including any oversampling. For Siemens, this corresponds to DICOM
field (0019,1018) (in ns). This value is necessary for the optional readout
distortion correction of anatomicals in the HCP Pipelines. It also usefully
provides a handle on the readout bandwidth, which isn’t captured in the other
metadata tags. Not to be confused with `EffectiveEchoSpacing`, and the frequent
mislabeling of echo spacing (which is spacing in the phase encoding direction)
as "dwell time" (which is spacing in the readout direction).                                                                                                                                                                                                                                                                                                                                                 |
"""
dwelltime(x::Any) = Nanosecond(1)
dicomtag(::typeof(dwilltime)) = (0x0019, 0x1018)
jsontag(::typeof(dwilltime)) = "DwellTime"

"""
    flipangle

Flip angle for the acquisition
"""
function flipangle end
dicomtag(::typeof(flipangle)) = (0x0018,0x1314)
jsontag(::typeof(flipangle)) = "FlipAngle"


"""
    multiband_acceleration_factor

The multiband factor, for multiband acquisitions.
"""
function multiband_acceleration_factor end
jsontag(::typeof(multiband_acceleration_factor)) = "MultibandAccelerationFactor"

"""
    negative_contrast -> Bool
"""
function negative_contrast end
jsontag(::typeof(negative_contrast)) = "NegativeContrast"

end
