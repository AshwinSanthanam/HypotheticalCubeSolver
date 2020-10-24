If Object_Id('SolutionExplorer') Is Not Null
	Drop Procedure SolutionExplorer
Go

Create Procedure SolutionExplorer 
(
	@Front Int,
	@Right Int,
	@Back Int,
	@Left Int,
	@Up Int,
	@Down Int
)
As
Begin
	
	With RecursiveCubeState As
	(
		Select *
		From CubeStates
		Where
			Front_FS = @Front and
			Right_FS = @Right and
			Back_FS  = @Back  and
			Left_FS  = @Left  and
			Up_FS    = @Up    and
			Down_FS  = @Down 

		Union all

		Select FinalState.*
		From RecursiveCubeState InitialState
		Join CubeStates FinalState
		On
			FinalState.Front_FS  = InitialState.Front_IS and
			FinalState.Right_FS  = InitialState.Right_IS and
			FinalState.Back_FS   = InitialState.Back_IS  and
			FinalState.Left_FS   = InitialState.Left_IS  and
			FinalState.Up_FS     = InitialState.Up_IS    and
			FinalState.Down_FS   = InitialState.Down_IS  and
			FinalState.MoveCount = InitialState.MoveCount - 1
	)
	Select Operation
	From RecursiveCubeState

End
Go