use database sf_agents_db;

    use schema agents_storage;

        -- ========================================================================
        -- LOAD DIMENSION DATA from INTERNAL STAGE
        -- ========================================================================

        -- Load Product Category Dimension
        copy into  product_category_dim
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/product_category_dim.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';

        -- Load Product Dimension
        copy into  product_dim
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/product_dim.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';

        -- Load Vendor Dimension
        copy into  vendor_dim
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/vendor_dim.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';

        -- Load Customer Dimension
        copy into  customer_dim
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/customer_dim.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';

        -- Load Account Dimension
        copy into  account_dim
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/account_dim.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';

        -- Load Department Dimension
        copy into  department_dim
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/department_dim.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';

        -- Load Region Dimension
        copy into  region_dim
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/region_dim.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';

        -- Load Sales Rep Dimension
        copy into  sales_rep_dim
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/sales_rep_dim.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';

        -- Load Campaign Dimension
        copy into  campaign_dim
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/campaign_dim.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';

        -- Load Channel Dimension
        copy into  channel_dim
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/channel_dim.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';

        -- Load Employee Dimension
        copy into  employee_dim
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/employee_dim.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';

        -- Load Job Dimension
        copy into  job_dim
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/job_dim.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';

        -- Load Location Dimension
        copy into  location_dim
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/location_dim.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';

        -- ========================================================================
        -- LOAD FACT DATA from INTERNAL STAGE
        -- ========================================================================

        -- Load Sales Fact
        copy into  sales_fact
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/sales_fact.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';

        -- Load Finance Transactions
        copy into  finance_transactions
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/finance_transactions.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';

        -- Load Marketing Campaign Fact
        copy into  marketing_campaign_fact
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/marketing_campaign_fact.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';

        -- Load HR Employee Fact
        copy into  hr_employee_fact
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/hr_employee_fact.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';

        -- ========================================================================
        -- LOAD SALESFORCE DATA from INTERNAL STAGE
        -- ========================================================================

        -- Load Salesforce Accounts
        copy into  sf_accounts
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/sf_accounts.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';

        -- Load Salesforce Opportunities
        copy into  sf_opportunities
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/sf_opportunities.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';

        -- Load Salesforce Contacts
        copy into  sf_contacts
        from @sf_agents_db.agents_storage.internal_data_stage/data/sturctured_data/sf_contacts.csv
        file_fromat  =  sf_agents_db.file_format_schemas.csv_format
        on_error = 'CONTINUE';
 