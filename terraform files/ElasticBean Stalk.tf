/*resource "aws_elastic_beanstalk_application" "EBStalk" {
  name        = ""
  description = "Web Application Project"
}

resource "aws_elastic_beanstalk_environment" "ebstalk_app" {
  name                = "project-a-app"
  application         = aws_elastic_beanstalk_application.EBStalk.name
  solution_stack_name = "64bit Amazon Linux 2 v5.6.3 running Node.js 16"

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = aws_vpc.VPC.id
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = 1
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = 10
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = aws_subnet.private_subnet.id
  }
    setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = aws_subnet.private_subnet2.id
  }

}*/