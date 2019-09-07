
module TimingParameters

export eechotime,
       inversiontime,
       slicetime,
       slicedirection,
       dwelltime

"""
    echotime

The echo time (TE) for the acquisition, specified in seconds.

This parameter is REQUIRED if corresponding fieldmap data is present or the
data comes from a multi echo sequence. Corresponds to DICOM Tag 0018, 0081
`Echo Time` (please note that the DICOM term is in milliseconds not seconds).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
"""
function echotime end


"""
    inversiontime

The inversion time (TI) for the acquisition, specified in seconds. Inversion
time is the time after the middle of inverting RF pulse to middle of excitation
pulse to detect the amount of longitudinal magnetization. Corresponds to DICOM
Tag 0018, 0082 `Inversion Time` (please note that the DICOM term is in
milliseconds not seconds).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
"""
function inversiontime end

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
function slicetime end

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
    dwelltime

Actual dwell time (in seconds) of the receiver per point in the readout
direction, including any oversampling. For Siemens, this corresponds to DICOM
field (0019,1018) (in ns). This value is necessary for the optional readout
distortion correction of anatomicals in the HCP Pipelines. It also usefully
provides a handle on the readout bandwidth, which isn’t captured in the other
metadata tags. Not to be confused with `EffectiveEchoSpacing`, and the frequent
mislabeling of echo spacing (which is spacing in the phase encoding direction)
as "dwell time" (which is spacing in the readout direction).                                                                                                                                                                                                                                                                                                                                                 |
"""
function dwelltime end

end
