use database SV_VHOL_DB;
USE SCHEMA VHOL_SCHEMA;

COPY FILES
    INTO @INTERNAL_DATA_STAGE/data/
    FROM @SV_VHOL_DB.GITHUB.github_repo/branches/main/data/;

    LS @INTERNAL_DATA_STAGE;

    ALTER STAGE INTERNAL_DATA_STAGE refresh;

    COPY FILES
    INTO @INTERNAL_DATA_STAGE/data/unstructured_docs/
    FROM @SV_VHOL_DB.GITHUB.AA_VHOL_REPO/branches/main/unstructured_docs/;




    -- Verify files were copied
    LS @INTERNAL_DATA_STAGE/unstructured_docs;