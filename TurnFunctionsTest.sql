Declare @Front Int = dbo.ConvertToBase10(0)
Declare @Right Int = dbo.ConvertToBase10(111111111)
Declare @Back  Int = dbo.ConvertToBase10(222222222)
Declare @Left  Int = dbo.ConvertToBase10(333333333)
Declare @Up    Int = dbo.ConvertToBase10(444444444)
Declare @Down  Int = dbo.ConvertToBase10(555555555)

Exec F @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
Exec U @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
Exec R @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
Exec B @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
Exec L @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
--Exec B @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
--Exec D @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output
--Exec D @F = @Front Output, @R = @Right Output, @B = @Back Output, @L = @Left Output, @U = @Up Output, @D = @Down Output

Exec ShowCube_Base10 @Front, @Right, @Back, @Left, @Up, @Down
exec SolutionExplorer @Front, @Right, @Back, @Left, @Up, @Down