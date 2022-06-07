# Cypress runner with Cucmber

This repository has a Dockerised cypress test running that includes the Cucumber test syntax.

## Use

1. Build this container `make install`
2. In the container run the test, mapping volumes, including any envs:
   ```sh
   docker run --rm -i \
     -v ${PWD}/feature:/cypress/integrations/ \
     -v ${PWD}/output/videos:/cypress/videos \
     -v ${PWD}/output/screens:/cypress/screenshots \
     -t cypress2
   ```