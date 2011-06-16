ALTER TABLE [scorepedia].[Team]
    ADD CONSTRAINT [UK_Scorepedia_Team_TeamNameSportId]
    UNIQUE ([TeamName],[SportId])