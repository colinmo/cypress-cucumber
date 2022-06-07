FROM cookiescrumbs/cypress-m1:9.4.1

RUN yarn add -D babel-plugin-istanbul @cypress/code-coverage cypress-sonarqube-reporter cypress-cucumber-preprocessor

RUN (head -n-1 package.json && echo ',"cypress-cucumber-preprocessor": {"nonGlobalStepDefinitions": true,"step_definitions": "/cypress/integrations"}}') > package2.json \
    && cp package2.json package.json \
    && rm package2.json \
    && apt-get update \
    && apt-get install -y procps \
    && apt-get clean \
    && apt-get autoremove

COPY index.js /cypress/plugins/index.js
COPY cypress-basic.json /
COPY cypress-gherkin.json /
COPY common.js /
COPY startup-basic.sh /
COPY startup-gherkin.sh /
RUN chmod u+x startup-basic.sh \
    && chmod u+x startup-gherkin.sh

ENTRYPOINT ["/startup-basic.sh"]