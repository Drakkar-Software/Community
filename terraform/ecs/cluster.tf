# ECS Cluster (needed even if using FARGATE launch type)
resource "aws_ecs_cluster" "default" {
  name = module.this.id
  tags = module.this.tags

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
