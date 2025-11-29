use database sf_agents_db;
        
        use schema file_format_schemas;
              -- Create a CSV File Format for structured data files
                create or replace file format csv_format
                        type = 'CSV'
                        field_delimiter = ','
                        record_delimiter = '\n'
                        skip_header = 1
                        field_optionally_enclosed_by = '"'
                        trim_space = true
                        error_on_column_count_mismatch = false
                        escape = 'NONE'
                        escape_unenclosed_field = '\134'
                        date_format = 'YYYY-MM-DD'
                        timestamp_format = 'YYYY-MM-DD HH24:MI:SS'
                        null_if = ('NULL', 'null', '', 'N/A', 'n/a');
                -- Verify File Format Creation
                describe file format csv_format;
                show file formats like 'csv_format';

