If Object_Id('ConvertToBase10') Is Not Null
	Drop Function ConvertToBase10
Go

Create Function ConvertToBase10(@Base6Number Int)
Returns Int
Begin
	Declare @Base10Number Int = 0
	Declare @PowersOf6 Int = 1

	While @Base6Number > 0
	Begin
		Declare @LastDigit Int = @Base6Number % 10
		Set @Base10Number = @Base10Number + @LastDigit * @PowersOf6
		Set @Base6Number = @Base6Number / 10
		Set @PowersOf6 = @PowersOf6 * 6
	End

	Return @Base10Number
End
Go

If Object_Id('ConvertToBase6') Is Not Null
	Drop Function ConvertToBase6
Go

Create Function ConvertToBase6(@Base10Number Int)
Returns Int
Begin
	Declare @Base6Number Int = 0
	Declare @PowersOf10 Int = 1
	
	While @Base10Number > 0
	Begin
		Declare @LastDigit Int = @Base10Number % 6
		Set @Base6Number = @Base6Number + @LastDigit * @PowersOf10
		Set @Base10Number = @Base10Number / 6
		Set @PowersOf10 = @PowersOf10 * 10
	End

	Return @Base6Number
End
Go

If Object_Id('ConvertBase6ToLetters') Is Not Null
	Drop Function ConvertBase6ToLetters
Go

Create Function ConvertBase6ToLetters(@Base6Number Int)
Returns Varchar(9)
Begin
	
	Declare @Side As DigitTable
	Declare @Count TinyInt = 0

	While @Count < 9
	Begin
		Declare @LastDigit TinyInt = @Base6Number % 10
		Insert Into @Side(Digit) Values (@LastDigit)
		Set @Base6Number = @Base6Number / 10
		Set @Count = @Count + 1
	End
	
	Declare @Letter Char(9)
	Select @Letter = STRING_AGG(LL.Letter, '')
	From @Side S
	Join LetterLookup LL On S.Digit = LL.Base6Digit

	Return @Letter
End
Go

If Object_Id('ConvertLettersToBase6') Is Not Null
	Drop Function ConvertLettersToBase6
Go

Create Function ConvertLettersToBase6(@Side Varchar(9))
Returns Int
Begin
	Declare @LetterTable LetterTable
	Declare @i TinyInt = 9

	While @i > 0
	Begin
		Insert Into @LetterTable(Letter) Values (Substring(@Side, @i, 1))
		Set @i = @i - 1
	End

	Declare @Base6Number Int = 0
	Select @Base6Number = STRING_AGG(LL.Base6Digit, '')
	From @LetterTable LT
	Join LetterLookup LL On LT.Letter = LL.Letter

	Return @Base6Number
End
Go


If Object_Id('ShowCube_Letters') Is Not Null
	Drop Procedure ShowCube_Letters
Go

Create Procedure ShowCube_Letters(@F Int, @R Int, @B Int, @L Int, @U Int, @D Int)
As 
Begin
	Select
		dbo.ConvertBase6ToLetters(dbo.ConvertToBase6(@F)) As 'Front',
		dbo.ConvertBase6ToLetters(dbo.ConvertToBase6(@R)) As 'Right',
		dbo.ConvertBase6ToLetters(dbo.ConvertToBase6(@B)) As 'Back',
		dbo.ConvertBase6ToLetters(dbo.ConvertToBase6(@L)) As 'Left',
		dbo.ConvertBase6ToLetters(dbo.ConvertToBase6(@U)) As 'Up',   
		dbo.ConvertBase6ToLetters(dbo.ConvertToBase6(@D)) As 'Down'
End
Go

If Object_Id('ShowCube_Base10') Is Not Null
	Drop Procedure ShowCube_Base10
Go

Create Procedure ShowCube_Base10(@F Int, @R Int, @B Int, @L Int, @U Int, @D Int)
As 
Begin
	Select
		@F As 'Front',
		@R As 'Right',
		@B As 'Back',
		@L As 'Left',
		@U As 'Up',   
		@D As 'Down'
End
Go