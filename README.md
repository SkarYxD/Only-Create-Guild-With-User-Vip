# Only-Create-Guild-With-User-Vip
Solo se puede crear una guild siendo usuario VIP

Selecciona un usuario VIP = 1 = True
```sql
IF EXISTS(SELECT * FROM Character WHERE Name = @MasterName AND vip = 1)
```
