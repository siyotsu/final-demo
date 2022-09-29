[
    {
      "name": "${app_name}",
      "image": "${app_image}",
      "cpu": ${number_cpu},
      "memory": ${number_memory},
      "essential": true,
      "portMappings": [
        {
          "containerPort": ${app_port}
        }
      ],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": { 
          "awslogs-group" : "/ecs/frontend-container",
          "awslogs-region": "${aws_region}"
        }
      },
      "environment": [
        {
          "name": "VERSION",
          "value": "${image_tag}"
        }
      ]
    }
]
