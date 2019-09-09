
abstract type CognitiveAtlas end

mutable struct ConceptAPI
    alias::String
    id_concept_class::String
    last_updated::Int
    creation_time::Int
    definition_text::String
    id::String
    id_user::String
    def_id::String
    event_stamp::String
    def_id_user::String
    # TODO: date time
#    def_event_stamp:: "2011-08-10T20:41:26",
    name::String
end

mutable struct DisorderAPI
    id::String
    id_protocol::String
    id_user::String
    flag_for_curator::Int
#  TODO date time
#    event_stamp:: "2013-11-20T15:38:08"
    name::String
    definition::String
end