region = "us-east-1"
cluster_name = "staging01"
cluster_version = "1.17"
vpc_id = ""
subnet_ids = [""]
instance_types = ["t3.small"]


spot_termination_handler_chart_name      = "aws-node-termination-handler"
spot_termination_handler_chart_repo      = "https://aws.github.io/eks-charts"
spot_termination_handler_chart_version   = "0.9.1"
spot_termination_handler_chart_namespace = "kube-system"
