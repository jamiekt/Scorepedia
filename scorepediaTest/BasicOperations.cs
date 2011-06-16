using System;
using System.Text;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.Data.Schema.UnitTesting;
using Microsoft.Data.Schema.UnitTesting.Conditions;

namespace scorepediaTest
{
    [TestClass()]
    public class BasicOperations : DatabaseTestClass
    {

        public BasicOperations()
        {
            InitializeComponent();
        }

        [TestInitialize()]
        public void TestInitialize()
        {
            base.InitializeTest();
        }
        [TestCleanup()]
        public void TestCleanup()
        {
            base.CleanupTest();
        }
        [TestMethod()]
        public void SetSport()
        {
            DatabaseTestActions testActions = this.SetSportData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            ExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            // Execute the test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
            ExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            // Execute the post-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
            ExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
        }
        [TestMethod()]
        public void SetRegion()
        {
            DatabaseTestActions testActions = this.SetRegionData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            ExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            // Execute the test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
            ExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            // Execute the post-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
            ExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
        }
        [TestMethod()]
        public void SetSeason()
        {
            DatabaseTestActions testActions = this.SetSeasonData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            ExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            // Execute the test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
            ExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            // Execute the post-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
            ExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
        }
        [TestMethod()]
        public void SetCompetitionType()
        {
            DatabaseTestActions testActions = this.SetCompetitionTypeData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            ExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            // Execute the test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
            ExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            // Execute the post-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
            ExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
        }
        [TestMethod()]
        public void SetCompetition()
        {
            DatabaseTestActions testActions = this.SetCompetitionData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            ExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            // Execute the test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
            ExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            // Execute the post-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
            ExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
        }
        [TestMethod()]
        public void SetTeam()
        {
            DatabaseTestActions testActions = this.SetTeamData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            ExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            // Execute the test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
            ExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            // Execute the post-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
            ExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
        }
        [TestMethod()]
        public void SetFixture()
        {
            DatabaseTestActions testActions = this.SetFixtureData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            ExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            // Execute the test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
            ExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            // Execute the post-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
            ExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
        }
        [TestMethod()]
        public void SetPlayer()
        {
            DatabaseTestActions testActions = this.SetPlayerData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            ExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            // Execute the test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
            ExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            // Execute the post-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
            ExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
        }
        [TestMethod()]
        public void SetScore()
        {
            DatabaseTestActions testActions = this.SetScoreData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            ExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            // Execute the test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
            ExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            // Execute the post-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
            ExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
        }










        #region Designer support code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction SetSport_TestAction;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(BasicOperations));
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition Only_one_SportId;
            Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition SportId_IS_NOT_NULL;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition One_and_only_one_Sport_with_a_given_name;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition Returned_SportId_is_correct_for_SportName;
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction SetRegion_TestAction;
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction testInitializeAction;
            Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition RegionId_IS_NOT_NULL_;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition OneRegion;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition Correct_RegionId;
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction SetSeason_TestAction;
            Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition NotNullSeasonId;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition OneSeason;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition Correct_SeasonId;
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction SetCompetitionType_TestAction;
            Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition CompetitionTypeId_NOT_NULL;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition OneCompetitionType;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition Correct_CompetitionTypeId;
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction SetCompetition_TestAction;
            Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition Competitionid_NOT_NULL;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition One_Competition;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition Correct_CompetitionId;
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction SetTeam_TestAction;
            Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition TeamId_NOT_NULL;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition One_Team;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition Correct_TeamId;
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction SetFixture_TestAction;
            Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition FixtureId_NOT_NULL;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition One_Fixture;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition Correct_FixtureId;
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction SetPlayer_TestAction;
            Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition PlayerId_NOT_NULL;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition One_Player;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition Correct_PlayerId;
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction SetScore_TestAction;
            Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition ScoreId_NOT_NULL;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition OnePlayer;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition Correct__PlayerID;
            this.SetSportData = new Microsoft.Data.Schema.UnitTesting.DatabaseTestActions();
            this.SetRegionData = new Microsoft.Data.Schema.UnitTesting.DatabaseTestActions();
            this.SetSeasonData = new Microsoft.Data.Schema.UnitTesting.DatabaseTestActions();
            this.SetCompetitionTypeData = new Microsoft.Data.Schema.UnitTesting.DatabaseTestActions();
            this.SetCompetitionData = new Microsoft.Data.Schema.UnitTesting.DatabaseTestActions();
            this.SetTeamData = new Microsoft.Data.Schema.UnitTesting.DatabaseTestActions();
            this.SetFixtureData = new Microsoft.Data.Schema.UnitTesting.DatabaseTestActions();
            this.SetPlayerData = new Microsoft.Data.Schema.UnitTesting.DatabaseTestActions();
            this.SetScoreData = new Microsoft.Data.Schema.UnitTesting.DatabaseTestActions();
            SetSport_TestAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            Only_one_SportId = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            SportId_IS_NOT_NULL = new Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition();
            One_and_only_one_Sport_with_a_given_name = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            Returned_SportId_is_correct_for_SportName = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            SetRegion_TestAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            testInitializeAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            RegionId_IS_NOT_NULL_ = new Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition();
            OneRegion = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            Correct_RegionId = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            SetSeason_TestAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            NotNullSeasonId = new Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition();
            OneSeason = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            Correct_SeasonId = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            SetCompetitionType_TestAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            CompetitionTypeId_NOT_NULL = new Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition();
            OneCompetitionType = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            Correct_CompetitionTypeId = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            SetCompetition_TestAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            Competitionid_NOT_NULL = new Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition();
            One_Competition = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            Correct_CompetitionId = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            SetTeam_TestAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            TeamId_NOT_NULL = new Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition();
            One_Team = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            Correct_TeamId = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            SetFixture_TestAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            FixtureId_NOT_NULL = new Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition();
            One_Fixture = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            Correct_FixtureId = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            SetPlayer_TestAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            PlayerId_NOT_NULL = new Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition();
            One_Player = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            Correct_PlayerId = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            SetScore_TestAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            ScoreId_NOT_NULL = new Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition();
            OnePlayer = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            Correct__PlayerID = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            // 
            // SetSport_TestAction
            // 
            SetSport_TestAction.Conditions.Add(Only_one_SportId);
            SetSport_TestAction.Conditions.Add(SportId_IS_NOT_NULL);
            SetSport_TestAction.Conditions.Add(One_and_only_one_Sport_with_a_given_name);
            SetSport_TestAction.Conditions.Add(Returned_SportId_is_correct_for_SportName);
            resources.ApplyResources(SetSport_TestAction, "SetSport_TestAction");
            // 
            // Only_one_SportId
            // 
            Only_one_SportId.Enabled = true;
            Only_one_SportId.Name = "Only_one_SportId";
            Only_one_SportId.ResultSet = 1;
            Only_one_SportId.RowCount = 1;
            // 
            // SportId_IS_NOT_NULL
            // 
            SportId_IS_NOT_NULL.ColumnNumber = 1;
            SportId_IS_NOT_NULL.Enabled = true;
            SportId_IS_NOT_NULL.ExpectedValue = "1";
            SportId_IS_NOT_NULL.Name = "SportId_IS_NOT_NULL";
            SportId_IS_NOT_NULL.NullExpected = false;
            SportId_IS_NOT_NULL.ResultSet = 1;
            SportId_IS_NOT_NULL.RowNumber = 1;
            // 
            // One_and_only_one_Sport_with_a_given_name
            // 
            One_and_only_one_Sport_with_a_given_name.Enabled = true;
            One_and_only_one_Sport_with_a_given_name.Name = "One_and_only_one_Sport_with_a_given_name";
            One_and_only_one_Sport_with_a_given_name.ResultSet = 2;
            One_and_only_one_Sport_with_a_given_name.RowCount = 1;
            // 
            // Returned_SportId_is_correct_for_SportName
            // 
            Returned_SportId_is_correct_for_SportName.Enabled = true;
            Returned_SportId_is_correct_for_SportName.Name = "Returned_SportId_is_correct_for_SportName";
            Returned_SportId_is_correct_for_SportName.ResultSet = 3;
            Returned_SportId_is_correct_for_SportName.RowCount = 1;
            // 
            // SetSportData
            // 
            this.SetSportData.PosttestAction = null;
            this.SetSportData.PretestAction = null;
            this.SetSportData.TestAction = SetSport_TestAction;
            // 
            // SetRegionData
            // 
            this.SetRegionData.PosttestAction = null;
            this.SetRegionData.PretestAction = null;
            this.SetRegionData.TestAction = SetRegion_TestAction;
            // 
            // SetRegion_TestAction
            // 
            SetRegion_TestAction.Conditions.Add(RegionId_IS_NOT_NULL_);
            SetRegion_TestAction.Conditions.Add(OneRegion);
            SetRegion_TestAction.Conditions.Add(Correct_RegionId);
            resources.ApplyResources(SetRegion_TestAction, "SetRegion_TestAction");
            // 
            // testInitializeAction
            // 
            resources.ApplyResources(testInitializeAction, "testInitializeAction");
            // 
            // RegionId_IS_NOT_NULL_
            // 
            RegionId_IS_NOT_NULL_.ColumnNumber = 1;
            RegionId_IS_NOT_NULL_.Enabled = true;
            RegionId_IS_NOT_NULL_.ExpectedValue = "1";
            RegionId_IS_NOT_NULL_.Name = "RegionId_IS_NOT_NULL_";
            RegionId_IS_NOT_NULL_.NullExpected = false;
            RegionId_IS_NOT_NULL_.ResultSet = 1;
            RegionId_IS_NOT_NULL_.RowNumber = 1;
            // 
            // OneRegion
            // 
            OneRegion.Enabled = true;
            OneRegion.Name = "OneRegion";
            OneRegion.ResultSet = 2;
            OneRegion.RowCount = 1;
            // 
            // Correct_RegionId
            // 
            Correct_RegionId.Enabled = false;
            Correct_RegionId.Name = "Correct_RegionId";
            Correct_RegionId.ResultSet = 3;
            Correct_RegionId.RowCount = 1;
            // 
            // SetSeasonData
            // 
            this.SetSeasonData.PosttestAction = null;
            this.SetSeasonData.PretestAction = null;
            this.SetSeasonData.TestAction = SetSeason_TestAction;
            // 
            // SetSeason_TestAction
            // 
            SetSeason_TestAction.Conditions.Add(NotNullSeasonId);
            SetSeason_TestAction.Conditions.Add(OneSeason);
            SetSeason_TestAction.Conditions.Add(Correct_SeasonId);
            resources.ApplyResources(SetSeason_TestAction, "SetSeason_TestAction");
            // 
            // NotNullSeasonId
            // 
            NotNullSeasonId.ColumnNumber = 1;
            NotNullSeasonId.Enabled = true;
            NotNullSeasonId.ExpectedValue = "1";
            NotNullSeasonId.Name = "NotNullSeasonId";
            NotNullSeasonId.NullExpected = false;
            NotNullSeasonId.ResultSet = 1;
            NotNullSeasonId.RowNumber = 1;
            // 
            // OneSeason
            // 
            OneSeason.Enabled = true;
            OneSeason.Name = "OneSeason";
            OneSeason.ResultSet = 2;
            OneSeason.RowCount = 1;
            // 
            // Correct_SeasonId
            // 
            Correct_SeasonId.Enabled = true;
            Correct_SeasonId.Name = "Correct_SeasonId";
            Correct_SeasonId.ResultSet = 3;
            Correct_SeasonId.RowCount = 1;
            // 
            // SetCompetitionTypeData
            // 
            this.SetCompetitionTypeData.PosttestAction = null;
            this.SetCompetitionTypeData.PretestAction = null;
            this.SetCompetitionTypeData.TestAction = SetCompetitionType_TestAction;
            // 
            // SetCompetitionType_TestAction
            // 
            SetCompetitionType_TestAction.Conditions.Add(CompetitionTypeId_NOT_NULL);
            SetCompetitionType_TestAction.Conditions.Add(OneCompetitionType);
            SetCompetitionType_TestAction.Conditions.Add(Correct_CompetitionTypeId);
            resources.ApplyResources(SetCompetitionType_TestAction, "SetCompetitionType_TestAction");
            // 
            // CompetitionTypeId_NOT_NULL
            // 
            CompetitionTypeId_NOT_NULL.ColumnNumber = 1;
            CompetitionTypeId_NOT_NULL.Enabled = true;
            CompetitionTypeId_NOT_NULL.ExpectedValue = "1";
            CompetitionTypeId_NOT_NULL.Name = "CompetitionTypeId_NOT_NULL";
            CompetitionTypeId_NOT_NULL.NullExpected = false;
            CompetitionTypeId_NOT_NULL.ResultSet = 1;
            CompetitionTypeId_NOT_NULL.RowNumber = 1;
            // 
            // OneCompetitionType
            // 
            OneCompetitionType.Enabled = true;
            OneCompetitionType.Name = "OneCompetitionType";
            OneCompetitionType.ResultSet = 2;
            OneCompetitionType.RowCount = 1;
            // 
            // Correct_CompetitionTypeId
            // 
            Correct_CompetitionTypeId.Enabled = true;
            Correct_CompetitionTypeId.Name = "Correct_CompetitionTypeId";
            Correct_CompetitionTypeId.ResultSet = 3;
            Correct_CompetitionTypeId.RowCount = 1;
            // 
            // SetCompetitionData
            // 
            this.SetCompetitionData.PosttestAction = null;
            this.SetCompetitionData.PretestAction = null;
            this.SetCompetitionData.TestAction = SetCompetition_TestAction;
            // 
            // SetCompetition_TestAction
            // 
            SetCompetition_TestAction.Conditions.Add(Competitionid_NOT_NULL);
            SetCompetition_TestAction.Conditions.Add(One_Competition);
            SetCompetition_TestAction.Conditions.Add(Correct_CompetitionId);
            resources.ApplyResources(SetCompetition_TestAction, "SetCompetition_TestAction");
            // 
            // Competitionid_NOT_NULL
            // 
            Competitionid_NOT_NULL.ColumnNumber = 1;
            Competitionid_NOT_NULL.Enabled = true;
            Competitionid_NOT_NULL.ExpectedValue = "1";
            Competitionid_NOT_NULL.Name = "Competitionid_NOT_NULL";
            Competitionid_NOT_NULL.NullExpected = false;
            Competitionid_NOT_NULL.ResultSet = 1;
            Competitionid_NOT_NULL.RowNumber = 1;
            // 
            // One_Competition
            // 
            One_Competition.Enabled = true;
            One_Competition.Name = "One_Competition";
            One_Competition.ResultSet = 2;
            One_Competition.RowCount = 1;
            // 
            // Correct_CompetitionId
            // 
            Correct_CompetitionId.Enabled = true;
            Correct_CompetitionId.Name = "Correct_CompetitionId";
            Correct_CompetitionId.ResultSet = 3;
            Correct_CompetitionId.RowCount = 1;
            // 
            // SetTeamData
            // 
            this.SetTeamData.PosttestAction = null;
            this.SetTeamData.PretestAction = null;
            this.SetTeamData.TestAction = SetTeam_TestAction;
            // 
            // SetTeam_TestAction
            // 
            SetTeam_TestAction.Conditions.Add(TeamId_NOT_NULL);
            SetTeam_TestAction.Conditions.Add(One_Team);
            SetTeam_TestAction.Conditions.Add(Correct_TeamId);
            resources.ApplyResources(SetTeam_TestAction, "SetTeam_TestAction");
            // 
            // TeamId_NOT_NULL
            // 
            TeamId_NOT_NULL.ColumnNumber = 1;
            TeamId_NOT_NULL.Enabled = true;
            TeamId_NOT_NULL.ExpectedValue = "1";
            TeamId_NOT_NULL.Name = "TeamId_NOT_NULL";
            TeamId_NOT_NULL.NullExpected = false;
            TeamId_NOT_NULL.ResultSet = 1;
            TeamId_NOT_NULL.RowNumber = 1;
            // 
            // One_Team
            // 
            One_Team.Enabled = true;
            One_Team.Name = "One_Team";
            One_Team.ResultSet = 2;
            One_Team.RowCount = 1;
            // 
            // Correct_TeamId
            // 
            Correct_TeamId.Enabled = true;
            Correct_TeamId.Name = "Correct_TeamId";
            Correct_TeamId.ResultSet = 3;
            Correct_TeamId.RowCount = 1;
            // 
            // SetFixtureData
            // 
            this.SetFixtureData.PosttestAction = null;
            this.SetFixtureData.PretestAction = null;
            this.SetFixtureData.TestAction = SetFixture_TestAction;
            // 
            // SetFixture_TestAction
            // 
            SetFixture_TestAction.Conditions.Add(FixtureId_NOT_NULL);
            SetFixture_TestAction.Conditions.Add(One_Fixture);
            SetFixture_TestAction.Conditions.Add(Correct_FixtureId);
            resources.ApplyResources(SetFixture_TestAction, "SetFixture_TestAction");
            // 
            // FixtureId_NOT_NULL
            // 
            FixtureId_NOT_NULL.ColumnNumber = 1;
            FixtureId_NOT_NULL.Enabled = true;
            FixtureId_NOT_NULL.ExpectedValue = "1";
            FixtureId_NOT_NULL.Name = "FixtureId_NOT_NULL";
            FixtureId_NOT_NULL.NullExpected = false;
            FixtureId_NOT_NULL.ResultSet = 1;
            FixtureId_NOT_NULL.RowNumber = 1;
            // 
            // One_Fixture
            // 
            One_Fixture.Enabled = true;
            One_Fixture.Name = "One_Fixture";
            One_Fixture.ResultSet = 2;
            One_Fixture.RowCount = 1;
            // 
            // Correct_FixtureId
            // 
            Correct_FixtureId.Enabled = true;
            Correct_FixtureId.Name = "Correct_FixtureId";
            Correct_FixtureId.ResultSet = 3;
            Correct_FixtureId.RowCount = 1;
            // 
            // SetPlayerData
            // 
            this.SetPlayerData.PosttestAction = null;
            this.SetPlayerData.PretestAction = null;
            this.SetPlayerData.TestAction = SetPlayer_TestAction;
            // 
            // SetPlayer_TestAction
            // 
            SetPlayer_TestAction.Conditions.Add(PlayerId_NOT_NULL);
            SetPlayer_TestAction.Conditions.Add(One_Player);
            SetPlayer_TestAction.Conditions.Add(Correct_PlayerId);
            resources.ApplyResources(SetPlayer_TestAction, "SetPlayer_TestAction");
            // 
            // PlayerId_NOT_NULL
            // 
            PlayerId_NOT_NULL.ColumnNumber = 1;
            PlayerId_NOT_NULL.Enabled = true;
            PlayerId_NOT_NULL.ExpectedValue = "1";
            PlayerId_NOT_NULL.Name = "PlayerId_NOT_NULL";
            PlayerId_NOT_NULL.NullExpected = false;
            PlayerId_NOT_NULL.ResultSet = 1;
            PlayerId_NOT_NULL.RowNumber = 1;
            // 
            // One_Player
            // 
            One_Player.Enabled = true;
            One_Player.Name = "One_Player";
            One_Player.ResultSet = 2;
            One_Player.RowCount = 1;
            // 
            // Correct_PlayerId
            // 
            Correct_PlayerId.Enabled = true;
            Correct_PlayerId.Name = "Correct_PlayerId";
            Correct_PlayerId.ResultSet = 3;
            Correct_PlayerId.RowCount = 1;
            // 
            // SetScoreData
            // 
            this.SetScoreData.PosttestAction = null;
            this.SetScoreData.PretestAction = null;
            this.SetScoreData.TestAction = SetScore_TestAction;
            // 
            // SetScore_TestAction
            // 
            SetScore_TestAction.Conditions.Add(ScoreId_NOT_NULL);
            SetScore_TestAction.Conditions.Add(OnePlayer);
            SetScore_TestAction.Conditions.Add(Correct__PlayerID);
            resources.ApplyResources(SetScore_TestAction, "SetScore_TestAction");
            // 
            // ScoreId_NOT_NULL
            // 
            ScoreId_NOT_NULL.ColumnNumber = 1;
            ScoreId_NOT_NULL.Enabled = true;
            ScoreId_NOT_NULL.ExpectedValue = "1";
            ScoreId_NOT_NULL.Name = "ScoreId_NOT_NULL";
            ScoreId_NOT_NULL.NullExpected = false;
            ScoreId_NOT_NULL.ResultSet = 1;
            ScoreId_NOT_NULL.RowNumber = 1;
            // 
            // OnePlayer
            // 
            OnePlayer.Enabled = true;
            OnePlayer.Name = "OnePlayer";
            OnePlayer.ResultSet = 2;
            OnePlayer.RowCount = 1;
            // 
            // Correct__PlayerID
            // 
            Correct__PlayerID.Enabled = true;
            Correct__PlayerID.Name = "Correct__PlayerID";
            Correct__PlayerID.ResultSet = 3;
            Correct__PlayerID.RowCount = 1;
            // 
            // BasicOperations
            // 
            this.TestInitializeAction = testInitializeAction;
        }

        #endregion


        #region Additional test attributes
        //
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        #endregion

        private DatabaseTestActions SetSportData;
        private DatabaseTestActions SetRegionData;
        private DatabaseTestActions SetSeasonData;
        private DatabaseTestActions SetCompetitionTypeData;
        private DatabaseTestActions SetCompetitionData;
        private DatabaseTestActions SetTeamData;
        private DatabaseTestActions SetFixtureData;
        private DatabaseTestActions SetPlayerData;
        private DatabaseTestActions SetScoreData;
    }
}
