# 1. Remove via CLI terraform state rm
# 2. Remove via removed block
# removed {
#   from = aws_s3_bucket.my_bucket

#   lifecycle {
#     destroy = false
#   }
# }

# resource "aws_s3_bucket" "my_bucket" {
#   bucket="random-name-784231"
# }