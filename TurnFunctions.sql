If Object_Id('R') Is Not Null
	Drop Procedure R
Go

Create Procedure R (@F Int Output, @R Int Output, @B Int Output, @L Int Output, @U Int Output, @D Int Output)
As
Begin
	Declare @Temp_F Int = @F

	Set @F = dbo.Push(@F, 2, dbo.Peek(@D, 2))
	Set @F = dbo.Push(@F, 5, dbo.Peek(@D, 5))
	Set @F = dbo.Push(@F, 8, dbo.Peek(@D, 8))

	Set @D = dbo.Push(@D, 8, dbo.Peek(@B, 0))
	Set @D = dbo.Push(@D, 5, dbo.Peek(@B, 3))
	Set @D = dbo.Push(@D, 2, dbo.Peek(@B, 6))

	Set @B = dbo.Push(@B, 6, dbo.Peek(@U, 2))
	Set @B = dbo.Push(@B, 3, dbo.Peek(@U, 5))
	Set @B = dbo.Push(@B, 0, dbo.Peek(@U, 8))

	Set @U = dbo.Push(@U, 2, dbo.Peek(@Temp_F, 2))
	Set @U = dbo.Push(@U, 5, dbo.Peek(@Temp_F, 5))
	Set @U = dbo.Push(@U, 8, dbo.Peek(@Temp_F, 8))

	Declare @Temp_TopLeft TinyInt = dbo.Peek(@R, 0)
	
	Set @R = dbo.Push(@R, 0, dbo.Peek(@R, 6))
	Set @R = dbo.Push(@R, 6, dbo.Peek(@R, 8))
	Set @R = dbo.Push(@R, 8, dbo.Peek(@R, 2))
	Set @R = dbo.Push(@R, 2, @Temp_TopLeft)

	Declare @Temp_Left TinyInt = dbo.Peek(@R, 3)

	Set @R = dbo.Push(@R, 3, dbo.Peek(@R, 7))
	Set @R = dbo.Push(@R, 7, dbo.Peek(@R, 5))
	Set @R = dbo.Push(@R, 5, dbo.Peek(@R, 1))
	Set @R = dbo.Push(@R, 1, @Temp_Left)
End
Go

If Object_Id('L') Is Not Null
	Drop Procedure L
Go

Create Procedure L (@F Int Output, @R Int Output, @B Int Output, @L Int Output, @U Int Output, @D Int Output)
As
Begin
	Declare @Temp_F Int = @F

	Set @F = dbo.Push(@F, 0, dbo.Peek(@U, 0))
	Set @F = dbo.Push(@F, 3, dbo.Peek(@U, 3))
	Set @F = dbo.Push(@F, 6, dbo.Peek(@U, 6))

	Set @U = dbo.Push(@U, 6, dbo.Peek(@B, 2))
	Set @U = dbo.Push(@U, 3, dbo.Peek(@B, 5))
	Set @U = dbo.Push(@U, 0, dbo.Peek(@B, 8))

	Set @B = dbo.Push(@B, 2, dbo.Peek(@D, 6))
	Set @B = dbo.Push(@B, 5, dbo.Peek(@D, 3))
	Set @B = dbo.Push(@B, 8, dbo.Peek(@D, 0))

	Set @D = dbo.Push(@D, 0, dbo.Peek(@Temp_F, 0))
	Set @D = dbo.Push(@D, 3, dbo.Peek(@Temp_F, 3))
	Set @D = dbo.Push(@D, 6, dbo.Peek(@Temp_F, 6))

	Declare @Temp_L Int = @L

	Set @L = dbo.Push(@L, 0,dbo.Peek(@L, 6))
	Set @L = dbo.Push(@L, 6,dbo.Peek(@L, 8))
	Set @L = dbo.Push(@L, 8,dbo.Peek(@L, 2))
	Set @L = dbo.Push(@L, 2,dbo.Peek(@Temp_L, 0))

	Set @L = dbo.Push(@L, 3,dbo.Peek(@L, 7))
	Set @L = dbo.Push(@L, 7,dbo.Peek(@L, 5))
	Set @L = dbo.Push(@L, 5,dbo.Peek(@L, 1))
	Set @L = dbo.Push(@L, 1,dbo.Peek(@Temp_L, 3))
End
Go

If Object_Id('U') Is Not Null
	Drop Procedure U
Go

Create Procedure U (@F Int Output, @R Int Output, @B Int Output, @L Int Output, @U Int Output, @D Int Output)
As
Begin
	Declare @Temp_F Int = @F

	Set @F = dbo.Push(@F, 0, dbo.Peek(@R, 0))
	Set @F = dbo.Push(@F, 1, dbo.Peek(@R, 1))
	Set @F = dbo.Push(@F, 2, dbo.Peek(@R, 2))

	Set @R = dbo.Push(@R, 0, dbo.Peek(@B, 0))
	Set @R = dbo.Push(@R, 1, dbo.Peek(@B, 1))
	Set @R = dbo.Push(@R, 2, dbo.Peek(@B, 2))

	Set @B = dbo.Push(@B, 0, dbo.Peek(@L, 0))
	Set @B = dbo.Push(@B, 1, dbo.Peek(@L, 1))
	Set @B = dbo.Push(@B, 2, dbo.Peek(@L, 2))

	Set @L = dbo.Push(@L, 0, dbo.Peek(@Temp_F, 0))
	Set @L = dbo.Push(@L, 1, dbo.Peek(@Temp_F, 1))
	Set @L = dbo.Push(@L, 2, dbo.Peek(@Temp_F, 2))

	Declare @Temp_U Int = @U

	Set @U = dbo.Push(@U, 3, dbo.Peek(@U, 7))
	Set @U = dbo.Push(@U, 7, dbo.Peek(@U, 5))
	Set @U = dbo.Push(@U, 5, dbo.Peek(@U, 1))
	Set @U = dbo.Push(@U, 1, dbo.Peek(@Temp_U, 3))

	Set @U = dbo.Push(@U, 0, dbo.Peek(@U, 6))
	Set @U = dbo.Push(@U, 6, dbo.Peek(@U, 8))
	Set @U = dbo.Push(@U, 8, dbo.Peek(@U, 2))
	Set @U = dbo.Push(@U, 2, dbo.Peek(@Temp_U, 0))

End
Go

If Object_Id('D') Is Not Null
	Drop Procedure D
Go

Create Procedure D (@F Int Output, @R Int Output, @B Int Output, @L Int Output, @U Int Output, @D Int Output)
As
Begin
	Declare @Temp_F Int = @F

	Set @F = dbo.Push(@F, 6, dbo.Peek(@L, 6))
	Set @F = dbo.Push(@F, 7, dbo.Peek(@L, 7))
	Set @F = dbo.Push(@F, 8, dbo.Peek(@L, 8))

	Set @L = dbo.Push(@L, 6, dbo.Peek(@B, 6))
	Set @L = dbo.Push(@L, 7, dbo.Peek(@B, 7))
	Set @L = dbo.Push(@L, 8, dbo.Peek(@B, 8))

	Set @B = dbo.Push(@B, 6, dbo.Peek(@R, 6))
	Set @B = dbo.Push(@B, 7, dbo.Peek(@R, 7))
	Set @B = dbo.Push(@B, 8, dbo.Peek(@R, 8))

	Set @R = dbo.Push(@R, 6, dbo.Peek(@Temp_F, 6))
	Set @R = dbo.Push(@R, 7, dbo.Peek(@Temp_F, 7))
	Set @R = dbo.Push(@R, 8, dbo.Peek(@Temp_F, 8))

	Declare @Temp_D Int = @D

	Set @D = dbo.Push(@D, 1, dbo.Peek(@D, 3))
	Set @D = dbo.Push(@D, 3, dbo.Peek(@D, 7))
	Set @D = dbo.Push(@D, 7, dbo.Peek(@D, 5))
	Set @D = dbo.Push(@D, 5, dbo.Peek(@Temp_D, 1))

	Set @D = dbo.Push(@D, 0, dbo.Peek(@D, 6))
	Set @D = dbo.Push(@D, 6, dbo.Peek(@D, 8))
	Set @D = dbo.Push(@D, 8, dbo.Peek(@D, 2))
	Set @D = dbo.Push(@D, 2, dbo.Peek(@Temp_D, 0))
End
Go

If Object_Id('F') Is Not Null
	Drop Procedure F
Go

Create Procedure F (@F Int Output, @R Int Output, @B Int Output, @L Int Output, @U Int Output, @D Int Output)
As
Begin
	Declare @Temp_U Int = @U

	Set @U = dbo.Push(@U, 6, dbo.Peek(@L, 8))
	Set @U = dbo.Push(@U, 7, dbo.Peek(@L, 5))
	Set @U = dbo.Push(@U, 8, dbo.Peek(@L, 2))

	Set @L = dbo.Push(@L, 2, dbo.Peek(@D, 0))
	Set @L = dbo.Push(@L, 5, dbo.Peek(@D, 1))
	Set @L = dbo.Push(@L, 8, dbo.Peek(@D, 2))

	Set @D = dbo.Push(@D, 2, dbo.Peek(@R, 0))
	Set @D = dbo.Push(@D, 1, dbo.Peek(@R, 3))
	Set @D = dbo.Push(@D, 0, dbo.Peek(@R, 6))

	Set @R = dbo.Push(@R, 0, dbo.Peek(@Temp_U, 6))
	Set @R = dbo.Push(@R, 3, dbo.Peek(@Temp_U, 7))
	Set @R = dbo.Push(@R, 6, dbo.Peek(@Temp_U, 8))

	Declare @Temp_F Int = @F

	Set @F = dbo.Push(@F, 1, dbo.Peek(@F, 3))
	Set @F = dbo.Push(@F, 3, dbo.Peek(@F, 7))
	Set @F = dbo.Push(@F, 7, dbo.Peek(@F, 5))
	Set @F = dbo.Push(@F, 5, dbo.Peek(@Temp_F, 1))

	Set @F = dbo.Push(@F, 2, dbo.Peek(@F, 0))
	Set @F = dbo.Push(@F, 0, dbo.Peek(@F, 6))
	Set @F = dbo.Push(@F, 6, dbo.Peek(@F, 8))
	Set @F = dbo.Push(@F, 8, dbo.Peek(@Temp_F, 2))
End
Go

If Object_Id('B') Is Not Null
	Drop Procedure B
Go

Create Procedure B (@F Int Output, @R Int Output, @B Int Output, @L Int Output, @U Int Output, @D Int Output)
As
Begin
	Declare @Temp_U Int = @U

	Set @U = dbo.Push(@U, 0, dbo.Peek(@R, 2))
	Set @U = dbo.Push(@U, 1, dbo.Peek(@R, 5))
	Set @U = dbo.Push(@U, 2, dbo.Peek(@R, 8))

	Set @R = dbo.Push(@R, 8, dbo.Peek(@D, 6))
	Set @R = dbo.Push(@R, 5, dbo.Peek(@D, 7))
	Set @R = dbo.Push(@R, 2, dbo.Peek(@D, 8))

	Set @D = dbo.Push(@D, 6, dbo.Peek(@L, 0))
	Set @D = dbo.Push(@D, 7, dbo.Peek(@L, 3))
	Set @D = dbo.Push(@D, 8, dbo.Peek(@L, 6))

	Set @L = dbo.Push(@L, 6, dbo.Peek(@Temp_U, 0))
	Set @L = dbo.Push(@L, 3, dbo.Peek(@Temp_U, 1))
	Set @L = dbo.Push(@L, 0, dbo.Peek(@Temp_U, 2))

	Declare @Temp_B Int = @B

	Set @B = dbo.Push(@B, 1, dbo.Peek(@B, 3))
	Set @B = dbo.Push(@B, 3, dbo.Peek(@B, 7))
	Set @B = dbo.Push(@B, 7, dbo.Peek(@B, 5))
	Set @B = dbo.Push(@B, 5, dbo.Peek(@Temp_B, 1))

	Set @B = dbo.Push(@B, 2, dbo.Peek(@B, 0))
	Set @B = dbo.Push(@B, 0, dbo.Peek(@B, 6))
	Set @B = dbo.Push(@B, 6, dbo.Peek(@B, 8))
	Set @B = dbo.Push(@B, 8, dbo.Peek(@Temp_B, 2))
End
Go

If Object_Id('R2') Is Not Null
	Drop Procedure R2
Go

Create Procedure R2 (@F Int Output, @R Int Output, @B Int Output, @L Int Output, @U Int Output, @D Int Output)
As
Begin
	Exec R @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
	Exec R @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
End
Go

If Object_Id('L2') Is Not Null
	Drop Procedure L2
Go

Create Procedure L2 (@F Int Output, @R Int Output, @B Int Output, @L Int Output, @U Int Output, @D Int Output)
As
Begin
	Exec L @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
	Exec L @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
End
Go

If Object_Id('U2') Is Not Null
	Drop Procedure U2
Go

Create Procedure U2 (@F Int Output, @R Int Output, @B Int Output, @L Int Output, @U Int Output, @D Int Output)
As
Begin
	Exec U @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
	Exec U @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
End
Go

If Object_Id('D2') Is Not Null
	Drop Procedure D2
Go

Create Procedure D2 (@F Int Output, @R Int Output, @B Int Output, @L Int Output, @U Int Output, @D Int Output)
As
Begin
	Exec D @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
	Exec D @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
End
Go

If Object_Id('F2') Is Not Null
	Drop Procedure F2
Go

Create Procedure F2 (@F Int Output, @R Int Output, @B Int Output, @L Int Output, @U Int Output, @D Int Output)
As
Begin
	Exec F @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
	Exec F @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
End
Go

If Object_Id('B2') Is Not Null
	Drop Procedure B2
Go

Create Procedure B2 (@F Int Output, @R Int Output, @B Int Output, @L Int Output, @U Int Output, @D Int Output)
As
Begin
	Exec B @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
	Exec B @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
End
Go

If Object_Id('R_') Is Not Null
	Drop Procedure R_
Go

Create Procedure R_ (@F Int Output, @R Int Output, @B Int Output, @L Int Output, @U Int Output, @D Int Output)
As
Begin
	Exec R @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
	Exec R @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
	Exec R @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
End
Go

If Object_Id('L_') Is Not Null
	Drop Procedure L_
Go

Create Procedure L_ (@F Int Output, @R Int Output, @B Int Output, @L Int Output, @U Int Output, @D Int Output)
As
Begin
	Exec L @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
	Exec L @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
	Exec L @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
End
Go

If Object_Id('U_') Is Not Null
	Drop Procedure U_
Go

Create Procedure U_ (@F Int Output, @R Int Output, @B Int Output, @L Int Output, @U Int Output, @D Int Output)
As
Begin
	Exec U @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
	Exec U @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
	Exec U @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
End
Go

If Object_Id('D_') Is Not Null
	Drop Procedure D_
Go

Create Procedure D_ (@F Int Output, @R Int Output, @B Int Output, @L Int Output, @U Int Output, @D Int Output)
As
Begin
	Exec D @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
	Exec D @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
	Exec D @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
End
Go

If Object_Id('F_') Is Not Null
	Drop Procedure F_
Go

Create Procedure F_ (@F Int Output, @R Int Output, @B Int Output, @L Int Output, @U Int Output, @D Int Output)
As
Begin
	Exec F @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
	Exec F @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
	Exec F @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
End
Go

If Object_Id('B_') Is Not Null
	Drop Procedure B_
Go

Create Procedure B_ (@F Int Output, @R Int Output, @B Int Output, @L Int Output, @U Int Output, @D Int Output)
As
Begin
	Exec B @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
	Exec B @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
	Exec B @F = @F Output, @R = @R Output, @B = @B Output, @L = @L Output, @U = @U Output, @D = @D Output
End
Go