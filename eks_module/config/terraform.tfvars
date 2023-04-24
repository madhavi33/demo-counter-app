aws_eks_cluster_config = {

      "demo-cluster" = {

        eks_cluster_name         = "demo-cluster1"
        eks_subnet_ids = ["subnet-05684b177ed5d5a42","subnet-03e116910b8530e14","subnet-0e1901c725af8b47b"]
        tags = {
             "Name" =  "demo-cluster"
         }  
      }
}

eks_node_group_config = {

  "node1" = {

        eks_cluster_name         = "demo-cluster"
        node_group_name          = "mynode"
        nodes_iam_role           = "eks-node-group-general1"
        node_subnet_ids          = ["subnet-05684b177ed5d5a42","subnet-03e116910b8530e14","subnet-0e1901c725af8b47b"]

        tags = {
             "Name" =  "node1"
         } 
  }
}