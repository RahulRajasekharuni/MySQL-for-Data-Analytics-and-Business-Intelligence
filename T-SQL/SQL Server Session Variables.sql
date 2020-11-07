EXEC sp_set_session_context 'CustomerID', 101;

SELECT SESSION_CONTEXT(N'CustomerID') AS CustomerID;