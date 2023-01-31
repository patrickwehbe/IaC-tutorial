provider "aws" {
  region = "us-west-2"
}

module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name = "my-eks-cluster"
  subnets     = ["subnet-01", "subnet-02", "subnet-03"]
  vpc_id      = "vpc-01"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

output "kubeconfig" {
  value = module.eks.kubeconfig
}
