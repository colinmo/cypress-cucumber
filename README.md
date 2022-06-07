# Cypress runner with Cucmber

This repository has a Dockerised cypress test running that includes the Cucumber test syntax.

## Use

1. Build this container `make install`
2. Put Cucumber style tests in a `feature` folder, and raw Cypress tests in a `cypress` folder
3. Create `output/video` and `output/screens` folders to get the outputs of the test locally
4. To run the test use the following (be sure to add any environment variables, the example shells have Username and Password):
   1. Basic
   ```sh
   docker run --rm -i \
     --env USERNAME="${uservar}" --env PASSWORD="${passvar}" \
     -v ${PWD}/feature:/cypress/integrations/ \
     -v ${PWD}/output/videos:/cypress/videos \
     -v ${PWD}/output/screens:/cypress/screenshots \
     --entrypoint /startup-gherkin.sh \
     -t cypress2
   ```
   1. Cucumber
   ```sh
   docker run --rm -i \
     --env USERNAME="${uservar}" --env PASSWORD="${passvar}" \
     -v ${PWD}/cypress:/cypress/integrations/ \
     -v ${PWD}/output/videos:/cypress/videos \
     -v ${PWD}/output/screens:/cypress/screenshots \
     --entrypoint /startup-basic.sh \
     -t cypress2
   ```
5. To run an interactive shell (change `feature` to `cypress` for basic tests):
   ```sh
    docker run --rm -i \
        --env USERNAME="${uservar}" --env PASSWORD="${passvar}" \
        -v ${PWD}/feature:/cypress/integrations/ \
        -v ${PWD}/output/videos:/cypress/videos \
        -v ${PWD}/output/screens:/cypress/screenshots \
        --entrypoint /bin/bash \
        -t cypress2   
   ```