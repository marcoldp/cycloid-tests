#rego defined in BE in /services/authorisation/
#starts Policy validator using default module and query 



# This package specifies rules to be applied into the file

package rules.${PACKAGE_NAME}

# imports -> by default should be tfplan to check if possible to add others
import input as tfplan # in infrapolicies corresponds to ValidationInput object in BE # services/youdeploy/opa/infra_policy.go
    # project_cannonical 
    # envionment_cannonical
    # tfplan
# resources to be considered in this rule, can be a list as well
resource_type = ${RESOURCE_TYPES}

feddback
# diference between tfplan and tfstate -> check if possible to apply some logic
# in OPA also possible to specify directories could be interesting to allow reuse of some common logic

# cli not possible to create infrapolicy just validate it
# console -> create, list, delete per organisation (FE to improve)
# cli -> only allows to validate
# resource ->
#   api_url: optional change to required

  #notes -> in demo wordpress infrapolicy uses old infrapolicy-resource
  # mising in docs -> example of declaration of resource in stack