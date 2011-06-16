ALTER TABLE [scorepedia].[Team]
	ADD CONSTRAINT [FK_scorepediaTeam_REF_scorepediaSport] 
	FOREIGN KEY ([SportId])
	REFERENCES [scorepedia].[Sport] ([SportId])	

