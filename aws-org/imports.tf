# This is to import the AWS org and the org unit created through the console

import {
  to = aws_organizations_organization.org
  id = "o-e5ftwh98kn"
}

### Without this import function, it will go ahead to create a brand new otg

#### The Snadbox account was already been created using the console and we need to use this import statement to import it from the console into terraform
import {
  to = aws_organizations_account.cs2_sandbox
  id = "825765413126"
}