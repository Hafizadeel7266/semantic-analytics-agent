    CREATE OR REPLACE WAREHOUSE agentic_analytics_vhol_wh 
        WITH WAREHOUSE_SIZE = 'XSMALL'
        AUTO_SUSPEND = 300
        AUTO_RESUME = TRUE;