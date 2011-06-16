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
    public class ZeroingAScore : DatabaseTestClass
    {

        public ZeroingAScore()
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
        public void ZeroingOutAScore_()
        {
            DatabaseTestActions testActions = this.ZeroingOutAScore_Data;
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
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction ZeroingOutAScore__TestAction;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ZeroingAScore));
            Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition GoalsScoredZeroedOut_;
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction testInitializeAction;
            this.ZeroingOutAScore_Data = new Microsoft.Data.Schema.UnitTesting.DatabaseTestActions();
            ZeroingOutAScore__TestAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            GoalsScoredZeroedOut_ = new Microsoft.Data.Schema.UnitTesting.Conditions.RowCountCondition();
            testInitializeAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            // 
            // ZeroingOutAScore__TestAction
            // 
            ZeroingOutAScore__TestAction.Conditions.Add(GoalsScoredZeroedOut_);
            resources.ApplyResources(ZeroingOutAScore__TestAction, "ZeroingOutAScore__TestAction");
            // 
            // GoalsScoredZeroedOut_
            // 
            GoalsScoredZeroedOut_.Enabled = true;
            GoalsScoredZeroedOut_.Name = "GoalsScoredZeroedOut_";
            GoalsScoredZeroedOut_.ResultSet = 1;
            GoalsScoredZeroedOut_.RowCount = 0;
            // 
            // ZeroingOutAScore_Data
            // 
            this.ZeroingOutAScore_Data.PosttestAction = null;
            this.ZeroingOutAScore_Data.PretestAction = null;
            this.ZeroingOutAScore_Data.TestAction = ZeroingOutAScore__TestAction;
            // 
            // testInitializeAction
            // 
            resources.ApplyResources(testInitializeAction, "testInitializeAction");
            // 
            // ZeroingAScore
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

        private DatabaseTestActions ZeroingOutAScore_Data;
    }
}
