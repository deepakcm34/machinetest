provider "aws" {
  region = "us-east-1"
}
resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = "IAMROLE-master"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
