If Object_Id('Peek') Is Not Null
	Drop Function Peek
Go

Create Function Peek(@Face Int, @Position TinyInt) 
Returns TinyInt
Begin
	Declare @PositionalNumber As Int

	If @Position = 0 Set @PositionalNumber = @Face % 6
	If @Position = 1 Set @PositionalNumber = (@Face % 36) / 6
	If @Position = 2 Set @PositionalNumber = (@Face % 216) / 36
	If @Position = 3 Set @PositionalNumber = (@Face % 1296) / 216
	If @Position = 4 Set @PositionalNumber = (@Face % 7776) / 1296
	If @Position = 5 Set @PositionalNumber = (@Face % 46656) / 7776
	If @Position = 6 Set @PositionalNumber = (@Face % 279936) / 46656
	If @Position = 7 Set @PositionalNumber = (@Face % 1679616) / 279936
	If @Position = 8 Set @PositionalNumber = (@Face % 10077696) / 1679616

	Return @PositionalNumber
End
Go

If Object_Id('Push') Is Not Null
	Drop Function Push
Go

Create Function Push(@Face Int, @Position TinyInt, @Digit TinyInt)
Returns Int
Begin
	
	Declare @Injected Int
	If @Position = 0 Set @Injected = (@Face / 6) * 6 + @Digit
	If @Position = 1 Set @Injected = (@Face / 36) * 36 + (@Digit * 6 + @Face % 6)
	If @Position = 2 Set @Injected = (@Face / 216) * 216 + (@Digit * 36 + @Face % 36)
	If @Position = 3 Set @Injected = (@Face / 1296) * 1296 + (@Digit * 216 + @Face % 216)
	If @Position = 4 Set @Injected = (@Face / 7776) * 7776 + (@Digit * 1296 + @Face % 1296)
	If @Position = 5 Set @Injected = (@Face / 46656) * 46656 + (@Digit * 7776 + @Face % 7776)
	If @Position = 6 Set @Injected = (@Face / 279936) * 279936 + (@Digit * 46656 + @Face % 46656)
	If @Position = 7 Set @Injected = (@Face / 1679616) * 1679616 + (@Digit * 279936 + @Face % 279936)
	If @Position = 8 Set @Injected = (@Face / 10077696) * 10077696 + (@Digit * 1679616 + @Face % 1679616)
	Return @Injected

End
Go