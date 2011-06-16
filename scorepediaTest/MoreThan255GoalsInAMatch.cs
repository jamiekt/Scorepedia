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
    public class MoreThan255GoalsInAMatch : DatabaseTestClass
    {

        public MoreThan255GoalsInAMatch()
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
        public void ErrorNumber_8114()
        {
            DatabaseTestActions testActions = this.ErrorNumber_8114Data;
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
            Microsoft.Data.Schema.UnitTesting.DatabaseTestAction ErrorNumber_8114_TestAction;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MoreThan255GoalsInAMatch));
            Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition Error_Number_8114;
            this.ErrorNumber_8114Data = new Microsoft.Data.Schema.UnitTesting.DatabaseTestActions();
            ErrorNumber_8114_TestAction = new Microsoft.Data.Schema.UnitTesting.DatabaseTestAction();
            Error_Number_8114 = new Microsoft.Data.Schema.UnitTesting.Conditions.ScalarValueCondition();
            // 
            // ErrorNumber_8114Data
            // 
            this.ErrorNumber_8114Data.PosttestAction = null;
            this.ErrorNumber_8114Data.PretestAction = null;
            this.ErrorNumber_8114Data.TestAction = ErrorNumber_8114_TestAction;
            // 
            // ErrorNumber_8114_TestAction
            // 
            ErrorNumber_8114_TestAction.Conditions.Add(Error_Number_8114);
            resources.ApplyResources(ErrorNumber_8114_TestAction, "ErrorNumber_8114_TestAction");
            // 
            // Error_Number_8114
            // 
            Error_Number_8114.ColumnNumber = 1;
            Error_Number_8114.Enabled = true;
            Error_Number_8114.ExpectedValue = "8114";
            Error_Number_8114.Name = "Error_Number_8114";
            Error_Number_8114.NullExpected = false;
            Error_Number_8114.ResultSet = 1;
            Error_Number_8114.RowNumber = 1;
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

        private DatabaseTestActions ErrorNumber_8114Data;
    }
}
