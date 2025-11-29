use role   sf_intelligence_role;
use database sf_agents_db;
use schema git_integration;

    -- Create Secrets for GitHub Integration
    CREATE OR REPLACE SECRET github_oauth_app_secret
          TYPE = PASSWORD
          USERNAME = 'Hafizadeel7266'  
          PASSWORD = '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'  --name:snowflake-semantic-analytics-agent-pipeline tocken no expiration date
          COMMENT = 'GitHub OAuth App Secret'
          ; 

    -- Verify Secret Creation
    SHOW SECRETS;
    describe secret github_oauth_app_secret;
    show secrets like 'github_oauth_app_secret';


    -- Create GitHub Integration
    CREATE OR REPLACE API INTEGRATION github_api_integration
          API_PROVIDER = 'GIT_HTTPS_API'
          API_ALLOWED_PREFIXES = ('https://github.com/Hafizadeel7266/')  -- Replace with your GitHub URL
          ALLOWED_AUTHENTICATION_SECRETS = ('github_oauth_app_secret')  -- The secret created earlier for authentication
          ENABLED = TRUE
          COMMENT = 'GitHub Integration for accessing GitHub repositories';

    -- Verify Integration Creation
    show integrations;
    SHOW API INTEGRATIONS;
    describe integration github_api_integration;
    show integrations like 'github_api_integration';
       
    

    -- Create Git Repository
    CREATE OR REPLACE GIT REPOSITORY semantic_analytics_agent_repo
          API_INTEGRATION = github_api_integration
          GIT_CREDENTIALS = github_oauth_app_secret  
          ORIGIN = 'https://github.com/Hafizadeel7266/semantic-analytics-agent.git'
          COMMENT = 'GitHub Repository for Semantic Analytics Agent';
          
    -- Verify Git Repository Creation
    SHOW GIT REPOSITORIES;
    describe git repository semantic_analytics_agent_repo;
    show git repositories like 'semantic_analytics_agent_repo';

    alert git repository semantic_analytics_agent_repo refresh;
    alert git repository semantic_analytics_agent_repo fetch;   
    show git tag in  semantic_analytics_agent_repo;
