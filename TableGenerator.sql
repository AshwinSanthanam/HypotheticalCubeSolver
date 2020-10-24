If Object_Id('CubeStates') IS NOT NULL
	Drop Table CubeStates
Go

If Object_Id('Operations') IS NOT NULL
	Drop Table Operations
Go

If Object_Id('LetterLookup') IS NOT NULL
	Drop Table LetterLookup
Go

If Type_Id('DigitTable') IS NOT NULL
	Drop Type DigitTable
Go

If Type_Id('LetterTable') IS NOT NULL
	Drop Type LetterTable
Go

Create Table Operations
(
	Id TinyInt Identity(1, 1) Primary Key,
	Operation Varchar(2) Unique Not Null,
	Omit Varchar(10) Not Null
)
Go

Insert Into Operations(Operation, Omit) Values
('L', 'L,L_,L2'),
('R', 'R,R_,R2'),
('F', 'F,F_,F2'),
('B', 'B,B_,B2'),
('U', 'U,U_,U2'),
('D', 'D,D_,D2'),
('L_', 'L,L_,L2'),
('R_', 'R,R_,R2'),
('F_', 'F,F_,F2'),
('B_', 'B,B_,B2'),
('U_', 'U,U_,U2'),
('D_', 'D,D_,D2'),
('L2', 'L,L_,L2'),
('R2', 'R,R_,R2'),
('F2', 'F,F_,F2'),
('B2', 'B,B_,B2'),
('U2', 'U,U_,U2'),
('D2', 'D,D_,D2')
Go

Create Table CubeStates
(
	MoveCount TinyInt,
	Front_IS Int,
	Right_IS Int,
	Back_IS Int,
	Left_IS Int,
	Up_IS Int,
	Down_IS Int,
	Operation Varchar(2) References Operations(Operation),
	Front_FS Int,
	Right_FS Int,
	Back_FS Int,
	Left_FS Int,
	Up_FS Int,
	Down_FS Int,
	Constraint CubeStates_UniqueFinalStates Unique NonClustered
	(
		Front_FS Asc,
		Right_FS Asc,
		Back_FS Asc,
		Left_FS Asc,
		Up_FS Asc,
		Down_FS Asc
	)
)
Go

Create NonClustered Index CubeStates_InitialState On CubeStates
(
	Front_IS Asc,
	Right_IS Asc,
	Back_IS Asc,
	Left_IS Asc,
	Up_IS Asc,
	Down_IS Asc
)
Go

Create NonClustered Index CubeStates_MoveCount On CubeStates
(
	MoveCount Asc
)
Go

Create Table LetterLookup
(
	Base6Digit Int Identity(0, 1) Primary Key,
	Letter Char
)
Go

Insert Into LetterLookup(Letter) Values
('R'),
('B'),
('O'),
('G'),
('Y'),
('W')
Go

Create Type DigitTable As Table
(
	Digit Char
)
Go

Create Type LetterTable As Table
(
	Letter Char
)
Go