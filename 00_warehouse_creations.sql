create  warehouse if not exists Intelligence_wh
    with warehouse_size = 'XSMALL'
    auto_suspend = 300 
    auto_resume = true
    initially_suspended = true
    comment = 'Warehouse for Snowflake Intelligence Agent';
   