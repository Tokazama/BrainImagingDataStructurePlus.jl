"""
    ScannerHardware

The `ScannerHardware` module is intended only for implementing an API for other
formats to interact and exchange critical information. All methods are exported
and no structures are defined.
"""
module ScannerHardware

export scanner_hardware,
       manufacturer_model_name,
       device_serial_number,
       station_name,
       software_versions,
       magnetic_field_strength,
       receive_coil_name,
       receive_coil_active_elements,
       gradient_set_type,
       mr_transmit_coil_sequence

"""
    scanner_hardware(x) -> String

Manufacturer of the equipment that produced the composite instances.
Corresponds to DICOM Tag 0008, 0070 Manufacturer.

Support suggestion: recommended
"""
function scanner_hardware end

"""
    manufacturer_model_name(x) -> String
Manufacturer's model name of the equipment that produced the composite
instances. Corresponds to DICOM Tag 0008, 1090 Manufacturers Model Name.

* Support suggestion: recommended
"""
function manufacturer_model_name end

"""
    device_serial_number(x) -> Number

The serial number of the equipment that produced the composite instances.
Corresponds to DICOM Tag 0018, 1000 DeviceSerialNumber. A pseudonym can also be
used to prevent the equipment from being identifiable, so long as each
pseudonym is unique within the dataset.

* Support suggestion: recommended
"""
function device_serial_number end

"""
    station_name(x) -> String

Institution defined name of the machine that produced the composite instances.
Corresponds to DICOM Tag 0008, 1010 Station Name

* Support suggestion: recommended
"""
function station_name end

"""
    software_versions(x) -> Vector

Manufacturer’s designation of software version of the equipment that produced
the composite instances. Corresponds to DICOM Tag 0018, 1020 Software Versions.

* Support suggestion: recommended
"""
function software_versions end

"""
    magnetic_field_strength(x)

Nominal field strength of MR magnet in Tesla. Corresponds to DICOM Tag 0018,0087
Magnetic Field Strength.

* Support suggestion: recommended
"""
function magnetic_field_strength end

"""
    receive_coil_name(x)

Information describing the receiver coil. Corresponds to DICOM Tag 0018, 1250
Receive Coil Name, although not all vendors populate that DICOM Tag, in which
case this field can be derived from an appropriate private DICOM field.

* Support suggestion: recommended
"""
function receive_coil_name end


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


"""
    gradient_set_type(x)

It should be possible to infer the gradient coil from the scanner model. If
not, e.g. because of a custom upgrade or use of a gradient insert set, then the
specifications of the actual gradient coil should be reported independently.

* Support suggestion: recommended
"""
function gradient_set_type end

"""
    mr_transmit_coil_sequence(x)

This is a relevant field if a non-standard transmit coil is used. Corresponds
to DICOM Tag 0018, 9049 MR Transmit Coil Sequence.

* Support suggestion: recommended
"""
function mr_transmit_coil_sequence end
