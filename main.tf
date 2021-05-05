
provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}
data "aws_iam_policy_document" "amplify_assume_role_policy_document" {
  statement {
    sid = "1"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["amplify.amazonaws.com"]
    }
    effect = "Allow"
  }
}

data "aws_iam_policy_document" "amplify_role_policy_document" {
  statement {
    actions = [
      "route53:ListHostedZones",
    ]
    resources = ["*"]
  }

  statement {
    actions = [
      "route53:ChangeResourceRecordSets"
    ]
    resources = [
      "arn:aws:route53:::hostedzone/*"
    ]
  }

  statement {
    actions = [
      "secretsmanager:GetSecretValue"
    ]
    resources = [
      "arn:aws:secretsmanager:*"
    ]
  }
}

resource "aws_iam_role" "amplify_role" {
  name               = var.amplify_role
  assume_role_policy = data.aws_iam_policy_document.amplify_assume_role_policy_document.json
}

resource "aws_iam_role_policy" "amplify_policy" {
  name   = "amplify_policy"
  role   = aws_iam_role.amplify_role.id
  policy = data.aws_iam_policy_document.amplify_role_policy_document.json
}

resource "aws_cloudformation_stack" "amplify" {
  name = var.cloudformation_stack_name
  parameters = {
    Repository     = var.amplify_repository_url
    OauthToken     = var.OauthToken
    IAMServiceRole = aws_iam_role.amplify_role.arn
    Domain         = var.domain_name
    Name           = var.amplify_app_name
    Subdomain      = var.amplify_subdomain
    EnvironmentName = var.env
  }
  template_body = file("${path.module}/amplify_app.template")
}