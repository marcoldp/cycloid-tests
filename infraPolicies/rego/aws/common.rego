package cycloid_tf.aws

# Check if tag corresponds to the cycloid standard : 
# not possible to check organisation -> check done on the be side -> what if client wants to do it?
# Considering default
  # standard_tags = {
  #   "cycloid.io" = "true"
  #   env          = var.env
  #   project      = var.project
  #   client       = var.customer
  #   organization = var.customer
  # }

tags_ok(resource) {
  resource.tags["cycloid.io"] == "true"
  resource.tags["env"] == input.environment_canonical
  resource.tags["project"] == input.project_canonical
  # resouce.tags["client"] ==
  # resouce.tags["organization"] ==
}

