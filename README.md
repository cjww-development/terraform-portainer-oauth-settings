terraform-portainer-oauth-settings
==================================

This project demonstrates a potential issue in the way the portainer terraform provider handles setting the oauth within a portainer instance. 

With the `oauth_settings` block set in the `portainer_settings` with appropriate bare min values in `terraform.tf`. We can see that the `portainer_settings` resource isn't setting the correct values in portainer. 

Terraform init, plan and apply run fine and the final apply states that the settings have been applied. However, only the `authentication_method` is set to 3 (OAuth2). Tracing the `PUT /api/settings` via wireshark shows that only the `authentication_method` field and value are sent into the HTTP request, the `oauth_settings` are ommitted from the request. 

The included screenshots demonstrate the output of terraform init, plan and apply
- init-output.png
- plan-output.png
- apply-output.png

We also have the portainer settings screen after apply show only that oauth was selected as the auth method
- portainer-settings.png

Lastly, a screenshot of the wireshark trace for the `PUT /api/settings` request
- wireshark-trace.png
