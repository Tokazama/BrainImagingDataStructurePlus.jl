module BIDSMetadata

export institution_name,
       institution_address,
       institutional_department_name,
       manufacturer,
       manufacturer_model_name,
       device_serial_number,
       station_name,
       software_versions,
       magnetic_field_strength,
       receiver_coil_name,
       receive_coil_active_elements,
       gradient_set_type,
       mr_transmit_coil_sequence,
       matrix_coil_mode,
       coil_combination_method,
       pulse_sequence,
       scanning_sequence,
       sequence_variant,
       scan_options,
       echotime,
       inversiontime,
       slicetime,
       slicedirection,
       dwelltime
###
### Institution information
###

"""
    institution_name(x) -> String

The name of the institution in charge of the equipment that produced the
composite instances.
"""
institution_name(x::Any) = ""
dicomtag(::typeof(institution_name)) = (0x0008,0x0080)
jsontag(::typeof(institution_name)) = "InstitutionName"

"""
    institution_address(x) -> String

The address of the institution in charge of the equipment that produced the
composite instances.
"""
institution_address(x::Any) = ""
dicomtag(::typeof(institution_address)) = (0x0008,0x0081)
jsontag(::typeof(institution_address)) = "InstitutionAddress"

"""
    institutional_department_name(x) -> String

The department in the institution in charge of the equipment that produced the
composite instances.
"""
institutional_department_name(x) = ""
dicomtag(::typeof(institutional_department_name)) = (0x0008,0x1040)
jsontag(::typeof(institutional_department_name)) = "InstitutionalDepartmentName"


###
### Scanner Hardware
###
"""
    manufacturer(x) -> String

Manufacturer of the equipment that produced the composite instances.
"""
manufacturer(x::Any) = ""
dicomtag(::typeof(manufacturer)) = (0x0008, 0x0070)
jsontag(::typeof(manufacturer)) = "Manufacturer"

"""
    manufacturer_model_name(x) -> String

Manufacturer's model name of the equipment that produced the composite
instances.
"""
manufacturer_model_name(x::Any) = ""
dicomtag(::typeof(manufacturer_model_name)) = (0x0008, 0x1090)
jsontag(::typeof(manufacturer_model_name)) = "ManufacturersModelName"

"""
    device_serial_number(x) -> Number

The serial number of the equipment that produced the composite instances.
A pseudonym can also be used to prevent the equipment from being identifiable,
so long as each pseudonym is unique within the dataset.
"""
device_serial_number(x::Any) = 0
dicomtag(typeof(device_serial_number)) = (0x0018, 0x1000)
jsontag(::typeof(device_serial_number)) = "DeviceSerialNumber"

"""
    station_name(x) -> String

Institution defined name of the machine that produced the composite instances.
"""
station_name(x::Any) = ""
dicomtag(::typeof(station_name)) = (0x0008, 0x1010)
jsontag(::typeof(station_name)) = "StationName"

"""
    software_versions(x) -> Vector

Manufacturer’s designation of software version of the equipment that produced
the composite instances.
"""
software_versions(x::Any) = ""
dicomtag(::typeof(software_versions)) = (0x0018, 0x1020)
jsontag(::typeof(software_versions)) = "SoftwareVersions"

"""
    magnetic_field_strength(x) -> Float64

Nominal field strength of MR magnet in Tesla.
"""
magnetic_field_strength(x::Any) = Float64
dicomtag(::typeof(magnetic_field_strength)) = (0x0018,0x0087)
jsontage(::typeof(magnetic_field_strength)) = "MagneticFieldStrength"

"""
    receiver_coil_name(x) -> String

Information describing the receiver coil. Corresponds to DICOM Tag
Receive Coil Name, although not all vendors populate that DICOM Tag, in which
case this field can be derived from an appropriate private DICOM field.
"""
receiver_coil_name(x) = ""
dicomtag(::typeof(receiver_coil_name)) = (0x0018, 0x1250)
jsontag(::typeof(receiver_coil_name)) = "ReceiverCoilName"


"""
    receive_coil_active_elements(x)

Information describing the active/selected elements of the receiver coil. This
doesn’t correspond to a tag in the DICOM ontology. The vendor-defined
terminology for active coil elements can go in this field. As an example, for
Siemens, coil channels are typically not activated/selected individually, but
rather in pre-defined selectable "groups" of individual channels, and the list
of the "groups" of elements that are active/selected in any given scan
populates the Coil String entry in Siemens’ private DICOM fields (e.g., HEA;HEP
for the Siemens standard 32 ch coil when both the anterior and posterior groups
are activated). This is a flexible field that can be used as most appropriate
for a given vendor and coil to define the "active" coil elements. Since
individual scans can sometimes not have the intended coil elements selected, it
is preferable for this field to be populated directly from the DICOM for each
individual scan, so that it can be used as a mechanism for checking that a
given scan was collected with the intended coil elements selected.

* Support suggestion: recommended
"""
function receive_coil_active_elements end
jsontag(::typeof(receive_coil_active_elements)) = "ReceiveCoilActiveElements"


"""
    gradient_set_type(x)

It should be possible to infer the gradient coil from the scanner model. If
not, e.g. because of a custom upgrade or use of a gradient insert set, then the
specifications of the actual gradient coil should be reported independently.

* Support suggestion: recommended
"""
function gradient_set_type end
jsontag(::typeof(gradient_set_type)) = "GradientSetType"

"""
    mr_transmit_coil_sequence(x)

This is a relevant field if a non-standard transmit coil is used.
"""
function mr_transmit_coil_sequence end
dicomtag(::typeof(mr_transmit_coil_sequence)) = (0x0018, 0x9049)
jsontag(::typeof(mr_transmit_coil_sequence)) = "MRTransmitCoilSequence"

"""
    matrix_coil_mode

A method for reducing the number of independent channels by combining in analog
the signals from multiple coil elements. There are typically different default
modes when using un-accelerated or accelerated (e.g. GRAPPA, SENSE) imaging.
"""
function matrix_coil_mode end
jsontag(::typeof(matrix_coil_mode)) = "MatrixCoilMode"

"""
    coil_combination_method

Almost all fMRI studies using phased-array coils use root-sum-of-squares (rSOS)
combination, but other methods exist. The image reconstruction is changed by
the coil combination method (as for the matrix coil mode above), so anything
non-standard should be reported
"""
function coil_combination_method end
jsontag(::typeof(coil_combination_method)) = "CoilCombinationMethod"

# TODO does this mean JSON is in seconds and DICOM is in ms
"""
    echotime(x) -> Seconds

The echo time (TE) for the acquisition.

This parameter is REQUIRED if corresponding fieldmap data is present or the
data comes from a multi echo sequence.

please note that the DICOM term is in milliseconds not seconds
"""
echotime(x::Any) = Float64
dicomtag(::typeof(echotime)) = (0x0018, 0x0081)
jsontag(::typeof(echotime)) = "EchoTime"


"""
    inversiontime

The inversion time (TI) for the acquisition, specified in seconds. Inversion
time is the time after the middle of inverting RF pulse to middle of excitation
pulse to detect the amount of longitudinal magnetization.

please note that the DICOM term is in milliseconds not seconds
"""
function inversiontime end
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
    dwelltime -> Second

Actual dwell time (in seconds) of the receiver per point in the readout
direction, including any oversampling. For Siemens, this corresponds to DICOM
field (0019,1018) (in ns). This value is necessary for the optional readout
distortion correction of anatomicals in the HCP Pipelines. It also usefully
provides a handle on the readout bandwidth, which isn’t captured in the other
metadata tags. Not to be confused with `EffectiveEchoSpacing`, and the frequent
mislabeling of echo spacing (which is spacing in the phase encoding direction)
as "dwell time" (which is spacing in the readout direction).                                                                                                                                                                                                                                                                                                                                                 |
"""
dwelltime(x::Any) = Second(1)
dicomtag(::typeof(dwilltime)) = (0x0019, 0x1018)
jsontag(::typeof(dwilltime)) = "DwellTime"

"""
    flipangle -> Int

Flip angle for the acquisition in degrees.
"""
flipangle(x::Any) = 0
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

"""
    anatomical_landmarks(x) -> Pair

Key:value pairs of any number of additional anatomical landmarks and their
coordinates in voxel units (where first voxel has index 0,0,0) relative to the
associated anatomical MRI, (e.g. {"AC": [127,119,149], "PC": [128,93,141],
"IH": [131,114,206]}, or {"NAS": [127,213,139], "LPA": [52,113,96],
"RPA": [202,113,91]}).
"""
function anatomical_landmarks end
jsontag(::typeof(anatomical_landmarks)) = "AnatomicalLandmarkCoordinates"

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

    parallel_reduction_factor_inplane

Measurement time reduction factor expressed as ratio of original and reduced
measurement time for the in-plane direction. Required if Frame Type (0008,9007)
Value 1 of this frame is ORIGINAL and Parallel Acquisition (0018,9077) equals
YES. Otherwise may be present if Frame Type (0008,9007) Value 1 is DERIVED and
Parallel Acquisition (0018,9077) equals YES.
"""
function parallel_reduction_factor_inplane end
dicomtag(::typeof(parallel_reduction_factor_inplane)) = (0x0018,0x9069)

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
    ntemporal_positions

Total number of temporal positions prescribed.
"""
function ntemporal_positions end
dicomtag(::typeof(ntemporal_positions)) = (0x0020, 0x0105)


"""
    temporal_resolution

Time delta between Images in a dynamic of functional set of Images.
"""
function temporal_resolution end
dicomtag(::typeof(temporal_resolution)) = (0x0020, 0x0110)

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
    inversiontime(x) -> Second

The inversion time (TI) for the acquisition, specified in seconds. Inversion
time is the time after the middle of inverting RF pulse to middle of excitation
pulse to detect the amount of longitudinal magnetization. Corresponds to DICOM
Tag 0018, 0082 `Inversion Time` (please note that the DICOM term is in
milliseconds not seconds).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
"""
inversiontime(x::Any) = Second(1)
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


"""
    contrast_bolus_ingredient(x) = ""

Active ingredient of agent. Values MUST be one of: IODINE, GADOLINIUM,
CARBON DIOXIDE, BARIUM, XENON.
"""
contrast_bolus_ingredient(x::Any) = ""
dicomtag(::typeof(contrast_bolus_ingredient)) = (0x0018,0x1048)
jsontag(::typeof(contrast_bolus_ingredient)) = "ContrastBolusIngredient"



"""
    reptime(x) -> Float64

The time in seconds between the beginning of an acquisition of one volume and
the beginning of acquisition of the volume following it (TR). Please note that
this definition includes time between scans (when no data has been acquired) in
case of sparse acquisition schemes. This value needs to be consistent with the
pixdim[4] field (after accounting for units stored in xyzt_units field) in the
NIfTI header. This field is mutually exclusive with VolumeTiming and is derived
from DICOM Tag 0018, 0080 and converted to seconds.
"""
reptime(x::Any) -> one(Float64)
dicomtag(::typeof(reptime)) = (0x0018,0x0080)
jsontag(::typeof(reptime)) = "RepetitionTime"

"""
    voltime(x)

The time at which each volume was acquired during the acquisition. It is
described using a list of times (in JSON format) referring to the onset of each
volume in the BOLD series. The list must have the same length as the BOLD
series, and the values must be non-negative and monotonically increasing. This
field is mutually exclusive with RepetitionTime and DelayTime. If defined, this
requires acquisition time (TA) be defined via either SliceTiming or
AcquisitionDuration be defined.
"""
function voltime end
jsontag(::typeof(voltime)) = "VolumeTiming"


"""
    nvol_scanner_discarded(x) -> Int

Number of volumes ("dummy scans") discarded by the scanner (as opposed to those
discarded by the user post hoc) before saving the imaging file. For example, a
sequence that automatically discards the first 4 volumes before saving would
have this field as 4. A sequence that doesn't discard dummy scans would have
this set to 0. Please note that the onsets recorded in the _event.tsv file
should always refer to the beginning of the acquisition of the first volume in
the corresponding imaging file - independent of the value of
NumberOfVolumesDiscardedByScanner field.
"""
nvol_scanner_discarded(x::Any) = 0
jsontag(::typeof(nvol_scanner_discarded)) = "NumberOfVolumesDiscardedByScanner"

"""
    nvol_user_discarded(x) -> Int

Number of volumes ("dummy scans") discarded by the user before including the
file in the dataset. If possible, including all of the volumes is strongly
recommended. Please note that the onsets recorded in the _event.tsv file
should always refer to the beginning of the acquisition of the first volume in
the corresponding imaging file - independent of the value of
NumberOfVolumesDiscardedByUser field.
"""
nvol_user_discarded(x::Any) = 0
jsontag(::typeof(nvol_user_discarded)) = "NumberOfVolumesDiscardedByUser"

"""
    taskname(x) -> String

Name of the task. No two tasks should have the same name. Task label (task-)
included in the file name is derived from this field by removing all non
alphanumeric ([a-zA-Z0-9]) characters. For example task name faces n-back will
corresponds to task label facesnback. A RECOMMENDED convention is to name
resting state task using labels beginning with rest.
"""
taskname(x::Any) = ""

"""
    taskinstructions(x) -> String
"""
taskinstructions(x::Any) = ""


"""
    taskdescription(x) -> String
"""
taskdescription(x::Any) = ""

"""
    cognitive_atlas_id(x)
"""
function cognitive_atlas_id end
const cogatlas = cognitive_atlas_id


"""
    cognitive_atlas_paradigm_ontology
"""
function cognitive_atlas_paradigm_ontology end
const cogpo = cognitive_atlas_paradigm_ontology

end
