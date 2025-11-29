use role   sf_intelligence_role;
use database sf_agents_db;
use schema git_integration;

    -- Create Secrets for GitHub Integration
    create or replace Secret github_oauth_app_secret_secret
        type =  password
        username = 'Hafizadeel7266'
        password = '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' --name:snowflake-semantic-analytics-agent-pipeline tocken no expiration date
        comment = 'GitHub OAuth App Secret';

    -- Verify Secret Creation
    describe secret github_oauth_app_secret_secret;
    show secrets like 'github_oauth_app_secret_secret';


    -- Create GitHub Integration
    create api integration if not exists github_integration
        api_provider = 'git_https_api'
        api_allowed_prefixes  = ('https://github.com/Hafizadeel7266/')
        allowed_auhentication_secraets = (github_oauth_app_secret_secret)
        comment = 'GitHub Integration for accessing GitHub repositories';

    -- Verify Integration Creation
    describe integration github_integration;
    show integrations like 'github_integration';
    -- Test the GitHub Integration by listing repositories
    call system$api_integration_test('github_integration', 'list_repositories', '{}');      
    -- Test the GitHub Integration by listing branches of a specific repository
    call system$api_integration_test('github_integration', 'list_branches', '{"repository":"snowflake-semantic-analytics-agent-pipeline"}');    
    -- Test the GitHub Integration by listing files in a specific branch of a repository
    call system$api_integration_test('github_integration', 'list_files', '{"repository":"snowflake-semantic-analytics-agent-pipeline","branch":"main","path":"data/"}');    
    -- Test the GitHub Integration by getting the content of a specific file in a branch of a repository
    call system$api_integration_test('github_integration', 'get_file_content', '{"repository":"snowflake-semantic-analytics-agent-pipeline","branch":"main","file_path":"data/sample_data.csv"}');      
    

    -- Create Git Repository
    create git repositorie if not exists semantic_analytics_agent_repo
        api_integration = github_integration
        git_credtionals = github_oauth_app_secret_secret
        origin = 'https://github.com/Hafizadeel7266/semantic-analytics-agent.git'
        comment = 'GitHub Repository for Semantic Analytics Agent';
    -- Verify Git Repository Creation
    describe git repository semantic_analytics_agent_repo;
    show git repositories like 'semantic_analytics_agent_repo';

    alert git repository semantic_analytics_agent_repo refresh;
    alert git repository semantic_analytics_agent_repo fetch;   
    -- List Branches in the Git Repository
    show git branches in repository semantic_analytics_agent_repo;  
    -- List Files in a Specific Branch of the Git Repository
    show git files in repository semantic_analytics_agent_repo branch main path 'data/';
    -- Get Content of a Specific File in a Branch of the Git Repository
    select system$get_git_file_content('semantic_analytics_agent_repo', 'main', 'data/sample_data.csv') as file_content;

    show git tag in repository semantic_analytics_agent_repo;