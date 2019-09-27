CREATE procedure WZ_GuildCreate
@GuildName varchar(8),
@MasterName varchar(10)
as
BEGIN
DECLARE @ErrorCode int

SET @ErrorCode = 0
SET XACT_ABORT ON

Set nocount on
begin transaction

IF EXISTS(SELECT * FROM Character WHERE Name = @MasterName AND vip = 1)
BEGIN

INSERT INTO Guild (G_Name, G_Master) VALUES (@GuildName, @MasterName)
IF ( @@Error <> 0 )
BEGIN
SET @ErrorCode = 1
END
IF ( @ErrorCode = 0 )
BEGIN
INSERT GuildMember (Name, G_Name, G_Level) VALUES (@MasterName, @GuildName, 1)
IF ( @@Error <> 0 )
BEGIN
SET @ErrorCode = 2
END
END

IF ( @ErrorCode <> 0 )
rollback transaction
ELSE
commit transaction

select @ErrorCode

Set nocount off
SET XACT_ABORT OFF
END
ELSE
BEGIN
SET @ErrorCode = 1
END
END
GO
