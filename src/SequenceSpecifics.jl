"""
    SequenceSpecifics

The `SequenceSpecifics` module is intended only for implementing an API for
other formats to interact and exchange scanner sequence specific information.
It is intended to be robust and sufficient, as opposed to comprehensive
coverage of sequence design elements. All methods are exported and no
structures are defined.
"""
module SequenceSpecifics

export pulse_sequence_type,
       scanning_sequence,
       sequence_variant,
       scan_options

"""
    pulse_sequence_type

A general description of the pulse sequence used for the scan (i.e. MPRAGE,
Gradient Echo EPI, Spin Echo EPI, Multiband gradient echo EPI).                                                                                                                       |
"""
function pulse_sequence_type end

"""
    scanning_sequence

Description of the type of data acquired. Corresponds to DICOM Tag 0018, 0020
`Scanning Sequence`.                                                                                                                                                                |
"""
function scanning_sequence end

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

end
