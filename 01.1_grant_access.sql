use database agentic_analytics_vhol;    
    -- Allow anyone to see the agents in this schema
    GRANT USAGE ON DATABASE agentic_analytics_vhol TO ROLE PUBLIC;
    GRANT USAGE ON SCHEMA agentic_analytics_vhol.agents TO ROLE PUBLIC;

     SET current_user_name = CURRENT_USER();
    
    -- Step 2: Use the variable to grant the role
    GRANT ROLE agentic_analytics_vhol_role TO USER IDENTIFIER($current_user_name);
    GRANT CREATE DATABASE ON ACCOUNT TO ROLE agentic_analytics_vhol_role;

     SET current_user_name = CURRENT_USER();
    
    -- Step 2: Use the variable to grant the role
    GRANT ROLE agentic_analytics_vhol_role TO USER IDENTIFIER($current_user_name);
    GRANT CREATE DATABASE ON ACCOUNT TO ROLE agentic_analytics_vhol_role;