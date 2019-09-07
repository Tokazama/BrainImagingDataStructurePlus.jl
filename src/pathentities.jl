###
### Subject
###
"""
    subject(::BIDSDataType)

Returns the subject label. Required for *ALL* BIDS formats.
"""
subject(p::BIDSDataType) = subject(getproperty(p, :subject))

"""
    substr(::BIDSDataType) -> "sub-<label>"

Returns the subject label as a string for use in a BIDS file name.
"""
substr(p::BIDSDataType) = substr(subject(p))
substr(p::AbstractString) = "sub-$(p)"
substr(p::Any) = substr(String(p))

###
### Session
###
"""
    session(::BIDSDataType)
"""
session(p::BIDSDataType) = session(getproperty(p, :session))

"""
    sesstr(::BIDSDataType) -> "ses-<label>"
"""
sesstr(p::BIDSDataType) = sesstr(session(p))
sesstr(p::Nothing) = ""
sesstr(p::AbstractString) = "ses-$(p)"
sesstr(p::Any) = sesstr(String(p))


###
### Task
###
"""
    tasklabel(::BIDSDataType)
"""
tasklabel(p::BIDSDataType) = getproperty(p, :tasklabel)

"""
    taskstr(::BIDSDataType) -> "task-<label>"
"""
taskstr(p::BIDSDataType) = taskstr(tasklabel(p))
taskstr(p::Nothing) = ""
taskstr(p::AbstractString) = "task-$(p)"
taskstr(p::Any) = acqstr(String(p))

###
### Acquisition
###
"""
    acquisitiontype(::BIDSDataType)
"""
acquisitiontype(p::BIDSDataType) = getproperty(p, :acquisitiontype)

"""
    acqstr(::BIDSDataType) -> "acq-<label>"
"""
acqstr(p::BIDSDataType) = acqstr(acquisitiontype(p))
acqstr(p::AbstractString) = "acq-$(p)"
acqstr(p::Any) = acqstr(String(p))


###
### Contrast enhancing agent
###
"""
    contrastagent(::BIDSDataType)
"""
contrastagent(p::BIDSDataType) = getproperty(p, :contrastagent)

"""
cestr
"""
cestr(p::BIDSDataType) = cestr(contrastagent(p))
cestr(p::Nothing) = ""
cestr(p::AbstractString) = "ce-$p"
cestr(p::Any) = cestr(String(p))

###
### Reconstruction
###
"""
    reconstruction(::BIDSDataType)
"""
reconstruction(p::BIDSDataType) = getproperty(p, :reconstruction)

"""
    recstr(::BIDSDataType) -> \"rec-<label>\"
"""
recstr(p::BIDSDataType) = cestr(reconstruction(p))
recstr(p::Nothing) = ""
recstr(p::AbstractString) = "rec-$p"
recstr(p::Any) = cestr(String(p))

###
### Phase direction
###
"""
    phasedirection
"""
phasedirection(p::BIDSDataType) = getproperty(p, :phasedirection)

"pdstr(x) -> \"dir-<label>\""
pdstr(p::BIDSDataType) = pdstr(phasedirection(p))
pdstr(p::Nothing) = ""
pdstr(p::AbstractString) = "dir-$p"
pdstr(p::Any) = pdstr(String(p))

###
### Run index
###
"runindex(x)"
runindex(x::BIDSDataType) = getproperty(p, :runindex)

"ristr(x) -> \"run-<index>\""
ristr(x::BIDSDataType) = ristr(runindex(x))
ristr(x::Nothing) = ""
ristr(x::AbstractString) = "run-$x"
ristr(x::Any) = ristr(String(x))

###
### Corresponding modality
###
# TODO I do NOT like this name
"""
    corrmodality(x)

Returns the modality associated with the file. Note that this is _not_ the
file's modality. For example, a brain mask for fMRI data would not have the
same "modality" as "corrmodality".
"""
corrmodality(x::BIDSDataType) = getproperty(x, :corrmodality)

"cmstr(x) -> \"mod-<label>\""
cmstr(x::BIDSDataType) = cmstr(corrmodality(x))
cmstr(x::Nothing) = ""
cmstr(x::AbstractString) = "mod-$x"
cmstr(x::Any) = cmstr(String(x))

###
### Echo index
###
"""
    echoindex(x)
"""
echoindex(x::BIDSDataType) = getproperty(x, :echoindex)


"echostr(x) -> \"echo-<label>\""
echostr(x::BIDSDataType) = echostr(echoindex(x))
echostr(x::Nothing) = ""
echostr(x::AbstractString) = "echo-$x"
echostr(x::Any) = echostr(String(x))

###
### Recording label
###
"""
    recordinglabel(x)
"""
recordinglabel(x::BIDSDataType) = getproperty(x, :recordinglabel)


"echostr(x) -> \"echo-<label>\""
recordingstr(x::BIDSDataType) = recordingstr(recordinglabel(x))
recordingstr(x::Nothing) = ""
recordingstr(x::AbstractString) = "recording-$x"
recordingstr(x::Any) = recordingstr(String(x))

###
### Processed (on device)
###
"""
"""
isprocessed(x::BIDSDataType)

###
### Space
###

