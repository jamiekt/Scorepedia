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
    public class PremierLeague20100410 : DatabaseTestClass
    {

        public PremierLeague20100410()
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
        public void PremierLeague__20100410()
        {
            DatabaseTestActions testActions = this.PremierLeague__20100410Data;
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
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction PremierLeague__20100410_TestAction;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PremierLeague20100410));
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition Fixture_;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition FixtureTeam_;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition Player_;
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition Score_;
            Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition TotalNumberOfGoals_;
            this.PremierLeague__20100410Data = new Microsoft.Data.Schema.UnitTesting.DatabaseTestActions();
            PremierLeague__20100410_TestAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            Fixture_ = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            FixtureTeam_ = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            Player_ = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            Score_ = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            TotalNumberOfGoals_ = new Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition();
            // 
            // PremierLeague__20100410Data
            // 
            this.PremierLeague__20100410Data.PosttestAction = null;
            this.PremierLeague__20100410Data.PretestAction = null;
            this.PremierLeague__20100410Data.TestAction = PremierLeague__20100410_TestAction;
            // 
            // PremierLeague__20100410_TestAction
            // 
            PremierLeague__20100410_TestAction.Conditions.Add(Fixture_);
            PremierLeague__20100410_TestAction.Conditions.Add(FixtureTeam_);
            PremierLeague__20100410_TestAction.Conditions.Add(Player_);
            PremierLeague__20100410_TestAction.Conditions.Add(Score_);
            PremierLeague__20100410_TestAction.Conditions.Add(TotalNumberOfGoals_);
            resources.ApplyResources(PremierLeague__20100410_TestAction, "PremierLeague__20100410_TestAction");
            // 
            // Fixture_
            // 
            Fixture_.Enabled = true;
            Fixture_.Name = "Fixture_";
            Fixture_.ResultSet = 1;
            Fixture_.RowCount = 10;
            // 
            // FixtureTeam_
            // 
            FixtureTeam_.Enabled = true;
            FixtureTeam_.Name = "FixtureTeam_";
            FixtureTeam_.ResultSet = 2;
            FixtureTeam_.RowCount = 20;
            // 
            // Player_
            // 
            Player_.Enabled = true;
            Player_.Name = "Player_";
            Player_.ResultSet = 3;
            Player_.RowCount = 23;
            // 
            // Score_
            // 
            Score_.Enabled = true;
            Score_.Name = "Score_";
            Score_.ResultSet = 4;
            Score_.RowCount = 23;
            // 
            // TotalNumberOfGoals_
            // 
            TotalNumberOfGoals_.ColumnNumber = 1;
            TotalNumberOfGoals_.Enabled = true;
            TotalNumberOfGoals_.ExpectedValue = "25";
            TotalNumberOfGoals_.Name = "TotalNumberOfGoals_";
            TotalNumberOfGoals_.NullExpected = false;
            TotalNumberOfGoals_.ResultSet = 5;
            TotalNumberOfGoals_.RowNumber = 1;
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

        private DatabaseTestActions PremierLeague__20100410Data;
    }
}
