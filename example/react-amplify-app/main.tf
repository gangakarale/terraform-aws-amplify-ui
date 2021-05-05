module "react-amplify-app" {
  source = "../../"
  amplify_app_name = "react-app"
  amplify_repository_url = "https://github.com/gangakarale/sample-create-react-app"
  amplify_subdomain = "react"
  domain_name = "gangaram.com"
  service_name = "react-test-app"
  amplify_role = "react-amplify-role"
  cloudformation_stack_name = "react-amplify-app-demo"
  OauthToken = "xxxxxxxx"
}