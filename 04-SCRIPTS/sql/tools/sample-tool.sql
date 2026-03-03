-- Sample SQL Tool
-- Purpose: Demonstrate best practices for T-SQL scripts
-- Author: DevOps Team
-- Version: 1.0.0
-- Last Updated: 2026-03-02

SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;

-- ===== Parameters =====
-- Declare parameters with proper types and defaults
DECLARE @ResourceName NVARCHAR(255) = 'default_resource';
DECLARE @Environment NVARCHAR(50) = 'Production';
DECLARE @PageSize INT = 100;
DECLARE @PageNumber INT = 1;

-- ===== Variables =====
DECLARE @TotalRows INT = 0;
DECLARE @ProcessedRows INT = 0;
DECLARE @StartTime DATETIME2 = GETUTCDATE();
DECLARE @ErrorMessage NVARCHAR(MAX);
DECLARE @ErrorSeverity INT;
DECLARE @ErrorState INT;

-- ===== Main Execution =====
BEGIN TRY
    PRINT N'[' + CONVERT(VARCHAR, GETUTCDATE(), 121) + N'] Starting process...';
    
    -- Validate inputs
    IF @ResourceName IS NULL OR @ResourceName = ''
    BEGIN
        RAISERROR('Resource name cannot be null or empty.', 16, 1);
    END
    
    IF @Environment NOT IN ('Production', 'Staging', 'Development')
    BEGIN
        RAISERROR('Invalid environment. Must be: Production, Staging, or Development.', 16, 1);
    END
    
    -- Example: Count total rows to process
    SELECT @TotalRows = COUNT(*)
    FROM [dbo].[YourTable]
    WHERE [IsActive] = 1
        AND [Environment] = @Environment;
    
    PRINT N'Found ' + CAST(@TotalRows AS VARCHAR) + N' rows to process.';
    
    -- Example: Process data with pagination
    DECLARE @Offset INT = (@PageNumber - 1) * @PageSize;
    
    SELECT TOP (@PageSize)
        [Id],
        [Name],
        [CreatedDate],
        [ModifiedDate]
    FROM [dbo].[YourTable]
    WHERE [IsActive] = 1
        AND [Environment] = @Environment
    ORDER BY [CreatedDate] DESC
    OFFSET @Offset ROWS
    FETCH NEXT @PageSize ROWS ONLY;
    
    SET @ProcessedRows = @@ROWCOUNT;
    
    PRINT N'[' + CONVERT(VARCHAR, GETUTCDATE(), 121) + N'] Processed ' + CAST(@ProcessedRows AS VARCHAR) + N' rows.';
    
    -- Calculate execution time
    DECLARE @ExecutionTime INT = DATEDIFF(SECOND, @StartTime, GETUTCDATE());
    PRINT N'[' + CONVERT(VARCHAR, GETUTCDATE(), 121) + N'] Execution completed in ' + CAST(@ExecutionTime AS VARCHAR) + N' seconds.';
    
END TRY
BEGIN CATCH
    -- Capture error details
    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();
    
    -- Log error (example: insert into audit table)
    PRINT N'[' + CONVERT(VARCHAR, GETUTCDATE(), 121) + N'] ERROR: ' + @ErrorMessage;
    
    -- Raise the error for user
    RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    
    -- For SQL Agent jobs, use return code to indicate failure
    -- RETURN 1;
    
END CATCH;

-- ===== Cleanup =====
-- Set session Options back to defaults (optional)
SET ANSI_NULLS OFF;
SET QUOTED_IDENTIFIER OFF;

PRINT N'Script completed.';
