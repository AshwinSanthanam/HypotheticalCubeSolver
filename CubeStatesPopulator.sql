If Object_Id('CubeStatesPopulator') Is Not Null
	Drop proc CubeStatesPopulator
Go

Create Proc CubeStatesPopulator (@MoveSize Int) AS
Begin
	Declare @Front     Int
	Declare @Right     Int
	Declare @Back      Int
	Declare @Left      Int
	Declare @Up        Int
	Declare @Down      Int
	Declare @Operation Varchar(2)
	Declare @F Int
	Declare @R Int
	Declare @B Int
	Declare @L Int
	Declare @U Int
	Declare @D Int

	Truncate Table CubeStates
	Insert Into CubeStates Values 
	(
		0,
		Null,
		Null,
		Null,
		Null,
		Null,
		Null,
		Null,
		dbo.ConvertToBase10(0),
		dbo.ConvertToBase10(111111111),
		dbo.ConvertToBase10(222222222),
		dbo.ConvertToBase10(333333333),
		dbo.ConvertToBase10(444444444),
		dbo.ConvertToBase10(555555555)
	)

	Declare @i As Int = 0
	While @i < @MoveSize
	Begin
		Declare MoveSetIterator Cursor
		For
		Select
			CS.Front_FS,
			CS.Right_FS,
			CS.Back_FS,
			CS.Left_FS,
			CS.Up_FS,
			CS.Down_FS,
			O.Operation
		From CubeStates CS
		Cross Join Operations O
		Where
			CS.MoveCount = @i and
			(CS.Operation Is Null or O.Omit Not Like Concat('%', CS.Operation, '%'))

		Open MoveSetIterator
		Fetch Next From MoveSetIterator
		Into
			@Front,
			@Right,
			@Back,
			@Left,
			@Up,
			@Down,
			@Operation

		While @@FETCH_STATUS = 0
		Begin
			Set @F = @Front    
			Set @R = @Right    
			Set @B = @Back     
			Set @L = @Left     
			Set @U = @Up       
			Set @D = @Down 
			
			If @Operation = 'F'
				Exec F @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
			If @Operation = 'R'
				Exec R @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
			If @Operation = 'B'
				Exec B @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
			If @Operation = 'L'
				Exec L @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
			If @Operation = 'U'
				Exec U @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
			If @Operation = 'D'
				Exec D @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output

			If @Operation = 'F_'
				Exec F_ @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
			If @Operation = 'R_'
				Exec R_ @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
			If @Operation = 'B_'
				Exec B_ @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
			If @Operation = 'L_'
				Exec L_ @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
			If @Operation = 'U_'
				Exec U_ @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
			If @Operation = 'D_'
				Exec D_ @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output

			If @Operation = 'F2'
				Exec F2 @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
			If @Operation = 'R2'
				Exec R2 @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
			If @Operation = 'B2'
				Exec B2 @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
			If @Operation = 'L2'
				Exec L2 @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
			If @Operation = 'U2'
				Exec U2 @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
			If @Operation = 'D2'
				Exec D2 @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output

			Insert Into CubeStates Values
			(
				@i + 1,
				@F,
				@R,
				@B,
				@L,
				@U,
				@D,
				@Operation,
				@Front,
				@Right,
				@Back,
				@Left,
				@Up,
				@Down
			)

			Fetch Next From MoveSetIterator
			Into
				@Front,
				@Right,
				@Back,
				@Left,
				@Up,
				@Down,
				@Operation
		End

		Close MoveSetIterator
		Deallocate MoveSetIterator
		Set @i = @i + 1
	End

End
Go