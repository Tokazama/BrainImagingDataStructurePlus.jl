
"""
    BehavioralData
"""
abstract type BehavioralData <: BIDSDataType end


datatypefolder(::BehavioralData) = "beh"
