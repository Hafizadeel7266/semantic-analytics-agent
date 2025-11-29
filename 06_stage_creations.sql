use database sf_agents_db;
  
   use schema agents_storage;
    
      -- Create an internal stage to hold copied data files
      create stage if not exists internal_data_stage
         file_format = sf_agents_db.file_format_schemas.csv_format
         comment = 'Internal stage for copied demo data files'
         directory = ( enable = true)
         encryption = (   type = 'snowflake_sse');
