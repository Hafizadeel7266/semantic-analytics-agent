   create or replace role SF_Intelligence_Role;
    grant usage on warehouse Intelligence_wh to role SF_Intelligence_Role;

use database snowflake_intelligence_db;    
    -- Allow anyone to see the agents in this schema
    GRANT USAGE ON DATABASE snowflake_intelligence_db TO ROLE PUBLIC;
    GRANT USAGE ON SCHEMA snowflake_intelligence_db.agents TO ROLE PUBLIC;

     SET current_user_name = CURRENT_USER();
    
    -- Step 2: Use the variable to grant the role
    GRANT ROLE snowflake_intelligence_db_role TO USER IDENTIFIER($current_user_name);
    GRANT CREATE DATABASE ON ACCOUNT TO ROLE snowflake_intelligence_db_role;

     SET current_user_name = CURRENT_USER();
    
    -- Step 2: Use the variable to grant the role
    GRANT ROLE snowflake_intelligence_db_role TO USER IDENTIFIER($current_user_name);
    GRANT CREATE DATABASE ON ACCOUNT TO ROLE snowflake_intelligence_db_role;
