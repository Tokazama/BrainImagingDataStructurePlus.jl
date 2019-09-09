

"""
    BIDSDataset


"""
 struct BIDSDataset
    "`name`: Name of the dataset (required)"
    name::String
    "`BIDSVersion`: The version of the BIDS standard that was used. (required)"
    BIDSVersion::VersionNumber
    "`License`: What license is this dataset distributed under? (recommended)"
    license::String
    "`authors`: List of individuals who contributed to the creation/curation of the dataset (optional)."
    authors::Vector{String}
    "`acknowledgements`: Text acknowledging contributions of individuals or institutions beyond those listed in Authors or Funding (optional)."
    acknowledgements::String
    "`howtoacknowledge`: Instructions how researchers using this dataset should acknowledge the original authors. This field can also be used to define a publication that should be cited in publications that use the dataset (optional)."
    howtoacknowledge::String
    "`funding`: List of sources of funding (grant numbers) (optional)"
    funding::String
    "`referencesandlinks`: List of references to publication that contain information on the dataset, or links (optional)."
    referencesandlinks::Vector{String}
    "`datasetdoi`:The Document Object Identifier of the dataset (not the corresponding paper) (optional)."
    datasetdoi::String
end