USE OnlineShop;
GO

CREATE PROC sp_User_Insert
	@Name nvarchar(500),
	@UserName varchar(500),
	@Password varchar(500),
	@Rule int,
	@Status int
AS
	INSERT INTO [USER]([Name], [UserName], [Password], [Rule], [Status]) VALUES (@Name, @UserName, @Password, @Rule, @Status);
GO

CREATE PROC sp_User_Update
	@Id int,
	@Name nvarchar(500),
	@UserName varchar(500),
	@Password varchar(500),
	@Rule int,
	@Status int
AS
	UPDATE [USER] SET [Name]=@Name, [UserName]=@UserName, [Password]=@Password, [Rule]=@Rule, [Status]=@Status WHERE Id = @Id;
GO

CREATE PROC sp_User_Delete
	@Id int
AS
	DELETE FROM [USER] WHERE Id = @Id;
GO

CREATE PROC sp_User_GetByAll
AS
	SELECT * FROM [USER];
GO

CREATE PROC sp_User_GetById
	@Id int
AS
	SELECT * FROM [USER] WHERE Id=@Id;
GO

CREATE PROC sp_User_GetByTop
	@Top nvarchar(10),
	@Where nvarchar(200),
	@Order nvarchar(200)
AS
	DECLARE @SQL AS NVARCHAR(500)
	SELECT @SQL = 'SELECT TOP ('+@Top+') * FROM [USER]'
	IF LEN(@Top)=0
	BEGIN
		SELECT @SQL='SELECT * FROM USER'
	END
	IF LEN(@Where) > 0
	BEGIN
		SELECT @SQL = @SQL + 'WHERE' + @Where
	END
	IF LEN(@Order) > 0
	BEGIN
		SELECT @SQL = @SQL + 'ORDER BY' + @Order
	END
	EXEC(@SQL)
GO

CREATE PROC sp_User_CheckLogin
	@UserName varchar(500),
	@Password varchar(500)
AS
	SELECT * FROM [USER] WHERE [UserName]=@UserName AND [Password]=@Password;
GO