use database SF_agents_db;
  
    use schema agents_storage;
    -- Load structured data files into internal stage
        copy files
            into @internal_data_stage/data/sturctured_data/
            from @sf_agents_db.git_integration.semantic-analytics-agent_repo/branches/main/data/;
        --- Verify files were copied
        alert stage internal_data_stage refresh;
        ls @internal_data_stage/sturctured_data;   

    -- Load unstructured documents into internal stage
        copy files
            into @internal_data_stage/data/unstructured_data/
            from @sf_agents_db.git_integration.semantic-analytics-agent_repo/branches/main/unstructured_data/;  

    -- Verify files were copied
        alert stage internal_data_stage refresh;    
        ls @internal_data_stage/unstructured_data;